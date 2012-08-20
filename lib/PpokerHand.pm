package PpokerHand;

use strict;
use PpokerCard;

my @hands = (
	"high card",
	"pair",
	"two pair",
	"three of a kind",
	"straight",
	"flush",
	"full house",
	"four of a kind",
	"straight flush"
);

# given a players hand and any community cards what is the players best hand?
sub whichHand {
	my $hand = shift; #array ref to object refs of cards
	my $comu = shift;

    #combine arrays
    my @all = (@$hand,@$comu);
    #sort descending all cards using the cmpRank comparison function
    my @ordered = reverse sort PpokerCard::cmpRank @all;
}

#given an array of poker hands, who is the winner?
sub whoWins {
	
}

1
