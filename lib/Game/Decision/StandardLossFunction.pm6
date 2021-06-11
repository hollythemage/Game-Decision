use v6.c;

use Game::Stats::DistributionPopulation;
use Game::Numeric::SquaredErrorLossIntegral;

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
	### returns 0 if $theta is in @list
	method zero-one-loss($theta, @list) {
		if (@list.Set{$theta}) {
			return 0;
		} else {
			return 1;
		}
	} 
	
	### of zero-one loss, Bayesian expected loss	
	method zero-one-bayesian-expected-loss($theta1, $theta2, @list) {
		my $loss1 = self.zero-one-loss($theta1, @list);
		my $loss2 = self.zero-one-loss($theta2, @list);
	
		if ($loss1 max $loss2 == $loss1) {	
			return $loss1*$theta1 - $loss2*$theta2;
		} else { 
			return $loss2*$theta2 - $loss1*$theta1; 
		}
	}	 
		
	### of zero-one loss, Bayesian expected loss
	### simplificated method
	method zero-one-bayesian-expected-loss-simple($theta1, @list) {

		return (1 - self.zero-one-loss($theta1, @list)); 

	}

	### predicition of future random variables with 2 conditional
	### probabilities where condp == P(theta|theta0), with theta0 unknown
	### $b1 and $b2 are the bounds of the integral
	### use only for squared-error loss
	method predictive-problem-squared-error-loss($theta1, $theta2, $a) {
		my $int = Game::Numeric::SquaredErrorLossIntegral.new;
		return $int.calculate-integral-in-theta($theta1, $theta2, $a);	
	} 
}
