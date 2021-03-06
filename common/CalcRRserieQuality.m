%% (Obsolete) Estimate the quality of QRS complex detections 
% Calculate the quality of QRS detections based on the improvement
% generated by coherent averaging, and the likelihood of the RR. Obsolete,
% see calculateSeriesQuality
% 
% Example
% 
%   where:
% 
% See also calculateSeriesQuality
% 
% Author: Mariano Llamedo Soria llamedom@electron.frba.utn.edu.ar
% Version: 0.1 beta
% Birthdate: 01/01/2012
% Last update: 18/10/2014
% Copyright 2008-2015
function q_measure = CalcRRserieQuality(signal, heasig, references)
% function [q_measure noise_power] = CalcRRserieQuality(signal, heasig, references, noise_power)

% references = references( references > round( 0.15 * heasig.freq ) & references < size(signal, 1) - round( 0.3 * heasig.freq ) );

lreferences = length(references);

% [corr_gain noise_power] = calc_correlation_gain(signal, heasig, round(references(round(lreferences/2):min(lreferences, round(lreferences/2)+100))), round( [0.15 0.3] * heasig.freq ), noise_power, false );

% corr_gain = soft_range_conversion(corr_gain, [0 30], [0 1], 0.2);
% corr_gain = 1;

references = cellfun( @(a)( a * 1000 / heasig.freq),references, 'UniformOutput', false );

serie_index = CalcRRserieRatio( references, lead, [1 heasig.nsamp ]);

q_measure = max(corr_gain) * (soft_range_conversion(serie_index, [0 0.4], [1 0], 0.2));

