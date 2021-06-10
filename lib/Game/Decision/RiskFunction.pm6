use v6.c;

use Game::Bayes::Hypothesis;
use Game::Bayes::RiskFunction;

class Game::Decision::RiskFunction is Game::Bayes::RiskFunction {

	has $.hypothesis is rw;

	submethod BUILD(:@ddistribution) {
		
		self.hypothesis = Game::Bayes::Hypothesis.new(distribution => @ddistribution);

	}

	### Risk R(theta,delta) = E[L(theta,delta(X))] = P(theta)(delta(X))
	### which is the incorrect decision 
	multi method risk-of-zero-one-loss() {
		return $.hypothesis.population.Expectance;
	}
}
