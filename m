Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C77D1E9B2F
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 23:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747525325; cv=none; b=c2vWSR6SnV5QX2ny3UFZvyeMRKYpMpzrhAYaLoK5gBdsRLRUQ869GOucLFR6Nq2Mzyze7slGby70qqmyuChL2HjpE6bboJ/9k+33MAGHV1QCkqCY8j/+VGLRfYN5mnfNWkjvfXmjAQIsV8mOiEaK64ve4mJJUVoq88TOl959hkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747525325; c=relaxed/simple;
	bh=WzVG/W0w69rUDiVfEFz6KffKjrRQqV6i8W3jAXk7TRU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=E0oQ/4kgMIKapaLDvStL1fUetNv5tHozBOaQWFWIIrZ20cbGqN4Gh2By4ZJJCSVIh7lheYFAY3HgYgvAb92YbcDFV+H1TaTYuAPoVj8qnBg65BeGwx0U1QyqxpncDqDFxzIQ1ijSKGMFZh5RkQaVSJQ3zlUEOeQ0X9o+ryOCT2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-8610d7ec4d3so506898339f.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 16:42:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747525322; x=1748130122;
        h=content-transfer-encoding:to:from:subject:message-id:in-reply-to
         :date:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0V2LvQgWhIveYFg9RTBX5UmE/LkuBSAJS+3O9RB/P6A=;
        b=xR30J0dS8w9qzRzPgC/LNerblBaPPk5/Uk6davz0ln/ZVkYjSUamffUY/vEdySl4A9
         hkX59dh7A0YY0nwPJNo+YUg+cfwMjZ8FlmKzJpG5tQcPrBM7XH4WGXcACZAlRDmWnWpK
         wrYJ9m14exZmlDmdhFZF6JBqshtUESE8Cocn3yIM9oHJxM+h8z449ihHNPnMxTxEXLG+
         YJEn0iCVwI0JVwFc9l+txeYDBqiS7is4FQOswTSbUK+3MVcWDs2yB9ahKRtvPME+0ryy
         FlQq18Y2dRd3PpLUul6IQMyODqw78E6c3KnHk3Gm88n/r8fBQUvTiwfe3e/ZafyJSjlC
         RFzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwU8LXI7Zi+wmxUN4fYijbm7eGybKArwfUhlV2a/nBuYjUFEu/GkQwZdIucWIip6qDqW377FvGsMz4TmI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwneqlrTvVQHfLDkFwlvnQXe7JkkLhGtqm2JZFQA8C6lle1ghvu
	joiAoN8Er+b5746VgsmfLSReu3/vG/5F4qZk5CSjhDBcx8w4MgxSA1zezi/lHeOag7nqrTE+MHY
	8wDMUZDCIGUYrUbXZJJUzENZLsTY6ltOBdXDysZMnsjHGuK/x3s7EaEVUIdQ=
X-Google-Smtp-Source: AGHT+IEUehHVJdfHUVWdRG/FoaHMDEbqiQlM1MejBeUy26vFNEHXEwEQs17M6wkU7rVtUQYE9UqRIEjYKOhM/hgsSl1qyLQBnHil
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:3e94:b0:864:4a82:15ec with SMTP id
 ca18e2360f4ac-86a231b703amr1273226039f.6.1747525322200; Sat, 17 May 2025
 16:42:02 -0700 (PDT)
Date: Sat, 17 May 2025 16:42:02 -0700
In-Reply-To: <20250517232751.2087-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68291eca.a00a0220.398d88.02b4.GAE@google.com>
Subject: Re: [syzbot] [bluetooth?] KASAN: slab-use-after-free Read in
 mgmt_remove_adv_monitor_complete (3)
From: syzbot <syzbot+feb0dc579bbe30a13190@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

 netdevsim netdevsim0 netdevsim3: set [1, 0] type 2 family 0 port 6081 - 0
[  104.385177][   T13] wlan0: Created IBSS using preconfigured BSSID 50:50:=
50:50:50:50
[  104.388595][   T13] wlan0: Creating new IBSS network, BSSID 50:50:50:50:=
50:50
[  104.426472][   T13] wlan1: Created IBSS using preconfigured BSSID 50:50:=
50:50:50:50
[  104.433660][   T13] wlan1: Creating new IBSS network, BSSID 50:50:50:50:=
50:50
[  104.766732][ T5428]=20
[  104.767865][ T5428] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
[  104.770638][ T5428] WARNING: possible recursive locking detected
[  104.773310][ T5428] 6.15.0-rc6-syzkaller-00346-g5723cc3450bc-dirty #0 No=
t tainted
[  104.777485][ T5428] --------------------------------------------
[  104.780117][ T5428] syz-executor/5428 is trying to acquire lock:
[  104.782906][ T5428] ffff88803ef90078 (&hdev->lock){+.+.}-{4:4}, at: mgmt=
_index_removed+0x10b/0x310
[  104.786940][ T5428]=20
[  104.786940][ T5428] but task is already holding lock:
[  104.790341][ T5428] ffff88803ef90078 (&hdev->lock){+.+.}-{4:4}, at: hci_=
unregister_dev+0x2d3/0x500
[  104.794363][ T5428]=20
[  104.794363][ T5428] other info that might help us debug this:
[  104.797740][ T5428]  Possible unsafe locking scenario:
[  104.797740][ T5428]=20
[  104.800954][ T5428]        CPU0
[  104.802424][ T5428]        ----
[  104.803931][ T5428]   lock(&hdev->lock);
[  104.805663][ T5428]   lock(&hdev->lock);
[  104.807445][ T5428]=20
[  104.807445][ T5428]  *** DEADLOCK ***
[  104.807445][ T5428]=20
[  104.810846][ T5428]  May be due to missing lock nesting notation
[  104.810846][ T5428]=20
[  104.814303][ T5428] 1 lock held by syz-executor/5428:
[  104.816520][ T5428]  #0: ffff88803ef90078 (&hdev->lock){+.+.}-{4:4}, at:=
 hci_unregister_dev+0x2d3/0x500
[  104.820530][ T5428]=20
[  104.820530][ T5428] stack backtrace:
[  104.823093][ T5428] CPU: 0 UID: 0 PID: 5428 Comm: syz-executor Not taint=
ed 6.15.0-rc6-syzkaller-00346-g5723cc3450bc-dirty #0 PREEMPT(full)=20
[  104.823106][ T5428] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), =
BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
[  104.823113][ T5428] Call Trace:
[  104.823119][ T5428]  <TASK>
[  104.823124][ T5428]  dump_stack_lvl+0x189/0x250
[  104.823142][ T5428]  ? __pfx_dump_stack_lvl+0x10/0x10
[  104.823155][ T5428]  ? __pfx__printk+0x10/0x10
[  104.823165][ T5428]  ? print_lock_name+0xde/0x100
[  104.823181][ T5428]  print_deadlock_bug+0x28b/0x2a0
[  104.823193][ T5428]  validate_chain+0x1a3f/0x2140
[  104.823202][ T5428]  ? _raw_spin_unlock_irqrestore+0xad/0x110
[  104.823220][ T5428]  __lock_acquire+0xaac/0xd20
[  104.823234][ T5428]  ? mgmt_index_removed+0x10b/0x310
[  104.823245][ T5428]  lock_acquire+0x120/0x360
[  104.823258][ T5428]  ? mgmt_index_removed+0x10b/0x310
[  104.823272][ T5428]  __mutex_lock+0x182/0xe80
[  104.823283][ T5428]  ? mgmt_index_removed+0x10b/0x310
[  104.823298][ T5428]  ? __mutex_trylock_common+0x153/0x260
[  104.823311][ T5428]  ? __pfx___mutex_trylock_common+0x10/0x10
[  104.823320][ T5428]  ? mgmt_index_removed+0x10b/0x310
[  104.823330][ T5428]  ? __pfx___mutex_lock+0x10/0x10
[  104.823343][ T5428]  ? rcu_is_watching+0x15/0xb0
[  104.823352][ T5428]  ? trace_contention_end+0x39/0x120
[  104.823362][ T5428]  ? hci_unregister_dev+0x20e/0x500
[  104.823376][ T5428]  mgmt_index_removed+0x10b/0x310
[  104.823386][ T5428]  ? __pfx___mutex_lock+0x10/0x10
[  104.823399][ T5428]  ? __pfx_mgmt_index_removed+0x10/0x10
[  104.823414][ T5428]  ? __pfx_hci_dev_close_sync+0x10/0x10
[  104.823423][ T5428]  ? up_write+0x1c4/0x420
[  104.823436][ T5428]  hci_unregister_dev+0x2db/0x500
[  104.823449][ T5428]  vhci_release+0x80/0xd0
[  104.823461][ T5428]  ? __pfx_vhci_release+0x10/0x10
[  104.823470][ T5428]  __fput+0x44c/0xa70
[  104.826159][ T5428]  task_work_run+0x1d1/0x260
[  104.826172][ T5428]  ? __pfx_task_work_run+0x10/0x10
[  104.826190][ T5428]  ? kmem_cache_free+0x192/0x3f0
[  104.826207][ T5428]  do_exit+0x8d6/0x2550
[  104.826221][ T5428]  ? __pfx_do_exit+0x10/0x10
[  104.826236][ T5428]  ? _raw_spin_unlock_irq+0x23/0x50
[  104.826246][ T5428]  ? lockdep_hardirqs_on+0x9c/0x150
[  104.826263][ T5428]  do_group_exit+0x21c/0x2d0
[  104.826275][ T5428]  __x64_sys_exit_group+0x3f/0x40
[  104.826288][ T5428]  x64_sys_call+0x21ba/0x21c0
[  104.826304][ T5428]  do_syscall_64+0xf6/0x210
[  104.826317][ T5428]  ? clear_bhb_loop+0x60/0xb0
[  104.826329][ T5428]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[  104.826339][ T5428] RIP: 0033:0x7f462058e969
[  104.826347][ T5428] Code: Unable to access opcode bytes at 0x7f462058e93=
f.
[  104.826352][ T5428] RSP: 002b:00007fff116e7dc8 EFLAGS: 00000246 ORIG_RAX=
: 00000000000000e7
[  104.826363][ T5428] RAX: ffffffffffffffda RBX: 00007f4620612297 RCX: 000=
07f462058e969
[  104.826371][ T5428] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 000=
0000000000043
[  104.826376][ T5428] RBP: 00007f46206122a9 R08: 00007fff116e5b67 R09: 000=
07f462077d260
[  104.826387][ T5428] R10: 0000000000000000 R11: 0000000000000246 R12: 000=
0000000000006
[  104.826392][ T5428] R13: 00007f462077d260 R14: 0000000000019780 R15: 000=
07fff116e7f70
[  104.826402][ T5428]  </TASK>
[  105.221855][   T48] netdevsim netdevsim4 netdevsim3 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[  106.001857][   T48] netdevsim netdevsim4 netdevsim2 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[  106.032391][   T48] netdevsim netdevsim4 netdevsim1 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[  106.062433][   T48] netdevsim netdevsim4 netdevsim0 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[  106.141381][   T48] bridge_slave_1: left allmulticast mode
[  106.143913][   T48] bridge_slave_1: left promiscuous mode
[  106.146436][   T48] bridge0: port 2(bridge_slave_1) entered disabled sta=
te
[  106.151053][   T48] bridge_slave_0: left allmulticast mode
[  106.153527][   T48] bridge_slave_0: left promiscuous mode
[  106.155988][   T48] bridge0: port 1(bridge_slave_0) entered disabled sta=
te
[  106.233284][   T48] bond0 (unregistering): (slave bond_slave_0): Releasi=
ng backup interface
[  106.238207][   T48] bond0 (unregistering): (slave bond_slave_1): Releasi=
ng backup interface
[  106.243434][   T48] bond0 (unregistering): Released all slaves
[  106.312852][   T48] hsr_slave_0: left promiscuous mode
[  106.315732][   T48] hsr_slave_1: left promiscuous mode
[  106.318406][   T48] batman_adv: batadv0: Interface deactivated: batadv_s=
lave_0
[  106.323733][   T48] batman_adv: batadv0: Removing interface: batadv_slav=
e_0
[  106.331831][   T48] batman_adv: batadv0: Interface deactivated: batadv_s=
lave_1
[  106.334694][   T48] batman_adv: batadv0: Removing interface: batadv_slav=
e_1
[  106.353667][   T48] veth1_macvtap: left promiscuous mode
[  106.356174][   T48] veth0_macvtap: left promiscuous mode
[  106.358681][   T48] veth1_vlan: left promiscuous mode
[  106.370871][   T48] veth0_vlan: left promiscuous mode
[  106.542004][   T48] team0 (unregistering): Port device team_slave_1 remo=
ved
[  106.553795][   T48] team0 (unregistering): Port device team_slave_0 remo=
ved

VM DIAGNOSIS:
23:41:34  Registers:
info registers vcpu 0

CPU#0
RAX=3D0000000000000072 RBX=3D0000000000000072 RCX=3D0000000000000000 RDX=3D=
00000000000003f8
RSI=3D0000000000000000 RDI=3D0000000000000020 RBP=3D00000000000003f8 RSP=3D=
ffffc900026d7010
R8 =3Dffff888000b80237 R9 =3D1ffff11000170046 R10=3Ddffffc0000000000 R11=3D=
ffffffff853e18b0
R12=3Ddffffc0000000000 R13=3Dffffffff99850c5f R14=3Dffffffff99b55c40 R15=3D=
0000000000000000
RIP=3Dffffffff853e192c RFL=3D00000002 [-------] CPL=3D0 II=3D0 A20=3D1 SMM=
=3D0 HLT=3D0
ES =3D0000 0000000000000000 ffffffff 00c00000
CS =3D0010 0000000000000000 ffffffff 00a09b00 DPL=3D0 CS64 [-RA]
SS =3D0018 0000000000000000 ffffffff 00c09300 DPL=3D0 DS   [-WA]
DS =3D0000 0000000000000000 ffffffff 00c00000
FS =3D0000 0000000000000000 ffffffff 00c00000
GS =3D0000 ffff88808d6c2000 ffffffff 00c00000
LDT=3D0000 0000000000000000 ffffffff 00c00000
TR =3D0040 fffffe0000003000 00004087 00008b00 DPL=3D0 TSS64-busy
GDT=3D     fffffe0000001000 0000007f
IDT=3D     fffffe0000000000 00000fff
CR0=3D80050033 CR2=3D0000000000570e60 CR3=3D000000000dd38000 CR4=3D00352ef0
DR0=3D0000000000000000 DR1=3D0000000000000000 DR2=3D0000000000000000 DR3=3D=
0000000000000000=20
DR6=3D00000000fffe0ff0 DR7=3D0000000000000400
EFER=3D0000000000000d01
FCW=3D037f FSW=3D0000 [ST=3D0] FTW=3D00 MXCSR=3D00001f80
FPR0=3D0000000000000000 0000 FPR1=3D0000000000000000 0000
FPR2=3D0000000000000000 0000 FPR3=3D0000000000000000 0000
FPR4=3D0000000000000000 0000 FPR5=3D0000000000000000 0000
FPR6=3D0000000000000000 0000 FPR7=3D0000000000000000 0000
Opmask00=3D0000000000000000 Opmask01=3D0000000000000000 Opmask02=3D00000000=
00000000 Opmask03=3D0000000000000000
Opmask04=3D0000000000000000 Opmask05=3D0000000000000000 Opmask06=3D00000000=
00000000 Opmask07=3D0000000000000000
ZMM00=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000 0000000000000000 00000000a60ce07b 00000000cec3662e
ZMM01=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000 0000000000000000 0000000000000000 6cee38cca59f481e
ZMM02=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000 0000000000000000 0000000000000000 0000000000000000
ZMM03=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000 0000000000000000 f17df3c66a3c5e1f d1def7dc81e8bad0
ZMM04=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000 0000000000000000 0000000000000000 0000000000001e40
ZMM05=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000 0000000000000000 0000000000000000 0000000000000040
ZMM06=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000 0000000000000000 000045fa00000003 28f51c0014361600
ZMM07=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000 0000000000000000 00000008000045fa 00000000000045fa
ZMM08=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000 0000000000000000 000045fa24a1fa00 25c0ee00e80dbf00
ZMM09=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000 0000000000000000 50947d00aa1c9d00 0000000022afe300
ZMM10=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000 0000000000000000 e75ef055f668ac60 5151fed073c43ec7
ZMM11=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000 0000000000000000 3ebecf9dfc61bdd9 0aecfc0672314c27
ZMM12=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000 0000000000000000 72c1e96872c1e968 72c1e96872c1e968
ZMM13=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000 0000000000000000 1bf6d1761bf6d176 1bf6d1761bf6d176
ZMM14=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000 0000000000000000 a54ff53a3c6ef372 bb67ae856a09e667
ZMM15=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000 0000000000000000 5be0cd191f83d9ab 9b05688c510e527f
ZMM16=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000 0000000000000000 0000000000000000 0000000000000000
ZMM17=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000 0000000000000000 0000000000000000 0000000000000000
ZMM18=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000 0000000000000000 0000000000000000 0000000000000000
ZMM19=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000 0000000000000000 0000000000000000 0000000000000000
ZMM20=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000 0000000000000000 0000000000000000 0000000000000000
ZMM21=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000 0000000000000000 0000000000000000 0000000000000000
ZMM22=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000 0000000000000000 0000000000000000 0000000000000000
ZMM23=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000 0000000000000000 0000000000000000 0000000000000000
ZMM24=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000 0000000000000000 0000000000000000 0000000000000000
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
 -ffile-prefix-map=3D/tmp/go-build4194737262=3D/tmp/go-build -gno-record-gc=
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
/usr/bin/ld: /tmp/ccbAI600.o: in function `Connection::Connect(char const*,=
 char const*)':
executor.cc:(.text._ZN10Connection7ConnectEPKcS1_[_ZN10Connection7ConnectEP=
KcS1_]+0x104): warning: Using 'gethostbyname' in statically linked applicat=
ions requires at runtime the shared libraries from the glibc version used f=
or linking


Error text is too large and was truncated, full error text is at:
https://syzkaller.appspot.com/x/error.txt?x=3D17375ef4580000


Tested on:

commit:         5723cc34 Merge tag 'dmaengine-fix-6.15' of git://git.k..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=3Dc3f0e807ec5d126=
8
dashboard link: https://syzkaller.appspot.com/bug?extid=3Dfeb0dc579bbe30a13=
190
compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-=
1~exp1~20250402004600.97), Debian LLD 20.1.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=3D17326ef45800=
00

