FROM microsoft/azure-cli:2.0.61

RUN apk --update add libc6-compat ca-certificates
ENV TMPDIR /tmp
ENV BINDIR /usr/bin

RUN wget -O ${TMPDIR}/azcopy.tgz https://aka.ms/downloadazcopy-v10-linux && \
    tar -xvf ${TMPDIR}/azcopy.tgz --strip-components=1 \
    $(tar tf ${TMPDIR}/azcopy.tgz | egrep -om1 "azcopy_linux_amd64_10.*\/azcopy") -C ${BINDIR}/ && \
    rm -f ${TMPDIR}/azcopy.tgz

CMD ["/bin/sh"]
