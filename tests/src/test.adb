with Ada.Text_IO;

with Progress_Indicators.Bars;
with Progress_Indicators.Spinners;

procedure Test is
    use Progress_Indicators.Spinners;
    use Progress_Indicators.Bars;

    S : Spinner := Make;

    Bar_Widths : constant array (Natural range <>) of Natural := (100, 50, 10, 5, 0);
begin
    for Width of Bar_Widths loop
        for I in Percentage'(0) .. 100 loop
            delay 0.02;
            Ada.Text_IO.Put (Get_Bar (I, Width));
        end loop;
        Ada.Text_IO.New_Line;
    end loop;

    for I in 1 .. 100 loop
        delay 0.02;
        Tick (S);
        Ada.Text_IO.Put (Value (S));
    end loop;
end Test;
