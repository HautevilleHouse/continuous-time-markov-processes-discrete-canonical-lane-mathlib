import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteCanonicalLaneLean

structure DiscreteStateSpace where
  stateType : Type u
  countable : Prop
  countableTerm : countable

structure DiscreteStateSpaceEvidence (S : DiscreteStateSpace) where
  countableClosed : S.countable

def DiscreteStateSpaceClosed (S : DiscreteStateSpace) : Prop :=
  S.countable

theorem discrete_state_space_closed_from_evidence
    (S : DiscreteStateSpace) (E : DiscreteStateSpaceEvidence S) :
    DiscreteStateSpaceClosed S := by
  exact E.countableClosed

end ContinuousTimeMarkovProcessesDiscreteCanonicalLaneLean
end HautevilleHouse