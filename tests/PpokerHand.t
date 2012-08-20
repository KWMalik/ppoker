BEGIN {push @INC, '..'};

use strict;
use Test::More tests => 3;
use constant {
	TWO => 0,	THREE => 1,
	FOUR => 2,	FIVE => 3,
	SIX => 4,	SEVEN => 5,
	EIGHT => 6,	NINE => 7,
	TEN => 8,	JACK => 9,
	QUEEN => 10,	KING => 11,
	ACE => 12,
	
	SPADE => 0,	HEART => 1,
	CLUB => 2,	DIAMOND => 3
};

#ok 1 & 2 - package available
BEGIN {
	use_ok('PpokerHand');
	use_ok('PpokerCard');
};

#define quick shorthand for PpokerCard->new()
sub c {
	my ($rank, $suit) = @_;
	return PpokerCard->new($rank, $suit);
}

#ok 3
my @d = ();
subtest 'create a deck' => sub {
	plan tests => 52;
	for(my $i=0;$i<4;$i++) {
		push @d, [];
		for(my $j=2;$j<15;$j++) {
			push($d[$i], new_ok( 'PpokerCard' => [$j,$i]));
		}
	}
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