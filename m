Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD661DE2D7
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 12:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738931046; cv=none; b=hkhFF6UmSJYdAm6VEJD+hspVS4lZ6Y+Ygf5OiYxYPC12WJ9K5DjGOT/12L6Am1A/o8FdYafg/P62S+shspbE9nSMicdfPPH39UJlFnPioGkHCXBKQRBLBOyF6witudwd+a31mCYQgBsNgVWaZwVNOlSkekl7r+23wXCbaSM0TlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738931046; c=relaxed/simple;
	bh=CoW5eYumNjBwFCiWAUIjwIxN+yY3YlIoXKiUdwX25m4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=C7nXv1B7EcPSu306+k7VsDDoMWm79LLYrryQXXQbhQVIPsOGgPUPryCt16tGCaSRg5DFMTdVj8sWCySmvvdlmnH/kmfkCNlLWL7LOUfrrHkn6MagA8tugre2ztPMimGIHEqg9rwDddSPvVqEelLCE9pi9pAJwws5mY0Nfxlexs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3d0615ad135so9000425ab.1
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 04:24:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738931043; x=1739535843;
        h=content-transfer-encoding:to:from:subject:message-id:in-reply-to
         :date:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t3g6/KRzNVkBzrU3lOaTaiTriuGI1z2pu3OFbfQ3Qjw=;
        b=LkHZqDZ2wkfNo97vvWWMBjiorA69pYy+A8j2r6mA5V67lsVBCsbBCp50G2FMoutIyl
         vcWDFPzyQD7/Ad0AAfPSxByOKt2pfZ4MSuaVfhZTJA2tmWgyDe0olLW5q9l00r0dWxdk
         wLYlLAWdJY8hoViDaqQcSN1EIHOxxN/yLxYbJolMNcM25jzhpTK+BU9cBKWnXpAvNAQ9
         84Ex/9cE0Uyt5wJvPP9r+X9GgV9B3LjP9daCTVcE9yrQrDzif27sx2GqZ3kHSq1ESykW
         h5UEXUxLNrusH8mH8FRPDmG1d6rjxmGaI76TFupKq3iE54A0vmxkbjJLT6U5NWS+1Ufr
         f9lA==
X-Forwarded-Encrypted: i=1; AJvYcCXm3KqmlrL4AMJfYn2qsV9ZIM2fWaY1N9IM5PMhz7iWWa5tWnpQEo49vElye1CTIz7oof9moFVNKi4YzO4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn3/dWX/U4cKC0CHnLk3WDByRvMzJcgRKa2G5wNTs8ynyEl/Pv
	88zGs46NuYfXdQ4NffCj7lhLJd36X2vakCfF+1N9BDdZYFOTYOOK4Qtxhyl0FipNpdG8zwipMid
	GBMDj6rA4TXDxoPiL0d0Nb7uCNerU1n8xbq6rsJkKpmYpbgjm9/7n/Yo=
X-Google-Smtp-Source: AGHT+IERriGldS4ZxRjF3hPVk/qOpyHVHRmY/pLbrQGQcFSoVonfFiU/hCsZsUlo+AQOL8kaexWBzoJXBf2PgRWnUe/+Pgca2Fj0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3d85:b0:3cf:b2ca:39b7 with SMTP id
 e9e14a558f8ab-3d13e1852f8mr24139615ab.3.1738931042993; Fri, 07 Feb 2025
 04:24:02 -0800 (PST)
Date: Fri, 07 Feb 2025 04:24:02 -0800
In-Reply-To: <20250207121003.2030-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67a5fb62.050a0220.2b1e6.001e.GAE@google.com>
Subject: Re: [syzbot] [net?] general protection fault in ip6_pol_route (3)
From: syzbot <syzbot+3201be560ebfa39bc6bd@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

x10
[   85.293372][    C0]  ? __pfx_fib6_rule_lookup+0x10/0x10
[   85.295445][    C0]  ? __local_bh_enable_ip+0x168/0x200
[   85.297405][    C0]  ? __pfx___local_bh_disable_ip+0x10/0x10
[   85.299560][    C0]  ? ip6t_do_table+0x205/0x18a0
[   85.301398][    C0]  ? __pfx___local_bh_enable_ip+0x10/0x10
[   85.303557][    C0]  ip6_route_input+0x859/0xd90
[   85.305331][    C0]  ? __pfx_ip6_route_input+0x10/0x10
[   85.307250][    C0]  ? __pfx_lock_release+0x10/0x10
[   85.309244][    C0]  ? ip6_rcv_finish_core+0x20f/0x410
[   85.311229][    C0]  ip6_rcv_finish+0x144/0x180
[   85.313088][    C0]  ? __pfx_ip6_rcv_finish+0x10/0x10
[   85.315021][    C0]  NF_HOOK+0x3a4/0x450
[   85.316743][    C0]  ? skb_orphan+0x4b/0xd0
[   85.318409][    C0]  ? NF_HOOK+0x9a/0x450
[   85.320017][    C0]  ? __pfx_NF_HOOK+0x10/0x10
[   85.321814][    C0]  ? __pfx_ip6_rcv_finish+0x10/0x10
[   85.323622][    C0]  ? __pfx_ipv6_rcv+0x10/0x10
[   85.325252][    C0]  __netif_receive_skb+0x1ea/0x650
[   85.327108][    C0]  ? __pfx_lock_acquire+0x10/0x10
[   85.329035][    C0]  ? __pfx___netif_receive_skb+0x10/0x10
[   85.331023][    C0]  ? lockdep_hardirqs_on_prepare+0x43d/0x780
[   85.333914][    C0]  ? __pfx_lock_release+0x10/0x10
[   85.336388][    C0]  ? _raw_spin_lock_irq+0xdf/0x120
[   85.338749][    C0]  process_backlog+0x662/0x15b0
[   85.340660][    C0]  ? process_backlog+0x33b/0x15b0
[   85.342593][    C0]  ? __pfx_process_backlog+0x10/0x10
[   85.344774][    C0]  ? lockdep_hardirqs_on_prepare+0x43d/0x780
[   85.346950][    C0]  ? __pfx_lockdep_hardirqs_on_prepare+0x10/0x10
[   85.349327][    C0]  ? trace_rcu_utilization+0x4b/0x1e0
[   85.351372][    C0]  __napi_poll+0xcb/0x490
[   85.353054][    C0]  net_rx_action+0x89b/0x1240
[   85.354900][    C0]  ? __pfx_net_rx_action+0x10/0x10
[   85.356826][    C0]  ? do_softirq+0x11b/0x1e0
[   85.358585][    C0]  ? __pfx_lockdep_softirqs_off+0x10/0x10
[   85.360701][    C0]  ? lockdep_softirqs_on+0x334/0x5a0
[   85.362790][    C0]  ? __pfx_lockdep_hardirqs_on_prepare+0x10/0x10
[   85.365259][    C0]  handle_softirqs+0x2d4/0x9b0
[   85.367051][    C0]  ? __pfx_handle_softirqs+0x10/0x10
[   85.369207][    C0]  ? do_softirq+0x11b/0x1e0
[   85.371014][    C0]  ? __pfx_handle_softirqs+0x10/0x10
[   85.373108][    C0]  do_softirq+0x11b/0x1e0
[   85.374820][    C0]  </IRQ>
[   85.375942][    C0]  <TASK>
[   85.377044][    C0]  ? __pfx_do_softirq+0x10/0x10
[   85.378934][    C0]  ? __pfx_lockdep_softirqs_on+0x10/0x10
[   85.381010][    C0]  ? rcu_is_watching+0x15/0xb0
[   85.382747][    C0]  __local_bh_enable_ip+0x1bb/0x200
[   85.384669][    C0]  ? dev_hard_start_xmit+0x768/0x7d0
[   85.386628][    C0]  ? __dev_queue_xmit+0x2f4/0x3f50
[   85.388554][    C0]  ? __pfx___local_bh_enable_ip+0x10/0x10
[   85.390696][    C0]  ? __dev_queue_xmit+0x2f4/0x3f50
[   85.392723][    C0]  __dev_queue_xmit+0x1775/0x3f50
[   85.394645][    C0]  ? __dev_queue_xmit+0x2f4/0x3f50
[   85.396618][    C0]  ? __pfx___dev_queue_xmit+0x10/0x10
[   85.398643][    C0]  ? neigh_resolve_output+0x450/0x740
[   85.400773][    C0]  ? read_seqbegin+0x15a/0x2c0
[   85.402609][    C0]  ? lockdep_hardirqs_on+0x99/0x150
[   85.404653][    C0]  ? read_seqbegin+0x200/0x2c0
[   85.406474][    C0]  ? __pfx_read_seqbegin+0x10/0x10
[   85.408532][    C0]  ? neigh_resolve_output+0x2e5/0x740
[   85.410658][    C0]  ? eth_header+0x11c/0x1f0
[   85.412483][    C0]  ? __asan_memcpy+0x40/0x70
[   85.414215][    C0]  ? eth_header+0x11c/0x1f0
[   85.415980][    C0]  ? __pfx_eth_header+0x10/0x10
[   85.417875][    C0]  ? neigh_resolve_output+0x61f/0x740
[   85.419858][    C0]  ip6_finish_output2+0x12ad/0x1780
[   85.421764][    C0]  ? ip6_finish_output2+0x61d/0x1780
[   85.423624][    C0]  ? __pfx_ip6_finish_output2+0x10/0x10
[   85.425794][    C0]  ? ip6_mtu+0x81/0x3f0
[   85.427425][    C0]  ip6_finish_output+0x41e/0x840
[   85.429249][    C0]  ndisc_send_skb+0xb30/0x1450
[   85.431073][    C0]  ? ndisc_send_skb+0x563/0x1450
[   85.432980][    C0]  ? __pfx_ndisc_send_skb+0x10/0x10
[   85.434944][    C0]  ? __pfx_dst_output+0x10/0x10
[   85.436614][    C0]  ? __pfx_ndisc_ns_create+0x10/0x10
[   85.438567][    C0]  ndisc_send_ns+0xcc/0x160
[   85.440339][    C0]  ? __pfx_ndisc_send_ns+0x10/0x10
[   85.442326][    C0]  addrconf_dad_work+0xb2d/0x16a0
[   85.444358][    C0]  ? __pfx_addrconf_dad_work+0x10/0x10
[   85.446504][    C0]  ? __pfx_lockdep_hardirqs_on_prepare+0x10/0x10
[   85.449024][    C0]  ? process_scheduled_works+0x976/0x1840
[   85.451074][    C0]  process_scheduled_works+0xa66/0x1840
[   85.453146][    C0]  ? __pfx_process_scheduled_works+0x10/0x10
[   85.455426][    C0]  ? assign_work+0x364/0x3d0
[   85.457174][    C0]  worker_thread+0x870/0xd30
[   85.458768][    C0]  ? _raw_spin_unlock_irqrestore+0xdd/0x140
[   85.460971][    C0]  ? __kthread_parkme+0x169/0x1d0
[   85.463125][    C0]  ? __pfx_worker_thread+0x10/0x10
[   85.465052][    C0]  kthread+0x7a9/0x920
[   85.466620][    C0]  ? __pfx_kthread+0x10/0x10
[   85.468429][    C0]  ? __pfx_worker_thread+0x10/0x10
[   85.470430][    C0]  ? __pfx_kthread+0x10/0x10
[   85.472221][    C0]  ? __pfx_kthread+0x10/0x10
[   85.474017][    C0]  ? __pfx_kthread+0x10/0x10
[   85.475890][    C0]  ? _raw_spin_unlock_irq+0x23/0x50
[   85.478015][    C0]  ? lockdep_hardirqs_on+0x99/0x150
[   85.480047][    C0]  ? __pfx_kthread+0x10/0x10
[   85.482033][    C0]  ret_from_fork+0x4b/0x80
[   85.483827][    C0]  ? __pfx_kthread+0x10/0x10
[   85.485729][    C0]  ret_from_fork_asm+0x1a/0x30
[   85.487633][    C0]  </TASK>
[   85.488903][    C0] Modules linked in:
[   85.490457][    C0] ---[ end trace 0000000000000000 ]---
[   85.492579][    C0] RIP: 0010:find_match+0xae/0xc10
[   85.494566][    C0] Code: 08 48 89 df e8 e3 e9 96 f7 4c 89 64 24 40 48 8=
9 d8 bb c0 00 00 00 48 03 18 48 89 d8 48 c1 e8 03 48 b9 00 00 00 00 00 fc f=
f df <80> 3c 08 00 74 08 48 89 df e8 b4 e9 96 f7 4c 8b 23 e8 4c 03 5d 01
[   85.501822][    C0] RSP: 0018:ffffc90000006fe0 EFLAGS: 00010206
[   85.504104][    C0] RAX: 0000000000000018 RBX: 00000000000000c0 RCX: dff=
ffc0000000000
[   85.507165][    C0] RDX: ffff888030f02440 RSI: 0000000000000000 RDI: 000=
0000000000000
[   85.510121][    C0] RBP: ffffffff9a7a0878 R08: ffffffff8a8f0c7f R09: fff=
fc90000007310
[   85.514048][    C0] R10: ffffc90000007300 R11: fffff52000000e2e R12: fff=
fc90000007310
[   85.517299][    C0] R13: ffffffff9a7a088f R14: 1ffffffff34f4111 R15: 1ff=
ffffff34f410f
[   85.520785][    C0] FS:  0000000000000000(0000) GS:ffff88801fc00000(0000=
) knlGS:0000000000000000
[   85.525167][    C0] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   85.527695][    C0] CR2: 00007feee96c6ff8 CR3: 0000000034810000 CR4: 000=
0000000352ef0
[   85.530980][    C0] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 000=
0000000000000
[   85.534129][    C0] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 000=
0000000000400
[   85.537267][    C0] Kernel panic - not syncing: Fatal exception in inter=
rupt
[   85.540414][    C0] Kernel Offset: disabled
[   85.542267][    C0] Rebooting in 86400 seconds..

VM DIAGNOSIS:
12:22:51  Registers:
info registers vcpu 0

CPU#0
RAX=3D0000000000000030 RBX=3Dffffffff9a718760 RCX=3D0000000000000000 RDX=3D=
00000000000003f8
RSI=3D0000000000000000 RDI=3D0000000000000020 RBP=3D0000000000000000 RSP=3D=
ffffc90000006710
R8 =3Dffffffff856cbcab R9 =3D1ffff11003de2046 R10=3Ddffffc0000000000 R11=3D=
ffffffff856cbc60
R12=3Ddffffc0000000000 R13=3D0000000000000030 R14=3D0000000000000030 R15=3D=
00000000000003f8
RIP=3Dffffffff856cbcde RFL=3D00000002 [-------] CPL=3D0 II=3D0 A20=3D1 SMM=
=3D0 HLT=3D0
ES =3D0000 0000000000000000 ffffffff 00c00000
CS =3D0010 0000000000000000 ffffffff 00a09b00 DPL=3D0 CS64 [-RA]
SS =3D0018 0000000000000000 ffffffff 00c09300 DPL=3D0 DS   [-WA]
DS =3D0000 0000000000000000 ffffffff 00c00000
FS =3D0000 0000000000000000 ffffffff 00c00000
GS =3D0000 ffff88801fc00000 ffffffff 00c00000
LDT=3D0000 0000000000000000 ffffffff 00c00000
TR =3D0040 fffffe0000003000 00004087 00008b00 DPL=3D0 TSS64-busy
GDT=3D     fffffe0000001000 0000007f
IDT=3D     fffffe0000000000 00000fff
CR0=3D80050033 CR2=3D00007feee96c6ff8 CR3=3D0000000034810000 CR4=3D00352ef0
DR0=3D0000000000000000 DR1=3D0000000000000000 DR2=3D0000000000000000 DR3=3D=
0000000000000000=20
DR6=3D00000000fffe0ff0 DR7=3D0000000000000400
EFER=3D0000000000000d01
FCW=3D037f FSW=3D0000 [ST=3D0] FTW=3D00 MXCSR=3D00001f80
FPR0=3D0000000000000000 0000 FPR1=3D0000000000000000 0000
FPR2=3D0000000000000000 0000 FPR3=3D0000000000000000 0000
FPR4=3D0000000000000000 0000 FPR5=3D0000000000000000 0000
FPR6=3D0000000000000000 0000 FPR7=3D0000000000000000 0000
Opmask00=3D0000000004040101 Opmask01=3D00000000011000f0 Opmask02=3D00000000=
0fffffff Opmask03=3D0000000000000000
Opmask04=3D0000000000000000 Opmask05=3D0000000000000000 Opmask06=3D00000000=
00000000 Opmask07=3D0000000000000000
ZMM00=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000 0000000000000000 00007ffd92f51ba0 0000003000000010
ZMM01=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000 0000000000000000 00007ffd92f51ba0 0000003000000010
ZMM02=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000 0000000000000000 2e2e2e2e2e2e2e2e 2e2e2e2e2e2e2e2e
ZMM03=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000 0000000000000000 0000000000000000 0000000000000000
ZMM04=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000 0000000000000000 ff00ff00ffffffff ffff000000000000
ZMM05=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000 0000000000000000 000000ffffffff00 ff00ff00ff00ff00
ZMM06=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000 0000000000000000 ff00ff00ffffffff ffff000000000000
ZMM07=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000 0000000000000000 0000000000000000 0000000000000000
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
 2525252525252525 2525252525252525 2525252525252525 2525252525252525
ZMM18=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 5548474900000000 0000000000000000 0000000000000000 0000000000000000
ZMM19=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 5548474953004d52 4c4147495300424b 4c56444049405700 4d52455447495300
ZMM20=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000031 0000000000000000 326874652f74656e 2f306d6973766564
ZMM21=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 00000000000000b1 00005632511b3700 00316e6170772f74 656e2f317968702f
ZMM22=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000021 0000000000000000 00005632347d9233 73656d5f70636864
ZMM23=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 725f0f8b9df47661 72610ff5fbfb737f 65677773777dffff 7f7f7d7f75777965
ZMM24=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0032343433636672 2000313633336366 722000676e697274 7320007865686e69
ZMM25=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000021 0000000000000000 0000000000000031 0000726565666965
ZMM26=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000021 0000000000000000 0000000000000031 00006d5f65636864
ZMM27=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 bfbfbfbfbfbfbfbf bfbfbfbfbfbfbfbf bfbfbfbfbfbfbfbf bfbf2b313423342c
ZMM28=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 262821df2e2e33df 3228df3232202b22 df312e232d2435bf 2324353124322431
ZMM29=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 4141414141414141 4141414141414141 4141414141414141 4141414141414141
ZMM30=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 1a1a1a1a1a1a1a1a 1a1a1a1a1a1a1a1a 1a1a1a1a1a1a1a1a 1a1a1a1a1a1a1a1a
ZMM31=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 2020202020202020 2020202020202020 2020202020202020 2020202020202020


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
GOROOT=3D'/usr/local/go'
GOSUMDB=3D'sum.golang.org'
GOTMPDIR=3D''
GOTOOLCHAIN=3D'auto'
GOTOOLDIR=3D'/usr/local/go/pkg/tool/linux_amd64'
GOVCS=3D''
GOVERSION=3D'go1.22.7'
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
 -ffile-prefix-map=3D/tmp/go-build2809212995=3D/tmp/go-build -gno-record-gc=
c-switches'

git status (err=3D<nil>)
HEAD detached at 4dfba277487
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
go fmt ./sys/... >/dev/null
touch .descriptions
GOOS=3Dlinux GOARCH=3Damd64 go build "-ldflags=3D-s -w -X github.com/google=
/syzkaller/prog.GitRevision=3D4dfba277487a7023ab9f5783302da4a9b5e9bef8 -X '=
github.com/google/syzkaller/prog.gitRevisionDate=3D20241113-111659'" "-tags=
=3Dsyz_target syz_os_linux syz_arch_amd64 " -o ./bin/linux_amd64/syz-execpr=
og github.com/google/syzkaller/tools/syz-execprog
mkdir -p ./bin/linux_amd64
g++ -o ./bin/linux_amd64/syz-executor executor/executor.cc \
	-m64 -O2 -pthread -Wall -Werror -Wparentheses -Wunused-const-variable -Wfr=
ame-larger-than=3D16384 -Wno-stringop-overflow -Wno-array-bounds -Wno-forma=
t-overflow -Wno-unused-but-set-variable -Wno-unused-command-line-argument -=
static-pie -std=3Dc++17 -I. -Iexecutor/_include -fpermissive -w -DGOOS_linu=
x=3D1 -DGOARCH_amd64=3D1 \
	-DHOSTGOOS_linux=3D1 -DGIT_REVISION=3D\"4dfba277487a7023ab9f5783302da4a9b5=
e9bef8\"
/usr/bin/ld: /tmp/cc1rmchH.o: in function `test_cover_filter()':
executor.cc:(.text+0x1426b): warning: the use of `tempnam' is dangerous, be=
tter use `mkstemp'
/usr/bin/ld: /tmp/cc1rmchH.o: in function `Connection::Connect(char const*,=
 char const*)':
executor.cc:(.text._ZN10Connection7ConnectEPKcS1_[_ZN10Connection7ConnectEP=
KcS1_]+0x104): warning: Using 'gethostbyname' in statically linked applicat=
ions requires at runtime the shared libraries from the glibc version used f=
or linking


Error text is too large and was truncated, full error text is at:
https://syzkaller.appspot.com/x/error.txt?x=3D13448ca4580000


Tested on:

commit:         bb066fe8 Merge tag 'pci-v6.14-fixes-2' of git://git.ke..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=3Dd256a021904f1cd=
7
dashboard link: https://syzkaller.appspot.com/bug?extid=3D3201be560ebfa39bc=
6bd
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debia=
n) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=3D1412f3df9800=
00

