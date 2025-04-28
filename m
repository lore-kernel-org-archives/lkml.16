Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8481E871
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 00:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745800913; cv=none; b=IgiiUo15/D6ZV0jhfGc03HqbqB5pv+pYYA6an17JFhXdmcGCiadX9ewVVe9fc3yvlyrgVkqzRh7gyfIQG1Eogaf8BvMfSaxyCcE5f4FYhQtXtr+xd+vy8YQd31hXQBHST5OMl+ib16BUQNaNodGlo991fTBA06zwwWs4R7DDmFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745800913; c=relaxed/simple;
	bh=h9V+Kckt76dLZbMTsqC/ZgzrPo60w+N4S9MQ4Li+LWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C5ZsiKnzV5re/Gqs8pzUMQQwxLnLExT97YuVBSvS7HbNEhNSRJqrFl4Axu/8p4gD0KUm9td7wW1jaqckuzKuLHjmlc8v0+u4wZaqa2GwDL6tqfzWC5shqxfObDEDmKM1khe7XlPgN4104oLwE4PhO9VuDHSf0w3c4wg+gDCMXc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Mo3kSFvf; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Mo3kSFvf"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=253L+dW9y0+QF5H9qTod08othC3elXAsaDjNWZPWCTA=; b=Mo3kSFvffHgcBoR6oiqGDtF0P5
	w+d9253RXguB+P2thF+PBLBSLNsf3EkfjJrT3Am+iaMktxc9xCfS5Y+mFc2iJR4Q1bVoBMBYySPoE
	2R5U8HtEtmrCRbvRYzoOMp1H05FKBx1FvZB+9dafCjPzvllYUbvkOh98r5/qc5XwHsbkM0kmg7+y2
	DzTUWZbuliI3fXbJ8isBd9fxtxCQ9R+ZsFY+M8WB7k/9Y4Q5R4dURLgtKHrA5Bd7c72xc4A4e9PeD
	SjQauGX6woHk6tz+TEN5Q8UCyWIaP4FnURJCGDSHKQnNCK/V+k7C+ZkSADMkmZ9zIvuryMQM9g0X4
	z4cJXfNw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9CYq-00000004j3f-3Jrm;
	Mon, 28 Apr 2025 00:41:28 +0000
Date: Mon, 28 Apr 2025 01:41:28 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Kairui Song <kasong@tencent.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Hugh Dickins <hughd@google.com>, Chris Li <chrisl@kernel.org>,
	Yosry Ahmed <yosryahmed@google.com>,
	"Huang, Ying" <ying.huang@linux.alibaba.com>,
	Nhat Pham <nphamcs@gmail.com>, Johannes Weiner <hannes@cmpxchg.org>,
	linux-kernel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Subject: Re: [PATCH 3/6] f2fs: drop usage of folio_index
Message-ID: <aA7OuBS___7N4o8f@casper.infradead.org>
References: <20250427185908.90450-1-ryncsn@gmail.com>
 <20250427185908.90450-4-ryncsn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250427185908.90450-4-ryncsn@gmail.com>

On Mon, Apr 28, 2025 at 02:59:05AM +0800, Kairui Song wrote:
> folio_index is only needed for mixed usage of page cache and swap
> cache, for pure page cache usage, the caller can just use
> folio->index instead.
> 
> It can't be a swap cache folio here.  Swap mapping may only call into fs
> through `swap_rw` and that is not supported for f2fs.  So just drop it
> and use folio->index instead.
> 
> Signed-off-by: Kairui Song <kasong@tencent.com>
> Cc: Jaegeuk Kim <jaegeuk@kernel.org> (maintainer:F2FS FILE SYSTEM)
> Cc: Chao Yu <chao@kernel.org> (maintainer:F2FS FILE SYSTEM)
> Cc: linux-f2fs-devel@lists.sourceforge.net (open list:F2FS FILE SYSTEM)
> Signed-off-by: Kairui Song <kasong@tencent.com>

Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>

> @@ -130,7 +130,7 @@ int f2fs_read_inline_data(struct inode *inode, struct folio *folio)
>  		return -EAGAIN;
>  	}
>  
> -	if (folio_index(folio))
> +	if (folio->index)
>  		folio_zero_segment(folio, 0, folio_size(folio));
>  	else
>  		f2fs_do_read_inline_data(folio, ipage);

This hunk is going to conflict with a pair of patches I sent to f2fs-devel
a few weeks ago.  I don't think there's any escaping it, just a heads-up.

