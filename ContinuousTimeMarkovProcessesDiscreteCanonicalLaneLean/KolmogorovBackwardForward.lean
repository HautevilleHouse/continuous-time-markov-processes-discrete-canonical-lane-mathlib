import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ContinuousTimeMarkovProcessesDiscreteCanonicalLaneLean.StateSpaceDiscrete

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteCanonicalLaneLean

structure KolmogorovEquationsPackage {S : DiscreteStateSpace} where
  backwardEquation : Prop
  forwardEquation : Prop
  transitionRatesConsistent : Prop

structure KolmogorovEquationsEvidence {S : DiscreteStateSpace}
    (K : KolmogorovEquationsPackage S) where
  backwardEquationClosed : K.backwardEquation
  forwardEquationClosed : K.forwardEquation
  transitionRatesConsistentClosed : K.transitionRatesConsistent

def KolmogorovEquationsClosed {S : DiscreteStateSpace}
    (K : KolmogorovEquationsPackage S) : Prop :=
  K.backwardEquation ∧ K.forwardEquation ∧ K.transitionRatesConsistent

theorem kolmogorov_equations_closed_from_evidence
    {S : DiscreteStateSpace} (K : KolmogorovEquationsPackage S)
    (E : KolmogorovEquationsEvidence K) : KolmogorovEquationsClosed K := by
  exact And.intro E.backwardEquationClosed
    (And.intro E.forwardEquationClosed E.transitionRatesConsistentClosed)

end ContinuousTimeMarkovProcessesDiscreteCanonicalLaneLean
end HautevilleHouse