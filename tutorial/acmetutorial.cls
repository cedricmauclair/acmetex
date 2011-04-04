% Time-stamp: <2011-04-04 16:19:54 cmauclai>
%
% Tutorial --- Class to typeset tutorials (easy reading on screens).
%
% Copyright 2010 by Cedric Mauclair
%
% This file may be distributed and/or modified
%
% 1. under the CCPL Attribution-ShareAlike License
% (http://creativecommons.org/licenses/by-sa/3.0/legalcode) and/or
% 2. under the GNU Public License 3 (http://www.gnu.org/licenses/gpl.html).
%
% Created by Cahiers Gutenberg [1]. Adapted by Cedric Mauclair.
%
% [1] http://cahiers.gutenberg.eu.org
%
% Latest major version: 1.0
% Date: 2011-04-04

\NeedsTeXFormat{LaTeX2e}% LaTeX 2.09 can't be used (nor non-LaTeX)
\ProvidesClass{acmetutorial}[2011/04/04 A class for tutorials.]


%% What is this package for? %%
\message{#################################}
\message{Class to typeset tutorials (easy reading on screens).}
\message{Cedric Mauclair -- April 2011}
\immediate\write0{}


\newif\ifacme@book
\DeclareOption{article}{\acme@bookfalse}
\DeclareOption{book}{\acme@booktrue}

% Give the options to the 'amsart' class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{amsart}}

% Take the options into consideration.
\ExecuteOptions{article}
\ProcessOptions\relax

\message{#################################}


% We use 'amsart' in the background
\LoadClass
  [centertags, leqno, portrait, 10pt, twoside, onecolumn, amsfonts]
  {amsart}

\AtBeginDocument{%
  \@for\@tempa:=-1,0,1,2,3,4\do{%
    \@ifundefined{r@tocindent\@tempa}{%
      \@xp\gdef\csname r@tocindent\@tempa\endcsname{0pt}}{}}}

\def\@writetocindents{%
  \begingroup
  \@for\@tempa:=-1,0,1,2,3\do{%
    \immediate\write\@auxout{%
      \string\newlabel{tocindent\@tempa}{%
        \csname r@tocindent\@tempa\endcsname}}}
  \endgroup}


%% Authors
\renewcommand{\author}[2][]{%
  \ifx\@empty\authors
    \gdef\authors{#2}%
    \g@addto@macro\addresses{\author{#2}}%
  \else
    \g@addto@macro\authors{\and#2}%
    \g@addto@macro\addresses{\author{#2}}%
  \fi
  \@ifnotempty{#1}{%
    \ifx\@empty\shortauthors
      \gdef\shortauthors{#1}%
    \else
      \g@addto@macro\shortauthors{\and#1}%
    \fi}}
\edef\author{\@nx\@dblarg
  \@xp\@nx\csname\string\author\endcsname}


%% Theorems (taken from smfthm)
\newif\ifacme@thmsin\acme@thmsintrue
\newif\ifacme@thmsas\acme@thmsasfalse
\newif\ifacme@thm@necounter\acme@thm@necounterfalse

\def\OneNumberAllTheorems{\acme@thm@necountertrue}

\def\NumberTheoremsIn#1{\@ifempty{#1}%
     {\acme@thmsinfalse}%
     {\@ifundefined{c@#1}{\@nocounterr{#1}}%
       {\acme@thmsintrue\acme@thmsasfalse\def\@NumberTheorems{#1}}}}
  \NumberTheoremsIn{section}%

\def\NumberTheoremsAs#1{\@ifempty{#1}%
     {\acme@thmsasfalse}%
     {\@ifundefined{c@#1}{\@nocounterr{#1}}%
       {\acme@thmsinfalse\acme@thmsastrue\acme@thm@necountertrue\def\@NumberTheorems{#1}}}}
  \NumberTheoremsAs{}%

\def\SwapTheoremNumbers{\def\thm@swap{S}}

\def\NoSwapTheoremNumbers{\def\thm@swap{N}}
  \NoSwapTheoremNumbers

\def\acme@thmdefs{%
  \theoremstyle{plain}
  \ifacme@thm@necounter
  \ifacme@thmsin
  \newcounter{acmethm}[\@NumberTheorems]%
  \xdef\theacmethm
         {\expandafter\noexpand\csname the\@NumberTheorems\endcsname
           \@thmcountersep\@thmcounter{acmethm}}%
    \gdef\acme@thm{acmethm}%
    \else
    \ifacme@thmsas
    \xdef\acme@thm{\@NumberTheorems}%
    \else
    \newcounter{acmethm}%
    \gdef\acme@thm{acmethm}%
    \fi\fi\fi

  \ifacme@thm@necounter
    \newtheorem{theo}[\acme@thm]{\theoname}%
    \newtheorem{prop}[\acme@thm]{\propname}%
    \newtheorem{conj}[\acme@thm]{\conjname}%
    \newtheorem{coro}[\acme@thm]{\coroname}%
    \newtheorem{lemm}[\acme@thm]{\lemmname}%
    \theoremstyle{definition}%
    \newtheorem{defi}[\acme@thm]{\definame}%
    \theoremstyle{remark}%
    \newtheorem{nota}[\acme@thm]{\notaname}%
    \newtheorem{notas}[\acme@thm]{\notasname}%
    \newtheorem{rema}[\acme@thm]{\remaname}%
    \newtheorem{remas}[\acme@thm]{\remasname}%
    \newtheorem{exem}[\acme@thm]{\exemname}%
    \newtheorem{exems}[\acme@thm]{\exemsname}%
  \else\ifacme@thmsin
    \newtheorem{theo}{\theoname}[\@NumberTheorems]%
    \newtheorem{prop}{\propname}[\@NumberTheorems]%
    \newtheorem{conj}{\conjname}[\@NumberTheorems]%
    \newtheorem{coro}{\coroname}[\@NumberTheorems]%
    \newtheorem{lemm}{\lemmname}[\@NumberTheorems]%
    \theoremstyle{definition}%
    \newtheorem{defi}{\definame}[\@NumberTheorems]%
    \theoremstyle{remark}%
    \newtheorem{nota}{\notaname}[\@NumberTheorems]%
    \newtheorem{notas}{\notasname}[\@NumberTheorems]%
    \newtheorem{rema}{\remaname}[\@NumberTheorems]%
    \newtheorem{remas}{\remasname}[\@NumberTheorems]%
    \newtheorem{exem}{\exemname}[\@NumberTheorems]%
    \newtheorem{exems}{\exemsname}[\@NumberTheorems]%
  \else
    \newtheorem{theo}{\theoname}%
    \newtheorem{prop}{\propname}%
    \newtheorem{conj}{\conjname}%
    \newtheorem{coro}{\coroname}%
    \newtheorem{lemm}{\lemmname}%
    \theoremstyle{definition}%
    \newtheorem{defi}{\definame}%
    \theoremstyle{remark}%
    \newtheorem{nota}{\notaname}%
    \newtheorem{notas}{\notasname}%
    \newtheorem{rema}{\remaname}%
    \newtheorem{remas}{\remasname}%
    \newtheorem{exem}{\exemname}%
    \newtheorem{exems}{\exemsname}%
  \fi\fi

  \theoremstyle{definition}%
  \newtheorem*{defi*}{\definame}%
  \theoremstyle{remark}%
  \newtheorem*{nota*}{\notaname}%
  \newtheorem*{notas*}{\notasname}%
  \newtheorem*{rema*}{\remaname}%
  \newtheorem*{remas*}{\remasname}%
  \newtheorem*{exem*}{\exemname}%
  \newtheorem*{exems*}{\exemsname}%
  \theoremstyle{plain}%
  \newtheorem*{theo*}{\theoname}%
  \newtheorem*{prop*}{\propname}%
  \newtheorem*{conj*}{\conjname}%
  \newtheorem*{coro*}{\coroname}%
  \newtheorem*{lemm*}{\lemmname}%
}

\def\acme@enoncedef{%
  \newenvironment{enonce}[2][plain]%
    {\let\acmeenonce\relax \theoremstyle{##1}%
      \ifacme@thm@necounter
      \newtheorem{acmeenonce}[\acme@thm]{##2}%
      \else
      \ifacme@thmsin
      \newtheorem{acmeenonce}{##2}[\@NumberTheorems]%
      \else
      \newtheorem{acmeenonce}{##2}%
      \fi\fi
     \begin{acmeenonce}}%
    {\end{acmeenonce}}%
  \newenvironment{enonce*}[2][plain]%
    {\let\acmeenonce\relax \theoremstyle{##1}%
     \newtheorem*{acmeenonce}{##2}%
     \begin{acmeenonce}}%
    {\end{acmeenonce}}}

\AtBeginDocument{\acme@thmdefs\acme@enoncedef}

\def\propname{Proposition}%
\def\conjname{Conjecture}%
\def\notaname{Notation}%
\def\notasname{Notations}%

\AtBeginDocument{%
  \providecommand\iflanguage[3]{}% in case babel is not used

  \iflanguage{francais}{%
    \def\theoname{Th\'eor\`eme}%
    \def\coroname{Corollaire}%
    \def\lemmname{Lemme}%
    \def\definame{D\'efinition}%
    \def\remaname{Remarque}%
    \def\remasname{Remarques}%
    \def\exemname{Exemple}%
    \def\exemsname{Exemples}}
  {}

  \iflanguage{english}{%
    \def\theoname{Theorem}%
    \def\coroname{Corollary}%
    \def\lemmname{Lemma}%
    \def\definame{Definition}%
    \def\remaname{Remark}%
    \def\remasname{Remarks}%
    \def\exemname{Example}%
    \def\exemsname{Examples}}
  {}
}

%% 'equalenv' makes two environment the same thing: #1 <-- #2
\def\equalenv#1#2{%
  \@ifundefined{#1}{
    \@xp\let\csname #1\@xp\endcsname\csname #2\endcsname
    \@xp\let\csname end#1\@xp\endcsname\csname end#2\endcsname}
  {\message{#1 already defined: I won't redefine it!^^J}}}

\equalenv{theorem}{theo}
\equalenv{thm}{theo}
\equalenv{thm*}{theo*}
\equalenv{lemma}{lemm}


%% Geometry
\paperwidth165mm
\paperheight225mm

\textwidth125mm
\newdimen\Textwidth \Textwidth125mm

\ifx\undefined\pdfpagewidth\else
  \pdfpagewidth\paperwidth
  \pdfpageheight\paperheight
\fi

\topmargin-5.4mm
\oddsidemargin-5.4mm
\evensidemargin-5.4mm
\headheight12pt
\headsep-12pt
\topskip14pt
\normaltopskip14pt
\global\normalbaselineskip=12.5pt
\textheight=\topskip
\advance\textheight36\normalbaselineskip
\advance\textheight3\normalbaselineskip


%% Typography
\csname url@samestyle\endcsname
%% C&J parameters for Utopia
\pretolerance=800
\tolerance=1800
\emergencystretch1em

% manual tweakings
\widowpenalty3000
\clubpenalty3000
\brokenpenalty3000
\footskip\normalbaselineskip
\def\footnoterule{\relax}

\skip\footins18pt plus 4pt minus 4pt
\parskip0pt
\parindent1em
\normalparindent1em

\renewcommand\baselinestretch{}

\smallskipamount.5\normalbaselineskip minus .5pt
\medskipamount1\normalbaselineskip  minus .6pt
\bigskipamount2\normalbaselineskip plus 1pt minus 1pt

\AtBeginDocument{\iflanguage{francais}{\frenchspacing}{}}

% Utopia-Fourier
\RequirePackage{lmodern}
\def\verbatim@font{\normalfont\verbatimfontsize\ttfamily}
\def\verbatimfontsize{\normalsize}
\def\displayverbatimfontsize{\small}

\RequirePackage[upright]{fourier}

% logos
\def\TeX{T\kern-.18em\lower.5ex\hbox{E}\kern-.06emX\@}

\DeclareRobustCommand{\LaTeX}{%
  L\kern-.26em
  {\sbox\z@ T%
    \vbox to\ht\z@{%
      \hbox{\check@mathfonts
        \fontsize\sf@size\z@
        \math@fontsfalse\selectfont A}%
      \vss}}\kern-.1em\TeX}

\DeclareRobustCommand{\LaTeXe}{\mbox{\m@th
  \if b\expandafter\@car\f@series\@nil\boldmath\fi
  \LaTeX\kern.15em2$_{\textstyle\varepsilon}$}}


%% Metadatas
% title
\let\@altabstract\@empty
\let\@alttitle\@empty
\renewcommand*{\title}[2][]{%
  \@ifempty{#1}{
    \gdef\shorttitle{#2}\gdef\@shorttitle{#2}}
  {\gdef\shorttitle{#1}\gdef\@shorttitle{#1}}
  \gdef\@title{#2}}

\edef\title{\@nx\@dblarg
  \@xp\@nx\csname\string\title\endcsname}
\newcommand*{\alttitle}[1]{\gdef\@alttitle{#1}}%

% keywords
\newcommand*{\altkeywords}[1]{\gdef\@altkeywords{#1}}%

% abstract
\newbox\altabstractbox
\newenvironment{altabstract}{%
  \ifx\maketitle\relax
    \ClassWarning{\@classname}{Altabstract should precede
      \protect\maketitle\space in AMS document classes; reported}%
  \fi
  \global\setbox\altabstractbox=\vtop \bgroup
    \normalfont\Small
    \list{}{\labelwidth\z@
      \leftmargin3pc \rightmargin\leftmargin
      \listparindent\normalparindent \itemindent\z@
      \parsep\z@ \@plus\p@
      \let\fullwidthdisplay\relax
    }%
    \item[\hskip\labelsep\scshape\altabstractname.]%
}{%
  \endlist\egroup
  \ifx\@setaltabstract\relax \@setaltabstracta \fi
}
\def\@setaltabstract{\@setaltabstracta \global\let\@setaltabstract\relax}
\def\@setaltabstracta{%
\ifx\@empty\@alttitle\else
  \begin{center}%
  \large\slshape \@alttitle
  \end{center}%
\fi
  \ifvoid\altabstractbox
  \else
    \box\altabstractbox
    \prevdepth\z@ % because \altabstractbox is a vtop
  \fi
}
\def\@setabstract{\@setabstracta \global\let\@setabstract\relax
\@setaltabstract}
\def\abstractheadfont{\scshape}

% font
\normalsize
\linespacing\baselineskip
\let\ept\Small

% specific macros
\RequirePackage{amssymb}
\let\le\leqslant
\let\ge\geqslant
\let\leq\leqslant
\let\geq\geqslant
\def\hb{\hfill\break}

\def\pointir{\discretionary{.}{}{.\kern.3em---\kern.4em\ignorespaces}}
\def\threestars{%
  \bigskip
  \null
  \begin{center}%
    \Large
    *\\[.2em]
  *\hspace*{1.2em}*
  \end{center}%
  \bigskip
}

\def\Par{\vspace{\baselineskip}\@par}% empty line and new paragraph
\def\thsp{\iflanguage{francais}{\,\fi}{}}


%% No roman numerotations
\def\@upn#1{#1}


%% Useful macros
\def\tn#1{\text{\normalfont#1}}
\newcommand\nfrac[2]{#1/#2}
\newcommand\pfrac[2]{(#1/#2)}


%% Layout
% first page
\pagenumbering{arabic}%

% copyright notice
\def\@setcopyright{}%

% Normal page style
\unitlength1mm
\def\ps@cg{%\ps@empty
  \def\@evenhead{%
    \def\thanks{\protect\thanks@warning}%
  }%
  \def\@oddhead{%
    \def\thanks{\protect\thanks@warning}%
  }%
  \def\@evenfoot{%
    \begin{picture}(0,0)
      % croix du bas
      % \put(-20,-4){\rule[-10mm]{.4bp}{20mm}}%
      % \put(-30,-4){\rule[-.2bp]{20mm}{.4bp}}%
      \put(0,-11){\makebox[0pt][r]{\normalfont\itshape\let\\\space \@ifnotempty\@subtitle}}
      \put(-6,-11){\makebox[0pt][r]{\huge\thepage}}%
    \end{picture}%
  }
  \def\@oddfoot{%
    \hfill
    \begin{picture}(0,0)
      % croix du bas
      % \put(20,-4){\rule[-10mm]{.4bp}{20mm}}
      % \put(10,-4){\rule[-.2bp]{20mm}{.4bp}}
      \put(0,-11){\makebox[0pt][r]{\normalfont\itshape\let\\\space \@shorttitle}}
      \put(6,-11){\makebox[0pt][l]{\huge\thepage}}%
    \end{picture}}}

\let\ps@plain\ps@cg
\pagestyle{cg}%

% first page style
\def\ps@firstpage{\ps@plain
  \def\@oddfoot{%
    \global\topskip\normaltopskip}%
  \let\@evenfoot\@oddfoot
  \def\@oddhead{%
    \hfill
    \begin{picture}(0,0)% croix du haut
      % \put(20,3){\rule[-10mm]{.4bp}{20mm}}%
      % \put(10,3){\rule[-.2bp]{20mm}{.4bp}}%
      % \put(20,3){\circle{4}}%
    \end{picture}}%

  \let\@evenhead\@oddhead% in case an article starts on a left-hand page
}


%% Title page
% title
\def\@settitle{%
  \bgroup
  \raggedright\rightskip\@bigflushglue
  \advance\rightskip25mm
  \normalfont\Huge
  \uppercasenonmath\@title
  \noindent
  \foreign@language{nohyphenation}%
  \aldineleft\kern.5em\@title\unskip\@@par
  \egroup}

% authors
\def\author@andify{%
  \nxandlist {\unskip ,\penalty-2 \space\ignorespaces}%
  {\unskip ,\penalty-2 \space\ignorespaces}%
  {\unskip ,\penalty-2 \space\ignorespaces}}

\def\initial#1{#1}
\def\lastname#1{#1}
\def\firstname#1{#1}
\def\middlename#1{#1}
\def\vonname#1{#1}
\newcount\acme@thankcount
\acme@thankcount0
\def\@setauthors{%
  \begingroup
  \def\thanks{\protect\thanks@warning}%
  \raggedright
  \Large
  \def\lastname##1{\scshape{##1}}%
  \def\firstname##1{\mbox{##1}}%
  \author@andify\authors
  \def\\{\protect\linebreak}%
  \unskip\kern.5em\raisebox{0pt}{\oldpilcrowone}\kern.35em\authors
  \vskip16pt
  \endgroup}

\def\@setdedicatory{\normalfont\noindent\hskip.15\columnwidth\begingroup\hsize=.85\columnwidth
    \vtop{\raggedleft{\Small\em\@dedicatory\@@par}}\endgroup\vskip6pt}


%% Last page
\newdimen\authwidth\authwidth.45\textwidth
\newcount\auth@count
\auth@count0
\newcount\noauth@count
\noauth@count0
\def\@setaddresses{\par
  \begingroup
  \def\lastname##1{\scshape{##1}}%
  \def\firstname##1{\mbox{##1}}%
  \def\author##1{\ifcase\auth@count
    \def\tab@@what{}\or
    \def\tab@@what{&}\or
    \def\tab@@what{\tabularnewline[.4\baselineskip]}\or
    \def\tab@@what{&}\or
    \def\tab@@what{\tabularnewline[.4\baselineskip]}\or
    \def\tab@@what{&}\or
    \def\tab@@what{\tabularnewline[.4\baselineskip]}\fi
	\tab@@what
    \global\advance\auth@count1\relax
    \@ifnotempty{##1}{{\smaller\oldpilcrowtwo}\kern.35em\ignorespaces##1\unskip\\}}%
  \def\noauthor##1##2{\ifcase\noauth@count
    \def\tab@@what{}\or
    \def\tab@@what{&}\or
    \def\tab@@what{\tabularnewline[.4\baselineskip]}\or
    \def\tab@@what{&}\or
    \def\tab@@what{\tabularnewline[.4\baselineskip]}\or
    \def\tab@@what{&}\or
    \def\tab@@what{\tabularnewline[.4\baselineskip]}\fi
	\tab@@what
    \global\advance\noauth@count1\relax
    \@ifnotempty{##2}{{\smaller\oldpilcrowtwo}\kern.35em\ignorespaces##2\unskip\\}}%
   \def\address##1##2{%
     \@ifnotempty{##1}{(\ignorespaces##1\unskip)\\}%
     \ignorespaces##2\unskip\\}%
 \def\curraddr##1##2{%
     \@ifnotempty{##2}{\curraddrname{}%
       \@ifnotempty{##1}{(\ignorespaces##1\unskip)}:\\
       ##2\\}}%
   \def\email##1##2{%
     \@ifnotempty{##2}{%
       \href{mailto:##2}{##2}\\}}%
   \def\urladdr##1##2{%
     \@ifnotempty{##2}{%
       \url{##2}\\}}%
   \footnotesize
   \begin{longtable}[t]{*{2}{>{\raggedright}p{\authwidth}}}
     \addresses
   \end{longtable}
   \endgroup}%


%% Final
% tables
\RequirePackage{array, longtable, booktabs}

\def\enddoc@text{%
  \normalfont\footnotesize
  \nobreak\addvspace{6mm}\parindent=0pt\parskip0pt\relax
  \ifx\@empty\addresses \else\@setaddresses\fi\@@par}

\def\printauthors{\xdef\enddoc@text{}\normalfont\footnotesize
  \nobreak\addvspace{6mm}\parindent=0pt\parskip0pt\relax
  \ifx\@empty\addresses \else\@setaddresses\fi\@@par}

\def\@adminfootnotes{%
  \begingroup%
  \let\@makefnmark\relax  \let\@thefnmark\relax
  \endgroup}

\def\@setthanks{%
  \def\thanks##1{\@@par\noindent \textsc{Note}\pointir##1\@addpunct.}%
  \thankses}

\def\@setsubjclass{%
  {\slshape\subjclassname\thsp:}\space\@subjclass\@addpunct.}

\def\@setkeywords{%
  {\slshape \keywordsname\thsp:}\space \@keywords\@addpunct.}

\AtBeginDocument{%
  \iflanguage{francais}{%
    \def\keywordsname{Mots-cles}
    \def\subjclassname{Classification math.}
    \renewcommand{\abstractname}{R\'esum\'e}
    \newcommand{\altabstractname}{Abstract}}
  {%
    \def\keywordsname{Keywords}
    \def\subjclassname{Math. classification}
    \newcommand{\altabstractname}{R\'esum\'e}}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% Sections
\ifacme@book
  \newcounter{chapter}
  \renewcommand\thechapter{\arabic{chapter}}

  \let\chapterrunhead\partrunhead
  \let\sectionrunhead\partrunhead
  \def\chapter{%
    {\pagestyle{empty}\cleardoublepage}
    \thispagestyle{plain}\global\@topnum\z@
    \@afterindenttrue\secdef\@chapter\@schapter}

  \def\@chapter[#1]#2{\refstepcounter{chapter}%
    \ifnum\c@secnumdepth<\z@ \let\@secnumber\@empty
    \else \let\@secnumber\thechapter \fi
    \typeout{\chaptername\space\@secnumber}%
    \def\@toclevel{0}%
    \ifx\chaptername\appendixname \@tocwriteb\tocappendix{chapter}{#2}%
    \else \@tocwriteb\tocchapter{chapter}{#2}\fi
    \addtocontents{lof}{\protect\addvspace{10\p@}}%
    \addtocontents{lot}{\protect\addvspace{10\p@}}%
    \@makechapterhead{#2}\@afterheading}

  \def\@schapter#1{\typeout{#1}%
    \let\@secnumber\@empty
    \def\@toclevel{0}%
    \ifx\chaptername\appendixname \@tocwriteb\tocappendix{chapter}{#1}%
    \else \@tocwriteb\tocchapter{chapter}{#1}\fi
    \addtocontents{lof}{\protect\addvspace{10\p@}}%
    \addtocontents{lot}{\protect\addvspace{10\p@}}%
    \@makeschapterhead{#1}\@afterheading}

  \newcommand\chaptername{Chapter}

  \def\@makechapterhead#1{\global\topskip 7.5pc\relax
    \begingroup
    \fontsize{\@xivpt}{18}\bfseries\centering
      \ifnum\c@secnumdepth>\m@ne
        \leavevmode \hskip-\leftskip
        \rlap{\vbox to\z@{\vss
            \centerline{\normalsize\mdseries
                \uppercase\@xp{\chaptername}\enspace\thechapter}
            \vskip 3pc}}\hskip\leftskip\fi
       #1\par \endgroup
    \skip@34\p@ \advance\skip@-\normalbaselineskip
    \vskip\skip@}

  \def\@makeschapterhead#1{\global\topskip 7.5pc\relax
    \begingroup
    \fontsize{\@xivpt}{18}\bfseries\centering
    #1\par \endgroup
    \skip@34\p@ \advance\skip@-\normalbaselineskip
    \vskip\skip@}
\fi

\renewcommand\section{%
  \@startsection{section}{1}{\normalparindent}%
  {14pt plus 3pt minus 2pt}{1sp}
  {\normalfont\bfseries\scshape}}

\renewcommand\subsection{%
  \@startsection{subsection}{2}{\normalparindent}%
  {12.5pt plus 3pt minus 2pt}{1sp}
  {\normalfont\scshape}}

\renewcommand\subsubsection{%
  \@startsection{subsubsection}{3}{\normalparindent}%
  {12.5pt plus 3pt minus 2pt}{1sp}
  {\normalfont\itshape}}

\renewcommand\paragraph{%
  \@startsection{paragraph}{4}{\parindent}%
  {3mm}{-.2em}{\normalfont\scshape}}

\newcommand\paragraphc{%
  \@startsection{paragraph}{4}{\parindent}%
  {3mm}{1sp}{\normalfont\scshape}}

\renewcommand\subparagraph{%
  \@startsection{subparagraph}{5}{\parindent}%
  {3mm}{-.2em}{\normalfont\itshape}}

\newcommand{\subparagraphc}{%
  \@startsection{subparagraph}{5}{\parindent}%
  {3mm}{1sp}{\normalfont\itshape}}

\renewcommand{\@seccntformat}[1]{%
  {\upshape\csname the#1\endcsname}.\hspace{0.5em}\ignorespaces}

\def\acme@secpoint{\pointir}
\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{3}
\numberwithin{equation}{section}


%% Bibliography
\renewcommand{\@bibtitlestyle}{\section*{\bibname}}
\AtBeginDocument{%
  \@ifpackageloaded{hyperref}{
    \hypersetup{%
      pdftex,
      colorlinks=true,
      pdftitle=\@title,
      pdfauthor=\authors,
      pdfsubject=\@subjclass,
      pdfpagelayout=SinglePage,
      pdfkeywords=\@keywords}
  }{%
    \def\url#1{#1}%
    \def\href#1#2{#2}}}

%% Lists
\newcount\acme@listdepth \acme@listdepth=0
\def\acme@list{%
  \ifnum \acme@listdepth > 5\relax
   \@toodeep
  \else
   \edef\acme@margin{acme@leftmargin\romannumeral\the\acme@listdepth}
   \global\advance\acme@listdepth\@ne
  \fi}

\def\endacme@list{\global\advance\acme@listdepth\m@ne\endgroup}
\def\acme@list@indent{%
   \@tempdima=\leftskip
   \ifdim\@totalleftmargin>\z@
     \@tempdima=\@totalleftmargin\fi
   \begingroup
     \@@par\advance\@tempdima\@xp\csname\acme@margin\endcsname
     \leftskip\@tempdima}

\newenvironment{acme@enumerate}[1][]{%
  \acme@list
  \ifnum \@enumdepth >\thr@@ \@toodeep\else
    \advance\@enumdepth \@ne
    \acme@list@indent
    \edef\@enumctr{enum\romannumeral\the\@enumdepth}%
    \@ifnotempty{#1}{%
      \@xp\def\csname acme@the\@enumctr\endcsname{\csname #1\endcsname{\@enumctr}}}%
    \renewcommand\item[1][]{%
      \ifvmode\else\unskip\fi\@@par
      \refstepcounter{\@enumctr}%
      \@ifempty{##1}{%
        \@xp\csname acme@label\@enumctr\endcsname{\csname acme@the\@enumctr\endcsname}}
      {##1}\kern.3em\ignorespaces}%
  \fi}
{\@@par\setcounter{\@enumctr}{0}\endacme@list}

\newenvironment{acme@itemize}[1][]{%
  \acme@list
  \ifnum \@itemdepth >\thr@@\@toodeep\else
    \advance\@itemdepth\@ne
    \acme@list@indent
    \edef\acme@itemitem{acme@labelitem\romannumeral\the\@itemdepth}%
    \@ifnotempty{#1}{\def\@tmpa{#1}\def\acme@itemitem{@tmpa}}%
    \renewcommand\item[1][]{%
      \ifvmode\else\unskip\fi\@@par
      \@ifempty{##1}{%
        \@xp\csname\acme@itemitem\endcsname}
      {##1}\kern.3em\ignorespaces}%
  \fi}
{\@@par\endacme@list}

\def\acme@theenumi{\@arabic\c@enumi}
\def\acme@theenumii{\@alph\c@enumii}
\def\acme@theenumiii{\@roman\c@enumiii}
\def\acme@theenumiv{\@roman\c@enumiv}
\def\acme@labelenumi#1{#1.}
\def\acme@labelenumii#1{(#1)}
\def\acme@labelenumiii#1{\textsc{#1}.}
\def\acme@labelenumiv#1{(#1)}
\newdimen\acme@leftmargin
\newdimen\acme@leftmargini
\newdimen\acme@leftmarginii
\newdimen\acme@leftmarginiii
\newdimen\acme@leftmarginiv
\newdimen\acme@leftmarginv
\newdimen\acme@leftmarginvi
\acme@leftmargin0pt
\acme@leftmargini\normalparindent
\acme@leftmarginii\normalparindent
\acme@leftmarginiii\normalparindent
\acme@leftmarginiv\normalparindent
\acme@leftmarginv\normalparindent
\acme@leftmarginvi\normalparindent
\def\acme@labelitemi{---}
\def\acme@labelitemii{---}
\def\acme@labelitemiii{--}
\def\acme@labelitemiv{--}
\AtBeginDocument{%
\let\itemize\acme@itemize
\let\enditemize\endacme@itemize
\let\enumerate\acme@enumerate
\let\endenumerate\endacme@enumerate
}


%% Floats
\def\@captionheadfont{\small}
\def\@captionfont{\small}
\def\captionseparator{\pointir}
\newskip\abovecaptionskip \abovecaptionskip=12pt \relax
\newskip\belowcaptionskip \belowcaptionskip=12pt \relax
\newdimen\captionindent \captionindent=\normalparindent
\numberwithin{figure}{section}
\numberwithin{table}{section}
\newskip\@bigflushglue\@bigflushglue-20mm plus 1fil
\newcommand{\LargeOddCentering}{\let\\\@centercr\rightskip\@bigflushglue
\leftskip\z@\parindent\z@\parfillskip\z@skip}
\newcommand{\LargeEvenCentering}{\let\\\@centercr\rightskip\z@
\leftskip\@bigflushglue\parindent\z@\parfillskip\z@skip}
\def\Largecenter{\trivlist\ifodd\c@page\LargeOddCentering\else\LargeEvenCentering\fi\item\relax}
\def\endLargecenter{\endtrivlist}

\ifx\oldpilcrowone\undefined
  \let\oldpilcrowone \P
  \let\oldpilcrowtwo \P
\fi


\endinput

%%% Local Variables:
%%% TeX-master: "./demo.tex"
%%% End:
