Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4941E32C6
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 12:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746446500; cv=none; b=OfEvHRil7kYHtxnweqnVwEhJ3FRm+Bi2rcyJ7zTNJ/ePwyH1yMwX2ZttNKX080uJt7RjnDL2YEFrQM/Y0KfwNpRlO0KYjdgEFB5k9lrYHxVnvvx1GZE3VW2f9GNsBxz3gclcGg/qqqgENXrI0yABmcDbOvwRdGM0wc6SIsWX1kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746446500; c=relaxed/simple;
	bh=yKXMOm/860GCcP8OoAHCINoXDy4EwSWPW0EDzkxq178=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LQaEF/DaRCTWMBalV+0VkHBfh+yMrQIPViRzvmjjrbwm7DbYdTgxHhMMf+J6+x6ew6/Kas1v4gKPkZS4IL0c82Sf4lvAKA8totf46yv0H3K9L8rui3+tNOYKcatcHF7H5Qd5ugzY/cUUtHqewnxyD1cZhq5lzdkAcTq72BRtr4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=blgC4oHI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="blgC4oHI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAE17C4CEE9
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 12:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746446500;
	bh=yKXMOm/860GCcP8OoAHCINoXDy4EwSWPW0EDzkxq178=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=blgC4oHIW3wAP8A1QsMnVaof+kTjscjbnt5LtnKStIlkn1n3AMYE6CpRv2nZoLw0I
	 cM8rLUPe+WUP2EUPzRYSFeKCCyqXfZ0QIph55SbTXsGgxYwQzgt7vH33V6lqG7C1A+
	 tbhrVH32TUbCB2Nc+HFfTTDvEqRhYbYu3gGxMZVeWGCcBhuohjcuK44P3SP8eT2tmw
	 ITi/rFVwohdPgEOnUrQFNROOmuOGuD8ayHxQbFFmSUhGyKiIf1izXUvVrTA2+nBUvH
	 uFXyDeYvNxF1Z3qkaobTDSk31w5+S1AmtshN7z1TYj4peYHOSE0B+jBdcHIQP3v/60
	 oTv+bNp5JaxHQ==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5499c5d9691so5080902e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 05:01:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWYKS7QtuOva/Zup9C7ipHceo2oxmbnNRFFCZP8rItBOA//j89wcMQuLHs2L5OILKuf87vbfgLV8UsUDAo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxao3THflNX4MYNodn7HocahF0+oJjoLo/39N9f1eKWF+2UJqH0
	q+puLWsEesq/3L3op0d271nRUOYVGo1F2sAU5RYiCpA+2x0SR9PyXSPJQdybUrSxtq+FNMXhr+K
	YY8MIjSpz0Ym1O9X5vjPMQl0W8vo=
X-Google-Smtp-Source: AGHT+IHNfl/k0nKX7HHii+yFbjen/cpwNpNeEkkE0EhxxcaZldi84IfCIcrHLIOQSGaQnm60lEF7YLNiGZxwP6wXMi8=
X-Received: by 2002:a2e:bd0e:0:b0:30b:c569:4689 with SMTP id
 38308e7fff4ca-32351f257d4mr22226601fa.27.1746446498310; Mon, 05 May 2025
 05:01:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250504184342.125253-1-ubizjak@gmail.com> <dd4c1795-ee0f-4589-9430-d759e59d5b96@zytor.com>
 <CAMj1kXHLfa2OzT+mo8qFxp5NtLHxaxnO3+skt_we=QOTtPFUqw@mail.gmail.com>
 <79AB4DAE-18EE-4F3C-980F-46304C021EC1@zytor.com> <CAMj1kXHG8JPLR5BjhSh+nJLhFoC-cT+-me4nc5kHXSxFUaw1aQ@mail.gmail.com>
 <D503B59D-AE83-4B2A-BC26-13F01A18C14B@zytor.com>
In-Reply-To: <D503B59D-AE83-4B2A-BC26-13F01A18C14B@zytor.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 5 May 2025 14:01:26 +0200
X-Gmail-Original-Message-ID: <CAMj1kXF68cZ1B-hf845x8bkYZJW1kn69QenVoHnrjAeFRrXbsw@mail.gmail.com>
X-Gm-Features: ATxdqUE_1SqOu31UeqEZ9aqvciZPPMBGKf0BwUcXfuKE72VyHS3naqyuEkdV0UE
Message-ID: <CAMj1kXF68cZ1B-hf845x8bkYZJW1kn69QenVoHnrjAeFRrXbsw@mail.gmail.com>
Subject: Re: [PATCH -tip] x86/asm: Use %a instead of %c(%%rip) in rip_rel_ptr()
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Uros Bizjak <ubizjak@gmail.com>, x86@kernel.org, linux-kernel@vger.kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 5 May 2025 at 13:50, H. Peter Anvin <hpa@zytor.com> wrote:
>
> On May 5, 2025 3:42:46 AM PDT, Ard Biesheuvel <ardb@kernel.org> wrote:
> >On Mon, 5 May 2025 at 08:09, H. Peter Anvin <hpa@zytor.com> wrote:
> >>
> >> On May 4, 2025 10:48:19 PM PDT, Ard Biesheuvel <ardb@kernel.org> wrote:
> >> >On Mon, 5 May 2025 at 04:59, H. Peter Anvin <hpa@zytor.com> wrote:
> >> >>
> >> >> On 5/4/25 11:43, Uros Bizjak wrote:
> >> >> > The "a" asm operand modifier substitutes a memory reference, with the
> >> >> > actual operand treated as address.  For x86_64, when a symbol is
> >> >> > provided, the "a" modifier emits "sym(%rip)" instead of "sym".
> >> >> >
> >> >
> >> >Clang does not
> >> >
> >> >https://godbolt.org/z/5Y58T45f5
> >> >
> >> >> > No functional changes intended.
> >> >> >
> >> >
> >> >NAK. There is a functional change with Clang, which does not emit
> >> >%(rip), and this is the whole point of this thing.
> >> >
> >> >> > Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
> >> >> > Cc: Thomas Gleixner <tglx@linutronix.de>
> >> >> > Cc: Ingo Molnar <mingo@kernel.org>
> >> >> > Cc: Borislav Petkov <bp@alien8.de>
> >> >> > Cc: Dave Hansen <dave.hansen@linux.intel.com>
> >> >> > Cc: "H. Peter Anvin" <hpa@zytor.com>
> >> >> > Cc: Ard Biesheuvel <ardb@kernel.org>
> >> >> > ---
> >> >> >   arch/x86/include/asm/asm.h | 2 +-
> >> >> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >> >> >
> >> >> > diff --git a/arch/x86/include/asm/asm.h b/arch/x86/include/asm/asm.h
> >> >> > index f963848024a5..d7610b99b8d8 100644
> >> >> > --- a/arch/x86/include/asm/asm.h
> >> >> > +++ b/arch/x86/include/asm/asm.h
> >> >> > @@ -116,7 +116,7 @@
> >> >> >   #ifndef __ASSEMBLER__
> >> >> >   static __always_inline __pure void *rip_rel_ptr(void *p)
> >> >> >   {
> >> >> > -     asm("leaq %c1(%%rip), %0" : "=r"(p) : "i"(p));
> >> >> > +     asm("leaq %a1, %0" : "=r"(p) : "i"(p));
> >> >> >
> >> >> >       return p;
> >> >> >   }
> >> >>
> >> >> Also, this function really should be __attribute_const__ rather than __pure.
> >> >>
> >> >
> >> >No it should really not.
> >> >
> >> >rip_rel_ptr() will yield different results depending on whether it is
> >> >called [by the same code] from the 1:1 mapping or the ordinary kernel
> >> >virtual mapping of memory, and this is basically the entire reason we
> >> >need it in the first place.
> >> >
> >> >Lying to the compiler about this is not a good idea imo.
> >>
> >> Goddamnit, another clang bug. Someone fix the damned thing, please...
> >
> >How is this a bug? The %a modifier is documented as producing a memory
> >reference - the fact that GCC on x86_64 always emits a RIP-relative
> >reference regardless of whether we are generating PIC code or not is
> >an implementation detail, and not fundamental to yield correct code.
> >
> >Clang produces something that matches the constraints that we gave it
> >- we cannot blame the tools for the mess of our own making where we
> >call C code from alternative mappings of memory, while we lie to the
> >compiler that the code is position dependent and non-relocatable.
>
> It is documented to produce an (%rip) reference in the gcc documentation, and gcc is the reference for inline assembly.
>

Got a link? The one below documents it as a generic modifier, and does
not mention rIP at all.

https://gcc.gnu.org/onlinedocs/gcc/Extended-Asm.html#Generic-Operand-Modifiers

> Furthermore, documentation is not reality. Code is.

Not sure I follow your point here. You claim Clang is buggy because
GCC does not behave according to its own documentation?
