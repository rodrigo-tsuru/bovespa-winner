#!/usr/bin/env python3

# Captura os dados iniciais a partir do site www.fundamentus.com.br

import re
import urllib.request
import urllib.parse
import http.cookiejar
import pandas

from lxml.html import fragment_fromstring
from decimal import Decimal

def start_date(year):
  date = re.findall(r".*web\/(\w{4})(\w{2})(\w{2})(\w{2})(\w{2})(\w{2})\/.*", backtest(year))
  return f"{date[0][0]}-{date[0][1]}-{date[0][2]}"

def shares(year = None):
  url = backtest(year)
  cookie = http.cookiejar.CookieJar()
  request = urllib.request.build_opener(urllib.request.HTTPCookieProcessor(cookie))
  request.addheaders = [
    ('User-agent', 'Mozilla/5.0 (Windows; U; Windows NT 6.1; rv:2.2) Gecko/20110201'),
    ('Accept', 'text/html, text/plain, text/css, text/sgml, */*;q=0.01')
  ]

  # Aqui estão os parâmetros de busca das ações
  # Estão em branco para que retorne todas as disponíveis
  data = {'pl_min': '', 'pl_max': '', 'pvp_min': '', 'pvp_max' : '', 'psr_min': '', 'psr_max': '', 'divy_min': '', 'divy_max': '', 'pativos_min': '', 'pativos_max': '', 'pcapgiro_min': '', 'pcapgiro_max': '', 'pebit_min': '', 'pebit_max': '', 'fgrah_min': '', 'fgrah_max': '', 'firma_ebit_min': '', 'firma_ebit_max': '', 'margemebit_min': '', 'margemebit_max': '', 'margemliq_min': '', 'margemliq_max': '', 'liqcorr_min': '', 'liqcorr_max': '', 'roic_min': '', 'roic_max': '', 'roe_min': '', 'roe_max': '', 'liq_min': '', 'liq_max': '', 'patrim_min': '', 'patrim_max': '', 'divbruta_min': '', 'divbruta_max': '', 'tx_cresc_rec_min': '', 'tx_cresc_rec_max': '', 'setor': '', 'negociada': 'ON', 'ordem': '1', 'x': '28', 'y': '16'}

  with request.open(url, urllib.parse.urlencode(data).encode('UTF-8')) as link:
      content = link.read().decode('ISO-8859-1')

  pattern = re.compile('<table id="resultado".*</table>', re.DOTALL)
  content = re.findall(pattern, content)[0]
  page = fragment_fromstring(content)
  result = pandas.DataFrame(dataframe_opts(year))

  for rows in page.xpath('tbody')[0].findall("tr"):
      new_row = pandas.DataFrame(index=[rows.getchildren()[0][0].getchildren()[0].text],
                                 data=dataframe_data(rows, year))
      result = result.append(new_row)
  
  return result[result['Cotação'] > 0]

def backtest(year = None):
  urls = {
    2008: 'https://web.archive.org/web/20080613050801/http://www.fundamentus.com.br/resultado.php',
    2009: 'https://web.archive.org/web/20090123022224/http://www.fundamentus.com.br/resultado.php',
    2010: 'https://web.archive.org/web/20100115191626/http://www.fundamentus.com.br/resultado.php',
    2011: 'https://web.archive.org/web/20110113192117/http://www.fundamentus.com.br/resultado.php',
    2012: 'https://web.archive.org/web/20120106023830/http://www.fundamentus.com.br/resultado.php',
    2013: 'https://web.archive.org/web/20130105004012/http://www.fundamentus.com.br/resultado.php',
    2014: 'https://web.archive.org/web/20140108164618/http://www.fundamentus.com.br/resultado.php',
    2015: 'https://web.archive.org/web/20150119231047/http://www.fundamentus.com.br/resultado.php',
    2016: 'https://web.archive.org/web/20160106101916/http://www.fundamentus.com.br/resultado.php',
    2017: 'https://web.archive.org/web/20170505164235/http://www.fundamentus.com.br/resultado.php',
    2018: 'https://web.archive.org/web/20180105120409/http://www.fundamentus.com.br/resultado.php',
    2019: 'https://web.archive.org/web/20190102202956/http://www.fundamentus.com.br/resultado.php'
  }
  return urls.get(year, 'http://www.fundamentus.com.br/resultado.php')

def dataframe_opts(year = None):
  opts = {'Cotação': [],
          'P/L': [],
          'P/VP': [],
          'PSR': [],
          'Dividend Yield': [],
          'P/Ativo': [],
          'P/Capital de Giro': [],
          'P/EBIT': [],
          'P/ACL': [],
          'EV/EBIT': [],
          'EV/EBITDA': [],
          'Margem Ebit': [],
          'Margem Líquida': [],
          'Liquidez Corrente': [],
          'ROIC': [],
          'ROE': [],
          'Liquidez 2 meses': [],
          'Patrimônio Líquido': [],
          'Dívida Bruta/Patrimônio': [],
          'Crescimento em 5 anos': []}
  if year != None and year < 2020: del opts['EV/EBITDA']
  
  return opts

def dataframe_data(rows, year = None):
  columns = ['Cotação', 'P/L', 'P/VP', 'PSR', 'Dividend Yield', 'P/Ativo','P/Capital de Giro', 'P/EBIT', 'P/ACL', 'EV/EBIT', 'EV/EBITDA', 'Margem Ebit', 'Margem Líquida', 'Liquidez Corrente', 'ROIC', 'ROE', 'Liquidez 2 meses', 'Patrimônio Líquido', 'Dívida Bruta/Patrimônio', 'Crescimento em 5 anos']
  if year != None and year < 2020: columns.remove('EV/EBITDA')
  
  return dict((val, todecimal(rows.getchildren()[index + 1].text)) for index, val in enumerate(columns))

def todecimal(string):
    string = string.replace('.', '')
    string = string.replace(',', '.')
  
    if (string.endswith('%')):
      string = string[:-1]
      return Decimal(string) / 100
    else:
      return Decimal(string)
