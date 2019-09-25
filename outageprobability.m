%hw2q1 revised

Pt=30; %dBm Transmit power
d0=1; %m reference distance
Kref=-30; %dB reference path loss
N=[1, 2, 2.5,3,4,5,6]; %path loss exponent
noise=-100; %dBm noise level
sd=[0 3 5 10 20 30]; %dB lognormal fading standard deviation.
theta=10; %dB snr threshold



d=1:10000;
Pr_=Pt+Kref-N(3)*10*log10(d/d0);
snr_avg=Pr_-noise;
Pout=(1/2)*(1+erf((theta-snr_avg)/(sd(1)*sqrt(2))));
figure(1);
plot(d,Pout);
hold on;

%vary Standard Deviation for path loss exponent = 2.5
for i=2:length(sd)
    Pout=(1/2)*(1+erf((theta-snr_avg)/(sd(i)*sqrt(2))));
    plot(d,Pout,'-');
end

legend('sd0','sd3', 'sd5', 'sd10', 'sd20','sd30');

grid on
title('Outage Probability Over Distance \newline for Various Standard Deviations');
xlabel('distance (d)');
ylabel('Outage Probability (Po)');
hold off;

%vary Path Loss Exponent
figure(2);
grid on;
hold on;
for j=1:length(N)
    Pr_=Pt+Kref-N(j)*10*log10(d/d0);
    snr_avg=Pr_-noise;
    Poutn=(1/2)*(1+erf((theta-snr_avg)/(sd(2)*sqrt(2))));
    plot(d,Poutn,'-');
end

legend('n1','n2', 'n2.5', 'n3', 'n4','n5');
title('     Outage Probability Over Distance \newlinefor Various Path Loss Exponent Values');
xlabel('distance (d)');
ylabel('Outage Probability (Po)');
hold off;
