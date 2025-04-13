Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E862940D
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 02:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744510958; cv=none; b=GcKO7xhOIAezu26d4t7cJWs7wPES4BhrMujRjpfMJjqS7SU/YXezUS03sRc3aRDkrdAQy+0Wa+JkSAEldh3D1w5ReS4vYsbRZgk5DKsuLjJavjRE/L59+7vrXZK315NlxdLrdqdTJjmmmU7mcwahJ5+HS6ft8KRl9mclHT1hqF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744510958; c=relaxed/simple;
	bh=eg8zX3gnw5guGU4wvxS5VhO3Wye6cNDyMxnD5mfO7To=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ddg2Z/TjFJTfHZIgpoqjxhWe2p7pma1pwRizObJJXm0zq3wvetTlPn0D66vYRm1YRHsLs0wi2cIMPBFlE8XZ1oVDAD/WqxactaoqkA/E33GCmkyLbgfQQeY15HoNuWiV7p5H2Gc/1nxtOukaHnKjRnbwvvmJTIV49muTw6KuAIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XMDWDRow; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XMDWDRow"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E68AC4CEEA
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 02:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744510957;
	bh=eg8zX3gnw5guGU4wvxS5VhO3Wye6cNDyMxnD5mfO7To=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XMDWDRowKvAeVP100SMpR8hBzaUxZjeQFtIzkccMq7jg05yF3/usyVeEr44MU0A85
	 qGax9cxJyX2/q1X+R98/UGaMwr2hYFOTaa8K4McQd3eyoF1jd9PR+Sl58cKob1zIg2
	 Z5MTh+qfy0aruAA3jleaBpx2wG2mI8Bg4RY58OYK72i1GX1aWZz60el3mJZlsojFSC
	 6NKwE1JZB8s395HLxihqExZDERCoGEiaSwYdBTo6YVvxqLEJbOL2nqJwdoliY1fUY2
	 Xx0xJiTIcTiU+Kj/IzBWmOIQoqNcdbwt8ldHpTMjQB5NDqLHxP03DFz5eZBSZTILlS
	 9/sl1xLFm5ArA==
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5e686d39ba2so5836622a12.2
        for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 19:22:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWubdhFg8pG8kQ9bymsdWbUSfq3KYKPvRWJNbZFtx/PT17MQHShO/SggngeHeogZRg0gnm7ZreMbcRP7Ac=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/EYnECUS6CUEvKz1uTvzp0z6HAsH/Bg+90NhW5/SzT+FCwgNU
	dTk9qZNnPTDIeO4+OxKePLrx7zSAKQSn48Zlgz1HXOjuKrRia67+Zj6kEuzfqg2igMmRsOrqsnK
	cM0cKip4ZHdTaHGb5r+Feav9TwYU=
X-Google-Smtp-Source: AGHT+IHhXpI5vEqv+Wd2A/4RfkWqOK1gbnvDrr6xD6vV5AL9tVi2SCet9Rb7ZEOuxjq5d9c4ywjOOC2VdjhPoJrtGFM=
X-Received: by 2002:a17:906:c106:b0:ac7:c584:e691 with SMTP id
 a640c23a62f3a-acad36d9a9amr701386266b.54.1744510956098; Sat, 12 Apr 2025
 19:22:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408092756.22339-1-yangtiezhu@loongson.cn>
 <f83d1048-93f6-6c11-2c2a-98c1e1ea7e9d@loongson.cn> <0b5039c3-019b-fd3d-e822-5d2a52c4111d@loongson.cn>
 <56519aed-b23e-fece-3e91-f8db44da6d45@loongson.cn> <5c0db0f8-bab8-7cdb-172e-931658ed0548@loongson.cn>
In-Reply-To: <5c0db0f8-bab8-7cdb-172e-931658ed0548@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 13 Apr 2025 10:22:26 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4JmiNzDAhvXS+wppg1_HbO6KmRLGMXKBxiyybFsQQfog@mail.gmail.com>
X-Gm-Features: ATxdqUF9a9EuRvxEU9W_h2khwwXwaJg3tKtdgscv_RJ5490yh98FyVgTd6I2v1U
Message-ID: <CAAhV-H4JmiNzDAhvXS+wppg1_HbO6KmRLGMXKBxiyybFsQQfog@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Enhance robust of kprobe
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Jinyang He <hejinyang@loongson.cn>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Tiezhu,

On Fri, Apr 11, 2025 at 7:37=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> On 04/11/2025 12:46 PM, Jinyang He wrote:
> >
> > On 2025-04-11 10:48, Tiezhu Yang wrote:
> >> On 04/09/2025 10:17 AM, Jinyang He wrote:
> >>> On 2025-04-08 17:27, Tiezhu Yang wrote:
>
> ...
>
> > I have just explained the previous status may be broken by IRQ.
>
> The initial aim is to make sure the irq is disabled at the end of
> do_bp(), so let us narrow down the scope.
>
> > On the other hand, have you tried only fix do_bp weather cause hang?
> >
> > bool this_bp_ie =3D regs->csr_prmd & CSR_PRMD_PIE;
> > if (this_bp_ie)
> >   local_irq_enable();
> > ...
> > if (this_bp_ie)
> >   local_irq_disable();
>
> This is a good idea, thank you.
>
> I will test the following change, if it works well and no more comments,
> I will send v2 in the next week.
If it works, I think there is a more fundamental problem, all do_xyz()
should be fixed because PRMD may change during handling. And you can
use
bool pie =3D regs_irqs_disabled(regs)
instead of
bool pie =3D regs->csr_prmd & CSR_PRMD_PIE

Huacai

>
> ---8<---
> diff --git a/arch/loongarch/kernel/traps.c b/arch/loongarch/kernel/traps.=
c
> index 2ec3106c0da3..68cc4165578a 100644
> --- a/arch/loongarch/kernel/traps.c
> +++ b/arch/loongarch/kernel/traps.c
> @@ -710,11 +710,12 @@ asmlinkage void noinstr do_bce(struct pt_regs *regs=
)
>   asmlinkage void noinstr do_bp(struct pt_regs *regs)
>   {
>          bool user =3D user_mode(regs);
> +       bool pie =3D regs->csr_prmd & CSR_PRMD_PIE;
>          unsigned int opcode, bcode;
>          unsigned long era =3D exception_era(regs);
>          irqentry_state_t state =3D irqentry_enter(regs);
>
> -       if (regs->csr_prmd & CSR_PRMD_PIE)
> +       if (pie)
>                  local_irq_enable();
>
>          if (__get_inst(&opcode, (u32 *)era, user))
> @@ -780,7 +781,7 @@ asmlinkage void noinstr do_bp(struct pt_regs *regs)
>          }
>
>   out:
> -       if (regs->csr_prmd & CSR_PRMD_PIE)
> +       if (pie)
>                  local_irq_disable();
>
>          irqentry_exit(regs, state);
>
> Thanks,
> Tiezhu
>
>
