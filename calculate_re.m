function [RE, mnRE, stdRE] = calculate_re(original, estimate)

% CALCULATE_RE    Calculates RE between the true data and its estimate
%
% Usage:
%   [RE, mnRE, stdRE] = calculate_re(original, estimate)
%
% Inputs:
%   original    Original data matrix
%   estimate    Estimate of original matrix
%
% Outputs:
%   RE        (nFrames x 1) column vector of RE values at each time
%               instant
%   mnRE      mean RE value over time
%   stdRE     standard deviation of RE value over time
%

nFrames = size(original, 2);

RE = zeros(nFrames,1);

for fr = 1:nFrames,
    RE(fr) = norm(original(:,fr) - estimate(:,fr))/norm(original(:,fr));
end;

mnRE = mean(RE);
stdRE = std(RE);