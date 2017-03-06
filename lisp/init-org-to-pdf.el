;;; init-org-to-pdf.el --- Summary
;;; Commentary:
;;; 使用Xetex生成PDF文件配置
;;; Code:
(require 'ox-latex)
(setq org-latex-pdf-process
'("xelatex -interaction nonstopmode %f"
"xelatex -interaction nonstopmode %f"))
;; code执行免应答（Eval code without confirm）
(setq org-confirm-babel-evaluate nil)
(setq-default TeX-master nil)
(defun org-mode-article-modes ()
  (reftex-mode t)
  (and (buffer-file-name)
       (file-exists-p (buffer-file-name))
       (reftex-parse-all)))
(add-hook 'org-mode-hook
          (lambda ()
            (if (member "REFTEX" org-todo-keywords-1)
                (org-mode-article-modes))))
(unless (boundp 'org-latex-classes)
  (setq org-latex-classes nil))

(add-to-list 'org-latex-classes
             '("cn-article"
               "\\documentclass[10pt,a4paper,titlepage]{article}
\\usepackage{graphicx}
\\usepackage[table,svgnames]{xcolor}
\\usepackage{xeCJK}
\\usepackage{lmodern}
\\usepackage{verbatim}
\\usepackage{fixltx2e}
\\usepackage{longtable}
\\usepackage{tabu}
\\usepackage{float}
\\usepackage{tikz}
\\usepackage{wrapfig}
\\usepackage{soul}
\\usepackage{textcomp}
\\usepackage{listings}
\\usepackage{geometry}
\\usepackage{algorithm}
\\usepackage{algorithmic}
\\usepackage{marvosym}
\\usepackage{wasysym}
\\usepackage{latexsym}
\\usepackage{natbib}
\\usepackage{array,tabularx}
\\usepackage[listings,skins,breakable]{tcolorbox}
\\usepackage[obeyspaces]{url}
\\tcbuselibrary{skins}
\\tcbuselibrary{hooks}
\\tcbuselibrary{breakable}
\\usepackage[xetex,colorlinks=true,CJKbookmarks=true,linkcolor=blue,urlcolor=blue,menucolor=blue]{hyperref}
\\usepackage{fontspec,xunicode,xltxtra}
\\usepackage{fancyhdr} %设置页眉页脚的宏包
\\usepackage{indentfirst}
\\usepackage{courier}
\\setmainfont[BoldFont=Liberation Sans]{Liberation Sans}
\\setsansfont[BoldFont=Liberation Sans]{Liberation Sans}
\\setmonofont{Liberation Mono}
\\setCJKmainfont{WenQuanYi Micro Hei}%中文字体
\\setCJKmonofont{WenQuanYi Micro Hei Mono}
\\hypersetup{unicode=true}
\\geometry{a4paper, textwidth=6.5in, textheight=10in,marginparsep=7pt, marginparwidth=.6in}
\\definecolor{codegreen}{rgb}{0,0.6,0}
\\definecolor{codegray}{rgb}{0.5,0.5,0.5}
\\definecolor{codepurple}{rgb}{0.58,0,0.82}
\\definecolor{backcolour}{rgb}{0.95,0.95,0.92}
\\colorlet{punct}{red!60!black}
\\definecolor{background}{HTML}{EEEEEE}
\\definecolor{delim}{RGB}{20,105,176}
\\colorlet{numb}{magenta!60!black}
\\punctstyle{kaiming}
\\tolerance=1000
\\fancyfoot[C]{\\bfseries\\thepage}
\\pagestyle{fancy}
\\newcommand\\JSONnumbervaluestyle{\\color{blue}}
\\newcommand\\JSONstringvaluestyle{\\color{red}}
% switch used as state variable
\\newif\\ifcolonfoundonthisline
\\makeatletter
\\lstdefinestyle{codestyle}
{
   backgroundcolor=\\color{backcolour},
    commentstyle=\\color{codegreen},
    keywordstyle=\\color{magenta},
    numberstyle=\\tiny\\color{codegray},
    stringstyle=\\color{codepurple},
    basicstyle=\\footnotesize\\ttfamily,
    breakatwhitespace=false,
    breaklines=true,
    captionpos=b,
    keepspaces=true,
    numbers=left,
    numbersep=5pt,
    showspaces=false,
    showstringspaces=false,
    showtabs=false,
    tabsize=4,
    frame=single,
    frameround=tttt,
    framerule=8pt,
    xrightmargin=4mm,
    xleftmargin=4mm}

% flip the switch if a colon is found in Pmode
\\newcommand\\processColon@codestyle{%
  \\colon@codestyle%
  \\ifnum\\lst@mode=\\lst@Pmode%
    \\global\\colonfoundonthislinetrue%
  \\fi
}

\\lst@AddToHook{Output}{%
  \\ifcolonfoundonthisline%
    \\ifnum\\lst@mode=\\lst@Pmode%
      \\def\\lst@thestyle{\\JSONnumbervaluestyle}%
    \\fi
  \\fi
  %override by keyword style if a keyword is detected!
  \\lsthk@DetectKeywords% 
}

% reset the switch at the end of line
\\lst@AddToHook{EOL}%
  {\\global\\colonfoundonthislinefalse}
\\makeatother

\\lstdefinelanguage{json}{ % support json
    keywords={false,true},
    alsoletter=0123456789.,
    morecomment=[l]//,
    morecomment=[s]{/*}{*/},
    morestring=[s]{\"}{\"},
    stringstyle=\\ifcolonfoundonthisline\\JSONstringvaluestyle\\fi,
    MoreSelectCharTable=\\lst@DefSaveDef{`:}\\colon@codestyle{\\processColon@codestyle},
    literate=
     *{:}{{{\\color{punct}{:}}}}{1}
      {,}{{{\\color{punct}{,}}}}{1}
      {\\{}{{{\\color{delim}{\\{}}}}{1}
      {\\}}{{{\\color{delim}{\\}}}}}{1}
      {[}{{{\\color{delim}{[}}}}{1}
      {]}{{{\\color{delim}{]}}}}{1},
}
\\lstdefinelanguage{js}{ % support js
    morekeywords={typeof,new,true,false,catch,function,return,null,catch,switch,var,if,in,while,do,else,case,break},
    morecomment=[l]//,
    morecomment=[s]{/*}{*/},
    morestring=[b]\",
    morestring=[b]\',
    }[keywords,comments,strings]
\\setlength\\arrayrulewidth{0.8pt}\\arrayrulecolor{MidnightBlue} % table line style
%\\rowcolors{1}{Linen}{Beige} % table 行颜色设置
[NO-DEFAULT-PACKAGES]
[NO-PACKAGES]"
("\\section{%s}" . "\\section*{%s}")
("\\subsection{%s}" . "\\subsection*{%s}")
("\\subsubsection{%s}" . "\\subsubsection*{%s}")
("\\paragraph{%s}" . "\\paragraph*{%s}")
("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

;; 使用Listings宏包格式化源代码(只是把代码框用listing环境框起来，还需要额外的设置)
(setq org-latex-listings t)
;; Options for \lset command（reference to listing Manual)
(setq org-latex-listings-options
      '(("style" "codestyle")))
;; Make Org use ido-completing-read for most of its completing prompts.
(setq org-completion-use-ido t)

;; 导出Beamer的设置
;; allow for export=>beamer by placing #+LaTeX_CLASS: beamer in org files
;;-----------------------------------------------------------------------------
(add-to-list 'org-latex-classes
             ;; beamer class, for presentations
             '("beamer"
               "\\documentclass[11pt,professionalfonts]{beamer}
\\mode
\\usetheme{{{{Warsaw}}}}
%\\usecolortheme{{{{beamercolortheme}}}}

\\beamertemplateballitem
\\setbeameroption{show notes}
\\usepackage{graphicx}
\\usepackage{tikz}
\\usepackage{xcolor}
\\usepackage{xeCJK}
\\usepackage{amsmath}
\\usepackage{lmodern}
\\usepackage{fontspec,xunicode,xltxtra}
\\usepackage{polyglossia}
\\setmainfont{Times New Roman}
\\setCJKmainfont{DejaVu Sans YuanTi}
\\setCJKmonofont{DejaVu Sans YuanTi Mono}
\\usepackage{verbatim}
\\usepackage{listings}
\\institute{{{{beamerinstitute}}}}
\\subject{{{{beamersubject}}}}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\begin{frame}[fragile]\\frametitle{%s}"
                "\\end{frame}"
                "\\begin{frame}[fragile]\\frametitle{%s}"
                "\\end{frame}")))

(setq ps-paper-type 'a4
      ps-font-size 16.0
      ps-print-header nil
      ps-landscape-mode nil)

(provide 'init-org-to-pdf)

;;; init-org-to-pdf.el ends here
