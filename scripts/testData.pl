use strict;

use Chart::Magick::Data;
use Data::Dumper;

my $ds = Chart::Magick::Data->new;

#$ds->addDataPoint( [ 0, 1, 2], [ 8, 9] );
#$ds->addDataPoint( [ 2, 3, 4], [ 9, 0] );
$ds->addDataPoint( 1, 6 );
$ds->addDataPoint( 3, 4 );

$ds->addDataset(
    [ qw( 1 2 3 4 5 ) ],
    [ qw( 2 2 2 2 2 ) ],
);

$ds->addDataset(
    [ qw( 1 2 3 4 5 ) ],
    [ qw( 1 3 5.9 3 2 ) ],
);
$ds->addDataset(
    [ qw( 1 10 100 1000 10000 ) ],
    [ qw( 5 2 -1 8 3 ) ],
);
$ds->addDataset(
    [ qw( 1 2 3 4 5 ) ],
    [ qw( 7 -4 6 1 9 ) ],
);
$ds->addDataset(
    [ qw( 1 2 3 4 5 ) ],
    [ qw( 0.5 5 1 4 2 ) ],
);


print $ds->dumpData;
