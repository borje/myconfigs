if exists("did_load_filetypes") 
	finish 
endif 

" jam detection 
augroup filetypedetect 
au! BufRead,BufNewFile Jamroot        setfiletype jam 
au! BufRead,BufNewFile Jamfile        setfiletype jam 
au! BufRead,BufNewFile *.json         setfiletype javascript
augroup END

au! BufRead,BufNewFile .hgrc          setfiletype cfg

autocmd Filetype go setlocal tabstop=4 shiftwidth=4 softtabstop=0 noexpandtab
