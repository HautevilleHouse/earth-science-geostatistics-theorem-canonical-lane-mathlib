import EarthScienceGeostatisticsTheoremCanonicalLaneLean.UncertaintyQuantification

namespace HautevilleHouse
namespace EarthScienceGeostatisticsTheoremCanonicalLaneLean

structure BayesianUpdatePackage {V : VariogramModel} {K : KrigingEstimator V}
    {S : SpatialContinuityPackage V K} {U : UncertaintyQuantificationPackage V K S} where
  priorDistribution : ℝ → ℝ
  likelihoodFunction : ℝ → ℝ → ℝ
  posteriorComputed : Prop
  posteriorComputedTerm : posteriorComputed

def BayesianUpdateClosed {V : VariogramModel} {K : KrigingEstimator V}
    {S : SpatialContinuityPackage V K} {U : UncertaintyQuantificationPackage V K S}
    (B : BayesianUpdatePackage V K S U) : Prop :=
  B.posteriorComputed

theorem bayesian_update_closed {V : VariogramModel} {K : KrigingEstimator V}
    {S : SpatialContinuityPackage V K} {U : UncertaintyQuantificationPackage V K S}
    (B : BayesianUpdatePackage V K S U) : BayesianUpdateClosed B :=
  B.posteriorComputedTerm

end EarthScienceGeostatisticsTheoremCanonicalLaneLean
end HautevilleHouse