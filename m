Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E572EACE9
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 14:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751552914; cv=none; b=tI7DW6ljJus5jinLXsgoa0k3vkwqk0u0GxqeaHB0Pu3EvCawj1RuviKH9rcm9mb6gszY8FCUrKF9ZggS8sr2Sl5BGVYIBkIGSoglD4Y25nn61qY5ROYwwXLin63K585b930h0jRMxopfUdLRLklxuDrP/zZvaf87uhc2mOPLC/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751552914; c=relaxed/simple;
	bh=+swf/j3ikOTyTYQIR/Go7dMRoqwFsS1apHTuzUWKLJI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZzXFyJ3XeCdCgmkAnbwletxrFp/PZg15mw97Wo2fof3qBqlBFFUlEsiDWbqqfvrQSFtIePvfe6CJBNoJwujbk7wGW8KDtX61qhBL4jg5UwcK/CVnLRIgq1PQqclDW4WS7OWb+C9qwC4J4HBMFF/E2yneSW4WePxWqEqB8y+SJS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=UCX+Pa5e; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="UCX+Pa5e"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=W1Tq/L6ZAbocFgEmsUnCZvw0L6N9KDtQzADck8JeSDg=; b=UCX+Pa5eicmX2gXGXrzeTPpqJ4
	33TmXxTL2Abo8OGhmCQ8Xj4xu9ygu9fKREIhq9pHNbhGFDHDt8UB8YhfdfH3n2DLMOW48FRH/gpX6
	wstvY/0WV9nUuU5dbIkx9PkljRGmcy1byyCeEk7M7tETgyZ3scd3/9KUDWYJ1DRYo4AQ42kMc1R0Y
	RsmQXRHodgeaXh3Xi+DZ7oecgz6caa5lMHsI9CuU3k0gfTJzUaxPRG7gLs9LATUCZ3jedCRdszpQD
	beDIcdsDODbgyj6RtFYNIv0P7mDA78fNfqeiXL0E445RkTTJrySTEkVtvzj6i/9NYxnkuGikjXrC9
	p/DqQ8dA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXKvH-0000000DM6m-1vam;
	Thu, 03 Jul 2025 14:28:23 +0000
Date: Thu, 3 Jul 2025 15:28:23 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ingo Molnar <mingo@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Michal Hocko <mhocko@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Vlastimil Babka <vbabka@suse.cz>, linux-mm@kvack.org
Subject: Re: [PATCH 6/6] mm: Drain LRUs upon resume to userspace on nohz_full
 CPUs
Message-ID: <aGaTh2esRWr3L6IC@casper.infradead.org>
References: <20250703140717.25703-1-frederic@kernel.org>
 <20250703140717.25703-7-frederic@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703140717.25703-7-frederic@kernel.org>

On Thu, Jul 03, 2025 at 04:07:17PM +0200, Frederic Weisbecker wrote:
> +unsigned int folio_batch_add(struct folio_batch *fbatch,
> +			     struct folio *folio)
> +{
> +	unsigned int ret;
> +
> +	fbatch->folios[fbatch->nr++] = folio;
> +	ret = folio_batch_space(fbatch);
> +	isolated_task_work_queue();

Umm.  LRUs use folio_batches, but they are definitely not the only user
of folio_batches.  Maybe you want to add a new lru_batch_add()
abstraction, because this call is definitely being done at the wrong
level.

