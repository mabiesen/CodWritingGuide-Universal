#Bash Script One-liners that Other Linux Users Have Found Helpful

##List Status of All Git Repos

```
 $ find ~ -name ".git" 2> /dev/null | sed 's/\/.git/\//g' | awk '{print "-------------------------\n\033[1;32mGit Repo:\033[0m " $1;system("git --git-dir="$1".git --work-tree="$1" status")}'

Explanation

    List all .git dirs
    Trim .git parts.
    Run git --git-dir=X.git --work-tree=X status with awk

```

##Clone All Repose

```
USER=foo; curl "https://api.github.com/users/$USER/repos?per_page=1000" | grep -o 'git@[^"]*' | xargs -L1 git clone
```

##Remove All .git References from Directory and All Subdirectories

```

alias nomoregit='find . -name .git -print0 | xargs -0 rm -rf'

created as alias in .bashrc file as this will likely be used often

```

##Test git archive before actually creating an archive // fake dry run

For archiving info:

https://git-scm.com/docs/git-archive

```
 $ git archive master some/project/subdir | tar t
 
 Explanation

git archive doesn't have a --dry-run flag, and it would be nice to see what files would be in the archive before actually creating it.

    git archive master some/project/subdir
    Create an archive from the master branch, with only a specified sub-directory of the project in it (instead of the entire repo)
    Note: without specifying a file, the archive is dumped to standard output
    tar t : the t flag of tar is to list the content of an archive. In this example the content comes from standard input (piped from the previous command)

```

##Create Git Archive
```
git archive master -o file.tar some/project/subdir
```


##Make Upward Directory Traversing Easy
```
$ upup(){ DEEP=$1; [ -z "${DEEP}" ] && { DEEP=1; }; for i in $(seq 1 ${DEEP}); do cd ../; done; }


Explanation

Include this function in your .bashrc and on the following line alias up='upup'

Now you are able to go back in your path simply with up $N. So, for example:

Z:~$ cd /var/lib/apache2/fastcgi/dynamic/

Z:/var/lib/apache2/fastcgi/dynamic$ up 2

Z:/var/lib/apache2$ up 3

Z:/$
```

##Ban All IP Addresses that Try To Access Your PHPMyadmin
```
$ grep "phpmyadmin" $path_to_access.log | grep -Po "^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}" | sort | uniq | xargs -I% sudo iptables -A INPUT -s % -j DROP 


Explanation

Cheap security bash one-liner to ban all IPs that are probably doing automated attacks.
Make sure your IP isn't listed before piping through iptables drop!!

    This will first find all lines in $path_to_access.log that have phpmyadmin in them,

    then grep out the ip address from the start of the line,

    then sort and unique them,

    then add a rule to drop them in iptables

Again, just edit in echo % at the end instead of the iptables command to make sure your IP isn't in there. Don't inadvertently ban your access to the server!
Limitations

You may need to change the grep part of the command if you're on mac or any system that doesn't have grep -P. I'm not sure if all systems start with xargs, so that might need to be installed too. It's super useful anyway if you do a lot of bash.

```

##Generate Sequence of Numbers
```
for ((i=1; i<=10; ++i)); do echo $i; done
```
##Generate Numbers with Leading Zeroes
```
echo {01..10} # 01 02 03 04 05 06 07 08 09 10


Explanation

While the original one-liner is indeed IMHO the canonical way to loop over numbers, the brace expansion syntax of bash 4.x has some kick-ass features such as correct padding of the number with leading zeros.

Limitations

Limited to bash (>=4.x).

```

##Find all files recursively with specified string in the filename and output any lines found containing a different string.
```
find . -name *conf* -exec grep -Hni 'matching_text' {} \; > matching_text.conf.list


Explanation

find . -name *conf* In current directory, recursively find all files with 'conf' in the filename.

-exec grep -Hni 'matching_text' {} \; When a file is found matching the find above, execute the grep command to find all lines within the file containing 'matching_text'.

    Here are what each of the grep switches do:

    grep -i ignore case.

    grep -H print the filename

    grep -n print the line number

> matching_text.conf.list Direct the grep output to a text file named 'matching_text.conf.list'

```

##Check For Files With Size Greater Than X
```
[[ $(find /path/to/file -type f -size +51200c 2>/dev/null) ]] && echo true || echo false

Explanation

    The find takes care two things at once: checks if file exists and size is greater than 51200.
    We redirect stderr to /dev/null to hide the error message if the file doesn't exist.
    The output of find will be non-blank if the file matched both conditions, otherwise it will be blank
    The [[ ... ]] evaluates to true or false if the output of find is non-blank or blank, respectively
    
    You can use this in if conditions like:
    
    if [[ $(find /path/to/file -type f -size +51200c 2>/dev/null) ]]; do
    somecmd
fi


```

##Check For Unexecutable Files
```
find /some/path -type f ! -perm -111 -ls

Explanation

The key is writing the parameter of -perm correctly. The value -111 means that all execution bits must be set: user and group and other too. By negating this pattern with ! we get files that miss any of the execution bits.
```

##MD5Sum Last Five Files in Folder
```
find /directory1/directory2/ -maxdepth 1 -type f | sort | tail -n 5 | xargs md5sum


Explanation

    find lists the files, no recursion, no directories, with full path
    sort list files alphabetically
    tail keep only the last 5 files
    xargs send the list as arguments to md5sum
    md5sum calculate the md5sum for each file

Limitations

Probably can't handle spaces in file or directory names.

```

##Check That Directory is Parent of Another Directory
```
is_parent() { [[ "$2" =~ ${1}['/'?] ]] && return 0 || return 1;}

Explanation

The function expanded would look like this :

T() {
    if [[ "$2" =~ ${1}['/'?] ]] ; then
        echo "$2 is child of $1"
        return 0
    else
        echo "$2 is NOT child of $1 ($?)"
        return 1
    fi
}
```

##Send File By Email As Attachment
```
uuencode /var/log/messages messages.txt | mailx -s "/var/log/messages on $HOST" me@example.com


Explanation

    uuencode /var/log/messages messages.txt -- the first parameter is the file to attach, the second is the filename to use for the attachment
    mailx -s subject emailaddress -- takes standard input as the content of the email

```

##Remove Files and Directories With Dates Older than Cerain Time
```
ls | grep '....-..-..-......' | xargs -I {} bash -c "[[ x{} < x$(date -d '3 days ago' +%Y-%m-%d-%H%M%S) ]] && rm -rfv {}"

Explanation

Suppose you have a backup directory with backup snapshots named by timestamp:   2013-05-03-103022 for example

You want to remove snapshots older than 3 days. The one-liner does it:

$ date
Tue May  7 13:50:57 KST 2013
$ ls | grep '....-..-..-......' | sort | xargs -I {} bash -c "[[ x{} < x$(date -d '3 days ago' +%Y-%m-%d-%H%M%S) ]] && rm -rfv {}"
removed directory: `2013-05-03-103022'
removed directory: `2013-05-04-103033'
```
##Get Only latest Version of File from Across Multiple Directories
```
find . -name 'filename' | xargs -r ls -tc | head -n1


Explanation

Shows latest file (by last modification of file status information) for the given pattern. So in this example filename = custlist*.xls.

We use ls to do the sorting (-t) and head to pick the top one. xargs is given the -r option so that ls isn't run if there is no match.
Limitations

The filesystem needs to support ctime. Does not depend on a consistent naming scheme.
```

##Get File Modification Date in Any Time Format
```
date -r /etc/motd +%Y%m%d_%H%M%S


Explanation

The -r flag is a shortcut of --reference and it is used to specify a reference file. Used in this way, the date command prints the last modification date of the specified file, instead of the current date.

The + controls the output format, for example:

    %Y = 4-digit year
    %m = 2-digit month
    %d = 2-digit day
    %H = 2-digit hour
    %M = 2-digit minutes
    %S = 2-digit seconds

So in this example +%Y%m%d_%H%M%S becomes 20121001_171233

You should be able to find all the possible format specifiers in man date.
Limitations

The default date command in Solaris does not support the --reference flag. Modern Solaris systems have the GNU tools installed, so you may be able to find the GNU implementation of date which supports this flag. Look for it in /usr/gnu/bin/date or /usr/local/bin/date, or do search the entire /usr with find /usr -name date.

In Solaris this may be a suitable substitute without using the date command:

ls -Ego /etc/motd | awk '{print $4 "_" $5}' | tr -d :- | sed -e 's/\..*//'

Or you can use good old perl:

perl -mPOSIX -e 'print POSIX::strftime("%Y%m%d_%H%M%S\n", localtime((stat("/etc/motd"))[9]))'

```

##Open a Specified URL in Browser
```
xdg-open http://www.example.com/
```

With special thanks to the collection at http://www.bashoneliners.com/
