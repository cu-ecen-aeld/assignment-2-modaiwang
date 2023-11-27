// syslog
#include<syslog.h>
// open
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
// errno
#include<errno.h>
#include<string.h>
// write
#include<unistd.h>
//exit
#include<stdlib.h>

int main(int argc,char *argv[]){
    openlog("modai-finder-app",LOG_CONS,LOG_USER);
    if (argc<3)
    {
        syslog(LOG_ERR,"Not Enough Arguments.");
        exit(1);
    }
    char *Path = argv[1];
    char *Str = argv[2];

    int fd = open(Path,O_CREAT|O_WRONLY,S_IRWXG|S_IRWXU|S_IRWXO);
    if (fd==-1)
    {
        syslog(LOG_ERR,"File create/open occurs error, errmsg:%m");
        exit(1);
    }
    ssize_t len = strlen(Str);
    ssize_t ret;
    while (len!=0 && (ret=write(fd,Str,len))!=0)
    {
        if(ret==-1){
            if (errno==EINTR)
            {
                continue;
            }
            syslog(LOG_ERR,"Can not write into file");
            close(fd);
            exit(1);
            break;
            
        }
        len -=ret;
        Str +=ret;
    }
    if(fd!=-1){
        fsync(fd);
        close(fd);
    }
    
}
