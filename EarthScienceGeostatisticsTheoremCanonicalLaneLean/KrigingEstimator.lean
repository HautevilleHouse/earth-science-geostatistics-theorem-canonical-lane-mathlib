import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EarthScienceGeostatisticsTheoremCanonicalLaneLean.VariogramModel

namespace HautevilleHouse
namespace EarthScienceGeostatisticsTheoremCanonicalLaneLean

structure KrigingEstimatorPackage (V : VariogramModelPackage) where
  dataLocations : List ℝ
  dataValues : List ℝ
  krigingType : String  -- "simple", "ordinary", "universal"
  weights : List ℝ → List ℝ
  unbiasedness : Prop
  minimumVariance : Prop

structure KrigingEstimatorEvidence {V : VariogramModelPackage}
    (K : KrigingEstimatorPackage V) where
  dataLengthMatch : K.dataLocations.length = K.dataValues.length
  krigingTypeValid : K.krigingType ∈ ["simple", "ordinary", "universal"]
  weightsSumToUnbiased : Prop  -- placeholder for actual condition
  varianceMinimized : Prop

def KrigingEstimatorClosed {V : VariogramModelPackage}
    (K : KrigingEstimatorPackage V) : Prop :=
  K.dataLocations.length = K.dataValues.length ∧
  K.krigingType ∈ ({"simple", "ordinary", "universal"} : Set String) ∧
  K.unbiasedness ∧ K.minimumVariance

theorem kriging_estimator_closed_from_evidence {V : VariogramModelPackage}
    (K : KrigingEstimatorPackage V) (E : KrigingEstimatorEvidence K) :
    KrigingEstimatorClosed K := by
  refine And.intro E.dataLengthMatch (And.intro E.krigingTypeValid
    (And.intro E.weightsSumToUnbiased E.varianceMinimized))

end EarthScienceGeostatisticsTheoremCanonicalLaneLean
end HautevilleHouse