Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B178F66
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 12:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747310628; cv=none; b=bIADXJZNbpddLeJhr4Oi3s7BxIaWSwtdo9j57q4fVky5vKoAZRp82+SeRCgxKF4okX5uYvCEObAO+vkStRV/MktEad2Sj55cZ1llrGIFfVQiIUrygoalEsK97YJTYMdXhh6vaCZK2mktSH5h/GfvfqGrQD+kX5Q8MBEegBD53rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747310628; c=relaxed/simple;
	bh=nExWvVFyM7jIQZsP9axMrOTccp1iIIx/OKJJCBIt83A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mm4TI6mmG/mGlMaSGed3CfkOIh7iAidc4dyU66TcgpqpT8HSGbYF/4yji1Q15+BuQvu286CU/rWy3KRpTh/eaVGuKwpnQGnq1swnMsYi0nWEhXucWttw944J3kpZdPqqRF4nprzdNsxzzOaR5Ndfs9lrHBxSD0RIaGslsCijqFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=D2cTpSzu; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="D2cTpSzu"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e7311e66a8eso801663276.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 05:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747310626; x=1747915426; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3wJvNJM3iWYUox8bI9g2NYJL06xVVnQ0A08ak76PpHM=;
        b=D2cTpSzu4IwpHtiEOOw4aT6LJ7fsOt60tXwv1YOAkxLeipRJ+Q9n/ONk34EVoc2lpS
         KoisakSHFoG4kqIGSv29I4VZXHh6EZhnSuvC0yWksRS6VDEUzY0YGooxYiiI82dRmSmy
         OZR/XmX0o86zQkKGU6/iDc59BMbQK3F8xBGbsxddpZq4cmcyH8E3iO+63hoYYnw+Hvgt
         558y+1YEnOmFJK/MewYbw6sLmLkpLmp0YPsQCSaAwb1m4Ix4SnR8G/0m1Gd/wIkCA+Ci
         VF3g3aLnm+5U97616sv5/wqC+QBwSTOayCH6/64/+cIeR2j942/iFc3i4DpuLVDiUj7k
         z1EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747310626; x=1747915426;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3wJvNJM3iWYUox8bI9g2NYJL06xVVnQ0A08ak76PpHM=;
        b=MdIdcgZrxjpy0LPjWvldEJ0n0PMZII4TgWr0MpS27obOBYgceWx9/oeERAZjiD/jra
         bp0/IVhZY+qv6HJcyrkK70kX0+C6aWGH6dYmcZlveXlgnw7OQGc0qvExKziSddkdvw45
         0cBPyvrGJEUyQryI1llrSOnvbeZIkLMgypIWrChgduy1NCARIRmuFmpqI/9in77eKKbU
         he8Ejgk02QCaB2+BLCNs9SN1WKCQsp/R/BrY41IDE0KjT5KoBnk4gMJGs9b5TVNaBkSR
         +IG+wMM9ypiyTKtdRpUmX6fOOA/sj9kb78IOBQVGhwyV2vBSn1SGLAz2Z6R5MoyWB4aj
         ROwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTMRWyDpNiAT9xe1k3A89kOcFkRha8SJHDARqVEyBCv4GAGQLKoNaX0whPYc9x3WrRgbM1y6T7wfkeaFM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQw24izA/qxObeu/tyTOfpCcDtlPA/BsxQPrwoGPxohrFKSBOp
	KnExzRTa8XvEYfk9Tg464kBycbaDfIZwr65PwkGVhcKTdy0OqPuJU+Th1wblCuT+1U5SsjcvUfQ
	+gTlaO8bl+EJl7qgLnFXza4eQme9OJE+zv5upycoNoPDYGOvmrQkG
X-Gm-Gg: ASbGncuXCGNmWwndJmwjBHtz/VlBNR76sWBowNUQP92SC+bK7NDt/0qmSJZYCu61gfS
	yXtnPsR4HPNl2GhNR+wKhqTdWDmrmY8VKDqDT1WaXHxHsriaH3V0LxAZztoigQ7Kxxu9QRe7hw2
	vUUUfcXtZRviTRall9+wZvU81ww61PtO9+Xxus1PA94Q619YOOpOHKJAtMIDz2Bec=
X-Google-Smtp-Source: AGHT+IH+MpBYSUJL7HryIdxv6rUra/ypIaLr4RiTqen/uVAAbevecSAeC/xuuasQV/4uRe2a/wkkAc0De5YPFRPk/B4=
X-Received: by 2002:a17:903:1b0f:b0:22e:3b65:9265 with SMTP id
 d9443c01a7336-2319810fdcbmr77926775ad.8.1747310614801; Thu, 15 May 2025
 05:03:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250501-rust-kcov-v2-1-b71e83e9779f@google.com> <CACT4Y+Yzmd7BtrpqUPrbXAAGzMnO0YKZnhVxLgyyXEftscEUnQ@mail.gmail.com>
In-Reply-To: <CACT4Y+Yzmd7BtrpqUPrbXAAGzMnO0YKZnhVxLgyyXEftscEUnQ@mail.gmail.com>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Thu, 15 May 2025 14:03:22 +0200
X-Gm-Features: AX0GCFstD_4uJYWfNb5g_AdONBqYpFEcU11UPC3GcRCSjJ-WcVpH60WtoBj7ozc
Message-ID: <CANp29Y7+7Fa5_rAEwJYoWnKHXy+BS4mFWoMe=1J4ocnCuqYtfQ@mail.gmail.com>
Subject: Re: [PATCH v2] kcov: rust: add flags for KCOV with Rust
To: Dmitry Vyukov <dvyukov@google.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, kasan-dev@googlegroups.com, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
	Matthew Maurer <mmaurer@google.com>, Alexander Potapenko <glider@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-mm <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

+mm

On Thu, May 15, 2025 at 2:01=E2=80=AFPM Dmitry Vyukov <dvyukov@google.com> =
wrote:
>
> On Thu, 1 May 2025 at 14:16, Alice Ryhl <aliceryhl@google.com> wrote:
> >
> > Rust code is currently not instrumented properly when KCOV is enabled.
> > Thus, add the relevant flags to perform instrumentation correctly. This
> > is necessary for efficient fuzzing of Rust code.
> >
> > The sanitizer-coverage features of LLVM have existed for long enough
> > that they are available on any LLVM version supported by rustc, so we d=
o
> > not need any Kconfig feature detection. The coverage level is set to 3,
> > as that is the level needed by trace-pc.
> >
> > We do not instrument `core` since when we fuzz the kernel, we are
> > looking for bugs in the kernel, not the Rust stdlib.
> >
> > Co-developed-by: Matthew Maurer <mmaurer@google.com>
> > Signed-off-by: Matthew Maurer <mmaurer@google.com>
> > Reviewed-by: Alexander Potapenko <glider@google.com>
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
>
> Reviewed-by: Dmitry Vyukov <dvyukov@google.com>
>
> > ---
> > I did not pick up the Tested-by due to the changes. I verified that it
> > looks right under objdump, but I don't have a syzkaller setup I can try
> > it with.
> > ---
> > Changes in v2:
> > - Ignore `core` in KCOV.
> > - Link to v1: https://lore.kernel.org/r/20250430-rust-kcov-v1-1-b9ae941=
48175@google.com
> > ---
> >  rust/Makefile         | 1 +
> >  scripts/Makefile.kcov | 6 ++++++
> >  scripts/Makefile.lib  | 3 +++
> >  3 files changed, 10 insertions(+)
> >
> > diff --git a/rust/Makefile b/rust/Makefile
> > index 3aca903a7d08cfbf4d4e0f172dab66e9115001e3..80c84749d734842774a3ac2=
aabbc944a68d02484 100644
> > --- a/rust/Makefile
> > +++ b/rust/Makefile
> > @@ -492,6 +492,7 @@ $(obj)/core.o: $(RUST_LIB_SRC)/core/src/lib.rs \
> >  ifneq ($(or $(CONFIG_X86_64),$(CONFIG_X86_32)),)
> >  $(obj)/core.o: scripts/target.json
> >  endif
> > +KCOV_INSTRUMENT_core.o :=3D n
> >
> >  $(obj)/compiler_builtins.o: private skip_gendwarfksyms =3D 1
> >  $(obj)/compiler_builtins.o: private rustc_objcopy =3D -w -W '__*'
> > diff --git a/scripts/Makefile.kcov b/scripts/Makefile.kcov
> > index 67e8cfe3474b7dcf7552e675cffe356788e6c3a2..ddcc3c6dc513e1988aeaf07=
b8efa106e8dffa640 100644
> > --- a/scripts/Makefile.kcov
> > +++ b/scripts/Makefile.kcov
> > @@ -3,4 +3,10 @@ kcov-flags-$(CONFIG_CC_HAS_SANCOV_TRACE_PC)    +=3D -f=
sanitize-coverage=3Dtrace-pc
> >  kcov-flags-$(CONFIG_KCOV_ENABLE_COMPARISONS)   +=3D -fsanitize-coverag=
e=3Dtrace-cmp
> >  kcov-flags-$(CONFIG_GCC_PLUGIN_SANCOV)         +=3D -fplugin=3D$(objtr=
ee)/scripts/gcc-plugins/sancov_plugin.so
> >
> > +kcov-rflags-y                                  +=3D -Cpasses=3Dsancov-=
module
> > +kcov-rflags-y                                  +=3D -Cllvm-args=3D-san=
itizer-coverage-level=3D3
> > +kcov-rflags-y                                  +=3D -Cllvm-args=3D-san=
itizer-coverage-trace-pc
> > +kcov-rflags-$(CONFIG_KCOV_ENABLE_COMPARISONS)  +=3D -Cllvm-args=3D-san=
itizer-coverage-trace-compares
> > +
> >  export CFLAGS_KCOV :=3D $(kcov-flags-y)
> > +export RUSTFLAGS_KCOV :=3D $(kcov-rflags-y)
> > diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> > index 2fe73cda0bddb9dcf709d0a9ae541318d54754d2..520905f19a9b19631394cfb=
5e129effb8846d5b8 100644
> > --- a/scripts/Makefile.lib
> > +++ b/scripts/Makefile.lib
> > @@ -169,6 +169,9 @@ ifeq ($(CONFIG_KCOV),y)
> >  _c_flags +=3D $(if $(patsubst n%,, \
> >         $(KCOV_INSTRUMENT_$(target-stem).o)$(KCOV_INSTRUMENT)$(if $(is-=
kernel-object),$(CONFIG_KCOV_INSTRUMENT_ALL))), \
> >         $(CFLAGS_KCOV))
> > +_rust_flags +=3D $(if $(patsubst n%,, \
> > +       $(KCOV_INSTRUMENT_$(target-stem).o)$(KCOV_INSTRUMENT)$(if $(is-=
kernel-object),$(CONFIG_KCOV_INSTRUMENT_ALL))), \
> > +       $(RUSTFLAGS_KCOV))
> >  endif
> >
> >  #
> >
> > ---
> > base-commit: 9c32cda43eb78f78c73aee4aa344b777714e259b
> > change-id: 20250430-rust-kcov-6c74fd0f1f06
> >
> > Best regards,
> > --
> > Alice Ryhl <aliceryhl@google.com>
> >
