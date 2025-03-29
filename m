Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56819F9D9
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 05:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743227469; cv=none; b=oJSO+25Ro/ocMgTGHd7LMnMoND0B6B8xdMfmR2/PHBphAmVChAXB85VxSHCGrr4b4Ysg1A70jb0+i10ER4fzfWH4Wp3db9kfThrxrxi+hW2LX4Wz3ZL3KDFlR5DkPG81hnDbtxXHJlQTU0xA12m8rWl1t031WpnyzPDrkwisoTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743227469; c=relaxed/simple;
	bh=TUDW5GbGDTVAwT7uVKPs2FlIzD6KwJNQHS6FSNNUy3E=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=kvKUQ/Tnd+yTbWv5McrUrtJ7f+kGurc7J+SM+KkktE6B84ROWdDWuxYBCuiOmDxUIyJ7NcuyAmsECfNN/lBF+kIEE4n7WhgaHHzN/3pyBj/1Aw5baR777W4w5N6xJokHy3Vf84MW+Zt0jn59WZ+JYtxMoRgwQwdTfAsf5vn0ltk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3d443811f04so26974895ab.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 22:51:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743227465; x=1743832265;
        h=content-transfer-encoding:to:from:subject:message-id:in-reply-to
         :date:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cT5ANe0+oX+Gtkc2KOGFVJFO4DMYS2cL4TdAtq5evQM=;
        b=qSqU8mPZFXCdgLv5WW5Yi+oVWPcXCMs1yXecdJVkonTvfcrNkzywvPxZe1ZYS2LGf6
         pHA+FTpnvwUkBGrfmN2LXRxz2a1NvMywRTmItvI6Owt72xaBDICER+To6w9sq26gG22K
         GhXs0kWcahac8zcq2HLFQfFMJKub/lCqIRebkAxE2ZbCMUqWxvIeZ2CXrr0HLYpvxBao
         CGkRjCemWPPOwjcm+QR7+kYtYSOOVCwx2gQCJVFLrOvKvEuAeD/fUNPqhvAa/T3s2v84
         9wPiq92tc8YkAa1K2aFDekYH7rFbbtzPDMaRDizgmZqU7YlsrCvPHsAeHePCp91G6FUx
         q78g==
X-Forwarded-Encrypted: i=1; AJvYcCW5NyufYkMrA553xQlUSrPlPqetp/SxQryHLQuHE4WCWsqMmbWsyxuOEPOmwojsGuBqwufIBK1ibdXwKy8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAjqhH7+o12eCjeE3qQSFAGlmdcJELFBWxjoqb5H8kOormsr3y
	fCtrv5qLKUUdA/8TNOtVbQgWalfIkBi2NxqmZ25gNzmIXXxuLFE1yk1Jt62NOKpwr4uZrgVmIMy
	+ebMRo790xLqKTiQ94ApZP8yZqj31wlz4gTO8lU1y7TbaybWB7aRVUvg=
X-Google-Smtp-Source: AGHT+IE69q6PRuUXQsWk4EbfnCaQ4iq+hTMpWj7OppbZikKcTGs1OaaDNDn+8XN7vfnY/wB7CbvYcEKMOKQ4d+8aJvSOr3NFxvY3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:cd8a:0:b0:3d4:6dd2:3989 with SMTP id
 e9e14a558f8ab-3d5e0a09a21mr21852985ab.20.1743227465250; Fri, 28 Mar 2025
 22:51:05 -0700 (PDT)
Date: Fri, 28 Mar 2025 22:51:05 -0700
In-Reply-To: <tencent_FAEE0ECDAC784E6DBC2C896FC094ACE96A0A@qq.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67e78a49.050a0220.1547ec.0019.GAE@google.com>
Subject: Re: [syzbot] [afs?] BUG: sleeping function called from invalid
 context in __alloc_frozen_pages_noprof
From: syzbot <syzbot+3b6c5c6a1d0119b687a1@syzkaller.appspotmail.com>
To: eadavis@qq.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

mode
[   69.518774][ T5887] batman_adv: batadv0: Interface activated: batadv_sla=
ve_0
[   69.531611][ T5887] batman_adv: batadv0: Interface activated: batadv_sla=
ve_1
[   69.542159][ T5887] netdevsim netdevsim0 netdevsim0: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   69.551960][ T5887] netdevsim netdevsim0 netdevsim1: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   69.560878][ T5887] netdevsim netdevsim0 netdevsim2: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   69.570005][ T5887] netdevsim netdevsim0 netdevsim3: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   69.691353][ T5887] syz-executor (5887) used greatest stack depth: 19616=
 bytes left
[   69.711047][   T13] netdevsim netdevsim0 netdevsim3 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[   69.775907][   T13] netdevsim netdevsim0 netdevsim2 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[   69.840598][   T13] netdevsim netdevsim0 netdevsim1 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[   69.898295][   T13] netdevsim netdevsim0 netdevsim0 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[   70.157572][ T5919] Bluetooth: hci0: unexpected cc 0x0c03 length: 249 > =
1
[   70.166420][ T5919] Bluetooth: hci0: unexpected cc 0x1003 length: 249 > =
9
[   70.174104][ T5919] Bluetooth: hci0: unexpected cc 0x1001 length: 249 > =
9
[   70.183110][ T5919] Bluetooth: hci0: unexpected cc 0x0c23 length: 249 > =
4
[   70.192891][ T5919] Bluetooth: hci0: unexpected cc 0x0c38 length: 249 > =
2
2025/03/29 05:50:44 executed programs: 0
[   70.660061][ T5919] Bluetooth: hci0: unexpected cc 0x0c03 length: 249 > =
1
[   70.669464][ T5919] Bluetooth: hci0: unexpected cc 0x1003 length: 249 > =
9
[   70.678754][ T5919] Bluetooth: hci0: unexpected cc 0x1001 length: 249 > =
9
[   70.687373][ T5919] Bluetooth: hci0: unexpected cc 0x0c23 length: 249 > =
4
[   70.695598][ T5919] Bluetooth: hci0: unexpected cc 0x0c38 length: 249 > =
2
[   70.785794][ T5933] chnl_net:caif_netlink_parms(): no params data found
[   70.828056][ T5933] bridge0: port 1(bridge_slave_0) entered blocking sta=
te
[   70.835717][ T5933] bridge0: port 1(bridge_slave_0) entered disabled sta=
te
[   70.842920][ T5933] bridge_slave_0: entered allmulticast mode
[   70.850250][ T5933] bridge_slave_0: entered promiscuous mode
[   70.858138][ T5933] bridge0: port 2(bridge_slave_1) entered blocking sta=
te
[   70.866441][ T5933] bridge0: port 2(bridge_slave_1) entered disabled sta=
te
[   70.873655][ T5933] bridge_slave_1: entered allmulticast mode
[   70.880415][ T5933] bridge_slave_1: entered promiscuous mode
[   70.910123][ T5933] bond0: (slave bond_slave_0): Enslaving as an active =
interface with an up link
[   70.921677][ T5933] bond0: (slave bond_slave_1): Enslaving as an active =
interface with an up link
[   70.946174][ T5933] team0: Port device team_slave_0 added
[   70.955650][ T5933] team0: Port device team_slave_1 added
[   70.972195][ T5933] batman_adv: batadv0: Adding interface: batadv_slave_=
0
[   70.979290][ T5933] batman_adv: batadv0: The MTU of interface batadv_sla=
ve_0 is too small (1500) to handle the transport of batman-adv packets. Pac=
kets going over this interface will be fragmented on layer2 which could imp=
act the performance. Setting the MTU to 1560 would solve the problem.
[   71.005779][ T5933] batman_adv: batadv0: Not using interface batadv_slav=
e_0 (retrying later): interface not active
[   71.018566][ T5933] batman_adv: batadv0: Adding interface: batadv_slave_=
1
[   71.025719][ T5933] batman_adv: batadv0: The MTU of interface batadv_sla=
ve_1 is too small (1500) to handle the transport of batman-adv packets. Pac=
kets going over this interface will be fragmented on layer2 which could imp=
act the performance. Setting the MTU to 1560 would solve the problem.
[   71.052143][ T5933] batman_adv: batadv0: Not using interface batadv_slav=
e_1 (retrying later): interface not active
[   71.084918][ T5933] hsr_slave_0: entered promiscuous mode
[   71.091172][ T5933] hsr_slave_1: entered promiscuous mode
[   71.097607][ T5933] debugfs: Directory 'hsr0' with parent 'hsr' already =
present!
[   71.105530][ T5933] Cannot create hsr debugfs directory
[   71.467764][ T1299] ieee802154 phy0 wpan0: encryption failed: -22
[   71.474219][ T1299] ieee802154 phy1 wpan1: encryption failed: -22
[   72.755330][ T5137] Bluetooth: hci0: command tx timeout
[   73.078740][   T13] bridge_slave_1: left allmulticast mode
[   73.087005][   T13] bridge_slave_1: left promiscuous mode
[   73.094074][   T13] bridge0: port 2(bridge_slave_1) entered disabled sta=
te
[   73.105207][   T13] bridge_slave_0: left allmulticast mode
[   73.110923][   T13] bridge_slave_0: left promiscuous mode
[   73.117589][   T13] bridge0: port 1(bridge_slave_0) entered disabled sta=
te
[   73.292536][   T13] bond0 (unregistering): (slave bond_slave_0): Releasi=
ng backup interface
[   73.303595][   T13] bond0 (unregistering): (slave bond_slave_1): Releasi=
ng backup interface
[   73.316478][   T13] bond0 (unregistering): Released all slaves
[   73.414239][   T13] hsr_slave_0: left promiscuous mode
[   73.424392][   T13] hsr_slave_1: left promiscuous mode
[   73.430886][   T13] batman_adv: batadv0: Interface deactivated: batadv_s=
lave_0
[   73.442780][   T13] batman_adv: batadv0: Removing interface: batadv_slav=
e_0
[   73.451616][   T13] batman_adv: batadv0: Interface deactivated: batadv_s=
lave_1
[   73.460757][   T13] batman_adv: batadv0: Removing interface: batadv_slav=
e_1
[   73.477508][   T13] veth1_macvtap: left promiscuous mode
[   73.483334][   T13] veth0_macvtap: left promiscuous mode
[   73.489387][   T13] veth1_vlan: left promiscuous mode
[   73.496421][   T13] veth0_vlan: left promiscuous mode
[   73.767218][   T13] team0 (unregistering): Port device team_slave_1 remo=
ved
[   73.792742][   T13] team0 (unregistering): Port device team_slave_0 remo=
ved
[   74.013067][ T5491]=20
[   74.015514][ T5491] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
[   74.021675][ T5491] WARNING: possible recursive locking detected
[   74.027830][ T5491] 6.14.0-syzkaller-09584-g7d06015d936c-dirty #0 Not ta=
inted
[   74.035096][ T5491] --------------------------------------------
[   74.041229][ T5491] dhcpcd/5491 is trying to acquire lock:
[   74.046854][ T5491] ffff88807edb8d28 (&dev->lock){+.+.}-{4:4}, at: lapbe=
th_device_event+0x766/0xa20
[   74.056138][ T5491]=20
[   74.056138][ T5491] but task is already holding lock:
[   74.064028][ T5491] ffff888069be8d28 (&dev->lock){+.+.}-{4:4}, at: dev_c=
hange_flags+0x120/0x270
[   74.072906][ T5491]=20
[   74.072906][ T5491] other info that might help us debug this:
[   74.080951][ T5491]  Possible unsafe locking scenario:
[   74.080951][ T5491]=20
[   74.088384][ T5491]        CPU0
[   74.091676][ T5491]        ----
[   74.094943][ T5491]   lock(&dev->lock);
[   74.098914][ T5491]   lock(&dev->lock);
[   74.102886][ T5491]=20
[   74.102886][ T5491]  *** DEADLOCK ***
[   74.102886][ T5491]=20
[   74.111023][ T5491]  May be due to missing lock nesting notation
[   74.111023][ T5491]=20
[   74.119346][ T5491] 2 locks held by dhcpcd/5491:
[   74.124095][ T5491]  #0: ffffffff900d3988 (rtnl_mutex){+.+.}-{4:4}, at: =
devinet_ioctl+0x34e/0x1d80
[   74.133367][ T5491]  #1: ffff888069be8d28 (&dev->lock){+.+.}-{4:4}, at: =
dev_change_flags+0x120/0x270
[   74.142678][ T5491]=20
[   74.142678][ T5491] stack backtrace:
[   74.148570][ T5491] CPU: 1 UID: 0 PID: 5491 Comm: dhcpcd Not tainted 6.1=
4.0-syzkaller-09584-g7d06015d936c-dirty #0 PREEMPT(full)=20
[   74.148586][ T5491] Hardware name: Google Google Compute Engine/Google C=
ompute Engine, BIOS Google 02/12/2025
[   74.148597][ T5491] Call Trace:
[   74.148603][ T5491]  <TASK>
[   74.148609][ T5491]  dump_stack_lvl+0x241/0x360
[   74.148627][ T5491]  ? __pfx_dump_stack_lvl+0x10/0x10
[   74.148641][ T5491]  ? __pfx__printk+0x10/0x10
[   74.148656][ T5491]  ? print_lock+0x171/0x1a0
[   74.148668][ T5491]  print_deadlock_bug+0x2be/0x2d0
[   74.148681][ T5491]  validate_chain+0x928/0x24e0
[   74.148693][ T5491]  ? stack_depot_save_flags+0x3a/0x970
[   74.148711][ T5491]  ? look_up_lock_class+0x7b/0x170
[   74.148723][ T5491]  ? register_lock_class+0x54/0x330
[   74.148740][ T5491]  __lock_acquire+0xad5/0xd80
[   74.148757][ T5491]  lock_acquire+0x116/0x2f0
[   74.148772][ T5491]  ? lapbeth_device_event+0x766/0xa20
[   74.148788][ T5491]  __mutex_lock+0x1a5/0x10c0
[   74.148799][ T5491]  ? lapbeth_device_event+0x766/0xa20
[   74.148812][ T5491]  ? ref_tracker_alloc+0x316/0x4c0
[   74.148829][ T5491]  ? lapbeth_device_event+0x766/0xa20
[   74.148840][ T5491]  ? rcu_is_watching+0x15/0xb0
[   74.148852][ T5491]  ? __pfx___mutex_lock+0x10/0x10
[   74.148866][ T5491]  ? __raw_spin_lock_init+0x45/0x100
[   74.148880][ T5491]  lapbeth_device_event+0x766/0xa20
[   74.148893][ T5491]  notifier_call_chain+0x1a5/0x3f0
[   74.148907][ T5491]  __dev_notify_flags+0x209/0x410
[   74.148923][ T5491]  ? __pfx___dev_notify_flags+0x10/0x10
[   74.148935][ T5491]  ? __dev_change_flags+0x517/0x700
[   74.148949][ T5491]  ? __pfx___mutex_lock+0x10/0x10
[   74.148960][ T5491]  ? __pfx___dev_change_flags+0x10/0x10
[   74.148975][ T5491]  ? __pfx___mutex_lock+0x10/0x10
[   74.148986][ T5491]  netif_change_flags+0xf0/0x1a0
[   74.149000][ T5491]  dev_change_flags+0x146/0x270
[   74.149015][ T5491]  devinet_ioctl+0xea4/0x1d80
[   74.149030][ T5491]  ? __pfx_devinet_ioctl+0x10/0x10
[   74.149042][ T5491]  ? get_user_ifreq+0x1bb/0x200
[   74.149058][ T5491]  inet_ioctl+0x3d9/0x4f0
[   74.149073][ T5491]  ? __pfx_inet_ioctl+0x10/0x10
[   74.149087][ T5491]  ? lockdep_hardirqs_on+0x9d/0x150
[   74.149109][ T5491]  ? tomoyo_path_number_perm+0x215/0x790
[   74.149122][ T5491]  sock_do_ioctl+0x15a/0x490
[   74.149134][ T5491]  ? __pfx_sock_do_ioctl+0x10/0x10
[   74.149146][ T5491]  ? fd_install+0x9c/0x4c0
[   74.149159][ T5491]  ? __asan_memset+0x23/0x50
[   74.149173][ T5491]  ? smack_file_ioctl+0x2a7/0x3b0
[   74.149186][ T5491]  sock_ioctl+0x644/0x900
[   74.149202][ T5491]  ? __pfx_sock_ioctl+0x10/0x10
[   74.149218][ T5491]  ? __sys_socket+0x209/0x3c0
[   74.149231][ T5491]  ? __pfx_sock_ioctl+0x10/0x10
[   74.149248][ T5491]  __se_sys_ioctl+0xf1/0x160
[   74.149265][ T5491]  do_syscall_64+0xf3/0x230
[   74.149276][ T5491]  ? clear_bhb_loop+0x45/0xa0
[   74.149289][ T5491]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   74.149303][ T5491] RIP: 0033:0x7ffb21c81d49
[   74.149318][ T5491] Code: 5c c3 48 8d 44 24 08 48 89 54 24 e0 48 89 44 2=
4 c0 48 8d 44 24 d0 48 89 44 24 c8 b8 10 00 00 00 c7 44 24 b8 10 00 00 00 0=
f 05 <41> 89 c0 3d 00 f0 ff ff 76 10 48 8b 15 ae 60 0d 00 f7 d8 41 83 c8
[   74.149328][ T5491] RSP: 002b:00007ffe55611008 EFLAGS: 00000246 ORIG_RAX=
: 0000000000000010
[   74.149341][ T5491] RAX: ffffffffffffffda RBX: 00007ffb21bb36c0 RCX: 000=
07ffb21c81d49
[   74.149350][ T5491] RDX: 00007ffe556211f8 RSI: 0000000000008914 RDI: 000=
000000000000e
[   74.149358][ T5491] RBP: 00007ffe556313b8 R08: 00007ffe556211b8 R09: 000=
07ffe55621168
[   74.149366][ T5491] R10: 0000000000000000 R11: 0000000000000246 R12: 000=
0000000000000
[   74.149374][ T5491] R13: 00007ffe556211f8 R14: 0000000000000028 R15: 000=
0000000008914
[   74.149385][ T5491]  </TASK>
[   74.714069][ T5933] netdevsim netdevsim0 netdevsim0: renamed from eth0
[   74.724023][ T5933] netdevsim netdevsim0 netdevsim1: renamed from eth1
[   74.733084][ T5933] netdevsim netdevsim0 netdevsim2: renamed from eth2
[   74.748582][ T5933] netdevsim netdevsim0 netdevsim3: renamed from eth3
[   74.796465][ T5933] 8021q: adding VLAN 0 to HW filter on device bond0
[   74.810222][ T5933] 8021q: adding VLAN 0 to HW filter on device team0
[   74.821065][   T78] bridge0: port 1(bridge_slave_0) entered blocking sta=
te
[   74.828458][   T78] bridge0: port 1(bridge_slave_0) entered forwarding s=
tate
[   74.838471][ T5137] Bluetooth: hci0: command tx timeout
[   74.847260][ T1079] bridge0: port 2(bridge_slave_1) entered blocking sta=
te
[   74.854495][ T1079] bridge0: port 2(bridge_slave_1) entered forwarding s=
tate
[   74.983183][ T5933] 8021q: adding VLAN 0 to HW filter on device batadv0
[   75.017511][ T5933] veth0_vlan: entered promiscuous mode
[   75.027982][ T5933] veth1_vlan: entered promiscuous mode
[   75.051472][ T5933] veth0_macvtap: entered promiscuous mode
[   75.060843][ T5933] veth1_macvtap: entered promiscuous mode
[   75.078135][ T5933] batman_adv: batadv0: Interface activated: batadv_sla=
ve_0
[   75.091091][ T5933] batman_adv: batadv0: Interface activated: batadv_sla=
ve_1
[   75.102457][ T5933] netdevsim netdevsim0 netdevsim0: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   75.111555][ T5933] netdevsim netdevsim0 netdevsim1: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   75.122011][ T5933] netdevsim netdevsim0 netdevsim2: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   75.131879][ T5933] netdevsim netdevsim0 netdevsim3: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   75.163469][ T5933] ieee80211 phy5: Selected rate control algorithm 'min=
strel_ht'
[   75.183636][   T36] wlan0: Created IBSS using preconfigured BSSID 50:50:=
50:50:50:50
[   75.193456][ T5933] ieee80211 phy6: Selected rate control algorithm 'min=
strel_ht'
[   75.202887][   T36] wlan0: Creating new IBSS network, BSSID 50:50:50:50:=
50:50
[   75.224644][ T1079] wlan1: Created IBSS using preconfigured BSSID 50:50:=
50:50:50:50
[   75.232795][ T1079] wlan1: Creating new IBSS network, BSSID 50:50:50:50:=
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
GOMODCACHE=3D'/syzkaller/jobs-2/linux/gopath/pkg/mod'
GONOPROXY=3D''
GONOSUMDB=3D''
GOOS=3D'linux'
GOPATH=3D'/syzkaller/jobs-2/linux/gopath'
GOPRIVATE=3D''
GOPROXY=3D'https://proxy.golang.org,direct'
GOROOT=3D'/syzkaller/jobs-2/linux/gopath/pkg/mod/golang.org/toolchain@v0.0.=
1-go1.23.6.linux-amd64'
GOSUMDB=3D'sum.golang.org'
GOTMPDIR=3D''
GOTOOLCHAIN=3D'auto'
GOTOOLDIR=3D'/syzkaller/jobs-2/linux/gopath/pkg/mod/golang.org/toolchain@v0=
.0.1-go1.23.6.linux-amd64/pkg/tool/linux_amd64'
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
GOMOD=3D'/syzkaller/jobs-2/linux/gopath/src/github.com/google/syzkaller/go.=
mod'
GOWORK=3D''
CGO_CFLAGS=3D'-O2 -g'
CGO_CPPFLAGS=3D''
CGO_CXXFLAGS=3D'-O2 -g'
CGO_FFLAGS=3D'-O2 -g'
CGO_LDFLAGS=3D'-O2 -g'
PKG_CONFIG=3D'pkg-config'
GOGCCFLAGS=3D'-fPIC -m64 -pthread -Wl,--no-gc-sections -fmessage-length=3D0=
 -ffile-prefix-map=3D/tmp/go-build1160221299=3D/tmp/go-build -gno-record-gc=
c-switches'

git status (err=3D<nil>)
HEAD detached at 875573af37b
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
/syzkaller/prog.GitRevision=3D875573af37b09758ab48042f2b8a368097204888 -X '=
github.com/google/syzkaller/prog.gitRevisionDate=3D20250323-222138'" -o ./b=
in/linux_amd64/syz-execprog github.com/google/syzkaller/tools/syz-execprog
mkdir -p ./bin/linux_amd64
g++ -o ./bin/linux_amd64/syz-executor executor/executor.cc \
	-m64 -O2 -pthread -Wall -Werror -Wparentheses -Wunused-const-variable -Wfr=
ame-larger-than=3D16384 -Wno-stringop-overflow -Wno-array-bounds -Wno-forma=
t-overflow -Wno-unused-but-set-variable -Wno-unused-command-line-argument -=
static-pie -std=3Dc++17 -I. -Iexecutor/_include   -DGOOS_linux=3D1 -DGOARCH=
_amd64=3D1 \
	-DHOSTGOOS_linux=3D1 -DGIT_REVISION=3D\"875573af37b09758ab48042f2b8a368097=
204888\"
/usr/bin/ld: /tmp/cc8wE2TU.o: in function `Connection::Connect(char const*,=
 char const*)':
executor.cc:(.text._ZN10Connection7ConnectEPKcS1_[_ZN10Connection7ConnectEP=
KcS1_]+0x104): warning: Using 'gethostbyname' in statically linked applicat=
ions requires at runtime the shared libraries from the glibc version used f=
or linking


Error text is too large and was truncated, full error text is at:
https://syzkaller.appspot.com/x/error.txt?x=3D1357064c580000


Tested on:

commit:         7d06015d Merge tag 'pci-v6.15-changes' of git://git.ke..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=3D6f5a67fe881fabe=
4
dashboard link: https://syzkaller.appspot.com/bug?extid=3D3b6c5c6a1d0119b68=
7a1
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debia=
n) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=3D12c6bbb05800=
00

