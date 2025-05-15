Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825B1EBE
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 09:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747302369; cv=none; b=ZfpGyHuPcRuLXDJt4U01E5ciZZgPlZQA3mvm+7PQr/xuvh9SQW2m9vVFERTtFKVWHAmfVxGndZ0xEkHWMf6KP/sFNYXcu5ucnxT/EYC5H0OFxSKPoh1kPmrU8TTRJyUJQYHu1zzO8gqK9fACe1KQgjWyL1bYIjg5yOp0SSIuN5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747302369; c=relaxed/simple;
	bh=Y3QMPPJmNXpXEwzqX4k6KmCgn+nqI7JZkJIdarO5id0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JW1pKqf32I9kdOf9dlTov3dIslcXVmWGcU7KvarEnJDRPpQSqXFP30b0pRrLOx9tNpwH74HWCjb690mt7fTBYqGR1zaAlzaBnu483j9lDhG4fBSLko9Duqk50IVy2qi9vY7xKh8CZcD55tP0UBC0cK5RLVlB5eCNj7dT/XUF7ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LYZFILvI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LYZFILvI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6954C4CEEF
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 09:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747302368;
	bh=Y3QMPPJmNXpXEwzqX4k6KmCgn+nqI7JZkJIdarO5id0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LYZFILvIXx3zrJRsvYep9Gio5jTmJ9W1oByZps7Nrikpw6V87GOtkoTkTumpk5cJw
	 Q1JBHuElqwUDbm0ls8EKAOc/tnivkIz8LN3d07FCm7JL58uDS8QbPEfb0o0mbBm5Ep
	 1jCalARIRmU4jHnsIypCZI81YASsDoZCSmJJA1i8KomP5nERF4ErH5Rb+DI2jaC7UW
	 YJ26wGh5Bj8wcpw8TopfQ7hvlCBtOtghmYZuOqMDyAz7U8x6YzjwGKzNjeS7Xt480C
	 nP40dDCfDtJVf4yEdx6vreqBApjBIC1miz33BbTmkJ2G9yzw4FErbkTnR4WiNRts05
	 cxIWqssLj2IQQ==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30db1bd3bddso5895101fa.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 02:46:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV/zHwSk4JkCEOfCKTp34CfvzAp1fWKY8y5wwoWWBu77mVbQvHGDjSZv+aPSJ7eDp4Lun/dpdykVpZrrDo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXMvXiN8+emfs8nkSohhpAIL5FAf/KStrbUO8sX4sqa9IQjqW4
	E0qhUnmdtZgdTfHCbErKTOtUIN3GvtMQzBKrTifhEh2hTP8F2ShIzwbeUXgYjeloqYgVPW6jDPW
	stkVH5eNDCz91J/jKMA5QfuIjHbg=
X-Google-Smtp-Source: AGHT+IER/VqvHd1HO/79/w65ofZnsVpISi9F5T8S/31wtIU7dN7AI6xj/SRMSuKkhA+T2UgZasXw16MjSsXm168fqBA=
X-Received: by 2002:a2e:a583:0:b0:30b:ee81:9622 with SMTP id
 38308e7fff4ca-327fac57fc9mr6954881fa.31.1747302367281; Thu, 15 May 2025
 02:46:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514104242.1275040-9-ardb+git@google.com> <20250514104242.1275040-11-ardb+git@google.com>
 <aCWQOzCla7i__iEl@gmail.com> <u4abxvlhfrg4pdvtsej6zh2wizb7krg5okps347uwp5bhselwp@7e2cbs5scxpr>
 <aCWjZ0LsNz8a7fjP@gmail.com>
In-Reply-To: <aCWjZ0LsNz8a7fjP@gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 15 May 2025 10:45:55 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHGJcn+BrchpFSKL8mykvYjhcSGEVrRwLSXHsu7jAFW8Q@mail.gmail.com>
X-Gm-Features: AX0GCFtlHODawPrgjk89MG643OE4f258exr62qCBSQwhg89mfD6Dpd9Pxi7mQTY
Message-ID: <CAMj1kXHGJcn+BrchpFSKL8mykvYjhcSGEVrRwLSXHsu7jAFW8Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] x86/cpu: Allow caps to be set arbitrarily early
To: Ingo Molnar <mingo@kernel.org>
Cc: "Kirill A. Shutemov" <kirill@shutemov.name>, Ard Biesheuvel <ardb+git@google.com>, 
	linux-kernel@vger.kernel.org, x86@kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, Brian Gerst <brgerst@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 15 May 2025 at 09:18, Ingo Molnar <mingo@kernel.org> wrote:
>
>
> * Kirill A. Shutemov <kirill@shutemov.name> wrote:
>
> > On Thu, May 15, 2025 at 08:56:59AM +0200, Ingo Molnar wrote:
> > >
> > > * Ard Biesheuvel <ardb+git@google.com> wrote:
> > >
> > > > From: Ard Biesheuvel <ardb@kernel.org>
> > > >
> > > > cpu_feature_enabled() uses a ternary alternative, where the late variant
> > > > is based on code patching and the early variant accesses the capability
> > > > field in boot_cpu_data directly.
> > > >
> > > > This allows cpu_feature_enabled() to be called quite early, but it still
> > > > requires that the CPU feature detection code runs before being able to
> > > > rely on the return value of cpu_feature_enabled().
> > > >
> > > > This is a problem for the implementation of pgtable_l5_enabled(), which
> > > > is based on cpu_feature_enabled(X86_FEATURE_5LEVEL_PAGING), and may be
> > > > called extremely early. Currently, there is a hacky workaround where
> > > > some source files that may execute before (but also after) CPU feature
> > > > detection have a different version of pgtable_l5_enabled(), based on the
> > > > USE_EARLY_PGTABLE_L5 preprocessor macro.
> > > >
> > > > Instead, let's make it possible to set CPU feature arbitrarily early, so
> > > > that the X86_FEATURE_5LEVEL_PAGING capability can be set before even
> > > > entering C code.
> > > >
> > > > This involves relying on static initialization of boot_cpu_data and the
> > > > cpu_caps_set/cpu_caps_cleared arrays, so they all need to reside in
> > > > .data. This ensures that they won't be cleared along with the rest of
> > > > BSS.
> > > >
> > > > Note that forcing a capability involves setting it in both
> > > > boot_cpu_data.x86_capability[] and cpu_caps_set[].
> > > >
> > > > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > > > ---
> > > >  arch/x86/kernel/cpu/common.c | 9 +++------
> > > >  1 file changed, 3 insertions(+), 6 deletions(-)
> > > >
> > > > diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
> > > > index 6f7827015834..f6f206743d6a 100644
> > > > --- a/arch/x86/kernel/cpu/common.c
> > > > +++ b/arch/x86/kernel/cpu/common.c
> > > > @@ -704,8 +704,8 @@ static const char *table_lookup_model(struct cpuinfo_x86 *c)
> > > >  }
> > > >
> > > >  /* Aligned to unsigned long to avoid split lock in atomic bitmap ops */
> > > > -__u32 cpu_caps_cleared[NCAPINTS + NBUGINTS] __aligned(sizeof(unsigned long));
> > > > -__u32 cpu_caps_set[NCAPINTS + NBUGINTS] __aligned(sizeof(unsigned long));
> > > > +__u32 __read_mostly cpu_caps_cleared[NCAPINTS + NBUGINTS] __aligned(sizeof(unsigned long));
> > > > +__u32 __read_mostly cpu_caps_set[NCAPINTS + NBUGINTS] __aligned(sizeof(unsigned long));
> > >
> > > This change is not mentioned in the changelog AFAICS, but it should be
> > > in a separate patch anyway.
> >
> > And why not __ro_after_init?
>
> That's patch #7 :-)
>
> I got confused about that too.
>
> Patch #2 should not touch this line, and patch #7 should simply
> introduce __ro_after_init, and we are good I think.
>

This change is needed because it prevents these arrays from being
cleared along with the rest of BSS, which occurs after the startup
code executes.

So conceptually, moving these out of BSS is similar to dropping the
memset()s, and therefore this belongs in the same patch.

However, you are correct that moving these into __ro_after_init
achieves the same thing, so I will just reorder that patch with this
one, and clarify in the commit log that we are relying on the fact
that __ro_after_init is not cleared at boot time.
