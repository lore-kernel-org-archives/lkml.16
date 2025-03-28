Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26ADA14D70E
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 16:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743181177; cv=none; b=XoNbJOFmNVaxxneYlAEg2Yqsq2+4I1F6sBKMpwoCdqmEBkkr9v1ubMu9ORdZkgEUiYGqyTbvid0O7mDz3ExZf7nqGxsbZf9DKmHAV/AeIOzs6jWd2gSOhf4XCga70ap198uW3PgBz46Vvc6d/iFffd7N2QnJ+KOV5k+ImgHVjtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743181177; c=relaxed/simple;
	bh=Co4RpiFV+ly6UFErhco3vS5kdG2BX+IOkv6UHpq96sI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SYAABCedZcYNSQiKebudNmrUHdqeSBpPSCgy2zNJztFT8dexyEDcxe7UM5SK9vEXCgYDbm642wJF1ltqEIXT8Fu+DIZ7841L/j1N8GIXCVpCP178Dsn8XPKz92MLCdESUjHYQVyMPpRPG0VBVGZIsmLLPupprdRLKyzA27NJ4MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Frxn6DxN; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Frxn6DxN"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2ff187f027fso5141169a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 09:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743181175; x=1743785975; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Co4RpiFV+ly6UFErhco3vS5kdG2BX+IOkv6UHpq96sI=;
        b=Frxn6DxN1lrID123ePa2dvSYZYy/Je81Ky8IOPMJHQZ7zopd2K9VkNTTsE/ILFvxve
         y8aFMHElroknVdA0N2XPFE1qmb5vAsQBC6Bx7dj89E/XXPRKMbwYwUndXqpQ581Sj41K
         wPPX1BXWQn8wQDQUSLJD61oi/P8Yvyg/jLCooV1UpKSy/46vZMDbGS6TuNdCqyL+h/OD
         fD3/8En7l8ln2RimZ1FRyMqmlE9FAt8dMaX8YEawhdf6uMQcaZA0OKGruRZBwJmV23uB
         TyAUBfNM49hqeOMBY0cIwBe3OaJKT+VLdbfntzh+3dffZ3iYl0Gqsqd3NfsPa7PHQaYQ
         ZZpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743181175; x=1743785975;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Co4RpiFV+ly6UFErhco3vS5kdG2BX+IOkv6UHpq96sI=;
        b=bIbIhxRxGY2azYBW+xxogX+22VXgi7iZ5qUT/xr44JXLgX+CnPrN6+pS5CrLqHek8r
         1xXgHDOxWTnxCTqKWfiwAYag1P4NDS04ToMmU09nSEXgmQ1ggYvx08stpudFFYWfntol
         WIVerRrKQenTz0yCj3wsdn0EW/J8W1cwESdoOVmw86mVm+nPh9zAW5H5GZpiFVQdN8D5
         pARb3cJYMp/QgKZ9SXI8YWYgINqGezuwbqxGsSPmw+7Bnmjbg87MKFS0DTmJGu48pgzp
         /j633H9c8069mfZwc6/g2KGpF97TGg7L7OlNDwnYWkp35X3M/5cBT3dE9P/46PgQ59oZ
         O5pg==
X-Forwarded-Encrypted: i=1; AJvYcCXI1eQSNJEoOiYJVEK6Z9Jd90RLZg7NOywBkvrrfdibmNF0scLth/0OaK3PJkHVTqnJ2qoHl7PvQOBOj1k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMmiK43kKIMV2a0A/hRTBeunMV9t3pqp+Tis2BLkE2DSGvDwsf
	TUToGwNYcOhoz0YRPw1Etg+/AYHr7OQS4wHHuDL5amEb2BUsA/P0RcGmPa+omiCcwicTZKhd6Ov
	VUyV0oEYj2eOqlo6MvwjhLJvjB+Cir/iNODxf
X-Gm-Gg: ASbGncuwlDtMm46WQ8na+XWP2pkFyyS7pKkllm/pwEaTEDsnz0rifk5gzGqcfao0akj
	ZAbPyH88tl0VzTreg+ytq0OqnAV3BUMgHovWnFpVu+Mq6AjEjgCIVwIKPApwwOzy9ObflmmbTH7
	3/WTBdouGqUOAEEyhCnV0gHib+Uvq3MgNJeR61jOZQhSvwiTF6Y1agDGnCHA==
X-Google-Smtp-Source: AGHT+IFrUnI6CZJgKZQPMApvvIGJWKalCQQcAgrMhwe8ut9FGmt1jDNcMPB91mkenDBYrNRb8lEWvbPv7r67wkakJTc=
X-Received: by 2002:a17:90b:42:b0:2fa:4926:d18d with SMTP id
 98e67ed59e1d1-3051c952251mr6075406a91.13.1743181175080; Fri, 28 Mar 2025
 09:59:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAG48ez2jj8KxxYG8-chkkzxiw-CLLK6MoSR6ajfCE6PyYyEZ=A@mail.gmail.com>
 <CAG_fn=UF1JmwMmPJd_CJQSzQAfA_z5fQ1MKaKXDv3N5+s3f6qg@mail.gmail.com> <CAG48ez1w3YO=dwuGqVF3PdHec6=vbYr3GmabY-qQHbZ0fko2JA@mail.gmail.com>
In-Reply-To: <CAG48ez1w3YO=dwuGqVF3PdHec6=vbYr3GmabY-qQHbZ0fko2JA@mail.gmail.com>
From: Marco Elver <elver@google.com>
Date: Fri, 28 Mar 2025 17:58:57 +0100
X-Gm-Features: AQ5f1Jo5avP8gathSpZrvGuQ9hpBAo8b9sd-f-ysvgj_1b3jBP--BO4MKJWn5D8
Message-ID: <CANpmjNM_+gkQ2VwykXxu+7DL2ib2-4O-jDnn=+rXQn_e4=BnBA@mail.gmail.com>
Subject: Re: does software KASAN not instrument READ_ONCE() on arm64 with LTO?
To: Jann Horn <jannh@google.com>
Cc: Alexander Potapenko <glider@google.com>, Will Deacon <will@kernel.org>, 
	kasan-dev <kasan-dev@googlegroups.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	kernel list <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 27 Mar 2025 at 20:10, 'Jann Horn' via kasan-dev
<kasan-dev@googlegroups.com> wrote:
>
> On Thu, Mar 27, 2025 at 8:29=E2=80=AFAM Alexander Potapenko <glider@googl=
e.com> wrote:
> > On Thu, Mar 27, 2025 at 12:10=E2=80=AFAM Jann Horn <jannh@google.com> w=
rote:
> > > Hi!
> > >
> > > I just realized - arm64 redefines __READ_ONCE() to use inline assembl=
y
> > > instead of a volatile load, and ASAN is designed to not instrument as=
m
> > > statement operands (not even memory operands).
> >
> > Nice catch!
> >
> > > (I think I may have a years-old LLVM patch somewhere that changes
> > > that, but I vaguely recall being told once that that's an intentional
> > > design decision. I might be misremembering that though...)
> >
> > We have some best-effort asm instrumentation in KMSAN (see
> > https://llvm.org/doxygen/MemorySanitizer_8cpp_source.html#l04968) and
> > could potentially do something similar for KASAN, but if I remember
> > correctly there were some corner cases with unknown argument sizes and
> > with percpu instrumentation (at least on x86 percpu accesses receive
> > an offset of the variable in .data..percpu, not the actual address).
>
> Ah, I see. Annoying that memory operands are used for that...
>
> > > So because __READ_ONCE() does not call anything like
> > > instrument_read(), I think instrumentation-based KASAN in LTO arm64
> > > builds probably doesn't cover READ_ONCE() accesses?
> > >
> > > A quick test seems to confirm this: https://godbolt.org/z/8oYfaExYf
> >
> > So should it be enough to call instrument_read()?
>
> Sort of, I think; but I'm not sure whether instrument_read() is
> available in this header or whether that would create an include
> dependency loop because READ_ONCE is so fundamental
> (linux/instrumented.h depends on linux/compiler.h, which pulls in
> asm/rwonce.h). So instrument_read() might maybe need to be open-coded
> if we want to use it here? IDK...
>
> And also I think this would probably cause ASAN false-positives in
> __read_once_word_nocheck(), because I think disabling ASAN
> instrumentation per-function with __no_sanitize_or_inline probably
> does not disable explicit instrumentation through instrument_read()?

Correct, the attribute doesn't kill explicit instrumentation.

Easiest way to "fix" this is to disable the promotion to acquire by
arm64 when built with a *compiler-based* (i.e. not KASAN_HWTAGS)
sanitizer + LTO. This promotion was only made because of fear of
overaggressive compiler optimizations with LTO. If there's a bug due
to the compiler breaking dependency ordering [1], it'd actually be
very nice to see a sanitizer splat, but I doubt we'd ever be so lucky.

[1] https://lpc.events/event/16/contributions/1174/attachments/1108/2121/St=
atus%20Report%20-%20Broken%20Dependency%20Orderings%20in%20the%20Linux%20Ke=
rnel.pdf
