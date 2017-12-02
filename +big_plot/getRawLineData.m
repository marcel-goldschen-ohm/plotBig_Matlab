function s = getRawLineData(h_plot,varargin)
%
%   s = big_plot.getRawLineData(h_plot,varargin)
%
%   Inputs
%   ------
%   h_plot
%
%   Optional Inputs
%   ---------------
%   get_x_data : default true
%   xlim : [min_time  max_time]
%
%   Outputs
%   -------
%   s : 
%       .x
%       .y
%
%   Improvements
%   ------------
%   - Allow processing of a vector of handles ...

in.get_x_data = true;
in.xlim = [];
in = big_plot.sl.in.processVarargin(in,varargin);


ptr = getappdata(h_plot,'BigDataPointer');

if isempty(ptr)
    s.y = h_plot.YData;
    if in.get_x_data
        s.x = h_plot.XData;
    end
    
    if ~isempty(in.xlim)
        error('Not yet implemented')
    end
else
    %big_plot.line_data_pointer
    s.y = ptr.getYData(in.xlim);
    if in.get_x_data
        s.x = ptr.getXData(in.xlim);
    end
end


end