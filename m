Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A5820409A
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 05:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745906269; cv=none; b=hrfgx0+GBUyG93yxme4myUci7Q5dr+3PwBtzkvcdiMjd2QgZE8mtbl8uk5MrfYhKs4zLLqMWsEx12VFK1Llzt6+Dnv2MNadvJ+8gzagGpKn50+xJz/pQ/pv1PHzS98tk79NH3cjCraeVO6u7nye/k56gYPMFdovJ2nZWu2/Tpyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745906269; c=relaxed/simple;
	bh=T8fcm7eC8YmEpxy3PM36AvU9jbHRvcBo3b5n4O/HwjY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jXUeS5uWFqdgKxIM5TrU5vIJ0NR/kGABR9QYYV4Qi6Snj2URDNSpdb4+9TkTa5suNr7mEoa0Gy0XRd35MSG8tDXef2HzJLW0lOQ42K4o00XwCXY6TP39o+xUfA2v4ulkN+no+MPQCT6EIy50OgqJxyek+orZQwMdI7CEc5rVkl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=LpOEpkyi; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="LpOEpkyi"
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-523de5611a3so2101695e0c.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 22:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1745906266; x=1746511066; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ddti0n2S/jg8OKWHEcLbUee9AuMJvWjvjNHUetZZSfw=;
        b=LpOEpkyiyyH0tu6DIukr1bYA1O0sbMudj7fqgK7z2nnQpaE4Dgxtz26GKeIL12YGbA
         ZE9dvXzwnI6PziTUjiG0XoH3jicZbKA2HlZwGJSSkJqUwqyeaE10OcYcjRYssECyrO+t
         pA7MpEZcvwG3vXS4gNrrCICjM07LVoyNNxFrzNQIBPd3rZcVY7JBJmioIGXkFbuub0ow
         /eoWFfN7FFlVmykBx4nGaNbz4Of7dongfAzAL/1kmZWfJNftux6tz2BTzRfC5iaSx3tV
         j6jVE3WPxs2acXlDUrwPw0xd7RYI6Rqq0se9Z8swVrGBwyHod0qMlQJNGIp/xGs5oaBo
         ZbXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745906266; x=1746511066;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ddti0n2S/jg8OKWHEcLbUee9AuMJvWjvjNHUetZZSfw=;
        b=rJZo/HJNH0ZodaYliVMrvPmdIhEuhhdrKnOsd5hzomZLn1kQETF3R9nosgYxojWVkQ
         2tkvNl+6IDql52J0vrM56GIzl975EiJKdyR0BidQGueNeQSXVyJWNK8A+Vo3byO3zKJ1
         gpzFvOldouFKfNRSJomYY86wEHO42vPrR3LAuVkP4mmqtRdxBHB2MbaoppiRR+hmD4wP
         qZajOtOZMcLQtEcxEmTDODyTwtweV3XiygvSzRG1aQPTP5xObPXGyQ0PL4PuRRLtId4L
         jeVYCF6adREwMskfGDWCAZGrm5sZQBG87Zj8MjN7GHMGr4LeSmYPOr8WqVt4RgEJe2OG
         KZSA==
X-Forwarded-Encrypted: i=1; AJvYcCUQfyO47CEaLc7ncjZplwYHUYRn34KL0KIX4axjqHDPe04QG9vtIJSvLexNCRuZUMR3QmVCtKdSljO9mUg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5BW5PZpJ+WQShE27GwhO7FNkqSdCilgsu2OoMM6vNjBlXSV+H
	Tdluk32WGK0fh4j44CYVyt7JohhrXg/gfrbPV3jPbW83Bq5pG4qCZTApjuy+kYtzliWz5b1DSha
	FEDeRYvQHxf0rTa7nJ1I+WQOS6G3ogdX6dTpBIQ==
X-Gm-Gg: ASbGncsPb4pabRC2GvAFFLLBSO03JaXW6R2lk3izYBvfgRro4lB6m4Syiz0mTC74und
	rVFimI6QZnQaOurQPrVcVgvWKQ7wJt139CXNfdpOD0uaK48LIVD6JOYM8Ktdn5VaF37kukXB/+t
	u/7Za4pnZiLiKZsy+aGlj9gjXlRTuTQu2W
X-Google-Smtp-Source: AGHT+IEn/oEoK2xnjuBCKAEyj5Yho5ISKK7oYum7pkkABBkOq83roFDelFUJbx9DNm+6+i9//ldDZwxd9vW6Vmp0QlI=
X-Received: by 2002:a05:6102:15a3:b0:4c4:f128:3acf with SMTP id
 ada2fe7eead31-4d641f63966mr7068795137.16.1745906266057; Mon, 28 Apr 2025
 22:57:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250411073850.3699180-1-nylon.chen@sifive.com>
 <20250411073850.3699180-3-nylon.chen@sifive.com> <992e3135-0c55-403c-9f71-d76c59cec75b@rivosinc.com>
 <22a2c734-b446-4b1e-a2bc-a0080656fe29@ghiti.fr> <f4be063b-f321-45d4-9891-b50f30beb1ef@rivosinc.com>
In-Reply-To: <f4be063b-f321-45d4-9891-b50f30beb1ef@rivosinc.com>
From: Nylon Chen <nylon.chen@sifive.com>
Date: Tue, 29 Apr 2025 13:57:35 +0800
X-Gm-Features: ATxdqUE3DFeyNUfNMa05FUInNcAHiDlHwf0FR6F-MXEQ4WqvB3Vh02exsh8mq4c
Message-ID: <CAHh=Yk-jk-KzDK_kJTbGi8HOZqsUPZjdGN8eF_op=HKF2V-Udw@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: misaligned: fix sleeping function called
 during misaligned access handling
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, charlie@rivosinc.com, jesse@rivosinc.com, 
	evan@rivosinc.com, zhangchunyan@iscas.ac.cn, samuel.holland@sifive.com, 
	zong.li@sifive.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Cl=C3=A9ment,

Thank you for sharing your patch. I=E2=80=99ve reviewed the changes, but I=
=E2=80=99m
not sure I fully grasp the design rationale.
Could you please briefly explain the main considerations behind this
modification?

We=E2=80=99re also discussing internally the differences between my _nofaul=
t
approach and your IRQ-enable approach, and I=E2=80=99d appreciate your
perspective on the pros and cons of each.

Looking forward to your suggestions!

Nylon

Cl=C3=A9ment L=C3=A9ger <cleger@rivosinc.com> =E6=96=BC 2025=E5=B9=B44=E6=
=9C=8811=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=884:38=E5=AF=AB=E9=81=
=93=EF=BC=9A
>
>
>
> On 11/04/2025 10:35, Alexandre Ghiti wrote:
> > Hi Cl=C3=A9ment,
> >
> > On 11/04/2025 09:36, Cl=C3=A9ment L=C3=A9ger wrote:
> >> Hi Nylon,
> >>
> >> I already have a pending fix for that bug which is to reenable
> >> interrupts while handling misaligned faults. Please see:
> >> https://lore.kernel.org/linux-riscv/20250317170625.1142870-12-
> >> cleger@rivosinc.com/
> >
> >
> > Can you extract this fix from the series so that it can be merged in 6.=
15?
>
> Hi Alex,
>
> Yes sure, I can send a small series as well. However, I'd like the
> associated kselftest to be reviewed since it would allow to catch such
> behavior (there is no test for misaligned delegation yet).
>
> Thanks,
>
> Cl=C3=A9ment
>
> >
> > Thanks,
> >
> > Alex
> >
> >
> >>
> >> Thanks,
> >>
> >> Cl=C3=A9ment
> >>
> >> On 11/04/2025 09:38, Nylon Chen wrote:
> >>> Use copy_from_user_nofault() and copy_to_user_nofault() instead of
> >>> copy_from/to_user functions in the misaligned access trap handlers.
> >>>
> >>> The following bug report was found when executing misaligned memory
> >>> accesses:
> >>>
> >>> BUG: sleeping function called from invalid context at ./include/
> >>> linux/uaccess.h:162
> >>> in_atomic(): 0, irqs_disabled(): 1, non_block: 0, pid: 115, name: two
> >>> preempt_count: 0, expected: 0
> >>> CPU: 0 UID: 0 PID: 115 Comm: two Not tainted 6.14.0-rc5 #24
> >>> Hardware name: riscv-virtio,qemu (DT)
> >>> Call Trace:
> >>>   [<ffffffff800160ea>] dump_backtrace+0x1c/0x24
> >>>   [<ffffffff80002304>] show_stack+0x28/0x34
> >>>   [<ffffffff80010fae>] dump_stack_lvl+0x4a/0x68
> >>>   [<ffffffff80010fe0>] dump_stack+0x14/0x1c
> >>>   [<ffffffff8004e44e>] __might_resched+0xfa/0x104
> >>>   [<ffffffff8004e496>] __might_sleep+0x3e/0x62
> >>>   [<ffffffff801963c4>] __might_fault+0x1c/0x24
> >>>   [<ffffffff80425352>] _copy_from_user+0x28/0xaa
> >>>   [<ffffffff8000296c>] handle_misaligned_store+0x204/0x254
> >>>   [<ffffffff809eae82>] do_trap_store_misaligned+0x24/0xee
> >>>   [<ffffffff809f4f1a>] handle_exception+0x146/0x152
> >>>
> >>> Fixes: b686ecdeacf6 ("riscv: misaligned: Restrict user access to
> >>> kernel memory")
> >>> Fixes: 441381506ba7 ("riscv: misaligned: remove CONFIG_RISCV_M_MODE
> >>> specific code")
> >>>
> >>> Signed-off-by: Zong Li <zong.li@sifive.com>
> >>> Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
> >>> ---
> >>>   arch/riscv/kernel/traps_misaligned.c | 4 ++--
> >>>   1 file changed, 2 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/
> >>> kernel/traps_misaligned.c
> >>> index d7275dfb6b7e..563f73f88fa8 100644
> >>> --- a/arch/riscv/kernel/traps_misaligned.c
> >>> +++ b/arch/riscv/kernel/traps_misaligned.c
> >>> @@ -455,7 +455,7 @@ static int handle_scalar_misaligned_load(struct
> >>> pt_regs *regs)
> >>>         val.data_u64 =3D 0;
> >>>       if (user_mode(regs)) {
> >>> -        if (copy_from_user(&val, (u8 __user *)addr, len))
> >>> +        if (copy_from_user_nofault(&val, (u8 __user *)addr, len))
> >>>               return -1;
> >>>       } else {
> >>>           memcpy(&val, (u8 *)addr, len);
> >>> @@ -556,7 +556,7 @@ static int handle_scalar_misaligned_store(struct
> >>> pt_regs *regs)
> >>>           return -EOPNOTSUPP;
> >>>         if (user_mode(regs)) {
> >>> -        if (copy_to_user((u8 __user *)addr, &val, len))
> >>> +        if (copy_to_user_nofault((u8 __user *)addr, &val, len))
> >>>               return -1;
> >>>       } else {
> >>>           memcpy((u8 *)addr, &val, len);
> >>
> >> _______________________________________________
> >> linux-riscv mailing list
> >> linux-riscv@lists.infradead.org
> >> http://lists.infradead.org/mailman/listinfo/linux-riscv
>
