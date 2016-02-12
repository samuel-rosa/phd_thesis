%%=============================================================================================================
%% UFRuralRJ.cls
%% Classe LaTeX2e para formatação de documentos acadêmicos da Universidade Federal Rural do Rio de Janeiro 
%% (UFRuralRJ)
%%
%% Este programa é software livre. Você pode redistribuí-lo e/ou modificá-lo sob os termos da GNU General 
%% Public License versão 2 conforme publicada pela Free Software Foundation.
%%
%% Este programa é distribuído na esperança que será útil, mas SEM QUALQUER GARANTIA, sem mesmo a garantia
%% implícita de COMERCIALIZAÇÃO ou ADEQUAÇÃO PARA UM PROPÓSITO PARTICULAR. Veja a GNU General Public License
%% para mais detalhes (http://www.gnu.org/licenses/gpl.html).
%%
%% Você deve ter recebido uma cópia da Licença Pública Geral GNU, sob o título 'LICENCE', junto com este
%% programa. Caso contrário, escreva para a Free Software Foundation, Inc., 59 Temple Place, Suite 330, 
%% Boston, MA 02111-1307 USA.
%%
%% Créditos:
%%
%% Esta classe é uma adaptação livre da class mdtufsm.cls, contida no pacote 'mdtufsm-ppgi', em sua versão 
%% 1.4 (https://code.google.com/p/mdtufsm-ppgi/), desenvolvido pela Informática da Universidade Federal de
%% Santa Maria (http://www.inf.ufsm.br). O último é uma adaptação livre da class 'iiufrgs.cls', contida 
%% pacote 'iiufrgs-4.3.1', desenvolvido pelo UFRGS TeX Users Group (http://www.inf.ufrgs.br/utug).
%% As adaptações para atender às normas da UFRuralRJ foram realizadas por:
%% - Alessandro Samuel-Rosa (Curso de Pós-Graduação em Agronomia -- Ciência do Solo): 2012-Atual
%% - Alessandro Bandeira Duarte (Departamento de Filosofia): 2015-Atual
%%
%% Informação:
%%
%% A formatação de documentos acadêmicos segue as recomendações contidas na terceira edição do Manual de
%% instruções para organização e apresentação de dissertações e teses na UFRRJ, Seropédica: UFRRJ, 25p, 2006,
%% disponível em http://www.ufrrj.br/portal/modulo/dppg/Formularios_normas/manual_teses.pdf
%% 
%%=============================================================================================================

%%==============================================================================
%% Identificação
%%==============================================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{UFRuralRJ}[09/02/2016 v.0.7 Formatação de documentos acadêmicos da UFRuralRJ]

%%==============================================================================
%% Declaração de opções da classe
%%==============================================================================

%% Tese de doutorado
\DeclareOption{tese}{
  \AtEndOfClass{
    \newcommand{\titlepagespecificinfo}{\tesespecificinfo}
    \def\grau{\tesegrau}
    \def\doctypename{\tesename}
    \def\doctypearticle{a}
    % \def\doctypenameCIP{Tese (Doutorado)}
  }
}

%% Dissertação de mestrado
\DeclareOption{diss}{
  \AtEndOfClass{
    \newcommand{\titlepagespecificinfo}{\dissspecificinfo}
    \def\grau{\dissgrau}
    \def\doctypename{\dissname}
    \def\doctypearticle{a}
    % \def\doctypenameCIP{Disserta{\c{c}}{\~a}o (Mestrado)}
  }
}

%% Monografia de especialização
\DeclareOption{espec}{
  \AtEndOfClass{
    \newcommand{\titlepagespecificinfo}{
      Monografia submetida como requisito parcial para obten{\c{c}}{\~a}o do 
      %grau de \textbf{\@grau}, \@altCurso, {\'A}rea de Concentra\c{c}{\~a}o em
      grau de \textbf{\@grau}, \@curso, {\'A}rea de Concentra\c{c}{\~a}o em
      
      \@area.
    }
    \def\doctypename{Monografia de Especializa{\c{c}}{\~a}o}
    \def\doctypearticle{a}
    \def\doctypenameCIP{Monografia (Especializa{\c{c}}{\~a}o)}
  }
}

%% Trabalho de graduação
\DeclareOption{tg}{
  \AtEndOfClass{
    \newcommand{\titlepagespecificinfo}{
      %Trabalho de Gradua{\c{c}}{\~a}o apresentado ao \@altCurso{} da \ufrrj{}
      Trabalho de Gradua{\c{c}}{\~a}o apresentado ao \@curso{} da \ufrrjlongo{}
      (UFRRJ, RJ), como requisito parcial para a obten{\c{c}}{\~a}o do grau de
      %\\[6pt]
      \textbf{\@grau}
    }
    \def\doctypename{Trabalho de Gradua{\c{c}}{\~a}o}
    \def\doctypenameIngles{Undergraduate Final Work}
    \def\doctypearticle{o}
	  \def\doctypenameCIP{Monografia (Gradua{\c{c}}{\~a}o)}
  }

}

\DeclareOption{english}{
  \@englishtrue\OptionNotUsed}\newif\if@english\@englishfalse

%% Usar cabeçalho com título curto do capítulo
\DeclareOption{header}{
  \@headertrue\OptionNotUsed}\newif\if@header\@headerfalse

%% Usar margens otimizadas
\DeclareOption{newmargins}{
  \@newmarginstrue\OptionNotUsed}\newif\if@newmargins\@newmarginsfalse

%% TODO: incluir opção 'twoside'
\DeclareOption{oneside}{\AtEndOfClass{\@twosidefalse}\OptionNotUsed}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax

%%==============================================================================
%% Comandos e definições gerais
%%==============================================================================

\def\ufrrjlongo{Universidade Federal Rural do Rio de Janeiro}
\def\ufrrjcurto{UFRRJ}
\newcommand{\titulo}[1]{\gdef\@titulo{#1}}
\newcommand{\curso}[1]{\gdef\@curso{#1}}
% \newcommand{\altCurso}[1]{\gdef\@altCurso{#1}} %% Obsoleto
\newcommand{\area}[1]{\gdef\@area{#1}}
\newcommand{\instituto}[1]{\gdef\@instituto{#1}}
% \newcommand{\grau}[1]{\gdef\@grau{#1}} %% Obsoleto
% \newcommand{\nivel}[1]{\gdef\@nivel{#1}} %% Obsoleto
\newcommand{\trabalhoNumero}[1] {\gdef\@trabalhoNumero{#1}}
\newcommand{\local}[3]{\gdef\@city{#1}\gdef\@state{#2}\gdef\@country{#3}}

%% Institutos
\def\IA{Instituto de Agronomia}
\def\IB{Instituto de Ciências Biológicas e da Saúde}
\def\ICE{Instituto de Ciências Exatas}
\def\ICHS{Instituto de Ciências Humanas e Sociais}
\def\IE{Instituto de Educação}
\def\IF{Instituto de Florestas}
\def\IM{Instituto Multidisciplinar}
\def\IT{Instituto de Tecnologia}
\def\IV{Instituto de Veterinária}
\def\IZ{Instituto de Zootecnia}

%% Definição do tamanho da fonte
\newcommand\LargeA{\@setfontsize\LargeA{24pt}{24.1pt}}
\newcommand\LargeB{\@setfontsize\LargeB{20pt}{20.1pt}}
\newcommand\LargeC{\@setfontsize\LargeC{18pt}{18.1pt}}
\newcommand\LargeD{\@setfontsize\LargeD{16pt}{16.1pt}}
\newcommand\LargeE{\@setfontsize\LargeE{14pt}{14.1pt}}
\newcommand\LargeF{\@setfontsize\LargeF{12pt}{12.1pt}}

%% Definições de gênero
\newif\ifautora %% 'autora' em vez de 'autor'
% \newif\iforientadora %% 'orientadora' em vez de 'orientador'
% \newif\ifcoorientadora %% 'co-orientadora' em vez de 'co-orientador'. Obsoleto

%% Definições de capítulo
\newif\ifchap\chaptrue %% capítulo
\newif\ifappendix      %% apêndice
\newif\ifannex         %% anexo

\newif\if@hyperLoaded\@hyperLoadedfalse
\AtBeginDocument{\@ifpackageloaded{hyperref}{\@hyperLoadedtrue}{}}

\newcommand{\nocontentsline}[3]{}
\newcommand{\tocless}[2]{
  \bgroup\let\addcontentsline=\nocontentsline#1{#2}\egroup}

%%==============================================================================
%% Herança da classe 'report' e inclusão de pacotes e arquivos necessários
%%==============================================================================

\LoadClass[12pt,a4paper,oneside]{report}
\RequirePackage[english,brazilian]{babel}
\input{brazilian.babel} %% definições para textos em português
\input{english.babel} %% definições para textos em inglês
\if@english
  \selectlanguage{english}
  \AtBeginDocument{\selectlanguage{english}}
\fi
\RequirePackage{lastpage}
\RequirePackage{indentfirst} 
% \RequirePackage{natbib}
\RequirePackage{eso-pic} % para importar arquivos .pdf (catalogação \includeCIP{})
\RequirePackage{color, xcolor}
\RequirePackage{fix-cm} % para funcionar corretamente o tamanho das fontes da capa

%%=============================================================================
%% Margens do texto
%%=============================================================================

\if@newmargins
  %% Definições gerais
  \newlength{\mdt@topmargin}\setlength{\mdt@topmargin}{25mm}
  \newlength{\mdt@bottommargin}\setlength{\mdt@bottommargin}{25mm}
  \newlength{\mdt@pagenummargin}\setlength{\mdt@pagenummargin}{15mm}
  \newlength{\mdt@sidemargin}\setlength{\mdt@sidemargin}{20mm}
  \setlength{\marginparwidth}{25mm}
  %% Ajuste das medidas verticais
  \setlength{\topmargin}{\mdt@pagenummargin}
  \addtolength{\topmargin}{-1em}
  \addtolength{\topmargin}{-1in}
  \setlength{\headheight}{1em}
  \setlength{\headsep}{\mdt@topmargin}
  \addtolength{\headsep}{-\mdt@pagenummargin}
  \setlength{\textheight}{\paperheight}
  \addtolength{\textheight}{-\mdt@topmargin}
  \addtolength{\textheight}{-\mdt@bottommargin}
  \setlength{\footskip}{\mdt@bottommargin}
  \addtolength{\footskip}{-\mdt@pagenummargin}
  %% Ajuste das medidas horizontais
  \setlength{\oddsidemargin}{\mdt@sidemargin}
  \addtolength{\oddsidemargin}{-1in}
  \setlength{\evensidemargin}{\oddsidemargin}
  \setlength{\textwidth}{\paperwidth}
  \addtolength{\textwidth}{-2\mdt@sidemargin}
  \setlength{\marginparsep}{\mdt@sidemargin}
  \addtolength{\marginparsep}{-\marginparwidth}
  \setlength{\marginparsep}{.5\marginparsep}
\else
  %% Definições gerais
  \newlength{\mdt@topmargin}\setlength{\mdt@topmargin}{30mm}
  \newlength{\mdt@bottommargin}\setlength{\mdt@bottommargin}{20mm}
  \newlength{\mdt@sidemargin}\setlength{\mdt@sidemargin}{30mm}
  \newlength{\mdt@pagenummargin}\setlength{\mdt@pagenummargin}{15mm}
  \setlength{\marginparwidth}{25mm}
  \newlength{\mdt@insidemargin}\setlength{\mdt@insidemargin}{30mm}
  \newlength{\mdt@outsidemargin}\setlength{\mdt@outsidemargin}{20mm}
  %% Ajuste das medidas verticais
  \setlength{\topmargin}{\mdt@pagenummargin}
  \addtolength{\topmargin}{-1em}
  \addtolength{\topmargin}{-1in}
  \setlength{\headheight}{1em}
  \setlength{\headsep}{\mdt@topmargin}
  \addtolength{\headsep}{-\mdt@pagenummargin}
  \setlength{\textheight}{\paperheight}
  \addtolength{\textheight}{-\mdt@topmargin}
  \addtolength{\textheight}{-\mdt@bottommargin}
  \setlength{\footskip}{\mdt@bottommargin}
  \addtolength{\footskip}{-\mdt@pagenummargin}
  %% Ajuste das medidas horizontais
  \setlength{\oddsidemargin}{\mdt@insidemargin}
  \addtolength{\oddsidemargin}{-1in}
  \setlength{\evensidemargin}{\mdt@outsidemargin}
  \setlength{\textwidth}{\paperwidth}
  \addtolength{\textwidth}{-\mdt@insidemargin}
  \addtolength{\textwidth}{-\mdt@outsidemargin}
  \setlength{\marginparsep}{\mdt@sidemargin}
  \addtolength{\marginparsep}{-\marginparwidth}
  \setlength{\marginparsep}{.5\marginparsep}
\fi

% %% Original
% \newlength{\mdt@topmargin}\setlength{\mdt@topmargin}{30mm}
% \newlength{\mdt@bottommargin}\setlength{\mdt@bottommargin}{20mm}
% % \newlength{\mdt@pagenummargin}\setlength{\mdt@pagenummargin}{20mm}
% \newlength{\mdt@sidemargin}\setlength{\mdt@sidemargin}{30mm}
% \setlength{\marginparwidth}{25mm}
% 
% %% MDT (margem interna diferente da margem externa)
% \newlength{\mdt@insidemargin}\setlength{\mdt@insidemargin}{30mm}
% \newlength{\mdt@outsidemargin}\setlength{\mdt@outsidemargin}{20mm}
% 
% %% Otimizada
% %% Margens menores, todas elas de 25 mm. O número da página fica a
% %% 15 mm da borda da página.
% % \newlength{\mdt@topmargin}\setlength{\mdt@topmargin}{25mm}
% % \newlength{\mdt@bottommargin}\setlength{\mdt@bottommargin}{25mm}
% \newlength{\mdt@pagenummargin}\setlength{\mdt@pagenummargin}{15mm}
% % \newlength{\mdt@sidemargin}\setlength{\mdt@sidemargin}{25mm}
% 
% 
% %% Ajuste das medidas verticais
% \setlength{\topmargin}{\mdt@pagenummargin}
% \addtolength{\topmargin}{-1em} % altura do número da página (quando no topo)
% \addtolength{\topmargin}{-1in}
% \setlength{\headheight}{1em}
% \setlength{\headsep}{\mdt@topmargin}
% \addtolength{\headsep}{-\mdt@pagenummargin}
% \setlength{\textheight}{\paperheight}
% \addtolength{\textheight}{-\mdt@topmargin}
% \addtolength{\textheight}{-\mdt@bottommargin}
% \setlength{\footskip}{\mdt@bottommargin}
% \addtolength{\footskip}{-\mdt@pagenummargin}
% 
% %% Ajuste das medidas horizontais
% % \setlength{\oddsidemargin}{\mdt@sidemargin}
% \setlength{\oddsidemargin}{\mdt@insidemargin} %% MDT
% \addtolength{\oddsidemargin}{-1in}
% % \setlength{\evensidemargin}{\oddsidemargin}
% \setlength{\evensidemargin}{\mdt@outsidemargin} %% MDT
% \setlength{\textwidth}{\paperwidth}
% % \addtolength{\textwidth}{-2\mdt@sidemargin}
% \addtolength{\textwidth}{-\mdt@insidemargin} %% MDT
% \addtolength{\textwidth}{-\mdt@outsidemargin} %% MDT
% \setlength{\marginparsep}{\mdt@sidemargin}
% \addtolength{\marginparsep}{-\marginparwidth}
% \setlength{\marginparsep}{.5\marginparsep}

%indentar em 1,25 o primeiro parágrafo
\setlength{\parindent}{1.25cm}%

%%==============================================================================
%% Numeração das páginas
%%==============================================================================
%% O número da página é colocado no canto superior direito porque a margem 
%% superior, que é de 30 mm, possui mais espaço para acomodar o número da página
%% do que a margem inferior, que é de 20 mm.

%% Canto direito superior
% \def\ps@UFRuralRJ{
%   \let\@oddfoot\@empty
%   \let\@evenfoot\@empty
%   \def\@evenhead{{\small\thepage}}
%   \def\@oddhead{\hspace*{\fill}{\small\thepage}}
% }

%% Canto direito inferior
\def\ps@UFRuralRJ{
  \def\@oddfoot{\hspace*{\fill}{\small\thepage}}
  \def\@evenfoot{{\small\thepage}}
  \if@header
    \def\@evenhead{\hrulefill~\scriptsize\@chaptertitle}
    \def\@oddhead{\hrulefill~\scriptsize\@chaptertitle}
  \else
    \let\@evenhead\@empty
    \let\@oddhead\@empty
  \fi
}

\pagestyle{empty}
\let\ps@plain\ps@empty

%%=============================================================================
%% Definição de autor(es), orientador, co-orientador e banca examinadora
%%=============================================================================

\newcounter{ii@authorcount}
\renewcommand{\author}[2]{
  \addtocounter{ii@authorcount}{1}
  \expandafter\gdef\csname @author\alph{ii@authorcount}last\endcsname{#1}
  \expandafter\gdef\csname @author\alph{ii@authorcount}first\endcsname{#2}
  \expandafter\gdef\csname @author\alph{ii@authorcount}\endcsname{#2 #1}
}

% Definição da formatação das informações do(a) orientador(a)
\DeclareRobustCommand{\advisor}[5][]{
  \gdef\@advisorlast{#3}
  \gdef\@advisorfirst{#4}
  \gdef\@advisor{#4 #3}
  \gdef\@advisorprof{#1}
  \gdef\@advisorcommittee{#4 #3. #2 #5}
  \gdef\@advisorwithouttitle{#4 #3}
}

% Definição da formatação das informações do(s) co-orientador(es)
\newcounter{ii@coadvisorcount}
\DeclareRobustCommand{\coadvisor}[4][]{
  \addtocounter{ii@coadvisorcount}{1}
  \expandafter
  \gdef\csname @coadvisor\alph{ii@coadvisorcount}last\endcsname{#3}
  \expandafter
  \gdef\csname @coadvisor\alph{ii@coadvisorcount}first\endcsname{#4}
  \expandafter
  \gdef\csname @coadvisor\alph{ii@coadvisorcount}\endcsname{#4 #3}
  %\gdef\@coadvisorlast{#3} %% Obsoleto
  %\gdef\@coadvisorfirst{#4} %% Obsoleto
  %\gdef\@coadvisor{#1~#2~#4 #3} %% Obsoleto
  \gdef\@coadvisorprof{#1}
  \gdef\@coadvisorcommittee{#4 #3}
  \gdef\@coadvisorwithouttitle{#4 #3}
}

% Definição da formatação das informações do comitê de avaliação do documento
% Ex.: \committee[Título]{Sobrenome}{Nome}{Instituição}
\newcounter{ii@committeecount}
\DeclareRobustCommand{\committee}[4][]{
  \addtocounter{ii@committeecount}{1}
  \expandafter
  \gdef\csname @committee\alph{ii@committeecount}last\endcsname{#2}
  \expandafter
  \gdef\csname @committee\alph{ii@committeecount}first\endcsname{#3}
  \expandafter
  \gdef\csname @committee\alph{ii@committeecount}\endcsname{#3 #2. #1 #4}
}

%%=============================================================================
%% Definição das palavras-chave e keywords
%%=============================================================================

% Novo contador e comando usado para informar as palavras-chave do 'resumo'
% do trabalho acadêmico.
\newcounter{kwcounter}
\newcommand{\keyword}[1]{
  \addtocounter{kwcounter}{1}
  \expandafter\gdef\csname keyw\alph{kwcounter}\endcsname{#1}
}

\newcommand{\@cipkw}{%
  \@ifundefined{keywa}{}{1.~\expandafter\MakeUppercase\keywa\@. }%
  \@ifundefined{keywb}{}{2.~\expandafter\MakeUppercase\keywb\@. }%
  \@ifundefined{keywc}{}{3.~\expandafter\MakeUppercase\keywc\@. }%
  \@ifundefined{keywd}{}{4.~\expandafter\MakeUppercase\keywd\@. }%
  \@ifundefined{keywe}{}{5.~\expandafter\MakeUppercase\keywe\@. }%
  \@ifundefined{keywf}{}{6.~\expandafter\MakeUppercase\keywf\@. }%
  \@ifundefined{keywg}{}{7.~\expandafter\MakeUppercase\keywg\@. }%
  \@ifundefined{keywh}{}{8.~\expandafter\MakeUppercase\keywh\@. }%
  \@ifundefined{keywi}{}{9.~\expandafter\MakeUppercase\keywi\@. }%
  \@ifundefined{keywj}{}{10.~\expandafter\MakeUppercase\keywj\@. }%
}

% Novo comando para formatação do texto de apresentação das palavras-chave
% do 'resumo' do trabalho acadêmico. O número máximo de palavras-chave
% aceito é de n=10. As palavras-chave são separadas por vírgula.
% \newcommand{\@abstractkw}{% %% Obsoleto
%   \@ifundefined{keywa}{}{\expandafter\MakeUppercase\keywa}%
%   \@ifundefined{keywb}{}{, \keywb}%
%   \@ifundefined{keywc}{}{, \keywc}%
%   \@ifundefined{keywd}{}{, \keywd}%
%   \@ifundefined{keywe}{}{, \keywe}%
%   \@ifundefined{keywf}{}{, \keywf}%
%   \@ifundefined{keywg}{}{, \keywg}%
%   \@ifundefined{keywh}{}{, \keywh}%
%   \@ifundefined{keywi}{}{, \keywi}%
%   \@ifundefined{keywj}{}{, \keywj}%
% }

%%=============================================================================
%% Redefinição da data (para ter dia, mês e ano separados)
%%=============================================================================
\renewcommand{\date}[3]{
  \gdef\@publday{#1}
  \gdef\@publmonth{#2}
  \gdef\@publyear{#3}
}
\date{\monthname}{\number\year}

%% Obsoleto
% \newcommand{\dateingles}[2]{{#1}~$\text{\@publday}^{\text{#2}}$,~\@publyear}

%%=============================================================================
%% Definições comuns à capa e à folha de rosto.
%% Os dados específicos do tipo de trabalho (dissertação, tese, etc.) são
%% informados definindo-se o comando \titlepagespecificinfo. Veja os
%% arquivos .def incluídos com a classe.
%%=============================================================================
%\newlength{\titlepagewinwidth}\setlength{\titlepagewinwidth}{135mm}
%\newlength{\titlepagewinheight}\setlength{\titlepagewinheight}{150mm}
%\newlength{\titlepagetotalheight}\setlength{\titlepagetotalheight}{247mm}
%\newlength{\titlepagewinvoffset}\setlength{\titlepagewinvoffset}{70mm}
%\newlength{\titlepagewinvoffset}\setlength{\titlepagewinvoffset}{112mm}

\renewcommand{\maketitle}{ % capa e folha de rosto
  \begin{titlepage}
    \thetitlepage
  \end{titlepage}
  \clearpage
  \secondtitlepage
  \setcounter{page}{2}
}

%%=============================================================================
%% Capa
%%=============================================================================

\newcommand{\thetitlepage}{
  \noindent
  \parbox[t]{\textwidth}{
    \centering
    \setlength{\baselineskip}{2.0\baselineskip}     % Espaçamento duplo.
    \vspace{6mm}
    {\LargeA\textbf{\MakeUppercase{\ufrrjcurto}}}\\ % Universidade
    {\LargeC\textbf{\MakeUppercase{\@instituto}}}\\ % Instituto
    {\LargeC\textbf{\MakeUppercase{\@curso}}}\\     % Curso
    \setlength{\baselineskip}{0.5\baselineskip}     % Espaçamento simples
    \vspace{28mm}
      \parbox[t]{\textwidth}{
	\centering
	\centerline{\LargeC\textbf{\MakeUppercase{\doctypename}}}
	\vspace{14mm}
	\setlength{\baselineskip}{2.0\baselineskip} % Espaçamento duplo
	{\LargeB\textbf{\@titulo}}\\                % Título do documento
	\setlength{\baselineskip}{0.5\baselineskip} % Espaçamento simples
	\vspace{35mm}
	\centerline{\LargeC\textbf{\@authora}}      % Autor, Fonte 18 pontos
	\vspace{20mm}
	\centerline{\LargeD\textbf{\@publyear}}     % Ano de publicação
      }
  }
}

%%==============================================================================
%% Folha de rosto
%%==============================================================================

%% Para saber se há mais de um(a) co-orientador(a)
% \newif\ifcoorientadores

%% Definição do texto de apresentação do(a) orientador(a) e do(s) 
%% co-orientador(es)
% \def
%  \soborienta{
%   \textit{Sob orienta\c{c}{\~a}o~{
%    \iforientadora{da}\else{do}\fi} \@advisorprof}
%  }
% \gdef
%  \sobcoorienta{
%   \ifcoorientadores
%    \textit{e sob co-orienta\c{c}{\~a}o~\ifcoorientadora{da}\else{do}\fi{s}~
%     \@coadvisorprof\ifcoorientadora{as}\else{es}\fi}
%    \ifcoorientadora{a}\else{}\fi}
%   \else
%    \textit{e sob co-orienta\c{c}{\~a}o \ifcoorientadora{da}\else{do}\fi~
%     \@coadvisorprof}\fi
%  }
% \def\soborienta{\textit{Sob orienta\c{c}{\~a}o~de}}
% \gdef\sobcoorienta{\textit{e co-orienta\c{c}{\~a}o~de}}
% \def\sobcoorienta{\textit{e co-orienta\c{c}{\~a}o~de}}

\newcommand{\secondtitlepage}{
  \noindent
  \parbox[t]{\textwidth}{
    \centering
    \includegraphics[width=25mm]{logomarca}\\         % Logomarca colorida
    {\LargeE\textbf{\MakeUppercase{\ufrrjlongo}}}\\   % Universidade
    {\LargeE\textbf{\MakeUppercase{\@instituto}}}\\   % Instituto
    {\LargeE\textbf{\MakeUppercase{\@curso}}}\\[25mm] % Curso
    {\LargeE\textbf{\MakeUppercase{\@titulo}}}\par    % Título
    \vspace{25mm}
    {\LargeE\textbf{\MakeUppercase{\@authora}}}\\[15mm] % Autor do documento
    
    {\LargeE\soborienta\par}
    \@ifundefined{@advisor}{}{
      \vfill{\LargeE\textbf{\@advisor}}}\\ %% Orientador(a)
    \@ifundefined{@coadvisora}{}{
      \vspace{2ex}
      {\LargeE\sobcoorienta\par{\textbf{\@coadvisora}}}} %% Co-orientador 1

    \@ifundefined{@coadvisorb}{}{
      {\LargeE\par\textit{\andname}\par\textbf{\@coadvisorb}}} %% Co-orientador 2
    \vspace{15mm}
    \begin{flushright}
      \hspace{80mm}
      \begin{minipage}{76mm}
        {\LargeE\titlepagespecificinfo} %% Área de concentração e grau obtido
      \end{minipage} 
    \end{flushright}
    \vspace{15mm}
    \centerline{\LargeE\@city,~\@state,~\@country} %% Cidade, estado e país
    \centerline{\LargeE\@publmonth~\ofname~\@publyear} %% Mês e ano
  }
}

%%==============================================================================
%% Definição padrão da folha de aprovação e CIP
%%==============================================================================

\newcommand{\makeapprove}{%
  \clearpage
  \theapprovepage
}
\newcommand{\theapprovepage}{%
  \noindent
  \parbox[t]{\textwidth}{%
    {\textbf{\MakeUppercase{\ufrrjlongo}}}\\
    {\textbf{\MakeUppercase{\@instituto}}}\\
    {\textbf{\MakeUppercase{\@curso}}}\\
    \vspace{15mm}
    \noindent
    \begin{center}
      {\textbf{\MakeUppercase{\@authora}}}
    \end{center}
      \vspace{15mm}
      \noindent
      \parbox[t]{\textwidth}{
      \titlepagespecificinfo
      }
      \vspace{15mm}
      \approvecommitteeinfo
  }
}

\newcommand{\makeCIP}[1]{
  \clearpage
  \mbox{} \vfill
  \@cipwindow
	\vspace{2ex}
  \nominata{#1}
  %% se for impresso, não deve contar a página, pois será impressa no verso da
  %% folha de aprovação
  %\setcounter{page}{2}
}

\def\@cipwindow{%
  \noindent
  \framebox[140mm]{
  \begin{minipage}{120mm}%
    \vspace*{2ex}
    \setlength{\parindent}{2em}%
    \setlength{\parskip}{1.4ex}%
    \noindent \@authoralast, \@authorafirst\par
    %\@title\ / por \@authora.\ -- \@publyear.\\
    \@titulo\ / \byname \@authora.\ -- \@publyear.\\
                \indent\pageref{LastPage}~f.: il.; 30~cm. \par
				\indent\iforientadora\advisornamef\else
				 \advisorname\fi: \@advisorfirst\ \@advisorlast
				\@ifundefined{@coadvisor}{}{\\ \indent
				 \ifcoorientadora\coadvisornamef\else
				 \coadvisorname\fi: \@coadvisorfirst\ 
				 \@coadvisorlast} \\
				\indent \doctypenameCIP \ - \ufrrjlongo, \@instituto,
				\@altCurso, RJ, \@publyear. \par
                \@cipkw I.~\@advisorlast, \@advisorfirst. 
                \@ifundefined{@coadvisorfirst}{II.~T\'{\i}tulo.}{II.~
                \@coadvisorlast, \@coadvisorfirst. III.~T\'{\i}tulo.}\par
        \vspace{4ex}
        \end{minipage}%
        }%
    }

\newcommand{\nominata}[1]{
 \vspace{3ex}
 % \noindent
 % Ficha catalográfica elaborada por \\
 % {#1} \\
 % Biblioteca Central da UFSM \\
  \hrule
  \vskip 10\p@
  \noindent \copyright \ \@publyear \\
  Todos os direitos autorais reservados a \@authora. A reprodu{\c{c}}{\~a}o de
  partes ou do todo deste trabalho s\'{o} poder\'{a} ser feita mediante a 
  cita{\c{c}}{\~a}o da fonte. \\
  E-mail: {#1}
}

\newcommand{\includeCIP}[1]{
   %impresso no verso da folha de rosto, nesse caso não deve contar a página
   %\setcounter{page}{1}
   \clearpage\mbox{}
   \AddToShipoutPicture{\includegraphics{#1}}
   \clearpage
   \ClearShipoutPicture
}

\def\@authorbox{%
  \parbox[t]{\textwidth}{%
    \centering
    \vspace{2cm}
    \LargeC{A Comiss\~{a}o Examinadora, abaixo assinada,} \\
	  {aprova \doctypearticle~\doctypename} \\[2cm]
	  \MakeUppercase{\LargeC\textbf{\@titulo}}\\[1,5cm]
	  elaborad\doctypearticle~por\\
	  \textbf{\@authora}\\
	  \@ifundefined{@authorb}{}{\textbf{\@authorb}\\}%
	  \@ifundefined{@authorc}{}{\textbf{\@authorc}\\}%
	  \@ifundefined{@authord}{}{\textbf{\@authord}\\}%
	  \vspace{1.5cm}
		 {como requisito parcial para obten{\c{c}}{\~a}o do grau de} \\
		 % \textbf{\@grau}
		 \textbf{\grau}
  }
}

%%==============================================================================
%% Informações do comitê de avaliação do trabalho
%%==============================================================================

%% Adicionar linha para assinatura acima do nome dos membros da banca
%% Largura = 100 mm, Espessura = 0.4 pts, Espaçamento até nome = 1 mm
\newcommand{\assina}{\centering\rule{100mm}{0.4pt}\vfill\vspace{-1mm}}

\newcommand{\approvecommitteeinfo}{%
  \vfill
  \parbox[t]{\textwidth}{
%     \MakeUppercase{\doctypename~\aprovadaem~\@date.}
    \MakeUppercase{\aprovadoem~\@date.}
    }
    \vfill
    \vspace{18mm}
%     \@ifundefined{@advisorcommittee}{}{
%       \normalsize\centerline{
%        \parbox[t]{\textwidth}{\assina\@advisorcommittee}}} % Presidente
%         \vspace{1mm}
%         \iforientadora\normalsize\centerline{(Presidente/Orientadora)}
% 	\else\normalsize\centerline{(Presidente/Orientador)}\fi
    \@ifundefined{@committeea}{}{
      \normalsize\centerline{\parbox[t]{\textwidth}{\assina\@committeea}}}
      \vspace{1mm}
      \normalsize\centerline{(\presidente)}
    \vspace{11mm}
    \@ifundefined{@committeeb}{}{
      \normalsize\centerline{\parbox[t]{\textwidth}{\assina\@committeeb}}}
    \vspace{18mm}
    \@ifundefined{@committeec}{}{
      \normalsize\centerline{\parbox[t]{\textwidth}{\assina\@committeec}}}
    \vspace{18mm}
    \@ifundefined{@committeed}{}{
      \normalsize\centerline{\parbox[t]{\textwidth}{\assina\@committeed}}}
    \vspace{18mm}
    \@ifundefined{@committeee}{}{
      \normalsize\centerline{\parbox[t]{\textwidth}{\assina\@committeee}}}
  }

%%=============================================================================
%% Ajuste do sumário (sem indentação) 
%%=============================================================================

%% Espaço entre o número e o título dos itens de primeiro nível
\newlength{\ii@chapnumindent}\setlength{\ii@chapnumindent}{1em}

%% Espaço entre os pontos na linha pontilhada
\renewcommand\@dotsep{1.5}

\renewcommand*{\l@chapter}[2]{
  \addpenalty{-\@highpenalty}
  \vskip -2.5ex \@plus\p@
  \setlength\@tempdima{1.5em}
  \begingroup
  \parindent \z@ \rightskip \@pnumwidth
  \parfillskip -\@pnumwidth
  \leavevmode\bfseries
  \advance\leftskip\@tempdima
  \hskip -\leftskip
  % esta é a definicao original da classe report:
  %#1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
  
  %% ASR: em uma versao anterior, -0.35em foi a solução encontrada para deixar todo mundo alinhado na toc.
  % \@dottedtocline{0}{-0.35em}{\ii@chapnumindent}{\MakeUppercase{#1}}{#2}
  \@dottedtocline{0}{0em}{\ii@chapnumindent}{\MakeUppercase{#1}}{#2}
  
  \penalty\@highpenalty
  \endgroup
}

%% ASR: O comando \@dottedtocline espera os seguintes parâmetros:
%%      \@dottedtocline{<level>}{<indentation>}{<numwidth>}
%%      Não existe definição oficial do nível de indentação das seções. Os valores usados aqui são baseados
%%      na dimensão da letra 'M' maiúscula na fonte atual, conforme expresso pelo comando 'em'.
\renewcommand*{\l@section}[2]{\@dottedtocline{1}{1em}{1.7em}{\textbf{#1}}{\hss #2}}
\renewcommand*{\l@subsection}{\@dottedtocline{2}{2em}{2.4em}}
\renewcommand*{\l@subsubsection}{\@dottedtocline{3}{3em}{3em}}
\renewcommand*{\l@paragraph}{\@dottedtocline{4}{4em}{3.8em}}

\newif\if@aftertoc
\@aftertocfalse
\renewcommand{\tableofcontents}{%
  \chapter*{\LargeF\contentsname}
  \@starttoc{toc}\@aftertoctrue%
}

%%==============================================================================
%% Adicionar todos os tipos de seção, subseção, etc no sumário
%%==============================================================================

%\part            | -1 (book and report) 0 (article)
%\chapter         | 0 (book and report only)
%\section         | 1
%\subsection      | 2
%\subsubsection   | 3
%\paragraph       | 4
%\subparagraph    | 5
\setcounter{secnumdepth}{5}
\setcounter{tocdepth}{5}

%%==============================================================================
%% Lista de abreviaturas e siglas
%%==============================================================================

\newenvironment{listofabbrv}[1]{
 \chapter*{\LargeF\listabbrvname}
  \begin{list}{\textbf{??}}{
   \settowidth{\labelwidth}{#1}
   \setlength{\labelsep}{2em}
   \setlength{\itemindent}{0mm}
   \setlength{\leftmargin}{\labelwidth}
   \addtolength{\leftmargin}{\labelsep}
   \setlength{\rightmargin}{0mm}
   \setlength{\itemsep}{.1\baselineskip}
   \renewcommand{\makelabel}[1]{\makebox[\labelwidth][l]{##1}}
  }
}{
  \end{list}
}

%%==============================================================================
%% Lista de símbolos
%%==============================================================================

\newenvironment{listofsymbols}[1]{
        \chapter*{\LargeF\listsymbolname}
        \begin{list}{\textbf{??}}{
                \settowidth{\labelwidth}{#1}
                \setlength{\labelsep}{2em}
                \setlength{\itemindent}{0mm}
                \setlength{\leftmargin}{\labelwidth}
                \addtolength{\leftmargin}{\labelsep}
                \setlength{\rightmargin}{0mm}
                \setlength{\itemsep}{.1\baselineskip}
                \renewcommand{\makelabel}[1]{\makebox[\labelwidth][l]{##1}}
        }
}{
        \end{list}
}

%%==============================================================================
%% Resumo (abstract) e Abstract (englishabstract)
%%==============================================================================

% Comando para formatação do corpo do resumo em português. Está definido para
% não conter indentação na primeira linha e ser apresentado com espaçamento
% simples. As palavras-chave são colocadas 10 mm abaixo do final do corpo do
% resumo.
% \renewenvironment{abstract}{
%   \ifgeneralabstract
%     \chapter*{\LargeF\generalabstractname} %% resumo geral
%   \else
%     \chapter*{\LargeF\abstractname} %% resumo
%   \fi
%   \noindent\abstractheaderbox
%   \noindent
% }{\par\vspace{8mm}
%   \noindent\textbf{\keywordsname:}~\@abstractkw.
% }

%% Formatação do cabeçalho do resumo em português.
%% O corpo do resumo é colocado 15 mm abaixo do cabeçalho.

% \newcommand{\abstractheaderbox}{%
%   \parbox[t]{\textwidth}{ 
%     \MakeUppercase{\@authoralast}, \@authorafirst. \textbf{\@titulo}.
%     \@publyear. \pageref{LastPage}f. \doctypename~(\@grau). 
%     \@instituto, \ufrrj, \@city, RJ, \@publyear.
%     \vfill\vspace{13mm}
%  }
% }

\newif\ifgeneralabstract
\newcommand{\generalabstractbheaderbox}[1]{%
  \parbox[t]{\textwidth}{
    \MakeUppercase{\@authoralast}, \@authorafirst. \textbf{\@generalabstracttitulo}.
    % \@publyear. \pageref{LastPage}\folhas. \doctypename~(\@nivel).
    \@publyear. \pageref{LastPage}\folhas. \doctypename~(\@generalabstractnivel).
    \@instituto, \ufrrjlongo, \@city, RJ, \@publyear.
    \vfill\vspace{13mm}
  }
}
\newenvironment{generalabstract}[4]{
  \if@openright\cleardoublepage\else\clearpage\fi%
    \gdef\@generalabstractbkeywords{#3}
    \gdef\@generalabstracttitulo{#2}
    \gdef\@generalabstractnivel{#4}
  \begin{otherlanguage}{#1}
    \ifgeneralabstract
      \chapter*{\LargeF\generalabstractname} %% general abstract
    \else
      \chapter*{\LargeF\abstractname}        %% abstract
    \fi  
    \noindent\generalabstractbheaderbox
    \hspace{}
    \noindent
}{\par\vspace{8mm}
  \noindent\textbf{\keywordsname:}~\@generalabstractbkeywords.
  \end{otherlanguage}
}

%% Novo ambiente 'chapterabstract' para adicionar o resumo dos capítulos 
%% individuais em diferentes línguas. Este ambiente é útil quando o documento 
%% é composto por artigos ou capítulos individuais. O resumo não recebe 
%% numeração mas aparece como item do sumário. O corpo do texto fica 10 mm 
%% abaixo do título, e as palavras-chave ficam 10 mm abaixo do corpo do texto.
%% A fim de evitar que a primeira linha do resumo seja indentada, é preciso 
%% usar o comando '\noindent{...}' no corpo do texto. O commando 
%% '\formatchapter', inserido após o ambiente 'chapterabstract', garante que o
%% texto do artigo/capítulo inicia na próxima página, e que o título da 
%% primeira seção primária ficará 10 mm abaixo da margem superior.

\newenvironment{chapterabstract}[2]{
  \if@openright\cleardoublepage\else\clearpage\fi
    \gdef\@mykeywords{#2}
  \begin{otherlanguage}{#1}
    
    %% ASR: A definição do espaçamento entre linhas no resumo igual à '0.67\baselineskip' é baseada no uso
    %%      de espaçamento '1.5\baselineskip' no resto do texto, que é equivalente ao espaçamento de um ponto
    %%      e meio entre linhas. Tal opção pode ser usada na preparação da versão do documento que é enviada
    %%      ao comitê examinador. Contudo, ela faz com que a formatação do resumo fique péssima quando da 
    %%      preparação da versão final do documento. A melhor opção, no momento, parece ser eliminar a 
    %%      definição do espaçamento entre linhas no ambiente 'chapterabstract'.
    % \setlength{\baselineskip}{0.67\baselineskip} %% Espaçamento simples
    
    \vspace*{-14mm} %% Alinhamento superior
    \vspace*{10mm}  %% Coloca o resumo a 10 mm da margem superior
    
    %\section*{\centering\MakeUppercase{\abstractname}} %% Título centralizado
    \addtocounter{section}{1} %% adicionar numeração ao 'resumo' no corpo do texto
    \section*{\centering{\thesection~\abstractname}}
    
    %% Adicionar 'resumo' ao sumário numerado com qualquer outra seção dentro do texto
    %% ASR: Há incompatibilidade entre \MakeUppercase e \addcontentsline
    %% ASR: Na verdade, não é necessário usar \MakeUppercase ou \uppercase. Basta definir \abstractname
    %%      usando os arquivos de idioma do pacote babel, dado que \abstractname aparece sempre em maiúsculas.
    % \addcontentsline{toc}{section}{\MakeUppercase{\abstractname}}
    % \addcontentsline{toc}{section}{\uppercase{\abstractname}}
    % \addcontentsline{toc}{section}{\uppercase{\protect\numberline{\thesection}\abstractname}}
    \addcontentsline{toc}{section}{\protect\numberline{\thesection}\abstractname}
    
    \vspace{2mm} %% Espaço do título até o corpo do texto
    \parindent0em
}{\par\vspace{6mm} %% Espaço do corpo do texto até as palavras-chave
  \begin{minipage}{\textwidth}
    \noindent\textbf{\keywordsname:}~\@mykeywords. %% Inserir as palavras-chave
  \end{minipage}
  \end{otherlanguage}
}

\newcommand{\formatchapter}{
  \if@openright\cleardoublepage\else\clearpage\fi
  \vspace*{-13.5mm}
  \vspace*{10mm}
}

%%=============================================================================
%% Formatação dos capítulos.
%% Os comandos \@chapter e \@schapter são redefinidos para que a
%% numeração de páginas seja correta (deve aparecer somente a partir do
%% primeiro capítulo do texto, mas não nas páginas iniciais de capítulos).
%% Os comandos \@makechapterhead e \@makeschapterhead fazem a
%% formatação dos títulos propriamente ditos.
%%=============================================================================

%% Para capítulos baseados em artigos, ou seja, documento na forma de capítulos
\newif\ifartigo

%% Novo contador para artigos, ou seja, para os capítulos dos documentos na forma de capítulos
%% Este contador facilita a inserção de numeração romana para os capítulos.
\newcounter{artigo}
\renewcommand{\theartigo}{\Roman{artigo}}%

%% Título curto para cabeçalho (header)
\newcommand{\shorttitle}[1]{\gdef\@shorttitle{#1}}

% \settowidth{\ii@chapnumindent}{{\textbf{\@chapapp}}}
% \addtolength{\ii@chapnumindent}{1.8em}
\newcommand{\ii@chapterfont}{\@setfontsize\Large{14}{20}}
\def\@chapapp{}
\def\@chapter[#1]#2{%
      
      %% Formatação do cabeçalho dos apêndices, anexos, e capítulos (nesta ordem).
      %% O cabeçalho é inserido quando a opção 'header' é usada junto da definição do tipo de documento.
      %% Isso requer que seja definido, em cada apêndice, anexo e capítulo, um título curto, para o qual
      %% utiliza-se do comando '\shorttitle{}'.
      %% Note que o cabeçalho de capítulos baseados em artigos (formato em capítulo) leva a palavra 'capítulo'
      %% também no cabeçalho.
      \ifappendix
        \gdef\@chaptertitle{\@chapapp\theappendix.~\@shorttitle}%
      \else
        \ifannex
          \gdef\@chaptertitle{\@chapapp\theannex.~\@shorttitle}%
        \else
          \ifartigo
            % \gdef\@chaptertitle{\@chapapp\thechapter~\chaptername~.~\@shorttitle}%
            \gdef\@chaptertitle{\@chapapp\thechapter~\chaptername~\theartigo.~\@shorttitle}%
          \else
            \gdef\@chaptertitle{\@chapapp\thechapter.~\@shorttitle}%
          \fi
        \fi
      \fi
      
      \refstepcounter{chapter}%
      
      %% FORMATAÇÃO DO TÍTULOS DOS CAPÍTULOS NO SUMÁRIO
      %% ASR: É preciso adicionar um espaço em '~#1' para evitar que o título fique sobre o número
      %%      quando o número do capítulo possui dois ou mais dígitos. Contudo, isso aumenta em demasia
      %%      o espaçamento quando o número do capítulo possui apenas um dígito. Deve haver maneira mais
      %%      eficiente de fazer isso.
      %% ASR: São adicionados 10 pontos de espaço vertical antes e após o titulo de cada capitulo no sumario.
      %%      COmo não existe definição oficial, a decisão de adicionar 10 pontos é completamente arbitrária.
      \ifchap%
       \addtocontents{toc}{\protect\addvspace{10\p@}}%
        
        \ifartigo
         \refstepcounter{artigo}
         \addcontentsline{toc}{chapter}{%
         % \protect\numberline{\@chapapp\thechapter}~\chaptername~\Roman{chapter}.~#1}%
         \protect\numberline{\@chapapp\thechapter}~\chaptername~\theartigo.~#1}%
        
        \else
         % \ifchap\addcontentsline{toc}{chapter}{\protect\numberline{\@chapapp\thechapter}#1}\fi%
         \addcontentsline{toc}{chapter}{\protect\numberline{\@chapapp\thechapter}~#1}%
        \fi
       \addtocontents{toc}{\protect\addvspace{10\p@}}%
      \fi
      
      \addtocontents{lof}{\protect\addvspace{0\p@}}% list of figures
      \addtocontents{lot}{\protect\addvspace{0\p@}}% list of tables
      
      %\pagestyle{UFRuralRJ}\let\ps@plain\ps@UFRuralRJ%
      \pagestyle{UFRuralRJ}\let\ps@empty\ps@UFRuralRJ% Omitir número de página
      \@makechapterhead{#2}\@afterheading
}

%% Colocar título de capítulos no formato de artigo 
%% Posição: 20 mm abaixo da margem superior
\def\@makechapterhead#1{%
  %% Colocar título dos itens principais do documento a 10 mm da margem superior
  \vspace*{5.5mm} 
  \ifchap
    %% Colocar o termo 'CAPÍTULO' 20 mm abaixo da margem superior
    \ifartigo\vspace*{8mm}\else\vspace*{0mm}\fi
    
    \reset@font\noindent{
    
    \ifartigo
      %% Esta é uma solução rápida e suja para ajustar a numeração dos capítulos 
      %% conforme o Manual da UFRuralRJ. Segundo o Manual, os capítulos ou artigos 
      %% devem receber a numeração sequencial do sumário, mas também a palavra
      %% 'CAPÍTULO' seguida do número do capítulo ou artigo usando algarismos 
      %% romanos.
      % \addtocounter{artigo}{+1}
      \ii@chapterfont
      % \centering\textbf{\@chapapp\thechapter~\MakeUppercase{\chaptername}~
      % \addtocounter{chapter}{-1}\Roman{chapter}\\
      % \addtocounter{chapter}{+1}
      \centering\textbf{\@chapapp\thechapter~\MakeUppercase{\chaptername}~\theartigo\\
      \vspace*{20mm}
      \hspace{0.5em}\MakeUppercase{#1}}
    
    %% ASR: Eu não tenho certeza da serventia dos seguintes comandos.
    \else
      \ifappendix
        \LargeF\centering\textbf{\@chapapp\theappendix\hspace{0.5em}\MakeUppercase{#1}}
      \else
        \ifannex
          \LargeF\centering\textbf{\@chapapp\theannex\hspace{0.5em}\MakeUppercase{#1}}
        \else
          \LargeF\centering\textbf{\@chapapp\thechapter\hspace{0.5em}\MakeUppercase{#1}}
        \fi
      \fi
    \fi
    \par}
    
    %% Espaço vertical adicionado apos o título de cada item do documento. No formato de capitulos individuais,
    %% aplica-se aos itens Introduçao Geral e Conclusao Geral. Trata-se do mesmo espaçamento vertical 
    %% adicionado apos cada seçao e subseçao do texto ('afterskip') conforme definido abaixo.
    \addvspace{10pt}
    
  \else
    
    %% Definição do conteúdo do título de cada apêndice, anexo e capítulo (nesta ordem).
    %% Incrementa-se o contador de apêndices, enquanto o valor do contador de capítulos é reduzido a fim de 
    %% continuar a numeração correta dos capítulos subsequentes.
    %\@setfontsize\Large{12}{20} se for o padrão da seção
    \ifappendix
      \refstepcounter{appendix}
      \addtocounter{chapter}{-1}%
      \reset@font\noindent{\ii@chapterfont\centering\textbf{
        \LargeF\MakeUppercase{\@chapapp}\theappendix\hspace{0.5em}--\hspace{0.5em}\MakeUppercase{#1}}
        \par}
      \addvspace{25pt}
      
      %% Formatação do título do apêndice na lista de apêndices
      \addtocontents{loap}{\protect\addvspace{10\p@}}
      %% ASR: Por alguma razão, os apêndices eram adicionados à lista de apêndices usando a formatação 
      %%      definida para 'section'. Isso resultava no alinhamento incorreto de cada item na lista. Agora 
      %%      usa-se a formatação definida para 'chapter'.
      % \addcontentsline{loap}{section}{%
      \addcontentsline{loap}{chapter}{%
        \MakeUppercase{\@chapapp}\theappendix\hspace{0.5em}--\hspace{0.5em}\MakeUppercase{#1}}
      \addtocontents{loap}{\protect\addvspace{10\p@}}
      
    \else
      \ifannex
        \refstepcounter{annex}%
        \addtocounter{chapter}{-1}%
        \reset@font\noindent{\ii@chapterfont\centering\textbf{
          \LargeF\MakeUppercase{\@chapapp}\theannex\hspace{0.5em}--\hspace{0.5em}\MakeUppercase{#1}}
          \par}
        \addvspace{25pt}
        
        %% Formatação do título do anexo na lista de anexos
        \addtocontents{loan}{\protect\addvspace{10\p@}}%
        %% ASR: Por alguma razão, os apêndices eram adicionados à lista de apêndices usando a formatação 
        %%      definida para 'section'. Isso resultava no alinhamento incorreto de cada item na lista. Agora 
        %%      usa-se a formatação definida para 'chapter'.
        % \addcontentsline{loan}{section}{%
        \addcontentsline{loan}{chapter}{%
          \MakeUppercase{\@chapapp}\theannex\hspace{0.5em}--\hspace{0.5em}\MakeUppercase{#1}}%
        \addtocontents{loan}{\protect\addvspace{10\p@}}%
        
      \else
        \reset@font\noindent{\ii@chapterfont\centering\textbf{
          \LargeF\MakeUppercase{\@chapapp}\thechapter\hspace{0.5em}--\hspace{0.5em}\MakeUppercase{#1}}
          \par}
        \addvspace{10pt}
      \fi
    \fi
  \fi
}

%% Formatação da versão estrelada (*) dos capítulos
\def\@schapter#1{%
  %% ASR: \hspace*{0.35em} é uma solução rápida e suja para deixar todo 
  %%      mundo alinhado na toc
  \ifchap\if@aftertoc\addcontentsline{toc}{chapter}{\hspace*{0.35em}#1}\fi\fi%
  \addtocontents{lof}{\protect\addvspace{0\p@}}%Original = 10\p@
  \addtocontents{lot}{\protect\addvspace{0\p@}}%
  \@makeschapterhead{#1}\@afterheading
}

\def\@makeschapterhead#1{%
  \vspace*{5mm}
  \reset@font\centerline{\LargeF\centering\textbf{\MakeUppercase{#1}}}
  \addvspace{25pt}
}

%%==============================================================================
%% Formatação das seções
%%==============================================================================

%% ASR: Os títulos das seções e subseções são precedidos por espaçamento de 20 pontos, e sucedidos por 
%%      espaçamento de 10 pontos.

%\renewcommand{\section}{%name, level, indent, beforeskip, afterskip, style
%        \@startsection{section}{1}{0pt}{18pt}{18pt}{\reset@font\bfseries\@setfontsize\Large{12}{20}}
%}

\renewcommand\section{\@startsection{section}{1}{0pt}%
                                   {20pt}%
                                   {10pt}%
                                   {\centering\reset@font\bfseries\@setfontsize
                                     \Large{12}{20}}}
\renewcommand\subsection{\@startsection{subsection}{2}{0pt}%
                                   {20pt}%
                                   {10pt}%
                                   {\reset@font\bfseries\@setfontsize
                                     \Large{12}{20}}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{0pt}%
                                   {20pt}%
                                   {10pt}%
                                   {\reset@font\bfseries\@setfontsize
                                     \Large{12}{20}}}
\renewcommand\paragraph{\@startsection{paragraph}{4}{0pt}%
                                   {20pt}%
                                   {10pt}%
                                   {\reset@font\bfseries\@setfontsize
                                     \Large{12}{20}}}	
\renewcommand\subparagraph{\@startsection{subparagraph}{5}{0pt}%
                                   {1ex}%
                                   {-1em}%
                                   {\reset@font\bfseries\@setfontsize
                                     \Large{12}{20}}}

%%=============================================================================
%% TODO: Lista de quadros
%%=============================================================================



%%=============================================================================
%% TODO: Lista de abreviações e siglas
%%=============================================================================



%%=============================================================================
%% TODO: Lista de símbolos
%%=============================================================================



%%==============================================================================
%% Redefinição do conteúdo das listas de figuras e tabelas
%%==============================================================================

\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{#1~-- #2}%
  \ifdim \wd\@tempboxa >\hsize
    #1~-- #2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}
	
\newif\if@captionlisting\@captionlistingtrue
\long\def\@caption#1[#2]#3{%
  \par
  \if@captionlisting%
    \addcontentsline{\csname ext@#1\endcsname}{#1}%
        {\protect\numberline{\csname fnum@#1\endcsname~--}{\ignorespaces #2}}%
  \fi%
  \begingroup
    \@parboxrestore
    \if@minipage
      \@setminipage
    \fi
    \normalsize
    \@makecaption{\csname fnum@#1\endcsname}{\ignorespaces #3}\par
  \endgroup%
}
\renewcommand*{\l@figure}{\@dottedtocline{1}{0em}{5.5em}}
\let\l@table\l@figure

%%==============================================================================
%% Redefinição do formato de citações longas
%%==============================================================================

\renewenvironment{quote}{
  \footnotesize
  \begin{list}{}{\setlength{\leftmargin}{40mm}\item\relax}
}{
  \end{list}
}

%%=============================================================================
%% Ajuste do formato das citações e referências
%%=============================================================================

% Necessário para o pacote 'natbib'
% \setlength{\bibhang}{0pt}
% \let\cite\citep
% {}

%% Numeração (como capítulo) da lista de 'Referências Bibliográficas'
%% http://ftp.math.purdue.edu/mirrors/ctan.org/macros/latex/contrib/tocbibind/tocbibind.pdf
\usepackage[nottoc, notlot, notlof, numbib]{tocbibind}

%%=============================================================================================================
%% FORMATAÇÃO DOS APÊNDICES
%%=============================================================================================================

%% Novo contador para apêndices
\newcounter{appendix}

%% Formatação da página inicial dos apêndices.
%% Nesta página a palavra 'apêndice' aparece sozinha e centralizada.
\newcommand{\appendixpage}{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \thispagestyle{plain}%
  \if@twocolumn\onecolumn\@tempswatrue\else\@tempswafalse\fi
  \if@hyperLoaded\phantomsection\fi
  \null\vfil
  \markboth{}{}%
  {\centering
   \interlinepenalty \@M
   \normalfont
   
   %% ASR: O comando '\thechapter' é usado para adicionar numeração ao apêndice, seguindo a sequência
   %%      dos capítulos anteriores. Mas para que o comando '\thechapter' funcione, é necessário aumentar
   %%      em um a contagem do contador de capítulos.
   % \LargeE\bfseries\MakeUppercase\appendixname\par}%
   \addtocounter{chapter}{+1}
   \LargeE\bfseries\thechapter~\MakeUppercase\appendixname\par}%
   %% ASR: \hspace*{0.35em} é uma solução rápida e suja para deixar todo mundo alinhado na toc
   % \addcontentsline{toc}{chapter}{\hspace*{0.35em}\appendixname}
   % \addcontentsline{toc}{chapter}{\thechapter~\appendixname}
   \addtocontents{toc}{\protect\addvspace{10\p@}}
   \addcontentsline{toc}{chapter}{\protect\numberline{\thechapter}~\appendixname}
   \addtocontents{toc}{\protect\addvspace{10\p@}}
  
  \vfil\newpage
  \if@twoside
    \if@openright
      \null
      \thispagestyle{empty}%
      \newpage
    \fi
  \fi
  \if@tempswa
    \twocolumn
  \fi
}

\renewcommand{\appendix}[1][\appendixname]{%
  \chapfalse
  \appendixtrue
  \annexfalse
  \appendixpage
  
  % \setcounter{chapter}{0}%
  \setcounter{section}{0}%
  \numberwithin{section}{appendix}
  % \renewcommand{\thechapter}{\LargeF\Alph{chapter}}% Tamanho agora definido em @chapter
  % \renewcommand{\thechapter}{\Alph{chapter}}%
  \renewcommand{\theappendix}{\Alph{appendix}}%
  
  \setcounter{tocdepth}{0}%
  \@captionlistingfalse%
  % \gdef\@chapapp{\LargeF#1\space}% Tamanho agora definido em @chapter
  \gdef\@chapapp{#1\space}%
}

\newcommand\listofappendix{%
  \if@twocolumn
    \@restonecoltrue\onecolumn
  \else
    \@restonecolfalse
  \fi
  \chapter*{\LargeF\listappendixname}%
    \@mkboth{%
        \MakeUppercase\listappendixname}%
       {\MakeUppercase\listappendixname}%
  \@starttoc{loap}%
  \if@restonecol\twocolumn\fi
}

%%=============================================================================================================
%% FORMATAÇÃO DOS ANEXOS
%%=============================================================================================================

%% Novo contador para anexos
\newcounter{annex}

\newcommand{\annexpage}{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \thispagestyle{plain}%
  \if@twocolumn\onecolumn\@tempswatrue\else\@tempswafalse\fi
	\if@hyperLoaded
	  \phantomsection
	\fi	
  \null\vfil
  \markboth{}{}%
  {\centering
   \interlinepenalty \@M
   \normalfont
   
   % \LargeF \bfseries \MakeUppercase\annexname\par}%
   %% ASR: \hspace*{0.35em} é uma solução rápida e suja para deixar todo 
   %%      mundo alinhado na toc
   % \addcontentsline{toc}{chapter}{\hspace*{0.35em}\annexname}
   %% ASR: Há um problema na numeração se houver apêndice e anexo: a segunda entrada aparece em estilo
   %%      alfabético.
   \addtocounter{chapter}{+1}
   \LargeE\bfseries\thechapter~\MakeUppercase\annexname\par}%
   \addtocontents{toc}{\protect\addvspace{10\p@}}
   \addcontentsline{toc}{chapter}{\protect\numberline{\thechapter}~\annexname}
   \addtocontents{toc}{\protect\addvspace{10\p@}}
   
   
  \vfil\newpage
  \if@twoside
    \if@openright
      \null
      \thispagestyle{empty}%
      \newpage
    \fi
  \fi
  \if@tempswa
    \twocolumn
  \fi
}	

\newcommand{\annex}[1][\annexname]{%
  \chapfalse
  \appendixfalse
  \annextrue
  \annexpage
  
  % \setcounter{chapter}{0}%
  \setcounter{section}{0}%
  \numberwithin{section}{annex}
  % \renewcommand{\thechapter}{\LargeF\Alph{chapter}}% Tamanho agora definido em @chapter
  % \renewcommand{\thechapter}{\Alph{chapter}}%
  \renewcommand{\theannex}{\Alph{annex}}%
  
  \setcounter{tocdepth}{0}%
  \@captionlistingfalse%
  \gdef\@chapapp{#1\space}%
}

\newcommand\listofannex{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\LargeF\listannexname}%
      \@mkboth{%
          \MakeUppercase\listannexname}%
         {\MakeUppercase\listannexname}%
    \@starttoc{loan}%
    \if@restonecol\twocolumn\fi
}%

%%=============================================================================
%% Notas de rodapé
%%=============================================================================

%% Numeração sequencial ao longo de todo o texto
\def\@removefromreset#1#2{{%
  \expandafter\let\csname c@#1\endcsname\@removefromreset
  \def\@elt##1{%
    \expandafter\ifx\csname c@##1\endcsname\@removefromreset
    \else
      \noexpand\@elt{##1}%
    \fi}%
  \expandafter\xdef\csname cl@#2\endcsname{%
    \csname cl@#2\endcsname}}}
	
\@removefromreset{footnote}{chapter}	

%% Filete de 3 cm acima da nota de rodapé a partir da margem esquerda
\renewcommand\footnoterule{%
  \kern-3\p@
  \hrule\@width.19\columnwidth
  \kern2.6\p@}

%% Sem indentação o texto da nota de rodapé  
\renewcommand\@makefntext[1]{%
  \noindent\makebox[0.5em][r]{\@makefnmark}~~#1}

%% Informações sobre o capítulo, geralmente usado no caso de documento no formato de capítulos.
%% A nota é adicionada na mesma página onde aparece o título do capítulo, sem interferir na numeração.
\newcommand\chapternote[1]{%
  \begingroup
  \renewcommand\thefootnote{}\footnote{\hspace{-1em}*~#1}%
  \addtocounter{footnote}{-1}%
  \endgroup
}

%%=============================================================================================================
%% FORMATAÇÃO DAS EQUAÇÕES
%%=============================================================================================================

%% ASR: O contador de equações está sendo redefinido para incluir apenas o número das seções (e não das 
%%      subseções). As informações para redefinição estão no endereço
%%      http://www.math.uh.edu/~torok/math_6298/latex/numbering.html
\setcounter{equation}{0}
