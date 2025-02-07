Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1256D1B4250
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 21:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738962597; cv=none; b=G+Cvl/mBuUDaOCeN68qmwBlO4PyGHUJXcudfMHXAKMf9KvvSe/1HDqBNx/thR/kAQ94FfndZxDuqPg3SGXnUBp5CFzTuxwOSx50YrsxIfq/j145M3iBjmvAm+dHKkYoib4gUMoufLt9lVHF+sjyfM8hfJGze6vSOpKYtfuZwqfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738962597; c=relaxed/simple;
	bh=MJTg8hpVFBHQ/npSF/5ikGDsPPTpustuNWyYODM4Alo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C0gxdb+13+/nSnX2tf1QCdLDjP0IfvqdjcPj6JQ0VeQCMI8aI0+TnMg+GFHg/oHMHQVUGXUuZG0MVphPFBwjI6INYMOW7nKrO9kFpWsNT8dc0WUEU4LXLyJ/cgh1UmqEZm9dArqTcboCe9n9Nvzfjf7Z9hCYUIYYI3sBAFUmBF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=o5djMBXf; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="o5djMBXf"
Date: Fri, 7 Feb 2025 21:09:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738962587;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Y0IYLcO/SDzdPLiV4EJvNLZilSU93JdpocbHr5k0iDA=;
	b=o5djMBXfFodf23BMRBdPvNipOtyxbOhRBMrQmJ7IaT1jhArHD4+YHG3FNFLqQX0rnrjRRK
	sZQltdUbL0juQ+V7iuDi0fxk96+fKxuf0auVqIW1ENR4XIz/6EoyvLMI8w89KqmIv66tgx
	LjBtCYJ70j1pBU5zs32AscbQ2mf0Li0=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yosry Ahmed <yosry.ahmed@linux.dev>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Minchan Kim <minchan@kernel.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Kairui Song <ryncsn@gmail.com>
Subject: Re: [PATCHv4 14/17] zsmalloc: make zspage lock preemptible
Message-ID: <Z6Z2l9uovxAiED6q@google.com>
References: <Z5zxlRkdseEJntFk@google.com>
 <ecuos7w7m35fvzz7xvmvdvfxn7adzdahuulwn2j42mvjoqmlwi@ucel4kqetxg6>
 <Z6Ew9AWNHacRIfhA@google.com>
 <lxottj72e7jcqw634qwudpsyqckfrvpmlhra43en4zlrlz4cip@erufv6w4n5j6>
 <Z6JMIKlO9U5P-5gE@google.com>
 <6vtpamir4bvn3snlj36tfmnmpcbd6ks6m3sdn7ewmoles7jhau@nbezqbnoukzv>
 <Z6O2oPP7lyRGXer_@google.com>
 <6uhsj4bckhursiblkxe54azfgyqal6tq2de3lpkxw6omkised6@uylodcjruuei>
 <Z6ThGFt6wyNpx9xi@google.com>
 <wnffho5jguo24wfy3qv5tvovoargezbu4kcvpk43ludrhyfo6i@6ogtvk5ivfjc>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <wnffho5jguo24wfy3qv5tvovoargezbu4kcvpk43ludrhyfo6i@6ogtvk5ivfjc>
X-Migadu-Flow: FLOW_OUT

On Fri, Feb 07, 2025 at 11:48:55AM +0900, Sergey Senozhatsky wrote:
> On (25/02/06 16:19), Yosry Ahmed wrote:
> > > static void zspage_read_lock(struct zspage *zspage)
> > > {
> > >         atomic_t *lock = &zspage->lock;
> > >         int old = atomic_read_acquire(lock);
> > > 
> > >         do {
> > >                 if (old == ZS_PAGE_WRLOCKED) {
> > >                         cpu_relax();
> > >                         old = atomic_read_acquire(lock);
> > >                         continue;
> > >                 }
> > >         } while (!atomic_try_cmpxchg_acquire(lock, &old, old + 1));
> > > 
> > > #ifdef CONFIG_DEBUG_LOCK_ALLOC
> > >         rwsem_acquire_read(&zspage->lockdep_map, 0, 0, _RET_IP_);
> > > #endif
> > > }
> > > 
> > > static void zspage_read_unlock(struct zspage *zspage)
> > > {
> > >         atomic_dec_return_release(&zspage->lock);
> > > 
> > > #ifdef CONFIG_DEBUG_LOCK_ALLOC
> > >         rwsem_release(&zspage->lockdep_map, _RET_IP_);
> > > #endif
> > > }
> > > 
> > > static bool zspage_try_write_lock(struct zspage *zspage)
> > > {
> > >         atomic_t *lock = &zspage->lock;
> > >         int old = ZS_PAGE_UNLOCKED;
> > > 
> > >         preempt_disable();
> > >         if (atomic_try_cmpxchg_acquire(lock, &old, ZS_PAGE_WRLOCKED)) {
> > > #ifdef CONFIG_DEBUG_LOCK_ALLOC
> > >                 rwsem_acquire(&zspage->lockdep_map, 0, 0, _RET_IP_);
> > > #endif
> > >                 return true;
> > >         }
> > > 
> > >         preempt_enable();
> > >         return false;
> > > }
> > > 
> > > static void zspage_write_unlock(struct zspage *zspage)
> > > {
> > >         atomic_set_release(&zspage->lock, ZS_PAGE_UNLOCKED);
> > > #ifdef CONFIG_DEBUG_LOCK_ALLOC
> > >         rwsem_release(&zspage->lockdep_map, _RET_IP_);
> > > #endif
> > >         preempt_enable();
> > > }
> > > ---
> > > 
> > > Maybe I'll just copy-paste the locking rules list, a list is always cleaner.
> > 
> > Thanks. I think it would be nice if we could also get someone with
> > locking expertise to take a look at this.
> 
> Sure.
> 
> I moved the lockdep acquire/release before atomic ops (except for try),
> as was suggested by Sebastian in zram sub-thread.
> 
> [..]
> > Seems like we have to compromise either way, custom locking or we enter
> > into a new complexity realm with RCU freeing.
> 
> Let's take the blue pill? :)

Can we do some perf testing to make sure this custom locking is not
regressing performance (selfishly I'd like some zswap testing too)?

Perhaps Kairui can help with that since he was already testing this
series.
