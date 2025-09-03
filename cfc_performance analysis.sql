
SELECT
  strftime('%Y-%m-01', InceptionDate) AS month,
  Industry,
  COUNT(*) AS policies,
  SUM(Premium) AS total_premium,
  SUM(ClaimsAmount) AS total_claims,
  SUM(ClaimsAmount) / NULLIF(SUM(Premium), 0) AS loss_ratio
FROM cfc_policies
GROUP BY month, Industry
ORDER BY month, Industry;

SELECT PolicyNo, InceptionDate, Underwriter, Premium, ClaimsAmount
FROM cfc_policies
WHERE Premium = 0 OR Premium IS NULL
LIMIT 200;

SELECT
  CASE
    WHEN CyberControlsScore >= 80 THEN '80+'
    WHEN CyberControlsScore >= 60 THEN '60-79'
    WHEN CyberControlsScore >= 40 THEN '40-59'
    ELSE '<40'
  END AS controls_bucket,
  COUNT(*) AS policies,
  AVG(ClaimsCount) AS avg_frequency,
  SUM(ClaimsAmount) AS total_claims,
  SUM(Premium) AS total_premium,
  SUM(ClaimsAmount) / NULLIF(SUM(Premium),0) AS loss_ratio
FROM cfc_policies
GROUP BY controls_bucket
ORDER BY policies DESC;

SELECT PolicyNo, Premium, ClaimsAmount, (ClaimsAmount / NULLIF(Premium,0)) AS loss_ratio
FROM cfc_policies
ORDER BY loss_ratio DESC
LIMIT 20;

SELECT Underwriter,
       COUNT(*) AS policies,
       SUM(Premium) AS total_premium,
       SUM(ClaimsAmount) AS total_claims,
       SUM(ClaimsAmount) / NULLIF(SUM(Premium),0) AS loss_ratio
FROM cfc_policies
GROUP BY Underwriter
ORDER BY loss_ratio DESC;