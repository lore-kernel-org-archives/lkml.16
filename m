Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F1E17C21B
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 17:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747935640; cv=none; b=UvtWvD+mvap6b09KJfhOoPzCJw8NY7p4ql0Hi21d56XFTeD3Px6qHsU5VrUxio/RfEiuLO15Seeg8iMJs71G1tc0gAeeAEA3E9OfNhJ/cb+XfZWsS95I8RJ0A7Belx8mirhQQoZxjC9XZhUztI0qMRwoiNnGtNbzcjx/ZYD8rZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747935640; c=relaxed/simple;
	bh=r2zi+wiXqzho98Wh9xu654BzSxOXnnRYOJ2MYF3q6HU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P4b0LlHJFTydvW178yzzaLPJOnqTwhc+9o4diI5eWR+/UutsknvQTs0y+hTZ6fcyPBy8reVGOkQ+xN4P/chthU9q8ySYhuxuOiNFFbGG7yT5CcW3ztGvhfr3DY3rebflzZcNt9MFMgdo84Rn0tw1rxHFTRVXUKd6NyMNuc/Ve6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rv0IiaOj; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rv0IiaOj"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b0b2d0b2843so6120698a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 10:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747935637; x=1748540437; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GzWx6399FL6U++eqgzqXfd1y7VHTUn8Bi5azs/ECv78=;
        b=Rv0IiaOjRrv0Fj40nZVsEcepM7BYA/HF80yuQYvJNFbOLHixVMbzInRcKfF59hnI88
         y9GjzKJdqrHgHxs1HNj6cMJL5k0ffMqnWlIfVB+7UvPYBQweh/ay54RBHGp4FbxEXN5f
         JxU1+Jfrp2OAS7OxTsakCrCwjCFu14coNDOF528xQqk6bFuA4cgHv8L4oN5Jc9D/hkX+
         ZWm/4M4qt38UlNvjwVQNIEpqJenDR7EgweLXutI6lqW1WMqvdwcOjATYJHX+s8/+hAIC
         YMxfjOlChoYGeONY8R1fMNyuA4lFw3p0bDez/cAWDjtAiETYiYnne2UnBPkr+JzzxGx5
         itgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747935637; x=1748540437;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GzWx6399FL6U++eqgzqXfd1y7VHTUn8Bi5azs/ECv78=;
        b=vqg8Iwc6CghoxR4K46WkkKC40RxoNJCZO+locLJwFKjdYTfrctQmNwAam/3wuvpYQl
         n2VzT8F8J1Dk6Hs3rWyByf7/NxGZxj8vwrhkIskWK24FQsaX0n21bI43wzwelUJoDOff
         +QKcPj53L2KLCp462teuGcJtr4FBcGCx/4qiqe6J+Euc2A9MEmZz0TwWvdfWmpWO72PP
         EzQp5lKo9nkMik5Tap2pbfxowPvbIvzy4oaFoxCiHtsQ7jn/deGDWmeATzFdSSdWyHwW
         rhBoW4NUuuiz53xnqubKF1jAdQoXuYJ/r5gIDvfoFM5lG683Brw9elv6A1LT/WcQCPgI
         bzaw==
X-Forwarded-Encrypted: i=1; AJvYcCWCA5vGFYQF1x43+Mez3Sb/jymoghHaxT1O8hFCMO70LFEMF75WGmBWIjyICl3H6sXTkYcz2WP5weovajE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3Xpkgo6AJTaJQFQKNHGdyiXumr0BUgHsTDvR/0O71cpGYYTGA
	ULhANL5fshGlhgUnNlHsXaGQVSlqJc3JpnbmNU3GCaMKcMgsbPNXh4crhkKJZu8WoId5emg5n8l
	pcqHU6cGIEdpr076jnXE11AxRSmTQsN/Rag==
X-Gm-Gg: ASbGnctN7fEjcTchtpVBvKD+8nUOfbWKBTRnzg6MkJ51DcXApSYrDndUK0DKb6cxvR8
	GfaH58L5hr0/uiWK3kQrDijGYZPxrWExy7HuMHkFJaYC2E1Carvo/fTWSpjagGVqPtACph/id8i
	k8ye3lRdARX8M+8G1gnH8wR7D3ximMFTOXo5o93O+KGw==
X-Google-Smtp-Source: AGHT+IFG+lEV34BosOenMIYGBjPspXtvy/Kp3R9utgl1DKTRoXOAgDJYvMOXEUtjhmUmh+De2N6TZKc159q8Ix2mY5o=
X-Received: by 2002:a17:902:c951:b0:220:c911:3f60 with SMTP id
 d9443c01a7336-231d454eb37mr322080845ad.47.1747935637267; Thu, 22 May 2025
 10:40:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250410070526.3160847-1-cyrilbur@tenstorrent.com>
 <20250410070526.3160847-2-cyrilbur@tenstorrent.com> <d09e80c2-024c-4fe0-b71e-6af88e239ea9@ghiti.fr>
 <145b6e37-bbb3-47ec-b9dc-3450a7f3da2b@codethink.co.uk> <923f3653-3df6-4587-aef1-c449f0fa3377@sifive.com>
 <ea862473-8e8d-4d1b-8236-f8ce75d2589f@ghiti.fr>
In-Reply-To: <ea862473-8e8d-4d1b-8236-f8ce75d2589f@ghiti.fr>
From: Andy Chiu <andybnac@gmail.com>
Date: Fri, 23 May 2025 01:40:25 +0800
X-Gm-Features: AX0GCFsImY46t7wI9z4D6gsrW7WYSsyne3E5-77rqZ5ucak7LHSHGIudzV-e5To
Message-ID: <CAFTtA3NXatSV91_iAqj5+vxnMi14+TFNSET6Pm-UY7YrhspAfw@mail.gmail.com>
Subject: Re: [PATCH v6 1/5] riscv: save the SR_SUM status over switches
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Samuel Holland <samuel.holland@sifive.com>, Ben Dooks <ben.dooks@codethink.co.uk>, 
	palmer@dabbelt.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, jszhang@kernel.org, 
	syzbot+e74b94fe601ab9552d69@syzkaller.appspotmail.com, 
	Cyril Bur <cyrilbur@tenstorrent.com>, aou@eecs.berkeley.edu, paul.walmsley@sifive.com, 
	charlie@rivosinc.com, jrtc27@jrtc27.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Samuel and Alex,

On Wed, May 21, 2025 at 10:35=E2=80=AFPM Alexandre Ghiti <alex@ghiti.fr> wr=
ote:
>
> Hi Samuel,
>
> On 5/21/25 15:38, Samuel Holland wrote:
> > Hi Alex, Ben,
> >
> > On 2025-05-21 3:26 AM, Ben Dooks wrote:
> >> On 22/04/2025 11:22, Alexandre Ghiti wrote:
> >>> Hi Cyril,
> >>>
> >>> On 10/04/2025 09:05, Cyril Bur wrote:
> >>>> From: Ben Dooks <ben.dooks@codethink.co.uk>
> >>>>
> >>>> When threads/tasks are switched we need to ensure the old execution'=
s
> >>>> SR_SUM state is saved and the new thread has the old SR_SUM state
> >>>> restored.
> >>>>
> >>>> The issue was seen under heavy load especially with the syz-stress t=
ool
> >>>> running, with crashes as follows in schedule_tail:
> >>>>
> >>>> Unable to handle kernel access to user memory without uaccess routin=
es
> >>>> at virtual address 000000002749f0d0
> >>>> Oops [#1]
> >>>> Modules linked in:
> >>>> CPU: 1 PID: 4875 Comm: syz-executor.0 Not tainted
> >>>> 5.12.0-rc2-syzkaller-00467-g0d7588ab9ef9 #0
> >>>> Hardware name: riscv-virtio,qemu (DT)
> >>>> epc : schedule_tail+0x72/0xb2 kernel/sched/core.c:4264
> >>>>    ra : task_pid_vnr include/linux/sched.h:1421 [inline]
> >>>>    ra : schedule_tail+0x70/0xb2 kernel/sched/core.c:4264
> >>>> epc : ffffffe00008c8b0 ra : ffffffe00008c8ae sp : ffffffe025d17ec0
> >>>>    gp : ffffffe005d25378 tp : ffffffe00f0d0000 t0 : 0000000000000000
> >>>>    t1 : 0000000000000001 t2 : 00000000000f4240 s0 : ffffffe025d17ee0
> >>>>    s1 : 000000002749f0d0 a0 : 000000000000002a a1 : 0000000000000003
> >>>>    a2 : 1ffffffc0cfac500 a3 : ffffffe0000c80cc a4 : 5ae9db91c19bbe00
> >>>>    a5 : 0000000000000000 a6 : 0000000000f00000 a7 : ffffffe000082eba
> >>>>    s2 : 0000000000040000 s3 : ffffffe00eef96c0 s4 : ffffffe022c77fe0
> >>>>    s5 : 0000000000004000 s6 : ffffffe067d74e00 s7 : ffffffe067d74850
> >>>>    s8 : ffffffe067d73e18 s9 : ffffffe067d74e00 s10: ffffffe00eef96e8
> >>>>    s11: 000000ae6cdf8368 t3 : 5ae9db91c19bbe00 t4 : ffffffc4043cafb2
> >>>>    t5 : ffffffc4043cafba t6 : 0000000000040000
> >>>> status: 0000000000000120 badaddr: 000000002749f0d0 cause:
> >>>> 000000000000000f
> >>>> Call Trace:
> >>>> [<ffffffe00008c8b0>] schedule_tail+0x72/0xb2 kernel/sched/core.c:426=
4
> >>>> [<ffffffe000005570>] ret_from_exception+0x0/0x14
> >>>> Dumping ftrace buffer:
> >>>>      (ftrace buffer empty)
> >>>> ---[ end trace b5f8f9231dc87dda ]---
> >>>>
> >>>> The issue comes from the put_user() in schedule_tail
> >>>> (kernel/sched/core.c) doing the following:
> >>>>
> >>>> asmlinkage __visible void schedule_tail(struct task_struct *prev)
> >>>> {
> >>>> ...
> >>>>           if (current->set_child_tid)
> >>>>                   put_user(task_pid_vnr(current), current->set_child=
_tid);
> >>>> ...
> >>>> }
> >>>>
> >>>> the put_user() macro causes the code sequence to come out as follows=
:
> >>>>
> >>>> 1:    __enable_user_access()
> >>>> 2:    reg =3D task_pid_vnr(current);
> >>>> 3:    *current->set_child_tid =3D reg;
> >>>> 4:    __disable_user_access()
> >>>>
> >>>> The problem is that we may have a sleeping function as argument whic=
h
> >>>> could clear SR_SUM causing the panic above. This was fixed by
> >>>> evaluating the argument of the put_user() macro outside the user-ena=
bled
> >>>> section in commit 285a76bb2cf5 ("riscv: evaluate put_user() arg befo=
re
> >>>> enabling user access")"
> >>>>
> >>>> In order for riscv to take advantage of unsafe_get/put_XXX() macros =
and
> >>>> to avoid the same issue we had with put_user() and sleeping function=
s we
> >>>> must ensure code flow can go through switch_to() from within a regio=
n of
> >>>> code with SR_SUM enabled and come back with SR_SUM still enabled. Th=
is
> >>>> patch addresses the problem allowing future work to enable full use =
of
> >>>> unsafe_get/put_XXX() macros without needing to take a CSR bit flip c=
ost
> >>>> on every access. Make switch_to() save and restore SR_SUM.
> >>>>
> >>>> Reported-by: syzbot+e74b94fe601ab9552d69@syzkaller.appspotmail.com
> >>>> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> >>>> Signed-off-by: Cyril Bur <cyrilbur@tenstorrent.com>
> >>>> ---
> >>>>    arch/riscv/include/asm/processor.h | 1 +
> >>>>    arch/riscv/kernel/asm-offsets.c    | 5 +++++
> >>>>    arch/riscv/kernel/entry.S          | 8 ++++++++
> >>>>    3 files changed, 14 insertions(+)
> >>>>
> >>>> diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include=
/ asm/
> >>>> processor.h
> >>>> index 5f56eb9d114a..58fd11c89fe9 100644
> >>>> --- a/arch/riscv/include/asm/processor.h
> >>>> +++ b/arch/riscv/include/asm/processor.h
> >>>> @@ -103,6 +103,7 @@ struct thread_struct {
> >>>>        struct __riscv_d_ext_state fstate;
> >>>>        unsigned long bad_cause;
> >>>>        unsigned long envcfg;
> >>>> +    unsigned long status;
> >>>>        u32 riscv_v_flags;
> >>>>        u32 vstate_ctrl;
> >>>>        struct __riscv_v_ext_state vstate;
> >>>> diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm=
- offsets.c
> >>>> index 16490755304e..969c65b1fe41 100644
> >>>> --- a/arch/riscv/kernel/asm-offsets.c
> >>>> +++ b/arch/riscv/kernel/asm-offsets.c
> >>>> @@ -34,6 +34,7 @@ void asm_offsets(void)
> >>>>        OFFSET(TASK_THREAD_S9, task_struct, thread.s[9]);
> >>>>        OFFSET(TASK_THREAD_S10, task_struct, thread.s[10]);
> >>>>        OFFSET(TASK_THREAD_S11, task_struct, thread.s[11]);
> >>>> +    OFFSET(TASK_THREAD_STATUS, task_struct, thread.status);
> >>>>        OFFSET(TASK_TI_CPU, task_struct, thread_info.cpu);
> >>>>        OFFSET(TASK_TI_PREEMPT_COUNT, task_struct, thread_info.preemp=
t_count);
> >>>> @@ -346,6 +347,10 @@ void asm_offsets(void)
> >>>>              offsetof(struct task_struct, thread.s[11])
> >>>>            - offsetof(struct task_struct, thread.ra)
> >>>>        );
> >>>> +    DEFINE(TASK_THREAD_STATUS_RA,
> >>>> +          offsetof(struct task_struct, thread.status)
> >>>> +        - offsetof(struct task_struct, thread.ra)
> >>>> +    );
> >>>>        DEFINE(TASK_THREAD_F0_F0,
> >>>>              offsetof(struct task_struct, thread.fstate.f[0])
> >>>> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> >>>> index 33a5a9f2a0d4..00bd0de9faa2 100644
> >>>> --- a/arch/riscv/kernel/entry.S
> >>>> +++ b/arch/riscv/kernel/entry.S
> >>>> @@ -397,9 +397,17 @@ SYM_FUNC_START(__switch_to)
> >>>>        REG_S s9,  TASK_THREAD_S9_RA(a3)
> >>>>        REG_S s10, TASK_THREAD_S10_RA(a3)
> >>>>        REG_S s11, TASK_THREAD_S11_RA(a3)
> >>>> +
> >>>> +    /* save the user space access flag */
> >>>> +    li    s0, SR_SUM
> >>>
> >>> This is not needed anymore ^ but I'll remove it when merging your pat=
chset.
> >>>
> >> Could you be more specific about what "this" is?
> >>
> >> If we don't save/restore the SR_SUM bit I think our old friend
> >> the sched_tail bug will just return.
> > I think Alex is saying the `li` instruction above is not needed because=
 s0 is
> > unused. But instead I think there is an `and` instruction missing here.=
 The
> > patch as merged ORs the entirety of the old sstatus with the new sstatu=
s, not
> > just the SUM bit, which seems extremely dangerous.
>

Thanks for noticing this. I've also spent a bit of time pondering...

If this were an "and" instruction, I think we should rename the struct
to "status_sum" to prevent confusions, as it only holds the SUM bit
now. Or maybe we could create a bitfield "any only touch "and
save/restore" the specified bit.

Thanks,
Andy


>
> I should have checked the definition of csrs, I thought it would write
> the csr, but you're right it ORs with the current csr value which isn't
> good at all.
>
> @Cyril Can you send a patch for that? Which also removes the `li`
> instruction that I forgot to remove :) I think we can even ask Palmer to
> squash those fixes directly into the patch.
>
> Let me know if you can't do it and I'll do.
>
> Thanks Samuel for noticing,
>
> Alex
>
>
> >
> > Regards,
> > Samuel
> >
> >>>> +    csrr  s1, CSR_STATUS
> >>>> +    REG_S s1, TASK_THREAD_STATUS_RA(a3)
> >>>> +
> >>>>        /* Save the kernel shadow call stack pointer */
> >>>>        scs_save_current
> >>>>        /* Restore context from next->thread */
> >>>> +    REG_L s0,  TASK_THREAD_STATUS_RA(a4)
> >>>> +    csrs  CSR_STATUS, s0
> >>>>        REG_L ra,  TASK_THREAD_RA_RA(a4)
> >>>>        REG_L sp,  TASK_THREAD_SP_RA(a4)
> >>>>        REG_L s0,  TASK_THREAD_S0_RA(a4)
> >>> Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> >>>
> >>> Thanks for the multiple revisions!
> >>>
> >>> Alex
> >>>
> >>>
> >>> _______________________________________________
> >>> linux-riscv mailing list
> >>> linux-riscv@lists.infradead.org
> >>> http://lists.infradead.org/mailman/listinfo/linux-riscv
> >>>
> >>
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
