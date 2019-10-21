#######################################################
# This script goes through the steps required to update 
# my personal website.
# Note: I have created an ssh profile (mysite) that can 
# be used to ssh to RH (rechost)
#######################################################

url := mysite:~/public_html/
#cv_dir := /Users/Marco/Documents/cv/
cv_dir := /Users/Marco/OneDrive\ -\ Harvard\ University/Application\ Material/cv
build: clean 
	@bundle exec jekyll build --trace
	#@cat page_header.html $(cv_dir)/publist.html page_footer.html > _site/_pages/publications/index.html
	#@cp $(cv_dir)/publist.css _site/_pages/publications/
publish:
	cd _site && cp $(cv_dir)/MarcoDonato_cv.pdf . && scp -r * $(url)
#biblio: $(cv_dir)/MDonatopubs.bib
#	cp $(cv_dir)/MDonatopubs.bib _bibliography
	
update:
	bundle update && bundle install
test: build
	jekyll serve --watch

	

.PHONY: clean
clean:
	rm -rf _site




