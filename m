Received: from out30-110.freemail.mail.aliyun.com (out30-110.freemail.mail.aliyun.com [115.124.30.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466D12557C
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 06:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744785156; cv=none; b=bDkyuyB+/YO9o7Y2uNXPyXyxdNmnLaYu3oeqn361U/vXYWnuyenc7EAy91GIAspdkhjV1ghj+91/mhlUpxdNgixRwnrP5UAtbeZxB7vtW9Wyosg4g/i8GmhBZA+BnCFSEoQL9fM+wVZMhjVyeapFoWcTsFKCf8Dqq1vyOihUi70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744785156; c=relaxed/simple;
	bh=C+YlPii4h2q66bDUAaOLPXTEyxIIrlkZRkSTT6uvWLE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hy+FHrGBsDkOqTolE9dBV5s7g+biP5eUu9+CnVLRCtZZbBel0RAldg8zWgQkmzABFbUF05886bWp9hrfHzmjUluaOvqX5evn41F6sypamYH2rrShBCCnBScAkLrB1LrP8wY0IHWJ64HS5yZ4FU8jtCBEBoBXMZBtMAakmg6uVdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=h2GVUFUS; arc=none smtp.client-ip=115.124.30.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="h2GVUFUS"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1744785149; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=iuviVh9BV5zcVo9BVHDs26PBd6MDMyyyghZwUMJKQ90=;
	b=h2GVUFUSevwU49syUUqCvpRw+ovroQy9XD01EkMhxUAJarcaFIynm4KlWWuBpg6/b5qTQLleB9scD/AKZZJAwLrQWqxtk6XYgBHBBeMGojBmvl74cQ9apCsb+ONhpFqvjOCiw5gOSn5mR2+rrI4X2vpeWpaO7RsSVpvoef1Z7Tg=
Received: from 30.74.144.124(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WX7uX4._1744785147 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 16 Apr 2025 14:32:28 +0800
Message-ID: <7f96283b-11b3-49ee-9d2d-5ad977325cb0@linux.alibaba.com>
Date: Wed, 16 Apr 2025 14:32:27 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] mempolicy: Optimize queue_folios_pte_range by PTE
 batching
To: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org
Cc: ryan.roberts@arm.com, david@redhat.com, willy@infradead.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, hughd@google.com,
 vishal.moola@gmail.com, yang@os.amperecomputing.com, ziy@nvidia.com
References: <20250416053048.96479-1-dev.jain@arm.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20250416053048.96479-1-dev.jain@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/4/16 13:30, Dev Jain wrote:
> After the check for queue_folio_required(), the code only cares about the
> folio in the for loop, i.e the PTEs are redundant. Therefore, optimize
> this loop by skipping over a PTE batch mapping the same folio.
> 
> With a test program migrating pages of the calling process, which includes
> a mapped VMA of size 4GB with pte-mapped large folios of order-9, and
> migrating once back and forth node-0 and node-1, the average execution
> time reduces from 7.5 to 4 seconds, giving an approx 47% speedup.
> 
> v2->v3:
>   - Don't use assignment in if condition
> 
> v1->v2:
>   - Follow reverse xmas tree declarations
>   - Don't initialize nr
>   - Move folio_pte_batch() immediately after retrieving a normal folio
>   - increment nr_failed in one shot
> 
> Acked-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
>   mm/mempolicy.c | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/mempolicy.c b/mm/mempolicy.c
> index b28a1e6ae096..4d2dc8b63965 100644
> --- a/mm/mempolicy.c
> +++ b/mm/mempolicy.c
> @@ -566,6 +566,7 @@ static void queue_folios_pmd(pmd_t *pmd, struct mm_walk *walk)
>   static int queue_folios_pte_range(pmd_t *pmd, unsigned long addr,
>   			unsigned long end, struct mm_walk *walk)
>   {
> +	const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>   	struct vm_area_struct *vma = walk->vma;
>   	struct folio *folio;
>   	struct queue_pages *qp = walk->private;
> @@ -573,6 +574,7 @@ static int queue_folios_pte_range(pmd_t *pmd, unsigned long addr,
>   	pte_t *pte, *mapped_pte;
>   	pte_t ptent;
>   	spinlock_t *ptl;
> +	int max_nr, nr;
>   
>   	ptl = pmd_trans_huge_lock(pmd, vma);
>   	if (ptl) {
> @@ -586,7 +588,9 @@ static int queue_folios_pte_range(pmd_t *pmd, unsigned long addr,
>   		walk->action = ACTION_AGAIN;
>   		return 0;
>   	}
> -	for (; addr != end; pte++, addr += PAGE_SIZE) {
> +	for (; addr != end; pte += nr, addr += nr * PAGE_SIZE) {
> +		max_nr = (end - addr) >> PAGE_SHIFT;
> +		nr = 1;
>   		ptent = ptep_get(pte);
>   		if (pte_none(ptent))
>   			continue;
> @@ -598,6 +602,10 @@ static int queue_folios_pte_range(pmd_t *pmd, unsigned long addr,
>   		folio = vm_normal_folio(vma, addr, ptent);
>   		if (!folio || folio_is_zone_device(folio))
>   			continue;
> +		if (folio_test_large(folio) && max_nr != 1)
> +			nr = folio_pte_batch(folio, addr, pte, ptent,
> +					     max_nr, fpb_flags,
> +					     NULL, NULL, NULL);
>   		/*
>   		 * vm_normal_folio() filters out zero pages, but there might
>   		 * still be reserved folios to skip, perhaps in a VDSO.
> @@ -630,7 +638,7 @@ static int queue_folios_pte_range(pmd_t *pmd, unsigned long addr,
>   		if (!(flags & (MPOL_MF_MOVE | MPOL_MF_MOVE_ALL)) ||
>   		    !vma_migratable(vma) ||
>   		    !migrate_folio_add(folio, qp->pagelist, flags)) {
> -			qp->nr_failed++;
> +			qp->nr_failed += nr;

Sorry for chiming in late, but I am not convinced that 'qp->nr_failed' 
should add 'nr' when isolation fails.

 From the comments of queue_pages_range():
"
* >0 - this number of misplaced folios could not be queued for moving
  *      (a hugetlbfs page or a transparent huge page being counted as 1).
"

That means if a large folio is failed to isolate, we should only add '1' 
for qp->nr_failed instead of the number of pages in this large folio. Right?
