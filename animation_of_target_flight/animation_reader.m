%%Script that run .avi video in Matlab figure

%Read .avi file into vid object
vid=VideoReader('target_animation_example.avi');

%read frames from vid object
vidFrame = vid.readFrame();
size(vidFrame);

%set current time
vid.CurrentTime = 0;

%create figure with axes
figure
ax = axes;

%showing frames in figure
while vid.hasFrame()
    temp = vid.readFrame();
    imshow(temp,'Parent', ax)
    pause(0.001) 
end
