Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573C31AA1F6
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 10:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745318806; cv=none; b=iY8sQGWYH/vTwrkl3H8no3SwKVc95MrvuJF33miQBdC3aUV+ohGlWlR91wotPC/wscUq6CnAc2lY/Iebc/Xg/pEdkJs/5KvyF6w19FTyjdAcmQnJN0tBhjKnpH2pHMDmIvkhyOFt9qp4auxVIKr8x3SM6/XuymCYhBq7y14A1JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745318806; c=relaxed/simple;
	bh=lkurGvLM3NbLgVEvf1sWmNsUDlwWWP8NqvTq58krGS4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MD/em778mf9bkPRRdAh1JA3CseG9AUV1m42+33vMPnney5ygx0UptPhi7WANGh7XJRGzsmTnCJuD/Ty6x7ZFYvO2OKDmGC40EeCA/RuWzAjSur5yTxgUC0yhV7S53+nZ3ndpIsRfG+XneYieVmJVN1NqgIT70+EQ/ZdjAupXmqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=miMNCAR3; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="miMNCAR3"
Date: Tue, 22 Apr 2025 03:46:37 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745318802;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FfMzRLSs+8lRBIeEFG2VVjbT/oMYw0LTAXoAVAslB68=;
	b=miMNCAR32+Xd6Nn8Tm5JQJAh8tjMgw8I2PiwFPRcPMa0WjGS1OAY4JW0RisTK+9cNToWuK
	6ML4v+dfXokivPsL9AsBRwLBfLIKKsxAb7lmGzNsNBTsHmt2B0kFmoIY/gnA7d5Tnwf3zr
	RBdF6Yha+P79+cgdhHJfl6KJC/+7BiU=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yosry Ahmed <yosry.ahmed@linux.dev>
To: Vitaly Wool <vitaly.wool@konsulko.se>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org, Nhat Pham <nphamcs@gmail.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Igor Belousov <igor.b@beldev.am>, Minchan Kim <minchan@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH v4] mm: add zblock allocator
Message-ID: <aAdzjdv674Jn6G63@Asmaa.>
References: <20250412154207.2152667-1-vitaly.wool@konsulko.se>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250412154207.2152667-1-vitaly.wool@konsulko.se>
X-Migadu-Flow: FLOW_OUT

On Sat, Apr 12, 2025 at 05:42:07PM +0200, Vitaly Wool wrote:
> zblock is a special purpose allocator for storing compressed pages.
> It stores integer number of same size objects per its block. These
> blocks consist of several physical pages (2**n, i. e. 1/2/4/8).
> 
> With zblock, it is possible to densely arrange objects of various sizes
> resulting in low internal fragmentation. Also this allocator tries to
> fill incomplete blocks instead of adding new ones, in many cases
> providing a compression ratio comparable to zmalloc's.
> 
> zblock is also in most cases superior to zsmalloc with regard to
> average performance and worst execution times, thus allowing for better
> response time and real-time characteristics of the whole system.
> 
> High memory and page migration are currently not supported by zblock.
> 
> Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.se>
> Signed-off-by: Igor Belousov <igor.b@beldev.am>

Please CC me when sending zswap-related patches, not sure how you're
picking the CC list. Also, CC'ing the zsmalloc maintainers here for the
discussion of adding a new allocator vs improving zsmalloc.

I didn't look too closely but I generally agree that we should improve
zsmalloc where possible rather than add a new allocator. We are trying
not to repeat the zbud/z3fold or slub/slob stories here. Zsmalloc is
getting a lot of mileage from both zswap and zram, and is more-or-less
battle-tested. Let's work toward building upon that instead of starting
over.
