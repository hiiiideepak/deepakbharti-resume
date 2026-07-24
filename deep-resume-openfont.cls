% Deep Resume — open-font CV class (XeLaTeX)
\ProvidesClass{deep-resume-openfont}[2026/07/22 CV class]
\NeedsTeXFormat{LaTeX2e}
\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[10pt]{article}

% Package imports
\usepackage[hmargin=1.1cm, vmargin=0.75cm]{geometry}
\usepackage[usenames,dvipsnames]{xcolor}
\usepackage{hyperref}
\usepackage{titlesec}
\usepackage[absolute]{textpos}
\usepackage[UKenglish]{babel}
\usepackage[UKenglish]{isodate}
\usepackage{fontspec,xltxtra,xunicode}
\usepackage{enumitem}
\usepackage{graphicx}

% Color palette
\definecolor{date}{HTML}{666666}
\definecolor{primary}{HTML}{2B2B2B}
\definecolor{headings}{HTML}{555555}
\definecolor{subheadings}{HTML}{333333}
\definecolor{company}{HTML}{1B3A5C}
\definecolor{muted}{HTML}{777777}
\definecolor{skyblue}{HTML}{87CEEB}
\definecolor{gold}{HTML}{FFD700}

% Typography
\defaultfontfeatures{Mapping=tex-text,Ligatures=TeX}
\setmainfont[Color=primary, Path=fonts/lato/, BoldFont=Lato-Bol, ItalicFont=Lato-RegIta]{Lato-Reg}
\setsansfont[Scale=MatchLowercase, Mapping=tex-text, Path=fonts/raleway/]{Raleway-ExtraLight}

\newcommand{\custombold}[1]{%
  {\color{subheadings}\fontspec[Path=fonts/lato/]{Lato-Bol}\selectfont #1}%
}

\newcommand{\boxedlink}[2]{%
  \fcolorbox{skyblue}{white}{\href{#1}{#2}}%
}

\newcommand{\boxedlinkbold}[2]{%
  \fcolorbox{skyblue}{white}{{\bfseries\href{#1}{#2}}}%
}

\setlength{\parindent}{0pt}
\setlength{\parskip}{0pt}
\linespread{1.05}
\pagestyle{empty}

% Hyperlinks
\hypersetup{%
  colorlinks=true,
  linkcolor=company,
  urlcolor=company,
  pdfborder={0 0 0}
}

% Date block (optional)
\setlength{\TPHorizModule}{1mm}
\setlength{\TPVertModule}{1mm}
\textblockorigin{0mm}{5mm}
\newcommand{\lastupdated}{%
  \begin{textblock}{60}(165,0)
    \color{date}%
    \fontspec[Path=fonts/raleway/]{Raleway-ExtraLight}%
    \fontsize{8pt}{10pt}\selectfont
    Last Updated on \today
  \end{textblock}%
}

% Header
\newcommand{\namesection}[3]{%
  \centering
  {\sffamily
    \fontspec[Path=fonts/lato/]{Lato-Hai}\fontsize{34pt}{38pt}\selectfont #2\par
    \vspace{4pt}
    \color{headings}%
    \fontspec[Path=fonts/raleway/]{Raleway-Medium}%
    \fontsize{10.5pt}{13pt}\selectfont #3\par
  }
  \vspace{8pt}
}

% Section headings
\titleformat{\section}{%
  \color{headings}%
  \scshape
  \fontspec[Path=fonts/lato/]{Lato-Bol}%
  \fontsize{13pt}{16pt}\selectfont
  \raggedright\uppercase
}{}{0em}{}

\titlespacing*{\section}{0pt}{8pt}{4pt}

\titleformat{\subsection}{%
  \color{subheadings}%
  \fontspec[Path=fonts/lato/]{Lato-Bol}%
  \fontsize{10.5pt}{13pt}\selectfont
  \bfseries
}{}{0em}{}

\titlespacing{\subsection}{0pt}{4pt}{2pt}
\titlespacing{\subsubsection}{0pt}{3pt}{1pt}

% Skills subsections with a little extra breathing room
\newif\ifskillfirst
\skillfirsttrue
\newcommand{\skillsubsection}[1]{%
  \ifskillfirst
    \skillfirstfalse
  \else
    \vspace{3.5pt}%
  \fi
  \subsection{#1}%
}

% Generic run-in heading (Summary, etc.)
\newcommand{\runsubsection}[1]{%
  {\color{subheadings}%
  \fontspec[Path=fonts/lato/]{Lato-Bol}%
  \fontsize{10.5pt}{13pt}\selectfont\bfseries #1\par}%
}

% Company name — dark blue, linked when wrapped in \href
\newcommand{\companyname}[1]{%
  {\color{company}%
  \fontspec[Path=fonts/lato/]{Lato-Bol}%
  \fontsize{11pt}{14pt}\selectfont #1}%
}

% Project name — bold styling
\newcommand{\projectname}[1]{%
  {\fontspec[Path=fonts/lato/]{Lato-Bol}%
  \fontsize{10pt}{12pt}\selectfont #1}%
}

% Company | role | dates | location (single header line)
\newcommand{\companyheader}[5]{%
  \href{#1}{\companyname{#2}} \textbar{} %
  {\color{muted}%
  \fontspec[Path=fonts/raleway/]{Raleway-Medium}%
  \fontsize{9.5pt}{12pt}\selectfont
  #3 \textbar{} #4 \textbar{} #5\par}%
}

% Company header with logo
\newcommand{\companyheaderlogo}[6]{%
  \includegraphics[height=0.35cm]{#1} \href{#2}{\companyname{#3}} \textbar{} %
  {\color{muted}%
  \fontspec[Path=fonts/raleway/]{Raleway-Medium}%
  \fontsize{9.5pt}{12pt}\selectfont
  #4 \textbar{} #5 \textbar{} #6\par}%
}

% Role | dates | location line (standalone)
\newcommand{\roleline}[3]{%
  {\color{muted}%
  \fontspec[Path=fonts/raleway/]{Raleway-Medium}%
  \fontsize{9.5pt}{12pt}\selectfont
  #1 \textbar{} #2 \textbar{} #3}%
}

\newcommand{\descript}[1]{%
  \color{subheadings}%
  \raggedright
  \fontspec[Path=fonts/raleway/]{Raleway-Medium}%
  \fontsize{10pt}{12pt}\selectfont
  {#1\par}%
}

\newcommand{\location}[1]{%
  \color{muted}%
  \raggedright
  \fontspec[Path=fonts/raleway/]{Raleway-Medium}%
  \fontsize{9.5pt}{12pt}\selectfont
  {#1\par}%
}

\newcommand{\locationnormal}[1]{%
  \color{primary}%
  \raggedright
  \fontspec[Path=fonts/raleway/]{Raleway-Medium}%
  \fontsize{9.5pt}{12pt}\selectfont
  {#1\par}%
}

% Vertical rhythm helpers
\newcommand{\sectionsep}{\vspace{5pt}}
\newcommand{\entrysep}{\vspace{6pt}}
\newcommand{\leftsectionbreak}{\vspace{8.5pt}}

% Compact bullet lists with readable line spacing
\newenvironment{tightemize}{%
  \begin{itemize}[
    leftmargin=12pt,
    itemsep=2pt,
    topsep=2pt,
    parsep=0pt,
    partopsep=0pt
  ]
}{%
  \end{itemize}%
}

% Skill line helper
\newcommand{\skillline}[1]{%
  {\fontsize{10pt}{13pt}\selectfont #1\par}%
}
