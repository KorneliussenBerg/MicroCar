package body ObjectClosePkg is
   protected body ObjectClose is

      procedure Set_Obstacle_Status (Status : Obstacle_Status) is
      begin
         Current_Status := Status;
      end Set_Obstacle_Status;

      function Get_Obstacle_Status return Obstacle_Status is
      begin
         return Current_Status;
      end Get_Obstacle_Status;

   end ObjectClose;
end ObjectClosePkg;
