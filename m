Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFFED26D4F7
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 11:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745406716; cv=none; b=N6Ivxi6nnBWV9ts1CVYa7Jx0+R8sjDMObdRa1j5fcHnhEbZKLL4GHdZ3p+1lAp673IhS8YaPkPFOh1yNPw2S0C/9MSxKaisrINGrk/uh9ovHIUTOrHyqhCPZps4jDoLp6nKXKGg6mgPTov5lAHhQBEsM3yYr0HlZai+9pnNK+jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745406716; c=relaxed/simple;
	bh=7JF7P2qS4SB6DrZAGOl+9+UQooOUX8XT2naGwe0eouI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JuBqaWB0PQrlrDF5YxPV1GXWbFEeYdri2Vz/cvE2+CMR68fvow4eY+KQhSYjSCq/5kCqunGSvqyqpFTU8anbdUxNi4BOaJgc1u8AWrHj6KsaNa80XlWbFRQuOtGSCsLUlvfgdu5/6QvpTB2gp7invdgXZYmMHZjDJTSTunzmHu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NxTlcq56; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NxTlcq56"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EACEFC4CEE2;
	Wed, 23 Apr 2025 11:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745406715;
	bh=7JF7P2qS4SB6DrZAGOl+9+UQooOUX8XT2naGwe0eouI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NxTlcq561futisD+LRi+fsEdtwocQ4KhTRWJWnnBSsh1LHwiTKkmT3KBKo0AX09ia
	 ooXxJil4w12RGrbJQr4/jfwpAKi48wbPhs8inj8Yzz1YD5/nABsoBSYEMA/Mn6dvrM
	 DDmfDfo7m9thdECwKNCorxyHVLI8s4/n+N3Sf7a37r28ebV3BE9wS7+Zdkfr/VObnN
	 qC82fIHCKgQcSXM2oIx/odVp3YUVVQW2gr/WYiQint/oU1+NB7wHVw/6EJukdw1tFl
	 DeUnWLbqHPsJyzeuR/tR5wnTVeQ9b2lwVEfcb69av6nmM+8/Q7k8CLQyV0W+0N7F/H
	 MgjHDQMOMOsOg==
Date: Wed, 23 Apr 2025 14:11:45 +0300
From: Mike Rapoport <rppt@kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	"Sauerwein, David" <dssauerw@amazon.de>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	David Hildenbrand <david@redhat.com>, Marc Zyngier <maz@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mike Rapoport <rppt@linux.ibm.com>, Will Deacon <will@kernel.org>,
	kvmarm@lists.cs.columbia.edu, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Ruihan Li <lrh2000@pku.edu.cn>
Subject: Re: [PATCH v3 3/7] mm: Implement for_each_valid_pfn() for
 CONFIG_SPARSEMEM
Message-ID: <aAjK8Yq3OJH5hP12@kernel.org>
References: <20250423081828.608422-1-dwmw2@infradead.org>
 <20250423081828.608422-4-dwmw2@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423081828.608422-4-dwmw2@infradead.org>

On Wed, Apr 23, 2025 at 08:52:45AM +0100, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Implement for_each_valid_pfn() based on two helper functions.
> 
> The first_valid_pfn() function largely mirrors pfn_valid(), calling into
> a pfn_section_first_valid() helper which is trivial for the !VMEMMAP case,
> and in the VMEMMAP case will skip to the next subsection as needed.
> 
> Since next_valid_pfn() knows that its argument *is* a valid PFN, it
> doesn't need to do any checking at all while iterating over the low bits
> within a (sub)section mask; the whole (sub)section is either present or
> not.
> 
> Note that the VMEMMAP version of pfn_section_first_valid() may return a
> value *higher* than end_pfn when skipping to the next subsection, and
> first_valid_pfn() happily returns that higher value. This is fine.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> Previous-revision-reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>  include/asm-generic/memory_model.h | 26 ++++++++--
>  include/linux/mmzone.h             | 78 ++++++++++++++++++++++++++++++
>  2 files changed, 99 insertions(+), 5 deletions(-)
> 
> diff --git a/include/asm-generic/memory_model.h b/include/asm-generic/memory_model.h
> index 74d0077cc5fa..044536da3390 100644
> --- a/include/asm-generic/memory_model.h
> +++ b/include/asm-generic/memory_model.h
> @@ -31,12 +31,28 @@ static inline int pfn_valid(unsigned long pfn)
>  }
>  #define pfn_valid pfn_valid
>  
> +static inline bool first_valid_pfn(unsigned long *pfn)
> +{
> +	/* avoid <linux/mm.h> include hell */
> +	extern unsigned long max_mapnr;
> +	unsigned long pfn_offset = ARCH_PFN_OFFSET;
> +
> +	if (*pfn < pfn_offset) {
> +		*pfn = pfn_offset;
> +		return true;
> +	}
> +
> +	if ((*pfn - pfn_offset) < max_mapnr)
> +		return true;
> +
> +	return false;
> +}
> +

Looks like it's a leftover from one of the previous versions.

>  #ifndef for_each_valid_pfn
> -#define for_each_valid_pfn(pfn, start_pfn, end_pfn)			 \
> -	for ((pfn) = max_t(unsigned long, (start_pfn), ARCH_PFN_OFFSET); \
> -	     (pfn) < min_t(unsigned long, (end_pfn),			 \
> -			   ARCH_PFN_OFFSET + max_mapnr);		 \
> -	     (pfn)++)
> +#define for_each_valid_pfn(pfn, start_pfn, end_pfn)			       \
> +	for (pfn = max_t(unsigned long, start_pfn, ARCH_PFN_OFFSET);	\
> +	     pfn < min_t(unsigned long, end_pfn, ARCH_PFN_OFFSET + max_mapnr); \
> +			 pfn++)

And this one is probably a rebase artifact? 

With FLATMEM changes dropped
This-revision-also-reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

>  #endif /* for_each_valid_pfn */
>  #endif /* valid_pfn */
>  

-- 
Sincerely yours,
Mike.
