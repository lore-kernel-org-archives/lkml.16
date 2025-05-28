Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1F91632C8
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 16:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748449069; cv=none; b=LIr6I3riVfhc8ZFAlG/8Hx38fHU2wjCT5RpT5zJsNxnaHuYZVL4WjUJ5KClRuWKnDEUcxS+Kk8YbG1ZlIs4fII2U9vxQ5Sj52vVG76Xki/SIeRNppKbqygQ1CqbcXLz79/U5i0TZfAwSAVpVukxyOAUimg2T0zmMYaLl2b19Mao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748449069; c=relaxed/simple;
	bh=XQvIWAytjBtx5roMruaxdFWO06D+VdCxLVFPTEz9p4U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hU//y/smN7VQY8w/BPywa0vOpTCQRwDs07ck7fDuUUwg+e3y8j18UMsOZQiVLDdsEmjkdUxhF1aVwIdoBlZ4zwy+SE+EIc4MCFWKqeyEF+pKt66Wgh+/C4LZ809ek8uQLsvyQOg5P5ZoQv0aaU6uOpxtNXDsnOJDQwfD351YaXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UwJzwrgl; arc=none smtp.client-ip=209.85.166.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UwJzwrgl"
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-8644aa73dfcso100671039f.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 09:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748449066; x=1749053866; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uTzSLuw5Tgn9PujxmjAjgP7UtvlX2ja/Zjw4kSQsqdg=;
        b=UwJzwrgl3vvA4AQrmVbSI0timBluu6X22E/XaKWb0vkS6jDpY8Wc2ojq3E7uB4gT42
         bc62vmHVS7HFq4OOAxWPm0Rh1ORJ+MTVhdLWwnCBYWoICEZPC7mNbZIulw5GLBRh2+lK
         cC0HsyHe+Cec5fceuJxcoob9SpWkLqTg+U1rRvtK7wizwLDEkWKxpK5htDeudwzkE2kN
         GY+OA8DONSXXWDmJjzFWniOhjvpZPWqoxdy0eOuFBHKY8t1tsLkYRAbXYUjqnJPjnowG
         4SRpJt7dRHyPiFq43HYfEYDUb/yw2FwBPnuHAq/J0jjGXVujSWLTfZxcX4xe2wpzDPq6
         WkCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748449066; x=1749053866;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uTzSLuw5Tgn9PujxmjAjgP7UtvlX2ja/Zjw4kSQsqdg=;
        b=Z4ydEMUMkibhtTA7PIjG8Apq7T49cyqOx05dVQCjufUCzgzOJJLJGBsFJ19TFxsRV/
         41jSEA+/h/VXkN99LT3+seOGneb67/rvUVixOAjbYSzo4LctrC+jVcP4JE8FCSzy1Zny
         aksTjtTQFob0yGpO48xSCeR5wvoqrcpZdEJF1ygfSSQnSMaFHbTwra1ZcXpR+Xpe3O3P
         dz+qCHS+uGnZe4DjUNat2KcwZpTtVS9jUbZVQSJC/1xy3KhtViVcchv78LSXiQJqZl3O
         8+b3gm3vNZlh+HsLdebJnEpbkilYh4qRNzXw/dvrsTvrAtmYQRWqCIMTb5mbs2TVqk4f
         +NAw==
X-Forwarded-Encrypted: i=1; AJvYcCV+m/wnnxPCCWm+cH1fUPVARz6RRJP3x/idHZIA72/SIb/lnjffK9sdY+SfkSJcGiM48VXKVNKFeONwoi4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzdl059PEK9Z8dRQDTu4mHn0UT0sdY6HIjwKb3MBxLLldd2cWaK
	LwR2BgYxjy4XEDrsJzi3q26xEpdpwXM8G0/s+apMCSVIGFpuZTQTsaEvSwZnLJ2ESFZO0UTauVn
	/lbjsh7BJIro6A3xk2zet9drtY6xyBdTkoQ==
X-Gm-Gg: ASbGncu++klrs3XY/tnvg/xLGLpYcstOaObsiMbN9/aldmc3D7rbvVj7lxYIauwLRgl
	OWc9lQ3fiOnWViYdUV3OI03rTD9hezKXiPw6/BNRXKtlK1h0Y41n7uyXLWuJPSoonbhrZl4JYdm
	uIZhPDRV3BfYvbOWi5duQpSklCOn9M3lA=
X-Google-Smtp-Source: AGHT+IFF/umILiMgGZDGCLbJ5sT/qzWVOHlqk/6oUs0GExo2HD46i9Ov/em8Cdr+A78lOfG7WV8hw5tz0sQQvQ//DcA=
X-Received: by 2002:a17:90b:3ec6:b0:2fe:b774:3ec8 with SMTP id
 98e67ed59e1d1-3110f332a9cmr20114781a91.23.1748449055876; Wed, 28 May 2025
 09:17:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250522160954.429333-1-cyrilbur@tenstorrent.com> <2c07d65e-0641-42a0-9eb4-9e42d9325ff2@ghiti.fr>
In-Reply-To: <2c07d65e-0641-42a0-9eb4-9e42d9325ff2@ghiti.fr>
From: Andy Chiu <andybnac@gmail.com>
Date: Thu, 29 May 2025 00:17:24 +0800
X-Gm-Features: AX0GCFt9_AqO8_XbUCelsbyxCoWk63hdmjOhaTlGWY4wVu0fiMlfSByuwGx24k0
Message-ID: <CAFTtA3PATS2CT-jax7eTNS=ZqU55CwGr=TeGiNX16ztfp5v9_w@mail.gmail.com>
Subject: Re: [PATCH] riscv: uaccess: Only restore the CSR_STATUS SUM bit
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Cyril Bur <cyrilbur@tenstorrent.com>, samuel.holland@sifive.com, 
	ben.dooks@codethink.co.uk, palmer@dabbelt.com, linux-kernel@vger.kernel.org, 
	jszhang@kernel.org, paul.walmsley@sifive.com, charlie@rivosinc.com, 
	jrtc27@jrtc27.com, aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, 
	Deepak Gupta <debug@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 27, 2025 at 4:39=E2=80=AFAM Alexandre Ghiti <alex@ghiti.fr> wro=
te:
>
> +cc linux-riscv, Andy, Deepak
>
> On 5/22/25 18:09, Cyril Bur wrote:
> > During switch to csrs will OR the value of the register into the
> > corresponding csr. In this case we're only interested in restoring the
> > SUM bit not the entire register.
> >
> > Fixes: 788aa64c0 ("riscv: save the SR_SUM status over switches")
> > Signed-off-by: Cyril Bur <cyrilbur@tenstorrent.com>
> > ---
> > I've put the Fixes tag in but I assume this will get squashed into the
> > patch. Either way I hope this works to fix the immediate issue.
> >
> >   arch/riscv/kernel/entry.S | 12 ++++++++----
> >   1 file changed, 8 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> > index 00bd0de9faa2..6ed3bd80903d 100644
> > --- a/arch/riscv/kernel/entry.S
> > +++ b/arch/riscv/kernel/entry.S
> > @@ -399,14 +399,18 @@ SYM_FUNC_START(__switch_to)
> >       REG_S s11, TASK_THREAD_S11_RA(a3)
> >
> >       /* save the user space access flag */
> > -     li    s0, SR_SUM
> > -     csrr  s1, CSR_STATUS
> > -     REG_S s1, TASK_THREAD_STATUS_RA(a3)
> > +     csrr  s0, CSR_STATUS
> > +     REG_S s0, TASK_THREAD_STATUS_RA(a3)
> >
> >       /* Save the kernel shadow call stack pointer */
> >       scs_save_current
> > -     /* Restore context from next->thread */
> > +     /*
> > +      * Restore context from next->thread. csrs will OR the bits from =
s0 and
> > +      * only want to restore the SR_SUM bit
> > +      */
> >       REG_L s0,  TASK_THREAD_STATUS_RA(a4)
> > +     li    s1,  SR_SUM
> > +     and   s0,  s0, s1
> >       csrs  CSR_STATUS, s0
> >       REG_L ra,  TASK_THREAD_RA_RA(a4)
> >       REG_L sp,  TASK_THREAD_SP_RA(a4)
>
> To conclude the discussion we had here
> https://lore.kernel.org/linux-riscv/aDCtATl2N21fBsyT@debug.ba.rivosinc.co=
m/#t,
> in addition to Cyril's patch above, to me we only have to rename the
> status field into sum and we're good to go. @Andy, @Deepak @Samuel Do
> you agree?

LGTM, thanks!

Andy

>
> As this is an important fix (along with 2 other fixes, one for thead
> vector and vdso static values), I'd like to send another PR soon for
> inclusion in 6.16-rc1, I did not want to delay the second PR any longer.
>
> Thanks for your feedbacks,
>
> Alex
>
>
