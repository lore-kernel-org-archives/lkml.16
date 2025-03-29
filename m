Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0A2DDBC
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 06:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743228125; cv=none; b=CH7yzTbXU1AzNjOU8WAVCv4MxPxGAAH7oLA8p4LoI7/mTpsJlUDXLUtYHHvK05oTjRh9YY9fxHB7C6vRog4pM4m63cd06XAgL/W8UmFKlhaFiL4JYYWo7ADs9/kio89f48/yaKtwbUNQGY5ykPvbgDf939naoLP1mXFVHGsscSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743228125; c=relaxed/simple;
	bh=WewjRQuuqeSaUYdRBG6umN5OIkygCeOa66ei/ISGMjQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=lOll/RHFyJPFDh/kb30kEupxN47gOuRd8V7gC0WoCJYWOzcgPNUpxPCbliDwVmobr3HVAgS9jP9ziLqgA4sNW61iaplAyGl/Rss/5I1Ve3oxl8nQ8DZvNOJ/P5tvR0vK5NcP15bqvd13sO+q9SMrDf7NoEUE8zT6NfbyDbKdg6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3d44b221f0dso53056045ab.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 23:02:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743228123; x=1743832923;
        h=content-transfer-encoding:to:from:subject:message-id:in-reply-to
         :date:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DAU4a58Edhjn4KL8IBosSUXyKDAUcj9JwizkZercdbI=;
        b=pzcNaCchElVqT47jcpjhvkpPPJI85kD+CDgeWacQbi9sbtatt7gN3ApZUBcKRpVAOD
         tchc5gj4OMhViI5YWTZoZWFvVl7fMuVxZiUY0UqYBPoEC9WVjgrAD1JIg0/Yvi4lHegM
         MF8N6YZW/QcKjvwSUCIzVq0pIgXI0FCbLCrRF65/jXJKnwzScVqzWQJl2TWlMo4NjliH
         ust5MmQU72I9Lw9yc6ituuqOYFyCllzSXWG51tki/BK0wephgaxge2BJ6bHLRcYOoDZs
         f0MUp7CdtS8pFXQUrohEOR/OHLNSAKais9VMV9YvruAZVxs19VG7rV/FID9YYkFTZWnw
         3V4Q==
X-Forwarded-Encrypted: i=1; AJvYcCX8N6Tztx67A13nwu7VJ8mJoHar+kYB4sJE3c7W5u7YXJOAsVvID2p4EoyGgtb08i5GCXMLiCmWlFJdqP4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4lvSXrbrtCxIIEWWYm0bc5uPohBD7ym+fWkP80IiGEJOFVl6Z
	ycsNMTiqxVEyOWkijtx6ST1yoAfu5h8++63QnVFXbxznNflxDpzNvgA636WecCoVy0EOlvS9IYW
	c+KFGv4/1UaHYUO7Nv7Ua0sPPDnCrE4Qvil4HrxVOVCHsLK5g9ETL9cM=
X-Google-Smtp-Source: AGHT+IFo/wKEwkNI23/SIqWNmdRzjWS4otGFaO9akRI4qM3uLCdzDZ3KIXCQalXZ/BGNBz+rdVAbrZPPUgo7bYNjgj5vcDkIbXtk
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:17ca:b0:3d0:10a6:99aa with SMTP id
 e9e14a558f8ab-3d5e08e960dmr19866605ab.4.1743228122836; Fri, 28 Mar 2025
 23:02:02 -0700 (PDT)
Date: Fri, 28 Mar 2025 23:02:02 -0700
In-Reply-To: <tencent_75D09648E85EEECECE287BF26DD42D316F0A@qq.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67e78cda.050a0220.1547ec.001a.GAE@google.com>
Subject: Re: [syzbot] [afs?] [ntfs3?] BUG: sleeping function called from
 invalid context in ovl_cache_entry_new
From: syzbot <syzbot+54e6c2176ba76c56217e@syzkaller.appspotmail.com>
To: eadavis@qq.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

 T5845] netdevsim netdevsim0 netdevsim0: set [1, 0] type 2 family 0 port 60=
81 - 0
[   67.873741][ T5845] netdevsim netdevsim0 netdevsim1: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   67.882828][ T5845] netdevsim netdevsim0 netdevsim2: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   67.892838][ T5845] netdevsim netdevsim0 netdevsim3: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   68.022968][  T739] netdevsim netdevsim0 netdevsim3 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[   68.099904][  T739] netdevsim netdevsim0 netdevsim2 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[   68.169446][  T739] netdevsim netdevsim0 netdevsim1 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[   68.241769][  T739] netdevsim netdevsim0 netdevsim0 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[   69.209247][ T5910] Bluetooth: hci0: unexpected cc 0x0c03 length: 249 > =
1
[   69.221468][ T5910] Bluetooth: hci0: unexpected cc 0x1003 length: 249 > =
9
[   69.230175][ T5910] Bluetooth: hci0: unexpected cc 0x1001 length: 249 > =
9
[   69.239192][ T5910] Bluetooth: hci0: unexpected cc 0x0c23 length: 249 > =
4
[   69.246743][ T5910] Bluetooth: hci0: unexpected cc 0x0c38 length: 249 > =
2
[   69.725106][   T13] wlan0: Created IBSS using preconfigured BSSID 50:50:=
50:50:50:50
[   69.741653][   T13] wlan0: Creating new IBSS network, BSSID 50:50:50:50:=
50:50
[   69.766123][ T1164] wlan1: Created IBSS using preconfigured BSSID 50:50:=
50:50:50:50
[   69.774200][ T1164] wlan1: Creating new IBSS network, BSSID 50:50:50:50:=
50:50
2025/03/29 06:01:08 executed programs: 0
[   70.225341][ T5910] Bluetooth: hci0: unexpected cc 0x0c03 length: 249 > =
1
[   70.234939][ T5910] Bluetooth: hci0: unexpected cc 0x1003 length: 249 > =
9
[   70.243559][ T5910] Bluetooth: hci0: unexpected cc 0x1001 length: 249 > =
9
[   70.252434][ T5910] Bluetooth: hci0: unexpected cc 0x0c23 length: 249 > =
4
[   70.260174][ T5910] Bluetooth: hci0: unexpected cc 0x0c38 length: 249 > =
2
[   70.347265][ T5933] chnl_net:caif_netlink_parms(): no params data found
[   70.389979][ T5933] bridge0: port 1(bridge_slave_0) entered blocking sta=
te
[   70.397116][ T5933] bridge0: port 1(bridge_slave_0) entered disabled sta=
te
[   70.404567][ T5933] bridge_slave_0: entered allmulticast mode
[   70.411635][ T5933] bridge_slave_0: entered promiscuous mode
[   70.419405][ T5933] bridge0: port 2(bridge_slave_1) entered blocking sta=
te
[   70.426553][ T5933] bridge0: port 2(bridge_slave_1) entered disabled sta=
te
[   70.434133][ T5933] bridge_slave_1: entered allmulticast mode
[   70.440770][ T5933] bridge_slave_1: entered promiscuous mode
[   70.459538][ T5933] bond0: (slave bond_slave_0): Enslaving as an active =
interface with an up link
[   70.470995][ T5933] bond0: (slave bond_slave_1): Enslaving as an active =
interface with an up link
[   70.493596][ T5933] team0: Port device team_slave_0 added
[   70.501395][ T5933] team0: Port device team_slave_1 added
[   70.519008][ T5933] batman_adv: batadv0: Adding interface: batadv_slave_=
0
[   70.526072][ T5933] batman_adv: batadv0: The MTU of interface batadv_sla=
ve_0 is too small (1500) to handle the transport of batman-adv packets. Pac=
kets going over this interface will be fragmented on layer2 which could imp=
act the performance. Setting the MTU to 1560 would solve the problem.
[   70.552861][ T5933] batman_adv: batadv0: Not using interface batadv_slav=
e_0 (retrying later): interface not active
[   70.565006][ T5933] batman_adv: batadv0: Adding interface: batadv_slave_=
1
[   70.572298][ T5933] batman_adv: batadv0: The MTU of interface batadv_sla=
ve_1 is too small (1500) to handle the transport of batman-adv packets. Pac=
kets going over this interface will be fragmented on layer2 which could imp=
act the performance. Setting the MTU to 1560 would solve the problem.
[   70.598637][ T5933] batman_adv: batadv0: Not using interface batadv_slav=
e_1 (retrying later): interface not active
[   70.627155][ T5933] hsr_slave_0: entered promiscuous mode
[   70.633381][ T5933] hsr_slave_1: entered promiscuous mode
[   70.639645][ T5933] debugfs: Directory 'hsr0' with parent 'hsr' already =
present!
[   70.647370][ T5933] Cannot create hsr debugfs directory
[   70.812486][  T739] bridge_slave_1: left allmulticast mode
[   70.819194][  T739] bridge_slave_1: left promiscuous mode
[   70.825833][  T739] bridge0: port 2(bridge_slave_1) entered disabled sta=
te
[   70.842235][  T739] bridge_slave_0: left allmulticast mode
[   70.847996][  T739] bridge_slave_0: left promiscuous mode
[   70.853757][  T739] bridge0: port 1(bridge_slave_0) entered disabled sta=
te
[   71.122739][  T739] bond0 (unregistering): (slave bond_slave_0): Releasi=
ng backup interface
[   71.133922][  T739] bond0 (unregistering): (slave bond_slave_1): Releasi=
ng backup interface
[   71.144058][  T739] bond0 (unregistering): Released all slaves
[   71.164249][ T5492]=20
[   71.166627][ T5492] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
[   71.172866][ T5492] WARNING: possible recursive locking detected
[   71.179026][ T5492] 6.14.0-syzkaller-09584-g7d06015d936c-dirty #0 Not ta=
inted
[   71.186417][ T5492] --------------------------------------------
[   71.192576][ T5492] dhcpcd/5492 is trying to acquire lock:
[   71.198194][ T5492] ffff888030ed0d28 (&dev->lock){+.+.}-{4:4}, at: lapbe=
th_device_event+0x766/0xa20
[   71.207517][ T5492]=20
[   71.207517][ T5492] but task is already holding lock:
[   71.214971][ T5492] ffff88805c068d28 (&dev->lock){+.+.}-{4:4}, at: dev_c=
hange_flags+0x120/0x270
[   71.223915][ T5492]=20
[   71.223915][ T5492] other info that might help us debug this:
[   71.231970][ T5492]  Possible unsafe locking scenario:
[   71.231970][ T5492]=20
[   71.239412][ T5492]        CPU0
[   71.242679][ T5492]        ----
[   71.245961][ T5492]   lock(&dev->lock);
[   71.249953][ T5492]   lock(&dev->lock);
[   71.253947][ T5492]=20
[   71.253947][ T5492]  *** DEADLOCK ***
[   71.253947][ T5492]=20
[   71.262112][ T5492]  May be due to missing lock nesting notation
[   71.262112][ T5492]=20
[   71.270417][ T5492] 2 locks held by dhcpcd/5492:
[   71.275342][ T5492]  #0: ffffffff900d3988 (rtnl_mutex){+.+.}-{4:4}, at: =
devinet_ioctl+0x34e/0x1d80
[   71.284475][ T5492]  #1: ffff88805c068d28 (&dev->lock){+.+.}-{4:4}, at: =
dev_change_flags+0x120/0x270
[   71.293780][ T5492]=20
[   71.293780][ T5492] stack backtrace:
[   71.299673][ T5492] CPU: 1 UID: 0 PID: 5492 Comm: dhcpcd Not tainted 6.1=
4.0-syzkaller-09584-g7d06015d936c-dirty #0 PREEMPT(full)=20
[   71.299689][ T5492] Hardware name: Google Google Compute Engine/Google C=
ompute Engine, BIOS Google 02/12/2025
[   71.299700][ T5492] Call Trace:
[   71.299706][ T5492]  <TASK>
[   71.299712][ T5492]  dump_stack_lvl+0x241/0x360
[   71.299731][ T5492]  ? __pfx_dump_stack_lvl+0x10/0x10
[   71.299745][ T5492]  ? __pfx__printk+0x10/0x10
[   71.299758][ T5492]  ? print_lock+0x171/0x1a0
[   71.299770][ T5492]  print_deadlock_bug+0x2be/0x2d0
[   71.299783][ T5492]  validate_chain+0x928/0x24e0
[   71.299795][ T5492]  ? stack_depot_save_flags+0x3a/0x970
[   71.299813][ T5492]  ? look_up_lock_class+0x7b/0x170
[   71.299825][ T5492]  ? register_lock_class+0x54/0x330
[   71.299841][ T5492]  __lock_acquire+0xad5/0xd80
[   71.299859][ T5492]  lock_acquire+0x116/0x2f0
[   71.299873][ T5492]  ? lapbeth_device_event+0x766/0xa20
[   71.299888][ T5492]  __mutex_lock+0x1a5/0x10c0
[   71.299900][ T5492]  ? lapbeth_device_event+0x766/0xa20
[   71.299913][ T5492]  ? ref_tracker_alloc+0x316/0x4c0
[   71.299930][ T5492]  ? lapbeth_device_event+0x766/0xa20
[   71.299941][ T5492]  ? rcu_is_watching+0x15/0xb0
[   71.299953][ T5492]  ? __pfx___mutex_lock+0x10/0x10
[   71.299967][ T5492]  ? __raw_spin_lock_init+0x45/0x100
[   71.299981][ T5492]  lapbeth_device_event+0x766/0xa20
[   71.299994][ T5492]  notifier_call_chain+0x1a5/0x3f0
[   71.300009][ T5492]  __dev_notify_flags+0x209/0x410
[   71.300024][ T5492]  ? __pfx___dev_notify_flags+0x10/0x10
[   71.300037][ T5492]  ? __dev_change_flags+0x517/0x700
[   71.300052][ T5492]  ? __pfx___mutex_lock+0x10/0x10
[   71.300063][ T5492]  ? __pfx___dev_change_flags+0x10/0x10
[   71.300077][ T5492]  ? __pfx___mutex_lock+0x10/0x10
[   71.300088][ T5492]  netif_change_flags+0xf0/0x1a0
[   71.300103][ T5492]  dev_change_flags+0x146/0x270
[   71.300117][ T5492]  devinet_ioctl+0xea4/0x1d80
[   71.300132][ T5492]  ? __pfx_devinet_ioctl+0x10/0x10
[   71.300145][ T5492]  ? get_user_ifreq+0x1bb/0x200
[   71.300161][ T5492]  inet_ioctl+0x3d9/0x4f0
[   71.300176][ T5492]  ? __pfx_inet_ioctl+0x10/0x10
[   71.300190][ T5492]  ? lockdep_hardirqs_on+0x9d/0x150
[   71.300211][ T5492]  ? tomoyo_path_number_perm+0x215/0x790
[   71.300226][ T5492]  sock_do_ioctl+0x15a/0x490
[   71.300238][ T5492]  ? __pfx_sock_do_ioctl+0x10/0x10
[   71.300250][ T5492]  ? fd_install+0x9c/0x4c0
[   71.300263][ T5492]  ? __asan_memset+0x23/0x50
[   71.300278][ T5492]  ? smack_file_ioctl+0x2a7/0x3b0
[   71.300295][ T5492]  sock_ioctl+0x644/0x900
[   71.300312][ T5492]  ? __pfx_sock_ioctl+0x10/0x10
[   71.300328][ T5492]  ? __sys_socket+0x209/0x3c0
[   71.300341][ T5492]  ? __pfx_sock_ioctl+0x10/0x10
[   71.300357][ T5492]  __se_sys_ioctl+0xf1/0x160
[   71.300374][ T5492]  do_syscall_64+0xf3/0x230
[   71.300386][ T5492]  ? clear_bhb_loop+0x45/0xa0
[   71.300399][ T5492]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   71.300413][ T5492] RIP: 0033:0x7fa55dcd4d49
[   71.300429][ T5492] Code: 5c c3 48 8d 44 24 08 48 89 54 24 e0 48 89 44 2=
4 c0 48 8d 44 24 d0 48 89 44 24 c8 b8 10 00 00 00 c7 44 24 b8 10 00 00 00 0=
f 05 <41> 89 c0 3d 00 f0 ff ff 76 10 48 8b 15 ae 60 0d 00 f7 d8 41 83 c8
[   71.300439][ T5492] RSP: 002b:00007fffa292ae78 EFLAGS: 00000246 ORIG_RAX=
: 0000000000000010
[   71.300453][ T5492] RAX: ffffffffffffffda RBX: 00007fa55dc066c0 RCX: 000=
07fa55dcd4d49
[   71.300462][ T5492] RDX: 00007fffa293b068 RSI: 0000000000008914 RDI: 000=
0000000000010
[   71.300470][ T5492] RBP: 00007fffa294b228 R08: 00007fffa293b028 R09: 000=
07fffa293afd8
[   71.300478][ T5492] R10: 0000000000000000 R11: 0000000000000246 R12: 000=
0000000000000
[   71.300486][ T5492] R13: 00007fffa293b068 R14: 0000000000000028 R15: 000=
0000000008914
[   71.300498][ T5492]  </TASK>
[   71.649519][ T1300] ieee802154 phy0 wpan0: encryption failed: -22
[   71.655830][ T1300] ieee802154 phy1 wpan1: encryption failed: -22
[   71.712528][  T739] hsr_slave_0: left promiscuous mode
[   71.718615][  T739] hsr_slave_1: left promiscuous mode
[   71.724266][  T739] batman_adv: batadv0: Interface deactivated: batadv_s=
lave_0
[   71.732057][  T739] batman_adv: batadv0: Removing interface: batadv_slav=
e_0
[   71.740909][  T739] batman_adv: batadv0: Interface deactivated: batadv_s=
lave_1
[   71.748958][  T739] batman_adv: batadv0: Removing interface: batadv_slav=
e_1
[   71.758568][  T739] veth1_macvtap: left promiscuous mode
[   71.764195][  T739] veth0_macvtap: left promiscuous mode
[   71.770138][  T739] veth1_vlan: left promiscuous mode
[   71.775453][  T739] veth0_vlan: left promiscuous mode
[   71.927279][  T739] team0 (unregistering): Port device team_slave_1 remo=
ved
[   71.945557][  T739] team0 (unregistering): Port device team_slave_0 remo=
ved
[   72.266794][ T5933] netdevsim netdevsim0 netdevsim0: renamed from eth0
[   72.277112][ T5933] netdevsim netdevsim0 netdevsim1: renamed from eth1
[   72.294262][ T5933] netdevsim netdevsim0 netdevsim2: renamed from eth2
[   72.309749][ T5933] netdevsim netdevsim0 netdevsim3: renamed from eth3
[   72.321044][ T5910] Bluetooth: hci0: command tx timeout
[   72.379040][ T5933] 8021q: adding VLAN 0 to HW filter on device bond0
[   72.396416][ T5933] 8021q: adding VLAN 0 to HW filter on device team0
[   72.410829][ T1164] bridge0: port 1(bridge_slave_0) entered blocking sta=
te
[   72.418091][ T1164] bridge0: port 1(bridge_slave_0) entered forwarding s=
tate
[   72.436046][ T1164] bridge0: port 2(bridge_slave_1) entered blocking sta=
te
[   72.443239][ T1164] bridge0: port 2(bridge_slave_1) entered forwarding s=
tate
[   72.563767][ T5933] 8021q: adding VLAN 0 to HW filter on device batadv0
[   72.597276][ T5933] veth0_vlan: entered promiscuous mode
[   72.611239][ T5933] veth1_vlan: entered promiscuous mode
[   72.635744][ T5933] veth0_macvtap: entered promiscuous mode
[   72.645289][ T5933] veth1_macvtap: entered promiscuous mode
[   72.662044][ T5933] batman_adv: batadv0: Interface activated: batadv_sla=
ve_0
[   72.675270][ T5933] batman_adv: batadv0: Interface activated: batadv_sla=
ve_1
[   72.687034][ T5933] netdevsim netdevsim0 netdevsim0: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   72.699053][ T5933] netdevsim netdevsim0 netdevsim1: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   72.709642][ T5933] netdevsim netdevsim0 netdevsim2: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   72.719441][ T5933] netdevsim netdevsim0 netdevsim3: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   72.752137][ T5933] ieee80211 phy5: Selected rate control algorithm 'min=
strel_ht'
[   72.780028][   T12] wlan0: Created IBSS using preconfigured BSSID 50:50:=
50:50:50:50
[   72.792389][ T5933] ieee80211 phy6: Selected rate control algorithm 'min=
strel_ht'
[   72.793485][   T12] wlan0: Creating new IBSS network, BSSID 50:50:50:50:=
50:50
[   72.821218][   T12] wlan1: Created IBSS using preconfigured BSSID 50:50:=
50:50:50:50
[   72.831461][   T12] wlan1: Creating new IBSS network, BSSID 50:50:50:50:=
50:50


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
go1.23.6.linux-amd64'
GOSUMDB=3D'sum.golang.org'
GOTMPDIR=3D''
GOTOOLCHAIN=3D'auto'
GOTOOLDIR=3D'/syzkaller/jobs/linux/gopath/pkg/mod/golang.org/toolchain@v0.0=
.1-go1.23.6.linux-amd64/pkg/tool/linux_amd64'
GOVCS=3D''
GOVERSION=3D'go1.23.6'
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
 -ffile-prefix-map=3D/tmp/go-build2577909696=3D/tmp/go-build -gno-record-gc=
c-switches'

git status (err=3D<nil>)
HEAD detached at 89d30d7360d
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
/syzkaller/prog.GitRevision=3D89d30d7360d4a366f8fdf00d6ac56cced7a45b0b -X '=
github.com/google/syzkaller/prog.gitRevisionDate=3D20250325-195331'" -o ./b=
in/linux_amd64/syz-execprog github.com/google/syzkaller/tools/syz-execprog
mkdir -p ./bin/linux_amd64
g++ -o ./bin/linux_amd64/syz-executor executor/executor.cc \
	-m64 -O2 -pthread -Wall -Werror -Wparentheses -Wunused-const-variable -Wfr=
ame-larger-than=3D16384 -Wno-stringop-overflow -Wno-array-bounds -Wno-forma=
t-overflow -Wno-unused-but-set-variable -Wno-unused-command-line-argument -=
static-pie -std=3Dc++17 -I. -Iexecutor/_include   -DGOOS_linux=3D1 -DGOARCH=
_amd64=3D1 \
	-DHOSTGOOS_linux=3D1 -DGIT_REVISION=3D\"89d30d7360d4a366f8fdf00d6ac56cced7=
a45b0b\"
/usr/bin/ld: /tmp/ccEnZsIz.o: in function `Connection::Connect(char const*,=
 char const*)':
executor.cc:(.text._ZN10Connection7ConnectEPKcS1_[_ZN10Connection7ConnectEP=
KcS1_]+0x104): warning: Using 'gethostbyname' in statically linked applicat=
ions requires at runtime the shared libraries from the glibc version used f=
or linking


Error text is too large and was truncated, full error text is at:
https://syzkaller.appspot.com/x/error.txt?x=3D1170aa4c580000


Tested on:

commit:         7d06015d Merge tag 'pci-v6.15-changes' of git://git.ke..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=3D6f5a67fe881fabe=
4
dashboard link: https://syzkaller.appspot.com/bug?extid=3D54e6c2176ba76c562=
17e
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debia=
n) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=3D101dc6785800=
00

