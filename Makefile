example.html: xmixgen.xslt roboto-bold.xsl example.xml
	xsltproc -o $@ xmixgen.xslt example.xml
