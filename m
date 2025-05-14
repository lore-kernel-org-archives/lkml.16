Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C15321D3EB
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 08:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747210647; cv=none; b=pu7VcCC/XrjRhC/23dCbmYlGCanhzh742PsoIaceNy6nSxu8JzLFG+rNWTct+EhuyrRW/JNG1RBbQd2C6j+3a4oVBq3AMn6FRj+Dt38sg309DnbCUWtrc/GRRhlCykDJT7KrBmChAWfpweH0EEyHLqdiSPWRueLvhrQGwQDUf7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747210647; c=relaxed/simple;
	bh=/YlYfCNn5kLnJH3oPbvXxjsXSAWLi6S2bgC3Rw4/5hc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BgBkERLXmWqMEaDAYOw0o6x3IJiMMBh6rbAFwhDhkNGtpaO5/yIRNub19yKws0NI3Rp9GY6KNNPjvFB65qlHjkckOxYFxNNmzBgLqya1t6k1Ysvk88PFNmZzBJkyWdBBQZvFOjmuqiBFnln0tO2Q0eEniwA3XA0zDkuEUGasQhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aNYr1Nx4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aNYr1Nx4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 920E4C4CEEB;
	Wed, 14 May 2025 08:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747210647;
	bh=/YlYfCNn5kLnJH3oPbvXxjsXSAWLi6S2bgC3Rw4/5hc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aNYr1Nx4hPsdGoXAEizPd0ddur4YtrV0jrLb8PCPE8XcXz6TMeFrbaJpxX0HC9KPQ
	 J4IxxPVQ4nVEjeOSPtRR4+GI4OTWDvCLsh3Si3pemeCWLm6st6p6j0qa9CvEz0vptx
	 OgTTpwwlPSkWoI7VXPlskA3W5On8YxN/MYYchlqG/60+16KjkZGjLx7I/telqxcM3a
	 BUpvlCLYspHEhrqCKiw4bymiEzXUCBWkj27gtNd4jg/VXUeSyFuuYHmDiZtsvGGS0l
	 tL05mj5137MNgoYOJ1JhewXwNrSDRbUeQxD5C2onetUzOgHCEVMS1bMg9yrbWYASJ0
	 FNiLLYPa16Kvw==
Date: Wed, 14 May 2025 10:17:23 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Brian Gerst <brgerst@gmail.com>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org,
	x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [RFC PATCH v2 3/6] x86/cpu: Allow caps to be set arbitrarily
 early
Message-ID: <aCRRk_4hLD36UQVd@gmail.com>
References: <20250513111157.717727-8-ardb+git@google.com>
 <20250513111157.717727-11-ardb+git@google.com>
 <CAMzpN2jTPFTA9NhXfsrTZ0-prUH-1DbZ5ewt92BZSMqBCZyskw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMzpN2jTPFTA9NhXfsrTZ0-prUH-1DbZ5ewt92BZSMqBCZyskw@mail.gmail.com>


* Brian Gerst <brgerst@gmail.com> wrote:

> On Tue, May 13, 2025 at 7:40 AM Ard Biesheuvel <ardb+git@google.com> wrote:
> >
> > From: Ard Biesheuvel <ardb@kernel.org>
> >
> > cpu_feature_enabled() uses a ternary alternative, where the late variant
> > is based on code patching and the early variant accesses the capability
> > field in boot_cpu_data directly.
> >
> > This allows cpu_feature_enabled() to be called quite early, but it still
> > requires that the CPU feature detection code runs before being able to
> > rely on the return value of cpu_feature_enabled().
> >
> > This is a problem for the implementation of pgtable_l5_enabled(), which
> > is based on cpu_feature_enabled(X86_FEATURE_5LEVEL_PAGING), and may be
> > called extremely early. Currently, there is a hacky workaround where
> > some source files that may execute before (but also after) CPU feature
> > detection have a different version of pgtable_l5_enabled(), based on the
> > USE_EARLY_PGTABLE_L5 preprocessor macro.
> >
> > Instead, let's make it possible to set CPU feature arbitrarily early, so
> > that the X86_FEATURE_5LEVEL_PAGING capability can be set before even
> > entering C code.
> >
> > This involves relying on static initialization of boot_cpu_data and the
> > cpu_caps_set/cpu_caps_cleared arrays, so they all need to reside in
> > .data. This ensures that they won't be cleared along with the rest of
> > BSS.
> >
> > Note that forcing a capability involves setting it in both
> > boot_cpu_data.x86_capability[] and cpu_caps_set[].
> >
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > ---
> >  arch/x86/kernel/cpu/common.c | 10 ++++------
> >  1 file changed, 4 insertions(+), 6 deletions(-)
> >
> > diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
> > index bbec5c4cd8ed..aaa6d9e51ef1 100644
> > --- a/arch/x86/kernel/cpu/common.c
> > +++ b/arch/x86/kernel/cpu/common.c
> > @@ -704,8 +704,8 @@ static const char *table_lookup_model(struct cpuinfo_x86 *c)
> >  }
> >
> >  /* Aligned to unsigned long to avoid split lock in atomic bitmap ops */
> > -__u32 cpu_caps_cleared[NCAPINTS + NBUGINTS] __aligned(sizeof(unsigned long));
> > -__u32 cpu_caps_set[NCAPINTS + NBUGINTS] __aligned(sizeof(unsigned long));
> > +__u32 __read_mostly cpu_caps_cleared[NCAPINTS + NBUGINTS] __aligned(sizeof(unsigned long));
> > +__u32 __read_mostly cpu_caps_set[NCAPINTS + NBUGINTS] __aligned(sizeof(unsigned long));
> 
> Is there any scenario where capabilities are changed after boot?

Not supposed to...

> If not, this could possibly be __ro_after_init.

Yeah, and in a separate patch.

Thanks,

	Ingo
