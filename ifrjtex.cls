% TCCcvor.cls
% Autor: Andrey Dione Ferreira - <andrey.ferreira@ifrj.edu.br>
% Dependência: abntex2 >= 1.7


% -----------------------------------------------
% Declaracao da classe ifrjtex como uma extensão da classe abntex2
% -----------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ifrjtex}[2015/11/20 v1.0]


\PassOptionsToClass{%
    % Opções da classe memoir
    12pt,                       % Tamanho da fonte
    openright,                  % Capítulos começam em página ímpar (insere página vazia caso preciso)
    a4paper,                    % Tamanho do papel
    sumario=tradicional,        % Seleciona o sumário tradicional
    % sumario=abnt-6027-2012,
    % Opções da classe abntex2
    chapter=TITLE,             % Títulos de capítulos convertidos em letras maiúsculas
    % section=TITLE,             % Títulos de seções convertidos em letras maiúsculas
    %subsection=TITLE,          % Títulos de subseções convertidos em letras maiúsculas
    %subsubsection=TITLE,       % Títulos de sub-subseções convertidos em letras maiúsculas
    % Opções do pacote babel
    brazil,                     % Idioma do documento
    }{abntex2}

% opção para projeto de pesquisa
\providecommand{\IFRJprojeto}{false}
\DeclareOption{projeto}{
	\renewcommand{\IFRJprojeto}{true}
% \PassOptionsToClass{projeto}{abntex2}
}


% opção para artigo
\providecommand{\IFRJartigo}{false}
\DeclareOption{artigo}{
	\renewcommand{\IFRJartigo}{true}
%\PassOptionsToClass{artigo}{abntex2}
}


% Repassa as demais opções à abntex2
\DeclareOption*{%
    \PassOptionsToClass{\CurrentOption}{abntex2}
}
\ProcessOptions\relax
\LoadClass{abntex2}

%----------------------------------------
% CONFIGURAÇÕES GERAIS%    
%----------------------------------------
% Configurações do pacote backref
%\renewcommand{\backrefpagesname}{Citado na(s) p\'agina(s):~}
% Texto padrão antes do número das páginas
%\renewcommand{\backref}{}
% Define os textos da citação
%\renewcommand*{\backrefalt}[4]{%
%    \ifcase #1
%        Nenhuma cita\c{c}\~ao no texto.
%    \or
%        Citado na p\'agina #2.
%    \else
%        Citado #1 vezes nas p\'aginas #2.
%    \fi
%}

% Define a numeração das equações de forma sequencial
\counterwithout{equation}{chapter}

% Redefine títulos
\renewcommand{\folhaderostoname}{Folha de Rosto}
\renewcommand{\folhadeaprovacaoname}{Folha de Aprova\c{c}\~ao}
\addto\captionsbrazil{%
    % Ajusta nomes padrões do babel
    \renewcommand{\listadesiglasname}{ LISTA DE ABREVIATURAS E SIGLAS}
    \renewcommand{\listadesimbolosname}{ LISTA DE SÍMBOLOS}
    \renewcommand{\listfigurename}{LISTA DE FIGURAS}
    \renewcommand{\listtablename}{LISTA DE TABELAS}
    \renewcommand{\bibname}{Referências}
    % \renewcommand{\contentsname}{\hfill\hfill SUMÁRIO\hfill\hfill}    
    % Ajusta nomes usados com a macro \autoref
    \renewcommand{\pageautorefname}{p\'agina}
    \renewcommand{\sectionautorefname}{Se{\c c}\~ao}
    \renewcommand{\subsectionautorefname}{Subse{\c c}\~ao}
    \renewcommand{\subsubsectionautorefname}{Subse{\c c}\~ao}
    \renewcommand{\paragraphautorefname}{Subse{\c c}\~ao}
}

%----------------------------------------
% LISTAS E NOVOS ELEMENTOS FLUTUANTES % 
%----------------------------------------

\newcommand{\listofquadrosname}{\hfill \hfill LISTA DE QUADROS\hfill \hfill}
\newcommand{\listofgraficosname}{\hfill \hfill LISTA DE GRÁFICOS\hfill \hfill}

% Cria a lista de quadros
\newcommand{\quadroname}{Quadro}
\newfloat[chapter]{quadro}{loq}{\quadroname}
\newlistof{listofquadros}{loq}{\listofquadrosname}
\newlistentry{quadro}{loq}{0}

\counterwithout{quadro}{chapter}
\renewcommand{\cftquadroname}{\quadroname\space}
\renewcommand*{\cftquadroaftersnum}{\hfill--\hfill}

% Cria a lista de gráficos
\newcommand{\graficoname}{Gr\'{a}fico}
\newfloat[chapter]{grafico}{logr}{\graficoname}
\newlistof{listofgraficos}{logr}{\listofgraficosname}
\newlistentry{grafico}{logr}{0}

\counterwithout{grafico}{chapter}
\renewcommand{\cftgraficoname}{\graficoname\space}
\renewcommand*{\cftgraficoaftersnum}{\hfill--\hfill}

%fonte no caption
\RequirePackage[font=small]{caption}
%----------------------------------------
% ESTILO DE ELEMENTOS % 
%----------------------------------------

%% Elementos pré-textuais
%\renewcommand{\pretextual}{%
%    \pagenumbering{roman} % Algarismos romanos
%    \aliaspagestyle{chapter}{plain}
%    \pagestyle{plain}
%    \aliaspagestyle{cleared}{empty}
%    \aliaspagestyle{part}{empty}
%}

%% Elementos textuais
\renewcommand{\textual}{%
 %   \pagenumbering{arabic} % Inicia a numeração em 1
    \ifthenelse{\equal{\ABNTEXisarticle}{true}}{%
        \pagestyle{plain}
    }
    {%
        \pagestyle{abntheadings}
        \aliaspagestyle{chapter}{abntchapfirst}
    }
    \nouppercaseheads
    \bookmarksetup{startatroot}
}

% Elementos pós-textuais
\renewcommand{\postextual}{%
    \phantompart
    \renewcommand{\indexname}{\'Indice Remissivo}
}

%----------------------------------------
% COMANDOS GERAIS %           
%----------------------------------------
% Automatiza o processo de aspas
\newcommand{\aspas}[1]{``{#1}''}

%----------------------------------------
% COMANDOS DE DADOS %            
%----------------------------------------
% Comandos de dados - departamento
\providecommand{\imprimirdepartamento}{}
\newcommand{\departamento}[1]{\renewcommand{\imprimirdepartamento}{#1}}

% Comandos de dados - programa
\providecommand{\imprimirprograma}{}
\newcommand{\programa}[1]{\renewcommand{\imprimirprograma}{#1}}

% Comandos de dados - subtítulo
\providecommand{\imprimirsubtitulo}{}
\newcommand{\subtitulo}[1]{\renewcommand{\imprimirsubtitulo}{#1}}

% Comandos de dados - instituição do orientador
\providecommand{\imprimirinstOrientador}{}
\newcommand{\instOrientador}[1]{\renewcommand{\imprimirinstOrientador}{#1}}

% Comandos de dados - instituição do coorientador
\providecommand{\imprimirinstCoorientador}{}
\newcommand{\instCoorientador}[1]{\renewcommand{\imprimirinstCoorientador}{#1}}

% % Criação do comando para área de concentração (folha de rosto)
\newcommand{\areaname}{\'Area de concentra\c{c}\~ao: }
\providecommand{\imprimirareaconcentracaoRotulo}{}
\providecommand{\imprimirareaconcentracao}{}
\newcommand{\areaconcentracao}[2][\areaname]%
  {\renewcommand{\imprimirareaconcentracaoRotulo}{#1}%
   \renewcommand{\imprimirareaconcentracao}{#2}}

% % Criação do comando para linha de pesquisa (folha de rosto)
% \newcommand{\imprimirlinhapesquisaRotulo}{Linha de pesquisa: }
% \providecommand{\imprimirlinhapesquisa}{}
% \newcommand{\linhapesquisa}[1]{\renewcommand{\imprimirlinhapesquisa}{#1}}

% Comandos de dados - titulação do orientador
\providecommand{\imprimirTitulacaoOrientador}{}
\newcommand{\titulacaoOrientador}[1]{\renewcommand{\imprimirTitulacaoOrientador}{#1}}

% Comandos de dados - titulação do coorientador
\providecommand{\imprimirTitulacaoCoorientador}{}
\newcommand{\titulacaoCoorientador}[1]{\renewcommand{\imprimirTitulacaoCoorientador}{#1}}

%----------------------------------------
% OBJETOS FLUTUANTES %
%----------------------------------------
% Comando que trata a fonte nos objetos flutuantes
\renewcommand{\fonte}[1]{%
    \begin{SingleSpacing}\par\end{SingleSpacing}
    \centering\small{{Fonte} -- #1}
}

% Comando que trata as notas nos objetos flutuantes
\renewcommand{\nota}[1]{%
    \begin{SingleSpacing}\par\end{SingleSpacing}
    \begin{tabular}{l p{.85\textwidth}}%
        Nota: & #1
    \end{tabular}
}

%----------------------------------------
% PARÁGRAFOS 
%----------------------------------------
% Tamanho da endentação do parágrafo
\setlength{\parindent}{1.3cm}

% Espaçamento entre um parágrafo e outro
\setlength{\parskip}{1.5pt}

%----------------------------------------
% REDEFINIÇÃO DE FONTES
%----------------------------------------
\renewcommand{\ABNTEXpartfont}{\Huge\bfseries}
\renewcommand{\ABNTEXpartfontsize}{\ABNTEXchapterfontsize}

\renewcommand{\ABNTEXchapterfont}{\sffamily}
\renewcommand{\ABNTEXchapterfontsize}{\huge}

\renewcommand{\ABNTEXsectionfont}{\sffamily}
\renewcommand{\ABNTEXsectionfontsize}{\Large}

\renewcommand{\ABNTEXsubsectionfont}{\sffamily}
\renewcommand{\ABNTEXsubsectionfontsize}{\large}

\renewcommand{\ABNTEXsubsubsectionfont}{\sffamily}
\renewcommand{\ABNTEXsubsubsectionfontsize}{\normalsize}

%----------------------------------------
% SUMÁRIO
%----------------------------------------
\RequirePackage{titletoc}
\setcounter{tocdepth}{4}
\setlength{\cftbeforechapterskip}{1.0em \@plus\p@}

\makeatletter
\settocpreprocessor{chapter}{%
	\let\tempf@rtoc\f@rtoc%
	\def\f@rtoc{%
		\texorpdfstring{\MakeTextUppercase{\tempf@rtoc}}{\tempf@rtoc}}%
}
\makeatother

\titlecontents{part}[0em]{\large\addvspace{2pc}\sffamily\bfseries}
{\thecontentslabel}
{}
{}

\titlecontents{section}[1.6cm]{\ABNTEXsectionfont\bfseries}
{\contentslabel{1.6cm}}
{}
{\titlerule*[1pc]{.}\contentspage}

\titlecontents{subsection}[1.6cm]{\normalfont\ABNTEXsubsectionfont}
{\contentslabel{1.6cm}}
{}
{\titlerule*[1pc]{.}\contentspage}

\titlecontents{subsubsection}[1.6cm]{\normalfont\ABNTEXsubsubsectionfont}
{\contentslabel{1.6cm}}
{}
{\titlerule*[1pc]{.}\contentspage}

\RequirePackage{tocloft}
\cftsetindents{chapter}{0cm}{1.6cm}

%----------------------------------------
% DEDICATÓRIA %                                 
%----------------------------------------
\renewenvironment{dedicatoria}[1][]
{%
    \ifthenelse{\equal{#1}{}}{%
        \PRIVATEbookmarkthis{\dedicatorianame}
    }{\pretextualchapter{#1}}
    \vspace*{\fill}
    \begin{flushright}
        \begin{minipage}{.5\textwidth}
            \begin{SingleSpacing}
                \setlength\parindent{0pt}
                \setlength\parskip{12pt}
}
{%
            \end{SingleSpacing}
        \end{minipage}
    \end{flushright}
}

%----------------------------------------
% EPIGRAFE %
%----------------------------------------
\renewenvironment{epigrafe}[1][]
{%
    \ifthenelse{\equal{#1}{}}{%
        \PRIVATEbookmarkthis{\epigraphname}
    }{\pretextualchapter{#1}}

    \vspace*{\fill}

    \begin{flushright}
        \begin{minipage}{.5\textwidth}
            \begin{SingleSpacing}
                \setlength\parindent{0pt}
                \setlength\parskip{12pt}
}
{%
            \end{SingleSpacing}
        \end{minipage}
    \end{flushright}
}

%----------------------------------------
% COMANDOS PARA FICHA CATALOGRÁFICA 
%----------------------------------------
% Define comando para tabela cutter
\providecommand{\imprimirTC}{}
\newcommand{\TabelaCutter}[1]{\renewcommand{\imprimirTC}{#1}}

\providecommand{\imprimirCDU}{}
\newcommand{\CDU}[1]{\renewcommand{\imprimirCDU}{#1}}

\providecommand{\imprimirautorultimo}{}
\newcommand{\sobrenomeAutor}[1]{\renewcommand{\imprimirautorultimo}{#1}}

\providecommand{\imprimirautornome}{}
\newcommand{\NomeAutor}[1]{\renewcommand{\imprimirautornome}{#1}}

\providecommand{\imprimirorientadornome}{}
\newcommand{\NomeOrientador}[1]{\renewcommand{\imprimirorientadornome}{#1}}

\providecommand{\imprimirorirultimo}{}
\newcommand{\sobrenomeOrientador}[1]{\renewcommand{\imprimirorirultimo}{#1}}

\providecommand{\imprimirorkeywords}{}
\newcommand{\keywords}[1]{\renewcommand{\imprimirorkeywords}{#1}}

%----------------------------------------
% CUSTOMIZANDO TABELAS      
%----------------------------------------
\RequirePackage{tabularx}
\setlength{\extrarowheight}{.5em}

%----------------------------------------
% HYPERLINKS
%----------------------------------------
\hypersetup{hidelinks}
\renewcommand{\url}[1]{\href{#1}{#1}}

%----------------------------------------
% REDEFINIÇÃO DE LABELS E OUTROS COMANDOS
%----------------------------------------
\def\equationautorefname~#1\null{Equa\c c\~ao~(#1)\null}

%----------------------------------------
% CAPA 
%----------------------------------------
\makeatletter
\renewcommand{\imprimircapa}{%
\begin{tikzpicture}[remember picture,overlay]
    \node[opacity=1,inner sep=0pt] at (current page.center){\includegraphics[width=1.01\paperwidth,height=1.01\paperheight]{figuras/capa.png}};
\end{tikzpicture}

\begin{flushright}
\vspace{-2.75cm}
	\begin{minipage}[t][0.9\paperheight][t]{0.75\textwidth}
	\centering
 \bfseries \large  \imprimirinstituicao \\[0.35cm] \textit{Campus} \imprimirlocal \\[0.35cm] \imprimirprograma \\

\vspace{\stretch{1}}
{\fontfamily{cmr}\scshape\textbf\imprimirautor}\\
\vspace{\stretch{1}}

{
\huge\bfseries
\imprimirtitulo
\abntex@ifnotempty{\imprimirsubtitulo}{%
		{\ABNTEXchapterfont\huge:\par}{\imprimirsubtitulo}
	}\par
}

\vspace{\stretch{2}}
	\large
	\fontfamily{cmr}\scshape{\imprimirlocal}\\
	\fontfamily{cmr}\scshape{\imprimirdata}
\end{minipage}
\end{flushright}
}
\makeatother

%----------------------------------------
% FOLHA DE ROSTO 
%----------------------------------------


\ifthenelse{\equal{\IFRJprojeto}{true}}{%projeto
\makeatletter
    \renewcommand{\imprimirfolhaderosto}{
    \begin{center}
        {\large\fontfamily{cmr}\scshape\bfseries {\imprimirautor}\par
        }
    \vspace*{\fill}
    {\Large
    \MakeUppercase{\linespread{1.5}\imprimirtitulo}\ifthenelse{\not\equal{\imprimirsubtitulo}{}}{: \par\MakeUppercase{\imprimirsubtitulo}
    }{}\par
    }
    \end{center}
    \vspace*{\fill}
    {%
    \hspace{\fill}
    \begin{minipage}{.47\textwidth}
    \SingleSpacing
    \small
    \imprimirpreambulo\\[0.5cm]
    \imprimirareaconcentracaoRotulo\imprimirareaconcentracao\par
    \end{minipage}%
    }%
    \vspace*{\fill}
    \begin{center}
        \normalfont{\imprimirlocal}\\
        \normalfont{\imprimirdata}
    \end{center}
    }
\makeatother
}{%else
\ifthenelse{\equal{\IFRJartigo}{true}}{%artigo
\makeatletter
    \renewcommand{\imprimirfolhaderosto}{
    \begin{center}
        {\large\fontfamily{cmr}\scshape\bfseries {\imprimirautor}\par
        \imprimirorientador\par
    \ifthenelse{\not\equal{\imprimircoorientador}{}}{ 
        \imprimircoorientador \par
    }{}
    }
    \vspace*{\fill}
    {\Large
    \MakeUppercase{\linespread{1.5}\imprimirtitulo}\ifthenelse{\not\equal{\imprimirsubtitulo}{}}{: \par\MakeUppercase{\imprimirsubtitulo}
    }{}\par
    }
    \end{center}
    \vspace*{\fill}
    {%
    \hspace{\fill}
    \begin{minipage}{.47\textwidth}
    \SingleSpacing
    \small
    \imprimirpreambulo\par
    \end{minipage}%
    }%
    \vspace*{\fill}
    \begin{center}
        \normalfont{\imprimirlocal}\\
        \normalfont{\imprimirdata}
    \end{center}
    }
\makeatother
}{%else - tcc,tese,dissertação
\makeatletter
    \renewcommand{\imprimirfolhaderosto}{
    \begin{center}
        {\large\fontfamily{cmr}\scshape\textbf{\imprimirautor}\par}
    \vspace*{\fill}
    {\Large 
    \MakeUppercase{\imprimirtitulo}\ifthenelse{\not\equal{\imprimirsubtitulo}{}}{: \par\MakeUppercase{ \imprimirsubtitulo}
    }{}\par
    }
    \end{center}
    \vspace*{\fill}
    {%
    \hspace{\fill}
    \begin{minipage}{.47\textwidth}
    \SingleSpacing
    \small
    \imprimirpreambulo\\[0.75cm]
    { \imprimirorientadorRotulo~
    \imprimirTitulacaoOrientador\,
    \imprimirorientador}\\[0.3cm]
    \ifthenelse{\not\equal{\imprimircoorientador}{}}{ \imprimircoorientadorRotulo~\imprimirTitulacaoCoorientador\,
        \imprimircoorientador
    }{}
    \end{minipage}%
    }%
    \vspace*{\fill}
    \begin{center}
        \normalfont{\imprimirlocal}\\
        \normalfont{\imprimirdata}
    \end{center}
    }
\makeatother
}
}


%----------------------------------------
% Diversos Pacotes
%----------------------------------------
\RequirePackage{amsfonts, amssymb, amsmath}             % Fonte e símbolos matemáticos
\RequirePackage{indentfirst}% Indentação do primeiro parágrafo de cada seção.
\RequirePackage{microtype}  % Para melhorias de justificação?
\RequirePackage{float}      % Utilizado para criação de floats
\RequirePackage{icomma}     % Uso de vírgulas em expressões matemáticas
\RequirePackage{ragged2e}

% Fontes
% \RequirePackage{utopia}
% \RequirePackage[T1]{fontenc} %Codificação da fonte em 8 bits

% \RequirePackage[default]{sourceserifpro}
% \RequirePackage[T1]{fontenc}

% \RequirePackage[default]{gfsbodoni}
% \RequirePackage[T1]{fontenc}


\RequirePackage{lmodern}
% \RequirePackage[T1]{fontenc}

% \RequirePackage{fourier}
% \RequirePackage[T1]{fontenc}

% \RequirePackage{CormorantGaramond}

\RequirePackage{MnSymbol}

%-------------------------------------------------
% Referências
\RequirePackage[style = abnt]{biblatex}
\DeclareFieldFormat{url}{\bibstring{urlfrom}\addcolon\addspace\normalfont\url{#1}}%

\setlength{\bibitemsep}{15pt}
\appto{\bibsetup}{%
    \renewcommand{\baselinestretch}{1.0}
}%

\renewcommand*{\mkbibnamefamily}[1]{#1}%
% Norma NBR10.520/2023 - Sobrenomes em minúsculas
% OUTRAS FORMATAÇÕES


\RequirePackage{color}
\RequirePackage[usenames,dvipsnames]{xcolor}
% Para cronogramas

\RequirePackage{enumitem}
\newlist{etapas}{enumerate}{1}% 
\setlist[etapas]{label={Etapa \arabic*} - ,wide=0pt, widest=99,leftmargin=\parindent}

\RequirePackage{pgfgantt}
\ganttset{
    % bar height=0.6,
    y unit title=0.7cm,
    y unit chart=0.7cm,
    title height=0.99,
    title/.append style={draw=none, fill=RoyalBlue!40!black},
    progress label text={\small \sffamily\pgfmathprintnumber[fixed, precision=1]{#1}\% completa},
    title label font=\sffamily\small\color{white},
    bar label font=\small\sffamily\color{black},
    % bar label node/.append style={align=left},
    bar/.style={fill=RoyalBlue!90!black}
}