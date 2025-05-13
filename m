Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F393517FAC2
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 06:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747116094; cv=none; b=kVkQntwZV8VJt3f6f5RqheUKIdNmuUAFihnN2nEBTGP9qqEbHgqezv+5KGSd8RmOwmtsjULnGJ0QI4m+vsVW5U1b9GA62utlrjVHnV6tmLcTQGNMeF/xrKyJ6TkOoi0Ntrhj9VA2UPErysZYDRbFRONqTSK95XpiDFf9DI6i3Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747116094; c=relaxed/simple;
	bh=A9+ePvYxBnyCpeSa++Q34/8DfLYzSgwHO2oMji9uOIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X9on96CDrqYIJXpyGl7glNMl+kvuxNqAo9994W9COkQobAbukLUXOUL7q9PPiRPpJa3ZyjP5enfUZ61QqzlMfEQpS6xQo7hZwiRdh/AV9u09NgB3RgNMktt/+bJ5j5YL6N9WkYmrNqRZxXHEMA7n/0FZxhXMw//bkIBlynnNYBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=QgWBWBZx; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="QgWBWBZx"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=A9+ePvYxBnyCpeSa++Q34/8DfLYzSgwHO2oMji9uOIQ=; b=QgWBWBZxk5kchoGsEbfFc5YWrc
	tsUszgBF82Jg6HPTRlcKrwDQmLalAjZ+ko+mhlrfLcsPf1BTzYxz6XeHZyR27xJ/26bgEXdC+6KQo
	TbYk8JfE2+DMkt+qKPq4v2b9RdodX7GtY7VjiIyKgif+f1Vu4Q2Zc9Qhrn7DSkUgWD02H8O/cT84J
	q8oda3E5fA349eQHdRw/Q/P843fKjXgFNviL756KpO3AJymNsazO845/BcPHtYCzpxdFn1XcQLLr2
	LBgkZI2mTXv81xLStUpvcqEJgkuglhtwgnajJBKc6EZwvsp2bY3YYXxYCKBUjwr4FM6Zin4aPXNCa
	mOaIFYAA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEiho-0000000BSQc-1Rge;
	Tue, 13 May 2025 06:01:32 +0000
Date: Mon, 12 May 2025 23:01:32 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH 1/2] f2fs: use vmalloc instead of kvmalloc in
 .init_{,de}compress_ctx
Message-ID: <aCLgPLUiFsiCzSBK@infradead.org>
References: <20250513055721.2918793-1-chao@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513055721.2918793-1-chao@kernel.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Tue, May 13, 2025 at 01:57:20PM +0800, Chao Yu wrote:
> .init_{,de}compress_ctx uses kvmalloc() to alloc memory, it will try
> to allocate physically continuous page first, it may cause more memory
> allocation pressure, let's use vmalloc instead to mitigate it.

Shouldn't this be handled in kvmalloc instead of working around it in
callers?

