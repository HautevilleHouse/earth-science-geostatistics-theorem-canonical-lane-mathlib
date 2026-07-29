import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeostatisticsTheoremCanonicalLaneLean

structure SpatialDomain where
  pointSet : Type u
  distanceFunction : pointSet → pointSet → ℝ
  boundedness : Prop
  stationaryCondition : Prop

structure RegionalizedVariable {D : SpatialDomain} (D : SpatialDomain) where
  valueAt : D.pointSet → ℝ
  secondOrderStationary : Prop
  intrinsicHypothesis : Prop

structure VariogramModel {D : SpatialDomain} (D : SpatialDomain) where
  variogramFunction : ℝ → ℝ
  nugget : ℝ
  sill : ℝ
  range : ℝ
  conditionalNegativeDefinite : Prop
  variogramProperties : Prop

structure GeostatisticalDataPackage {D : SpatialDomain} (D : SpatialDomain) (Z : RegionalizedVariable D) (V : VariogramModel D) where
  dataConsistent : Prop
  spatialContinuity : Prop
  ergodicityCondition : Prop
  samplingDesignValid : Prop

structure GeostatisticalDataEvidence {D : SpatialDomain} {Z : RegionalizedVariable D} {V : VariogramModel D} (Pkg : GeostatisticalDataPackage D Z V) where
  dataConsistentClosed : Pkg.dataConsistent
  spatialContinuityClosed : Pkg.spatialContinuity
  ergodicityConditionClosed : Pkg.ergodicityCondition
  samplingDesignValidClosed : Pkg.samplingDesignValid

def GeostatisticalDataClosed {D : SpatialDomain} {Z : RegionalizedVariable D} {V : VariogramModel D} (Pkg : GeostatisticalDataPackage D Z V) : Prop :=
  Pkg.dataConsistent ∧ Pkg.spatialContinuity ∧ Pkg.ergodicityCondition ∧ Pkg.samplingDesignValid

theorem geostatistical_data_closed_from_evidence {D : SpatialDomain} {Z : RegionalizedVariable D} {V : VariogramModel D} (Pkg : GeostatisticalDataPackage D Z V) (E : GeostatisticalDataEvidence Pkg) : GeostatisticalDataClosed Pkg := by
  exact And.intro E.dataConsistentClosed (And.intro E.spatialContinuityClosed (And.intro E.ergodicityConditionClosed E.samplingDesignValidClosed))

end EarthScienceGeostatisticsTheoremCanonicalLaneLean
end HautevilleHouse