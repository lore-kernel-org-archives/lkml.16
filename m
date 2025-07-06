Received: from out30-98.freemail.mail.aliyun.com (out30-98.freemail.mail.aliyun.com [115.124.30.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D638329A5
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 03:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751772946; cv=none; b=Flz5MyfKe00WrOgR4DyvAcDdOWZUdsrSiaD22FaD2zfp+rBqFzfYNXKS4ETseVBnsBxkd/GUeWI7JUBuSRD8AR5weW1x1DfkleCb76/i/HuUGuquAz0yboGrKqe7TQSqil0t+XGNpup2bzVbX3+OnHX2i2Ftvt6gVKPNmJQoTXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751772946; c=relaxed/simple;
	bh=XUEjV1+nQgo6kAcZ42o2onvzE1dkFgMP0aI/wjt4TDc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tI58UWYfTax4MfI7yYqfkWT/VdW2X53uJ6gfKZq5Q90K2ND0nrhpCUbIM7Yn8rbRyJUt9AEqMJ4KO0gi7/P2vUEOEC9dDMXiFKCAEyLEOICUcoVHZArtv+ACLFbVzDuznrri9WPxA1p8llK65KqA3eOZPwEI+COlvb1tUSzycLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=QogZX6tE; arc=none smtp.client-ip=115.124.30.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="QogZX6tE"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1751772934; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=ry7sk0Q8RX4Rog7LIxYwem8OESuZgL7xJk2VRGHdz4U=;
	b=QogZX6tEHoTaRXiTSrtQIwECHQxs2a3tiGduP7B4H/AonyXXd7UoB1P9Fs9pEXHK/0iXxabnpMXoDf7126Dl2uBocoSvGCOOmQde+7uJgxs8mEeQ/Ly/jF/eLo4Sds/BaYxpe2idWVbYgDtQvviAmr9TMDmQuJK+4zQQ+9Tnwrw=
Received: from 30.134.69.216(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WhjEL7l_1751772931 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sun, 06 Jul 2025 11:35:32 +0800
Message-ID: <452cad4b-e0c7-4792-9272-69199fa52a55@linux.alibaba.com>
Date: Sun, 6 Jul 2025 11:35:30 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/9] mm/shmem, swap: tidy up swap entry splitting
To: Kairui Song <kasong@tencent.com>, linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Hugh Dickins
 <hughd@google.com>, Matthew Wilcox <willy@infradead.org>,
 Kemeng Shi <shikemeng@huaweicloud.com>, Chris Li <chrisl@kernel.org>,
 Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>,
 Barry Song <baohua@kernel.org>, linux-kernel@vger.kernel.org
References: <20250704181748.63181-1-ryncsn@gmail.com>
 <20250704181748.63181-5-ryncsn@gmail.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20250704181748.63181-5-ryncsn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/7/5 02:17, Kairui Song wrote:
> From: Kairui Song <kasong@tencent.com>
> 
> Instead of keeping different paths of splitting the entry before the
> swap in start, move the entry splitting after the swapin has put
> the folio in swap cache (or set the SWAP_HAS_CACHE bit). This way
> we only need one place and one unified way to split the large entry.
> Whenever swapin brought in a folio smaller than the shmem swap entry,
> split the entry and recalculate the entry and index for verification.
> 
> This removes duplicated codes and function calls, reduces LOC,
> and the split is less racy as it's guarded by swap cache now. So it
> will have a lower chance of repeated faults due to raced split.
> The compiler is also able to optimize the coder further:
> 
> bloat-o-meter results with GCC 14:
> 
> With DEBUG_SECTION_MISMATCH (-fno-inline-functions-called-once):
> ./scripts/bloat-o-meter mm/shmem.o.old mm/shmem.o
> add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-82 (-82)
> Function                                     old     new   delta
> shmem_swapin_folio                          2361    2279     -82
> Total: Before=33151, After=33069, chg -0.25%
> 
> With !DEBUG_SECTION_MISMATCH:
> ./scripts/bloat-o-meter mm/shmem.o.old mm/shmem.o
> add/remove: 0/1 grow/shrink: 1/0 up/down: 949/-750 (199)
> Function                                     old     new   delta
> shmem_swapin_folio                          2878    3827    +949
> shmem_split_large_entry.isra                 750       -    -750
> Total: Before=33086, After=33285, chg +0.60%
> 
> Since shmem_split_large_entry is only called in one place now. The
> compiler will either generate more compact code, or inlined it for
> better performance.
> 
> Signed-off-by: Kairui Song <kasong@tencent.com>
> ---
>   mm/shmem.c | 53 +++++++++++++++++++++--------------------------------
>   1 file changed, 21 insertions(+), 32 deletions(-)
> 
> diff --git a/mm/shmem.c b/mm/shmem.c
> index e43becfa04b3..217264315842 100644
> --- a/mm/shmem.c
> +++ b/mm/shmem.c
> @@ -2266,14 +2266,15 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
>   	struct address_space *mapping = inode->i_mapping;
>   	struct mm_struct *fault_mm = vma ? vma->vm_mm : NULL;
>   	struct shmem_inode_info *info = SHMEM_I(inode);
> +	swp_entry_t swap, index_entry;
>   	struct swap_info_struct *si;
>   	struct folio *folio = NULL;
>   	bool skip_swapcache = false;
> -	swp_entry_t swap;
>   	int error, nr_pages, order, split_order;
> +	pgoff_t offset;
>   
>   	VM_BUG_ON(!*foliop || !xa_is_value(*foliop));
> -	swap = radix_to_swp_entry(*foliop);
> +	swap = index_entry = radix_to_swp_entry(*foliop);
>   	*foliop = NULL;
>   
>   	if (is_poisoned_swp_entry(swap))
> @@ -2321,46 +2322,35 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
>   		}
>   
>   		/*
> -		 * Now swap device can only swap in order 0 folio, then we
> -		 * should split the large swap entry stored in the pagecache
> -		 * if necessary.
> -		 */
> -		split_order = shmem_split_large_entry(inode, index, swap, gfp);
> -		if (split_order < 0) {
> -			error = split_order;
> -			goto failed;
> -		}
> -
> -		/*
> -		 * If the large swap entry has already been split, it is
> +		 * Now swap device can only swap in order 0 folio, it is
>   		 * necessary to recalculate the new swap entry based on
> -		 * the old order alignment.
> +		 * the offset, as the swapin index might be unalgined.
>   		 */
> -		if (split_order > 0) {
> -			pgoff_t offset = index - round_down(index, 1 << split_order);
> -
> +		if (order) {
> +			offset = index - round_down(index, 1 << order);
>   			swap = swp_entry(swp_type(swap), swp_offset(swap) + offset);
>   		}
>   
> -		/* Here we actually start the io */
>   		folio = shmem_swapin_cluster(swap, gfp, info, index);
>   		if (!folio) {
>   			error = -ENOMEM;
>   			goto failed;
>   		}
> -	} else if (order > folio_order(folio)) {
> +	}
> +alloced:
> +	if (order > folio_order(folio)) {
>   		/*
> -		 * Swap readahead may swap in order 0 folios into swapcache
> +		 * Swapin may get smaller folios due to various reasons:
> +		 * It may fallback to order 0 due to memory pressure or race,
> +		 * swap readahead may swap in order 0 folios into swapcache
>   		 * asynchronously, while the shmem mapping can still stores
>   		 * large swap entries. In such cases, we should split the
>   		 * large swap entry to prevent possible data corruption.
>   		 */
> -		split_order = shmem_split_large_entry(inode, index, swap, gfp);
> +		split_order = shmem_split_large_entry(inode, index, index_entry, gfp);
>   		if (split_order < 0) {
> -			folio_put(folio);
> -			folio = NULL;
>   			error = split_order;
> -			goto failed;
> +			goto failed_nolock;
>   		}
>   
>   		/*
> @@ -2369,15 +2359,13 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
>   		 * the old order alignment.
>   		 */
>   		if (split_order > 0) {
> -			pgoff_t offset = index - round_down(index, 1 << split_order);
> -
> +			offset = index - round_down(index, 1 << split_order);
>   			swap = swp_entry(swp_type(swap), swp_offset(swap) + offset);

Obviously, you should use the original swap value 'index_entry' to 
calculate the new swap value.

With the following fix, you can add:
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Tested-by: Baolin Wang <baolin.wang@linux.alibaba.com>

diff --git a/mm/shmem.c b/mm/shmem.c
index d530df550f7f..1e8422ac863e 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -2361,7 +2361,7 @@ static int shmem_swapin_folio(struct inode *inode, 
pgoff_t index,
                  */
                 if (split_order > 0) {
                         offset = index - round_down(index, 1 << 
split_order);
-                       swap = swp_entry(swp_type(swap), 
swp_offset(swap) + offset);
+                       swap = swp_entry(swp_type(swap), 
swp_offset(index_swap) + offset);
                 }
         } else if (order < folio_order(folio)) {
                 swap.val = round_down(swap.val, 1 << folio_order(folio));

