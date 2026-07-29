import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EarthScienceGeostatisticsTheoremCanonicalLaneLean.SpatialSimulation

namespace HautevilleHouse
namespace EarthScienceGeostatisticsTheoremCanonicalLaneLean

def ConstrainedGeostatisticsClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_geostatistics_endgame (A : AdmissibleClass) :
    ConstrainedGeostatisticsClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end EarthScienceGeostatisticsTheoremCanonicalLaneLean
end HautevilleHouse
