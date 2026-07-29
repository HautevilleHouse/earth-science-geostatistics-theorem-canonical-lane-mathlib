import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeostatisticsTheoremCanonicalLaneLean

structure VariogramModelingPackage where
  spatialDomain : Type u
  dataPoints : List spatialDomain
  variogram : spatialDomain -> spatialDomain -> Float
  covarianceFunction : spatialDomain -> spatialDomain -> Float
  stationarityAssumption : Prop
  isotropyAssumption : Prop
  variogramParameters : Type v
  parameterEstimation : Prop
  validVariogram : Prop

structure VariogramModelingEvidence (V : VariogramModelingPackage) where
  stationarityAssumptionClosed : V.stationarityAssumption
  isotropyAssumptionClosed : V.isotropyAssumption
  parameterEstimationClosed : V.parameterEstimation
  validVariogramClosed : V.validVariogram

def VariogramModelingClosed (V : VariogramModelingPackage) : Prop :=
  V.stationarityAssumption ∧ V.isotropyAssumption ∧
  V.parameterEstimation ∧ V.validVariogram

theorem variogram_modeling_closed_from_evidence (V : VariogramModelingPackage)
    (E : VariogramModelingEvidence V) : VariogramModelingClosed V := by
  exact And.intro E.stationarityAssumptionClosed
    (And.intro E.isotropyAssumptionClosed
      (And.intro E.parameterEstimationClosed E.validVariogramClosed))

end EarthScienceGeostatisticsTheoremCanonicalLaneLean
end HautevilleHouse
