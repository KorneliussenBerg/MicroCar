with MicroBit.Console; use MicroBit.Console;
with MotorPackage;
with UltrasonicPackage;

procedure Main is
begin
   Put_Line (" <-- Starting up...");

   -- Initialiser taskene for motorstyring og sensoroppdatering
   MotorPackage.Initialize;
   UltrasonicPackage.Initialize;

   -- Hovedløkken (ingen ytterligere handlinger er nødvendig her)
   loop
      delay 1.0;  -- Holder hovedløkken i gang, men uten videre logikk
   end loop;
end Main;
