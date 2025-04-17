Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4565253B5F
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 15:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744904966; cv=none; b=Kb7u0zAWkH5v4R4fdGvESDYahOhZlL88zW0NMeWwytKc/fULa8NyjilAuiV9YhQOsX7y4llY0RKIeprRsAc/X7zWBG7Qw5z9Pyl6xQWflZWzG3QMqjFwq6jPCiHJG0qgJRORRTgPDPYXmegzuS+Te9Pv11xRtqmrNLKc9yZAqOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744904966; c=relaxed/simple;
	bh=v88qvpOGrdSYWmgawQMQojD6+tgy11v8SA8unTglivI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cfr5GDk2C/S/1vyT37+9KiwLULxFRYPtXCiEAekY7vIufdtKUz5QtpFA/JMq+TVNNg7GtRzPUGmQpKpoQ4d0u3fu7GknM6HXDWN2BqpthZwY524lNjMWcGLKarmIAI69F9bMcmG52Mp2hoXEDVDzV9x1iJZ1cWj9zbn6n4oeTMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=moucwpso; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="moucwpso"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36A30C4CEEC
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 15:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744904966;
	bh=v88qvpOGrdSYWmgawQMQojD6+tgy11v8SA8unTglivI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=moucwpsoX3VpjX9kdhxpk3mcYrK2ZsQRUen/SzxM/ypCm/MoZoJwvJFbcrFpUuQB7
	 Z6PGRUIajzcnXZgLI40KrnOC4m9cOY67Mn2JJMxx/md49zTgNuhtgsL/lE8SKlxwsh
	 owPHSWI8q6kvUioeS1TqQv7G0NEIbOvYqv5D11fGnZaMe/W36cTR7AX86RIy8yUUBj
	 FtbbsFKzpvjIr3QCW9pFM2chIpbBKHfw3S9P9TefoWWy5Fz702O5XwXuJw7W2n9+dM
	 +Eku1ye1/RSEJDkLDD2DS/WZmJ6fTzBpSNaWqvfpPU5ZwJyckBXep2WrrjkPYgbhb1
	 xLw7WWxRWf5aw==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54993c68ba0so1180227e87.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 08:49:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXmo5YhuI69CppTjvg2OjIKNwb7dXGy8mEujk1se/fbZnqc/TkO9b81FDQVBN8IlkQXlHrpmKgK8x7Lw2M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy39QLnCSjrMwsWPE6q6r+tnmQ4+Npp0NZAB+g1pEyqbeVKsrai
	toYaC7P2xJcJqca3ZtxY3c5mhhYyLQHwmXDB4eh1VzgvlOjno0R/UwH0zCsv+f/uOxS/09ocdFL
	OR5A+15AISmMeBgEq52Wlg5qRKrw=
X-Google-Smtp-Source: AGHT+IHMCsaB6q1nQYkkfntZemdfWEcr4m5pUBaz7P/cLtG5RXm9EA++uSRY18buY7rrRiAskS3d3cu7NTkY2mUgGbw=
X-Received: by 2002:a05:6512:3f2a:b0:54a:f76a:6f83 with SMTP id
 2adb3069b0e04-54d6deaf5ffmr8263e87.13.1744904964553; Thu, 17 Apr 2025
 08:49:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416085446.480069-1-glider@google.com> <20250416085446.480069-7-glider@google.com>
 <cb6d98dc-49e9-2d3b-1acc-f208e4fd13fc@gmail.com> <CAG_fn=W8GDqYy_JV1F=YypD-6qR6vEqMuCi=DKfhdM-5=N3DdA@mail.gmail.com>
In-Reply-To: <CAG_fn=W8GDqYy_JV1F=YypD-6qR6vEqMuCi=DKfhdM-5=N3DdA@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 17 Apr 2025 17:49:13 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEARA1KnD95RO=huLeQ-8nLsGixg0nOx01k4jgkb-2GYQ@mail.gmail.com>
X-Gm-Features: ATxdqUHMyy9TKm-n_7IAa_RrWRgIKhy0z62cRrwI2HOntcJj5Vopd3FWYI3r-Io
Message-ID: <CAMj1kXEARA1KnD95RO=huLeQ-8nLsGixg0nOx01k4jgkb-2GYQ@mail.gmail.com>
Subject: Re: [PATCH 6/7] x86: objtool: add support for R_X86_64_REX_GOTPCRELX
To: Alexander Potapenko <glider@google.com>
Cc: Uros Bizjak <ubizjak@gmail.com>, quic_jiangenj@quicinc.com, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, x86@kernel.org, 
	Aleksandr Nogikh <nogikh@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Ingo Molnar <mingo@redhat.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Marco Elver <elver@google.com>, 
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, 17 Apr 2025 at 17:37, Alexander Potapenko <glider@google.com> wrote=
:
>
> On Wed, Apr 16, 2025 at 4:21=E2=80=AFPM Uros Bizjak <ubizjak@gmail.com> w=
rote:
> >
> >
> >
> > On 16. 04. 25 10:54, Alexander Potapenko wrote:
> > > When compiling modules with -fsanitize-coverage=3Dtrace-pc-guard, Cla=
ng
> > > will emit R_X86_64_REX_GOTPCRELX relocations for the
> > > __start___sancov_guards and __stop___sancov_guards symbols. Although
> > > these relocations can be resolved within the same binary, they are le=
ft
> > > over by the linker because of the --emit-relocs flag.
> > >

Not sure what you mean here - --emit-relocs is not used for modules,
only for vmlinux.

> > > This patch makes it possible to resolve the R_X86_64_REX_GOTPCRELX
> > > relocations at runtime, as doing so does not require a .got section.

Why not? R_X86_64_REX_GOTPCRELX is *not* a PC32 reference to the
symbol, it is a PC32 reference to a 64-bit global variable that
contains the absolute address of the symbol.

> > > In addition, add a missing overflow check to R_X86_64_PC32/R_X86_64_P=
LT32.
> > >
> > > Cc: x86@kernel.org
> > > Signed-off-by: Alexander Potapenko <glider@google.com>
> > > ---
> > >   arch/x86/include/asm/elf.h      | 1 +
> > >   arch/x86/kernel/module.c        | 8 ++++++++
> > >   arch/x86/um/asm/elf.h           | 1 +
> > >   tools/objtool/arch/x86/decode.c | 1 +
> > >   4 files changed, 11 insertions(+)
> > >
> > > diff --git a/arch/x86/include/asm/elf.h b/arch/x86/include/asm/elf.h
> > > index 1fb83d47711f9..15d0438467e94 100644
> > > --- a/arch/x86/include/asm/elf.h
> > > +++ b/arch/x86/include/asm/elf.h
> > > @@ -63,6 +63,7 @@ typedef struct user_i387_struct elf_fpregset_t;
> > >   #define R_X86_64_8          14      /* Direct 8 bit sign extended  =
*/
> > >   #define R_X86_64_PC8                15      /* 8 bit sign extended =
pc relative */
> > >   #define R_X86_64_PC64               24      /* Place relative 64-bi=
t signed */
> > > +#define R_X86_64_REX_GOTPCRELX       42      /* R_X86_64_GOTPCREL wi=
th optimizations */
> > >

Why do you need this? arch/x86/kernel/module.c already has a reference
to R_X86_64_REX_GOTPCRELX so surely it is defined already somewhere.

> > >   /*
> > >    * These are used to set parameters in the core dumps.
> > > diff --git a/arch/x86/kernel/module.c b/arch/x86/kernel/module.c
> > > index 8984abd91c001..6c8b524bfbe3b 100644
> > > --- a/arch/x86/kernel/module.c
> > > +++ b/arch/x86/kernel/module.c
> > > @@ -133,6 +133,14 @@ static int __write_relocate_add(Elf64_Shdr *sech=
drs,
> > >               case R_X86_64_PC32:
> > >               case R_X86_64_PLT32:
> > >                       val -=3D (u64)loc;
> > > +                     if ((s64)val !=3D *(s32 *)&val)
> > > +                             goto overflow;
> > > +                     size =3D 4;
> > > +                     break;
> > > +             case R_X86_64_REX_GOTPCRELX:
> > > +                     val -=3D (u64)loc;
> > > +                     if ((s64)val !=3D *(s32 *)&val)
> > > +                             goto overflow;
> > >                       size =3D 4;
> > >                       break;
> >
> > These two cases are the same. You probably want:
> >
> >                 case R_X86_64_PC32:
> >                 case R_X86_64_PLT32:
> >                 case R_X86_64_REX_GOTPCRELX:
> >                         val -=3D (u64)loc;
> >                         if ((s64)val !=3D *(s32 *)&val)
> >                                 goto overflow;
> >                         size =3D 4;
> >                         break;
> >
>
> You are right, I overlooked this, as well as the other
> R_X86_64_REX_GOTPCRELX case above.

They are most definitely *not* the same.

> Ard, do you think we can relax the code handling __stack_chk_guard to
> accept every R_X86_64_REX_GOTPCRELX relocation?

Isn't it possible to discourage Clang from using
R_X86_64_REX_GOTPCRELX? Does -fdirect-access-external-data make any
difference here?

In any case, to resolve these relocations correctly, the reference
need to be made to point to global variables that carry the absolute
addresses of __start___sancov_guards and __stop___sancov_guards.
Ideally, these variables would be allocated and populated on the fly,
similar to how the linker allocates GOT entries at build time. But
this adds a lot of complexity for something that we don't want to see
in the first place.

Alternatively, the references could be relaxed, i.e., MOV converted to
LEA etc. The x86 ELF psABI describes how this is supposed to work for
R_X86_64_REX_GOTPCRELX but it involves rewriting the instructions so
it is a bit tedious.

But it would be much better to just fix the compiler.
