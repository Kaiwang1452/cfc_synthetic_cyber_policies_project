# 📊 Pricing & Performance Analytics Project

This repository contains tools and dashboards built to support **cyber insurance pricing and underwriting decisions**, combining Excel prototyping, Power BI reporting, and statistical modeling.  

---

## 🟩 Excel — Pricing & Performance Pack  
- **Interactive Pricing Calculator** with:
  - Assumptions sheet  
  - Base rates by revenue band  
  - `Controls_Adjustment_Factor`  
  - Sensitivity tables showing suggested premiums across control scores and revenue bands  
- **Validation Sheet** listing top loss-ratio policies  
- **Macro-enabled prototype** with a *Refresh & Validate* button to rebuild validation outputs automatically  

---

## 🟦 Power BI — Pricing & Underwriting Dashboard  
- **3-page report**:
  1. **Executive Summary** → KPIs & rolling 12-month Loss Ratio  
  2. **Underwriting & Cohorts** → industry × controls heatmap, frequency/severity split  
  3. **Policy Drillthrough** → granular policy-level insights  
- Built supporting DAX measures:
  - Portfolio LR: `SUM(Claims) / SUM(Premium)`  
  - Frequency & Severity measures  
  - *What-If Parameter* to simulate repricing scenarios  
- Added **Data Quality Alerts** (zero-premium, top-N outliers) to ensure decisions are based on clean data  

---

## 🟨 Statistical Modelling — Controls → Frequency (Poisson GLM)  
- Fitted a **Poisson GLM** to quantify the impact of `CyberControlsScore` on claims frequency, controlling for industry and company size (proxy: employees)  
- Demonstrator result:  
  - Each 1-point increase in `ControlsScore` → **~1.55% reduction** in expected claim frequency  
  - A 10-point improvement ≈ **14.5% reduction**  
- Performed diagnostics and recommended production deployment steps:
  - Use **exposure offset**  
  - Test for **overdispersion**  
  - Consider **interaction terms**  

---
