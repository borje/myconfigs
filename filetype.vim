if exists("did_load_filetypes") 
	finish 
endif 

" jam detection 
augroup filetypedetect 
au! BufRead,BufNewFile Jamroot        setfiletype jam 
au! BufRead,BufNewFile Jamfile        setfiletype jam 
augroup END
