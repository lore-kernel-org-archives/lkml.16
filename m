Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1591DB13A
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 18:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743357749; cv=none; b=e2IWgHCwGjopCo4bf7OVaqzTXK6j3a5pzSYmNRlGGA983cfUY8KOl8eTuaV4DI1MPaSB9imyfPKEVHqx5Oxqf2xGhhFB3kr3kDqJL/8AkJdySJhb+GonLrj9r4a3SyyqBsl5zjKiUiEglVo81wJgC9KAKWYV8ABXVfIsBXP3nk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743357749; c=relaxed/simple;
	bh=j6UjuPEl/kIYq5SdQ9Hb7zznH+KKztrfdFpG0Jbofko=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Rmsfb6mmv075B+yKcPlAUuvigGcpH51hm6tDYUK+Crvqvh8iKbTrVWv5yZ71DaJOoHj80sNYafLNEPjK/hVuKtd5q0ZkTYzQ8lENiXPsjUw8EC9broWaj6Tx+802wHX58qsF3ZWqsOvym3hkNUBU2vrm4tn77Y7LYi04pU0lg0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hgVg0AwE; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hgVg0AwE"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so22756385e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 11:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743357745; x=1743962545; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iWy6ovl0zQ/vnlPSDTM1oRQg1uBsQPw5Up8mdmqasyI=;
        b=hgVg0AwEiRSDzye61Ifl7+S9VRgHVE31iR/G4x4WIeWvrJef3h7lay+o4I3JBSrCF5
         FWn/79dQ+16iqcfLZC3dUkfQyGh+tCAVgvH1DxYLTbKvCJQ16ubw2kkvg97sTlbTpVnF
         MQCGQAGLldTywDB/w9KRQFIz08SlmIUHwaepp2TFDGEjEz2bDf3dIT9zohdtiiDrAroD
         5gtwW2wJvrX6W45SB1pCtax7j4cWPKkK99tAaCEgqCdd8C91C3rYCz12518+jGaTo0tc
         nUO3J2FDMLloDtoUg8yk+vhYPVC6cqZjSJXoEr1f1lOSWZBEIXegbTLkjFbxY6sU2RVr
         WHAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743357745; x=1743962545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iWy6ovl0zQ/vnlPSDTM1oRQg1uBsQPw5Up8mdmqasyI=;
        b=RGcm2fxjctHkcKIL5PE31mfjvQK6yAqyvMJcgdYw/rvnrAM26kC+8SIsjCKb9MnG21
         qZF5DC2p+0Jqa5m/BVV7LPnVrIkcPiMVKDMIM4BkrbCHy5c7KHWYQY5VDEk01JAUw/0O
         6DJ5vq10Ch0Av8mMSQj63hkCyhxQn6ZlMoZpjMV6DtCn6Pr1ce24FOEBEqQun3zjGx/j
         x+91VM9Z8r6t8GrLNp3O/PBgsmjlvII9EMT8+t07u+cDOx+19xbNj6LkECckUBg17+XX
         a01eybyXturXK8jgwy4yoDTU1DIzDo9/u/F6yi0nq+U1/eg9TqE/Zj40sur99TuAW3bC
         djfg==
X-Forwarded-Encrypted: i=1; AJvYcCUeb/Z5Q0eVQyl6DCvJYZB04dm2NFtfKAdRHD7VqernKze96AePHRo1AHKUOzVwo5MYKv3p/gFbW+nmNFo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyorbhKAGRZ9hEM0iWCY8YtNltwqxXBx4z2uUHWvAKjhaXHoULX
	I2kAMYiepJ/uoNZu0cPq5E7F96mYS2fL6JyruwumImUiGUR2BjxU
X-Gm-Gg: ASbGncsMmv9zW9AHFcOaAZK70Vogl7AK1id0u9WuflBYH+Xl/EcFiqJK//wHmbsqXMj
	Rgh9KXesXgP9HiPreBjCPZVq5pk9aoZPNRr+g9FrkCTUufNzSYa2r/BOIrMB2c82zuPgZFD2X+R
	3bNSerPYKZ/L+pCGPgJuPSjohweBi+hecUfQRfcs93GFFTSo4QEgba08uDnl1VpCIdyn5+quoob
	8w2mbChD53KubiCBuNhcYAkmB6EeOx0SYWyTSqwBAJaWIqH5MomR5mwFBn0xi2D+xFJBXM6PH4e
	wbpoICU1F1BWb2tJBtGH9gUELEte8wE/mk9yyfu5LjiVHJwCVXFSy9yZpj+DcF5ch4oiwvNU14V
	EonvD6aQ=
X-Google-Smtp-Source: AGHT+IFVuKtj8o/IXERjIzC9tzAkiSTq863h/eNJhhtThjx+YMb48N8a5W58uWW5iTgUXvN79ix8jg==
X-Received: by 2002:a05:600c:4c8a:b0:43c:f680:5c2e with SMTP id 5b1f17b1804b1-43d9118f627mr70470885e9.13.1743357745014;
        Sun, 30 Mar 2025 11:02:25 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8fba3ee4sm99589865e9.8.2025.03.30.11.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 11:02:24 -0700 (PDT)
Date: Sun, 30 Mar 2025 19:02:21 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Uros Bizjak <ubizjak@gmail.com>
Cc: Ingo Molnar <mingo@kernel.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH -tip 2/2] x86/hweight: Use POPCNT when available with
 X86_NATIVE_CPU option
Message-ID: <20250330190221.4b75c7de@pumpkin>
In-Reply-To: <CAFULd4aybKBdpVv_mt5EgNGDp6yk_ayGr9C4H15-3dc3h6K9aA@mail.gmail.com>
References: <20250325164854.199420-1-ubizjak@gmail.com>
	<20250325164854.199420-2-ubizjak@gmail.com>
	<Z-Mme_OxuhYfxgzO@gmail.com>
	<CAFULd4bCnnL-CBFwgAQtN9S+sUE_wikda6E+8k9632J9b62dCg@mail.gmail.com>
	<20250329110042.75a28342@pumpkin>
	<CAFULd4aybKBdpVv_mt5EgNGDp6yk_ayGr9C4H15-3dc3h6K9aA@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, 30 Mar 2025 09:49:43 +0200
Uros Bizjak <ubizjak@gmail.com> wrote:

> On Sat, Mar 29, 2025 at 12:00=E2=80=AFPM David Laight
> <david.laight.linux@gmail.com> wrote:
> >
> > On Sat, 29 Mar 2025 10:19:37 +0100
> > Uros Bizjak <ubizjak@gmail.com> wrote:
> > =20
> > > On Tue, Mar 25, 2025 at 10:56=E2=80=AFPM Ingo Molnar <mingo@kernel.or=
g> wrote: =20
> > > >
> > > >
> > > > * Uros Bizjak <ubizjak@gmail.com> wrote:
> > > > =20
> > > > > Emit naked POPCNT instruction when available with X86_NATIVE_CPU
> > > > > option. The compiler is not bound by ABI when emitting the instru=
ction
> > > > > without the fallback call to __sw_hweight{32,64}() library functi=
on
> > > > > and has much more freedom to allocate input and output operands,
> > > > > including memory input operand.
> > > > >
> > > > > The code size of x86_64 defconfig (with X86_NATIVE_CPU option)
> > > > > shrinks by 599 bytes:
> > > > >
> > > > >   add/remove: 0/0 grow/shrink: 45/197 up/down: 843/-1442 (-599)
> > > > >   Total: Before=3D22710531, After=3D22709932, chg -0.00%
> > > > >
> > > > > The asm changes from e.g.:
> > > > >
> > > > >          3bf9c:       48 8b 3d 00 00 00 00    mov    0x0(%rip),%r=
di
> > > > >          3bfa3:       e8 00 00 00 00          call   3bfa8 <...>
> > > > >          3bfa8:       90                      nop
> > > > >          3bfa9:       90                      nop
> > > > >
> > > > > with:
> > > > >
> > > > >            34b:       31 c0                   xor    %eax,%eax
> > > > >            34d:       f3 48 0f b8 c7          popcnt %rdi,%rax
> > > > >
> > > > > in the .altinstr_replacement section
> > > > >
> > > > > to:
> > > > >
> > > > >          3bfdc:       31 c0                   xor    %eax,%eax
> > > > >          3bfde:       f3 48 0f b8 05 00 00    popcnt 0x0(%rip),%r=
ax
> > > > >          3bfe5:       00 00
> > > > >
> > > > > where there is no need for an entry in the .altinstr_replacement
> > > > > section, shrinking all text sections by 9476 bytes:
> > > > >
> > > > >           text           data     bss      dec            hex fil=
ename
> > > > >       27267068        4643047  814852 32724967        1f357e7 vml=
inux-old.o
> > > > >       27257592        4643047  814852 32715491        1f332e3 vml=
inux-new.o =20
> > > > =20
> > > > > +#ifdef __POPCNT__
> > > > > +     asm_inline (ASM_FORCE_CLR "popcntl %[val], %[cnt]"
> > > > > +                 : [cnt] "=3D&r" (res)
> > > > > +                 : [val] ASM_INPUT_RM (w));
> > > > > +#else
> > > > >       asm_inline (ALTERNATIVE(ANNOTATE_IGNORE_ALTERNATIVE
> > > > >                               "call __sw_hweight32",
> > > > >                               ASM_CLR "popcntl %[val], %[cnt]",
> > > > >                               X86_FEATURE_POPCNT)
> > > > >                        : [cnt] "=3Da" (res), ASM_CALL_CONSTRAINT
> > > > >                        : [val] REG_IN (w)); =20
> > > >
> > > > So a better optimization I think would be to declare and implement
> > > > __sw_hweight32 with a different, less intrusive function call ABI t=
hat =20
> > >
> > > With an external function, the ABI specifies the location of input
> > > argument and function result. Unless we want to declare the whole
> > > function as asm() inline function (with some 20 instructions), we have
> > > to specify the location of function arguments and where the function
> > > result is to be found in the asm() that calls the external function.
> > > Register allocator then uses this information to move arguments to the
> > > right place before the call.
> > >
> > > The above approach, when used to emulate an insn,  has a drawback.
> > > When the instruction is available as an alternative, it still has
> > > fixed input and output registers, forced by the ABI of the function
> > > call. Register allocator has to move registers unnecessarily to
> > > satisfy the constraints of the function call, not the instruction
> > > itself. =20
> >
> > Forcing the argument into a fixed register won't make much difference
> > to execution time.
> > Just a bit more work for the instruction decoder and a few more bytes
> > of I-cache.
> > (Register-register moves can be zero clocks.)
> > In many cases (but not as many as you might hope for) the compiler
> > back-tracks the input register requirement to the instruction that
> > generates the value. =20
>=20
> I'm afraid I don't fully understand what you mean by "back-tracking
> the input register requirement".

If the asm block requires an input in %rdx then the instruction that
creates the value would be expected to put it into %rdx ready for the
asm block.
Even if it doesn't a register-register move is often implemented without
using the ALU by 'register renaming' (there is an indirection between
the register 'number' the code uses and the physical latches that hold
the value, multiple copies of (say) %rax can be live at the same time).

> However, with:
>=20
> asm("insn %0, %1" : "=3Dr" (out) : "r" (in));
>=20
> the compiler is not obliged to match input with output, although many
> times it does so (especially when input argument is dead). To avoid
> false dependence on the output, we should force the compiler to always
> match input and output:
>=20
> asm("insn %0, %1" : "=3Dr" (out) : "0" (in));

I'd expect the compiler to generate better code if it is allowed to
use separate registers for the input and output.
It may be able to use the input value again.
There is no 'dependency' on the output register (unless the instruction
only updates the low bits).

>=20
> and this will resolve false dependence (input register obviously needs
> to be ready before insn) at the expense of an extra move instruction
> in front of the insn in case input is not dead. This is unfortunately
> not possible when one of the alternatives is a function call, where
> location of input and output arguments is specified by ABI.
>=20
> > In this case the called function needs two writeable registers.
> > I think you can tell gcc the input is invalidated and the output
> > is 'early clobber' so that the register are different. =20
>=20
> Yes, my first patch used this approach, where output operand is cleared f=
irst:

That clearing of the output serves an entirely different purpose.
>=20
> asm("xorl %0, %0; popcntl %1, %0" : "=3D&r" (out) : "rm" (in));
>=20
> Please note that "earlyclobbered" output reg can't be matched with
> input reg, or with any reg that forms the address.

But you want them to be different.
The called function needs to multiple 'shift and add' sequences.
To do that it needs a scratch register.
So if the asm block requires the input in %rdx, puts the output in %rax
and destroys %rdx you can write a function that doesn't need any other
registers.
If you try really hard you can make the called function depend on the
register the compiler selects - and white a different copy for each.
Not worth it here.

	David
