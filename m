Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154921362
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 02:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750214941; cv=none; b=XgeZqoEWUzUrMt51eJzH1HPcOtqShyFovKoL/aD5L1Z2m36Hu5zsauPcLo4bt1v/XsHvrmxYM8+HBUXo+JH1uGCfvjIZhJf+AisjmgudkrVwT6Y7uhKqrctP2DJp8m8o8TuQDPdXfdGWIo4p2L5IOc0YXNRCwhDVrO4ZOtKxstw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750214941; c=relaxed/simple;
	bh=LCaV8uVmDaMeQsQarCY+9XuCnWoy5tFpc5pppV8bPEI=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=lMbXXab9vrxq27Q89FN1Txnv/kO78EGB8Gfyjh34LwdpPoUjvJuzUARvHTGcDRxLDvIL1PhD/cwIZYTFX6kimFxTV0gjkGHuHRDskx8wOyN+6a+827AcJGfZEY3JZqGz/deqHkeK4+JVSRNGJs87Bacg93xdwjaDgbuur2k80Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.235])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4bMSqQ544FzYQtv9
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 10:48:50 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
	by mail.maildlp.com (Postfix) with ESMTP id A8B331A108B
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 10:48:49 +0800 (CST)
Received: from [10.174.99.169] (unknown [10.174.99.169])
	by APP2 (Coremail) with SMTP id Syh0CgDn8GMPKVJo3HrvPg--.13305S2;
	Wed, 18 Jun 2025 10:48:49 +0800 (CST)
Subject: Re: [PATCH 2/4] mm/shmem, swap: avoid redundant Xarray lookup during
 swapin
To: Kairui Song <kasong@tencent.com>, linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Hugh Dickins
 <hughd@google.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Matthew Wilcox <willy@infradead.org>, Chris Li <chrisl@kernel.org>,
 Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>,
 Barry Song <baohua@kernel.org>, linux-kernel@vger.kernel.org
References: <20250617183503.10527-1-ryncsn@gmail.com>
 <20250617183503.10527-3-ryncsn@gmail.com>
From: Kemeng Shi <shikemeng@huaweicloud.com>
Message-ID: <17bdc50c-1b2c-bb3b-f828-bd9ce93ea086@huaweicloud.com>
Date: Wed, 18 Jun 2025 10:48:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250617183503.10527-3-ryncsn@gmail.com>
Content-Type: text/plain; charset=gbk
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:Syh0CgDn8GMPKVJo3HrvPg--.13305S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZFyDKr48tFWDArWrZryDGFg_yoW5Zry8pF
	yUKas3JrWktryfAr4Sy3WvqryY934Sgay8tFWfCan3A3ZxGr10k3y8Kr12qry2krykCw4U
	WF4ft3909w1DtrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Ib4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7Mxk0xIA0c2IE
	e2xFo4CEbIxvr21lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4I
	kC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWU
	WwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr
	0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWU
	JVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJb
	IYCTnIWIevJa73UjIFyTuYvjxUF1v3UUUUU
X-CM-SenderInfo: 5vklyvpphqwq5kxd4v5lfo033gof0z/



on 6/18/2025 2:35 AM, Kairui Song wrote:
> From: Kairui Song <kasong@tencent.com>
> 
> Currently shmem calls xa_get_order to get the swap radix entry order,
> requiring a full tree walk. This can be easily combined with the swap
> entry value checking (shmem_confirm_swap) to avoid the duplicated
> lookup, which should improve the performance.
> 
> Signed-off-by: Kairui Song <kasong@tencent.com>
> ---
>  mm/shmem.c | 33 ++++++++++++++++++++++++---------
>  1 file changed, 24 insertions(+), 9 deletions(-)
> 
> diff --git a/mm/shmem.c b/mm/shmem.c
> index 4e7ef343a29b..0ad49e57f736 100644
> --- a/mm/shmem.c
> +++ b/mm/shmem.c
> @@ -505,15 +505,27 @@ static int shmem_replace_entry(struct address_space *mapping,
>  
>  /*
>   * Sometimes, before we decide whether to proceed or to fail, we must check
> - * that an entry was not already brought back from swap by a racing thread.
> + * that an entry was not already brought back or split by a racing thread.
>   *
>   * Checking folio is not enough: by the time a swapcache folio is locked, it
>   * might be reused, and again be swapcache, using the same swap as before.
> + * Returns the swap entry's order if it still presents, else returns -1.
>   */
> -static bool shmem_confirm_swap(struct address_space *mapping,
> -			       pgoff_t index, swp_entry_t swap)
> +static int shmem_swap_check_entry(struct address_space *mapping, pgoff_t index,
> +				  swp_entry_t swap)
>  {
> -	return xa_load(&mapping->i_pages, index) == swp_to_radix_entry(swap);
> +	XA_STATE(xas, &mapping->i_pages, index);
> +	int ret = -1;
> +	void *entry;
> +
> +	rcu_read_lock();
> +	do {
> +		entry = xas_load(&xas);
> +		if (entry == swp_to_radix_entry(swap))
> +			ret = xas_get_order(&xas);
> +	} while (xas_retry(&xas, entry));
> +	rcu_read_unlock();
> +	return ret;
>  }
>  
>  /*
> @@ -2256,16 +2268,20 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
>  		return -EIO;
>  
>  	si = get_swap_device(swap);
> -	if (!si) {
> -		if (!shmem_confirm_swap(mapping, index, swap))
> +	order = shmem_swap_check_entry(mapping, index, swap);
> +	if (unlikely(!si)) {
> +		if (order < 0)
>  			return -EEXIST;
>  		else
>  			return -EINVAL;
>  	}
> +	if (unlikely(order < 0)) {
> +		put_swap_device(si);
> +		return -EEXIST;
> +	}
Can we re-arrange the code block as following:
        order = shmem_swap_check_entry(mapping, index, swap);
        if (unlikely(order < 0))
                return -EEXIST;

        si = get_swap_device(swap);
        if (!si) {
                return -EINVAL;
...
>  
>  	/* Look it up and read it in.. */
>  	folio = swap_cache_get_folio(swap, NULL, 0);
> -	order = xa_get_order(&mapping->i_pages, index);
>  	if (!folio) {
>  		int nr_pages = 1 << order;
>  		bool fallback_order0 = false;
> @@ -2415,7 +2431,7 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
>  	*foliop = folio;
>  	return 0;
>  failed:
> -	if (!shmem_confirm_swap(mapping, index, swap))
> +	if (shmem_swap_check_entry(mapping, index, swap) < 0)
>  		error = -EEXIST;
>  	if (error == -EIO)
>  		shmem_set_folio_swapin_error(inode, index, folio, swap,
> @@ -2428,7 +2444,6 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
>  		folio_put(folio);
>  	}
>  	put_swap_device(si);
> -
>  	return error;
>  }
>  
> 

