### MATLAB Code for fMRI project.

## Instructions

1. The main file that drives the experiment is MAINFACE.m.

2. When you run the file, you will be prompted to provide several inputs.

3. First, you are prompted to input the run number (1-4). Second, you are prompted to input whether or not you are testing, or running the full version of the experiment, with the syncbox. The syncbox settings are described [here](#Syncbox)

4. If you indicate that it is a test, only 20 trials will run, and it will not wait for a syncbox pulse.

5. Lastly, you are asked to input a subject filename.

6. After entering the subject filename, the experiment will start. You will then be presented with a grey screen, with some text that asks you to press any button to start waiting for pulses (in 'test mode' pressing the button will just start the experiment without waiting for any syncbox pulses).

7. A central fixation will appear and a new trial will start every time a syncbox pulse is recieved (the TR for this experiment was 2 seconds).

## Design

1. There are 240 trials in total per run

2. In blocks 1-3, there are 10 different trial types, which are each repeated 12 times, totalling 120 *stimulus* trials.

i) Fearful upright faces
ii) Neutral upright faces

iii) Fearful inverted faces
iv) Neutral inverted faces

v) Fearful inverted, inverted faces
vi) Neutral inverted, inverted faces

vii) Fearful upright, inverted faces
viii) Neutral upright, inverted faces

ix) Fearful scrambled faces
x) Neutral scrambled faces

3. The remaining 120 trials are *null trials* during which no stimulus is presented. The trial sequence is determined by the EventTable.mat files in the 'Conditions' directory. These are designed to be efficient sequences, according to optseq.

4. Throughout the functional run, the subjects task is to view a central fixation and indicate when it changes luminance, via button press (keycode=1). These changes will occur on 24 of the trials.


<a id='Syncbox'></a>


