package MilkyHolms::DB::Row;
use parent qw(Kappa::Row);
use strict;
use warnings;

sub csv_output {
    my ($self) = @_;
	# これは説明用の超テキトウな実装なので、ちゃんとやるときは Text::CSV 系のモジュールを使ってください。
	my %row_value = $self->row_value;
	return join(',', sort values %row_value);
}

1;
