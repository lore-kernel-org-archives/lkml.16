Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FBD1F12F4
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 03:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744256939; cv=none; b=uubijA20po2g+AbqClIm2Mcwa3RjhiTAGMNu1+yLEb37vYsKjRwrQeaB/7K/swjVxjqcUTU0jSYmtcD57xEjQ09qOW5nYuS8EY3CWqy73U5SOb0hIAeDQkLQa/6QXsrrvI04Y6CAB9TtdUXqUpdN9SBk/9TuBIg2UxQNSQniGOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744256939; c=relaxed/simple;
	bh=4pQ0yCpOkvCzef8d6PUMlfXb7AgveMrFvBQMY7w5bJE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mrsm611bpks3tJuoBaYmpMSaxPxJvvj8o83z5gwp8bRPda0GbP2jVglLa8Jsd2UJLRlymbzPCzyI78ZwhSHtpmWNUNZSDJscQqJovoYjf/kJsnfUrurHWyDxwdzgteIBzBNpmBx77MsBQ/8urSHrMTWZCTvKnUePhi6u54hahN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=t2tqz7E5; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="t2tqz7E5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=NuOHOihSdxAhAsOO7Tz+6Gqb1rGv1U6I4lmfQywOTZ4=; b=t2tqz7E5cR7z+IdIdciZ+gvKZs
	kpf70PDcKWItZEOKfTLH3K2wQK7vwM7VfAYpihXk9e6grsGMmnS0MFzawQjijq/NNgeE6Rc/mmDE0
	N17FZF0VbTVNGsc+OwveqqOyfV9XC7tsjZxwI9j8J2cHHlf8zt6hYF7Umo3HcbwmT+R0j7jfmoZEv
	zxOZ1Pmwqome1uKVwgxFrtGRIt6XacblMOoUzZoXoQ63phHBJyai23nF85fjJ838ZPQYaED75EfyX
	//QKEpNQQp/iJ5oj+o68o+gIm/mn3aMdyBjrAHBWNqI0gQ/Zudiw5kcEy0FSrWZXgS1BE8fr9//U/
	rTK8QiqQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2iuI-00000002LEs-1tS4;
	Thu, 10 Apr 2025 03:48:50 +0000
Date: Thu, 10 Apr 2025 04:48:50 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Fan Ni <nifan.cxl@gmail.com>
Cc: muchun.song@linux.dev, mcgrof@kernel.org, a.manzanares@samsung.com,
	dave@stgolabs.net, akpm@linux-foundation.org, david@redhat.com,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/hugetlb: Convert &folio->page to folio_page(folio, 0)
Message-ID: <Z_c_onLZDJzqEeiu@casper.infradead.org>
References: <20250409004937.634713-1-nifan.cxl@gmail.com>
 <Z_XmUrbxKtYmzmJ6@casper.infradead.org>
 <Z_bvtonNQJ6HIPSA@debian>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_bvtonNQJ6HIPSA@debian>

On Wed, Apr 09, 2025 at 03:07:50PM -0700, Fan Ni wrote:
> On Wed, Apr 09, 2025 at 04:15:30AM +0100, Matthew Wilcox wrote:
> > >  		 */
> > > -		free_page_and_swap_cache(&new_folio->page);
> > > +		free_page_and_swap_cache(folio_page(new_folio, 0));
> > >  	}
> > 
> > free_page_and_swap_cache() should be converted to be
> > free_folio_and_swap_cache().
> 
> While looking into this function, I see it is defined as a macro in
> swap.h as below,
> #define free_page_and_swap_cache(page) \
>         put_page(page) 
> 
> While checking put_page() in include/linux.mm.h, it always converts page
> to folio, is there a reason why we do not take "folio" directly?

There are a lot of places to convert!

$ git grep '[^a-zA-Z_>]put_page(' |wc -l
472

... and that's after four years of doing folio conversions.

free_folio_and_swap_cache() should call folio_put() in the !CONFIG_SWAP
case.
