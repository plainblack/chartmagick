package WebGUI::Chart::Text;

use strict;

use base qw{ WebGUI::Chart };

sub definition {
    my $class = shift;

    tie my %options, 'Tie::IxHash', (
        character => {
            fieldType   => 'selectList',
            label       => 'Character',
            options     => { '@' => '@', '*' => '*', '#' => '#' },
        },
    );

    return { %{ $class->SUPER::definition }, %options };
}

sub draw {
    my $self = shift;

    my $max     = max @data;
    my $divider = $self->get('width') / $max;

    foreach (@data) {
        $output .= $self->get('character') x $_ / $divider;
    }
}

1;

