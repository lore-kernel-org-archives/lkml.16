Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BEE81EB5E1
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 10:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746441779; cv=none; b=Pp2T+5DYluUELZyvu3UidunN9toy8bk9sysMBWiIg96N5UKXWUgeTBZ+pYgeMyza0K8LVBMYdFkIRiWMg+JTOIRvWZi0SJ6jj0gS8IgV58SqyRMIhMPIGqDZtR77GvCIxeNM25k8VgHAt2Nc6OAbAShTUcaot1h3yCTOB0eFK+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746441779; c=relaxed/simple;
	bh=etaD+q/UM0JBjuMWYOfprdJtJNTJPivdYJZuUCpDM1I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HdZOTofaRzUoZXjx1usBBh/jxnjiFuemPGGeFYOag6Ob+t0mjboK1qdDEylYLCYuNKH7ZOattqnB9ULOc0FagJ/u+9RugQN1/D7AHMmRimUQJ1jFOt4AmQvLVMkW+iNfW1vswvF7BxAKaHSK0UIJsHbQK9bO/ngUK+bjZQUTyqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=djiIipsO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="djiIipsO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 095C0C4CEEF
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 10:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746441779;
	bh=etaD+q/UM0JBjuMWYOfprdJtJNTJPivdYJZuUCpDM1I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=djiIipsOyaSewANQYKalbvQTUW6nbl0ecFiMB7ImaRxOvKyPYvfFpF8CeRMftMZUe
	 dLqenB/IZgIuSyMm4nm2Mo88qrPC8Tfnv+nlznBSS++FBX0zQi2dKYDOF9l/BRKNAH
	 QTCw/DNcaXNAUPe71U/AHBUIN0HCP0NhPKS5Y8DOhzoG74WHzzU4PBsQfRvhrwTlIz
	 y+fwMQSSz20M/m511qsWK8NrS1ggz2wlrsCNkajxPBidWJj6hIhDmOyGUmbQf2oWk8
	 stJjQn4pHBLW9kwMOFJzzBLZd5ABAQYfXxRSB5ETqf6uaP+3ehYu2HZo0/7WfKfIU6
	 BUGHJnuAi1aYQ==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30bfd4d4c63so37353041fa.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 03:42:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWsg8sedc+TtNjz3B9gEWSFRYWxdBeLqwAetTaFM0U1KWJITrqPnHCt8W8YgLzDqsfeO9AUvDTw52ff8q0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJS+ayYEMudGy7691sjUr99OHFe+DtDGBC3QH9j9wNaGmThxbR
	PTIt5njzlZ2AL8JdC5xMhVgxJA15wLlLEQEdo1PxxIA1QQy4cdJOyTJ2Q+XAd8fdeewb3HyxLfW
	1Mx0CW9tENVuzTK0Nhq/4xeCCDhM=
X-Google-Smtp-Source: AGHT+IGKuHqXhDmSGRkqZZu6V1I3CjcTJxQ17DtzRyas2F1YqJzH06+MKQsshQSYsEGMClFn5GwQYkMmvLwejCmZpoY=
X-Received: by 2002:a2e:bc09:0:b0:30b:f52d:148f with SMTP id
 38308e7fff4ca-320c44e6376mr30455541fa.18.1746441777433; Mon, 05 May 2025
 03:42:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250504184342.125253-1-ubizjak@gmail.com> <dd4c1795-ee0f-4589-9430-d759e59d5b96@zytor.com>
 <CAMj1kXHLfa2OzT+mo8qFxp5NtLHxaxnO3+skt_we=QOTtPFUqw@mail.gmail.com> <79AB4DAE-18EE-4F3C-980F-46304C021EC1@zytor.com>
In-Reply-To: <79AB4DAE-18EE-4F3C-980F-46304C021EC1@zytor.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 5 May 2025 12:42:46 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHG8JPLR5BjhSh+nJLhFoC-cT+-me4nc5kHXSxFUaw1aQ@mail.gmail.com>
X-Gm-Features: ATxdqUHnRpEG_3-iXl1ISR5EXqJYWwZHU8n2D2DLaxYCSDm5yIdMdjh-NHPEa14
Message-ID: <CAMj1kXHG8JPLR5BjhSh+nJLhFoC-cT+-me4nc5kHXSxFUaw1aQ@mail.gmail.com>
Subject: Re: [PATCH -tip] x86/asm: Use %a instead of %c(%%rip) in rip_rel_ptr()
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Uros Bizjak <ubizjak@gmail.com>, x86@kernel.org, linux-kernel@vger.kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 5 May 2025 at 08:09, H. Peter Anvin <hpa@zytor.com> wrote:
>
> On May 4, 2025 10:48:19 PM PDT, Ard Biesheuvel <ardb@kernel.org> wrote:
> >On Mon, 5 May 2025 at 04:59, H. Peter Anvin <hpa@zytor.com> wrote:
> >>
> >> On 5/4/25 11:43, Uros Bizjak wrote:
> >> > The "a" asm operand modifier substitutes a memory reference, with the
> >> > actual operand treated as address.  For x86_64, when a symbol is
> >> > provided, the "a" modifier emits "sym(%rip)" instead of "sym".
> >> >
> >
> >Clang does not
> >
> >https://godbolt.org/z/5Y58T45f5
> >
> >> > No functional changes intended.
> >> >
> >
> >NAK. There is a functional change with Clang, which does not emit
> >%(rip), and this is the whole point of this thing.
> >
> >> > Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
> >> > Cc: Thomas Gleixner <tglx@linutronix.de>
> >> > Cc: Ingo Molnar <mingo@kernel.org>
> >> > Cc: Borislav Petkov <bp@alien8.de>
> >> > Cc: Dave Hansen <dave.hansen@linux.intel.com>
> >> > Cc: "H. Peter Anvin" <hpa@zytor.com>
> >> > Cc: Ard Biesheuvel <ardb@kernel.org>
> >> > ---
> >> >   arch/x86/include/asm/asm.h | 2 +-
> >> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >> >
> >> > diff --git a/arch/x86/include/asm/asm.h b/arch/x86/include/asm/asm.h
> >> > index f963848024a5..d7610b99b8d8 100644
> >> > --- a/arch/x86/include/asm/asm.h
> >> > +++ b/arch/x86/include/asm/asm.h
> >> > @@ -116,7 +116,7 @@
> >> >   #ifndef __ASSEMBLER__
> >> >   static __always_inline __pure void *rip_rel_ptr(void *p)
> >> >   {
> >> > -     asm("leaq %c1(%%rip), %0" : "=r"(p) : "i"(p));
> >> > +     asm("leaq %a1, %0" : "=r"(p) : "i"(p));
> >> >
> >> >       return p;
> >> >   }
> >>
> >> Also, this function really should be __attribute_const__ rather than __pure.
> >>
> >
> >No it should really not.
> >
> >rip_rel_ptr() will yield different results depending on whether it is
> >called [by the same code] from the 1:1 mapping or the ordinary kernel
> >virtual mapping of memory, and this is basically the entire reason we
> >need it in the first place.
> >
> >Lying to the compiler about this is not a good idea imo.
>
> Goddamnit, another clang bug. Someone fix the damned thing, please...

How is this a bug? The %a modifier is documented as producing a memory
reference - the fact that GCC on x86_64 always emits a RIP-relative
reference regardless of whether we are generating PIC code or not is
an implementation detail, and not fundamental to yield correct code.

Clang produces something that matches the constraints that we gave it
- we cannot blame the tools for the mess of our own making where we
call C code from alternative mappings of memory, while we lie to the
compiler that the code is position dependent and non-relocatable.
