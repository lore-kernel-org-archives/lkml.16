Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF2FE1B043A
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 09:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747302224; cv=none; b=YmkLmGOgWT1X/9yhbhtaPMp/vHE/TLh2M6mGMbftkQxOGsga04R0Eg4gg4bF4nGnItaP+R9ezc+9vD4/cceijPqqnwKLC+bx231CLBS+ovFu378nkR1D9fiM3eWt2/pCiXteggdPFHXvpUw0CBQVV40MDy8flmx/kRBc16InsLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747302224; c=relaxed/simple;
	bh=QsX2PdNg8RwcnA75UChZOVeuwinCogeZNpjMJzayegg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DLUBkMleb69mpJHGJx3vrJvQGDrH4fcPJgkP3+SoNLJeUz0MLxxjYx6WNxeq+uknP/HF3x7PxzSS2AAALWru4LtjrdwA4v9XQkqsj9mwb35u608Diymz4Y6MC5ea1eBC6KSbFwQWM+tMvhtHxOUeLNjZ5qAdvtb4oTyU//OmJLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rgZv1MMz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rgZv1MMz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50C51C4AF0B
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 09:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747302221;
	bh=QsX2PdNg8RwcnA75UChZOVeuwinCogeZNpjMJzayegg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rgZv1MMzsffCohjzOSX+KY7DM2y7WGjaIs8RwCYGxIQNHhnqHuFEveAB3eVkhLvG5
	 KYkDNrSsZO1dNPthM2bcC8vFRGMdxWBnwmuEPmgi2fFEmZuzYaCN4IquEfh8AQe4NE
	 C2oGp+NcHgnXIdpUXQzmLIhaUyWlgkd2c5vLBoFRNmA8mWv5yi46bkODmuW+KTRJRU
	 VK4CZ0Ux4u3Z3MBc96Lk7ujlDCzlvrFLn/viKmULsQ8Q/eEi9swnYyb8kNQmKIm+OP
	 /c4RtlgdGUiK99/juz522QNo43SJRoxwH4nOzuecVlkWZjZ8tm+YnC3/PRcBethaXm
	 SAqIRzEo1oKhA==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-326c1f3655eso6573031fa.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 02:43:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWpZMimOTJv2j6diot1m1+ngnQprTHH2gun1+VK2Q+rc3x8NfIrq4pKU0mOaH0H3dkL+vS/9zMYJQ+/uuI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzVqxqybTcKX1DO8Kt3FpY+Tt9NJWj5QRGTi8NlnSYP5fgWLIu
	6SfT2/hogvU81sqd1zi7xvY/Kd6knDCm1lVRmzSPC1pMCX2DUESqyozODa8YBawvfL/eyrOQo7z
	tQBD5S+VSq1bq+oEqty2tOTMpM3g=
X-Google-Smtp-Source: AGHT+IHCx29c+ufx3QhiIasO774jMIENEARapg/bnNAHLarfAANPyapXcEpo/MJmZz5LoCElWAqOG/rrns4KRfN08ZM=
X-Received: by 2002:a05:651c:1544:b0:30c:50fc:fb98 with SMTP id
 38308e7fff4ca-327fabdca52mr6000631fa.13.1747302219662; Thu, 15 May 2025
 02:43:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514104242.1275040-9-ardb+git@google.com> <20250514104242.1275040-13-ardb+git@google.com>
 <loshl2p4k2p7pvgwsympb3f5jisv4cnt5eh4gqabd3cdaifoeu@bahujxd4qvrl>
In-Reply-To: <loshl2p4k2p7pvgwsympb3f5jisv4cnt5eh4gqabd3cdaifoeu@bahujxd4qvrl>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 15 May 2025 10:43:27 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGUmmBuho7PM3iQAjY33kjxT2qwM7jNoNvLHf6rmTdDYg@mail.gmail.com>
X-Gm-Features: AX0GCFtA3C8Bwxw2Srf738gsbWzhgvu4OOW6JT6BkbBe9TYst_RiKECVzEEB2wM
Message-ID: <CAMj1kXGUmmBuho7PM3iQAjY33kjxT2qwM7jNoNvLHf6rmTdDYg@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] x86/boot: Set 5-level paging CPU cap before
 entering C code
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, x86@kernel.org, 
	Ingo Molnar <mingo@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Brian Gerst <brgerst@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 15 May 2025 at 09:00, Kirill A. Shutemov <kirill@shutemov.name> wrote:
>
> On Wed, May 14, 2025 at 12:42:47PM +0200, Ard Biesheuvel wrote:
> > From: Ard Biesheuvel <ardb@kernel.org>
> >
> > In order for pgtable_l5_enabled() to be reliable wherever it is used and
> > however early, set the associated CPU capability from asm code before
> > entering the startup C code.
> >
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > ---
> >  arch/x86/include/asm/cpufeature.h | 12 +++++++++---
> >  arch/x86/kernel/cpu/common.c      |  3 ---
> >  arch/x86/kernel/head_64.S         | 15 +++++++++++++++
> >  3 files changed, 24 insertions(+), 6 deletions(-)
> >
> > diff --git a/arch/x86/include/asm/cpufeature.h b/arch/x86/include/asm/cpufeature.h
> > index 893cbca37fe9..1b5de40e7bf7 100644
> > --- a/arch/x86/include/asm/cpufeature.h
> > +++ b/arch/x86/include/asm/cpufeature.h
> > @@ -2,10 +2,10 @@
> >  #ifndef _ASM_X86_CPUFEATURE_H
> >  #define _ASM_X86_CPUFEATURE_H
> >
> > +#ifdef __KERNEL__
> > +#ifndef __ASSEMBLER__
> >  #include <asm/processor.h>
> >
> > -#if defined(__KERNEL__) && !defined(__ASSEMBLER__)
> > -
> >  #include <asm/asm.h>
> >  #include <linux/bitops.h>
> >  #include <asm/alternative.h>
> > @@ -137,5 +137,11 @@ static __always_inline bool _static_cpu_has(u16 bit)
> >  #define CPU_FEATURE_TYPEVAL          boot_cpu_data.x86_vendor, boot_cpu_data.x86, \
> >                                       boot_cpu_data.x86_model
> >
> > -#endif /* defined(__KERNEL__) && !defined(__ASSEMBLER__) */
> > +#else /* !defined(__ASSEMBLER__) */
> > +     .macro  setup_force_cpu_cap, cap:req
> > +     btsl    $\cap % 32, boot_cpu_data+CPUINFO_x86_capability+4*(\cap / 32)(%rip)
> > +     btsl    $\cap % 32, cpu_caps_set+4*(\cap / 32)(%rip)
> > +     .endm
> > +#endif /* !defined(__ASSEMBLER__) */
> > +#endif /* defined(__KERNEL__) */
> >  #endif /* _ASM_X86_CPUFEATURE_H */
> > diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
> > index f6f206743d6a..c8954dc2fb26 100644
> > --- a/arch/x86/kernel/cpu/common.c
> > +++ b/arch/x86/kernel/cpu/common.c
> > @@ -1752,9 +1752,6 @@ static void __init early_identify_cpu(struct cpuinfo_x86 *c)
> >       setup_clear_cpu_cap(X86_FEATURE_PCID);
> >  #endif
> >
> > -     if (IS_ENABLED(CONFIG_X86_5LEVEL) && (native_read_cr4() & X86_CR4_LA57))
> > -             setup_force_cpu_cap(X86_FEATURE_5LEVEL_PAGING);
> > -
> >       detect_nopl();
> >  }
> >
> > diff --git a/arch/x86/kernel/head_64.S b/arch/x86/kernel/head_64.S
> > index 069420853304..191d5947a762 100644
> > --- a/arch/x86/kernel/head_64.S
> > +++ b/arch/x86/kernel/head_64.S
> > @@ -27,6 +27,7 @@
> >  #include <asm/fixmap.h>
> >  #include <asm/smp.h>
> >  #include <asm/thread_info.h>
> > +#include <asm/cpufeature.h>
> >
> >  /*
> >   * We are not able to switch in one step to the final KERNEL ADDRESS SPACE
> > @@ -58,6 +59,20 @@ SYM_CODE_START_NOALIGN(startup_64)
> >        */
> >       mov     %rsi, %r15
> >
> > +#ifdef CONFIG_X86_5LEVEL
>
> Is #ifdef really needed?
>

'Really needed' no but setting this capability is semantically murky
if the kernel is not configured to support it. But you wouldn't get
far in that case, so it doesn't matter much in practice.
