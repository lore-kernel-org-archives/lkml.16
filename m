Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C4A800
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 08:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751876010; cv=none; b=pBtFnbRExCJ6arlOtx6isO8+URpCI+u8cQzrbPH2h7eXSGuIyp4FXBfVJMF3qrzNwLBvxhGR52qTRpXoG1iwQ/bpHUIXo7tCDcfOVMVoC054wsTV12cg/7Top4r+XnmBBLDOC3BL18c13L2GF/X1rgS6GcbHwxMLcDkYaaeeyqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751876010; c=relaxed/simple;
	bh=L6wODInJviFVEYw24agNaP2L62YukWZfYTapNrCWi3g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dali6nMmEVAkGlbUNPDnp868YpyFKpQR+D2ize/vWZJIfZSO7/dd6YE9VYoPDajGhUnkr73xNk2cq+dKU0COLGltxJVPaWsjoVLcbmOJ6oVIRcI2YgM4+EuAk+bGG2SCAa7QKzXRJPAEdKmsMXR6+o6t65lyB4j9+BqrNI1RjIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hAjSY3bk; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hAjSY3bk"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-879d2e419b9so1972978a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 01:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751876009; x=1752480809; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Sy3Zl3HW2vP3OcPeDDr8RSG9/AaShsN/P+ybT3x4ZXc=;
        b=hAjSY3bk0GfUJkr6QE8q7UhZNRJNPzZj9mNR00xJeuXMTnw8m7Y4h49YdECOGFVYWe
         fKThiFDKNhelNF87Pz0Cbbn7fLc36uSXft78LjA7fivMuooOLuDVvVO5cdGOvYmNXNup
         V3cKyv7a1dcWqKPhhuNPeEbCPS9NwNKV4l6dBwpQG+6nWGkzSG1DWjV/PyxsgVWzmtj9
         18XTutboLXfgrPCvK5RvXERZ6grxu02wdh4TA35L2215L+2PSl/fvXJrvIqlxdlmKGap
         TeXfquZPX9fdI/txDcqxEqEGgjYMxllK8Aq9UqlolodHcqSkFEarcB1QoJ8uZjVhuRqG
         fl9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751876009; x=1752480809;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sy3Zl3HW2vP3OcPeDDr8RSG9/AaShsN/P+ybT3x4ZXc=;
        b=Dmy1PE0VrlmUYSha/Z66hYrkJBev5+9uSH0f8Fko6QHj8abBQAa5N2IDoxIzjjho7s
         ctuVgX7K98rd4IVlfW+z5c+6AFJvzREUecjFn9SfFhquwxgw07/A0TQec/Iq1rVS/qaC
         umc5+3L3jqsXIXXxCuPHfzH5lS73zL/GeIuVn+lS7w6Y2RAUjnykjLePFBIEFhjmALm6
         tjP8o4Q1qNiKyZK9z3hKZNlCDJ3Bkun7EaxC8xb7zbs75g4efZVN2q1rUMnCk2NJUw0c
         fpboIBsYTSI1m7ILiSc4aPe7k/tY8DhtJUsMxpztiyJ4nPGX0taQSY2hA79bjmxTU1dk
         Xcxw==
X-Forwarded-Encrypted: i=1; AJvYcCW8PnTI/r2DPJP4s/ee1IMCK9Lx+jEA29RS5nOTo3ahlxzZ+lKCWa+UygNn3Kse6h7Ds/ilkrUR0SzlMzA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiP7zpUw069CRMU28LoaONugCtXMvIAs4dRWa0jxxtOvmLkZYx
	iG8/oc88FTb3FrCS/ijgJvb9LakComoDCLybCoH+iZ2NkCshSGbEEGU3RuIB1mKnvjkZ/pR/dQg
	ajUzO9WMRZWB9I48P2BpVGSNeoKMzauuC8/VKZO9i
X-Gm-Gg: ASbGncvNjGW3XcNVvm/MA+mIZ8L0JRhH8Td+FOgWLH8eUvzkxF5yS0O6z7p7BPSmTHg
	Zhmp/95kUeXc24VlOYSs9DGTGnpYCpox8ESVt8iaAhnbbHNzN0tJTEMAvQA2mrFIMceaUvDq6QY
	oflSoVhg4KZIlzciZzbaSC1e1ek8vUI+f1YEE5qG2ODa+VejbN+mAvRdd+NPcNCd6MJU24Vss2K
	w==
X-Google-Smtp-Source: AGHT+IGh5LuvrO1kyFwLsEsv34VtRW/BNGiFnqy913pFYoJD3DDCPX7V608er/sHnIzWKOc3jc7HDKQVOhZHJRPuCEI=
X-Received: by 2002:a17:90b:2ec7:b0:311:b0d3:85d with SMTP id
 98e67ed59e1d1-31aba828649mr12651046a91.2.1751876008406; Mon, 07 Jul 2025
 01:13:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250704120604.2688934-1-matt@readmodwrite.com> <20250704133500.c21fc228600f70c51a16e04c@linux-foundation.org>
In-Reply-To: <20250704133500.c21fc228600f70c51a16e04c@linux-foundation.org>
From: Marco Elver <elver@google.com>
Date: Mon, 7 Jul 2025 10:12:51 +0200
X-Gm-Features: Ac12FXwFEFvJyLWOTP9g3TLa66UtO9QCcP6JhHoZd9eotz0NIw7fGGCUJ8FraMk
Message-ID: <CANpmjNP2QgEO0grKPVRcs19PkSiDT1=8MiuCS1uVGeZ6-ye8-Q@mail.gmail.com>
Subject: Re: [PATCH v2] stackdepot: Make max number of pools build-time configurable
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Matt Fleming <matt@readmodwrite.com>, linux-kernel@vger.kernel.org, 
	kernel-team@cloudflare.com, Alexander Potapenko <glider@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Oscar Salvador <osalvador@suse.de>, Vlastimil Babka <vbabka@suse.cz>, 
	Matt Fleming <mfleming@cloudflare.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 4 Jul 2025 at 22:35, Andrew Morton <akpm@linux-foundation.org> wrote:
>
> On Fri,  4 Jul 2025 13:06:04 +0100 Matt Fleming <matt@readmodwrite.com> wrote:
>
> > From: Matt Fleming <mfleming@cloudflare.com>
> >
> > We're hitting the WARN in depot_init_pool() about reaching the stack
> > depot limit because we have long stacks that don't dedup very well.
> >
> > Introduce a new config to allow users to set the number of maximum stack
> > depot pools at build time. Also, turn the silent capping into a
> > build-time assert to provide more obvious feedback when users set this
> > value too high.
> >
> > ...
> >
> > --- a/lib/Kconfig
> > +++ b/lib/Kconfig
> > @@ -720,6 +720,12 @@ config STACKDEPOT_MAX_FRAMES
> >       default 64
> >       depends on STACKDEPOT
> >
> > +config STACKDEPOT_MAX_POOLS
> > +     int "Maximum number of stack depot pools to store stack traces" if EXPERT
> > +     range 1024 131071
> > +     default 8192
> > +     depends on STACKDEPOT
>
> Do we need a range?  If someone wants values outside the range they'll
> just edit the Kconfig, shrug.
>
> >  config REF_TRACKER
> >       bool
> >       depends on STACKTRACE_SUPPORT
> > diff --git a/lib/stackdepot.c b/lib/stackdepot.c
> > index 245d5b416699..1c25c40f31f9 100644
> > --- a/lib/stackdepot.c
> > +++ b/lib/stackdepot.c
> > @@ -36,11 +36,11 @@
> >  #include <linux/memblock.h>
> >  #include <linux/kasan-enabled.h>
> >
> > -#define DEPOT_POOLS_CAP 8192
> > +#define DEPOT_MAX_POOLS CONFIG_STACKDEPOT_MAX_POOLS
>
> A boot-time option would be much friendlier.  Can we dynamically
> allocate stack_pools[]?

We could allocate this in stack_depot_init().  I think it wasn't done
so far as requiring a very large number of pools is typically
indicative of stackdepot misuse.

In any case, I agree it's better if this were configurable at boot
time. However, need to be careful to sanitize user inputs (reject too
small, reject too large).

Matt, do you think this would work better for your usecase rather than
rebuilding the kernel?

> Or possibly even runtime, although perhaps not a good effort-to-utility
> ratio.

Could make stack_pools an RCU-protected array and resize on demand.
But given stackdepot can be used from constrained contexts, the dance
around RCU might be brittle (see existing RCU usage in stackdepot).
Along with the fact that arbitrary resizing likely indicates a usage
bug, it might be safer to just allocate on boot.
