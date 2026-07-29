import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeostatisticsTheoremCanonicalLaneLean

structure SpatialTrendModelingPackage where
  polynomialTrend : Prop
  movingAverage : Prop
  splineInterpolation : Prop
  residualComputed : Prop

def SpatialTrendModelingClosed (T : SpatialTrendModelingPackage) : Prop :=
  T.polynomialTrend ∧ T.movingAverage ∧ T.splineInterpolation ∧ T.residualComputed

end EarthScienceGeostatisticsTheoremCanonicalLaneLean
end HautevilleHouse