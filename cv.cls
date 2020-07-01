%---------
% CV Class
%---------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cv}[2020/05/16 James Ball]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{extarticle}}
\ProcessOptions\relax

\LoadClass{extarticle}

%---------
% Document
%---------

\setlength{\parindent}{0mm}

\usepackage[hidelinks]{hyperref}

\newcommand{\lorem}{Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a diam lectus.}

\pagestyle{empty}

\usepackage{moresize}

%-------
% Layout
%-------

\usepackage{geometry}

\usepackage{seqsplit}

\geometry{
	paper=a4paper,
	top=1.5cm,
	bottom=0cm,
	left=2cm,
	right=2cm,
	headheight=0.75cm,
	footskip=0cm,
	headsep=0.5cm,
	%showframe,
}

%------
% Fonts
%------

\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}

\usepackage[default]{raleway}

\renewcommand*\familydefault{\sfdefault}

\usepackage{fontawesome}

\newcommand{\icon}[3]{
	\vcenteredhbox{\colorbox{black}{\makebox(#2, #2){\textcolor{white}{\large\csname fa#1\endcsname}}}}
	\hspace{0.2cm}
	\vcenteredhbox{\textcolor{black}{#3}}
}

%---------
% Graphics
%---------

\usepackage{tikz}
\usetikzlibrary{backgrounds}
\tikzset{x=1cm, y=1cm}

\newcommand{\vcenteredhbox}[1]{
	\begingroup%
		\setbox0=\hbox{#1}\parbox{\wd0}{\box0}%
	\endgroup%
}

%-------
% Charts
%-------

\newcounter{barcount}

\newenvironment{barchart}[1]{
	\newcommand{\barwidth}{0.35}
	\newcommand{\barsep}{0.2}
	
	\newcommand{\baritem}[2]{
		\pgfmathparse{##2}
		\let\perc\pgfmathresult
		
		\pgfmathparse{#1}
		\let\barsize\pgfmathresult
		
		\pgfmathparse{\barsize*##2/100}
		\let\barone\pgfmathresult
		
		\pgfmathparse{(\barwidth*\thebarcount)+(\barsep*\thebarcount)}
		\let\barx\pgfmathresult
		
		\filldraw[fill=black, draw=none] (0,-\barx) rectangle (\barone,-\barx-\barwidth);
		
		\node [label=180:\colorbox{black}{\textcolor{white}{##1}}] at (0,-\barx-0.175) {};
		\addtocounter{barcount}{1}
	}
	\begin{tikzpicture}
		\setcounter{barcount}{0}
}{
	\end{tikzpicture}
}

%---------
% Sections
%---------

\newcommand{\cvsect}[1]{
	\vspace{\baselineskip}
	\colorbox{black}{\textcolor{white}{\MakeUppercase{\textbf{#1}}}}\\
}

%--------
% Entries
%--------

\usepackage{longtable}
\setlength{\LTpre}{0pt}
\setlength{\LTpost}{0pt}

\setlength{\tabcolsep}{0pt}

\newenvironment{entrylist}{
	\begin{longtable}[H]{l l}
}{
	\end{longtable}
}

\newcommand{\entry}[4]{
	\parbox[t]{0.175\textwidth}{
		#1
	}
	&\parbox[t]{0.825\textwidth}{
		\textbf{#2}
		\hfill
		{\footnotesize \textbf{\textcolor{black}{#3}}}\\
		#4
	}\\\\}

\newcommand{\slashsep}{\hspace{3mm}/\hspace{3mm}}
