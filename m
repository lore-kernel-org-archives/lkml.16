Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A9710FD
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 07:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747295448; cv=none; b=N0vUkuBnol6/eKZCyFLmZ7z9L/Jz5bXZcsKn8RCWzSFeBkp4OvJ2gH+dqBGzWalmgWMUXlgJ09A/9A+zxxw9JRA44kFb6c/ojyRM8RKr7LUvxeXV0vYZzhGtM4FRxQAJ9sT5YS+7AMnbtwE3p2/QL95c5DxfZOTHA2t0o9oBndM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747295448; c=relaxed/simple;
	bh=Y6H+tysQw87230rMqT5/yl0D+9ra99LIvA1Z2emvV+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OcKn3+gs13k5LTbngsOm9/UjWlUc7faXRmZMCVrESRaQ/KaMmbSAEhjQlH3UXFKGOivgyLsEda485P5RXY26F5Dnb6rSAlgOs4eYF8AHeZLRRZpBL+plm32eo+4tLmEQ60fnlvfBtv9hSbPtYthFZBupFziTpSNSYPJcWwrmZXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f/0w7Ypr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f/0w7Ypr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67038C4CEE7;
	Thu, 15 May 2025 07:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747295448;
	bh=Y6H+tysQw87230rMqT5/yl0D+9ra99LIvA1Z2emvV+g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f/0w7Yprv7t2jpY16FaTVJKpjSRfFqiNEmrTffJrlPnHXAz1fctjRpDGkJMOtp3vk
	 uJ0jPPb47xygK1sHNEqc/ScdLMipc07V8D9utHpc9qJOteauScWSiiJTAOp2rYiKff
	 cj6EBtGJVs0kgvmiNKQ/YQhoKNTaxkb/FPFpvXdGR+OjKJcme1H3ueTG0E0hFjB8K1
	 JGKRo3byUODxuL4340tuRx/97WsZTAV06oIvXcP4rqp/wTJrstKNy00w27eDdecoqF
	 Qld6+KHUjTr+kc8jeV4pjShlpDYHsb8lWeNFJcHNHoinjQgdiidzFq1xeMJ6F4a0+T
	 JJd0vZbZX5ncg==
Date: Thu, 15 May 2025 09:50:43 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Brian Gerst <brgerst@gmail.com>
Subject: Re: [PATCH v3 2/7] x86/cpu: Allow caps to be set arbitrarily early
Message-ID: <aCWc0_9ziMoyD48X@gmail.com>
References: <20250514104242.1275040-9-ardb+git@google.com>
 <20250514104242.1275040-11-ardb+git@google.com>
 <aCWQOzCla7i__iEl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCWQOzCla7i__iEl@gmail.com>


* Ingo Molnar <mingo@kernel.org> wrote:

> 
> * Ard Biesheuvel <ardb+git@google.com> wrote:
> 
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
> >  arch/x86/kernel/cpu/common.c | 9 +++------
> >  1 file changed, 3 insertions(+), 6 deletions(-)
> > 
> > diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
> > index 6f7827015834..f6f206743d6a 100644
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
> This change is not mentioned in the changelog AFAICS, but it should be 
> in a separate patch anyway.

So patch #7 makes this __ro_after_init.

I think we should not introduce the __read_mostly attribute in patch
#2, and introduce __ro_after_init in patch #7 - with the same end 
result.

Thanks,

	Ingo
