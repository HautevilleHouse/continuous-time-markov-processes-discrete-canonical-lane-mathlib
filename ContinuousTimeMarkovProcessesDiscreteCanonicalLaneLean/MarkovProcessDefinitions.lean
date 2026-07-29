import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscrete

structure StateSpace where
  carrier : Type u
  measurable : MeasurableSpace carrier

def discreteTopology {α : Type u} [Fintype α] : TopologicalSpace α :=
  ⊥

structure ContinuousTimeMarkovProcess (S : StateSpace) where
  stateSpace : S
  timeDomain : Type v
  semiringStruct : Semiring timeDomain
  transitionKernel : timeDomain → S.carrier → Set (S.carrier) → ℝ≥0
  transitionLaws : Prop
  markovProperty : Prop
  continuityInTime : Prop

structure FiniteStateContinuousTimeMarkovProcess (S : StateSpace) [Fintype S.carrier] extends ContinuousTimeMarkovProcess S where
  finiteStateCondition : Fintype S.carrier
  generatorMatrix : S.carrier → S.carrier → ℝ
  generatorMatrixLaws : ∀ i j : S.carrier, i ≠ j → generatorMatrix i j ≥ 0 ∧
    generatorMatrix i i = -∑ j ≠ i, generatorMatrix i j

end ContinuousTimeMarkovProcessesDiscrete
end HautevilleHouse
