Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1117234971
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 09:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746608982; cv=none; b=D64x355+XrLE54ZQ0q7jYnXRMikye06of+u9bNAxuVE15NtvkkCJl8p9uTtW97tD7KGCDqkXCheA/9R0SpgaI53+HeLSc+s6BgQpNw/7XX8/3iU94OiL7IltbS/N186wf5auOBcys4DpnO3zfrSnocq13HtWvJgWYnt4lV6VgN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746608982; c=relaxed/simple;
	bh=wXBWuPEfAaX019ieJsFKSJGb5hqbbPn+USMn7aPCQB4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ib07peOEWV2i5xWJIiAkIkz+Uk8dS74R2NWlT3xtwPSKQyZqvr4nXz/oFAJudZl0HSqMecPTL70k4iWfKQScVSA6p1DMyXvQPgcuMBeEJlhBE2bgdQJ7I2mGTFoXuFnCh4ux8podJ6XaiS38Y7G1HrZW5IQltP6Lo0n6nhC7azI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=jl/ubejR; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="jl/ubejR"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22e15aea506so61343915ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 02:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1746608979; x=1747213779; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WY1b1qiEg0mRIsEvq0huyi5nrN2SoYZxQsiO6G2Z2So=;
        b=jl/ubejRFhvM6R8pDpQ4BTM42r6IlgIE3i2FTGElSF9CS0h7mDLAlYc1YSlasg8dRv
         LOkhbQfne/fVbc87EgWwZMOlUyrrDrDZgr1N62NWC9d/vUoAfRT4r4BYDTxodcHZIu9k
         naihlQDa8vX3CSwESWWz/Cbvy4BZH5ZELaWEQh2QGq1Q7vaHt5f3SHjHNibwrHoK7L3Z
         252uGij1seyutsPsIdwUhj9BC0hbnjCFL6mjJn7bnaSQ4co793Mdd9AadUjYXsouGp+8
         1Z7QCIbrxfFpLjRmfd/sZLN2XoJlS+SMmAox/LT7FOFx8rdno8VF13Ys0k9k9LewDage
         bwPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746608979; x=1747213779;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WY1b1qiEg0mRIsEvq0huyi5nrN2SoYZxQsiO6G2Z2So=;
        b=iK2KtjBcK2kiIJc9Xe+kZ3txODUmudHGUhadwPlh6zKRNTVqZoz1Ru865NmD9Td1OQ
         bcKGirz+ZPWo11HHVRjLEhT5UaGQ36zjlfm6f6o5n1VTmgZUgXGxxcYiaOoNyAxyJSU4
         KT4tQCLjWE2QeYQWaihHQETgTX45JMysoIt3eBtepFCG+kGTPN2GfTUGu74bKCx9Oglt
         SuU3gmPwv5RygbxbxX6GmK7bZOxc37lcIVK4gN44YxIEchD15uiZXNMgrvcI9+xN0e1P
         ktPsXea4/5TAP76NgGLKb+ysBC703d2NE6uv+hEgUfApWT3F1GabjkZ0jNc121DjR4Gq
         E2mw==
X-Forwarded-Encrypted: i=1; AJvYcCVTHExqIZIytwD2rbr6MLsqe4FfyOKo/kwH0CbfYu6slD4s3sKNTVZ/fxQcTHYQ670/oWjQQFVRTKgzaqo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOPxVl4los8iwUboI8ldP68QlZ6EYHagmwWs1I1yEjPQonJOEe
	Rr7J0cvz6c7q7Jd31OvovKVQAIGWuYCdKiFHWxdX7dwQFqDOpZRHAxi1rL/gxA==
X-Gm-Gg: ASbGnctWgf9SA4258Kq9NB9JZppIIHnWqNTy6CgIhgX7W7lXIlod7bQAs+Vgi3APQkq
	vtE9nxhlqSiSRTDwMjiuLZ5zAiejVyxh5lVwZCepSENq9DkXPeR14vK6cNYUYFdX3Hf8P82kZgw
	iJwJCmEj+Dee1OPd4dvVDiuPX/xUCD3TUa8uPpgMPVhmjlyER4TQgtdS+oDWBzO5R3XjcbBslhn
	muG+liFJX7alRl2iWxh/YzraIZ0vSDCoJDw4cGBetjBuMUbkvgqJ2WeDVDmQwFfqbIQOYuqkZ8q
	DIRzuC+DnPrr5cu4STtZ4+WfDFgPgiP+g0sFYub5VBMZSlWBVq0=
X-Google-Smtp-Source: AGHT+IEq/46S+fUXZ/+XrT12GP+VOr9i+mCJitceDea4tmF0O13MZB1YIdMs727wtiU507BTRVy4mw==
X-Received: by 2002:a17:903:2a83:b0:224:a96:e39 with SMTP id d9443c01a7336-22e5ea58fccmr35866655ad.9.1746608979110;
        Wed, 07 May 2025 02:09:39 -0700 (PDT)
Received: from bytedance ([115.190.40.15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e70881d52sm5343095ad.129.2025.05.07.02.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 02:09:38 -0700 (PDT)
Date: Wed, 7 May 2025 17:09:23 +0800
From: Aaron Lu <ziqianlu@bytedance.com>
To: Florian Bezdeka <florian.bezdeka@siemens.com>
Cc: Valentin Schneider <vschneid@redhat.com>,
	Ben Segall <bsegall@google.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Don <joshdon@google.com>, Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Xi Wang <xii@google.com>, linux-kernel@vger.kernel.org,
	Juri Lelli <juri.lelli@redhat.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Chuyi Zhou <zhouchuyi@bytedance.com>,
	Jan Kiszka <jan.kiszka@siemens.com>
Subject: Re: [RFC PATCH v2 7/7] sched/fair: alternative way of accounting
 throttle time
Message-ID: <20250507090923.GA194948@bytedance>
References: <20250409120746.635476-1-ziqianlu@bytedance.com>
 <20250409120746.635476-8-ziqianlu@bytedance.com>
 <099db50ce28f8b4bde37b051485de62a8f452cc2.camel@siemens.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <099db50ce28f8b4bde37b051485de62a8f452cc2.camel@siemens.com>

Hi Florian,

On Thu, Apr 17, 2025 at 04:06:16PM +0200, Florian Bezdeka wrote:
> Hi Aaron,
>=20
> On Wed, 2025-04-09 at 20:07 +0800, Aaron Lu wrote:
> > @@ -5889,27 +5943,21 @@ static int tg_unthrottle_up(struct task_group *=
tg, void *data)
> > =C2=A0	cfs_rq->throttled_clock_pelt_time +=3D rq_clock_pelt(rq) -
> > =C2=A0		cfs_rq->throttled_clock_pelt;
> > =C2=A0
> > -	if (cfs_rq->throttled_clock_self) {
> > -		u64 delta =3D rq_clock(rq) - cfs_rq->throttled_clock_self;
> > -
> > -		cfs_rq->throttled_clock_self =3D 0;
> > -
> > -		if (WARN_ON_ONCE((s64)delta < 0))
> > -			delta =3D 0;
> > -
> > -		cfs_rq->throttled_clock_self_time +=3D delta;
> > -	}
> > +	if (cfs_rq->throttled_clock_self)
> > +		account_cfs_rq_throttle_self(cfs_rq);
> > =C2=A0
> > =C2=A0	/* Re-enqueue the tasks that have been throttled at this level. =
*/
> > =C2=A0	list_for_each_entry_safe(p, tmp, &cfs_rq->throttled_limbo_list, =
throttle_node) {
> > =C2=A0		list_del_init(&p->throttle_node);
> > -		enqueue_task_fair(rq_of(cfs_rq), p, ENQUEUE_WAKEUP);
> > +		enqueue_task_fair(rq_of(cfs_rq), p, ENQUEUE_WAKEUP | ENQUEUE_THROTTL=
E);
> > =C2=A0	}
> > =C2=A0
> > =C2=A0	/* Add cfs_rq with load or one or more already running entities =
to the list */
> > =C2=A0	if (!cfs_rq_is_decayed(cfs_rq))
> > =C2=A0		list_add_leaf_cfs_rq(cfs_rq);
> > =C2=A0
> > +	WARN_ON_ONCE(cfs_rq->h_nr_throttled);
> > +
> > =C2=A0	return 0;
> > =C2=A0}
> > =C2=A0
>=20
> I got this warning while testing in our virtual environment:
>=20
> Any idea?
>

I made a stupid mistake here: I thought when a cfs_rq gets unthrottled,
it should have no tasks in throttled state, hence I added that check in
tg_unthrottle_up():
        WARN_ON_ONCE(cfs_rq->h_nr_throttled);

But h_nr_throttled tracks hierarchical throttled task number, which
means if this cfs_rq has descendent cfs_rqs that are still in throttled
state, its h_nr_throttled can be > 0 when it gets unthrottled.

I just made a setup to emulate this scenario and can reproduce this
warning. I guess in your setup, there are multiple cpu.max settings in a
cgroup hierarchy.

It's just the warn_on_once() itself is incorrect, I'll remove it in next
version, thanks for the report!

Best regards,
Aaron

> [   26.639641] ------------[ cut here ]------------
> [   26.639644] WARNING: CPU: 5 PID: 0 at kernel/sched/fair.c:5967 tg_unth=
rottle_up+0x1a6/0x3d0
> [   26.639653] Modules linked in: veth xt_nat nft_chain_nat xt_MASQUERADE=
 nf_nat nf_conntrack_netlink xfrm_user xfrm_algo br_netfilter bridge stp ll=
c xt_recent rfkill ip6t_REJECT nf_reject_ipv6 xt_hl ip6t_rt vsock_loopback =
vmw_vsock_virtio_transport_common ipt_REJECT nf_reject_ipv4 xt_LOG nf_log_s=
yslog vmw_vsock_vmci_transport xt_comment vsock nft_limit xt_limit xt_addrt=
ype xt_tcpudp xt_conntrack nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 nft_c=
ompat nf_tables intel_rapl_msr intel_rapl_common nfnetlink binfmt_misc inte=
l_uncore_frequency_common isst_if_mbox_msr isst_if_common skx_edac_common n=
fit libnvdimm ghash_clmulni_intel sha512_ssse3 sha256_ssse3 sha1_ssse3 aesn=
i_intel snd_pcm crypto_simd cryptd snd_timer rapl snd soundcore vmw_balloon=
 vmwgfx pcspkr drm_ttm_helper ttm drm_client_lib button ac drm_kms_helper s=
g vmw_vmci evdev joydev serio_raw drm loop efi_pstore configfs efivarfs ip_=
tables x_tables autofs4 overlay nls_ascii nls_cp437 vfat fat ext4 crc16 mbc=
ache jbd2 squashfs dm_verity dm_bufio reed_solomon dm_mod
> [   26.639715]  sd_mod ata_generic mptspi mptscsih ata_piix mptbase libat=
a scsi_transport_spi psmouse scsi_mod vmxnet3 i2c_piix4 i2c_smbus scsi_comm=
on
> [   26.639726] CPU: 5 UID: 0 PID: 0 Comm: swapper/5 Not tainted 6.14.2-CF=
Sfixes #1
> [   26.639729] Hardware name: VMware, Inc. VMware7,1/440BX Desktop Refere=
nce Platform, BIOS VMW71.00V.24224532.B64.2408191458 08/19/2024
> [   26.639731] RIP: 0010:tg_unthrottle_up+0x1a6/0x3d0
> [   26.639735] Code: 00 00 48 39 ca 74 14 48 8b 52 10 49 8b 8e 58 01 00 0=
0 48 39 8a 28 01 00 00 74 24 41 8b 86 68 01 00 00 85 c0 0f 84 8d fe ff ff <=
0f> 0b e9 86 fe ff ff 49 8b 9e 38 01 00 00 41 8b 86 40 01 00 00 48
> [   26.639737] RSP: 0000:ffffa5df8029cec8 EFLAGS: 00010002
> [   26.639739] RAX: 0000000000000001 RBX: ffff981c6fcb6a80 RCX: ffff98194=
3752e40
> [   26.639741] RDX: 0000000000000005 RSI: ffff981c6fcb6a80 RDI: ffff98194=
3752d00
> [   26.639742] RBP: ffff9819607dc708 R08: ffff981c6fcb6a80 R09: 000000000=
0000000
> [   26.639744] R10: 0000000000000001 R11: ffff981969936a10 R12: ffff98196=
07dc708
> [   26.639745] R13: ffff9819607dc9d8 R14: ffff9819607dc800 R15: ffffffffa=
d913fb0
> [   26.639747] FS:  0000000000000000(0000) GS:ffff981c6fc80000(0000) knlG=
S:0000000000000000
> [   26.639749] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   26.639750] CR2: 00007ff1292dc44c CR3: 000000015350e006 CR4: 000000000=
07706f0
> [   26.639779] PKRU: 55555554
> [   26.639781] Call Trace:
> [   26.639783]  <IRQ>
> [   26.639787]  ? __pfx_tg_unthrottle_up+0x10/0x10
> [   26.639790]  ? __pfx_tg_nop+0x10/0x10
> [   26.639793]  walk_tg_tree_from+0x58/0xb0
> [   26.639797]  unthrottle_cfs_rq+0xf0/0x360
> [   26.639800]  ? sched_clock_cpu+0xf/0x190
> [   26.639808]  __cfsb_csd_unthrottle+0x11c/0x170
> [   26.639812]  ? __pfx___cfsb_csd_unthrottle+0x10/0x10
> [   26.639816]  __flush_smp_call_function_queue+0x103/0x410
> [   26.639822]  __sysvec_call_function_single+0x1c/0xb0
> [   26.639826]  sysvec_call_function_single+0x6c/0x90
> [   26.639832]  </IRQ>
> [   26.639833]  <TASK>
> [   26.639834]  asm_sysvec_call_function_single+0x1a/0x20
> [   26.639840] RIP: 0010:pv_native_safe_halt+0xf/0x20
> [   26.639844] Code: 22 d7 c3 cc cc cc cc 0f 1f 40 00 90 90 90 90 90 90 9=
0 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 66 90 0f 00 2d 45 c1 13 00 fb f4 <=
c3> cc cc cc cc 66 66 2e 0f 1f 84 00 00 00 00 00 90 90 90 90 90 90
> [   26.639846] RSP: 0000:ffffa5df80117ed8 EFLAGS: 00000242
> [   26.639848] RAX: 0000000000000005 RBX: ffff981940804000 RCX: ffff9819a=
9df7000
> [   26.639849] RDX: 0000000000000005 RSI: 0000000000000005 RDI: 000000000=
005c514
> [   26.639851] RBP: 0000000000000005 R08: 0000000000000000 R09: 000000000=
0000001
> [   26.639852] R10: 0000000000000001 R11: 0000000000000000 R12: 000000000=
0000000
> [   26.639853] R13: 0000000000000000 R14: 0000000000000000 R15: 000000000=
0000000
> [   26.639858]  default_idle+0x9/0x20
> [   26.639861]  default_idle_call+0x30/0x100
> [   26.639863]  do_idle+0x1fd/0x240
> [   26.639869]  cpu_startup_entry+0x29/0x30
> [   26.639872]  start_secondary+0x11e/0x140
> [   26.639875]  common_startup_64+0x13e/0x141
> [   26.639881]  </TASK>
> [   26.639882] ---[ end trace 0000000000000000 ]---
