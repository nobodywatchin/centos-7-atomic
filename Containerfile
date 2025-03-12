FROM quay.io/centos/centos:centos7

### MODIFICATIONS
## make modifications desired in your image and install packages by modifying the build.sh script
## the following RUN directive does all the things required to run "build.sh" as recommended.

# Download each .repo file from the GitHub repository and save it to /etc/yum.repos.d/
RUN curl -L -o /etc/yum.repos.d/CentOS-Base.repo https://raw.githubusercontent.com/tkne/centos-7-repo/master/CentOS-Base.repo \
    && curl -L -o /etc/yum.repos.d/CentOS-CR.repo https://raw.githubusercontent.com/tkne/centos-7-repo/master/CentOS-CR.repo \
    && curl -L -o /etc/yum.repos.d/CentOS-Debuginfo.repo https://raw.githubusercontent.com/tkne/centos-7-repo/master/CentOS-Debuginfo.repo \
    && curl -L -o /etc/yum.repos.d/CentOS-Media.repo https://raw.githubusercontent.com/tkne/centos-7-repo/master/CentOS-Media.repo \
    && curl -L -o /etc/yum.repos.d/CentOS-Sources.repo https://raw.githubusercontent.com/tkne/centos-7-repo/master/CentOS-Sources.repo \
    && curl -L -o /etc/yum.repos.d/CentOS-Vault.repo https://raw.githubusercontent.com/tkne/centos-7-repo/master/CentOS-Vault.repo \
    && curl -L -o /etc/yum.repos.d/CentOS-fasttrack.repo https://raw.githubusercontent.com/tkne/centos-7-repo/master/CentOS-fasttrack.repo \
    && curl -L -o /etc/yum.repos.d/CentOS-x86_64-kernel.repo https://raw.githubusercontent.com/tkne/centos-7-repo/master/CentOS-x86_64-kernel.repo \
    && curl -L -o /etc/yum.repos.d/epel-testing.repo https://raw.githubusercontent.com/tkne/centos-7-repo/master/epel-testing.repo \
    && curl -L -o /etc/yum.repos.d/epel.repo https://raw.githubusercontent.com/tkne/centos-7-repo/master/epel.repo

# Copy build.sh to start installing packages
COPY build.sh /tmp/build.sh

RUN mkdir -p /var/lib/alternatives && \
    /tmp/build.sh && \
    ostree container commit
    
