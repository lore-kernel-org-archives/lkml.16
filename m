Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com [209.85.167.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEBD4231855
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 09:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749722243; cv=none; b=AJqTrjsxvXAf+JACvtxqkN0MmWUtNkqpQxbEOjoYp2UD/rbBNjA0z++RRO0LoYZ6lftpW1q0Irjh2DDzmbmZal6IHUOXe7YM9obGzB0WBtWRJ6LsbDKzWm7JJvVu9HGMxewahNUSARIpsWtTcDd/MLRCiDOu1mADmclScuP+rZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749722243; c=relaxed/simple;
	bh=mjMbfgITk2Hkrvt+/q4PsGJdu+bzWTcxSHjfX9ibzcM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MOojD1/Zs/8bMWAC3pkjeufhzTaa3GfLxeXUgUtgRfBMbmZ4shyg87a8mfCpV33lMn+cSJltjV6ChAindee7Nt6JmXa0nNCCMuj0lnCSaODhch5SPEaa01YvZHSDyyErMjlqP/Hlg0DjhVzc0qOarzhPH8+ccqVYP2MdKs3dYfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kwcNEQ46; arc=none smtp.client-ip=209.85.167.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kwcNEQ46"
Received: by mail-lf1-f65.google.com with SMTP id 2adb3069b0e04-5535652f42cso713015e87.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 02:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749722240; x=1750327040; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OSRM9k/RQWSVRwD76HjqRWEnCmz1Hd7ZuhdVaT//i8Y=;
        b=kwcNEQ46jmAs3TiP1tfv1S+JyogWHL0WQFUvV49bqW6OjHjfffYDo1GAGE5J0eHNtA
         dX0O7JGeJ0Kc4/dAfhdgxL8pZibTSA3e2/nm6JQB+soYEM3b50mEgYTYaYdOLqTfiCPL
         v3g+nPUPXjEg7YQH5K0vP8CLbm1aRJ73TwMPWARJOBxOP3I1GKt66owAEb8hSfJvrOMF
         Sc53G3eyS3xqInINBXLIMQUv5HxFW9jZR0VFr3mr8KC8M4eNUOJk31CyQHHhYqN6w3On
         aJHkgsWQELwTYuLqAm50tdc6l0KKSEiw5DePliCW8JeCzX0UV0wCJ2FFTXXcQZSrElSs
         j1gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749722240; x=1750327040;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OSRM9k/RQWSVRwD76HjqRWEnCmz1Hd7ZuhdVaT//i8Y=;
        b=gLYsRDoKYodSPIgqUtU1m9bh9fBfe9cShxEcaaPmaJ5Yez5ueJIUry1oS9Aj9+0ZIA
         DbShA6nW5JizLXCQgTrH4ghOagz9HU2BwVhO/ItCB+D5q+wHW0oB+L0at+eNv4+0MksU
         mfuAmhvmP3h9oIemJWQkL55VPHoHGoWJlu7ul3jrD91K0vGgnIxVEAeITb+Uxiw4j93m
         IZc+Ch/J+M6MIk6KqhOG+0mc3Uq8072D3NsShV9SbKcWCIllAtWTW0HIsi2oieJ8Woq3
         H+SbP04lLe7m6WQyYCuQPh5longPDTklFmNuGYYUU4PjP3XpQe2gqgIDVM948mxVjylv
         lDJA==
X-Forwarded-Encrypted: i=1; AJvYcCVTgPM6woW3H6/G2OzSGhqtcKV6qnZXoKxdOKNPmhJJ88Zp+GjMSAFtiUoH8Ci36tK5zfK/OfZsiZplw7w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1T5rARIyKvalbi/q65c4ioxjkcRa0NOqs2yazFkgG64VsAmtg
	2G1GPGMsmb/IF2eqqlLF5eX2/tzLiOIrWHRHoKbIh0MS33AsQyPEsOXJSCbCy2LPvhDrV1Dxf4W
	6UdwJpg+FnOVBaLBP6QMe+SbHvlfNZqeBr8httWSCFg==
X-Gm-Gg: ASbGncu+Qd2uSExvOkpPA9kdYlvndzKf9xh0Rd/nBzsNH0n7SUP96ppZNucjQpW9MH1
	NLKDbQWX07EjRBDNZnZKBj6umSf0lf59YkIoWsHGVIA1AbVvED3tj4AVYPYMS2YxXvXt+25hb90
	QYo6rakYR43bKe6SFEGVHwWfbLJGVSDH3don68+lPPt33r
X-Google-Smtp-Source: AGHT+IHDpQGsT60zVb8sUGzbq4KO1DcNZUxLsEHMr/v9GHtiTAissHONrSbIbh2/G1iA/rwEK5KDCxosAvl8nj/Nbes=
X-Received: by 2002:a05:6512:3b0d:b0:553:a339:2c37 with SMTP id
 2adb3069b0e04-553a3392fd3mr1124176e87.56.1749722239363; Thu, 12 Jun 2025
 02:57:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407134712.93062-1-hupu.gm@gmail.com> <CANDhNCosvML9XKH8HV1QBXKzxt3zMWxzsPSUfYxoyPCORf6Krw@mail.gmail.com>
 <CADHxFxS+qpmD8r1uxru+VWLj=K616=jLKbBgUR3Ed7ZBY1gidg@mail.gmail.com>
 <CANDhNCqgCGtWubkuMpn=GdfLwP6d5kMEvbhoQL4oef5yf_74ug@mail.gmail.com>
 <CANDhNCqv0iFMJanxj4uTyOHGUGxfCqb18Ku+w5y9JFKRm0M=Rg@mail.gmail.com>
 <CADHxFxQoNOBCOMDsh0iNrdD=ke=YweVZgZrTWbBQRA8SYy9McA@mail.gmail.com>
 <CADHxFxRd66FB6=wgY2-NLxqiMGZui+um+h2LUe4+hwXabdUpVg@mail.gmail.com>
 <CANDhNCq+xE4dpecHio2x6TJXMXxhQjrDk1oCon=NR2b+k0Y9yQ@mail.gmail.com>
 <CADHxFxSVdt_oG=J=aJDfkOcYEBScUxKV=NZNUvgtkAj6sbWvGA@mail.gmail.com>
 <CADHxFxQ8GqndiKGT2z2aUFU5qQQSU1QxQR1CrHsaa8ShrJ6D+Q@mail.gmail.com>
 <CADHxFxRN5yPwk6jVcnz9dpsZaFk8=91Jto9euBiOnrYzqncfdQ@mail.gmail.com>
 <CANDhNCoLYSFfry3bKhdC+YC1JYhtcgDpGLHTt-5v_4yDtR9QQw@mail.gmail.com> <CADHxFxSiHJANrsXaOiSoUoBh8Z5Btrc4dRGHJwzLj4ebvy6ktg@mail.gmail.com>
In-Reply-To: <CADHxFxSiHJANrsXaOiSoUoBh8Z5Btrc4dRGHJwzLj4ebvy6ktg@mail.gmail.com>
From: hupu <hupu.gm@gmail.com>
Date: Thu, 12 Jun 2025 17:57:07 +0800
X-Gm-Features: AX0GCFsckPRtI8DFoiqf9a2cEts_mAfppzhpELPnrnLM2Nw8xiBumDEw2r-Y_F4
Message-ID: <CADHxFxR0viFcaDOQAp=7cUhGOoRj_0eTd5trczwygxUu4Dw0gQ@mail.gmail.com>
Subject: Re: [RFC 1/1] sched: Skip redundant operations for proxy tasks
 needing return migration
To: John Stultz <jstultz@google.com>
Cc: peterz@infradead.org, linux-kernel@vger.kernel.org, juri.lelli@redhat.com, 
	vschneid@redhat.com, mingo@redhat.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, hupu@transsion.com, Suleiman Souhlal <suleiman@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi John

> Unfortunately I've also been tripping over a crash with the full
> series (not the portion I'm currently submitting upstream) that often
> takes 30+ hours to reproduce and extra debugging logic seems to make
> it even harder to hit.
>

I encountered a strange crash while running the code from the
proxy-exec-v17-WIP branch for over 150+ hours. I'm currently unsure if
this issue is the same as the one you mentioned.

Here is the dmesg log at the time of the crash:

[550195.352234][    C2] watchdog: BUG: soft lockup - CPU#2 stuck for
32s! [lock_torture_wr:139]
[550195.374670][    C2] Modules linked in:
[550195.375936][    C2] irq event stamp: 189580674
[550195.376275][    C2] hardirqs last  enabled at (189580673):
[<ffff8000813b7840>] exit_to_kernel_mode.isra.6+0xf8/0x130
[550195.393675][    C2] hardirqs last disabled at (189580674):
[<ffff8000813b78a4>] el1_interrupt+0x2c/0x70
[550195.393779][    C2] softirqs last  enabled at (189580644):
[<ffff80008005f7dc>] handle_softirqs+0x4b4/0x4cc
[550195.396778][    C2] softirqs last disabled at (189580639):
[<ffff800080010654>] __do_softirq+0x18/0x20
[550195.406109][    C2] CPU: 2 UID: 0 PID: 139 Comm: lock_torture_wr
Not tainted 6.12.0-00050-gf6c6e0ea8a1d-dirty #133
[550195.406661][    C2] Hardware name: linux,dummy-virt (DT)
[550195.407172][    C2] pstate: 80000005 (Nzcv daif -PAN -UAO -TCO
-DIT -SSBS BTYPE=--)
[550195.407396][    C2] pc : queued_spin_lock_slowpath+0x270/0x528
[550195.408270][    C2] lr : queued_spin_lock_slowpath+0x3a8/0x528
[550195.408358][    C2] sp : ffff800084d83d20
[550195.408494][    C2] x29: ffff800084d83d20 x28: 28f5c28f5c28f5c3
x27: 0000000000000000
[550195.408985][    C2] x26: ffff800081ef3000 x25: 0000000000000000
x24: 0000000000000002
[550195.409158][    C2] x23: ffff800083532000 x22: ffff800082b55000
x21: ffff00002c286740
[550195.409322][    C2] x20: ffff800081ef3000 x19: ffff80008355b348
x18: ffff800081ce6e48
[550195.409522][    C2] x17: ffff7fffa954e000 x16: 000000006c0014e7
x15: ffff8000835321f0
[550195.409681][    C2] x14: 0001f45e95248cf0 x13: 0000000000000100
x12: 0000000000000000
[550195.409875][    C2] x11: 00000000002dc6c0 x10: 0000000000000000 x9
: ffff7fffa9731000
[550195.410102][    C2] x8 : ffff800081ef3fb8 x7 : 0000000000000000 x6
: 00000000000c0000
[550195.410262][    C2] x5 : ffff8000835365e8 x4 : 0000000000000000 x3
: 0000000000000000
[550195.410451][    C2] x2 : 0000000000000000 x1 : ffff00002c286740 x0
: ffff00002c286748
[550195.410849][    C2] Call trace:
[550195.410995][    C2]  queued_spin_lock_slowpath+0x270/0x528
[550195.411265][    C2]  do_raw_spin_lock+0xac/0x11c
[550195.421183][    C2]  _raw_spin_lock+0x74/0x90
[550195.421264][    C2]  torture_spin_lock_write_lock+0x1c/0x28
[550195.421333][    C2]  lock_torture_writer+0x104/0x2f4
[550195.421397][    C2]  kthread+0x128/0x134
[550195.421600][    C2]  ret_from_fork+0x10/0x20
[550195.422007][    C1] watchdog: BUG: soft lockup - CPU#1 stuck for
32s! [lock_torture_wr:144]
[550195.422780][    C2] Kernel panic - not syncing: softlockup: hung tasks
[550195.423616][    C2] CPU: 2 UID: 0 PID: 139 Comm: lock_torture_wr
Tainted: G             L     6.12.0-00050-gf6c6e0ea8a1d-dirty #133
[550195.423813][    C2] Tainted: [L]=SOFTLOCKUP
[550195.423929][    C2] Hardware name: linux,dummy-virt (DT)
[550195.424123][    C2] Call trace:
[550195.424174][    C2]  dump_backtrace.part.8+0x8c/0xe8
[550195.424232][    C2]  show_stack+0x2c/0x38
[550195.424256][    C2]  dump_stack_lvl+0x6c/0xcc
[550195.424999][    C2]  dump_stack+0x14/0x1c
[550195.425050][    C2]  panic+0x150/0x428
[550195.425121][    C2]  watchdog_timer_fn+0x258/0x2e8
[550195.426192][    C2]  __hrtimer_run_queues+0x3bc/0x4a0
[550195.426651][    C2]  hrtimer_interrupt+0xd8/0x248
[550195.426680][    C2]  arch_timer_handler_virt+0x38/0x58
[550195.427608][    C2]  handle_percpu_devid_irq+0xac/0x2cc
[550195.427676][    C2]  generic_handle_domain_irq+0x40/0x58
[550195.427743][    C2]  gic_handle_irq+0x64/0x124
[550195.427771][    C2]  call_on_irq_stack+0x24/0x34
[550195.427832][    C2]  do_interrupt_handler+0x90/0x94
[550195.427865][    C2]  el1_interrupt+0x3c/0x70
[550195.427899][    C2]  el1h_64_irq_handler+0x14/0x1c
[550195.427960][    C2]  el1h_64_irq+0x64/0x68
[550195.427989][    C2]  queued_spin_lock_slowpath+0x270/0x528
[550195.428021][    C2]  do_raw_spin_lock+0xac/0x11c
[550195.428051][    C2]  _raw_spin_lock+0x74/0x90
[550195.428082][    C2]  torture_spin_lock_write_lock+0x1c/0x28
[550195.428115][    C2]  lock_torture_writer+0x104/0x2f4
[550195.428147][    C2]  kthread+0x128/0x134
[550195.428182][    C2]  ret_from_fork+0x10/0x20
[550195.428564][    C2] SMP: stopping secondary CPUs
[550195.448256][    C2] Kernel Offset: disabled
[550195.450640][    C2] CPU features: 0x00,00000019,40203020,560042af
[550195.451534][    C2] Memory Limit: none
[550195.452853][    C2] ---[ end Kernel panic - not syncing:
softlockup: hung tasks ]---


At the time of the crash, all CPU call stacks were identical. From the
call stack at level #15, it is evident that all threads are waiting
for the `torture_spinlock` lock in kernel/locking/locktorture.c.

-000|cpu_park_loop(inline)
-000|local_cpu_stop(cpu = 0)
-001|panic_smp_self_stop()
-002|panic(:fmt = 0xFFFF800081CFC838)
-003|watchdog_timer_fn(:hrtimer = 0xFFFF00002BEAEE20)
-004|__run_hrtimer(inline)
-004|__hrtimer_run_queues(:cpu_base = 0xFFFF00002BEAE0C0, :now =
550186225371571, :flags = 192, :active_mask = 15)
-005|hrtimer_interrupt(:dev = 0xFFFF00002BEC4A80)
-006|timer_handler(inline)
-006|arch_timer_handler_virt(:irq = 11, dev_id = 0xFFFF00002BEC4A80)
-007|handle_percpu_devid_irq(desc = 0xFFFF000004C2C400)
-008|generic_handle_irq_desc(inline)
-008|handle_irq_desc(inline)
-008|generic_handle_domain_irq(domain = 0xFFFF000004E50000, :hwirq = 27)
-009|__gic_handle_irq(inline)
-009|__gic_handle_irq_from_irqson(inline)
-009|gic_handle_irq(regs = ?)
-010|call_on_irq_stack(asm)
-011|do_interrupt_handler(:regs = 0xFFFF800084D4BBD0, :handler =
0xFFFF80008001020C)
-012|__el1_irq(inline)
-012|el1_interrupt(regs = 0xFFFF800084D4BBD0, handler = 0xFFFF80008001020C)
-013|el1h_64_irq_handler(regs = ?)
-014|el1h_64_irq(asm)
-015|trace_contention_begin(inline)
-015|queued_spin_lock_slowpath(:lock = 0xFFFF80008355B348, val = ?)
-016|queued_spin_lock(inline)
-016|do_raw_spin_lock(:lock = 0xFFFF80008355B348)
-017|__raw_spin_lock(inline)
-017|_raw_spin_lock(:lock = 0xFFFF80008355B348)
-018|spin_lock(inline)
-018|torture_spin_lock_write_lock(:tid = 0)
-019|lock_torture_writer(:arg = 0xFFFF0000060A4800)
-020|kthread(_create = 0xFFFF000006074500)
-021|ret_from_fork(asm)
-022|NSX:0x0::0xFFFFFFFFFF5F8000(asm)
 ---|end of frame

crash_arm64> sym torture_spinlock
ffff80008355b348 (d) torture_spinlock
crash_arm64>


However, based on the crash site, it appears that no thread is
currently holding the `torture_spinlock` lock, yet other threads on
different CPUs are still waiting for this lock, which is confusing to
me.

crash_arm64> struct -x  raw_spinlock 0xFFFF80008355B348
struct raw_spinlock {
  raw_lock = {
    {
      val = {
        counter = 0x180000
      },
      {
        locked = 0x0,
        pending = 0x0
      },
      {
        locked_pending = 0x0,
        tail = 0x18
      }
    }
  },
  magic = 0xdead4ead,
  owner_cpu = 0xffffffff,
  owner = 0xffffffffffffffff,
  dep_map = {
    key = 0xffff80008355b360 <torture_spinlock+24>,
    class_cache = {0xffff8000841d9e58 <lock_classes+127248>, 0x0},
    name = 0xffff800081cebe90 "torture_spinlock",
    wait_type_outer = 0x0,
    wait_type_inner = 0x3,
    lock_type = 0x0,
    cpu = 0x5,
    ip = 0xffff8000800f30b8
  }
}
crash_arm64>

Although I haven't yet pinpointed the root cause of this issue, I
would like to confirm whether the problem I'm encountering is the same
as the one you described.

If possible, could you share the dmesg log and call stack information
of the crash you encountered?

Thanks.
hupu
