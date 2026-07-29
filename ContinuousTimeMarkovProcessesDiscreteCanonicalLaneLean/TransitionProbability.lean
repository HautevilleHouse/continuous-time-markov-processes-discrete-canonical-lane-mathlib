import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ContinuousTimeMarkovProcessesDiscreteCanonicalLaneLean.EmbeddingChain

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteCanonicalLaneLean

structure TransitionProbabilityPackage {P : FirstStepAnalysisPackage} {F : FirstStepAnalysisEvidence P}
    {G : InfinitesimalGeneratorPackage F} {E : InfinitesimalGeneratorEvidence G}
    {C : EmbeddingChainPackage E} (Ev : EmbeddingChainEvidence C) where
  semigroup : ℕ → Type u
  chapmanKolmogorov : Prop
  transitionMatrix : P.stateSpace → P.stateSpace → ℝ → ℝ
  kolmogorovForward : Prop
  kolmogorovBackward : Prop

structure TransitionProbabilityEvidence {P : FirstStepAnalysisPackage} {F : FirstStepAnalysisEvidence P}
    {G : InfinitesimalGeneratorPackage F} {E : InfinitesimalGeneratorEvidence G}
    {C : EmbeddingChainPackage E} {Ev : EmbeddingChainEvidence C}
    (T : TransitionProbabilityPackage Ev) where
  chapmanKolmogorovClosed : T.chapmanKolmogorov
  kolmogorovForwardClosed : T.kolmogorovForward
  kolmogorovBackwardClosed : T.kolmogorovBackward

def TransitionProbabilityClosed {P : FirstStepAnalysisPackage} {F : FirstStepAnalysisEvidence P}
    {G : InfinitesimalGeneratorPackage F} {E : InfinitesimalGeneratorEvidence G}
    {C : EmbeddingChainPackage E} {Ev : EmbeddingChainEvidence C}
    (T : TransitionProbabilityPackage Ev) : Prop :=
  T.chapmanKolmogorov ∧ T.kolmogorovForward ∧ T.kolmogorovBackward

theorem transition_probability_closed_from_evidence {P : FirstStepAnalysisPackage} {F : FirstStepAnalysisEvidence P}
    {G : InfinitesimalGeneratorPackage F} {E : InfinitesimalGeneratorEvidence G}
    {C : EmbeddingChainPackage E} {Ev : EmbeddingChainEvidence C}
    (T : TransitionProbabilityPackage Ev) (TE : TransitionProbabilityEvidence T) : TransitionProbabilityClosed T := by
  exact And.intro TE.chapmanKolmogorovClosed
    (And.intro TE.kolmogorovForwardClosed TE.kolmogorovBackwardClosed)

end ContinuousTimeMarkovProcessesDiscreteCanonicalLaneLean
end HautevilleHouse