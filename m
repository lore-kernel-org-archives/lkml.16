Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BB3A1DED7C
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 05:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746594744; cv=none; b=c7frYDJfpa8N/0thbrjO3AV16TxVTQbD60PLDWechC8zXBPCCctaz2PZYeoxbXx7l1rN2sQ/kumUpQyJ4GdLXZRqd2Sm8UXBBl+ZYWM9kbZiS2LuWiqBAQHULqGJ5o2jZ58padidyi8BymKUHtgrzDJyCNK9Mmkh/IAtEwfs1wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746594744; c=relaxed/simple;
	bh=q5IU/nsPp9Xi9gKNHPIZzkjsy7rPZ35R3Awm/h0lvL0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qABVHf848HRdfhJCAlpQvP2cj12hQ0lTkan5e/08H1JpRnpKEcj7rkudf1O1fycsS04jimU+oYmNBAm+qgO09+LVmykqfg577USNkjm3+Fmf27BcBoSDDX91sbi+QI7AOmlh35eM5qZx9XTwSrJuK7H0zlIPoXhma4298RsZu7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 43BB02F;
	Tue,  6 May 2025 22:12:10 -0700 (PDT)
Received: from [10.162.43.22] (K4MQJ0H1H2.blr.arm.com [10.162.43.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F06333F673;
	Tue,  6 May 2025 22:12:16 -0700 (PDT)
Message-ID: <17289428-894a-4397-9d61-c8500d032b28@arm.com>
Date: Wed, 7 May 2025 10:42:14 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] mm: mincore: use folio_pte_batch() to batch process
 large folios
To: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org,
 hughd@google.com
Cc: willy@infradead.org, david@redhat.com, 21cnbao@gmail.com,
 ryan.roberts@arm.com, ziy@nvidia.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <cover.1742960003.git.baolin.wang@linux.alibaba.com>
 <7ad05bc9299de5d954fb21a2da57f46dd6ec59d0.1742960003.git.baolin.wang@linux.alibaba.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <7ad05bc9299de5d954fb21a2da57f46dd6ec59d0.1742960003.git.baolin.wang@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 26/03/25 9:08 am, Baolin Wang wrote:
> When I tested the mincore() syscall, I observed that it takes longer with
> 64K mTHP enabled on my Arm64 server. The reason is the mincore_pte_range()
> still checks each PTE individually, even when the PTEs are contiguous,
> which is not efficient.
> 
> Thus we can use folio_pte_batch() to get the batch number of the present
> contiguous PTEs, which can improve the performance. I tested the mincore()
> syscall with 1G anonymous memory populated with 64K mTHP, and observed an
> obvious performance improvement:
> 
> w/o patch		w/ patch		changes
> 6022us			1115us			+81%
> 
> Moreover, I also tested mincore() with disabling mTHP/THP, and did not
> see any obvious regression.
> 
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> ---
>   mm/mincore.c | 27 ++++++++++++++++++++++-----
>   1 file changed, 22 insertions(+), 5 deletions(-)
> 
> diff --git a/mm/mincore.c b/mm/mincore.c
> index 832f29f46767..88be180b5550 100644
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
> @@ -118,16 +120,31 @@ static int mincore_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
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
> +			if (pte_batch_hint(ptep, pte) > 1) {
> +				struct folio *folio = vm_normal_folio(vma, addr, pte);
> +
> +				if (folio && folio_test_large(folio)) {
> +					const fpb_t fpb_flags = FPB_IGNORE_DIRTY |
> +								FPB_IGNORE_SOFT_DIRTY;
> +					int max_nr = (end - addr) / PAGE_SIZE;
> +
> +					step = folio_pte_batch(folio, addr, ptep, pte,
> +							max_nr, fpb_flags, NULL, NULL, NULL);
> +				}
> +			}

Can we go ahead with this along with [1], that will help us generalize 
for all arches.

[1] https://lore.kernel.org/all/20250506050056.59250-3-dev.jain@arm.com/
(Please replace PAGE_SIZE with 1)

> +
> +			for (i = 0; i < step; i++)
> +				vec[i] = 1;
> +		} else { /* pte is a swap entry */
>   			swp_entry_t entry = pte_to_swp_entry(pte);
>   
>   			if (non_swap_entry(entry)) {
> @@ -146,7 +163,7 @@ static int mincore_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>   #endif
>   			}
>   		}
> -		vec++;
> +		vec += step;
>   	}
>   	pte_unmap_unlock(ptep - 1, ptl);
>   out:

