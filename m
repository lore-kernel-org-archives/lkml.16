Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84ED19924E
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 08:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747210717; cv=none; b=ut/mLdHLFHfEaHCaa2aJysAkvppeo8tXg5Fx1lRDeUXwLzEVNbV5je3Lf1jVGXVVpjxHITi00Ac/uRn9ljX0DpXmDcxVa7SnsJFWx9XRk/Wfkwkco8qc9DK2rTdV6m8KFa2oT8rsLH4PVp9QnLDPAUT08b5gFiNyL2oHa6Oallo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747210717; c=relaxed/simple;
	bh=t55QOfG3IGnJI3lQebW7f5DNGSkxQIVBq1X2Ywcy+6A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rjVpbprlrc5ZSAUR7xMa6DWVWvlp314JqmH7Btc7F8OXMSyJyk6VbNIT3yoxV03/kf8bekTQ5QgHmaP2I9OApIN85YL8z9Y2klv7F/rpwV0hi+oXoIf/7ysITHAVozQB+f+x+rQYc6/ws/qZspgEjk+0Cv415ljAdwUXpxjYQ2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aA3O3yWp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aA3O3yWp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23A22C4CEE9
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 08:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747210717;
	bh=t55QOfG3IGnJI3lQebW7f5DNGSkxQIVBq1X2Ywcy+6A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=aA3O3yWpR6fltXl1TLEZSkkX9Oa3xluh597evuzteZjh9uwZg0iynAMQNHh/yqTxs
	 hALjvzqa6VEUXm3EOP30ok9rnOJdx3V10V49oKXu+/cXukdNcCAtpem9RMWnUDGV3P
	 mlp0uY1Hgbzfgi2w0nwRwgqB1xla4rkZqZShVMuH056jsc2q1bOh1VQ065nr7gI3Fy
	 YRyjnPrl2TG8gD2vd1r9RuMGvp7qQiT4fbmrWngP9feQTBnkYjN/GcQ7I/69Oy7Yil
	 tE3yUT4jgVY0gZodke8OK39GxYwOcIjp0/+5vkBIiRjMQEhqcJADbL0kvQHHZW+NS/
	 Cx8MH41sEyqzQ==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54e9021d2b5so767002e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 01:18:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWsnIjmBcElpccNT7h/dKZU8PrR4zBQMc3Kczo6RsOpz7H1okKhgpkpDCjZBQ7sTBgMIpp5GcopOqLg+0A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcXRCfTesByIMwHCsQ+X+0OsYG9iKN9ZkyDb79Qu9Ro3nTKgWO
	3/i/bRScI2umXBIU+4i8TL7O6ulPnDVVub+gwT54mLJ2YlX1KMiFoHnJYhwVsxHKEHbyEQupqPz
	7cBuY7FyhZQ6hr+mUy7XiBAWrDDk=
X-Google-Smtp-Source: AGHT+IEzB8dfVcMXxXxR35kXFlYXGYrP9vM6pMAbopZH5yOieyCdCPQajb6jBl47ZsV7MVyLWCiSa5uzyV+rofuSyDw=
X-Received: by 2002:a05:6512:260f:b0:549:5769:6af6 with SMTP id
 2adb3069b0e04-550d58e6f30mr773638e87.9.1747210715536; Wed, 14 May 2025
 01:18:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513111157.717727-8-ardb+git@google.com> <20250513111157.717727-12-ardb+git@google.com>
 <aCRRJ_ahL2IRXxcj@gmail.com>
In-Reply-To: <aCRRJ_ahL2IRXxcj@gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 14 May 2025 09:18:24 +0100
X-Gmail-Original-Message-ID: <CAMj1kXF0Kc+--5rOqcVKoF-NhYfzA2rioaWsB09VK1hJ49nG+w@mail.gmail.com>
X-Gm-Features: AX0GCFuX9ZNTijv-e11EuxWjfMWG-ua3ieTBBBpt6qYGcLF20xuBJKxmTrxWM7o
Message-ID: <CAMj1kXF0Kc+--5rOqcVKoF-NhYfzA2rioaWsB09VK1hJ49nG+w@mail.gmail.com>
Subject: Re: [RFC PATCH v2 4/6] x86/boot: Set 5-level paging CPU cap before
 entering C code
To: Ingo Molnar <mingo@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, x86@kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 May 2025 at 09:15, Ingo Molnar <mingo@kernel.org> wrote:
>
>
> * Ard Biesheuvel <ardb+git@google.com> wrote:
>
> > diff --git a/arch/x86/kernel/asm-offsets.c b/arch/x86/kernel/asm-offsets.c
> > index ad4ea6fb3b6c..6259b474073b 100644
> > --- a/arch/x86/kernel/asm-offsets.c
> > +++ b/arch/x86/kernel/asm-offsets.c
> > @@ -33,6 +33,14 @@
> >
> >  static void __used common(void)
> >  {
> > +     OFFSET(CPUINFO_x86, cpuinfo_x86, x86);
> > +     OFFSET(CPUINFO_x86_vendor, cpuinfo_x86, x86_vendor);
> > +     OFFSET(CPUINFO_x86_model, cpuinfo_x86, x86_model);
> > +     OFFSET(CPUINFO_x86_stepping, cpuinfo_x86, x86_stepping);
> > +     OFFSET(CPUINFO_cpuid_level, cpuinfo_x86, cpuid_level);
> > +     OFFSET(CPUINFO_x86_capability, cpuinfo_x86, x86_capability);
> > +     OFFSET(CPUINFO_x86_vendor_id, cpuinfo_x86, x86_vendor_id);
> > +
> >       BLANK();
> >       OFFSET(TASK_threadsp, task_struct, thread.sp);
> >  #ifdef CONFIG_STACKPROTECTOR
> > diff --git a/arch/x86/kernel/asm-offsets_32.c b/arch/x86/kernel/asm-offsets_32.c
> > index 2b411cd00a4e..e0a292db97b2 100644
> > --- a/arch/x86/kernel/asm-offsets_32.c
> > +++ b/arch/x86/kernel/asm-offsets_32.c
> > @@ -12,15 +12,6 @@ void foo(void);
> >
> >  void foo(void)
> >  {
> > -     OFFSET(CPUINFO_x86, cpuinfo_x86, x86);
> > -     OFFSET(CPUINFO_x86_vendor, cpuinfo_x86, x86_vendor);
> > -     OFFSET(CPUINFO_x86_model, cpuinfo_x86, x86_model);
> > -     OFFSET(CPUINFO_x86_stepping, cpuinfo_x86, x86_stepping);
> > -     OFFSET(CPUINFO_cpuid_level, cpuinfo_x86, cpuid_level);
> > -     OFFSET(CPUINFO_x86_capability, cpuinfo_x86, x86_capability);
> > -     OFFSET(CPUINFO_x86_vendor_id, cpuinfo_x86, x86_vendor_id);
> > -     BLANK();
> > -
>
> This is needed so that we can run (well, build) the setup_force_cpu_cap
> macro on x86-64 too, right?
>
> Could you please split out this portion into a separate patch, to
> simplify the more dangerous half of the patch?
>

Sure.

> > -     if (IS_ENABLED(CONFIG_X86_5LEVEL) && (native_read_cr4() & X86_CR4_LA57))
> > -             setup_force_cpu_cap(X86_FEATURE_5LEVEL_PAGING);
>

Note that at this point, we'll likely still have to force clear the
original X86_FEATURE_LA57 bit, to address the issue that Kirill raised
that user space is now likely to conflate the "la57" cpuinfo string
with 5-level paging being in use.
