BEGIN {push @INC, '..'};

use strict;
use Test::More tests => 3;
use constant {
	TWO => 2,	THREE => 3,
	FOUR => 4,	FIVE => 5,
	SIX => 6,	SEVEN => 7,
	EIGHT => 8,	NINE => 9,
	TEN => 10,	JACK => 11,
	QUEEN => 12,	KING => 13,
	ACE => 14,
	
	SPADE => 0,	HEART => 1,
	CLUB => 2,	DIAMOND => 3
};

#ok 1 & 2 - package available
BEGIN {
	use_ok('Ppoker::Hand');
	use_ok('Ppoker::Card');
};

#ok 3
my @d = ();
subtest 'create a deck' => sub {
	plan tests => 53;
	for(my $i=0;$i<4;$i++) {
		push @d, [];
		for(my $j=2;$j<15;$j++) {
			push @{$d[$i]}, new_ok('Ppoker::Card' => [$j,$i]);
		}
	}
    #this is just here because I forgot which way push works.
    ok($d[0][0]->rank eq TWO && $d[0][0]->suit eq SPADE, 'deck constructed in proper order');
};

#ok 4
#a player's hand
my $h0 = [
	$d[TWO][SPADE],
	$d[KING][HEART]
];
#a table's community cards
my $c0 = [
	$d[NINE][SPADE],
	$d[SIX][DIAMOND],
	$d[TEN][DIAMOND],
	$d[KING][CLUB],
	$d[QUEEN][DIAMOND]
];
#the expected best hand for that player
my $r0 = [
	$d[KING][HEART],
	$d[KING][CLUB],
	$d[QUEEN][DIAMOND],
	$d[TEN][DIAMOND],
	$d[NINE][SPADE]
];
#ok(whichHand($h0,$c0));
