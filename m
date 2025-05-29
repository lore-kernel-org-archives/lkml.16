Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62531362
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 15:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748533609; cv=none; b=Dlq8prD2DgTwQBf91ufomkgh+G+QFVqruc4gFtaMUA4qqPA76HmHZClA2UXOwDOdyfBKvZCasYrlGCLaZ0/pKiNiB1NyMhW2AIGsAu4FFX2LZtxMhzWg8kGYPQi8dI+WXNNoUNEYbbBUsR+zaN6LjFAuap+JU++fR/2n7Wt4Ge8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748533609; c=relaxed/simple;
	bh=KN41wj3BNBiMnM1F9KLMnCDGIk5c635d5ZuJ2xgrepY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tNF70A+UEL44xlZU+HAuiRK/KtmxjhbWHjWYoMY6yqzuoqaB859FbOnbSDLbbmgfUt6cYYPzEhFgXc7y6JITknGmhJrp9TMsCnXTtOKf92VD6YClz837mykkFtyoVuzMYVrk2rYmOjAc4OTy+XqbkXkAWHNGXEeS/RTjW2FCWBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=mEbWOO4g; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="mEbWOO4g"
Date: Thu, 29 May 2025 15:46:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748533604;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eFCrQ4MA3Ql2DJrcPlXg6MIgdM2XiPph+P34wKI3KVc=;
	b=mEbWOO4gf7LLl4/uum/hHOTTfbaBYHsD4NbdD5Ws6eW/wEG7DPeYeI1BccoG7UVfvc899S
	4fVN0JSHzdblnaurxY/oF5tVuCTOVmIg1gyF3FrhsB+LBbaftQk+2AyLR3BmIxgU09W2dN
	oO64eGezp84UJJBC0eOpFNsOWc+T8Dg=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Roman Gushchin <roman.gushchin@linux.dev>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Christoph Lameter <cl@linux.com>, David Rientjes <rientjes@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Harry Yoo <harry.yoo@oracle.com>,
	Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] mm, slab: use frozen pages for large kmalloc
Message-ID: <aDiBUr38QArXjO6v@google.com>
References: <20250529-frozen-pages-for-large-kmalloc-v1-0-b3aa52a8fa17@suse.cz>
 <20250529-frozen-pages-for-large-kmalloc-v1-1-b3aa52a8fa17@suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250529-frozen-pages-for-large-kmalloc-v1-1-b3aa52a8fa17@suse.cz>
X-Migadu-Flow: FLOW_OUT

On Thu, May 29, 2025 at 10:56:26AM +0200, Vlastimil Babka wrote:
> Since slab pages are now frozen, it makes sense to have large kmalloc()
> objects behave same as small kmalloc(), as the choice between the two is
> an implementation detail depending on allocation size.
> 
> Notably, increasing refcount on a slab page containing kmalloc() object
> is not possible anymore, so it should be consistent for large kmalloc
> pages.
> 
> Therefore, change large kmalloc to use the frozen pages API.
> 
> Because of some unexpected fallout in the slab pages case (see commit
> b9c0e49abfca ("mm: decline to manipulate the refcount on a slab page"),
> implement the same kind of checks and warnings as part of this change.
> 
> Notably, networking code using sendpage_ok() to determine whether the
> page refcount can be manipulated in the network stack should continue
> behaving correctly. Before this change, the function returns true for
> large kmalloc pages and page refcount can be manipulated. After this
> change, the function will return false.
> 
> Signed-off-by: Vlastimil Babka <vbabka@suse.cz>

Acked-by: Roman Gushchin <roman.gushchin@linux.dev>

> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index bf55206935c467f7508e863332063bb15f904a24..d3eb6adf9fa949fbd611470182a03c743b16aac7 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -1549,6 +1549,8 @@ static inline void get_page(struct page *page)
>  	struct folio *folio = page_folio(page);
>  	if (WARN_ON_ONCE(folio_test_slab(folio)))
>  		return;
> +	if (WARN_ON_ONCE(folio_test_large_kmalloc(folio)))
> +		return;
>  	folio_get(folio);

I guess eventually we can convert them to VM_WARN_ON_ONCE()?
