% Time-stamp: <2011-03-25 10:59:35 cmauclai>
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
\ProvidesClass{acmejdt}[2011/03/25 The EDSYS congress class for articles.]


% Use the firs three macros to set the variables.
% This can be overriden in the document.
\def\jdtyear{\def\@jdtyear}
\def\jdtdate{\def\@jdtdate}
\def\jdtplace{\def\@jdtplace}


% Give the rest to the 'acmeyatcl' class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{acmeyatcl}}
\ProcessOptions\relax

\LoadClass[twoside,10pt]{acmeyatcl}

\firstline{Journ\'ees des th\`eses \@jdtyear}
\secondline{Branche TIS (DCPS/DCSD/DTIM)}
\thirdline{\@jdtdate\ \`a \@jdtplace}


%%% Local Variables:
%%% TeX-master: "./demo.tex"
%%% End:
