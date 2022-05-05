LETTERS = ('a'..'z').to_a

def decrypt(char)
  original_idx = LETTERS.index(char.downcase)
  LETTERS[(original_idx + 13) % 26].dup
end

def upcase?(char)
  char.upcase == char
end

def rot13(string)
  decrypted = ''

  string.chars.each do |char|
    if LETTERS.include?(char.downcase)
      new_char = decrypt(char)
      new_char.upcase! if upcase?(char)

      decrypted << new_char
    else
      decrypted << char
    end
  end

  decrypted
end

p rot13('Nqn Ybirynpr')
p rot13('Tenpr Ubccre')
p rot13('Nqryr Tbyqfgvar')
p rot13('Nyna Ghevat')
p rot13('Puneyrf Onoontr')
p rot13('Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv')
p rot13('Wbua Ngnanfbss')
p rot13('Ybvf Unvog')
p rot13('Pynhqr Funaaba')
p rot13('Fgrir Wbof')
p rot13('Ovyy Tngrf')
p rot13('Gvz Orearef-Yrr')
p rot13('Fgrir Jbmavnx')
p rot13('Xbaenq Mhfr')
p rot13('Fve Nagbal Ubner')
p rot13('Zneiva Zvafxl')
p rot13('Lhxvuveb Zngfhzbgb')
p rot13('Unllvz Fybavzfxv')
p rot13('Tregehqr Oynapu')