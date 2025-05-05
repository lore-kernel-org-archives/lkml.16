Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395C2339A1
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 04:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746421145; cv=none; b=Dy/GSR6FhTBZvP4s210bRqccfKCJ2sAvjv3RQdaivtbpppu+51BpDHyrZbJxDPWc/V+yKBx1SpcAAFGjFMIT3Ko70a4KrPnfAcLPtc4/5fWB4keuvYrYG0QPhrLay6qQIM5JgufgrOtOLpSXCYhIQeUI5i7CPW9GPp9I++WXg5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746421145; c=relaxed/simple;
	bh=K7s2g7BUqrF2uhZ/RQRKvPzy15IaDMLWYy/MInMArMQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GCsdquq6m+uSm391y4NrEYyqU6PlIDy72sah9xM6whkHG69OsgO7W+0p4maVjvK/GBE4hEitKu1XTtZ/iZ+DIE23zF3yOL/eQpahIhMT4BxBURHHXOpwSTzP+XsRB8QLwIfqaVoowkt8OVgHH5aveS7cROgZZDoytg9k8XgAFfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tbUl1cR1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tbUl1cR1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D495C4CEF5
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 04:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746421144;
	bh=K7s2g7BUqrF2uhZ/RQRKvPzy15IaDMLWYy/MInMArMQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tbUl1cR1FVBN1yVzkCIZ38U+2oziyEQ4+g5z3n+Jvb+IgRec2lOzkHrhIIbaY72cb
	 Jlix+qBOpRjodoP5fWl/+C5uZHLA7fb5DkllWDCFlxeQBMEBUa7mJPg6wbEUaV0BiD
	 ai34i8JMnhinvlfecnvCVxo8Cjvi79ILLXbOD2uXLZxGB/50rpU3srWbCHf0thCxa1
	 dqFk3Im41MDHqr/a3AHl2UTIRHTafCuQdOF/8/TZ8bQ/GjUCu6eCKrhHmLYoeSP+rT
	 5bPQX8mh1J8drkSSJTsBu9nl0d8W5kySXNmXhZbCw6VOnauuCQcEAJcuNUkyZE+G0B
	 wtqmWy3MwAaoQ==
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5e5cded3e2eso2120672a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 21:59:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVIqUPtGHbENqPzg/e4wAcuBv+xQ9O/DPvOq0htbeMMTxPAQRsn8z65ZSgOPqdDMRNDrXFdfc55YPFQ6vA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjLXrmnI6EwbF7ZjEMOqBBHtjNC+9bpYjx3/a+vet2MKIwpq42
	CBstyd4auQ3Vp5L0qARketacR076aF5nOXuRJR/5kDsv/9tC6epYeELJA3BydCBxivw0fxjq5Wp
	PoquZT+WLszW2KdgZzSJbUS2/+kQ=
X-Google-Smtp-Source: AGHT+IG1lchCTSmjOeXTlVWNOKDNxSCiMmrVSg+nCFqgnE1LhOpMxr54poigqTD4VYCMVagIlxVTJFY1JBSjJcSej0E=
X-Received: by 2002:a05:6402:2112:b0:5f4:ade4:88c5 with SMTP id
 4fb4d7f45d1cf-5faa8031175mr6421508a12.34.1746421143164; Sun, 04 May 2025
 21:59:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250320-riscv_optimize_entry-v6-0-63e187e26041@rivosinc.com> <20250320-riscv_optimize_entry-v6-3-63e187e26041@rivosinc.com>
In-Reply-To: <20250320-riscv_optimize_entry-v6-3-63e187e26041@rivosinc.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 5 May 2025 12:58:52 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4qAT-45=vEKDQ9zKWsoN+3XW9Sj5cTdfQwqE-aGJYzjQ@mail.gmail.com>
X-Gm-Features: ATxdqUFH04W6-dJK9c2_4Fnk38d3i97bZmImDonrAVMLvrJUAQY9c2hxFrmPdus
Message-ID: <CAAhV-H4qAT-45=vEKDQ9zKWsoN+3XW9Sj5cTdfQwqE-aGJYzjQ@mail.gmail.com>
Subject: Re: [PATCH v6 3/4] LoongArch: entry: Migrate ret_from_fork() to C
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	WANG Xuerui <kernel@xen0n.name>, Thomas Gleixner <tglx@linutronix.de>, 
	Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Arnd Bergmann <arnd@arndb.de>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Charlie,

There are some small issues.

On Fri, Mar 21, 2025 at 1:29=E2=80=AFAM Charlie Jenkins <charlie@rivosinc.c=
om> wrote:
>
> LoongArch is the only architecture that calls
> syscall_exit_to_user_mode() from asm. Move the call into C so that this
> function can be inlined across all architectures.
>
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> ---
>  arch/loongarch/include/asm/asm-prototypes.h |  8 +++++++
>  arch/loongarch/kernel/entry.S               | 22 +++++++++----------
>  arch/loongarch/kernel/process.c             | 33 +++++++++++++++++++++++=
------
>  3 files changed, 45 insertions(+), 18 deletions(-)
>
> diff --git a/arch/loongarch/include/asm/asm-prototypes.h b/arch/loongarch=
/include/asm/asm-prototypes.h
> index 51f224bcfc654228ae423e9a066b25b35102a5b9..704066b4f7368be15be960fad=
bcd6c2574bbf6c0 100644
> --- a/arch/loongarch/include/asm/asm-prototypes.h
> +++ b/arch/loongarch/include/asm/asm-prototypes.h
> @@ -12,3 +12,11 @@ __int128_t __ashlti3(__int128_t a, int b);
>  __int128_t __ashrti3(__int128_t a, int b);
>  __int128_t __lshrti3(__int128_t a, int b);
>  #endif
> +
> +asmlinkage void noinstr __no_stack_protector ret_from_fork(struct task_s=
truct *prev,
> +                                                          struct pt_regs=
 *regs);
> +
> +asmlinkage void noinstr __no_stack_protector ret_from_kernel_thread(stru=
ct task_struct *prev,
> +                                                                   struc=
t pt_regs *regs,
> +                                                                   int (=
*fn)(void *),
> +                                                                   void =
*fn_arg);
> diff --git a/arch/loongarch/kernel/entry.S b/arch/loongarch/kernel/entry.=
S
> index 48e7e34e355e83eae8165957ba2eac05a8bf17df..2abc29e573810e000f2fef464=
6ddca0dbb80eabe 100644
> --- a/arch/loongarch/kernel/entry.S
> +++ b/arch/loongarch/kernel/entry.S
> @@ -77,24 +77,22 @@ SYM_CODE_START(handle_syscall)
>  SYM_CODE_END(handle_syscall)
>  _ASM_NOKPROBE(handle_syscall)
>
> -SYM_CODE_START(ret_from_fork)
> +SYM_CODE_START(ret_from_fork_asm)
>         UNWIND_HINT_REGS
> -       bl              schedule_tail           # a0 =3D struct task_stru=
ct *prev
> -       move            a0, sp
> -       bl              syscall_exit_to_user_mode
> +       move            a1, sp
> +       bl              ret_from_fork
>         RESTORE_STATIC
>         RESTORE_SOME
>         RESTORE_SP_AND_RET
> -SYM_CODE_END(ret_from_fork)
> +SYM_CODE_END(ret_from_fork_asm)
>
> -SYM_CODE_START(ret_from_kernel_thread)
> +SYM_CODE_START(ret_from_kernel_thread_asm)
>         UNWIND_HINT_REGS
> -       bl              schedule_tail           # a0 =3D struct task_stru=
ct *prev
> -       move            a0, s1
> -       jirl            ra, s0, 0
> -       move            a0, sp
> -       bl              syscall_exit_to_user_mode
> +       move            a1, sp
> +       move            a2, s0
> +       move            a3, s1
> +       bl              ret_from_kernel_thread
>         RESTORE_STATIC
>         RESTORE_SOME
>         RESTORE_SP_AND_RET
> -SYM_CODE_END(ret_from_kernel_thread)
> +SYM_CODE_END(ret_from_kernel_thread_asm)
> diff --git a/arch/loongarch/kernel/process.c b/arch/loongarch/kernel/proc=
ess.c
> index 6e58f65455c7ca3eae2e88ed852c8655a6701e5c..98bc60d7c550fcc0225e8452f=
81a7d6cd7888015 100644
> --- a/arch/loongarch/kernel/process.c
> +++ b/arch/loongarch/kernel/process.c
> @@ -14,6 +14,7 @@
>  #include <linux/init.h>
>  #include <linux/kernel.h>
>  #include <linux/errno.h>
> +#include <linux/entry-common.h>
For alpa-betical order, it should be before errno.h.

>  #include <linux/sched.h>
>  #include <linux/sched/debug.h>
>  #include <linux/sched/task.h>
> @@ -33,6 +34,7 @@
>  #include <linux/prctl.h>
>  #include <linux/nmi.h>
>
> +#include <asm/asm-prototypes.h>
For alpa-betical order, it should be after asm.h.


Huacai

>  #include <asm/asm.h>
>  #include <asm/bootinfo.h>
>  #include <asm/cpu.h>
> @@ -47,6 +49,7 @@
>  #include <asm/pgtable.h>
>  #include <asm/processor.h>
>  #include <asm/reg.h>
> +#include <asm/switch_to.h>
>  #include <asm/unwind.h>
>  #include <asm/vdso.h>
>
> @@ -63,8 +66,9 @@ EXPORT_SYMBOL(__stack_chk_guard);
>  unsigned long boot_option_idle_override =3D IDLE_NO_OVERRIDE;
>  EXPORT_SYMBOL(boot_option_idle_override);
>
> -asmlinkage void ret_from_fork(void);
> -asmlinkage void ret_from_kernel_thread(void);
> +asmlinkage void restore_and_ret(void);
> +asmlinkage void ret_from_fork_asm(void);
> +asmlinkage void ret_from_kernel_thread_asm(void);
>
>  void start_thread(struct pt_regs *regs, unsigned long pc, unsigned long =
sp)
>  {
> @@ -138,6 +142,23 @@ int arch_dup_task_struct(struct task_struct *dst, st=
ruct task_struct *src)
>         return 0;
>  }
>
> +asmlinkage void noinstr __no_stack_protector ret_from_fork(struct task_s=
truct *prev,
> +                                                          struct pt_regs=
 *regs)
> +{
> +       schedule_tail(prev);
> +       syscall_exit_to_user_mode(regs);
> +}
> +
> +asmlinkage void noinstr __no_stack_protector ret_from_kernel_thread(stru=
ct task_struct *prev,
> +                                                                   struc=
t pt_regs *regs,
> +                                                                   int (=
*fn)(void *),
> +                                                                   void =
*fn_arg)
> +{
> +       schedule_tail(prev);
> +       fn(fn_arg);
> +       syscall_exit_to_user_mode(regs);
> +}
> +
>  /*
>   * Copy architecture-specific thread state
>   */
> @@ -165,8 +186,8 @@ int copy_thread(struct task_struct *p, const struct k=
ernel_clone_args *args)
>                 p->thread.reg03 =3D childksp;
>                 p->thread.reg23 =3D (unsigned long)args->fn;
>                 p->thread.reg24 =3D (unsigned long)args->fn_arg;
> -               p->thread.reg01 =3D (unsigned long)ret_from_kernel_thread=
;
> -               p->thread.sched_ra =3D (unsigned long)ret_from_kernel_thr=
ead;
> +               p->thread.reg01 =3D (unsigned long)ret_from_kernel_thread=
_asm;
> +               p->thread.sched_ra =3D (unsigned long)ret_from_kernel_thr=
ead_asm;
>                 memset(childregs, 0, sizeof(struct pt_regs));
>                 childregs->csr_euen =3D p->thread.csr_euen;
>                 childregs->csr_crmd =3D p->thread.csr_crmd;
> @@ -182,8 +203,8 @@ int copy_thread(struct task_struct *p, const struct k=
ernel_clone_args *args)
>                 childregs->regs[3] =3D usp;
>
>         p->thread.reg03 =3D (unsigned long) childregs;
> -       p->thread.reg01 =3D (unsigned long) ret_from_fork;
> -       p->thread.sched_ra =3D (unsigned long) ret_from_fork;
> +       p->thread.reg01 =3D (unsigned long) ret_from_fork_asm;
> +       p->thread.sched_ra =3D (unsigned long) ret_from_fork_asm;
>
>         /*
>          * New tasks lose permission to use the fpu. This accelerates con=
text
>
> --
> 2.43.0
>
