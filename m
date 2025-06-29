Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9D01386C9
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 08:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751187146; cv=none; b=oWTR5+Kz+FR33OEA8C0zAbNt9f1e4OoUmgUlAyUMkXTUeLWkEFxQeygCC0xX4eb/MYyWYrIH+RNzBaJlbWC2oUKuM0u7ZSN60489QhK48T7j22ulXaD/0rNs9lI6NHusLambdP3R88xLCshyiQ9/4PPxmZ3tv/+s9thNw2qkkuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751187146; c=relaxed/simple;
	bh=W6r+MYefkq7f4aFLyxBTV46CCq99CNb9I7ZXsoZsOnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YOFbQ64PBJf5cjAchgufo/gYUd/XToVhK53PnEWHjU0v/MDu4g6TGDgM2xzBtWlxRU0+pr2l8Sj1EQSryXTlcCJwcKRcy9WnIbmX5mj8hG5gE3owvgOhbonTtomcjLRqUvIZoSYrvLiPOjTmcUKIL+Oo+ijMUtglIxZDQpPnLSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cy1ZP1Yj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cy1ZP1Yj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 280EFC4CEEB;
	Sun, 29 Jun 2025 08:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751187145;
	bh=W6r+MYefkq7f4aFLyxBTV46CCq99CNb9I7ZXsoZsOnQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cy1ZP1YjjvFvewoqwi9xAF3zyy1GEk0IKE2twlCA+Vrncabr8EwvYs+6nDkjf7naI
	 MT854oDsIGTCniar6Wz6TeKMfdzLI1XxpJiLrSIavfN9rb6F6zg4um3drf4z0LjDTH
	 qIbnwLse1qmycJenHrXOO5GKfW3qovQek8JN5vHBhWCiWyV3RReMzGZGwNCMo0PLG6
	 PjZf+MclRpSL5oBLswRmTbXXcjtD3uYKn8d4/5kskcLArwAmqHxYO5QlILj14Dftig
	 7xzn/yxDrSYPunbdtw6Y/N2va/nBb3xVXfX0rLmbqXOHgOE7HcfXgnyQkOZeII7h7o
	 1/kmLImQbx+0Q==
Date: Sun, 29 Jun 2025 11:52:17 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Peter Xu <peterx@redhat.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Vlastimil Babka <vbabka@suse.cz>,
	Suren Baghdasaryan <surenb@google.com>,
	Muchun Song <muchun.song@linux.dev>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Hugh Dickins <hughd@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	James Houghton <jthoughton@google.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Nikita Kalyazin <kalyazin@amazon.com>,
	Michal Hocko <mhocko@suse.com>,
	David Hildenbrand <david@redhat.com>,
	Andrea Arcangeli <aarcange@redhat.com>,
	Oscar Salvador <osalvador@suse.de>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Ujwal Kundur <ujwal.kundur@gmail.com>
Subject: Re: [PATCH v2 3/4] mm/hugetlb: Support vm_uffd_ops API
Message-ID: <aGD-wUFX9oSIFm3e@kernel.org>
References: <20250627154655.2085903-1-peterx@redhat.com>
 <20250627154655.2085903-4-peterx@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627154655.2085903-4-peterx@redhat.com>

On Fri, Jun 27, 2025 at 11:46:54AM -0400, Peter Xu wrote:
> Add support for the new vm_uffd_ops API for hugetlb.  Note that this only
> introduces the support, the API is not yet used by core mm.
> 
> Due to legacy reasons, it's still not trivial to move hugetlb completely to
> the API (like shmem).  But it will still use uffd_features and uffd_ioctls
> properly on the API because that's pretty general.
> 
> Cc: Muchun Song <muchun.song@linux.dev>
> Cc: Oscar Salvador <osalvador@suse.de>
> Signed-off-by: Peter Xu <peterx@redhat.com>

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
>  mm/hugetlb.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index 11d5668ff6e7..ccd2be152d36 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -5457,6 +5457,22 @@ static vm_fault_t hugetlb_vm_op_fault(struct vm_fault *vmf)
>  	return 0;
>  }
>  
> +#ifdef CONFIG_USERFAULTFD
> +static const vm_uffd_ops hugetlb_uffd_ops = {
> +	.uffd_features	= 	__VM_UFFD_FLAGS,
> +	/* _UFFDIO_ZEROPAGE not supported */
> +	.uffd_ioctls	= 	BIT(_UFFDIO_COPY) |
> +				BIT(_UFFDIO_WRITEPROTECT) |
> +				BIT(_UFFDIO_CONTINUE) |
> +				BIT(_UFFDIO_POISON),
> +	/*
> +	 * Hugetlbfs still has its own hard-coded handler in userfaultfd,
> +	 * due to limitations similar to vm_operations_struct.fault().
> +	 * TODO: generalize it to use the API functions.
> +	 */
> +};
> +#endif
> +
>  /*
>   * When a new function is introduced to vm_operations_struct and added
>   * to hugetlb_vm_ops, please consider adding the function to shm_vm_ops.
> @@ -5470,6 +5486,9 @@ const struct vm_operations_struct hugetlb_vm_ops = {
>  	.close = hugetlb_vm_op_close,
>  	.may_split = hugetlb_vm_op_split,
>  	.pagesize = hugetlb_vm_op_pagesize,
> +#ifdef CONFIG_USERFAULTFD
> +	.userfaultfd_ops = &hugetlb_uffd_ops,
> +#endif
>  };
>  
>  static pte_t make_huge_pte(struct vm_area_struct *vma, struct folio *folio,
> -- 
> 2.49.0
> 

-- 
Sincerely yours,
Mike.
