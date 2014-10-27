/*2014-10-17 14:38:54 */
* Jessica mentioned on Wednesday that, the sections grew from A-K to A-L.

* Purpose: this script tries to answer the "section evolution problem".

clear all
capture log close
global pwd `"c:/noda/stata"'
global dta_raw "$pwd/data/raw"
global csv_dir "$pwd/../python/tables_raw"
log using "$log/00_convert_table_csv_to_dta.log", replace

use 
