\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{simon}[2020-08-06 Custom class for general doc]

\LoadClass[12pt,a4paper]{article}
\renewcommand{\normalsize}{\fontsize{10pt}{12pt}\selectfont}

\RequirePackage{aas_macros, amsmath, amssymb, natbib, hyperref, enumitem, fontspec}
\RequirePackage[usenames,dvipsnames]{xcolor}

\setmainfont[Ligatures=TeX]{Helvetica}
\RequirePackage[margin=1cm,a4paper]{geometry}
\makeatletter
\newcommand\thefontsize[1]{{#1 The current font size is: \f@size pt\par}}
\makeatother

\makeatletter
\def\@subtitle{\@latex@warning@no@line{No \noexpand\subtitle given}}
\def\subtitle#1{\gdef\@subtitle{#1}}
\renewcommand{\maketitle}{%
    \topskip0pt
    \noindent
    {\fontsize{40pt}{48pt}\selectfont\raggedright \color{RoyalBlue} \@title}\vspace{0.2em}
    
    \noindent
    \hspace{0.8em}{\fontsize{20pt}{24pt}\selectfont\raggedright \color{Gray} \@subtitle}\vspace{1em}
    
    \noindent
    \hspace{0.8em}{\large \@author}\raggedright \\
    \hspace{0.8em}\@date
    \vspace{1em}
}
\makeatother

\RequirePackage{titlesec}
% \titleformat*{\section}{\normalsize\bfseries}
\titleformat*{\subsection}{\normalsize\bfseries}
\titleformat{\section}
  {\normalfont\normalsize\bfseries}{\thesection}{1em}{}[{\titlerule[0.8pt]}]
\titlespacing*{\section}
  {0pt}{2ex plus 1ex minus .2ex}{1ex plus .2ex}
\titlespacing*{\subsection}
  {0pt}{1.5ex plus 1ex minus .2ex}{0.4ex plus .2ex}

\pagestyle{empty}
\title{\vspace{-4em} {\normalsize\mytitle{}}}
\author{\vspace{-2em}}
\date{\vspace{-4em}}

\providecommand{\tightlist}{%
  \setlength{\itemsep}{0.5em}\setlength{\parskip}{0pt}}

\newcommand{\rulecolor}[3][black]{\textcolor{#1}{\rule{#2}{#3}}}


\RequirePackage{epigraph}
\setlength{\epigraphwidth}{0.8\textwidth}
\renewcommand{\epigraphsize}{\normalsize}
\renewcommand{\beforeepigraphskip}{1\baselineskip}
\renewcommand{\afterepigraphskip}{1\baselineskip}

\definecolor{shadecolor}{gray}{0.95}
\definecolor{captioncolor}{gray}{0.2}

\RequirePackage[labelfont={bf, color=captioncolor},
  textfont={color=captioncolor}]{caption}

\bibpunct[; ]{(}{)}{,}{a}{}{;}

\newcommand\note[1]{{\color{red} #1}}

\RequirePackage{xparse}
\ExplSyntaxOn
\NewDocumentCommand{\keepvalues}{ O{\parindent,\parskip} }
  {
   \tl_clear:N \l_tmpa_tl
   \clist_map_inline:nn { #1 }
     { \tl_put_right:Nx \l_tmpa_tl { ##1 = \skip_use:N ##1 } }
   \cs_set:Npx \restorevalues { \tl_use:N \l_tmpa_tl }
  }
\ExplSyntaxOff

% vim:set ft=tex:
