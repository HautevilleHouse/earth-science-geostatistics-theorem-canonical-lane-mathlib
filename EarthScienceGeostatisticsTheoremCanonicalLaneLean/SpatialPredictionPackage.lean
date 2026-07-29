import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeostatisticsTheoremCanonicalLaneLean

structure SpatialPredictionPackage where
  estimator : Type u
  predictionVariance : Prop
  confidenceInterval : Prop
  crossValidation : Prop

structure SpatialPredictionEvidence (P : SpatialPredictionPackage) where
  predictionVarianceClosed : P.predictionVariance
  confidenceIntervalClosed : P.confidenceInterval
  crossValidationClosed : P.crossValidation

def SpatialPredictionClosed (P : SpatialPredictionPackage) : Prop :=
  P.predictionVariance ∧ P.confidenceInterval ∧ P.crossValidation

theorem spatial_prediction_closed_from_evidence
    (P : SpatialPredictionPackage) (E : SpatialPredictionEvidence P) :
    SpatialPredictionClosed P := by
  exact And.intro E.predictionVarianceClosed
    (And.intro E.confidenceIntervalClosed E.crossValidationClosed)

end EarthScienceGeostatisticsTheoremCanonicalLaneLean
end HautevilleHouse