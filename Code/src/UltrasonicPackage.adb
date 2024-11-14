with ObjectClosePkg; use ObjectClosePkg;
with MicroBit.Types; use MicroBit.Types;
with MicroBit.Ultrasonic;
with Ada.Real_Time; use Ada.Real_Time;
with Ada.Text_IO; use Ada.Text_IO;
with MicroBit; use MicroBit;

package body UltrasonicPackage is

   Sensor_Period : constant Time_Span := Milliseconds(100);
   Min_Distance : constant Distance_cm := Distance_cm(30.0);  -- Definerer Min_Distance

   package Right_Sensor is new MicroBit.Ultrasonic
     (Trigger_Pin => MB_P0, Echo_Pin => MB_P1);

   package Left_Sensor is new MicroBit.Ultrasonic
     (Trigger_Pin => MB_P2, Echo_Pin => MB_P8);

   task Sensor_Task;

   procedure Initialize is
   begin
      null;
   end Initialize;

   task body Sensor_Task is
      Next_Activation : Time := Clock;
   begin
      loop
         Check_Distances;

         -- Vent til neste måling
         Next_Activation := Next_Activation + Sensor_Period;
         delay until Next_Activation;
      end loop;
   end Sensor_Task;

  procedure Check_Distances is
   Right_Distance : Distance_cm := Get_Right_Distance;
   Left_Distance  : Distance_cm := Get_Left_Distance;
begin
   -- Bestem status basert på avstandene
   if Left_Distance < Min_Distance then
      ObjectClose.Set_Obstacle_Status(Obstacle_Left);
   elsif Right_Distance < Min_Distance then
      ObjectClose.Set_Obstacle_Status(Obstacle_Right);
   else
      ObjectClose.Set_Obstacle_Status(No_Obstacle);
   end if;
end Check_Distances;


   function Get_Right_Distance return Distance_cm is
   begin
      return Right_Sensor.Read;
   end Get_Right_Distance;

   function Get_Left_Distance return Distance_cm is
   begin
      return Left_Sensor.Read;
   end Get_Left_Distance;

end UltrasonicPackage;
