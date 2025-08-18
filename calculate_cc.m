function [CC, mnCC, stdCC] = calculate_cc(original, estimate)

% CALCULATE_CC    Calculates CC between the true data and its estimate
%
% Usage:
%   [CC, mnCC, stdCC] = calculate_cc(original, estimate)
%
% Inputs:
%   original    Original data matrix
%   estimate    Estimate of original matrix
%
% Outputs:
%   CC        (nFrames x 1) column vector of CC values at each time
%               instant
%   mnCC      mean CC value over time
%   stdCC     standard deviation of CC value over time
%

[nLeads, nFrames] = size(original);

CC = zeros(nFrames,1);

for fr = 1:nFrames
    % Check this definition
    sumOrig = nansum(original(:,fr));
    sumEst = nansum(estimate(:,fr));
    CC(fr) = (nLeads*original(:,fr)'*estimate(:,fr) - sumOrig*sumEst)/ ...
        sqrt( (nLeads*nansum(original(:,fr).^2) - sumOrig^2)*(nLeads*nansum(estimate(:,fr).^2) - sumEst^2) );
end

mnCC = mean(CC);
stdCC = std(CC);