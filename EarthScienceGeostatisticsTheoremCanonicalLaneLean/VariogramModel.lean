import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeostatisticsTheoremCanonicalLaneLean

structure VariogramModelPackage where
  nugget : ℝ
  sill : ℝ
  range : ℝ
  modelType : String
  isotropy : Prop
  stationarity : Prop

structure VariogramModelEvidence (V : VariogramModelPackage) where
  nuggetNonnegative : V.nugget ≥ 0
  sillPositive : V.sill > 0
  rangePositive : V.range > 0
  modelTypeValid : V.modelType ∈ ["spherical", "exponential", "gaussian", "power"]
  isotropyClosed : V.isotropy
  stationarityClosed : V.stationarity

def VariogramModelClosed (V : VariogramModelPackage) : Prop :=
  V.nugget ≥ 0 ∧ V.sill > 0 ∧ V.range > 0 ∧
  V.modelType ∈ ({"spherical", "exponential", "gaussian", "power"} : Set String) ∧
  V.isotropy ∧ V.stationarity

theorem variogram_model_closed_from_evidence (V : VariogramModelPackage)
    (E : VariogramModelEvidence V) : VariogramModelClosed V := by
  refine And.intro E.nuggetNonnegative (And.intro E.sillPositive (And.intro E.rangePositive
    (And.intro E.modelTypeValid (And.intro E.isotropyClosed E.stationarityClosed))))

end EarthScienceGeostatisticsTheoremCanonicalLaneLean
end HautevilleHouse