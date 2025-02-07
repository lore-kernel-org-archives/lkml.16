Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09C2238D57;
	Fri,  7 Feb 2025 15:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738940425; cv=none; b=gq895nP4yuHAYU5qVlPxYoL+4EjebvBuamCCEorXXwrRoFvPRBrBynxiDMUqxuomoLS/03aj/A4H2bnqGcZ31PfNnizKFbFuEjheUJTPF3NwvumL9P7vNcWEX7cEDQzsrRG0EviiXeMESKCnA3E5T3YEJ/WrA1zCBLik8byKh8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738940425; c=relaxed/simple;
	bh=5qGls0MixSZlIRtKrJpy8L0OIUXKPKHSh0nzT6h7mbU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mylv8MBAjwI8mvkjMeRWwqw2LXwoeUovVzuN5ryoe8T6Yf+qundOS6DGGP/5hCrJ8/efIjiy4xXiPi75nN88OlAabcOyKPfVfCgm4ylQ277wgCmIZMJdOOhLZRbIiISc2StViU4yZDTlJDso67llfOlJZ8caZk720VD3hpdFDPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=cumFyIH7; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="cumFyIH7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=7zWbeTI0iVXnsJeV3Y+pOkoTDbxGkFIzjOKkyY+w2L8=; b=cumFyIH70i0rvsVq0RcTinTMou
	MJnOFWpJEgd9qIDi1XRi4wAqhVp2ljm2hfbS4fORfJHcGFAuGL8/ahyM/Y5gvebNLVkd0uGhEfdWe
	PWrg7IF44uMSMh7HGbCXNk+xYy0lVkNK6MYLHjC0Vza3XtdYRZCxCYwLzmMsrKzTs+APMW8ANUTHh
	XiUCKn6NPWrvsiljf52kB9aeyMRgT6f3WE9E9O3jd27QNjpNGKrT0idMAXeI5QtaXFg2WKA549/vh
	/RVvdWsgvJkRntgOn1bwea11C55MQFJK+c9uvNqeRhYN2b3AIleGekgr5P9N2a9xlN1BeB0J50xJg
	573udtsA==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1tgPpz-000000083qW-47WG;
	Fri, 07 Feb 2025 15:00:12 +0000
Date: Fri, 7 Feb 2025 15:00:11 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Zi Yan <ziy@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Hugh Dickins <hughd@google.com>,
	David Hildenbrand <david@redhat.com>,
	Yang Shi <yang@os.amperecomputing.com>,
	Miaohe Lin <linmiaohe@huawei.com>,
	Kefeng Wang <wangkefeng.wang@huawei.com>,
	Yu Zhao <yuzhao@google.com>, John Hubbard <jhubbard@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/7] Buddy allocator like (or non-uniform) folio split
Message-ID: <Z6Yf-1YLgUK-K-uS@casper.infradead.org>
References: <20250205031417.1771278-1-ziy@nvidia.com>
 <20250206000111.6c54e67d1933f8bbc01a46cd@linux-foundation.org>
 <019EB6CA-0F4B-496A-B2AE-A3A553585281@nvidia.com>
 <Z6YX3RznGLUD07Ao@casper.infradead.org>
 <E4287DB5-7D0D-41D7-BC0E-F5F404853931@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E4287DB5-7D0D-41D7-BC0E-F5F404853931@nvidia.com>

On Fri, Feb 07, 2025 at 09:35:27AM -0500, Zi Yan wrote:
> On 7 Feb 2025, at 9:25, Matthew Wilcox wrote:
> > As part of your series, I'd like to remove that limitation, so we'd need
> > to allocate log_64(n - m) [ok, more complex than that, but ykwim].  So
> > it's not quite "only allocate one node", but it's allocate O(log(current
> > number of nodes needed to be allocated)).
> >
> > Makes sense?
> 
> Yes.
> 
> To remove that order-12 limitation, do shmem_split_large_entry() and
> __filemap_add_folio() need some change as well? Both call xas_split_alloc().
> But I do not know if they will see splitting order-12 to order-(0 to 5).

__filemap_add_folio() doesn't need to fracture like it currently does;
it can do the same minimum split.  The situation is that we've got a
shadow entry which covers 2^n slots, and now we want to add a folio
which only covers 2^m slots with m < n.  Leaving n-m shadow entries in the tree
with orders ranging from m to n-1 makes more sense than the eager split.

shmem is the same, except that it's storing swap entries instead of
shadow entries.
