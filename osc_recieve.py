from oscpy.server import OSCThreadServer
from time import sleep

print("Starting")

def callback(*values):
    print("got values: {}".format(values))

osc = OSCThreadServer()
sock = osc.listen(address='127.0.0.1', port=8000, default=True)
osc.bind(b'/hello/world', callback, sock)
sleep(5000)
osc.stop()
