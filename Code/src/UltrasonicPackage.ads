with MicroBit.Types; use MicroBit.Types;  -- Gjør Distance_cm tilgjengelig

package UltrasonicPackage is
   -- Start tasken for kontinuerlig oppdatering av Too_Close-status
   procedure Initialize;

private
   -- Prosedyre for å sjekke og oppdatere Too_Close-status
   procedure Check_Distances;

   -- Funksjoner for å hente avstand fra høyre og venstre sensor
   function Get_Right_Distance return Distance_cm;
   function Get_Left_Distance return Distance_cm;

end UltrasonicPackage;
