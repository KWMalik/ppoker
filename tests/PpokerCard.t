BEGIN {push @INC, '..'};

use strict;
use Test::More tests => 6;

#ok 1 - package available
BEGIN { use_ok('PpokerCard') };

#ok 2 - creates valid object
my $card0 = new_ok('PpokerCard' => [2,0]);

#ok 3 & 4 - object works as expected
is($card0->rank(), 2, 'rank() works');
is($card0->suit(), 0, 'suit() works');

#ok 5 - creates a valid object within parimeter boundaries
my $card1 = new_ok('PpokerCard' => [14,3]);

#ok 6 - test card cmp
subtest 'card cmp functions [cmpRank() and cmpSuit()' => sub {
	plan tests => 4;
	
	is(PpokerCard::cmpRank($card0,$card1),-1,'cmpRank(): $card0 smaller than $card1.');
	is(PpokerCard::cmpRank($card1,$card0),1,'cmpRank(): $card1 larger than $card0.');
	is(PpokerCard::cmpSuit($card0,$card1),-1,'cmpSuit(): $card0 smaller than $card1.');
	is(PpokerCard::cmpSuit($card1,$card0),1,'cmpSuit(): $card1 larger than $card0.');
};