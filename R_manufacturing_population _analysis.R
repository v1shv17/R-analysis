
R version 4.4.2 (2024-10-31) -- "Pile of Leaves"
Copyright (C) 2024 The R Foundation for Statistical Computing
Platform: aarch64-apple-darwin20

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

  Natural language support but running in an English locale

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

[R.app GUI 1.81 (8462) aarch64-apple-darwin20]

[History restored from /Users/vishvraval/.Rapp.history]

> rm(list = ls())
> setwd("/Users/vishvraval/Desktop/R")
> inputData <- read.table("data.txt")
> col1 <- inputData[, 1]
> col2 <- inputData[, 2]
> col3 <- inputData[, 3]
> 
> install.packages("ggplot2")
--- Please select a CRAN mirror for use in this session ---
trying URL 'https://mirror.csclub.uwaterloo.ca/CRAN/bin/macosx/big-sur-arm64/contrib/4.4/ggplot2_3.5.1.tgz'
Content type 'text/plain' length 4974305 bytes (4.7 MB)
==================================================
downloaded 4.7 MB


The downloaded binary packages are in
	/var/folders/s9/4q37zjys57dc6w2cds0yl5t40000gn/T//RtmpTckzRl/downloaded_packages
>  library(ggplot2)
> hist(col1, main = "Histogram: Data Column 1", xlab = "Values", col ="red")
> hist(col2, main = "Histogram: Data Column 2", xlab = "Values", col ="blue")
> hist(col3, main = "Histogram: Data Column 3", xlab = "Values", col ="green")
> 
> col1Mean <- mean(col1)
> col1Var <- var(col1)
> col2Mean <- mean(col2)
> col2Var <- var(col2)
> col3Mean <- mean(col3)
> col3Var <- var(col3)
> 
> cat("Column 1 - Mean:", col1Mean, "Variance:", col1Var, "\n")
Column 1 - Mean: 9.934069 Variance: 0.5019804 
> cat("Column 2 - Mean:", col2Mean, "Variance:", col2Var, "\n")
Column 2 - Mean: 4.996958 Variance: 11.25717 
> cat("Column 3 - Mean:", col3Mean, "Variance:", col3Var, "\n")
Column 3 - Mean: 0.96 Variance: 0.03855422 
> shapiro_test_col1 <- shapiro.test(col1)
> cat("Column 1 - Shapiro-Wilk p-value:", shapiro_test_col1$p.value, "\n")
Column 1 - Shapiro-Wilk p-value: 0.4513872 
> shapiro_test_col2 <- shapiro.test(col2)cat("Column 2 - Shapiro-Wilk p-value:", shapiro_test_col2$p.value, "\n")
Error: unexpected symbol in "shapiro_test_col2 <- shapiro.test(col2)cat"
> shapiro_test_col2 <- shapiro.test(col2)
> cat("Column 2 - Shapiro-Wilk p-value:", shapiro_test_col2$p.value, "\n")
Column 2 - Shapiro-Wilk p-value: 2.008801e-11 
> shapiro_test_col3 <- shapiro.test(col3)
> cat("Column 3 - Shapiro-Wilk p-value:", shapiro_test_col3$p.value, "\n")
Column 3 - Shapiro-Wilk p-value: 2.085203e-31 
> 
> sampleData <- inputData[, 1]
> ssize <- length(sampleData)
> smean <- mean(sampleData)
> ssd <- sd(sampleData)
> 
>  confidenceLevel <- 0.01
> 
> critical_t <- qt(1 - confidenceLevel / 2, df = ssize - 1)
> ci_lowerBound <- smean - critical_t * (ssd / sqrt(ssize))
> ci_upperBound <- smean + critical_t * (ssd / sqrt(ssize))
> 
> cat("Confidence Interval: [", ci_lowerBound, ", ", ci_upperBound, "]\n")
Confidence Interval: [ 9.817755 ,  10.05038 ]
> 
> hypothesizedVar <- 0.5
> 
>  chi_squareStat <- (ssize - 1) * var(sampleData) / hypothesizedVar
> pvalueVar <- 2 * min( pchisq(chi_squareStat, df = ssize - 1, lower.tail = TRUE), pchisq(chi_squareStat, df = ssize - 1, lower.tail = FALSE) )
> cat("Variance Test p-value:", pvalueVar, "\n")
Variance Test p-value: 0.9410051 
> 
>  col3 <- inputData[, 3]
> proportionDefect <- mean(col3 == 0)
> ssize_col3 <- length(col3)
> 
> 
> 
> 
> proportionHypothesized <- 0.10
> 
> Zscore <- (proportionDefect - proportionHypothesized) / sqrt(proportionHypothesized * (1 - proportionHypothesized) / ssize_col3)
> 
> proportionPvalue <- pnorm(Zscore, lower.tail = TRUE)
> 
> cat("Proportion Test p-value:", proportionPvalue, "\n")
Proportion Test p-value: 0.0007827011 
> 