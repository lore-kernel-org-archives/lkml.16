Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 171E421859A
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 06:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746514405; cv=none; b=I6btirv6O2iSh4Dy8YW/3djnCNeahRODkpknzLuhepBr/frw2vVqkob6Cx8Bpf+SbGY1cRily30pJwgaf0of8Zwnovn/pTx6316eiev/BOcI7agOTHFt3BaqB2AQaKLcgN4XJR43JTz0DEWfJY/Kg26rdn5OSSdPbWPtg/6Rfgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746514405; c=relaxed/simple;
	bh=smoE9s0WPWHiKdf6v9Unxh8gv8VHmRkOVDxWsTdek+I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sNNl1WaCDD/YarYfvrZFRE3416vD2K5zLBsEWYRtSJpEKdhNfUvViDD9Jh9o9v1P4fmMZsFFfGZ0C+R62VqDkIyTHK9WLWufH0AmtGr1NxpMTu7cvDPgzqbnbIWjnS47339reJT4vDJvOtjwAMkvUEjf0UhRcEBEg8oZZM+Z6q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4D7F1113E;
	Mon,  5 May 2025 23:53:11 -0700 (PDT)
Received: from [10.163.54.208] (unknown [10.163.54.208])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E0D653F673;
	Mon,  5 May 2025 23:53:13 -0700 (PDT)
Message-ID: <64a0c678-ead9-4620-b69b-e631d6e540f9@arm.com>
Date: Tue, 6 May 2025 12:23:07 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] mm: Add CONFIG_PAGE_BLOCK_ORDER to select page block
 order
To: Juan Yescas <jyescas@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc: tjmercier@google.com, isaacmanjarres@google.com, surenb@google.com,
 kaleshsingh@google.com, Vlastimil Babka <vbabka@suse.cz>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 David Hildenbrand <david@redhat.com>, Mike Rapoport <rppt@kernel.org>,
 Minchan Kim <minchan@kernel.org>
References: <20250506002319.513795-1-jyescas@google.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250506002319.513795-1-jyescas@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/6/25 05:52, Juan Yescas wrote:
> Problem: On large page size configurations (16KiB, 64KiB), the CMA
> alignment requirement (CMA_MIN_ALIGNMENT_BYTES) increases considerably,
> and this causes the CMA reservations to be larger than necessary.
> This means that system will have less available MIGRATE_UNMOVABLE and
> MIGRATE_RECLAIMABLE page blocks since MIGRATE_CMA can't fallback to them.
> 
> The CMA_MIN_ALIGNMENT_BYTES increases because it depends on
> MAX_PAGE_ORDER which depends on ARCH_FORCE_MAX_ORDER. The value of
> ARCH_FORCE_MAX_ORDER increases on 16k and 64k kernels.
> 
> For example, in ARM, the CMA alignment requirement when:
> 
> - CONFIG_ARCH_FORCE_MAX_ORDER default value is used
> - CONFIG_TRANSPARENT_HUGEPAGE is set:
> 
> PAGE_SIZE | MAX_PAGE_ORDER | pageblock_order | CMA_MIN_ALIGNMENT_BYTES
> -----------------------------------------------------------------------
>    4KiB   |      10        |      10         |  4KiB * (2 ^ 10)  =  4MiB
>   16Kib   |      11        |      11         | 16KiB * (2 ^ 11) =  32MiB
>   64KiB   |      13        |      13         | 64KiB * (2 ^ 13) = 512MiB
> 
> There are some extreme cases for the CMA alignment requirement when:
> 
> - CONFIG_ARCH_FORCE_MAX_ORDER maximum value is set
> - CONFIG_TRANSPARENT_HUGEPAGE is NOT set:
> - CONFIG_HUGETLB_PAGE is NOT set
> 
> PAGE_SIZE | MAX_PAGE_ORDER | pageblock_order |  CMA_MIN_ALIGNMENT_BYTES
> ------------------------------------------------------------------------
>    4KiB   |      15        |      15         |  4KiB * (2 ^ 15) = 128MiB
>   16Kib   |      13        |      13         | 16KiB * (2 ^ 13) = 128MiB
>   64KiB   |      13        |      13         | 64KiB * (2 ^ 13) = 512MiB
> 
> This affects the CMA reservations for the drivers. If a driver in a
> 4KiB kernel needs 4MiB of CMA memory, in a 16KiB kernel, the minimal
> reservation has to be 32MiB due to the alignment requirements:
> 
> reserved-memory {
>     ...
>     cma_test_reserve: cma_test_reserve {
>         compatible = "shared-dma-pool";
>         size = <0x0 0x400000>; /* 4 MiB */
>         ...
>     };
> };
> 
> reserved-memory {
>     ...
>     cma_test_reserve: cma_test_reserve {
>         compatible = "shared-dma-pool";
>         size = <0x0 0x2000000>; /* 32 MiB */
>         ...
>     };
> };

This indeed is a valid problem which reduces available memory for
non-CMA page blocks on system required for general memory usage.

> 
> Solution: Add a new config CONFIG_PAGE_BLOCK_ORDER that
> allows to set the page block order in all the architectures.
> The maximum page block order will be given by
> ARCH_FORCE_MAX_ORDER.
> 
> By default, CONFIG_PAGE_BLOCK_ORDER will have the same
> value that ARCH_FORCE_MAX_ORDER. This will make sure that
> current kernel configurations won't be affected by this
> change. It is a opt-in change.

Right.

> 
> This patch will allow to have the same CMA alignment
> requirements for large page sizes (16KiB, 64KiB) as that
> in 4kb kernels by setting a lower pageblock_order.
> 
> Tests:
> 
> - Verified that HugeTLB pages work when pageblock_order is 1, 7, 10
> on 4k and 16k kernels.
> 
> - Verified that Transparent Huge Pages work when pageblock_order
> is 1, 7, 10 on 4k and 16k kernels.
> 
> - Verified that dma-buf heaps allocations work when pageblock_order
> is 1, 7, 10 on 4k and 16k kernels.

pageblock_order are choosen as 1, 7 and 10 to cover the entire possible
range for ARCH_FORCE_MAX_ORDER. Although kernel CI should test this for
all values in the range. Because this now opens up different ranges for
different platforms which were never tested earlier.

> 
> Benchmarks:
> 
> The benchmarks compare 16kb kernels with pageblock_order 10 and 7. The
> reason for the pageblock_order 7 is because this value makes the min
> CMA alignment requirement the same as that in 4kb kernels (2MB).
> 
> - Perform 100K dma-buf heaps (/dev/dma_heap/system) allocations of
> SZ_8M, SZ_4M, SZ_2M, SZ_1M, SZ_64, SZ_8, SZ_4. Use simpleperf
> (https://developer.android.com/ndk/guides/simpleperf) to measure
> the # of instructions and page-faults on 16k kernels.
> The benchmark was executed 10 times. The averages are below:
> 
>            # instructions         |     #page-faults
>     order 10     |  order 7       | order 10 | order 7
> --------------------------------------------------------
>  13,891,765,770	 | 11,425,777,314 |    220   |   217
>  14,456,293,487	 | 12,660,819,302 |    224   |   219
>  13,924,261,018	 | 13,243,970,736 |    217   |   221
>  13,910,886,504	 | 13,845,519,630 |    217   |   221
>  14,388,071,190	 | 13,498,583,098 |    223   |   224
>  13,656,442,167	 | 12,915,831,681 |    216   |   218
>  13,300,268,343	 | 12,930,484,776 |    222   |   218
>  13,625,470,223	 | 14,234,092,777 |    219   |   218
>  13,508,964,965	 | 13,432,689,094 |    225   |   219
>  13,368,950,667	 | 13,683,587,37  |    219   |   225
> -------------------------------------------------------------------
>  13,803,137,433  | 13,131,974,268 |    220   |   220    Averages
> 
> There were 4.85% #instructions when order was 7, in comparison
> with order 10.
> 
>      13,803,137,433 - 13,131,974,268 = -671,163,166 (-4.86%)
> 
> The number of page faults in order 7 and 10 were the same.
> 
> These results didn't show any significant regression when the
> pageblock_order is set to 7 on 16kb kernels.
> 
> - Run speedometer 3.1 (https://browserbench.org/Speedometer3.1/) 5 times
>  on the 16k kernels with pageblock_order 7 and 10.
> 
> order 10 | order 7  | order 7 - order 10 | (order 7 - order 10) %
> -------------------------------------------------------------------
>   15.8	 |  16.4    |         0.6        |     3.80%
>   16.4	 |  16.2    |        -0.2        |    -1.22%
>   16.6	 |  16.3    |        -0.3        |    -1.81%
>   16.8	 |  16.3    |        -0.5        |    -2.98%
>   16.6	 |  16.8    |         0.2        |     1.20%
> -------------------------------------------------------------------
>   16.44     16.4            -0.04	          -0.24%   Averages
> 
> The results didn't show any significant regression when the
> pageblock_order is set to 7 on 16kb kernels.
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: Liam R. Howlett <Liam.Howlett@oracle.com>
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: David Hildenbrand <david@redhat.com>
> CC: Mike Rapoport <rppt@kernel.org>
> Cc: Zi Yan <ziy@nvidia.com>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Minchan Kim <minchan@kernel.org>
> Signed-off-by: Juan Yescas <jyescas@google.com>
> Acked-by: Zi Yan <ziy@nvidia.com>
> ---
> Changes in v3:
>   - Rename ARCH_FORCE_PAGE_BLOCK_ORDER to PAGE_BLOCK_ORDER
>     as per Matthew's suggestion.
>   - Update comments in pageblock-flags.h for pageblock_order
>     value when THP or HugeTLB are not used.
> 
> Changes in v2:
>   - Add Zi's Acked-by tag.
>   - Move ARCH_FORCE_PAGE_BLOCK_ORDER config to mm/Kconfig as
>     per Zi and Matthew suggestion so it is available to
>     all the architectures.
>   - Set ARCH_FORCE_PAGE_BLOCK_ORDER to 10 by default when
>     ARCH_FORCE_MAX_ORDER is not available.
> 
> 
> 
> 
>  include/linux/pageblock-flags.h | 14 ++++++++++----
>  mm/Kconfig                      | 31 +++++++++++++++++++++++++++++++
>  2 files changed, 41 insertions(+), 4 deletions(-)
> 
> diff --git a/include/linux/pageblock-flags.h b/include/linux/pageblock-flags.h
> index fc6b9c87cb0a..0c4963339f0b 100644
> --- a/include/linux/pageblock-flags.h
> +++ b/include/linux/pageblock-flags.h
> @@ -28,6 +28,12 @@ enum pageblock_bits {
>  	NR_PAGEBLOCK_BITS
>  };
>  
> +#if defined(CONFIG_PAGE_BLOCK_ORDER)
> +#define PAGE_BLOCK_ORDER CONFIG_PAGE_BLOCK_ORDER
> +#else
> +#define PAGE_BLOCK_ORDER MAX_PAGE_ORDER
> +#endif /* CONFIG_PAGE_BLOCK_ORDER */
> +
>  #if defined(CONFIG_HUGETLB_PAGE)
>  
>  #ifdef CONFIG_HUGETLB_PAGE_SIZE_VARIABLE
> @@ -41,18 +47,18 @@ extern unsigned int pageblock_order;
>   * Huge pages are a constant size, but don't exceed the maximum allocation
>   * granularity.
>   */
> -#define pageblock_order		MIN_T(unsigned int, HUGETLB_PAGE_ORDER, MAX_PAGE_ORDER)
> +#define pageblock_order		MIN_T(unsigned int, HUGETLB_PAGE_ORDER, PAGE_BLOCK_ORDER)
>  
>  #endif /* CONFIG_HUGETLB_PAGE_SIZE_VARIABLE */
>  
>  #elif defined(CONFIG_TRANSPARENT_HUGEPAGE)
>  
> -#define pageblock_order		MIN_T(unsigned int, HPAGE_PMD_ORDER, MAX_PAGE_ORDER)
> +#define pageblock_order		MIN_T(unsigned int, HPAGE_PMD_ORDER, PAGE_BLOCK_ORDER)
>  
>  #else /* CONFIG_TRANSPARENT_HUGEPAGE */
>  
> -/* If huge pages are not used, group by MAX_ORDER_NR_PAGES */
> -#define pageblock_order		MAX_PAGE_ORDER
> +/* If huge pages are not used, group by PAGE_BLOCK_ORDER */
> +#define pageblock_order		PAGE_BLOCK_ORDER
>  
>  #endif /* CONFIG_HUGETLB_PAGE */
>  

These all look good.

> diff --git a/mm/Kconfig b/mm/Kconfig
> index e113f713b493..c52be3489aa3 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -989,6 +989,37 @@ config CMA_AREAS
>  
>  	  If unsure, leave the default value "8" in UMA and "20" in NUMA.
>  
> +#
> +# Select this config option from the architecture Kconfig, if available, to set
> +# the max page order for physically contiguous allocations.
> +#
> +config ARCH_FORCE_MAX_ORDER
> +	int

ARCH_FORCE_MAX_ORDER needs to be defined here first before PAGE_BLOCK_ORDER
could use that subsequently.But ARCH_FORCE_MAX_ORDER is defined in various
architectures in 'int' or 'int "<description>"' formats. So could there be
a problem for this config to be defined both in generic and platform code ?
But clearly ARCH_FORCE_MAX_ORDER still remains a arch specific config.

#git grep "config ARCH_FORCE_MAX_ORDER"
arch/arc/Kconfig:config ARCH_FORCE_MAX_ORDER
arch/arm/Kconfig:config ARCH_FORCE_MAX_ORDER
arch/arm64/Kconfig:config ARCH_FORCE_MAX_ORDER
arch/loongarch/Kconfig:config ARCH_FORCE_MAX_ORDER
arch/m68k/Kconfig.cpu:config ARCH_FORCE_MAX_ORDER
arch/mips/Kconfig:config ARCH_FORCE_MAX_ORDER
arch/nios2/Kconfig:config ARCH_FORCE_MAX_ORDER
arch/powerpc/Kconfig:config ARCH_FORCE_MAX_ORDER
arch/sh/mm/Kconfig:config ARCH_FORCE_MAX_ORDER
arch/sparc/Kconfig:config ARCH_FORCE_MAX_ORDER
arch/xtensa/Kconfig:config ARCH_FORCE_MAX_ORDER
mm/Kconfig:config ARCH_FORCE_MAX_ORDER

arch/arc/

config ARCH_FORCE_MAX_ORDER
        int "Maximum zone order"

arch/arm/

config ARCH_FORCE_MAX_ORDER
        int "Order of maximal physically contiguous allocations"

arch/arm64/

config ARCH_FORCE_MAX_ORDER
        int
...........

arch/sparc/

config ARCH_FORCE_MAX_ORDER
        int "Order of maximal physically contiguous allocations"

> +
> +# When ARCH_FORCE_MAX_ORDER is not defined, the default page block order is 10,

Just wondering - why the default is 10 ?

> +# as per include/linux/mmzone.h.
> +config PAGE_BLOCK_ORDER
> +	int "Page Block Order"
> +	range 1 10 if !ARCH_FORCE_MAX_ORDER

Also why the range is restricted to 10 ?

> +	default 10 if !ARCH_FORCE_MAX_ORDER
> +	range 1 ARCH_FORCE_MAX_ORDER if ARCH_FORCE_MAX_ORDER
> +	default ARCH_FORCE_MAX_ORDER if ARCH_FORCE_MAX_ORDER

We still have the MAX_PAGE_ORDER which maps into ARCH_FORCE_MAX_ORDER
when available or otherwise just falls back as 10.

/* Free memory management - zoned buddy allocator.  */
#ifndef CONFIG_ARCH_FORCE_MAX_ORDER
#define MAX_PAGE_ORDER 10
#else
#define MAX_PAGE_ORDER CONFIG_ARCH_FORCE_MAX_ORDER
#endif

Hence could PAGE_BLOCK_ORDER config description block be simplified as

config PAGE_BLOCK_ORDER
	int "Page Block Order"
	range 1 MAX_PAGE_ORDER
	default MAX_PAGE_ORDER

As MAX_PAGE_ORDER could switch between ARCH_FORCE_MAX_ORDER and 10 as
and when required.

> +
> +	help
> +	  The page block order refers to the power of two number of pages that
> +	  are physically contiguous and can have a migrate type associated to
> +	  them. The maximum size of the page block order is limited by
> +	  ARCH_FORCE_MAX_ORDER.

s/ARCH_FORCE_MAX_ORDER/ARCH_FORCE_MAX_ORDER when available on the platform/ ?

Also mention about max range when ARCH_FORCE_MAX_ORDER is not available.

> +
> +	  This option allows overriding the default setting when the page
> +	  block order requires to be smaller than ARCH_FORCE_MAX_ORDER.
> +
> +	  Reducing pageblock order can negatively impact THP generation
> +	  successful rate. If your workloads uses THP heavily, please use this
> +	  option with caution.

Just wondering - could there be any other side effects besides THP ? Will it
be better to depend on CONFIG_EXPERT while selecting anything other than the
default option i.e ARCH_FORCE_MAX_ORDER or 10 from the value range.

> +
> +	  Don't change if unsure.
> +
>  config MEM_SOFT_DIRTY
>  	bool "Track memory changes"
>  	depends on CHECKPOINT_RESTORE && HAVE_ARCH_SOFT_DIRTY && PROC_FS
