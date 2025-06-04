Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC03617548
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 04:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749011830; cv=none; b=j1PgGnUULP2Pfqd3lGdEmycZDhJuXcH46PaqGmlntxcR8BxoYgSHCHS5WIl58PxgUV5F2258E5yl9IVSotZzqXErV21VxIc2T1unUBms9wpmU4/J/dd8xD7aNAqheDa+h1APPfS6BUalT/JM9FKvJzZTOjhsicpwE8WAJKwpi5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749011830; c=relaxed/simple;
	bh=ixNUukO6d1iFGOjZM8/9VZ08LhFuGbVaEeq28aUcrG0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YpOU2WH3iKUntlWdZ9K/LVxY/vAWFW79WUje6wgS14BnDfNNKaYriMPWlPAS/wCkogxMIZQsoIRDW7EyqaIb5sraCcn2LWkhldybWgWwSLzoFV6a00RWYzh2eXqOHPr3Ud6Ovn2uaxL3xQdcMlEQ4ez373pCvQWdibQ+fVR91yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DD46E1758;
	Tue,  3 Jun 2025 21:36:49 -0700 (PDT)
Received: from [10.163.60.247] (unknown [10.163.60.247])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E011D3F673;
	Tue,  3 Jun 2025 21:36:59 -0700 (PDT)
Message-ID: <d6f18e51-47a4-498c-ad66-60fa2d8efbfc@arm.com>
Date: Wed, 4 Jun 2025 10:06:54 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: rename CONFIG_PAGE_BLOCK_ORDER to
 CONFIG_PAGE_BLOCK_ORDER_CEIL.
To: Zi Yan <ziy@nvidia.com>, david@redhat.com
Cc: Liam.Howlett@oracle.com, akpm@linux-foundation.org,
 isaacmanjarres@google.com, jyescas@google.com, kaleshsingh@google.com,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 lorenzo.stoakes@oracle.com, masahiroy@kernel.org, mhocko@suse.com,
 minchan@kernel.org, rppt@kernel.org, surenb@google.com,
 tjmercier@google.com, vbabka@suse.cz
References: <20250603154843.1565239-1-ziy@nvidia.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250603154843.1565239-1-ziy@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/3/25 21:18, Zi Yan wrote:
> The config is in fact an additional upper limit of pageblock_order, so
> rename it to avoid confusion.

Agreed. This new config has been similar to existing 'pageblock_order'
that might cause confusion. Hence renaming makes sense. But instead of
PAGE_BLOCK_ORDER_CEIL should it be rather PAGE_BLOCK_ORDER_MAX ?

> 
> Fixes: e13e7922d034 ("mm: add CONFIG_PAGE_BLOCK_ORDER to select page block order")

Does it really need a "Fixes: " tag given there is no problem to fix ?

> Signed-off-by: Zi Yan <ziy@nvidia.com>
> ---
>  include/linux/mmzone.h          | 14 +++++++-------
>  include/linux/pageblock-flags.h |  8 ++++----
>  mm/Kconfig                      | 15 ++++++++-------
>  3 files changed, 19 insertions(+), 18 deletions(-)
> 
> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> index 283913d42d7b..523b407e63e8 100644
> --- a/include/linux/mmzone.h
> +++ b/include/linux/mmzone.h
> @@ -38,19 +38,19 @@
>  #define NR_PAGE_ORDERS (MAX_PAGE_ORDER + 1)
>  
>  /* Defines the order for the number of pages that have a migrate type. */
> -#ifndef CONFIG_PAGE_BLOCK_ORDER
> -#define PAGE_BLOCK_ORDER MAX_PAGE_ORDER
> +#ifndef CONFIG_PAGE_BLOCK_ORDER_CEIL
> +#define PAGE_BLOCK_ORDER_CEIL MAX_PAGE_ORDER
>  #else
> -#define PAGE_BLOCK_ORDER CONFIG_PAGE_BLOCK_ORDER
> -#endif /* CONFIG_PAGE_BLOCK_ORDER */
> +#define PAGE_BLOCK_ORDER_CEIL CONFIG_PAGE_BLOCK_ORDER_CEIL
> +#endif /* CONFIG_PAGE_BLOCK_ORDER_CEIL */
>  
>  /*
>   * The MAX_PAGE_ORDER, which defines the max order of pages to be allocated
> - * by the buddy allocator, has to be larger or equal to the PAGE_BLOCK_ORDER,
> + * by the buddy allocator, has to be larger or equal to the PAGE_BLOCK_ORDER_CEIL,
>   * which defines the order for the number of pages that can have a migrate type
>   */
> -#if (PAGE_BLOCK_ORDER > MAX_PAGE_ORDER)
> -#error MAX_PAGE_ORDER must be >= PAGE_BLOCK_ORDER
> +#if (PAGE_BLOCK_ORDER_CEIL > MAX_PAGE_ORDER)
> +#error MAX_PAGE_ORDER must be >= PAGE_BLOCK_ORDER_CEIL
>  #endif
>  
>  /*
> diff --git a/include/linux/pageblock-flags.h b/include/linux/pageblock-flags.h
> index e73a4292ef02..e7a86cd238c2 100644
> --- a/include/linux/pageblock-flags.h
> +++ b/include/linux/pageblock-flags.h
> @@ -41,18 +41,18 @@ extern unsigned int pageblock_order;
>   * Huge pages are a constant size, but don't exceed the maximum allocation
>   * granularity.
>   */
> -#define pageblock_order		MIN_T(unsigned int, HUGETLB_PAGE_ORDER, PAGE_BLOCK_ORDER)
> +#define pageblock_order		MIN_T(unsigned int, HUGETLB_PAGE_ORDER, PAGE_BLOCK_ORDER_CEIL)
>  
>  #endif /* CONFIG_HUGETLB_PAGE_SIZE_VARIABLE */
>  
>  #elif defined(CONFIG_TRANSPARENT_HUGEPAGE)
>  
> -#define pageblock_order		MIN_T(unsigned int, HPAGE_PMD_ORDER, PAGE_BLOCK_ORDER)
> +#define pageblock_order		MIN_T(unsigned int, HPAGE_PMD_ORDER, PAGE_BLOCK_ORDER_CEIL)
>  
>  #else /* CONFIG_TRANSPARENT_HUGEPAGE */
>  
> -/* If huge pages are not used, group by PAGE_BLOCK_ORDER */
> -#define pageblock_order		PAGE_BLOCK_ORDER
> +/* If huge pages are not used, group by PAGE_BLOCK_ORDER_CEIL */
> +#define pageblock_order		PAGE_BLOCK_ORDER_CEIL
>  
>  #endif /* CONFIG_HUGETLB_PAGE */
>  
> diff --git a/mm/Kconfig b/mm/Kconfig
> index eccb2e46ffcb..3b27e644bd1f 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -1017,8 +1017,8 @@ config ARCH_FORCE_MAX_ORDER
>  # the default page block order is MAX_PAGE_ORDER (10) as per
>  # include/linux/mmzone.h.
>  #
> -config PAGE_BLOCK_ORDER
> -	int "Page Block Order"
> +config PAGE_BLOCK_ORDER_CEIL
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
>  	  success rate. If your workloads uses THP heavily, please use this
