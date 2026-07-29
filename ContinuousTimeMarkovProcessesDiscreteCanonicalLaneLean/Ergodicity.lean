import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ContinuousTimeMarkovProcessesDiscrete.MarkovProcessDefinitions
import HautevilleHouse.ContinuousTimeMarkovProcessesDiscrete.StationaryDistribution

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscrete

structure ErgodicTheorem (S : StateSpace) [Fintype S.carrier]
    (M : FiniteStateContinuousTimeMarkovProcess S) (π : StationaryDistribution S M) where
  convergenceInTotalVariation : ∀ s : S.carrier, ∀ t : ℝ,
    ‖(M.transitionKernel t s ·) - (π.distribution ·)‖_TV → 0 as t → ∞
  rateOfConvergence : Prop

structure LawOfLargeNumbers (S : StateSpace) [Fintype S.carrier]
    (M : FiniteStateContinuousTimeMarkovProcess S) (π : StationaryDistribution S M) where
  samplePathAverage : (Ω : Type) [ProbabilitySpace Ω] → (X : Ω → ℝ → S.carrier) → Prop
  limitIsExpectationUnderStationary : Prop

end ContinuousTimeMarkovProcessesDiscrete
end HautevilleHouse
