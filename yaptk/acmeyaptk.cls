% Time-stamp: <2011-03-25 12:39:01 cmauclai>
%
% YAPTK --- Yet another poster toolkit.
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
% Date: 2011-03-25

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{acmeyaptk}[2011/03/25 The YAPTK class to typeset posters easily.]

\message{#################################}
\message{Yet another poster tooklit.}
\message{Cedric Mauclair -- March 2011}
\message{#################################}
\immediate\write0{}

\LoadClassWithOptions{sciposter}


%% Packages %%
\RequirePackage{amsmath,amssymb,amsthm}
\RequirePackage{dsfont}
\RequirePackage{aeguill,aecompl}
\RequirePackage[amssymb,thinqspace]{SIunits}
\RequirePackage{color,graphicx}
\RequirePackage{multicol}
\RequirePackage{xifthen}


\newsavebox\dummybox
\newlength\dummyboxwidth \dummyboxwidth0pt
\newlength\postermargin  \postermargin25mm


%% Colors %%
\DefineNamedColor{named} {blue}          {rgb} {0.00, 0.29, 0.56}
\DefineNamedColor{named} {white}         {rgb} {1.00, 1.00, 1.00}
\DefineNamedColor{named} {black}         {rgb} {0.00, 0.00, 0.00}
\DefineNamedColor{named} {verylightgray} {rgb} {0.95, 0.95, 0.95}
\DefineNamedColor{named} {lightgray}     {rgb} {0.80, 0.80, 0.80}


%% Boxes %%
\newlength\boxfboxrule  \boxfboxrule4pt
\newlength\boxfboxsep   \boxfboxsep1.2em
\newlength\boxcolumnsep \boxcolumnsep1.4em

\definecolor{boxrulecolor}      {named} {blue}
\definecolor{boxfgcolor}        {named} {black}
\definecolor{boxbgcolor}        {named} {white}

\newenvironment{colorframebox}[2][\linewidth]
{\columnsep\boxcolumnsep
  \fboxsep\boxfboxsep
  \fboxrule\boxfboxrule
  \setlength\dummyboxwidth{#1-2\fboxsep-2\fboxrule}%
  \begin{lrbox}{\dummybox}%
    \begin{minipage}{\dummyboxwidth}%
      \ifthenelse{\isempty{#2}}{}{%
        \section{#2}}}
{   \end{minipage}%
  \end{lrbox}%
  \raisebox{-\depth}{%
    \fcolorbox{boxrulecolor}{boxbgcolor}{%
      \color{boxfgcolor}\usebox{\dummybox}}}\bigskip}


%% Small boxes %%
\newlength\smallboxfboxrule \smallboxfboxrule2pt
\newlength\smallboxfboxsep  \smallboxfboxsep0.4em

\definecolor{smallboxrulecolor} {named} {black}
\definecolor{smallboxfgcolor}   {named} {black}
\definecolor{smallboxbgcolor}   {named} {white}

\newenvironment{smallbox}[1][\linewidth]
{\fboxsep\smallboxfboxsep
  \fboxrule\smallboxfboxrule
  \setlength{\dummyboxwidth}{#1-2\fboxsep-2\fboxrule}%
  \begin{lrbox}{\dummybox}%
    \begin{minipage}{\dummyboxwidth}}
{   \end{minipage}%
  \end{lrbox}%
  \raisebox{-\depth}{%
    \fcolorbox{smallboxrulecolor}{smallboxbgcolor}{%
      \color{smallboxfgcolor}\usebox{\dummybox}}}}

\newenvironment{smallcenteredbox}[1][\linewidth]
{\begin{smallbox}[#1]\begin{center}}
{\end{center}\end{smallbox}}


%% Sections %%
\newlength\sectionfboxrule \sectionfboxrule2pt
\newlength\sectionfboxsep  \sectionfboxsep1ex

\newcommand\sectionstyle{\large\bfseries\color{sectionfgcolor}}

\definecolor{sectionrulecolor}  {named} {blue}
\definecolor{sectionfgcolor}    {named} {blue}
\definecolor{sectionbgcolor}    {named} {verylightgray}

\renewcommand{\section}[1]
{\hfill
  \fboxsep\sectionfboxsep
  \fboxrule\sectionfboxrule
  \fcolorbox{sectionrulecolor}{sectionbgcolor}
    {\hbox to .5\linewidth{\hfill\sectionstyle\relax#1\hfill}}%
  \hfill\vspace{4ex}\par}


%% Miscelaneous %%
\columnseprule0pt
\columnsep25mm

\parindent0mm
\parskip1.5ex plus0.5ex minus 0.5ex
\pagestyle{empty}

\long\outer\def\group #1. #2\par
{\medbreak\noindent{\bfseries#1}\par\vskip1ex{#2}\par%
  \ifdim\lastskip<\medskipamount \removelastskip\penalty55\medskip\fi}


%% Lines %%
\newcommand{\drawLine}[1][.3333\linewidth]{
  \removelastskip\vspace{\medskipamount}
  \hbox to \linewidth{\hfill\vrule width #1 height 1pt depth 1pt\hfill}
  \vspace{\bigskipamount}}


%%% Local Variables:
%%% TeX-master: "./demo.tex"
%%% End:
