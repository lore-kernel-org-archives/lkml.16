Received: from out30-130.freemail.mail.aliyun.com (out30-130.freemail.mail.aliyun.com [115.124.30.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65BC14A3C
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 04:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751258877; cv=none; b=INSaaC/VOl6V8imIEFnjZ4+8E3bzoe49/PJ+snq29yv9fsftJditRFzFgzxf8nhr6+IYztkiYeEaheZ0khts1ullGgYwnyqFJxV/Z6pxYzE44fq/ol5+OGFyZwdp7v8cMNxZSf+FSk1tRHsamTFrK5xXb3jOIudLc9vZmadwHcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751258877; c=relaxed/simple;
	bh=nQilmbJTuBxgC16/Z8kgdRkHXoBD1LG9raHt/bxH9wo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iTu1r82tglVujx2nJqWNmMPWpYrp34gp5g2DGRzxDjh3+sq8MIBMZSrT4m4Zf13ENNnmlmmTUqT1D+fqI+JFTedELAaNZ7/yAKiJTrPjjcTOCcmVYV7sknuCPE0BrzqBtQkva5s/IZoUXvy5nvgPwmhxuANQ+LrnXNvBqOtDR40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=CLlczm4F; arc=none smtp.client-ip=115.124.30.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="CLlczm4F"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1751258866; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=WYD0HqxSrvUGTem+8mYuwxu0D2LEMCE4OO4THT1vKBI=;
	b=CLlczm4FUfhHmOOcP/7b8bsu0LeZ5PbKpa1hOUDKjOXCSRtczvA7CteEuN3SINfsMxd8UlgEipBEovrkMIPVw2IU+4hAdH57t3hVjaLCHIl5PgDN00DitQsnxs9brhsdz7EFKVx8qxyYGLITo2ETwNsKgNHIdFHttkQ/oq3A0PI=
Received: from 30.74.144.137(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0Wg3hrCB_1751258864 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 30 Jun 2025 12:47:44 +0800
Message-ID: <00b95366-aa42-4051-9457-04a009aedbb2@linux.alibaba.com>
Date: Mon, 30 Jun 2025 12:47:43 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] mm/shmem, swap: tidy up THP swapin checks
To: Kairui Song <kasong@tencent.com>, linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Hugh Dickins
 <hughd@google.com>, Matthew Wilcox <willy@infradead.org>,
 Kemeng Shi <shikemeng@huaweicloud.com>, Chris Li <chrisl@kernel.org>,
 Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>,
 Barry Song <baohua@kernel.org>, linux-kernel@vger.kernel.org
References: <20250627062020.534-1-ryncsn@gmail.com>
 <20250627062020.534-4-ryncsn@gmail.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20250627062020.534-4-ryncsn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/6/27 14:20, Kairui Song wrote:
> From: Kairui Song <kasong@tencent.com>
> 
> Move all THP swapin related checks under CONFIG_TRANSPARENT_HUGEPAGE,
> so they will be trimmed off by the compiler if not needed.
> 
> And add a WARN if shmem sees a order > 0 entry when
> CONFIG_TRANSPARENT_HUGEPAGE is disabled, that should never happen unless
> things went very wrong.
> 
> There should be no observable feature change except the new added WARN.
> 
> Signed-off-by: Kairui Song <kasong@tencent.com>

LGTM. Thanks.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>

> ---
>   mm/shmem.c | 42 ++++++++++++++++++++----------------------
>   1 file changed, 20 insertions(+), 22 deletions(-)
> 
> diff --git a/mm/shmem.c b/mm/shmem.c
> index 033dc7a3435d..f85a985167c5 100644
> --- a/mm/shmem.c
> +++ b/mm/shmem.c
> @@ -1980,26 +1980,39 @@ static struct folio *shmem_swap_alloc_folio(struct inode *inode,
>   		swp_entry_t entry, int order, gfp_t gfp)
>   {
>   	struct shmem_inode_info *info = SHMEM_I(inode);
> +	int nr_pages = 1 << order;
>   	struct folio *new;
>   	void *shadow;
> -	int nr_pages;
>   
>   	/*
>   	 * We have arrived here because our zones are constrained, so don't
>   	 * limit chance of success with further cpuset and node constraints.
>   	 */
>   	gfp &= ~GFP_CONSTRAINT_MASK;
> -	if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) && order > 0) {
> -		gfp_t huge_gfp = vma_thp_gfp_mask(vma);
> -
> -		gfp = limit_gfp_mask(huge_gfp, gfp);
> +	if (!IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE)) {
> +		if (WARN_ON_ONCE(order))
> +			return ERR_PTR(-EINVAL);
> +	} else if (order) {
> +		/*
> +		 * If uffd is active for the vma, we need per-page fault
> +		 * fidelity to maintain the uffd semantics, then fallback
> +		 * to swapin order-0 folio, as well as for zswap case.
> +		 * Any existing sub folio in the swap cache also blocks
> +		 * mTHP swapin.
> +		 */
> +		if ((vma && unlikely(userfaultfd_armed(vma))) ||
> +		     !zswap_never_enabled() ||
> +		     non_swapcache_batch(entry, nr_pages) != nr_pages) {
> +			return ERR_PTR(-EINVAL);
> +		} else {
> +			gfp = limit_gfp_mask(vma_thp_gfp_mask(vma), gfp);
> +		}
>   	}
>   
>   	new = shmem_alloc_folio(gfp, order, info, index);
>   	if (!new)
>   		return ERR_PTR(-ENOMEM);
>   
> -	nr_pages = folio_nr_pages(new);
>   	if (mem_cgroup_swapin_charge_folio(new, vma ? vma->vm_mm : NULL,
>   					   gfp, entry)) {
>   		folio_put(new);
> @@ -2283,9 +2296,6 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
>   	/* Look it up and read it in.. */
>   	folio = swap_cache_get_folio(swap, NULL, 0);
>   	if (!folio) {
> -		int nr_pages = 1 << order;
> -		bool fallback_order0 = false;
> -
>   		/* Or update major stats only when swapin succeeds?? */
>   		if (fault_type) {
>   			*fault_type |= VM_FAULT_MAJOR;
> @@ -2293,20 +2303,8 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
>   			count_memcg_event_mm(fault_mm, PGMAJFAULT);
>   		}
>   
> -		/*
> -		 * If uffd is active for the vma, we need per-page fault
> -		 * fidelity to maintain the uffd semantics, then fallback
> -		 * to swapin order-0 folio, as well as for zswap case.
> -		 * Any existing sub folio in the swap cache also blocks
> -		 * mTHP swapin.
> -		 */
> -		if (order > 0 && ((vma && unlikely(userfaultfd_armed(vma))) ||
> -				  !zswap_never_enabled() ||
> -				  non_swapcache_batch(swap, nr_pages) != nr_pages))
> -			fallback_order0 = true;
> -
>   		/* Skip swapcache for synchronous device. */
> -		if (!fallback_order0 && data_race(si->flags & SWP_SYNCHRONOUS_IO)) {
> +		if (data_race(si->flags & SWP_SYNCHRONOUS_IO)) {
>   			folio = shmem_swap_alloc_folio(inode, vma, index, swap, order, gfp);
>   			if (!IS_ERR(folio)) {
>   				skip_swapcache = true;

