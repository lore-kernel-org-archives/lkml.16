Received: from dggsgout12.his.huawei.com (dggsgout12.his.huawei.com [45.249.212.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73708239E7A
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 08:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749630469; cv=none; b=dSauoh+Xaxv8UksYFMlUBVQXNG/n/CDAqxiGdhYj3tMDrXDw0F6mD4pbifYJtwftbvWwsV9HGnmCkeC9qxWdEKFFlICUSQtC3Z3ig8QnYdYnTkqSqXloCb9aw7+IixDQJ4+h6rEwmoVQpBX9kH6G6Ou6H+2mYEqg8yCILUs7Qt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749630469; c=relaxed/simple;
	bh=W1Js2rR4lJ0x8lUHbVhX3yLSlc3JmfBwnTrGnmmj60E=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=YHBzk7NorHmZLUzB9DxsU+1wcczdDvw4Mff6F3x8L2ZkiyNhUefY7iqRfK3pPFlJh5rcHI3/kiqmbNevMkm/4mdmnWOwZztAkkjmJOM++6O8tFsAkd/71UMyWO7wiBEh9uk5O8PewGYwc08oPUSj4Oy9K/htRbTKDiGRpFpDxR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4bHJgj6qNtzKHMtD
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 16:27:45 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.252])
	by mail.maildlp.com (Postfix) with ESMTP id 4E7C91A07C0
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 16:27:44 +0800 (CST)
Received: from [10.174.99.169] (unknown [10.174.99.169])
	by APP3 (Coremail) with SMTP id _Ch0CgC3VsH_PUloPN7COw--.27762S2;
	Wed, 11 Jun 2025 16:27:44 +0800 (CST)
Subject: Re: [PATCH 2/4] mm: swap: correctly use maxpages in swapon syscall to
 avoid potensial deadloop
To: Baoquan He <bhe@redhat.com>
Cc: akpm@linux-foundation.org, kasong@tencent.com, hannes@cmpxchg.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250522122554.12209-1-shikemeng@huaweicloud.com>
 <20250522122554.12209-3-shikemeng@huaweicloud.com>
 <aDkc+bdFbKLUFStl@MiWiFi-R3L-srv>
From: Kemeng Shi <shikemeng@huaweicloud.com>
Message-ID: <f01a0bae-1a37-1d69-69a2-0e05d1680872@huaweicloud.com>
Date: Wed, 11 Jun 2025 16:27:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <aDkc+bdFbKLUFStl@MiWiFi-R3L-srv>
Content-Type: text/plain; charset=gbk
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:_Ch0CgC3VsH_PUloPN7COw--.27762S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWryrur4rtr13KrW3JFykGrg_yoWrKrW7pF
	W3XF1qkr4kJryIkw12va1DCFy3Gr1fKa17ta13Ja4fZ3WDZrySgry8trnYk3s2kr1kJFyv
	qrs7t347uF98ta7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxvr21lc7CjxVAaw2AF
	wI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4
	xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1D
	MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I
	0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWU
	JVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUwz
	uWDUUUU
X-CM-SenderInfo: 5vklyvpphqwq5kxd4v5lfo033gof0z/



on 5/30/2025 10:50 AM, Baoquan He wrote:
> On 05/22/25 at 08:25pm, Kemeng Shi wrote:
>> We use maxpages from read_swap_header() to initialize swap_info_struct,
>> however the maxpages might be reduced in setup_swap_extents() and the
>> si->max is assigned with the reduced maxpages from the
>> setup_swap_extents().
>> Obviously, this could lead to memory waste as we allocated memory based on
>> larger maxpages, besides, this could lead to a potensial deadloop as
>                                                  ^ typo, potential
Thanks, will fix this in next version.
>> following:
>> 1) When calling setup_clusters() with larger maxpages, unavailable pages
>> within range [si->max, larger maxpages) are not accounted with
>> inc_cluster_info_page(). As a result, these pages are assumed available
>> but can not be allocated. The cluster contains these pages can be moved
>> to frag_clusters list after it's all available pages were allocated.
>> 2) When the cluster mentioned in 1) is the only cluster in frag_clusters
>> list, cluster_alloc_swap_entry() assume order 0 allocation will never
>> failed and will enter a deadloop by keep trying to allocate page from the
>> only cluster in frag_clusters which contains no actually available page.
>>
>> Call setup_swap_extents() to get the final maxpages before swap_info_struct
>> initialization to fix the issue.
>>
>> Fixes: 661383c6111a3 ("mm: swap: relaim the cached parts that got scanned")
>> Signed-off-by: Kemeng Shi <shikemeng@huaweicloud.com>
>> ---
>>  mm/swapfile.c | 47 ++++++++++++++++++++---------------------------
>>  1 file changed, 20 insertions(+), 27 deletions(-)
> 
> Reviedwed-by: Baoquan He <bhe@redhat.com>
> 
>>
>> diff --git a/mm/swapfile.c b/mm/swapfile.c
>> index 75b69213c2e7..a82f4ebefca3 100644
>> --- a/mm/swapfile.c
>> +++ b/mm/swapfile.c
>> @@ -3141,43 +3141,30 @@ static unsigned long read_swap_header(struct swap_info_struct *si,
>>  	return maxpages;
>>  }
>>  
>> -static int setup_swap_map_and_extents(struct swap_info_struct *si,
>> -					union swap_header *swap_header,
>> -					unsigned char *swap_map,
>> -					unsigned long maxpages,
>> -					sector_t *span)
>> +static int setup_swap_map(struct swap_info_struct *si,
>> +			  union swap_header *swap_header,
>> +			  unsigned char *swap_map,
>> +			  unsigned long maxpages)
>>  {
>> -	unsigned int nr_good_pages;
>>  	unsigned long i;
>> -	int nr_extents;
>> -
>> -	nr_good_pages = maxpages - 1;	/* omit header page */
>>  
>> +	swap_map[0] = SWAP_MAP_BAD; /* omit header page */
>>  	for (i = 0; i < swap_header->info.nr_badpages; i++) {
>>  		unsigned int page_nr = swap_header->info.badpages[i];
>>  		if (page_nr == 0 || page_nr > swap_header->info.last_page)
>>  			return -EINVAL;
>>  		if (page_nr < maxpages) {
>>  			swap_map[page_nr] = SWAP_MAP_BAD;
>> -			nr_good_pages--;
>> +			si->pages--;
>>  		}
>>  	}
>>  
>> -	if (nr_good_pages) {
>> -		swap_map[0] = SWAP_MAP_BAD;
>> -		si->max = maxpages;
>> -		si->pages = nr_good_pages;
>> -		nr_extents = setup_swap_extents(si, span);
>> -		if (nr_extents < 0)
>> -			return nr_extents;
>> -		nr_good_pages = si->pages;
>> -	}
>> -	if (!nr_good_pages) {
>> +	if (!si->pages) {
>>  		pr_warn("Empty swap-file\n");
>>  		return -EINVAL;
>>  	}
>>  
>> -	return nr_extents;
>> +	return 0;
>>  }
>>  
>>  #define SWAP_CLUSTER_INFO_COLS						\
>> @@ -3217,7 +3204,7 @@ static struct swap_cluster_info *setup_clusters(struct swap_info_struct *si,
>>  	 * Mark unusable pages as unavailable. The clusters aren't
>>  	 * marked free yet, so no list operations are involved yet.
>>  	 *
>> -	 * See setup_swap_map_and_extents(): header page, bad pages,
>> +	 * See setup_swap_map(): header page, bad pages,
>>  	 * and the EOF part of the last cluster.
>>  	 */
>>  	inc_cluster_info_page(si, cluster_info, 0);
>> @@ -3354,6 +3341,15 @@ SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
>>  		goto bad_swap_unlock_inode;
>>  	}
>>  
>> +	si->max = maxpages;
>> +	si->pages = maxpages - 1;
>> +	nr_extents = setup_swap_extents(si, &span);
>> +	if (nr_extents < 0) {
>> +		error = nr_extents;
>> +		goto bad_swap_unlock_inode;
>> +	}
>> +	maxpages = si->max;
>> +
>>  	/* OK, set up the swap map and apply the bad block list */
>>  	swap_map = vzalloc(maxpages);
>>  	if (!swap_map) {
>> @@ -3365,12 +3361,9 @@ SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
>>  	if (error)
>>  		goto bad_swap_unlock_inode;
>>  
>> -	nr_extents = setup_swap_map_and_extents(si, swap_header, swap_map,
>> -						maxpages, &span);
>> -	if (unlikely(nr_extents < 0)) {
>> -		error = nr_extents;
>> +	error = setup_swap_map(si, swap_header, swap_map, maxpages);
>> +	if (error)
>>  		goto bad_swap_unlock_inode;
>> -	}
>>  
>>  	/*
>>  	 * Use kvmalloc_array instead of bitmap_zalloc as the allocation order might
>> -- 
>> 2.30.0
>>
> 

