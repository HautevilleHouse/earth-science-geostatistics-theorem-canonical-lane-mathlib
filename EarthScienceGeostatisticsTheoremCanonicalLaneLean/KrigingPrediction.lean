import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EarthScienceGeostatisticsTheoremCanonicalLaneLean.VariogramModeling

namespace HautevilleHouse
namespace EarthScienceGeostatisticsTheoremCanonicalLaneLean

structure KrigingPredictionPackage {V : VariogramModelingPackage} where
  krigingType : String
  predictionLocation : V.spatialDomain
  krigingWeights : V.spatialDomain -> Float
  predictedValue : Float
  krigingVariance : Float
  bestLinearUnbiasedEstimator : Prop
  unbiasednessCondition : Prop
  minimumVarianceCondition : Prop

structure KrigingPredictionEvidence {V : VariogramModelingPackage}
    (K : KrigingPredictionPackage V) where
  bestLinearUnbiasedEstimatorClosed : K.bestLinearUnbiasedEstimator
  unbiasednessConditionClosed : K.unbiasednessCondition
  minimumVarianceConditionClosed : K.minimumVarianceCondition

def KrigingPredictionClosed {V : VariogramModelingPackage}
    (K : KrigingPredictionPackage V) : Prop :=
  K.bestLinearUnbiasedEstimator ∧ K.unbiasednessCondition ∧ K.minimumVarianceCondition

theorem kriging_prediction_closed_from_evidence {V : VariogramModelingPackage}
    (K : KrigingPredictionPackage V) (E : KrigingPredictionEvidence K) :
    KrigingPredictionClosed K := by
  exact And.intro E.bestLinearUnbiasedEstimatorClosed
    (And.intro E.unbiasednessConditionClosed E.minimumVarianceConditionClosed)

end EarthScienceGeostatisticsTheoremCanonicalLaneLean
end HautevilleHouse
