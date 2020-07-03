#!/usr/bin/env python3

# A idéia é calcular o ranking das ações analisando os dados fundamentalistas de todas as empresas da bolsa B3

# Para a análise, são utilizados princípios do Décio Bazin
# Ele é autor do livro: "Faça Fortuna Com Ações", que é tido como literatura indicada
# por Luis Barsi, o maior investidor na bolsa brasileira.

# Princípios utilizados:

# - [x] 1. Preço Justo > 1.5 * Preço. Preço Justo => Dividend Yield * 16.67 (Por: Décio Bazin)
# - [x] 2. Dívida Líquida/Patrimônio < 0.5 (50%)
# - [x] 3. Dividend Yield > 0.06 (6%)
# - [x] 4. Média do Dividend Yield nos últimos 5 anos > 0.05 (5%)
# - [x] 5. Pagamento constante de dividendos nos últimos 5 anos
# - [x] 6. Pagamento crescente de dividendos nos últimos 5 anos
# - [x] 7. 0 < Payout < 1

import sys, os
sys.path.extend([f'./{name}' for name in os.listdir(".") if os.path.isdir(name)])

import bovespa
import pandas
import subprocess
import numpy

from math import sqrt
from decimal import Decimal

import http.cookiejar
import urllib.request
import urllib.parse
import json
import threading

import time

# === Parallel fetching... https://stackoverflow.com/questions/16181121/a-very-simple-multithreading-parallel-url-fetching-without-queue

# Pega o histórico dos Dividendos...
# DPA => Dividendo Por Ação. Esse que é importante!
# https://api-analitica.sunoresearch.com.br/api/Indicator/GetIndicatorsYear?ticker=PETR4
# Pega Histórico de: year, cresRec, divBruta, data, qntAcoes, cotacao, pl, pvp, pebit, pfco, psr, pAtivos, pCapGiro, pAtivCLiq, divYeld, evebit, valordaFirma, valordeMercado, fci, dbPl, vpa, margBruta, capex, margLiq, capexLL, giroAtivos, fcf, caixaLivre, fcl, payout, lpa, margEbit, roic, ebitAtivo, fco, dpa, liqCorrent, divBrPatrim, capexFco, fct, ativoCirculante, fciLL, capexDetails, roe, roa, dlpl, payoutDetails, ebit, lucroLiquido, receitaLiquida

# Pega o histórico de Dividend Yield...
# Últimos 5 anos...
# https://statusinvest.com.br/acao/companytickerprovents?ticker=TRPL4&chartProventsType=1

# Últimos 20 anos...
# https://statusinvest.com.br/acao/companytickerprovents?ticker=TRPL4&chartProventsType=2

# Futura análise da análise ()
# https://statusinvest.com.br/acao/getrevenue?companyName=enauta&type=0&trimestral=false

def print(thing):
  import pprint
  return pprint.PrettyPrinter(indent=4).pprint(thing)

# Captura a situação dos dividendos nos últimos 5 anos. (Captura do site: Status Invest)
# dividends = {
#   'TRPL4': { 'constante': False, 'crescente': False },
#   'PETR4': { 'constante': False, 'crescente': False }
# }
def fill_dividend_yields(shares):
  cookie_jar = http.cookiejar.CookieJar()
  opener = urllib.request.build_opener(urllib.request.HTTPCookieProcessor(cookie_jar))
  opener.addheaders = [('User-agent', 'Mozilla/5.0 (Windows; U; Windows NT 6.1; rv:2.2) Gecko/20110201'),
                       ('Accept', 'text/html, text/plain, text/css, text/sgml, */*;q=0.01')]
  tickets = list(shares.index)
  threads = [threading.Thread(target=fill_dividend_by_ticket, args=(ticket,opener,)) for ticket in tickets]
  for thread in threads:
    thread.start()
  for thread in threads:
    thread.join()

def fill_dividend_by_ticket(ticket, opener):
  url = f'https://api-analitica.sunoresearch.com.br/api/Indicator/GetIndicatorsYear?ticker={ticket}'
  with opener.open(url) as link:
    suno_indicators = link.read().decode('ISO-8859-1')
  suno_indicators = json.loads(suno_indicators)
  current_year = int(time.strftime("%Y"))

  # Dividendo Por Ação
  last_dpas = [fundament['dpa'] for fundament in suno_indicators] # Bazin
  last_payouts = [fundament['payout'] for fundament in suno_indicators] # Bazin
  # last_lpas = [fundament['lpa'] for fundament in suno_indicators] # Graham
  # last_pls = [fundament['pl'] for fundament in suno_indicators] # Graham

  dividends[ticket] = {
    'good_dividends': False,
    'constante': False,
    'crescente': False,
    'healthy_payout': False
  }
  dividends[ticket]['good_dividends'] = (sum(last_dpas[:5]) / len(last_dpas[:5])) > 0.5
  dividends[ticket]['constante'] = all(last_dpas[:5][i] > 0 for i in range(len(last_dpas[:5])))
  dividends[ticket]['crescente'] = all(last_dpas[:5][i] >= last_dpas[:5][i+1] for i in range(len(last_dpas[:5])-1))
  dividends[ticket]['healthy_payout'] = all((last_payouts[:5][i] > 0) & (last_payouts[:5][i] < 1) for i in range(len(last_payouts[:5])))

def filter(shares):
  add_graham_columns(shares)
  fill_score(shares)
  return fill_yield_history(shares)

# Inicializa os índices
def add_graham_columns(shares):
  shares['Bazin Score'] = Decimal(0)
  shares['Preço Justo'] = shares['Dividend Yield'] * 100 * Decimal(16.67)
  shares['Preço Justo / Cotação'] = shares['Preço Justo'] / shares['Cotação']
  shares['Dividendos > 5% na média dos últimos 5 anos'] = False
  shares['Dividendos Constantes Ultimos 5 Anos'] = False
  shares['Dividendos Crescentes Ultimos 5 Anos'] = False
  shares['Payout Saudavel nos Ultimos 5 Anos'] = False

def fill_score(shares):
  shares['Bazin Score'] += (shares['Preço Justo'] > Decimal(1.5) * shares['Cotação']).astype(int)
  shares['Bazin Score'] += (shares['Dividend Yield'] > 0.06).astype(int)
  shares['Bazin Score'] += ((shares['Dívida Líquida/Patrimônio']).astype(float) < 0.5).astype(int)

# Mostra quais filtros a ação passou para pontuar seu Bazin Score
def fill_score_explanation(shares):
  shares['Preço Justo > 1.5 * Cotação'] = shares['Preço Justo'] > Decimal(1.5) * shares['Cotação']
  shares['Dividend Yield > 0.06'] = shares['Dividend Yield'] > 0.06
  shares['Dívida Líquida/Patrimônio < 0.5'] = (shares['Dívida Líquida/Patrimônio']).astype(float) < 0.5 # https://www.sunoresearch.com.br/artigos/5-indicadores-para-avaliar-solidez-de-uma-empresa/

def fill_yield_history(shares):
  for index in range(len(shares)):
    ticker = shares.index[index]
    shares['Bazin Score'][index] += int(dividends[ticker]['good_dividends'])
    shares['Dividendos > 5% na média dos últimos 5 anos'][index] = dividends[ticker]['good_dividends']
    shares['Bazin Score'][index] += int(dividends[ticker]['constante'])
    shares['Dividendos Constantes Ultimos 5 Anos'][index] = dividends[ticker]['constante']
    shares['Bazin Score'][index] += int(dividends[ticker]['crescente'])
    shares['Dividendos Crescentes Ultimos 5 Anos'][index] = dividends[ticker]['crescente']
    shares['Bazin Score'][index] += int(dividends[ticker]['healthy_payout'])
    shares['Payout Saudavel nos Ultimos 5 Anos'][index] = dividends[ticker]['healthy_payout']
  return shares

# Reordena a tabela para mostrar a Cotação, o Valor Intríseco e o Bazin Score como primeiras colunass
def reorder_columns(shares):
  columns = ['Cotação', 'Preço Justo', 'Bazin Score', 'Preço Justo / Cotação']
  return shares[columns + [col for col in shares.columns if col not in tuple(columns)]]

# Copia o result no formato Markdown (Git :D)
def copy(shares):
  subprocess.run('pbcopy', universal_newlines=True, input=shares.to_markdown())

if __name__ == '__main__':
  from waitingbar import WaitingBar
  progress_bar = WaitingBar('[*] Calculating...')

  shares = bovespa.shares()

  dividends = {}
  fill_dividend_yields(shares)

  shares = filter(shares)
  fill_score_explanation(shares)
  shares = reorder_columns(shares)

  shares.sort_values(by=['Bazin Score', 'Preço Justo / Cotação'], ascending=[False, False], inplace=True)
  copy(shares)
  print(shares)

  progress_bar.stop()
