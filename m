Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A513F224AEE
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 19:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747423745; cv=none; b=CX/LcP7PZtgx+q4Wr3pwv0ozLfls/7/g01iAdkTK4afqElf46T+MJ3Q3A4lgKRoPffgb1truwNTnGwgDUaFmvh7v0Xz7ewpSBoHsy1I4n9nxGwm3tvUvIAqTYpFZ6ZkvaHCvmQnEBTcbfXWCTU/1fEODzOeCF13jsZm3veTZm/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747423745; c=relaxed/simple;
	bh=bkJg08XMxB1GHJRZ0J5jHoygBWO5F+HMeoU8nHX10II=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=jW7iznuM1qa8S8cJBiylJqwLLEg7eT7KDpPuMV+DxAGrJWfwaQMJJXJRZzxuTDkmbdlH6aGkDROeFDFnbq4sr1p0L9939popDePof82xfi0HFXROIO/OeoruexU5soXh68rFPtXVOn6uNfd7xLxUIXim+tfN88IdTDLDHXWob6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3da707dea42so46490655ab.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 12:29:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747423743; x=1748028543;
        h=content-transfer-encoding:to:from:subject:message-id:in-reply-to
         :date:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tgP760k+nu946P611GvHCSwFqhT1ZcYbuRFdcONhmzE=;
        b=QKiRo7C+gd9fRYt2tdVAqM3Is2dumhO3XM/OYhBu776uu8mMm+tB6NG2BK9rhtspfq
         /zomA8MJd/42tG8rfcvqazy1JF/IuDLDA6Osc1FccFtW35HnUYCsmwC2baZQK8LIiuF+
         RmqkZ7QV00HwIwLkx+yhVUsmUJw0cR6slQaVJ4U9jktgzHnuucuc/TCtcdTRCLD722b1
         Aaz6/yo19Glr+hegUyiYb5TsqKL/zgBEDFBfR8e6CQKr3XYFeE5J6fS5S9ex7V5k8gYX
         NHXVAl8HJu/bai+rNyEbAWSII4jG9hbUYuSRepCI/80+QyzO3ZgRGyvHrI58FIT/Ikrz
         q4SA==
X-Forwarded-Encrypted: i=1; AJvYcCWHNfNZpw/TbkhRLCQ3YwDeoVL22ZPpERnPxk04aLxWCQ+gqWOBbPuioqHQT4oEMjJ/IgOVasEobmVwnSw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPaJ6REYX/h2LOcNBF5T3NKOldeWQdbR0KvhDR9ze2zXMWSzDu
	inrkVg5f3BJKfYolSunBMqVxYNECMYF5zxyybUO0OTjViVNVG2HYptcEktqUYYq6LRXBPUNw7yt
	n90QTaYAFFxIiJVce7TNg3PBK1fJFuXjpcwFbBXqFHsDBygwHHj0SG/qju1o=
X-Google-Smtp-Source: AGHT+IFgONE6AyGcxGluPnh02flD0E4Hq6PZ2r1an18tToLIfp5JRDEiwfYCJpSWOJI2D5DfnGR8+1+Z0xaV2m8hQxq88dSpSEDg
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:351d:b0:3d9:6cb6:fa58 with SMTP id
 e9e14a558f8ab-3db84323912mr50153525ab.17.1747423742687; Fri, 16 May 2025
 12:29:02 -0700 (PDT)
Date: Fri, 16 May 2025 12:29:02 -0700
In-Reply-To: <20250514114300.2023-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <682791fe.a00a0220.398d88.0222.GAE@google.com>
Subject: Re: [syzbot] [bluetooth?] KASAN: slab-use-after-free Read in
 mgmt_remove_adv_monitor_complete (3)
From: syzbot <syzbot+feb0dc579bbe30a13190@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

ly 0 port 6081 - 0
[  100.848943][ T5354] netdevsim netdevsim2 netdevsim3: set [1, 0] type 2 f=
amily 0 port 6081 - 0
2025/05/16 19:28:23 executed programs: 0
[  101.013794][ T5369] Bluetooth: hci1: unexpected cc 0x0c03 length: 249 > =
1
[  101.017148][ T5369] Bluetooth: hci1: unexpected cc 0x1003 length: 249 > =
9
[  101.020411][ T5369] Bluetooth: hci1: unexpected cc 0x1001 length: 249 > =
9
[  101.035450][ T5369] Bluetooth: hci1: unexpected cc 0x0c23 length: 249 > =
4
[  101.038675][ T5369] Bluetooth: hci1: unexpected cc 0x0c38 length: 249 > =
2
[  101.209300][ T5423] chnl_net:caif_netlink_parms(): no params data found
[  101.264598][ T5423] bridge0: port 1(bridge_slave_0) entered blocking sta=
te
[  101.267830][ T5423] bridge0: port 1(bridge_slave_0) entered disabled sta=
te
[  101.270938][ T5423] bridge_slave_0: entered allmulticast mode
[  101.284275][ T5423] bridge_slave_0: entered promiscuous mode
[  101.288654][ T5423] bridge0: port 2(bridge_slave_1) entered blocking sta=
te
[  101.291850][ T5423] bridge0: port 2(bridge_slave_1) entered disabled sta=
te
[  101.304908][ T5423] bridge_slave_1: entered allmulticast mode
[  101.308917][ T5423] bridge_slave_1: entered promiscuous mode
[  101.344729][ T5423] bond0: (slave bond_slave_0): Enslaving as an active =
interface with an up link
[  101.350123][ T5423] bond0: (slave bond_slave_1): Enslaving as an active =
interface with an up link
[  101.404166][ T5423] team0: Port device team_slave_0 added
[  101.414160][ T5423] team0: Port device team_slave_1 added
[  101.464236][ T5423] batman_adv: batadv0: Adding interface: batadv_slave_=
0
[  101.467427][ T5423] batman_adv: batadv0: The MTU of interface batadv_sla=
ve_0 is too small (1500) to handle the transport of batman-adv packets. Pac=
kets going over this interface will be fragmented on layer2 which could imp=
act the performance. Setting the MTU to 1560 would solve the problem.
[  101.524876][ T5423] batman_adv: batadv0: Not using interface batadv_slav=
e_0 (retrying later): interface not active
[  101.533942][ T5423] batman_adv: batadv0: Adding interface: batadv_slave_=
1
[  101.536944][ T5423] batman_adv: batadv0: The MTU of interface batadv_sla=
ve_1 is too small (1500) to handle the transport of batman-adv packets. Pac=
kets going over this interface will be fragmented on layer2 which could imp=
act the performance. Setting the MTU to 1560 would solve the problem.
[  101.556644][ T5423] batman_adv: batadv0: Not using interface batadv_slav=
e_1 (retrying later): interface not active
[  101.577493][ T5423] hsr_slave_0: entered promiscuous mode
[  101.580492][ T5423] hsr_slave_1: entered promiscuous mode
[  101.583557][ T5423] debugfs: Directory 'hsr0' with parent 'hsr' already =
present!
[  101.586820][ T5423] Cannot create hsr debugfs directory
[  101.671639][ T5423] netdevsim netdevsim0 netdevsim0: renamed from eth0
[  101.684967][ T5423] netdevsim netdevsim0 netdevsim1: renamed from eth1
[  101.689759][ T5423] netdevsim netdevsim0 netdevsim2: renamed from eth2
[  101.695328][ T5423] netdevsim netdevsim0 netdevsim3: renamed from eth3
[  101.738872][ T5423] 8021q: adding VLAN 0 to HW filter on device bond0
[  101.750284][ T5423] 8021q: adding VLAN 0 to HW filter on device team0
[  101.759250][ T3014] bridge0: port 1(bridge_slave_0) entered blocking sta=
te
[  101.762476][ T3014] bridge0: port 1(bridge_slave_0) entered forwarding s=
tate
[  101.776899][ T3014] bridge0: port 2(bridge_slave_1) entered blocking sta=
te
[  101.780075][ T3014] bridge0: port 2(bridge_slave_1) entered forwarding s=
tate
[  101.794837][ T5423] hsr0: Slave A (hsr_slave_0) is not up; please bring =
it up to get a fully working HSR network
[  101.799531][ T5423] hsr0: Slave B (hsr_slave_1) is not up; please bring =
it up to get a fully working HSR network
[  101.893807][ T5423] 8021q: adding VLAN 0 to HW filter on device batadv0
[  101.921315][ T5423] veth0_vlan: entered promiscuous mode
[  101.927787][ T5423] veth1_vlan: entered promiscuous mode
[  101.944392][ T5423] veth0_macvtap: entered promiscuous mode
[  101.948942][ T5423] veth1_macvtap: entered promiscuous mode
[  101.959001][ T5423] batman_adv: batadv0: Interface activated: batadv_sla=
ve_0
[  101.967366][ T5423] batman_adv: batadv0: Interface activated: batadv_sla=
ve_1
[  101.974334][ T5423] netdevsim netdevsim0 netdevsim0: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[  101.978242][ T5423] netdevsim netdevsim0 netdevsim1: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[  101.982099][ T5423] netdevsim netdevsim0 netdevsim2: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[  101.987697][ T5423] netdevsim netdevsim0 netdevsim3: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[  102.017256][ T5423] ieee80211 phy5: Selected rate control algorithm 'min=
strel_ht'
[  102.031112][ T1034] wlan0: Created IBSS using preconfigured BSSID 50:50:=
50:50:50:50
[  102.036826][ T5423] ieee80211 phy6: Selected rate control algorithm 'min=
strel_ht'
[  102.042499][ T1034] wlan0: Creating new IBSS network, BSSID 50:50:50:50:=
50:50
[  102.060001][ T3014] wlan1: Created IBSS using preconfigured BSSID 50:50:=
50:50:50:50
[  102.065051][ T3014] wlan1: Creating new IBSS network, BSSID 50:50:50:50:=
50:50
[  102.407753][ T2998] netdevsim netdevsim2 netdevsim3 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[  103.526458][ T2998] netdevsim netdevsim2 netdevsim2 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[  104.285604][ T2998] netdevsim netdevsim2 netdevsim1 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[  104.317214][ T2998] netdevsim netdevsim2 netdevsim0 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[  104.398084][ T2998] bridge_slave_1: left allmulticast mode
[  104.400556][ T2998] bridge_slave_1: left promiscuous mode
[  104.406727][ T2998] bridge0: port 2(bridge_slave_1) entered disabled sta=
te
[  104.410896][ T2998] bridge_slave_0: left allmulticast mode
[  104.414563][ T2998] bridge_slave_0: left promiscuous mode
[  104.417073][ T2998] bridge0: port 1(bridge_slave_0) entered disabled sta=
te
[  104.526855][ T2998] bond0 (unregistering): (slave bond_slave_0): Releasi=
ng backup interface
[  104.532481][ T2998] bond0 (unregistering): (slave bond_slave_1): Releasi=
ng backup interface
[  104.537559][ T2998] bond0 (unregistering): Released all slaves
[  104.601253][ T2998] hsr_slave_0: left promiscuous mode
[  104.606654][ T2998] hsr_slave_1: left promiscuous mode
[  104.614144][ T2998] batman_adv: batadv0: Interface deactivated: batadv_s=
lave_0
[  104.617425][ T2998] batman_adv: batadv0: Removing interface: batadv_slav=
e_0
[  104.633234][ T2998] batman_adv: batadv0: Interface deactivated: batadv_s=
lave_1
[  104.636971][ T2998] batman_adv: batadv0: Removing interface: batadv_slav=
e_1
[  104.663323][ T2998] veth1_macvtap: left promiscuous mode
[  104.665793][ T2998] veth0_macvtap: left promiscuous mode
[  104.668265][ T2998] veth1_vlan: left promiscuous mode
[  104.670638][ T2998] veth0_vlan: left promiscuous mode
[  104.837769][ T2998] team0 (unregistering): Port device team_slave_1 remo=
ved
[  104.847365][ T2998] team0 (unregistering): Port device team_slave_0 remo=
ved

VM DIAGNOSIS:
19:28:21  Registers:
info registers vcpu 0

CPU#0
RAX=3D0000000000000079 RBX=3D0000000000000079 RCX=3D0000000000000000 RDX=3D=
00000000000003f8
RSI=3D0000000000000000 RDI=3D0000000000000020 RBP=3D00000000000003f8 RSP=3D=
ffffc9000d52edf0
R8 =3Dffff888000b60237 R9 =3D1ffff1100016c046 R10=3Ddffffc0000000000 R11=3D=
ffffffff853e04f0
R12=3Ddffffc0000000000 R13=3Dffffffff9984bc64 R14=3Dffffffff99b50c00 R15=3D=
0000000000000000
RIP=3Dffffffff853e056c RFL=3D00000002 [-------] CPL=3D0 II=3D0 A20=3D1 SMM=
=3D0 HLT=3D0
ES =3D0000 0000000000000000 ffffffff 00c00000
CS =3D0010 0000000000000000 ffffffff 00a09b00 DPL=3D0 CS64 [-RA]
SS =3D0018 0000000000000000 ffffffff 00c09300 DPL=3D0 DS   [-WA]
DS =3D0000 0000000000000000 ffffffff 00c00000
FS =3D0000 0000000000000000 ffffffff 00c00000
GS =3D0000 ffff88808d6c7000 ffffffff 00c00000
LDT=3D0000 0000000000000000 ffffffff 00c00000
TR =3D0040 fffffe0000003000 00004087 00008b00 DPL=3D0 TSS64-busy
GDT=3D     fffffe0000001000 0000007f
IDT=3D     fffffe0000000000 00000fff
CR0=3D80050033 CR2=3D00007fff08f02e48 CR3=3D000000001f723000 CR4=3D00352ef0
DR0=3D0000000000000000 DR1=3D0000000000000000 DR2=3D0000000000000000 DR3=3D=
0000000000000000=20
DR6=3D00000000fffe0ff0 DR7=3D0000000000000400
EFER=3D0000000000000d01
FCW=3D037f FSW=3D0000 [ST=3D0] FTW=3D00 MXCSR=3D00001f80
FPR0=3D0000000000000000 0000 FPR1=3D0000000000000000 0000
FPR2=3D0000000000000000 0000 FPR3=3D0000000000000000 0000
FPR4=3D0000000000000000 0000 FPR5=3D0000000000000000 0000
FPR6=3D0000000000000000 0000 FPR7=3D0000000000000000 0000
Opmask00=3D00000000fcfeffd0 Opmask01=3D0000000000000003 Opmask02=3D00000000=
ffff7fdf Opmask03=3D0000000000000000
Opmask04=3D00000000ffffffff Opmask05=3D0000000000000000 Opmask06=3D00000000=
00000000 Opmask07=3D0000000000000000
ZMM00=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000 0000000000000000 0000000000000000 0000000000000000
ZMM01=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000 0000000000000000 44455a494c414954 494e495f43455355
ZMM02=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000 0000000000000000 0000000000000000 00005597abcaeb30
ZMM03=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000 0000000000000000 0000000000000000 00005597abcbcbf0
ZMM04=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000 0000000000000000 0000000000000000 00ff000000000000
ZMM05=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000 0000000000000000 0000000000000000 0000000000000000
ZMM06=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000 0000000000000000 0000000000000000 0000000000000000
ZMM07=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000 0000000000000000 0000000000000000 00007f0c36552c80
ZMM08=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000 0000000000000000 0000000000000000 0000000000000000
ZMM09=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000 0000000000000000 0000000000000000 0000000000000000
ZMM10=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000 0000000000000000 0000000000000000 0000000000000000
ZMM11=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000 0000000000000000 0000000000000000 0000000000000000
ZMM12=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000 0000000000000000 0000000000000000 0000000000000000
ZMM13=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000 0000000000000000 0000000000000000 0000000000000000
ZMM14=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000 0000000000000000 0000000000000000 0000000000000000
ZMM15=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000 0000000000000000 0000000000000000 0000000000000000
ZMM16=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000 0000000000000000 0000000000000000 0000000000000000
ZMM17=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 3030323a30696368 2f306963682f6874 6f6f7465756c622f 6c6175747269762f
ZMM18=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 005600051f40494c 43055c5155484005 424b4c55554c4e53 004057005b1a0f00
ZMM19=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 7377685f31313230 3863616d2f6c6175 747269762f736563 697665642f737973
ZMM20=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 003a756b733a322e 392d3533712d6370 7276633a3174633a 554d45516e76633a
ZMM21=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 322e392d3533712d 63707276703a2939 3030322c39484349 2b35335128435064
ZMM22=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 7261646e6174536e 703a554d45516e76 733a302e3072623a 343130322f31302f
ZMM23=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 343064623a312b32 316f70627e322d33 2e36312e312d6e61 696265642d332e36
ZMM24=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 313731302c453631 302c353631302c34 3631302c33343130 2c323431302c3134
ZMM25=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000 0000000000000000 0000000000000000 0000000000000000
ZMM26=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000 0000000000000000 0000000000000000 0000000000000000
ZMM27=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000 0000000000000000 0000000000000000 0000000000000000
ZMM28=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000 0000000000000000 0000000000000000 0000000000000000
ZMM29=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000 0000000000000000 0000000000000000 0000000000000000
ZMM30=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000 0000000000000000 0000000000000000 0000000000000000
ZMM31=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000 0000000000000000 0000000000000000 0000000000000000


syzkaller build log:
go env (err=3D<nil>)
GO111MODULE=3D'auto'
GOARCH=3D'amd64'
GOBIN=3D''
GOCACHE=3D'/syzkaller/.cache/go-build'
GOENV=3D'/syzkaller/.config/go/env'
GOEXE=3D''
GOEXPERIMENT=3D''
GOFLAGS=3D''
GOHOSTARCH=3D'amd64'
GOHOSTOS=3D'linux'
GOINSECURE=3D''
GOMODCACHE=3D'/syzkaller/jobs/linux/gopath/pkg/mod'
GONOPROXY=3D''
GONOSUMDB=3D''
GOOS=3D'linux'
GOPATH=3D'/syzkaller/jobs/linux/gopath'
GOPRIVATE=3D''
GOPROXY=3D'https://proxy.golang.org,direct'
GOROOT=3D'/syzkaller/jobs/linux/gopath/pkg/mod/golang.org/toolchain@v0.0.1-=
go1.23.7.linux-amd64'
GOSUMDB=3D'sum.golang.org'
GOTMPDIR=3D''
GOTOOLCHAIN=3D'auto'
GOTOOLDIR=3D'/syzkaller/jobs/linux/gopath/pkg/mod/golang.org/toolchain@v0.0=
.1-go1.23.7.linux-amd64/pkg/tool/linux_amd64'
GOVCS=3D''
GOVERSION=3D'go1.23.7'
GODEBUG=3D''
GOTELEMETRY=3D'local'
GOTELEMETRYDIR=3D'/syzkaller/.config/go/telemetry'
GCCGO=3D'gccgo'
GOAMD64=3D'v1'
AR=3D'ar'
CC=3D'gcc'
CXX=3D'g++'
CGO_ENABLED=3D'1'
GOMOD=3D'/syzkaller/jobs/linux/gopath/src/github.com/google/syzkaller/go.mo=
d'
GOWORK=3D''
CGO_CFLAGS=3D'-O2 -g'
CGO_CPPFLAGS=3D''
CGO_CXXFLAGS=3D'-O2 -g'
CGO_FFLAGS=3D'-O2 -g'
CGO_LDFLAGS=3D'-O2 -g'
PKG_CONFIG=3D'pkg-config'
GOGCCFLAGS=3D'-fPIC -m64 -pthread -Wl,--no-gc-sections -fmessage-length=3D0=
 -ffile-prefix-map=3D/tmp/go-build2323670350=3D/tmp/go-build -gno-record-gc=
c-switches'

git status (err=3D<nil>)
HEAD detached at 77908e5f2
nothing to commit, working tree clean


tput: No value for $TERM and no -T specified
tput: No value for $TERM and no -T specified
Makefile:31: run command via tools/syz-env for best compatibility, see:
Makefile:32: https://github.com/google/syzkaller/blob/master/docs/contribut=
ing.md#using-syz-env
go list -f '{{.Stale}}' ./sys/syz-sysgen | grep -q false || go install ./sy=
s/syz-sysgen
make .descriptions
tput: No value for $TERM and no -T specified
tput: No value for $TERM and no -T specified
Makefile:31: run command via tools/syz-env for best compatibility, see:
Makefile:32: https://github.com/google/syzkaller/blob/master/docs/contribut=
ing.md#using-syz-env
bin/syz-sysgen
touch .descriptions
GOOS=3Dlinux GOARCH=3Damd64 go build "-ldflags=3D-s -w -X github.com/google=
/syzkaller/prog.GitRevision=3D77908e5f2ae80bee6d434bca762a25a0a5fc6a83 -X '=
github.com/google/syzkaller/prog.gitRevisionDate=3D20250509-090543'" -o ./b=
in/linux_amd64/syz-execprog github.com/google/syzkaller/tools/syz-execprog
mkdir -p ./bin/linux_amd64
g++ -o ./bin/linux_amd64/syz-executor executor/executor.cc \
	-m64 -O2 -pthread -Wall -Werror -Wparentheses -Wunused-const-variable -Wfr=
ame-larger-than=3D16384 -Wno-stringop-overflow -Wno-array-bounds -Wno-forma=
t-overflow -Wno-unused-but-set-variable -Wno-unused-command-line-argument -=
static-pie -std=3Dc++17 -I. -Iexecutor/_include   -DGOOS_linux=3D1 -DGOARCH=
_amd64=3D1 \
	-DHOSTGOOS_linux=3D1 -DGIT_REVISION=3D\"77908e5f2ae80bee6d434bca762a25a0a5=
fc6a83\"
/usr/bin/ld: /tmp/ccKazgFn.o: in function `Connection::Connect(char const*,=
 char const*)':
executor.cc:(.text._ZN10Connection7ConnectEPKcS1_[_ZN10Connection7ConnectEP=
KcS1_]+0x104): warning: Using 'gethostbyname' in statically linked applicat=
ions requires at runtime the shared libraries from the glibc version used f=
or linking


Error text is too large and was truncated, full error text is at:
https://syzkaller.appspot.com/x/error.txt?x=3D15c40ef4580000


Tested on:

commit:         83a89654 Merge tag 'scsi-fixes' of git://git.kernel.or..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=3Dc3f0e807ec5d126=
8
dashboard link: https://syzkaller.appspot.com/bug?extid=3Dfeb0dc579bbe30a13=
190
compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-=
1~exp1~20250402004600.97), Debian LLD 20.1.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=3D10569cd45800=
00

