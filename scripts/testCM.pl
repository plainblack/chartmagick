use strict;

use Chart::Magick::Axis::Lin;
use Chart::Magick::Axis::LinLog;
use Chart::Magick::Line;
use Chart::Magick::Bar;
use Chart::Magick::Pie;
use Chart::Magick;
use Image::Magick;
use Data::Dumper;

use constant pi => 3.14159265358979;


my $dsLarge;
$dsLarge->{x}    = [ map { 10 * pi /10000 * $_          } (0..1000)             ];
$dsLarge->{y}       = [ map { 1.1 + sin( 50*$_ ) + sin( 61*$_ )   } @{ $dsLarge->{x} }    ];

my @dsl = (
    [ map { 10 * pi /10000 * $_          } (0..1000) ],
    [ map { 1.1 + sin( 50*$_ ) + sin( 61*$_ )   } @{ $dsLarge->{x} } ],
);

my $axis    = Chart::Magick::Axis::Lin->new( {
    width   => 1000,
    height  => 600,
} );
$axis->set('xSubtickCount', 0);
$axis->set('xLabelUnits', pi);
$axis->set('xTickWidth', pi / 4);


my $chart2  = Chart::Magick::Line->new();
$chart2->dataset->addDataset( @dsl );
$chart2->set('plotMarkers', 1);

$axis->addChart( $chart2 );
$axis->draw;

print Dumper( $axis->get );
print Dumper( $axis->{_plotOptions} );


for (0 .. 1000/20) {
    my $x = 50 * $_;
    $axis->im->Draw(
        primitive   => 'Line',
        points      => "$x,0,$x,50",
        stroke      => 'magenta',
    );
}

$axis->im->Write('out.png');

#print join "\n" , $canvas->im->QueryFont;
