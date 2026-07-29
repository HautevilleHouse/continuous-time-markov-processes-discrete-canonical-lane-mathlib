import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ContinuousTimeMarkovProcessesDiscreteCanonicalLaneLean.ContinuousTimeMarkovDefinitions

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteCanonicalLaneLean

structure StationaryDistributionPackage (P : MarkovProcessParameters) where
  stationaryDistribution : P.stateSpace → ℝ
  nonnegative : ∀ i, stationaryDistribution i ≥ 0
  sumOne : ∑' i, stationaryDistribution i = 1
  balanceEquations : ∀ j, ∑' i, stationaryDistribution i * P.rateMatrix i j = 0
  existenceFromIrreducibility : P.irreducible → Nonempty (StationaryDistributionPackage P)
  uniquenessFromIrreducibility : P.irreducible → ∀ π1 π2 : StationaryDistributionPackage P, π1 = π2

structure StationaryDistributionEvidence {P : MarkovProcessParameters} (S : StationaryDistributionPackage P) where
  nonnegativeClosed : S.nonnegative
  sumOneClosed : S.sumOne
  balanceEquationsClosed : S.balanceEquations

def StationaryDistributionClosed {P : MarkovProcessParameters} (S : StationaryDistributionPackage P) : Prop :=
  S.nonnegative ∧ S.sumOne ∧ S.balanceEquations

theorem stationary_distribution_closed_from_evidence {P : MarkovProcessParameters} (S : StationaryDistributionPackage P) (E : StationaryDistributionEvidence S) :
  StationaryDistributionClosed S := by
  exact And.intro E.nonnegativeClosed (And.intro E.sumOneClosed E.balanceEquationsClosed)

end ContinuousTimeMarkovProcessesDiscreteCanonicalLaneLean
end HautevilleHouse