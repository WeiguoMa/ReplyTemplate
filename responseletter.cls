% ----------------------------------------------------------------
% cls file created by Weiguo Ma
% ----------------------------------------------------------------
% This class file is created for personal or public use.
% No warranty or guarantee is provided; use it at your own risk.
% ----------------------------------------------------------------
%
% Author: Weiguo Ma
% Date: August 16, 2024
% ----------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{responseletter}[2024/08/16 Class for responding to reviewers]

\LoadClass[12pt]{article}
\RequirePackage{xcolor}
\RequirePackage{titlesec}
\RequirePackage{geometry}
\RequirePackage{setspace}
\RequirePackage{pgffor}
\RequirePackage{amsmath}

% Set Font style
\RequirePackage{fontspec}
\setmainfont{Times New Roman}

\geometry{margin=2.54cm}

\renewcommand{\baselinestretch}{1.5}

\definecolor{responsecolor}{rgb}{0,0,1}

\newcommand{\ordinal}[1]{%
    \foreach \n in {#1} {%
        \ifcase\n\or First\or Second\or Third\or Fourth\or Fifth\or Sixth\or Seventh\or Eighth\or Ninth\or Tenth\else \number\n th\fi%
    }%
}

% Number of Replies
\newcommand{\SetTimeOfReply}[1]{
    \def\TimeOfReply{#1}
}

% Basic information of the article
\newcommand{\SetArticleInfo}[4]{
    \def\ArticleNumber{#1}
    \def\ArticleTitle{#2}
    \def\ArticleAuthor{#3}
    \def\ArticleIDAuthorLastName{#4}  % article number/first author last name
}

\newcommand{\ReEditor}[1]{
    \clearpage
    \textbf{Re: \ArticleNumber} \\
    \textbf{\ArticleTitle} \\
    \textbf{By \ArticleAuthor} \\\\
    #1
    \newpage
}

\newenvironment{PointToPoint}{
    \clearpage
    \textbf{Point-to-point responses and the corresponding revisions.}\\
}

\newenvironment{Reply}[1]{
    \def\refereenumber{#1}
    ------------------------------------------------------------------------\\
    \ifx\TimeOfReply First
    Report of the \ordinal{#1} Referee -- \ArticleIDAuthorLastName\\
    \else
    \ordinal{\TimeOfReply{}} Report of the \ordinal{#1} Referee -- \ArticleIDAuthorLastName\\
    \fi
    ------------------------------------------------------------------------\\
}


\newcommand{\RespondComment}[2]{
    Referee \#\refereenumber{} commented:\\
    \textit{#1}\\\\
    Our response: \\
    \textcolor{responsecolor}{#2}\\\\
}

% Summary of Changes
\newenvironment{SummaryOfChanges}{
    \clearpage
    **************\\
    \textbf{Summary of Changes}\\
    All our main changes are marked in blue in the additional manuscripts. In the following, we provide a summary of the changes:\\
}

\newcommand{\placeholder}[1]{
    \textcolor{red}{\textbf{[TODO: #1]}}
}

% No indent in the beginning of paragraphs and extra space between paragraphs
\setlength{\parindent}{0pt}
\setlength{\parskip}{1em}  % Adjust the space according to your preference
