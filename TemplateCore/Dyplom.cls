\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Dyplom}[Praca dyplomowa ]

\LoadClass[a4paper,11pt]{report}

\RequirePackage{iftex}
\ifPDFTeX
    \let\strcmp\pdfstrcmp
    \let\XeLaTeX\LaTeX
\fi




\RequirePackage{kvoptions}
\RequirePackage{indentfirst}
\SetupKeyvalOptions{family=Dyplom.cls, prefix=po}
\DeclareStringOption[inz]{thesis}
\ProcessKeyvalOptions*


\ifnum\strcmp{\pothesis}{inz} = 0
    \newcommand{\locallang}{PL}
\fi
\ifnum\strcmp{\pothesis}{mgr} = 0
    \newcommand{\locallang}{PL}
\fi
\ifnum\strcmp{\pothesis}{bsc} = 0
    \newcommand{\locallang}{EN}
\fi
\ifnum\strcmp{\pothesis}{msc} = 0
    \newcommand{\locallang}{EN}
\fi


% -------------------------------------------------------------------
% Wykaz symboli i skrótów
% -------------------------------------------------------------------
\RequirePackage[acronym,symbols,nopostdot]{glossaries}
\setglossarysection{section}
\makeglossaries
\loadglsentries{Glossary}
\ifnum\strcmp{\locallang}{PL} = 0
    \newcommand{\acronymstitle}{Wykaz skrótów i symboli}
\else
    \newcommand{\acronymstitle}{List of Abbreviations and Symbols}
\fi

% -------------------------------------------------------------------
%Czcionki
%--------------------------------------------------------------------
\RequirePackage{amsfonts}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsthm}
\RequirePackage{esint}

\ifXeTeX
    \RequirePackage{mathspec}
    \setmainfont{Latin Modern Roman}
    \setromanfont{Latin Modern Roman}
    \setsansfont{Latin Modern Sans}
    \setmonofont{Latin Modern Mono}

\else
    \RequirePackage{lmodern}
    \renewcommand*\familydefault{\sfdefault}
    \RequirePackage[T1]{fontenc}
\fi
\renewcommand{\familydefault}{\sfdefault}

% -------------------------------------------------------------------
% Podstawowa konfiguracja XeLaTeX
% -------------------------------------------------------------------
\ifXeTeX
    \RequirePackage{xltxtra}
\fi

% -------------------------------------------------------------------
% Lokalizacja XeLaTeX % PL-EN
% -------------------------------------------------------------------
\ifXeTeX
    \RequirePackage{polyglossia}
    \ifnum\strcmp{\locallang}{PL} = 0
        \setdefaultlanguage{polish}
    \else
        \setdefaultlanguage{english}
    \fi
    \setotherlanguage{polish}
    \setotherlanguage{english}

\else
    \RequirePackage[MeX]{polski}
    \ifnum\strcmp{\locallang}{PL} = 0
        \RequirePackage[english,polish]{babel}
        \selectlanguage{polish}
    \else
        \RequirePackage[polish,english]{babel}
        \selectlanguage{english}
    \fi
    \RequirePackage[utf8]{inputenc}
    \DeclareUnicodeCharacter{00B0}{$^{\circ}$}
    \DeclareUnicodeCharacter{00D7}{x}
\fi



% -------------------------------------------------------------------
% spis treści
% -------------------------------------------------------------------
\RequirePackage[nottoc]{tocbibind}
\RequirePackage{titletoc}


% -------------------------------------------------------------------
% Kolory
% -------------------------------------------------------------------
\RequirePackage[usenames,dvipsnames]{xcolor}
\definecolor{mysamplecolor}{rgb}{0.123, 0.456, 0.789}

\definecolor{Blue}{cmyk}{0.50, 0.30, 0, 0}
\definecolor{BlueLight}{cmyk}{0.14, 0.04, 0.03, 0}
\definecolor{BlueDark}{cmyk}{0.73, 0.55, 0.35, 0.32}
\definecolor{Orange}{cmyk}{0.02, 0.41, 0.94, 0}
\definecolor{Tangerine}{RGB}{255, 119, 0}
\definecolor{Gold}{RGB}{255, 209, 0}
\definecolor{Azure}{RGB}{0, 136, 255}
\definecolor{Ultramarine}{RGB}{0, 46, 255}
\definecolor{Black}{cmyk}{75, 68, 67, 90}


%---------------------------------------------------------------------
%Schematy
%---------------------------------------------------------------------
\usepackage{circuitikz}

\usepackage{pgfplots}
\pgfplotsset{compat=1.18}
\usepackage{float}
\usepgfplotslibrary{groupplots}

% -------------------------------------------------------------------
% Ścieżki do grafik
% -------------------------------------------------------------------
\RequirePackage{graphicx}
\graphicspath{{TemplateCore/PNG/}{IMAGE/}}



% -------------------------------------------------------------------
% Dodatki
% -------------------------------------------------------------------
\RequirePackage{etoolbox}
%\RequirePackage[titletoc]{appendix}
\ifnum\strcmp{\locallang}{PL} = 0
    \newcommand{\appendiceslisttitle}{Spis załączników}
    \newcommand{\appendixprefix}{Załącznik}
\else
    \newcommand{\appendiceslisttitle}{List of Appendices}
    \newcommand{\appendixprefix}{Appendix}
\fi
\renewcommand{\appendixname}{\appendixprefix}
\let\appendixname\appendixprefix
% -------------------------------------------------------------------
\RequirePackage{enumitem}
\newlength\docparskip
\setlength{\docparskip}{\parskip}
\setlist[itemize,1]{nosep,
    label=$\bullet$,
}
\setlist[itemize,2]{nosep,label=--}
\setlist[itemize,3]{nosep,label=-}
\setlist[itemize,4]{nosep,label=$\cdot$}


% -------------------------------------------------------------------

\RequirePackage{tikz}

\newcommand{\instytut}[1]{
    \newcommand{\@instytut}{#1}
}
\newcommand{\kierunek}[1]{
    \newcommand{\@kierunek}{#1}
}
\newcommand{\specjalnosc}[1]{
    \newcommand{\@specjalnosc}{#1}
}
\newcommand{\album}[1]{
    \newcommand{\@album}{#1}
}
\newcommand{\promotor}[1]{
    \newcommand{\@promotor}{#1}
}
\newcommand{\engtitle}[1]{
    \newcommand{\@engtitle}{#1}
}
\newcommand{\longdate}[1]{
    \newcommand{\@longdate}{#1}
}

\ifnum\strcmp{\pothesis}{inz} = 0
    \newcommand{\frontpageheader}{inzhead.png}
\fi
\ifnum\strcmp{\pothesis}{mgr} = 0
    \newcommand{\frontpageheader}{mgrhead.png}
\fi
\ifnum\strcmp{\pothesis}{bsc} = 0
    \newcommand{\frontpageheader}{bschead.png}
\fi
\ifnum\strcmp{\pothesis}{msc} = 0
    \newcommand{\frontpageheader}{mschead.png}
\fi


\ifnum\strcmp{\locallang}{PL} = 0
    \newcommand{\kieruneklocal}{na~kierunku }
    %\newcommand{\specjalnosclocal}{w~specjalności }
    \newcommand{\titlelocal}{\@title }
    \newcommand{\albumlocal}{numer~albumu }
    \newcommand{\promotorlocal}{Promotor}
    \newcommand{\citylocal}{Opole, }
\fi
\ifnum\strcmp{\locallang}{EN} = 0
    \newcommand{\kieruneklocal}{in~the~field~of~study }
    %\newcommand{\specjalnosclocal}{and~specialisation }
    \newcommand{\titlelocal}{\@engtitle }
    \newcommand{\albumlocal}{student record book number }
    \newcommand{\promotorlocal}{supervisor }
    \newcommand{\citylocal}{Opole, }
\fi


\newcommand{\poheader}{Head}

\ifnum\strcmp{\locallang}{PL} = 0
    \g@addto@macro\poheader{PL.png}
\fi

\ifnum\strcmp{\locallang}{EN} = 0
    \g@addto@macro\poheader{EN.png}
\fi

\let\oldmaketitle\maketitle
\renewcommand{\maketitle}{
    \linespread{1.15}

    \thispagestyle{empty}
    \begin{center}
        \includegraphics[width=0.6\textwidth]{\poheader}
        \vskip 3em

        \vskip 3em
        \includegraphics[width=\linewidth]{\frontpageheader}
        \vskip 1em
        \kieruneklocal \@kierunek
        \vskip .5em
        %\specjalnosclocal \@specjalnosc
        \vskip 3em
        \Huge \titlelocal
        \vskip 3em
        \LARGE \@author \\
        \normalsize
        \albumlocal \@album
        \vskip 2em
        \promotorlocal\\\@promotor
        \vfill
        \citylocal \@date
    \end{center}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% streszczenie, abstract
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\streszczeniepracy}[1]{
    \newcommand{\@streszczeniepracy}{#1}
}
\newcommand{\slowakluczowe}[1]{
    \newcommand{\@slowakluczowe}{#1}
}
\newcommand{\thesisabstract}[1]{
    \newcommand{\@thesisabstract}{#1}
}
\newcommand{\thesiskeywords}[1]{
    \newcommand{\@thesiskeywords}{#1}
}

% Streszczenie polskie
\newcommand{\stronastreszczenia}{
    \clearpage
    \thispagestyle{empty}
    \begin{center}
        \textbf{\large\@title}

        \textbf{Streszczenie}
    \end{center}
    \@streszczeniepracy

    \vskip 2em
    \noindent\textbf{Słowa kluczowe: }
    \@slowakluczowe

}

% Abstract angielski
\newcommand{\abstractpage}{
    \clearpage
    \thispagestyle{empty}
    \begin{center}
        \textbf{\large\@engtitle}

        \textbf{Abstract}
    \end{center}
    \@thesisabstract

    \vskip 2em
    \noindent\textbf{Keywords: }
    \@thesiskeywords
    \clearpage
}

% Spięcie stron streszczeń we właściwej
% kolejności w jedno polecenie.
\newcommand{\abstractpages}{
    \ifnum\strcmp{\locallang}{PL} = 0
        \stronastreszczenia
        \abstractpage
    \else
        \abstractpage
        \stronastreszczenia
    \fi
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\AtBeginDocument{\addtocontents{toc}{\protect\thispagestyle{empty}}}
\newcommand{\frontpages}{
    \counterwithout{lstlisting}{chapter}
    \pagestyle{empty}
    \maketitle
    \abstractpages
    \tableofcontents

    \pagestyle{headings}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Lista skrótów i symboli
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\acronymslist}{

    \chapter*{\acronymstitle}
    \pagestyle{plain}
    \addcontentsline{toc}{chapter}{\acronymstitle}
    \printglossary[type=\acronymtype,title={}]
    \printglossary[type=symbols,title={}]

}   %


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%\newcommand{\tailpages}{
% wykaz symboli i skrótów
%   \acronymslist

% spis rysunków
%  \listoffigures

% spis tabel
% \listoftables

%\easyappendices
%}

