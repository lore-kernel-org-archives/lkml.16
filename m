Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0AA31DC988
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 08:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743495162; cv=none; b=bUj0dLIHJQRio6DlH+FwnV93Gd1tLVvjTrXaekDN636hhbrf9aMXnHe9GUaLMWoCuPqX6a/RyhhnyIxNy5XBPCSq5KyLA48reZKVCadJczjxx9z6ksdwWzfTz4sUQF3PhP2ta98BC3pBnllE1C0F5F3ydb1h2VsmtRAZuXajc0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743495162; c=relaxed/simple;
	bh=yZPtQSky4DskpgGH1LeyvgJ08nwn3VhrsJs4lxL+hVQ=;
	h=Subject:To:References:CC:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=Ta6nsZRnywsLUGw/9CycD+36IWyaG7+7QgIY3CvYISo1NPdRSc9MQP6x7RQtPtIb859FKFT8P5/nD2UgDrmuowbU8YJaGT92W4BYxw0KPa6f09RuYW982MLRKNsL8ZfBSGj0KxoKFDRPaTa8UR+EmNz5T+qTuUWpkRgMeNDxgQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4ZRghJ0zsFz13L7w;
	Tue,  1 Apr 2025 16:12:00 +0800 (CST)
Received: from kwepemg200013.china.huawei.com (unknown [7.202.181.64])
	by mail.maildlp.com (Postfix) with ESMTPS id 87BD6180080;
	Tue,  1 Apr 2025 16:12:30 +0800 (CST)
Received: from [10.174.179.24] (10.174.179.24) by
 kwepemg200013.china.huawei.com (7.202.181.64) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 1 Apr 2025 16:12:29 +0800
Subject: Re: [PATCH v3] mm/hugetlb: update nr_huge_pages and
 surplus_huge_pages together
To: Muchun Song <muchun.song@linux.dev>, Andrew Morton
	<akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>, Oscar
 Salvador <osalvador@suse.de>, Kefeng Wang <wangkefeng.wang@huawei.com>, Peter
 Xu <peterx@redhat.com>
References: <20250305035409.2391344-1-liushixin2@huawei.com>
CC: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>
From: Liu Shixin <liushixin2@huawei.com>
Message-ID: <8f63f6bd-41ab-c819-291c-f66c239da27b@huawei.com>
Date: Tue, 1 Apr 2025 16:12:29 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250305035409.2391344-1-liushixin2@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemg200013.china.huawei.com (7.202.181.64)



On 2025/3/5 11:54, Liu Shixin wrote:
> In alloc_surplus_hugetlb_folio(), we increase nr_huge_pages and
> surplus_huge_pages separately. In the middle window, if we set
> nr_hugepages to smaller and satisfy count < persistent_huge_pages(h),
> the surplus_huge_pages will be increased by adjust_pool_surplus().
>
> After adding delay in the middle window, we can reproduce the problem
> easily by following step:
>
>  1. echo 3 > /proc/sys/vm/nr_overcommit_hugepages
>  2. mmap two hugepages. When nr_huge_pages=2 and surplus_huge_pages=1,
>     goto step 3.
>  3. echo 0 > /proc/sys/vm/nr_huge_pages
>
> Finally, nr_huge_pages is less than surplus_huge_pages.
>
> To fix the problem, call only_alloc_fresh_hugetlb_folio() instead and
> move down __prep_account_new_huge_page() into the hugetlb_lock.
>
> Fixes: 0c397daea1d4 ("mm, hugetlb: further simplify hugetlb allocation API")
> Signed-off-by: Liu Shixin <liushixin2@huawei.com>
> ---
> v2->v3: Modify the comment suggested by Oscar.
>  mm/hugetlb.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index 9faa1034704ff..0e08d2fff2360 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -2253,11 +2253,20 @@ static struct folio *alloc_surplus_hugetlb_folio(struct hstate *h,
>  		goto out_unlock;
>  	spin_unlock_irq(&hugetlb_lock);
>  
> -	folio = alloc_fresh_hugetlb_folio(h, gfp_mask, nid, nmask);
> +	folio = only_alloc_fresh_hugetlb_folio(h, gfp_mask, nid, nmask, NULL);
>  	if (!folio)
>  		return NULL;
>  
> +	hugetlb_vmemmap_optimize_folio(h, folio);
> +
>  	spin_lock_irq(&hugetlb_lock);
> +	/*
> +	 * nr_huge_pages needs to be adjusted within the same lock cycle
> +	 * as surplus_pages, otherwise it might confuse
> +	 * persistent_huge_pages() momentarily.
> +	 */
> +	__prep_account_new_huge_page(h, nid);
> +
>  	/*
>  	 * We could have raced with the pool size change.
>  	 * Double check that and simply deallocate the new page

Hi,

Sorry, there's a mistake that the nid may be mismatch.
Please use the following code to fix it, or should I send a fix patch ?

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 39f92aad7bd1..6670f9b9e07a 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -2271,7 +2271,7 @@ static struct folio *alloc_surplus_hugetlb_folio(struct hstate *h,
         * as surplus_pages, otherwise it might confuse
         * persistent_huge_pages() momentarily.
         */
-       __prep_account_new_huge_page(h, nid);
+       __prep_account_new_huge_page(h, folio_nid(folio));
 
        /*
         * We could have raced with the pool size change.
