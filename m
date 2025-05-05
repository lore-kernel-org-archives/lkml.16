Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD0715E90
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 18:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746469131; cv=none; b=Yp+LVWCv7eI9JSBS6kbRUQFvN73X/EkLseKYODN+QPgAsmao+30ifWwHnI3TzC+kWJpmq7ZfKPMkOf4Q9jfLakhkCWCpx73KqLZIzO0jpM5y1QS6u1tJZtPSClOIRw2IM5vvsOvk+hHysq0ri3TrvsA/mDNtjXsVeSOjDeGIzQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746469131; c=relaxed/simple;
	bh=Llxn6P3yNGX+p+iXcZW9OKjTiI6ZeRsyDmIcIgvUVHc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U/9mlelfeGN1I9V4O8ELr4yoDCeJYTtK8TiPhBqR0vzxCzyAc3v8tZPuG4g4fqXvcH0+wpAmJD2gcFs6rGdZmDy6ifM5mhKndGIB8gvdHFT3RN6dLtFrYabeT/ATRygJNbORzNLHSUMOqfdatrWDuUjRCvgSfwhgC4oiSPkUhmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3KrEznAy; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3KrEznAy"
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-86fea8329cdso2920959241.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 11:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746469128; x=1747073928; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v+HucxVqpGIDINeSE6fmLZw1CWi4pwr8swaylTY9CLM=;
        b=3KrEznAy0kX+I1AXDMh4tsepnuPNupOelH+DnvsIBXySJ4aiP9mvACSyLYGjbFRiwe
         bHJ/0uYgJwTGsXG5C1JJhvLGa9ucpEknzlUALz0muqQfGqkxcgjs5pv0ZJa5EZZIT8TM
         QRBK27dcHlqrn5JNB7Mnyz5nNH9LBXFOJU6ij3x/a9YHKP62cB4L7ewBTI4DR8v9zGDI
         BWqhYvzvy5xwgervT5FCDWeRd/+AjGyntLfLe0ncFvTLBVKD4oBrHjlx6Bi2Zpbb7KmT
         b1HrwDrKE02Onze/PVIbTL7ucE4mSVwGhAKapLqlcqcRZCENmZqb8erx879N9ZZq4muk
         Jt9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746469128; x=1747073928;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v+HucxVqpGIDINeSE6fmLZw1CWi4pwr8swaylTY9CLM=;
        b=X9Olnv+GTr07YvIFexUA1FI23pvV3UEYzsY4uyZuEQzzvLXPtpoLArs8IG+DUb3W6J
         iVc/PDdRv3+cCMd0mqhQ4rnu8LuhU0oq5hTc550Ad84M5m47wYil7uV2owoJN4GdkDmC
         c7zxmcgf5k6KHsHriCkSOhCO/sQkNl0/meJSjZ1uzUF+PrMFJIucykdxYBT9REiLSvFC
         WlAlf19k1g0g9qFOgQGpYEsT9MUVvwLAtDp2GMhkI2e5cj5FjhL/DBAOQxbp1u9g5nqe
         1MqwDGgCzCGBPXgOM1HamesflXMCXyEBj33+L26oShQwnkQ+T2t+55YnmxZHBTCEW04o
         +viQ==
X-Forwarded-Encrypted: i=1; AJvYcCVph9WVN7gQUA5DAoRci+xIDU81HAVkqahM+/OXubbHIiEjR0bE2Ia6e2XRtqun3jhtT4pREJAsyPN2GPY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0MmD9oAB6zO/i/7jl46rTmGBwUvAoDclDAcmogk+eGqj5kjlH
	83KfDq+Pl3gEbU/aST99IkX4yg67zVycOaS7SGqpSrKSGkRZYzvhxtK3t+M7Cfy4oRUsd6fzsP0
	/B3/4b0dJT5U3XBD9JYwqt1EVVzdfdrxcqQMJ
X-Gm-Gg: ASbGnctWHOfz3zLrUEEtKst22eiWRLf1MRBuiDY6vbxS4xBR3Ah04amSp1BcV3AocMf
	07pkMm/1nTMmDAGZculSL0poxMvcuiSOlcs+JOQbxKL05iuWSOBUoyt/fyMkHi72lGI7MhC9OJ8
	P/0x3cc4y5V/wiqweaFMxU8pTpvvFFAds=
X-Google-Smtp-Source: AGHT+IH/iz9okaO1cuwqrJo1Rt3kARxWxf3EeTirkMuCQivHqoWZrf+JzbjS35sokHVGuLKGArF4jDrp3RM0JQB3qww=
X-Received: by 2002:a05:6102:3c8e:b0:4da:e6e1:c343 with SMTP id
 ada2fe7eead31-4db0c401beamr5914771137.23.1746469128196; Mon, 05 May 2025
 11:18:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250503184001.make.594-kees@kernel.org> <20250503184623.2572355-3-kees@kernel.org>
 <CAFhGd8rGJcveDn4g1nS=tURe-uT1+PFm2EQeWpUrH_oy763yFg@mail.gmail.com>
In-Reply-To: <CAFhGd8rGJcveDn4g1nS=tURe-uT1+PFm2EQeWpUrH_oy763yFg@mail.gmail.com>
From: Justin Stitt <justinstitt@google.com>
Date: Mon, 5 May 2025 11:18:34 -0700
X-Gm-Features: ATxdqUErCVMDsByK3bWIsvMoTcLY1TL44fldHiGpe0ueZmfJS819NKbT_lTgAuc
Message-ID: <CAFhGd8qL8ttBaPGH5Cx39MN46OgxsLSgqhWN4rwCwf9bn33NHg@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] integer-wrap: Force full rebuild when .scl file changes
To: Kees Cook <kees@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Marco Elver <elver@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	linux-kbuild@vger.kernel.org, kasan-dev@googlegroups.com, 
	linux-hardening@vger.kernel.org, Petr Pavlu <petr.pavlu@suse.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 5, 2025 at 11:16=E2=80=AFAM Justin Stitt <justinstitt@google.co=
m> wrote:
>
> On Sat, May 3, 2025 at 11:46=E2=80=AFAM Kees Cook <kees@kernel.org> wrote=
:
> >
> > Since the integer wrapping sanitizer's behavior depends on its associat=
ed
> > .scl file, we must force a full rebuild if the file changes. If not,
> > instrumentation may differ between targets based on when they were buil=
t.
> >
> > Generate a new header file, integer-wrap.h, any time the Clang .scl
> > file changes. Include the header file in compiler-version.h when its
> > associated feature name, INTEGER_WRAP, is defined. This will be picked
> > up by fixdep and force rebuilds where needed.
> >
> > Signed-off-by: Kees Cook <kees@kernel.org>
> > ---
> > Cc: Masahiro Yamada <masahiroy@kernel.org>
> > Cc: Justin Stitt <justinstitt@google.com>
> > Cc: Nathan Chancellor <nathan@kernel.org>
> > Cc: Nicolas Schier <nicolas.schier@linux.dev>
> > Cc: Marco Elver <elver@google.com>
> > Cc: Andrey Konovalov <andreyknvl@gmail.com>
> > Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>
> > Cc: <linux-kbuild@vger.kernel.org>
> > Cc: <kasan-dev@googlegroups.com>
> > Cc: <linux-hardening@vger.kernel.org>
> > ---
> >  include/linux/compiler-version.h | 3 +++
> >  scripts/Makefile.ubsan           | 1 +
> >  scripts/basic/Makefile           | 5 +++++
> >  3 files changed, 9 insertions(+)
> >
> > diff --git a/include/linux/compiler-version.h b/include/linux/compiler-=
version.h
> > index 69b29b400ce2..187e749f9e79 100644
> > --- a/include/linux/compiler-version.h
> > +++ b/include/linux/compiler-version.h
> > @@ -19,3 +19,6 @@
> >  #ifdef RANDSTRUCT
> >  #include <generated/randstruct_hash.h>
> >  #endif
> > +#ifdef INTEGER_WRAP
> > +#include <generated/integer-wrap.h>
> > +#endif
> > diff --git a/scripts/Makefile.ubsan b/scripts/Makefile.ubsan
> > index 9e35198edbf0..653f7117819c 100644
> > --- a/scripts/Makefile.ubsan
> > +++ b/scripts/Makefile.ubsan
> > @@ -15,6 +15,7 @@ ubsan-cflags-$(CONFIG_UBSAN_TRAP)             +=3D $(=
call cc-option,-fsanitize-trap=3Dundefined
> >  export CFLAGS_UBSAN :=3D $(ubsan-cflags-y)
> >
> >  ubsan-integer-wrap-cflags-$(CONFIG_UBSAN_INTEGER_WRAP)     +=3D  \
> > +       -DINTEGER_WRAP                                          \
> >         -fsanitize-undefined-ignore-overflow-pattern=3Dall        \
> >         -fsanitize=3Dsigned-integer-overflow                      \
> >         -fsanitize=3Dunsigned-integer-overflow                    \
> > diff --git a/scripts/basic/Makefile b/scripts/basic/Makefile
> > index dd289a6725ac..fb8e2c38fbc7 100644
> > --- a/scripts/basic/Makefile
> > +++ b/scripts/basic/Makefile
> > @@ -14,3 +14,8 @@ cmd_create_randstruct_seed =3D \
> >  $(obj)/randstruct.seed: $(gen-randstruct-seed) FORCE
> >         $(call if_changed,create_randstruct_seed)
> >  always-$(CONFIG_RANDSTRUCT) +=3D randstruct.seed
> > +
> > +# integer-wrap: if the .scl file changes, we need to do a full rebuild=
.
> > +$(obj)/../../include/generated/integer-wrap.h: $(srctree)/scripts/inte=
ger-wrap-ignore.scl FORCE
> > +       $(call if_changed,touch)
> > +always-$(CONFIG_UBSAN_INTEGER_WRAP) +=3D ../../include/generated/integ=
er-wrap.h
>
> I'm not sure how this fake header stuff works to ensure builds deps
> are tracked properly but we do need scl files to be considered as part
> of complete builds, so:

As in, I'm sure it works but have personally never written or reviewed
a Makefile+generated header snippet like that before :)

>
> Acked-by: Justin Stitt <justinstitt@google.com>
>
> > --
> > 2.34.1
> >
