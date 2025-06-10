Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888902B9BF
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 17:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749575445; cv=none; b=KGzpikBcdmpB1lQTkFzPqTu3ZbnFaNfPIFBjVMpii3VXYiA9dFFTfCi32fvlxQRX+fMNsCU5veR7vp/ik1j/zTb8tx7JG2I0g55oOpaJROM+3n6Nd7ux+EkBW1KMrIujThFcjZNeZuxEE6I6H6po5DUtSIHzIvwe7L4ur2IsN6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749575445; c=relaxed/simple;
	bh=py6jniNMzTUYmUO82pAk2qf353/Z3RpnVBAa4tdaVkI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jfhYlV3f553eDoDz+I/haJ8xIQF9MjA7QSaCpSfVznbFcJsfpHulBQIv0OMgoy3n+I583s9fzeT6qEuySjkcv1cyI+7L76FIf6WHv6PB+87mAHaX/dLaHExybZxTojXdHBCV/CfWYxG+e0h1VOe9Y0YHOAlAFrqc/TPE6ZOQ/w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 554CDC4CEED;
	Tue, 10 Jun 2025 17:10:43 +0000 (UTC)
Date: Tue, 10 Jun 2025 18:10:40 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Feng Tang <feng.tang@linux.alibaba.com>
Cc: Will Deacon <will@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Yang Shi <yang@os.amperecomputing.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Baruch Siach <baruch@tkos.co.il>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH RFC] arm64/mm: Lift the cma address limit when
 CONFIG_DMA_NUMA_CMA=y
Message-ID: <aEhnELJQLw8S8Bho@arm.com>
References: <20250521014701.73046-1-feng.tang@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250521014701.73046-1-feng.tang@linux.alibaba.com>

On Wed, May 21, 2025 at 09:47:01AM +0800, Feng Tang wrote:
> When porting an cma related usage from x86_64 server to arm64 server,
> the "cma=4G" setup failed on arm64, and the reason is arm64 has 4G (32bit)
> address limit for cma reservation.
> 
> The limit is reasonable due to device DMA requirement, but for NUMA
> servers which have CONFIG_DMA_NUMA_CMA enabled, the limit is not required
> as that config already allows cma area to be reserved on different NUMA
> nodes whose memory very likely goes beyond 4G limit.
> 
> Lift the cma limit for platform with such configuration.

I don't think that's the right fix. Those devices that have a NUMA node
associated may be ok to address memory beyond 4GB. The default for
NUMA_NO_NODE devices is still dma_contiguous_default_area. I also don't
like to make such run-time decisions on the config option.

That said, maybe we should make the under-4G CMA allocation a best
effort. In the arch code, if that failed, attempt the allocation again
with a limit of 0 and maybe do a pr_notice() that CMA allocation in the
DMA zone failed.

Adding Robin in case he has a different view.

> Signed-off-by: Feng Tang <feng.tang@linux.alibaba.com>
> ---
>  arch/arm64/mm/init.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> index b99bf3980fc6..661758678cc4 100644
> --- a/arch/arm64/mm/init.c
> +++ b/arch/arm64/mm/init.c
> @@ -312,6 +312,7 @@ void __init arm64_memblock_init(void)
>  void __init bootmem_init(void)
>  {
>  	unsigned long min, max;
> +	phys_addr_t cma_limit;
>  
>  	min = PFN_UP(memblock_start_of_DRAM());
>  	max = PFN_DOWN(memblock_end_of_DRAM());
> @@ -343,8 +344,14 @@ void __init bootmem_init(void)
>  
>  	/*
>  	 * Reserve the CMA area after arm64_dma_phys_limit was initialised.
> +	 *
> +	 * When CONFIG_DMA_NUMA_CMA is enabled, system may have CMA reserved
> +	 * area in different NUMA nodes, which likely goes beyond the 32bit
> +	 * limit, thus use (PHYS_MASK+1) as cma limit.
>  	 */
> -	dma_contiguous_reserve(arm64_dma_phys_limit);
> +	cma_limit = IS_ENABLED(CONFIG_DMA_NUMA_CMA) ?
> +			(PHYS_MASK + 1) : arm64_dma_phys_limit;
> +	dma_contiguous_reserve(cma_limit);
>  
>  	/*
>  	 * request_standard_resources() depends on crashkernel's memory being
> -- 
> 2.39.5 (Apple Git-154)
