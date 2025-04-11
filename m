Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9C02AF11
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 14:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744381309; cv=none; b=Kjr5S/fAyjn9Ukx64K+ei9+2DKyUzIOorLEX92yMCEEoHmSU5bKj5HCqkqYlKG29eRVJ8zpH2MTLKun7arO3lhO3kByxVDysflck9AER42wcvI65xyv8O0fmMJ5+RkJKqyZg1sDRAx6FQq4uND3kZV3OPa56sRHFx7g8f6nirjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744381309; c=relaxed/simple;
	bh=zMQ5uKY/6zWhNuy6u2YZy5lpu11P/rMOuhYhxVwIu8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DGLqpEjyjKM0ewmoq6uTjjcPftO8mPp8GCOaSDcMckdIE9nDkVGMENYFYm/y2VSHXfBIjR2i5bFC5FLgxNq5qU6hLQQvL4pYLc9Bkb0cDOBxA8VCxrU2QFSdHlxX1gCgy4x/5SaAgEt2Ae3/hOA+sklf7dkwz85OXbD0gptgbbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=KfmHQex8; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="KfmHQex8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=YtT01ajOsSmZLSUYde+7t7bxHp2pbObLzVWdGuotdHQ=; b=KfmHQex8aMJwIORN5vrOuV7n6/
	eyLo9D8CBDcLdEKIkPodWF8II4y9l7R+FQfmO90ZqVU56KHIK8CkuMGGfrOUX/mkbs+i7KxSgBCtM
	AvSjTQK5o5rWof890naGoKIIHNmCeHiOixCBMcBBXsUrpgAgGR3Zxx52/xEl7tVA9t/hAyyoXV1OP
	incV+dcc+2RwwtaWk74EqH4zRVIX6Qsh//FVWLjfZhktYpvx/BxVxCFuh/p6lr1tNyrGHul6/Akxl
	MN9tZIfMicPQ7eoFB+ziUvyRAnpif2ub+YPAosWZe9ildBdq8nuzqlaYaA7ORCWJEdCcJlr3yh0uu
	MZ5hEPRA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3FGI-00000004Lk8-3IgK;
	Fri, 11 Apr 2025 14:21:42 +0000
Date: Fri, 11 Apr 2025 15:21:42 +0100
From: Matthew Wilcox <willy@infradead.org>
To: David Hildenbrand <david@redhat.com>
Cc: Oscar Salvador <osalvador@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [PATCH] mm,hugetlb: Allocate frozen pages in
 alloc_buddy_hugetlb_folio
Message-ID: <Z_kldseGr033Hqny@casper.infradead.org>
References: <20250411132359.312708-1-osalvador@suse.de>
 <f0373427-b4e8-4612-b668-980d93febe26@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f0373427-b4e8-4612-b668-980d93febe26@redhat.com>

On Fri, Apr 11, 2025 at 03:44:31PM +0200, David Hildenbrand wrote:
> I assume htlb_alloc_mask() will always include _GFP_COMP.

static inline gfp_t htlb_alloc_mask(struct hstate *h)
{
        gfp_t gfp = __GFP_COMP | __GFP_NOWARN;

> But semantically, it might be wrong: __folio_alloc() will in the memdesc
> world also make sure to allocate the memdesc, __alloc_frozen_pages() not.
> 
> Maybe one would want a __alloc_frozen_folio() .... @willy?

This is fine.  Yes, it'll need to be modified when we get to the
separately allocated memdesc, but there's a number of places that
cast the freshly allocated page to a folio, and I'll have to come up
with a way to catch them all.

Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>

Oscar, if you want to take on the gigantic allocation next ...

 - I don't think we need folio_alloc_gigantic() to be wrapped in
   alloc_hooks
 - folio_alloc_gigantic() should return a frozen folio
 - as should hugetlb_cma_alloc_folio()
