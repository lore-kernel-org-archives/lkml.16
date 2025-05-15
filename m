Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345AB2989B3
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 12:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747310910; cv=none; b=ExDbSp1G78v/qrD0zzvA4nr7CwxGPP9Z3cTrbz/6J14BOcXsb+1V2E0P5Q6+ma4vndfXHPAcnlWwsZ1P03ePA6IQKLgKOg0nDlnrcCGHYa5ZYrBMNR3/F+5CiZIkA6Qnp6Re/J6uB3HEaVz/Ql3cX4i/bvAer6oUkCEHTEtHzwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747310910; c=relaxed/simple;
	bh=jx/eB7hgLA5HQUuDgQzihrae+bLqoXk6pIT/jLB/LeI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V/bjlxWeH9Itn/Imum/O3RwGx8bwrUm1ADGgYJgV3PxCBTMMdzW//Q0/fYo/MSPkKfWA/m2uGQ+L7pTVGiqYzmQH+VOWJcaG5K+OPIy6B+trGQBI0cR/NFafPJyhA+2kAefqTIsOp37fsqRCfokFBcLzO4ke2G0DpQjKrNjS06Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GgxIcFue; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GgxIcFue"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 009CFC4CEE7;
	Thu, 15 May 2025 12:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747310909;
	bh=jx/eB7hgLA5HQUuDgQzihrae+bLqoXk6pIT/jLB/LeI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GgxIcFueqWIHANePWfZYXCpUkSPIMhQEU5tFfIFtKrX5mh9KKQEziNnPpdyexnxa/
	 LdgMNjmFFANii/HrwRPOUxjpV1C3Oj0uHHY0jTmdHvju6v7E0LMVkGZ/bzi/PrVst6
	 /AcEazD6UUpi7agkr/l+pgZ1zPp43ydtxLkf1Or+xYxCQ2wA/Fn77wcZQJ/HYvVogX
	 W+adQy4ELFF2isrrxTiIBcj1qdrism2pc0m1EkMHZkCS0vt67w5SwEklQbXsv+QUX5
	 6CrwIv+GP/7lsh1TnQKk8khqxMrwiymX7oKezg1Xbuz0Tyd/7xKmLhQTcX27QMVeuB
	 y9H6IqwfMNggQ==
Date: Thu, 15 May 2025 14:08:25 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: "Kirill A. Shutemov" <kirill@shutemov.name>,
	Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org,
	x86@kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
	Brian Gerst <brgerst@gmail.com>
Subject: Re: [PATCH v3 2/7] x86/cpu: Allow caps to be set arbitrarily early
Message-ID: <aCXZOTi6Oe0jiNq2@gmail.com>
References: <20250514104242.1275040-9-ardb+git@google.com>
 <20250514104242.1275040-11-ardb+git@google.com>
 <aCWQOzCla7i__iEl@gmail.com>
 <u4abxvlhfrg4pdvtsej6zh2wizb7krg5okps347uwp5bhselwp@7e2cbs5scxpr>
 <aCWjZ0LsNz8a7fjP@gmail.com>
 <CAMj1kXHGJcn+BrchpFSKL8mykvYjhcSGEVrRwLSXHsu7jAFW8Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXHGJcn+BrchpFSKL8mykvYjhcSGEVrRwLSXHsu7jAFW8Q@mail.gmail.com>


* Ard Biesheuvel <ardb@kernel.org> wrote:

> On Thu, 15 May 2025 at 09:18, Ingo Molnar <mingo@kernel.org> wrote:
> >
> >
> > * Kirill A. Shutemov <kirill@shutemov.name> wrote:
> >
> > > On Thu, May 15, 2025 at 08:56:59AM +0200, Ingo Molnar wrote:
> > > >
> > > > * Ard Biesheuvel <ardb+git@google.com> wrote:
> > > >
> > > > > From: Ard Biesheuvel <ardb@kernel.org>
> > > > >
> > > > > cpu_feature_enabled() uses a ternary alternative, where the late variant
> > > > > is based on code patching and the early variant accesses the capability
> > > > > field in boot_cpu_data directly.
> > > > >
> > > > > This allows cpu_feature_enabled() to be called quite early, but it still
> > > > > requires that the CPU feature detection code runs before being able to
> > > > > rely on the return value of cpu_feature_enabled().
> > > > >
> > > > > This is a problem for the implementation of pgtable_l5_enabled(), which
> > > > > is based on cpu_feature_enabled(X86_FEATURE_5LEVEL_PAGING), and may be
> > > > > called extremely early. Currently, there is a hacky workaround where
> > > > > some source files that may execute before (but also after) CPU feature
> > > > > detection have a different version of pgtable_l5_enabled(), based on the
> > > > > USE_EARLY_PGTABLE_L5 preprocessor macro.
> > > > >
> > > > > Instead, let's make it possible to set CPU feature arbitrarily early, so
> > > > > that the X86_FEATURE_5LEVEL_PAGING capability can be set before even
> > > > > entering C code.
> > > > >
> > > > > This involves relying on static initialization of boot_cpu_data and the
> > > > > cpu_caps_set/cpu_caps_cleared arrays, so they all need to reside in
> > > > > .data. This ensures that they won't be cleared along with the rest of
> > > > > BSS.
> > > > >
> > > > > Note that forcing a capability involves setting it in both
> > > > > boot_cpu_data.x86_capability[] and cpu_caps_set[].
> > > > >
> > > > > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > > > > ---
> > > > >  arch/x86/kernel/cpu/common.c | 9 +++------
> > > > >  1 file changed, 3 insertions(+), 6 deletions(-)
> > > > >
> > > > > diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
> > > > > index 6f7827015834..f6f206743d6a 100644
> > > > > --- a/arch/x86/kernel/cpu/common.c
> > > > > +++ b/arch/x86/kernel/cpu/common.c
> > > > > @@ -704,8 +704,8 @@ static const char *table_lookup_model(struct cpuinfo_x86 *c)
> > > > >  }
> > > > >
> > > > >  /* Aligned to unsigned long to avoid split lock in atomic bitmap ops */
> > > > > -__u32 cpu_caps_cleared[NCAPINTS + NBUGINTS] __aligned(sizeof(unsigned long));
> > > > > -__u32 cpu_caps_set[NCAPINTS + NBUGINTS] __aligned(sizeof(unsigned long));
> > > > > +__u32 __read_mostly cpu_caps_cleared[NCAPINTS + NBUGINTS] __aligned(sizeof(unsigned long));
> > > > > +__u32 __read_mostly cpu_caps_set[NCAPINTS + NBUGINTS] __aligned(sizeof(unsigned long));
> > > >
> > > > This change is not mentioned in the changelog AFAICS, but it should be
> > > > in a separate patch anyway.
> > >
> > > And why not __ro_after_init?
> >
> > That's patch #7 :-)
> >
> > I got confused about that too.
> >
> > Patch #2 should not touch this line, and patch #7 should simply
> > introduce __ro_after_init, and we are good I think.
> >
> 
> This change is needed because it prevents these arrays from being
> cleared along with the rest of BSS, which occurs after the startup
> code executes.

I see, it's a correctness & bisectability aspect, even if it's 
obsoleted later on. Good point, objection withdrawn.

> So conceptually, moving these out of BSS is similar to dropping the
> memset()s, and therefore this belongs in the same patch.
> 
> However, you are correct that moving these into __ro_after_init
> achieves the same thing, so I will just reorder that patch with this
> one, and clarify in the commit log that we are relying on the fact
> that __ro_after_init is not cleared at boot time.

That works fine for me too - whichever order you prefer.

Thanks,

	Ingo
