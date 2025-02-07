Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29ABA189F39
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 08:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738916327; cv=none; b=eek/XFVd30hNV5VCzWC5nD8tjY/57ocS4ssMuYrS/AbTbnsksQOhc2OQmKkB8joC6iM9UPsG+KkIgYUEBYCLXcGK8lLs+hW2dsB7DUcFS6ds0+HdZTGqZ5j/11sfOnWr6TrrmW1qHEPwajnPeheMuCVBuEXI/Lg20IfHLgMPkn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738916327; c=relaxed/simple;
	bh=1zEyrC6uc++eul0LyZ8BQcoXyG/r3hdOGW3HQIwZHys=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DpCkCF8V5zjnjepCRAmwnfCsiq4mLmtZoR4ibOFgLEcyB8/zgLV0yyndzN+RrG1eHjdGU9SpnvqRgtFpHJczP3f7x+Bln9PzPYLA/jmXPnLN/IGAUv5ymkWj/tNPSYCrMlq6ILu/EY5yJ/rDHlhHn9jo8Si8MzMbGJ8ZFbDBdtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X+jOoIgq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X+jOoIgq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF3FFC4CEE9
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 08:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738916326;
	bh=1zEyrC6uc++eul0LyZ8BQcoXyG/r3hdOGW3HQIwZHys=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=X+jOoIgqdPRDs/wL2KCdjvFe9LK3FAn1qnO3BWNmwRrsl29giFLS/6oO1ilWnQul/
	 SRz1mBK9r8jwh/r2xbx57nRRp8mjeDhfmlP+4n6enAfKB3nlt0vgr98p8VIETTq63z
	 ntuTrTagkef222GG+v0LbtZrw0qhZBLwjpIHwvks3X0IXujVjQAOaDlcMz5hXpR4A2
	 F8psgAYhy1kXquWPFuPkWZCGmVANAlen3nRkY4JOz5bhQjAhuTS40MVRbRDTs9CKY1
	 4GqkztB8EB136fv3ZfLyr70Q8Wxt56s2Ms9kCGtZmhNZHE8ZJLP/uoor7gaEtiyHnd
	 92FeLgOjGVY7w==
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5de4d4adac9so320622a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 00:18:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX43g7PnzgfM6CQK4vxPKhcJfwf3G/Kkeb7nc1uDe0l7UCq/DVsfPX2RZJN+xDsysZp5iARLdX4eu4clV0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxS6S7qVJdCxnad2ihdQvwPYH3DvCtpBvRBu/fo7lZsw60c+dx
	6ehR3Ny+V+hvOSPQj2jPS1VN6S0sut52LVNcv1RZCgCdMeyB18bBwekY8tBW8yiyM17ymIc4++/
	mla5AF0eRoymnool2tjK6yEbYIm0=
X-Google-Smtp-Source: AGHT+IEH2zNdN2KbQi/RcTnUyrGvn045yWOgG4JVkuNIJX9bLi9t+eo6Ydxrg0KHbHP2EA3Xh0Kj61KD57UtwC0NCTQ=
X-Received: by 2002:a05:6402:2746:b0:5dc:72e1:63f5 with SMTP id
 4fb4d7f45d1cf-5de450046acmr2925368a12.12.1738916325045; Fri, 07 Feb 2025
 00:18:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206162922.3028861-1-marco.crivellari@suse.com> <20250206162922.3028861-2-marco.crivellari@suse.com>
In-Reply-To: <20250206162922.3028861-2-marco.crivellari@suse.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 7 Feb 2025 16:18:37 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6OKwmxhF_iWJEc8OEZ==h8dTdorTwkE8oMUMWAbU6xeg@mail.gmail.com>
X-Gm-Features: AWEUYZnx9cqGSYq-cbWIWg6dKbtiqdT9vFexoRLSXaOzXvKTpl4OkkxFegftus0
Message-ID: <CAAhV-H6OKwmxhF_iWJEc8OEZ==h8dTdorTwkE8oMUMWAbU6xeg@mail.gmail.com>
Subject: Re: [PATCH] loongson: Fix idle VS timer enqueue
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	bibo mao <maobibo@loongson.cn>, WANG Xuerui <kernel@xen0n.name>, 
	Tiezhu Yang <yangtiezhu@loongson.cn>, Frederic Weisbecker <frederic@kernel.org>, 
	Youling Tang <tangyouling@loongson.cn>, Peter Zijlstra <peterz@infradead.org>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Marco,

Thank you for your patch, the logic is correct but the code can be improved=
.

On Fri, Feb 7, 2025 at 12:30=E2=80=AFAM Marco Crivellari
<marco.crivellari@suse.com> wrote:
>
> From: Peter Zijlstra <peterz@infradead.org>
>
> Loongson re-enables interrupts on its idle routine and performs a
> TIF_NEED_RESCHED check afterwards before putting the CPU to sleep.
>
> The IRQs firing between the check and the idling instruction may set the
> TIF_NEED_RESCHED flag. In order to deal with the such a race, IRQs
> interrupting __arch_cpu_idle() rollback their return address to the
> beginning of __arch_cpu_idle() so that TIF_NEED_RESCHED is checked
> again before going back to sleep.
>
> However idle IRQs can also queue timers that may require a tick
> reprogramming through a new generic idle loop iteration but those timers
> would go unnoticed here because __arch_cpu_idle() only checks
> TIF_NEED_RESCHED. It doesn't check for pending timers.
>
> Fix this with fast-forwarding idle IRQs return value to the end of the
> idle routine instead of the beginning, so that the generic idle loop
> handles both TIF_NEED_RESCHED and pending timers.
>
> Fixes: 0603839b18f4 ("LoongArch: Add exception/interrupt handling")
> Not-yet-signed-off-by: Peter Zijlstra <peterz@infradead.org>
> Cc: WANG Xuerui <kernel@xen0n.name>
> Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
> Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
> ---
>  arch/loongarch/kernel/genex.S | 33 +++++++++++++++++++--------------
>  arch/loongarch/kernel/idle.c  |  3 +--
>  arch/loongarch/kernel/reset.c | 23 ++++++++++++++---------
>  3 files changed, 34 insertions(+), 25 deletions(-)
>
> diff --git a/arch/loongarch/kernel/genex.S b/arch/loongarch/kernel/genex.=
S
> index 86d5d90ebefe..ab2e9a262ee2 100644
> --- a/arch/loongarch/kernel/genex.S
> +++ b/arch/loongarch/kernel/genex.S
> @@ -18,28 +18,33 @@
>
>         .align  5
>  SYM_FUNC_START(__arch_cpu_idle)
> -       /* start of rollback region */
> -       LONG_L  t0, tp, TI_FLAGS
> -       nop
> -       andi    t0, t0, _TIF_NEED_RESCHED
> -       bnez    t0, 1f
> -       nop
> -       nop
> -       nop
> +       /* start of idle interrupt region */
> +       li.w    t0, CSR_CRMD_IE
It is better to replace it with "ori t0, zero, CSR_CRMD_IE", ensuring
single instruction.

> +       /* idle instruction needs irq enabled */
> +       csrxchg t0, t0, LOONGARCH_CSR_CRMD
> +       /*
> +        * If an interrupt lands here; between enabling interrupts above =
and
> +        * going idle on the next instruction, we must *NOT* go idle sinc=
e the
> +        * interrupt could have set TIF_NEED_RESCHED or caused an timer t=
o need
> +        * reprogramming. Fall through -- see handle_vint() below -- and =
have
> +        * the idle loop take care of things.
> +        */
>         idle    0
> -       /* end of rollback region */
> -1:     jr      ra
> +       nop
Remove the "nop", of course it should be together with the later modificati=
on.

> +       /* end of idle interrupt region */
> +SYM_INNER_LABEL(__arch_cpu_idle_exit, SYM_L_LOCAL)
> +       jr      ra
>  SYM_FUNC_END(__arch_cpu_idle)
>
>  SYM_CODE_START(handle_vint)
>         UNWIND_HINT_UNDEFINED
>         BACKUP_T0T1
>         SAVE_ALL
> -       la_abs  t1, __arch_cpu_idle
> +       la_abs  t1, __arch_cpu_idle_exit
>         LONG_L  t0, sp, PT_ERA
> -       /* 32 byte rollback region */
> -       ori     t0, t0, 0x1f
> -       xori    t0, t0, 0x1f
> +       /* 16 byte idle interrupt region */
> +       ori     t0, t0, 0x0f
> +       addi.d  t0, t0, 1
Replace these two instructions with "ori t0, t0, 0xc", and "16 bytes"
can be replaced with "3 instructions".

>         bne     t0, t1, 1f
>         LONG_S  t0, sp, PT_ERA
>  1:     move    a0, sp
> diff --git a/arch/loongarch/kernel/idle.c b/arch/loongarch/kernel/idle.c
> index 0b5dd2faeb90..54b247d8cdb6 100644
> --- a/arch/loongarch/kernel/idle.c
> +++ b/arch/loongarch/kernel/idle.c
> @@ -11,7 +11,6 @@
>
>  void __cpuidle arch_cpu_idle(void)
>  {
> -       raw_local_irq_enable();
> -       __arch_cpu_idle(); /* idle instruction needs irq enabled */
> +       __arch_cpu_idle();
>         raw_local_irq_disable();
>  }
> diff --git a/arch/loongarch/kernel/reset.c b/arch/loongarch/kernel/reset.=
c
> index 1ef8c6383535..d78e8a1064a1 100644
> --- a/arch/loongarch/kernel/reset.c
> +++ b/arch/loongarch/kernel/reset.c
> @@ -20,6 +20,11 @@
>  void (*pm_power_off)(void);
>  EXPORT_SYMBOL(pm_power_off);
>
> +static __always_inline void native_halt(void)
> +{
> +       asm volatile("idle 0" : : : "memory");
> +}
Just use the inline assembly at the call sites, please.

Huacai

> +
>  void machine_halt(void)
>  {
>  #ifdef CONFIG_SMP
> @@ -32,9 +37,9 @@ void machine_halt(void)
>         pr_notice("\n\n** You can safely turn off the power now **\n\n");
>         console_flush_on_panic(CONSOLE_FLUSH_PENDING);
>
> -       while (true) {
> -               __arch_cpu_idle();
> -       }
> +       while (1) {
> +               native_halt();
> +       };
>  }
>
>  void machine_power_off(void)
> @@ -52,9 +57,9 @@ void machine_power_off(void)
>         efi.reset_system(EFI_RESET_SHUTDOWN, EFI_SUCCESS, 0, NULL);
>  #endif
>
> -       while (true) {
> -               __arch_cpu_idle();
> -       }
> +       while (1) {
> +               native_halt();
> +       };
>  }
>
>  void machine_restart(char *command)
> @@ -73,7 +78,7 @@ void machine_restart(char *command)
>         if (!acpi_disabled)
>                 acpi_reboot();
>
> -       while (true) {
> -               __arch_cpu_idle();
> -       }
> +       while (1) {
> +               native_halt();
> +       };
>  }
> --
> 2.48.1
>
