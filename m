Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F93E156C6F
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 19:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747252265; cv=none; b=WeqlcKPd9VGzdKMmvKx75IkqkkYnHIOebaG+Cle51Qitt/KbZuwW6dXYAgSbTKcwxOckmirpYors3bf1vv7Zv0iicfZuriL+UIKxYY1iVukcWHdBag9CuPxnAWiSNLSOl6L+LaVcL+l1mMGqOt8p8ZxEmFZdFwDShCnmzHhfbXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747252265; c=relaxed/simple;
	bh=anhQ/nBvWdOgd1EJB5oynYBmQi4e2dMyX3mNWWX7QDo=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=VuSWpjAxlPpm/r6xIJgTWxpiMHQXfT/aIwWIb9uy/m+Y51FiocBgqvyQlT6fdXz5DB4C4E5rvirpxg41zQD0OGwB4IKDyJ0oHzSr3sdEEVuscMBW2ZkCFAEDKor5sW/7hsgBGsTVZ3uyY3SqzCePP9WGjeP0PUfgnh7oAFZvhvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3db6ddceeebso3140795ab.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 12:51:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747252262; x=1747857062;
        h=content-transfer-encoding:to:from:subject:message-id:in-reply-to
         :date:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qpMf53SVk29cj5kO9sZ01yXK60J4qgtuyXUjPxQ0hTM=;
        b=jkgEirOY6Bkr8jy9InGPMhoeaQ7j3H5GeU9XdtKa7/41v953q1Sp5N8/+TY0Ge/kj7
         +2TAEI+ogZBw2q3JckHujbP8IUIlGrr7EMkrWUA0x4qPVij1w7Cq+wRH0Y0hHzWaZoe8
         7Mq+rgp8ATPZLOO8N1BCbDQwVEEKiLqBmt1Y06X7zV/H0OEXMCwuDpVV1fqD/tGLyhC3
         S/aM/nLd46Ust0/G3+5GpLuNTj1NB8oVYVXR4xXhssVizYJVNQArCgbfTIdTrVI5C6P1
         0ObNFfejntJ2Cr3PRUBkCQW2R22MbomBMvAhxPlWKVSm64Ztwj4KiroBLPrc24zqHvHc
         6Yew==
X-Gm-Message-State: AOJu0Yyd3MYBt+nZSRpnvK71MrzIMrX9JLdYpgus//Kv0cb3g6TFaZqQ
	x/rGSdweAv5BgpjEpM7fjckUGB0qCwgJww+/G/hpsU0bjWzNa/1TRKnCSGPO+7v20Mq0vQRVb1M
	oH7EPJOJouY0sNEESEIxWXFTsm/UvsZVUTphIwAecD8Hr4DmdcZWJNrU=
X-Google-Smtp-Source: AGHT+IELbxFQYGfzvmssUg6z81uoi+Q4ViHGA27KA1Zir7d8iTVMX73tzCGM5bZAujpN2CopYd4DqGlaI8EZwF5ZOMJlJdTru/Yy
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1909:b0:3d5:deaf:b443 with SMTP id
 e9e14a558f8ab-3db6f79db66mr59528615ab.3.1747252262175; Wed, 14 May 2025
 12:51:02 -0700 (PDT)
Date: Wed, 14 May 2025 12:51:02 -0700
In-Reply-To: <80fd38b6-6cb2-4470-8531-60ee0e332787@I-love.SAKURA.ne.jp>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6824f426.a70a0220.3e9d8.001c.GAE@google.com>
Subject: Re: [syzbot] [net?] possible deadlock in team_del_slave (3)
From: syzbot <syzbot+705c61d60b091ef42c04@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, penguin-kernel@i-love.sakura.ne.jp, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

length: 249 > 9
[   91.962498][ T5129] Bluetooth: hci0: unexpected cc 0x1001 length: 249 > =
9
[   91.974784][ T5129] Bluetooth: hci0: unexpected cc 0x0c23 length: 249 > =
4
[   91.983891][ T5129] Bluetooth: hci0: unexpected cc 0x0c38 length: 249 > =
2
[   92.271242][ T5925] chnl_net:caif_netlink_parms(): no params data found
[   92.341639][ T5925] bridge0: port 1(bridge_slave_0) entered blocking sta=
te
[   92.349003][ T5925] bridge0: port 1(bridge_slave_0) entered disabled sta=
te
[   92.356210][ T5925] bridge_slave_0: entered allmulticast mode
[   92.364780][ T5925] bridge_slave_0: entered promiscuous mode
[   92.377104][ T5925] bridge0: port 2(bridge_slave_1) entered blocking sta=
te
[   92.384348][ T5925] bridge0: port 2(bridge_slave_1) entered disabled sta=
te
[   92.392377][ T5925] bridge_slave_1: entered allmulticast mode
[   92.400665][ T5925] bridge_slave_1: entered promiscuous mode
[   92.433442][ T5925] bond0: (slave bond_slave_0): Enslaving as an active =
interface with an up link
[   92.444942][ T5925] bond0: (slave bond_slave_1): Enslaving as an active =
interface with an up link
[   92.480353][ T5925] team0: Port device team_slave_0 added
[   92.489803][ T5925] team0: Port device team_slave_1 added
[   92.522393][ T5925] batman_adv: batadv0: Adding interface: batadv_slave_=
0
[   92.529430][ T5925] batman_adv: batadv0: The MTU of interface batadv_sla=
ve_0 is too small (1500) to handle the transport of batman-adv packets. Pac=
kets going over this interface will be fragmented on layer2 which could imp=
act the performance. Setting the MTU to 1560 would solve the problem.
[   92.556059][ T5925] batman_adv: batadv0: Not using interface batadv_slav=
e_0 (retrying later): interface not active
[   92.569051][ T5925] batman_adv: batadv0: Adding interface: batadv_slave_=
1
[   92.576693][ T5925] batman_adv: batadv0: The MTU of interface batadv_sla=
ve_1 is too small (1500) to handle the transport of batman-adv packets. Pac=
kets going over this interface will be fragmented on layer2 which could imp=
act the performance. Setting the MTU to 1560 would solve the problem.
[   92.602926][ T5925] batman_adv: batadv0: Not using interface batadv_slav=
e_1 (retrying later): interface not active
[   92.658607][ T5925] hsr_slave_0: entered promiscuous mode
[   92.665128][ T5925] hsr_slave_1: entered promiscuous mode
[   92.671651][ T5925] debugfs: Directory 'hsr0' with parent 'hsr' already =
present!
[   92.680672][ T5925] Cannot create hsr debugfs directory
[   92.835258][ T5925] netdevsim netdevsim0 netdevsim0: renamed from eth0
[   92.846166][ T5925] netdevsim netdevsim0 netdevsim1: renamed from eth1
[   92.857198][ T5925] netdevsim netdevsim0 netdevsim2: renamed from eth2
[   92.867926][ T5925] netdevsim netdevsim0 netdevsim3: renamed from eth3
[   92.902977][ T5925] bridge0: port 2(bridge_slave_1) entered blocking sta=
te
[   92.910414][ T5925] bridge0: port 2(bridge_slave_1) entered forwarding s=
tate
[   92.918452][ T5925] bridge0: port 1(bridge_slave_0) entered blocking sta=
te
[   92.925571][ T5925] bridge0: port 1(bridge_slave_0) entered forwarding s=
tate
[   92.983142][ T5925] 8021q: adding VLAN 0 to HW filter on device bond0
[   93.000293][ T3504] bridge0: port 1(bridge_slave_0) entered disabled sta=
te
[   93.009888][ T3504] bridge0: port 2(bridge_slave_1) entered disabled sta=
te
[   93.024748][ T5925] 8021q: adding VLAN 0 to HW filter on device team0
[   93.040019][ T4982] bridge0: port 1(bridge_slave_0) entered blocking sta=
te
[   93.047149][ T4982] bridge0: port 1(bridge_slave_0) entered forwarding s=
tate
[   93.063879][ T3504] bridge0: port 2(bridge_slave_1) entered blocking sta=
te
[   93.071208][ T3504] bridge0: port 2(bridge_slave_1) entered forwarding s=
tate
[   93.115899][ T5925] hsr0: Slave B (hsr_slave_1) is not up; please bring =
it up to get a fully working HSR network
[   93.259512][ T5925] 8021q: adding VLAN 0 to HW filter on device batadv0
[   93.305822][ T5925] veth0_vlan: entered promiscuous mode
[   93.319389][ T5925] veth1_vlan: entered promiscuous mode
[   93.348544][ T5925] veth0_macvtap: entered promiscuous mode
[   93.359245][ T5925] veth1_macvtap: entered promiscuous mode
[   93.378814][ T5925] batman_adv: The newly added mac address (aa:aa:aa:aa=
:aa:3e) already exists on: batadv_slave_0
[   93.391022][ T5925] batman_adv: It is strongly recommended to keep mac a=
ddresses unique to avoid problems!
[   93.403633][ T5925] batman_adv: batadv0: Interface activated: batadv_sla=
ve_0
[   93.417993][ T5925] batman_adv: The newly added mac address (aa:aa:aa:aa=
:aa:3f) already exists on: batadv_slave_1
[   93.429061][ T5925] batman_adv: It is strongly recommended to keep mac a=
ddresses unique to avoid problems!
[   93.440932][ T5925] batman_adv: batadv0: Interface activated: batadv_sla=
ve_1
[   93.455386][ T5925] netdevsim netdevsim0 netdevsim0: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   93.464709][ T5925] netdevsim netdevsim0 netdevsim1: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   93.473626][ T5925] netdevsim netdevsim0 netdevsim2: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   93.482664][ T5925] netdevsim netdevsim0 netdevsim3: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   93.554050][   T53] wlan0: Created IBSS using preconfigured BSSID 50:50:=
50:50:50:50
[   93.567636][   T53] wlan0: Creating new IBSS network, BSSID 50:50:50:50:=
50:50
[   93.601893][ T3504] wlan1: Created IBSS using preconfigured BSSID 50:50:=
50:50:50:50
[   93.610487][ T3504] wlan1: Creating new IBSS network, BSSID 50:50:50:50:=
50:50
[   94.005771][   T24] ------------[ cut here ]------------
[   94.011540][   T24] WARNING: CPU: 1 PID: 24 at net/wireless/core.c:1759 =
wiphy_delayed_work_cancel+0x8a/0xb0
[   94.021614][   T24] Modules linked in:
[   94.025672][   T24] CPU: 1 UID: 0 PID: 24 Comm: kworker/1:0 Not tainted =
6.15.0-rc6-syzkaller-g1a80a098c606-dirty #0 PREEMPT(full)=20
[   94.037920][   T24] Hardware name: Google Google Compute Engine/Google C=
ompute Engine, BIOS Google 05/07/2025
[   94.048197][   T24] Workqueue: events cfg80211_unregister_netdevice_work
[   94.055274][   T24] RIP: 0010:wiphy_delayed_work_cancel+0x8a/0xb0
[   94.061715][   T24] Code: e8 8b ce 1f f7 eb 05 e8 84 ce 1f f7 48 8d 7b 2=
0 e8 7b 92 0d f7 4c 89 f7 48 89 de 5b 41 5e 5d e9 ec f5 ff ff e8 67 ce 1f f=
7 90 <0f> 0b 90 eb dd 48 c7 c1 50 01 7e 8f 80 e1 07 80 c1 03 38 c1 7c 90
[   94.082068][   T24] RSP: 0018:ffffc900001e7740 EFLAGS: 00010293
[   94.088498][   T24] RAX: ffffffff8aa02299 RBX: ffff88806a2b96a8 RCX: fff=
f88801de80000
[   94.096806][   T24] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 000=
0000000000000
[   94.104806][   T24] RBP: 0000000000000000 R08: ffffffff8f7dd277 R09: 1ff=
ffffff1efba4e
[   94.113238][   T24] R10: dffffc0000000000 R11: ffffffff8ac5eb30 R12: fff=
f88806a2b8d80
[   94.121555][   T24] R13: 1ffff1100fab81d0 R14: ffff88807d5c0700 R15: fff=
fc900001e77a0
[   94.130303][   T24] FS:  0000000000000000(0000) GS:ffff8881261fb000(0000=
) knlGS:0000000000000000
[   94.139304][   T24] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   94.145902][   T24] CR2: 000000c003a86000 CR3: 0000000032fcc000 CR4: 000=
00000003526f0
[   94.154171][   T24] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 000=
0000000000000
[   94.162228][   T24] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 000=
0000000000400
[   94.170393][   T24] Call Trace:
[   94.173704][   T24]  <TASK>
[   94.176763][   T24]  ieee80211_free_keys+0xff/0x650
[   94.181832][   T24]  ? __pfx_ieee80211_free_keys+0x10/0x10
[   94.187557][   T24]  ? ip6_route_dev_notify+0x9a/0x5b0
[   94.192880][   T24]  ? notifier_call_chain+0x3bf/0x3e0
[   94.198251][   T24]  ieee80211_teardown_sdata+0x52/0x140
[   94.203758][   T24]  ? __pfx_ieee80211_uninit+0x10/0x10
[   94.209438][   T24]  unregister_netdevice_many_notify+0x1c34/0x2330
[   94.215922][   T24]  ? __pfx_unregister_netdevice_many_notify+0x10/0x10
[   94.222857][   T24]  ? rcu_is_watching+0x15/0xb0
[   94.228043][   T24]  ? __mutex_lock+0xa6d/0xe80
[   94.232839][   T24]  ? __mutex_lock+0x51b/0xe80
[   94.237793][   T24]  ? cfg80211_unregister_netdevice_work+0x12/0x50
[   94.244253][   T24]  unregister_netdevice_queue+0x33c/0x380
[   94.250165][   T24]  ? __pfx_unregister_netdevice_queue+0x10/0x10
[   94.256526][   T24]  ? _raw_spin_unlock_irq+0x23/0x50
[   94.261863][   T24]  cfg80211_unregister_netdevice_work+0x3d/0x50
[   94.268224][   T24]  ? process_scheduled_works+0x9ec/0x17a0
[   94.274067][   T24]  process_scheduled_works+0xadb/0x17a0
[   94.279838][   T24]  ? __pfx_process_scheduled_works+0x10/0x10
[   94.286074][   T24]  worker_thread+0x8a0/0xda0
[   94.290884][   T24]  kthread+0x70e/0x8a0
[   94.295232][   T24]  ? __pfx_worker_thread+0x10/0x10
[   94.300455][   T24]  ? __pfx_kthread+0x10/0x10
[   94.305085][   T24]  ? __pfx_kthread+0x10/0x10
[   94.310237][   T24]  ? _raw_spin_unlock_irq+0x23/0x50
[   94.315469][   T24]  ? lockdep_hardirqs_on+0x9c/0x150
[   94.320777][   T24]  ? __pfx_kthread+0x10/0x10
[   94.325392][   T24]  ret_from_fork+0x4b/0x80
[   94.329953][   T24]  ? __pfx_kthread+0x10/0x10
[   94.334582][   T24]  ret_from_fork_asm+0x1a/0x30
[   94.339462][   T24]  </TASK>
[   94.342497][   T24] Kernel panic - not syncing: kernel: panic_on_warn se=
t ...
[   94.349804][   T24] CPU: 1 UID: 0 PID: 24 Comm: kworker/1:0 Not tainted =
6.15.0-rc6-syzkaller-g1a80a098c606-dirty #0 PREEMPT(full)=20
[   94.361729][   T24] Hardware name: Google Google Compute Engine/Google C=
ompute Engine, BIOS Google 05/07/2025
[   94.371900][   T24] Workqueue: events cfg80211_unregister_netdevice_work
[   94.378882][   T24] Call Trace:
[   94.382189][   T24]  <TASK>
[   94.385131][   T24]  dump_stack_lvl+0x99/0x250
[   94.389748][   T24]  ? __asan_memcpy+0x40/0x70
[   94.394367][   T24]  ? __pfx_dump_stack_lvl+0x10/0x10
[   94.399599][   T24]  ? __pfx__printk+0x10/0x10
[   94.404215][   T24]  panic+0x2db/0x790
[   94.408122][   T24]  ? __pfx_panic+0x10/0x10
[   94.412710][   T24]  ? show_trace_log_lvl+0x4fb/0x550
[   94.418012][   T24]  ? ret_from_fork_asm+0x1a/0x30
[   94.422967][   T24]  __warn+0x31b/0x4b0
[   94.426949][   T24]  ? wiphy_delayed_work_cancel+0x8a/0xb0
[   94.432591][   T24]  ? wiphy_delayed_work_cancel+0x8a/0xb0
[   94.438228][   T24]  report_bug+0x2be/0x4f0
[   94.442557][   T24]  ? wiphy_delayed_work_cancel+0x8a/0xb0
[   94.448292][   T24]  ? wiphy_delayed_work_cancel+0x8a/0xb0
[   94.453947][   T24]  ? wiphy_delayed_work_cancel+0x8c/0xb0
[   94.459670][   T24]  handle_bug+0x84/0x160
[   94.463913][   T24]  exc_invalid_op+0x1a/0x50
[   94.468417][   T24]  asm_exc_invalid_op+0x1a/0x20
[   94.473260][   T24] RIP: 0010:wiphy_delayed_work_cancel+0x8a/0xb0
[   94.479505][   T24] Code: e8 8b ce 1f f7 eb 05 e8 84 ce 1f f7 48 8d 7b 2=
0 e8 7b 92 0d f7 4c 89 f7 48 89 de 5b 41 5e 5d e9 ec f5 ff ff e8 67 ce 1f f=
7 90 <0f> 0b 90 eb dd 48 c7 c1 50 01 7e 8f 80 e1 07 80 c1 03 38 c1 7c 90
[   94.499114][   T24] RSP: 0018:ffffc900001e7740 EFLAGS: 00010293
[   94.505185][   T24] RAX: ffffffff8aa02299 RBX: ffff88806a2b96a8 RCX: fff=
f88801de80000
[   94.513345][   T24] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 000=
0000000000000
[   94.521331][   T24] RBP: 0000000000000000 R08: ffffffff8f7dd277 R09: 1ff=
ffffff1efba4e
[   94.529328][   T24] R10: dffffc0000000000 R11: ffffffff8ac5eb30 R12: fff=
f88806a2b8d80
[   94.537300][   T24] R13: 1ffff1100fab81d0 R14: ffff88807d5c0700 R15: fff=
fc900001e77a0
[   94.545286][   T24]  ? __pfx_ieee80211_uninit+0x10/0x10
[   94.550760][   T24]  ? wiphy_delayed_work_cancel+0x89/0xb0
[   94.556521][   T24]  ieee80211_free_keys+0xff/0x650
[   94.561637][   T24]  ? __pfx_ieee80211_free_keys+0x10/0x10
[   94.567799][   T24]  ? ip6_route_dev_notify+0x9a/0x5b0
[   94.573181][   T24]  ? notifier_call_chain+0x3bf/0x3e0
[   94.578474][   T24]  ieee80211_teardown_sdata+0x52/0x140
[   94.583931][   T24]  ? __pfx_ieee80211_uninit+0x10/0x10
[   94.589304][   T24]  unregister_netdevice_many_notify+0x1c34/0x2330
[   94.595760][   T24]  ? __pfx_unregister_netdevice_many_notify+0x10/0x10
[   94.602532][   T24]  ? rcu_is_watching+0x15/0xb0
[   94.607405][   T24]  ? __mutex_lock+0xa6d/0xe80
[   94.612101][   T24]  ? __mutex_lock+0x51b/0xe80
[   94.616880][   T24]  ? cfg80211_unregister_netdevice_work+0x12/0x50
[   94.623402][   T24]  unregister_netdevice_queue+0x33c/0x380
[   94.629238][   T24]  ? __pfx_unregister_netdevice_queue+0x10/0x10
[   94.635492][   T24]  ? _raw_spin_unlock_irq+0x23/0x50
[   94.640690][   T24]  cfg80211_unregister_netdevice_work+0x3d/0x50
[   94.646947][   T24]  ? process_scheduled_works+0x9ec/0x17a0
[   94.652684][   T24]  process_scheduled_works+0xadb/0x17a0
[   94.658268][   T24]  ? __pfx_process_scheduled_works+0x10/0x10
[   94.664533][   T24]  worker_thread+0x8a0/0xda0
[   94.669246][   T24]  kthread+0x70e/0x8a0
[   94.673316][   T24]  ? __pfx_worker_thread+0x10/0x10
[   94.678423][   T24]  ? __pfx_kthread+0x10/0x10
[   94.683024][   T24]  ? __pfx_kthread+0x10/0x10
[   94.687621][   T24]  ? _raw_spin_unlock_irq+0x23/0x50
[   94.692817][   T24]  ? lockdep_hardirqs_on+0x9c/0x150
[   94.698104][   T24]  ? __pfx_kthread+0x10/0x10
[   94.702694][   T24]  ret_from_fork+0x4b/0x80
[   94.707203][   T24]  ? __pfx_kthread+0x10/0x10
[   94.711802][   T24]  ret_from_fork_asm+0x1a/0x30
[   94.716597][   T24]  </TASK>
[   94.720039][   T24] Kernel Offset: disabled
[   94.724403][   T24] Rebooting in 86400 seconds..


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
1-go1.23.7.linux-amd64'
GOSUMDB=3D'sum.golang.org'
GOTMPDIR=3D''
GOTOOLCHAIN=3D'auto'
GOTOOLDIR=3D'/syzkaller/jobs-2/linux/gopath/pkg/mod/golang.org/toolchain@v0=
.0.1-go1.23.7.linux-amd64/pkg/tool/linux_amd64'
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
 -ffile-prefix-map=3D/tmp/go-build4040498717=3D/tmp/go-build -gno-record-gc=
c-switches'

git status (err=3D<nil>)
HEAD detached at ce7952f4e36
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
/syzkaller/prog.GitRevision=3Dce7952f4e369f2440b2bc369868df305c42bf7d6 -X '=
github.com/google/syzkaller/prog.gitRevisionDate=3D20250430-132727'" -o ./b=
in/linux_amd64/syz-execprog github.com/google/syzkaller/tools/syz-execprog
mkdir -p ./bin/linux_amd64
g++ -o ./bin/linux_amd64/syz-executor executor/executor.cc \
	-m64 -O2 -pthread -Wall -Werror -Wparentheses -Wunused-const-variable -Wfr=
ame-larger-than=3D16384 -Wno-stringop-overflow -Wno-array-bounds -Wno-forma=
t-overflow -Wno-unused-but-set-variable -Wno-unused-command-line-argument -=
static-pie -std=3Dc++17 -I. -Iexecutor/_include   -DGOOS_linux=3D1 -DGOARCH=
_amd64=3D1 \
	-DHOSTGOOS_linux=3D1 -DGIT_REVISION=3D\"ce7952f4e369f2440b2bc369868df305c4=
2bf7d6\"
/usr/bin/ld: /tmp/ccLDnfUR.o: in function `Connection::Connect(char const*,=
 char const*)':
executor.cc:(.text._ZN10Connection7ConnectEPKcS1_[_ZN10Connection7ConnectEP=
KcS1_]+0x104): warning: Using 'gethostbyname' in statically linked applicat=
ions requires at runtime the shared libraries from the glibc version used f=
or linking


Error text is too large and was truncated, full error text is at:
https://syzkaller.appspot.com/x/error.txt?x=3D112cd6f4580000


Tested on:

commit:         1a80a098 Merge tag 'execve-v6.15-rc7' of git://git.ker..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=3D5929ac65be9baf3=
c
dashboard link: https://syzkaller.appspot.com/bug?extid=3D705c61d60b091ef42=
c04
compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-=
1~exp1~20250402004600.97), Debian LLD 20.1.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=3D1284cf685800=
00

