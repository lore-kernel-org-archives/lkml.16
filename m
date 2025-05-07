Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88BA61FF7B4
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 12:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746619898; cv=none; b=EZANZipQdG7+aqxKtUke5JWjxWNYw/0U2OOtFgEeNhxy8I/V7S5qNX0msxA/6f639n9+zqMuZMObER4LYc5l9kBbW/kx1Lc15kfEQ1pPbJAuvSNO02tYCmo+Wr1vU2IOfcMgbTQptLqYDH7blhrUSMXZcAFbP8K9xTUwOrvNk04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746619898; c=relaxed/simple;
	bh=3eE5blS4FgeUpqHOAwIR4SXocX5HfbFsc2jJzj2Ar8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TVufceAKx9avsd7rDx7WkhtS7ishuzuN5uvOAr58xbDVAhaOMhhwro5NkvhpQtNjv8PpqvJBJ0QKnp/hBce79KDZkfhtIYll1QQpHW02hs77fT/wK9YcrFBADi/JjG/9XkTEb1613Y04zau58l2P1Wh/8QQY8nBElDFb365TSCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=oS9Jr+7E; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="oS9Jr+7E"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=6gtZw/19cy9nmFSY5os2fTfYQ3iFqfNfyyYDRhMXkkk=; b=oS9Jr+7EjwU9rXH/Pm3dWaV/Ey
	GEwPNVMGXnfSMLG85yAbZ7c8BClT4qtCWC6BZ6MTsuXOpx7fEX7QydFY4CphyEn634oGZtgWb8Fj6
	V56GGyrvJU52+TW6Sw3Zxq3Mhx/2NJzk0trwp0nq94p+sI0WaiEBpM8E31rqniJlMmnA3T+1CjKk2
	DPmtvmkdPTUJTclOoi2UNjJwMki+9FdcHGXhX+TEC6qNqf2LP/OcVvqzziS1D+v9DSYRanZDOl2Nb
	KDNv3v1mGkdahIDtX1ebJOqjtf+n2PiB0oRVTWOpFiPfJsqt/o65j4SZVfjZbq9ZoiA4pLwtTE4Rw
	E+ruHBtw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCdbS-00000004J1Q-0Izd;
	Wed, 07 May 2025 12:10:22 +0000
Date: Wed, 7 May 2025 13:10:21 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, david@redhat.com, hannes@cmpxchg.org,
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
	npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com,
	ziy@nvidia.com, vbabka@suse.cz, rppt@kernel.org, surenb@google.com,
	mhocko@suse.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] mm: convert do_set_pmd() to take a folio
Message-ID: <aBtNrQNlL7hjLrTZ@casper.infradead.org>
References: <8e33c8a65b46170dfd8ba6715d2115856a55b8f6.1746609191.git.baolin.wang@linux.alibaba.com>
 <a2faee74256c22cff2238487a86b154d5520c334.1746609191.git.baolin.wang@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a2faee74256c22cff2238487a86b154d5520c334.1746609191.git.baolin.wang@linux.alibaba.com>

On Wed, May 07, 2025 at 05:26:13PM +0800, Baolin Wang wrote:
> In do_set_pmd(), we always use the folio->page to build PMD mappings for
> the entire folio. Since all callers of do_set_pmd() already hold a stable
> folio, converting do_set_pmd() to take a folio is safe and more straightforward.

What testing did you do of this?

> -vm_fault_t do_set_pmd(struct vm_fault *vmf, struct page *page)
> +vm_fault_t do_set_pmd(struct vm_fault *vmf, struct folio *folio)
>  {
> -	struct folio *folio = page_folio(page);
>  	struct vm_area_struct *vma = vmf->vma;
>  	bool write = vmf->flags & FAULT_FLAG_WRITE;
>  	unsigned long haddr = vmf->address & HPAGE_PMD_MASK;
>  	pmd_t entry;
>  	vm_fault_t ret = VM_FAULT_FALLBACK;
> +	struct page *page;

Because I see nowhere in this patch that you initialise 'page'.

And that's really the important part.  You seem to be assuming that a
folio will never be larger than PMD size, and I'm not comfortable with
that assumption.  It's a limitation I put in place a few years ago so we
didn't have to find and fix all those assumptions immediately, but I
imagine that some day we'll want to have larger folios.

So unless you can derive _which_ page in the folio we want to map from
the vmf, NACK this patch.
