package MilkyHolms::DB::Row::detective;
use parent qw(MilkyHolms::DB::Row);
use strict;
use warnings;

sub toys_name {
    my($self) = @_;
    my $toys_row = $self->db->select_row('toys', { id => $self->toys_id })	;
    return '' if ( !defined $toys_row );
	return $toys_row->name;
}

1;
