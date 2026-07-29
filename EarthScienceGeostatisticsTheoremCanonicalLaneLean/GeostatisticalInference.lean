import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeostatisticsTheoremCanonicalLaneLean

structure HypothesisTest where
  nullHypothesis : Prop
  testStatistic : ℝ
  criticalRegion : Set ℝ
  significanceLevel : ℝ
  powerFunction : ℝ → ℝ
  testValid : Prop

structure ConfidenceInterval where
  interval : Set ℝ
  confidenceLevel : ℝ
  coverageProperty : Prop

structure GeostatisticalInferencePackage {D : SpatialDomain} {Z : RegionalizedVariable D} {V : VariogramModel D} (Data : GeostatisticalDataPackage D Z V) where
  hypothesisTest : HypothesisTest
  confidenceInterval : ConfidenceInterval
  estimationUncertainty : Prop
  decisionRule : Prop

structure GeostatisticalInferenceEvidence {D : SpatialDomain} {Z : RegionalizedVariable D} {V : VariogramModel D} {Data : GeostatisticalDataPackage D Z V} (I : GeostatisticalInferencePackage Data) where
  testValidClosed : I.hypothesisTest.testValid
  coveragePropertyClosed : I.confidenceInterval.coverageProperty
  estimationUncertaintyClosed : I.estimationUncertainty
  decisionRuleClosed : I.decisionRule

def GeostatisticalInferenceClosed {D : SpatialDomain} {Z : RegionalizedVariable D} {V : VariogramModel D} {Data : GeostatisticalDataPackage D Z V} (I : GeostatisticalInferencePackage Data) : Prop :=
  I.hypothesisTest.testValid ∧ I.confidenceInterval.coverageProperty ∧ I.estimationUncertainty ∧ I.decisionRule

theorem geostatistical_inference_closed_from_evidence {D : SpatialDomain} {Z : RegionalizedVariable D} {V : VariogramModel D} {Data : GeostatisticalDataPackage D Z V} (I : GeostatisticalInferencePackage Data) (E : GeostatisticalInferenceEvidence I) : GeostatisticalInferenceClosed I := by
  exact And.intro E.testValidClosed (And.intro E.coveragePropertyClosed (And.intro E.estimationUncertaintyClosed E.decisionRuleClosed))

end EarthScienceGeostatisticsTheoremCanonicalLaneLean
end HautevilleHouse