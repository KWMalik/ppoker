package Ppoker::Hand;

use strict;
use Ppoker::Card;

use constant {
	STRAIGHT_FLUSH => 1,
	FOUR_OF_A_KIND => 2,
	FULL_HOUSE => 3,
	FLUSH => 4,
	STRAIGHT => 5,
	THREE_OF_A_KIND => 6,
	TWO_PAIR => 7,
	ONE_PAIR => 8,
	HIGH_CARD => 9,
	
	CLUB => 0x8000,
	DIAMOND => 0x4000,
	HEART => 0x2000,
	SPADE => 0x1000,
	
	TWO => 0,
	THREE => 1,
	FOUR => 2,
	FIVE => 3,
	SIX => 4,
	SEVEN => 5,
	EIGHT => 6,
	NINE => 7,
	TEN => 8,
	JACK => 9,
	QUEEN => 10,
	KING => 11,
	ACE => 12,
};

my @hand_values = (
	"straight flush",
	"four of a kind",
	"full house",
	"flush",
	"straight",
	"three of a kind",
	"two pair",
	"pair",
	"high card",
);

sub rank {
	my $x = shift;
	return (($x >> 8) & 0xF)
}

# given a players hand and any community cards what is the players best hand?
sub whichHand {
	my $hand = shift; #array ref to object refs of cards
	my $comu = shift;

    #combine arrays
    my @all = (@$hand,@$comu);
    #sort descending all cards using the cmpRank comparison function
    my @ordered = reverse sort Ppoker::Card::cmpRank @all;
}

#given an array of poker hands, who is the winner?
sub whoWins {
	
}

1
