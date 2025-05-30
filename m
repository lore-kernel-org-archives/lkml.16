Received: from gentwo.org (gentwo.org [62.72.0.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B4E239E9A
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 19:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.72.0.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748631928; cv=none; b=FcRv5MfgKwtLa0qQHmb5HPugjJWxm9e4CJDuA9Vd8JMatlsBo9KOwQ55tikpnKazutfrXAs/CyYNk3OflorHsBE/8gZSyypdbN31zD44/R3Ru9S2HE/jzzUvKolEgBahKpyzP/AzAPVr4i6DqjE4xs+QzFlylhqwNah/1Mn3HJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748631928; c=relaxed/simple;
	bh=FPavw7sqDjydt0KkrExoi1d1jz+U3kS/8aP4jA7ihx4=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=WDEVwDn4k9clFLwtwd9JYNtehZMaq2GuA0L5ClMWzTLnGVGyDkKbz5zqC58F+sOMMDhp3UxDBkzgRZbXTtDYxQuX+49jOZCdNBI+A7GNizHOdnOMxUqITH3MOAtOejDb82HWgV0KDtr09xpHXc2ryJTmIgQ7XofuO7NNrqkBoIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org; spf=pass smtp.mailfrom=gentwo.org; dkim=pass (1024-bit key) header.d=gentwo.org header.i=@gentwo.org header.b=g6w5DUvT; arc=none smtp.client-ip=62.72.0.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentwo.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gentwo.org header.i=@gentwo.org header.b="g6w5DUvT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1748631920;
	bh=FPavw7sqDjydt0KkrExoi1d1jz+U3kS/8aP4jA7ihx4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=g6w5DUvTpdL8zcx969b95fWzFDAExBM3zGbcT5KJh/I7jyjsRRPsjxkCTd4E9B79E
	 yg2pmj9DmZlNoaGZsfEcx36gD6xidMk4ZPfLhfajaogx4IjWmfCRZ+VNuRXMs0kWs7
	 shszV5ABvs46waSeVhngnjIttRTu7RCwKNJ7qilg=
Received: by gentwo.org (Postfix, from userid 1003)
	id 45F094025D; Fri, 30 May 2025 12:05:20 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id 43D13401E9;
	Fri, 30 May 2025 12:05:20 -0700 (PDT)
Date: Fri, 30 May 2025 12:05:20 -0700 (PDT)
From: "Christoph Lameter (Ampere)" <cl@gentwo.org>
To: Vlastimil Babka <vbabka@suse.cz>
cc: David Rientjes <rientjes@google.com>, 
    Andrew Morton <akpm@linux-foundation.org>, 
    Roman Gushchin <roman.gushchin@linux.dev>, 
    Harry Yoo <harry.yoo@oracle.com>, Matthew Wilcox <willy@infradead.org>, 
    linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] mm, slab: support NUMA policy for large kmalloc
In-Reply-To: <b8a5dc9d-3697-47b3-bf66-f9bd726389fb@suse.cz>
Message-ID: <17a999f3-7e6b-17d4-2caf-4912221894ec@gentwo.org>
References: <20250529-frozen-pages-for-large-kmalloc-v1-0-b3aa52a8fa17@suse.cz> <20250529-frozen-pages-for-large-kmalloc-v1-2-b3aa52a8fa17@suse.cz> <e391fe8a-6bef-4067-86d8-b75ece441b75@gentwo.org> <b8a5dc9d-3697-47b3-bf66-f9bd726389fb@suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 29 May 2025, Vlastimil Babka wrote:

> On 5/29/25 16:57, Christoph Lameter (Ampere) wrote:
> > On Thu, 29 May 2025, Vlastimil Babka wrote:
> >
> >> The slab allocator observes the task's numa policy in various places
> >> such as allocating slab pages. Large kmalloc allocations currently do
> >> not, which seems to be an unintended omission. It is simple to correct
> >> that, so make ___kmalloc_large_node() behave the same way as
> >> alloc_slab_page().
> >
> > Large kmalloc allocation lead to the use of the page allocator which
> > implements the NUMA policies for the allocations.
> >
> > This patch is not necessary.
>
> I'm confused, as that's only true depending on which page allocator entry
> point you use. AFAICS before this series, it's using
> alloc_pages_node_noprof() which only does
>
>
>         if (nid == NUMA_NO_NODE)
>                 nid = numa_mem_id();
>
> and no mempolicies.

That is a bug.

> I see this patch as analogical to your commit 1941b31482a6 ("Reenable NUMA
> policy support in the slab allocator")
>
> Am I missing something?

The page allocator has its own NUMA suport.

The patch to reenable NUMA support dealt with an issue within the
allocator where the memory policies were ignored.

It seems that the error was repeated for large kmalloc allocations.
Instead of respecting memory allocation policies the allocation is forced
to be local to the node.

The forcing to the node is possible with GFP_THISNODE. The default needs
to be following memory policies.


