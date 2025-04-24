Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90339191F91
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 13:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745503149; cv=none; b=HKfAXltbMIr8HS3X2/Y7QrCbXQLLNy8Rg5kAx7m7NPostm5UbnjoXjBvqImHjEOckBfhA/AOE1jTwhuNiB0TYrrPIdTn5aRok56C5oAxaNeE/W2+xOhbMlKk1nc0cq/9YjM6B8ivTtynLuKLyyvMggY9EDqYEIoAxvFSVMAY2ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745503149; c=relaxed/simple;
	bh=81QYWiV601/NOg7KUW9KuMYqMF4efK5FBVmKsbYti3M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RcJr86zT07nNaxHu/mLLJujxXxHqiLprHjJdLDPKJSY8Drb8QfvG0MflSKk5YAiw2Z7nAo0D1WrUQCOTBnucexN1MpfkhBZ0qzawjoVsPGKKT3w2hyRKY3LMyt9xg3DWom5XLgagz7QtS3HUhgckSPxaI/KOrX1xsS88aMF/APY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Hdeacznj; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Hdeacznj"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6e8f6970326so11962716d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 06:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745503146; x=1746107946; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Pto+LbylSLjB1C6LlqbFL+yEYLFcjU7iIt4pqlTAkNc=;
        b=Hdeacznjr6wmL5pRXruRkjcfj+ChD7UoZTqJNlU/UiLINon+0RGW7jl3U8wQI1DZ9K
         C3DP2jSaxBd5zmoI+OgFNrO3106nuZMbvxqQWfgVJdWu0UXvCW7X1zOgvzQ1thQyuM8s
         5Trq+Q0tcrX1+ijsdpRZMmQq9oTSbZIWPTCDBPJlRSsinGGptl5Nd1AFSxwwRGmb6ASk
         3t5nNzA5Xfy8bMEF0AvJ3SyVcj3E+pcov3Lg73JkI0+E8aFwjWiWrCD8EGbE2Qem7M0a
         JZwpSdEaIvUmbUg8O/ENim9VGNU9G1GO+4LGiOQwATbDsr2mNM+NjVRZqHTMwinQY57i
         CPtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745503146; x=1746107946;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pto+LbylSLjB1C6LlqbFL+yEYLFcjU7iIt4pqlTAkNc=;
        b=OzteYvTSa/yvqErE8jObOM4w53XLFAOmVw/dhEtTn8jDAp4MY7BGf3WvN6Wgy4zIE0
         H+hSFJCzH96d2+oC0c+cavQHejQw95IpqlOomlmR3RdfksqVSB8JlNV/aH23cShSnORU
         29+iApK/2MlpI5kkr4no/0iS/4lv62McLVDJmQOxisXZaVj64OMEpCyxAmMsiWhmsO1m
         VJWifH+EKgQHWUE//qnYE8FxlXmBYNSNdaIag3uQrOo7Cs4kAedywslMdcZHw9tXfnCZ
         eTHSXosQasaZNOeshe85x6uNtgedo3sjI1BSR+dgcypmPXU84/A7NwrcrMf+7oNx2ZNC
         YCsw==
X-Forwarded-Encrypted: i=1; AJvYcCXHVtq6tuoUYhBJwvPnKG7aiLBm1iwJrtH1Mis51djXH8LEbaUMcao6K4/F2b2DA6bICFxas4EeHDCZjkA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcMZjjfj7YJodvP8eacl/kRDc5GpU6efBa1/aWntEMdqwvKnCn
	JcbMILZcDqtIZjcfRF4j5kK+YGbcFoqZhEBVR3nCMNshvnZdgHXvCwIZtcHjdL0fXWGHGKf0AQ3
	E7B69g4ESAmnS6xnrBAVVGWEBpWtQjNXf5UVD
X-Gm-Gg: ASbGnctWPE6CpkBhUCmtSNvEk/0YKWul8F3urGuJXTreUUXYEiJBnrEpFKZ6e0h5oIf
	FoPtJ3XLCJ1x9BN7fd2LCTMT0Jd3V1ANpjUaridLIrppfxNjDA+mbRicfwrhMeJ1ZzJ/zVEdZng
	AHjm74Zqm+M7s+JqgYuX+tijxLOu4h+GSeZ2fu9tvgRMZx40rj3NCF
X-Google-Smtp-Source: AGHT+IE3ItXbV1+kTVfVtATpq+WTeREEehkFTAAzkn1NkN9ZtuVOvJniNI/Uy0ukgh7nK1TAUBfoEGtSKTLQKyJtO1Y=
X-Received: by 2002:a05:6214:2a45:b0:6f4:b265:261 with SMTP id
 6a1803df08f44-6f4bfbbbb5emr48222186d6.8.1745503146206; Thu, 24 Apr 2025
 06:59:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416085446.480069-1-glider@google.com> <20250416085446.480069-4-glider@google.com>
 <CANpmjNNmyXd9YkYSTpWrKRqBzJp5bBaEZEuZLHK9Tw-D6NDezQ@mail.gmail.com>
In-Reply-To: <CANpmjNNmyXd9YkYSTpWrKRqBzJp5bBaEZEuZLHK9Tw-D6NDezQ@mail.gmail.com>
From: Alexander Potapenko <glider@google.com>
Date: Thu, 24 Apr 2025 15:58:28 +0200
X-Gm-Features: ATxdqUEAntNIADHuPo_njoWHouU5ml7tSeW27VNL67TCm3kup8bcUf3veAU30Yo
Message-ID: <CAG_fn=UBVzq3V4EHQ94zOUwdFLd_awwkQUPLb5XjnMmgBoXpgg@mail.gmail.com>
Subject: Re: [PATCH 3/7] kcov: x86: introduce CONFIG_KCOV_ENABLE_GUARDS
To: Marco Elver <elver@google.com>
Cc: quic_jiangenj@quicinc.com, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, x86@kernel.org, 
	Aleksandr Nogikh <nogikh@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Ingo Molnar <mingo@redhat.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"

> > --- a/arch/x86/kernel/vmlinux.lds.S
> > +++ b/arch/x86/kernel/vmlinux.lds.S
> > @@ -390,6 +390,7 @@ SECTIONS
> >                 . = ALIGN(PAGE_SIZE);
> >                 __bss_stop = .;
> >         }
> > +       SANCOV_GUARDS_BSS
>
> Right now this will be broken on other architectures, right?

Right. I'm going to make it depend on X86_64 for now.


> > - * Entry point from instrumented code.
> > - * This is called once per basic-block/edge.
> > - */
> > -void notrace __sanitizer_cov_trace_pc(void)
> > +static void sanitizer_cov_write_subsequent(unsigned long *area, int size,
>
> notrace is missing.
Ack.
> Can we give this a more descriptive name? E.g. "kcov_append" ?
I'll rename it to kcov_append_to_buffer().


> > +
> > +/*
> > + * Entry point from instrumented code.
> > + * This is called once per basic-block/edge.
> > + */
> > +#ifndef CONFIG_KCOV_ENABLE_GUARDS
>
> Negation makes it harder to read - just #ifdef, and swap the branches below.

I thought I'd better keep the default hook above, but maybe you are right.
Will do in v2.


> >
> > +config KCOV_ENABLE_GUARDS
>
> The "ENABLE" here seems redundant.
> Just KCOV_GUARDS should be clear enough.

I am already renaming this config to KCOV_UNIQUE per Dmitry's request :)

>
> > +       depends on KCOV
> > +       depends on CC_HAS_SANCOV_TRACE_PC_GUARD
> > +       bool "Use fsanitize-coverage=trace-pc-guard for kcov"
>
> The compiler option is an implementation detail - it might be more
> helpful to have this say "Use coverage guards for kcov".

Ack.

> > --- a/scripts/Makefile.kcov
> > +++ b/scripts/Makefile.kcov
> > @@ -1,5 +1,9 @@
> >  # SPDX-License-Identifier: GPL-2.0-only
> > +ifeq ($(CONFIG_KCOV_ENABLE_GUARDS),y)
> > +kcov-flags-$(CONFIG_CC_HAS_SANCOV_TRACE_PC_GUARD) += -fsanitize-coverage=trace-pc-guard
>
> This can just be kcov-flags-y, because CONFIG_KCOV_ENABLE_GUARDS
> implies CONFIG_CC_HAS_SANCOV_TRACE_PC_GUARD.
>

Agreed.
