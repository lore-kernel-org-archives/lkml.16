Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD8B51E5B7C
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 04:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751345019; cv=none; b=FJdMsIfCqK0BbwJhEcm6rfsIeaUNHLvqvv/BtSxXcTqsFtOts8BmHNyb9wUudw0csf0zdZqUhXa4ctKFfxIBlxi7dMODAgCcl+b1zGxywR29muEYtZmBjjbBRd2sbp6w1WY2jposSjBku9Xbi55EYQ/yGWBwJZRM0/tLBQYkv0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751345019; c=relaxed/simple;
	bh=NDTd4aWfgito5ZVcwSnfXvTv625RgegeRTjEHNoaLY8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VI/O1h0DX/nRb2otsyTVh9tRSB8y+wItH/ZZTsWI4En7m7MMfLkbKvi7W//pKytVKuDOXPjD3xMIAVzc4Wm/jXnT86/D2l5IxufqjxvjlatcoUucDlsMs7yYMnsdi/EnTJx9aepfV8l1vc5Ucob7uObJ9LB3vHAG/Hsh5WuzkcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9861815A1;
	Mon, 30 Jun 2025 21:43:21 -0700 (PDT)
Received: from [10.164.146.16] (J09HK2D2RT.blr.arm.com [10.164.146.16])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BA4333F58B;
	Mon, 30 Jun 2025 21:43:34 -0700 (PDT)
Message-ID: <b1d80881-89da-41a2-8402-c07ec704775a@arm.com>
Date: Tue, 1 Jul 2025 10:13:31 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/hugetlb: Use str_plural() in report_hugepages()
To: Thorsten Blum <thorsten.blum@linux.dev>,
 Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>,
 David Hildenbrand <david@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250630171826.114008-2-thorsten.blum@linux.dev>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250630171826.114008-2-thorsten.blum@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 30/06/25 10:48 PM, Thorsten Blum wrote:
> Use the string choice helper function str_plural() to simplify the code
> and to fix the following Coccinelle/coccicheck warning reported by
> string_choices.cocci:
> 
>   opportunity for str_plural(nrinvalid)
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  mm/hugetlb.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index 9dc95eac558c..08abe7395f2f 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -25,6 +25,7 @@
>  #include <linux/mmdebug.h>
>  #include <linux/sched/signal.h>
>  #include <linux/rmap.h>
> +#include <linux/string_choices.h>
>  #include <linux/string_helpers.h>
>  #include <linux/swap.h>
>  #include <linux/swapops.h>
> @@ -3724,7 +3725,7 @@ static void __init report_hugepages(void)
>  			buf, h->nr_huge_pages);
>  		if (nrinvalid)
>  			pr_info("HugeTLB: %s page size: %lu invalid page%s discarded\n",
> -					buf, nrinvalid, nrinvalid > 1 ? "s" : "");
> +					buf, nrinvalid, str_plural(nrinvalid));
>  		pr_info("HugeTLB: %d KiB vmemmap can be freed for a %s page\n",
>  			hugetlb_vmemmap_optimizable_size(h) / SZ_1K, buf);
>  	}

Seems like there be more than one place where such str_plural() changes
could be made. Hence could you please collate them all part of a series
instead.
