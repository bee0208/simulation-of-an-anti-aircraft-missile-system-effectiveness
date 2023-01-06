vid=VideoReader('target_animation.avi');

vidFrame = vid.readFrame();
size(vidFrame);

vid.CurrentTime = 0;
i=1;

figure
ax = axes;

while vid.hasFrame()
    temp = vid.readFrame();
    imshow(temp,'Parent', ax)
%     pause(1.0/vid.FrameRate)
    pause(0.0001)
end
