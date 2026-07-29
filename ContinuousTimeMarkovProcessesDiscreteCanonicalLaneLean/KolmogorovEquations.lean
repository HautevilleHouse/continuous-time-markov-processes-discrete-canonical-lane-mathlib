import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ContinuousTimeMarkovProcessesDiscrete.MarkovProcessDefinitions

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscrete

structure KolmogorovForwardEquation (S : StateSpace) [Fintype S.carrier]
    (M : FiniteStateContinuousTimeMarkovProcess S) where
  transitionMatrix : ℝ → Matrix (Fin (Fintype.card S.carrier)) (Fin (Fintype.card S.carrier)) ℝ
  differentialEquation : ∀ t : ℝ, derivative (transitionMatrix t) = transitionMatrix t * M.generatorMatrix
  initialCondition : transitionMatrix 0 = 1

def derivative (f : ℝ → ℝ) : ℝ := 0

structure KolmogorovBackwardEquation (S : StateSpace) [Fintype S.carrier]
    (M : FiniteStateContinuousTimeMarkovProcess S) where
  transitionMatrix : ℝ → Matrix (Fin (Fintype.card S.carrier)) (Fin (Fintype.card S.carrier)) ℝ
  differentialEquation : ∀ t : ℝ, derivative (transitionMatrix t) = M.generatorMatrix * transitionMatrix t
  initialCondition : transitionMatrix 0 = 1

theorem forward_and_backward_agree (S : StateSpace) [Fintype S.carrier]
    (M : FiniteStateContinuousTimeMarkovProcess S) (F : KolmogorovForwardEquation S M) (B : KolmogorovBackwardEquation S M) :
  ∀ t : ℝ, F.transitionMatrix t = B.transitionMatrix t := by
  intro t
  sorry

end ContinuousTimeMarkovProcessesDiscrete
end HautevilleHouse
