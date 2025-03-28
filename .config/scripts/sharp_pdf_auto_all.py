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
    # skip duplicate files
    kassaslut = ([x for x in kassaslut if not re.search(r"\([0-9]+\)", x)])
    varuspec = ([x for x in varuspec if not re.search(r"\([0-9]+\)", x)])
    # some files have been removed, need to sort them in order by date
    kassaslut.sort()
    varuspec.sort()
    # do we have equal amounts of items?
    assert len(kassaslut) == len(varuspec), f"Number of files did not match {kassaslut}{varuspec}"
    items = zip(kassaslut,varuspec)
    for item in items:
        k = item[0]
        v = item[1]
        print(f"Trying to merge {k} and {v}" )
        reader_k = pypdf.PdfReader(k)
        reader_v = pypdf.PdfReader(v)
        v_date_parts = reader_v.pages[0].extract_text()[150:240].split("\n")[1] # FIXME: This bad boy may fail horribly for some user within the POS, but tried a short user (i.e. 4 chars) and a long user (12 chars)
        actual_pos_v_start = (v_date_parts.split(" ")[3])
        actual_pos_v_end = (v_date_parts.split(" ")[5])
        assert actual_pos_v_start == actual_pos_v_end, f"Wrong file {v}! This is a file for weekly summaries"
        actual_pos_k = reader_k.pages[0].extract_text()[10:20]
        try:
            actual_pos_k_parsed = datetime.datetime.strptime(actual_pos_k, "%Y-%m-%d")
            actual_pos_v_parsed = datetime.datetime.strptime(actual_pos_v_start, "%Y-%m-%d")
        except:
            continue
        assert actual_pos_v_parsed == actual_pos_k_parsed, f"Files did not have matching dates ({k}, {v})"
        reader_k.close()
        reader_v.close()
        merger = pypdf.PdfWriter()
        merger.append(k)
        merger.append(v)
        merger.write(f"Sharprapport - {actual_pos_k_parsed.strftime('%y%m%d')} Sammanslagen.pdf")
        merger.close()
        print(f"Merged {k} and {v}")

if __name__ == "__main__":
    main()
