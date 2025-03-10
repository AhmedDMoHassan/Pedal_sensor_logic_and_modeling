% Read the Excel file
data = readtable('padel_test_cases.xlsx');

% Create timeseries objects
time = data.time;
input_1 = timeseries(data.Input_1, time);
input_2 = timeseries(data.Input_2, time);
sensor1 = timeseries(data.sensor_1, time);
sensor2 = timeseries(data.sensor_2, time);
APP_bSensor1Failure = timeseries(data.APP_bSensor1Failure, time);
APP_bCoherencyFailure = timeseries(data.APP_bCoherencyFailure, time);
APP_bSensor2Failure = timeseries(data.APP_bSensor2Failure, time);

% Verify the data
disp('Sensor 1 Data:');
disp(sensor1.Data);
disp('APP_bCoherencyFailure Data:');
disp(APP_bCoherencyFailure.Data);

% Save the dataset
dataset = Simulink.SimulationData.Dataset();
dataset = dataset.addElement(input_1, 'Input_1');
dataset = dataset.addElement(input_2, 'Input_2');
dataset = dataset.addElement(sensor1, 'sensor_1');
dataset = dataset.addElement(sensor2, 'sensor_2');
dataset = dataset.addElement(APP_bSensor1Failure, 'APP_bSensor1Failure');
dataset = dataset.addElement(APP_bSensor2Failure, 'APP_bSensor2Failure');
dataset = dataset.addElement(APP_bCoherencyFailure, 'APP_bCoherencyFailure');
save('signals.mat', 'dataset');
figure;
subplot(3, 1, 1);
plot(sensor1);
title('Sensor 1');
subplot(3, 1, 2);
plot(APP_bSensor1Failure);
title('APP_bSensor1Failure');
subplot(3, 1, 3);
plot(APP_bCoherencyFailure);
title('APP_bCoherencyFailure');
