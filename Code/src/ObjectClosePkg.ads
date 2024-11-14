package ObjectClosePkg is
   -- Definerer status for hindringer
   type Obstacle_Status is (No_Obstacle, Obstacle_Right, Obstacle_Left); --Obstacle_Both kan legges til, men skapte kluss

   -- Beskyttet objekt for å holde Too_Close-status
   protected ObjectClose is
      procedure Set_Obstacle_Status (Status : Obstacle_Status);
      function Get_Obstacle_Status return Obstacle_Status;
   private
      Current_Status : Obstacle_Status := No_Obstacle;
   end ObjectClose;
end ObjectClosePkg;
