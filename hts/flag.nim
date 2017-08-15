import "hts_concat"

type
  Flag* = distinct uint16


# Q: better way to implement these for distinct types?
proc `and`*(f: Flag, o: uint16): uint16 =
  return uint16(f) and o

proc `and`*(f: Flag, o: Flag): uint16 =
  return uint16(f) and uint16(o)

proc `or`*(f: Flag, o: uint16): uint16 =
  return uint16(f) or o

proc `==`*(f: Flag, o: Flag): bool =
  return uint16(f) == uint16(o)

proc `==`*(f: Flag, o: uint16): bool =
  return uint16(f) == o

proc `==`*(o: uint16, f: Flag): bool =
  return uint16(f) == o

proc has_flag*(f: Flag, o: uint16): bool =
  return (f and o) != 0

proc pair*(f: Flag): bool =
  return f.has_flag(BAM_FPAIRED)

proc proper_pair*(f: Flag): bool =
  return f.has_flag(BAM_FPROPER_PAIR)

proc unmapped*(f: Flag): bool =
  return f.has_flag(BAM_FUNMAP)

proc mate_unmapped*(f: Flag): bool =
  return f.has_flag(BAM_FMUNMAP)

proc reverse*(f: Flag): bool =
  return f.has_flag(BAM_FREVERSE)

proc mate_reverse*(f: Flag): bool =
  return f.has_flag(BAM_FMREVERSE)

proc read1*(f: Flag): bool =
  return f.has_flag(BAM_FREAD1)

proc read2*(f: Flag): bool =
  return f.has_flag(BAM_FREAD2)

proc secondary*(f: Flag): bool =
  return f.has_flag(BAM_FSECONDARY)

proc qcfail*(f: Flag): bool =
  return f.has_flag(BAM_FQCFAIL)

proc dup*(f: Flag): bool =
  return f.has_flag(BAM_FDUP)

proc supplementary*(f: Flag): bool =
  return f.has_flag(BAM_FSUPPLEMENTARY)
