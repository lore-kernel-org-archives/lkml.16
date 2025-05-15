Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9182206B2
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 08:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747296434; cv=none; b=kqYNq0c7k6dAENHLw0BKBGOABqzCTMD4puvVN8Us8OPCxVqsCAbeohQ6M+OXA+fTVIzTZLDl6xxCeRIiwqmq2vBU5ZCtK8ZqFYHvEPeU/WgKnvkhcMVXt3rf3k5Ysy4DvhM/HaMlq4KLLOShRXHz6S4PMABVgnNmo7vcirveid8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747296434; c=relaxed/simple;
	bh=AVh4CRmVLAEOlwBiX8XsDRDG0cjEQBjTcgjz0+0PEDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PiyFIBy1d50Y/detaacSRyO29e7qEqKUNegkpJWpAMGutpNofIlRp4mCN+ctl0jw9JcXRFBYIwmXUdWNfH5GwvpOGue1msURS3fa5iCWQNq7/ZMpwiJs9yBw4Y746R1BBlcwSbiFlydmPGPAHOx/7rB0K6ZFfwUhU4GCF9bNKsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=bInDEViw; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=QltwRtct; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="bInDEViw";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="QltwRtct"
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 47A70254013D;
	Thu, 15 May 2025 04:07:11 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Thu, 15 May 2025 04:07:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm2;
	 t=1747296431; x=1747382831; bh=/UcFtr5DBxpnnH+4Q9HZjqQX+lwlssGD
	1SJrKtbwOZo=; b=bInDEViwqiesZBhXxWXtTjTKiNWcrH27TQjV0+lb0CXcHzq1
	uMoBLPGUTXyKorj9bFVM8HHVrhKgJ3ONqKJZjHqg4R74vIKzPJCRHDaT9f5P2b2O
	oqNwma196qHPNZxeITA0eEDV/eeDMjhUTlcnk0VVXk5Ob4I05inc4fq7mc2Sym/9
	IovE8AGyB6VjCjiU9HVN3pvp0ok6COmc5oS1he73ZlEEbSrmxw1AGRok8xpp68fH
	bk2dMd0ZKKV/a0qn3cTCL2SD6u7srQj48Ejpn4OaO/2ksKcg+5fTHP9vFs2N0OKj
	vy/c8UDoSRgQ1/JU8evjwDLaFE2Z0eM5v8L2FA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1747296431; x=
	1747382831; bh=/UcFtr5DBxpnnH+4Q9HZjqQX+lwlssGD1SJrKtbwOZo=; b=Q
	ltwRtctiG+56HAT2q4t77B2/J/oSVz2w4A2QYSH3Nldc1C70kDi4G5rQitfsgtAq
	lVTVWexh1ineeuk45/NtlEjPY8Qvk1gnisEYWiStN0UEwPJfxKfez9PDgvbT4Gn0
	fW9D1zhciyfhQEEuH2t59S6RCTUiKPZiVWNxc9gP3x1JQHWxRhVhAEioqWRThNKr
	C5DN11OHcvYDUnulEPL9LiFf9QD3eUrp5p2WgbSwFSd9LSQzzCkFt5mO2rVIcv5A
	xlXFtysc7bUN68uDMS8DHjHBVXv5uFPSgIYY+8zKiJu+4em/EGI38tExymfqZYDd
	oAVqBfu+DUnDhiQGMAV8A==
X-ME-Sender: <xms:rqAlaMBu6KBmcsgeCxUF_DRkffZyOQXE8w3t0jjKKNjo58mmUChKjg>
    <xme:rqAlaOjDbTccOoM1l4QU-2YZpkHAlQa6bsSXlRWyS93SS-e8C866-H9DaZeTa_BIu
    YOHdqv2dPNkwNZyPAE>
X-ME-Received: <xmr:rqAlaPkx__iOTZqkzdnVh860ofT78v2n9Hxrcuv6Jgi5HTDuxTntRM8ALpLKfgUvp8PrPQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdelfeehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkefstddt
    tdejnecuhfhrohhmpedfmfhirhhilhhlucetrdcuufhhuhhtvghmohhvfdcuoehkihhrih
    hllhesshhhuhhtvghmohhvrdhnrghmvgeqnecuggftrfgrthhtvghrnhepudeffeetffeg
    teefjeetvdekgeelveeiheeiffeltddtgeeuffevvdehveevheffnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepkhhirhhilhhlsehshhhuthgv
    mhhovhdrnhgrmhgvpdhnsggprhgtphhtthhopeejpdhmohguvgepshhmthhpohhuthdprh
    gtphhtthhopehmihhnghhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrrhgusgdo
    ghhithesghhoohhglhgvrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlse
    hvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepgiekieeskhgvrhhnvghlrdho
    rhhgpdhrtghpthhtoheprghruggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtoh
    hrvhgrlhgusheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohep
    sghrghgvrhhsthesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:rqAlaCxp_Y8KLYnF6cMGbCHCDk02U1hKbsg1KEsOMFUXfK_8VCtw8w>
    <xmx:rqAlaBQUN1SNaGWlFXGpNq0cHpUSIvbCLirQ9oahl76_QiX93SH4Dw>
    <xmx:rqAlaNYg1LLnWJUfD0fN460P7inO-mZKG3HQTFE_ZJSqSwbu__fI5Q>
    <xmx:rqAlaKTQtwWFEnLbgSkcYeZklJPeZ0kPSLeWsWd2x96Td3sO7ekBkw>
    <xmx:r6AlaF4h7s0uk1J6QHhaLMpyPfFSHByR5qR0lOZ4ARxHkuNbC_elFerS>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 15 May 2025 04:07:07 -0400 (EDT)
Date: Thu, 15 May 2025 11:07:04 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Ingo Molnar <mingo@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, 
	x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Brian Gerst <brgerst@gmail.com>
Subject: Re: [PATCH v3 1/7] x86/cpu: Use a new feature flag for 5 level paging
Message-ID: <ct3z5lyozftd2tkzfksc6ylbh7ubeonuww2t77voymuy5egyo2@ocqfhd6gnbti>
References: <20250514104242.1275040-9-ardb+git@google.com>
 <20250514104242.1275040-10-ardb+git@google.com>
 <aCWbsM1qaMsKNkMj@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aCWbsM1qaMsKNkMj@gmail.com>

On Thu, May 15, 2025 at 09:45:52AM +0200, Ingo Molnar wrote:
> 
> * Ard Biesheuvel <ardb+git@google.com> wrote:
> 
> > From: Ard Biesheuvel <ardb@kernel.org>
> > 
> > Currently, the LA57 CPU feature flag is taken to mean two different
> > things at once:
> > - whether the CPU implements the LA57 extension, and is therefore
> >   capable of supporting 5 level paging;
> > - whether 5 level paging is currently in use.
> > 
> > This means the LA57 capability of the hardware is hidden when a LA57
> > capable CPU is forced to run with 4 levels of paging. It also means the
> > the ordinary CPU capability detection code will happily set the LA57
> > capability and it needs to be cleared explicitly afterwards to avoid
> > inconsistencies.
> > 
> > Separate the two so that the CPU hardware capability can be identified
> > unambigously in all cases.
> > 
> > To avoid breaking existing users that might assume that 5 level paging
> > is being used when the "la57" string is visible in /proc/cpuinfo,
> > repurpose that string to mean that 5-level paging is in use, and add a
> > new string la57_capable to indicate that the CPU feature is implemented
> > by the hardware.
> > 
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > ---
> >  arch/x86/include/asm/cpufeatures.h               |  3 ++-
> >  arch/x86/include/asm/page_64.h                   |  2 +-
> >  arch/x86/include/asm/pgtable_64_types.h          |  2 +-
> >  arch/x86/kernel/cpu/common.c                     | 16 ++--------------
> >  arch/x86/kvm/x86.h                               |  4 ++--
> >  drivers/iommu/amd/init.c                         |  4 ++--
> >  drivers/iommu/intel/svm.c                        |  4 ++--
> >  tools/testing/selftests/kvm/x86/set_sregs_test.c |  2 +-
> >  8 files changed, 13 insertions(+), 24 deletions(-)
> > 
> > diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/cpufeatures.h
> > index f67a93fc9391..d59bee5907e7 100644
> > --- a/arch/x86/include/asm/cpufeatures.h
> > +++ b/arch/x86/include/asm/cpufeatures.h
> > @@ -395,7 +395,7 @@
> >  #define X86_FEATURE_AVX512_BITALG	(16*32+12) /* "avx512_bitalg" Support for VPOPCNT[B,W] and VPSHUF-BITQMB instructions */
> >  #define X86_FEATURE_TME			(16*32+13) /* "tme" Intel Total Memory Encryption */
> >  #define X86_FEATURE_AVX512_VPOPCNTDQ	(16*32+14) /* "avx512_vpopcntdq" POPCNT for vectors of DW/QW */
> > -#define X86_FEATURE_LA57		(16*32+16) /* "la57" 5-level page tables */
> > +#define X86_FEATURE_LA57		(16*32+16) /* "la57_hw" 5-level page tables */
> >  #define X86_FEATURE_RDPID		(16*32+22) /* "rdpid" RDPID instruction */
> >  #define X86_FEATURE_BUS_LOCK_DETECT	(16*32+24) /* "bus_lock_detect" Bus Lock detect */
> >  #define X86_FEATURE_CLDEMOTE		(16*32+25) /* "cldemote" CLDEMOTE instruction */
> > @@ -483,6 +483,7 @@
> >  #define X86_FEATURE_PREFER_YMM		(21*32+ 8) /* Avoid ZMM registers due to downclocking */
> >  #define X86_FEATURE_APX			(21*32+ 9) /* Advanced Performance Extensions */
> >  #define X86_FEATURE_INDIRECT_THUNK_ITS	(21*32+10) /* Use thunk for indirect branches in lower half of cacheline */
> > +#define X86_FEATURE_5LEVEL_PAGING	(21*32+11) /* "la57" Whether 5 levels of page tables are in use */
> 
> So there's a new complication here, KVM doesn't like the use of 
> synthethic CPU flags, for understandable reasons:
> 
>   inlined from ‘intel_pmu_set_msr’ at arch/x86/kvm/vmx/pmu_intel.c:369:7:
>   ...
>   ./arch/x86/kvm/reverse_cpuid.h:102:9: note: in expansion of macro ‘BUILD_BUG_ON’
>     102 |         BUILD_BUG_ON(x86_leaf == CPUID_LNX_5);
>         |         ^~~~~~~~~~~~
> 
> (See x86-64 allmodconfig)
> 
> Even though previously X86_FEATURE_LA57 was effectively a synthethic 
> CPU flag (it got artificially turned off by the Linux kernel if 5-level 
> paging was disabled) ...
> 
> So I think the most straightforward solution would be to do the change 
> below, and pass through LA57 flag if 5-level paging is enabled in the 
> host kernel. This is similar to as if the firmware turned off LA57, and 
> it doesn't bring in all the early-boot complications bare metal has. It 
> should also match the previous behavior I think.
> 
> Thoughts?
> 
> Thanks,
> 
> 	Ingo
> 
> =================>
> 
>  arch/x86/kvm/cpuid.c | 6 ++++++
>  arch/x86/kvm/x86.h   | 4 ++--
>  2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/kvm/cpuid.c b/arch/x86/kvm/cpuid.c
> index 571c906ffcbf..d951d71aea3b 100644
> --- a/arch/x86/kvm/cpuid.c
> +++ b/arch/x86/kvm/cpuid.c
> @@ -1221,6 +1221,12 @@ void kvm_set_cpu_caps(void)
>  		kvm_cpu_cap_clear(X86_FEATURE_RDTSCP);
>  		kvm_cpu_cap_clear(X86_FEATURE_RDPID);
>  	}
> +	/*
> +	 * Clear the LA57 flag in the guest if the host kernel
> +	 * does not have 5-level paging support:
> +	 */
> +	if (kvm_cpu_cap_has(X86_FEATURE_LA57) && !pgtable_l5_enabled())

X86_FEATURE_LA57 check seems redundant.

> +		kvm_cpu_cap_clear(X86_FEATURE_LA57);
>  }
>  EXPORT_SYMBOL_GPL(kvm_set_cpu_caps);
>  
> diff --git a/arch/x86/kvm/x86.h b/arch/x86/kvm/x86.h
> index d2c093f17ae5..9dc32a409076 100644
> --- a/arch/x86/kvm/x86.h
> +++ b/arch/x86/kvm/x86.h
> @@ -243,7 +243,7 @@ static inline u8 vcpu_virt_addr_bits(struct kvm_vcpu *vcpu)
>  
>  static inline u8 max_host_virt_addr_bits(void)
>  {
> -	return kvm_cpu_cap_has(X86_FEATURE_5LEVEL_PAGING) ? 57 : 48;
> +	return kvm_cpu_cap_has(X86_FEATURE_LA57) ? 57 : 48;
>  }
>  
>  /*
> @@ -603,7 +603,7 @@ static inline bool __kvm_is_valid_cr4(struct kvm_vcpu *vcpu, unsigned long cr4)
>  		__reserved_bits |= X86_CR4_FSGSBASE;    \
>  	if (!__cpu_has(__c, X86_FEATURE_PKU))           \
>  		__reserved_bits |= X86_CR4_PKE;         \
> -	if (!__cpu_has(__c, X86_FEATURE_5LEVEL_PAGING))          \
> +	if (!__cpu_has(__c, X86_FEATURE_LA57))          \
>  		__reserved_bits |= X86_CR4_LA57;        \
>  	if (!__cpu_has(__c, X86_FEATURE_UMIP))          \
>  		__reserved_bits |= X86_CR4_UMIP;        \

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
