import HautevilleHouse.ContinuousTimeMarkovProcessesDiscreteCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  MarkovWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end ContinuousTimeMarkovProcessesDiscreteCanonicalLaneLean
end HautevilleHouse