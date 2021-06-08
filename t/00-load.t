use v6.c;
use Test;      # a Standard module included with Rakudo 
use lib 'lib';

my $num-tests = 6;

plan $num-tests;
 
# .... tests 
#  

use-ok "Game::Decision::Action";
use-ok "Game::Decision::DecisionRule";
use-ok "Game::Decision::StandardLossFunction";
use-ok "Game::Decision::LossFunction";
use-ok "Game::Decision::RiskFunction";
use-ok "Game::Decision::Strategy";

done-testing;  # optional with 'plan' 
