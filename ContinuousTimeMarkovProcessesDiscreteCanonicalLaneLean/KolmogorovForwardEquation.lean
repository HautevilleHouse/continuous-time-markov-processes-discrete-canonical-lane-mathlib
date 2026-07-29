import HautevilleHouse.ContinuousTimeMarkovProcessesDiscreteCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteCanonicalLaneLean

structure RateMatrix (S : Type u) where
  rates : S → S → ℝ
  nonnegative : ∀ i j, i ≠ j → rates i j ≥ 0
  rowSumZero : ∀ i, Σ' j, rates i j = 0

structure KolmogorovForwardPackage (S : Type u) where
  stateSpace : Type u
  rateMatrix : RateMatrix stateSpace
  transitionFamily : ℝ≥0 → stateSpace → stateSpace → ℝ
  forwardEquationHolds : Prop
  differentiability : Prop

structure KolmogorovForwardEvidence {S : Type u} (P : KolmogorovForwardPackage S) where
  forwardEquationHoldsClosed : P.forwardEquationHolds
  differentiabilityClosed : P.differentiability

def KolmogorovForwardClosed {S : Type u} (P : KolmogorovForwardPackage S) : Prop :=
  P.forwardEquationHolds ∧ P.differentiability

theorem kolmogorov_forward_closed_from_evidence {S : Type u} (P : KolmogorovForwardPackage S)
    (E : KolmogorovForwardEvidence P) : KolmogorovForwardClosed P := by
  exact And.intro E.forwardEquationHoldsClosed E.differentiabilityClosed

end ContinuousTimeMarkovProcessesDiscreteCanonicalLaneLean
end HautevilleHouse