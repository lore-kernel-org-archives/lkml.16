Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4554045C14
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 02:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739153979; cv=none; b=Gzgg1FWCTI5LbGOZsN2Ko+YZGn69yfacwi6jesUEVCUAzfloPgVWZY7rPABJoQnLynWupbLZt6O/voBhxJQ0MA35zYkC+XNrzb2BZVN1HK6gujioJHGX9uiDAACRWlhPn9sAdVfMqdvXipJXzpHiBHWRQI6pNTIwN7I/LwgpRG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739153979; c=relaxed/simple;
	bh=4HTD3ooncMdhirJI5DPzOhSlghZ3vjd2FascDwSbWyQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ltXiORc4gIauwI5keda/bFcNSZoO0msE13WGSL5O9PT+9ZkMwiuHWULFky++yPLUY4OBlawYXnqFarl5513xzkuozNUUVFsW3IhQutgEzxfvXNDIHNJpgL4GNrGwng5xcjuwwqTx6hipJroiJ85hlxzhfKJnbtjpBa+i8tV4K3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h5Vyy/rs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h5Vyy/rs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BED11C4CEE2
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 02:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739153978;
	bh=4HTD3ooncMdhirJI5DPzOhSlghZ3vjd2FascDwSbWyQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=h5Vyy/rsw/RgWPy6j/apw2DcNpXMpv6WLDCXBLGnSYjSdlKi4U0aOdMIGI1jqERMm
	 AMQPSDX+VRbaK/XtyAdO/APjdbskT7ZuTjNqpHNLbXQDLkDcVK3CPWMnoVFL3oJ7LE
	 RM0m8YmG1LsUQypXnXoBTNjoOGWS89LUEMZrI89KDxTVQKeX1tBFFY5OHb9ZQ13PBk
	 ilo+mFtwlz6/Eh13TzDj5ezhPd0GkwBYCFHXqve8hg41wH7z7yRz5a8MNW0eOJDJIW
	 Ou/kPGKKcg4YysP6P2FyeNzCXIb0/5PDOCxZDdpIITpap6Vgq9iuNleAnVDS6G3AqY
	 B0jMGpRV1IR6A==
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ab78e6edb99so340916966b.2
        for <linux-kernel@vger.kernel.org>; Sun, 09 Feb 2025 18:19:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVhwaCH7RCOa3sHebKKLX1JSmLIjcl/D32sOIVOgZkuCUJeQw1jbkLz+n6jWq73S1HQVqzVGdH80ZyNKCM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkuY6OjIi4UmDnunmtwv5u8mDJhlp7uXv7TLkfCQHKOyYJILXL
	NgnBkbf/rTaU0c26EcLwdlv2NeEmRnFDowoEbhsKP181vYEtK44rHragZZI/QYHUOdEkn0Hqsyq
	hNXOnylCBHHxE4DtP5Dq49/+67gU=
X-Google-Smtp-Source: AGHT+IEztfayE9CcsBJj6sqPC4ZJUYNfPmFkGapzICbbUDZt6wQAQZHBUoyLSudEa/U8Arthi1tUm9fOLpHEAd7LvUg=
X-Received: by 2002:a17:907:d50e:b0:ab7:c352:62b5 with SMTP id
 a640c23a62f3a-ab7c3526536mr183441566b.26.1739153977315; Sun, 09 Feb 2025
 18:19:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250208101924.20743-1-marco.crivellari@suse.com> <20250208101924.20743-2-marco.crivellari@suse.com>
In-Reply-To: <20250208101924.20743-2-marco.crivellari@suse.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 10 Feb 2025 10:19:27 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4hdCXwZ=x2_8d1dMZmO8c7XBnzovuVDhrSQ_cW0abmEg@mail.gmail.com>
X-Gm-Features: AWEUYZnXklp7aAxb5Ss_sH7kaM9XCYM12BZvPPPenNF9F8jA9AoEWiojw_8iHic
Message-ID: <CAAhV-H4hdCXwZ=x2_8d1dMZmO8c7XBnzovuVDhrSQ_cW0abmEg@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] [PATCH] loongson: Fix idle VS timer enqueue
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	WANG Xuerui <kernel@xen0n.name>, Frederic Weisbecker <frederic@kernel.org>, 
	Jinyang He <hejinyang@loongson.cn>, Tiezhu Yang <yangtiezhu@loongson.cn>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Bibo Mao <maobibo@loongson.cn>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Marco,

Don't care about the lkp robot, I have queued this patch with some
small modifications.
https://github.com/chenhuacai/linux/commit/a8aa673ea46c03b3f62992ffa4ffe810=
ac84f6e3

Huacai

On Sat, Feb 8, 2025 at 6:19=E2=80=AFPM Marco Crivellari
<marco.crivellari@suse.com> wrote:
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
> Cc: WANG Xuerui <kernel@xen0n.name>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
> Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
> ---
>  arch/loongarch/kernel/genex.S | 31 +++++++++++++++++--------------
>  arch/loongarch/kernel/idle.c  |  3 +--
>  arch/loongarch/kernel/reset.c | 18 +++++++++---------
>  3 files changed, 27 insertions(+), 25 deletions(-)
>
> diff --git a/arch/loongarch/kernel/genex.S b/arch/loongarch/kernel/genex.=
S
> index 86d5d90ebefe..9623298a5cf1 100644
> --- a/arch/loongarch/kernel/genex.S
> +++ b/arch/loongarch/kernel/genex.S
> @@ -18,28 +18,31 @@
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
> +       ori             t0, zero, CSR_CRMD_IE
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
> +       /* 3 instructions idle interrupt region */
> +       ori     t0, t0, 0x0c
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
> index 1ef8c6383535..8fd8c44b02cb 100644
> --- a/arch/loongarch/kernel/reset.c
> +++ b/arch/loongarch/kernel/reset.c
> @@ -32,9 +32,9 @@ void machine_halt(void)
>         pr_notice("\n\n** You can safely turn off the power now **\n\n");
>         console_flush_on_panic(CONSOLE_FLUSH_PENDING);
>
> -       while (true) {
> -               __arch_cpu_idle();
> -       }
> +       while (1) {
> +               asm volatile("idle 0" : : : "memory");
> +       };
>  }
>
>  void machine_power_off(void)
> @@ -52,9 +52,9 @@ void machine_power_off(void)
>         efi.reset_system(EFI_RESET_SHUTDOWN, EFI_SUCCESS, 0, NULL);
>  #endif
>
> -       while (true) {
> -               __arch_cpu_idle();
> -       }
> +       while (1) {
> +               asm volatile("idle 0" : : : "memory");
> +       };
>  }
>
>  void machine_restart(char *command)
> @@ -73,7 +73,7 @@ void machine_restart(char *command)
>         if (!acpi_disabled)
>                 acpi_reboot();
>
> -       while (true) {
> -               __arch_cpu_idle();
> -       }
> +       while (1) {
> +               asm volatile("idle 0" : : : "memory");
> +       };
>  }
> --
> 2.48.1
>
