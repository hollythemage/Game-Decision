use v6.c;
use Game::Bayes::Action;

class Game::Decision is Game::Bayes::Action {

	submethod BUILD(:@actiondistrib) {
		$.actionthreshold = 0.0000001;
		@.population = @actiondistrib;
	}

}
