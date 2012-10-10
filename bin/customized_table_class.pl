#!perl
use strict;
use warnings;
use DBI;
use lib qw(../lib);
use MilkyHolms::DB;


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

my $db = MilkyHolms::DB->new($dbh);
$db->insert('toys', { id => 1, name => 'サイコキネシス' });
$db->insert('toys', { id => 2, name => 'ダイレクトハック' });
$db->insert('toys', { id => 3, name => 'トライアセンド' });
$db->insert('toys', { id => 4, name => 'ハイパーセンシティブ' });

my $model = $db->model('detective');
# insert のテーブル名省略
$model->insert({ id => 1, toys_id => 1, name => 'シャーロック・シェリンフォード' });
$model->insert({ id => 2, toys_id => 2, name => '譲崎　ネロ' });
$model->insert({ id => 3, toys_id => 3, name => 'エルキュール・バートン' });
$model->insert({ id => 4, toys_id => 4, name => 'コーデリア・グラウカ' });


# 実行例
print $model->toys_name_from_detective_id(1) . "\n"; # => 'サイコキネシス'
