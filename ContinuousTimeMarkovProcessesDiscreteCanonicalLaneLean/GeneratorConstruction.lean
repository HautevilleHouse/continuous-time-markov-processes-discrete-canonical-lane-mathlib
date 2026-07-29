import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ContinuousTimeMarkovProcessesDiscreteCanonicalLaneLean.TransitionSemigroup

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteCanonicalLaneLean

structure GeneratorPackage {S : DiscreteStateSpace}
    (T : TransitionSemigroupPackage S) where
  generator : Type u
  domain : Prop
  actionOnFunctions : Prop
  hilleYosidaConditions : Prop

structure GeneratorEvidence {S : DiscreteStateSpace}
    {T : TransitionSemigroupPackage S} (G : GeneratorPackage S T) where
  domainClosed : G.domain
  actionOnFunctionsClosed : G.actionOnFunctions
  hilleYosidaConditionsClosed : G.hilleYosidaConditions

def GeneratorClosed {S : DiscreteStateSpace}
    {T : TransitionSemigroupPackage S} (G : GeneratorPackage S T) : Prop :=
  G.domain ∧ G.actionOnFunctions ∧ G.hilleYosidaConditions

theorem generator_closed_from_evidence
    {S : DiscreteStateSpace} {T : TransitionSemigroupPackage S}
    (G : GeneratorPackage S T) (E : GeneratorEvidence G) : GeneratorClosed G := by
  exact And.intro E.domainClosed
    (And.intro E.actionOnFunctionsClosed E.hilleYosidaConditionsClosed)

end ContinuousTimeMarkovProcessesDiscreteCanonicalLaneLean
end HautevilleHouse