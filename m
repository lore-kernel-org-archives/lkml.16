Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4876263CF
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 13:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745413758; cv=none; b=n9CvY7QlBOaoZ3HS4dMos5NSjatrWOZAA5THMBcKhOyJNz7nTEDIAuFDmCVBqLX2/V3UJ+LLQWhdOUkU5D1lHghQN9q0w6ZdiAgrr6SaDkIgTggvQ7WOGjV01Jx/9fEywdgqntzUhdKzaK74OLfWMEmDNn74CohBzO2F3GqVp+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745413758; c=relaxed/simple;
	bh=wAcnfSwZZT3Dy2uG4i38hgDTjsiEMLTXqqog09de3Nk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KvlGJLkWEQUWSzexs2d3NQBQUxA344X7WJy6uw2KABTHdMhOvyStD24u4VEWlMU3nSyqewMsdWgZHYqfdNO0S3xZRBkkCG6Z1uVLrWoZhDGJF1ziU4GucbfFNIqetj7XQqrPw1WB7cTJ/SOJ7eQMV/1VWPpltSTKX0XBT/nHgSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nR3V6zsm; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nR3V6zsm"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6f0ad74483fso71881726d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 06:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745413754; x=1746018554; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LTn7cRGZVVZ7I+m7141mdiqJRDEUM3mUP+2DWyqwfew=;
        b=nR3V6zsmigtGq6Ok9E6Kcs46tq3LNQnJSVIMXukjRHnCyKA6iX8h3KF6ub1ZEjgsX4
         I6a29B/SyiN5fjAbkFKbBkBdOZG/aDQH6wI91RezLlZ0kG8PAtE68ghYwQtu4Ao3/wvm
         yr0JlVYIr8t8c9nA0g3pW2KW8tnDjmtx7Br7Z+X92wcBL4psoIpqqW/IwAR5nff+QN2W
         l0wOeUG2wERzy/xSW6eOoZjOS+cfe8kW0Dre/qc380gPGrBfNoBM7TWARH2wvITCb2Xo
         weptw9qtVl4QPG+b05JEC3lTbi1lOXbqkxnbGAz699mBlojSMVI+YJWCD6+tsei6K7Rs
         YRmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745413754; x=1746018554;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LTn7cRGZVVZ7I+m7141mdiqJRDEUM3mUP+2DWyqwfew=;
        b=dDxGqUaQZmXzGpQco1mgjUshxjN3tWCkVzhWKdyP0mLg0bS705eClMdFLg2ElCMQeT
         wQDWBQHTy+vZY5emtCqSNoN4lv/HZkI83qm3koE4wawFT05lZ4ugWGdEbhR1RVOD/fl3
         G+rimPQYSs86DwHXkrLI1fz7bdSRwiPi5tkblyjo9ywIzUFwuCC50QPcg69yPJd4rtd5
         P69WfH12+1DVYqm/dKVYpOLf5IYLxLP+nV9pExhBQvNMaeKavvQiX5KypR73p5tIoI1c
         qjX2A6ajsbxMxz5yL8ljmDI77VB4jQuCqffldXzJx9o3KnEFbJ1Fc/GBH+feiv6YvPAo
         sLgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVw4MvfdWfn1Z/VoDrGXkzlUVY8EjEIH5PDmuhwpx2vCFR+IT7dFoHViaPLAkmQ5Cfs8DwKYD0L2LZHJH0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyL6NwPHHTvici98spN0efN/w5s7ZC7O3EdgSV5jLm4VwgchuCq
	4KkY+U2jyUoA+PAuv91oADqvKlbe0UdH3tgTND7EDNh5AWYrwh3/oRuyXaFIlJnyaLIS3bUofDG
	aEUeJWeB/3pbbZvi7NR9GwY5hE7F7f6bKFGKx
X-Gm-Gg: ASbGncsfifu8E8lr22CC5s9KePE8bp/+5sKUaUIP1qEPYARSbRQEdCH6AkSNTeXBPtM
	lje0DvpkGZRWiFqooNts3RnhWxrb1Ix+LkeC0gqo9FPmA/DOPuJP08UA5k2DYllucAARrd1whQY
	CRSmn0903qGw6T60tZ5WvHfY1n41U226VDlLuK/mTKEpbN3U7bZGOKOSj/lgseHQ==
X-Google-Smtp-Source: AGHT+IE0kU8U/5N3uqadv7+S5SqUagcPsKyBEJSj/XX9WiPRFvUgy76MwPpu7zxldeIrlSs13vB3fiGD+XOYKTpr1qc=
X-Received: by 2002:a05:6214:224d:b0:6e8:f8ef:d659 with SMTP id
 6a1803df08f44-6f2c4545f64mr382868476d6.10.1745413753568; Wed, 23 Apr 2025
 06:09:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416085446.480069-1-glider@google.com> <20250416085446.480069-6-glider@google.com>
 <CANpmjNM=AAtiXeDHgG+ec48=xwBTzphG3rpJZ3krpG2Hd1FixQ@mail.gmail.com>
In-Reply-To: <CANpmjNM=AAtiXeDHgG+ec48=xwBTzphG3rpJZ3krpG2Hd1FixQ@mail.gmail.com>
From: Alexander Potapenko <glider@google.com>
Date: Wed, 23 Apr 2025 15:08:36 +0200
X-Gm-Features: ATxdqUHkZ-mVJ4_aZiiWoW4d9GlOyr_vj4jQP1Yr2bqSKqCDppY1saT2_VuZnWQ
Message-ID: <CAG_fn=WD3ZuJCQ4TiVKXLhn5-=tsaW0d=zrM-TuEokP5zEvOSw@mail.gmail.com>
Subject: Re: [PATCH 5/7] kcov: add ioctl(KCOV_UNIQUE_ENABLE)
To: Marco Elver <elver@google.com>
Cc: quic_jiangenj@quicinc.com, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, Aleksandr Nogikh <nogikh@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Ingo Molnar <mingo@redhat.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 22, 2025 at 11:29=E2=80=AFAM Marco Elver <elver@google.com> wro=
te:
>
> On Wed, 16 Apr 2025 at 10:55, Alexander Potapenko <glider@google.com> wro=
te:
> >
> > ioctl(KCOV_UNIQUE_ENABLE) enables collection of deduplicated coverage
> > in the presence of CONFIG_KCOV_ENABLE_GUARDS.
> >
> > The buffer shared with the userspace is divided in two parts, one holdi=
ng
> > a bitmap, and the other one being the trace. The single parameter of
> > ioctl(KCOV_UNIQUE_ENABLE) determines the number of words used for the
> > bitmap.
> >
> > Each __sanitizer_cov_trace_pc_guard() instrumentation hook receives a
> > pointer to a unique guard variable. Upon the first call of each hook,
> > the guard variable is initialized with a unique integer, which is used =
to
> > map those hooks to bits in the bitmap. In the new coverage collection m=
ode,
> > the kernel first checks whether the bit corresponding to a particular h=
ook
> > is set, and then, if it is not, the PC is written into the trace buffer=
,
> > and the bit is set.
> >
> > Note: when CONFIG_KCOV_ENABLE_GUARDS is disabled, ioctl(KCOV_UNIQUE_ENA=
BLE)
> > returns -ENOTSUPP, which is consistent with the existing kcov code.
> >
> > Also update the documentation.
>
> Do you have performance measurements (old vs. new mode) that can be
> included in this commit description?

That's hard to measure.
According to the latest measurements (50 instances x 24h with and
without deduplication), if we normalize by pure fuzzing time, exec
total goes down by 2.1% with p=3D0.01.
On the other hand, if we normalize by fuzzer uptime, the reduction is
statistically insignificant (-1.0% with p=3D0.20)
In both cases, we observe a statistically significant (p<0.01)
increase in corpus size (+0.6%) and coverage (+0.6) and -99.8%
reduction in coverage overflows.

So while there might be a slight slowdown introduced by this patch
series, it still positively impacts fuzzing.
I can add something along these lines to the commit description.


> > +.. code-block:: c
> > +
> > +       /* Same includes and defines as above. */
> > +       #define KCOV_UNIQUE_ENABLE              _IOW('c', 103, unsigned=
 long)
>
> Here it's _IOW.
>
...
> > diff --git a/include/uapi/linux/kcov.h b/include/uapi/linux/kcov.h
> > index ed95dba9fa37e..fe1695ddf8a06 100644
> > --- a/include/uapi/linux/kcov.h
> > +++ b/include/uapi/linux/kcov.h
> > @@ -22,6 +22,7 @@ struct kcov_remote_arg {
> >  #define KCOV_ENABLE                    _IO('c', 100)
> >  #define KCOV_DISABLE                   _IO('c', 101)
> >  #define KCOV_REMOTE_ENABLE             _IOW('c', 102, struct kcov_remo=
te_arg)
> > +#define KCOV_UNIQUE_ENABLE             _IOR('c', 103, unsigned long)
>
> _IOR? The unsigned long arg is copied to the kernel, so this should be
> _IOW, right?

Right, thanks for spotting!
This also suggests our declaration of KCOV_INIT_TRACE is incorrect
(should also be _IOW), but I don't think we can do much about that
now.

> >  void notrace __sanitizer_cov_trace_pc_guard(u32 *guard)
> >  {
> > -       if (!check_kcov_mode(KCOV_MODE_TRACE_PC, current))
> > -               return;
> > +       u32 pc_index;
> > +       enum kcov_mode mode =3D get_kcov_mode(current);
> >
> > -       sanitizer_cov_write_subsequent(current->kcov_state.s.trace,
> > -                                      current->kcov_state.s.trace_size=
,
> > -                                      canonicalize_ip(_RET_IP_));
> > +       switch (mode) {
> > +       case KCOV_MODE_TRACE_UNIQUE_PC:
> > +               pc_index =3D READ_ONCE(*guard);
> > +               if (unlikely(!pc_index))
> > +                       pc_index =3D init_pc_guard(guard);
>
> This is an unlikely branch, yet init_pc_guard is __always_inline. Can
> we somehow make it noinline? I know objtool will complain, but besides
> the cosmetic issues, doing noinline and just giving it a better name
> ("kcov_init_pc_guard") and adding that to objtool whilelist will be
> better for codegen.

I don't expect it to have a big impact on the performance, but let's
check it out.
