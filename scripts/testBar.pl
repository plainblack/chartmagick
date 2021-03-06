use strict;

use Chart::Magick::Axis::Lin;
use Chart::Magick::Axis::LinLog;
use Chart::Magick::Line;
use Chart::Magick::Bar;
use Chart::Magick::Pie;
use Chart::Magick;
use Chart::Magick::Data;

use Image::Magick;
use Data::Dumper;

use constant pi => 3.14159265358979;

my $ds = Chart::Magick::Data->new;

#$ds->addDataPoint( [ 0, 1, 2], [ 8, 9] );
#$ds->addDataPoint( [ 2, 3, 4], [ 9, 0] );
#$ds->addDataPoint( 1, 6 );
#$ds->addDataPoint( 3, 4 );

#$ds->addDataset(
#    [ qw( 1 2 3 4 5 ) ],
#    [ qw( 2 2 2 2 2 ) ],
#);

$ds->addDataset(
    [ qw( 1 2 3 4 5 ) ],
    [ qw( 1 3 5.9 3 2 ) ],
);
#$ds->addDataset(
#    [ qw( 1 10 100 1000 10000 ) ],
#    [ qw( 5 2 -1 8 3 ) ],
#);




$ds->addDataset(
    [ qw( 1 2 3 4 5 ) ],
    [ qw( 7 -4 6 1 9 ) ],
);
$ds->addDataset(
    [ qw( 1 2 3 4 5 ) ],
    [ qw( 0.5 5 1 4 2 ) ],
);

my $axis    = Chart::Magick::Axis::Lin->new( {
    width   => 1000,
    height  => 600,
} );
$axis->set('xSubtickCount',  0);
$axis->set('yChartOffset',  40);
$axis->set('xTickOffset',   0.5);
$axis->set('yTickWidth',    2);
#$axis->set('xChartOffset', 40);
#$axis->set('xLabelUnits', pi);

my $chart   = Chart::Magick::Bar->new( );
#$chart->addDataset( $ds1 );
#$chart->addDataset( $ds2 );
#$chart->addDataset( $ds3 );
#$chart->addDataset( $ds4 );
$chart->setData( $ds );
$chart->set('barWidth',     10);
$chart->set('barSpacing',   3);
$chart->set('drawMode',     'sideBySide');

$axis->addChart( $chart );
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


print $ds->dumpData;

#print join "\n" , $canvas->im->QueryFont;
