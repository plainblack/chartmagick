use strict;

use Chart::Magick::Palette;
use Chart::Magick::Color;
use Data::Dumper;

my $palette = Chart::Magick::Palette->new;
$palette->addColor( Chart::Magick::Color->new( {
    fillTriplet     => '115566',
    fillAlpha       => 'aa',
    strokeTriplet   => '115544',
} ) );
$palette->addColor( Chart::Magick::Color->new( {
    fillTriplet     => '22cdef',
    fillAlpha       => '22',
    strokeTriplet   => '225544',
    strokeAlpha     => '11',
} ) );
$palette->addColor( Chart::Magick::Color->new( {
    fillTriplet     => '332233',
    fillAlpha       => '65',
    strokeTriplet   => '33ffcc',
    strokeAlpha     => '98',
} ) );
$palette->addColor( Chart::Magick::Color->new( {
} ) );

for ( 0..9 ) {
    my $color = $palette->getNextColor;

    print "[", $color->getFillColor, "][", $color->getStrokeColor, "]\n";
}


