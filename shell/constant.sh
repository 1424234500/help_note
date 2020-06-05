
###########################################
# 常量集合
# 常用配置
###########################################
source tools.sh

_root=''
_roots=( '/mnt/d' '/mnt/e' '/home/walker' )
for ((i=0; i<${#_roots[@]}; i++))
do
    ddir=${_roots[$i]}
    if [ -d "$ddir" ]
    then
        _root=$ddir
        break
    fi
done
echo 'System root: '$_root

_help=$_root'/help_note'
_shell=$_root'/help_note/shell'
_python=$_root'/help_note/python'
_opencv=$_root'/help_note/python/opencv'
_server=$_root'/help_note/python/server'

_temp='constant.sh'   #临时变量 用于临时存储导入文件名

# log files
_nowday=$(date "+%Y-%m")     #2018-3-20 避免大量长期日志堆积大文件-%d
git_log=$_root'/logs/git.log' #$_nowday'.log'
server_python_socket_log=$_root'/logs/python.socket.log' #$_nowday'.log'  
server_python_web_log=$_root'/logs/python.web.log' #$_nowday'.log'
log_temp=$_root"/logs/do.log"

# touch make log files
toolsMakefile $git_log
toolsMakefile $log_temp
toolsMakefile $server_python_web_log
toolsMakefile $server_python_socket_log

# local filedirs
git_help_note=$_root'/help_note'
git_walker=$_root'/workspace/walker'
git_base=$_root'/workspace/base'
git_BaseSSM=$_root'/workspace/BaseSSM'
git_cc_old=$_root'/workspace/cc_old'
git_cc=$_root'/workspace/cc'
git_dd=$_root'/workspace/dd'
git_GraphicsTools=$_root'/workspace/GraphicsTools'
git_AngularApp=$_root'/workspace/AngularApp'

git_local_dirs=($git_help_note $git_walker $git_dd)
#git_local_dirs=($git_help_note $git_walker $git_BaseSSM $git_cc $git_GraphicsTools $git_AngularApp)
# $git_base 
#http://github.com/1424234500/help_note.git
#git@github.com:1424234500/walker.git
# remote urls
git_remote_help_note='git@github.com:1424234500/help_note.git'     #-> E:/ help_note   
git_remote_base='git@github.com:1424234500/base.git'           #-> E:/ workspqce_my/ * 
git_remote_BaseSSM='git@github.com:1424234500/BaseSSM.git'
git_remote_walker='git@github.com:1424234500/walker.git'
git_remote_cc_old='git@github.com:1424234500/cc_old.git'
git_remote_cc='git@github.com:1424234500/cc.git'
git_remote_dd='git@github.com:1424234500/dd.git'
git_remote_GraphicsTools='git@github.com:1424234500/GraphicsTools.git'
git_remote_AngularApp='git@github.com:1424234500/AngularApp.git'

git_remote_urls=($git_remote_help_note $git_remote_walker $git_remote_dd)
#git_remote_urls=($git_remote_help_note $git_remote_walker $git_remote_BaseSSM $git_remote_cc $git_remote_GraphicsTools $git_remote_AngularApp)
# $git_remote_base 

#echo $_root
#echo $_shell

# project_exefun clean <base>
function do_project_exefun(){ 
    #echo $#
    arg1=$2
    fun=$1
    if [ "$#" = "2" ]   #commit help
    then
        if [ "$arg1" = "help" ]   
        then
            $fun $git_help_note
        elif [ "$arg1" = "base" ]
        then
            # $fun $git_base
            $fun $git_BaseSSM
        elif [ "$arg1" = "cc" ]
        then
            $fun $git_cc
        fi
    else
        for ((i=0; i<${#git_local_dirs[@]}; i++))
        do
            local remoteDir=${git_remote_urls[$i]}
            local localDir=${git_local_dirs[$i]}
            $fun $localDir

        done
        # $fun $git_help_note
        # $fun $git_base
        # $fun $git_BaseSSM
        # $fun $git_cc
        # $fun $git_GraphicsTools
    fi 
}

 





