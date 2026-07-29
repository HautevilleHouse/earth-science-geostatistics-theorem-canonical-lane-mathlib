import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EarthScienceGeostatisticsTheoremCanonicalLaneLean.SpatialPrediction

namespace HautevilleHouse
namespace EarthScienceGeostatisticsTheoremCanonicalLaneLean

structure CrossValidationPackage {V : VariogramModelPackage}
    {K : KrigingEstimatorPackage V} {P : SpatialPredictionPackage K} where
  method : String  -- "leave-one-out", "k-fold", etc.
  cvScore : ℝ
  residualAnalysis : Prop
  qqPlot : Prop

structure CrossValidationEvidence {V : VariogramModelPackage}
    {K : KrigingEstimatorPackage V} {P : SpatialPredictionPackage K}
    (C : CrossValidationPackage P) where
  methodValid : C.method ∈ ["leave-one-out", "k-fold", "bootstrap"]
  scoreFinite : C.cvScore ≠ ∞
  residualAnalysisClosed : C.residualAnalysis
  qqPlotClosed : C.qqPlot

def CrossValidationClosed {V : VariogramModelPackage}
    {K : KrigingEstimatorPackage V} {P : SpatialPredictionPackage K}
    (C : CrossValidationPackage P) : Prop :=
  C.method ∈ ({"leave-one-out", "k-fold", "bootstrap"} : Set String) ∧
  C.residualAnalysis ∧ C.qqPlot

theorem cross_validation_closed_from_evidence {V : VariogramModelPackage}
    {K : KrigingEstimatorPackage V} {P : SpatialPredictionPackage K}
    (C : CrossValidationPackage P) (E : CrossValidationEvidence C) :
    CrossValidationClosed C := by
  exact And.intro E.methodValid (And.intro E.residualAnalysisClosed E.qqPlotClosed)

end EarthScienceGeostatisticsTheoremCanonicalLaneLean
end HautevilleHouse