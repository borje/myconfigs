## Usage: histrogram [fieldnum]
##
## Produces a console-friendly histogram of piped input data.
##
## By default, the input data will be grouped based on the first field.
## You can optionally specify a space-separated field number.
## This function honours strings with spaces encapsulated by double quotes
##
## eg. sudo cat /var/log/httpd/access.log | histrogram
## eg. sudo cat /var/log/nginx/access.log | histrogram 7
##
function histrogram() {  
  field=1
  if [ ! -z "$1" ]; then field=$1; fi

  # honour strings with spaces surrounded with double quotes
  awk -F\" '{OFS="\"";for(i=2;i<NF;i+=2)gsub(/ /,"_",$i);print}' | \
  awk -v field=$field -v width=$width -v padding=$padding '
    function max(arr, big) {
      big = 0;
      for (i in cat) {
        if (cat[i] > big) { big=cat[i]; }
      }
      return big
    }
    NF > 0 {
      cat[$field]++;
    }
    END {
      maxm = max(cat);
      for (i in cat) {
        scaled = 40 * cat[i] / maxm;
        printf "%-15.15s  [%8d]:", i, cat[i]
        for (i=0; i<scaled; i++) {
          printf "#";
        }
    printf "\n";
      }
    }
  ' | \
  sort -nrk3
}
