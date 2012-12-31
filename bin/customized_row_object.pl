#!perl
use strict;
use warnings;
use DBI;
use Kappa;
use FindBin;
use lib "$FindBin::RealBin/../lib";

# テーブル作成
my $dbh = DBI->connect("dbi:SQLite:dbname=:memory:",'','');
$dbh->do("
CREATE TABLE detective (
  id      INT PRIMARY KEY,
  toys_id INT, /* toys.id */
  name    TEXT
);
");

$dbh->do("
CREATE TABLE toys (
  id    INT PRIMARY KEY,
  name  TEXT
);
");

# Kappa オブジェクト作成
my $db = Kappa->new($dbh, { row_namespace => 'MilkyHolmes::DB::Row' });
$db->insert('toys', { id => 1, name => 'サイコキネシス' });
$db->insert('toys', { id => 2, name => 'ダイレクトハック' });
$db->insert('toys', { id => 3, name => 'トライアセンド' });
$db->insert('toys', { id => 4, name => 'ハイパーセンシティブ' });

$db->insert('detective', { id => 1, toys_id => 1, name => 'シャーロック・シェリンフォード' });
$db->insert('detective', { id => 2, toys_id => 2, name => '譲崎　ネロ' });
$db->insert('detective', { id => 3, toys_id => 3, name => 'エルキュール・バートン' });
$db->insert('detective', { id => 4, toys_id => 4, name => 'コーデリア・グラウカ' });


# 実行例
my $row = $db->select('detective', { id => 1 });
print $row->id . "\n";         # => 1
print $row->name . "\n";       # => 'シャーロック・シェリンフォード'
print $row->toys_name . "\n";  # => 'サイコキネシス'
print $row->csv_output . "\n"; # => '1, 1, シャーロック・シェリンフォード'
