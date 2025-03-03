#!/usr/bin/env python3

import glob,re,sys
import datetime
import pypdf

def main():
    if (len(sys.argv) == 3):
        month = sys.argv[1]
        year = sys.argv[2]
    else:
        d_month = datetime.date.today().month - 1
        d_year = datetime.date.today().year
        month = f"{d_month:02}"
        year = f"{d_year-2000}"
    kassaslut = glob.glob(f"Kassaslut_{year}{month}*.pdf")
    varuspec = glob.glob(f"varuspecefikation_{year}{month}*.pdf")
    assert(len(kassaslut) == len(varuspec))
    items = zip(kassaslut,varuspec)
    for item in items:
        k = item[0]
        v = item[1]
        reader = pypdf.PdfReader(k)
        actual_pos = reader.pages[0].extract_text()[10:20]
        try:
            actual_pos_parsed = datetime.datetime.strptime(actual_pos, "%Y-%m-%d")
        except:
            continue
        merger = pypdf.PdfWriter()
        merger.append(k)
        merger.append(v)
        merger.write(f"Sharprapport - {actual_pos_parsed.strftime('%y%m%d')} Sammanslagen.pdf")
        merger.close()

if __name__ == "__main__":
    main()
