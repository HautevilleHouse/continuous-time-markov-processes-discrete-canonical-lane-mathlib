import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteCanonicalLaneLean

structure FirstStepAnalysisPackage where
  stateSpace : Type u
  transitionRates : stateSpace → stateSpace → ℝ
  rateMatrixSumZero : ∀ i, (∑' j, transitionRates i j) = 0
  nonDiagonalNonnegative : ∀ i j, i ≠ j → transitionRates i j ≥ 0

structure FirstStepAnalysisEvidence (P : FirstStepAnalysisPackage) where
  rateMatrixSumZeroClosed : P.rateMatrixSumZero
  nonDiagonalNonnegativeClosed : P.nonDiagonalNonnegative

def FirstStepAnalysisClosed (P : FirstStepAnalysisPackage) : Prop :=
  P.rateMatrixSumZero ∧ P.nonDiagonalNonnegative

theorem first_step_analysis_closed_from_evidence (P : FirstStepAnalysisPackage)
    (E : FirstStepAnalysisEvidence P) : FirstStepAnalysisClosed P := by
  exact And.intro E.rateMatrixSumZeroClosed E.nonDiagonalNonnegativeClosed

end ContinuousTimeMarkovProcessesDiscreteCanonicalLaneLean
end HautevilleHouse