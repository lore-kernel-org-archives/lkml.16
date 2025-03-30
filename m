Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF1C13A3ED
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 07:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743320993; cv=none; b=HVG3WvRBSpcJCqs3G3szDX+0Oc9uD6wLEsQt1gtylFSCq30P0Ly0g83NY3YStp/qWNHfNolH/4Dk8y7OXcZBq7n0pHkd23afVojp/FtJcxjmPlGOacY967FLm8GO1L2TaAfLMM3DSK+6rPOurbSmE5hCkYRU7aG6hfWgDSYGvrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743320993; c=relaxed/simple;
	bh=yI3v5SKInTwjTobY+ygFi1ymKIfwWFxmc6JOIeibKts=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FppM5y+ZgRcyGjgBOPS9OHUbZS3ffTy4o9Ua+SH3rUOwYE5g744KJD/rTkBSJGdveqVXd4HXxvifFmDP/PVA/9wD2CtQ/HXEGCWgaX5lvNekDKq/w2LDRg/wlyL/lX+SIKC2X6EdmHDQHpWFAGEGp3L6T50/1xdfP9GjJ0K/kjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B8Q1+hwa; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B8Q1+hwa"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30bf1d48843so31055931fa.2
        for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 00:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743320989; x=1743925789; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9qB/hRdQ0EcKQyRqIVMf31SbkoGsSqeYW5NUG47zMtM=;
        b=B8Q1+hwasu0nSQ+sNwv9Awp4Vh9NZpSr9R5TLEhVGlknGYQHayEf1PLJoRD/F6hnUU
         T/tv8BSAlueItHBEEstzEuND0ROi9z5oYFpzaC5s+PX3NiUcv0B8UVxgqVQ+VtLQOGow
         +PpFWHJyfQp0mvhIRO6V2TzWebinB1EY8jXWFvifGefQrH6Rsc5RzvdWNCNjfWz9zs/P
         3ta6c/UufcUz/ZGzM6GZo7WIQFakrtOabmPPBMw29gCSdsKgjd7o/myzLyg/oOYvzFtG
         CD+lje/Ghvr7egwk9DeYDQBBqDjeXIPHV/VpINrapTSVSWJXIuYC1M0/jEgUTY2IQGZ9
         j7yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743320989; x=1743925789;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9qB/hRdQ0EcKQyRqIVMf31SbkoGsSqeYW5NUG47zMtM=;
        b=eG9Rbd95zMUIZkrwh81BGiZoyCfhEPmqhQk2RrRHPjFy3it54SNCVOg81+jOv8iNqq
         JIr6aEWfh8dFeixkpN7YDXIbM/3FWmAN0kkIexX2ElalgSp+by60Tlp1BRH4xFqEHl11
         JGMI6fxVaZagNlt6pmqemDrXKQgqG382tXA6BjHCVfTFoYfDx5yn1PCJPsoEOf3jh5wd
         wBX6/mK7xsSN2PPToL+Y0aFaxGoLDqWCgRr20AF6TPu5DAs3RWlzudKMaYtz8tJdW9nP
         19YH3qt3S5S/vlbd/FH9gOj6NRg3iDtPFau3cFve5W7Mf5W7ktJf/IdQxHaPTJG5efHW
         VT+A==
X-Forwarded-Encrypted: i=1; AJvYcCWnJfnxzggd9lx1xcks3LJNqjHqEKjb/49o3py4nzB+qHlPVU/4hf9DvHwtKQuyTKlrZBR9j0jsfQXoWCY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiItkg2FZTtDEQqphGm3qqLOh/+DiLWyHBTCmasR29czqQSWzH
	BltwV4z8sx+sFLhG95MIPJnEdjZdcCkiRMcydFxk+eQIunM7l59duVNZO7xytUxPACESwf1sW80
	hX1gMuFRgv4lN2GScFtTj4vxI2kc=
X-Gm-Gg: ASbGncvNrnPwVMXazmOWn5QNjpsjo02XNKQEmjfXe5PwqWeG9z2pRqY4tdtLhN8Zuv5
	7w9d3tSpKkFLa0pmOVwb33X6RNrrNJlvStsAxu7jrfV5v6gT05qFVXz/ji3opraudVVQLZ3ysFS
	G5cJ+8UhPzrxazWG8O0VI2svVoYQ==
X-Google-Smtp-Source: AGHT+IGvdU+Mx6wO4OhhQEUE7pQwdRXjsCMHFJf63nNSX08WSFtm58gFyANZDJu1b0h3zHc8HWOKVOMB4bdJWALzYdU=
X-Received: by 2002:a2e:a23a:0:b0:30d:e104:b67e with SMTP id
 38308e7fff4ca-30de104b853mr11329931fa.41.1743320989218; Sun, 30 Mar 2025
 00:49:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250325164854.199420-1-ubizjak@gmail.com> <20250325164854.199420-2-ubizjak@gmail.com>
 <Z-Mme_OxuhYfxgzO@gmail.com> <CAFULd4bCnnL-CBFwgAQtN9S+sUE_wikda6E+8k9632J9b62dCg@mail.gmail.com>
 <20250329110042.75a28342@pumpkin>
In-Reply-To: <20250329110042.75a28342@pumpkin>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Sun, 30 Mar 2025 09:49:43 +0200
X-Gm-Features: AQ5f1Jp6et1XspYDeD3XZxndoz0Rg61wGHQqTQz9iWKKNQKOOw9CL6YEJ8IBFjY
Message-ID: <CAFULd4aybKBdpVv_mt5EgNGDp6yk_ayGr9C4H15-3dc3h6K9aA@mail.gmail.com>
Subject: Re: [PATCH -tip 2/2] x86/hweight: Use POPCNT when available with
 X86_NATIVE_CPU option
To: David Laight <david.laight.linux@gmail.com>
Cc: Ingo Molnar <mingo@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 29, 2025 at 12:00=E2=80=AFPM David Laight
<david.laight.linux@gmail.com> wrote:
>
> On Sat, 29 Mar 2025 10:19:37 +0100
> Uros Bizjak <ubizjak@gmail.com> wrote:
>
> > On Tue, Mar 25, 2025 at 10:56=E2=80=AFPM Ingo Molnar <mingo@kernel.org>=
 wrote:
> > >
> > >
> > > * Uros Bizjak <ubizjak@gmail.com> wrote:
> > >
> > > > Emit naked POPCNT instruction when available with X86_NATIVE_CPU
> > > > option. The compiler is not bound by ABI when emitting the instruct=
ion
> > > > without the fallback call to __sw_hweight{32,64}() library function
> > > > and has much more freedom to allocate input and output operands,
> > > > including memory input operand.
> > > >
> > > > The code size of x86_64 defconfig (with X86_NATIVE_CPU option)
> > > > shrinks by 599 bytes:
> > > >
> > > >   add/remove: 0/0 grow/shrink: 45/197 up/down: 843/-1442 (-599)
> > > >   Total: Before=3D22710531, After=3D22709932, chg -0.00%
> > > >
> > > > The asm changes from e.g.:
> > > >
> > > >          3bf9c:       48 8b 3d 00 00 00 00    mov    0x0(%rip),%rdi
> > > >          3bfa3:       e8 00 00 00 00          call   3bfa8 <...>
> > > >          3bfa8:       90                      nop
> > > >          3bfa9:       90                      nop
> > > >
> > > > with:
> > > >
> > > >            34b:       31 c0                   xor    %eax,%eax
> > > >            34d:       f3 48 0f b8 c7          popcnt %rdi,%rax
> > > >
> > > > in the .altinstr_replacement section
> > > >
> > > > to:
> > > >
> > > >          3bfdc:       31 c0                   xor    %eax,%eax
> > > >          3bfde:       f3 48 0f b8 05 00 00    popcnt 0x0(%rip),%rax
> > > >          3bfe5:       00 00
> > > >
> > > > where there is no need for an entry in the .altinstr_replacement
> > > > section, shrinking all text sections by 9476 bytes:
> > > >
> > > >           text           data     bss      dec            hex filen=
ame
> > > >       27267068        4643047  814852 32724967        1f357e7 vmlin=
ux-old.o
> > > >       27257592        4643047  814852 32715491        1f332e3 vmlin=
ux-new.o
> > >
> > > > +#ifdef __POPCNT__
> > > > +     asm_inline (ASM_FORCE_CLR "popcntl %[val], %[cnt]"
> > > > +                 : [cnt] "=3D&r" (res)
> > > > +                 : [val] ASM_INPUT_RM (w));
> > > > +#else
> > > >       asm_inline (ALTERNATIVE(ANNOTATE_IGNORE_ALTERNATIVE
> > > >                               "call __sw_hweight32",
> > > >                               ASM_CLR "popcntl %[val], %[cnt]",
> > > >                               X86_FEATURE_POPCNT)
> > > >                        : [cnt] "=3Da" (res), ASM_CALL_CONSTRAINT
> > > >                        : [val] REG_IN (w));
> > >
> > > So a better optimization I think would be to declare and implement
> > > __sw_hweight32 with a different, less intrusive function call ABI tha=
t
> >
> > With an external function, the ABI specifies the location of input
> > argument and function result. Unless we want to declare the whole
> > function as asm() inline function (with some 20 instructions), we have
> > to specify the location of function arguments and where the function
> > result is to be found in the asm() that calls the external function.
> > Register allocator then uses this information to move arguments to the
> > right place before the call.
> >
> > The above approach, when used to emulate an insn,  has a drawback.
> > When the instruction is available as an alternative, it still has
> > fixed input and output registers, forced by the ABI of the function
> > call. Register allocator has to move registers unnecessarily to
> > satisfy the constraints of the function call, not the instruction
> > itself.
>
> Forcing the argument into a fixed register won't make much difference
> to execution time.
> Just a bit more work for the instruction decoder and a few more bytes
> of I-cache.
> (Register-register moves can be zero clocks.)
> In many cases (but not as many as you might hope for) the compiler
> back-tracks the input register requirement to the instruction that
> generates the value.

I'm afraid I don't fully understand what you mean by "back-tracking
the input register requirement". However, with:

asm("insn %0, %1" : "=3Dr" (out) : "r" (in));

the compiler is not obliged to match input with output, although many
times it does so (especially when input argument is dead). To avoid
false dependence on the output, we should force the compiler to always
match input and output:

asm("insn %0, %1" : "=3Dr" (out) : "0" (in));

and this will resolve false dependence (input register obviously needs
to be ready before insn) at the expense of an extra move instruction
in front of the insn in case input is not dead. This is unfortunately
not possible when one of the alternatives is a function call, where
location of input and output arguments is specified by ABI.

> In this case the called function needs two writeable registers.
> I think you can tell gcc the input is invalidated and the output
> is 'early clobber' so that the register are different.

Yes, my first patch used this approach, where output operand is cleared fir=
st:

asm("xorl %0, %0; popcntl %1, %0" : "=3D&r" (out) : "rm" (in));

Please note that "earlyclobbered" output reg can't be matched with
input reg, or with any reg that forms the address.

> > The proposed solution builds on the fact that with -march=3Dnative (and
> > also when -mpopcnt is specified on the command line) , the compiler
> > signals the availability of certain ISA by defining the corresponding
> > definition. We can use this definition to relax the constraints to fit
> > the instruction, not the ABI of the fallback function call. On x86, we
> > can also access memory directly, avoiding clobbering a temporary input
> > register.
> >
> > Without the fix for (obsolete) false dependency, the change becomes sim=
ply:
> >
> > #ifdef __POPCNT__
> >      asm ("popcntl %[val], %[cnt]"
> >                  : [cnt] "=3Dr" (res)
> >                  : [val] ASM_INPUT_RM (w));
> > #else
> >
> > and besides the reported savings of 600 bytes in the .text section
> > also allows the register allocator to schedule registers (and input
> > arguments from memory) more optimally, not counting additional 9k
> > saved space in the alternative section.
> >
> > The patch is also an example, how -march=3Dnative enables further
> > optimizations involving additional ISAs.
>
> To my mind it would be better to be able to specify oldest cpu
> type the build should support.
> Either by actual cpu type (eg 'skylake' or 'zen2') or maybe by
> a specific instruction (eg popcnt).
> The scripts would then determine the appropriate compiler flags
> and any extra -Dvar to generate appropriate code.

Please note that with -march=3Dnative the compiler driver ("gcc") does
this for you. -march=3Dnative expands to a series of -m compile flags
(you can see these flags by passing -### to gcc) and each flag defines
corresponding ISA macro when set. E.g., passing -mpopcnt defines
__POPCNT__ macro. These macros can be used instead of -Dvar for
conditional compilation that depends on -m ISA flags, passed to the
compiler ("cc1").

> The arch/x86/Kconfig.cpu seems to be missing options to select
> between 64bit cpus.
> That would also be the place to add CONFIG defines that mirror the
> X86_FEATURE_xxx flags.

While the above -march=3Dnative expands in the driver, setting e.g.
-march=3Dskylake enables CPU capabilities in the compiler itself.
However, using -march=3D...cpu...  also sets corresponding ISA macros,
so the proposed approach does not exclude Kconfig.cpu options.
Automatically set ISA macros can be used instead of X86_FEATURE_xxx
flags for maximum flexibility.

Thanks,
Uros.
