package body Progress_Indicators.Spinners is

    function Make (Ticks_Per_Move : Positive) return Spinner is
    begin
        return (Ticks_Per_Move => Ticks_Per_Move, Ticks => 0, State => 0);
    end Make;

    function Value (S : Spinner) return Character is (Spinner_States (S.State));

    procedure Tick (S : in out Spinner) is
    begin
        S.Ticks := (S.Ticks + 1) mod S.Ticks_Per_Move;
        if S.Ticks = 0 then
            S.State := S.State + 1;
        end if;
    end Tick;

end Progress_Indicators.Spinners;
