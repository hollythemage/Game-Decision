use v6.c;

use Game::Stats::DistributionPopulation;

### Standard Loss Functions for calculating Loss in several ways

class Game::Decision::StandardLossFunction {


	submethod BUILD() {
			
	}

	method squared-error-loss($theta, $a) {

		return ($theta - $a) * ($theta - $a);		

	}

	method squared-error-loss-estimator(@thetas, @deltas) {

		my $distribution = Game::Stats::DistributionPopulation.new;

		for @thetas Z @deltas -> $theta, $delta {
			$distribution.add($theta - $delta);
		}
		
		return $distribution.Expectance;
	}

	### run this multiple times to see if $theta is in @list
	method zero-one-loss($theta, @list) {
		if (@list.Set{$theta}) {
			return 1;
		} else {
			return 0;
		}
	} 
		
}
