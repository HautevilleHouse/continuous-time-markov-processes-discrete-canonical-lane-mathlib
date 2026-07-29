import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ContinuousTimeMarkovProcessesDiscreteCanonicalLaneLean.ContinuousTimeMarkovDefinitions

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteCanonicalLaneLean

structure ErgodicityPackage (P : MarkovProcessParameters) where
  irreducible : Prop
  positiveRecurrent : Prop
  stationaryDistributionExistence : Prop
  convergenceToStationarity : Prop
  spectralGap : ℝ
  exponentialConvergenceRate : Prop

structure ErgodicityEvidence {P : MarkovProcessParameters} (E : ErgodicityPackage P) where
  irreducibleClosed : E.irreducible
  positiveRecurrentClosed : E.positiveRecurrent
  stationaryDistributionExistenceClosed : E.stationaryDistributionExistence
  convergenceToStationarityClosed : E.convergenceToStationarity
  exponentialConvergenceRateClosed : E.exponentialConvergenceRate

def ErgodicityClosed {P : MarkovProcessParameters} (E : ErgodicityPackage P) : Prop :=
  E.irreducible ∧ E.positiveRecurrent ∧ E.stationaryDistributionExistence ∧
  E.convergenceToStationarity ∧ E.exponentialConvergenceRate

theorem ergodicity_closed_from_evidence {P : MarkovProcessParameters} (E : ErgodicityPackage P) (Ev : ErgodicityEvidence E) :
  ErgodicityClosed E := by
  exact And.intro Ev.irreducibleClosed
    (And.intro Ev.positiveRecurrentClosed
      (And.intro Ev.stationaryDistributionExistenceClosed
        (And.intro Ev.convergenceToStationarityClosed Ev.exponentialConvergenceRateClosed)))

end ContinuousTimeMarkovProcessesDiscreteCanonicalLaneLean
end HautevilleHouse