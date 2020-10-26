function out = ButterMag(w)
    global const;
    out = 1./sqrt(1 + (w.*const.Part1.Res*eval(const.Part1.Cap)));
end