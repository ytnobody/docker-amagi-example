FROM ytnobody/amagi
MAINTAINER ytnobody <ytnobody@gmail.com>
ADD app.psgi app.psgi
EXPOSE 7333
CMD plackup -p 7333
