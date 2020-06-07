;X5SA-PRO-Mute board
; Power-off save support or not,Restart takes effect after setting
; 0: Means not supported       1: He expressed support
M8000 I1
;
; Printing is complete,Restart takes effect after setting
; 0: Means not supported       1: He expressed support
M8001 I1
; ==================================
; Here is the step motor direction control
; The directions of I1 and I-1 are just opposite, so if the direction of the motor is not correct, either change the wiring or change this direction parameter
; X stepper motor direction, I1 or I-1
M8002 I-1
; ==================================
;
; Y stepper motor direction
M8003 I-1
; ==================================
;
; Z stepper motor direction
M8004 I1
; ==================================
;
; E stepper motor direction  
M8005 I-1
; ==================================
; XYZ axis extrusion head / platform movement configuration, it only affects the actual movement direction of the manual interface button
; 0: X-axis extrusion head movement
; 1: X-axis platform movement
; Most of the machines on the market today are X-axis extrusion head movements
M8005 X0
; ==================================
; 0: Extrusion head movement in Y axis direction     
; 1: Y-axis platform movement
; At present, the Y axis of the structure of I3 is the platform movement, and the Y axis of delta, ultimaker and makerbot is the movement of the extrusion head.
M8005 Y0
; ==================================
; 0: Extrusion head movement in Z axis direction     
; 1: Platform movement in Z axis direction 	
; At present, the Z axis of the I3 structure and the delta structure is the extrusion head movement, and the Z axis of the ultimaker and makerbot structure is the platform movement       
M8005 Z1
; ==================================
; Speed related settings, with speed in mm / s and acceleration in mm / s ^ 2
; The maximum starting speed. When the speed of movement exceeds this speed, the speed will be used as the starting point. This speed is mainly to prevent out of step.
; This value is too small, which will cause the rail corners to bulge when rounding
M8006 I150
; ==================================
; The maximum turning speed (corresponding to the jerk speed in the open source firmware). If the actual turning speed of the movement is greater than this value, it will force the movement to slow down. During the filling process, there will be a large number of reciprocating motions. If this value is large, the noise is large, and it is easy to lose steps. If this value is small, slow, and when printing speed is high, the print quality will be relatively poor.
M8007 I16
; ==================================
;
; Acceleration, the larger the value is, the larger the average speed of actual operation is, but the noise is also larger. The smaller the value, the smaller the actual speed.	
M8008 I150
; ==================================
;
;[Step-related parameters] After setting the parameters, please print a cube, or manually control the movement of each axis, and then measure the size with a ruler to confirm that there are no problems with the parameters  
;[mm value of each step of XY] For example, 20 teeth, tooth pitch is 2mm (mxl specification, 2gt tooth data is 2mm), 1.8 degree stepper motor, 16 subdivision, then (20 * 2) / ((360 / 1.8) * 16)
M8009 S0.00625
; ==================================
;
;
; If you need to set the X and Y stepper motor parameters independently, you can use this command to tick the front box.
;M8009 X0.0127 Y0.0127	
; ==================================
;
; Z mm value at each step, calculation formula: lead / ((360 / 1.8) * 16),
; The lead is the height of the platform when the screw turns one turn
M8010 S0.00125
; ==================================
; E mm value at each step, this value is equal to the circumference of the extrusion gear divided by 3200,
; If you have a reduction gear, you need to divide by the reduction ratio, S0.0013085 Titan Extruder. S0.0053995
; If you find that the wire is relatively thin or often faulted, it is recommended to set this value a little smaller than the real value, and the wire is better.	
;M8011 S0.0013085	;This is the default value for a Titan Extruder.
M8011 S0.00113	;This is the default value for a Titan Extruder.
; ==================================
;
; The maximum speed of various parameters, in order to ensure the stability of the machine, please set according to the actual measurement results
; Speed of XY movement mm / s
M8012 I140
; ==================================
;
; Speed of Z movement mm / s		
M8013 I20
; ==================================
;
; Speed of extruder mm / s	
M8014 I120
; ==================================
; Z return to zero speed,
; Makerware slicing software will ignore this zeroing speed, because the zeroing speed is specified in its gcode.
; The first zeroing speed when Z is zeroed, the speed is faster
M8015 I8
; ==================================
;
; The first zeroing speed when XY is zeroed, the speed is faster		
M8015 S30
; ==================================
;
; The speed of the second return to zero when Z returns to zero, the speed is slower	
M8016 I8
; ==================================
;
; XY return to zero speed for the second time, the speed is slower	
M8016 S8
; ==================================
; Pre-extrusion before printing      
; Pre-extrusion length mm,
; Whether the first layer and the bottom plate are firmly attached directly affects the print quality. A little more pre-extrusion will make the bottom plate better
M8017 I6
; ==================================
;
; Extruder maximum pre-extrusion speed mm / s, non-reduction gear feeding, the maximum speed is usually above 100		
M8018 I120
; ==================================
; The following two parameters are closely related to the compatibility with Replicator / Makerware software.
; Maximum unwinding speed supported in mm / s. When it is 0, it means the same as E maximum speed.
; By default, the Makerware double-head section is very slow, and the withdrawal time is very long.
M8019 I50
; ==================================
; Ejection length unit is mm, if you don't plan to be compatible with this kind of software, you can leave it alone
; Withdrawal distance. If the drawback is too small, it will leak, if the drawback is too large, the pause time is too long, and it is easy to leak.
; Please set reasonably according to your feed type and extrusion head type.
M 8020 S1.5
; ==================================
; The makerware software switches the length of the exit wire when extruding the head.
; The makerware slice designation is very long, and it is easy to jam when it is squeezed back.
; If zero, follow slice software settings
M8033 S0
; ==================================
;
; Set the default consumable diameter used by the machine, the unit is mm
; Diameter
M8021 S1.75
; ==================================
; The maximum temperature supported by the extrusion head. This temperature is set to prevent the user from accidentally operating the extrusion head temperature and causing damage to the extrusion head.
; The thermal resistance can only reach 260 degrees, and the peek tube also starts to soften at about 260 degrees.
; Extrusion head maximum temperature
M8022 I275
; ==================================
;
; [Consumable interface, the minimum temperature of the wire]
; Consumables interface, minimum temperature required to extrude consumables
M8022 T170
; ==================================
;
; Maximum temperature of hot bed
; The maximum temperature of the hot plate
M8023 I100
; ==================================
; Temperature error detection is prohibited. It is strongly recommended not to disable this function. The default temperature error detection is when the temperature sensor is not plugged in or warning when the heating power is too low.
; 0: Enable temperature detection   
; 1:Prohibition of wrong temperature detection of extrusion head and hot bed
; 2:Only temperature error detection on hot beds is prohibited 
M8023 T0
; ==================================
; X, Y, Z maximum stroke, please set according to the actual printing size, the unit is mm [Please be careful to set this parameter] If the setting is too small, printing beyond the set stroke is not possible. If the setting is too large, if the slice movement instruction exceeds the actual machine stroke, it will not limit and will force the motor to crash. X maximum stroke, in the case of LCD-enabled sound, movement beyond the stroke will cause the buzzer to sound
M8024 I330
; ==================================
;
; Maximum Y travel
M8025 I330
; ==================================
;
; Maximum Z travel
M8026 I400
; ==================================
;
; Set the number of extrusion heads, at least 1. Currently, the default motherboard is 1.
; Configure the number of extrusion heads
M8027 I1
; ==================================
; [Whether a heating rod and a temperature sensor are shared], a temperature sensor is shared under the condition of multiple nozzles or three nozzles,
; 0:Non-multiple-in, one-out
; 1:One more in
M8027  S0
; ==================================
; [Special features of multiple Y or multiple Z];
; The second extrusion head is used as Z. Some large machines require two Z axes, so E2 can be used as the Z axis. This command will force the number of extrusion heads to 1.
;M8027  Z0	;If you enable this function,';'Remove, to disable this function, use';'Just comment it out,
; ==================================
; 0: Double Z double limit mode, the second limit is connected to Z +, 
; 1£º Double Z single limit mode, only one limit switch needs to be connected 
; 3: Three Z mode, two other Z connection expansion ports
; Use the second extrusion head as Y
;M8027  Y0	;If you enable this function,';'Remove, to disable this function, use';'Just comment it out
; ==================================
;Use the second extrusion head as the first extrusion
;M8027  E0	;If you enable this function,';'Remove, to disable this function, use';'Just comment it out
; ==================================
; Some machines may wish to ban hot beds, possibly by using this directive
; 0£ºNo hot bed
; 1£ºEnable Hot Bed   
M8027 T1
; ==================================
; Advanced Settings
; Backlash compensation, machine, after extrusion, because of the elastic effect, it will actually retract a little bit from the original position.
; If you don¡¯t understand, it will be zero.
M8028 S1.60
; ==================================
; Limit switch structure type, the limit switch is connected to the default 3 limit interfaces on the motherboard
; 0: Unilateral zero limit (front left), such as mendel, i3 ...  1: Unilateral maximum point limit (rear right), such as makerbot
; 3: Rear left limit (rarely)             4£ºRight front limit (rarely)
M8029 I0
; ==================================
;[XYZ limit switch wiring type] If this configuration is wrong, when the motor is operated in the manual interface, the motor will not be able to move in a certain direction and the buzzer will make a dripping sound.
; In addition, the short-circuit cap next to the Filament seat is used to select the limit voltage (3.3 / 5V), and it must not be left floating.     0: Limit switch normally open (unrestricted
; (When the-and s voltages are high, the limit is low)      1: Limit switch normally closed (-and s voltage are low level when not limited, high level when limited)
M8029 T0
; ==================================
; [Z-axis limit switch position]
; 0£ºWhen the extrusion head is closest to the platform, the limit is connected to Z-
; 1£ºWhen the extrusion head is farthest from the platform, the limit is connected, and the limit is connected to Z +
M8029 S0
; ==================================
; [Whether the XYZ axis returns to (0,0,0), only for XYZ or hbot models]
; 0: Back to XYZ (0,0,0) position, that is, the extrusion head returns to the front left position of the platform;   
; 1: Stay in limit position
M8029 C0
; ==================================
; [Enable material cut detection] The material cut limit is connected to the limit of FILAMENT
; 0:Prohibit material detection       
; 1:Enable material detection
M8029 D1
; ==================================
; FILAMENT limit configuration at the beginning, when the material cutout detection function is not enabled, Delta models automatically level the limit switch connected to the top,  
; Usually the limit is always in the disabled state, even if the switch is triggered, it will not cause the beep sound of the buzzer.
; 1: Same as XYZ limit type       -1: Opposite XYZ limit type 
M8029 P-1
; ==================================
;[Nozzle fan control] This fan dissipates heat to the model. It is recommended to set the fan to turn on and off by the slicing software.
; >0: If you need to force the extruder to turn on the fan automatically when the temperature is greater than a certain temperature, set a temperature greater than 0.
; 0: If set to 0, fan start is controlled by slicing software
M8030 I0
; ==================================
;[Throat fan control]¡¾M8030 I0 T-1 ¡¿
; This fan dissipates the nozzle throat. The self-starting temperature must be set after the M8030 I0 command. The parameter after I indicates the temperature.
; When it is 0, it means that the motherboard fan will not change with temperature, otherwise the fan will turn on when the temperature of the extrusion head reaches the specified temperature
M8030 I50 T-1
; ==================================
;[Set the offset of the second extrusion head from the first extrusion head] The unit is mm. If it is a single head, the following two parameters are invalid. The double head offset in cura is set to 0.
;M8031	S35.0	;X-direction offset (left and right)
;M8032	S0	;Offset in Y direction (front and back)
;
; ==================================
;[Set the offset of the third extrusion head (left or right extrusion head)] The unit is mm. This parameter is only used for the three nozzles and shares a heating and temperature sensor. It is valid under the circumstances.
;M8031	D-35.0	;X-direction offset (left and right)
;M8032	D0	;Offset in Y direction (front and back)
; ==================================
; Does the SD card support the display of folders
; 0: Not supported 
; 1: Supported
M8034 I1
; ==================================
; Leveling related settings, up to 5 points can be taken, X, Y are floating point numbers, the unit is mm
; If X and Y are both less than 1, it indicates the ratio of the relative stroke, otherwise it is expressed as the absolute coordinate value of X and Y
; Number of leveling points
M8035 I7
; ==================================
;;;;;;;;;;;;;;Leveling points,
;;;;;;;;;;;;;;;;;;;;;;;;;;First three parameters with auto-leveling
M8036 X10 Y10;The first point represents the XY offset of the sensor from the extrusion nozzle,
M8036 X60 Y50;The second point represents the minimum position of the pick point
M8036 X300 Y300;The third point represents the maximum position of the pick point
;;;;;;;;;;;;;;;;;;;;;;;;The last four are manual leveling points.
M8036	X60 Y300	;Left-Back
M8036	X300 Y300       ;R.R.
M8036	X60 Y50		;left top
M8036	X300 Y50       ;Right-Front
; ==================================
;;;;;;;;;;;;;;;;;;;;;Added parameters for automatic leveling;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
M8038 X4 ; Number of points in X direction  Max is 7
M8038 Y4 ; Number of points in Y direction 	Max is 7
; ==================================
; Machine type:
; 0: XYZ ordinary type  
; 2: Hbot type
M8080 I2
; ==================================
; [Thermal resistance type]   For the thermal resistance, the thermal resistance of the same parameter is actually slightly different. The different thermal resistances are relatively close at low temperature, and at high temperature,
; The displayed temperature difference can reach 40 degrees. If it is a thermistor, be sure to set the correct thermal resistance type.     0: Ideal NTC 100K 1% 3950 B.
; 1: K-type thermocouple.            2: EPCOS NTC 100K 1% 3950 B, corresponding to Marlin's sensor type 2 
; 
M8081 I2
; ==================================
; Enable leveling, [If this function is enabled, please tick in the front box below and enter the parameters in the back box] 
; 0: Disable leveling enable 
; 1: Allow leveling enable On the delta interface, you can enable it through the interface,
M8083 I1
; ==================================
;[The angle when the servo is stowed and the angle when it is leveled down], it is only effective when the auto enable leveling is supported. For detailed documents, please search for "steering gear" in Chitu Help Center
;M8083 D0 P0 ;D is connected with the servo retracted angle, P is connected with the servo lowered angle. If the two angles are the same, it is regarded as not requiring the servo support.
;The angle that a specific steering gear can reach is determined by the specific steering gear. For a 180-degree rotation steering gear, our measured range is between -85-105 degrees.
; ==================================
;[Delta machine or XYZ machine with automatic leveling] The height difference of the Z leveling limit = Z position of the leveling limit-Z zero position, if the photoelectric leveling limit is usually a positive value
; If the head is squeezed out of the motherboard at the limit, it is negative.  0: Offset is forbidden. The stroke of Z is set to "Z". The printed gcode does not need to add an auto-leveling instruction.
; Use this mode.  Non-0: The current position of Z is automatically determined when the leveling limit is triggered. Under the DELTA structure, the G29 automatic leveling command must be connected after G28 returns to zero and before the print command.
M8084 Z4
; ==================================
;
; Logo time
; Boot logo duration, minimum 100ms, maximum 6000ms
M8085 I100
; ==================================
;[Screen saver time]
M8085 T0	;How long does it wait to enter the screen saver interface, the unit is second (s), when 0 means the screen saver is disabled

;[Standby shutdown function, need to cooperate with the shutdown function module]
M8085 P0	;How long will the machine shut down, this function can only use some settings after the settings of the shutdown function module are installed,
;		 The unit is second (s). When it is 0, it means that the standby shutdown function is disabled.
; ==================================

M8086 I1
;[Advanced configuration, no need to move in most cases]
;[External drive settings]
M8087 T12000 I0	      ;Pulse configuration for xy, all zero
M8087 Z180000		;z Independent pulse width in ns
; ==================================
;M8087 I0 T14200	;I: Settling time from direction signal valid to high level of pulse signal, unit is ns
;		 T: minimum hold time of pulse signal, unit is ns ,If there is no external drive control board, set them to zero.
;Several external drive parameters:THB7128:I100000 T0 ;;;;TB6560:I40000 T0  ;;;TB6600:I100000 T0
; ==================================
; The pwm ratio of the motherboard fan when it is turned on is up to 256. Some motherboard fans have stronger wind and higher noise.
; You can change the fan wind and noise through this parameter
M8489 I256
; ==================================
;
; In the interface of loading consumables, the feeding speed of consumables is loaded in mm / s.
; The wire feeding speed is too fast, and the wire cannot be fed in time, which causes the extruder to stop and move out of step.
M8489 T3
; ==================================
; Whether to force shut down all motors and heating after printing is completed
; 0:Close all    
; 1:Does not work after printing, fully obeys gcode instructions
M8489 P0
; ==================================
; PID parameter setting of temperature, [M301 P22.2 I1.08 D114]
; If you are not an expert and your current temperature control is relatively stable, you do not need to change this parameter.
;[If this function is enabled, please tick in the front box below and enter the parameters in the back box] 
M301 P22.2 I1.08 D114
; ==================================
; Automatically modulate the PID command, this command will block for a long time   ¡¾M303 E0 S150 C5¡¿
; The temperature is 150 degrees, and the automatic periodic shock is 4 times. The parameters after the automatic modulation may be seen through the repetier-host.
;[If this function is enabled, please tick in the front box below and enter the parameters in the back box] 
;M303 E0 S150 C5
; ==================================
;
; 0: The related configuration of laser engraving is not supported, the related function is to set the speed in the more button
; 1: Related configurations for laser engraving  
M8520 I0
; ==================================
;¡¾¡¾¡¾¡¾¡¾¡¾¡¾¡¾¡¾Save the parameters¡¿¡¿¡¿¡¿¡¿¡¿¡¿¡¿
; This parameter must be included, otherwise the parameters cannot be saved to the device
; Parameter default configuration cannot be modified
M8500

