Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB40146A60
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 14:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.136.64.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745333676; cv=none; b=t0ku52LyPvNY7hAXiUwAYG3Dcx0Y9wE0FmvYuU0tTfeY+EJcvkUB/OUl/I1HLa+kMfjM1w7KoAtl5P+mnb1gXX0sZ5DeKanEkX6Rvb9+HIDlRk3/NIncRD4WqVDwWplRhgPuNN5+j69qeoaGcYUvRY6/fkYxguCRQTpRqUKz4Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745333676; c=relaxed/simple;
	bh=WwXtJRbHgg+XQHn0+MFKZtRBFSSaBHEl/mDkR4j/oKA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ScujLAd1krLJ1uRfzNf6KAK1hFd1J3xfvkrQcCZexXDlPX3xaP3JhcEdgQ3WffQBZ/16J/tskzR95UkdlsmjPcuWTNdqm32gkFnoJrt+zwga5Li2pGs2WyG0TGcohve4urrczuYarmfwaLSJWYWoNq4UAzVh62XFjyehYn/zY5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=florian.bezdeka@siemens.com header.b=aYMEXlm3; arc=none smtp.client-ip=185.136.64.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=florian.bezdeka@siemens.com header.b="aYMEXlm3"
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202504221454297cffedfec602a62282
        for <linux-kernel@vger.kernel.org>;
        Tue, 22 Apr 2025 16:54:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=florian.bezdeka@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=o+2QKvSlwCqUuSsj2WRmkKUQKEwdpqxVgMFG2KgWACg=;
 b=aYMEXlm3QsZGBRM1nYuYKtJY4g8p1DaMXSdNYSvDJq9TprQrZ6aHfjsTL37IpobV7hEpR8
 L4jkFqunOH/N4S/bMwuGFMQtm0VNOrQwHCF/zaOhbQqxtf4FaFWoO8/GKeiES7nqy6Bu1Ne/
 6sR2dTBWtfSb3ZINpBkauOZY2DyL2mkXQcrkxSasX04UedlNGlEf051nxpig8msbF8FgepoN
 H3PxXn44rxLhs1ZvkOPlHWFYC0nQ5Z86z7gfZBmn8mkNZzDTVJhSoHAGCMiNFbU0b7/QTsAi
 ihxvMXkBWcNS8KNtE0+V9NyV130GcvrZx9NNU/KTWooqsVwIHkCDxY+A==;
Message-ID: <f320d90db90df2d9583a1af4d83880f052768a64.camel@siemens.com>
Subject: Re: [RFC PATCH v2 0/7] Defer throttle when task exits to user
From: Florian Bezdeka <florian.bezdeka@siemens.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>, Aaron Lu
 <ziqianlu@bytedance.com>
Cc: Jan Kiszka <jan.kiszka@siemens.com>, Valentin Schneider	
 <vschneid@redhat.com>, Ben Segall <bsegall@google.com>, Peter Zijlstra	
 <peterz@infradead.org>, Josh Don <joshdon@google.com>, Ingo Molnar	
 <mingo@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Xi Wang	
 <xii@google.com>, linux-kernel@vger.kernel.org, Juri Lelli
 <juri.lelli@redhat.com>,  Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>, 
 Chengming Zhou <chengming.zhou@linux.dev>, Chuyi Zhou
 <zhouchuyi@bytedance.com>, "Sebastian Andrzej Siewior,"	
 <bigeasy@linutronix.de>
Date: Tue, 22 Apr 2025 16:54:28 +0200
In-Reply-To: <610fcbfa-a8e7-483c-a112-579879628b99@amd.com>
References: <20250409120746.635476-1-ziqianlu@bytedance.com>
	 <cee5bca4e2b024d3406b40b84c0d5db91c7d276f.camel@siemens.com>
	 <20250414120407.GC3558904@bytedance>
	 <7483d3ae-5846-4067-b9f7-390a614ba408@siemens.com>
	 <0a06f6c4-5d69-4fd1-badd-92fd55d8f38d@amd.com>
	 <55687bb5-7e8a-4d7d-a597-6f97087cab32@siemens.com>
	 <5e919998-338c-4055-b58a-e4586134956c@amd.com>
	 <f5111e9f-bdee-480a-b29a-d8d1c207a600@siemens.com>
	 <ec2cea83-07fe-472f-8320-911d215473fd@amd.com>
	 <e65a32af-271b-4de6-937a-1a1049bbf511@amd.com>
	 <20250421120648.GA3357499@bytedance>
	 <610fcbfa-a8e7-483c-a112-579879628b99@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-68982:519-21489:flowmailer

On Tue, 2025-04-22 at 08:24 +0530, K Prateek Nayak wrote:
> Hello Aaron,
>=20
> On 4/22/2025 7:40 AM, Aaron Lu wrote:
> > > anon_pipe_write()
> > >    __wake_up_common()
> > >      ep_poll_callback() {
> > >        read_lock_irq(&ep->lock)		/* Read lock acquired here */
> > I was confused by this function's name. I had thought irq is off but
> > then realized under PREEMPT_RT, read_lock_irq() doesn't disable irq...
>=20
> Yup! Most of the interrupt handlers are run by the IRQ threads on
> PREEMPT_RT and the ones that do run in the interrupt context have all
> been adapted to use non-blocking locks whose *_irq variants disables
> interrupts on PREEMPT_RT too.
>=20
> >=20
> > >        __wake_up_common()
> > >          ep_autoremove_wake_function()
> > >            try_to_wake_up()		/* Wakes up "epoll-stall" */
> > >              preempt_schedule()
> > >              ...
> > >=20
> > > # "epoll-stall-writer" has run out of bandwidth, needs replenish to r=
un
> > Luckily in this "only throttle when ret2user" model, epoll-stall-writer
> > does not need replenish to run again(and then unblock the others).
>=20
> I can confirm that throttle deferral solves this issue. I have run Jan's
> reproducer for a long time without seeing any hangs on your series. I
> hope Florian can confirm the same.
>=20

Partially, yes.

First, let me clarify what I am testing: I'm testing with PREEMPT_RT
enabled, as that is the setup that makes problems in the field. For
those setups it's not a performance/jitter optimization it's a critical
fix. The system locks up completely.

I ported the series to 6.14. Background was stability and the
possibility to replace one of the devices in the field with a patched
version. We do not trust anything newer yet.

The test results: 6.14 + backport is still running fine for ~10 days
now on a system where the reproducer (that Jan posted already) crashed
a unpatched 6.14 in a couple of minutes. Success.

But: I also started a test with 6.14 vanilla (so unpatched) on a
different system. This one crashes within a couple of minutes. This is
a completely different story - as the series we're discussing here is
not even applied - but to be complete, this is the last message we get
from the device:

The device is completely locked up afterwards. PID 34 is ktimers on
CPU1.

kernel: ------------[ cut here ]------------
kernel: !se->on_rq
kernel: WARNING: CPU: 1 PID: 34 at kernel/sched/fair.c:699 update_entity_la=
g+0x7d/0x90
kernel: Modules linked in: veth xt_nat nft_chain_nat xt_MASQUERADE nf_nat n=
f_conntrack_netlink xfr>
kernel:  sd_mod mptspi ata_generic mptscsih mptbase psmouse scsi_transport_=
spi ata_piix libata scs>
kernel: CPU: 1 UID: 0 PID: 34 Comm: ktimers/1 Not tainted 6.14.0 #1
kernel: Hardware name: VMware, Inc. VMware7,1/440BX Desktop Reference Platf=
orm, BIOS VMW71.00V.242>
kernel: RIP: 0010:update_entity_lag+0x7d/0x90
kernel: Code: 0f 4d d7 48 89 53 78 5b 5d c3 cc cc cc cc 80 3d e7 f4 dd 01 0=
0 75 a9 48 c7 c7 d0 81 >
kernel: RSP: 0018:ffffacf58012fbe8 EFLAGS: 00010082
kernel: RAX: 0000000000000000 RBX: ffff9ee43ca00080 RCX: 0000000000000027
kernel: RDX: ffff9ee6efd21988 RSI: 0000000000000001 RDI: ffff9ee6efd21980
kernel: RBP: ffff9ee421929800 R08: 00000000462951bd R09: ffffffff8e654811
kernel: R10: ffffffff8e654811 R11: ffffffff8e608a2a R12: 000000000000000e
kernel: R13: 0000000000000000 R14: 0000000000000000 R15: 000000000000000e
kernel: FS:  0000000000000000(0000) GS:ffff9ee6efd00000(0000) knlGS:0000000=
000000000
kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
kernel: CR2: 000000c00082a000 CR3: 0000000113416002 CR4: 00000000007706f0
kernel: PKRU: 55555554
kernel: Call Trace:
kernel:  <TASK>
kernel:  ? __warn+0x91/0x190
kernel:  ? update_entity_lag+0x7d/0x90
kernel:  ? report_bug+0x164/0x190
kernel:  ? handle_bug+0x58/0x90
kernel:  ? exc_invalid_op+0x17/0x70
kernel:  ? asm_exc_invalid_op+0x1a/0x20
kernel:  ? ret_from_fork_asm+0x1a/0x30
kernel:  ? ret_from_fork+0x31/0x50
kernel:  ? ret_from_fork+0x31/0x50
kernel:  ? update_entity_lag+0x7d/0x90
kernel:  ? update_entity_lag+0x7d/0x90
kernel:  dequeue_entity+0x90/0x5a0
kernel:  dequeue_entities+0x121/0x640
kernel:  dequeue_task_fair+0xbf/0x290
kernel:  rt_mutex_setprio+0x37c/0x690
kernel:  rtlock_slowlock_locked+0xca1/0x1860
kernel:  ? lock_acquire+0xcb/0x2e0
kernel:  ? run_ktimerd+0xe/0x80
kernel:  ? __pfx_smpboot_thread_fn+0x10/0x10
kernel:  rt_spin_lock+0x86/0x160
kernel:  __local_bh_disable_ip+0x9d/0x190
kernel:  ksoftirqd_run_begin+0xe/0x30
kernel:  run_ktimerd+0xe/0x80
kernel:  smpboot_thread_fn+0xda/0x1d0


