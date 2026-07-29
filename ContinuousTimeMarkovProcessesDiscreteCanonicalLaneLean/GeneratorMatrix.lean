import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteCanonicalLaneLean

/-!
# Generator Matrix Package

Defines the infinitesimal generator matrix (Q-matrix) for a continuous-time
Markov chain on a discrete state space. The generator encodes instantaneous
transition rates and satisfies the conservation property.
-/

structure GeneratorMatrix (S : Type u) [Fintype S] where
  q : S → S → ℝ
  offDiagonalNonneg : ∀ s t : S, s ≠ t → q s t ≥ 0
  rowSumZero : ∀ s : S, ∑ t : S, q s t = 0
  finite : ∀ s : S, ∑ t : S, q s t ≠ ∞

structure GeneratorMatrixEvidence (S : Type u) [Fintype S] (Q : GeneratorMatrix S) where
  offDiagonalNonnegClosed : Q.offDiagonalNonneg
  rowSumZeroClosed : Q.rowSumZero
  finiteClosed : Q.finite

def GeneratorMatrixClosed (S : Type u) [Fintype S] (Q : GeneratorMatrix S) : Prop :=
  Q.offDiagonalNonneg ∧ Q.rowSumZero ∧ Q.finite

theorem generator_matrix_closed_from_evidence (S : Type u) [Fintype S] (Q : GeneratorMatrix S) (E : GeneratorMatrixEvidence S Q) : GeneratorMatrixClosed S Q := by
  exact And.intro E.offDiagonalNonnegClosed (And.intro E.rowSumZeroClosed E.finiteClosed)

end ContinuousTimeMarkovProcessesDiscreteCanonicalLaneLean
end HautevilleHouse
