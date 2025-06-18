Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808722EA17A;
	Wed, 18 Jun 2025 17:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750268884; cv=none; b=eg8tg7mWsrMR/y0yGArQ5YXjGppYusgpqkoDez4B2hOYsfYV1Zrq6w1+hF8CO6N989lC3+wzhqZ2CTk4oaqFFLVHuV+qdobm2YFsBZwRHiu2couToMlcziARR4tKvGz2MKgojc5B/ssMYqFs3V2GhnHmsf2DfTBE0IrN5ykdANQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750268884; c=relaxed/simple;
	bh=ozIEr4wKGthfNuRAjGNs7EZkGEH9nJR/TJ2gJCeSG4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BdsLbIsbiUWeJK+yGk5yUnoOGpFak8zqwNiyLQVIWiI0D0C4AdJHt4UjtoPl1vCPcdCWsL1ZsySPtVZBUp16n3d1dVTzCG6j37fkkZfdhiWD+IRlX7tERNz+dnE1f6gmiHmh+feAIQtfdopff+D6WgKLP3Pqit/g05gAo1AZmhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=vMGmelr0; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="vMGmelr0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ew1dpRymIrpCtOvaZCR24duIHWaEHbEIruCa80ZhE3k=; b=vMGmelr0jg3aw13ho5UqH0BXyX
	cpSmEtNVjBTeDgcazw/ac3a/CmQoMTBWQBW/yNMwVpuvL/g2P01QhaksiVFUCsCaYpmygDKlRZ6eG
	t9yvx0LlBQ7Dyo+r9JmcGzki8UTJtO8bFa9MR2ajFVfYwNYQFvaEIkjur6XHyLKqb00Kgm7DALKr8
	qJMCuX+stDMyxPjmNYGmvG7r6fFodeQAOIq1s9bvWYbwQC+NwqI0bCvRel4a3jGGyu/KcnTBdb3qm
	ApN6r7Ulculi8qSCLxyQ175LSrRvYaQTe1Y7VVPrWyP/6wmUn8peqcpgBdzEa8bwWj2sa9TnfnEM9
	xuZCEJrg==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRwtB-00000004Ryp-15ao;
	Wed, 18 Jun 2025 17:47:57 +0000
Date: Wed, 18 Jun 2025 18:47:57 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, Zi Yan <ziy@nvidia.com>, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>
Subject: Re: mm/shmem.c:2223 shmem_split_large_entry() error: uninitialized
 symbol 'entry_order'.
Message-ID: <aFL7zYgdMoqNbJBS@casper.infradead.org>
References: <428fa0fe-8960-4566-9054-5bfd967c18c8@suswa.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <428fa0fe-8960-4566-9054-5bfd967c18c8@suswa.mountain>

On Wed, Jun 18, 2025 at 08:42:17PM +0300, Dan Carpenter wrote:
> smatch warnings:
> mm/shmem.c:2223 shmem_split_large_entry() error: uninitialized symbol 'entry_order'.

...

> 12885cbe88ddf6 Baolin Wang 2024-08-12  2169  		if (!xa_is_value(old) || swp_to_radix_entry(swap) != old) {
> 12885cbe88ddf6 Baolin Wang 2024-08-12  2170  			xas_set_err(&xas, -EEXIST);
> 12885cbe88ddf6 Baolin Wang 2024-08-12  2171  			goto unlock;
> 
> Imagine we hit this goto on the first iteration

That can happen (but if it does, we set -EEXIST in the xa_state).

> 12885cbe88ddf6 Baolin Wang 2024-08-12  2213  unlock:
> 12885cbe88ddf6 Baolin Wang 2024-08-12  2214  		xas_unlock_irq(&xas);
> 12885cbe88ddf6 Baolin Wang 2024-08-12  2215  
> 12885cbe88ddf6 Baolin Wang 2024-08-12  2216  		if (!xas_nomem(&xas, gfp))
> 12885cbe88ddf6 Baolin Wang 2024-08-12  2217  			break;
> 
> And we hit this break.

That's guaranteed.  If there's an errno in the xa_state that isn't
-ENOMEM, xas_nomem() will fail.

> 12885cbe88ddf6 Baolin Wang 2024-08-12  2218  	}
> 12885cbe88ddf6 Baolin Wang 2024-08-12  2219  
> 12885cbe88ddf6 Baolin Wang 2024-08-12  2220  	if (xas_error(&xas))
> 12885cbe88ddf6 Baolin Wang 2024-08-12  2221  		return xas_error(&xas);
> 12885cbe88ddf6 Baolin Wang 2024-08-12  2222  
> d53c78fffe7ad3 Zi Yan      2025-03-14 @2223  	return entry_order;

but if this does happen, then xas_error() will be true and we'll return
-EEXIST here instead of returning entry_order.
