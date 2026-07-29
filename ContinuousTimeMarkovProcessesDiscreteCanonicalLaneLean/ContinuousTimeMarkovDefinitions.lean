import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteCanonicalLaneLean

structure MarkovProcessParameters where
  stateSpace : Type u
  rateMatrix : stateSpace → stateSpace → ℝ
  rateMatrixNonnegative : ∀ i j, i ≠ j → rateMatrix i j ≥ 0
  rateMatrixRowSumZero : ∀ i, ∑' j, rateMatrix i j = 0

structure TransitionProbabilityFamily (P : MarkovProcessParameters) where
  transitionProb : ℝ → P.stateSpace → P.stateSpace → ℝ
  semigroupProperty : ∀ t s i j, transitionProb (t + s) i j = ∑' k, transitionProb t i k * transitionProb s k j
  kolmogorovBackward : ∀ t i j, (∂/∂t) transitionProb t i j = ∑' k, P.rateMatrix i k * transitionProb t k j
  kolmogorovForward : ∀ t i j, (∂/∂t) transitionProb t i j = ∑' k, transitionProb t i k * P.rateMatrix k j

end ContinuousTimeMarkovProcessesDiscreteCanonicalLaneLean
end HautevilleHouse