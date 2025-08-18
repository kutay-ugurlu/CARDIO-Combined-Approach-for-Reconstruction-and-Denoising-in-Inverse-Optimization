function [RDMS, mnRDMS, stdRDMS] = calculate_rdms(original, estimate)

% CALCULATE_RDMS    Calculates RDMS between the true data and its estimate
%
% Usage:
%   [RDMS, mnRDMS, stdRDMS] = calculate_rdms(original, estimate)
%
% Inputs:
%   original    Original data matrix (nLeads x nFrames)
%   estimate    Estimate of original matrix (nLeads x nFrames)
%
% Outputs:
%   RDMS        (nFrames x 1) column vector of RDMS values at each time
%               instant
%   mnRDMS      mean RDMS value over time
%   stdRDMS     standard deviation of RDMS value over time
%

nFrames = size(original, 2);
RDMS = zeros(nFrames,1);

for fr = 1:nFrames,
    RDMS(fr) = norm(estimate(:,fr)/norm(estimate(:,fr)) - original(:,fr)/norm(original(:,fr)));
end;

mnRDMS = mean(RDMS);
stdRDMS = std(RDMS);