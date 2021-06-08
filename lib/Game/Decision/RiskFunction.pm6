use v6.c;

use Game::Bayes::Hypothesis;
use Game::Bayes::RiskFunction;

class Game::Decision::RiskFunction is Game::Bayes::RiskFunction {

	has $.hypothesis is rw;

	submethod BUILD(:@ddistribution) {
		
		$.hypothesis = Game::Bayes::Hypothesis.new(distribution => @ddistribution);

	}

}
