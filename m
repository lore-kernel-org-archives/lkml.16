Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B922D2746A
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 23:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745798329; cv=none; b=bd8TZQ2ngnx/lUuNLpaN2fDDDckw4rzITEq9nflLaMFYagAyQGc1GCcghYxIzf1B6h/BZiK9M7MZa3PcR1WxJsFlScnWDGPAu1TtY316g+YbTzJbOpbpsy4sZUolHUJ9Sny4s38yGePJUfkLHXCN/WiO849OTTcX4wukLWPVZT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745798329; c=relaxed/simple;
	bh=g67E6h1Gh+ka/rGTNmugKy9bs+PqqOhOGnvdgUTc6KY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EtGWr+/ZKthxe2JJR3UkPno4g//y7SVYQFfO/3Q6TCrUzxtXhvr6+uo0RtyS8op29Ca1bkfCpZHAVpUODzrvW8/ajzlaW1EfK7PoNIq+h9kPvIOSXbJ6cNKhBjmd+GiI/7v+UxvMDgsTRv7I1YnPtP2gon3VqPfnRhnLqOepIqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=SeJTc5l7; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="SeJTc5l7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=swz0BgbuDu4+wXmTCpilGtd8NOgXT2LX9GnpWe/lepA=; b=SeJTc5l7eLz+MUbIWk1wyL+Lw3
	K7RCK1b9iME8GnXNRxgtXeq+GWnSmsi3UzwanBRwt6dcl8/2J0X67XxFBsoN82kHaeaFUpSRPW5E4
	YpUyUbg5lHJpiu3TjwH+oMm9fr0c5PHOloL5HFpdZxM7YKvUwnTfCDmg0F9r5psYILxSbyd1KC1Bd
	Bc1pagRfmRl0DvSSZwUEpDW97mo38lghnZeNkFtTr/5gj7QEddiJB/txqNr4L4IyEmUgr4ENiK8eZ
	QPMQ294UKqLpmnxiwIqSwpwoKkE87u1KE0IIrVIRJ4V6v/tnPkCEpElEGA0l+xrwQOJi687PSp+zV
	EJACHAAw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Bsy-00000003xkv-3djZ;
	Sun, 27 Apr 2025 23:58:12 +0000
Date: Mon, 28 Apr 2025 00:58:12 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Kairui Song <kasong@tencent.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Hugh Dickins <hughd@google.com>, Chris Li <chrisl@kernel.org>,
	Yosry Ahmed <yosryahmed@google.com>,
	"Huang, Ying" <ying.huang@linux.alibaba.com>,
	Nhat Pham <nphamcs@gmail.com>, Johannes Weiner <hannes@cmpxchg.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] mm: move folio_index to mm/swap.h and remove no
 longer needed helper
Message-ID: <aA7ElItPhzNi2hCe@casper.infradead.org>
References: <20250427185908.90450-1-ryncsn@gmail.com>
 <20250427185908.90450-6-ryncsn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250427185908.90450-6-ryncsn@gmail.com>

On Mon, Apr 28, 2025 at 02:59:07AM +0800, Kairui Song wrote:
> +++ b/mm/swap.h
> @@ -50,6 +50,24 @@ static inline pgoff_t swap_cache_index(swp_entry_t entry)
>  	return swp_offset(entry) & SWAP_ADDRESS_SPACE_MASK;
>  }
>  
> +/**
> + * folio_index - File index of a folio.
> + * @folio: The folio.
> + *
> + * For a folio which is either in the page cache or the swap cache,
> + * return its index within the address_space it belongs to.  If you know
> + * the page is definitely in the page cache, you can look at the folio's
> + * index directly.
> + *
> + * Return: The index (offset in units of pages) of a folio in its file.
> + */
> +static inline pgoff_t folio_index(struct folio *folio)
> +{
> +	if (unlikely(folio_test_swapcache(folio)))
> +		return swap_cache_index(folio->swap);
> +	return folio->index;
> +}

I think the build warning can be cured by moving this outside
CONFIG_SWAP
