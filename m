Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D1CC2C324C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 02:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749091408; cv=none; b=hsZ2EFBYsFHF6ZhNVW18BukF2kHxytTsYgyxDFUC0Wbtqq78vnrrGL/t3zy9i4yMH7daGzuDxFsnVZdy857wt4wkdv8QEG2H6n1Pi8QsdK1lrFWpikmC8YOjmRPWiOYGY18saxEaS/s/YI08+5izne7evvdCjHozgH9lWNt2ip4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749091408; c=relaxed/simple;
	bh=e9M/V5FLRor05pEbmP2mKuGexiaBIlZ+dMakGu7Iilo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DauUP7e6cdRF6SaCw9zSQ2wjCG+0TnNt3/2dUs5z0TE6bdDnvF0GVJqe3G4wZWVQr/eimrU7A9bkModQ8DH50dmxfVpkrvNNzdEDOh7Ooej24KXPlvHr56hOUw7L+NdMsDougyw3GGhrvgLGTTk9vkzad+TWZC1loSaqpYob0wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3DC66169C;
	Wed,  4 Jun 2025 19:43:07 -0700 (PDT)
Received: from [10.164.18.47] (a077893.blr.arm.com [10.164.18.47])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 561843F673;
	Wed,  4 Jun 2025 19:43:19 -0700 (PDT)
Message-ID: <cfcb7239-4404-4e71-8fda-7fd3656a8975@arm.com>
Date: Thu, 5 Jun 2025 08:13:16 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mm: rename CONFIG_PAGE_BLOCK_ORDER to
 CONFIG_PAGE_BLOCK_MAX_ORDER.
To: Zi Yan <ziy@nvidia.com>, david@redhat.com
Cc: Liam.Howlett@oracle.com, akpm@linux-foundation.org,
 isaacmanjarres@google.com, jyescas@google.com, kaleshsingh@google.com,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 lorenzo.stoakes@oracle.com, masahiroy@kernel.org, mhocko@suse.com,
 minchan@kernel.org, rppt@kernel.org, surenb@google.com,
 tjmercier@google.com, vbabka@suse.cz, Oscar Salvador <osalvador@suse.de>
References: <20250604211427.1590859-1-ziy@nvidia.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250604211427.1590859-1-ziy@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/5/25 02:44, Zi Yan wrote:
> The config is in fact an additional upper limit of pageblock_order, so
> rename it to avoid confusion.
> 
> Signed-off-by: Zi Yan <ziy@nvidia.com>
> Acked-by: David Hildenbrand <david@redhat.com>
> Reviewed-by: Oscar Salvador <osalvador@suse.de>
> Acked-by: Juan Yescas <jyescas@google.com>

LGTM.

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

> ---
>>From v1[1]:
> 1. used a new name: PAGE_BLOCK_MAX_ORDER,
> 2. added the missing PAGE_BLOCK_ORDER rename in mm/mm_init.c[2]
> 3. dropped the Fixes tag.
> 
> [1] https://lore.kernel.org/linux-mm/20250603154843.1565239-1-ziy@nvidia.com/
> [2] https://lore.kernel.org/linux-mm/202506042058.XgvABCE0-lkp@intel.com/
> 
>  include/linux/mmzone.h          | 14 +++++++-------
>  include/linux/pageblock-flags.h |  8 ++++----
>  mm/Kconfig                      | 15 ++++++++-------
>  mm/mm_init.c                    |  2 +-
>  4 files changed, 20 insertions(+), 19 deletions(-)
> 
> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> index 283913d42d7b..5bec8b1d0e66 100644
> --- a/include/linux/mmzone.h
> +++ b/include/linux/mmzone.h
> @@ -38,19 +38,19 @@
>  #define NR_PAGE_ORDERS (MAX_PAGE_ORDER + 1)
>  
>  /* Defines the order for the number of pages that have a migrate type. */
> -#ifndef CONFIG_PAGE_BLOCK_ORDER
> -#define PAGE_BLOCK_ORDER MAX_PAGE_ORDER
> +#ifndef CONFIG_PAGE_BLOCK_MAX_ORDER
> +#define PAGE_BLOCK_MAX_ORDER MAX_PAGE_ORDER
>  #else
> -#define PAGE_BLOCK_ORDER CONFIG_PAGE_BLOCK_ORDER
> -#endif /* CONFIG_PAGE_BLOCK_ORDER */
> +#define PAGE_BLOCK_MAX_ORDER CONFIG_PAGE_BLOCK_MAX_ORDER
> +#endif /* CONFIG_PAGE_BLOCK_MAX_ORDER */
>  
>  /*
>   * The MAX_PAGE_ORDER, which defines the max order of pages to be allocated
> - * by the buddy allocator, has to be larger or equal to the PAGE_BLOCK_ORDER,
> + * by the buddy allocator, has to be larger or equal to the PAGE_BLOCK_MAX_ORDER,
>   * which defines the order for the number of pages that can have a migrate type
>   */
> -#if (PAGE_BLOCK_ORDER > MAX_PAGE_ORDER)
> -#error MAX_PAGE_ORDER must be >= PAGE_BLOCK_ORDER
> +#if (PAGE_BLOCK_MAX_ORDER > MAX_PAGE_ORDER)
> +#error MAX_PAGE_ORDER must be >= PAGE_BLOCK_MAX_ORDER
>  #endif
>  
>  /*
> diff --git a/include/linux/pageblock-flags.h b/include/linux/pageblock-flags.h
> index e73a4292ef02..6297c6343c55 100644
> --- a/include/linux/pageblock-flags.h
> +++ b/include/linux/pageblock-flags.h
> @@ -41,18 +41,18 @@ extern unsigned int pageblock_order;
>   * Huge pages are a constant size, but don't exceed the maximum allocation
>   * granularity.
>   */
> -#define pageblock_order		MIN_T(unsigned int, HUGETLB_PAGE_ORDER, PAGE_BLOCK_ORDER)
> +#define pageblock_order		MIN_T(unsigned int, HUGETLB_PAGE_ORDER, PAGE_BLOCK_MAX_ORDER)
>  
>  #endif /* CONFIG_HUGETLB_PAGE_SIZE_VARIABLE */
>  
>  #elif defined(CONFIG_TRANSPARENT_HUGEPAGE)
>  
> -#define pageblock_order		MIN_T(unsigned int, HPAGE_PMD_ORDER, PAGE_BLOCK_ORDER)
> +#define pageblock_order		MIN_T(unsigned int, HPAGE_PMD_ORDER, PAGE_BLOCK_MAX_ORDER)
>  
>  #else /* CONFIG_TRANSPARENT_HUGEPAGE */
>  
> -/* If huge pages are not used, group by PAGE_BLOCK_ORDER */
> -#define pageblock_order		PAGE_BLOCK_ORDER
> +/* If huge pages are not used, group by PAGE_BLOCK_MAX_ORDER */
> +#define pageblock_order		PAGE_BLOCK_MAX_ORDER
>  
>  #endif /* CONFIG_HUGETLB_PAGE */
>  
> diff --git a/mm/Kconfig b/mm/Kconfig
> index 65089552e124..3afac26d3594 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -1017,8 +1017,8 @@ config ARCH_FORCE_MAX_ORDER
>  # the default page block order is MAX_PAGE_ORDER (10) as per
>  # include/linux/mmzone.h.
>  #
> -config PAGE_BLOCK_ORDER
> -	int "Page Block Order"
> +config PAGE_BLOCK_MAX_ORDER
> +	int "Page Block Order Upper Limit"
>  	range 1 10 if ARCH_FORCE_MAX_ORDER = 0
>  	default 10 if ARCH_FORCE_MAX_ORDER = 0
>  	range 1 ARCH_FORCE_MAX_ORDER if ARCH_FORCE_MAX_ORDER != 0
> @@ -1026,12 +1026,13 @@ config PAGE_BLOCK_ORDER
>  	help
>  	  The page block order refers to the power of two number of pages that
>  	  are physically contiguous and can have a migrate type associated to
> -	  them. The maximum size of the page block order is limited by
> -	  ARCH_FORCE_MAX_ORDER.
> +	  them. The maximum size of the page block order is at least limited by
> +	  ARCH_FORCE_MAX_ORDER/MAX_PAGE_ORDER.
>  
> -	  This config allows overriding the default page block order when the
> -	  page block order is required to be smaller than ARCH_FORCE_MAX_ORDER
> -	  or MAX_PAGE_ORDER.
> +	  This config adds a new upper limit of default page block
> +	  order when the page block order is required to be smaller than
> +	  ARCH_FORCE_MAX_ORDER/MAX_PAGE_ORDER or other limits
> +	  (see include/linux/pageblock-flags.h for details).
>  
>  	  Reducing pageblock order can negatively impact THP generation
>  	  success rate. If your workloads use THP heavily, please use this
> diff --git a/mm/mm_init.c b/mm/mm_init.c
> index f2944748f526..02f41e2bdf60 100644
> --- a/mm/mm_init.c
> +++ b/mm/mm_init.c
> @@ -1509,7 +1509,7 @@ static inline void setup_usemap(struct zone *zone) {}
>  /* Initialise the number of pages represented by NR_PAGEBLOCK_BITS */
>  void __init set_pageblock_order(void)
>  {
> -	unsigned int order = PAGE_BLOCK_ORDER;
> +	unsigned int order = PAGE_BLOCK_MAX_ORDER;
>  
>  	/* Check that pageblock_nr_pages has not already been setup */
>  	if (pageblock_order)
