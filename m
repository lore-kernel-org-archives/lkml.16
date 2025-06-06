Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4A824EF6B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 08:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749197086; cv=none; b=saSgPV+iAcozIH8s7wvKl6tOAT4BYTkWL487Yl66zF721A0XfD/llR2gkJp6rLTKD4G7pdqjFgoea2f7wsQo/dl1dXMlQLvgHyq6NwRL1yOgIhoAyIepyKTBzzb8F2lL4Bswgt3xgnKgPZzZ4WF+4GtTZNNpc0bUb7PFVayV7cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749197086; c=relaxed/simple;
	bh=/eAbsE62fKUCaEC3zAvD15WyaOeeMA6jncyNVQwRldg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IqICIVloqDydMg0Sw9vDbvIxDfVG9vEoneZ+BdzR/l9LcLVl+LhyFnVxYw17OlmqIdqdtWdgewQDAaN/u2WpzPzzUq6g3/Nysn9WgQujDgDuoP1BHV+J+PqTRV0XHLMKvW3z0GHtEyRu3o4/RfOXWIrLy6Bir8u7fFZXWZNfnx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qV4jtDv+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qV4jtDv+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7EB2C4CEEB;
	Fri,  6 Jun 2025 08:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749197086;
	bh=/eAbsE62fKUCaEC3zAvD15WyaOeeMA6jncyNVQwRldg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qV4jtDv+PQOS1Z54jDelm+RkHP6SZV4PHiNcZ7pa3FEoaNtqdWNmfGY+gApAqOlfr
	 wGx1+FACRrsQAzZ7HF9ROT3Oc5yRqgeEgYkSwrTVslT3taQMq7DRWpcBnKbjam0jkh
	 FzS4NAgwzQCOJUMLwIGww+BNzcXdv9D8Bu/UY5PY8mAeCL0jBg78dfowP/RdmO1GY/
	 8j3RSNfj4DPOJccGvQK70atOh8UnIKDqhJUl+2qw041PRIdtXhzL7igODq4SbPy5HR
	 5rPxt5E3JOIiJPjdgUc338VwGktz2mCgS5JNdfiK6ss7hQbT9oVG4g04Klb/wQr2zS
	 TmnoqI11hBOfQ==
Date: Fri, 6 Jun 2025 11:04:39 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Alexander Graf <graf@amazon.com>, Changyuan Lyu <changyuanl@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>, Pratyush Yadav <ptyadav@amazon.de>,
	kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH] kho: initialize tail pages for higher order folios
 properly
Message-ID: <aEKhF3HcrvG77Ogb@kernel.org>
References: <20250605171143.76963-1-pratyush@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250605171143.76963-1-pratyush@kernel.org>

On Thu, Jun 05, 2025 at 07:11:41PM +0200, Pratyush Yadav wrote:
> From: Pratyush Yadav <ptyadav@amazon.de>
> 
> Currently, when restoring higher order folios, kho_restore_folio() only
> calls prep_compound_page() on all the pages. That is not enough to
> properly initialize the folios. The managed page count does not
> get updated, the reserved flag does not get dropped, and page count does
> not get initialized properly.
> 
> Restoring a higher order folio with it results in the following BUG with
> CONFIG_DEBUG_VM when attempting to free the folio:
> 
>     BUG: Bad page state in process test  pfn:104e2b
>     page: refcount:1 mapcount:0 mapping:0000000000000000 index:0xffffffffffffffff pfn:0x104e2b
>     flags: 0x2fffff80000000(node=0|zone=2|lastcpupid=0x1fffff)
>     raw: 002fffff80000000 0000000000000000 00000000ffffffff 0000000000000000
>     raw: ffffffffffffffff 0000000000000000 00000001ffffffff 0000000000000000
>     page dumped because: nonzero _refcount
>     [...]
>     Call Trace:
>     <TASK>
>     dump_stack_lvl+0x4b/0x70
>     bad_page.cold+0x97/0xb2
>     __free_frozen_pages+0x616/0x850
>     [...]
> 
> Combine the path for 0-order and higher order folios, initialize the
> tail pages with a count of zero, and call adjust_managed_page_count() to
> account for all the pages instead of just missing them.
> 
> In addition, since all the KHO-preserved pages get marked with
> MEMBLOCK_RSRV_NOINIT by deserialize_bitmap(), the reserved flag is not
> actually set (as can also be seen from the flags of the dumped page in
> the logs above). So drop the ClearPageReserved() calls.
> 
> Fixes: fc33e4b44b271 ("kexec: enable KHO support for memory preservation")
> Signed-off-by: Pratyush Yadav <ptyadav@amazon.de>
> ---
> 
> Side note: get_maintainers.pl for KHO only lists kexec@ as the mailing list.
> Since KHO has a bunch of MM bits as well, should we also add linux-mm@ to its
> MAINTAINERS entry?
> 
> Adding linux-mm@ to this patch at least, in case MM people have an opinion on
> this.
> 
>  kernel/kexec_handover.c | 29 +++++++++++++++++------------
>  1 file changed, 17 insertions(+), 12 deletions(-)
> 
> diff --git a/kernel/kexec_handover.c b/kernel/kexec_handover.c
> index eb305e7e61296..5214ab27d1f8d 100644
> --- a/kernel/kexec_handover.c
> +++ b/kernel/kexec_handover.c
> @@ -157,11 +157,21 @@ static int __kho_preserve_order(struct kho_mem_track *track, unsigned long pfn,
>  }
> 
>  /* almost as free_reserved_page(), just don't free the page */
> -static void kho_restore_page(struct page *page)
> +static void kho_restore_page(struct page *page, unsigned int order)
>  {
> -	ClearPageReserved(page);

So now we don't clear PG_Reserved even on order-0 pages? ;-)

> -	init_page_count(page);
> -	adjust_managed_page_count(page, 1);
> +	unsigned int i, nr_pages = (1 << order);

Can you please declare 'i' inside the loop, looks nicer IMHO.

> +
> +	/* Head page gets refcount of 1. */
> +	set_page_count(page, 1);

ClearPageReserved(page) here?

> +
> +	/* For higher order folios, tail pages get a page count of zero. */
> +	for (i = 1; i < nr_pages; i++)
> +		set_page_count(page + i, 0);

and here?

> +
> +	if (order > 0)
> +		prep_compound_page(page, order);
> +
> +	adjust_managed_page_count(page, nr_pages);
>  }
> 
>  /**
> @@ -179,15 +189,10 @@ struct folio *kho_restore_folio(phys_addr_t phys)
>  		return NULL;
> 
>  	order = page->private;
> -	if (order) {
> -		if (order > MAX_PAGE_ORDER)
> -			return NULL;
> -
> -		prep_compound_page(page, order);
> -	} else {
> -		kho_restore_page(page);
> -	}
> +	if (order > MAX_PAGE_ORDER)
> +		return NULL;
> 
> +	kho_restore_page(page, order);
>  	return page_folio(page);
>  }
>  EXPORT_SYMBOL_GPL(kho_restore_folio);
> --
> 2.47.1
> 

-- 
Sincerely yours,
Mike.
