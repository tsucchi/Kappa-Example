package MilkyHolms::DB;
use parent qw(Kappa);
use strict;
use warnings;

sub new {
    my ($class, $dbh, $option_href) = @_;
    $option_href->{row_namespace}   = 'MilkyHolms::DB::Row';
	$option_href->{table_namespace} = 'MilkyHolms::DB::Table';
	my $self = $class->SUPER::new($dbh, $option_href);
	bless $self, $class;
}

sub insert_and_last_insert_id {
    my ($self, @args) = @_;
    $self->insert(@args);
	#移植性がないのが微妙ですね。。。laset_insert_id 使っても微妙だし。。。
	return $self->dbh->sqlite_last_insert_rowid();
}

1;
