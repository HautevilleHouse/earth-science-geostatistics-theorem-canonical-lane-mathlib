import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeostatisticsTheoremCanonicalLaneLean

structure KrigingSystemPackage where
  krigingType : Type u
  weightOptimization : Prop
  unbiasednessConstraint : Prop
  mseMinimization : Prop

structure KrigingSystemEvidence (K : KrigingSystemPackage) where
  weightOptimizationClosed : K.weightOptimization
  unbiasednessConstraintClosed : K.unbiasednessConstraint
  mseMinimizationClosed : K.mseMinimization

def KrigingSystemClosed (K : KrigingSystemPackage) : Prop :=
  K.weightOptimization ∧ K.unbiasednessConstraint ∧ K.mseMinimization

theorem kriging_system_closed_from_evidence
    (K : KrigingSystemPackage) (E : KrigingSystemEvidence K) :
    KrigingSystemClosed K := by
  exact And.intro E.weightOptimizationClosed
    (And.intro E.unbiasednessConstraintClosed E.mseMinimizationClosed)

end EarthScienceGeostatisticsTheoremCanonicalLaneLean
end HautevilleHouse