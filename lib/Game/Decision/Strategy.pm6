use v6.c; 

use Game::Stats::Population;
use Game::Bayes::Strategy;
 
class Game::Decision::Strategy is Game::Bayes::Strategy {

	has @.strategypopulation;

	submethod BUILD(:@lossfuncs) {
		self.population = @lossfuncs; ### LossFunction instances
		self.strategypopulation = Game::Stats::Population.new;
	}

}
