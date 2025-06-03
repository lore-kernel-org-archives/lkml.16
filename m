Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00DC81547CC
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 06:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748930703; cv=none; b=seDqlJF70TAFY+GGLYGMlOBx8MktP1GHL43zw6Y9WUEcBVJRzChbU2jjJQP3o/gmvBHllf7tOR78hnE6d4g0d4eNgw2ZY1BYOiZ9YyiKqAU64m4Wea8xRP9+vB62a0AmPe92WaPWuVLM4k+CgZ6hVugWNSPn8kHc0SpP7U7rT3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748930703; c=relaxed/simple;
	bh=nafkrpSQlbwAWZTQXHdO/XS10PSgYdUEAo0Xdz9PIVc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hFPiIDobmaV3nog/JMYgJyH4i4FIuVbiJ/Ji6THuTUJtYv0ypS7jMrvo9ny0VpIcq1cFVGqHih6Lg6i2j1/jVx2Zhiucf63z0EnroNT87PhbCo+Jaix2zVvqqF5/N11/qOYzKIr/fr203qX/VdY+85t1wr80dZlCQ/njWw1nBa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0486212FC;
	Mon,  2 Jun 2025 23:04:38 -0700 (PDT)
Received: from [10.164.18.47] (a077893.blr.arm.com [10.164.18.47])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A60313F673;
	Mon,  2 Jun 2025 23:04:50 -0700 (PDT)
Message-ID: <b89cdc45-39f8-49ac-8b15-d787155393d5@arm.com>
Date: Tue, 3 Jun 2025 11:34:46 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] mm: madvise: use walk_page_range_vma() for
 madvise_free_single_vma()
To: Barry Song <21cnbao@gmail.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 David Hildenbrand <david@redhat.com>, Vlastimil Babka <vbabka@suse.cz>,
 Jann Horn <jannh@google.com>, Suren Baghdasaryan <surenb@google.com>,
 Lokesh Gidra <lokeshgidra@google.com>,
 Tangquan Zheng <zhengtangquan@oppo.com>
References: <20250603013154.5905-1-21cnbao@gmail.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250603013154.5905-1-21cnbao@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/3/25 07:01, Barry Song wrote:
> From: Barry Song <v-songbaohua@oppo.com>
> 
> We've already found the VMA before calling madvise_free_single_vma(),
> so calling walk_page_range() and doing find_vma() again seems
> unnecessary. It also prevents potential optimizations for MADV_FREE
> to use a per-VMA lock.
> 
> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: Jann Horn <jannh@google.com>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Lokesh Gidra <lokeshgidra@google.com>
> Cc: Tangquan Zheng <zhengtangquan@oppo.com>
> Signed-off-by: Barry Song <v-songbaohua@oppo.com>
> ---
>  mm/madvise.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/madvise.c b/mm/madvise.c
> index d408ffa404b3..c6a28a2d3ff8 100644
> --- a/mm/madvise.c
> +++ b/mm/madvise.c
> @@ -826,7 +826,7 @@ static int madvise_free_single_vma(struct madvise_behavior *madv_behavior,
>  
>  	mmu_notifier_invalidate_range_start(&range);
>  	tlb_start_vma(tlb, vma);
> -	walk_page_range(vma->vm_mm, range.start, range.end,
> +	walk_page_range_vma(vma, range.start, range.end,
>  			&madvise_free_walk_ops, tlb);
>  	tlb_end_vma(tlb, vma);
>  	mmu_notifier_invalidate_range_end(&range);

This indeed looks like an improvement dropping a redundant VMA look up
and also opening up potential optimization later using per-VMA lock.

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
