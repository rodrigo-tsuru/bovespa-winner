#!/usr/bin/env python3

# A idéia é calcular um ranking analisando os dados fundamentalistas de todas as empresas da bolsa B3
# Para a análise, são utilizados ensinamentos do livro "O Investidor Inteligente" de Benjamin Graham
# Também é calcula o Valor Intrínseco (Preço Justo) e Margem de Segurança, ambos também definidos por Benjamin Graham.
# Benjamin Graham foi o mentor dos melhores investidores do mundo, como o grandíssimo Warren Buffet,
# além do Irving Kahn e Walter Schloss.

# Aqui também é utilizado ensinamentos de Kenneth Fisher (PSR) e alguns outros grandes investidores fundamentalistas

# A coluna "Graham Score" é a mais importante. Quanto maior o valor dela, melhor!
# Ela representa a quantidade de filtros fundamentalistas que cada ação da bolsa de valores conseguiu ultrapassar.


########### Precisa Capturar ###########
#### Outros ####
# * ROA > 0.05. (https://www.disruptiveadvertising.com/marketing/roas-return-on-ad-spend/)
# * P/L ideal aproximadamente 5 # ?
# * PSR ideal aproximadamente 1 # ?
# * Nova Formula Graham (https://www.oldschoolvalue.com/stock-valuation/benjamin-graham-formula/)
# * Filtros Graham (https://www.scielo.br/scielo.php?script=sci_arttext&pid=S1519-70772010000100003)

################### Novo Warren Buffet (Qualitativo) ###################
# * ROE, ROIC, ROA altos
# * Margem Líquida alta em relação a concorrentes
#    => https://api-analitica.sunoresearch.com.br/api/Company/GetRelatedCompanies?ticker=SQIA3&quantity=20
# * Grande resultado histórico de Lucros Crescentes
#    => https://api-analitica.sunoresearch.com.br/api/Indicator/GetIndicatorsYear?ticker=TGMA3
### Buffet: “Nós fomos mudando para este enfoque ao longo dos anos. Não é muito difícil ficar observando negócios por 50 anos e aprender aonde se faz dinheiro de verdade.”

import sys, os
sys.path.extend([f'./{name}' for name in os.listdir(".") if os.path.isdir(name)])

import graham
import backtest

import pandas
import subprocess
import numpy

from math import sqrt
from decimal import Decimal

def improve_ratings(shares, year):
  improve_score(shares, year)
  improve_score_explanation(shares, year)

# Avalia novos indicadores fundamentalistas (Extras, além dos avaliados por Benjamin Graham.)
# - [x] 1. ROIC (Return on Invested Capital) => Quanto maior, melhor (ideal, > 10%) # https://www.sunoresearch.com.br/artigos/o-investidor-inteligente-entenda-a-obra-de-benjamin-graham/
# - [x] 2. PSR (Price Sales Ratio) => Quanto menor, melhor (ideal, < 0.75) # https://www.moneyshow.com/articles/tptp072513-46306/
# - [x] 3. Margem Líquida => Quanto maior melhor (ideal, > 10%) # https://www.youtube.com/watch?v=7tB_ym4Cabc E https://www.sunoresearch.com.br/artigos/5-indicadores-para-avaliar-solidez-de-uma-empresa/
# - [x] 4. Dívida Líquida/EBIT => Quanto menor melhor (ideal, <= 3) # https://www.sunoresearch.com.br/artigos/5-indicadores-para-avaliar-solidez-de-uma-empresa/
# - [x] 5. Dívida Líquida/Patrimônio => Quanto menor, melhor (ideal < 50%) # https://www.sunoresearch.com.br/artigos/5-indicadores-para-avaliar-solidez-de-uma-empresa/
# - [x] 6. EV/EBITDA (Enterprise Value / EBITDA) => Quanto menor melhor (ideal, < 10) # https://www.investopedia.com/ask/answers/072715/what-considered-healthy-evebitda.asp
# - [x] 7. Peg Ratio (P/L / CAGRLucros5Anos) => Quanto menor melhor (ideal <= 1) # https://bugg.com.br/2018/01/24/buggpedia-o-que-e-o-peg-ratio/
def improve_score(shares, year):
  shares['Graham Score'] += (shares['ROIC'] > 0.1).astype(int)
  shares['Graham Score'] += (shares['PSR'] < 0.75).astype(int)
  shares['Graham Score'] += (shares['Margem Líquida'] > 0.1).astype(int)
  if year == None or year >= 2020:
    shares['Graham Score'] += ((shares['Dívida Líquida/EBIT']).astype(float) <= 3.0).astype(int)
    shares['Graham Score'] += ((shares['Dívida Líquida/Patrimônio']).astype(float) < 0.5).astype(int)
    shares['Graham Score'] += ((shares['EV/EBITDA'] < 10.0) & (shares['EV/EBITDA'] > 0)).astype(int)
    shares['Graham Score'] += ((shares['P/L'] >= 0) & (shares['CAGR Lucros 5 Anos'].astype(float) >= 0) & (shares['P/L'].astype(float) <= (shares['CAGR Lucros 5 Anos'].astype(float)))).astype(int)

# Mostra quais filtros a ação passou para pontuar seu Graham Score
def improve_score_explanation(shares, year):
  shares['ROIC > 10%'] = shares['ROIC'] > 0.1
  shares['PSR < 0.75'] = shares['PSR'] < 0.75
  shares['Margem Líquida > 10%'] = shares['Margem Líquida'] > 0.1
  if year == None or year >= 2020:
    shares['Dívida Líquida/EBIT <= 3.0'] = (shares['Dívida Líquida/EBIT']).astype(float) <= 3.0
    shares['Dívida Líquida/Patrimônio < 0.5'] = (shares['Dívida Líquida/Patrimônio']).astype(float) < 0.5
    shares['EV/EBITDA < 10'] = (shares['EV/EBITDA'] < 10.0) & (shares['EV/EBITDA'] > 0)
    shares['PEG Ratio <= 1'] = (shares['P/L'] >= 0) & (shares['CAGR Lucros 5 Anos'].astype(float) >= 0) & (shares['P/L'].astype(float) <= (shares['CAGR Lucros 5 Anos'].astype(float)))

# python3 score.py "{ 'year': 2013 }"
if __name__ == '__main__':
  from waitingbar import WaitingBar
  progress_bar = WaitingBar('[*] Calculating...')
  
  shares = graham.populate_shares(sys)
  year = graham.year
  
  improve_ratings(shares, year)
  
  shares.sort_values(by=['Graham Score', 'Cotação'], ascending=[False, True], inplace=True)

  shares['Ranking'] = range(1, len(shares) + 1)

  backtest.display_shares(shares, year)
  
  progress_bar.stop()
