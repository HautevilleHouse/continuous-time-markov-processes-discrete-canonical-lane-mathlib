import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ContinuousTimeMarkovProcessesDiscreteCanonicalLaneLean.FirstStepAnalysis

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteCanonicalLaneLean

structure InfinitesimalGeneratorPackage {P : FirstStepAnalysisPackage} (F : FirstStepAnalysisEvidence P) where
  generatorMatrix : P.stateSpace → P.stateSpace → ℝ
  generatorAction : (P.stateSpace → ℝ) → (P.stateSpace → ℝ)
  forwardEquation : Prop
  backwardEquation : Prop

structure InfinitesimalGeneratorEvidence {P : FirstStepAnalysisPackage} {F : FirstStepAnalysisEvidence P}
    (G : InfinitesimalGeneratorPackage F) where
  forwardEquationClosed : G.forwardEquation
  backwardEquationClosed : G.backwardEquation

def InfinitesimalGeneratorClosed {P : FirstStepAnalysisPackage} {F : FirstStepAnalysisEvidence P}
    (G : InfinitesimalGeneratorPackage F) : Prop :=
  G.forwardEquation ∧ G.backwardEquation

theorem infinitesimal_generator_closed_from_evidence {P : FirstStepAnalysisPackage} {F : FirstStepAnalysisEvidence P}
    (G : InfinitesimalGeneratorPackage F) (E : InfinitesimalGeneratorEvidence G) : InfinitesimalGeneratorClosed G := by
  exact And.intro E.forwardEquationClosed E.backwardEquationClosed

end ContinuousTimeMarkovProcessesDiscreteCanonicalLaneLean
end HautevilleHouse