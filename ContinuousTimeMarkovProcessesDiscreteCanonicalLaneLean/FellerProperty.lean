import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ContinuousTimeMarkovProcessesDiscreteCanonicalLaneLean.TransitionSemigroup

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteCanonicalLaneLean

structure FellerPropertyPackage {S : DiscreteStateSpace}
    (T : TransitionSemigroupPackage S) where
  mapsContinuousFunctions : Prop
  strongFeller : Prop
  irreducible : Prop

structure FellerPropertyEvidence {S : DiscreteStateSpace}
    {T : TransitionSemigroupPackage S} (F : FellerPropertyPackage S T) where
  mapsContinuousFunctionsClosed : F.mapsContinuousFunctions
  strongFellerClosed : F.strongFeller
  irreducibleClosed : F.irreducible

def FellerPropertyClosed {S : DiscreteStateSpace}
    {T : TransitionSemigroupPackage S} (F : FellerPropertyPackage S T) : Prop :=
  F.mapsContinuousFunctions ∧ F.strongFeller ∧ F.irreducible

theorem feller_property_closed_from_evidence
    {S : DiscreteStateSpace} {T : TransitionSemigroupPackage S}
    (F : FellerPropertyPackage S T) (E : FellerPropertyEvidence F) : FellerPropertyClosed F := by
  exact And.intro E.mapsContinuousFunctionsClosed
    (And.intro E.strongFellerClosed E.irreducibleClosed)

end ContinuousTimeMarkovProcessesDiscreteCanonicalLaneLean
end HautevilleHouse