Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58DC91F03FB
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 09:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749462773; cv=none; b=NpC0hrDsTi7Oip3u6MY/4+oYXDxHX6+nE6B96MnkXl6roOnX/AwToDz8E72l5E1tfh5v1tcVGc0qEqnFcTb04F5onYTGTxIyYlkXyK1r4vrBgd5p8WacE55s2ZQ0fWiFGishrCgV3JXMP4uGUEJHvUNpWBrkC+TClHE3J5QJzA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749462773; c=relaxed/simple;
	bh=MyDSu8h7UNUxASMvAbNUQpgT9QMP03PWqitds3hqjPw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FlQxt+rqV9V+az4/u/5/BUHCHsxjJs852M7NuWR2AvyQKgn5InC//iZ4daKJhHgrOf2nK4R4YIXYgi9b6BV70W9tMDmLFF24X3hLhuRhrJWUGlFglWHWrgm8EYIN9K8/0Dy7a/bIxJ78dr/NRjdlGH00uCmd1reOodjp6bI1TME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CD91F150C;
	Mon,  9 Jun 2025 02:52:32 -0700 (PDT)
Received: from [10.1.39.162] (XHFQ2J9959.cambridge.arm.com [10.1.39.162])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 72CC83F673;
	Mon,  9 Jun 2025 02:52:49 -0700 (PDT)
Message-ID: <671f8164-a90b-48d7-9446-359eb9493500@arm.com>
Date: Mon, 9 Jun 2025 10:52:47 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mm: madvise: use walk_page_range_vma() instead of
 walk_page_range()
Content-Language: en-GB
To: Barry Song <21cnbao@gmail.com>, linux-mm@kvack.org
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
 Barry Song <v-songbaohua@oppo.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 David Hildenbrand <david@redhat.com>, Oscar Salvador <osalvador@suse.de>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Suren Baghdasaryan <surenb@google.com>, Lokesh Gidra
 <lokeshgidra@google.com>, Dev Jain <dev.jain@arm.com>,
 Tangquan Zheng <zhengtangquan@oppo.com>
References: <20250605083144.43046-1-21cnbao@gmail.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250605083144.43046-1-21cnbao@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/06/2025 09:31, Barry Song wrote:
> From: Barry Song <v-songbaohua@oppo.com>
> 
> We've already found the VMA within madvise_walk_vmas() before calling
> specific madvise behavior functions like madvise_free_single_vma().
> So calling walk_page_range() and doing find_vma() again seems
> unnecessary. It also prevents potential optimizations in those madvise
> callbacks, particularly the use of dedicated per-VMA locking.

FYI it looks like this patch breaks all the guard-region mm selftests with:

# guard-regions.c:719:split_merge:Expected madvise(ptr, 10 * page_size,
MADV_GUARD_INSTALL) (-1) == 0 (0)

Am I the only one that runs these things? :)

[...]

>  mm/madvise.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 

[...]

> @@ -1160,7 +1160,7 @@ static long madvise_guard_install(struct vm_area_struct *vma,
>  		unsigned long nr_pages = 0;
>  
>  		/* Returns < 0 on error, == 0 if success, > 0 if zap needed. */
> -		err = walk_page_range_mm(vma->vm_mm, start, end,
> +		err = walk_page_range_vma(vma, start, end,
>  					 &guard_install_walk_ops, &nr_pages);

IIRC walk_page_range_mm() is an internal API that allows the install_pte()
callback, and the other (public) APIs explicitly disallow it, so presumably
walk_page_range_vma() is now returning an error due to install_pte != NULL?

Thanks,
Ryan

>  		if (err < 0)
>  			return err;
> @@ -1244,7 +1244,7 @@ static long madvise_guard_remove(struct vm_area_struct *vma,
>  	if (!is_valid_guard_vma(vma, /* allow_locked = */true))
>  		return -EINVAL;
>  
> -	return walk_page_range(vma->vm_mm, start, end,
> +	return walk_page_range_vma(vma, start, end,
>  			       &guard_remove_walk_ops, NULL);
>  }
>  

