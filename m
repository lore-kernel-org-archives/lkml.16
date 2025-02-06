Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018A3148FED
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 16:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738858789; cv=none; b=Mi4E8j2RyTF8lEqLAT4Cq7uOaCmqh7CTx3dkrlcj0D5wyDZ35Yyp9FmeK/LJn/7KIIxVT26RdVo5NN+/6AdXipUnu2Yj7b/Cnf4PC9T/y1zw6lPohuopQtkJiR+D/OBNDr0f6TFUdqb5+T8B1P5l+jElZIy5+ePQqVGwU2IdW3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738858789; c=relaxed/simple;
	bh=TCMa5vOc1lsFBKQAcraKmNUqTIVgOctKNk553gbeqU0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PB3lOqcA8STlpbRcaltSoDQ+BAamXi0Q+kv4D92WosLru2KZavWis0sY4U5JqJUdI+yio1tzqT7J8F2+IDRrhDq0CLTTAW10UZiVA4inlbdVKZbsWo7CEiwaw2i06yE55lq3vXTj56x4avVS05rY/EgeSXlLiCNB7LFQRf1EDbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=UquEWaf5; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="UquEWaf5"
Date: Thu, 6 Feb 2025 16:19:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738858780;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Dw9izvEu2ay4lxLU8U0gIItbeRtUjvZQJv3a90hkz2I=;
	b=UquEWaf59i0M+nwUCj76hQpLZJanFuEgpUVS3M7VeK3JOuVoeF6Tzg23QGtJxblpp4jFUI
	nm7BAfUSRckrG4jRlkbEJHhFZCGP7PgGsjOQUZ/v7RosYyOR5h/rd4i/TAO9+KH/DBv0Eq
	4NA2ihZfooDhFPcqL9zCGaZntpkGS5Q=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yosry Ahmed <yosry.ahmed@linux.dev>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Minchan Kim <minchan@kernel.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCHv4 14/17] zsmalloc: make zspage lock preemptible
Message-ID: <Z6ThGFt6wyNpx9xi@google.com>
References: <20250131090658.3386285-1-senozhatsky@chromium.org>
 <20250131090658.3386285-15-senozhatsky@chromium.org>
 <Z5zxlRkdseEJntFk@google.com>
 <ecuos7w7m35fvzz7xvmvdvfxn7adzdahuulwn2j42mvjoqmlwi@ucel4kqetxg6>
 <Z6Ew9AWNHacRIfhA@google.com>
 <lxottj72e7jcqw634qwudpsyqckfrvpmlhra43en4zlrlz4cip@erufv6w4n5j6>
 <Z6JMIKlO9U5P-5gE@google.com>
 <6vtpamir4bvn3snlj36tfmnmpcbd6ks6m3sdn7ewmoles7jhau@nbezqbnoukzv>
 <Z6O2oPP7lyRGXer_@google.com>
 <6uhsj4bckhursiblkxe54azfgyqal6tq2de3lpkxw6omkised6@uylodcjruuei>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6uhsj4bckhursiblkxe54azfgyqal6tq2de3lpkxw6omkised6@uylodcjruuei>
X-Migadu-Flow: FLOW_OUT

On Thu, Feb 06, 2025 at 12:05:55PM +0900, Sergey Senozhatsky wrote:
> On (25/02/05 19:06), Yosry Ahmed wrote:
> > > > For example, the compaction/migration code could be sleeping holding the
> > > > write lock, and a map() call would spin waiting for that sleeping task.
> > > 
> > > write-lock holders cannot sleep, that's the key part.
> > > 
> > > So the rules are:
> > > 
> > > 1) writer cannot sleep
> > >    - migration/compaction runs in atomic context and grabs
> > > 	 write-lock only from atomic context
> > >    - write-locking function disables preemption before lock(), just to be
> > > 	 safe, and enables it after unlock()
> > > 
> > > 2) writer does not spin waiting
> > >    - that's why there is only write_try_lock function
> > > 	  - compaction and migration bail out when they cannot lock the
> > > 		zspage
> > > 
> > > 3) readers can sleep and can spin waiting for a lock
> > >    - other (even preempted) readers don't block new readers
> > >    - writers don't sleep, they always unlock
> > 
> > That's useful, thanks. If we go with custom locking we need to document
> > this clearly and add debug checks where possible.
> 
> Sure.  That's what it currently looks like (can always improve)
> 
> ---
> /*
>  * zspage lock permits preemption on the reader-side (there can be multiple
>  * readers).  Writers (exclusive zspage ownership), on the other hand, are
>  * always run in atomic context and cannot spin waiting for a (potentially
>  * preempted) reader to unlock zspage.  This, basically, means that writers
>  * can only call write-try-lock and must bail out if it didn't succeed.
>  *
>  * At the same time, writers cannot reschedule under zspage write-lock,
>  * so readers can spin waiting for the writer to unlock zspage.
>  */
> static void zspage_read_lock(struct zspage *zspage)
> {
>         atomic_t *lock = &zspage->lock;
>         int old = atomic_read_acquire(lock);
> 
>         do {
>                 if (old == ZS_PAGE_WRLOCKED) {
>                         cpu_relax();
>                         old = atomic_read_acquire(lock);
>                         continue;
>                 }
>         } while (!atomic_try_cmpxchg_acquire(lock, &old, old + 1));
> 
> #ifdef CONFIG_DEBUG_LOCK_ALLOC
>         rwsem_acquire_read(&zspage->lockdep_map, 0, 0, _RET_IP_);
> #endif
> }
> 
> static void zspage_read_unlock(struct zspage *zspage)
> {
>         atomic_dec_return_release(&zspage->lock);
> 
> #ifdef CONFIG_DEBUG_LOCK_ALLOC
>         rwsem_release(&zspage->lockdep_map, _RET_IP_);
> #endif
> }
> 
> static bool zspage_try_write_lock(struct zspage *zspage)
> {
>         atomic_t *lock = &zspage->lock;
>         int old = ZS_PAGE_UNLOCKED;
> 
>         preempt_disable();
>         if (atomic_try_cmpxchg_acquire(lock, &old, ZS_PAGE_WRLOCKED)) {
> #ifdef CONFIG_DEBUG_LOCK_ALLOC
>                 rwsem_acquire(&zspage->lockdep_map, 0, 0, _RET_IP_);
> #endif
>                 return true;
>         }
> 
>         preempt_enable();
>         return false;
> }
> 
> static void zspage_write_unlock(struct zspage *zspage)
> {
>         atomic_set_release(&zspage->lock, ZS_PAGE_UNLOCKED);
> #ifdef CONFIG_DEBUG_LOCK_ALLOC
>         rwsem_release(&zspage->lockdep_map, _RET_IP_);
> #endif
>         preempt_enable();
> }
> ---
> 
> Maybe I'll just copy-paste the locking rules list, a list is always cleaner.

Thanks. I think it would be nice if we could also get someone with
locking expertise to take a look at this.

> 
> > > > I wonder if there's a way to rework the locking instead to avoid the
> > > > nesting. It seems like sometimes we lock the zspage with the pool lock
> > > > held, sometimes with the class lock held, and sometimes with no lock
> > > > held.
> > > > 
> > > > What are the rules here for acquiring the zspage lock?
> > > 
> > > Most of that code is not written by me, but I think the rule is to disable
> > > "migration" be it via pool lock or class lock.
> > 
> > It seems like we're not holding either of these locks in
> > async_free_zspage() when we call lock_zspage(). Is it safe for a
> > different reason?
> 
> I think we hold size class lock there. async-free is only for pages that
> reached 0 usage ratio (empty fullness group), so they don't hold any
> objects any more and from her such zspages either get freed or
> find_get_zspage() recovers them from fullness 0 and allocates an object.
> Both are synchronized by size class lock.
> 
> > > Hmm, I don't know... zsmalloc is not "read-mostly", it's whatever data
> > > patterns the clients have.   I suspect we'd need to synchronize RCU every
> > > time a zspage is freed: zs_free() [this one is complicated], or migration,
> > > or compaction?  Sounds like anti-pattern for RCU?
> > 
> > Can't we use kfree_rcu() instead of synchronizing? Not sure if this
> > would still be an antipattern tbh.
> 
> Yeah, I don't know.  The last time I wrongly used kfree_rcu() it caused a
> 27% performance drop (some internal code).  This zspage thingy maybe will
> be better, but still has a potential to generate high numbers of RCU calls,
> depends on the clients.  Probably the chances are too high.  Apart from
> that, kvfree_rcu() can sleep, as far as I understand, so zram might have
> some extra things to deal with, namely slot-free notifications which can
> be called from softirq, and always called under spinlock:
> 
>  mm slot-free -> zram slot-free -> zs_free -> empty zspage -> kfree_rcu
> 
> > It just seems like the current locking scheme is really complicated :/
> 
> That's very true.

Seems like we have to compromise either way, custom locking or we enter
into a new complexity realm with RCU freeing.
