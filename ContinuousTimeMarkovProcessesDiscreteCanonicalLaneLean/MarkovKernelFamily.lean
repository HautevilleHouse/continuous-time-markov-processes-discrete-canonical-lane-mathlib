import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteCanonicalLaneLean

/-!
# Markov Kernel Family Package

Defines the family of transition kernels for a continuous-time Markov process
with a discrete state space. The kernel family captures the measurable-time
evolution of probabilities and forms the foundational analytic object.
-/

structure MarkovKernelFamily (S : Type u) [Fintype S] where
  timeDomain : ℝ
  kernel : ℝ → S → S → ℝ
  nonnegativity : ∀ t s t' : S, kernel t s t' ≥ 0
  rowSumOne : ∀ t s, ∑ t' : S, kernel t s t' = 1
  chapmanKolmogorov : ∀ t u s t', kernel (t + u) s t' = ∑ s' : S, kernel t s s' * kernel u s' t'
  continuityAtZero : ∀ s t', Filter.Tendsto (fun t : ℝ => kernel t s t') (nhds 0) (nhds (if s = t' then 1 else 0))

structure MarkovKernelFamilyEvidence (S : Type u) [Fintype S] (K : MarkovKernelFamily S) where
  nonnegativityClosed : K.nonnegativity
  rowSumOneClosed : K.rowSumOne
  chapmanKolmogorovClosed : K.chapmanKolmogorov
  continuityAtZeroClosed : K.continuityAtZero

def MarkovKernelFamilyClosed (S : Type u) [Fintype S] (K : MarkovKernelFamily S) : Prop :=
  K.nonnegativity ∧ K.rowSumOne ∧ K.chapmanKolmogorov ∧ K.continuityAtZero

theorem markov_kernel_family_closed_from_evidence (S : Type u) [Fintype S] (K : MarkovKernelFamily S) (E : MarkovKernelFamilyEvidence S K) : MarkovKernelFamilyClosed S K := by
  exact And.intro E.nonnegativityClosed (And.intro E.rowSumOneClosed (And.intro E.chapmanKolmogorovClosed E.continuityAtZeroClosed))

end ContinuousTimeMarkovProcessesDiscreteCanonicalLaneLean
end HautevilleHouse
