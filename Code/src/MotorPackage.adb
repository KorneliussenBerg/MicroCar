with ObjectClosePkg; use ObjectClosePkg;
with Ada.Real_Time; use Ada.Real_Time;

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
               Drive(Stop);
               delay 0.2;
               Drive(Rotating_Left);  -- Sving til venstre hvis hindring på høyre side
               delay 0.5;

            when Obstacle_Left =>
               Drive(Stop);
               delay 0.2;
               Drive(Rotating_Right);  -- Sving til høyre hvis hindring på venstre side
               delay 0.5;

            --when Obstacle_Both =>
               -- Drive(Stop);           -- Stopp og roter
               -- delay 0.5;
               -- Drive(Rotating_Left);  -- Snur rundt ved å rotere til venstre

            when No_Obstacle =>
               Drive(Forward);        -- Kjør fremover hvis ingen hindringer
         end case;

         Next_Activation := Next_Activation + Motor_Period;
         delay until Next_Activation;
      end loop;
   end Motor_Task;

end MotorPackage;
