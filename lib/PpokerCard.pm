package PpokerCard;

require Exporter;
@ISA = qw/Exporter/;
@EXPORT = qw/cmpRank cmpSuit/;

use strict;
use Carp;

use constant {
	MIN_RANK => 2,
	MAX_RANK => 14,
	MIN_SUIT => 0,
	MAX_SUIT => 3
};

#constructor method will fail if input perameters are
#outside range, see constants above.
sub new {
	my $class = shift;
	
	my ($rank,$suit) = @_;
	
	unless($rank >= MIN_RANK && $rank <= MAX_RANK) {
		confess '$rank outside of allowed range';
	}
	unless($suit >= MIN_SUIT && $suit <= MAX_SUIT) {
		confess '$suit outside of allowed range';
	}
	
	my $self = bless {
		rank => $rank,
		suit => $suit
	}, $class;
	
	return $self;
}

#accessor method for rank
sub rank {
	my $self = shift;
	
	return $self->{rank};
}

#accessor method for suit
sub suit {
	my $self = shift;
	
	return $self ->{suit};
}

#functions below this point, not methods.


sub cmpRank {
	my $card1 = shift;
	my $card2 = shift;
	
	return ($card1->rank <=> $card2->rank);
}

sub cmpSuit {
	my $card1 = shift;
	my $card2 = shift;
	
	return ($card1->suit <=> $card2->suit);
}

1