import duckdb, glob, os

for f in sorted(glob.glob("data/raw/*.csv")):
    rel = duckdb.sql(f"SELECT * FROM read_csv_auto('{f}')")
    rows = duckdb.sql(f"SELECT COUNT(*) FROM read_csv_auto('{f}')").fetchone()[0]
    print(f"{os.path.basename(f):50} rows={rows:>9,}  cols={len(rel.columns)}")