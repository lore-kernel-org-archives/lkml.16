Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319D32C9D
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 19:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738178440; cv=none; b=rq6j4THqZQXRH+rT2a8E+dh858G5+xabGAYOkeBOff2TuEM2HGgRvBsdPliPCrYxud43eYjCNH2r5m2qS4RuFpEL/mmBYGdKwYYbqvAuL0UEXeZ5n+DYm2O6tnreSYM6T+OC8jgbzEtv5HNt1JaqXGdtzMfsl0TCw6CqTIqMaAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738178440; c=relaxed/simple;
	bh=xpm+IYkqEluhzn33Buftlz2yHfGbXAyQnyIBuMliYDk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hx+iamI2PdItunyBQeibVlcZwk6O3JWxf2qKyP+6So6CqIoa3KaUROhoUwkaFAkD9PMnIjndvxVc8hrtlwhw2N7Bpenknd2hhReUJ8lcfRjYl+JqtR8mdLpb0HZ/C4lOR4ruCZF5zhD7QSFpzu4dR1cIXVN8TFbgwv0VkMwddZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=jWc7fi/j; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="jWc7fi/j"
Date: Wed, 29 Jan 2025 11:20:31 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738178437;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dVfi/dTHPs7fAFzBlVL18EGXZ9RjijFFos9d+B9MW2o=;
	b=jWc7fi/jHLIVYi8rZsPktrL0KPI0mB9qZihR0QDqprcLNAoEg+EZzsVGktZ2ALtpRTpcwx
	pSgeUtLcIBaM+h5yfJFoqLCq0G+vmhn+B3Bx9VErQH+UFT9liQSkUkhoSaGcHqko4N2V2M
	aeW1N7duaf9T1KjyOyeI5gUFSZYxKeQ=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Shakeel Butt <shakeel.butt@linux.dev>
To: SeongJae Park <sj@kernel.org>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org
Subject: Re: [RFC PATCH v2 4/4] mm/madvise: remove redundant mmap_lock
 operations from process_madvise()
Message-ID: <tegdrecvkmmd5pkm77kaepl6yserrlbp5ujzzuosrqx5ivcdnr@lv5gldamle2e>
References: <20250117013058.1843-1-sj@kernel.org>
 <20250117013058.1843-5-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250117013058.1843-5-sj@kernel.org>
X-Migadu-Flow: FLOW_OUT

On Thu, Jan 16, 2025 at 05:30:58PM -0800, SeongJae Park wrote:
> Optimize redundant mmap lock operations from process_madvise() by
> directly doing the mmap locking first, and then the remaining works for
> all ranges in the loop.
> 
> Signed-off-by: SeongJae Park <sj@kernel.org>

Reviewed-by: Shakeel Butt <shakeel.butt@linux.dev>
