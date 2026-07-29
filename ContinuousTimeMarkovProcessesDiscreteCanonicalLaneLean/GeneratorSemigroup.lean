import HautevilleHouse.ContinuousTimeMarkovProcessesDiscreteCanonicalLaneLean.EmbeddingChain

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteCanonicalLaneLean

structure GeneratorSemigroupPackage {S : Type u} {P : KolmogorovForwardPackage S}
    (C : EmbeddingChainPackage P) where
  infinitesimalGenerator : (S → ℝ) → (S → ℝ)
  semigroup : ℝ≥0 → (S → ℝ) → (S → ℝ)
  generatorEquation : Prop
  semigroupProperty : Prop

structure GeneratorSemigroupEvidence {S : Type u} {P : KolmogorovForwardPackage S}
    {C : EmbeddingChainPackage P} (G : GeneratorSemigroupPackage C) where
  generatorEquationClosed : G.generatorEquation
  semigroupPropertyClosed : G.semigroupProperty

def GeneratorSemigroupClosed {S : Type u} {P : KolmogorovForwardPackage S}
    {C : EmbeddingChainPackage P} (G : GeneratorSemigroupPackage C) : Prop :=
  G.generatorEquation ∧ G.semigroupProperty

theorem generator_semigroup_closed_from_evidence {S : Type u} {P : KolmogorovForwardPackage S}
    {C : EmbeddingChainPackage P} (G : GeneratorSemigroupPackage C)
    (E : GeneratorSemigroupEvidence G) : GeneratorSemigroupClosed G := by
  exact And.intro E.generatorEquationClosed E.semigroupPropertyClosed

end ContinuousTimeMarkovProcessesDiscreteCanonicalLaneLean
end HautevilleHouse