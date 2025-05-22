Received: from out30-119.freemail.mail.aliyun.com (out30-119.freemail.mail.aliyun.com [115.124.30.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25559286D7B
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 10:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747908096; cv=none; b=fLz7++7Z5pHG6sDVaxijVzHFIKQaTTRnwbDntah2NR6spZp6Q0zQCRf5j56pViqCPUfi0cu66+oC3OmCzRsmRfV/E+zoJHk/Y2hsGFGkd9Aszei0FqF+W/gcTX1NY8wlg5PrxR4l6oqoWRoPKaaSF26IZviqsPAd/cS8YVkTM1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747908096; c=relaxed/simple;
	bh=U4kS8f3UWRTNh0rkq4u3s5sbelsJxdalU7JVSwSABOg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YxO2J/VALXyoyCPI50urEOqMMK69ps7fnUsukLo/FcIukEPXJxet+aQaLQkFIrERxM7LrQ4infP3r3GbVTeh6DlXlPRgB0h0ClW+13vi8XrSmABG6SrqblnSZMBXXfd//LUwVyCBn85ZI94+3H0Xh0S3Syh99Ea+H4PwQ+eicm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=eUs3fUyX; arc=none smtp.client-ip=115.124.30.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="eUs3fUyX"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1747908085; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=FPOsiS30vuRdL0NeJjOlpCGRWhp+MFgeFHwLvNx1avc=;
	b=eUs3fUyXspq/3fsNNJ8DkRaw+X1mJf/5tsRCfenOA/roTrKvFilPdt1vm6tKYI81dJakoacCy6XfQYETXrwqJ3S/3b3SI4fi9SsIjqZbI8kuymJOSXIKmil+8BcfSK/tiKRCIF/pNmXcordoB94yV0b8Z7a6PEgbjbXWBSGRFWM=
Received: from 30.74.113.135(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WbVRrg3_1747908083 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 22 May 2025 18:01:23 +0800
Message-ID: <3eae6bb7-4865-44c2-8603-dc2bd8e3609b@linux.alibaba.com>
Date: Thu, 22 May 2025 18:01:23 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/khugepaged: Fix race with folio splitting in
 hpage_collapse_scan_file()
To: Shivank Garg <shivankg@amd.com>, akpm@linux-foundation.org,
 david@redhat.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc: ziy@nvidia.com, lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
 npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com,
 fengwei.yin@intel.com, bharata@amd.com,
 syzbot+2b99589e33edbe9475ca@syzkaller.appspotmail.com
References: <20250522093452.6379-1-shivankg@amd.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20250522093452.6379-1-shivankg@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/5/22 17:34, Shivank Garg wrote:
> folio_mapcount() checks folio_test_large() before proceeding to
> folio_large_mapcount(), but there exists a race window where a folio
> could be split between these checks which triggered the
> VM_WARN_ON_FOLIO(!folio_test_large(folio), folio) in
> folio_large_mapcount().
> 
> Take a temporary folio reference in hpage_collapse_scan_file() to prevent
> races with concurrent folio splitting/freeing. This prevent potential
> incorrect large folio detection.
> 
> Reported-by: syzbot+2b99589e33edbe9475ca@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/all/6828470d.a70a0220.38f255.000c.GAE@google.com
> Fixes: 05c5323b2a34 ("mm: track mapcount of large folios in single value")
> Suggested-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Shivank Garg <shivankg@amd.com>
> ---
>   mm/khugepaged.c | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> index cc945c6ab3bd..6e8902f9d88c 100644
> --- a/mm/khugepaged.c
> +++ b/mm/khugepaged.c
> @@ -2295,6 +2295,17 @@ static int hpage_collapse_scan_file(struct mm_struct *mm, unsigned long addr,
>   			continue;
>   		}
>   
> +		if (!folio_try_get(folio)) {
> +			xas_reset(&xas);
> +			continue;
> +		}
> +
> +		if (unlikely(folio != xas_reload(&xas))) {
> +			folio_put(folio);
> +			xas_reset(&xas);
> +			continue;
> +		}
> +
>   		if (folio_order(folio) == HPAGE_PMD_ORDER &&
>   		    folio->index == start) {
>   			/* Maybe PMD-mapped */
> @@ -2305,23 +2316,27 @@ static int hpage_collapse_scan_file(struct mm_struct *mm, unsigned long addr,
>   			 * it's safe to skip LRU and refcount checks before
>   			 * returning.
>   			 */
> +			folio_put(folio);
>   			break;
>   		}
>   
>   		node = folio_nid(folio);
>   		if (hpage_collapse_scan_abort(node, cc)) {
>   			result = SCAN_SCAN_ABORT;
> +			folio_put(folio);
>   			break;
>   		}
>   		cc->node_load[node]++;
>   
>   		if (!folio_test_lru(folio)) {
>   			result = SCAN_PAGE_LRU;
> +			folio_put(folio);
>   			break;
>   		}
>   
>   		if (!is_refcount_suitable(folio)) {

You add a temporary refcnt for the folio, then the 
is_refcount_suitable() will always fail, right?

>   			result = SCAN_PAGE_COUNT;
> +			folio_put(folio);
>   			break;
>   		}
>   
> @@ -2333,6 +2348,7 @@ static int hpage_collapse_scan_file(struct mm_struct *mm, unsigned long addr,
>   		 */
>   
>   		present += folio_nr_pages(folio);
> +		folio_put(folio);
>   
>   		if (need_resched()) {
>   			xas_pause(&xas);
