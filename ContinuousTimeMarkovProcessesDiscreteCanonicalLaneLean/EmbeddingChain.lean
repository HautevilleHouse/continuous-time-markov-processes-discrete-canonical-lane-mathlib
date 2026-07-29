import HautevilleHouse.ContinuousTimeMarkovProcessesDiscreteCanonicalLaneLean.KolmogorovForwardEquation

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteCanonicalLaneLean

structure EmbeddingChainPackage {S : Type u} (P : KolmogorovForwardPackage S) where
  discreteTimeChain : ℕ → S
  jumpTimes : ℕ → ℝ≥0
  sojournDistribution : ℝ≥0 → ℝ
  embeddingProperty : Prop

structure EmbeddingChainEvidence {S : Type u} {P : KolmogorovForwardPackage S}
    (C : EmbeddingChainPackage P) where
  embeddingPropertyClosed : C.embeddingProperty

def EmbeddingChainClosed {S : Type u} {P : KolmogorovForwardPackage S}
    (C : EmbeddingChainPackage P) : Prop :=
  C.embeddingProperty

theorem embedding_chain_closed_from_evidence {S : Type u} {P : KolmogorovForwardPackage S}
    (C : EmbeddingChainPackage P) (E : EmbeddingChainEvidence C) : EmbeddingChainClosed C :=
  E.embeddingPropertyClosed

end ContinuousTimeMarkovProcessesDiscreteCanonicalLaneLean
end HautevilleHouse