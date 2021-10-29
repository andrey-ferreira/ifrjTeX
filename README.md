# Trabalhos do IFRJ em LaTeX

Este repositório contém uma extensão da classe ABNTeX2 que tem por objetivo adequar as apresentações de Trabalhos Acadêmicos no Instituto Federal de Educação, Ciência e Tecnologia do Rio de Janeiro as normas vigentes na instiuição.

O projeto fornece a classe `ifrjtex.cls` que, além das opções das classes `momoir` e `abnTeX2`, possui duas opções para customização dos elementos pré-textuais para artigos e para projetos de Pesquisa, sendo que o padrão da classe fornece esses elementos para TCC's, Dissertações e Teses.

# Como usar
Os elementos pré-textuais exigidos pela Resolução n° 48-2019 - Manual de apresentação de trabalhos acadêmicos são automaticamente construídos para TCC's, dissertações ou teses com base nos dados preenchidos pelos usuários no arquivo `main.tex`.

Para adaptar esses elementos para artigos ou projetos de pesquisa, o usuário pode usar as opções `artigo` ou `projeto` ao carregar a classe `ifrjtex`.
Por exemplo, usando `\documentclass[artigo]{ifrjtex}` a folha de rosto será customizada para artigos conforme orientado pela Resolução n° 48-2019.
