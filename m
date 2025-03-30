Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541209461
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 16:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743350868; cv=none; b=UsUIYr9JnSoqE7USWJlBJ+BVnfYUMIpm7FPivvDcNcbf5RPhRWBIeFyqliDVHWJeIe8731Y5JdTZdaWnQFZEYtJ7Jkf+muT5X2xaAdivysf/RR5imSWX/3TZKmB26VP/Pt8UKUo7616pkqkkxS23ZZGrVTQ7UGnI0w0ivT2by3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743350868; c=relaxed/simple;
	bh=MuidvtBuCr/maN/jkCTDCStIFYKV56L+Y4F5hnEuqEg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MuV1Qm5IKOkIU4inXAq2kKcD1p5KjKtWCikOEHfSiPvL2+J4MulKaIw5bx5Rv7V3ajbuoua6vt2eaJ8EbnkIgRXTKFXlwgoY+UiWnHu9Xlszzc/FFnKCDEG0gSHLcgiuLPH1mKjnh3Ntj6+i2Ph+6wE2Bvt1TkloAtzFmmiLazQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EClmo1sq; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EClmo1sq"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30761be8fcfso35140011fa.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 09:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743350863; x=1743955663; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I5r0t8H32QTaVcC734qCWpNp2G6M6GRsr1m4W44smeo=;
        b=EClmo1sq5etkeFlP18eZKL7GiXTKMM++QsyXWVuBdwz1/CleUvowDeLg5qaRtVu0H8
         NHlRCnpNDbctK+jpG5ROFf1WmZkpLyvwb6k+KTmD424gLDG3lKMZv6MiQiogjEaht2XW
         DEIhSr1HlbdPkVso/GxxXm+gYe6lFwT0LZpcO5nfLU8yiIpweLYG0RD8IcR+dh5g1629
         Nz6duglfIlbmiGrCpk9I35GcCXSjeAl8wKcvNM1EXgEu/kd6KvcxWxNgt38n3ywk+tcr
         2lg4A7unoon0p68W1jpQhia5dzpRCmcuYbrvDqWzu2rUBHzfNXJjJvIStlzakD6af3yW
         CjBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743350863; x=1743955663;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I5r0t8H32QTaVcC734qCWpNp2G6M6GRsr1m4W44smeo=;
        b=ZmNxYZXuGcpYN+yWSXVFtgY8rhmEyW4pP1/MSEkmicQ2jAJo0/t4xOQrxSIHpldgV/
         l3JGGhNHa15meSWrMpct9Trqj+hcklqaALA8TxLRm9QGWekDB5dQ+eRlNWFqKitYu/JK
         aVOEoPzCOuNeK7sXMECLD3qivnVGY2LPVInXCQmUvRcWDCPkdjphaolUKDC+2ww0kTdm
         J9Yv5TV76vs6lVIWJWTY8DuKYpBP38uAxNElBdHhbDGlnC8Gd7WV2z51UNd5C7jWNMQJ
         4c7ZObdZ0FAJsNpKYY9vCqzMmcKit7lKI6vuSGt6TXLsQ0bMh3IrX0+GB2NmoGZEBGEV
         Mtpw==
X-Forwarded-Encrypted: i=1; AJvYcCWqmtDWWHLtbXA5wTiSLqsM0QakWdtdKmU+Aasu788vwlOWMRzyrgamnCWhbsYT2XcIwrcdb16cVHURGiY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvMZsZHYRLs1EutYVjFtt3NtRM/Fnj2Wyt+/7BA9yAnUt14Qew
	LvMW6fG+RzY5SU4+V78AyryIsTmv8jHJJ8Zix7HVdYTcSra8W3zTwUaWjiv8ufpDvKsXy98iP4X
	1z/0vP/SgSEH3AXJlHHVM/vQU1+A=
X-Gm-Gg: ASbGncu+tDMrmE6ZddJXJN9PIOedAgoeVtSMdx2eGocyCp9t+TDiosvBRJxL/h1APb9
	H2DD9Pbut49cnNPQg+9Es/2uyr9tsQn3D2JKPxmFFZOmZBuX+tFePZpLzO3qOXJXb5feoc7Xl9e
	7n2a6p52karmG23sxdK1QIgMMa+gzWIwpCxNQN
X-Google-Smtp-Source: AGHT+IEeJuXTs/aR+SOcC4wi/t2iG0ic4wjTopFAt9XWjxSGJW6Bxhu7MhYNq7lcJVHSmR4eK3w71M+uNsQDiKRXqUs=
X-Received: by 2002:a05:651c:1547:b0:307:dc1f:e465 with SMTP id
 38308e7fff4ca-30de0279ef2mr20012121fa.22.1743350862998; Sun, 30 Mar 2025
 09:07:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250325164854.199420-1-ubizjak@gmail.com> <20250325164854.199420-2-ubizjak@gmail.com>
 <Z-Mme_OxuhYfxgzO@gmail.com> <CAFULd4bCnnL-CBFwgAQtN9S+sUE_wikda6E+8k9632J9b62dCg@mail.gmail.com>
 <Z-kVT4ROZJXx6kui@gmail.com>
In-Reply-To: <Z-kVT4ROZJXx6kui@gmail.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Sun, 30 Mar 2025 18:07:30 +0200
X-Gm-Features: AQ5f1JpvRXZIhO4HUGitaW6mnQm0APPAAA_kXuKPl4f8aQ2T7UhJopgxOhfgX-M
Message-ID: <CAFULd4a2eOhZ4TPQRsLtN1yPYSfgqsXR_yOG+z3PedE-ZCMynw@mail.gmail.com>
Subject: Re: [PATCH -tip 2/2] x86/hweight: Use POPCNT when available with
 X86_NATIVE_CPU option
To: Ingo Molnar <mingo@kernel.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 30, 2025 at 11:56=E2=80=AFAM Ingo Molnar <mingo@kernel.org> wro=
te:
>
>
> * Uros Bizjak <ubizjak@gmail.com> wrote:
>
> > > So a better optimization I think would be to declare and implement
> > > __sw_hweight32 with a different, less intrusive function call ABI
> > > that
> >
> > With an external function, the ABI specifies the location of input
> > argument and function result.
>
> This is all within the kernel, and __sw_hweight32() is implemented in
> the kernel as well, entirely in assembly, and the ALTERNATIVE*() macros
> are fully under our control as well - so we have full control over the
> calling convention.

There is a minor issue with a generic prototype in <linux/bitops.h>,
where we declare:

extern unsigned int __sw_hweight32(unsigned int w);
extern unsigned long __sw_hweight64(__u64 w);

This creates a bit of mixup, so perhaps it is better to define and use
an x86 specific function name. With this issue out of the way, we can
use %eax/%rax as inout register for x86_32 and x86_64 targets, and
remove:

#ifdef CONFIG_64BIT
#define REG_IN "D"
#define REG_OUT "a"
#else
#define REG_IN "a"
#define REG_OUT "a"
#endif

from <arch/x86/include/asm/arch_hweight.h>

In parallel, we should remove x86_64 conditional compilation from
arch/x86/lib/hweight.S:

SYM_FUNC_START(__sw_hweight32)

#ifdef CONFIG_X86_64
movl %edi, %eax # w
#endif
__ASM_SIZE(push,) %__ASM_REG(dx)
movl %eax, %edx # w -> t
...

> Ie. in principle there's no need for the __sw_hweight32 function
> utilized by ALTERNATIVE() to be a C-call-ABI external function with all
> its call-clobbering constraints that disturbs register state affected
> by the C-call-ABI. (RSI RSI RDX RCX R8 R9)
>
> The calling convention used is the kernel's choice, which we can
> re-evaluate.
>
> For example, we could make a version of __sw_hweight32 that is a
> largely no-clobber function that only touches a single register, which
> receives its input in RAX and returns the result to RAX (as usual), and
> saves/restores everything else. This pushes overhead into the uncommon
> case (__sw_hweight32 users) and reduces register pressure on the
> calling site.
>
> I'm not saying it's *worth* it for POPCNTL emulation alone:
>
>  - The code generation benefits might or might not be there. Needs to
>    be examined.

Matching inputs with output will actually make the instruction
"destructive", so the compiler will have to copy the input argument
when it won't die in the instruction. This is not desirable. The code
generation benefits would come from relaxing input constraint to "rm",
which is not possible with a fallback function.

>
>  - There may be some trouble with on-stack red zones used by the
>    compiler, if the compiler doesn't know that a call was done.

The kernel is currently compiled with -mno-red-zone, gcc-15 introduces
special "redzone" clobber to disable red-zone in the function that
includes asm() when/if the kernel starts using redzone.

>  - Plus rolling a different calling convention down the alternatives
>    patching macros will have some maintenance overhead side effects.
>    Possibly other usecases need to be found as well for this to be
>    worth it.

I think that adding a __POPCNT__ version (similar to my original
patch) would bring the most benefit, because we could use "rm" input
and "=3Dr" output registers, without any constraints, enforced by
fallback function call. This is only possible with a new -march=3Dnative
functionality.

> But I wanted to bust the false assumption you seem to be making about
> C-call-ABI constraints.

Thanks,
Uros.
