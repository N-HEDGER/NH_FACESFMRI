# MATLAB Code for fMRI project.

## Instructions

1. The main file that drives the experiment is MAINFACE.m.

2. When you run the file, you will be prompted to provide several inputs.

3. First, you are prompted to input the run number (1-4). Second, you are prompted to input whether or not you are testing, or running the full version of the experiment, with the syncbox. The syncbox settings are described [here](#Syncbox)

4. If you indicate that it is a test, only 10 trials will run, and it will not wait for a syncbox pulse.

5. Lastly, you are asked to input a subject filename.

6. After entering the subject filename, the experiment will start. You will then be presented with a grey screen, with some text that asks you to press any button to start waiting for pulses (in 'test mode' pressing the button will just start the experiment without waiting for any syncbox pulses). After pressing the button - this is when you should start the functional scan, and start the Syncbox in synchronisation mode. There is a 100 second timeout from the button press during which MATLAB waits for a Syncbox pulse. 

7. A central fixation will appear and a new trial will start every time a syncbox pulse is recieved (the TR for this experiment was 2 seconds).

## Design

1. There are 240 trials in total per run


2. In blocks 1-3, there are 10 different trial types, which are each repeated 12 times, totalling 120 *stimulus* trials.

* i) Fearful upright faces (12 trials)

* ii) Neutral upright faces (12 trials)

* iii) Fearful inverted faces (12 trials)

* iv) Neutral inverted faces (12 trials)

* v) Fearful inverted, inverted faces (12 trials)

* vi) Neutral inverted, inverted faces (12 trials)

* vii) Fearful upright, inverted faces (12 trials)

* viii) Neutral upright, inverted faces (12 trials)

* ix) Fearful scrambled faces (12 trials)

* x) Neutral scrambled faces (12 trials)

3. The remaining 120 trials are *null trials* during which no stimulus is presented. The trial sequence is determined by the EventTable.mat files in the 'Conditions' directory. These are designed to be efficient sequences, according to optseq.

4. Throughout the functional run, the subjects task is to view a central fixation and indicate when it changes luminance, via button press (keycode=1). These changes will occur on 24 of the trials. MATLAB looks for the highest keyboard index and listens only for keycode 1 (the blue button on the NNL buttonbox).

5. On block 4, there are 240 trials and just two different trial types:

i) Face stimuli (60 trials)
ii) House stimuli (60 trials)


<a id='Syncbox'></a>
## Syncbox

Here are the settings that you will need to input to the Syncbox in synchronisation mode:

*Volumes*: 240
*Slices*: 1
*Trigger on slice*: 1
*Trigger on volume*: each.

As far as MATLAB is concerned, the Syncbox config is in the Config directory: Syncbox_config.m. The Syncbox should be connected via USB and MATLAB talks to it by the serial port interface. To do this, the following driver is installed: http://www.ftdichip.com/Drivers/CDM/CDM21226_Setup.zip . 

## Data
For each subject, a directory will be created within the *Data* directory, which will have the following outputs:

1) A . mat file containing all data and constant parameters.
2) A .png file that shows the design matrix.
3) A log.txt file that indicates the timings of all stimulus flips, button presses and Syncbox pulses.
4) After each block (1-4) is completed, 3 column event onset files will be produced (FSL format - for input into a FEAT-type analysis). There will be one .txt file produced for each stimulus type.  

