Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE421FF7BF
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 19:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738782382; cv=none; b=sBogqLYaJjeA/vEtGva74zsPqmLpH2Y3DOZ4jTDC8gmSHvHGv+GZeDfWc8qLe6YuWnpwE8cg4nZOLt8oxtspeljmHj3i0Xf3XC6DxgQpJOeRfHfY7GFk7Ks7yeLGjRvoXHau3oH7viqfTAyLGjKEkeUIyL10HYI1+wKcUVT+8OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738782382; c=relaxed/simple;
	bh=aXdGXiIL4O2JcYMxAmytNrlnCzCGz9l9qX3xHYYctQk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MN78ORuDuay0O7AWu/i2UN1/QU6hDlnArqT5jHJlSM0T7wNb9rLf6lqLEZzB1/eeqh5LcSHmpACBNKPSrNr2Z3dliHZky3O7lOyLZCuHpwK4c4EmIZ2rVTg2TEWDVwdIjBBzuy4aVChZLVg4XbYlif1RMhYmSpPdvAcksbKpRzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=RaYKHMk6; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="RaYKHMk6"
Date: Wed, 5 Feb 2025 19:06:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738782373;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TZnjECvRPRLfx0ZfOm8La4P4ThFoINb5xgu2oElZf/k=;
	b=RaYKHMk6xI+AgIZbFCN5f6ZRaT57E3ez9d8PXrQCQX3299zQnr0OZJ/Uo8A8j/PDU6lljx
	x+6uN2g9pRusSRNK7v8qHX+LSlpVD3U8CJnFvFXb2g/Gu6e+1RAZvXTADS7DMKrffMDnVO
	FNC0XC3u33RCmKzQn3Q9dwk18J52CnU=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yosry Ahmed <yosry.ahmed@linux.dev>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Minchan Kim <minchan@kernel.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCHv4 14/17] zsmalloc: make zspage lock preemptible
Message-ID: <Z6O2oPP7lyRGXer_@google.com>
References: <20250131090658.3386285-1-senozhatsky@chromium.org>
 <20250131090658.3386285-15-senozhatsky@chromium.org>
 <Z5zxlRkdseEJntFk@google.com>
 <ecuos7w7m35fvzz7xvmvdvfxn7adzdahuulwn2j42mvjoqmlwi@ucel4kqetxg6>
 <Z6Ew9AWNHacRIfhA@google.com>
 <lxottj72e7jcqw634qwudpsyqckfrvpmlhra43en4zlrlz4cip@erufv6w4n5j6>
 <Z6JMIKlO9U5P-5gE@google.com>
 <6vtpamir4bvn3snlj36tfmnmpcbd6ks6m3sdn7ewmoles7jhau@nbezqbnoukzv>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6vtpamir4bvn3snlj36tfmnmpcbd6ks6m3sdn7ewmoles7jhau@nbezqbnoukzv>
X-Migadu-Flow: FLOW_OUT

On Wed, Feb 05, 2025 at 11:43:16AM +0900, Sergey Senozhatsky wrote:
> On (25/02/04 17:19), Yosry Ahmed wrote:
> > > sizeof(struct zs_page) change is one thing.  Another thing is that
> > > zspage->lock is taken from atomic sections, pretty much everywhere.
> > > compaction/migration write-lock it under pool rwlock and class spinlock,
> > > but both compaction and migration now EAGAIN if the lock is locked
> > > already, so that is sorted out.
> > > 
> > > The remaining problem is map(), which takes zspage read-lock under pool
> > > rwlock.  RFC series (which you hated with passion :P) converted all zsmalloc
> > > into preemptible ones because of this - zspage->lock is a nested leaf-lock,
> > > so it cannot schedule unless locks it's nested under permit it (needless to
> > > say neither rwlock nor spinlock permit it).
> > 
> > Hmm, so we want the lock to be preemtible, but we don't want to use an
> > existing preemtible lock because it may be held it from atomic context.
> > 
> > I think one problem here is that the lock you are introducing is a
> > spinning lock but the lock holder can be preempted. This is why spinning
> > locks do not allow preemption. Others waiting for the lock can spin
> > waiting for a process that is scheduled out.
> > 
> > For example, the compaction/migration code could be sleeping holding the
> > write lock, and a map() call would spin waiting for that sleeping task.
> 
> write-lock holders cannot sleep, that's the key part.
> 
> So the rules are:
> 
> 1) writer cannot sleep
>    - migration/compaction runs in atomic context and grabs
> 	 write-lock only from atomic context
>    - write-locking function disables preemption before lock(), just to be
> 	 safe, and enables it after unlock()
> 
> 2) writer does not spin waiting
>    - that's why there is only write_try_lock function
> 	  - compaction and migration bail out when they cannot lock the
> 		zspage
> 
> 3) readers can sleep and can spin waiting for a lock
>    - other (even preempted) readers don't block new readers
>    - writers don't sleep, they always unlock

That's useful, thanks. If we go with custom locking we need to document
this clearly and add debug checks where possible.

> 
> > I wonder if there's a way to rework the locking instead to avoid the
> > nesting. It seems like sometimes we lock the zspage with the pool lock
> > held, sometimes with the class lock held, and sometimes with no lock
> > held.
> > 
> > What are the rules here for acquiring the zspage lock?
> 
> Most of that code is not written by me, but I think the rule is to disable
> "migration" be it via pool lock or class lock.

It seems like we're not holding either of these locks in
async_free_zspage() when we call lock_zspage(). Is it safe for a
different reason?

> 
> > Do we need to hold another lock just to make sure the zspage does not go
> > away from under us?
> 
> Yes, the page cannot go away via "normal" path:
>    zs_free(last object) -> zspage becomes empty -> free zspage
> 
> so when we have active mapping() it's only migration and compaction
> that can free zspage (its content is migrated and so it becomes empty).
> 
> > Can we use RCU or something similar to do that instead?
> 
> Hmm, I don't know... zsmalloc is not "read-mostly", it's whatever data
> patterns the clients have.   I suspect we'd need to synchronize RCU every
> time a zspage is freed: zs_free() [this one is complicated], or migration,
> or compaction?  Sounds like anti-pattern for RCU?

Can't we use kfree_rcu() instead of synchronizing? Not sure if this
would still be an antipattern tbh. It just seems like the current
locking scheme is really complicated :/
