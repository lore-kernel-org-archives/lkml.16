Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C0C13DB9F
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 11:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743246048; cv=none; b=Le4Vja7KeZ1DQdYNhCxKnkHiLdjCNxZUbX2LgraIlPMj7paJyM/p5ITrUs89/wIchy/5gTEBin8kH/I+UzIxyuQxCVfZP3OJo4jY5nuDpEGl/Ifjbd2uW5LyvwxGN7OahUTiwtIR8laL7lKZAy123UAx7KbdP4bmzPPVBshJiVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743246048; c=relaxed/simple;
	bh=CfOoC6JLa0u/InvAu2e9ZP6t101tvroQMiFkdtlSpJs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t5JnyVWIcBY7d39bATAk51+8Upa+J2IdnVKXETumxwbyAi81KHbEVBG94CtB5B+UQ3DE3CC1HsEuiJ0Ir7Wf4qDmE0PNYcL7Jywfd0+C+urNdcCQeshB9cN06uw8Jnk4L2RuYk8zHz8VCpE7f15O28vbgPDgwDB4czd80uG5moQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WyFty2zx; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WyFty2zx"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-39129fc51f8so2238127f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 04:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743246044; x=1743850844; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lpd/v2rFQ8PJ2Oa/njxuk/NvEWbCpD4BnSidJ1pdjSs=;
        b=WyFty2zxf3drx1LzEmjZ1tT99qTiWAYNl7T7wF7rRrxZwrYhb+2D8ZiSalCTcl25ns
         l4eIBRDJp0EpA+5Ig6rIaVq5Ejf0mTGXaP9vYVwzHQfoWR9q6miUVQ2B8ZXGR1Mokr+m
         eYl8BBAIg2lihcRbhWLSK3as7SUdw8/wMWytNPA+yFnZRDn3CZmloO7uShAvAKGOkb/g
         SAv5ya1GfClv20r2gB2ID0pSrhV5ioJWsnt7ywO5rAWcmN2+SGksjiO26a53OivS2Dzs
         cDIX9BS2S2U5Q1jNGFTml/v4/1mTrNj/26hQ/dVLwyUv7hLCtsQvDld1QZqVGyvdFBlC
         aMKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743246044; x=1743850844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lpd/v2rFQ8PJ2Oa/njxuk/NvEWbCpD4BnSidJ1pdjSs=;
        b=qjEl8rFKurYMM8CGTEyqYjNGNdJWOGMgdsRwN7L4EgUJSm9ZA0hSaTjQQwGWExGZlE
         68zmrVyjl9D4j7QOLAA2wd/LHr6gPjAuhYd8Cj4wT7yiYwFl3WQiFu45mBZOaKajkqvV
         8dfxKbFOeqB4L+dSwjjYGECJPsTDzdUzz9gAhMr7xcvjsO8znF3YDCpT/Sn8lWGk7WEw
         XDTkRqK+03KY4EZwb39N3BRxMpqdNOQDSzDJy9SPI+AbWq7iBZivRv/J265q5S3GeEKX
         lYtI3wyoGxlXqe4lCSCyBM74MXyQGlU3kGx6ev/P1XKt91v9Mdfo9INfkR95C8ufAN8r
         dNBA==
X-Forwarded-Encrypted: i=1; AJvYcCUSM2UWFA1y7HiBaG8rlfIx3m7Vv4LoA96M31rUAqYwkKIVrfSln0m90Ga6/vbULqpymEMB6R38OihF0Qk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+9ahAiyA0+riuN/YWsshzfGV8O5y0GUSIq4eScJc/bAgcYaKd
	BSAcqnx8cQwuJM8CHbr2wVFMYrCAYNGH1bUiCwUucI2t8Iz5q3uM
X-Gm-Gg: ASbGncuKSv7i8UueKnL+59mludimHCWQ9BKbpA4dTquhzK61wkjulKGTLFdBnKHauOU
	AZLf0pnVWo5b1HZbeum99Aw7GDcOGxFPUuej+zs/MyqIwwm1amqg7IXR6p7gweXaPHaj2M5Epy/
	WDYPeRLte5kwEWuCZoIepb+fhuR6HJmMyYjeS/DbUE02nVBzwegSh0cEUyoYFO8xpnJcJxG8j8/
	1I4u7NpjtA81CIuzt9maLUaXnKmDkK4E0mjNaFVSmvfTswphh8Z9IKHN5dTmZqd6kmYVPNCfF9h
	N6/0gp0jwYc8sUQY307STzzs5fiv9eefxQXXJ/KVZ49CZD95c/rtRAPEGzinQo6GjLb1veb3BWv
	EwRzd/4o=
X-Google-Smtp-Source: AGHT+IGHwHisd5NdDEGzGpUj06ouXjZ9zpB9BIOEnC3pRML41UmEL6VBNdSFrrcC2lRta+kuD8eV1Q==
X-Received: by 2002:a05:6000:1a85:b0:39a:ca05:54a9 with SMTP id ffacd0b85a97d-39c120e0ab5mr1584250f8f.29.1743246044276;
        Sat, 29 Mar 2025 04:00:44 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82e83482sm103531335e9.14.2025.03.29.04.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 04:00:43 -0700 (PDT)
Date: Sat, 29 Mar 2025 11:00:42 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Uros Bizjak <ubizjak@gmail.com>
Cc: Ingo Molnar <mingo@kernel.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH -tip 2/2] x86/hweight: Use POPCNT when available with
 X86_NATIVE_CPU option
Message-ID: <20250329110042.75a28342@pumpkin>
In-Reply-To: <CAFULd4bCnnL-CBFwgAQtN9S+sUE_wikda6E+8k9632J9b62dCg@mail.gmail.com>
References: <20250325164854.199420-1-ubizjak@gmail.com>
	<20250325164854.199420-2-ubizjak@gmail.com>
	<Z-Mme_OxuhYfxgzO@gmail.com>
	<CAFULd4bCnnL-CBFwgAQtN9S+sUE_wikda6E+8k9632J9b62dCg@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, 29 Mar 2025 10:19:37 +0100
Uros Bizjak <ubizjak@gmail.com> wrote:

> On Tue, Mar 25, 2025 at 10:56=E2=80=AFPM Ingo Molnar <mingo@kernel.org> w=
rote:
> >
> >
> > * Uros Bizjak <ubizjak@gmail.com> wrote:
> > =20
> > > Emit naked POPCNT instruction when available with X86_NATIVE_CPU
> > > option. The compiler is not bound by ABI when emitting the instruction
> > > without the fallback call to __sw_hweight{32,64}() library function
> > > and has much more freedom to allocate input and output operands,
> > > including memory input operand.
> > >
> > > The code size of x86_64 defconfig (with X86_NATIVE_CPU option)
> > > shrinks by 599 bytes:
> > >
> > >   add/remove: 0/0 grow/shrink: 45/197 up/down: 843/-1442 (-599)
> > >   Total: Before=3D22710531, After=3D22709932, chg -0.00%
> > >
> > > The asm changes from e.g.:
> > >
> > >          3bf9c:       48 8b 3d 00 00 00 00    mov    0x0(%rip),%rdi
> > >          3bfa3:       e8 00 00 00 00          call   3bfa8 <...>
> > >          3bfa8:       90                      nop
> > >          3bfa9:       90                      nop
> > >
> > > with:
> > >
> > >            34b:       31 c0                   xor    %eax,%eax
> > >            34d:       f3 48 0f b8 c7          popcnt %rdi,%rax
> > >
> > > in the .altinstr_replacement section
> > >
> > > to:
> > >
> > >          3bfdc:       31 c0                   xor    %eax,%eax
> > >          3bfde:       f3 48 0f b8 05 00 00    popcnt 0x0(%rip),%rax
> > >          3bfe5:       00 00
> > >
> > > where there is no need for an entry in the .altinstr_replacement
> > > section, shrinking all text sections by 9476 bytes:
> > >
> > >           text           data     bss      dec            hex filename
> > >       27267068        4643047  814852 32724967        1f357e7 vmlinux=
-old.o
> > >       27257592        4643047  814852 32715491        1f332e3 vmlinux=
-new.o =20
> > =20
> > > +#ifdef __POPCNT__
> > > +     asm_inline (ASM_FORCE_CLR "popcntl %[val], %[cnt]"
> > > +                 : [cnt] "=3D&r" (res)
> > > +                 : [val] ASM_INPUT_RM (w));
> > > +#else
> > >       asm_inline (ALTERNATIVE(ANNOTATE_IGNORE_ALTERNATIVE
> > >                               "call __sw_hweight32",
> > >                               ASM_CLR "popcntl %[val], %[cnt]",
> > >                               X86_FEATURE_POPCNT)
> > >                        : [cnt] "=3Da" (res), ASM_CALL_CONSTRAINT
> > >                        : [val] REG_IN (w)); =20
> >
> > So a better optimization I think would be to declare and implement
> > __sw_hweight32 with a different, less intrusive function call ABI that =
=20
>=20
> With an external function, the ABI specifies the location of input
> argument and function result. Unless we want to declare the whole
> function as asm() inline function (with some 20 instructions), we have
> to specify the location of function arguments and where the function
> result is to be found in the asm() that calls the external function.
> Register allocator then uses this information to move arguments to the
> right place before the call.
>=20
> The above approach, when used to emulate an insn,  has a drawback.
> When the instruction is available as an alternative, it still has
> fixed input and output registers, forced by the ABI of the function
> call. Register allocator has to move registers unnecessarily to
> satisfy the constraints of the function call, not the instruction
> itself.

Forcing the argument into a fixed register won't make much difference
to execution time.
Just a bit more work for the instruction decoder and a few more bytes
of I-cache.
(Register-register moves can be zero clocks.)
In many cases (but not as many as you might hope for) the compiler
back-tracks the input register requirement to the instruction that
generates the value.

In this case the called function needs two writeable registers.
I think you can tell gcc the input is invalidated and the output
is 'early clobber' so that the register are different.

> The proposed solution builds on the fact that with -march=3Dnative (and
> also when -mpopcnt is specified on the command line) , the compiler
> signals the availability of certain ISA by defining the corresponding
> definition. We can use this definition to relax the constraints to fit
> the instruction, not the ABI of the fallback function call. On x86, we
> can also access memory directly, avoiding clobbering a temporary input
> register.
>=20
> Without the fix for (obsolete) false dependency, the change becomes simpl=
y:
>=20
> #ifdef __POPCNT__
>      asm ("popcntl %[val], %[cnt]"
>                  : [cnt] "=3Dr" (res)
>                  : [val] ASM_INPUT_RM (w));
> #else
>=20
> and besides the reported savings of 600 bytes in the .text section
> also allows the register allocator to schedule registers (and input
> arguments from memory) more optimally, not counting additional 9k
> saved space in the alternative section.
>=20
> The patch is also an example, how -march=3Dnative enables further
> optimizations involving additional ISAs.

To my mind it would be better to be able to specify oldest cpu
type the build should support.
Either by actual cpu type (eg 'skylake' or 'zen2') or maybe by
a specific instruction (eg popcnt).
The scripts would then determine the appropriate compiler flags
and any extra -Dvar to generate appropriate code.

The arch/x86/Kconfig.cpu seems to be missing options to select
between 64bit cpus.
That would also be the place to add CONFIG defines that mirror the
X86_FEATURE_xxx flags.

That would be more flexible.

	David

>=20
> Thanks,
> Uros.
>=20

