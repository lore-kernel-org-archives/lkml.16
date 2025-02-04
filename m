Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AAC521516C
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 17:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738689577; cv=none; b=QYdgG29NVFPwxRezHD7pfJHr4DISk4bFV1PsBEL85v3Fh+JUMBIxa+ANorTLIc3B8WJXTokbu4C3kUTzamcCAZVDpxSmRLK9p1vXXgPjtK5sxQ7ZPDSZ6rgdPq4Zys6I8q70Bfe19u1GicU6Er4C/IJB2WT1wep5CEP8AZv3IqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738689577; c=relaxed/simple;
	bh=LKDJ4ld8Cjq0z8KeEL0elDIxvLmnBQuTQLzCRS94aYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V9H3eT/Osjhp64OOrxFIdn9u+cu9ucZNNOw0tsfjOIIwkFLFG7aAhl8YFqWaB18FQsHMihz3sI21QTdqlIGq22xny8MhVYLpvPa7WsQPwFZWduVPcbR9P+s6T6xeQTgmihsBWoUw+6YWqnYfLiblIDUXC+P1q8Rb+zFMjrGXzqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=MB/zMxFa; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="MB/zMxFa"
Date: Tue, 4 Feb 2025 17:19:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738689572;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jtvZbfF3IKfSP8jRjX4cOz5aIG33zGLTl/L+bxRlWDY=;
	b=MB/zMxFaxQ4YvY31K8heB7QUOOfrZxHQr4Dtnppc3tYymcRgOT6eGd5Gc7Qja5MaHW/O64
	y74Ic1vnxKjG47uqwOZUKogvUEsrhXHgsuz5WVfGSRF6vFtkCvYK/PJepkqdYIe3L3UatW
	vXweVTJ6s/AHbrWtP+f2ecewmNSslD4=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yosry Ahmed <yosry.ahmed@linux.dev>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Minchan Kim <minchan@kernel.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCHv4 14/17] zsmalloc: make zspage lock preemptible
Message-ID: <Z6JMIKlO9U5P-5gE@google.com>
References: <20250131090658.3386285-1-senozhatsky@chromium.org>
 <20250131090658.3386285-15-senozhatsky@chromium.org>
 <Z5zxlRkdseEJntFk@google.com>
 <ecuos7w7m35fvzz7xvmvdvfxn7adzdahuulwn2j42mvjoqmlwi@ucel4kqetxg6>
 <Z6Ew9AWNHacRIfhA@google.com>
 <lxottj72e7jcqw634qwudpsyqckfrvpmlhra43en4zlrlz4cip@erufv6w4n5j6>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <lxottj72e7jcqw634qwudpsyqckfrvpmlhra43en4zlrlz4cip@erufv6w4n5j6>
X-Migadu-Flow: FLOW_OUT

On Tue, Feb 04, 2025 at 03:59:42PM +0900, Sergey Senozhatsky wrote:
> On (25/02/03 21:11), Yosry Ahmed wrote:
> > > > We also lose some debugging capabilities as Hilf pointed out in another
> > > > patch.
> > > 
> > > So that zspage lock should have not been a lock, I think, it's a ref-counter
> > > and it's being used as one
> > > 
> > > map()
> > > {
> > > 	page->users++;
> > > }
> > > 
> > > unmap()
> > > {
> > > 	page->users--;
> > > }
> > > 
> > > migrate()
> > > {
> > > 	if (!page->users)
> > > 		migrate_page();
> > > }
> > 
> > Hmm, but in this case we want migration to block new map/unmap
> > operations. So a vanilla refcount won't work.
> 
> Yeah, correct - migration needs negative values so that map would
> wait until it's positive (or zero).
> 
> > > > Just my 2c.
> > > 
> > > Perhaps we can sprinkle some lockdep on it.  For instance:
> > 
> > Honestly this looks like more reason to use existing lock primitives to
> > me. What are the candidates? I assume rw_semaphore, anything else?
> 
> Right, rwsem "was" the first choice.
> 
> > I guess the main reason you didn't use a rw_semaphore is the extra
> > memory usage.
> 
> sizeof(struct zs_page) change is one thing.  Another thing is that
> zspage->lock is taken from atomic sections, pretty much everywhere.
> compaction/migration write-lock it under pool rwlock and class spinlock,
> but both compaction and migration now EAGAIN if the lock is locked
> already, so that is sorted out.
> 
> The remaining problem is map(), which takes zspage read-lock under pool
> rwlock.  RFC series (which you hated with passion :P) converted all zsmalloc
> into preemptible ones because of this - zspage->lock is a nested leaf-lock,
> so it cannot schedule unless locks it's nested under permit it (needless to
> say neither rwlock nor spinlock permit it).

Hmm, so we want the lock to be preemtible, but we don't want to use an
existing preemtible lock because it may be held it from atomic context.

I think one problem here is that the lock you are introducing is a
spinning lock but the lock holder can be preempted. This is why spinning
locks do not allow preemption. Others waiting for the lock can spin
waiting for a process that is scheduled out.

For example, the compaction/migration code could be sleeping holding the
write lock, and a map() call would spin waiting for that sleeping task.

I wonder if there's a way to rework the locking instead to avoid the
nesting. It seems like sometimes we lock the zspage with the pool lock
held, sometimes with the class lock held, and sometimes with no lock
held.

What are the rules here for acquiring the zspage lock? Do we need to
hold another lock just to make sure the zspage does not go away from
under us? Can we use RCU or something similar to do that instead?

> 
> > Seems like it uses ~32 bytes more than rwlock_t on x86_64.
> > That's per zspage. Depending on how many compressed pages we have
> > per-zspage this may not be too bad.
> 
> So on a 16GB laptop our memory pressure test at peak used approx 1M zspages.
> That is 32 bytes * 1M ~ 32MB of extra memory use.  Not alarmingly a lot,
> less than what a single browser tab needs nowadays.  I suppose on 4GB/8GB
> that will be even smaller (because those device generate less zspages).
> Numbers are not the main issue, however.
> 
