test: test.vala
	valac ./test.vala --vapidir=./ --pkg=opencv --pkg=gio-2.0

c: test.vala
	valac ./test.vala --vapidir=./ --pkg=opencv --pkg=gio-2.0 --save-temps