Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64EA139ACF
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 09:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.136.64.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746610438; cv=none; b=jCPNOhhbzUEJZxcNbHY6WYvYUdzMyT2dsd4Of4HvdMwogL8sKmbQngMITbgocNUU/IXMfoil/zvf/7vZn1SyMdyShXdaJUZU9moaXXX6jEuaRsfK8qxzTgMTUrK7kxEAu4UNd43akx+lNwLT4OvqJBGbWdekNFYNL1Zwt5PcRF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746610438; c=relaxed/simple;
	bh=1MMJUkb558bbVGWokojuki+mp7HwEkyWUfWW6ftRkpE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Iv+Mtf/lqQmCt5fBaEUE/zHYjEU3AM8Y/SJs/ko6/2wPc74Xzze1SPBAmeB8XoqQYKN3mZum8kDkipglHeQ4//IbfaaADV6yDxcHC7gS3qwaJVa6LG66wi4YXU44wUcTe6J91KnrKOsfvFnEn1WNBeRwI6jVaIb7Vf0QVlT/U1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=florian.bezdeka@siemens.com header.b=EzA91uXn; arc=none smtp.client-ip=185.136.64.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=florian.bezdeka@siemens.com header.b="EzA91uXn"
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20250507093343c138a0901f040c482d
        for <linux-kernel@vger.kernel.org>;
        Wed, 07 May 2025 11:33:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=florian.bezdeka@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=cTmDV+v7uKYTKkka+2gvuxVdQ08Se4qrrw+UklDrSi0=;
 b=EzA91uXnL1wN7BLjAOKA8dA7qzWemi2GbZMmMkD93pphopMYVQXf44H60FUuMgWdiFbx3O
 PFJtOdWN5blyjDc4wG+KIdwDOAxsjKVq2uFpH07JcSFv8jk3rwgF63E4/XkgiaXYakisUIw/
 XXzFdy2rl6untGHUNzE/TMTtyIgZyp8Aeo6SBj0cTt9tX2rDbt6wCR0Oeq9GpBK1JHZe6gT2
 NP/Ose5zDU25E3DVKJ8Cokb4CIhVumUJoSgffHJnwB5swicolcpDKHaoeCr/j5rKxmVj3W2b
 bBrlGlSXy7yuX3huUAQRFm0h+OhwsNJ0AjshA3sDM3VRUxlsX1m78izw==;
Message-ID: <618bc3b199f19be916913301edb5ec832131e842.camel@siemens.com>
Subject: Re: [RFC PATCH v2 7/7] sched/fair: alternative way of accounting
 throttle time
From: Florian Bezdeka <florian.bezdeka@siemens.com>
To: Aaron Lu <ziqianlu@bytedance.com>
Cc: Valentin Schneider <vschneid@redhat.com>, Ben Segall
 <bsegall@google.com>,  K Prateek Nayak <kprateek.nayak@amd.com>, Peter
 Zijlstra <peterz@infradead.org>, Josh Don <joshdon@google.com>,  Ingo
 Molnar <mingo@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Xi
 Wang <xii@google.com>, 	linux-kernel@vger.kernel.org, Juri Lelli
 <juri.lelli@redhat.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Mel Gorman	 <mgorman@suse.de>,
 Chengming Zhou <chengming.zhou@linux.dev>, Chuyi Zhou	
 <zhouchuyi@bytedance.com>, Jan Kiszka <jan.kiszka@siemens.com>
Date: Wed, 07 May 2025 11:33:42 +0200
In-Reply-To: <20250507090923.GA194948@bytedance>
References: <20250409120746.635476-1-ziqianlu@bytedance.com>
	 <20250409120746.635476-8-ziqianlu@bytedance.com>
	 <099db50ce28f8b4bde37b051485de62a8f452cc2.camel@siemens.com>
	 <20250507090923.GA194948@bytedance>
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

On Wed, 2025-05-07 at 17:09 +0800, Aaron Lu wrote:
> Hi Florian,
>=20
> On Thu, Apr 17, 2025 at 04:06:16PM +0200, Florian Bezdeka wrote:
> > Hi Aaron,
> >=20
> > On Wed, 2025-04-09 at 20:07 +0800, Aaron Lu wrote:
> > > @@ -5889,27 +5943,21 @@ static int tg_unthrottle_up(struct task_group=
 *tg, void *data)
> > > =C2=A0	cfs_rq->throttled_clock_pelt_time +=3D rq_clock_pelt(rq) -
> > > =C2=A0		cfs_rq->throttled_clock_pelt;
> > > =C2=A0
> > > -	if (cfs_rq->throttled_clock_self) {
> > > -		u64 delta =3D rq_clock(rq) - cfs_rq->throttled_clock_self;
> > > -
> > > -		cfs_rq->throttled_clock_self =3D 0;
> > > -
> > > -		if (WARN_ON_ONCE((s64)delta < 0))
> > > -			delta =3D 0;
> > > -
> > > -		cfs_rq->throttled_clock_self_time +=3D delta;
> > > -	}
> > > +	if (cfs_rq->throttled_clock_self)
> > > +		account_cfs_rq_throttle_self(cfs_rq);
> > > =C2=A0
> > > =C2=A0	/* Re-enqueue the tasks that have been throttled at this level=
. */
> > > =C2=A0	list_for_each_entry_safe(p, tmp, &cfs_rq->throttled_limbo_list=
, throttle_node) {
> > > =C2=A0		list_del_init(&p->throttle_node);
> > > -		enqueue_task_fair(rq_of(cfs_rq), p, ENQUEUE_WAKEUP);
> > > +		enqueue_task_fair(rq_of(cfs_rq), p, ENQUEUE_WAKEUP | ENQUEUE_THROT=
TLE);
> > > =C2=A0	}
> > > =C2=A0
> > > =C2=A0	/* Add cfs_rq with load or one or more already running entitie=
s to the list */
> > > =C2=A0	if (!cfs_rq_is_decayed(cfs_rq))
> > > =C2=A0		list_add_leaf_cfs_rq(cfs_rq);
> > > =C2=A0
> > > +	WARN_ON_ONCE(cfs_rq->h_nr_throttled);
> > > +
> > > =C2=A0	return 0;
> > > =C2=A0}
> > > =C2=A0
> >=20
> > I got this warning while testing in our virtual environment:
> >=20
> > Any idea?
> >=20
>=20
> I made a stupid mistake here: I thought when a cfs_rq gets unthrottled,
> it should have no tasks in throttled state, hence I added that check in
> tg_unthrottle_up():
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WARN_ON_ONCE(cfs_rq->h_nr_thro=
ttled);
>=20
> But h_nr_throttled tracks hierarchical throttled task number, which
> means if this cfs_rq has descendent cfs_rqs that are still in throttled
> state, its h_nr_throttled can be > 0 when it gets unthrottled.
>=20
> I just made a setup to emulate this scenario and can reproduce this
> warning. I guess in your setup, there are multiple cpu.max settings in a
> cgroup hierarchy.

I will have a look.

>=20
> It's just the warn_on_once() itself is incorrect, I'll remove it in next
> version, thanks for the report!

You're welcome. IOW: I can ignore the warning. Great.

I meanwhile forward ported the 5.15 based series that you provided to
6.1 and applied massive testing in our lab. It looks very promising up
to now. Our freeze seems solved now.

Thanks for you're help! Very much appreciated!

We updated one device in the field today - at customer site. It will
take another week until I can report success. Let's hope.

The tests based on 6.14 are also looking good.

To sum up: This series fixes (or seems to fix, let's wait for one more
week to be sure) a critical RT issue. Is there a chance that once we
made it into mainline that we see (official) backports? 6.12 or 6.1
would be nice.

I could paste my 6.1 and 6.12 series, if that would help. But as there
will be at least one more iteration that work needs a refresh as well.

Best regards,
Florian
>=20
> > [=C2=A0=C2=A0 26.639641] ------------[ cut here ]------------
> > [=C2=A0=C2=A0 26.639644] WARNING: CPU: 5 PID: 0 at kernel/sched/fair.c:=
5967 tg_unthrottle_up+0x1a6/0x3d0
> > [=C2=A0=C2=A0 26.639653] Modules linked in: veth xt_nat nft_chain_nat x=
t_MASQUERADE nf_nat nf_conntrack_netlink xfrm_user xfrm_algo br_netfilter b=
ridge stp llc xt_recent rfkill ip6t_REJECT nf_reject_ipv6 xt_hl ip6t_rt vso=
ck_loopback vmw_vsock_virtio_transport_common ipt_REJECT nf_reject_ipv4 xt_=
LOG nf_log_syslog vmw_vsock_vmci_transport xt_comment vsock nft_limit xt_li=
mit xt_addrtype xt_tcpudp xt_conntrack nf_conntrack nf_defrag_ipv6 nf_defra=
g_ipv4 nft_compat nf_tables intel_rapl_msr intel_rapl_common nfnetlink binf=
mt_misc intel_uncore_frequency_common isst_if_mbox_msr isst_if_common skx_e=
dac_common nfit libnvdimm ghash_clmulni_intel sha512_ssse3 sha256_ssse3 sha=
1_ssse3 aesni_intel snd_pcm crypto_simd cryptd snd_timer rapl snd soundcore=
 vmw_balloon vmwgfx pcspkr drm_ttm_helper ttm drm_client_lib button ac drm_=
kms_helper sg vmw_vmci evdev joydev serio_raw drm loop efi_pstore configfs =
efivarfs ip_tables x_tables autofs4 overlay nls_ascii nls_cp437 vfat fat ex=
t4 crc16 mbcache jbd2 squashfs dm_verity dm_bufio reed_solomon dm_mod
> > [=C2=A0=C2=A0 26.639715]=C2=A0 sd_mod ata_generic mptspi mptscsih ata_p=
iix mptbase libata scsi_transport_spi psmouse scsi_mod vmxnet3 i2c_piix4 i2=
c_smbus scsi_common
> > [=C2=A0=C2=A0 26.639726] CPU: 5 UID: 0 PID: 0 Comm: swapper/5 Not taint=
ed 6.14.2-CFSfixes #1
> > [=C2=A0=C2=A0 26.639729] Hardware name: VMware, Inc. VMware7,1/440BX De=
sktop Reference Platform, BIOS VMW71.00V.24224532.B64.2408191458 08/19/2024
> > [=C2=A0=C2=A0 26.639731] RIP: 0010:tg_unthrottle_up+0x1a6/0x3d0
> > [=C2=A0=C2=A0 26.639735] Code: 00 00 48 39 ca 74 14 48 8b 52 10 49 8b 8=
e 58 01 00 00 48 39 8a 28 01 00 00 74 24 41 8b 86 68 01 00 00 85 c0 0f 84 8=
d fe ff ff <0f> 0b e9 86 fe ff ff 49 8b 9e 38 01 00 00 41 8b 86 40 01 00 00=
 48
> > [=C2=A0=C2=A0 26.639737] RSP: 0000:ffffa5df8029cec8 EFLAGS: 00010002
> > [=C2=A0=C2=A0 26.639739] RAX: 0000000000000001 RBX: ffff981c6fcb6a80 RC=
X: ffff981943752e40
> > [=C2=A0=C2=A0 26.639741] RDX: 0000000000000005 RSI: ffff981c6fcb6a80 RD=
I: ffff981943752d00
> > [=C2=A0=C2=A0 26.639742] RBP: ffff9819607dc708 R08: ffff981c6fcb6a80 R0=
9: 0000000000000000
> > [=C2=A0=C2=A0 26.639744] R10: 0000000000000001 R11: ffff981969936a10 R1=
2: ffff9819607dc708
> > [=C2=A0=C2=A0 26.639745] R13: ffff9819607dc9d8 R14: ffff9819607dc800 R1=
5: ffffffffad913fb0
> > [=C2=A0=C2=A0 26.639747] FS:=C2=A0 0000000000000000(0000) GS:ffff981c6f=
c80000(0000) knlGS:0000000000000000
> > [=C2=A0=C2=A0 26.639749] CS:=C2=A0 0010 DS: 0000 ES: 0000 CR0: 00000000=
80050033
> > [=C2=A0=C2=A0 26.639750] CR2: 00007ff1292dc44c CR3: 000000015350e006 CR=
4: 00000000007706f0
> > [=C2=A0=C2=A0 26.639779] PKRU: 55555554
> > [=C2=A0=C2=A0 26.639781] Call Trace:
> > [=C2=A0=C2=A0 26.639783]=C2=A0 <IRQ>
> > [=C2=A0=C2=A0 26.639787]=C2=A0 ? __pfx_tg_unthrottle_up+0x10/0x10
> > [=C2=A0=C2=A0 26.639790]=C2=A0 ? __pfx_tg_nop+0x10/0x10
> > [=C2=A0=C2=A0 26.639793]=C2=A0 walk_tg_tree_from+0x58/0xb0
> > [=C2=A0=C2=A0 26.639797]=C2=A0 unthrottle_cfs_rq+0xf0/0x360
> > [=C2=A0=C2=A0 26.639800]=C2=A0 ? sched_clock_cpu+0xf/0x190
> > [=C2=A0=C2=A0 26.639808]=C2=A0 __cfsb_csd_unthrottle+0x11c/0x170
> > [=C2=A0=C2=A0 26.639812]=C2=A0 ? __pfx___cfsb_csd_unthrottle+0x10/0x10
> > [=C2=A0=C2=A0 26.639816]=C2=A0 __flush_smp_call_function_queue+0x103/0x=
410
> > [=C2=A0=C2=A0 26.639822]=C2=A0 __sysvec_call_function_single+0x1c/0xb0
> > [=C2=A0=C2=A0 26.639826]=C2=A0 sysvec_call_function_single+0x6c/0x90
> > [=C2=A0=C2=A0 26.639832]=C2=A0 </IRQ>
> > [=C2=A0=C2=A0 26.639833]=C2=A0 <TASK>
> > [=C2=A0=C2=A0 26.639834]=C2=A0 asm_sysvec_call_function_single+0x1a/0x2=
0
> > [=C2=A0=C2=A0 26.639840] RIP: 0010:pv_native_safe_halt+0xf/0x20
> > [=C2=A0=C2=A0 26.639844] Code: 22 d7 c3 cc cc cc cc 0f 1f 40 00 90 90 9=
0 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 66 90 0f 00 2d 45 c1 1=
3 00 fb f4 <c3> cc cc cc cc 66 66 2e 0f 1f 84 00 00 00 00 00 90 90 90 90 90=
 90
> > [=C2=A0=C2=A0 26.639846] RSP: 0000:ffffa5df80117ed8 EFLAGS: 00000242
> > [=C2=A0=C2=A0 26.639848] RAX: 0000000000000005 RBX: ffff981940804000 RC=
X: ffff9819a9df7000
> > [=C2=A0=C2=A0 26.639849] RDX: 0000000000000005 RSI: 0000000000000005 RD=
I: 000000000005c514
> > [=C2=A0=C2=A0 26.639851] RBP: 0000000000000005 R08: 0000000000000000 R0=
9: 0000000000000001
> > [=C2=A0=C2=A0 26.639852] R10: 0000000000000001 R11: 0000000000000000 R1=
2: 0000000000000000
> > [=C2=A0=C2=A0 26.639853] R13: 0000000000000000 R14: 0000000000000000 R1=
5: 0000000000000000
> > [=C2=A0=C2=A0 26.639858]=C2=A0 default_idle+0x9/0x20
> > [=C2=A0=C2=A0 26.639861]=C2=A0 default_idle_call+0x30/0x100
> > [=C2=A0=C2=A0 26.639863]=C2=A0 do_idle+0x1fd/0x240
> > [=C2=A0=C2=A0 26.639869]=C2=A0 cpu_startup_entry+0x29/0x30
> > [=C2=A0=C2=A0 26.639872]=C2=A0 start_secondary+0x11e/0x140
> > [=C2=A0=C2=A0 26.639875]=C2=A0 common_startup_64+0x13e/0x141
> > [=C2=A0=C2=A0 26.639881]=C2=A0 </TASK>
> > [=C2=A0=C2=A0 26.639882] ---[ end trace 0000000000000000 ]---

