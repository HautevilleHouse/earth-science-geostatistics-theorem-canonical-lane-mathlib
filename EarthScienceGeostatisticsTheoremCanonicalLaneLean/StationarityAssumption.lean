import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeostatisticsTheoremCanonicalLaneLean

structure StationarityAssumptionPackage where
  secondOrderStationary : Prop
  intrinsicStationarity : Prop
  meanConstant : Prop
  covarianceTranslationInvariant : Prop
  variogramExists : Prop

structure StationarityAssumptionEvidence (S : StationarityAssumptionPackage) where
  secondOrderStationaryClosed : S.secondOrderStationary
  intrinsicStationarityClosed : S.intrinsicStationarity
  meanConstantClosed : S.meanConstant
  covarianceTranslationInvariantClosed : S.covarianceTranslationInvariant
  variogramExistsClosed : S.variogramExists

def StationarityAssumptionClosed (S : StationarityAssumptionPackage) : Prop :=
  S.secondOrderStationary ∧ S.intrinsicStationarity ∧ S.meanConstant ∧
  S.covarianceTranslationInvariant ∧ S.variogramExists

theorem stationarity_assumption_closed_from_evidence
    (S : StationarityAssumptionPackage) (E : StationarityAssumptionEvidence S) :
    StationarityAssumptionClosed S := by
  refine And.intro E.secondOrderStationaryClosed (And.intro E.intrinsicStationarityClosed
    (And.intro E.meanConstantClosed (And.intro E.covarianceTranslationInvariantClosed
      E.variogramExistsClosed)))

end EarthScienceGeostatisticsTheoremCanonicalLaneLean
end HautevilleHouse