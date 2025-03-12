FROM quay.io/centos/centos:centos7

### MODIFICATIONS
## make modifications desired in your image and install packages by modifying the build.sh script
## the following RUN directive does all the things required to run "build.sh" as recommended.

# Clone the GitHub repository containing the working repo files
RUN git clone https://github.com/tkne/centos-7-repo.git /tmp/centos-7-repo

# Copy all the .repo files from the cloned repository to /etc/yum.repos.d
COPY /tmp/centos-7-repo/*.repo /etc/yum.repos.d/

# Clean up the cloned repo to reduce image size
RUN rm -rf /tmp/centos-7-repo

# Copy build.sh to start installing packages
COPY build.sh /tmp/build.sh

RUN mkdir -p /var/lib/alternatives && \
    /tmp/build.sh && \
    ostree container commit
    
