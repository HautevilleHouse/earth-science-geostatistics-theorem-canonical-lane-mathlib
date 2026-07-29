import EarthScienceGeostatisticsTheoremCanonicalLaneLean.KrigingEstimator

namespace HautevilleHouse
namespace EarthScienceGeostatisticsTheoremCanonicalLaneLean

structure SpatialContinuityPackage {V : VariogramModel} {K : KrigingEstimator V} where
  stationarityAssumption : Prop
  isotropyAssumption : Prop
  continuityMeasure : ℝ
  stationarityTerm : stationarityAssumption
  isotropyTerm : isotropyAssumption
  continuityMeasureTerm : continuityMeasure > 0

def SpatialContinuityClosed {V : VariogramModel} {K : KrigingEstimator V} (S : SpatialContinuityPackage V K) : Prop :=
  S.stationarityAssumption ∧ S.isotropyAssumption ∧ S.continuityMeasure > 0

theorem spatial_continuity_closed {V : VariogramModel} {K : KrigingEstimator V} (S : SpatialContinuityPackage V K)
    : SpatialContinuityClosed S := by
  exact And.intro S.stationarityTerm (And.intro S.isotropyTerm S.continuityMeasureTerm)

end EarthScienceGeostatisticsTheoremCanonicalLaneLean
end HautevilleHouse