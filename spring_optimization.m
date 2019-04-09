function spring_optimization
    tens_dat = csvread('tension_data.csv', 1, 0);
    comp_dat = csvread('compression_data.csv', 1, 0);
    
    for n_tens = 1:size(tens_dat,1)
        for n_comp = 1:size(comp_dat,1)
            Lc = compute_comp_len(tens_dat(n_tens,1),comp_dat(n_comp,1),comp_dat(n_comp,2));
            fprintf('Tension spring: %d\nComp spring: %d\nCalculated Lc: %d\n\n',...
                [tens_dat(n_tens,1),comp_dat(n_comp,1),Lc]);
            
        end
    end
end

% accounts for 4x k_eq, 2x k_norm
function Lc = compute_comp_len(k_eq, k_norm, L0)
    k_eq4 = 4*k_eq;
    Lc = L0/(1+(k_eq4/(2*k_norm)));
end