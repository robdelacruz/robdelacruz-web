#!/usr/bin/env perl
use strict;
use CGI;

print "Content-Type: text/html\r\n\r\n";

print <<EOT;
<!DOCTYPE html>
<h1>rob.pl cgi perl</h1>
<p>Working!</p>
EOT

#print "<ul>\n";
#foreach my $k (sort(keys %ENV)) {
#    print "<li>$k = $ENV{$k}</li>\n";
#}
#print "</ul>\n";

my $q = CGI->new;
my $name = $q->param("name");
print "<p>name: $name</p>\n";

