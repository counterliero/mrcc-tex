% Autor: Matthias Splieth <matthias.splieth@ovgu.de>
% Date:	Oct 08, 2013
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mrcc}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage{helvet}
\RequirePackage{graphicx}
\RequirePackage{url}
\RequirePackage{fancyvrb}
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{color}
\RequirePackage{enumerate}
\RequirePackage{setspace}
\RequirePackage{scrhack}
\RequirePackage{setspace}
\RequirePackage{tikz}
\RequirePackage{pgfplots}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newif\if@german
\@germanfalse
\DeclareOption{german}{%
	\@germantrue%
}

\newif\if@twoside
\@twosidefalse
\DeclareOption{twoside}{%
	\@twosidetrue%
}

\newif\if@agwi
\@agwifalse
\DeclareOption{agwi}{%
	\@agwitrue
}

\newif\if@ucc
\@uccfalse
\DeclareOption{ucc}{%
	\@ucctrue
}

\newif\if@vlba
\@vlbafalse
\DeclareOption{vlba}{%
	\@vlbatrue
}

\newif\if@seminar
\@seminarfalse
\DeclareOption{seminar}{%
	\@seminartrue
}

\newif\if@bachelor
\@bachelorfalse
\DeclareOption{bachelor}{%
	\@bachelortrue
}

\newif\if@master
\@masterfalse
\DeclareOption{master}{%
	\@mastertrue
}

\newif\if@diss
\@dissfalse
\DeclareOption{diss}{%
	\@disstrue
}

\newif\if@bibnum
\@bibnumfalse
\DeclareOption{bibnum}{%
	\@bibnumtrue
}

\newif\if@notoc
\@notocfalse
\DeclareOption{notoc}{%
	\@notoctrue%
}

\newif\if@nolof
\@noloffalse
\DeclareOption{nolof}{%
	\@noloftrue
}

\newif\if@nolot
\@nolotfalse
\DeclareOption{nolot}{%
	\@nolottrue
}

\newif\if@nolst
\@nolstfalse
\DeclareOption{nolst}{%
	\@nolsttrue%
}

\newif\if@nomencl
\@nomenclfalse
\DeclareOption{nomencl}{%
	\@nomencltrue
}

\newif\if@hyperref
\@hyperreffalse
\DeclareOption{hyperref}{%
	\@hyperreftrue
}

\ProcessOptions

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand\supervisor[1]{\def\@supervisor{#1}}
\newcommand\prof[1]{\def\@prof{#1}}
\newcommand\secondprof[1]{\def\@secondprof{#1}}
\newcommand\bibfiles[1]{\def\@bibfiles{#1}}
\newcommand\reviewer[1]{\def\@reviewer{#1}}
\newcommand\birthday[1]{\def\@birthdate{#1}}
\newcommand\placeofbirth[1]{\def\@birthplace{#1}}
\newcommand\acknowledgments[1]{\def\@acknowledgments{#1}}

\def\@acknowledgments{}
\def\@isreport{}
\def\@isdiploma{}
\def\@isdiss{}
\def\@bibfiles{}
\def\@abstracten{}
\def\@prof{}
\def\@secondprof{}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\if@seminar
	\def\@isreport{1}
\fi
\if@bachelor
	\def\@isreport{1}
	\def\@isdiploma{1}
\fi
\if@master
	\def\@isreport{1}
	\def\@isdiploma{1}
\fi
\if@diss
	\def\@isdiss{1}
\fi

\ifx\@empty\@isreport
	\if@diss
		\LoadClass[cleardoublepage=empty, listof=totoc, bibliography=totoc, index=totoc, 11pt, abstracton, numbers=noenddot, oneside,titlepage,openright,headings=normal]{scrartcl}%
	\else
		\if@twoside
			\LoadClass[cleardoublepage=empty, listof=totoc, bibliography=totoc, index=totoc, 11pt, abstracton, numbers=noenddot, twoside,titlepage,headings=normal]{scrartcl}%
		\else
			\LoadClass[cleardoublepage=empty, listof=totoc, bibliography=totoc, index=totoc, 11pt, abstracton, numbers=noenddot, oneside,titlepage,headings=normal]{scrartcl}%
		\fi
	\fi
\else
	\if@twoside
		\LoadClass[cleardoublepage=empty, listof=totoc, bibliography=totoc, index=totoc, 11pt, abstracton, numbers=noenddot, twoside,titlepage,openright,headings=normal]{scrreprt}%
	\else
	\LoadClass[cleardoublepage=empty, listof=totoc, bibliography=totoc, index=totoc, 11pt, abstracton, numbers=noenddot, oneside,titlepage,openright,headings=normal]{scrreprt}%
	\fi
\fi

\newcommand{\titleheader}[0]{$\quad$}
\newcommand{\supervisorlabel}[0]{ }
\newcommand{\proflabel}[0]{ }
\newcommand{\secondproflabel}[0]{ }
\newcommand{\birthstart}[0]{ }
\newcommand{\birthmiddle}[0]{ }
\newcommand{\birthclosing}[0]{ }
\newcommand{\instlogo}[0]{ }

\if@agwi%
	\renewcommand{\instlogo}[0]{\includegraphics[scale=0.63]{img/agwi}}
\fi

\if@ucc%
	\renewcommand{\instlogo}[0]{\includegraphics[scale=0.63]{img/ucc}}
\fi

\if@vlba%
	\renewcommand{\instlogo}[0]{\includegraphics[scale=0.63]{img/vlba}}
\fi

\if@seminar%
	\renewcommand{\titleheader}[0]{Seminararbeit}
\fi

\ifx\@empty\@isdiploma
\else
	\if@bachelor
		\def\@doctype{Bachelorarbeit}
	\else
		\if@master
			\def\@doctype{Masterarbeit}
		\else
			\def\@doctype{Abschlussarbeit}
		\fi
	\fi
\fi

\if@bachelor%
	\if@german%
		\renewcommand{\titleheader}[0]{Bachelorarbeit}
	\else
		\renewcommand{\titleheader}[0]{Bachelor thesis}
	\fi
\fi

\if@master%
	\if@german%
		\renewcommand{\titleheader}[0]{Masterarbeit}
	\else
		\renewcommand{\titleheader}[0]{Master thesis}
	\fi
\fi

\if@diss%
	\renewcommand{\titleheader}[0]{\begin{large}\textbf{Dissertation}\\[1cm]zur Erlangung des akademischen Grades Doktoringenieur (Dr.-Ing.)\end{large}}
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\setlength{\textheight}{24.5cm}
\setlength{\evensidemargin}{0mm}
\setlength{\oddsidemargin}{0mm}
\setlength{\parindent}{0mm}
\RequirePackage{tabularx}
\RequirePackage{longtable}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Neudeutsch laden
\if@german%
	\RequirePackage[english, ngerman]{babel}%
\else
	\RequirePackage[ngerman, english]{babel}%
\fi

\if@german%
	\renewcommand{\supervisorlabel}[0]{Betreuer: }
	\renewcommand{\proflabel}[0]{Themensteller: }
	\renewcommand{\secondproflabel}[0]{Zweitgutachter: }
\else
	\renewcommand{\supervisorlabel}[0]{Supervisor: }
	\renewcommand{\proflabel}[0]{Professor: }
	\renewcommand{\secondproflabel}[0]{Second Assessor: }
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\if@hyperref
	\RequirePackage[plainpages]{hyperref}
\fi

\if@nomencl
	\if@german
		\RequirePackage[german,intoc]{nomencl}
	\else
		\RequirePackage[intoc]{nomencl}
	\fi
	\makenomenclature
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\abstracten}[1]{\def\@abstracten{#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{3}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ifx\@empty\@isreport
\else
	\renewcommand*{\chapterpagestyle}{fancy}
\fi

\let\@altab=\abstract
\let\end@altab=\endabstract
\renewenvironment{abstract}{%
\fancyfoot{}
\fancyhead{}
\if@twoside
	\fancyhead[LE,RO]{\thepage}
\else
	\fancyhead[R]{\thepage}
\fi

\begin{@altab}%
\thispagestyle{fancy}}{\end{@altab}%
\cleardoublepage
\ifx\@empty\@isreport
	\if@twoside
		\fancyhead[LO]{\@author}
		\fancyhead[RE]{\@title}
	\else
		\fancyhead[L]{\@author -- \@title}
	\fi
\else
	\if@twoside
		\fancyhead[LO]{\rightmark}
		\fancyhead[RE]{\leftmark}
	\else
		\fancyhead[L]{\rightmark}
	\fi
\fi}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\if@german
	\newcommand{\@institution}{
		Otto-von-Guericke-Universit\"at Magdeburg\\
		Magdeburg Research and Competence Cluster\\
		Fakult\"at Informatik\\
		\if@ucc%
		  ~\\
		\else
			Institut f\"ur Technische und Betriebliche Informationssysteme\\
		\fi
		\if@vlba%
			Very Large Business Applications Lab
		\fi
		\if@agwi%
			Arbeitsgruppe Wirtschaftsinformatik I
		\fi
		\if@ucc%
			SAP University Competence Center
		\fi
	}
\else
	\newcommand{\@institution}{
		Otto-von-Guericke-University Magdeburg\\
		Magdeburg Research and Competence Cluster\\
		Faculty of Computer Science\\
		\if@ucc% 
		\else
			Department of Technical and Business Information Systems\\
		\fi
		\if@vlba%
			Very Large Business Applications Lab
		\fi
		\if@agwi%
			Arbeitsgruppe Wirtschaftsinformatik I
		\fi
		\if@ucc%
			SAP University Competence Center
		\fi
}
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\if@bibnum
	\bibliographystyle{plain}
\else
	\bibliographystyle{alpha}
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\if@nolof
	\newcommand{\printlof}{ }
\else
	\newcommand{\printlof}{\listoffigures}
\fi

\if@nolot
	\newcommand{\printlot}{ }
\else
	\newcommand{\printlot}{\listoftables}
\fi

\if@nolst
	\newcommand{\printlolst}{ }
\else
	\newcommand{\printlolst}{\lstlistoflistings}
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\@haveapp{}
\let\@altapp=\appendix
\renewcommand{\appendix}[0]{\cleardoublestandardpage
\@altapp
\def\@haveapp{1}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{fancyhdr}

\ifx\@empty\@isdiss
	\let\@altdoc=\document
	\let\end@altdoc=\enddocument
	\renewenvironment{document}{%
	\begin{@altdoc}%
	\begin{titlepage}
		\enlargethispage{1cm}
		\if@german%
			\includegraphics[width=\linewidth]{img/fin-de}\vspace*{2cm}
		\else
			\includegraphics[width=\linewidth]{img/fin-en}\vspace*{2cm}
		\fi
		\hspace*{2.5cm}\begin{minipage}{.75\linewidth}
			\huge
			\textbf{\titleheader}\\[1cm]
			\huge
			\@title\\[1cm]
			\small{\@author \\Magdeburg, \@date}\\[4cm]
		\end{minipage}
	
		\hspace*{2.5cm}\begin{minipage}{.75\linewidth}
			\large
			\supervisorlabel \@supervisor
			\ifx\@empty\@prof
			\else
				\\ \proflabel \@prof
			\fi
			\ifx\@empty\@secondprof
			    \\[1cm]
			\else
			    \\ \secondproflabel \@secondprof
			    \\[1cm]
			\fi
		\end{minipage}
		\vfill
		\hrule
		\vspace*{0.15cm}
		\begin{minipage}{.7\linewidth}
			\@institution
		\end{minipage}
		\begin{minipage}{.3\linewidth}
			\raggedleft
			\instlogo
		\end{minipage}
	\end{titlepage}
	\pagestyle{empty}
	\cleardoublepage	
	\fancyfoot{}
	\fancyhead{}
	\pagestyle{fancy}
	\thispagestyle{fancy}
	\cleardoublestandardpage
	\if@twoside
		\fancyhead[LE,RO]{\thepage}
	\else
		\fancyhead[R]{\thepage}
	\fi
	\pagenumbering{roman}
	\setcounter{page}{1}
	\minisec{Abstract}
	\@abstracten
	\onehalfspacing
	\normalsize
	\cleardoublestandardpage
	\if@seminar
	\else
	\if@notoc
	\else
		\ifx\@acknowledgments\@empty
		\else
			\if@german
				\minisec{Danksagung}
  			\else
    			\minisec{Acknowledgments}
			\fi
			\@acknowledgments
		\fi
		\cleardoublestandardpage
		\tableofcontents
		\cleardoublestandardpage
		\printlof
		\cleardoublestandardpage
		\printlot
		\cleardoublestandardpage
		\printlolst
		\cleardoublestandardpage
		\if@nomencl
			\printnomenclature
			\cleardoublestandardpage
		\fi
	\fi
	\fi
	\markboth{}{}
	\pagenumbering{arabic}
	\setcounter{page}{1}
	\ifx\@empty\@isreport
		\if@twoside
			\fancyhead[LO]{\@author}
			\fancyhead[RE]{\@title}
		\else
			\fancyhead[L]{\@author -- \@title}
	    \fi
	\else
		\if@twoside
			\fancyhead[LO]{\rightmark}
			\fancyhead[RE]{\leftmark}
		\else   
			\fancyhead[L]{\leftmark}
		\fi
	\fi}{%
	\ifx\@empty\@haveapp
		\cleardoublestandardpage
		\ifx\@empty\@bibfiles
		\else
			\bibliography{\@bibfiles}
			\markboth{\textsc{Literaturverzeichnis}}{\textsc{Literaturverzeichnis}}
			\cleardoublestandardpage
	  	\fi
		\if@seminar
		\else
		\chapter*{Selbstst\"andigkeitserkl\"arung}\markboth{\textsc{Selbstst\"andigkeitserkl\"arung}}{\textsc{Selbstst\"andigkeitserkl\"arung}}
		Hiermit erkl\"are ich, dass ich die vorliegende Arbeit selbst\"andig verfasst und keine anderen als die angegebenen Quellen und Hilfsmittel verwendet habe.\\[3cm]Magdeburg, den \dots\dots\dots\dots\dots\hfill\dots\dots\dots\dots\dots\dots\dots\dots\dots
		\fi
	\fi
	\cleardoublestandardpage
	\end{@altdoc}}
\else
	\let\@altdoc=\document
	\let\end@altdoc=\enddocument
	\renewenvironment{document}{%
		\begin{@altdoc}%
		\begin{titlepage}
			\enlargethispage{1cm}
			\begin{center}
				\sffamily
				\if@german%
					\includegraphics[width=\linewidth]{img/fin-de}\vspace*{3cm}
				\else
					\includegraphics[width=\linewidth]{img/fin-en}\vspace*{3cm}
				\fi
				\Large{\textbf{\@title}}
				
				\vspace*{10mm}
			          \titleheader\\[2cm]
				\begin{large}  
					 \vspace{10mm}
						\selectlanguage{ngerman}
						vorgelegt an der\\
						Fakult\"at f\"ur Informatik der\\
						Otto-von-Guericke-Universit\"at Magdeburg
					\vspace{12mm}

					 eingereicht von					 
					 
					  {\textbf{\@author}}\\geboren am \@birthdate~in~\@birthplace\\[2cm]
					  \vfill
						Gutachter:\\\@reviewer\\[2cm]
						\bigskip
						 Magdeburg, \@date\\[2cm]
				\end{large}
			\end{center}
			\selectlanguage{english}
		\end{titlepage}
		\cleardoubleemptypage
		\ifx\@dedication\@empty
		\else
			\next@tpage\null\vfill
			{\centering \em \@dedication \par}%
			\vskip \z@ \@plus3fill
			\if@twoside
				\next@tpage\cleardoubleemptypage
			\fi
		\fi
		\fancyfoot{}
		\fancyhead{}
		\pagestyle{fancy}
		\thispagestyle{fancy}			
		\onehalfspacing
		\normalsize
		\cleardoublestandardpage
		\if@twoside
		    \fancyhead[LE,RO]{\thepage}
		\else
			\fancyhead[R]{\thepage}
		\fi
		\pagenumbering{roman}
		\setcounter{page}{1}
		\minisec{Abstract}
		\@abstracten
		\cleardoublestandardpage
		\if@notoc
		\else
			\ifx\@acknowledgments\@empty
			\else
				\if@german
					\minisec{Danksagung}
  				\else
    				\minisec{Acknowledgments}
			\fi
			\@acknowledgments
		\fi
		\cleardoublestandardpage
		\tableofcontents
		\cleardoublestandardpage
		\printlof
		\cleardoublestandardpage
		\printlot
		\cleardoublestandardpage
		\printlolst
		\cleardoublestandardpage
		\if@nomencl
			\printnomenclature
			\cleardoublestandardpage	
		\fi
		\fi
		\pagenumbering{arabic}
		\setcounter{page}{1}
		\markboth{}{}
		\ifx\@empty\@isreport
		  \if@twoside
			  \fancyhead[LO]{\@author}
		      \fancyhead[RE]{\@title}
		  \else
		      \fancyhead[L]{\@author -- \@title}
		    \fi
		\else
		  \if@twoside
		    \fancyhead[LO]{\rightmark}
		    \fancyhead[RE]{\leftmark}
		  \else   
		    \fancyhead[L]{\leftmark}
		  \fi
		\fi
	}{%
		\ifx\@empty\@haveapp
			\cleardoublestandardpage
			\ifx\@empty\@bibfiles
		\else
			\bibliography{\@bibfiles}
		\fi
		\fi
		\cleardoublestandardpage
		\end{@altdoc}
	}
\fi

\setlength{\nomlabelwidth}{.35\textwidth}
\renewcommand{\nomlabel}[1]{#1 \dotfill}

\if@german
	%\renewcommand\lstlistingname{Quellllllcode}
	\renewcommand{\nomname}{Abk\"urzungsverzeichnis}
\else
	%\renewcommand\lstlistingname{List of Listings}
	\renewcommand{\nomname}{List of Abbreviations}
\fi

\if@seminar
\else
	\input{tex/styling.tex}
\fi