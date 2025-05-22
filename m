Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB0C28A402
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 14:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747924883; cv=none; b=PrHN1HqfHRrEzImrkJxvuF/s/6nRiCl9+ETZ3emJvEp7J4HRxqzfvHxL6lVpWf6r2H1doUndGiXGe3gDAFI/Q4kZ86pXyboM9c57mNVFzNceMGkMzupjhDQIqXuyw0anxynkWjI3GwPTmYvb3Ho7FyT//SLXyP8BiTePXyEbx2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747924883; c=relaxed/simple;
	bh=LnJBH0psXGw0RniJlUDxpQDv/cUgJQc6PAwHMTKYGfE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ok1P6yWTRJl5hWFAUA+589Mxb7g7giwsskQ793Bd6kxcK/9xB3X/l3JgDVWxX1NuLJOuuHL9bav/mnLoDK/WlmaHW4cNGubNZXDYgqfyJ9tdOgW4fwZTtIc08tFtWEdCdW7etMdSXIsTdpRos9tNPL5XhlfbAmOC4/WhxPbP4ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF73CC4CEEB;
	Thu, 22 May 2025 14:41:19 +0000 (UTC)
Date: Thu, 22 May 2025 15:41:17 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Dev Jain <dev.jain@arm.com>
Cc: will@kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, mark.rutland@arm.com,
	anshuman.khandual@arm.com, yang@os.amperecomputing.com,
	wangkefeng.wang@huawei.com, yangyicong@hisilicon.com,
	baohua@kernel.org, pjaroszynski@nvidia.com, ardb@kernel.org,
	david@redhat.com, Ryan Roberts <ryan.roberts@arm.com>
Subject: Re: [RFC PATCH] arm64: Elide dsb in kernel TLB invalidations
Message-ID: <aC83jRwPNGv0yWn_@arm.com>
References: <20250522114414.72322-1-dev.jain@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522114414.72322-1-dev.jain@arm.com>

On Thu, May 22, 2025 at 05:14:14PM +0530, Dev Jain wrote:
> dsb(ishst) is used to ensure that prior pagetable updates are completed.
> But, set_pmd/set_pud etc already issue a dsb-isb sequence for the exact
> same purpose. Therefore, we can elide the dsb in kernel tlb invalidation.
> 
> There were no issues observed while running mm selftests, including
> test_vmalloc.sh selftest to stress the vmalloc subsystem.
> 
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
>  arch/arm64/include/asm/tlbflush.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
> index eba1a98657f1..9b4adf1ee45e 100644
> --- a/arch/arm64/include/asm/tlbflush.h
> +++ b/arch/arm64/include/asm/tlbflush.h
> @@ -508,7 +508,7 @@ static inline void flush_tlb_kernel_range(unsigned long start, unsigned long end
>  		return;
>  	}
>  
> -	dsb(ishst);
> +	/* dsb(ishst) not needed as callers (set_pxd) have that */
>  	__flush_tlb_range_op(vaale1is, start, pages, stride, 0,
>  			     TLBI_TTL_UNKNOWN, false, lpa2_is_enabled());
>  	dsb(ish);
> @@ -523,7 +523,7 @@ static inline void __flush_tlb_kernel_pgtable(unsigned long kaddr)
>  {
>  	unsigned long addr = __TLBI_VADDR(kaddr, 0);
>  
> -	dsb(ishst);
> +	/* dsb(ishst) not needed as callers (set_pxd) have that */
>  	__tlbi(vaae1is, addr);
>  	dsb(ish);
>  	isb();

What about __set_pte()? We only issue (or rather queue) a barrier if we
set a valid kernel pte. I recall we added them for the case where a TLBI
won't happen, see commit 7f0b1bf04511 ("arm64: Fix barriers used for
page table modifications"). When we clear a PTE, we rely on the TLB
maintenance to issue barriers.

Maybe something that can be optimised following Ryan's reworking but I
don't think it is safe to remove them now, given that
__set_pte_complete() skips the barriers for invalid ptes. Possibly the
__flush_tlb_kernel_pgtable() is alright but not the
flush_tlb_kernel_range() one.

-- 
Catalin
