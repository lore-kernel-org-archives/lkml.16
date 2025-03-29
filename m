Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C854042048
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 09:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743239987; cv=none; b=W9G7//WbPA7UirLtqaWOtCIE2k8FDIx4xiIAiFaX+RwUAbvvqTvx96aR5V2wKve210rrQBR0XANK5FQ3C3FpZvM9rpb0SwDcNakOsDtRWLkAGjfZHa7qLWKQd1WWSycTAtaa0yQo7zmPI2Oq0MSfs11XaF2YZRSE5nJOuwjpcCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743239987; c=relaxed/simple;
	bh=NyjDm5nCNjTC7rcDox6l7EVTuV3iQMiJqfcengk6nx4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YlbXarl6xhwBcEJ4vB2GXu6tELy+Bqa5tnndKmU/CO9Jhz45y292n9xCp8HBF9oSzr+MTvLWji3OwTFChx887nVNSrPdVPdDZ76uNGYiaFc4ZqiTCNTPEHDd6+UPBMqJ4W48q94JwSQ45YfWeByKUDq3LNzTPWS4E+c8dXXqA34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hJ/dj0cr; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hJ/dj0cr"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5499bd3084aso2722053e87.0
        for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 02:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743239984; x=1743844784; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5wlu+gsg1SANJyfAnL7C7RXgklIENVYl+gKIe6lKbEA=;
        b=hJ/dj0cruYVjeT6Y8gLF9T7EDfs50TMQmCOyBVf7WZs8BwL9Bn7DLY2hWWZuGHcUe3
         yx01s1XXp7AEglvInxs8MSxbpaP0cf0XH60aUIVSDnXIlT+ZX5lEd9kvByONuUMwMEA/
         XC6g5DyDpP3dMYquZcHOvDOlZDegiCCBOq+vP/XNWLbW/eiIjb0ikL4uu48UkIEafDtB
         ceDzfnMn4jXLfFVKYoP3zK/UFYzfKzML9V+60w7zcTh10xZiHWWnZaVENAthak53QBcP
         A4EyD3Rs5Zj5tNhcdzy4EU5V8W5anipuGCLwFzdsJQTRRiKPl0KDOn8xhSJh+3P5OpjR
         jgjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743239984; x=1743844784;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5wlu+gsg1SANJyfAnL7C7RXgklIENVYl+gKIe6lKbEA=;
        b=GoY5U9vbcVp7352dFTOn1iklMjil1zDfabwFKX7KdUDguMcbf0PFlZfoan+lX+rfLr
         xlMFLzpf4hyOdTosieT/Rg8NFstYWyoiQR7IVXfhrI//r4vbvmE7Ya89HhcAGFTXo4xl
         LCIlHgWSwJl1S3ro3sxWCdpZ3NpwRgjCCzW/K70ltscsqM2611vXYgekkIjMmoaW7tXz
         Q3R7Lomow1iiFHmM0bH5Y/kiSaPgUatviOPa+MTuVkNfcvEyQqMei07l+o8TBu8EMuHO
         sDIDpj9X/wS68TI1FGhtlExyx02wtrEnE7r6/a8HJncGqvkS/tYo3eJTIQYxZj77FOAS
         bqcg==
X-Forwarded-Encrypted: i=1; AJvYcCUCj2ogaNpmzCSSAA5QKPToZcI77q+h3mIyrfDWXVGlyPuxHr6z9kidDYGMFKc3j/pCvgTU5Oy/Mx3bf4A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtL1yzq3FQgE73kaVPuU/4Th2+9YpDv7Sy0Iigw6U13UxNn1K8
	7aLghsQ8wUUQ/c/EUfdPgZNeFpD8RewiHYHXDUDRuKhYtQqm1VqA6de2i88eFNoCU8oPRYfYblb
	Z5COKog3rORP2aVTI4R4XvFJDJ9z/8LAI40I=
X-Gm-Gg: ASbGnct6uiZzGVDvZBN0/9HrTOM1rk0O/rGkGeN2j3XWsaYCY501YFRP7acTV2loo5v
	3iDEiJ1OcxvIZoZi017z18EuSLDYKPav9R0xckmH3ksK7rXGmYBn7JCGYMec7o89tu53CLr+F8w
	CmjHGi/KPlt83APvNHM51ClFntXw==
X-Google-Smtp-Source: AGHT+IGCQNAoywZrpA8Mhjnaa2QAz/7AjPcQcEtp0YBf1MA4oFlMdSiGDwgIDBVVSP835PRgLy8FiCcNXUaDAIERz7k=
X-Received: by 2002:a05:6512:31cd:b0:54a:f6ae:9e6f with SMTP id
 2adb3069b0e04-54b10dba757mr914933e87.4.1743239983574; Sat, 29 Mar 2025
 02:19:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250325164854.199420-1-ubizjak@gmail.com> <20250325164854.199420-2-ubizjak@gmail.com>
 <Z-Mme_OxuhYfxgzO@gmail.com>
In-Reply-To: <Z-Mme_OxuhYfxgzO@gmail.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Sat, 29 Mar 2025 10:19:37 +0100
X-Gm-Features: AQ5f1JqhBXcEqMMddpAUXuIgkuzv1UotkytiLa7YGYrtzDjhigskN3OVws2loLI
Message-ID: <CAFULd4bCnnL-CBFwgAQtN9S+sUE_wikda6E+8k9632J9b62dCg@mail.gmail.com>
Subject: Re: [PATCH -tip 2/2] x86/hweight: Use POPCNT when available with
 X86_NATIVE_CPU option
To: Ingo Molnar <mingo@kernel.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 25, 2025 at 10:56=E2=80=AFPM Ingo Molnar <mingo@kernel.org> wro=
te:
>
>
> * Uros Bizjak <ubizjak@gmail.com> wrote:
>
> > Emit naked POPCNT instruction when available with X86_NATIVE_CPU
> > option. The compiler is not bound by ABI when emitting the instruction
> > without the fallback call to __sw_hweight{32,64}() library function
> > and has much more freedom to allocate input and output operands,
> > including memory input operand.
> >
> > The code size of x86_64 defconfig (with X86_NATIVE_CPU option)
> > shrinks by 599 bytes:
> >
> >   add/remove: 0/0 grow/shrink: 45/197 up/down: 843/-1442 (-599)
> >   Total: Before=3D22710531, After=3D22709932, chg -0.00%
> >
> > The asm changes from e.g.:
> >
> >          3bf9c:       48 8b 3d 00 00 00 00    mov    0x0(%rip),%rdi
> >          3bfa3:       e8 00 00 00 00          call   3bfa8 <...>
> >          3bfa8:       90                      nop
> >          3bfa9:       90                      nop
> >
> > with:
> >
> >            34b:       31 c0                   xor    %eax,%eax
> >            34d:       f3 48 0f b8 c7          popcnt %rdi,%rax
> >
> > in the .altinstr_replacement section
> >
> > to:
> >
> >          3bfdc:       31 c0                   xor    %eax,%eax
> >          3bfde:       f3 48 0f b8 05 00 00    popcnt 0x0(%rip),%rax
> >          3bfe5:       00 00
> >
> > where there is no need for an entry in the .altinstr_replacement
> > section, shrinking all text sections by 9476 bytes:
> >
> >           text           data     bss      dec            hex filename
> >       27267068        4643047  814852 32724967        1f357e7 vmlinux-o=
ld.o
> >       27257592        4643047  814852 32715491        1f332e3 vmlinux-n=
ew.o
>
> > +#ifdef __POPCNT__
> > +     asm_inline (ASM_FORCE_CLR "popcntl %[val], %[cnt]"
> > +                 : [cnt] "=3D&r" (res)
> > +                 : [val] ASM_INPUT_RM (w));
> > +#else
> >       asm_inline (ALTERNATIVE(ANNOTATE_IGNORE_ALTERNATIVE
> >                               "call __sw_hweight32",
> >                               ASM_CLR "popcntl %[val], %[cnt]",
> >                               X86_FEATURE_POPCNT)
> >                        : [cnt] "=3Da" (res), ASM_CALL_CONSTRAINT
> >                        : [val] REG_IN (w));
>
> So a better optimization I think would be to declare and implement
> __sw_hweight32 with a different, less intrusive function call ABI that

With an external function, the ABI specifies the location of input
argument and function result. Unless we want to declare the whole
function as asm() inline function (with some 20 instructions), we have
to specify the location of function arguments and where the function
result is to be found in the asm() that calls the external function.
Register allocator then uses this information to move arguments to the
right place before the call.

The above approach, when used to emulate an insn,  has a drawback.
When the instruction is available as an alternative, it still has
fixed input and output registers, forced by the ABI of the function
call. Register allocator has to move registers unnecessarily to
satisfy the constraints of the function call, not the instruction
itself.

The proposed solution builds on the fact that with -march=3Dnative (and
also when -mpopcnt is specified on the command line) , the compiler
signals the availability of certain ISA by defining the corresponding
definition. We can use this definition to relax the constraints to fit
the instruction, not the ABI of the fallback function call. On x86, we
can also access memory directly, avoiding clobbering a temporary input
register.

Without the fix for (obsolete) false dependency, the change becomes simply:

#ifdef __POPCNT__
     asm ("popcntl %[val], %[cnt]"
                 : [cnt] "=3Dr" (res)
                 : [val] ASM_INPUT_RM (w));
#else

and besides the reported savings of 600 bytes in the .text section
also allows the register allocator to schedule registers (and input
arguments from memory) more optimally, not counting additional 9k
saved space in the alternative section.

The patch is also an example, how -march=3Dnative enables further
optimizations involving additional ISAs.

Thanks,
Uros.
