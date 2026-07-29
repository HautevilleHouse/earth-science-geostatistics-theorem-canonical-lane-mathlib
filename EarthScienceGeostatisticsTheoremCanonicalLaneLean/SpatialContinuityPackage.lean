import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeostatisticsTheoremCanonicalLaneLean

structure SpatialContinuityPackage where
  semivariogramModel : Type u
  covarianceFunction : Type v
  rangeParameter : Prop
  sillParameter : Prop
  nuggetEffect : Prop

structure SpatialContinuityEvidence (S : SpatialContinuityPackage) where
  rangeParameterClosed : S.rangeParameter
  sillParameterClosed : S.sillParameter
  nuggetEffectClosed : S.nuggetEffect

def SpatialContinuityClosed (S : SpatialContinuityPackage) : Prop :=
  S.rangeParameter ∧ S.sillParameter ∧ S.nuggetEffect

theorem spatial_continuity_closed_from_evidence
    (S : SpatialContinuityPackage) (E : SpatialContinuityEvidence S) :
    SpatialContinuityClosed S := by
  exact And.intro E.rangeParameterClosed
    (And.intro E.sillParameterClosed E.nuggetEffectClosed)

end EarthScienceGeostatisticsTheoremCanonicalLaneLean
end HautevilleHouse