#!/usr/bin/env perl

use 5.028;
use XML::LibXML ();

my $dom = XML::LibXML->load_xml( string => <<'EOF' );
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE foo [<!ENTITY xxe SYSTEM "file:///app/readme.md">]>
<foo>&xxe;</foo>
EOF

say 'Processed XML using libxml2 version ' . XML::LibXML::LIBXML_DOTTED_VERSION;
say for $dom->getElementsByTagName('foo');
