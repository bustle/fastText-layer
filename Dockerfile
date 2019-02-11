FROM lambci/lambda:build-provided

ARG COMMIT_SHA

RUN git clone https://github.com/bustle/fastText /tmp/fastText && \
  cd /tmp/fastText && \
  git checkout $COMMIT_SHA && \
  make CXXFLAGS='-pthread -std=c++0x -march=corei7-avx -O3 -funroll-loops' && \
  mkdir -p /tmp/fastTextLayer/bin && \
  mv /tmp/fastText/fasttext /tmp/fastTextLayer/bin/ && \
  cd /tmp/fastTextLayer && \
  zip -yr /tmp/fastText.zip bin
