%% Copied directly from Matlab help, modified only very slightly.
% https://www.mathworks.com/help/matlab/ref/dialog.html

function choice = chooseSaveType

    d = dialog('Position',[300 300 250 150],'Name',' Save Select');
    txt = uicontrol('Parent',d,...
           'Style','text',...
           'Position',[20 80 210 40],...
           'String','What do you wish to save?');
       
    popup = uicontrol('Parent',d,...
           'Style','popup',...
           'Position',[75 70 100 25],...
           'String',{'Current Figure';'Current Graph'},... %; 'All Graphs'},...
           'Callback',@popup_callback);
       
    btn = uicontrol('Parent',d,...
           'Position',[89 20 70 25],...
           'String','OK',...
           'Callback','delete(gcf)');
       
    choice = 'Whole Figure';
       
    % Wait for d to close before running to completion
    uiwait(d);
   
       function popup_callback(popup,event)
          idx = popup.Value;
          popup_items = popup.String;
          % This code uses dot notation to get properties.
          % Dot notation runs in R2014b and later.
          % For R2014a and earlier:
          % idx = get(popup,'Value');
          % popup_items = get(popup,'String');
          choice = char(popup_items(idx,:));
       end
end