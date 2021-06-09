use v6.c;

use Game::Stats::DistributionPopulation;

use Game::Bayes::IntegralExp;

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
		my $p = Game::Bayes::IntegralExp;
		my $loss1 = self.zero-one-loss($theta1, @list);
		my $loss2 = self.zero-one-loss($theta2, @list);

		my $d = Game::Stats::DistributionPopulation;
		$d.add($loss1);
		$d.add($loss2);

		my $mu = $d.Expectance; 
		my $sigma = sqrt($d.Variance); 

		return $p.Probability($loss2, $loss1, $mu, $sigma);
	} 
		
	### of zero-one loss, Bayesian expected loss
	### simplificated method
	method zero-one-bayesian-expected-loss-simple($theta1, @list) {

		return (1 - self.zero-one-loss($theta1, @list)); 

	}

	### predicition of future random variables with 2 conditional
	### probabilities where condp == P(b|a), a unknown
	method predictive-problem-loss($loss1, $loss2, $condp1, $condp2) {
		my $p = Game::Bayes::IntegralExp;
		my $d = Game::Stats::DistributionPopulation;
		$d.add($condp1*$loss1);
		$d.add($condp2*$loss2);

		my $mu = $d.Expectance; 
		my $sigma = sqrt($d.Variance); 

		return $p.Probability($condp2*$loss2, $condp1*$loss1, $mu, $sigma);
	} 
}
