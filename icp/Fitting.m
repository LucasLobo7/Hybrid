clear all
load PhasedifQn_N.mat
load phaseIn_N.mat
load phasedifQIN_N.mat
%CREATEFIT(FREQDIF)
%  Create a fit.
%
%  Data for 'untitled fit 1' fit:
%      X Input : freqdif
%      Y Output: freqdif
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  See also FIT, CFIT, SFIT.

%  Auto-generated by MATLAB on 26-Nov-2022 14:01:00
linhas = 33;
cofQ = zeros(33,2);
cofI = zeros(33,2);
cofQI = zeros(33,2);


for i = 1:linhas
    [xData, yData] = prepareCurveData( freqdif, PhasedifQn(i,:) );

    % Set up fittype and options.
    ft = fittype( 'poly1' );
    opts = fitoptions( 'Method', 'LinearLeastSquares' );
    opts.Robust = 'LAR';

    % Fit model to data.
    [fitresult, gof] = fit( xData, yData, ft, opts );
    cofQ(i,1) = fitresult.p1;
    cofQ(i,2) = fitresult.p2;
end

for i = 1:linhas
    [xData, yData] = prepareCurveData( freqdif, phaseIn(i,:) );

    % Set up fittype and options.
    ft = fittype( 'poly1' );
    opts = fitoptions( 'Method', 'LinearLeastSquares' );
    opts.Robust = 'LAR';

    % Fit model to data.
    [fitresult, gof] = fit( xData, yData, ft, opts );
    cofI(i,1) = fitresult.p1;
    cofI(i,2) = fitresult.p2;
end

for i = 1:linhas
    [xData, yData] = prepareCurveData( freqdif, phasedifQIN(i,:) );

    % Set up fittype and options.
    ft = fittype( 'poly1' );
    opts = fitoptions( 'Method', 'LinearLeastSquares' );
    opts.Robust = 'bisquare';

    % Fit model to data.
    [fitresult, gof] = fit( xData, yData, ft, opts );
    cofQI(i,1) = fitresult.p1;
    cofQI(i,2) = fitresult.p2;
end

[xData, yData] = prepareCurveData( freqdif, PhasedifQn(15,:) );
Y = PhasedifQn(15,:)
% Set up fittype and options.
ft = fittype( 'poly1' );
opts = fitoptions( 'Method', 'LinearLeastSquares' );
opts.Robust = 'LAR';

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );
% Plot fit with data.
figure( 'Name', 'untitled fit 1' );
h = plot( fitresult, xData, yData );
legend( h, 'freqdif vs. freqdif', 'untitled fit 1', 'Location', 'NorthEast' );
% Label axes
xlabel freqdif
ylabel freqdif
grid on


save ('coeficientes_N.mat', 'cofQ', 'cofI', 'cofQI')
