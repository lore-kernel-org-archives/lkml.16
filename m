Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D0422539E
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 06:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744008872; cv=none; b=HU5/2iEIQeiyGg98uYa6+yEGNNQZvmujMEk5t82+zNgvXz0PaObSfeJoQJosN7JqTY51w1jAjGFHzR5J3cKOQU5P0ZaFb254FCmvRaPlY80Y+8jTz3MTbh4Lijyh/CpxY/gu8WPKRMUY27ymwhJBWCIvKSw2JM/+qxODCAtwBYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744008872; c=relaxed/simple;
	bh=LS5VAFFXIJwM/MSSY+05QkBo1gZOgTa9umjd9LQcztk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g+fTDbA81BigrcOD2vnl0PO3GnjVMEEAq68xpWzlZacL/3dnu16u/LCqynRRQtLQ4LMkWACyPXg5kpkGsUMBjpdB0ljFHwzqkmezU1fntcJBRSb0hr6WtryCsHQykPsIjIy0ghYgq9CbKOuPhuuStkWnz/0r2qvt5ZdvVzfGYGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xv+M4Mat; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xv+M4Mat"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 309CFC4CEDD;
	Mon,  7 Apr 2025 06:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744008872;
	bh=LS5VAFFXIJwM/MSSY+05QkBo1gZOgTa9umjd9LQcztk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xv+M4Mat5kHI/qdqSL1tzNzCIwVTRpJIvLTTz4+vqLSkmxjAYPJTnHqeeemP5FFEO
	 /dZE3YfGdn97xTFXNNgBFNxwviUiSYPYZnlvaEQmGGH7DlrA5GdDfwKyftkELYmjFK
	 RdqQl+fSbVkSlMb7CV/ZNZc8md4SZy7xEV7O5ncMWpfVIwUJPNZy1ybNdEDUWB0yyn
	 tz3/y8runsfEn4FmEgStx5g1Gt+Gl66+pxmnMx/Y1+bsx7VFAoeB+F57ypOQN8jlKq
	 D0KOIRo/zaQSAebLkPOEX1gShEGyMIoaPDF61zp9GF4QIvBzvuKboPdpSFoQK+S+w8
	 bnG2TkLxajhrw==
Date: Mon, 7 Apr 2025 09:54:23 +0300
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
Subject: Re: [RFC PATCH v2 2/7] mm: Implement for_each_valid_pfn() for
 CONFIG_FLATMEM
Message-ID: <Z_N2nyKYBOf2PoBz@kernel.org>
References: <20250404155959.3442111-1-dwmw2@infradead.org>
 <20250404155959.3442111-2-dwmw2@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404155959.3442111-2-dwmw2@infradead.org>

On Fri, Apr 04, 2025 at 04:59:54PM +0100, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> In the FLATMEM case, the default pfn_valid() just checks that the PFN is
> within the range [ ARCH_PFN_OFFSET .. ARCH_PFN_OFFSET + max_mapnr ).
> 
> The for_each_valid_pfn() function can therefore be a simple for() loop
> using those as min/max respectively.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>  include/asm-generic/memory_model.h | 26 +++++++++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/include/asm-generic/memory_model.h b/include/asm-generic/memory_model.h
> index a3b5029aebbd..044536da3390 100644
> --- a/include/asm-generic/memory_model.h
> +++ b/include/asm-generic/memory_model.h
> @@ -30,7 +30,31 @@ static inline int pfn_valid(unsigned long pfn)
>  	return pfn >= pfn_offset && (pfn - pfn_offset) < max_mapnr;
>  }
>  #define pfn_valid pfn_valid
> -#endif
> +
> +static inline bool first_valid_pfn(unsigned long *pfn)

This is now different from SPARSEMEM version. Do we need it at all?

> +{
> +	/* avoid <linux/mm.h> include hell */
>
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
> +	for (pfn = max_t(unsigned long, start_pfn, ARCH_PFN_OFFSET);	\
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
