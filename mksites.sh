#!/bin/bash
###############################################################################
# Autor: Tronde (tronde(at)my-it-brain(dot)de) Datum: 2015-11-11
# Modified by: Collimas 2016-06-04
# Lizenz: GPLv3
#
# Beschreibung:
# Dieses Skript erstellt die Dateien site.conf und site.mk fuer die einzelnen
# Freifunk-Communities von Freifunk-Lippe.
###############################################################################

# Variablen ###################################################################
SITES1=(ex ff lip)
SITES2=(ad dt hb la)
SITES3=(kt le)
SITES4=(bs lh oe sc)
SSID1=(extertal Freifunk lippe)
SSID2=(augustdorf detmold hornbadmeinberg lage)
SSID3=(kalletal lemgo)
SSID4=(badsalzuflen leopoldshoehe oerlinghausen schoetmar)
SSIDEX=(extertal Freifunk lippe augustdorf detmold hornbadmeinberg lage kalletal lemgo badsalzuflen leopoldshoehe oerlinghausen schoetmar)

# Funktionen ##################################################################
# Erzeuge Configs fuer Stable-Branches
create_stable_configs_d1(){
  mkdir -p sites-d1
  typeset -i i=0
    for SITE in "${SITES1[@]}"
      do
        mkdir -p sites-d1/$SITE
        sed "s/\<lip\>/$SITE/g" site.conf.d1.example | sed "/ssid/s/\<lippe\>/${SSID1[i]}/g" > sites-d1/$SITE/site.conf
        sed "s/\<lip\>/$SITE/g" site.mk.d1.example > sites-d1/$SITE/site.mk
        i=$i+1
    done
}
create_stable_configs_d2(){
  mkdir -p sites-d2
  typeset -i i=0
    for SITE in "${SITES2[@]}"
      do
        mkdir -p sites-d2/$SITE
        sed "s/\<lip\>/$SITE/g" site.conf.d2.example | sed "/ssid/s/\<lippe\>/${SSID2[i]}/g" > sites-d2/$SITE/site.conf
        sed "s/\<lip\>/$SITE/g" site.mk.d2.example > sites-d2/$SITE/site.mk
        i=$i+1
    done
}
create_stable_configs_d3(){
  mkdir -p sites-d3
  typeset -i i=0
    for SITE in "${SITES3[@]}"
      do
        mkdir -p sites-d3/$SITE
        sed "s/\<lip\>/$SITE/g" site.conf.d3.example | sed "/ssid/s/\<lippe\>/${SSID3[i]}/g" > sites-d3/$SITE/site.conf
        sed "s/\<lip\>/$SITE/g" site.mk.d3.example > sites-d3/$SITE/site.mk
        i=$i+1
    done
}
create_stable_configs_d4(){
  mkdir -p sites-d4
  typeset -i i=0
    for SITE in "${SITES4[@]}"
      do
        mkdir -p sites-d4/$SITE
        sed "s/\<lip\>/$SITE/g" site.conf.d4.example | sed "/ssid/s/\<lippe\>/${SSID4[i]}/g" > sites-d4/$SITE/site.conf
        sed "s/\<lip\>/$SITE/g" site.mk.d4.example > sites-d4/$SITE/site.mk
        i=$i+1
    done
}

# Sonderfall SSID Freifunk - Stable
create_stable_ssid_freifunk(){
  mv sites-d1/ff/site.conf sites-d1/ff/site-tmp.conf
  sed "s/\<Freifunk.freifunk.net\>/freifunk/g" sites-d1/ff/site-tmp.conf > sites-d1/ff/site.conf
  rm -f sites-d1/ff/site-tmp.conf
}

# Erzeuge Configs fuer Experimental-Branch
create_experimental_configs_d1(){
  mkdir -p sites-d1-experimental
  typeset -i i=0
    for SITE in "${SITES1[@]}"
      do
        mkdir -p sites-d1-experimental/$SITE
        sed "s/\<lip\>/$SITE/g" site.conf.d1.experimental.example | sed "/ssid/s/\<lippe\>/${SSID1[i]}/g" > sites-d1-experimental/$SITE/site.conf
        sed "s/\<lip\>/$SITE/g" site.mk.d1.experimental.example > sites-d1-experimental/$SITE/site.mk
        i=$i+1
    done
}
create_experimental_configs_d2(){
  mkdir -p sites-d2-experimental
  typeset -i i=0
    for SITE in "${SITES2[@]}"
      do
        mkdir -p sites-d2-experimental/$SITE
        sed "s/\<lip\>/$SITE/g" site.conf.d2.experimental.example | sed "/ssid/s/\<lippe\>/${SSID2[i]}/g" > sites-d2-experimental/$SITE/site.conf
        sed "s/\<lip\>/$SITE/g" site.mk.d2.experimental.example > sites-d2-experimental/$SITE/site.mk
        i=$i+1
    done
}
create_experimental_configs_d3(){
  mkdir -p sites-d3-experimental
  typeset -i i=0
    for SITE in "${SITES3[@]}"
      do
        mkdir -p sites-d3-experimental/$SITE
        sed "s/\<lip\>/$SITE/g" site.conf.d3.experimental.example | sed "/ssid/s/\<lippe\>/${SSID3[i]}/g" > sites-d3-experimental/$SITE/site.conf
        sed "s/\<lip\>/$SITE/g" site.mk.d3.experimental.example > sites-d3-experimental/$SITE/site.mk
        i=$i+1
    done
}
create_experimental_configs_d4(){
  mkdir -p sites-d4-experimental
  typeset -i i=0
    for SITE in "${SITES4[@]}"
      do
        mkdir -p sites-d4-experimental/$SITE
        sed "s/\<lip\>/$SITE/g" site.conf.d4.experimental.example | sed "/ssid/s/\<lippe\>/${SSID4[i]}/g" > sites-d4-experimental/$SITE/site.conf
        sed "s/\<lip\>/$SITE/g" site.mk.d4.experimental.example > sites-d4-experimental/$SITE/site.mk
        i=$i+1
    done
}

# Sonderfall SSID Freifunk - Experimental
create_experimental_ssid_freifunk(){
  mv sites-d1-experimental/ff/site.conf sites-d1-experimental/ff/site-tmp.conf
  sed "s/\<Freifunk.freifunk.net\>/freifunk/g" sites-d1-experimental/ff/site-tmp.conf > sites-d1-experimental/ff/site.conf
  rm -f sites-d1-experimental/ff/site-tmp.conf
}

# Hauptprogramm ###############################################################
create_stable_configs_d1
create_stable_ssid_freifunk
create_stable_configs_d2
create_stable_configs_d3
create_stable_configs_d4
create_experimental_configs_d1
create_experimental_ssid_freifunk
create_experimental_configs_d2
create_experimental_configs_d3
create_experimental_configs_d4
exit
