import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ContinuousTimeMarkovProcessesDiscreteCanonicalLaneLean.ContinuousTimeMarkovDefinitions
import HautevilleHouse.ContinuousTimeMarkovProcessesDiscreteCanonicalLaneLean.GeneratorSemigroupBridge
import HautevilleHouse.ContinuousTimeMarkovProcessesDiscreteCanonicalLaneLean.StationaryDistribution
import HautevilleHouse.ContinuousTimeMarkovProcessesDiscreteCanonicalLaneLean.ErgodicityTheorem

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  ∃ (P : MarkovProcessParameters) (TPF : TransitionProbabilityFamily P),
    A.object = (P, TPF) ∧ True

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded



theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  exact ⟨A.object, A.endpointSatisfied, ?_⟩
  sorry

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A := by
  exact A.gateWitness

def ConstrainedCTMDPClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_ctmdp_endgame (A : AdmissibleClass) :
    ConstrainedCTMDPClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ContinuousTimeMarkovProcessesDiscreteCanonicalLaneLean
end HautevilleHouse