with ObjectClosePkg; use ObjectClosePkg;
with MicroBit.MotorDriver; use MicroBit.MotorDriver;
with Ada.Real_Time; use Ada.Real_Time;
with Ada.Text_IO; use Ada.Text_IO;

package body MotorPackage is

   Motor_Period : constant Time_Span := Milliseconds(50);

   task Motor_Task;

   procedure Initialize is
   begin
      null;
   end Initialize;

   task body Motor_Task is
      Next_Activation : Time := Clock;
   begin
      loop
         case ObjectClose.Get_Obstacle_Status is
            when Obstacle_Right =>
               Drive(Rotating_Left);  -- Sving til venstre hvis hindring på høyre side
               delay 0.5;

            when Obstacle_Left =>
               Drive(Rotating_Right);  -- Sving til høyre hvis hindring på venstre side
               delay 0.5;

            when No_Obstacle =>
               Drive(Forward);         -- Kjør fremover hvis ingen hindringer
         end case;

         Put_Line("Motor_Task completed iteration");

         Next_Activation := Next_Activation + Motor_Period;
         delay until Next_Activation;
      end loop;
   end Motor_Task;

end MotorPackage;
