import EarthScienceGeostatisticsTheoremCanonicalLaneLean.SpatialContinuity

namespace HautevilleHouse
namespace EarthScienceGeostatisticsTheoremCanonicalLaneLean

structure UncertaintyQuantificationPackage {V : VariogramModel} {K : KrigingEstimator V}
    {S : SpatialContinuityPackage V K} where
  confidenceInterval : ℝ × ℝ
  estimationVariance : ℝ
  quantileValid : Prop
  confidenceIntervalTerm : confidenceInterval.1 ≤ confidenceInterval.2
  estimationVarianceTerm : estimationVariance ≥ 0
  quantileValidTerm : quantileValid

def UncertaintyQuantificationClosed {V : VariogramModel} {K : KrigingEstimator V}
    {S : SpatialContinuityPackage V K} (U : UncertaintyQuantificationPackage V K S) : Prop :=
  U.confidenceInterval.1 ≤ U.confidenceInterval.2 ∧ U.estimationVariance ≥ 0 ∧ U.quantileValid

theorem uncertainty_quantification_closed {V : VariogramModel} {K : KrigingEstimator V}
    {S : SpatialContinuityPackage V K} (U : UncertaintyQuantificationPackage V K S)
    : UncertaintyQuantificationClosed U := by
  exact And.intro U.confidenceIntervalTerm (And.intro U.estimationVarianceTerm U.quantileValidTerm)

end EarthScienceGeostatisticsTheoremCanonicalLaneLean
end HautevilleHouse