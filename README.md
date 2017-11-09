xmixgen
=======

xmixgen is a free software (GNU AGPL3+) static HTML mixtape generator. It is
implemented as an XSLT stylesheet. When applied to an XML mixtape description,
it produces a standalone HTML5 mixtape page.

### Examples

See `example.xml`. Run `make` to compile `example.html` using LibXML's
`xsltproc` tool.

### Design

xmixgen has the following design goals:

  * Free

    The source code for this tool, or any derivative of it, is available to
    imitate or adapt. To protect this right, it is licensed under the copyleft
    GNU AGPL.

  * Minimal

    One invocation of the tool results in a single self-contained HTML document
    with no dependencies on external JS/CSS, and as few static resource
    dependencies as possible (just the audio files).

  * Privacy-aware

    The output is well-suited for private or unlinked domains. To avoid leaking
    discoverability to third-parties, it does not fetch resources from public
    CDNs and uses "no-referrer" policy for the few links it has.

  * Modern

    The output HTML uses features of semantic HTML5 elements and the `<audio>`
    tag. The visual design is guided by
    [Material Design](https://google.com/design/spec/material-design/) but the
    style implementation is custom and small.

  * Semantic

    The output HTML is fully marked with semantic structure according to current
    best practices, equipped for the search engines and music aggregators of the
    future. This means
    [Microdata](https://en.wikipedia.org/wiki/Microdata_%28HTML%29) with
    [schema.org](https://schema.org/docs/full.html) types.

  * Valid

    The output HTML is doctype-conformant for all input XML files, and the
    semantic markup passes popular structured data validation tools.

### License

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, either version 3 of the License, or (at your option) any
later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE. See the GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License along
with this program. If not, see <http://www.gnu.org/licenses/>.

### TODO

* Write an XML schema definition to validate input files.
