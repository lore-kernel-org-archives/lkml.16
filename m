Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD3617ADF7
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 21:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738617089; cv=none; b=pMM+M/+qGBmSi7KJ8LWfSIZVV0KWxSSyMjwEdNm1DOoKNzBdnQJlao7JW503kGH4HAMc3nqKyylXXMWUdKwB1s2VoBMiUg/+wXpMncSO3kxiR5xe7FOKb9IURFSOxynsx1BGJheiL2AnnYBltCXuMV0+DavlCHlK1fNxPHDTg/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738617089; c=relaxed/simple;
	bh=4gXkvNvo+lt8veo5SfuTA6qHw33Rq884O8O9IPzUbOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MRh/3Hh1RVMxlYZD9Wv09fazdIxHC59YMiuEc8GqHhOKSI5O5J19t/Z9jcYSipl1P81BqFM3yqqXw6oIY1f7pSfJ9q3DMkDAOESfFmXn3EpzYJYAETRs7PH4ua+TvPIECSVcARBTdjiH1xd1kEJWvYPiMGNLgSoXwCwy6HavG8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=u+vLNvVj; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="u+vLNvVj"
Date: Mon, 3 Feb 2025 21:11:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738617084;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jnXiGEsRLvwqZF8PATt6EDp1c9/m1BOHmpU4ny8u7CA=;
	b=u+vLNvVjQka6QnN381FMvUXEjlpKoy0O5E7ZWr8J1jmLeeoBpBS06gL+H/JZ17Tt+VImT9
	rIMMYrvZyyty2S/x4fkTwqpsOrBuzl67xWS4v/w5fgmvwEyowo61R2zLR0LsSSaLMF70vG
	0XzRgNjz5QdRE/k+I4HWJRjuzIJLl+8=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yosry Ahmed <yosry.ahmed@linux.dev>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Minchan Kim <minchan@kernel.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCHv4 14/17] zsmalloc: make zspage lock preemptible
Message-ID: <Z6Ew9AWNHacRIfhA@google.com>
References: <20250131090658.3386285-1-senozhatsky@chromium.org>
 <20250131090658.3386285-15-senozhatsky@chromium.org>
 <Z5zxlRkdseEJntFk@google.com>
 <ecuos7w7m35fvzz7xvmvdvfxn7adzdahuulwn2j42mvjoqmlwi@ucel4kqetxg6>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ecuos7w7m35fvzz7xvmvdvfxn7adzdahuulwn2j42mvjoqmlwi@ucel4kqetxg6>
X-Migadu-Flow: FLOW_OUT

On Mon, Feb 03, 2025 at 12:13:49PM +0900, Sergey Senozhatsky wrote:
> On (25/01/31 15:51), Yosry Ahmed wrote:
> > > +static void zspage_read_lock(struct zspage *zspage)
> > > +{
> > > +	atomic_t *lock = &zspage->lock;
> > > +	int old = atomic_read(lock);
> > > +
> > > +	do {
> > > +		if (old == ZS_PAGE_WRLOCKED) {
> > > +			cpu_relax();
> > > +			old = atomic_read(lock);
> > > +			continue;
> > > +		}
> > > +	} while (!atomic_try_cmpxchg(lock, &old, old + 1));
> > > +}
> > > +
> > > +static void zspage_read_unlock(struct zspage *zspage)
> > > +{
> > > +	atomic_dec(&zspage->lock);
> > > +}
> > > +
> > > +static bool zspage_try_write_lock(struct zspage *zspage)
> > > +{
> > > +	atomic_t *lock = &zspage->lock;
> > > +	int old = ZS_PAGE_UNLOCKED;
> > > +
> > > +	preempt_disable();
> > > +	if (atomic_try_cmpxchg(lock, &old, ZS_PAGE_WRLOCKED))
> > 
> > FWIW, I am usually afraid to manually implement locking like this. For
> > example, queued_spin_trylock() uses atomic_try_cmpxchg_acquire() not
> > atomic_try_cmpxchg(), and I am not quite sure what could happen without
> > ACQUIRE semantics here on some architectures.
> 
> I looked into it a bit, wasn't sure either.  Perhaps we can switch
> to acquire/release semantics, I'm not an expert on this, would highly
> appreciate help.
> 
> > We also lose some debugging capabilities as Hilf pointed out in another
> > patch.
> 
> So that zspage lock should have not been a lock, I think, it's a ref-counter
> and it's being used as one
> 
> map()
> {
> 	page->users++;
> }
> 
> unmap()
> {
> 	page->users--;
> }
> 
> migrate()
> {
> 	if (!page->users)
> 		migrate_page();
> }

Hmm, but in this case we want migration to block new map/unmap
operations. So a vanilla refcount won't work.

> 
> > Just my 2c.
> 
> Perhaps we can sprinkle some lockdep on it.  For instance:

Honestly this looks like more reason to use existing lock primitives to
me. What are the candidates? I assume rw_semaphore, anything else?

I guess the main reason you didn't use a rw_semaphore is the extra
memory usage. Seems like it uses ~32 bytes more than rwlock_t on x86_64.
That's per zspage. Depending on how many compressed pages we have
per-zspage this may not be too bad.

For example, if a zspage has a chain length of 4, and the average
compression ratio of 1/3, that's 12 compressed pages so the extra
overhead is <3 bytes per compressed page.

Given that the chain length is a function of the class size, I think we
can calculate the exact extra memory overhead per-compressed page for
each class and get a mean/median over all classes.

If the memory overhead is insignificant I'd rather use exisitng lock
primitives tbh.
