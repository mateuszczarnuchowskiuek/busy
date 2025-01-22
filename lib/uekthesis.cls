%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%  FileName:     uekthesis.cls
%  Author:       Maciej Sypień <maciej.sypien@gmail.com>
%  University:   Cracow University of Economics
%                (Uniwersytet Ekonomiczny w Krakowie)
%  Inspired by:  aghdpl.cls
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



\newif\ifpdflatex\pdflatexfalse%
\NeedsTeXFormat{LaTeX2e}%
\ProvidesClass{lib/uekthesis}[2014/16/12 LaTeX class for thesis documents]%
\DeclareOption{pdflatex}{\pdflatextrue}%
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}%
\ProcessOptions\LoadClass[a4paper,12pt,oneside,openright]{report}%



%#########################################################################
% Definicje zmiennych
%#########################################################################
\def\globalFullAuthor#1              {\gdef\@globalFullAuthor{#1}}%                % Pełna nazwa autora pracy
\def\globalAuthorID#1                {\gdef\@globalAuthorID{#1}}%                  % Identyfikator (nr indeksu)
\def\globalFullTitle#1               {\gdef\@globalFullTitle{#1}}%                 % Pełny tytuł pracy
\def\globalFullUniversity#1          {\gdef\@globalFullUniversity{#1}}%            % Pełna nazwa uniwersytetu
\def\globalDepartment#1              {\gdef\@globalDepartment{#1}}%                % Wydział
\def\globalThesisType#1              {\gdef\@globalThesisType{#1}}%                % Typ pracy dyplomowej
\def\globalUnderTheSupervisonOf#1    {\gdef\@globalUnderTheSupervisonOf{#1}}%      % pod kierunkiem (napis)
\def\globalSupervisor#1              {\gdef\@globalSupervisor{#1}}%                % Promotor
\def\globalAcknowledgements#1        {\gdef\@globalAcknowledgements{#1}}%          % Podziękowania
\def\globalDegreeprogramme#1         {\gdef\@globalDegreeprogramme{#1}}%           % Kierunek studiów
\def\globalCity#1                    {\gdef\@globalCity{#1}}%                      % Miasto
\def\globalYear#1                    {\gdef\@globalYear{#1}}%                      % Rok

% Zdefiniowanie kilku zmiennych do umieszczenia w tekscie
\def\printFullAuthor{\@globalFullAuthor}              % Display
\def\printAuthorID{\@globalAuthorID}                  % Display
\def\printFullTitle{\@globalFullTitle}                % Display
\def\printFullUniversity{\@globalFullUniversity}      % Display
\def\printDepartment{\@globalDepartment}              % Display
\def\printThesisType{\@globalThesisType}              % Display
\def\printSupervisor{\@globalSupervisor}              % Display
\def\printAcknowledgments{\@globalAcknowledgements}   % Display
\def\printDegreeprogramme{\@globalDegreeprogramme}    % Display
\def\printCity{\@globalCity}                          % Display
\def\printYear{\@globalYear}                          % Display



%#########################################################################
% Ustawienie linkowania dokumetu oraz elementów wyświetlania pdfa
% (Rozdział 4.7.4 z latex w 129 minut)
%#########################################################################
\AtBeginDocument{%
  \hypersetup{%
    unicode=true,
    pdfencoding=unicode,
    pdfencoding=auto,
    pdftoolbar=true,                 % show Acrobat’s toolbar?
    pdfmenubar=true,                 % show Acrobat’s menu?
    pdffitwindow=true,               % window fit to page when opened
    pdfstartview={FitV},             % fits the width of the page to the window
    pdftitle={\printFullTitle},      % title
    pdfauthor={\printFullAuthor},    % author
    pdfsubject={\printThesisType},   % subject of the document
    pdfcreator={\printFullAuthor},   % creator of the document
    pdfproducer={\printFullAuthor},  % producer of the document
    pdfnewwindow=true,               % links in new window
    linktoc=page,                    % Ustawienie linków dla bibliografi (none, all, page, section)
    colorlinks=true,                 % false: boxed links; true: colored links
    linkcolor=Maroon,                % color of internal links (change box color with linkbordercolor)
    %citecolor=PineGreen,            % color of links to bibliography
    citecolor=Maroon,                % color of links to bibliography
    filecolor=Maroon,                % color of file links
    urlcolor=Maroon,                 % color of external links
  }
}



%#########################################################################
% Wymagane pakiety
%#########################################################################
\RequirePackage[utf8]{inputenc}
\RequirePackage[autostyle=true]{csquotes}
\RequirePackage[T1]{fontenc}           % Nowy zestaw czcionek
\RequirePackage{times}                 % Times - Czcionki wektorowe
\RequirePackage{graphicx}              % Wstawianie grafiki
\RequirePackage{geometry}              % Ustawienie wielkości odstępów od brzegów
\RequirePackage[usenames]{color}       % Palety kolorów zdefionwanych
\RequirePackage[dvipsnames]{xcolor}    % Zestaw kolorów
\RequirePackage{fancyhdr}              %
\RequirePackage[hyphens]{url}          % Pakiet url + dzielenie myślników
\RequirePackage{titlesec}              %
\RequirePackage{tocloft}               %
\RequirePackage{amsmath}               % Moduł matematyczny AMS
\RequirePackage{amsfonts}              % pakiet czcionek AMS
\RequirePackage{amssymb}               % Symbole matematyczne AMS
\RequirePackage{amsthm}                % Definicje matematyczne AMS
\RequirePackage{lmodern}               % Font: modern latin
\RequirePackage{courier}               % Font: courier
\RequirePackage{xpatch}                % !!! Required for biblatex settings
\RequirePackage[polish]{babel}         %
\RequirePackage{polski}                %
\RequirePackage{indentfirst}           % uzyskanie wcięcia przy pierwszym akapicie
\RequirePackage{nameref}               % pakiet referencji do pełnych nazw rozdziałów
\RequirePackage{enumerate}             % pakiet numerowania 1,2,3...etc
\RequirePackage{enumitem}
\RequirePackage{multirow}              % pakiet dla łaczenia wierszy w tabelach
\RequirePackage{longtable}             % pakiet wspomagający długie tabele
\RequirePackage{tabularx}              % dla pełnej długości tabeli (textwidth)
\RequirePackage{tabu}
\RequirePackage{hhline}                % pakiet dla łaczenia kolumn w tabelach
\RequirePackage{listings}              % pakiet dla kodów zródłowych
\RequirePackage{indentfirst}           % uzyskanie wcięcia przy pierwszym akapicie
\RequirePackage{textcomp, gensymb}     % pakiet który definiuje znaki m.in. \degree, \textdegree
\RequirePackage{cases}                 % pakiet numeracji równań z 'numcases'
\usepackage{setspace}				   % pakiet do obsługi interlinii
\RequirePackage[pdftex]{hyperref}      % Ustawienie linkowania dokumetu
                                       % oraz elementów wyświetlania pdfa (4.7.4 z latex w 129 minut)


%#########################################################################
% Ustawienie geometrii strony
%#########################################################################
\geometry{lmargin=30mm, rmargin=20mm, tmargin=25mm, bmargin=25mm,
	      foot=15mm, head=10mm}



%#########################################################################
% Ustawienie odstępu nad przypisami
%#########################################################################
\setlength{\skip\footins}{2pc}



%#########################################################################
% DEFAULT CLASS OPTIONS
%#########################################################################

% uekthesis introduction pages counter
\newcounter{introPageCounter}
\setcounter{introPageCounter}{1}

% interlinia dla tekstu pracy 1.5 wiersza
\linespread{1.3}
\parindent 0.5 in

% znak rozpoczynający każdą listę wypunktową
\renewcommand{\labelitemi}{--}

% Supervisor
\def\addSupervisor{
\begin{singlespace}
	\begin{flushright}
	  \@globalUnderTheSupervisonOf \quad\\
	  \@globalSupervisor\quad
	\end{flushright}
\end{singlespace}
}



%#########################################################################
% Ustawienia parametrów dla tytułów rozdziałów, podrozdziałów, itd.
%#########################################################################
\titlespacing{\chapter}{0pt}{17mm}{19mm}% odstępy: lewy, góra, dół
\titleformat{\section}[block]
{\bfseries\Large}{\filright\Large\thesection. }{0ex}{}
\titlespacing{\section}{0mm}{8mm plus 0mm minus 1mm}{4mm plus 0mm minus 1mm}
\titleformat{\subsection}[block]
{\bfseries\large}{\filright\large\thesubsection. }{0ex}{}
\titlespacing{\subsection}{0mm}{6mm}{2.5mm}
\titleformat{\subsubsection}[block]
{\bfseries\normalsize}{\filright\normalsize\thesubsubsection. }{0ex}{}
\titlespacing{\subsubsection}{0mm}{3mm}{1.5mm}



%#########################################################################
% Ustawienia strony tytułowej
%#########################################################################
\newcommand{\titlepages}{

  \newpage \titlepage%
  \begin{center}
    {%
        {\LARGE\scshape\printFullUniversity}\par
        {\large\scshape\printDepartment}\par
        {\large\scshape\printDegreeprogramme}\par
    }
    \vspace*{15mm}

    %\includegraphics[width=6cm]{lib/university-logo}
    \includegraphics[width=6cm]{lib/university-logo}
    \vspace*{15mm}

    {\LARGE\printFullAuthor} \\
    {\large\printAuthorID}
    \vspace*{5mm}
	
	\begin{doublespace}
    {\LARGE\bfseries\printFullTitle}
    \end{doublespace}
    \vspace*{10mm}

    {\large\printThesisType{\ }}
    \vspace*{10mm}

  \end{center}

  {\large\addSupervisor}

  \null%
  \vfill
  \centerline{\large{\printCity~\printYear}}
  \addtocounter{introPageCounter}{1} % increased introPageCounter
  \clearpage

  \titlepage

  \clearpage

  \setcounter{page}{\value{introPageCounter}}
}



%#########################################################################
% Inne parametry
%#########################################################################

\ProcessOptions\relax%

\pagestyle{plain}

\renewcommand{\chaptermark}[1]{\markboth{\thechapter.\ #1}{}}
\renewcommand{\sectionmark}[1]{\markright{\thesection.\ #1}}
\renewcommand{\headrulewidth}{0.2pt}

\frenchspacing
\sloppy
\widowpenalty=9999
\clubpenalty=9996
\brokenpenalty=4991
\predisplaypenalty=10000
\postdisplaypenalty=1549
\displaywidowpenalty=1602
\flushbottom



%#########################################################################
% Ustawienia parametrów generowania spisu treści i spisu rysunków
%#########################################################################
\renewcommand{\cftbeforetoctitleskip}{20mm}
\renewcommand{\cftaftertoctitleskip}{19mm}
\renewcommand{\cftchapleader}{\cftdotfill{\cftdot}}
\renewcommand{\cftsecleader}{\cftdotfill{\cftdot}}
\renewcommand{\cftsubsecleader}{\cftdotfill{\cftdot}}
\renewcommand{\cftchapaftersnum}{.}
\renewcommand{\cftsecaftersnum}{.}
\renewcommand{\cftsubsecaftersnum}{.}
\setlength{\cftparskip}{2pt}
\setlength{\cftbeforechapskip}{0mm}


