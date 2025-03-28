Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA721E1DF0
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 18:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743186484; cv=none; b=aeqVBYMLg6VN2XM8YTbY01WgrzbQJFlIhGT4Ye+RzMMbnOIYYkql1ln1JNUw7VJ+Mm5ETJ2bXj/pCjLpYc7utR/h5VDNqpy+Fh070WDmaT+L6nFX2ljlzgCVIKRmB6XgApMPnm5cnbfgxDfEj5I3npW93zd5hQtVAOmMV+2z+eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743186484; c=relaxed/simple;
	bh=ZbPxvbQbu8AHmnoUpbXDPXVlyUJiITM0vu85azZzMcw=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=SF+OxPn81dewVsUrs8gojli8hFVwdlwb/UAcycG37oOdmIx+keGeWU6u8aVAZTJk5gAYtJE7bD9jITjfsUEt4KlUd2KnYcdPvGW8GBhnpY4QsM+/M481dGBC3pZjaOD2Yu7/0SoRmLamMI6laIFGdQ7vatd9rBVVuBlpRaL6h/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3d5a9e7dd5aso25239205ab.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 11:28:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743186481; x=1743791281;
        h=content-transfer-encoding:to:from:subject:message-id:in-reply-to
         :date:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q7HpOC3m87J5B3UfYBLDNlyeYmsD81RJcjpTCx20Ah4=;
        b=w2gZZPlkgrJ8CFfQbrT3tqliA2eITPrK/ImF8oedCdL/Ev5Pw5OXTmJ8a0PUPgDjT4
         e1jVWBo1JW/Wx308SEEQxv1PUNbeuS2NjTuxZ6R7QoNE486gtd3Z2VN9uplo2mx9LD0F
         8uKc/ZhU9RMZwWBEwFfNaWM651rXSndv4k9mBth0QH4U8wm/DbSRIOUbnyVx1TfbOuM7
         wuJhJcVp3KgczYzRh6Xu0Tw9H/6zrxtlJi29+lEN2CwrW5nBTIQGoCyAliljv7P6EHoy
         oPHXlaw1OZzkx9xVFieED0H8rwT+WGzF37+xJwiq2P90loaV7TXK6b4ELOpfm50jkzga
         Rrwg==
X-Forwarded-Encrypted: i=1; AJvYcCVfcBmtWEgKgu90YKLUqbxvtrtixW9JUTvG4L7JEdNmwhFRuhCLBiuC9e8nEYbVHAoLcwR+NuHnwkf099A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlbRTQDNyPpQqe5M3Ca9U9hNSxUt59jxcxCbGqNxrcgRQapHhR
	qWeHqJH03LyPQBEzS+jqn5pG/kaIXgYzcVQIZQ3wCBH+dSfQHArv7MF1zywkncc5wMp6JKRk+bz
	6COAOyfLHeGLgexfddhs1RjNF5HnQZ37u1xmAdDKgxhLSdxksoA+ZZPI=
X-Google-Smtp-Source: AGHT+IF0NoA/Lt8THySDxorMiWmplxPwzcnetY1MpzCRSXAgOeocj+rZqQDnJBxNXIcLtn5QHt7YL7p/LcCicIDF6uFMaN7pINUZ
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:144a:b0:3d2:aa73:7b7a with SMTP id
 e9e14a558f8ab-3d5e0939424mr7698315ab.12.1743186481490; Fri, 28 Mar 2025
 11:28:01 -0700 (PDT)
Date: Fri, 28 Mar 2025 11:28:01 -0700
In-Reply-To: <85069.1743183981@warthog.procyon.org.uk>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67e6ea31.050a0220.2f20fe.0000.GAE@google.com>
Subject: Re: [syzbot] [afs?] [ntfs3?] BUG: sleeping function called from
 invalid context in ovl_cache_entry_new
From: syzbot <syzbot+54e6c2176ba76c56217e@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, dhowells@redhat.com, 
	linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org, 
	marc.dionne@auristor.com, ntfs3@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

syzbot tried to test the proposed patch but the build/boot failed:


[   67.301492][ T5869] veth1_macvtap: entered promiscuous mode
[   67.319170][ T5869] batman_adv: batadv0: Interface activated: batadv_sla=
ve_0
[   67.333396][ T5869] batman_adv: batadv0: Interface activated: batadv_sla=
ve_1
[   67.346831][ T5869] netdevsim netdevsim0 netdevsim0: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   67.356212][ T5869] netdevsim netdevsim0 netdevsim1: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   67.365100][ T5869] netdevsim netdevsim0 netdevsim2: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   67.373953][ T5869] netdevsim netdevsim0 netdevsim3: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   67.472722][ T5869] syz-executor (5869) used greatest stack depth: 19488=
 bytes left
[   67.501901][   T12] netdevsim netdevsim0 netdevsim3 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[   67.576996][   T12] netdevsim netdevsim0 netdevsim2 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[   67.661465][   T12] netdevsim netdevsim0 netdevsim1 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[   67.748009][   T12] netdevsim netdevsim0 netdevsim0 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[   67.949932][   T54] Bluetooth: hci0: unexpected cc 0x0c03 length: 249 > =
1
[   67.958916][   T54] Bluetooth: hci0: unexpected cc 0x1003 length: 249 > =
9
[   67.967344][   T54] Bluetooth: hci0: unexpected cc 0x1001 length: 249 > =
9
[   67.976923][   T54] Bluetooth: hci0: unexpected cc 0x0c23 length: 249 > =
4
[   67.985260][   T54] Bluetooth: hci0: unexpected cc 0x0c38 length: 249 > =
2
2025/03/28 18:27:39 executed programs: 0
[   69.164026][ T5141] Bluetooth: hci0: unexpected cc 0x0c03 length: 249 > =
1
[   69.173295][ T5141] Bluetooth: hci0: unexpected cc 0x1003 length: 249 > =
9
[   69.181734][ T5141] Bluetooth: hci0: unexpected cc 0x1001 length: 249 > =
9
[   69.190184][ T5141] Bluetooth: hci0: unexpected cc 0x0c23 length: 249 > =
4
[   69.199442][ T5141] Bluetooth: hci0: unexpected cc 0x0c38 length: 249 > =
2
[   69.295244][ T5935] chnl_net:caif_netlink_parms(): no params data found
[   69.338972][ T5935] bridge0: port 1(bridge_slave_0) entered blocking sta=
te
[   69.346368][ T5935] bridge0: port 1(bridge_slave_0) entered disabled sta=
te
[   69.353702][ T5935] bridge_slave_0: entered allmulticast mode
[   69.360993][ T5935] bridge_slave_0: entered promiscuous mode
[   69.368827][ T5935] bridge0: port 2(bridge_slave_1) entered blocking sta=
te
[   69.376982][ T5935] bridge0: port 2(bridge_slave_1) entered disabled sta=
te
[   69.384211][ T5935] bridge_slave_1: entered allmulticast mode
[   69.391737][ T5935] bridge_slave_1: entered promiscuous mode
[   69.416181][ T5935] bond0: (slave bond_slave_0): Enslaving as an active =
interface with an up link
[   69.427861][ T5935] bond0: (slave bond_slave_1): Enslaving as an active =
interface with an up link
[   69.452906][ T5935] team0: Port device team_slave_0 added
[   69.460371][ T5935] team0: Port device team_slave_1 added
[   69.481917][ T5935] batman_adv: batadv0: Adding interface: batadv_slave_=
0
[   69.489067][ T5935] batman_adv: batadv0: The MTU of interface batadv_sla=
ve_0 is too small (1500) to handle the transport of batman-adv packets. Pac=
kets going over this interface will be fragmented on layer2 which could imp=
act the performance. Setting the MTU to 1560 would solve the problem.
[   69.515903][ T5935] batman_adv: batadv0: Not using interface batadv_slav=
e_0 (retrying later): interface not active
[   69.529007][ T5935] batman_adv: batadv0: Adding interface: batadv_slave_=
1
[   69.536113][ T5935] batman_adv: batadv0: The MTU of interface batadv_sla=
ve_1 is too small (1500) to handle the transport of batman-adv packets. Pac=
kets going over this interface will be fragmented on layer2 which could imp=
act the performance. Setting the MTU to 1560 would solve the problem.
[   69.562895][ T5935] batman_adv: batadv0: Not using interface batadv_slav=
e_1 (retrying later): interface not active
[   69.592286][ T5935] hsr_slave_0: entered promiscuous mode
[   69.599283][ T5935] hsr_slave_1: entered promiscuous mode
[   69.605412][ T5935] debugfs: Directory 'hsr0' with parent 'hsr' already =
present!
[   69.613545][ T5935] Cannot create hsr debugfs directory
[   70.333954][   T12] bridge_slave_1: left allmulticast mode
[   70.340653][   T12] bridge_slave_1: left promiscuous mode
[   70.349079][   T12] bridge0: port 2(bridge_slave_1) entered disabled sta=
te
[   70.361384][   T12] bridge_slave_0: left allmulticast mode
[   70.373776][   T12] bridge_slave_0: left promiscuous mode
[   70.380530][   T12] bridge0: port 1(bridge_slave_0) entered disabled sta=
te
[   70.680418][   T12] bond0 (unregistering): (slave bond_slave_0): Releasi=
ng backup interface
[   70.691520][   T12] bond0 (unregistering): (slave bond_slave_1): Releasi=
ng backup interface
[   70.702701][   T12] bond0 (unregistering): Released all slaves
[   70.723743][ T5494]=20
[   70.726126][ T5494] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
[   70.732393][ T5494] WARNING: possible recursive locking detected
[   70.738574][ T5494] 6.14.0-syzkaller-07422-gacb4f33713b9-dirty #0 Not ta=
inted
[   70.745870][ T5494] --------------------------------------------
[   70.752151][ T5494] dhcpcd/5494 is trying to acquire lock:
[   70.758584][ T5494] ffff888031928d28 (&dev->lock){+.+.}-{4:4}, at: lapbe=
th_device_event+0x766/0xa20
[   70.767850][ T5494]=20
[   70.767850][ T5494] but task is already holding lock:
[   70.775239][ T5494] ffff888029048d28 (&dev->lock){+.+.}-{4:4}, at: dev_c=
hange_flags+0x120/0x270
[   70.784310][ T5494]=20
[   70.784310][ T5494] other info that might help us debug this:
[   70.792558][ T5494]  Possible unsafe locking scenario:
[   70.792558][ T5494]=20
[   70.800017][ T5494]        CPU0
[   70.803327][ T5494]        ----
[   70.806654][ T5494]   lock(&dev->lock);
[   70.810660][ T5494]   lock(&dev->lock);
[   70.814779][ T5494]=20
[   70.814779][ T5494]  *** DEADLOCK ***
[   70.814779][ T5494]=20
[   70.822942][ T5494]  May be due to missing lock nesting notation
[   70.822942][ T5494]=20
[   70.831273][ T5494] 2 locks held by dhcpcd/5494:
[   70.836134][ T5494]  #0: ffffffff900cf5c8 (rtnl_mutex){+.+.}-{4:4}, at: =
devinet_ioctl+0x34e/0x1d80
[   70.845571][ T5494]  #1: ffff888029048d28 (&dev->lock){+.+.}-{4:4}, at: =
dev_change_flags+0x120/0x270
[   70.854909][ T5494]=20
[   70.854909][ T5494] stack backtrace:
[   70.861028][ T5494] CPU: 0 UID: 0 PID: 5494 Comm: dhcpcd Not tainted 6.1=
4.0-syzkaller-07422-gacb4f33713b9-dirty #0 PREEMPT(full)=20
[   70.861048][ T5494] Hardware name: Google Google Compute Engine/Google C=
ompute Engine, BIOS Google 02/12/2025
[   70.861060][ T5494] Call Trace:
[   70.861068][ T5494]  <TASK>
[   70.861075][ T5494]  dump_stack_lvl+0x241/0x360
[   70.861096][ T5494]  ? __pfx_dump_stack_lvl+0x10/0x10
[   70.861111][ T5494]  ? __pfx__printk+0x10/0x10
[   70.861124][ T5494]  ? print_lock+0x171/0x1a0
[   70.861137][ T5494]  print_deadlock_bug+0x2be/0x2d0
[   70.861149][ T5494]  validate_chain+0x928/0x24e0
[   70.861161][ T5494]  ? stack_depot_save_flags+0x3a/0x970
[   70.861177][ T5494]  ? look_up_lock_class+0x7b/0x170
[   70.861193][ T5494]  ? register_lock_class+0x54/0x330
[   70.861210][ T5494]  __lock_acquire+0xad5/0xd80
[   70.861228][ T5494]  lock_acquire+0x116/0x2f0
[   70.861244][ T5494]  ? lapbeth_device_event+0x766/0xa20
[   70.861273][ T5494]  __mutex_lock+0x1a5/0x10c0
[   70.861290][ T5494]  ? lapbeth_device_event+0x766/0xa20
[   70.861308][ T5494]  ? ref_tracker_alloc+0x316/0x4c0
[   70.861322][ T5494]  ? lapbeth_device_event+0x766/0xa20
[   70.861337][ T5494]  ? rcu_is_watching+0x15/0xb0
[   70.861349][ T5494]  ? __pfx___mutex_lock+0x10/0x10
[   70.861367][ T5494]  ? __raw_spin_lock_init+0x45/0x100
[   70.861381][ T5494]  lapbeth_device_event+0x766/0xa20
[   70.861399][ T5494]  notifier_call_chain+0x1a5/0x3f0
[   70.861413][ T5494]  __dev_notify_flags+0x209/0x410
[   70.861426][ T5494]  ? __pfx___dev_notify_flags+0x10/0x10
[   70.861437][ T5494]  ? __dev_change_flags+0x517/0x700
[   70.861448][ T5494]  ? __pfx___mutex_lock+0x10/0x10
[   70.861463][ T5494]  ? __pfx___dev_change_flags+0x10/0x10
[   70.861474][ T5494]  ? __pfx___mutex_lock+0x10/0x10
[   70.861490][ T5494]  netif_change_flags+0xf0/0x1a0
[   70.861502][ T5494]  dev_change_flags+0x146/0x270
[   70.861520][ T5494]  devinet_ioctl+0xea4/0x1d80
[   70.861541][ T5494]  ? __pfx_devinet_ioctl+0x10/0x10
[   70.861558][ T5494]  ? get_user_ifreq+0x1bb/0x200
[   70.861572][ T5494]  inet_ioctl+0x3d9/0x4f0
[   70.861585][ T5494]  ? __pfx_inet_ioctl+0x10/0x10
[   70.861597][ T5494]  ? lockdep_hardirqs_on+0x9d/0x150
[   70.861616][ T5494]  ? tomoyo_path_number_perm+0x215/0x790
[   70.861629][ T5494]  sock_do_ioctl+0x15a/0x490
[   70.861646][ T5494]  ? __pfx_sock_do_ioctl+0x10/0x10
[   70.861661][ T5494]  ? fd_install+0x9c/0x4c0
[   70.861675][ T5494]  ? __asan_memset+0x23/0x50
[   70.861690][ T5494]  ? smack_file_ioctl+0x2a7/0x3b0
[   70.861709][ T5494]  sock_ioctl+0x644/0x900
[   70.861723][ T5494]  ? __pfx_sock_ioctl+0x10/0x10
[   70.861737][ T5494]  ? __sys_socket+0x209/0x3c0
[   70.861756][ T5494]  ? __pfx_sock_ioctl+0x10/0x10
[   70.861770][ T5494]  __se_sys_ioctl+0xf1/0x160
[   70.861787][ T5494]  do_syscall_64+0xf3/0x230
[   70.861803][ T5494]  ? clear_bhb_loop+0x45/0xa0
[   70.861817][ T5494]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   70.861834][ T5494] RIP: 0033:0x7fd9c5fd0d49
[   70.861847][ T5494] Code: 5c c3 48 8d 44 24 08 48 89 54 24 e0 48 89 44 2=
4 c0 48 8d 44 24 d0 48 89 44 24 c8 b8 10 00 00 00 c7 44 24 b8 10 00 00 00 0=
f 05 <41> 89 c0 3d 00 f0 ff ff 76 10 48 8b 15 ae 60 0d 00 f7 d8 41 83 c8
[   70.861857][ T5494] RSP: 002b:00007ffdb24aded8 EFLAGS: 00000246 ORIG_RAX=
: 0000000000000010
[   70.861871][ T5494] RAX: ffffffffffffffda RBX: 00007fd9c5f026c0 RCX: 000=
07fd9c5fd0d49
[   70.861880][ T5494] RDX: 00007ffdb24be0c8 RSI: 0000000000008914 RDI: 000=
000000000000e
[   70.861888][ T5494] RBP: 00007ffdb24ce288 R08: 00007ffdb24be088 R09: 000=
07ffdb24be038
[   70.861896][ T5494] R10: 0000000000000000 R11: 0000000000000246 R12: 000=
0000000000000
[   70.861903][ T5494] R13: 00007ffdb24be0c8 R14: 0000000000000028 R15: 000=
0000000008914
[   70.861915][ T5494]  </TASK>
[   71.236309][   T54] Bluetooth: hci0: command tx timeout
[   71.275432][   T12] hsr_slave_0: left promiscuous mode
[   71.281546][   T12] hsr_slave_1: left promiscuous mode
[   71.287764][   T12] batman_adv: batadv0: Interface deactivated: batadv_s=
lave_0
[   71.295331][   T12] batman_adv: batadv0: Removing interface: batadv_slav=
e_0
[   71.304070][   T12] batman_adv: batadv0: Interface deactivated: batadv_s=
lave_1
[   71.313996][   T12] batman_adv: batadv0: Removing interface: batadv_slav=
e_1
[   71.326049][   T12] veth1_macvtap: left promiscuous mode
[   71.332010][   T12] veth0_macvtap: left promiscuous mode
[   71.338664][   T12] veth1_vlan: left promiscuous mode
[   71.344086][   T12] veth0_vlan: left promiscuous mode
[   71.499375][   T12] team0 (unregistering): Port device team_slave_1 remo=
ved
[   71.518998][   T12] team0 (unregistering): Port device team_slave_0 remo=
ved
[   71.768553][ T5935] netdevsim netdevsim0 netdevsim0: renamed from eth0
[   71.782330][ T5935] netdevsim netdevsim0 netdevsim1: renamed from eth1
[   71.800415][ T5935] netdevsim netdevsim0 netdevsim2: renamed from eth2
[   71.807733][ T1299] ieee802154 phy0 wpan0: encryption failed: -22
[   71.814222][ T1299] ieee802154 phy1 wpan1: encryption failed: -22
[   71.827908][ T5935] netdevsim netdevsim0 netdevsim3: renamed from eth3
[   71.908849][ T5935] 8021q: adding VLAN 0 to HW filter on device bond0
[   71.927794][ T5935] 8021q: adding VLAN 0 to HW filter on device team0
[   71.939414][   T52] bridge0: port 1(bridge_slave_0) entered blocking sta=
te
[   71.946587][   T52] bridge0: port 1(bridge_slave_0) entered forwarding s=
tate
[   71.960586][   T52] bridge0: port 2(bridge_slave_1) entered blocking sta=
te
[   71.967847][   T52] bridge0: port 2(bridge_slave_1) entered forwarding s=
tate
[   72.100315][ T5935] 8021q: adding VLAN 0 to HW filter on device batadv0
[   72.135076][ T5935] veth0_vlan: entered promiscuous mode
[   72.150064][ T5935] veth1_vlan: entered promiscuous mode
[   72.174924][ T5935] veth0_macvtap: entered promiscuous mode
[   72.185557][ T5935] veth1_macvtap: entered promiscuous mode
[   72.204865][ T5935] batman_adv: batadv0: Interface activated: batadv_sla=
ve_0
[   72.221827][ T5935] batman_adv: batadv0: Interface activated: batadv_sla=
ve_1
[   72.233244][ T5935] netdevsim netdevsim0 netdevsim0: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   72.243419][ T5935] netdevsim netdevsim0 netdevsim1: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   72.254138][ T5935] netdevsim netdevsim0 netdevsim2: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   72.265046][ T5935] netdevsim netdevsim0 netdevsim3: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   72.303411][ T5935] ieee80211 phy5: Selected rate control algorithm 'min=
strel_ht'
[   72.328013][ T3439] wlan0: Created IBSS using preconfigured BSSID 50:50:=
50:50:50:50
[   72.329376][ T5935] ieee80211 phy6: Selected rate control algorithm 'min=
strel_ht'
[   72.350429][ T3439] wlan0: Creating new IBSS network, BSSID 50:50:50:50:=
50:50
[   72.373018][   T52] wlan1: Created IBSS using preconfigured BSSID 50:50:=
50:50:50:50
[   72.382317][   T52] wlan1: Creating new IBSS network, BSSID 50:50:50:50:=
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
 -ffile-prefix-map=3D/tmp/go-build3336433996=3D/tmp/go-build -gno-record-gc=
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
/usr/bin/ld: /tmp/cc58UvIY.o: in function `Connection::Connect(char const*,=
 char const*)':
executor.cc:(.text._ZN10Connection7ConnectEPKcS1_[_ZN10Connection7ConnectEP=
KcS1_]+0x104): warning: Using 'gethostbyname' in statically linked applicat=
ions requires at runtime the shared libraries from the glibc version used f=
or linking


Error text is too large and was truncated, full error text is at:
https://syzkaller.appspot.com/x/error.txt?x=3D13d22a4c580000


Tested on:

commit:         acb4f337 Merge tag 'm68knommu-for-v6.15' of git://git...
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=3D982413b40f90fdf=
8
dashboard link: https://syzkaller.appspot.com/bug?extid=3D54e6c2176ba76c562=
17e
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debia=
n) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=3D13de743f9800=
00

