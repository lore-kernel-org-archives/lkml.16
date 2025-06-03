Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636238821
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 01:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748915314; cv=none; b=aahA19Wxrfnre08WXAp8N9z8xXDgZ0fPvAQUjhn0w3EEWSkTYFX41ZX0csVjyAkqUA3KJ+bfU4/G1r5iWMG4fBIHeBBznzXPGhGZcMqG+ejGGmaSeNg5OJ5rwipOBSELyexkmm5h1iWlarXccW6P7VlKLlS7rPK7pGvNFuKbjK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748915314; c=relaxed/simple;
	bh=3G7vEupXjF2JGDhhB+aKBjXpHPIAImnns7bARvwL2tM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cypIfjagYwz5gnbWaClncewrQ6R3UHVRPH2TMAlZMqd1aD6OLwHzaaPl8XlwzNs+FYIihGDigCnKA1Fzn2hHdiHo/8AH6AvjMhUN4mfn1G1rHGtXTlrp8wHDonSxtwKFic9eIc7geOg2vbiSv/i/qXs6cYwn1u99X/8+t+55oIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nxv1fM0u; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nxv1fM0u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748915313; x=1780451313;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3G7vEupXjF2JGDhhB+aKBjXpHPIAImnns7bARvwL2tM=;
  b=Nxv1fM0ucyVnn59uQ/E/rnb6JyNzdQr4OEZfBd5H/5W/DF/piD1iBuQ2
   koU2EuYnWKM4oalVLya7MomZuc81aFPm3MnQGKXp4kPljJmoT36QmFbDo
   rkjATp5qLcrx1VmoTtf3w0IID7QyX9FNmKFhurfb/i8K9FgNuLURrOAuX
   Cw2hoXv+6rsB0vqhKBLB1ql0apYP3M5cYGxMRICHFqNH66DuY6EbrWyay
   4/DJQft32IjIpNOeCq5gMjJIk0SLa/56FRJAzFPntw5cK3KLv14ODYqmJ
   KItDF9HzyKsy4BjOC/jTOof1cIJ0hunCT3v6YYFypDE8/qVgpVzgowTk5
   g==;
X-CSE-ConnectionGUID: v8VCSfYUQiS6Wxmkr8N7wQ==
X-CSE-MsgGUID: DdCt96GrQ6a06V5zM42/yw==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="61199217"
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; 
   d="scan'208";a="61199217"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2025 18:48:32 -0700
X-CSE-ConnectionGUID: WOYmJrllS+yBWhT6DvR6CA==
X-CSE-MsgGUID: aJxDHlDES5mpD37asO+KLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; 
   d="scan'208";a="149854815"
Received: from ly-workstation.sh.intel.com (HELO ly-workstation) ([10.239.35.3])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2025 18:48:29 -0700
Date: Tue, 3 Jun 2025 09:48:26 +0800
From: "Lai, Yi" <yi1.lai@linux.intel.com>
To: Namhyung Kim <namhyung@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>,
	Kan Liang <kan.liang@linux.intel.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>, yi1.lai@intel.com
Subject: Re: [RFC/PATCH] perf/core: Use POLLHUP for a pinned event in error
Message-ID: <aD5UatkGo9salMl/@ly-workstation>
References: <20250317061745.1777584-1-namhyung@kernel.org>
 <aD2w50VDvGIH95Pf@ly-workstation>
 <aD3gGKtrww3mjiqG@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aD3gGKtrww3mjiqG@google.com>

On Mon, Jun 02, 2025 at 10:32:08AM -0700, Namhyung Kim wrote:
> Hello,
> 
> On Mon, Jun 02, 2025 at 10:10:47PM +0800, Lai, Yi wrote:
> > Hi Namhyung Kim,
> > 
> > Greetings!
> > 
> > I used Syzkaller and found that there is WARNING: locking bug in perf_event_wakeup in linux-next next-20250530.
> > 
> > After bisection and the first bad commit is:
> > "
> > f4b07fd62d4d perf/core: Use POLLHUP for pinned events in error
> > "
> > 
> > All detailed into can be found at:
> > https://github.com/laifryiee/syzkaller_logs/tree/main/250601_162355_perf_event_wakeup
> > Syzkaller repro code:
> > https://github.com/laifryiee/syzkaller_logs/tree/main/250601_162355_perf_event_wakeup/repro.c
> > Syzkaller repro syscall steps:
> > https://github.com/laifryiee/syzkaller_logs/tree/main/250601_162355_perf_event_wakeup/repro.prog
> > Syzkaller report:
> > https://github.com/laifryiee/syzkaller_logs/tree/main/250601_162355_perf_event_wakeup/repro.report
> > Kconfig(make olddefconfig):
> > https://github.com/laifryiee/syzkaller_logs/tree/main/250601_162355_perf_event_wakeup/kconfig_origin
> > Bisect info:
> > https://github.com/laifryiee/syzkaller_logs/tree/main/250601_162355_perf_event_wakeup/bisect_info.log
> > bzImage:
> > https://github.com/laifryiee/syzkaller_logs/raw/refs/heads/main/250601_162355_perf_event_wakeup/bzImage_next-20250530
> > Issue dmesg:
> > https://github.com/laifryiee/syzkaller_logs/blob/main/250601_162355_perf_event_wakeup/next-20250530_dmesg.log
> > 
> > "
> > [   39.913691] =============================
> > [   39.914157] [ BUG: Invalid wait context ]
> > [   39.914623] 6.15.0-next-20250530-next-2025053 #1 Not tainted
> > [   39.915271] -----------------------------
> > [   39.915731] repro/837 is trying to lock:
> > [   39.916191] ffff88801acfabd8 (&event->waitq){....}-{3:3}, at: __wake_up+0x26/0x60
> > [   39.917182] other info that might help us debug this:
> > [   39.917761] context-{5:5}
> > [   39.918079] 4 locks held by repro/837:
> > [   39.918530]  #0: ffffffff8725cd00 (rcu_read_lock){....}-{1:3}, at: __perf_event_task_sched_in+0xd1/0xbc0
> > [   39.919612]  #1: ffff88806ca3c6f8 (&cpuctx_lock){....}-{2:2}, at: __perf_event_task_sched_in+0x1a7/0xbc0
> > [   39.920748]  #2: ffff88800d91fc18 (&ctx->lock){....}-{2:2}, at: __perf_event_task_sched_in+0x1f9/0xbc0
> > [   39.921819]  #3: ffffffff8725cd00 (rcu_read_lock){....}-{1:3}, at: perf_event_wakeup+0x6c/0x470
> > [   39.922823] stack backtrace:
> > [   39.923171] CPU: 0 UID: 0 PID: 837 Comm: repro Not tainted 6.15.0-next-20250530-next-2025053 #1 PREEMPT(voluntary)
> > [   39.923196] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.16.3-0-ga6ed6b701f0a-prebuilt.qemu.o4
> > [   39.923214] Call Trace:
> > [   39.923221]  <TASK>
> > [   39.923228]  dump_stack_lvl+0xea/0x150
> > [   39.923256]  dump_stack+0x19/0x20
> > [   39.923276]  __lock_acquire+0xb22/0x22a0
> > [   39.923308]  ? x86_pmu_commit_txn+0x195/0x2b0
> > [   39.923339]  ? __lock_acquire+0x412/0x22a0
> > [   39.923375]  lock_acquire+0x170/0x310
> > [   39.923407]  ? __wake_up+0x26/0x60
> > [   39.923448]  _raw_spin_lock_irqsave+0x52/0x80
> > [   39.923473]  ? __wake_up+0x26/0x60
> > [   39.923504]  __wake_up+0x26/0x60
> > [   39.923537]  perf_event_wakeup+0x14a/0x470
> > [   39.923571]  merge_sched_in+0x846/0x15c0
> > [   39.923610]  visit_groups_merge.constprop.0.isra.0+0x952/0x1420
> > [   39.923653]  ? __pfx_visit_groups_merge.constprop.0.isra.0+0x10/0x10
> > [   39.923688]  ? sched_clock_noinstr+0x12/0x20
> > [   39.923724]  ? __sanitizer_cov_trace_const_cmp1+0x1e/0x30
> > [   39.923766]  ctx_sched_in+0x471/0xa20
> > [   39.923804]  ? __pfx_ctx_sched_in+0x10/0x10
> > [   39.923838]  ? __sanitizer_cov_trace_const_cmp4+0x1a/0x20
> > [   39.923878]  perf_event_sched_in+0x47/0xa0
> > [   39.923912]  __perf_event_task_sched_in+0x3fc/0xbc0
> > [   39.923951]  ? __pfx___perf_event_task_sched_in+0x10/0x10
> > [   39.923984]  ? __this_cpu_preempt_check+0x21/0x30
> > [   39.924012]  ? __sanitizer_cov_trace_cmp8+0x1c/0x30
> > [   39.924046]  ? xfd_validate_state+0x14f/0x1b0
> > [   39.924081]  finish_task_switch.isra.0+0x525/0x990
> > [   39.924117]  ? lock_unpin_lock+0xdc/0x170
> > [   39.924152]  __schedule+0xef3/0x3840
> > [   39.924185]  ? __pfx___schedule+0x10/0x10
> > [   39.924218]  ? ktime_get_coarse_real_ts64+0xad/0xf0
> > [   39.924259]  schedule+0xf6/0x3d0
> > [   39.924285]  exit_to_user_mode_loop+0x7a/0x110
> > [   39.924315]  do_syscall_64+0x284/0x2e0
> > [   39.924340]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> > [   39.924360] RIP: 0033:0x7ff14103ee5d
> > [   39.924381] Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 8
> > [   39.924400] RSP: 002b:00007fffb2745578 EFLAGS: 00000202 ORIG_RAX: 0000000000000038
> > [   39.924418] RAX: 0000000000000346 RBX: 0000000000000000 RCX: 00007ff14103ee5d
> > [   39.924431] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000082000
> > [   39.924443] RBP: 00007fffb27455c0 R08: 0000000000000000 R09: 0000000000000000
> > [   39.924456] R10: 0000000000000000 R11: 0000000000000202 R12: 00007fffb27459a8
> > [   39.924468] R13: 0000000000404e78 R14: 0000000000406e08 R15: 00007ff141389000
> > [   39.924497]  </TASK>
> > [   40.307815] coredump: 804(repro): over core_pipe_limit, skipping core dump
> > [   40.472093] coredump: 795(repro): over core_pipe_limit, skipping core dump
> > [   40.545575] coredump: 799(repro): over core_pipe_limit, skipping core dump
> > [   40.948915] coredump: 833(repro): over core_pipe_limit, skipping core dump
> > [   40.989336] coredump: 811(repro): over core_pipe_limit, skipping core dump
> > [   42.121469] coredump: 857(repro): over core_pipe_limit, skipping core dump
> > "
> > 
> > Hope this cound be insightful to you.
> > 
> > Regards,
> > Yi Lai
> > 
> > ---
> > 
> > If you don't need the following environment to reproduce the problem or if you
> > already have one reproduced environment, please ignore the following information.
> > 
> > How to reproduce:
> > git clone https://gitlab.com/xupengfe/repro_vm_env.git
> > cd repro_vm_env
> > tar -xvf repro_vm_env.tar.gz
> > cd repro_vm_env; ./start3.sh  // it needs qemu-system-x86_64 and I used v7.1.0
> >   // start3.sh will load bzImage_2241ab53cbb5cdb08a6b2d4688feb13971058f65 v6.2-rc5 kernel
> >   // You could change the bzImage_xxx as you want
> >   // Maybe you need to remove line "-drive if=pflash,format=raw,readonly=on,file=./OVMF_CODE.fd \" for different qemu version
> > You could use below command to log in, there is no password for root.
> > ssh -p 10023 root@localhost
> > 
> > After login vm(virtual machine) successfully, you could transfer reproduced
> > binary to the vm by below way, and reproduce the problem in vm:
> > gcc -pthread -o repro repro.c
> > scp -P 10023 repro root@localhost:/root/
> > 
> > Get the bzImage for target kernel:
> > Please use target kconfig and copy it to kernel_src/.config
> > make olddefconfig
> > make -jx bzImage           //x should equal or less than cpu num your pc has
> > 
> > Fill the bzImage file into above start3.sh to load the target kernel in vm.
> > 
> > 
> > Tips:
> > If you already have qemu-system-x86_64, please ignore below info.
> > If you want to install qemu v7.1.0 version:
> > git clone https://github.com/qemu/qemu.git
> > cd qemu
> > git checkout -f v7.1.0
> > mkdir build
> > cd build
> > yum install -y ninja-build.x86_64
> > yum -y install libslirp-devel.x86_64
> > ../configure --target-list=x86_64-softmmu --enable-kvm --enable-vnc --enable-gtk --enable-sdl --enable-usb-redir --enable-slirp
> > make
> > make install 
> 
> Thanks for the detailed instruction.  I was able to reproduce it with
> your setup.  The below patch fixes it for me.  Can you please double
> check if it works well for you?
> 
> Thanks,
> Namhyung
>

After applying following patch on top of latest linux-next, issue
cannot be reproduced.

Regards,
Yi Lai

> ---8---
> 
> diff --git a/kernel/events/core.c b/kernel/events/core.c
> index f34c99f8ce8f446a..e22eb88eb105b95b 100644
> --- a/kernel/events/core.c
> +++ b/kernel/events/core.c
> @@ -3995,7 +3995,8 @@ static int merge_sched_in(struct perf_event *event, void *data)
>  			if (*perf_event_fasync(event))
>  				event->pending_kill = POLL_ERR;
>  
> -			perf_event_wakeup(event);
> +			event->pending_wakeup = 1;
> +			irq_work_queue(&event->pending_irq);
>  		} else {
>  			struct perf_cpu_pmu_context *cpc = this_cpc(event->pmu_ctx->pmu);
>  
> -- 
> 2.49.0.1204.g71687c7c1d-goog
> 
