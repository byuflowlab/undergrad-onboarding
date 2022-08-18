\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{byuthesis}
% Written by Tim McLain and Andrew Ning. September 2020.

% -------- set user options -----------
% Format options: fancy or simple (simple is default)
%\newif\if@simple
%\DeclareOption{simple}{\@simpletrue}
\newif\if@fancy
\DeclareOption{fancy}{\@fancytrue}

% Degree options: masters or phd (masters is default)
%\newif\if@masters
%\DeclareOption{masters}{\@masterstrue}
\newif\if@phd
\DeclareOption{phd}{\@phdtrue}
% -------------------------------------

% -------- set main options to class -------------
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}
\ProcessOptions\relax
\LoadClass[letterpaper,11pt,oneside,openright]{memoir}  % based off of memoir class
\RequirePackage{memhfixc}  % fix for hyperref w/ memoir
% ----------------------------------------------

% ----------- page layout -------------
\RequirePackage[]{geometry}
\setlrmarginsandblock{1.75in}{1.75in}{*}
\setulmarginsandblock{1in}{*}{1}
\checkandfixthelayout
% ---------------------------------------

% ----------- typesetting ---------------
\usepackage{microtype}		% this package makes micro adjustments to reduce need for hyphenation
% ---------------------------------------

% ---------- fonts ---------------
% Use T1 font encoding (8-bit) for loaded fonts
\RequirePackage[T1]{fontenc}

%%%% Serif fonts for body text
% mathpazo uses palatino for body text and **math** for a consistent look
% osf option: old style font (for numbers)
% sc option: small caps option
%\RequirePackage[osf,sc]{mathpazo}
\RequirePackage{mathpazo}

%% This font is not part of the standard LaTeX package and requires installation on your computer
%%\usepackage[urw-garamond]{mathdesign}
%%\usepackage{garamondx}

%%%% Monospace fonts for \ttfamily (such as for displaying computer code or computer commands)
\RequirePackage[scaled=0.85]{beramono}

%% This font is not part of the standard LaTeX package and requires installation on your computer
% I like this font more than beramono, however (TWM)
%\RequirePackage{inconsolata}
%
%%%% Sans serif font selection for \sffamily (for chapter and section titles)
\RequirePackage[defaultsans,scale=0.95]{opensans} %% Alternatively
% use the option 'defaultsans' instead of 'default' to replace the
% sans serif font only.
% -------------------------------

% ---------- colors -------------
\RequirePackage{xcolor}
\definecolor{navy}{HTML}{002E5D}
\definecolor{royal}{HTML}{0062B8}
\definecolor{darkgray}{HTML}{141414}
\definecolor{mediumgray}{HTML}{666666}
\definecolor{black}{HTML}{111111}
\definecolor{primary}{HTML}{0062B8}
% -------------------------------

% -------- figures ------------
\RequirePackage{graphicx}
\RequirePackage{rotating}
% ------------------------------

% -------- math ----------
%\RequirePackage{amsmath}
\usepackage{mathtools}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
% ------------------------------

% -------- algorithms ----------
%\RequirePackage{algorithmic}
%\RequirePackage[chapter]{algorithm}

% ----------- algorithms -------
\RequirePackage[chapter]{algorithm}  % algorithms
\RequirePackage{algpseudocode}  % algorithms
\renewcommand{\algorithmicrequire}{\textbf{Input:}}
\renewcommand{\algorithmicensure}{\textbf{return}}
\algrenewcommand\textproc{\texttt}  % don't all caps function name
\newcommand{\algoreturn}{\textbf{return} }
\algrenewcommand{\algorithmiccomment}[1]{\textcolor{primary}{\hfill\sffamily\scriptsize\itshape $\triangleright$ #1}}
\algnewcommand{\LineComment}[1]{\State \textcolor{primary}{\sffamily\scriptsize\itshape $\triangleright$ #1}}
\algnewcommand{\To}{\textbf{to\ }}   % For use in '\For{$i = 1$ \To $n$}' -- replaced $:\ $
\algnewcommand{\By}{\textbf{by\ }}   % For use in '\For{$i = 1$ \To $n$ \By $k$}' -- replaced $:\ $
% -----------------------------

% ------------- nomeclature -------------
\RequirePackage[intoc]{nomencl}
\makenomenclature
\renewcommand{\nomname}{Nomenclature\;}  % hack to get spacing in ToC between name and number right
%\setlength{\nomitemsep}{-\parsep}  % tight single space
\setlength{\nomitemsep}{0pt}  % relaxed spacing (nominal spacing is looser than this)
% ---------------------------------------

% ------------------------------

% -------- Sections -----------
\setsecnumdepth{subsection}  % number chapters, sections, and subsections
\maxsecnumdepth{subsection}

% set up byuchapter style
\newcommand{\hsp}{\hspace{20pt}}
\newcommand*{\colorsectitle}{}
\newcommand*{\colorsubsectitle}{}
\makechapterstyle{byuchapter}{%
	\setlength{\beforechapskip}{54pt}		% Sets vertical space from top of page to baseline of chapter title to 2.2 in.
	\setlength{\afterchapskip}{48pt}		% Sets vertical space from baseline of chapter title to baseline of following text to be 0.87 in.
	\renewcommand*{\printchaptername}{}		% We don't print the word "Chapter"
	\renewcommand*{\chapternamenum}{}		% No space inserted after "Chapter" and before \chapnum
	\renewcommand*{\chapnumfont}{\normalfont\LARGE\sffamily\itshape\colorchapnum}
	\renewcommand*{\chaptitlefont}{\normalfont\LARGE\sffamily\itshape\colorchaptitle}
	\renewcommand*{\printchapternum}{\chapnumfont \thechapter\hsp}
	\renewcommand*{\afterchapternum}{}		% No vertical space after "Chapter" before \chaptertitle
}
\renewcommand*{\colorchapnum}{\color{royal}}
\renewcommand*{\colorchaptitle}{\color{royal}}
\renewcommand*{\colorsectitle}{\color{royal}}

\chapterstyle{byuchapter}

% appendix formatting
\newcommand{\byuappendix}{%
	% commands to format and instantiate appendix divider page (no page number)
	\begingroup
	\makeatletter
	\let\ps@plain\ps@empty		% temporarily redefine appendix divider page style to empty (to get rid of page number)
	\renewcommand{\parttitlefont}{\normalfont\huge\sffamily\itshape\colorchapnum\raggedright}  % format the font
%	\appendixpage	% put in the appendix divider page
	\makeatother
	\endgroup
	% commands to format headings of appendices. **** I think these commands are redundant -- they are set up in byuchapter
	%  	\renewcommand*{\chapnamefont}{\normalfont\LARGE\sffamily\itshape\colorchapnum}
	%	\renewcommand*{\chapnumfont}{\normalfont\LARGE\sffamily\itshape\colorchapnum}
	%	\renewcommand*{\printchaptername}{}		% We don't print the word "Appendix"
	%	\renewcommand*{\chapternamenum}{}		% No space inserted after "Appendix" and before \chapnum
}

\RequirePackage{etoolbox}		% provides \appto command used below (append to)
\appto\appendix{\byuappendix}

% section heading formatting
\setsecheadstyle{\normalfont\Large\sffamily\colorsectitle\raggedright}%
\setbeforesecskip{-18pt plus -4pt minus -1pt}
\setaftersecskip{6pt plus 1pt}

% subsection heading formatting
\setsubsecheadstyle{\normalfont\large\sffamily\colorsectitle\raggedright}%
\setbeforesubsecskip{-12pt plus -3pt minus -1pt}
\setaftersubsecskip{3pt plus 1pt}

% subsubsection heading formatting
\setsubsubsecheadstyle{\normalfont\sffamily\colorsectitle\raggedright}%
\setbeforesubsubsecskip{-12pt plus -2pt minus -1pt}
\setaftersubsubsecskip{1pt plus 0pt}

% Table of contents formatting (and LoF and LoT)
\renewcommand{\contentsname}{Table of Contents}
\renewcommand{\listfigurename}{List of Figures\;\;}	% hack to get spacing in ToC between name and number right
\renewcommand{\listtablename}{List of Tables\;\;}	% hack to get spacing in ToC between name and number right

%% change title style for toc, lof, lot
% Bold face, size LARGE titles
%\renewcommand{\printtoctitle}[1]{\LARGE\bfseries #1}
%\renewcommand{\printloftitle}[1]{\LARGE\bfseries #1}
%\renewcommand{\printlottitle}[1]{\LARGE\bfseries #1}

% Color, sans serif titles
\renewcommand{\printtoctitle}[1]{\normalfont\LARGE\sffamily\colorchaptitle\itshape #1}
\renewcommand{\printloftitle}[1]{\normalfont\LARGE\sffamily\colorchaptitle\itshape #1}
\renewcommand{\printlottitle}[1]{\normalfont\LARGE\sffamily\colorchaptitle\itshape #1}

% put page number right after in toc, lof, lot
\renewcommand{\cftpartleader}{\color{royal}}
\renewcommand{\cftpartafterpnum}{\color{royal}\cftparfillskip}
\renewcommand{\cftchapterleader}{\color{royal}}
\renewcommand{\cftchapterafterpnum}{\color{royal}\cftparfillskip}
%\renewcommand{\cftchapterafterpnum}{\hsp}
\renewcommand{\cftsectionleader}{\color{royal}}
\renewcommand{\cftsectionafterpnum}{\color{royal}\cftparfillskip}
\renewcommand{\cftfigureleader}{\color{royal}}
\renewcommand{\cftfigureafterpnum}{\color{royal}\cftparfillskip}
\renewcommand{\cfttableleader}{\color{royal}}
\renewcommand{\cfttableafterpnum}{\color{royal}\cftparfillskip}

% unbold titles in toc
\renewcommand\cftpartfont{\bfseries\color{royal}}
\renewcommand\cftchapterfont{\color{royal}}
\renewcommand\cftsectionfont{\color{royal}}
%\renewcommand{\cftpartpagefont}{\color{royal}}
%\renewcommand{\cftchapterpagefont}{\color{royal}}	% make page entries on ToC, LoF, LoT royal blue in color
%\renewcommand{\cftsectionpagefont}{\color{royal}}
%\renewcommand{\cftfigurepagefont}{\color{royal}}
%\renewcommand{\cfttablepagefont}{\color{royal}}
\renewcommand{\cftpartpagefont}{\color{black}}
\renewcommand{\cftchapterpagefont}{\color{black}}	% make page entries on ToC, LoF, LoT black in color
\renewcommand{\cftsectionpagefont}{\color{black}}
\renewcommand{\cftfigurepagefont}{\color{black}}
\renewcommand{\cfttablepagefont}{\color{black}}
% ----------------------------------------

%----------- figure captions -------------
\captionnamefont{\normalfont\small}
\captiontitlefont{\normalfont\small}
% ----------------------------------------

%%%--------- header ----------
%\nouppercaseheads
%\copypagestyle{byu}{headings}
%\aliaspagestyle{chapter}{empty}
%\pagestyle{byu}
%%\appto\frontmatter{\pagestyle{byu}}
%\appto\mainmatter{\pagestyle{byu}}
%% ----------------------------------------

\setlength{\headwidth}{\textwidth}
%   \addtolength{\headwidth}{\marginparsep}
%   \addtolength{\headwidth}{\marginparwidth}

\makepagestyle{byu}
\aliaspagestyle{chapter}{empty}
\makerunningwidth{byu}{\headwidth}
%\makeheadrule{mycompanion}{\headwidth}{\normalrulethickness}
\makeheadposition{byu}{flushright}{flushleft}{}{}

\makepsmarks{byu}{%
	\nouppercaseheads
	\createmark{chapter}{right}{shownumber}{\chaptername\space}{:\space}
%	\clearmark{chapter}
	\clearmark{section}
	\createmark{part}{both}{shownumber}{\partname\space}{:\space}
	\createplainmark{toc}{both}{\contentsname}
	\createplainmark{lof}{both}{\listfigurename}
	\createplainmark{lot}{both}{\listtablename}
	\createplainmark{bib}{both}{\bibname}
	\createplainmark{index}{both}{\indexname}
	\createplainmark{glossary}{both}{\glossaryname}}



\makeoddhead{byu}%
	{\ifthenelse{\isodd{\value{page}}}{\normalfont\small\slshape\thepage}{\normalfont\small\slshape\rightmark}}%
	{}%
	{\ifthenelse{\isodd{\value{page}}}{\normalfont\small\slshape\leftmark}{\normalfont\small\slshape\thepage}}
		
\makeevenhead{byu}%
	{\ifthenelse{\isodd{\value{page}}}{\normalfont\small\slshape\thepage}{\normalfont\small\slshape\rightmark}}%
	{}%
	{\ifthenelse{\isodd{\value{page}}}{\normalfont\small\slshape\leftmark}{\normalfont\small\slshape\thepage}}

%\makeoddhead{byu}%
%{\normalfont\small\slshape\thepage}{}{%
%	\normalfont\small\slshape\ifthenelse{\isodd{\value{page}}}{\rightmark}{\leftmark}}

%\makeevenhead{byu}%
%{\normalfont\small\slshape\thepage}{}{%
%	\normalfont\small\slshape\ifthenelse{\isodd{\value{page}}}{\leftmark}{\rightmark}}

\pagestyle{byu}
\appto\mainmatter{\pagestyle{byu}}

% -------------- hyperlinks -------------
%\RequirePackage[colorlinks,bookmarks,bookmarksnumbered,allcolors=royal,breaklinks]{hyperref}  % make hyperlinks royal
\RequirePackage[hidelinks,bookmarks,bookmarksnumbered,citecolor=royal,urlcolor=mediumgray,linkcolor=royal,breaklinks]{hyperref}	   % make hyperlinks black
% ---------------------------------------

% ---------- cross referencing ------------
\RequirePackage[noabbrev]{cleveref}
% ---------------------------------------

% ----------- bibliography --------------
\if@fancy
% do nothing for fancy here, see fancy options below
\else
\usepackage[style=ieee]{biblatex}
\bibliography{references}
\fi
% ---------------------------------------

% ----------- user input --------------
\def\@customtitle{\relax}
\newcommand{\customtitle}[1]{\gdef\@customtitle{#1}}

\def\@bauthor{\relax}
\newcommand{\bauthor}[1]{\gdef\@bauthor{#1}}

\def\@department{\relax}
\newcommand{\department}[1]{\gdef\@department{#1}}

\def\@institution{\relax}
\def\@shortinstitution{\relax}
\newcommand{\institution}[2][]{\gdef\@shortinstitution{\ifstrempty{#1}{#2}{#1}} \gdef\@institution{#2}}

\institution{BYU FLOW Lab}

\def\@degree{\relax}
\newcommand{\degree}[1]{\gdef\@degree{#1}}

\if@phd
\degree{Doctor of Philosophy}
\else
\degree{ME EN 497R}
\fi

\newcommand*{\@committeelist}{}
\newcommand*{\committeemember}[1]{\listadd{\@committeelist}{#1}}
\newcommand*{\committeechair}[1]{\committeemember{#1, Chair}}

\def\@copyrightyear{\number\the\year}
\newcommand{\copyrightyear}[1]{\gdef\@copyrightyear{#1}}

\def\@keywords{\relax}
\newcommand{\keywords}[1]{\gdef\@keywords{#1}}
% ---------------------------------------

% ----------- title page --------------
\RequirePackage{etoolbox}
\newcommand*{\@printcommitteemember}[1]{#1\\}
\newlength{\titlebottomadjust}  \setlength{\titlebottomadjust}{18pt}	% defined to tweak the length of the title page so that
% last line of text is at 1 inch above page bottom
\newcommand{\titlepage}{%
	\newgeometry{margin=1.75in}
	\pdfbookmark{TITLE PAGE}{titlepage}
	\pagestyle{empty}
	\begin{Spacing}{2.0}
		\begin{center}
			\@title \\
			\vspace{\fill}
			\@author \\
			\vspace{\fill}
			\begin{SingleSpace}
				A \if@phd dissertation \else thesis \fi submitted to the members of the \\
				\@institution \\
				in partial fulfillment of the requirements for \\
			\end{SingleSpace}
			\@degree \\
			\vspace{\fill}
			\begin{SingleSpace}
				\forlistloop{\@printcommitteemember}{\@committeelist}
			\end{SingleSpace}
			\vspace{\fill}
			\@department \\
			\@institution \\
			\vspace{\fill}
			Copyright \textcopyright{} \@copyrightyear{} \@author \\
			All Rights Reserved
			\par
			\enlargethispage{\titlebottomadjust}
			\clearpage
		\end{center}
	\end{Spacing}
	\restoregeometry
}
% ----------------------------------------

% -------- custom title page -------------
% This title page follows immediately after the title page required by BYU Grad Studies.
% This title page can be customized as the student desires, but should include the title,
% student name, department, degree, and the BYU Engineering logo.
%

\newcommand{\customtitlepage}{%
	\pagestyle{empty}
	\begin{Spacing}{2.2}
		\vspace*{116pt}
		\noindent
		{\color{royal}\Huge\sffamily\itshape\@customtitle} \\
		\vspace{\fill}
	\end{Spacing}
	\begin{Spacing}{1.4}
		{\Large
			\noindent
			\@author \\
			\@department \\
			\@degree} \\
		\vspace{\fill}
		\begin{figure}[htbp]
			\includegraphics[width=3.5in]{frontmatter/figures/college_logo}
		\end{figure}
	\end{Spacing}
}
% ----------------------------------------

% ------------ abstract ------------------
\renewenvironment{abstract}{%
	\clearpage
	\pdfbookmark[0]{ABSTRACT}{abstract}
	\setlength{\parskip}{\baselineskip}
	\vspace*{35pt}	% spacing set to match chapter header spacing
	\begin{flushleft}
		% {\normalfont\LARGE\bfseries Abstract}    						 % black serif boldface
		{\normalfont\LARGE\sffamily\colorchaptitle\itshape{Abstract}}    % royal sans serif italics
		\par
	\end{flushleft}
	%% The following items should be omitted if the optional custom title page is used
	% \@title \\[\baselineskip]
	% \@author \\
	% \@department, \@shortinstitution \\
	% \@degree
	\vspace*{24pt}  % spacing set to match chapter header spacing
}{%
	\par
	\vspace{\fill}
	\noindent
	Keywords: \@keywords
}
% ----------------------------------------

% ---------- dedication ------------
\newenvironment{dedication}{%
	\clearpage
	\pdfbookmark[0]{DEDICATION}{dedication}
	\setlength{\parskip}{\baselineskip}
	\vspace*{35pt}	% spacing set to match chapter header spacing
	\begin{flushleft}
		% {\normalfont\LARGE\bfseries Acknowledgments}    						% black serif boldface
		{\normalfont\LARGE\sffamily\colorchaptitle\itshape{Dedication}}    	% royal sans serif italics
	\end{flushleft}
	\vspace*{24pt}  % spacing set to match chapter header spacing
}
% ----------------------------------------

% ---------- acknowledgments ------------
\newenvironment{acknowledgments}{%
	\clearpage
	\pdfbookmark[0]{ACKNOWLEDGMENTS}{acknowledgments}
	\setlength{\parskip}{\baselineskip}
	\vspace*{35pt}	% spacing set to match chapter header spacing
	\begin{flushleft}
		% {\normalfont\LARGE\bfseries Acknowledgments}    						% black serif boldface
		{\normalfont\LARGE\sffamily\colorchaptitle\itshape{Acknowledgments}}    	% royal sans serif italics
	\end{flushleft}
	\vspace*{24pt}  % spacing set to match chapter header spacing
}
% ----------------------------------------





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% --- ADD FANCY OPTIONS --- %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\if@fancy

% ----------- page layout -------------
% change the page layout to allow margin notes
\setlrmarginsandblock{1.0in}{2.75in}{*}
\setulmarginsandblock{1in}{*}{1}
\checkandfixthelayout
% ---------------------------------------

% ------------- marginnotes -------------
% for notes in the margin, define separation from the textblock, max note width and min vertical distance between notes
\setmarginnotes{0.125in}{2.0in}{\onelineskip}
% ---------------------------------------

% -------------- chapter ----------------
% Revise the chapter style to create a fancier heading
\newcommand{\mhsp}{\hspace{10pt}}
\makechapterstyle{byuchapter}{%
	\setlength{\beforechapskip}{54pt}
	\setlength{\afterchapskip}{48pt}
	\renewcommand*{\chapnamefont}{\normalfont\LARGE\itshape}
	\renewcommand*{\chapnumfont}{\normalfont\LARGE\sffamily\bfseries\colorchapnum}
	\renewcommand*{\chaptitlefont}{\normalfont\LARGE\sffamily\itshape\colorchaptitle}
	\renewcommand*{\afterchapternum}{}
	\renewcommand*{\printchaptername}{}
	\setlength{\midchapskip}{15mm}
	\renewcommand*{\chapternamenum}{%
		\sidebar{\raisebox{-86.5pt}[0pt][0pt]{\rotatebox[origin=c]{90}{%
					\resizebox{\midchapskip}{12pt}{\sffamily\colorchaptitle Chapter}}}}}
	\renewcommand*{\printchapternum}{%
		\sidebar{\raisebox{-76pt}[0pt][0pt]{\makebox[0pt][l]{%
					\resizebox{!}{\midchapskip}{\mhsp\chapnumfont\thechapter}}}}}
	\renewcommand*{\printchaptertitle}[1]{\chaptitlefont ##1}
	\renewcommand*{\afterchaptertitle}%
	{\vskip\afterchapskip}
}
\chapterstyle{byuchapter}


\makechapterstyle{byuappendix}{%
	\setlength{\beforechapskip}{54pt}
	\setlength{\afterchapskip}{48pt}
	\renewcommand*{\chapnamefont}{\normalfont\LARGE\itshape}
	\renewcommand*{\chapnumfont}{\normalfont\LARGE\sffamily\bfseries\colorchapnum}
	\renewcommand*{\chaptitlefont}{\normalfont\LARGE\sffamily\itshape\colorchaptitle}
	\renewcommand*{\afterchapternum}{}
	\renewcommand*{\printchaptername}{}
	\setlength{\midchapskip}{15mm}
	\renewcommand*{\chapternamenum}{%
		\sidebar{\raisebox{-86.5pt}[0pt][0pt]{\rotatebox[origin=c]{90}{%
					\resizebox{\midchapskip}{10pt}{\sffamily\colorchaptitle Appendix}}}}}
	\renewcommand*{\printchapternum}{%
		\sidebar{\raisebox{-76pt}[0pt][0pt]{\makebox[0pt][l]{%
					\resizebox{!}{\midchapskip}{\mhsp\chapnumfont\thechapter}}}}}
	\renewcommand*{\printchaptertitle}[1]{\chaptitlefont ##1}
	\renewcommand*{\afterchaptertitle}%
	{\vskip\afterchapskip}
}
\appto\appendix{\chapterstyle{byuappendix}}

% ---------------------------------------

% ------------- footnotes ----------------
% we place footnotes in the side margin and typeset them using the parameters associated with \footnotes
% \sidefootnotes are treated separately
%\renewcommand{\@makefntext}[1]{\makefootmark\raggedright #1}. % allow footnotes to be ragged right
%\renewcommand*{\thefootnote}{\fnsymbol{footnote}}	% use symbols to denote footnotes
\newcommand{\shsp}{\hspace{4pt}}
\footmarkstyle{\color{royal}#1\shsp}
\renewcommand{\foottextfont}{\scriptsize\color{mediumgray}}			% slightly smaller fontsize since we are placing footnotes in margin
\setlength{\footmarkwidth}{0em} 					% space allocated for the width of the mark
\setlength{\footmarksep}{0em}						% space between the mark and the following text
\setlength{\footparindent}{1em}						% paragraph indent for a multi-paragraph footnote
\counterwithout{footnote}{chapter}					% do not restart footnote numbering with each chapter'
\footnotesinmargin									% put footnotes in the side margin

%The following resets the footnote counter for each chapter.
\let\oldchapter\chapter
\def\chapter{%
	\setcounter{footnote}{0}%
	\oldchapter
}
% ---------------------------------------

% ------------- sidenotes ---------------
% create a new footnote series for sidenotes
\newcounter{snote}[chapter]
\newcommand\sidenote[1]{\stepcounter{snote}\textsuperscript{%
		\fnsymbol{snote}}\marginpar{\scriptsize\textsuperscript{%
			\scriptsize\fnsymbol{snote}}#1}}
% ---------------------------------------

% -------- figures ------------
\RequirePackage{graphicx}
\sidecapmargin{right} %this puts the sidecaptions in the right margin
\setsidecappos{b} %this aligns the side caption with the bottom of the figure
\setsidecaps{0.125in}{2.0in} %this controls the spacing from the edge of the text, and then the width of the box the caption sits in.
%this makes the name of the caption (e.g. Figure 1) bold, small, and blue (the number and word are controlled with separate commands)
%
\captionnamefont{\footnotesize\sffamily\color{royal}}
\captiontitlefont{\footnotesize}
% ------------------------------

% ----------- bibliography --------------
% setup biblatex, specify citation and bibliography styles
\usepackage[style=numeric-comp,citetracker,pagetracker=page,maxcitenames=1,mincitenames=1,giveninits=true,backend=biber,bibstyle=ieee,sorting=none,refsection=chapter,dashed=false]{biblatex}
%\usepackage[citestyle=verbose-ibid,maxcitenames=1,mincitenames=1,giveninits=true,backend=biber,bibstyle=ieee,sorting=none,refsection=chapter]{biblatex}




%Colored numbers
\DeclareFieldFormat{labelnumberwidth}{\color{primary}#1}%
\setlength{\biblabelsep}{8pt}%
\renewbibmacro{in:}{}

%Fix for matching numbering to bibliography and margin citations
\makeatletter
% user-level citation command
\DeclareCiteCommand{\sfcite}[\cbx@superscript]
{\usebibmacro{cite:init}%
	\let\multicitedelim\supercitedelim
	\iffieldundef{prenote}{}{\BibliographyWarning{Ignoring prenote argument}}%
	\iffieldundef{postnote}{}{\BibliographyWarning{Ignoring postnote argument}}}
{\usebibmacro{citeindex}%
	\usebibmacro{cite:super:foot}%
	\usebibmacro{cite:comp}}
{}
{\usebibmacro{cite:dump}}

% save instcount, save key and last inline instcount if seen first on page
\newbibmacro*{cite:super:foot}{%
	\xdef\cbx@key{\thefield{entrykey}}%
	\ifsamepage{\value{instcount}}{\csuse{cbx@instcount@\cbx@key}}{}{%
		\listxadd{\cbx@savelist}{\cbx@key}%
		\ifnumequal{\value{cbx@tempcntd}}{0}{%
			\defcounter{cbx@tempcntc}{\value{instcount}}%
			\loop\ifnum\value{cbx@tempcntc}>0
			\ifsamepage{\value{instcount}}{\value{cbx@tempcntc}}
			{\ifcsundef{blx@fnpage@\number\numexpr\value{cbx@tempcntc}}
				{\setcounter{cbx@tempcntd}{\value{cbx@tempcntc}}}{}%
				\stepcounter{cbx@tempcntc}}
			{\setcounter{cbx@tempcntc}{0}}%
			\repeat}{}}%
	\csnumgdef{cbx@instcount@\cbx@key}{\value{instcount}}}
\let\cbx@savelist\@empty
%\newcounter{cbx@tempcntc}
%\newcounter{cbx@tempcntd}
\setcounter{cbx@tempcntd}{0}

\newrobustcmd*{\cbx@superscript}[1]{%
	\global\toggletrue{cbx@sfcite}
	\mkbibsuperscript{#1}%
	\cbx@footnote%
	\global\togglefalse{cbx@sfcite}}
\newtoggle{cbx@sfcite}

\AtEveryCitekey{%
	\ifciteseen{}{\csnumgdef{cbx@instcount@\thefield{entrykey}}{-1}}%
	\iftoggle{cbx@sfcite}{}{\cbx@footnote}}
\AtEveryBibitem{\cbx@footnote}
\AtEveryLositem{\cbx@footnote}

% defer citation footnotes to last inline reference instance on page
\newrobustcmd*{\cbx@footnote}{%
	\ifboolexpr{ not test {\ifdefempty{\cbx@savelist}}
%		and test {\ifnumequal{\value{instcount}}{\value{cbx@tempcntd}}} 
	}
	{\cbx@sortlist@init%
		\let\do\cbx@do
		\dolistloop{\cbx@sortlist}%
		\global\let\cbx@savelist\@empty
		\setcounter{cbx@tempcntd}{0}}{}}

% print footnotes in 'sorting' order
\def\cbx@do#1{%
	\ifinlist{#1}{\cbx@savelist}
	{\begingroup
		\blx@resetdata
		\blx@getrefcontext{#1}%
		\blx@getdata@cite{#1}%
		\blx@setoptions@type\abx@field@entrytype
		\blx@setoptions@entry
		\csuse{blx@hook@citekey}
		\blx@execute
		\blx@beglang
		\iffieldundef{shorthand}
		{\gdef\@thefnmark{\printfield{labelprefix}\printfield{labelnumber}}}
		{\gdef\@thefnmark{\printfield{shorthand}}}%
		\gappto\@thefnmark{\blx@initunit}%
		\ifhyperref
		{\H@@footnotetext{\blx@driver\abx@field@entrytype}}
		{\@footnotetext{\blx@driver\abx@field@entrytype}}%
		\blx@endlang
		\endgroup}
	{}}

% access internal list of sorted entry keys
\def\cbx@sortlist@init{%
	\global\letcs{\cbx@sortlist}
	{blx@dlist@entry@\the\c@refsection @\blx@refcontext@context}}
\let\cbx@sortlist\@empty
\makeatother

%% for citations in side margin, only print author, title, and year
%% do not include the following items
\AtEveryCitekey{%
	\clearlist{publisher}%
	\clearfield{edition}%
	\clearfield{type}%
	\clearfield{pages}%
	\clearlist{location}%
	\clearlist{institution}%
	\clearfield{volume}%
	\clearfield{number}%
	\clearfield{journaltitle}%
	\clearfield{booktitle}%
	\clearfield{doi}%
	\clearfield{url}%
	\clearfield{isbn}%
	\clearfield{issn}%
	\clearfield{year}%
	\clearfield{mongth}%
}


% ---------------------------------------

\fi


% -------- Custom Commands -------------
\input{customcommands}