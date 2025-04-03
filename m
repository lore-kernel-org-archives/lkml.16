Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2AB31957E4
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 06:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743661192; cv=none; b=e7t7m28QeJ55UtRv54dUpuaOtypVFqqw1G3wMLVCKZYs3GVmB8Fz8D2rZYytk0HxZBEsbA9Qdwc6c7A7/WFbUMwh9vIQd1SzjjQ9J/LXueoVbOstCRmulwP198QwIUnhRGfMvjhyf+JMBaghIdId4u5U20W9jRg5vDafxafzL8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743661192; c=relaxed/simple;
	bh=IVd8UGsu5sV0jxUV5ZTr4vtRlKqOWafEpnx5MIWbO3s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QaDJN1gGk54ULD0JaESXkIZZtY01uxeUFc2GbPMwu5jmWOJAWGrcPfqG/LjfZJXLt2ATn/QkXYf4f5TALzAmBmXGPuGnHxU94w8k3v4i+YnC8/6TOM65MR/j38/lGROtm9wzNNcmlt2NBQMPjcoKXYMKH6V6CY2WOSreh/of8Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kekjkokw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kekjkokw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9218C4CEE3;
	Thu,  3 Apr 2025 06:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743661191;
	bh=IVd8UGsu5sV0jxUV5ZTr4vtRlKqOWafEpnx5MIWbO3s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KekjkokwWTfjRow/NzSJ1BwYsusDXfqJsoeMmHiG480Y8LjGYy2xbtX61/d+jYFo0
	 ya8vgFt32OgC+FwXz9kFye9oILceBeNwoQiIH9SOoCg4yPYbatDWUx6LFTZMhESzQs
	 ZHBz3gh2NEK4nQtkmNnkc7F0kWbEitreUEVRM4N7L9ymOjafn5ulUJapDMUA+8D+Hx
	 tVXkc+RI5kyYKqnaNMJaJuGymZdNG3IvvFSodU7r8gaFI2pzZMlRUA5rgwcRAlxcE0
	 rc2OyW+HMEHtqx3e2bl7ZRB7uAly4C1XcI76oeqveJO3pTpwR1SHWqxMOcGpMNeTuZ
	 OwZvspfkAEtZg==
Date: Thu, 3 Apr 2025 09:19:43 +0300
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
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [RFC PATCH 2/3] mm: Implement for_each_valid_pfn() for
 CONFIG_FLATMEM
Message-ID: <Z-4of2VHLpZ4Uj4q@kernel.org>
References: <Z-vn-sMtNfwyJ9VW@kernel.org>
 <20250402201841.3245371-1-dwmw2@infradead.org>
 <20250402201841.3245371-2-dwmw2@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250402201841.3245371-2-dwmw2@infradead.org>

On Wed, Apr 02, 2025 at 09:18:40PM +0100, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> In the FLATMEM case, the default pfn_valid() just checks that the PFN is
> within the range [ ARCH_PFN_OFFSET .. ARCH_PFN_OFFSET + max_mapnr ).
> 
> The for_each_valid_pfn() function can therefore be a simple for() loop
> using those as min/max respectively.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
>  include/asm-generic/memory_model.h | 26 +++++++++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/include/asm-generic/memory_model.h b/include/asm-generic/memory_model.h
> index a3b5029aebbd..4fe7dd3bc09c 100644
> --- a/include/asm-generic/memory_model.h
> +++ b/include/asm-generic/memory_model.h
> @@ -30,7 +30,31 @@ static inline int pfn_valid(unsigned long pfn)
>  	return pfn >= pfn_offset && (pfn - pfn_offset) < max_mapnr;
>  }
>  #define pfn_valid pfn_valid
> -#endif
> +
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
> +#ifndef for_each_valid_pfn
> +#define for_each_valid_pfn(pfn, start_pfn, end_pfn)			       \
> +	for (pfn = max_t(unsigned long  start_pfn, ARCH_PFN_OFFSET);	       \
> +	     pfn < min_t(unsigned long, end_pfn, ARCH_PFN_OFFSET + max_mapnr); \
> +			 pfn++)
> +#endif /* for_each_valid_pfn */
> +#endif /* valid_pfn */
>  
>  #elif defined(CONFIG_SPARSEMEM_VMEMMAP)
>  
> -- 
> 2.49.0
> 

-- 
Sincerely yours,
Mike.
