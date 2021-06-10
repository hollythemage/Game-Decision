use v6.c;
use Game::Bayes::Action;

class Game::Decision is Game::Bayes::Action {

	submethod BUILD(:@actiondistrib) {
		self.actionthreshold = 0.0000001;
		self.population = @actiondistrib;
	}

}
