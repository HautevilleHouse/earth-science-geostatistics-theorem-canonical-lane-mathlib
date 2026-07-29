import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeostatisticsTheoremCanonicalLaneLean

structure ChangeOfSupportPackage where
  volumeVarianceRelation : Prop
  regularization : Prop
  upscalingDownscaling : Prop
  supportEffectCorrected : Prop

def ChangeOfSupportClosed (C : ChangeOfSupportPackage) : Prop :=
  C.volumeVarianceRelation ∧ C.regularization ∧ C.upscalingDownscaling ∧ C.supportEffectCorrected

end EarthScienceGeostatisticsTheoremCanonicalLaneLean
end HautevilleHouse