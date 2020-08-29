import sys
import os
import subprocess
import webbrowser
import re
import fundamentus
import browser

def display_shares(shares, year):
  copy(shares)
  print(shares)
  if year == None or year >= 2020:
    return ''
  date = re.findall(r".*web\/(\w{4})(\w{2})(\w{2})(\w{2})(\w{2})(\w{2})\/.*", fundamentus.backtest(year))
  date = dict({ 'year': date[0][0], 'month': date[0][1], 'day': date[0][2], 'hours': date[0][3], 'minutes': date[0][4], 'seconds': date[0][5] })
  formatted_date = f'Year: {date["year"]}\n'
  formatted_date += f'Month: {date["month"]}\n'
  formatted_date += f'Day: {date["day"]}\n'
  formatted_date += f'Hours: {date["hours"]}\n'
  formatted_date += f'Minutes: {date["minutes"]}\n'
  formatted_date += f'Seconds: {date["seconds"]}'
  
  print("\n==== Date ====")
  print(formatted_date)
  print("==============")

  open_backtest(shares, date, 'algorithmn')
  open_backtest(shares, date, 'manada')

# Copia o result no formato Markdown (Git :D)
def copy(shares):
  subprocess.run('pbcopy', universal_newlines=True, input=shares.to_markdown())

def open_backtest(shares, date, type):
  url = 'https://simuladordeinvestimentos.com/simulador'
  if type == 'algorithmn':
    url += f'?Capital[]=1000&Cnpj[]=RV-A-{shares.index[0]}'
    url += f'&Capital[]=1000&Cnpj[]=RV-A-{shares.index[1]}'
    url += f'&Capital[]=1000&Cnpj[]=RV-A-{shares.index[2]}'
    url += f'&Capital[]=1000&Cnpj[]=RV-A-{shares.index[3]}'
    url += f'&Capital[]=1000&Cnpj[]=RV-A-{shares.index[4]}'
    url += f'&Capital[]=1000&Cnpj[]=RV-A-{shares.index[5]}'
    url += f'&Capital[]=1000&Cnpj[]=RV-A-{shares.index[6]}'
    url += f'&Capital[]=1000&Cnpj[]=RV-A-{shares.index[7]}'
    url += f'&Capital[]=1000&Cnpj[]=RV-A-{shares.index[8]}'
    url += f'&Capital[]=1000&Cnpj[]=RV-A-{shares.index[9]}'
  elif type == 'manada':
    manada = ['ABEV3', 'EGIE3', 'WEGE3', 'ITUB3', 'MDIA3', 'GRND3', 'ODPV3', 'ENBR3', 'PSSA3', 'FLRY3']
    url += f'?Capital[]=1000&Cnpj[]=RV-A-{manada[0]}&Capital[]=1000&Cnpj[]=RV-A-{manada[1]}&Capital[]=1000&Cnpj[]=RV-A-{manada[2]}&Capital[]=1000&Cnpj[]=RV-A-{manada[3]}&Capital[]=1000&Cnpj[]=RV-A-{manada[4]}&Capital[]=1000&Cnpj[]=RV-A-{manada[5]}&Capital[]=1000&Cnpj[]=RV-A-{manada[6]}&Capital[]=1000&Cnpj[]=RV-A-{manada[7]}&Capital[]=1000&Cnpj[]=RV-A-{manada[8]}&Capital[]=1000&Cnpj[]=RV-A-{manada[9]}'
  url += f'&Benchmark=IBOV&Periodo={int(date["year"]) + 1}-{date["month"]}-{date["day"]}+{date["year"]}-{date["month"]}-{date["day"]}'
  
  browser.open(url)
