use strict;
use Image::Magick;

my $im = Image::Magick->new;
foreach my $font (  $im->QueryFont ) {
    print "--- $font -----------------\n";

    print "\t", join( "\n\t", $im->QueryFont( $font ) ), "\n";
}


