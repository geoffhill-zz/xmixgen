xmixgen
=======

xmixgen is a free software (GNU GPLv3+) static HTML mixtape generator. It is
implemented as an XSLT stylesheet. When applied to an XML mixtape description,
it produces a standalone HTML5 mixtape page.

### Examples

See `example.xml`. Run `make` to compile `example.html` using LibXML's
`xsltproc` tool.

### Design

xmixgen has the following design goals:

  * Minimal

    One invocation of the tool should result in a single self-contained HTML
    document with no dependencies on external JS/CSS, and as few static
    resource dependencies as possible (just audio files), which are all
    specified by relative or absolute URL in the input.

  * Modern

    The output should use features consistent with current best practices for
    responsive design without any external dependencies, including semantic
    HTML5 elements and the `<audio>` tag. The visual design is guided by
    [Material Design](https://google.com/design/spec/material-design/).

  * Semantic

    The output should be fully marked with semantic structure according to
    current best practices, to be equipped for the search engines and music
    aggregators of the future. Currently, this means
    [Microdata](https://en.wikipedia.org/wiki/Microdata_%28HTML%29) with
    [schema.org](https://schema.org/docs/full.html) types.

  * Private

    The output should be well-suited for domains avoiding crawlers and other
    privacy-focused individuals. It should not fetch resources from public CDNs
    and should avoid outbound links that leak the domain via referer [sic].

  * Valid

    The output HTML should be doctype-conformant for all input YAML files, and
    the semantic markup should pass popular structured data validation tools.

  * Free

    The source code for this tool, or any propagated derivative of it, should
    be available to anyone who needs to tinker with it to suit their needs. To
    protect this right, it should be licensed under the copyleft GNU GPL.

### License

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU General Public License as published by the Free Software
Foundation, either version 3 of the License, or (at your option) any later
version.

This program is distributed in the hope that it will be useful, but WITHOUT
ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

See `COPYING` for the full text of the GNU General Public License, version 3.

The Roboto font is included directly as a base64-encoded resource under an
Apache Software License, version 2.0. See `licenses/LICENSE-2.0.txt` for the
full text.
