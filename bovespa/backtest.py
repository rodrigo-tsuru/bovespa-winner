# Oque é um backtest?
# => https://www.sunoresearch.com.br/artigos/backtesting/

# Automaticaly Execute Backtest with the Bovespa shares with the provided period and tickers
# This file uses Yahoo Finance API => https://pypi.org/project/yfinance/

# Quick Tutorial: https://www.youtube.com/watch?v=d2qrsCfXung&t=17s

# How to use this file...
# 
# python3
# 
# import sys, os
# sys.path.extend([f'./{name}' for name in os.listdir(".") if os.path.isdir(name)])
# import backtest
# 
# backtest.run(start='2015-04-05', tickers=['ABEV3', 'EGIE3', 'WEGE3', 'ITUB3', 'MDIA3', 'GRND3', 'ODPV3', 'ENBR3', 'PSSA3', 'FLRY3'])

# Reloading changes on this file on python REPL...
# import importlib
# importlib.reload(backtest)
# backtest.run(tickers, start, end=time.strftime("%Y-%m-%d"))

import yfinance as yf
import pyfolio as pf

import warnings
warnings.filterwarnings('ignore')

import click
import time

# Run all backtests for the provided tickers from the provided year until now
def run_all(start, tickers):
  manada = ['ABEV3', 'EGIE3', 'WEGE3', 'ITUB3', 'MDIA3', 'GRND3', 'ODPV3', 'ENBR3', 'PSSA3', 'FLRY3']
  # mine = ['BBAS3', 'BBDC3', 'BRSR3', 'CARD3', 'CGRA3', 'PETR4', 'QUAL3', 'SAPR4', 'TRPL4', 'VVAR3']
  
  click.secho(f"\nRunning Manada Backtest {manada}", fg='black', bg='white', bold=True)
  run(manada, start)
  
  click.secho(f"\nRunning Chosen Backtest {tickers}", fg='black', bg='white', bold=True)
  return run(tickers, start)

# Execute the backtest from the provided start...end range and using the provided tickers
# The default value for end is the today's date
# Usage...
# run(start='2015-04-05', tickers=['ABEV3', 'EGIE3', 'WEGE3', 'ITUB3', 'MDIA3', 'GRND3', 'ODPV3', 'ENBR3', 'PSSA3', 'FLRY3'])
# run(start='2015-04-05', end='2016-04-05', tickers=['ABEV3', 'EGIE3', 'WEGE3', 'ITUB3', 'MDIA3', 'GRND3', 'ODPV3', 'ENBR3', 'PSSA3', 'FLRY3'])
def run(tickers, start, end=time.strftime("%Y-%m-%d")):
  # end = next_year(start)
  tickers = list(map(lambda t: t + '.SA', tickers)) # Add '.SA' on the ending of the tickers
  tickers += ['^BVSP'] # Add Ibovespa index to tickers
  
  # Bring the daily tickers prices from the provided period until today
  dados_yahoo = yf.download(tickers=tickers, start=start, end=end)['Adj Close']
  
  # Calculate the percentage of DAILY return
  retorno = dados_yahoo.pct_change()
  retorno.iloc[0] = 0
  
  # Calculate the percentage of ACCUMULATED return
  retorno_acumulado = (1 + retorno).cumprod()
  
  # Execute the Backtest investing R$1.000,00 on each ticker
  carteira = 1000 * retorno_acumulado.iloc[:, :(len(tickers)-1)] # Take out the Bovespa index column
  carteira['saldo'] = carteira.sum(axis=1)
  carteira['retorno'] = carteira['saldo'].pct_change()
  
  # Bring how much money would you have today by investing R$1.000,00 on the tickers
  montante = carteira.tail(1)['saldo'][0]
  click.secho(f"\nValorizações na Carteira...\n {carteira}", fg='blue', bg='white', bold=True)
  click.secho(f"Montante Inicial: 10.000,00", fg='red', bold=True)
  click.secho(f"Montante Final: {commalize(str(montante))}", fg='blue', bold=True)
  click.secho(f"Valorização: {'{0:.0%}'.format((montante - 10000) / 10000)}", fg='green', bold=True)
  return montante

  # # Beautifully plots the result on the screen
  # pf.create_full_tear_sheet(carteira['retorno'], benchmark_rets=retorno['^BVSP'])

# Calculate Ibovespa return with R$ 1,000.00 invested
def bovespa(start, end=time.strftime("%Y-%m-%d")):
  # end = next_year(start)
  
  tickers = ['^BVSP']
  
  dados_yahoo = yf.download(tickers=tickers, start=start, end=end)['Adj Close']
  
  # Calculate the percentage of DAILY return
  retorno = dados_yahoo.pct_change()
  retorno.iloc[0] = 0
  
  # Calculate the percentage of ACCUMULATED return
  retorno_acumulado = (1 + retorno).cumprod()
  
  # Execute the Backtest investing R$10.000,00 on the Bovespa Index
  carteira = 10000 * retorno_acumulado
  return commalize(str(carteira[-1]))

def commalize(value):
  return value.replace('.', ',')

# Returns one year after the start date
def next_year(start):
  return str(int(start[:4]) + 1) + start[4:]
