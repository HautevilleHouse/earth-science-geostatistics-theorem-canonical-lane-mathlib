import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeostatisticsTheoremCanonicalLaneLean

structure VariogramModelingPackage where
  experimentalVariogram : Type u
  modelFit : Prop
  anisotropyDetection : Prop
  zonalAnisotropy : Prop
  geometricAnisotropy : Prop

structure VariogramModelingEvidence (V : VariogramModelingPackage) where
  modelFitClosed : V.modelFit
  anisotropyDetectionClosed : V.anisotropyDetection
  zonalAnisotropyClosed : V.zonalAnisotropy
  geometricAnisotropyClosed : V.geometricAnisotropy

def VariogramModelingClosed (V : VariogramModelingPackage) : Prop :=
  V.modelFit ∧ V.anisotropyDetection ∧ V.zonalAnisotropy ∧ V.geometricAnisotropy

theorem variogram_modeling_closed_from_evidence
    (V : VariogramModelingPackage) (E : VariogramModelingEvidence V) :
    VariogramModelingClosed V := by
  exact And.intro E.modelFitClosed
    (And.intro E.anisotropyDetectionClosed
      (And.intro E.zonalAnisotropyClosed E.geometricAnisotropyClosed))

end EarthScienceGeostatisticsTheoremCanonicalLaneLean
end HautevilleHouse