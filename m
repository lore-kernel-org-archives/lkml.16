Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4FA2F4A
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 19:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749497815; cv=none; b=ABoSphvbQHL22i3fn3nBwLOkK1gU3/O/U874jdvjC1bfjRvLx7G4lNQ2GqPxnFupSgHuTa5thqLj5MLtocMv+1w+hameclROQlHBFkpFS1tqINizLvgc5faVej/pUJa9ZNek6xwFFg1vaQ5Ng5UfLrcbWlhhg+jkz/NcsfI7hUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749497815; c=relaxed/simple;
	bh=vW+WldKDhud989X0lq2nBhkbsCVfeu8ONtXch3tf4WM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gwKz+tx67lzhcbLcnxrrEoGZlv7GelvHXjRrb7P2MKtsvpxJDpdtIIqYFfGRQvES9UrDZv1t6eD+QSvwAczHtTV+SKPQyD8ZYwj3HuayrOf74Q0wXEwfdxMA3vEluo/L4dVPEyGwYrsDi1FBe+q1G3ZtlpiUb4IpsWDly4s/D3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iTiHgMO/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iTiHgMO/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 173EDC4CEEB;
	Mon,  9 Jun 2025 19:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749497815;
	bh=vW+WldKDhud989X0lq2nBhkbsCVfeu8ONtXch3tf4WM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iTiHgMO/PDzPA6rhsUoTDEqFeIfn3dQm5gBIi6RqgEFXsc2RLYEoRDgO3Gf74rhhw
	 RijszniT+15GwHGFuCKgN2a2MVmAT1jHW8jrUAjIbDCujRScKGx3vGedA6MZyqO/Z1
	 4sPATzQ5P71ligD6mbDLbrTl1oo5iGmyXoHuwpDjWjRJqwZkQh9Uhrbp+lPLbKdPxf
	 HJLMsmciaTvQnCmqQMpIw0df61P8kT/zQrci584Mfvrw0w3Yx1V+5uRRERXgdryI9S
	 EHbGB5/zlNc0SUF2wlfEgIvT9S0Cu7qEs4qc9DeKUkKTlHfOaSkTfCv/l+8vNZhyCm
	 aXFhNAP+Qoguw==
Date: Mon, 9 Jun 2025 22:36:48 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Alexander Graf <graf@amazon.com>, Changyuan Lyu <changyuanl@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>, kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH] kho: initialize tail pages for higher order folios
 properly
Message-ID: <aEc30BoLE9HRxiZm@kernel.org>
References: <20250605171143.76963-1-pratyush@kernel.org>
 <aEKhF3HcrvG77Ogb@kernel.org>
 <mafs0jz5osutx.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mafs0jz5osutx.fsf@kernel.org>

Hi Pratyush,

On Fri, Jun 06, 2025 at 06:23:06PM +0200, Pratyush Yadav wrote:
> Hi Mike,
> 
> On Fri, Jun 06 2025, Mike Rapoport wrote:
> 
> > On Thu, Jun 05, 2025 at 07:11:41PM +0200, Pratyush Yadav wrote:
> >> From: Pratyush Yadav <ptyadav@amazon.de>
> >> 
> >> --- a/kernel/kexec_handover.c
> >> +++ b/kernel/kexec_handover.c
> >> @@ -157,11 +157,21 @@ static int __kho_preserve_order(struct kho_mem_track *track, unsigned long pfn,
> >>  }
> >> 
> >>  /* almost as free_reserved_page(), just don't free the page */
> >> -static void kho_restore_page(struct page *page)
> >> +static void kho_restore_page(struct page *page, unsigned int order)
> >>  {
> >> -	ClearPageReserved(page);
> >
> > So now we don't clear PG_Reserved even on order-0 pages? ;-)
> 
> We don't need to. As I mentioned in the commit message as well,
> PG_Reserved is never set for KHO pages since they are reserved with
> MEMBLOCK_RSRV_NOINIT, so memmap_init_reserved_pages() skips over them.

You are right, I missed it.
 
> That said, while reading through some of the code, I noticed another
> bug: because KHO reserves the preserved pages as NOINIT, with
> CONFIG_DEFERRED_STRUCT_PAGE_INIT == n, all the pages get initialized
> when memmap_init_range() is called from setup_arch (paging_init() on
> x86). This happens before kho_memory_init(), so the KHO-preserved pages
> are not marked as reserved to memblock yet.
> 
> With deferred page init, some pages might not get initialized early, and
> get initialized after kho_memory_init(), by which time the KHO-preserved
> pages are marked as reserved. So, deferred_init_maxorder() will skip
> over those pages and leave them uninitialized.
> 
> So we need to either also call init_deferred_page(), or remove the
> memblock_reserved_mark_noinit() call in deserialize_bitmap(). And TBH, I
> am not sure why KHO pages even need to be marked noinit in the first
> place. Probably the only benefit would be if a large chunk of memory is
> KHO-preserved, the pages can be initialized later on-demand, reducing
> bootup time a bit.

One benefit is performance indeed, because in not deferred case the
initialization of reserved pages in memmap_init_reserved_pages() is really
excessive.

But more importantly, if we remove memblock_reserved_mark_noinit(), with
CONFIG_DEFERRED_STRUCT_PAGE_INIT we'd loose page->private because the
struct page will be cleared after kho_mem_deserialize().
 
> What do you think? Should we drop noinit or call init_deferred_page()?
> FWIW, my preference is to drop noinit, since init_deferred_page() is
> __meminit and we would have to make sure it doesn't go away after boot.

We can't drop noinit and calling init_deferred_page() after boot just won't
work because it uses memblock to find the page's node and memblock is gone
after init.

The simplest short-term solution is to disable KHO when
CONFIG_DEFERRED_STRUCT_PAGE_INIT is set and then find an efficient way to
make it all work together.
 
-- 
Sincerely yours,
Mike.
