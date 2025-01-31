Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89D92F56
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 22:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738362987; cv=none; b=aXfhtjilIBHgqKYOc/j9wbRB62R55CzuJC3SIxPCVXV1Ya7c8I+QKKeJjUm3osMECik2IzBsQYvZj03y8hkfwzMMFabjzAFE7JMoHtWS2QUXJwtDlSrVfVVPJ5kCL4FvmbUx9cvtqzPJl69jelmz+rJ6ObXXfIGmen5np00/98g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738362987; c=relaxed/simple;
	bh=ISlt5/PDDFqP7wxREjfop3kosyMAl4rCAmNyxhzbzOc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d5zN6hYRWMQIqG16hMwJDXNsUABLiCxKZcy+JGA9yma0afnemWzE16ywJfIHvtfUkOCCWPHiYyKFY9sbwHN72WKr0DehqJ7s4LoU6jGR8zUu4jqstz0nbqJzCs6YTwnzy99sJOdjghTz0Ax99XoW0UhxzJMEW2C1btqE//jxUoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mcL6jpHQ; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mcL6jpHQ"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6dd0d09215aso18756056d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 14:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738362984; x=1738967784; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wvDny1ac21tRGhx2ySw712Hb03JxEXDqCvEnC4eh9lY=;
        b=mcL6jpHQUK40WIiwVD51VgdqtHxr/uCsaQvAeM7ZrxxYPPV2Z3l9BAG1UVX+RVJmMw
         w2mdicLzNaa7RWByjsklRVC6OaBiHK0odUa7mnkb/ZLfTwc/BfBzZFmIjUCvOEPYf4by
         7wbvyxZZK7tqeYyd0CkV68e5nzdQEgpoxPi0Pa7YSx9Dq9Mf1PBDwbJnfv429VhOFWY+
         d1DcdQAtjoH4bAvfV7DNmAQOwFlyTnoG3Coe/7OswqMtw9Ozr5fMo9au+3VdDzOVq2gO
         K4equ3g0Q0KdGHEh6rIvvMLwlQ5ABezs1ves/C4/hjIV+N0sBHJiGrKBcGsG4W+cEGyp
         CXSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738362984; x=1738967784;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wvDny1ac21tRGhx2ySw712Hb03JxEXDqCvEnC4eh9lY=;
        b=EDVJ9cx2rVLqZR1lOztvjWEMZN0jWDnh72tgkfKK+GNdTOQQyInVfGi9JzkCB3VgPh
         oQCShN1d4MZbWrr2jDVmB6oJBpnFHlPBjK/LB8UR5X6mz3J2gA4XRQ+W31CBclLY4/x+
         nvO3xNsDVRUEiIxVOKP35Po3d3fgS4RDESV7Qni9N7c3DhuglCg8SFYYuD4iXwD3bAun
         ob69qWMZtdqeUsBdxF1HhqUbMDhTdjnoIt2qnRH5gL9JmT8VpJNtjfJsmqqsoooRKoU1
         UTwATcBHYGi2xRWiu1L60qc+lapz7hCa824J8zkFjSynBRpW/pc0UhqdOJUT6aj0MFes
         fr5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUZG/GEdMFTpRf8lKOLNpyS3L4SthgP5gKBc3+IP0CpMR7/UpFYbwH9VBdtglzVFeI1EZ32tFDNxm/laOE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAZukSy86VZ/69oq7RhBPVJ1NrzjucQS3/D0TNsSS1yYgl4ZBA
	zM0eE9gHvzRIyRE/zYXzC67J+7fQz4nJ6ya0qs6V6Jaw6jBmvlEciQNa06a1Slqv5UP6SdBKdb5
	1Y7p7/1utUbQP58MAJqNQM0RW47Mh56+OerU=
X-Gm-Gg: ASbGnctIeLSk5LWKZV57DPbVUhtPTDBdBECeDMHOXg96Ll6zU2dQxQHtGbNp0AXzNtA
	cKLWr1d9boU4ZUUzaY1oqTSGmb8juJ3FsFBvfZsNkf7ZEgqGQ+L0X9+X7sS0EPLEaqOJaI4GceC
	tEuHbT7AR9gTqc7jOmjVmHkPDfow==
X-Google-Smtp-Source: AGHT+IHH9iVE6/A5i0N0LABcCku3U8PQilbw7hG6RBp32rFQoQ+tAJjsJHwMvL+H42BUhsTnW9HVm+oryDfs7tXY6uI=
X-Received: by 2002:a05:6214:3112:b0:6da:dc79:a3cd with SMTP id
 6a1803df08f44-6e243a7f135mr179470696d6.0.1738362984325; Fri, 31 Jan 2025
 14:36:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241211222945.1325793-1-xur@google.com> <20241211222945.1325793-2-xur@google.com>
 <20241211230553.GA3654215@ax162> <CAF1bQ=RA2J1H97pBsiABxOv0tgUgPQWE8Jgaqx33nbsGJFvH7w@mail.gmail.com>
In-Reply-To: <CAF1bQ=RA2J1H97pBsiABxOv0tgUgPQWE8Jgaqx33nbsGJFvH7w@mail.gmail.com>
From: Yabin Cui <yabinc@google.com>
Date: Fri, 31 Jan 2025 14:36:13 -0800
X-Gm-Features: AWEUYZlXzlrVA18yGIESzCjZKvQL1puNoL3UdMtUmDM_-6y8VbcfrcV-iTJkh_A
Message-ID: <CALJ9ZPM9pUw=M4fFLKRTyr0k4T8Y=4DY+ob96UW_-dWZRTeurA@mail.gmail.com>
Subject: Re: [PATCH 2/2] Propeller: Remove the architecture specific config
To: Rong Xu <xur@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Will Deacon <will@kernel.org>, Han Shen <shenhan@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Kees Cook <kees@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Alice Ryhl <aliceryhl@google.com>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, 
	Samuel Holland <samuel.holland@sifive.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, x86@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Tested-by: Yabin Cui <yabinc@google.com>

On Wed, Dec 11, 2024 at 11:48=E2=80=AFPM Rong Xu <xur@google.com> wrote:
>
>  (o
>
> On Wed, Dec 11, 2024 at 3:06=E2=80=AFPM Nathan Chancellor <nathan@kernel.=
org> wrote:
> >
> > Hi Rong,
> >
> > On Wed, Dec 11, 2024 at 02:29:43PM -0800, Rong Xu wrote:
> > > The CONFIG_PROPELLER_CLANG option currently depends on
> > > ARCH_SUPPORTS_PROPELLER_CLANG, but this dependency seems unnecessary.
> > >
> > > Remove ARCH_SUPPORTS_PROPELLER_CLANG and allow users to control
> > > Propeller builds solely through CONFIG_PROPELLER_CLANG. This simplifi=
es
> > > the kconfig and avoids potential confusion.
> > >
> > > Signed-off-by: Rong Xu <xur@google.com>
> > > Suggested-by: Will Deacon <will@kernel.org>
> >
> > In commit d5dc95836147 ("kbuild: Add Propeller configuration for kernel
> > build"), you added .llvm_bb_addr_map to arch/x86/kernel/vmlinux.lds.S.
> > Was this to address a orphan section warning from the linker? Is that
> > same change needed in the linker scripts of the other architectures tha=
t
> > clang supports building in the kernel?
>
> The .llvm_bb_addr_map section is created when compiling with the
> -fbasic-block-address-map flag (or the older -fbasic-block-sections=3Dlab=
els
> option), with LLVM. We need the change in the linker script to group the
> sections together and emit in the final vmlinux.
>
> This applies to all architectures, as LLVM can generate these sections fo=
r
> any architecture when the corresponding option is used.
>
> The statement that AutoFDO and Propeller are only supported on certain
> platforms really refers to the availability of *native* profile generatio=
n:
> the native profile generation is only available on these platforms.
>
> Hope this helps,
>
> -Rong
>
> > Cheers,
> > Nathan
> >
> > > ---
> > >  arch/Kconfig     | 4 ----
> > >  arch/x86/Kconfig | 1 -
> > >  2 files changed, 5 deletions(-)
> > >
> > > diff --git a/arch/Kconfig b/arch/Kconfig
> > > index 0b36d74d47031..83731b858ba65 100644
> > > --- a/arch/Kconfig
> > > +++ b/arch/Kconfig
> > > @@ -828,12 +828,8 @@ config AUTOFDO_CLANG
> > >
> > >         If unsure, say N.
> > >
> > > -config ARCH_SUPPORTS_PROPELLER_CLANG
> > > -     bool
> > > -
> > >  config PROPELLER_CLANG
> > >       bool "Enable Clang's Propeller build"
> > > -     depends on ARCH_SUPPORTS_PROPELLER_CLANG
> > >       depends on CC_IS_CLANG && CLANG_VERSION >=3D 190000
> > >       help
> > >         This option enables Clang=E2=80=99s Propeller build. When the=
 Propeller
> > > diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> > > index 9363d9cc9a00a..6c633d93c6390 100644
> > > --- a/arch/x86/Kconfig
> > > +++ b/arch/x86/Kconfig
> > > @@ -128,7 +128,6 @@ config X86
> > >       select ARCH_SUPPORTS_LTO_CLANG
> > >       select ARCH_SUPPORTS_LTO_CLANG_THIN
> > >       select ARCH_SUPPORTS_RT
> > > -     select ARCH_SUPPORTS_PROPELLER_CLANG    if X86_64
> > >       select ARCH_USE_BUILTIN_BSWAP
> > >       select ARCH_USE_CMPXCHG_LOCKREF         if X86_CMPXCHG64
> > >       select ARCH_USE_MEMTEST
> > > --
> > > 2.47.0.338.g60cca15819-goog
> > >
