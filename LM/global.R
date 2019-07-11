lpath <- '/srv/R_library'
.libPaths(c(lpath, .libPaths()))

# colour-blind-compatible palette
cb.colors <- c("#000000", "#009E73", "#e79f00", "#9ad0f3", "#0072B2", "#D55E00", "#CC79A7", "#F0E442") 
# from http://dr-k-lo.blogspot.co.uk/2013/07/a-color-blind-friendly-palette-for-r.html
# do not use 3, 6 or 8 together (feedback from colour-blind student) 

gal<- list(Hs= c(172.72, 169.418, 161.29, 166.37, 160.02, 176.53, 166.37, 165.1, 
166.37, 163.83, 182.88, 162.56, 166.37, 175.26, 180.34, 167.64, 
160.02, 166.37, 171.958, 167.64, 175.26, 190.5, 166.878, 170.18, 
165.1, 166.37, 156.21, 154.94, 160.02, 160.02, 166.37, 179.07, 
165.1, 165.1, 177.8, 160.02, 173.99, 182.88, 171.45, 162.56, 
153.67, 160.02, 185.42, 152.4, 175.26, 167.64, 162.56, 198.12, 
170.18, 179.07, 158.75, 172.72, 175.26, 167.64, 177.8, 185.928, 
180.34, 160.02, 178.308, 166.37, 179.07, 170.688, 190.5, 166.878, 
177.8, 165.1, 182.88, 168.91, 162.56, 182.88, 170.18, 162.56, 
185.42, 175.26, 165.1, 157.48, 160.02, 177.8, 157.48, 172.72),
           Ps= c(178.36, 162.88, 165.68, 172.15, 165.06, 164.5, 169.83, 166.39, 
167.64, 165.12, 168.84, 162.61, 167.25, 165.12, 170.12, 173.31, 
169.47, 168.23, 165.14, 167.58, 165.07, 171.38, 171.49, 177.78, 
173.98, 166.38, 166.44, 162.62, 168.26, 176.56, 171.46, 172.05, 
170.19, 167.59, 170.78, 168.29, 163.75, 166.93, 172.05, 162.62, 
165.14, 165.03, 174.6, 162.53, 170.77, 168.93, 162.58, 177.82, 
162.55, 168.29, 163.88, 172.77, 167.65, 178.37, 168.33, 184.77, 
173.03, 168.3, 165.74, 165.75, 173, 164.53, 175.2, 158.74, 176.45, 
158.68, 170.25, 171.49, 168.3, 169.48, 172.7, 161.34, 171.49, 
167.05, 171.53, 158.81, 166.32, 174.66, 168.87, 171.48))


fn.fitted.plot <- function(inputData){

    plot(gal$Ps, gal$Hs, xlab= "Height of parents (average)", ylab= "Child Height"),
         cex= 1, cex.lab= 1.3, col= cb.colors[5], 
         xlim= c(min(gal$Ps-5),max(gal$Ps+5)), 
         ylim= c(min(gal$Hs-5),max(gal$Hs+5)))
    lm.pred3<- inputData$Intercept + inputData$Slope * gal$Ps
    for(i in 1:N){
    	segments(x0= gal$Ps[i], x1= gal$Ps[i], y0= lm.pred3[i], y1= gal$Hs[i], lwd= 0.5, col= rgb(0, 0, 0, 0.5))
    }
    abline(inputData$Intercept, inputData$Slope, col= cb.colors[6], lwd= 2)
   
}

fn.SSE<- function(RS.in){
    lm.pred3<- SSE.in$Intercept + SSE.in$Slope * gal$Ps
    SSE<- sum((Hs - lm.pred3)^2)
    SSE
}

fn.SSE.plot <- function(inputData){
           
    tmp<- fn.SSE(inputData)
    plot(tmp, xlab= "", ylab= "SSE"),
         cex= 1, cex.lab= 1.3, col= 1, pty= 16,
         ylim= c(0, 50000))
    segments(x0= 1, x1= 1, y0= 0, y1= tmp)
    mtext(paste("  SSE= ", tmp), line= -2, adj= 0, cex= 2)

}




