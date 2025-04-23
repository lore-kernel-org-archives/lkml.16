Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F9B2641D1
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 03:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745378141; cv=none; b=PF5rb3wC7RYuF5BRyRuZd4oBxRJWQ0yiLQjirwP001toI1Kb+vxa+4+so0kBuhK7pMahMVI5+HxYwxk1yVKlljywY6u8b+uUK3ogxZXPclZoA0zCqzy1LuP/C37WtPikLYeScokq5EQv6pDp1fFYrZr5S5VMjhJQb+VbABDQgJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745378141; c=relaxed/simple;
	bh=/jheJB+vrJsHs4j8yUppC9Kfn4hiqrKgUFw8sHnW8HA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cBcz58tluVLWCaRZ0ChiH8kkrCuRg79RgGiSkGsS3/LXwSu9XoqaUCVLltTw9IPQfwzUYSDJl14STo7xwOyxSOn0ffEzthzjZ7vSyOknLPWty+wEHXK3niC4dWBSOR30ypmXHDubygFNhGm4lgz9NpzDiDMGDHlH5N30ePt7gIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=oWA8Tu83; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="oWA8Tu83"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=daVrIe013KCmACuDIJhmGEiRt0jxJ27zL3NMUzVYjoU=; b=oWA8Tu834KdxdTQQs8prryXk33
	uYLfoD6nD9i7t6UpFr/LQ6pp/Up2uJPAVhMM4NAVDnFPFzFSucJulIRIoRjfpyxB9Zk0X5JF84Aps
	3p2BhV5D3Pio/upGu6IQjjG8Gv1ZVdUoRqif4Smi4H+uDkrBskrSxbtKqMnKOwt+RbPl+EmPcdjiP
	Z27/zZFNZUm7ZuWSTXIbSS9SgaDFMpP4IrraeF6EAhefU2ZTKKrxqLUun+UYO24nmkKXhvxJCE1dJ
	FLmh9tahne4EhEB+30mVUP8Jr4zJvpfgQGLZOqYXY2uTOwGId6NNU5mc+4qphOnV4KWGn5IlmBf+4
	/JhVbE9w==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Qa7-00000006z7Q-3Wyp;
	Wed, 23 Apr 2025 03:15:27 +0000
Date: Wed, 23 Apr 2025 04:15:27 +0100
From: Matthew Wilcox <willy@infradead.org>
To: nifan.cxl@gmail.com
Cc: muchun.song@linux.dev, mcgrof@kernel.org, a.manzanares@samsung.com,
	dave@stgolabs.net, akpm@linux-foundation.org, david@redhat.com,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Fan Ni <fan.ni@samsung.com>,
	Sidhartha Kumar <sidhartha.kumar@oracle.com>
Subject: Re: [PATCH v2 2/4] mm/hugetlb: Refactor unmap_hugepage_range() to
 take folio instead of page
Message-ID: <aAhbT2nzOyZ9b3ir@casper.infradead.org>
References: <20250418170834.248318-2-nifan.cxl@gmail.com>
 <20250418170834.248318-3-nifan.cxl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418170834.248318-3-nifan.cxl@gmail.com>

On Fri, Apr 18, 2025 at 09:57:40AM -0700, nifan.cxl@gmail.com wrote:
>  void unmap_hugepage_range(struct vm_area_struct *,
> -			  unsigned long, unsigned long, struct page *,
> +			  unsigned long, unsigned long, struct folio *folio,

I'm fine with leaving the vma and folio unnamed, but it is a crime
against our fellow programmers to leave the two 'unsigned long's
unnamed.  What the hell are they?

>  void unmap_hugepage_range(struct vm_area_struct *vma, unsigned long start,
> -			  unsigned long end, struct page *ref_page,
> +			  unsigned long end, struct folio *ref_folio,

... start and end.  I'd happily see a patch which only named those
parameters and left the struct folio unnamed.

> -	__unmap_hugepage_range(&tlb, vma, start, end, ref_page, zap_flags);
> +	__unmap_hugepage_range(&tlb, vma, start, end,
> +			       folio_page(ref_folio, 0), zap_flags);

I do not like this.  Why should we pass in the first page here?  It
seems to me that this is just "Now we will call a function which still
takes a struct page", and we *SHOULD* use &folio->page here to indicate
that we just haven't done the conversion yet.

