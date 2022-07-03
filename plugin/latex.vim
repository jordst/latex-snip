filetype plugin indent on 

if exists("g:loaded_latex_cmds")
	finish
endif

let g:loaded_latex_cmds = 1

autocmd FileType tex,md setlocal foldmethod=manual

if &wrap == 0
	autocmd FileType tex,md setlocal textwidth=79
endif

autocmd FileType tex,md noremap <space><tab> <Esc>/<++><CR>"_c4l

"begin document
autocmd FileType tex inoremap ;d <CR>\begin{document}<CR><CR>\end{document}<Esc>ki

"itemize
autocmd FileType tex inoremap ;i \begin{itemize}<CR>\item<space><++><CR>\item<space><++><CR>\item<space><++><CR>\end{itemize}<CR><CR><++>

"enumerate
autocmd FileType tex inoremap ;en \begin{enumerate}<CR>\item<space><++><CR>\item<space><++><CR>\item<space><++><CR>\end{enumerate}<CR><CR><++>

"itemize/enumerate item
autocmd FileType tex inoremap ;it <CR>\item <++><Esc>/<++><CR>"_c4l

"figure
autocmd FileType tex inoremap ;fi \begin{figure}[h]<CR>\centering<CR>\includegraphics[width=160px]{<++>}<CR>\caption{<++>}<CR>\end{figure}<Esc>2k/<++><CR>"_c4l

"section
autocmd FileType tex inoremap ;s \section{<++>}<CR><++><Esc>1k0/<++><CR>"_c4l

"subsecton
autocmd FileType tex inoremap ;sc \subsection{<++>}<CR><++><Esc>1k0/<++><CR>"_c4l

"subsubsection
autocmd FileType tex inoremap ;scc \subsubsection{<++>}<CR><++><Esc>1k0/<++><CR>"_c4l

"emphatic text
autocmd FileType tex inoremap ;e \emph{<++>}<space><++><Esc>F{lc4l

"bold text
autocmd FileType tex inoremap ;b \textbf{<++>}<space><++><Esc>F{lc4l

"new page
autocmd FileType tex inoremap ;n \newpage

"contents page
autocmd FileType tex inoremap ;tb \thispagestyle{plain}<CR>\newpage<CR>\begin{center}<CR>\tableofcontents<CR>\end{center}<CR>\newpage<CR><CR><++>

"table 
autocmd FileType tex inoremap ;tab \begin{center}<CR>\begin{tabular}{c\|p{8cm}\|p{8cm}}<CR>\hline<CR><++><space>&<space><++><space>&<space><++>\\<space>\hline<CR>\end{tabular}<CR>\end{center}<Esc>2k^c4l

"line break
autocmd FileType tex inoremap ;lb \linebreak

"Begin frame for Presentations
autocmd FileType tex inoremap ;fr \begin{frame}<CR>\frametitle{<++>}<CR><++><CR>\end{frame}<CR><++>

"cite
autocmd FileType tex inoremap ;c \cite{<++>}<Esc>F<c4l

autocmd FileType tex inoremap ;ve \begin{verbatim}<CR><++><CR>\end{verbatim}<Esc>k_c4l

"BibTeX template commands
autocmd FileType bib inoremap ;b @book{<++>,<CR><tab>author="<++>",<CR>year="<++>",<CR>title="<++>",<CR>publisher="<++>",<CR>%volume="<++>",<CR>%number="<++>",<CR>%series="<++>",<CR>%address="<++>",<CR>%edition="<++>",<CR>%month="<++>",<CR>%note="<++>",<CR>}<Esc>12k0f<c4l

autocmd FileType bib inoremap ;a @article{<++>,<CR><tab>author="<++>",<CR>title="<++>",<CR>journal="<++>",<CR>year="<++>",<CR>month="<++>",<CR>%volume="<++>",<CR>%number="<++>",%pages="<++>",%note="<++>"<CR>}<Esc>8k0f<c4l

autocmd FileType bib inoremap ;m @misc{<++>,<CR><tab>author="<++>",<CR>title="<++>",<CR>%howpublished="<++>",<CR>year="<++>",<CR>month="<++>",<CR>%note="<++>",<CR>url="<++>",<CR>}<Esc>8k0f<c4l

"Set custom folds " za - open fold
function! s:Fold_Lines(count) range
	if &foldmethod == "manual"
		if a:count > 0 
			execute "normal zf".a:count."j"
		else
			execute "normal zf}"
		endif
	endif
endfunction

command! -nargs=1 FoldLines call s:Fold_Lines(v:count)
