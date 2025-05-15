Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB6F2882C4
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 08:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747297383; cv=none; b=pnq9BVbSQsWEa1nJgTKs8YfT7S7ZSjCOEfaqEa/2903eNtiQXGK11xjVWxSlC0+uFnRv84HvH7rjhYa3iUr10oJnFwf2+MKaTlIuOnJ+82H7qc/axGoD5A/9/v8SJdijdOa2x4V+KTtSiUijXZiG6IZvS72kcqXn90Mu36p7Z6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747297383; c=relaxed/simple;
	bh=CfmF2rtDtTlFmFp6DbYrYHibMZSZwt+tuYMIXV2ApWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q0kl8cGr+dR+iJeFgrY/Vv8Nt971o3XfYNFCsJPVZn/bulP8doc+/xMVkeP5t5F1zsrHRNx0cC+EVBr0gKI5DpiWK503s2yDd+V+wd1utGbrxMn6wDb96Gvsu8412+5bwIsCIlcDmWZohFDbRxw4hT01pP7p9kKxu7CVnJAxwDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yrw4P1rx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yrw4P1rx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72282C4CEE7;
	Thu, 15 May 2025 08:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747297383;
	bh=CfmF2rtDtTlFmFp6DbYrYHibMZSZwt+tuYMIXV2ApWs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yrw4P1rxnbuDnwc82RBvjyUEQPxJ1DJ0qlQZxC3fXb7bfnIGrwxxAxUEmTjtFcgXB
	 LA8921x2sommgIhZINZTyQiInN74+Qo8kOgT6ZNBqtG68fBCK0QUSPEGweAkLPxntO
	 9bBzJBlyH0RNZeEQO468Co8bHvmMRKJHHCzm+NWGp8drdEY7/EBB95Zju9qBnz/74D
	 hNbAoCIXGUT+tZpnMTR4D/5dYVtgMXEwNqnSLTqawtsXefo6gwJCawpgUAeKEQI6iW
	 qTOOOQD1MdVGF5Ova0vbpQbHwH0OxNPaA378sGF1ZcMZWfyv4wpr+WNccDYQPtuSEn
	 ILhVzVW/x7OCw==
Date: Thu, 15 May 2025 10:22:59 +0200
From: Ingo Molnar <mingo@kernel.org>
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org,
	x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Brian Gerst <brgerst@gmail.com>
Subject: Re: [PATCH v3 1/7] x86/cpu: Use a new feature flag for 5 level paging
Message-ID: <aCWkY1UbhWfSfgZU@gmail.com>
References: <20250514104242.1275040-9-ardb+git@google.com>
 <20250514104242.1275040-10-ardb+git@google.com>
 <aCWbsM1qaMsKNkMj@gmail.com>
 <ct3z5lyozftd2tkzfksc6ylbh7ubeonuww2t77voymuy5egyo2@ocqfhd6gnbti>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ct3z5lyozftd2tkzfksc6ylbh7ubeonuww2t77voymuy5egyo2@ocqfhd6gnbti>


* Kirill A. Shutemov <kirill@shutemov.name> wrote:

> On Thu, May 15, 2025 at 09:45:52AM +0200, Ingo Molnar wrote:
> > 
> > * Ard Biesheuvel <ardb+git@google.com> wrote:
> > 
> > > From: Ard Biesheuvel <ardb@kernel.org>
> > > 
> > > Currently, the LA57 CPU feature flag is taken to mean two different
> > > things at once:
> > > - whether the CPU implements the LA57 extension, and is therefore
> > >   capable of supporting 5 level paging;
> > > - whether 5 level paging is currently in use.
> > > 
> > > This means the LA57 capability of the hardware is hidden when a LA57
> > > capable CPU is forced to run with 4 levels of paging. It also means the
> > > the ordinary CPU capability detection code will happily set the LA57
> > > capability and it needs to be cleared explicitly afterwards to avoid
> > > inconsistencies.
> > > 
> > > Separate the two so that the CPU hardware capability can be identified
> > > unambigously in all cases.
> > > 
> > > To avoid breaking existing users that might assume that 5 level paging
> > > is being used when the "la57" string is visible in /proc/cpuinfo,
> > > repurpose that string to mean that 5-level paging is in use, and add a
> > > new string la57_capable to indicate that the CPU feature is implemented
> > > by the hardware.
> > > 
> > > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > > ---
> > >  arch/x86/include/asm/cpufeatures.h               |  3 ++-
> > >  arch/x86/include/asm/page_64.h                   |  2 +-
> > >  arch/x86/include/asm/pgtable_64_types.h          |  2 +-
> > >  arch/x86/kernel/cpu/common.c                     | 16 ++--------------
> > >  arch/x86/kvm/x86.h                               |  4 ++--
> > >  drivers/iommu/amd/init.c                         |  4 ++--
> > >  drivers/iommu/intel/svm.c                        |  4 ++--
> > >  tools/testing/selftests/kvm/x86/set_sregs_test.c |  2 +-
> > >  8 files changed, 13 insertions(+), 24 deletions(-)
> > > 
> > > diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/cpufeatures.h
> > > index f67a93fc9391..d59bee5907e7 100644
> > > --- a/arch/x86/include/asm/cpufeatures.h
> > > +++ b/arch/x86/include/asm/cpufeatures.h
> > > @@ -395,7 +395,7 @@
> > >  #define X86_FEATURE_AVX512_BITALG	(16*32+12) /* "avx512_bitalg" Support for VPOPCNT[B,W] and VPSHUF-BITQMB instructions */
> > >  #define X86_FEATURE_TME			(16*32+13) /* "tme" Intel Total Memory Encryption */
> > >  #define X86_FEATURE_AVX512_VPOPCNTDQ	(16*32+14) /* "avx512_vpopcntdq" POPCNT for vectors of DW/QW */
> > > -#define X86_FEATURE_LA57		(16*32+16) /* "la57" 5-level page tables */
> > > +#define X86_FEATURE_LA57		(16*32+16) /* "la57_hw" 5-level page tables */
> > >  #define X86_FEATURE_RDPID		(16*32+22) /* "rdpid" RDPID instruction */
> > >  #define X86_FEATURE_BUS_LOCK_DETECT	(16*32+24) /* "bus_lock_detect" Bus Lock detect */
> > >  #define X86_FEATURE_CLDEMOTE		(16*32+25) /* "cldemote" CLDEMOTE instruction */
> > > @@ -483,6 +483,7 @@
> > >  #define X86_FEATURE_PREFER_YMM		(21*32+ 8) /* Avoid ZMM registers due to downclocking */
> > >  #define X86_FEATURE_APX			(21*32+ 9) /* Advanced Performance Extensions */
> > >  #define X86_FEATURE_INDIRECT_THUNK_ITS	(21*32+10) /* Use thunk for indirect branches in lower half of cacheline */
> > > +#define X86_FEATURE_5LEVEL_PAGING	(21*32+11) /* "la57" Whether 5 levels of page tables are in use */
> > 
> > So there's a new complication here, KVM doesn't like the use of 
> > synthethic CPU flags, for understandable reasons:
> > 
> >   inlined from ‘intel_pmu_set_msr’ at arch/x86/kvm/vmx/pmu_intel.c:369:7:
> >   ...
> >   ./arch/x86/kvm/reverse_cpuid.h:102:9: note: in expansion of macro ‘BUILD_BUG_ON’
> >     102 |         BUILD_BUG_ON(x86_leaf == CPUID_LNX_5);
> >         |         ^~~~~~~~~~~~
> > 
> > (See x86-64 allmodconfig)
> > 
> > Even though previously X86_FEATURE_LA57 was effectively a synthethic 
> > CPU flag (it got artificially turned off by the Linux kernel if 5-level 
> > paging was disabled) ...
> > 
> > So I think the most straightforward solution would be to do the change 
> > below, and pass through LA57 flag if 5-level paging is enabled in the 
> > host kernel. This is similar to as if the firmware turned off LA57, and 
> > it doesn't bring in all the early-boot complications bare metal has. It 
> > should also match the previous behavior I think.
> > 
> > Thoughts?
> > 
> > Thanks,
> > 
> > 	Ingo
> > 
> > =================>
> > 
> >  arch/x86/kvm/cpuid.c | 6 ++++++
> >  arch/x86/kvm/x86.h   | 4 ++--
> >  2 files changed, 8 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/x86/kvm/cpuid.c b/arch/x86/kvm/cpuid.c
> > index 571c906ffcbf..d951d71aea3b 100644
> > --- a/arch/x86/kvm/cpuid.c
> > +++ b/arch/x86/kvm/cpuid.c
> > @@ -1221,6 +1221,12 @@ void kvm_set_cpu_caps(void)
> >  		kvm_cpu_cap_clear(X86_FEATURE_RDTSCP);
> >  		kvm_cpu_cap_clear(X86_FEATURE_RDPID);
> >  	}
> > +	/*
> > +	 * Clear the LA57 flag in the guest if the host kernel
> > +	 * does not have 5-level paging support:
> > +	 */
> > +	if (kvm_cpu_cap_has(X86_FEATURE_LA57) && !pgtable_l5_enabled())
> 
> X86_FEATURE_LA57 check seems redundant.

Possibly. I wanted to limit the clearing of X86_FEATURE_LA57 only to 
precisely the case where it was set to begin with. Ie. don't clear it 
when it's not present to begin with.

It shouldn't matter, as this is KVM-module-init-only code.

Thanks,

	Ingo
