Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F041922E6
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 19:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738178347; cv=none; b=ku43asDjAxBucRFDmA2xY/Reo8VBdqOngLmODAUl486p74Kk34z2Vhq/Tzb8bbAZpM0MBI7JbhaFI9JCkTuIIypfo50aH0CTFkeZHqEYnTXCn9SPcHFBzh7fROig4XNm3SVl6IaDvSgRYIodpE8oQ6GiuQtoFXgpNwrbqzO8bsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738178347; c=relaxed/simple;
	bh=Ck07Iv4yL9u83P5zpPp9iKntKJxwAWrmQOKcYg8dvyo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nbdXOXoYVEu8Ft4X7wLIpc/WlYFXLwsCE1ysvXk5nL2XDTdXLD85LnlkmJ63hvZux/HU35QADj/uIaRXCAB6RsXh5BmYH2YRQI/595NMnsRO1uoJsPhunAUJgrvcBNvG17ruZoZ6k8jZ/hVUQr+qQyw9lVQaafK4SAPI5KT7EHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=lJBBE28Q; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="lJBBE28Q"
Date: Wed, 29 Jan 2025 11:18:52 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738178337;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Zfj0A/bCT/x1UTkHIuylmeZr+mgjd3JoKm0EhUJfTY8=;
	b=lJBBE28QU5mZYF56YXhh+rlXaS/N+NIQ4OKhQhRzWkKkSyfZaf3OBr4OSxBFnfzqaqhJUz
	oJBoiKErkAySpC8nf+EaiRoOOTs83nehgV2eGYt0Ot9LIsR4Ik8f5AuzNHkoHHI8GdbrsT
	/SvO5GnZuvj/BNkruI+LZhy024r3W0c=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Shakeel Butt <shakeel.butt@linux.dev>
To: SeongJae Park <sj@kernel.org>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org
Subject: Re: [RFC PATCH v2 2/4] mm/madvise: split out madvise input validity
 check
Message-ID: <yub3fsxseqj3pgfumzbrxtuqlve4gfyhvjqvvn4bdqc22xm7df@e4wb4tcbaapj>
References: <20250117013058.1843-1-sj@kernel.org>
 <20250117013058.1843-3-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250117013058.1843-3-sj@kernel.org>
X-Migadu-Flow: FLOW_OUT

On Thu, Jan 16, 2025 at 05:30:56PM -0800, SeongJae Park wrote:
> Split out the madvise parameters validation logic from do_madvise(), for
> easy reuse of the logic from a future change.
> 
> Signed-off-by: SeongJae Park <sj@kernel.org>

Reviewed-by: Shakeel Butt <shakeel.butt@linux.dev>
