function sfeat = ExtractStatisticalFeatures(sig)

    v=sig;
    feat(:,1) = mean(v); % Mean
    feat(:,2) = std(v); % Standard Deviation
    feat(:,3) = skewness(v); % Skewness
    feat(:,4) = kurtosis(v); % Kurtosis
    
    
    sfeat=[feat];
end
