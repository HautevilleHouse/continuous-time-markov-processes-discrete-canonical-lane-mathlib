import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ContinuousTimeMarkovProcessesDiscreteCanonicalLaneLean.StateSpaceDiscrete

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteCanonicalLaneLean

structure TransitionSemigroupPackage {S : DiscreteStateSpace} where
  semigroup : Type u
  compositionLaw : Prop
  identityElement : Prop
  continuityInTime : Prop

structure TransitionSemigroupEvidence {S : DiscreteStateSpace}
    (T : TransitionSemigroupPackage S) where
  compositionLawClosed : T.compositionLaw
  identityElementClosed : T.identityElement
  continuityInTimeClosed : T.continuityInTime

def TransitionSemigroupClosed {S : DiscreteStateSpace}
    (T : TransitionSemigroupPackage S) : Prop :=
  T.compositionLaw ∧ T.identityElement ∧ T.continuityInTime

theorem transition_semigroup_closed_from_evidence
    {S : DiscreteStateSpace} (T : TransitionSemigroupPackage S)
    (E : TransitionSemigroupEvidence T) : TransitionSemigroupClosed T := by
  exact And.intro E.compositionLawClosed
    (And.intro E.identityElementClosed E.continuityInTimeClosed)

end ContinuousTimeMarkovProcessesDiscreteCanonicalLaneLean
end HautevilleHouse