# Automatically Execute Backtest with the Bovespa shares with the provided period and tickers
# This file uses Yahoo Finance API => https://pypi.org/project/yfinance/

# Quick Tutorial: https://www.youtube.com/watch?v=d2qrsCfXung&t=17s

# How to use this file...
#
# python3
# 
# import sys, os
# sys.path.extend([f'./{name}' for name in os.listdir(".") if os.path.isdir(name)])
# import backtest2
# 
# backtest2.backtest(period='5y', tickers=['ABEV3', 'EGIE3', 'WEGE3', 'ITUB3', 'MDIA3', 'GRND3', 'ODPV3', 'ENBR3', 'PSSA3', 'FLRY3'])

import yfinance as yf
import pyfolio as pf

import warnings
warnings.filterwarnings('ignore')

import click

# Execute the backtest for the provided period and tickers
# backtest(period='5y', tickers=['ABEV3', 'EGIE3', 'WEGE3', 'ITUB3', 'MDIA3', 'GRND3', 'ODPV3', 'ENBR3', 'PSSA3', 'FLRY3'])
def backtest(period, tickers):
  tickers = list(map(lambda t: t + '.SA', tickers)) # Add '.SA' on the ending of the tickers
  tickers += ['^BVSP'] # Add Ibovespa index to tickers

  # Bring the daily tickers prices from the provided period until today
  dados_yahoo = yf.download(period=period, tickers=tickers)['Adj Close']
  # dados_yahoo = yf.download(tickers=tickers, start='2017-01-01', end='2017-04-30')['Adj Close']

  # Calculate the percentage of daily return
  retorno = dados_yahoo.pct_change()
  retorno.iloc[0] = 0

  # Calculate the percentage of accumulated return
  retorno_acumulado = (1 + retorno).cumprod()

  # Execute the Backtest investing R$1.000,00 on each ticker
  carteira = 1000 * retorno_acumulado.iloc[:, :10] # Retira a coluna do Bovespa
  carteira['saldo'] = carteira.sum(axis=1)
  carteira['retorno'] = carteira['saldo'].pct_change()

  # Bring how much money would you have today
  montante = carteira.tail(1)['saldo'][0]
  click.secho(f"Montante Final: {montante}", fg='blue', bold=True)
  click.secho(f"Valorização: {'{0:.0%}'.format(montante / 10000)}", fg='red', bold=True)
  return montante

  # # Beautifully plots the result on the screen
  # pf.create_full_tear_sheet(carteira['retorno'], benchmark_rets=retorno['^BVSP'])
