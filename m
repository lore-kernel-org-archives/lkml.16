Received: from lgeamrelo03.lge.com (lgeamrelo03.lge.com [156.147.51.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7AA3230D01
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 07:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.147.51.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750406017; cv=none; b=HvOnqYEyjnogD4hBiDQ9zgmwmJeHWJqwr6dXGHBgE5GLR2wvTdtYb8LAcG4hbdmgChUY5KA4XpwCqppAR34xsan0ITlHBG8CVVdA9g0hnVnlUq6unN/zNIKvGFA5l7jEzI/yBIQTNTjrEY5dSMT7AAPJQlUwdbPQ41YaLKzYsKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750406017; c=relaxed/simple;
	bh=vL/sSjP0Ua2Rq0Zib1YO02JeVRDiVjBq52mWOSU1GfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LP3r0mFttYT9x55dOICXHwanRNLp6zrg61POVKUzQEVsLX026E0vgrbiTcrshBpWtzh9tR6fm219uHmakKgMzhQeg5px5xLw4Symnz57zMmIW/CkkPlhxqb1mo6mxqC9+9t3gFU/rBMJ5F6v6xwguITIJAvJ41EQbbpy0hdVJp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lge.com; spf=pass smtp.mailfrom=lge.com; arc=none smtp.client-ip=156.147.51.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lge.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lge.com
Received: from unknown (HELO yjaykim-PowerEdge-T330) (10.177.112.156)
	by 156.147.51.102 with ESMTP; 20 Jun 2025 16:53:26 +0900
X-Original-SENDERIP: 10.177.112.156
X-Original-MAILFROM: youngjun.park@lge.com
Date: Fri, 20 Jun 2025 16:53:26 +0900
From: YoungJun Park <youngjun.park@lge.com>
To: Kairui Song <kasong@tencent.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
	Hugh Dickins <hughd@google.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Matthew Wilcox <willy@infradead.org>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Chris Li <chrisl@kernel.org>, Nhat Pham <nphamcs@gmail.com>,
	Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>,
	linux-kernel@vger.kernel.org, gunho.lee@lge.com,
	taejoon.song@lge.com
Subject: Re: [PATCH v2 3/4] mm/shmem, swap: improve mthp swapin process
Message-ID: <aFUTdnPTT6m0GBX0@yjaykim-PowerEdge-T330>
References: <20250619175538.15799-1-ryncsn@gmail.com>
 <20250619175538.15799-4-ryncsn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619175538.15799-4-ryncsn@gmail.com>

On Fri, Jun 20, 2025 at 01:55:37AM +0800, Kairui Song wrote:
> +	if (skip_swapcache) {
> +		swapcache_clear(si, folio->swap, folio_nr_pages(folio));
> +		folio->swap.val = 0;
>  	}
> +	if (folio)
> +		folio_put(folio);
>  	put_swap_device(si);
 
I really appreciate the patch. great work!

It's a rather trivial point, but I was wondering if the following change
might make sense:
...
	if (skip_swapcache)
		swapcache_clear(si, folio->swap, folio_nr_pages(folio));

  	put_swap_device(si);

	if (folio)
		folio_put(folio);

	return error;
...

My intention here is to minimize the reference to si,
and from what I understand, this folio has already been allocated and would 
soon disappear. Is it possible to to reduce the clear operation?
(folio->swap.val = 0)

Just a small suggestion.
Thank you again for your work!

Regards,
Youngjun Park
