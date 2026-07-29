import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EarthScienceGeostatisticsTheoremCanonicalLaneLean.VariogramModeling

namespace HautevilleHouse
namespace EarthScienceGeostatisticsTheoremCanonicalLaneLean

structure SpatialSimulationPackage {V : VariogramModelingPackage} where
  simulationMethod : String
  numRealizations : Nat
  realizations : List (V.spatialDomain -> Float)
  conditionalDistribution : Prop
  reproductionOfVariogram : Prop
  uncertaintyQuantification : Prop

structure SpatialSimulationEvidence {V : VariogramModelingPackage}
    (S : SpatialSimulationPackage V) where
  conditionalDistributionClosed : S.conditionalDistribution
  reproductionOfVariogramClosed : S.reproductionOfVariogram
  uncertaintyQuantificationClosed : S.uncertaintyQuantification

def SpatialSimulationClosed {V : VariogramModelingPackage}
    (S : SpatialSimulationPackage V) : Prop :=
  S.conditionalDistribution ∧ S.reproductionOfVariogram ∧ S.uncertaintyQuantification

theorem spatial_simulation_closed_from_evidence {V : VariogramModelingPackage}
    (S : SpatialSimulationPackage V) (E : SpatialSimulationEvidence S) :
    SpatialSimulationClosed S := by
  exact And.intro E.conditionalDistributionClosed
    (And.intro E.reproductionOfVariogramClosed E.uncertaintyQuantificationClosed)

end EarthScienceGeostatisticsTheoremCanonicalLaneLean
end HautevilleHouse
