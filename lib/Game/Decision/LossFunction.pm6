use v6.c;

use Game::Bayes::Hypothesis;
use Game::Bayes::LossFunction;

class Game::Decision::LossFunction is Game::Bayes::LossFunction {

	has $.hypothesis;

	submethod BUILD(:@ddistribution) {
		
		self.hypothesis = Game::Bayes::Hypothesis.new(@ddistribution);

	}

}
