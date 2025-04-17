Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B17733FD
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 14:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.136.64.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744898790; cv=none; b=oXVMdxe4dQXa4Vi1wlf4PNeBgGckVI8kMSCqSJN9DUbIUXHXTfMTTNAF5tBPyD6QFK8PjtPhTN71lsM1opnDnfcUYEznXrlPWwH+M/uAGUeKQuA2XgF71Zdheu1OyQM5jsDomJ3DMfxOsZQS46xjMnO6OrMxDXqEYfPG+TLXZC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744898790; c=relaxed/simple;
	bh=1KD9YTVQf8X3D7TzvQUmVVoybFx8+iv868E8bK9aGa0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RNHvL8j5q9qKXKwyj5jtb8yx9oXq46qtzAASFMI1KonBYqn0PPU2/UBZjTMTpWutBZ77iJ8zj+Jo5Tzl9E130tk/6ot2XnqewG4ceG7keL2M/5ISof004Q3d5s3bRczx6LathJUU7YhYppRzXD9Srru4a1INe5gF8uLn9rcaHAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=florian.bezdeka@siemens.com header.b=RHpdflBY; arc=none smtp.client-ip=185.136.64.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=florian.bezdeka@siemens.com header.b="RHpdflBY"
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20250417140617e71418750c37a3ba91
        for <linux-kernel@vger.kernel.org>;
        Thu, 17 Apr 2025 16:06:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=florian.bezdeka@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=+77D9Hd6ztOkLTTZiFJRbFD+9YMWatgxeAgqmG68ut4=;
 b=RHpdflBYtYDZI6PKpsNhbWsnrqYPim2BmF3ndDZpUTxNAilDSAW/r558WZPDBfXLm3oBFz
 0PlrjxUT60g96O9yXUUxlHZDGHHvytzwQ3LC36yVC1tL2exAKG3ATNbzQiiQiCBMFgo/qV7v
 A6hEJZSEf2LxfK423LphUJi6lA1fEnctAJ0hGsUbCZKHppPZCmX5XwOZyv3Ah9qXVtCwVP43
 oCLZxRz73UAJHtp7FLvFBU5fFn6jqA96cMDzIJNnFR0dBRS/J89/3CnLrPpk9UQEyyU/mC6f
 sGSDp6NQINDsMmT23sy4cyyIamap2e4Gr+7VkUJUQZl1QLCxKKP0d7Hg==;
Message-ID: <099db50ce28f8b4bde37b051485de62a8f452cc2.camel@siemens.com>
Subject: Re: [RFC PATCH v2 7/7] sched/fair: alternative way of accounting
 throttle time
From: Florian Bezdeka <florian.bezdeka@siemens.com>
To: Aaron Lu <ziqianlu@bytedance.com>, Valentin Schneider
 <vschneid@redhat.com>,  Ben Segall <bsegall@google.com>, K Prateek Nayak
 <kprateek.nayak@amd.com>, Peter Zijlstra	 <peterz@infradead.org>, Josh Don
 <joshdon@google.com>, Ingo Molnar	 <mingo@redhat.com>, Vincent Guittot
 <vincent.guittot@linaro.org>, Xi Wang	 <xii@google.com>
Cc: linux-kernel@vger.kernel.org, Juri Lelli <juri.lelli@redhat.com>, 
 Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt
 <rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>,  Chengming Zhou
 <chengming.zhou@linux.dev>, Chuyi Zhou <zhouchuyi@bytedance.com>, Jan
 Kiszka	 <jan.kiszka@siemens.com>
Date: Thu, 17 Apr 2025 16:06:16 +0200
In-Reply-To: <20250409120746.635476-8-ziqianlu@bytedance.com>
References: <20250409120746.635476-1-ziqianlu@bytedance.com>
	 <20250409120746.635476-8-ziqianlu@bytedance.com>
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

Hi Aaron,

On Wed, 2025-04-09 at 20:07 +0800, Aaron Lu wrote:
> @@ -5889,27 +5943,21 @@ static int tg_unthrottle_up(struct task_group *tg=
, void *data)
> =C2=A0	cfs_rq->throttled_clock_pelt_time +=3D rq_clock_pelt(rq) -
> =C2=A0		cfs_rq->throttled_clock_pelt;
> =C2=A0
> -	if (cfs_rq->throttled_clock_self) {
> -		u64 delta =3D rq_clock(rq) - cfs_rq->throttled_clock_self;
> -
> -		cfs_rq->throttled_clock_self =3D 0;
> -
> -		if (WARN_ON_ONCE((s64)delta < 0))
> -			delta =3D 0;
> -
> -		cfs_rq->throttled_clock_self_time +=3D delta;
> -	}
> +	if (cfs_rq->throttled_clock_self)
> +		account_cfs_rq_throttle_self(cfs_rq);
> =C2=A0
> =C2=A0	/* Re-enqueue the tasks that have been throttled at this level. */
> =C2=A0	list_for_each_entry_safe(p, tmp, &cfs_rq->throttled_limbo_list, th=
rottle_node) {
> =C2=A0		list_del_init(&p->throttle_node);
> -		enqueue_task_fair(rq_of(cfs_rq), p, ENQUEUE_WAKEUP);
> +		enqueue_task_fair(rq_of(cfs_rq), p, ENQUEUE_WAKEUP | ENQUEUE_THROTTLE)=
;
> =C2=A0	}
> =C2=A0
> =C2=A0	/* Add cfs_rq with load or one or more already running entities to=
 the list */
> =C2=A0	if (!cfs_rq_is_decayed(cfs_rq))
> =C2=A0		list_add_leaf_cfs_rq(cfs_rq);
> =C2=A0
> +	WARN_ON_ONCE(cfs_rq->h_nr_throttled);
> +
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0

I got this warning while testing in our virtual environment:

Any idea?

[   26.639641] ------------[ cut here ]------------
[   26.639644] WARNING: CPU: 5 PID: 0 at kernel/sched/fair.c:5967 tg_unthro=
ttle_up+0x1a6/0x3d0
[   26.639653] Modules linked in: veth xt_nat nft_chain_nat xt_MASQUERADE n=
f_nat nf_conntrack_netlink xfrm_user xfrm_algo br_netfilter bridge stp llc =
xt_recent rfkill ip6t_REJECT nf_reject_ipv6 xt_hl ip6t_rt vsock_loopback vm=
w_vsock_virtio_transport_common ipt_REJECT nf_reject_ipv4 xt_LOG nf_log_sys=
log vmw_vsock_vmci_transport xt_comment vsock nft_limit xt_limit xt_addrtyp=
e xt_tcpudp xt_conntrack nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 nft_com=
pat nf_tables intel_rapl_msr intel_rapl_common nfnetlink binfmt_misc intel_=
uncore_frequency_common isst_if_mbox_msr isst_if_common skx_edac_common nfi=
t libnvdimm ghash_clmulni_intel sha512_ssse3 sha256_ssse3 sha1_ssse3 aesni_=
intel snd_pcm crypto_simd cryptd snd_timer rapl snd soundcore vmw_balloon v=
mwgfx pcspkr drm_ttm_helper ttm drm_client_lib button ac drm_kms_helper sg =
vmw_vmci evdev joydev serio_raw drm loop efi_pstore configfs efivarfs ip_ta=
bles x_tables autofs4 overlay nls_ascii nls_cp437 vfat fat ext4 crc16 mbcac=
he jbd2 squashfs dm_verity dm_bufio reed_solomon dm_mod
[   26.639715]  sd_mod ata_generic mptspi mptscsih ata_piix mptbase libata =
scsi_transport_spi psmouse scsi_mod vmxnet3 i2c_piix4 i2c_smbus scsi_common
[   26.639726] CPU: 5 UID: 0 PID: 0 Comm: swapper/5 Not tainted 6.14.2-CFSf=
ixes #1
[   26.639729] Hardware name: VMware, Inc. VMware7,1/440BX Desktop Referenc=
e Platform, BIOS VMW71.00V.24224532.B64.2408191458 08/19/2024
[   26.639731] RIP: 0010:tg_unthrottle_up+0x1a6/0x3d0
[   26.639735] Code: 00 00 48 39 ca 74 14 48 8b 52 10 49 8b 8e 58 01 00 00 =
48 39 8a 28 01 00 00 74 24 41 8b 86 68 01 00 00 85 c0 0f 84 8d fe ff ff <0f=
> 0b e9 86 fe ff ff 49 8b 9e 38 01 00 00 41 8b 86 40 01 00 00 48
[   26.639737] RSP: 0000:ffffa5df8029cec8 EFLAGS: 00010002
[   26.639739] RAX: 0000000000000001 RBX: ffff981c6fcb6a80 RCX: ffff9819437=
52e40
[   26.639741] RDX: 0000000000000005 RSI: ffff981c6fcb6a80 RDI: ffff9819437=
52d00
[   26.639742] RBP: ffff9819607dc708 R08: ffff981c6fcb6a80 R09: 00000000000=
00000
[   26.639744] R10: 0000000000000001 R11: ffff981969936a10 R12: ffff9819607=
dc708
[   26.639745] R13: ffff9819607dc9d8 R14: ffff9819607dc800 R15: ffffffffad9=
13fb0
[   26.639747] FS:  0000000000000000(0000) GS:ffff981c6fc80000(0000) knlGS:=
0000000000000000
[   26.639749] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   26.639750] CR2: 00007ff1292dc44c CR3: 000000015350e006 CR4: 00000000007=
706f0
[   26.639779] PKRU: 55555554
[   26.639781] Call Trace:
[   26.639783]  <IRQ>
[   26.639787]  ? __pfx_tg_unthrottle_up+0x10/0x10
[   26.639790]  ? __pfx_tg_nop+0x10/0x10
[   26.639793]  walk_tg_tree_from+0x58/0xb0
[   26.639797]  unthrottle_cfs_rq+0xf0/0x360
[   26.639800]  ? sched_clock_cpu+0xf/0x190
[   26.639808]  __cfsb_csd_unthrottle+0x11c/0x170
[   26.639812]  ? __pfx___cfsb_csd_unthrottle+0x10/0x10
[   26.639816]  __flush_smp_call_function_queue+0x103/0x410
[   26.639822]  __sysvec_call_function_single+0x1c/0xb0
[   26.639826]  sysvec_call_function_single+0x6c/0x90
[   26.639832]  </IRQ>
[   26.639833]  <TASK>
[   26.639834]  asm_sysvec_call_function_single+0x1a/0x20
[   26.639840] RIP: 0010:pv_native_safe_halt+0xf/0x20
[   26.639844] Code: 22 d7 c3 cc cc cc cc 0f 1f 40 00 90 90 90 90 90 90 90 =
90 90 90 90 90 90 90 90 90 f3 0f 1e fa 66 90 0f 00 2d 45 c1 13 00 fb f4 <c3=
> cc cc cc cc 66 66 2e 0f 1f 84 00 00 00 00 00 90 90 90 90 90 90
[   26.639846] RSP: 0000:ffffa5df80117ed8 EFLAGS: 00000242
[   26.639848] RAX: 0000000000000005 RBX: ffff981940804000 RCX: ffff9819a9d=
f7000
[   26.639849] RDX: 0000000000000005 RSI: 0000000000000005 RDI: 00000000000=
5c514
[   26.639851] RBP: 0000000000000005 R08: 0000000000000000 R09: 00000000000=
00001
[   26.639852] R10: 0000000000000001 R11: 0000000000000000 R12: 00000000000=
00000
[   26.639853] R13: 0000000000000000 R14: 0000000000000000 R15: 00000000000=
00000
[   26.639858]  default_idle+0x9/0x20
[   26.639861]  default_idle_call+0x30/0x100
[   26.639863]  do_idle+0x1fd/0x240
[   26.639869]  cpu_startup_entry+0x29/0x30
[   26.639872]  start_secondary+0x11e/0x140
[   26.639875]  common_startup_64+0x13e/0x141
[   26.639881]  </TASK>
[   26.639882] ---[ end trace 0000000000000000 ]---

Best regards,
Florian

--=20
Siemens AG, Foundational Technologies
Linux Expert Center



