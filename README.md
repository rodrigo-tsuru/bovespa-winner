# Bovespa Winner

Este é um Sistema em Python que aplica as técnicas dos maiores investidores de ações.
Essas técnicas são aplicadas no Mercado Brasileiro de ações (Bovespa B3)

Depois da estratégia desejada ser aplicada, é construído um sistema de rankeamento onde mostra das "melhores ações" para as "piores ações" considerando a estratégia escolhida.

Os dados são capturados principalmente do site fundamentus (https://www.fundamentus.com.br/resultado.php) e também de diversas APIs disponíveis de forma gratuita.

No momento, foi aplicado estratégias dos seguintes investidores:
1. Benjamin Graham
2. Joel Greenblatt
3. Décio Bazin


# Como usar

Basta rodar um desses comandos, dependendo da estratégia que deseja-se aplicar.

Ao final de cada comando, é mostrado no terminal a tabela resultante e salvo no Ctrl+C o resultado no formato Markdown.
Para melhor visualizar o resultado, basta colar o resultado em algum editor de Markdown, como o site https://dillinger.io/

```py
python3 graham.py
```

```py
python3 bazin.py
```

```py
python3 greenblatt.py # Aplica tanto ROE e P/L quanto ROIC e EV/EBIT
python3 greenblatt.py "{ 'formula': 'ROE' }" # Aplica ROE e P/L
python3 greenblatt.py "{ 'formula': 'ROIC' }" # Aplica ROIC e EV/EBIT
```


# Estratégias

## Benjamin Graham

* Arquivo: graham.py

Aplica-se ensinamentos de Benjamin Graham em todas as ações da bovespa, produzindo um ranking com base na análise fundamentalista dos dados de todas as empresas.

Para a análise, são utilizados ensinamentos do livro "O Investidor Inteligente" de Benjamin Graham
Também é calcula o Valor Intrínseco (Preço Justo) definido por Benjamin Graham para cada ação.

Benjamin Graham foi o mentor dos melhores investidores do mundo, como o grandíssimo Warren Buffet, além do Irving Kahn e Walter Schloss.

No algoritmo, cada ação recebe uma nota que vai de 0 a 14, considerando se ela se adequou a cada uma dessas características abaixo estipuladas por Benjamin Graham.

- [x] 1.  Sobrevivência: Sobreviveu nos últimos 10 anos. https://www.estrategista.net/o-fracasso-de-benjamin-graham-na-bolsa-atual/
- [x] 2.  Estabilidade ds Lucros: Lucro > 0 nos últimos 10 anos. # https://www.estrategista.net/o-fracasso-de-benjamin-graham-na-bolsa-atual/
- [x] 3.  Crescimento dos Lucros: Lucros crescentes nos últimos 10 anos # https://www.estrategista.net/o-fracasso-de-benjamin-graham-na-bolsa-atual/
- [x] 4.  Crescimento dos Lucro Por Ação: LPA atual > 1.33 * LPA 10 anos atrás. (Calculado através da média dos 3 anos do começo e dos 3 anos do fim deste período) # http://seuguiadeinvestimentos.com.br/a-tecnica-de-investimento-de-benjamin-graham-ii/
- [x] 5.  Estabilidade dos Dividendos: Dividendos pagos nos últimos 10 anos. # http://seuguiadeinvestimentos.com.br/a-tecnica-de-investimento-de-benjamin-graham-ii/
- [x] 6.  Preço Justo > 1.5 * Preço de Mercado. Neste caso, Preço Justo é a raíz_quadrada_de(22.5 * VPA * LPA) (Criado por Benjamin Graham) # https://www.sunoresearch.com.br/artigos/valor-intrinseco/?utm_source=PR&utm_medium=artigo&utm_campaign=investing_05122019
- [x] 7.  P/L (Preço/Lucro) => Quanto menor, melhor (ideal, < 15 E >= 0) # http://seuguiadeinvestimentos.com.br/a-tecnica-de-investimento-de-benjamin-graham-ii/
- [x] 8.  P/VP (Preço/Valor Patrimonial) => Quanto menor, melhor (ideal, < 1.5 E >= 0) # http://seuguiadeinvestimentos.com.br/a-tecnica-de-investimento-de-benjamin-graham-ii/
- [x] 9.  Crescimento em 5 anos => Quanto maior, melhor (ideal, > 5%) # https://daxinvestimentos.com/analise-fundamentalista-mais-de-200-de-rentabilidade-em-2-anos/
- [x] 10. ROE (Return On Equity) => Quanto maior, melhor (ideal, superior a 20%) # https://daxinvestimentos.com/analise-fundamentalista-mais-de-200-de-rentabilidade-em-2-anos/
- [x] 11. Dividend Yield (Rendimento de Dividendo) => Quanto maior, melhor (ideal, > Taxa Selic (4.5%)) # https://foconomilhao.com/acoes-com-dividend-yield-maior-que-a-selic/
- [x] 12. Liquidez Corrente => Quanto maior, melhor (ideal > 1.5) # https://daxinvestimentos.com/analise-fundamentalista-mais-de-200-de-rentabilidade-em-2-anos/
- [x] 13. Dívida Bruta/Patrimônio => Quanto menor, melhor (ideal < 50%) # https://daxinvestimentos.com/analise-fundamentalista-mais-de-200-de-rentabilidade-em-2-anos/
- [x] 14. Patrimônio Líquido => Quanto maior, melhor (ideal > 2000000000)

Livro: https://www.amazon.com/Intelligent-Investor-Definitive-Investing-Essentials/dp/0060555661
Breve Explicação: https://www.bluechipinvest.com.br/educacional-det/benjamin-graham/7


## Joel Greenblatt

* Arquivo: greenblatt.py

Aplica-se ensinamentos de Joel Greenblatt em todas as ações da Bovespa, depois rankeia das ações que mais se adequaram para as que menos se adequaram.

Em sua fórmula mágica, Greenblatt utiliza os seguintes indicadores: ROE (indicador de Qualidade) e o P/L (indicador de Preço).
Através desses 2 indicadores ele monta dois rankings, um com as empresas de maior ROE (mais rentáveis) e outro com as ações de menor P/L (maior custo-benefício).
Feito os 2 rankings, é somado a posição de cada ação nos rankings.
As empresas de menor soma são aquelas escolhidas para montar a carteira pois seriam as ações mais baratas e mais rentáveis ao mesmo tempo.

Uma outra abordagem dessa fórmula é utilizar os indicadores: ROIC (indicador de Qualidade) EV/EBIT (indicador de Preço).
É seguido então a mesma estratégia de usar ROE+P/L, mas substituindo ROE por ROIC e P/L por EV/EBIT.

- [x] 1. maior ROE e menor P/L
- [x] 2. maior ROIC e menor EV/EBIT

Livro: https://www.amazon.com/Little-Book-That-Beats-Market/dp/0471733067
Breve Explicação: https://comoinvestir.thecap.com.br/joel-greenblatt-estrategia-investimentos/


## Décio Bazin

* Arquivo: bazin.py

Aplica-se ensinamentos de Décio Bazin em todas as ações da Bovespa, depois rankeia das ações que mais se adequaram para as que menos se adequaram.

Décio Bazin é autor do livro: "Faça Fortuna Com Ações", que é tido como literatura indicada até mesmo por Luis Barsi, o maior investidor na bolsa brasileira de todos os tempos.

No algoritmo, cada ação recebe uma nota que vai de 0 a 6, considerando se ela se adequou a cada uma dessas características abaixo estipuladas por Décio Bazin.

- [x] 1. Preço Justo > 1.5 * Preço de Mercado. Neste caso, Preço Justo é o Dividend Yield * 16.67 (Criado por Décio Bazin)
- [x] 2. Dividend Yield > 0.06 (6%)
- [x] 3. Pagamento constante de dividendos nos últimos 5 anos
- [x] 4. Pagamento crescente de dividendos nos últimos 5 anos
- [x] 5. Dívida Líquida/Patrimônio < 0.5 (50%)
- [x] 6. 0 < Payout < 1

Livro: https://www.amazon.com/Faca-Fortuna-com-Acoes-Antes/dp/8585454164
Breve Explicação: https://www.sunoresearch.com.br/artigos/entenda-estrategia-de-decio-bazin/



## Score

* Arquivo: score.py

Para compor esse Score, é aplicado um mix de estratégias.

Além dos pontos defendidos por Benjamin Graham (Veja os 14 pontos da seção de Benjamin Graham), é também avaliado o ROIC, Margem Líquida, Endividamento, PSR, EV/EBITDA e Peg Ratio. Aplicando, assim, ensinamentos de Kenneth Fisher e de outros grandes investidores também.

- [x] 1. ROIC (Return on Invested Capital) => Quanto maior, melhor (ideal, > 10%) # https://www.sunoresearch.com.br/artigos/o-investidor-inteligente-entenda-a-obra-de-benjamin-graham/
- [x] 2. PSR (Price Sales Ratio) => Quanto menor, melhor (ideal, < 0.75) # https://www.moneyshow.com/articles/tptp072513-46306/
- [x] 3. Margem Líquida => Quanto maior melhor (ideal, > 10%) # https://www.youtube.com/watch?v=7tB_ym4Cabc E https://www.sunoresearch.com.br/artigos/5-indicadores-para-avaliar-solidez-de-uma-empresa/
- [x] 4. Dívida Líquida/EBIT => Quanto menor melhor (ideal, <= 3) # https://www.sunoresearch.com.br/artigos/5-indicadores-para-avaliar-solidez-de-uma-empresa/
- [x] 5. Dívida Líquida/Patrimônio => Quanto menor, melhor (ideal < 50%) # https://www.sunoresearch.com.br/artigos/5-indicadores-para-avaliar-solidez-de-uma-empresa/
- [x] 6. EV/EBITDA (Enterprise Value / EBITDA) => Quanto menor melhor (ideal, < 10) # https://www.investopedia.com/ask/answers/072715/what-considered-healthy-evebitda.asp
- [x] 7. Peg Ratio (P/L / CAGRLucros5Anos) => Quanto menor melhor (ideal <= 1) # https://bugg.com.br/2018/01/24/buggpedia-o-que-e-o-peg-ratio/



# Contato
* victorcorcos@gmail.com
* victor.costa@oxeanbits.com
