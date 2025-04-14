Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E8328BAA0
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 18:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744655190; cv=none; b=ig93rotUCpyUFA7hO+wuNEOo5pGdXmsF//PJENA0UqInKBIr6Z5JynBRdFq1vF67qO2pvTexdAb4c6crDzQS/UR3d0z6usE1WnmvuIbXJ0KPF9KgeUc2H76WsnSDW6YYO3lDAi9ysmCZDf2ow5sZLXNcV5SXHomyaiPkG/DaqcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744655190; c=relaxed/simple;
	bh=HnkXJtCVRnEMCUvFPYUEs1QXruXr66jUiiB53dxXg2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XaufEi2mCN0XQNZbpVMI4rUkizivo6svZl+My2YK2t1Fr4aevIIq3rq5VWwNBRnw8O/8x5nY6XKJ3EzoRmnd8pJZ3PvcFDm1D9GS/JkPcpOmZykqcL0CslOw9a88DkXGrS2dzFvDAoBn1F+dCbR7ZCzk5UDTJkBLE/o9iHKam+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C99oKZFn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C99oKZFn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B301C4CEE5;
	Mon, 14 Apr 2025 18:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744655189;
	bh=HnkXJtCVRnEMCUvFPYUEs1QXruXr66jUiiB53dxXg2k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C99oKZFnAmk6EpD3d+eJG6j6VEQhoRZcBdR9M8m9Sonv/jk6L6VnFM1G4GijnBhw5
	 GDMYS8r5C/69G2iEUsBGQzzTRfazw0EyMNM61CE/6NOJQ+xK69/mhhRMI3DU+L4lw2
	 iu+DRcKJ3yKwp/X9ebL0Lv2r0td7ay1wn6y5BEORsQEccRG0xlv8D5WM86ZAu5aXJY
	 apAod0QPdN1LyFUdy7lQLquvXSQ1d4u82F2fV/BBWVrv7t8KWGFuvfkRBItpIyVwYg
	 5ofMbO63hk9jK3Pn0ktLGa2nPYEhOW0brUCUirG+B9DP0PpomVOm0AJ44TkU4TvluN
	 gVPFrxe+oa7LQ==
Date: Mon, 14 Apr 2025 23:47:19 +0530
From: Naveen N Rao <naveen@kernel.org>
To: Dan Williams <dan.j.williams@intel.com>
Cc: dave.hansen@linux.intel.com, Ingo Molnar <mingo@kernel.org>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] x86/devmem: Remove duplicate range_is_allowed()
 definition
Message-ID: <s6fek3k3zsgf74yuppzckhcnud67pgfitz66n6uwkky7gvjcpc@rp4pxvie2dpb>
References: <174433453526.924142.15494575917593543330.stgit@dwillia2-xfh.jf.intel.com>
 <174433454327.924142.13014632539194148381.stgit@dwillia2-xfh.jf.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174433454327.924142.13014632539194148381.stgit@dwillia2-xfh.jf.intel.com>

On Thu, Apr 10, 2025 at 06:22:23PM -0700, Dan Williams wrote:
> It looks like x86 has a local re-implementation of range_is_allowed()
> just to add a pat_enabled() check for the strong symbol override of
> phys_mem_access_prot_allowed() from drivers/char/mem.c.
> 
> In preparation for updating range_is_allowed() logic, arrange for there
> to be only one shared instance of "range_is_allowed()" in the kernel by
> moving a common helper to include/linux/io.h.
> 
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: Ingo Molnar <mingo@kernel.org>
> Signed-off-by: Dan Williams <dan.j.williams@intel.com>
> ---
>  arch/x86/mm/pat/memtype.c |   31 ++++---------------------------
>  drivers/char/mem.c        |   18 ------------------
>  include/linux/io.h        |   21 +++++++++++++++++++++
>  3 files changed, 25 insertions(+), 45 deletions(-)
> 
> diff --git a/arch/x86/mm/pat/memtype.c b/arch/x86/mm/pat/memtype.c
> index 72d8cbc61158..c97b6598f187 100644
> --- a/arch/x86/mm/pat/memtype.c
> +++ b/arch/x86/mm/pat/memtype.c
> @@ -38,6 +38,7 @@
>  #include <linux/kernel.h>
>  #include <linux/pfn_t.h>
>  #include <linux/slab.h>
> +#include <linux/io.h>
>  #include <linux/mm.h>
>  #include <linux/highmem.h>
>  #include <linux/fs.h>
> @@ -773,38 +774,14 @@ pgprot_t phys_mem_access_prot(struct file *file, unsigned long pfn,
>  	return vma_prot;
>  }
>  
> -#ifdef CONFIG_STRICT_DEVMEM
> -/* This check is done in drivers/char/mem.c in case of STRICT_DEVMEM */
> -static inline int range_is_allowed(unsigned long pfn, unsigned long size)
> -{
> -	return 1;
> -}

It looks like no checks were done here if CONFIG_STRICT_DEVMEM was set, 
so this patch changes that.

> -#else
> -/* This check is needed to avoid cache aliasing when PAT is enabled */
> -static inline int range_is_allowed(unsigned long pfn, unsigned long size)
> -{
> -	u64 from = ((u64)pfn) << PAGE_SHIFT;
> -	u64 to = from + size;
> -	u64 cursor = from;
> -
> -	if (!pat_enabled())
> -		return 1;
> -
> -	while (cursor < to) {
> -		if (!devmem_is_allowed(pfn))
> -			return 0;
> -		cursor += PAGE_SIZE;
> -		pfn++;
> -	}
> -	return 1;
> -}
> -#endif /* CONFIG_STRICT_DEVMEM */
> -
>  int phys_mem_access_prot_allowed(struct file *file, unsigned long pfn,
>  				unsigned long size, pgprot_t *vma_prot)
>  {
>  	enum page_cache_mode pcm = _PAGE_CACHE_MODE_WB;
>  
> +	if (!pat_enabled())
> +		return 1;
> +

Shouldn't this test for pat_enabled() (perhaps only if 
CONFIG_STRICT_DEVMEM is set) and continue with the rest of the function 
otherwise?


- Naveen

>  	if (!range_is_allowed(pfn, size))
>  		return 0;
>  
> diff --git a/drivers/char/mem.c b/drivers/char/mem.c
> index 169eed162a7f..48839958b0b1 100644
> --- a/drivers/char/mem.c
> +++ b/drivers/char/mem.c
> @@ -61,29 +61,11 @@ static inline int page_is_allowed(unsigned long pfn)
>  {
>  	return devmem_is_allowed(pfn);
>  }
> -static inline int range_is_allowed(unsigned long pfn, unsigned long size)
> -{
> -	u64 from = ((u64)pfn) << PAGE_SHIFT;
> -	u64 to = from + size;
> -	u64 cursor = from;
> -
> -	while (cursor < to) {
> -		if (!devmem_is_allowed(pfn))
> -			return 0;
> -		cursor += PAGE_SIZE;
> -		pfn++;
> -	}
> -	return 1;
> -}
>  #else
>  static inline int page_is_allowed(unsigned long pfn)
>  {
>  	return 1;
>  }
> -static inline int range_is_allowed(unsigned long pfn, unsigned long size)
> -{
> -	return 1;
> -}
>  #endif
>  
>  static inline bool should_stop_iteration(void)
> diff --git a/include/linux/io.h b/include/linux/io.h
> index 6a6bc4d46d0a..0642c7ee41db 100644
> --- a/include/linux/io.h
> +++ b/include/linux/io.h
> @@ -183,4 +183,25 @@ static inline void arch_io_free_memtype_wc(resource_size_t base,
>  int devm_arch_io_reserve_memtype_wc(struct device *dev, resource_size_t start,
>  				    resource_size_t size);
>  
> +#ifdef CONFIG_STRICT_DEVMEM
> +static inline int range_is_allowed(unsigned long pfn, unsigned long size)
> +{
> +	u64 from = ((u64)pfn) << PAGE_SHIFT;
> +	u64 to = from + size;
> +	u64 cursor = from;
> +
> +	while (cursor < to) {
> +		if (!devmem_is_allowed(pfn))
> +			return 0;
> +		cursor += PAGE_SIZE;
> +		pfn++;
> +	}
> +	return 1;
> +}
> +#else
> +static inline int range_is_allowed(unsigned long pfn, unsigned long size)
> +{
> +	return 1;
> +}
> +#endif
>  #endif /* _LINUX_IO_H */
> 
