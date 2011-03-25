% Time-stamp: <2011-03-25 10:58:28 cmauclai>
%
% Format pour les articles du congres EDSYS.
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
\ProvidesClass{acmeedsys}[2011/03/25 The EDSYS congress class for articles.]


% Use the firs three macros to set the variables.
% This can be overriden in the document.
\def\congressnumber{\def\@congressnumber}
\def\congressdate{\def\@congressdate}
\def\congressplace{\def\@congressplace}


% Give the rest to the 'acmeyatcl' class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{acmeyatcl}}
\ProcessOptions\relax

\LoadClass[twoside,10pt]{acmeyatcl}

\firstline{\@congressnumber\up{e} congr\`es EDSYS}
\secondline{}
\thirdline{\@congressdate\ \`a \@congressplace}


%%% Local Variables:
%%% TeX-master: "./demo.tex"
%%% End:
