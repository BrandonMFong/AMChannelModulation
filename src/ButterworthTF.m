function out = ButterworthTF(w)
    global const;
    out = 1./(1 + 1j*w.*sqrt(2)*const.Part1.Res*(eval(const.Part1.Cap)) - (w.*const.Part1.Res*(eval(const.Part1.Cap))).^2);
end