Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D73B184E
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 07:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746775856; cv=none; b=J78ggnp47oDaSIRIEWBI9hAjYdSq8klLscoI2ivZXmWOmPMNyaCvzxj/5Zb1lqO9Vqc00YLhN/39NGgSD4OLkDF19Z6t7mqs3JeMRrrVhS8c/zcMbTsbnmS4HmuP0Ihv6YWJajRaKBnFt/KUGBIyK8ag2rRxrX1UNZIw3SdCoSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746775856; c=relaxed/simple;
	bh=oDQtD3vHvOkNsojPdYslmiWDj8VGE6SZ/nNd5XKmHJE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q7HYhIRbpWbHLsJo7rXk4T3CCyfkc6XQ5aUVNii620cfehG2w/P3hltRL8dpd1thSDvCUYtPTySUuhELEa7uUNgIVCc7EF1W7YIb3AX1tuSR1WGJ3i89p3Ux/GOr1t5zScGUoEmyiv2uYtdj/DPREiiENae8a/shXXgU/jSmCr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3A42C153B;
	Fri,  9 May 2025 00:30:41 -0700 (PDT)
Received: from [10.162.43.14] (K4MQJ0H1H2.blr.arm.com [10.162.43.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7C16B3F58B;
	Fri,  9 May 2025 00:30:49 -0700 (PDT)
Message-ID: <42ab3f69-82d3-475f-b38d-8e75b2819865@arm.com>
Date: Fri, 9 May 2025 13:00:46 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] mm: mincore: use pte_batch_bint() to batch process
 large folios
To: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org,
 david@redhat.com
Cc: 21cnbao@gmail.com, ryan.roberts@arm.com, ziy@nvidia.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <99cb00ee626ceb6e788102ca36821815cd832237.1746697240.git.baolin.wang@linux.alibaba.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <99cb00ee626ceb6e788102ca36821815cd832237.1746697240.git.baolin.wang@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 09/05/25 6:15 am, Baolin Wang wrote:
> When I tested the mincore() syscall, I observed that it takes longer with
> 64K mTHP enabled on my Arm64 server. The reason is the mincore_pte_range()
> still checks each PTE individually, even when the PTEs are contiguous,
> which is not efficient.
> 
> Thus we can use pte_batch_hint() to get the batch number of the present
> contiguous PTEs, which can improve the performance. I tested the mincore()
> syscall with 1G anonymous memory populated with 64K mTHP, and observed an
> obvious performance improvement:
> 
> w/o patch		w/ patch		changes
> 6022us			549us			+91%
> 
> Moreover, I also tested mincore() with disabling mTHP/THP, and did not
> see any obvious regression for base pages.
> 
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>

Nit: The subject line - s/pte_batch_bint()/pte_batch_hint()
Otherwise LGTM

Reviewed-by: Dev Jain <dev.jain@arm.com>

> ---
> Changes from v2:
> - Re-calculate the max_nr, per Barry.
> Changes from v1:
> - Change to use pte_batch_hint() to get the batch number, per Ryan.
> 
> Note: I observed the min_t() can introduce a slight performance regression
> for base pages, so I change to add a batch size check for base pages,
> which can resolve the performance regression issue.
> ---
>   mm/mincore.c | 22 +++++++++++++++++-----
>   1 file changed, 17 insertions(+), 5 deletions(-)
> 
> diff --git a/mm/mincore.c b/mm/mincore.c
> index 832f29f46767..42d6c9c8da86 100644
> --- a/mm/mincore.c
> +++ b/mm/mincore.c
> @@ -21,6 +21,7 @@
>   
>   #include <linux/uaccess.h>
>   #include "swap.h"
> +#include "internal.h"
>   
>   static int mincore_hugetlb(pte_t *pte, unsigned long hmask, unsigned long addr,
>   			unsigned long end, struct mm_walk *walk)
> @@ -105,6 +106,7 @@ static int mincore_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>   	pte_t *ptep;
>   	unsigned char *vec = walk->private;
>   	int nr = (end - addr) >> PAGE_SHIFT;
> +	int step, i;
>   
>   	ptl = pmd_trans_huge_lock(pmd, vma);
>   	if (ptl) {
> @@ -118,16 +120,26 @@ static int mincore_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>   		walk->action = ACTION_AGAIN;
>   		return 0;
>   	}
> -	for (; addr != end; ptep++, addr += PAGE_SIZE) {
> +	for (; addr != end; ptep += step, addr += step * PAGE_SIZE) {
>   		pte_t pte = ptep_get(ptep);
>   
> +		step = 1;
>   		/* We need to do cache lookup too for pte markers */
>   		if (pte_none_mostly(pte))
>   			__mincore_unmapped_range(addr, addr + PAGE_SIZE,
>   						 vma, vec);
> -		else if (pte_present(pte))
> -			*vec = 1;
> -		else { /* pte is a swap entry */
> +		else if (pte_present(pte)) {
> +			unsigned int batch = pte_batch_hint(ptep, pte);
> +
> +			if (batch > 1) {
> +				unsigned int max_nr = (end - addr) >> PAGE_SHIFT;
> +
> +				step = min_t(unsigned int, batch, max_nr);
> +			}
> +
> +			for (i = 0; i < step; i++)
> +				vec[i] = 1;
> +		} else { /* pte is a swap entry */
>   			swp_entry_t entry = pte_to_swp_entry(pte);
>   
>   			if (non_swap_entry(entry)) {
> @@ -146,7 +158,7 @@ static int mincore_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>   #endif
>   			}
>   		}
> -		vec++;
> +		vec += step;
>   	}
>   	pte_unmap_unlock(ptep - 1, ptl);
>   out:

