import EarthScienceGeostatisticsTheoremCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace EarthScienceGeostatisticsTheoremCanonicalLaneLean

structure AdmissibleClass where
  object : GeostatisticsAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  GeostatisticsWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end EarthScienceGeostatisticsTheoremCanonicalLaneLean
end HautevilleHouse