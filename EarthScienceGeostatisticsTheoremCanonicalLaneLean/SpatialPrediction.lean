import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EarthScienceGeostatisticsTheoremCanonicalLaneLean.KrigingEstimator

namespace HautevilleHouse
namespace EarthScienceGeostatisticsTheoremCanonicalLaneLean

structure SpatialPredictionPackage {V : VariogramModelPackage}
    (K : KrigingEstimatorPackage V) where
  predictionLocation : ℝ
  predictedValue : ℝ
  predictionVariance : ℝ
  confidenceInterval : Prop
  crossValidationMetric : Prop

structure SpatialPredictionEvidence {V : VariogramModelPackage}
    {K : KrigingEstimatorPackage V} (P : SpatialPredictionPackage K) where
  predictedValueComputed : P.predictedValue = 0  -- placeholder for actual computation
  predictionVarianceNonnegative : P.predictionVariance ≥ 0
  confidenceIntervalClosed : P.confidenceInterval
  crossValidationMetricClosed : P.crossValidationMetric

def SpatialPredictionClosed {V : VariogramModelPackage}
    {K : KrigingEstimatorPackage V} (P : SpatialPredictionPackage K) : Prop :=
  P.predictionVariance ≥ 0 ∧ P.confidenceInterval ∧ P.crossValidationMetric

theorem spatial_prediction_closed_from_evidence {V : VariogramModelPackage}
    {K : KrigingEstimatorPackage V} (P : SpatialPredictionPackage K)
    (E : SpatialPredictionEvidence P) : SpatialPredictionClosed P := by
  exact And.intro E.predictionVarianceNonnegative
    (And.intro E.confidenceIntervalClosed E.crossValidationMetricClosed)

end EarthScienceGeostatisticsTheoremCanonicalLaneLean
end HautevilleHouse