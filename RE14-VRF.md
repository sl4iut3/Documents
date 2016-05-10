
# RE 14 - VRF

## Introduction

idée reprise du document http://www.packetu.com/2012/07/12/vrfing-101-understing-vrf-basics/

## Topologie physique

                                      192.168.1.2 +----+
                              +-----------------  | R2 |
                              | vlan2       fa0/1 +----+
    fa0/1 +----+    trunk    S
    ----- | R1 |------------ W
      10. +----+  fa0/0      I
      23.       192.168.1.1  | 
      0.                     |        192.168.1.2 +----+
      88.                    +- ----------------  | R3 |
                                vlan3       fa0/1 +----+
         
## Config basique routeur R3         

après un *en*, *conf t*:

    int fa 0/1
    no shutdown
    ip addr 192.168.1.1 255.255.255.0


## Config moins basique routeur R2         

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
    
## Config routeur R1         

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

## Tests

### depuis R1

    ping vrf red 192.168.1.2    # ping sur R2
    ping vrf blue 192.168.1.2   # ping sur R3
    
### depuis R3

    ping 192.168.1.1    # ping sur R1, sans connaissance de VRF

### depuis R2

    ping vrf red 192.168.1.1    # ping sur R1 en connaissant la VRF
    ping 192.168.1.1            # ping sur R1, sans VRF (ne fct pas, normal)
    
## config complètes

    version 12.4
    service timestamps debug datetime msec
    service timestamps log datetime msec
    no service password-encryption
    !
    hostname R2
    !
    boot-start-marker
    boot-end-marker
    !
    !
    no aaa new-model
    memory-size iomem 5
    ip cef
!
!
!
    !
    ip vrf red
    !
    multilink bundle-name authenticated
!
!
voice-card 0
!
!
!
!
!
!
!
!
!
!
!
!
!
!
!
!
!
!
!
archive   
 log config
  hidekeys
!
!
!
!
!
!
interface FastEthernet0/0
 ip address 10.10.10.254 255.255.255.0
 duplex auto
 speed auto
!
interface FastEthernet0/1
 ip vrf forwarding red
 ip address 192.168.1.2 255.255.255.0
 duplex auto
 speed auto
!
interface Serial0/1/0
 no ip address
 shutdown
 clock rate 125000
!
interface Serial0/1/1
 no ip address
 shutdown
 clock rate 125000
!
router ospf 150 vrf red
 log-adjacency-changes
 redistribute connected subnets
 network 192.168.1.0 0.0.0.255 area 1
!
ip route vrf red 0.0.0.0 0.0.0.0 192.168.1.1
!
!
ip http server
no ip http secure-server
!
!
!
!
control-plane
!
!         
!
!
!
!
!
!
!
line con 0
line aux 0
line vty 0 4
 login
!
scheduler allocate 20000 1000
end

    

