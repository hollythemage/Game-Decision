use v6.c; 

use Game::Stats::Population;
use Game::Bayes::Strategy;
 
class Game::Decision::Strategy is Game::Bayes::Strategy {

	has @.strategypopulation;

	submethod BUILD(:@lossfuncs) {
		@.population = @lossfuncs; ### LossFunction instances
		@.strategypopulation = Game::Stats::Population.new;
	}

}
