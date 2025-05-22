Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D01729AB18
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 17:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747935783; cv=none; b=sjaJBOW3HPVbMRlmkVVwzEGPlPomX1k1MEunDVVujsXAZ+DVzQQ9pki2Pektt1EudqmUAdGQ6MAbxNNeIFdOKqGRLuAbV4HbBJhyE2tiFR4zvJK2BIVIEoGC1Z2K2UXAU7UEvESrdzcJSCE0RqbT1zqddC0t2OBlQHdOmg9YK2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747935783; c=relaxed/simple;
	bh=+G5RF5TYv9NilJZWvtevhruXr8VgM/S/1vXVkeCMCA4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XozavxbtvsWXWvWuRd1g4LAVrGIxo7up9BqNX06MAnWN6w9QxOmOjW4EPAboP6K9M0kjz1w92EVLxNbNFZLQs5+H0iL4G5XzzFlutoyiPvGr0szMxbLxQE27FJ3JTP1NIeZeJcwn4WfIoOCAIxt8OcpWqOS0ioGRXN/3KxUlGS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z/hDon7g; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z/hDon7g"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2322bace4ceso46869505ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 10:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747935780; x=1748540580; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oJpkKgTGcEhu6AoROhBbs/z54hgXoLAVO992uSiMEuM=;
        b=Z/hDon7gz/aB27OYZRXibRfM2fCgg263Op6TXVOL/Juv8t9BWh53WfgvxR+8YYefZ6
         sC7xsvw6rcOpFPbRH0RGY3qSI+mLtieNWJ00RpzH/tCcx0XrnoKxAylP/xbdIRUoW31t
         Z/3P8FULSlTP26s5Mkwvcp51QgFIbeeg39whA9kPo/IfoOUIOZ17jknRT7h1QVBBmO6z
         17IoYQZk/GPj7PrzzpHPxYGn32CKItajNbA9ZOd5LG4wqeWpNFect/ep6V2hFlWDmvCY
         XfGr1xBaDadoj4+fqNikTdTfpvdeQXDtG/eu6cTnsVleGo5BoTRzIgYFtdBli+aScyuP
         JKhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747935780; x=1748540580;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oJpkKgTGcEhu6AoROhBbs/z54hgXoLAVO992uSiMEuM=;
        b=Ojsq8fc1+EQ9ZUXgmfmITEJvAaWhngRV5rcIWN5hhA7kNu0FYZYkC3ddOgXB1F5qB+
         CAzCwNqdXB/dYMxD65KtzaqKq6SVE+9VKh7HijbgDVMHr0+UW+/bIB+BnWrq6Tk/W3kh
         vBVHxzAZJo9iva5jU3UB/D6h48pqWel/P75MjBddb6OhHzwZTG1kEJXWBi+mgXjFtBNt
         EbQWmIOrVLZ7IERpoPPpxYl2L6X7Tt4UbRXVtpVKOGSzr9tqyJ1Uer3KF1CgloJZZuPL
         YE1gIvJxYL5Ecia6HQPvAiGqHSY3U+szqXfDHSu3S/adeOXgCCHEVyZLOzuDWw6cnotN
         2QHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUd5WrICxb7jM2e4YTIWpkT1SHgKvEgV6x4LoU8F/feIIMNmduvlcVBYlmAef5HPBELe2s/fEVK/zF9Lds=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQYzQoRslI+myEZqWQGf5dfXlwLAPwv4lqTI6CTC1ymO9rL2iS
	1V/ejXJoYwLZQ5iPGkCNduL5rgBzs1yRm3oxxTKRTeBL8aH7MjiOnOp/gbZCVfJIT8/q+FHIbTA
	Yjxhc0yVKJwQ4sKDlLb3mwkQspJGPMLg=
X-Gm-Gg: ASbGncvrUntjlXm4gmPEFiarSWtgZMMe4C3S70gTynSxuIVzejQX/hXUwrqkiTD0M+Y
	zVmsLj8gEvl9Ufl0v1H/N5+K0N0EGAVGPMBga1Bk7Gva/8aaCSecce49czZc0NVDYDGVOI+TTK2
	384P4PLgb7A4z0JOwLQkMxjIYUBTNmEbkqNsBRrTuEYQ==
X-Google-Smtp-Source: AGHT+IExGK2GQS6k28Di6wIB8U2/W5hEqHaocP4spw41l2+jTSK0PY7wiBvPmpsDz46dE7Z1OvGYGMVqQuepkwRDIMs=
X-Received: by 2002:a17:903:2f0b:b0:224:de2:7fd0 with SMTP id
 d9443c01a7336-231d43c5dddmr347083845ad.25.1747935780365; Thu, 22 May 2025
 10:43:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250410070526.3160847-1-cyrilbur@tenstorrent.com>
 <20250410070526.3160847-2-cyrilbur@tenstorrent.com> <aAgfz69K7wSkKsyJ@debug.ba.rivosinc.com>
 <aCyythZJ2u0SbXVb@debug.ba.rivosinc.com> <b39891f0-1e1a-4559-b35b-5262fe5af93c@codethink.co.uk>
 <aC85d8Hnstck-_gx@debug.ba.rivosinc.com>
In-Reply-To: <aC85d8Hnstck-_gx@debug.ba.rivosinc.com>
From: Andy Chiu <andybnac@gmail.com>
Date: Fri, 23 May 2025 01:42:49 +0800
X-Gm-Features: AX0GCFu64ykEpcKCqjI9gye4daVTehtyatj923IgU3Xv8_N-0XZ1V9b_ZEdVrXs
Message-ID: <CAFTtA3MMx+fAk6DsV5tT9HkeW67zstp-Lrge9kZMW0Z60SVi0A@mail.gmail.com>
Subject: Re: [PATCH v6 1/5] riscv: save the SR_SUM status over switches
To: Deepak Gupta <debug@rivosinc.com>
Cc: Ben Dooks <ben.dooks@codethink.co.uk>, Cyril Bur <cyrilbur@tenstorrent.com>, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, paul.walmsley@sifive.com, 
	charlie@rivosinc.com, jrtc27@jrtc27.com, alex@ghiti.fr, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	jszhang@kernel.org, syzbot+e74b94fe601ab9552d69@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 22, 2025 at 11:09=E2=80=AFPM Deepak Gupta <debug@rivosinc.com> =
wrote:
>
> On Thu, May 22, 2025 at 07:23:32AM +0100, Ben Dooks wrote:
> >On 20/05/2025 17:49, Deepak Gupta wrote:
> >>I did give this patch my RB and had planned to come back to it to see
> >>if it impacts cfi related patches. Thanks to alex for brinigng to my
> >>attention again. As it stands today, it doesn't impact cfi related
> >>changes but I've some concerns.
> >>
> >>Overall I do agree we should reduce number of SSTATUS accesses.
> >>
> >>Couple of questions on introducing new `sstatus` field (inline)
> >>
> >>On Tue, Apr 22, 2025 at 04:01:35PM -0700, Deepak Gupta wrote:
> >>>On Thu, Apr 10, 2025 at 07:05:22AM +0000, Cyril Bur wrote:
> >>>>From: Ben Dooks <ben.dooks@codethink.co.uk>
> >>>>
> >>>>When threads/tasks are switched we need to ensure the old execution's
> >>>>SR_SUM state is saved and the new thread has the old SR_SUM state
> >>>>restored.
> >>>>
> >>>>The issue was seen under heavy load especially with the syz-stress to=
ol
> >>>>running, with crashes as follows in schedule_tail:
> >>>>
> >>>>Unable to handle kernel access to user memory without uaccess routine=
s
> >>>>at virtual address 000000002749f0d0
> >>>>Oops [#1]
> >>>>Modules linked in:
> >>>>CPU: 1 PID: 4875 Comm: syz-executor.0 Not tainted
> >>>>5.12.0-rc2-syzkaller-00467-g0d7588ab9ef9 #0
> >>>>Hardware name: riscv-virtio,qemu (DT)
> >>>>epc : schedule_tail+0x72/0xb2 kernel/sched/core.c:4264
> >>>>ra : task_pid_vnr include/linux/sched.h:1421 [inline]
> >>>>ra : schedule_tail+0x70/0xb2 kernel/sched/core.c:4264
> >>>>epc : ffffffe00008c8b0 ra : ffffffe00008c8ae sp : ffffffe025d17ec0
> >>>>gp : ffffffe005d25378 tp : ffffffe00f0d0000 t0 : 0000000000000000
> >>>>t1 : 0000000000000001 t2 : 00000000000f4240 s0 : ffffffe025d17ee0
> >>>>s1 : 000000002749f0d0 a0 : 000000000000002a a1 : 0000000000000003
> >>>>a2 : 1ffffffc0cfac500 a3 : ffffffe0000c80cc a4 : 5ae9db91c19bbe00
> >>>>a5 : 0000000000000000 a6 : 0000000000f00000 a7 : ffffffe000082eba
> >>>>s2 : 0000000000040000 s3 : ffffffe00eef96c0 s4 : ffffffe022c77fe0
> >>>>s5 : 0000000000004000 s6 : ffffffe067d74e00 s7 : ffffffe067d74850
> >>>>s8 : ffffffe067d73e18 s9 : ffffffe067d74e00 s10: ffffffe00eef96e8
> >>>>s11: 000000ae6cdf8368 t3 : 5ae9db91c19bbe00 t4 : ffffffc4043cafb2
> >>>>t5 : ffffffc4043cafba t6 : 0000000000040000
> >>>>status: 0000000000000120 badaddr: 000000002749f0d0 cause:
> >>>>000000000000000f
> >>>>Call Trace:
> >>>>[<ffffffe00008c8b0>] schedule_tail+0x72/0xb2 kernel/sched/core.c:4264
> >>>>[<ffffffe000005570>] ret_from_exception+0x0/0x14
> >>>>Dumping ftrace buffer:
> >>>> (ftrace buffer empty)
> >>>>---[ end trace b5f8f9231dc87dda ]---
> >>>>
> >>>>The issue comes from the put_user() in schedule_tail
> >>>>(kernel/sched/core.c) doing the following:
> >>>>
> >>>>asmlinkage __visible void schedule_tail(struct task_struct *prev)
> >>>>{
> >>>>...
> >>>>      if (current->set_child_tid)
> >>>>              put_user(task_pid_vnr(current), current->set_child_tid)=
;
> >>>>...
> >>>>}
> >>>>
> >>>>the put_user() macro causes the code sequence to come out as follows:
> >>>>
> >>>>1:    __enable_user_access()
> >>>>2:    reg =3D task_pid_vnr(current);
> >>>>3:    *current->set_child_tid =3D reg;
> >>>>4:    __disable_user_access()
> >>>>
> >>>>The problem is that we may have a sleeping function as argument which
> >>>>could clear SR_SUM causing the panic above. This was fixed by
> >>>>evaluating the argument of the put_user() macro outside the user-enab=
led
> >>>>section in commit 285a76bb2cf5 ("riscv: evaluate put_user() arg befor=
e
> >>>>enabling user access")"
> >>>>
> >>>>In order for riscv to take advantage of unsafe_get/put_XXX() macros a=
nd
> >>>>to avoid the same issue we had with put_user() and sleeping functions=
 we
> >>>>must ensure code flow can go through switch_to() from within a region=
 of
> >>>>code with SR_SUM enabled and come back with SR_SUM still enabled. Thi=
s
> >>>>patch addresses the problem allowing future work to enable full use o=
f
> >>>>unsafe_get/put_XXX() macros without needing to take a CSR bit flip co=
st
> >>>>on every access. Make switch_to() save and restore SR_SUM.
> >>>>
> >>>>Reported-by: syzbot+e74b94fe601ab9552d69@syzkaller.appspotmail.com
> >>>>Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> >>>>Signed-off-by: Cyril Bur <cyrilbur@tenstorrent.com>
> >>>>---
> >>>>arch/riscv/include/asm/processor.h | 1 +
> >>>>arch/riscv/kernel/asm-offsets.c    | 5 +++++
> >>>>arch/riscv/kernel/entry.S          | 8 ++++++++
> >>>>3 files changed, 14 insertions(+)
> >>>>
> >>>>diff --git a/arch/riscv/include/asm/processor.h
> >>>>b/arch/riscv/include/ asm/processor.h
> >>>>index 5f56eb9d114a..58fd11c89fe9 100644
> >>>>--- a/arch/riscv/include/asm/processor.h
> >>>>+++ b/arch/riscv/include/asm/processor.h
> >>>>@@ -103,6 +103,7 @@ struct thread_struct {
> >>>>    struct __riscv_d_ext_state fstate;
> >>>>    unsigned long bad_cause;
> >>>>    unsigned long envcfg;
> >>>>+    unsigned long status;
> >>
> >>Do we really need a new member field in `thread_struct`. We already hav=
e
> >>`sstatus` in `pt_regs` which reflects overall execution environment
> >>situation
> >>for current thread. This gets saved and restored on trap entry and exit=
.
> >>
> >>If we put `status` in `thread_struct` it creates ambiguity in terms
> >>of which
> >>`status` to save to and pick from from future maintainibility
> >>purposes as the
> >>fields get introduced to this CSR.
> >>
> >>Why can't we access current trap frame's `sstatus` image in
> >>`__switch_to` to
> >>save and restore?
> >>
> >>Let me know if I am missing something obvious here. If there is a
> >>complication,
> >>I am missing here and we do end up using this member field, I would
> >>rename it
> >>to something like `status_kernel` to reflect that. So that future
> >>changes are
> >>cognizant of the fact that we have split `status`. One for kernel
> >>execution env
> >>per thread and one for controlling user execution env per thread.
> >
> >This is so long ago now I cannot remember if there was any sstatus in
> >the pt_regs field,
>
> FS/VS bits encode status of floating point and vector on per-thread basis=
.
> So `status` has been part of `pt_regs` for quite a while.
>
> > and if kernel threads have the same context as their
> >userland parts.
>
> I didn't mean kernel thread. What I meant was kernel execution environmen=
t
> per-thread. A userland thread does spend sometime in kernel and kernel do=
es
> things on its behalf. One of those thing is touching user memory and that
> requires mucking with this CSR. So what I meant was are we splitting `sta=
tus`
> on per-thread basis for their time spent in user and kernel.
>
> Getting back to original question--
> As I said, each thread spends sometime in user or in kernel. `status` in
> `pt_regs` is saved on trap entry and restored on trap exit. In a sense,
> `status` field in `pt_regs` is reflecting execution status of the thread =
on per
> trap basis. Introducing `status` in `thread_struct` creates a confusion (=
if not
> for today, certainly for future) of which `status` to pick from when we a=
re
> doing save/restore.

I agree that it's a confusion. sstatus is already saved on pt_regs on
trap entries/return, adding another entry adds code complexity and
makes data inconsistent. But, perhaps we'd eventually need something
like this (I will explain why). Still, there might be a better
approach.

Yes, we can always reflect pt_regs for sstatus. We all know that
pt_regs reflects sstatus at trap entry, and the pt_regs at scheduler
point refers to "user's" pt_regs whenever it first enters kernel mode. Here
are reasons why SR_SUM here may or may not be properly tracked. First,
if this is a trap introduced context switch (such as interrupting in a
preemptible context after we manually enable user access in put_user),
then SR_SUM is saved somewhere in the kernel stack, and is not
reference-able with task_pt_reg during context switch. But we are safe
because the trap exit asm would help us restore the correct SR_SUM
back. However, if this is a self-initiating context switch (calling
into schedule()), then SR_SUM is not saved anywhere, and possibly
causing this error.

Preemptible Vector in the kernel mode also had this problem where a
self-initiating context switch loses the track of sstatus.vs. The way
I managed it is to track the VS bit at context switch time. However,
this bug shows that people are repeatedly facing the problem, and
maybe it suggests that we'd need a better way of managing sstatus
across context switches. Given the complex nature of this register,
which also touches the interrupt enable status, I don't think naively
saving/restoring the entire register is the way to go. Maybe the
variable deserves a more specific naming and documentation. And if
we'd need a centralized place for managing these statuses, then it
also has to take care of sstatus.VS.

Thanks,
Andy




>
> So my first question was why not to use `status` in `pt_regs`. It is gran=
ular
> as it can get (it is available per thread context per trap basis).
>
>
> I did ask Alex as well. I'll ping him again.
>
> >
> >Does anyone else have any comment on this?
> >
> >>
> >>>>    u32 riscv_v_flags;
> >>>>    u32 vstate_ctrl;
> >>>>    struct __riscv_v_ext_state vstate;
> >>>>diff --git a/arch/riscv/kernel/asm-offsets.c
> >>>>b/arch/riscv/kernel/asm- offsets.c
> >>>>index 16490755304e..969c65b1fe41 100644
> >>>>--- a/arch/riscv/kernel/asm-offsets.c
> >>>>+++ b/arch/riscv/kernel/asm-offsets.c
> >>>>@@ -34,6 +34,7 @@ void asm_offsets(void)
> >>>>    OFFSET(TASK_THREAD_S9, task_struct, thread.s[9]);
> >>>>    OFFSET(TASK_THREAD_S10, task_struct, thread.s[10]);
> >>>>    OFFSET(TASK_THREAD_S11, task_struct, thread.s[11]);
> >>
> >>_______________________________________________
> >>linux-riscv mailing list
> >>linux-riscv@lists.infradead.org
> >>http://lists.infradead.org/mailman/listinfo/linux-riscv
> >>
> >
> >
> >--
> >Ben Dooks                              http://www.codethink.co.uk/
> >Senior Engineer                                Codethink - Providing Gen=
ius
> >
> >https://www.codethink.co.uk/privacy.html
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
