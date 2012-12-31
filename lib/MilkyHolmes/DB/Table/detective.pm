package MilkyHolmes::DB::Table::detective;
use parent qw(MilkyHolmes::DB::Table);
use strict;
use warnings;

sub toys_name_from_detective_id {
    my($self, $id) = @_;
	my $row = $self->select_row({ id => $id }); #detective テーブルはテーブル名を省略できる。
	return '' if ( !defined $row );
	return $row->toys_name;# 前回作った toys_name を呼ぶ
}


1;
