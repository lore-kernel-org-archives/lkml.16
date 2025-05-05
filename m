Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1DCA937
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 05:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746424112; cv=none; b=R3I0bWqi55tdMcU6ETKpGiB2NS02wsCvnqRe9sNMlpMS7ivhMmXNZR70vydR1Cmqi49wlFd1LCtrRyH0qHk36NHfuCnDUHMdJ9mWmT+vYD5Thhce27dD/wE23kRWArFZcR3bMDJEWpqXFaMmX1tlu7yX/5QLULh83g2e+33qhlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746424112; c=relaxed/simple;
	bh=5k0IvIVDXK0EF4BBl0vGHEbOeJwWKI9bbTZORYLMKlU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gO2ReLE5wM14HohvkeOkqr8ctrBpKcDam/ZvAaW1xv8QWLpWqzW9ByiepgjGsoGmUKJ7wlBeGWk6bM53L5jtdiBBk5G8PKneivm81J5zQR9+OPZCT2+i5ckZpPAGmNPLeAtuZidtPWn9LLTVoY23Q08JEJU31G5RwY2L1h6UJXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QgGO6RR5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QgGO6RR5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D2C1C4CEE4
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 05:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746424112;
	bh=5k0IvIVDXK0EF4BBl0vGHEbOeJwWKI9bbTZORYLMKlU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QgGO6RR5BCKl+E7zR8FPnxh6oPSAWgs8CFnirhj28wkVvPvxQAXjG70FVoefVRv0O
	 JKpKaNR4z4utryRFgglBEOe76uKeo/AM4kf3PcdDeb41uIcCCiJuhzfncdPNgYdZE0
	 de8MmwDiyVjiiH0Y0Xwmc4U/WuesOFmYBbKeWbGqBiSCL7xnWGj+VzZYdoCozEBy6a
	 Gr5nM9GlikxjwzToAZDPgNBlOXcgntkBSn4JanYtANW7guVPT2BeBtlq6XtVVKQ1Sv
	 DmXCVXKJ9eMEyTRHPz2bNsh1en17POPk2cLWKfHwef88i3b3bsuml8oU08o8QBzGG8
	 iTeixy38VvkEg==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30effbfaf61so45889471fa.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 22:48:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVwwKTW8QWxYJzfxuUxaQA6dLLkQbaMl23rREFMHdLNY7gU9e0oeFuFL5jKHgV+dVavu8/hp1Qr3yBOyfM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKXIpr/cAr+a4NOoLZmPVYCxbqHSz9DFflU51jNSxbJfV8+FdF
	MadFqxSlWq4Oa0PNECtboAZRI5kGFxmJnwuTcrqWrjFJMsKfT+Wv7CaQ/vE8CxCAwNJuO5O+HQI
	NhGMBa/Ptgm3eJnNw1yzi309AICw=
X-Google-Smtp-Source: AGHT+IFIH6C6+BCGOKQt3BCCRE9MA6jLY4AUgSGAkcRJDJvU/16eQcDjHka7qQWcewKZxei9ccR3fuppUyvclJA5gVk=
X-Received: by 2002:a05:651c:1553:b0:30c:465c:51de with SMTP id
 38308e7fff4ca-320ab59b99fmr27025751fa.10.1746424110517; Sun, 04 May 2025
 22:48:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250504184342.125253-1-ubizjak@gmail.com> <dd4c1795-ee0f-4589-9430-d759e59d5b96@zytor.com>
In-Reply-To: <dd4c1795-ee0f-4589-9430-d759e59d5b96@zytor.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 5 May 2025 07:48:19 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHLfa2OzT+mo8qFxp5NtLHxaxnO3+skt_we=QOTtPFUqw@mail.gmail.com>
X-Gm-Features: ATxdqUG37D_KAEuxCbE2ou2VFvRvnQp6OTGbWVH4GjfGa_gNLKvns4d7QTu_vg0
Message-ID: <CAMj1kXHLfa2OzT+mo8qFxp5NtLHxaxnO3+skt_we=QOTtPFUqw@mail.gmail.com>
Subject: Re: [PATCH -tip] x86/asm: Use %a instead of %c(%%rip) in rip_rel_ptr()
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Uros Bizjak <ubizjak@gmail.com>, x86@kernel.org, linux-kernel@vger.kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 5 May 2025 at 04:59, H. Peter Anvin <hpa@zytor.com> wrote:
>
> On 5/4/25 11:43, Uros Bizjak wrote:
> > The "a" asm operand modifier substitutes a memory reference, with the
> > actual operand treated as address.  For x86_64, when a symbol is
> > provided, the "a" modifier emits "sym(%rip)" instead of "sym".
> >

Clang does not

https://godbolt.org/z/5Y58T45f5

> > No functional changes intended.
> >

NAK. There is a functional change with Clang, which does not emit
%(rip), and this is the whole point of this thing.

> > Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
> > Cc: Thomas Gleixner <tglx@linutronix.de>
> > Cc: Ingo Molnar <mingo@kernel.org>
> > Cc: Borislav Petkov <bp@alien8.de>
> > Cc: Dave Hansen <dave.hansen@linux.intel.com>
> > Cc: "H. Peter Anvin" <hpa@zytor.com>
> > Cc: Ard Biesheuvel <ardb@kernel.org>
> > ---
> >   arch/x86/include/asm/asm.h | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/x86/include/asm/asm.h b/arch/x86/include/asm/asm.h
> > index f963848024a5..d7610b99b8d8 100644
> > --- a/arch/x86/include/asm/asm.h
> > +++ b/arch/x86/include/asm/asm.h
> > @@ -116,7 +116,7 @@
> >   #ifndef __ASSEMBLER__
> >   static __always_inline __pure void *rip_rel_ptr(void *p)
> >   {
> > -     asm("leaq %c1(%%rip), %0" : "=r"(p) : "i"(p));
> > +     asm("leaq %a1, %0" : "=r"(p) : "i"(p));
> >
> >       return p;
> >   }
>
> Also, this function really should be __attribute_const__ rather than __pure.
>

No it should really not.

rip_rel_ptr() will yield different results depending on whether it is
called [by the same code] from the 1:1 mapping or the ordinary kernel
virtual mapping of memory, and this is basically the entire reason we
need it in the first place.

Lying to the compiler about this is not a good idea imo.
