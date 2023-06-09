function [ params ] = tapas_BLT_runIntroMain( params )
% tapas_BLT_runIntroMain Presents written instructions and logs the event
%
% About:
%   Coded by F.Petzschner 19. April 2017
%	Last change: F.Petzschner 19. April 2017


for i = 1:params.nIntroMain
    
    Screen('DrawTexture', params.screen.window, params.text.IntroMain{i}, [], params.screen.fit, 0);
    Screen('Flip', params.screen.window);
    wait2_escapeOption(params.dur.showIntroScreen, params);
    detecting = 1;
    
    if i == params.nIntroMain
        wait2(3000);
        break
    else 
        while detecting
            keyCode = 0;
            keyCode = detectkey(params);
            if keyCode == params.keys.two
                    Screen('DrawTexture', params.screen.window, params.text.imgbreak, [], params.screen.fit, 0);
                    Screen('Flip', params.screen.window);
                    wait2(1000);
                    keyCode2 = detectkey(params);
                    if keyCode2 == params.keys.one 
                       detecting = 0;
                    end
            elseif keyCode == params.keys.one 
                detecting = 0;
            end
        end
    end

    fprintf(['Intro Main Slide...',num2str(i)])
end

