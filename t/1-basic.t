use strict;
use warnings;
use Test::More tests => 3;

use lib 'lib';
use_ok('Math::ConvexHull');
use Math::ConvexHull qw/convex_hull/;

my $start = [[1,0],[1,1],[0.1,0.05],[0.9,0.5],[0,0]];
my $t = convex_hull($start);
ok(1, 'convex_hull() did not complain');

my %results = (map {($_, undef)} @$start);
ok(
	(
		@$t == 3
			and
		(map {delete $results{$_}} @$t)
			and
		(
			exists $results{$start->[2]} and
			exists $results{$start->[3]}
		)
	),
	'convex_hull returned correct result.'
);








