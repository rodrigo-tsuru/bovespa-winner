#!/usr/bin/env python3

# Este algoritmo aplica a formula de Joel Greenblatt em todas as ações da BOVESPA
# Livro: https://www.amazon.com/Little-Book-That-Beats-Market/dp/0471733067
# Breve Explicação: https://comoinvestir.thecap.com.br/joel-greenblatt-estrategia-investimentos/

# Em sua fórmula mágica ele se utiliza dos seguintes indicadores: ROE e a relação P/L.
# Através desses 2 indicadores ele monta um Greenblatt ranking com as empresas de maior ROE (mais rentáveis) e de menor P/L (mais baratas).
# Fazendo os 2 rankings, ele soma a posição de cada uma delas nos rankings.
# As empresas de menor soma são aquelas escolhidas para montar a carteira pois seriam as mais baratas e mais rentáveis.

# Outra variação da Fórmula de Greenblatt é
# usando o Enterprise Value (EV) dividido pelo EBIT, em conjunto com o ROIC como um indicador de rentabilidade da empresa.
# A ideia segue sendo a mesma, ou seja, comprar boas empresas a preços baratos.

# Formula Mágica 1: Melhores Empresas: > ROE  e < P/L
# Formula Mágica 2: Melhores Empresas: > ROIC e < EV/EBIT (EV/EBITDA não tem no fundamentus)

# Cases de sucesso dessas fórmula...
# https://investidoringles.com/2019/01/formula-magica-de-joel-greenblatt.html

# Princípios utilizados:

# - [x] 1. > ROE e < P/L
# - [x] 2. > ROIC e < EV/EBIT
# - [x] 3. Os dois anteriores

import sys, os
sys.path.extend([f'./{name}' for name in os.listdir(".") if os.path.isdir(name)])

import fundamentus
import bovespa
import backtest

import pandas
import numpy

from math import sqrt
from decimal import Decimal

def setup(shares, formula, year):
  explain(formula)
  init(shares, formula)
  remove_bad_shares(shares, formula)
  calculate(shares, formula)
  shares = shares[shares['Cotação'] > 0]
  return reorder_columns(shares, formula)

def explain(formula):
  print("\n\nCalculating the Joel Greenblatt formula using...")
  if formula in ('ROE', None):
    print("ROE and P/L")
  if formula in ('ROIC', None):
    print("ROIC and EV/EBIT")
  print('')

def remove_bad_shares(shares, formula):
  if formula in ('ROE', None):
    shares.drop(shares[shares['P/L'] <= 0].index, inplace=True)
    shares.drop(shares[shares['ROE'] <= 0].index, inplace=True)
  if formula in ('ROIC', None):
    shares.drop(shares[shares['EV/EBIT'] <= 0].index, inplace=True)
    shares.drop(shares[shares['ROIC'] <= 0].index, inplace=True)

def init(shares, formula):
  shares['Greenblatt Ranking'] = 0
  if formula in ('ROE', None):
    shares['ROE placement'] = 0
    shares['P/L placement'] = 0
  if formula in ('ROIC', None):
    shares['ROIC placement'] = 0
    shares['EV/EBIT placement'] = 0

def calculate(shares, formula):
  shares['Magic Formula'] = 0
  
  if formula in ('ROE', None):
    shares.sort_values(by='ROE', ascending=False, inplace=True)
    shares['ROE placement'] = range(0, len(shares))
    shares.sort_values(by='P/L', ascending=True, inplace=True)
    shares['P/L placement'] = range(0, len(shares))
    shares['Magic Formula'] += shares['ROE placement'] + shares['P/L placement']
  if formula in ('ROIC', None):
    shares.sort_values(by='ROIC', ascending=False, inplace=True)
    shares['ROIC placement'] = range(0, len(shares))
    shares.sort_values(by='EV/EBIT', ascending=True, inplace=True)
    shares['EV/EBIT placement'] = range(0, len(shares))
    shares['Magic Formula'] += shares['ROIC placement'] + shares['EV/EBIT placement']
  
  shares.sort_values(by=['Magic Formula', 'Cotação'], ascending=[True, True], inplace=True)
  shares['Greenblatt Ranking'] = range(1, len(shares) + 1)
  
  return shares

def reorder_columns(shares, formula):
  columns = ['Greenblatt Ranking', 'Cotação', 'Magic Formula']

  if formula in ('ROE', None):
    columns.extend(['P/L', 'ROE'])
  if formula in ('ROIC', None):
    columns.extend(['EV/EBIT', 'ROIC'])

  return shares[columns + [col for col in shares.columns if col not in tuple(columns)]]

# Chame a função main de acordo com qual formula você quer aplicar: roe OU roic
# Formula ROE:  Utiliza ROE  e P/L
# Formula ROIC: Utiliza ROIC e EV/EBIT (EV/EBITDA não tem no fundamentus)
# ================ Exemplos ================
# python3 greenblatt.py "{ 'formula': 'ROE', 'year': 2013 }"
if __name__ == '__main__':
  from waitingbar import WaitingBar
  progress_bar = WaitingBar('[*] Calculating...')

  year = None
  formula = None
  if len(sys.argv) > 1:
    arguments = eval(sys.argv[1])
    year = int(arguments.get('year', None))
    formula = arguments.get('formula', None)

  if year == None:
    shares = bovespa.shares()
  else:
    shares = fundamentus.shares(year)

  shares = setup(shares, formula, year)

  shares.sort_values(by=['Magic Formula', 'Cotação'], ascending=[True, True], inplace=True)

  backtest.display_shares(shares, year)

  progress_bar.stop()
