example.html: xmixgen.xslt example.xml
	xsltproc -o $@ $+
