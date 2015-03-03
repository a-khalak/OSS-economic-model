function [corprof, osmark, demcurv] = plotecs (P, Q, w, u, plt);
% plotecs does some plots...
%
% function plotecs (P, Q, w, u, plt);
%
% where P, and Q are price and quantity histories, and w are world parameters
% and u are user parameters.
%
% plt is a structure with plotting parameters (tbegin, tend, colors)
%

figure;
time = (1:w.timelen)-w.OSS;

if ~exist('plt'), 
  tbegin = -20;
  tend = 50;
  colorcycle = ['rgbmcyk'];
  plottype = 'standard';
else 
  tbegin = plt.tbegin;
  tend   = plt.tend;
if isfield (plt,'colors'),
    colorcycle = plt.colors;
   else
    colorcycle = ['rgbmcyk'];
   end;
if isfield (plt,'plottype'),
    plottype = plt.plottype;
   else
    plottype = 'standard';
   end;
end;


if strcmp(plottype,'standard') == 1,

  corprof = axes ('position', [0.1 0.1 0.85 0.4]);
  osmark = axes ('position', [0.1 0.53 0.85 0.4]);
  demcurv = axes ('position', [0.15 0.75 0.13 0.15]);

  axes (corprof);

  for i = 1:w.M;
  col = mod (i,length(colorcycle)) + 1;
  plot (time,Q(i,:).*P(i,1:(size(Q,2))), colorcycle(col));  hold on;
  end;
  ylabel ('corporate revenues');
  set (gca, 'XLim', [tbegin tend]);
  xlabel ('time');

  axes(osmark);
  plot (time,100*Q(w.M+1,:)/w.N, 'x');
  set (osmark, 'XLim', [tbegin tend]);
  ylim = get (osmark, 'YLim');
  set (osmark, 'YLim', [0 ylim(2)]);
  set(osmark, 'XTick', []);
  ylabel('% Open Source Users');

  axes(demcurv);
  g = - sort(-u.p);
  plot ([g;0], [1:length(g) length(g)]);
  axis ([0 max(g) 0 w.N*1.2])
  set (demcurv, 'XTick', [], 'YTick', []);
  xlabel('Price');
  ylabel ('Demand');

end;


if strcmp(plottype,'price')==1,

  for i = 1:w.M;
  col = mod (i,length(colorcycle)) + 1;
  plot (time,P(i,1:length(Q)), colorcycle(col));  hold on;
  end;
  ylabel ('price');
  set (gca, 'XLim', [tbegin tend]);
  xlabel ('time');

end;
