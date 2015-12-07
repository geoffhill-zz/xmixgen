SRCS = xmixgen.xslt css.xsl roboto-bold.xsl js.xsl

example.html: $(SRCS) example.xml
	xsltproc -o $@ xmixgen.xslt example.xml

.PHONY: lint
lint:
	xmllint --format -o xmixgen.xslt xmixgen.xslt
	xmllint --format -o css.xsl css.xsl
	xmllint --format -o roboto-bold.xsl roboto-bold.xsl
	xmllint --format -o js.xsl js.xsl

.PHONY: clean
clean:
	rm -f example.html
