use v6.c;

use Game::Stats::DistributionPopulation;

### Utility function for values which denote with a probability function
### as which consequences actually occur
### The value of a probability distribution would be given by utility E(P)[U(r)]
### over all probability distributions on a set of rewards R, relative
### to the probability distribution P

class Game::Decision::UtilityFunction {


	submethod BUILD() {
			
	}

	### E(P)[U(R)], for a single P
	method utlityf($distributionpopulation) {

		return $distributionpopulation.Expectance;	

	}	

	### For a reward r, P2 is preferred over P1 with E(Px)[U(R)] as utility
	### function if Estimate of P2 > Estimate of P1
	method is-preferred-over($utilityf1, $utilityf2) {
		if ($utilityf1 == $utilityf2) {
			return False;
		}
		return $utilityf1 < $utilityf2;
	}

	### A main preferred rewards system with three rewards to calculate
	### the utility functions (values of a gamble)
	### r1 << r3 << r2 as rewards, find alpha in r3 ~= a*r1 + (1 - a)*r2
	### and a*r3 + (1 - a) * r2 where r3 is preferred over r1 and r2 over r3
	### U(r1) == 0, U(r2) == 1 

	### the first function denotes r3 << r1
	method three-rewards-solving-alpha1($r1,$r3) {
		return - $r3 / ($r1 - $r3);  ### alpha
	}
	### the second function denotes r2 << r3
	method three-rewards-solving-alpha2($r2,$r3) {
		return - $r2 / ($r3 - $r2); ### alpha
	}

	method three-rewards-solving-U3-alpha1($alpha1) {
		return - (1 - $alpha1) / $alpha1; ### Ur3
	}
 
	method three-rewards-solving-U3-alpha2($alpha2) {
		return 1 / (1 - $alpha2); ### Ur3
	}

	### The main part now :
	method three-rewards-solving-U1($alpha1, $Ur3) {
		return $alpha1 * $Ur3 + (1 - $alpha1);
	}
		
	method three-rewards-solving-U2($alpha2, $Ur3) {
		return (1 - $alpha2) * $Ur3;  
	}
		
}
