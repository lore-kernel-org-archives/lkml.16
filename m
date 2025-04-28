Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D6F28691
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 00:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745801093; cv=none; b=VFsp/URMdSStuXQV1PVCCp5rXsfyVlS1nzlln04Ba7AI10fXoy8fIXoV+ghWhuJyyjVbumC8OciP3/TWr0F6CU55M8RaOkoejW9M0RFPrEN32RD/c67UWa5dN1nGMJrbauPwTFOrCVjPgaN5k2KcTkBpRH8hBEML5vmkO5CCf6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745801093; c=relaxed/simple;
	bh=2lpbSX41YCggcgGwzbYEGlamxTUURoLjQa75jOCvjQU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cslTGFNAIw29ycbOZKmmJXj4VhHKyCxhClPB9xhKRTA0nuTdFKuU26jSsh+TmMZ6q6wNYOemrKC+YLbYlnJq+CAcZSU3+V3zBPIPutn1FiaE2wiPW9kyexoTsAmdjcqy4NRHG9eatMX7fU0/8mcPBpPQf1YXX695DSvsp2qfzzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=QENj8qZ1; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="QENj8qZ1"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ivikCiAmafefZgHq9+LaD9Nr5TqQKW+blqE2+SSSzwI=; b=QENj8qZ1uoP8ODhXXq29gz9mXA
	MiYXSdSZwe9C9RJoSFlffaJHKG8J62A8cuItD1p6LZ8KavC7U6soE3TP2Znrx9VYIyAJ6OFI3KYqD
	gEU4LFqdfcgdLl4YDBSpEY0uAzKambbUzj5X3qw/XMGx973lXfFYsltyAhZ06w5wVA55pmcwPPDad
	3D2NN6qU6B7M3ayvkoXZJUUqcmC5keiUVddH5Y9ywSDXsDL1ucqWDBBJvm1B3qdPqCj2r5jW2/tzJ
	7uCMmKEjpvr3EG5CTu8ALneu9M6R/ezDbpY+YW632SbFfYpS008vVG9m/cLwjwS5AJgY6DWy9zi1C
	kyHqQhpw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Cbm-00000004mKZ-1iAF;
	Mon, 28 Apr 2025 00:44:30 +0000
Date: Mon, 28 Apr 2025 01:44:30 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Kairui Song <kasong@tencent.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Hugh Dickins <hughd@google.com>, Chris Li <chrisl@kernel.org>,
	Yosry Ahmed <yosryahmed@google.com>,
	"Huang, Ying" <ying.huang@linux.alibaba.com>,
	Nhat Pham <nphamcs@gmail.com>, Johannes Weiner <hannes@cmpxchg.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] filemap: do not use folio_contains for swap cache
 folios
Message-ID: <aA7PbiXv92WiTy8T@casper.infradead.org>
References: <20250427185908.90450-1-ryncsn@gmail.com>
 <20250427185908.90450-5-ryncsn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250427185908.90450-5-ryncsn@gmail.com>

On Mon, Apr 28, 2025 at 02:59:06AM +0800, Kairui Song wrote:
> For filemap and truncate, folio_contains is only used for sanity checks
> to verify the folio index matches the expected lookup/invalidation target.
> The swap cache does not utilize filemap or truncate helpers in ways that
> would trigger these checks, as it mostly implements its own cache management.
> 
> Shmem won't interact with these sanity checks either unless thing went
> wrong, it would directly trigger a BUG, because swap cache index are
> unrelated to shmem index, and would almost certainly mismatch (unless
> on collide).

It does happen though.  If shmem is writing the folio to swap at the
same time that the file containing the folio is being truncated, we
can hit this.

> - * Context: The caller should have the page locked in order to prevent
> - * (eg) shmem from moving the page between the page cache and swap cache
> - * and changing its index in the middle of the operation.
> + * Context: The caller should ensure folio->index is stable and it's
> + * not added to the swap cache.

I do think we need to keep the part about the folio being locked.
