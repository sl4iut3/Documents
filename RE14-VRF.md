
# RE 14 - VRF

## introduction

idée reprise du document http://www.packetu.com/2012/07/12/vrfing-101-understing-vrf-basics/

## topologie physique

                                      192.168.1.2 +----+
                              +-----------------  | R2 |
                              | vlan2       fa0/1 +----+
    fa0/1 +----+    trunk    s
  ------- | R1 |------------ w
      10. +----+  fa0/0      i
      23.       192.168.1.1  | 
      0.                     |        192.168.1.2 +----+
      88.                    +- ----------------  | R3 |
                                vlan3       fa0/1 +----+
         
## config basique routeur R3         

après un *en*, *conf t*:

    int fa 0/1
    no shutdown
    ip addr 192.168.1.1 255.255.255.0


## config moins basique routeur R2         

après un *en*, *conf t*:

    ip vrf red
    int fa 0/1
    no shutdown
    ip vrf forwarding red
    ip addr 192.168.1.1 255.255.255.0
    int fa 0/0 
    no shutdown
    ip addr 10.10.10.254 255.255.255.0
    
    ! config routeur ospf (fct pas bien....)
    router ospf vrf red
    network 192.168.1.0 0.0.0.255 area 1
    redistribute connected
    
## config routeur R1         

après un *en*, *conf t*:

    ip vrf red
    ip vrf blue
    
    int fa 0/0
    no shutdown
    no ip addr
    int fa 0/0.1
    ip vrf forwarding red
    encap dot1q 2
    ip addr 192.168.1.1 255.255.255.0

    int fa 0/0.2
    ip vrf forwarding blue
    encap dot1q 3
    ip addr 192.168.1.1 255.255.255.0

