import EarthScienceGeostatisticsTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeostatisticsTheoremCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

def geostatisticsProjection : Projection GeostatisticsEndgameState := {
  toFun := fun x => x,
  idempotent := by intro x; rfl
}

theorem geostatistics_projection_idempotent (x : GeostatisticsEndgameState) :
    geostatisticsProjection.toFun (geostatisticsProjection.toFun x) = geostatisticsProjection.toFun x := by
  exact geostatisticsProjection.idempotent x

end EarthScienceGeostatisticsTheoremCanonicalLaneLean
end HautevilleHouse