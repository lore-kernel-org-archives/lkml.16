Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B437F80BFF
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 10:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738923489; cv=none; b=YiNk4jpE7anrvzORftCwfSCbm48VU3vH4YiyGZZzLU+847AMPJsId/KgHUut1onsUHQkYryGJLu3LZSS4TcCPqBwtWOXlfKSG4Lp1OdY/yRgwtemBDMmSVoAT74hC3KaVP8CcUQDUYifYPVbCe/arej8aUrArgpIJzm5Nr7HlLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738923489; c=relaxed/simple;
	bh=c0WxsmcS6VqWtHyDP6uE7vTyb2bmPhdRN9iyw4sMqk8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kadmsDkXQRKap3uiGy6Q79JA6uVvGhaOILeTs69zHYtkdUk5adfdaqcW4Kfo6qnsdSAzHEBhGMHCzkQFuUK7mC2XRZEQ4Z/A64oubZ2VeGVjDipGTnK0dzO7LPGnXyttGz2r++AwCBbwqd3W5GJGV3cLjWDCyh3MDVNCD29Dc74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Q6dg2f8i; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Q6dg2f8i"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-544fee2f3d6so116592e87.2
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 02:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738923485; x=1739528285; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gZVbV0fJ8rzGP58znk4w2olwzKLwS/3wABtsgUGND4k=;
        b=Q6dg2f8iOtHAMjVC008mXIgL9BS74vvQzsql4MFlBfpWUSiZwNSCIGT2g8cKxhm5hp
         be+/BKYL0r8OBpxsuEuu7X82Rd8atcl0Xc7BcwlCY6rx+8JcF5n1kbl+AUPZxcBo4dGh
         HJNqOELIJaPWOsVFXJGG48b1x1AhFn7ScPkIziznfsNcuJ8d6cXNAtb+RgnYgLoqz89W
         OL5bWzfapJ/u+Yma5EAR/kNuTWnasXV8SM+/82tKI6d0sx14mdsNra/3OPSXG3NrobId
         l9skkpSnbUD5th1+lsIIiHUnZhiZjrq+60/8g5DMFWM+sl+XEc7ltjLNkTOifn5Py3fW
         4LuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738923485; x=1739528285;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gZVbV0fJ8rzGP58znk4w2olwzKLwS/3wABtsgUGND4k=;
        b=XvNOsfEyg6Y9Rq35dLD4X2udx2PHnPoyij3sbzaCu+tHsvossbunapj9+eKMDcDSFE
         D1d3RHSfz3wY1u7m6WUacaZqJlX58KFXY1sTYJcpbEyaLJDAzl6kdqdQ17IrkB8EfWoc
         B8sZmkvWQ8Nm0yhd06rYt0lNQ29qs2pRPf8j1L83d9Yye/Gmzn0+iTCD0H0Hej8E++6A
         j9iwso0Q86ydIqFOvWa7QfngA9wZpvrf6NgaugdkOuKrD47P5ohTHMPR6nb46ch9uRix
         3Cpf3tiJrEdZVSjb5yvwqCqnfSjFY/6++Vo/Yb1YIuOEJ6tuI0lCyFnoewqw2r6bNH/X
         Okyg==
X-Forwarded-Encrypted: i=1; AJvYcCWydbzPmOhzyUj+eOcaSfxK5zCTZGD0Uj/8pw3n4GfU3mAlE6ZBEip2ao2k69PVNnkrbVR6lhqIIyCwKVQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YybJIKJUz2jOgcGrUsc3BZfbV66W1/5DtnnIz48EcuPdpRWNt59
	QiQFJjvxshtX9y9uoi14uRWhJqkEbN+cNwdRTD+VbjTxkwl0fRpJ+87eFdKvapEh+9oFia387GY
	w94pAHbdD19wNnl4r+VXkfwYQ9LwrWWhADv0uTA==
X-Gm-Gg: ASbGnctL461eC5KW5Sr/H3pCU7tNpQefqUOiFR+3jkujH+Oh7kAjWHhsXpyEHGv51Le
	RkibIfsK5RQ8stQXXkf64T+9T5tUfcUh82aK+zW3YTJbbhHOaBpVrU0XleUeEhB5hTPm2wS22bI
	nKo1F5JrGJEoy9kueMryHuOPlKqezOOA==
X-Google-Smtp-Source: AGHT+IF21IsAzWhpR5p2NHSp8V3OS3ChVHJCFguwsDWOw/sE2kVxiCOt5IXpmD4JG6Xqntc5CC6ztpAIZktAcjTxWEY=
X-Received: by 2002:a05:6512:e9b:b0:542:250d:eefb with SMTP id
 2adb3069b0e04-54414ae0be0mr820419e87.41.1738923484716; Fri, 07 Feb 2025
 02:18:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206162922.3028861-1-marco.crivellari@suse.com>
 <20250206162922.3028861-2-marco.crivellari@suse.com> <CAAhV-H6OKwmxhF_iWJEc8OEZ==h8dTdorTwkE8oMUMWAbU6xeg@mail.gmail.com>
In-Reply-To: <CAAhV-H6OKwmxhF_iWJEc8OEZ==h8dTdorTwkE8oMUMWAbU6xeg@mail.gmail.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Fri, 7 Feb 2025 11:17:53 +0100
X-Gm-Features: AWEUYZm6FVrsl-6Ur_Zp3GbcpOnNF02ipK__txH-fRt4YMDGiFgocgI9DgH2gIc
Message-ID: <CAAofZF4w2KBJHTA+ufAA-4L5OXGyNxnG+d3YOoQG68gZ86Af6w@mail.gmail.com>
Subject: Re: [PATCH] loongson: Fix idle VS timer enqueue
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	bibo mao <maobibo@loongson.cn>, WANG Xuerui <kernel@xen0n.name>, 
	Tiezhu Yang <yangtiezhu@loongson.cn>, Frederic Weisbecker <frederic@kernel.org>, 
	Youling Tang <tangyouling@loongson.cn>, Peter Zijlstra <peterz@infradead.org>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Thanks for your replies!
I will make a new version with the aforementioned changes.

Marco


On Fri, Feb 7, 2025 at 9:18=E2=80=AFAM Huacai Chen <chenhuacai@kernel.org> =
wrote:
>
> Hi, Marco,
>
> Thank you for your patch, the logic is correct but the code can be improv=
ed.
>
> On Fri, Feb 7, 2025 at 12:30=E2=80=AFAM Marco Crivellari
> <marco.crivellari@suse.com> wrote:
> >
> > From: Peter Zijlstra <peterz@infradead.org>
> >
> > Loongson re-enables interrupts on its idle routine and performs a
> > TIF_NEED_RESCHED check afterwards before putting the CPU to sleep.
> >
> > The IRQs firing between the check and the idling instruction may set th=
e
> > TIF_NEED_RESCHED flag. In order to deal with the such a race, IRQs
> > interrupting __arch_cpu_idle() rollback their return address to the
> > beginning of __arch_cpu_idle() so that TIF_NEED_RESCHED is checked
> > again before going back to sleep.
> >
> > However idle IRQs can also queue timers that may require a tick
> > reprogramming through a new generic idle loop iteration but those timer=
s
> > would go unnoticed here because __arch_cpu_idle() only checks
> > TIF_NEED_RESCHED. It doesn't check for pending timers.
> >
> > Fix this with fast-forwarding idle IRQs return value to the end of the
> > idle routine instead of the beginning, so that the generic idle loop
> > handles both TIF_NEED_RESCHED and pending timers.
> >
> > Fixes: 0603839b18f4 ("LoongArch: Add exception/interrupt handling")
> > Not-yet-signed-off-by: Peter Zijlstra <peterz@infradead.org>
> > Cc: WANG Xuerui <kernel@xen0n.name>
> > Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
> > Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
> > ---
> >  arch/loongarch/kernel/genex.S | 33 +++++++++++++++++++--------------
> >  arch/loongarch/kernel/idle.c  |  3 +--
> >  arch/loongarch/kernel/reset.c | 23 ++++++++++++++---------
> >  3 files changed, 34 insertions(+), 25 deletions(-)
> >
> > diff --git a/arch/loongarch/kernel/genex.S b/arch/loongarch/kernel/gene=
x.S
> > index 86d5d90ebefe..ab2e9a262ee2 100644
> > --- a/arch/loongarch/kernel/genex.S
> > +++ b/arch/loongarch/kernel/genex.S
> > @@ -18,28 +18,33 @@
> >
> >         .align  5
> >  SYM_FUNC_START(__arch_cpu_idle)
> > -       /* start of rollback region */
> > -       LONG_L  t0, tp, TI_FLAGS
> > -       nop
> > -       andi    t0, t0, _TIF_NEED_RESCHED
> > -       bnez    t0, 1f
> > -       nop
> > -       nop
> > -       nop
> > +       /* start of idle interrupt region */
> > +       li.w    t0, CSR_CRMD_IE
> It is better to replace it with "ori t0, zero, CSR_CRMD_IE", ensuring
> single instruction.
>
> > +       /* idle instruction needs irq enabled */
> > +       csrxchg t0, t0, LOONGARCH_CSR_CRMD
> > +       /*
> > +        * If an interrupt lands here; between enabling interrupts abov=
e and
> > +        * going idle on the next instruction, we must *NOT* go idle si=
nce the
> > +        * interrupt could have set TIF_NEED_RESCHED or caused an timer=
 to need
> > +        * reprogramming. Fall through -- see handle_vint() below -- an=
d have
> > +        * the idle loop take care of things.
> > +        */
> >         idle    0
> > -       /* end of rollback region */
> > -1:     jr      ra
> > +       nop
> Remove the "nop", of course it should be together with the later modifica=
tion.
>
> > +       /* end of idle interrupt region */
> > +SYM_INNER_LABEL(__arch_cpu_idle_exit, SYM_L_LOCAL)
> > +       jr      ra
> >  SYM_FUNC_END(__arch_cpu_idle)
> >
> >  SYM_CODE_START(handle_vint)
> >         UNWIND_HINT_UNDEFINED
> >         BACKUP_T0T1
> >         SAVE_ALL
> > -       la_abs  t1, __arch_cpu_idle
> > +       la_abs  t1, __arch_cpu_idle_exit
> >         LONG_L  t0, sp, PT_ERA
> > -       /* 32 byte rollback region */
> > -       ori     t0, t0, 0x1f
> > -       xori    t0, t0, 0x1f
> > +       /* 16 byte idle interrupt region */
> > +       ori     t0, t0, 0x0f
> > +       addi.d  t0, t0, 1
> Replace these two instructions with "ori t0, t0, 0xc", and "16 bytes"
> can be replaced with "3 instructions".
>
> >         bne     t0, t1, 1f
> >         LONG_S  t0, sp, PT_ERA
> >  1:     move    a0, sp
> > diff --git a/arch/loongarch/kernel/idle.c b/arch/loongarch/kernel/idle.=
c
> > index 0b5dd2faeb90..54b247d8cdb6 100644
> > --- a/arch/loongarch/kernel/idle.c
> > +++ b/arch/loongarch/kernel/idle.c
> > @@ -11,7 +11,6 @@
> >
> >  void __cpuidle arch_cpu_idle(void)
> >  {
> > -       raw_local_irq_enable();
> > -       __arch_cpu_idle(); /* idle instruction needs irq enabled */
> > +       __arch_cpu_idle();
> >         raw_local_irq_disable();
> >  }
> > diff --git a/arch/loongarch/kernel/reset.c b/arch/loongarch/kernel/rese=
t.c
> > index 1ef8c6383535..d78e8a1064a1 100644
> > --- a/arch/loongarch/kernel/reset.c
> > +++ b/arch/loongarch/kernel/reset.c
> > @@ -20,6 +20,11 @@
> >  void (*pm_power_off)(void);
> >  EXPORT_SYMBOL(pm_power_off);
> >
> > +static __always_inline void native_halt(void)
> > +{
> > +       asm volatile("idle 0" : : : "memory");
> > +}
> Just use the inline assembly at the call sites, please.
>
> Huacai
>
> > +
> >  void machine_halt(void)
> >  {
> >  #ifdef CONFIG_SMP
> > @@ -32,9 +37,9 @@ void machine_halt(void)
> >         pr_notice("\n\n** You can safely turn off the power now **\n\n"=
);
> >         console_flush_on_panic(CONSOLE_FLUSH_PENDING);
> >
> > -       while (true) {
> > -               __arch_cpu_idle();
> > -       }
> > +       while (1) {
> > +               native_halt();
> > +       };
> >  }
> >
> >  void machine_power_off(void)
> > @@ -52,9 +57,9 @@ void machine_power_off(void)
> >         efi.reset_system(EFI_RESET_SHUTDOWN, EFI_SUCCESS, 0, NULL);
> >  #endif
> >
> > -       while (true) {
> > -               __arch_cpu_idle();
> > -       }
> > +       while (1) {
> > +               native_halt();
> > +       };
> >  }
> >
> >  void machine_restart(char *command)
> > @@ -73,7 +78,7 @@ void machine_restart(char *command)
> >         if (!acpi_disabled)
> >                 acpi_reboot();
> >
> > -       while (true) {
> > -               __arch_cpu_idle();
> > -       }
> > +       while (1) {
> > +               native_halt();
> > +       };
> >  }
> > --
> > 2.48.1
> >



--
