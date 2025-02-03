Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8724414
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 21:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738616431; cv=none; b=bJpEDEmXBjKXBixEWuX9e3f0MZxqIn/uopFVfbG/t+Vninnz1fBAAIFGjfTrQETLdYQCXPwVyo8vYTC/MPNspgmKoBgViN71HRMID7Us5p0KPfvDHwSf/Mv5bQ8PbjfI+3l2ZRU2mt8o2Ktj5Rtv/LNQ7czLzpyYz+StVA+tAoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738616431; c=relaxed/simple;
	bh=+uJ6N1cKqz9Ntnhy+CS6+Gdh2bOdfEEM7ptB9oJoDPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rKC1PhLMCIj7o+95sDEXnYQYwe4djDwO9uWjKHCNFLoBxmko5Jto7xFG6jrASqFAnHx2JWiXspyeSxCE/5CHc/k2rqS/9T7cXtGgKEIOe9euO1wn63zcSnzSDPHtDVfVa3xP6wt25lXQ1O1J30Mm6p+gui1tGD/tdBmoetnzwRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=UJDdq/2Q; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="UJDdq/2Q"
Date: Mon, 3 Feb 2025 21:00:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738616425;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aLdV15NRl0A+BEDG+yB9164T+p0gJQmGB2cu693YgDk=;
	b=UJDdq/2QNwdV4YEyCEJLTQXfxGV2E4TztWsI5lgigp7tgj0rYic/NPSowSd9z79zED0p3T
	o4sNJAIr84sQ+pknI7/fs0ekH0oxZIKPMMTYm1ifdcaUkoxhJhCNe8pN5tm9/zE7qfUVyq
	2xcR5UoSZAPdTL77tiLz/O6xr3BYMbI=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yosry Ahmed <yosry.ahmed@linux.dev>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Kairui Song <ryncsn@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Minchan Kim <minchan@kernel.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCHv4 02/17] zram: do not use per-CPU compression streams
Message-ID: <Z6EuZPYy_OOKu8JC@google.com>
References: <20250131090658.3386285-1-senozhatsky@chromium.org>
 <20250131090658.3386285-3-senozhatsky@chromium.org>
 <CAMgjq7BFUrUY5Xq5Eks4ibqbWgJcca1vqB4kq=otQVyG=23FRw@mail.gmail.com>
 <ryc3rgu567q44d3ck4un5itf77i2os4rqx3ruohivaqscn3rrt@ms5xoipyi72q>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ryc3rgu567q44d3ck4un5itf77i2os4rqx3ruohivaqscn3rrt@ms5xoipyi72q>
X-Migadu-Flow: FLOW_OUT

On Mon, Feb 03, 2025 at 12:49:42PM +0900, Sergey Senozhatsky wrote:
> On (25/02/01 17:21), Kairui Song wrote:
> > This seems will cause a huge regression of performance on multi core
> > systems, this is especially significant as the number of concurrent
> > tasks increases:
> > 
> > Test build linux kernel using ZRAM as SWAP (1G memcg):
> > 
> > Before:
> > + /usr/bin/time make -s -j48
> > 2495.77user 2604.77system 2:12.95elapsed 3836%CPU (0avgtext+0avgdata
> > 863304maxresident)k
> > 
> > After:
> > + /usr/bin/time make -s -j48
> > 2403.60user 6676.09system 3:38.22elapsed 4160%CPU (0avgtext+0avgdata
> > 863276maxresident)k
> 
> How many CPUs do you have?  I assume, preemption gets into way which is
> sort of expected, to be honest...  Using per-CPU compression streams
> disables preemption and uses CPU exclusively at a price of other tasks
> not being able to run.  I do tend to think that I made a mistake by
> switching zram to per-CPU compression streams.

FWIW, I am not familiar at all with the zram code but zswap uses per-CPU
acomp contexts with a mutex instead of a spinlock. So the task uses the
context of the CPU that it started on, but it can be preempted or
migrated and end up running on a different CPU. This means that
contention is still possible, but probably much lower than having a
shared pool of contexts that all CPUs compete on.

Again, this could be irrelevant as I am not very familiar with the zram
code, just thought this may be useful.
