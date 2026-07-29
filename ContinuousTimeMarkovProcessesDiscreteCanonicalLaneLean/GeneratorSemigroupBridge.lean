import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ContinuousTimeMarkovProcessesDiscreteCanonicalLaneLean.ContinuousTimeMarkovDefinitions

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteCanonicalLaneLean

structure GeneratorSemigroupPackage (P : MarkovProcessParameters) where
  generator : P.stateSpace → P.stateSpace → ℝ
  generatorFromRateMatrix : generator = P.rateMatrix
  fellerProperty : Prop
  coreDomain : Set (P.stateSpace → ℝ)
  coreDomainClosed : coreDomain = {f | ∀ i, ∑' j, generator i j * f j exists}
  resolventDefined : Prop
  resolventFamily : ℝ → (P.stateSpace → ℝ) → (P.stateSpace → ℝ)
  resolventEquation : ∀ λ f i, resolventFamily λ f i = (λ - generator)⁻¹ f i

structure GeneratorSemigroupEvidence {P : MarkovProcessParameters} (G : GeneratorSemigroupPackage P) where
  fellerPropertyClosed : G.fellerProperty
  resolventDefinedClosed : G.resolventDefined

def GeneratorSemigroupClosed {P : MarkovProcessParameters} (G : GeneratorSemigroupPackage P) : Prop :=
  G.fellerProperty ∧ G.resolventDefined

theorem generator_semigroup_closed_from_evidence {P : MarkovProcessParameters} (G : GeneratorSemigroupPackage P) (E : GeneratorSemigroupEvidence G) :
  GeneratorSemigroupClosed G := by
  exact And.intro E.fellerPropertyClosed E.resolventDefinedClosed

end ContinuousTimeMarkovProcessesDiscreteCanonicalLaneLean
end HautevilleHouse