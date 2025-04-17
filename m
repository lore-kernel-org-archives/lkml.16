Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F5722687C
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 15:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744904269; cv=none; b=cSxe44eHwwGG1mz5LvC5DsUbowBbe8eRabn/KRkRSzGwWPNJbDPl1nLAFWvf42Sye5eM8o3+kVtyANoXoKe7xEOdRmwr55/TRkEp6gq0IAZBpjKbiMtPghOCnay7AzLNnLl8zPOX706Uoqi1ySS7ME3toUk+Qqi4KpG+/QuiraM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744904269; c=relaxed/simple;
	bh=2Msp8WmlmXe1BOtKwVoz4D+koSrCPnvLMOaihrPblgI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nTwjulDTX0Z83C7ki0uxxbTXQIynGGEhd6kbaXGGQ+nOja1duB4z7OJRYGIaaJS1kakWanK80o2T1WbNhLayGaTlHfrkijqRGbP2/z6IOuID+WfCJJuYjNxPX785+fDo6I9Bb8vQ4ZOlih0+Qqs+s6fUbmZu+YUiHhnIPYwl2UI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gSV17Kif; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gSV17Kif"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6f0c30a1cf8so12803746d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 08:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744904266; x=1745509066; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1MyAnJTr6eQCZG3FgtbZ7+3YB/W35AyW1Th3bTHG7vk=;
        b=gSV17KifLfQi4TD0gOeVYuUlm9n4gA7/rVBdn6tAfUPIjHEdV9bKOEncZM404p6Yad
         4CkHdLAK3WQOSlpDOmtHpvkUUrJs3y+QOpfyCwirGR/tdIJYOScRuoGeRnR7eNqev+i4
         9pKHdeBoBom0NKFknik1CPSoA4++N2fQ8Hzno//gge1LxIgSKsgdSqpf8QgWpTkJqjwp
         M1JPaqvErmuAV4dfGclx1jZRBP8utnJFpIecF9DuLO9QM717irRy1DSbnFFIHY65QbrD
         z94CghCTSie0XK5ITKC4LrMRNDubJ9uAW0kMCyOf2pPUONV2HuRMoTQ+/3cTpMKyinvW
         S8zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744904266; x=1745509066;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1MyAnJTr6eQCZG3FgtbZ7+3YB/W35AyW1Th3bTHG7vk=;
        b=Ru33Bq+KXfjS6lj72uOeZ9m3C9bkUVsVq0egAP+y8OMfu6E2NHbumS8fRTfPdsVncq
         WFAu3w5vTR+pJB216zIVN9aurcx5DqxsmDpWEvIlTCePeBcwM5rfhZLCuDNiErRX6w5F
         iu2UjwtCcUh30Ygepjk5dVqzOa8LPZ/m3pPEpyl4q/Tics/mmQtYC/iuAdxvMyIcT4W7
         P2VjPsY5Bjl4UxARMb0AhNvaX+odJcDWtDsGzn89rMcmL/92tancp7neqp7dspLcLzFH
         2c0/kT6g7q0Vr+RsbBDk4OCSJEIO4QzeqVcRSCK/RljLVwkoFfd65zbrzAr2Bej2IY41
         yvjw==
X-Forwarded-Encrypted: i=1; AJvYcCWhBz4QBPE8q9RppIU3iDOjqJBGkG1hHu42ftD9CjyNeO1Qfpy63+ynOaVNsd7Xqucra11m9t5enehKcuQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw731s5wUaFN1z1m47hWhO+UEnqZRow+awgMOKFZsnFrIse8ISj
	h9ekSbqSTL+HHcg8Mfs0uQzIrCOTMPsrs5eQ839Uh6cUzcmE/c0IjxLJr1eJOJv3avLxXqdj/2i
	6CBQIGDyZCpY4Qwh+5z3QQ3/COMxXSxigVz82
X-Gm-Gg: ASbGncvyB+04/tKxgqkvNljnyl1C+kLvEhe295V8cfLMaLN82LJKS3pqIEjUBrCA2su
	vRQGsBu2dLuMYQVLv+VfIrNG0BSqkboh+ergRzDDQXFQ/7MqY0iohmtw4kwHpmwNmZhwOPeuXvK
	uJdZ1VEKh73sKbKkkMRFHunstxoUl95HtYLwoZI4zWHlWfJl2su+yl
X-Google-Smtp-Source: AGHT+IEs2561XTO/1Ve+MnCxcw2e29ym4EDvEKrONPtk2dfQV5yd4Nu/YOGfLWC6BWoSpXUB+e0SbALJ/kNHjW5pARo=
X-Received: by 2002:a05:6214:226c:b0:6e8:ed7f:1a79 with SMTP id
 6a1803df08f44-6f2b304be07mr111127706d6.32.1744904266134; Thu, 17 Apr 2025
 08:37:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416085446.480069-1-glider@google.com> <20250416085446.480069-7-glider@google.com>
 <cb6d98dc-49e9-2d3b-1acc-f208e4fd13fc@gmail.com>
In-Reply-To: <cb6d98dc-49e9-2d3b-1acc-f208e4fd13fc@gmail.com>
From: Alexander Potapenko <glider@google.com>
Date: Thu, 17 Apr 2025 17:37:09 +0200
X-Gm-Features: ATxdqUF6tyoL-d94GB69k__O5KRs0S2IIOkhLY92J9CAUkV5rKaE2SdyZimOJzY
Message-ID: <CAG_fn=W8GDqYy_JV1F=YypD-6qR6vEqMuCi=DKfhdM-5=N3DdA@mail.gmail.com>
Subject: Re: [PATCH 6/7] x86: objtool: add support for R_X86_64_REX_GOTPCRELX
To: Uros Bizjak <ubizjak@gmail.com>, Ard Biesheuvel <ardb@kernel.org>
Cc: quic_jiangenj@quicinc.com, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, x86@kernel.org, 
	Aleksandr Nogikh <nogikh@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Ingo Molnar <mingo@redhat.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Marco Elver <elver@google.com>, 
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2025 at 4:21=E2=80=AFPM Uros Bizjak <ubizjak@gmail.com> wro=
te:
>
>
>
> On 16. 04. 25 10:54, Alexander Potapenko wrote:
> > When compiling modules with -fsanitize-coverage=3Dtrace-pc-guard, Clang
> > will emit R_X86_64_REX_GOTPCRELX relocations for the
> > __start___sancov_guards and __stop___sancov_guards symbols. Although
> > these relocations can be resolved within the same binary, they are left
> > over by the linker because of the --emit-relocs flag.
> >
> > This patch makes it possible to resolve the R_X86_64_REX_GOTPCRELX
> > relocations at runtime, as doing so does not require a .got section.
> > In addition, add a missing overflow check to R_X86_64_PC32/R_X86_64_PLT=
32.
> >
> > Cc: x86@kernel.org
> > Signed-off-by: Alexander Potapenko <glider@google.com>
> > ---
> >   arch/x86/include/asm/elf.h      | 1 +
> >   arch/x86/kernel/module.c        | 8 ++++++++
> >   arch/x86/um/asm/elf.h           | 1 +
> >   tools/objtool/arch/x86/decode.c | 1 +
> >   4 files changed, 11 insertions(+)
> >
> > diff --git a/arch/x86/include/asm/elf.h b/arch/x86/include/asm/elf.h
> > index 1fb83d47711f9..15d0438467e94 100644
> > --- a/arch/x86/include/asm/elf.h
> > +++ b/arch/x86/include/asm/elf.h
> > @@ -63,6 +63,7 @@ typedef struct user_i387_struct elf_fpregset_t;
> >   #define R_X86_64_8          14      /* Direct 8 bit sign extended  */
> >   #define R_X86_64_PC8                15      /* 8 bit sign extended pc=
 relative */
> >   #define R_X86_64_PC64               24      /* Place relative 64-bit =
signed */
> > +#define R_X86_64_REX_GOTPCRELX       42      /* R_X86_64_GOTPCREL with=
 optimizations */
> >
> >   /*
> >    * These are used to set parameters in the core dumps.
> > diff --git a/arch/x86/kernel/module.c b/arch/x86/kernel/module.c
> > index 8984abd91c001..6c8b524bfbe3b 100644
> > --- a/arch/x86/kernel/module.c
> > +++ b/arch/x86/kernel/module.c
> > @@ -133,6 +133,14 @@ static int __write_relocate_add(Elf64_Shdr *sechdr=
s,
> >               case R_X86_64_PC32:
> >               case R_X86_64_PLT32:
> >                       val -=3D (u64)loc;
> > +                     if ((s64)val !=3D *(s32 *)&val)
> > +                             goto overflow;
> > +                     size =3D 4;
> > +                     break;
> > +             case R_X86_64_REX_GOTPCRELX:
> > +                     val -=3D (u64)loc;
> > +                     if ((s64)val !=3D *(s32 *)&val)
> > +                             goto overflow;
> >                       size =3D 4;
> >                       break;
>
> These two cases are the same. You probably want:
>
>                 case R_X86_64_PC32:
>                 case R_X86_64_PLT32:
>                 case R_X86_64_REX_GOTPCRELX:
>                         val -=3D (u64)loc;
>                         if ((s64)val !=3D *(s32 *)&val)
>                                 goto overflow;
>                         size =3D 4;
>                         break;
>

You are right, I overlooked this, as well as the other
R_X86_64_REX_GOTPCRELX case above.
Ard, do you think we can relax the code handling __stack_chk_guard to
accept every R_X86_64_REX_GOTPCRELX relocation?
