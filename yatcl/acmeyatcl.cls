% Time-stamp: <2011-04-04 13:25:17 cmauclai>
%
% YATCL --- Yet another two column layout.
%
% Copyright 2010 by Cedric Mauclair
%
% This file may be distributed and/or modified
%
% 1. under the CCPL Attribution-ShareAlike License
% (http://creativecommons.org/licenses/by-sa/3.0/legalcode) and/or
% 2. under the GNU Public License 3 (http://www.gnu.org/licenses/gpl.html).
%
% Created by Cedric Mauclair.
%
% Latest major version: 1.0
% Date: 2011-03-24

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{acmeyatcl}[2011/03/24 The YATCL class for articles.]


%% Placeholders %%
\def\firstline{\def\@firstline}
\def\secondline{\def\@secondline}
\def\thirdline{\def\@thirdline}
\def\logo{\def\@logo}

\logo{NO LOGO}


%% Internals %%
\def\doifelse#1#2#3{#1#2\else#3\fi}
\def\doifnotelse#1#2#3{#1#3\else#2\fi}

\def\doif#1#2{\doifelse#1#2{}}
\def\doifnot#1#2{\doifnotelse#1#2{}}


%% What is this package for? %%
\message{#################################}
\message{Yet another two column layout for articles.}
\message{Cedric Mauclair -- March 2011}
\immediate\write0{}


% Give the options to the 'article' class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

% Take the options into consideration.
\ProcessOptions\relax

\message{#################################}


\LoadClass[twoside, 10pt]{article}

\RequirePackage[%
  a4paper,      nohead,
  top=0.9in,    right=0.9in,
  bottom=0.9in, left=0.9in] {geometry}

\RequirePackage[runin] {abstract}
\RequirePackage        {multicol}
\RequirePackage        {float}
\RequirePackage        {lmodern}
\RequirePackage        {url}
\RequirePackage        {graphicx}
\RequirePackage        {amsmath,amssymb,amsthm}


%% Language specific settings. %%

\let\@afterheadingcfg\@afterindentfalse

\AtBeginDocument{%
  % french language
  \iflanguage{francais}{%
    \let\@afterheadingcfg\@afterindenttrue}{}
  % useful command
  \providecommand\up{\textsuperscript}}

\flushbottom


%% Colums separation. %%
\def\@ColSep{18pt}
\setlength{\columnsep}{\@ColSep}


%% Emphasis is slanted. %%
\DeclareRobustCommand\em
  {\@nomath\em\ifdim\fontdimen\@ne\font>\z@
    \upshape\else\slshape\fi}


%% Block title. %%
\def\affiliation{\def\@affiliation}
\def\laboratory{\def\@laboratory}
\def\email{\def\@email}
\def\moreinfos{\def\@moreinfos}

\affiliation{}
\laboratory{}
\email{}
\moreinfos{}

% Redefine \maketitle command.
\def\@maketitle{%
  \parindent=0pt
  %% header
  \begin{minipage}{.5\hsize}
    \@logo
  \end{minipage}\hfill%
  \begin{minipage}{.5\hsize}
    \raggedleft
    \ifx\@firstline\@empty\else{\bfseries\@firstline}\\\fi
    \ifx\@secondline\@empty\else\@secondline\\\fi
    \@thirdline
  \end{minipage}%
  %% title pane
  \bigskip \hrule height 1pt
  \vskip2ex plus1ex minus1ex{\centering\LARGE\bfseries\@title\par}
  \vskip3ex plus2ex minus1ex{\large\bfseries\@author}
  \ifx\@email\@empty\else
    ({\ttfamily\@email})\par\vskip.5\smallskipamount\fi
  \ifx\@laboratory\@empty\else
    {\large\@laboratory\par\vskip.5\smallskipamount}\fi
  \ifx\@affiliation\@empty\else
    {\large\@affiliation}\fi
  \ifx\@moreinfos\@empty\else%
    \par\smallskip
    \@moreinfos\fi
  \vskip1ex\hrule height1pt\bigskip}


%% Abstract. %%
\renewenvironment{abstract}
{\quotation\noindent
  {\normalfont\bfseries\abstractname\quad}\em}
{\endquotation\medskip\thispagestyle{empty}}


%% Two column layout. %%
\newenvironment{twocols}[1][2]
{\begin{multicols}{#1}}
{\end{multicols}}


%% Sections. %%
\setcounter{secnumdepth}{2}

\def\thesection{\Alph{section}}
\def\section{%
   \if@noskipsec\leavevmode\fi
   \par\addvspace{2\bigskipamount}%
   \@afterheadingcfg\secdef\@section\@ssection}
\def\@section[#1]#2{
  \refstepcounter{section}
  {\parindent=0pt \raggedright
    \interlinepenalty \@M
    \normalfont\bfseries
    \thesection.\quad\MakeUppercase{#2}\par}%
  \kern\smallskipamount\hrule
  \kern\bigskipamount\nobreak\@afterheading}
\def\@ssection#1{
  {\parindent=0pt \raggedright
    \interlinepenalty \@M
    \normalfont\bfseries
    \centering\MakeUppercase{#1}\par}%
  \kern\smallskipamount\hrule
  \kern\bigskipamount\nobreak\@afterheading}


%% Subsections. %%
\def\thesubsection{\arabic{subsection}}
\def\subsection{%
   \if@noskipsec\leavevmode\fi
   \par\addvspace{\bigskipamount}%
   \@afterheadingcfg\secdef\@subsection\@ssubsection}
\def\@subsection[#1]#2{
  \refstepcounter{subsection}
  {\parindent=0pt \raggedright
    \interlinepenalty \@M
    \normalfont\large\bfseries
    \thesubsection.\quad#2\par}%
  \kern\smallskipamount\@afterheading}
\def\@ssubsection#1{
  {\parindent=0pt \raggedright
    \interlinepenalty \@M
    \normalfont\large\bfseries#1\par}%
  \kern\smallskipamount\nobreak\@afterheading}


%% Subsubsections. %%
\def\thesubsubsection{\arabic{subsubsection}}
\def\subsubsection{%
   \if@noskipsec\leavevmode\fi
   \par\addvspace{\bigskipamount}%
   \@afterheadingcfg\secdef\@subsubsection\@ssubsubsection}
\def\@subsubsection[#1]#2{
  \refstepcounter{subsubsection}
  {\parindent=0pt \raggedright
    \interlinepenalty \@M
    \normalfont\bfseries
    \thesubsection.\thesubsubsection.\quad#2\par}%
  \kern\smallskipamount\nobreak\@afterheading}
\def\@ssubsubsection#1{
  {\parindent=0pt \raggedright
    \interlinepenalty \@M
    \normalfont\bfseries#1\par}%
  \kern\smallskipamount\nobreak\@afterheading}


%% Bibliography. %%
\bibliographystyle{plain}

\renewenvironment{thebibliography}[1]
{\section*{\refname}
  \list{\@biblabel{\@arabic\c@enumiv}}
  {\settowidth\labelwidth{\@biblabel{#1}}
    \leftmargin\labelwidth
    \advance\leftmargin\labelsep
    \@openbib@code
    \usecounter{enumiv}
    \let\p@enumiv\@empty
    \renewcommand\theenumiv{\@arabic\c@enumiv}}
  \sloppy
  \clubpenalty4000
  \@clubpenalty \clubpenalty
  \widowpenalty4000
  \sfcode`\.\@m\small
  \columnsep\labelwidth
  \advance\columnsep\labelsep
  \advance\columnsep\@ColSep
  \begin{twocols}}
{\end{twocols}
  \def\@noitemerr
  {\@latex@warning{Empty `thebibliography' environment}}
  \endlist}


%% Footnotes. %%
\addtolength{\skip\footins}{3mm plus 1mm}
\renewcommand\footnoterule{\vspace*{-3pt} \hrule width 1.5in height 0.4pt \vspace*{2.6pt}}


%% Captions. %%
\renewcommand{\fnum@figure}[1]{\small\textbf{Figure~\thefigure.}~\em}
\renewcommand{\fnum@table}[1]{\small\textbf{Table~\thetable.}~\em}


%%% Local Variables:
%%% TeX-master: "./demo.tex"
%%% End:
