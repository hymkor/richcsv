
readme.md : _readme.md
	gawk -f update_readme.awk _readme.md > readme.md

