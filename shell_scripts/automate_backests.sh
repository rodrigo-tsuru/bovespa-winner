# Run backtests on Brazilian Bovespa Stocks
run_backtests() {
  ttab {cd /Users/victor/Desktop/python/bovespa-winner; python3 graham.py '{ "year": 2008 }'}
  ttab {cd /Users/victor/Desktop/python/bovespa-winner; python3 graham.py '{ "year": 2009 }'}
  ttab {cd /Users/victor/Desktop/python/bovespa-winner; python3 graham.py '{ "year": 2010 }'}
  ttab {cd /Users/victor/Desktop/python/bovespa-winner; python3 graham.py '{ "year": 2011 }'}
  ttab {cd /Users/victor/Desktop/python/bovespa-winner; python3 graham.py '{ "year": 2012 }'}
  ttab {cd /Users/victor/Desktop/python/bovespa-winner; python3 graham.py '{ "year": 2013 }'}
  ttab {cd /Users/victor/Desktop/python/bovespa-winner; python3 graham.py '{ "year": 2014 }'}
  ttab {cd /Users/victor/Desktop/python/bovespa-winner; python3 graham.py '{ "year": 2015 }'}
  ttab {cd /Users/victor/Desktop/python/bovespa-winner; python3 graham.py '{ "year": 2016 }'}
  ttab {cd /Users/victor/Desktop/python/bovespa-winner; python3 graham.py '{ "year": 2017 }'}
  ttab {cd /Users/victor/Desktop/python/bovespa-winner; python3 graham.py '{ "year": 2018 }'}
}


# For Fast Backtesting Purposes...
python3

import sys, os
sys.path.extend([f'./{name}' for name in os.listdir(".") if os.path.isdir(name)])

import fundamentus
import backtest


#####################
## Benjamin Graham ##
#####################
a1 = ['ELET6', 'BRGE6', 'CPLE3', 'CPLE6', 'CSMG3', 'BRGE7', 'BRGE8', 'BRGE12', 'BRGE3', 'SAPR4']
backtest.run_all(fundamentus.start_date(2008), a1)

a2 = ['FESA4', 'CSMG3', 'USIM3', 'BRAP3', 'PEAB3', 'PEAB4', 'SAPR4', 'PATI4', 'CPLE3', 'CPLE6']
backtest.run_all(fundamentus.start_date(2009), a2)

a3 = ['CSMG3', 'EQTL3', 'CTSA4', 'CTSA3', 'SBSP3', 'BRGE3', 'BRGE6', 'BSLI3', 'BGIP3', 'BGIP4']
backtest.run_all(fundamentus.start_date(2010), a3)

a4 = ['BMEB4', 'BMEB3', 'BSLI3', 'WHRL3', 'WHRL4', 'ELET3', 'CTSA3', 'CTSA4', 'CSMG3', 'SBSP3']
backtest.run_all(fundamentus.start_date(2011), a4)

a5 = ['CPLE3', 'BBAS3', 'PETR4', 'RAPT3', 'VALE3', 'CMIG3', 'ECPR3', 'ECPR4', 'CTSA3', 'CTSA4']
backtest.run_all(fundamentus.start_date(2012), a5)

a6 = ['DOHL4', 'CTSA4', 'CESP3', 'CTSA3', 'BRSR3', 'BBAS3', 'CMIG3', 'BNBR3', 'CMIG4', 'VALE3']
backtest.run_all(fundamentus.start_date(2013), a6)

a7 = ['BBAS3', 'BNBR3', 'SOND6', 'SOND5', 'CTSA3', 'CTSA4', 'CMIG4', 'CMIG3', 'BRSR3', 'SAPR4']
backtest.run_all(fundamentus.start_date(2014), a7)

a8 = ['EZTC3', 'EVEN3', 'DOHL4', 'MRVE3', 'SAPR4', 'CMIG4', 'CMIG3', 'VIVT3', 'ETER3', 'BRSR3']
backtest.run_all(fundamentus.start_date(2015), a8)

a9 = ['ITSA4', 'ITSA3', 'ITUB3', 'CMIG4', 'CMIG3', 'BBAS3', 'CGRA4', 'CGRA3', 'EZTC3', 'TAEE11']
backtest.run_all(fundamentus.start_date(2016), a9)

a10 = ['TRPL3', 'TRPL4', 'BNBR3', 'BSLI4', 'CGRA3', 'CGRA4', 'BMIN4', 'SAPR3', 'BEES3', 'BEES4']
backtest.run_all(fundamentus.start_date(2017), a10)

a11 = ['BNBR3', 'TRPL3', 'TRPL4', 'ABCB4', 'BEES3', 'BEES4', 'CCPR3', 'SAPR4', 'FESA3', 'FESA4']
backtest.run_all(fundamentus.start_date(2018), a11)

a12 = ['FESA4', 'TRPL3', 'TRPL4', 'BNBR3', 'BPAR3', 'FESA3', 'MRVE3', 'VIVT3', 'BRSR3', 'NAFG3']
backtest.run_all(fundamentus.start_date(2019), a12)



#################
## Décio Bazin ##
#################
a1 = ['CSAB3', 'CSAB4', 'SULT3', 'SULT4', 'TRPL3', 'TRPL4', 'VIVT3', 'VIVT4', 'GRND3', 'SANB4']
backtest.run_all(fundamentus.start_date(2008), a1)

a2 = ['GRND3', 'SOND3', 'LREN3', 'FESA4', 'PATI4', 'TKNO4', 'IGTA3', 'POSI3', 'ETER3', 'ALPA3']
backtest.run_all(fundamentus.start_date(2009), a2)

a3 = ['PEAB4', 'PEAB3', 'CTSA4', 'JHSF3', 'ODPV3', 'BGIP4', 'EKTR4', 'BGIP3', 'PATI4', 'WHRL4']
backtest.run_all(fundamentus.start_date(2010), a3)

a4 = ['ODPV3', 'SOND3', 'ELET3', 'BGIP4', 'WHRL4', 'WHRL3', 'PATI4', 'CSAB4', 'CSAB3', 'BNBR3']
backtest.run_all(fundamentus.start_date(2011), a4)

a5 = ['PATI4', 'GRND3', 'BGIP4', 'BGIP3', 'GEPA3', 'BBAS3', 'MERC4', 'CGRA3', 'CGRA4', 'YDUQ3']
backtest.run_all(fundamentus.start_date(2012), a5)

a6 = ['PATI4', 'BGIP4', 'BGIP3', 'ETER3', 'GRND3', 'CMIG3', 'CMIG4', 'LEVE3', 'PINE4', 'BEES4']
backtest.run_all(fundamentus.start_date(2013), a6)

a7 = ['PINE4', 'BBAS3', 'BRIV4', 'GRND3', 'ELET3', 'BGIP3', 'BGIP4', 'ALPA4', 'VIVT3', 'VIVT4']
backtest.run_all(fundamentus.start_date(2014), a7)

a8 = ['PINE4', 'BBAS3', 'CRIV4', 'SAPR4', 'BALM4', 'GRND3', 'DOHL4', 'ENBR3', 'LEVE3', 'GEPA4']
backtest.run_all(fundamentus.start_date(2015), a8)

a9 = ['BBSE3', 'BBAS3', 'ITUB3', 'CRIV4', 'ITSA4', 'BBDC4', 'BBDC3', 'BRIV4', 'ITSA3', 'EZTC3']
backtest.run_all(fundamentus.start_date(2016), a9)

a10 = ['CRIV4', 'ITSA4', 'BRIV4', 'FESA4', 'CGRA4', 'CGRA3', 'CESP3', 'GRND3', 'LCAM3', 'BMEB4']
backtest.run_all(fundamentus.start_date(2017), a10)

a11 = ['CRIV4', 'CSAB4', 'CSAB3', 'BRIV4', 'HGTX3', 'CGRA4', 'CGRA3', 'GRND3', 'BMEB4', 'BNBR3']
backtest.run_all(fundamentus.start_date(2018), a11)

a12 = ['CRIV4', 'BRIV4', 'ITUB3', 'ITSA4', 'ITSA3', 'BBSE3', 'TRPL4', 'GRND3', 'BMEB4', 'PEAB4']
backtest.run_all(fundamentus.start_date(2019), a12)



#####################
## Joel Greenblatt ##
##   ROE + ROIC    ##
#####################
a1 = ['CEBR5', 'CEBR6', 'CEBR3', 'CEEB3', 'ENGI4', 'ENGI3', 'FBMC4', 'TIET4', 'VIVT4', 'WHRL3']
backtest.run_all(fundamentus.start_date(2008), a1)

a2 = ['FESA4', 'CEBR6', 'CEBR3', 'CEBR5', 'GGBR4', 'MYPK3', 'FBMC4', 'RAPT3', 'RAPT4', 'LPSB3']
backtest.run_all(fundamentus.start_date(2009), a2)

a3 = ['TIET3', 'TIET4', 'ETER3', 'EKTR4', 'SCAR3', 'SOND5', 'SOND6', 'GRND3', 'CGAS3', 'WEGE3']
backtest.run_all(fundamentus.start_date(2010), a3)

a4 = ['COCE3', 'COCE5', 'CEEB5', 'WHRL3', 'CAMB4', 'CIEL3', 'TIET3', 'CGAS3', 'WHRL4', 'CEEB3']
backtest.run_all(fundamentus.start_date(2011), a4)

a5 = ['AELP3', 'FHER3', 'VALE5', 'VALE3', 'COCE3', 'COCE5', 'RAPT3', 'CSNA3', 'RAPT4', 'TAEE11']
backtest.run_all(fundamentus.start_date(2012), a5)

a6 = ['WHRL3', 'WHRL4', 'TIET3', 'TIET4', 'ETER3', 'CSRN5', 'COCE5', 'COCE3', 'CMIG3', 'TRPL4']
backtest.run_all(fundamentus.start_date(2013), a6)

a7 = ['SOND5', 'BAUH4', 'WHRL3', 'WHRL4', 'TIET3', 'TIET4', 'ETER3', 'CMIG4', 'CMIG3', 'PTBL3']
backtest.run_all(fundamentus.start_date(2014), a7)

a8 = ['OGXP3', 'WHRL3', 'WHRL4', 'VVAR3', 'TIET3', 'CMIG4', 'PSSA3', 'CMIG3', 'TIET4', 'PTBL3']
backtest.run_all(fundamentus.start_date(2015), a8)

a9 = ['AGRO3', 'PTBL3', 'CMIG4', 'CMIG3', 'SEER3', 'BRKM3', 'EQTL3', 'COCE5', 'PMAM3', 'VVAR3']
backtest.run_all(fundamentus.start_date(2016), a9)

a10 = ['TRPL3', 'TRPL4', 'MSPA4', 'CGAS3', 'CGAS5', 'BAUH4', 'BRKM3', 'BRKM5', 'BEEF3', 'SMLS3']
backtest.run_all(fundamentus.start_date(2017), a10)

a11 = ['IDNT3', 'BAUH4', 'UNIP6', 'UNIP5', 'UNIP3', 'WIZS3', 'PSSA3', 'CRPG6', 'FESA4', 'CRPG5']
backtest.run_all(fundamentus.start_date(2018), a11)

a12 = ['WIZS3', 'UNIP6', 'UNIP5', 'UNIP3', 'CRPG6', 'CRPG5', 'AGRO3', 'SMLS3', 'CIEL3', 'BAUH4']
backtest.run_all(fundamentus.start_date(2019), a12)



####################
#### Piotrotski ####
####################
a1 = ['BMIN4', 'BMIN3', 'BAZA3', 'SAPR4', 'CRIV4', 'CRIV3', 'ETER3', 'JBSS3', 'MERC4', 'ITSA4']
backtest.run_all(fundamentus.start_date(2008), a1)

a2 = ['BBRK3', 'LAME3', 'LAME4', 'MULT3', 'BBDC3', 'COCE3', 'BBDC4', 'COCE6', 'COCE5', 'ELET6']
backtest.run_all(fundamentus.start_date(2009), a2)

a3 = ['BAZA3', 'SPRI3', 'KLBN4', 'KLBN3', 'ELEK4', 'TGMA3', 'ELEK3', 'RANI3', 'RANI4', 'MYPK3']
backtest.run_all(fundamentus.start_date(2010), a3)

a4 = ['TCNO4', 'TCNO3', 'FHER3', 'CESP3', 'EKTR4', 'CESP5', 'SMTO3', 'EKTR3', 'CESP6', 'CEDO4']
backtest.run_all(fundamentus.start_date(2011), a4)

a5 = ['MTSA4', 'TOTS3', 'KEPL3', 'UNIP6', 'UNIP3', 'UNIP5', 'DTCY3', 'CBEE3', 'CTSA3', 'CTSA4']
backtest.run_all(fundamentus.start_date(2012), a5)

a6 = ['SHUL4', 'VVAR3', 'CLSC4', 'CLSC3', 'BRFS3', 'MNDL3', 'TXRX3', 'TRIS3', 'WHRL3', 'WHRL4']
backtest.run_all(fundamentus.start_date(2013), a6)

a7 = ['CESP3', 'CESP6', 'CESP5', 'MULT3', 'PTNT4', 'CARD3', 'JBSS3', 'NAFG4', 'HYPE3', 'CEPE5']
backtest.run_all(fundamentus.start_date(2014), a7)

a8 = ['CARD3', 'BMIN4', 'ENEV3', 'GFSA3', 'SHOW3', 'ENGI3', 'BRGE11', 'ENGI4', 'BRGE3', 'BRGE8']
backtest.run_all(fundamentus.start_date(2015), a8)

a9 = ['VULC3', 'FRIO3', 'CARD3', 'SEER3', 'ALUP11', 'MDIA3', 'MGEL4', 'LOGN3', 'SAPR4', 'SAPR3']
backtest.run_all(fundamentus.start_date(2016), a9)

a10 = ['VULC3', 'MTSA4', 'NAFG4', 'ENEV3', 'ANIM3', 'NAFG3', 'TEND3', 'YDUQ3', 'SLCE3', 'IGTA3']
backtest.run_all(fundamentus.start_date(2017), a10)

a11 = ['CESP3', 'WIZS3', 'LAME3', 'CESP6', 'CPRE3', 'CRFB3', 'LAME4', 'VLID3', 'TUPY3', 'TEND3']
backtest.run_all(fundamentus.start_date(2018), a11)

a12 = ['BEEF3', 'EVEN3', 'RAPT3', 'RAPT4', 'KEPL3', 'WEGE3', 'BAZA3', 'CPLE3', 'CPLE6', 'CSMG3']
backtest.run_all(fundamentus.start_date(2019), a12)
