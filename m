Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753001F37D6
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 19:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738351038; cv=none; b=pX0DI+K0IMyfxjOmhG9Z+BK20koVuxTDAVfCuh4jZCBAzyySdgfpkAEDql7A2S7Pf3Aiarms7k6R9QXpylqPS+zQsruE+PkqOggPngvMaaZFaVCiBU3CR0pt8gBQ/uEDEdbpJdRgjaHrlNGythZZdBh/2e3cnYrmHe3HgQi2Cjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738351038; c=relaxed/simple;
	bh=+INORLqOlyntJmAVonlWAUbrcuOfczPkBf4NEkg/74Q=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bb0zTQc4cpfnI98A4hSgE17oFlkSyOHwXiBpos5fcUIPD8YeDUXYQhL9xUsg7rZ+1aG5PVU7YBs9uQyB5H6Tbd7OEwCrmnJM+CaT8UJVRun5DV1BKVY6GsXWm9v3Cgn0X5tFdVeAbqpgQ5gCK0XL/UdaTIJtsx80UOH4jwb+ke8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=VoNnT4D8; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="VoNnT4D8"
Date: Fri, 31 Jan 2025 11:17:07 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738351033;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xb9vx+i3/j7E+ZJZlUO26diQjP2jWbKmw33LsH60EFQ=;
	b=VoNnT4D8EQRl/F1SNHKZ8SgmJxynUcxK0Ct0DoCeNhjBywjd57zM8Svhx6d7YhJRDdUdHX
	0TBntXMpcv/A3mmy7b3YsnKjgodSn5MyT1lVzCIiABVLNDlzNUAEF13NAurrghfQMvpjkY
	pIVTAg3Hjo4Mo+1i+nrw7T5DNM3Ghio=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Shakeel Butt <shakeel.butt@linux.dev>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Davidlohr Bueso <dave@stgolabs.net>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	SeongJae Park <sj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Vlastimil Babka <vbabka@suse.cz>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org
Subject: Re: [RFC PATCH v2 4/4] mm/madvise: remove redundant mmap_lock
 operations from process_madvise()
Message-ID: <porudk3upzmecss7afnve4gzmw2klwdlqfsyoqwa3j5jqritni@gwyql37fnbnw>
References: <20250117013058.1843-1-sj@kernel.org>
 <20250117013058.1843-5-sj@kernel.org>
 <aeeac6f3-f828-4bee-966f-c8df41df30bc@lucifer.local>
 <20250131173132.uqjwrzj7e5vx2sbv@offworld>
 <7k2gs6xmx2q7la6kle5xpn2p2f6bccbiv5lrdowp5hnecxpijx@rzwxdhcl6mc2>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7k2gs6xmx2q7la6kle5xpn2p2f6bccbiv5lrdowp5hnecxpijx@rzwxdhcl6mc2>
X-Migadu-Flow: FLOW_OUT

On Fri, Jan 31, 2025 at 12:47:24PM -0500, Liam R. Howlett wrote:
> * Davidlohr Bueso <dave@stgolabs.net> [250131 12:31]:
> > On Fri, 31 Jan 2025, Lorenzo Stoakes wrote:
> > 
> > > On Thu, Jan 16, 2025 at 05:30:58PM -0800, SeongJae Park wrote:
> > > > Optimize redundant mmap lock operations from process_madvise() by
> > > > directly doing the mmap locking first, and then the remaining works for
> > > > all ranges in the loop.
> > > > 
> > > > Signed-off-by: SeongJae Park <sj@kernel.org>
> > > 
> > > I wonder if this might increase lock contention because now all of the
> > > vector operations will hold the relevant mm lock without releasing after
> > > each operation?
> > 
> > That was exactly my concern. While afaict the numbers presented in v1
> > are quite nice, this is ultimately a micro-benchmark, where no other
> > unrelated threads are impacted by these new hold times.
> 
> Indeed, I was also concerned about this scenario.
> 
> But this method does have the added advantage of keeping the vma space
> in the same state as it was expected during the initial call - although
> the race does still exist on looking vs acting on the data.  This would
> just remove the intermediate changes.
> 
> > 
> > > Probably it's ok given limited size of iov, but maybe in future we'd want
> > > to set a limit on the ranges before we drop/reacquire lock?
> > 
> > imo, this should best be done in the same patch/series. Maybe extend
> > the benchmark to use IOV_MAX and find a sweet spot?
> 
> Are you worried this is over-engineering for a problem that may never be
> an issue, or is there a particular usecase you have in mind?
> 
> It is probably worth investigating, and maybe a potential usecase would
> help with the targeted sweet spot?
> 
> 

Lorenzo already explained that it is not an issue at the moment. I think
this is good discussion to have as I think we will be expanding the
limit from UIO_FASTIOV to higher value (maybe UIO_MAXIOV) soon in the
followup. At the moment, my gut feeling is that batch size of regions
given to the syscall will depend on the advise parameter. For example,
For MADV_[NO]HUGEPAGE which is a simple flag [re]set, a single write
lock and possible a single tree traversal will be better than multiple
write lock/unlock operations even for large batch size. Anyways we will
need some experimental data to show that.

JFYI SJ is planning to work on two improvements: (1) single tree
traversal for all the given regions and (2) TLB flush batching for
MADV_DONTNEED[_LOCKED] and MADV_FREE.

Thanks everyone for your time and feedback.
