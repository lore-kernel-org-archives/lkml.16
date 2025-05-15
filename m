Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781BC21D3CD
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 08:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747297132; cv=none; b=HvYHVJ7rbitqD608JkdzFxMfSbXn4+TQND13NpWHJv26amFDtL4VsgQhqpQBA7jcbDqULuAr9ivm3Nc9ji+0/ERLC4f3JrN3XbbDq44eo49SSLFPRoKxAsZuufVKo36dgC2huCNdIr3uNQhX7TJ1UaxxcnhU3pkggpRTcQAK5ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747297132; c=relaxed/simple;
	bh=W6C5BAYocS7THKk1qX/GgSP/sMPCRtbML/ytvMET5IA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RurDB92vbYpI2Nhuv6s/q4sJt5TZ6wUpJ9TezMkynmPAXpdrkmpct7NcJdw7R2SR98E54wHP6u8gdXsMFyQUV4+AXxq+zGGKxtM6U7mA/Isa9RWVOnKgoj5ef7QJnZYTu+zsCefplw9zLECVFZX104SBDEDBZ6XSAdxIgm+07IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bZW7U9rv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bZW7U9rv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 358E5C4CEE7;
	Thu, 15 May 2025 08:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747297132;
	bh=W6C5BAYocS7THKk1qX/GgSP/sMPCRtbML/ytvMET5IA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bZW7U9rv6CFb0WHgLWB787uOalcUQVUHVBBWYix8lIbrlwYCR8renw7yXoI7XxcEL
	 UtK6iUk1OpnrryyC7Nehnr+RNNI+j6jgzyjPfYaCR6GQiBvJ+r18Yzh+6kxb9AMDim
	 kg+Qm/kTIkehN4b3rmovzJY80NqflkbhjpvZXYfbzkp6miR1uiMbJO6GEhpFH35UDO
	 1nZhNnzBbH2yFX6Q0+RVHVyY6vvkZ2vPp/oU9j+gPx3tmvz08Yxuk92fmiutBxVdYg
	 SbA0JFB/Da6ur8yvJ8Z59dl44jG3x6BugnKluJm8mesy/WFUJRoYCTPrPsfhrmdyKS
	 tXC2ZERK2T1zA==
Date: Thu, 15 May 2025 10:18:47 +0200
From: Ingo Molnar <mingo@kernel.org>
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org,
	x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Brian Gerst <brgerst@gmail.com>
Subject: Re: [PATCH v3 2/7] x86/cpu: Allow caps to be set arbitrarily early
Message-ID: <aCWjZ0LsNz8a7fjP@gmail.com>
References: <20250514104242.1275040-9-ardb+git@google.com>
 <20250514104242.1275040-11-ardb+git@google.com>
 <aCWQOzCla7i__iEl@gmail.com>
 <u4abxvlhfrg4pdvtsej6zh2wizb7krg5okps347uwp5bhselwp@7e2cbs5scxpr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <u4abxvlhfrg4pdvtsej6zh2wizb7krg5okps347uwp5bhselwp@7e2cbs5scxpr>


* Kirill A. Shutemov <kirill@shutemov.name> wrote:

> On Thu, May 15, 2025 at 08:56:59AM +0200, Ingo Molnar wrote:
> > 
> > * Ard Biesheuvel <ardb+git@google.com> wrote:
> > 
> > > From: Ard Biesheuvel <ardb@kernel.org>
> > > 
> > > cpu_feature_enabled() uses a ternary alternative, where the late variant
> > > is based on code patching and the early variant accesses the capability
> > > field in boot_cpu_data directly.
> > > 
> > > This allows cpu_feature_enabled() to be called quite early, but it still
> > > requires that the CPU feature detection code runs before being able to
> > > rely on the return value of cpu_feature_enabled().
> > > 
> > > This is a problem for the implementation of pgtable_l5_enabled(), which
> > > is based on cpu_feature_enabled(X86_FEATURE_5LEVEL_PAGING), and may be
> > > called extremely early. Currently, there is a hacky workaround where
> > > some source files that may execute before (but also after) CPU feature
> > > detection have a different version of pgtable_l5_enabled(), based on the
> > > USE_EARLY_PGTABLE_L5 preprocessor macro.
> > > 
> > > Instead, let's make it possible to set CPU feature arbitrarily early, so
> > > that the X86_FEATURE_5LEVEL_PAGING capability can be set before even
> > > entering C code.
> > > 
> > > This involves relying on static initialization of boot_cpu_data and the
> > > cpu_caps_set/cpu_caps_cleared arrays, so they all need to reside in
> > > .data. This ensures that they won't be cleared along with the rest of
> > > BSS.
> > > 
> > > Note that forcing a capability involves setting it in both
> > > boot_cpu_data.x86_capability[] and cpu_caps_set[].
> > > 
> > > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > > ---
> > >  arch/x86/kernel/cpu/common.c | 9 +++------
> > >  1 file changed, 3 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
> > > index 6f7827015834..f6f206743d6a 100644
> > > --- a/arch/x86/kernel/cpu/common.c
> > > +++ b/arch/x86/kernel/cpu/common.c
> > > @@ -704,8 +704,8 @@ static const char *table_lookup_model(struct cpuinfo_x86 *c)
> > >  }
> > >  
> > >  /* Aligned to unsigned long to avoid split lock in atomic bitmap ops */
> > > -__u32 cpu_caps_cleared[NCAPINTS + NBUGINTS] __aligned(sizeof(unsigned long));
> > > -__u32 cpu_caps_set[NCAPINTS + NBUGINTS] __aligned(sizeof(unsigned long));
> > > +__u32 __read_mostly cpu_caps_cleared[NCAPINTS + NBUGINTS] __aligned(sizeof(unsigned long));
> > > +__u32 __read_mostly cpu_caps_set[NCAPINTS + NBUGINTS] __aligned(sizeof(unsigned long));
> > 
> > This change is not mentioned in the changelog AFAICS, but it should be 
> > in a separate patch anyway.
> 
> And why not __ro_after_init?

That's patch #7 :-)

I got confused about that too.

Patch #2 should not touch this line, and patch #7 should simply 
introduce __ro_after_init, and we are good I think.

Thanks,

	Ingo
