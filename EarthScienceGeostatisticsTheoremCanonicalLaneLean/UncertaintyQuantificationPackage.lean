import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeostatisticsTheoremCanonicalLaneLean

structure UncertaintyQuantificationPackage where
  stochasticSimulation : Type u
  conditionalRealization : Prop
  localUncertainty : Prop
  spatialUncertainty : Prop

structure UncertaintyQuantificationEvidence (U : UncertaintyQuantificationPackage) where
  conditionalRealizationClosed : U.conditionalRealization
  localUncertaintyClosed : U.localUncertainty
  spatialUncertaintyClosed : U.spatialUncertainty

def UncertaintyQuantificationClosed (U : UncertaintyQuantificationPackage) : Prop :=
  U.conditionalRealization ∧ U.localUncertainty ∧ U.spatialUncertainty

theorem uncertainty_quantification_closed_from_evidence
    (U : UncertaintyQuantificationPackage) (E : UncertaintyQuantificationEvidence U) :
    UncertaintyQuantificationClosed U := by
  exact And.intro E.conditionalRealizationClosed
    (And.intro E.localUncertaintyClosed E.spatialUncertaintyClosed)

end EarthScienceGeostatisticsTheoremCanonicalLaneLean
end HautevilleHouse