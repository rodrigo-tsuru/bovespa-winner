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


#######################################################
###################### How to Run #####################
#######################################################

backtests = {
  '2008': str(backtest.run_all(fundamentus.start_date(2008), a1)).replace('.', ','),
  '2009': str(backtest.run_all(fundamentus.start_date(2009), a2)).replace('.', ','),
  '2010': str(backtest.run_all(fundamentus.start_date(2010), a3)).replace('.', ','),
  '2011': str(backtest.run_all(fundamentus.start_date(2011), a4)).replace('.', ','),
  '2012': str(backtest.run_all(fundamentus.start_date(2012), a5)).replace('.', ','),
  '2013': str(backtest.run_all(fundamentus.start_date(2013), a6)).replace('.', ','),
  '2014': str(backtest.run_all(fundamentus.start_date(2014), a7)).replace('.', ','),
  '2015': str(backtest.run_all(fundamentus.start_date(2015), a8)).replace('.', ','),
  '2016': str(backtest.run_all(fundamentus.start_date(2016), a9)).replace('.', ','),
  '2017': str(backtest.run_all(fundamentus.start_date(2017), a10)).replace('.', ','),
  '2018': str(backtest.run_all(fundamentus.start_date(2018), a11)).replace('.', ','),
  '2019': str(backtest.run_all(fundamentus.start_date(2019), a12)).replace('.', ',')
}

print(("\n").join(list(backtests.values())))

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



###############################
## Benjamin Graham Valuation ##
###############################
a1 = ['MEND5', 'MEND6', 'SULT3', 'SULT4', 'CEBR5', 'CEBR6', 'MERC4', 'BRGE7', 'BRGE8', 'BRGE12']
backtest.run_all(fundamentus.start_date(2008), a1)

a2 = ['MEND6', 'MEND5', 'INEP4', 'SULT3', 'ECPR3', 'CEBR6', 'ECPR4', 'CEBR3', 'SULT4', 'CEBR5']
backtest.run_all(fundamentus.start_date(2009), a2)

a3 = ['MEND6', 'MEND5', 'EUCA3', 'INEP3', 'EUCA4', 'EMAE4', 'CTSA4', 'CTSA3', 'CRIV4', 'IGUA5']
backtest.run_all(fundamentus.start_date(2010), a3)

a4 = ['MEND6', 'MEND5', 'CEED3', 'SULT3', 'SULT4', 'BAHI3', 'ECPR3', 'ECPR4', 'BMKS3', 'MSPA4']
backtest.run_all(fundamentus.start_date(2011), a4)

a5 = ['MEND5', 'MEND6', 'ECPR3', 'SULT3', 'SULT4', 'ECPR4', 'HBTS5', 'BRGE8', 'MERC4', 'BRGE12']
backtest.run_all(fundamentus.start_date(2012), a5)

a6 = ['ELET3', 'TCNO3', 'MEND5', 'MEND6', 'TCNO4', 'SPRI6', 'SPRI3', 'SPRI5', 'ELET6', 'BRGE12']
backtest.run_all(fundamentus.start_date(2013), a6)

a7 = ['JBDU4', 'JBDU3', 'SOND6', 'SOND5', 'CEBR3', 'CEBR6', 'BRGE8', 'BRGE11', 'CEDO4', 'BRGE12']
backtest.run_all(fundamentus.start_date(2014), a7)

a8 = ['GFSA3', 'OIBR4', 'OIBR3', 'EMAE4', 'BRGE11', 'BRGE3', 'TCSA3', 'POSI3', 'JHSF3', 'CLSC4']
backtest.run_all(fundamentus.start_date(2015), a8)

a9 = ['CLSC4', 'BRGE12', 'EMAE4', 'VVAR3', 'SGPS3', 'BRSR6', 'ITSA4', 'CMIG4', 'HBOR3', 'CLSC3']
backtest.run_all(fundamentus.start_date(2016), a9)

a10 = ['MSPA3', 'EEEL3', 'MSPA4', 'LOGN3', 'BRGE12', 'EEEL4', 'GSHP3', 'BRGE8', 'BRGE11', 'PRIO3']
backtest.run_all(fundamentus.start_date(2017), a10)

a11 = ['LUPA3', 'CEBR6', 'BRGE12', 'CEBR3', 'CEBR5', 'BTTL4', 'BTTL3', 'BRGE3', 'MERC4', 'BRGE11']
backtest.run_all(fundamentus.start_date(2018), a11)

a12 = ['JBDU4', 'JBDU3', 'OIBR3', 'OIBR4', 'TPIS3', 'GPCP3', 'BRGE5', 'CEDO4', 'CEDO3', 'BRGE12']
backtest.run_all(fundamentus.start_date(2019), a12)


#######################################
## Benjamin Graham Valuation + Score ##
#######################################
a1 = ['BRGE7', 'BRGE8', 'BRGE12', 'BRGE3', 'SAPR4', 'BRGE11', 'BRGE6', 'CRIV4', 'ELET6', 'RPAD5']
backtest.run_all(fundamentus.start_date(2008), a1)

a2 = ['INEP4', 'ECPR3', 'CEBR6', 'ECPR4', 'CEBR3', 'CEBR5', 'PEAB3', 'IDVL4', 'PEAB4', 'SAPR4']
backtest.run_all(fundamentus.start_date(2009), a2)

a3 = ['MEND6', 'MEND5', 'EUCA3', 'EUCA4', 'CTSA4', 'CTSA3', 'CRIV4', 'SBSP3', 'BRIV4', 'TUPY3']
backtest.run_all(fundamentus.start_date(2010), a3)

a4 = ['MEND6', 'MEND5', 'BAHI3', 'ECPR3', 'ECPR4', 'BMKS3', 'BMEB4', 'ELET3', 'CEDO4', 'BDLL4']
backtest.run_all(fundamentus.start_date(2011), a4)

a5 = ['MEND5', 'MEND6', 'ECPR3', 'ECPR4', 'HBTS5', 'MERC4', 'ELET3', 'CEDO3', 'BRPR3', 'CTSA3']
backtest.run_all(fundamentus.start_date(2012), a5)

a6 = ['SPRI6', 'SPRI3', 'SPRI5', 'MERC4', 'BRIV4', 'CPLE3', 'CRIV4', 'DOHL4', 'RPAD3', 'CTSA4']
backtest.run_all(fundamentus.start_date(2013), a6)

a7 = ['SOND6', 'SOND5', 'BRGE8', 'BRGE11', 'CEDO4', 'CEDO3', 'MERC3', 'MERC4', 'CPLE3', 'BNBR3']
backtest.run_all(fundamentus.start_date(2014), a7)

a8 = ['BRGE11', 'JHSF3', 'CLSC4', 'RDNI3', 'EVEN3', 'PETR3', 'PETR4', 'GOAU3', 'JOPA3', 'CPLE3']
backtest.run_all(fundamentus.start_date(2015), a8)

a9 = ['CLSC4', 'BRSR6', 'CMIG4', 'HBOR3', 'CLSC3', 'DIRR3', 'CPLE3', 'CMIG3', 'LIGT3', 'SAPR4']
backtest.run_all(fundamentus.start_date(2016), a9)

a10 = ['MSPA3', 'EEEL3', 'MSPA4', 'EEEL4', 'PRIO3', 'TRPL3', 'TRPL4', 'BNBR3', 'CPLE3', 'BRIV4']
backtest.run_all(fundamentus.start_date(2017), a10)

a11 = ['MERC4', 'BRGE11', 'CPLE3', 'EEEL4', 'CRPG6', 'EEEL3', 'BAZA3', 'BRIV3', 'CRPG5', 'BNBR3']
backtest.run_all(fundamentus.start_date(2018), a11)

a12 = ['OIBR3', 'OIBR4', 'BRGE7', 'BRGE8', 'LLIS3', 'PATI3', 'BMEB4', 'BRIV3', 'JOPA3', 'AGRO3']
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



################################
## Décio Bazin (DY Valuation) ##
################################
a1 = ['SANB4', 'SANB3', 'ETER3', 'SULT3', 'SULT4', 'CSAB4', 'CSAB3', 'GRND3', 'TRPL3', 'TRPL4']
backtest.run_all(fundamentus.start_date(2008), a1)

a2 = ['ETER3', 'POSI3', 'FESA4', 'PATI4', 'GRND3', 'IGTA3', 'LREN3', 'SOND3', 'TKNO4', 'SANB4']
backtest.run_all(fundamentus.start_date(2009), a2)

a3 = ['CTSA4', 'JHSF3', 'PEAB4', 'PEAB3', 'WHRL4', 'WHRL3', 'CRIV4', 'CTSA3', 'ETER3', 'EKTR4']
backtest.run_all(fundamentus.start_date(2010), a3)

a4 = ['WHRL3', 'WHRL4', 'ELET3', 'ETER3', 'CSAB3', 'ODPV3', 'CSAB4', 'SOND3', 'NAFG4', 'BGIP4']
backtest.run_all(fundamentus.start_date(2011), a4)

a5 = ['PATI4', 'MERC4', 'ETER3', 'GRND3', 'CGRA3', 'CGRA4', 'GEPA3', 'BBAS3', 'NAFG4', 'VALE3']
backtest.run_all(fundamentus.start_date(2012), a5)

a6 = ['PATI4', 'ETER3', 'BGIP3', 'BGIP4', 'BEES4', 'WHRL4', 'WHRL3', 'BRIV4', 'MERC4', 'ECPR4']
backtest.run_all(fundamentus.start_date(2013), a6)

a7 = ['BRIV4', 'PINE4', 'BBAS3', 'ENGI4', 'ENGI3', 'WHRL4', 'WHRL3', 'CRIV4', 'ELET3', 'ETER3']
backtest.run_all(fundamentus.start_date(2014), a7)

a8 = ['CRIV4', 'PINE4', 'SAPR4', 'BBAS3', 'SANB11', 'BMIN4', 'BRPR3', 'WHRL4', 'WHRL3', 'ETER3']
backtest.run_all(fundamentus.start_date(2015), a8)

a9 = ['BBSE3', 'CRIV4', 'FESA4', 'ITSA4', 'ITSA3', 'CGRA4', 'BBAS3', 'BRIV4', 'CGRA3', 'EZTC3']
backtest.run_all(fundamentus.start_date(2016), a9)

a10 = ['CRIV4', 'BRIV4', 'ITSA4', 'FESA4', 'CGRA3', 'CGRA4', 'AFLT3', 'BMEB4', 'MERC4', 'ENGI3']
backtest.run_all(fundamentus.start_date(2017), a10)

a11 = ['CRIV4', 'BRIV4', 'CSAB4', 'HGTX3', 'CSAB3', 'CGRA4', 'CGRA3', 'AFLT3', 'UNIP3', 'BMEB4']
backtest.run_all(fundamentus.start_date(2018), a11)

a12 = ['BRIV4', 'CRIV4', 'ITSA4', 'ITSA3', 'BBSE3', 'ITUB3', 'PTNT4', 'BEES3', 'BEES4', 'BMEB4']
backtest.run_all(fundamentus.start_date(2019), a12)



##########################################
## Décio Bazin (DY Valuation Histórico) ##
##########################################
a1 = ['CSAB3', 'CSAB4', 'SULT3', 'SULT4', 'TRPL3', 'TRPL4', 'VIVT3', 'VIVT4', 'GRND3', 'SANB4']
backtest.run_all(fundamentus.start_date(2008), a1)

a2 = ['GRND3', 'FESA4', 'LREN3', 'PATI4', 'POSI3', 'ETER3', 'SOND3', 'IGTA3', 'TKNO4', 'POMO3']
backtest.run_all(fundamentus.start_date(2009), a2)

a3 = ['CTSA4', 'JHSF3', 'PEAB4', 'PEAB3', 'WHRL4', 'WHRL3', 'CRIV4', 'CTSA3', 'BGIP4', 'EKTR4']
backtest.run_all(fundamentus.start_date(2010), a3)

a4 = ['WHRL3', 'WHRL4', 'ODPV3', 'SOND3', 'ELET3', 'BGIP4', 'PATI4', 'ETER3', 'CSAB3', 'CSAB4']
backtest.run_all(fundamentus.start_date(2011), a4)

a5 = ['PATI4', 'GRND3', 'MERC4', 'ETER3', 'CGRA3', 'CGRA4', 'BGIP4', 'BGIP3', 'NAFG4', 'BBAS3']
backtest.run_all(fundamentus.start_date(2012), a5)

a6 = ['PATI4', 'ETER3', 'BGIP3', 'BGIP4', 'BEES4', 'WHRL4', 'WHRL3', 'GRND3', 'CMIG3', 'BRIV4']
backtest.run_all(fundamentus.start_date(2013), a6)

a7 = ['BRIV4', 'PINE4', 'BBAS3', 'GUAR3', 'WHRL4', 'ELET3', 'WHRL3', 'ENGI4', 'ENGI3', 'CRIV4']
backtest.run_all(fundamentus.start_date(2014), a7)

a8 = ['CRIV4', 'PINE4', 'SAPR4', 'BBAS3', 'BEES4', 'BEES3', 'DOHL4', 'WHRL4', 'WHRL3', 'BMEB4']
backtest.run_all(fundamentus.start_date(2015), a8)

a9 = ['BBSE3', 'CRIV4', 'ITSA4', 'BRIV4', 'ITSA3', 'FESA4', 'BBAS3', 'CGRA4', 'CGRA3', 'EZTC3']
backtest.run_all(fundamentus.start_date(2016), a9)

a10 = ['CRIV4', 'BRIV4', 'ITSA4', 'FESA4', 'CGRA4', 'CGRA3', 'BMEB4', 'AFLT3', 'MERC4', 'LCAM3']
backtest.run_all(fundamentus.start_date(2017), a10)

a11 = ['CRIV4', 'BRIV4', 'HGTX3', 'CGRA4', 'CGRA3', 'CSAB4', 'CSAB3', 'BMEB4', 'AFLT3', 'TRIS3']
backtest.run_all(fundamentus.start_date(2018), a11)

a12 = ['CRIV4', 'BRIV4', 'ITSA4', 'ITSA3', 'ITUB3', 'BBSE3', 'BMEB4', 'PTNT4', 'TRIS3', 'GRND3']
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



#############################
#### Piotrotski Advanced ####
#############################
a1 = ['BMIN4', 'BMIN3', 'BAZA3', 'SAPR4', 'CRIV4', 'CRIV3', 'ETER3', 'JBSS3', 'MERC4', 'ITSA4']
backtest.run_all(fundamentus.start_date(2008), a1)

a2 = ['BBRK3', 'TGMA3', 'MGEL4', 'HGTX3', 'FRIO3', 'SCAR3', 'EKTR4', 'GUAR3', 'EKTR3', 'MDIA3']
backtest.run_all(fundamentus.start_date(2009), a2)

a3 = ['KLBN4', 'KLBN3', 'ELEK4', 'TGMA3', 'ELEK3', 'RANI3', 'RANI4', 'COCE5', 'COCE3', 'BBRK3']
backtest.run_all(fundamentus.start_date(2010), a3)

a4 = ['BAZA3', 'MYPK3', 'CLSC3', 'KEPL3', 'SPRI6', 'SPRI5', 'SPRI3', 'RANI4', 'SMTO3', 'RANI3']
backtest.run_all(fundamentus.start_date(2011), a4)

a5 = ['TOTS3', 'CESP3', 'CESP6', 'CESP5', 'KEPL3', 'SAPR4', 'UNIP6', 'BAZA3', 'UNIP3', 'UNIP5']
backtest.run_all(fundamentus.start_date(2012), a5)

a6 = ['KEPL3', 'DTEX3', 'VVAR3', 'WEGE3', 'GUAR3', 'TRIS3', 'SHUL4', 'SAPR4', 'CESP3', 'CESP5']
backtest.run_all(fundamentus.start_date(2013), a6)

a7 = ['BRFS3', 'CESP3', 'CESP6', 'CESP5', 'PTNT4', 'ROMI3', 'VVAR3', 'RAPT3', 'RAPT4', 'NAFG4']
backtest.run_all(fundamentus.start_date(2014), a7)

a8 = ['CARD3', 'FLRY3', 'MULT3', 'ENEV3', 'FRAS3', 'SULA11', 'TAEE11', 'BNBR3', 'PEAB4', 'UGPA3']
backtest.run_all(fundamentus.start_date(2015), a8)

a9 = ['CARD3', 'ENEV3', 'FLRY3', 'CSAN3', 'RADL3', 'GEPA4', 'VULC3', 'FRIO3', 'BRGE12', 'ENGI3']
backtest.run_all(fundamentus.start_date(2016), a9)

a10 = ['VULC3', 'TEND3', 'MTSA4', 'MDIA3', 'CARD3', 'NAFG4', 'ENEV3', 'NAFG3', 'QUAL3', 'SEER3']
backtest.run_all(fundamentus.start_date(2017), a10)

a11 = ['TEND3', 'LAME3', 'ENEV3', 'LAME4', 'MTSA4', 'NAFG3', 'YDUQ3', 'IGTA3', 'RAPT3', 'RAPT4']
backtest.run_all(fundamentus.start_date(2018), a11)

a12 = ['RAPT3', 'RAPT4', 'B3SA3', 'CPLE3', 'CPLE6', 'EVEN3', 'TIMP3', 'TUPY3', 'POMO3', 'EALT3']
backtest.run_all(fundamentus.start_date(2019), a12)


##########################################
#### Piotrotski Graham (> Piotrotski) ####
##########################################
a1 = ['MERC4', 'SAPR4', 'CRIV4', 'SBSP3', 'CSMG3', 'MGEL4', 'CRIV3', 'TUPY3', 'MGEL3', 'TKNO4']
backtest.run_all(fundamentus.start_date(2008), a1)

a2 = ['ELET6', 'ELET3', 'BBRK3', 'COCE3', 'COCE6', 'BBDC3', 'COCE5', 'ALPA3', 'ALPA4', 'BBDC4']
backtest.run_all(fundamentus.start_date(2009), a2)

a3 = ['BAZA3', 'BRFS3', 'ELEK4', 'TGMA3', 'ELEK3', 'KLBN4', 'KLBN3', 'RANI3', 'RANI4', 'MYPK3']
backtest.run_all(fundamentus.start_date(2010), a3)

a4 = ['CEDO4', 'CEDO3', 'CLSC3', 'EKTR4', 'VALE3', 'SMTO3', 'EKTR3', 'CESP3', 'CESP5', 'TOTS3']
backtest.run_all(fundamentus.start_date(2011), a4)

a5 = ['MTSA4', 'TOTS3', 'CTSA3', 'CTSA4', 'RDNI3', 'SAPR4', 'DTEX3', 'TRPL3', 'TRPL4', 'CYRE3']
backtest.run_all(fundamentus.start_date(2012), a5)

a6 = ['SHUL4', 'VVAR3', 'BRFS3', 'CLSC3', 'CLSC4', 'TRIS3', 'CMIG3', 'CMIG4', 'GOAU3', 'KEPL3']
backtest.run_all(fundamentus.start_date(2013), a6)

a7 = ['CESP3', 'CESP6', 'CESP5', 'MULT3', 'BNBR3', 'PTNT4', 'TAEE11', 'CEPE5', 'NAFG4', 'JBSS3']
backtest.run_all(fundamentus.start_date(2014), a7)

a8 = ['CARD3', 'GFSA3', 'BRGE11', 'BRGE3', 'BRGE8', 'SULA11', 'PSSA3', 'GEPA4', 'ENGI3', 'TIMP3']
backtest.run_all(fundamentus.start_date(2015), a8)

a9 = ['SEER3', 'CARD3', 'ALUP11', 'MDIA3', 'FRIO3', 'VULC3', 'SAPR4', 'MTSA4', 'SAPR3', 'UNIP6']
backtest.run_all(fundamentus.start_date(2016), a9)

a10 = ['TEND3', 'MTSA4', 'NAFG4', 'NAFG3', 'YDUQ3', 'SLCE3', 'IGTA3', 'ANIM3', 'VULC3', 'ENEV3']
backtest.run_all(fundamentus.start_date(2017), a10)

a11 = ['TEND3', 'VLID3', 'WIZS3', 'LAME3', 'LAME4', 'CESP5', 'CESP6', 'CPRE3', 'CESP3', 'TUPY3']
backtest.run_all(fundamentus.start_date(2018), a11)

a12 = ['CPLE3', 'CPLE6', 'BAZA3', 'CSMG3', 'RAPT3', 'RAPT4', 'WEGE3', 'KEPL3', 'EVEN3', 'BEEF3']
backtest.run_all(fundamentus.start_date(2019), a12)



##################################
#### Piotrotski Bazin (Mixed) ####
##################################
a1 = ['SANB4', 'SANB3', 'JBDU4', 'JBDU3', 'BMIN4', 'MTIG4', 'BMIN3', 'BAZA3', 'CTSA3', 'CTSA4']
backtest.run_all(fundamentus.start_date(2008), a1)

a2 = ['ETER3', 'IGTA3', 'TGMA3', 'CRIV4', 'ITSA4', 'SOND3', 'SAPR4', 'EKTR4', 'TKNO4', 'EKTR3']
backtest.run_all(fundamentus.start_date(2009), a2)

a3 = ['COCE3', 'PINE4', 'ELET3', 'EKTR4', 'CGRA3', 'CGAS3', 'CPFE3', 'CGRA4', 'BEES3', 'POMO4']
backtest.run_all(fundamentus.start_date(2010), a3)

a4 = ['BGIP4', 'POMO3', 'POMO4', 'CMIG3', 'CMIG4', 'GEPA4', 'HGTX3', 'TGMA3', 'PTNT4', 'NAFG4']
backtest.run_all(fundamentus.start_date(2011), a4)

a5 = ['EKTR4', 'VALE3', 'GEPA3', 'ITSA4', 'COCE3', 'CEDO3', 'ITSA3', 'DOHL4', 'CEDO4', 'GEPA4']
backtest.run_all(fundamentus.start_date(2012), a5)

a6 = ['CTSA4', 'CTSA3', 'CESP3', 'TRPL4', 'PINE4', 'CMIG3', 'CMIG4', 'TOTS3', 'BNBR3', 'TRPL3']
backtest.run_all(fundamentus.start_date(2013), a6)

a7 = ['WHRL4', 'WHRL3', 'ITSA4', 'ITSA3', 'ODPV3', 'GUAR3', 'CMIG4', 'CMIG3', 'CESP3', 'DOHL4']
backtest.run_all(fundamentus.start_date(2014), a7)

a8 = ['CESP3', 'BNBR3', 'BRPR3', 'TRPL4', 'RAPT3', 'BEES4', 'BDLL4', 'BEES3', 'PEAB4', 'MULT3']
backtest.run_all(fundamentus.start_date(2015), a8)

a9 = ['BMIN4', 'BMEB4', 'CSRN3', 'PEAB4', 'PEAB3', 'PINE4', 'FESA4', 'ENGI4', 'SAPR4', 'CGRA4']
backtest.run_all(fundamentus.start_date(2016), a9)

a10 = ['CRIV4', 'SAPR3', 'MTSA4', 'BMEB4', 'FESA4', 'CESP3', 'SAPR4', 'GRND3', 'FESA3', 'BBDC4']
backtest.run_all(fundamentus.start_date(2017), a10)

a11 = ['AFLT3', 'MTSA4', 'WHRL4', 'WHRL3', 'SLCE3', 'FESA4', 'FESA3', 'EKTR4', 'EKTR3', 'TRIS3']
backtest.run_all(fundamentus.start_date(2018), a11)

a12 = ['EALT3', 'EALT4', 'MTSA4', 'LUXM4', 'WIZS3', 'UNIP3', 'CESP5', 'TIMP3', 'YDUQ3', 'LEVE3']
backtest.run_all(fundamentus.start_date(2019), a12)



#######################################
#### Piotrotski Greenblatt (Mixed) ####
#######################################
a1 = ['EKTR4', 'CEBR5', 'CEBR6', 'CEBR3', 'TUPY3', 'WHRL3', 'WHRL4', 'BRAP4', 'GGBR4', 'BRAP3']
backtest.run_all(fundamentus.start_date(2008), a1)

a2 = ['CGAS3', 'CGAS5', 'CGRA3', 'CGRA4', 'TGMA3', 'COCE3', 'FESA4', 'EKTR4', 'COCE5', 'TUPY3']
backtest.run_all(fundamentus.start_date(2009), a2)

a3 = ['COCE5', 'COCE3', 'SOND5', 'CEPE6', 'SOND6', 'CEPE5', 'ETER3', 'CMIG3', 'TKNO4', 'EZTC3']
backtest.run_all(fundamentus.start_date(2010), a3)

a4 = ['EKTR4', 'COCE3', 'COCE5', 'CEDO4', 'CEDO3', 'EKTR3', 'PTBL3', 'CLSC3', 'ALPA3', 'ALPA4']
backtest.run_all(fundamentus.start_date(2011), a4)

a5 = ['COCE3', 'COCE5', 'CMIG3', 'CMIG4', 'TRPL3', 'AMAR3', 'TIMP3', 'PTBL3', 'EZTC3', 'TRPL4']
backtest.run_all(fundamentus.start_date(2012), a5)

a6 = ['WHRL3', 'WHRL4', 'CMIG3', 'CMIG4', 'SAPR4', 'SCAR3', 'VLID3', 'SHUL4', 'TRPL4', 'EUCA4']
backtest.run_all(fundamentus.start_date(2013), a6)

a7 = ['VVAR3', 'CMIG4', 'RAPT3', 'CMIG3', 'TAEE11', 'LREN3', 'RAPT4', 'CGRA3', 'ALUP11', 'DIRR3']
backtest.run_all(fundamentus.start_date(2014), a7)

a8 = ['PSSA3', 'CMIG4', 'SHUL4', 'CMIG3', 'LREN3', 'CGRA4', 'CGRA3', 'SCAR3', 'ETER3', 'CGAS3']
backtest.run_all(fundamentus.start_date(2015), a8)

a9 = ['SEER3', 'FESA4', 'COCE5', 'PTBL3', 'SAPR4', 'UNIP6', 'UNIP5', 'BRKM3', 'CGAS3', 'UNIP3']
backtest.run_all(fundamentus.start_date(2016), a9)

a10 = ['VULC3', 'SAPR3', 'QUAL3', 'SAPR4', 'BRKM3', 'BRKM5', 'LREN3', 'CARD3', 'TEND3', 'BAUH4']
backtest.run_all(fundamentus.start_date(2017), a10)

a11 = ['WIZS3', 'UNIP6', 'UNIP5', 'UNIP3', 'TEND3', 'VALE3', 'GEPA3', 'EGIE3', 'CGAS3', 'YDUQ3']
backtest.run_all(fundamentus.start_date(2018), a11)

a12 = ['QUAL3', 'SAPR4', 'SAPR11', 'CSNA3', 'SAPR3', 'VULC3', 'CAMB4', 'CGAS5', 'CGAS3', 'CPLE3']
backtest.run_all(fundamentus.start_date(2019), a12)



##############################################
#### Piotrotski Greenblatt (> Piotrotski) ####
##############################################
a1 = ['SAPR4', 'ETER3', 'SCAR3', 'MGEL4', 'TUPY3', 'IGTA3', 'EKTR4', 'MDIA3', 'CSMG3', 'PCAR4']
backtest.run_all(fundamentus.start_date(2008), a1)

a2 = ['BBRK3', 'LAME3', 'LAME4', 'MULT3', 'COCE3', 'COCE5', 'BTOW3', 'ELET6', 'ELET3', 'CGAS3']
backtest.run_all(fundamentus.start_date(2009), a2)

a3 = ['KLBN4', 'KLBN3', 'ELEK4', 'TGMA3', 'ELEK3', 'RANI3', 'RANI4', 'MYPK3', 'BRFS3', 'UNIP6']
backtest.run_all(fundamentus.start_date(2010), a3)

a4 = ['TCNO4', 'TCNO3', 'CESP3', 'EKTR4', 'CESP5', 'SMTO3', 'EKTR3', 'CESP6', 'CEDO4', 'CEDO3']
backtest.run_all(fundamentus.start_date(2011), a4)

a5 = ['MTSA4', 'TOTS3', 'UNIP6', 'CBEE3', 'SAPR4', 'DTEX3', 'RDNI3', 'CCRO3', 'EMBR3', 'CYRE3']
backtest.run_all(fundamentus.start_date(2012), a5)

a6 = ['SHUL4', 'VVAR3', 'BRFS3', 'TRIS3', 'WHRL3', 'WHRL4', 'RAPT3', 'ODPV3', 'KEPL3', 'RAPT4']
backtest.run_all(fundamentus.start_date(2013), a6)

a7 = ['CESP3', 'CESP6', 'MULT3', 'CARD3', 'JBSS3', 'HYPE3', 'TAEE11', 'TRPL4', 'BRFS3', 'PMAM3']
backtest.run_all(fundamentus.start_date(2014), a7)

a8 = ['CARD3', 'GFSA3', 'TIMP3', 'FLRY3', 'PSSA3', 'UGPA3', 'UCAS3', 'FRAS3', 'TPIS3', 'ENBR3']
backtest.run_all(fundamentus.start_date(2015), a8)

a9 = ['CARD3', 'SEER3', 'ALUP11', 'MDIA3', 'SAPR4', 'UNIP6', 'UNIP5', 'UNIP3', 'BRML3', 'CSMG3']
backtest.run_all(fundamentus.start_date(2016), a9)

a10 = ['VULC3', 'MTSA4', 'ANIM3', 'TEND3', 'YDUQ3', 'SLCE3', 'IGTA3', 'WHRL4', 'CSNA3', 'TIMP3']
backtest.run_all(fundamentus.start_date(2017), a10)

a11 = ['WIZS3', 'LAME3', 'LAME4', 'VLID3', 'TEND3', 'REDE3', 'FRAS3', 'USIM5', 'USIM3', 'TIMP3']
backtest.run_all(fundamentus.start_date(2018), a11)

a12 = ['RAPT3', 'RAPT4', 'WEGE3', 'CPLE3', 'CPLE6', 'CSMG3', 'POMO3', 'POMO4', 'EUCA4', 'CCPR3']
backtest.run_all(fundamentus.start_date(2019), a12)


