Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D17E23AD
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 03:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744945408; cv=none; b=OCga251kHwh2zmh8GpPsY1YBgR7kJdSaZ7ovkhKVtG9HBjF+T4n+v6aIe8LqgQufmdVq4BhtikBV/YDIgNuJsHmc1X4vLY2HDno9SYrnTWBNFjgSaZdLklg2zJ07taa8K3qt7/TGKppXGXLQcOU/oRf2UnB/CR52k5eBr876q90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744945408; c=relaxed/simple;
	bh=6ojsT+zx7RXzbBlsRuUndoxu1B7BSTUSHZ0fPpXHzhk=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=bGyLVI3mfW9N52GjNbMDVcI3jnY4Ftb7fZdMEHeLuZc/9nUa6hUjFL4xOxfTdqseX/hY3oD29FxU9EwO6ki5fs00Rom4NdWYfc4s0TX4dKrUzJcocGK8uqkKwJiDKeJHyckPxdSruIU5bqWJOz5/XAeMLmKeAtbg0wFTAqVTdSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=nc2AN74T; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="nc2AN74T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97CE3C4CEE4;
	Fri, 18 Apr 2025 03:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1744945407;
	bh=6ojsT+zx7RXzbBlsRuUndoxu1B7BSTUSHZ0fPpXHzhk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nc2AN74TWKe4ttGcNWkteXd4XuL7ao1+z/MlbYDwJwfd83If7+y/teGIkzeAgGfq4
	 Sjww+ATqQQKunGwvXHa+Cx1roMcnB2PpFd3436pJGjmE+wtmsp85mlJM82GCHOEzzv
	 21eiBCN2WaLPuCuMsJ9uS31P8uERggEBRQrQ6Prk=
Date: Thu, 17 Apr 2025 20:03:27 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Wupeng Ma <mawupeng1@huawei.com>
Cc: <mike.kravetz@oracle.com>, <david@redhat.com>,
 <joshua.hahnjy@gmail.com>, <muchun.song@linux.dev>, <linux-mm@kvack.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mm: hugetlb: Fix incorrect fallback for subpool
Message-Id: <20250417200327.ef9d1aed59e198aa2c8b046e@linux-foundation.org>
In-Reply-To: <20250410062633.3102457-1-mawupeng1@huawei.com>
References: <20250410062633.3102457-1-mawupeng1@huawei.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 10 Apr 2025 14:26:33 +0800 Wupeng Ma <mawupeng1@huawei.com> wrote:

> During our testing with hugetlb subpool enabled, we observe that
> hstate->resv_huge_pages may underflow into negative values. Root cause
> analysis reveals a race condition in subpool reservation fallback handling
> as follow:
> 
> hugetlb_reserve_pages()
>     /* Attempt subpool reservation */
>     gbl_reserve = hugepage_subpool_get_pages(spool, chg);
> 
>     /* Global reservation may fail after subpool allocation */
>     if (hugetlb_acct_memory(h, gbl_reserve) < 0)
>         goto out_put_pages;
> 
> out_put_pages:
>     /* This incorrectly restores reservation to subpool */
>     hugepage_subpool_put_pages(spool, chg);
> 
> When hugetlb_acct_memory() fails after subpool allocation, the current
> implementation over-commits subpool reservations by returning the full
> 'chg' value instead of the actual allocated 'gbl_reserve' amount. This
> discrepancy propagates to global reservations during subsequent releases,
> eventually causing resv_huge_pages underflow.
> 
> This problem can be trigger easily with the following steps:
> 1. reverse hugepage for hugeltb allocation
> 2. mount hugetlbfs with min_size to enable hugetlb subpool
> 3. alloc hugepages with two task(make sure the second will fail due to
>    insufficient amount of hugepages)
> 4. with for a few seconds and repeat step 3 which will make
>    hstate->resv_huge_pages to go below zero.
> 
> To fix this problem, return corrent amount of pages to subpool during the
> fallback after hugepage_subpool_get_pages is called.
> 

This has been in mm-hotfixes since April 1.  Do we have any reviwers?

> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -3010,7 +3010,7 @@ struct folio *alloc_hugetlb_folio(struct vm_area_struct *vma,
>  	struct hugepage_subpool *spool = subpool_vma(vma);
>  	struct hstate *h = hstate_vma(vma);
>  	struct folio *folio;
> -	long retval, gbl_chg;
> +	long retval, gbl_chg, gbl_reserve;
>  	map_chg_state map_chg;
>  	int ret, idx;
>  	struct hugetlb_cgroup *h_cg = NULL;
> @@ -3163,8 +3163,16 @@ struct folio *alloc_hugetlb_folio(struct vm_area_struct *vma,
>  		hugetlb_cgroup_uncharge_cgroup_rsvd(idx, pages_per_huge_page(h),
>  						    h_cg);
>  out_subpool_put:
> -	if (map_chg)
> -		hugepage_subpool_put_pages(spool, 1);
> +	/*
> +	 * put page to subpool iff the quota of subpool's rsv_hpages is used
> +	 * during hugepage_subpool_get_pages.
> +	 */
> +	if (map_chg && !gbl_chg) {
> +		gbl_reserve = hugepage_subpool_put_pages(spool, 1);
> +		hugetlb_acct_memory(h, -gbl_reserve);
> +	}
> +
> +
>  out_end_reservation:
>  	if (map_chg != MAP_CHG_ENFORCED)
>  		vma_end_reservation(h, vma, addr);
> @@ -7216,7 +7224,7 @@ bool hugetlb_reserve_pages(struct inode *inode,
>  					struct vm_area_struct *vma,
>  					vm_flags_t vm_flags)
>  {
> -	long chg = -1, add = -1;
> +	long chg = -1, add = -1, spool_resv, gbl_resv;
>  	struct hstate *h = hstate_inode(inode);
>  	struct hugepage_subpool *spool = subpool_inode(inode);
>  	struct resv_map *resv_map;
> @@ -7351,8 +7359,16 @@ bool hugetlb_reserve_pages(struct inode *inode,
>  	return true;
>  
>  out_put_pages:
> -	/* put back original number of pages, chg */
> -	(void)hugepage_subpool_put_pages(spool, chg);
> +	spool_resv = chg - gbl_reserve;
> +	if (spool_resv) {
> +		/* put sub pool's reservation back, chg - gbl_reserve */
> +		gbl_resv = hugepage_subpool_put_pages(spool, spool_resv);
> +		/*
> +		 * subpool's reserved pages can not be put back due to race,
> +		 * return to hstate.
> +		 */
> +		hugetlb_acct_memory(h, -gbl_resv);
> +	}
>  out_uncharge_cgroup:
>  	hugetlb_cgroup_uncharge_cgroup_rsvd(hstate_index(h),
>  					    chg * pages_per_huge_page(h), h_cg);
> -- 
> 2.43.0
> 
