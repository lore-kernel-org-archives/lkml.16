Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A037D1DDC04
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 08:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744358678; cv=none; b=PeIVOwI3FC+GiK1Mc/93pmtKQjMHyrPu4R8WlT/gqjjibx9bFmUVAJXrBdBxT9FOleP01qbtUXC7JoeslyupQhMZ2NbskEjWSorFe3VOhXJ1H17d9TmAzWMH2w+V3lWJJ/B+4FSBSspY2bgHo17u0FcehoQGpsZqznh5/BTPCHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744358678; c=relaxed/simple;
	bh=rd9t4WCJQQ2mQXlGhme8jcXbXVqpab5P1pXLppiJikA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=om+hkHXD34o7FQaN02WK5xh6ovXYnJV5JAPhvmyjBWxd6iVQQZi+DPbekoP7EcAqhQlt3/ORJsksf+3NFTXGbDx3ZBuW1Z6CBz2+wBBkP4bECkknAdSCvZ19ipCx9BaC8C1NlxY2OX6fOIQ87AmkPu/EEVZlDwwj/UmT3xPmjNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=a8VGs2S4; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="a8VGs2S4"
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-86d377306ddso710723241.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 01:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1744358675; x=1744963475; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eL6mQhh76fyOvITqDMOePPOrdn2eCivxVT00/39k9KQ=;
        b=a8VGs2S4vRneclxC+ztvd8nZP9FpFDAocqEZBKNNG3dyb2ZV4Y0ogs3U2ww+Cex2EC
         jsQUoYo9HMgxzAswNDia6WW6KTj3Id7eNEjqHbtYzCeLgB7dXjKxNFH9vd0a9hQPgj1G
         wY8baw/xHAd0KA+Gptr/QUGGrCoNsc5dFlHtMDCjc9iHZERgEvyqpGhz9WV2jXdftxd8
         C0BcnZzSZ3vmfrdpeA4Fwfj7Ju29E7W+v5D3aIf18x431jo/4kaVo+0Yq9sQqRFgGJLr
         Yh3hqztg7Jnu1+eOYrpCkxBEB1z+EIXdFMUTOV/jiMTsTE1LkYxY4i1JBT+GY2mYDlAF
         GFYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744358675; x=1744963475;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eL6mQhh76fyOvITqDMOePPOrdn2eCivxVT00/39k9KQ=;
        b=N8j5SkErpb4Fu2o48To9itUMtZu/z9SuvmH1FC83vRsd15ngTtcdwdxeCOKsgEX1nS
         WHteSicsGi3S7mTQAsETC1vesAbwZuO6GW2UdFGFHXYFJfALkUg8XtsOpRPIeSVRdnYk
         kVKDJWozgA7Bpf4xE41rySZFOn6OUDXjlVQd43GSj2Jony2PTJqx1EZot2rwX3X1DSXq
         L0RRntBL/UOf+u/Sb1nN4h4kAgny1u2X4w/km6EM1+GQDYoGDSmw5G64D49ySyr21qUJ
         Sx2bZMkCN9lmUD4E+WbF0eVoWow8tBPMA9QGrorcoolTsxmntVaqRA0V2FQOXIUFRejN
         Yrlw==
X-Gm-Message-State: AOJu0YzQ8TIqIRH4bbhgDND/3zY6OkN1UNSQmqwsgHTBRlxt4svVxYcM
	5C0OOGEHZBC9i8w3W9Ac9kxQ9wbjxnSlKDE5cIG2FVzEupTRA/fP7l3u0xA5Azjx7jtRO3hARg9
	gUQ79tZwYIR4tXCJ+nEU3ANXnX/bBHdD7WqlnsA==
X-Gm-Gg: ASbGncsMTvIHoIEvKTYxT+2PclLsC7qKQltXHGjQ/uGSrk0p5bMAAm7+JYALAYqrnoP
	1eakFaRx9gL6QqZxUkyS/rfPrYLKpOmBE6por56ei802xC16kExDMdJQQJvXgH4m/2IQU+Jn/kI
	WrF81DXkdp3vgsZIOCvmGVLyG4ivKNndGxjXdoNMQ1W5ztq6vwJ7+scMCtjUt/IMLf/+Q=
X-Google-Smtp-Source: AGHT+IFS+vDPSsUy3KBR+YuGEKwg0Uf3ZoAvbd0MVCMxEojLhJBnmjz9Np5nkTvKpK/n9aULedLJ1qS+Z07+mWcOA8o=
X-Received: by 2002:a05:6102:5487:b0:4ba:9923:fa57 with SMTP id
 ada2fe7eead31-4c9e4f1f22amr855491137.15.1744358675331; Fri, 11 Apr 2025
 01:04:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250411073850.3699180-1-nylon.chen@sifive.com>
 <20250411073850.3699180-3-nylon.chen@sifive.com> <992e3135-0c55-403c-9f71-d76c59cec75b@rivosinc.com>
In-Reply-To: <992e3135-0c55-403c-9f71-d76c59cec75b@rivosinc.com>
From: Nylon Chen <nylon.chen@sifive.com>
Date: Fri, 11 Apr 2025 16:04:23 +0800
X-Gm-Features: ATxdqUGn2A6qXgf2-HkGrf1A-Gq8MHEb_wirNKnK1k9VoLh8b2bfH0MqDkKbStk
Message-ID: <CAHh=Yk9RrUDi+73QAYgjBhMOzKKznq9NGwRCo_GkbYZwi4cuuQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: misaligned: fix sleeping function called
 during misaligned access handling
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, charlie@rivosinc.com, jesse@rivosinc.com, evan@rivosinc.com, 
	zhangchunyan@iscas.ac.cn, samuel.holland@sifive.com, zong.li@sifive.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Cl=C3=A9ment,

Thanks for your information

I will test your patch as well, and if no other issues arise,
I'll remove this change from the patchset in the next version

Thanks

Nylon
Cl=C3=A9ment L=C3=A9ger <cleger@rivosinc.com> =E6=96=BC 2025=E5=B9=B44=E6=
=9C=8811=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=883:37=E5=AF=AB=E9=81=
=93=EF=BC=9A
>
> Hi Nylon,
>
> I already have a pending fix for that bug which is to reenable
> interrupts while handling misaligned faults. Please see:
> https://lore.kernel.org/linux-riscv/20250317170625.1142870-12-cleger@rivo=
sinc.com/
>
> Thanks,
>
> Cl=C3=A9ment
>
> On 11/04/2025 09:38, Nylon Chen wrote:
> > Use copy_from_user_nofault() and copy_to_user_nofault() instead of
> > copy_from/to_user functions in the misaligned access trap handlers.
> >
> > The following bug report was found when executing misaligned memory
> > accesses:
> >
> > BUG: sleeping function called from invalid context at ./include/linux/u=
access.h:162
> > in_atomic(): 0, irqs_disabled(): 1, non_block: 0, pid: 115, name: two
> > preempt_count: 0, expected: 0
> > CPU: 0 UID: 0 PID: 115 Comm: two Not tainted 6.14.0-rc5 #24
> > Hardware name: riscv-virtio,qemu (DT)
> > Call Trace:
> >  [<ffffffff800160ea>] dump_backtrace+0x1c/0x24
> >  [<ffffffff80002304>] show_stack+0x28/0x34
> >  [<ffffffff80010fae>] dump_stack_lvl+0x4a/0x68
> >  [<ffffffff80010fe0>] dump_stack+0x14/0x1c
> >  [<ffffffff8004e44e>] __might_resched+0xfa/0x104
> >  [<ffffffff8004e496>] __might_sleep+0x3e/0x62
> >  [<ffffffff801963c4>] __might_fault+0x1c/0x24
> >  [<ffffffff80425352>] _copy_from_user+0x28/0xaa
> >  [<ffffffff8000296c>] handle_misaligned_store+0x204/0x254
> >  [<ffffffff809eae82>] do_trap_store_misaligned+0x24/0xee
> >  [<ffffffff809f4f1a>] handle_exception+0x146/0x152
> >
> > Fixes: b686ecdeacf6 ("riscv: misaligned: Restrict user access to kernel=
 memory")
> > Fixes: 441381506ba7 ("riscv: misaligned: remove CONFIG_RISCV_M_MODE spe=
cific code")
> >
> > Signed-off-by: Zong Li <zong.li@sifive.com>
> > Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
> > ---
> >  arch/riscv/kernel/traps_misaligned.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/t=
raps_misaligned.c
> > index d7275dfb6b7e..563f73f88fa8 100644
> > --- a/arch/riscv/kernel/traps_misaligned.c
> > +++ b/arch/riscv/kernel/traps_misaligned.c
> > @@ -455,7 +455,7 @@ static int handle_scalar_misaligned_load(struct pt_=
regs *regs)
> >
> >       val.data_u64 =3D 0;
> >       if (user_mode(regs)) {
> > -             if (copy_from_user(&val, (u8 __user *)addr, len))
> > +             if (copy_from_user_nofault(&val, (u8 __user *)addr, len))
> >                       return -1;
> >       } else {
> >               memcpy(&val, (u8 *)addr, len);
> > @@ -556,7 +556,7 @@ static int handle_scalar_misaligned_store(struct pt=
_regs *regs)
> >               return -EOPNOTSUPP;
> >
> >       if (user_mode(regs)) {
> > -             if (copy_to_user((u8 __user *)addr, &val, len))
> > +             if (copy_to_user_nofault((u8 __user *)addr, &val, len))
> >                       return -1;
> >       } else {
> >               memcpy((u8 *)addr, &val, len);
>
