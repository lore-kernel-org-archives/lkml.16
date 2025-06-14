Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467953FD1
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 05:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749878430; cv=none; b=UqNuAeqtIzdq5wfj8P9DVyv4H7tJ+EN4HgABUb0ZAHgdnGWqyNeIzIyvw7R3DDYQ3hTaq/C/q7Kvft7behXMNy0xWzl/GPrk3OfVgoFVmZGebCbhJY9ItrvuHc7rXG2PnNwaQoJUVAUXFlL/ts5m71B1/2LRdRGA9bgPmBHdo1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749878430; c=relaxed/simple;
	bh=8b4fVqdeojgxTtPaLu/JoL5Zc6uRyOcg2EASwv6KvFQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rhN1d+6geCzL05hrjtUEFuzl2ndazparFWtWziKimM9KsUn5i6o1FNXY66IWqh5dL3+kSNIPYLsnfRQvi//rzMb49E3RkbdyUauK0TLijy1qbKjypYG8Xx1+7y3yZeoqV0K63vwDywwA/T7DL+y5J3tj3E+VGIQl+7xshD9KgSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BlrsD305; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BlrsD305"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-55394ee39dfso2795631e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 22:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749878426; x=1750483226; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TN7Y5MkvxEKZcoUJj3ZzBGXVc2gaTPuhSandGHzkpYg=;
        b=BlrsD3053aX5W3SgcJVxF1HR5e079iTM6hRWNSGEE7x4XEG2Hvk9OGfq3xf3UfiKYy
         NbiMyZj6LVgPDt5tqiVDtMZRY2ktMVXxvWNZp8qU27AxbA69JyBVzxh6HGYSwGS4rKVg
         wMIwWNWEJNWWKsX/ox4UOavZr/B8fqTCxUKWlNEZxUu7v+DAYp4UZRPW9jm7cBiXuK1j
         RUUbZKUaiFugoE4doZohUi9htfUiSh1iguwVntj1YZt+O9pfB1THUeWR5nCd6/nqd0Xo
         k7bRzTPT9v2Kq8skZXH9E+vSz0KFVuvXsMB/fD0E4t2afuUOXx14dzEkZTV9vUA8/7av
         o0NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749878426; x=1750483226;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TN7Y5MkvxEKZcoUJj3ZzBGXVc2gaTPuhSandGHzkpYg=;
        b=lfGU+UmmizsWryOhpZEMva2bNNQqW/sRE6XxT4DWKpaTR/FHxL4f7ZGSrES2c1D8YE
         yQBcz0XrkfbZdp9+bVESXqYD8t09XDtIihCRdQoxN4T9nR4X6bsSVYdgvipciP/Craoc
         ibN/O1aNf2PnBAvzwSUOI8fxEDVTH2MQdDxy9q9OQCEhNVFPM9x/ha8SFrmVD8gwp7oE
         kgPE6gVc3N9VmDW9DPMcDvSlO2G/CHIOusJdfzKQ+s1BJZtY43bEEpc6BNRjDGN8bHMz
         7burRbigr6dskz9YNKMrgxcJZs2SAJnfc5kPqMOl76cibaU3Hp9CsA0W79qbv78+GaT/
         qRsg==
X-Forwarded-Encrypted: i=1; AJvYcCUfzzEMfNroiEnWqZtv19iqbJJ3ZtlJSj4GIXykGuS+kLa9aj8Oua6RsFjE4PV/KMYhN1iA+d5srTMQ7vI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaI/9MXA1tiZCVicE/AMl0Lu2+Az+xHBH+S9zWGbYG2YUq4HOO
	GDGRNjqdM9cMw3R9CjNvRpLA5qAmegWSsAfz1pqk7ZWzz5I3JakMUlBMRoETcIBUpQ1M2z3THId
	gGAaa+7wnyFeoK+U8KA/Nz6BlUfxwupAbEKtQwNo=
X-Gm-Gg: ASbGnctYKwRPPOnWV4lnijSdr9ieo6eV2WhqiYBMvfNosE1IBa/oDzrDD0Nljz1pLXY
	hy8z+LaL7kP9lcsfUV2PZgaVOl9VWl+PsBzc+YDkvZNZ0ys4oZweppbnp8e1wOxQUXdEFPoyRwv
	4Dpxwt+Fa4yRsl2jRza3tqUt0I735VE5NnBk0OWS1AP8oo9kR8K6zBNFpowPS2L59mqr9gAE8=
X-Google-Smtp-Source: AGHT+IHOhP1UKJHpqVzkLkicSuh8g0GONlVDSJ/VhjgjlUvEGVYWsjQQ/dQCtXTPcwtnJvINO9jYEphl49YvUIz1EKc=
X-Received: by 2002:a05:6512:b26:b0:549:8ff1:e0f3 with SMTP id
 2adb3069b0e04-553b68000d8mr537137e87.5.1749878426008; Fri, 13 Jun 2025
 22:20:26 -0700 (PDT)
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
 <CANDhNCoLYSFfry3bKhdC+YC1JYhtcgDpGLHTt-5v_4yDtR9QQw@mail.gmail.com>
 <CADHxFxSiHJANrsXaOiSoUoBh8Z5Btrc4dRGHJwzLj4ebvy6ktg@mail.gmail.com> <CADHxFxR0viFcaDOQAp=7cUhGOoRj_0eTd5trczwygxUu4Dw0gQ@mail.gmail.com>
In-Reply-To: <CADHxFxR0viFcaDOQAp=7cUhGOoRj_0eTd5trczwygxUu4Dw0gQ@mail.gmail.com>
From: John Stultz <jstultz@google.com>
Date: Fri, 13 Jun 2025 22:20:13 -0700
X-Gm-Features: AX0GCFsw7K_u_hOlbM0L_lkG3ubfF6mnYuH1R8EfhIWkff0wgaGumZdKGTVPrFI
Message-ID: <CANDhNCrtdH-McjbMYkXHNDbB4S=ePREM=Jz6ciOkzjMerND+Vg@mail.gmail.com>
Subject: Re: [RFC 1/1] sched: Skip redundant operations for proxy tasks
 needing return migration
To: hupu <hupu.gm@gmail.com>
Cc: peterz@infradead.org, linux-kernel@vger.kernel.org, juri.lelli@redhat.com, 
	vschneid@redhat.com, mingo@redhat.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, hupu@transsion.com, Suleiman Souhlal <suleiman@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025 at 2:57=E2=80=AFAM hupu <hupu.gm@gmail.com> wrote:
>
> Hi John
>
> > Unfortunately I've also been tripping over a crash with the full
> > series (not the portion I'm currently submitting upstream) that often
> > takes 30+ hours to reproduce and extra debugging logic seems to make
> > it even harder to hit.
> >
>
> I encountered a strange crash while running the code from the
> proxy-exec-v17-WIP branch for over 150+ hours. I'm currently unsure if
> this issue is the same as the one you mentioned.
>
> Here is the dmesg log at the time of the crash:
>
> [550195.352234][    C2] watchdog: BUG: soft lockup - CPU#2 stuck for
> 32s! [lock_torture_wr:139]
> [550195.374670][    C2] Modules linked in:
> [550195.375936][    C2] irq event stamp: 189580674
> [550195.376275][    C2] hardirqs last  enabled at (189580673):
> [<ffff8000813b7840>] exit_to_kernel_mode.isra.6+0xf8/0x130
> [550195.393675][    C2] hardirqs last disabled at (189580674):
> [<ffff8000813b78a4>] el1_interrupt+0x2c/0x70
> [550195.393779][    C2] softirqs last  enabled at (189580644):
> [<ffff80008005f7dc>] handle_softirqs+0x4b4/0x4cc
> [550195.396778][    C2] softirqs last disabled at (189580639):
> [<ffff800080010654>] __do_softirq+0x18/0x20
> [550195.406109][    C2] CPU: 2 UID: 0 PID: 139 Comm: lock_torture_wr
> Not tainted 6.12.0-00050-gf6c6e0ea8a1d-dirty #133
> [550195.406661][    C2] Hardware name: linux,dummy-virt (DT)
> [550195.407172][    C2] pstate: 80000005 (Nzcv daif -PAN -UAO -TCO
> -DIT -SSBS BTYPE=3D--)
> [550195.407396][    C2] pc : queued_spin_lock_slowpath+0x270/0x528
> [550195.408270][    C2] lr : queued_spin_lock_slowpath+0x3a8/0x528
> [550195.408358][    C2] sp : ffff800084d83d20
> [550195.408494][    C2] x29: ffff800084d83d20 x28: 28f5c28f5c28f5c3
> x27: 0000000000000000
> [550195.408985][    C2] x26: ffff800081ef3000 x25: 0000000000000000
> x24: 0000000000000002
> [550195.409158][    C2] x23: ffff800083532000 x22: ffff800082b55000
> x21: ffff00002c286740
> [550195.409322][    C2] x20: ffff800081ef3000 x19: ffff80008355b348
> x18: ffff800081ce6e48
> [550195.409522][    C2] x17: ffff7fffa954e000 x16: 000000006c0014e7
> x15: ffff8000835321f0
> [550195.409681][    C2] x14: 0001f45e95248cf0 x13: 0000000000000100
> x12: 0000000000000000
> [550195.409875][    C2] x11: 00000000002dc6c0 x10: 0000000000000000 x9
> : ffff7fffa9731000
> [550195.410102][    C2] x8 : ffff800081ef3fb8 x7 : 0000000000000000 x6
> : 00000000000c0000
> [550195.410262][    C2] x5 : ffff8000835365e8 x4 : 0000000000000000 x3
> : 0000000000000000
> [550195.410451][    C2] x2 : 0000000000000000 x1 : ffff00002c286740 x0
> : ffff00002c286748
> [550195.410849][    C2] Call trace:
> [550195.410995][    C2]  queued_spin_lock_slowpath+0x270/0x528
> [550195.411265][    C2]  do_raw_spin_lock+0xac/0x11c
> [550195.421183][    C2]  _raw_spin_lock+0x74/0x90
> [550195.421264][    C2]  torture_spin_lock_write_lock+0x1c/0x28
> [550195.421333][    C2]  lock_torture_writer+0x104/0x2f4
> [550195.421397][    C2]  kthread+0x128/0x134
> [550195.421600][    C2]  ret_from_fork+0x10/0x20
> [550195.422007][    C1] watchdog: BUG: soft lockup - CPU#1 stuck for
> 32s! [lock_torture_wr:144]
> [550195.422780][    C2] Kernel panic - not syncing: softlockup: hung task=
s
> [550195.423616][    C2] CPU: 2 UID: 0 PID: 139 Comm: lock_torture_wr
> Tainted: G             L     6.12.0-00050-gf6c6e0ea8a1d-dirty #133
> [550195.423813][    C2] Tainted: [L]=3DSOFTLOCKUP
> [550195.423929][    C2] Hardware name: linux,dummy-virt (DT)
> [550195.424123][    C2] Call trace:
> [550195.424174][    C2]  dump_backtrace.part.8+0x8c/0xe8
> [550195.424232][    C2]  show_stack+0x2c/0x38
> [550195.424256][    C2]  dump_stack_lvl+0x6c/0xcc
> [550195.424999][    C2]  dump_stack+0x14/0x1c
> [550195.425050][    C2]  panic+0x150/0x428
> [550195.425121][    C2]  watchdog_timer_fn+0x258/0x2e8
> [550195.426192][    C2]  __hrtimer_run_queues+0x3bc/0x4a0
> [550195.426651][    C2]  hrtimer_interrupt+0xd8/0x248
> [550195.426680][    C2]  arch_timer_handler_virt+0x38/0x58
> [550195.427608][    C2]  handle_percpu_devid_irq+0xac/0x2cc
> [550195.427676][    C2]  generic_handle_domain_irq+0x40/0x58
> [550195.427743][    C2]  gic_handle_irq+0x64/0x124
> [550195.427771][    C2]  call_on_irq_stack+0x24/0x34
> [550195.427832][    C2]  do_interrupt_handler+0x90/0x94
> [550195.427865][    C2]  el1_interrupt+0x3c/0x70
> [550195.427899][    C2]  el1h_64_irq_handler+0x14/0x1c
> [550195.427960][    C2]  el1h_64_irq+0x64/0x68
> [550195.427989][    C2]  queued_spin_lock_slowpath+0x270/0x528
> [550195.428021][    C2]  do_raw_spin_lock+0xac/0x11c
> [550195.428051][    C2]  _raw_spin_lock+0x74/0x90
> [550195.428082][    C2]  torture_spin_lock_write_lock+0x1c/0x28
> [550195.428115][    C2]  lock_torture_writer+0x104/0x2f4
> [550195.428147][    C2]  kthread+0x128/0x134
> [550195.428182][    C2]  ret_from_fork+0x10/0x20
> [550195.428564][    C2] SMP: stopping secondary CPUs
> [550195.448256][    C2] Kernel Offset: disabled
> [550195.450640][    C2] CPU features: 0x00,00000019,40203020,560042af
> [550195.451534][    C2] Memory Limit: none
> [550195.452853][    C2] ---[ end Kernel panic - not syncing:
> softlockup: hung tasks ]---
>

So, while I'm not sure if this is the same issue, I have found fixes
for a few issues (but unfortunately not all) I was hitting with v17.

Not exactly what your seeing, but  I was seeing some issues where due
to a spurious wakeup we would end up with an owner that was woken but
was still in the BO_WAKING state and hadn't been return migrated. This
could cause us to get stuck looping in and out of find_proxy_task(),
which could cause tasks to lock up in a similar fashion.  So I've
re-added the return migration for that case and it seems to be
resolved.

I've not seen a case where a spinlock was unowned but everyone was
spinning on it (particularly because my patch series doesn't really
mess with spinlocks, assuming the runnable/spinning tasks get
scheduled to run). The owner being stuck and not letting the lock go
seems more likely, so that's curious.

I've got my current WIP set here:
  https://github.com/johnstultz-work/linux-dev/commits/proxy-exec-WIP/
(Still need to write proper commit messages for many of the new changes)

The problem I see right now, which can sometimes take 30+ hours to
trip on an 64core qemu system running cyclictest, my
prio-inversion-demo test, and running the in-kernel test_ww_mutex
tests in loops.

The backtrace will look something like:
[18071.849807] ------------[ cut here ]------------
[18071.849829]
[18071.849830] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
[18071.849831] WARNING: possible circular locking dependency detected
[18071.849832] 6.12.0-00060-g6b88c4fed2ba #1362 Not tainted
[18071.849834] ------------------------------------------------------
[18071.849835] kworker/u256:8/940 is trying to acquire lock:
[18071.849837] ffffffff82ffaf38 ((console_sem).lock){-...}-{2:2}
[18071.849887] BUG: unable to handle page fault for address: 0000004800153a=
d9
[18071.878733] #PF: supervisor read access in kernel mode
[18071.881809] #PF: error_code(0x0000) - not-present page
[18071.884840] PGD 0 P4D 0
[18071.886351] Oops: Oops: 0000 [#1] PREEMPT SMP NOPTI
[18071.889305] CPU: 11 UID: 0 PID: 940 Comm: kworker/u256:8 Not
tainted 6.12.0-00060-g6b88c4fed2ba #1362
[18071.894553] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996),
BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[18071.900009] Workqueue: test-ww_mutex stress_one_work
[18071.902902] RIP: 0010:pick_next_task_fair+0x2c5/0x3f0
[18071.905860] Code: b5 90 00 00 00 45 39 f7 7e 5c 49 8b bc 24 a0 00
00 00 4c 89 e6 e8 4b a3 ff ff 4d 8b a4 24 98 00 00 00 4d 8b bc 24 a0
00 00 00 <49> 8b bd a0 00 00 00 49 39 ff 75 c0 4d 85 ff 74 bb 4c 89 ee
4c 89
[18071.916706] RSP: 0018:ffffc90002877c38 EFLAGS: 00010006
[18071.919729] RAX: ffff888105810000 RBX: ffff88810087a140 RCX: 00000000000=
00000
[18071.923810] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 00000000000=
00000
[18071.927894] RBP: ffff8881b9c6fa00 R08: 0000000000000000 R09: ffff888103f=
bc280
[18071.931983] R10: 0000000000000000 R11: 0000000000000000 R12: ffffffff810=
ec0c0
[18071.936051] R13: 0000004800153a39 R14: 0000000000000000 R15: 00441f0ffa1=
e0ff3
[18071.940143] FS:  0000000000000000(0000) GS:ffff8881b90c0000(0000)
knlGS:0000000000000000
[18071.944776] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[18071.948085] CR2: 0000004800153ad9 CR3: 0000000112512004 CR4: 00000000003=
70ef0
[18071.952210] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 00000000000=
00000
[18071.956277] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 00000000000=
00400
[18071.960375] Call Trace:
[18071.961826]  <TASK>
[18071.963097]  ? __die+0x56/0x92
[18071.964919]  ? page_fault_oops+0xca/0x260
[18071.967246]  ? down_trylock+0x13/0x40
[18071.969400]  ? _printk+0x6c/0x87
[18071.971246]  ? __down_trylock_console_sem+0x23/0x90
[18071.974005]  ? exc_page_fault+0x525/0x8e0
[18071.976276]  ? asm_exc_page_fault+0x26/0x30
[18071.978614]  ? put_prev_entity+0x70/0xb0
[18071.980861]  ? pick_next_task_fair+0x2c5/0x3f0
[18071.983409]  ? pick_next_task_fair+0x309/0x3f0
[18071.985977]  __schedule+0x22f/0x20c0
[18071.988041]  ? lock_release+0x16d/0x2e0
[18071.990248]  schedule+0x3d/0x150
[18071.992197]  schedule_hrtimeout_range_clock+0x110/0x160
[18071.995155]  ? __pfx_hrtimer_wakeup+0x10/0x10
[18071.997679]  ? usleep_range_state+0x59/0xc0
[18072.000063]  usleep_range_state+0x87/0xc0
[18072.002341]  stress_one_work+0x41/0x90
[18072.004465]  process_one_work+0x204/0x5a0
[18072.006793]  ? lock_is_held_type+0xca/0x130
[18072.009195]  worker_thread+0x18e/0x350
[18072.011328]  ? __pfx_worker_thread+0x10/0x10
[18072.013773]  kthread+0xee/0x120
[18072.015593]  ? __pfx_kthread+0x10/0x10
[18072.017805]  ret_from_fork+0x31/0x50
[18072.019803]  ? __pfx_kthread+0x10/0x10
[18072.021948]  ret_from_fork_asm+0x1a/0x30
[18072.024214]  </TASK>

Which is due to tripping the:
  SCHED_WARN_ON(cfs_rq->curr !=3D prev);
check in put_prev_entity().

And then hitting some sort of memory trouble as the lockdep warning is
being printed.

I suspect the issue is that the cfs_rq->curr (which should match the
rq->donor set from the previous pick_next_task()) ends up as a
dangling reference when we migrate or otherwise re-do the pick_again
loop.

Unfortunately as I add more trace_printks to debug the issue, it
becomes even more rare to trip, or the log somehow ends up incomplete
(missing final lines I'd expect given the backtrace in the splat),  so
it has been slow progress. :(

Anyway, let me know if you run into anything similar or have ideas.
I'll be continuing to try to trap the behavior better, running over
this weekend.

thanks
-john
