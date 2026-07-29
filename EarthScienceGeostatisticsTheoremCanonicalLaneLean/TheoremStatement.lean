import HautevilleHouse.EarthScienceGeostatisticsTheoremCanonicalLaneLean.ReviewerBridge

namespace HautevilleHouse
namespace EarthScienceGeostatisticsTheoremCanonicalLaneLean

structure GeostatisticsSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure GeostatisticsAdmittedObject where
  space : GeostatisticsSpace
  spatialContinuity : Prop
  stationarySecondOrder : Prop
  krigingOptimal : Prop
  conclusion : krigingOptimal

def GeostatisticsWitnessClosed (O : GeostatisticsAdmittedObject) : Prop :=
  O.krigingOptimal

end EarthScienceGeostatisticsTheoremCanonicalLaneLean
end HautevilleHouse