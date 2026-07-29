import EarthScienceGeostatisticsTheoremCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace EarthScienceGeostatisticsTheoremCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure SpatialDomain where
  carrier : Type
  topology : TopologicalSpace carrier
  metric : carrier → carrier → ℝ

structure GeostatisticsAdmittedObject where
  domain : SpatialDomain
  variogramDefined : Prop
  stationarySecondOrder : Prop
  intrinsicHypothesis : Prop
  krigingSystemSolvable : Prop
  validatorModel : Type
  validationTopology : TopologicalSpace validatorModel
  validationValid : Prop
  conclusion : validationValid

structure GeostatisticsEndgameState where
  object : GeostatisticsAdmittedObject

def GeostatisticsWitnessClosed (O : GeostatisticsAdmittedObject) : Prop :=
  O.validationValid

end EarthScienceGeostatisticsTheoremCanonicalLaneLean
end HautevilleHouse