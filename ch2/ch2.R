### pg 24
library(daewr)
mod0 <- lm(height ~ time, data=bread)
print(summary(mod0))

### contrasts, 
# beta_0 = mu_hat + tau1
# beta_1 = tau2 - tau1
# beta_2 = tau3 - tau1
# c(1, -1, 0) -> beta_0 - beta_1 + 0*beta_2 -> (mu_hat + tau_1) - (tau2 - tau1) = 
library(gmodels)
print(fit.contrast(mod0, "time", c(1, -1, 0)))

### 1 factor anova
print("1 factor ANOVA")
mod1 <- aov( height ~ time, data=bread)
print(summary(mod1))


### Plot bread data
par(mfrow=c(2,2))
plot(mod1, which=5)
plot(mod1, which=1)
plot(mod1, which=2)
plot(residuals(mod1) ~ loaf, main="Residuals vs Exp Unit", font.main=1, data=bread)
abline(h=0, lty=2)