Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C254C8F
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 03:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738811163; cv=none; b=SZ/n5sSOPZTQ2sDkhwqyMxmLl45T7/gL8iVkTgEypyHEju4q+RZwKNxVGw9uoAFTdkP4rrL7NEi+egiZ2iB8+YGoDfN03yaDyVXKzreiOVAdmSUZ4CqYdoj2RG0k1JvNBadqwUZNUnu0bcsHsiRRb2hrYy2xu6Pq+9rVFY+Ear8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738811163; c=relaxed/simple;
	bh=RZuRfqgKcYp5urs+wcRI0TDNHLqDfRDYhwmHqnbYv5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pu31kGUiIaEK44AlZCdo2bhkpXg63hCwOuyoBudvahr7xeNO++pO1gXarVuPgiQlSzABLs16JiQD2i1qwUp+ClRwP0adDg/l3uBru/bp5+COq/eG7+SpPigGPbGgR2trlq/SndkrwgW03fzH6wr591s+tm5ORDmSGmrTL6mBxeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Lwd1wosQ; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Lwd1wosQ"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-21f0b5d6c6eso6439905ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 19:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738811161; x=1739415961; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kdKNX1BvstXeCC6f1zyDXr/amOzxwNFbB+FhJgAdwVk=;
        b=Lwd1wosQzdHbDvKGMfPxG0iM/8+hSwXotQAlPb0xG4gkYmU7w8B2nmWdV6xe2om9g0
         zDa7oxIzuTf1i8VM5nUZ6MbQlXcGUGrhSzcizJ9H51MFx5iDHLweIozteDXzgbYS/7hb
         ww34fBFqj12rqfeMh68ktJnX1UqQyvwcATnzM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738811161; x=1739415961;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kdKNX1BvstXeCC6f1zyDXr/amOzxwNFbB+FhJgAdwVk=;
        b=Q2ZBjucqDcaG7wgXTRJyPDHBe32o5CSGhiNMN+WtbXn+hQH2DhUyH9vawZK9l45cRb
         uYchCHvcbGtsOWFTWBNeqRuAuxsulJ1cAZkGfxCGwwoVbmpT6Oij9G79pM+BBz9LlIKu
         KhsCHZp3ACUPjuzTFlc0PRdT2zhUbicLOVhnu64x63DK2aLocjxsVyTPS4qKKSnTSLCY
         /o/B0xtAJrIBNWlRN1k9IhW9ZtWJBa1Q9g6tATEwWTUfFVcsfwCdjmTG6Vm/uaV/pjW/
         Dtb7JnKLgZl2eXNIArjgmsE5fqKnGR7MBznkESTBvWE5gmP7Jv79/UnKFrsXi4UQdc3q
         bbCw==
X-Forwarded-Encrypted: i=1; AJvYcCVEKGCXXhR3mzaks4cGlyN1CK5CMdo/+H8opxac1VMF9fxWO+lkeHreYNZPk3NcZxgQ9MGkLDkxbmc/SkM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKWmF6ph1IJx8JQNRR6gfnjCTswnJHEn+VCXGUQPtUdWSrR81d
	JdatFaN32njdlbHwDMAwrRungz026td1W15MAvh7y7Dbwf7xzAxj6EOQNKncDw==
X-Gm-Gg: ASbGnctG13jD2cs1RTzcvi2POxmntmiHQQWfHNhMu2V6N//tF1d933IT8VFEdv5OqVo
	gcgHem/D3dzaCh8LBfbNKtkc8qeABydhCxYaaEu7H1n/3Q5Ck6dUQlt2tnl5dlEvQE3SfS6oTEA
	mkzQUK7VnP9gjg5UeWPcfaznPt4Qglj2b2bHNuG11Q2x6maJFqI0KPdLsit3IyyGx0N8j/6N4Wp
	r6UvVoZ9JUxeYbGkBItz/eHTSyAaTHLMoFHjr4Dn6Ko/P0FcrU0aoUOoBGCfUX4t0X6mZMEY8JX
	JJFv8nL0v6mbBzti7x0=
X-Google-Smtp-Source: AGHT+IF1h9QqWx8Ax9GduzvfjPC6Hk2SaCzVPxPlrH6rugnohOtxNvQlMN4PYWLIBEwOzz2PYVh21g==
X-Received: by 2002:a17:902:f60e:b0:215:742e:5cff with SMTP id d9443c01a7336-21f2f1a3d3dmr33958385ad.16.1738811160877;
        Wed, 05 Feb 2025 19:06:00 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:b2ad:5851:6fc0:11a4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f36552068sm1455385ad.87.2025.02.05.19.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 19:06:00 -0800 (PST)
Date: Thu, 6 Feb 2025 12:05:55 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Yosry Ahmed <yosry.ahmed@linux.dev>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Minchan Kim <minchan@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCHv4 14/17] zsmalloc: make zspage lock preemptible
Message-ID: <6uhsj4bckhursiblkxe54azfgyqal6tq2de3lpkxw6omkised6@uylodcjruuei>
References: <20250131090658.3386285-1-senozhatsky@chromium.org>
 <20250131090658.3386285-15-senozhatsky@chromium.org>
 <Z5zxlRkdseEJntFk@google.com>
 <ecuos7w7m35fvzz7xvmvdvfxn7adzdahuulwn2j42mvjoqmlwi@ucel4kqetxg6>
 <Z6Ew9AWNHacRIfhA@google.com>
 <lxottj72e7jcqw634qwudpsyqckfrvpmlhra43en4zlrlz4cip@erufv6w4n5j6>
 <Z6JMIKlO9U5P-5gE@google.com>
 <6vtpamir4bvn3snlj36tfmnmpcbd6ks6m3sdn7ewmoles7jhau@nbezqbnoukzv>
 <Z6O2oPP7lyRGXer_@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6O2oPP7lyRGXer_@google.com>

On (25/02/05 19:06), Yosry Ahmed wrote:
> > > For example, the compaction/migration code could be sleeping holding the
> > > write lock, and a map() call would spin waiting for that sleeping task.
> > 
> > write-lock holders cannot sleep, that's the key part.
> > 
> > So the rules are:
> > 
> > 1) writer cannot sleep
> >    - migration/compaction runs in atomic context and grabs
> > 	 write-lock only from atomic context
> >    - write-locking function disables preemption before lock(), just to be
> > 	 safe, and enables it after unlock()
> > 
> > 2) writer does not spin waiting
> >    - that's why there is only write_try_lock function
> > 	  - compaction and migration bail out when they cannot lock the
> > 		zspage
> > 
> > 3) readers can sleep and can spin waiting for a lock
> >    - other (even preempted) readers don't block new readers
> >    - writers don't sleep, they always unlock
> 
> That's useful, thanks. If we go with custom locking we need to document
> this clearly and add debug checks where possible.

Sure.  That's what it currently looks like (can always improve)

---
/*
 * zspage lock permits preemption on the reader-side (there can be multiple
 * readers).  Writers (exclusive zspage ownership), on the other hand, are
 * always run in atomic context and cannot spin waiting for a (potentially
 * preempted) reader to unlock zspage.  This, basically, means that writers
 * can only call write-try-lock and must bail out if it didn't succeed.
 *
 * At the same time, writers cannot reschedule under zspage write-lock,
 * so readers can spin waiting for the writer to unlock zspage.
 */
static void zspage_read_lock(struct zspage *zspage)
{
        atomic_t *lock = &zspage->lock;
        int old = atomic_read_acquire(lock);

        do {
                if (old == ZS_PAGE_WRLOCKED) {
                        cpu_relax();
                        old = atomic_read_acquire(lock);
                        continue;
                }
        } while (!atomic_try_cmpxchg_acquire(lock, &old, old + 1));

#ifdef CONFIG_DEBUG_LOCK_ALLOC
        rwsem_acquire_read(&zspage->lockdep_map, 0, 0, _RET_IP_);
#endif
}

static void zspage_read_unlock(struct zspage *zspage)
{
        atomic_dec_return_release(&zspage->lock);

#ifdef CONFIG_DEBUG_LOCK_ALLOC
        rwsem_release(&zspage->lockdep_map, _RET_IP_);
#endif
}

static bool zspage_try_write_lock(struct zspage *zspage)
{
        atomic_t *lock = &zspage->lock;
        int old = ZS_PAGE_UNLOCKED;

        preempt_disable();
        if (atomic_try_cmpxchg_acquire(lock, &old, ZS_PAGE_WRLOCKED)) {
#ifdef CONFIG_DEBUG_LOCK_ALLOC
                rwsem_acquire(&zspage->lockdep_map, 0, 0, _RET_IP_);
#endif
                return true;
        }

        preempt_enable();
        return false;
}

static void zspage_write_unlock(struct zspage *zspage)
{
        atomic_set_release(&zspage->lock, ZS_PAGE_UNLOCKED);
#ifdef CONFIG_DEBUG_LOCK_ALLOC
        rwsem_release(&zspage->lockdep_map, _RET_IP_);
#endif
        preempt_enable();
}
---

Maybe I'll just copy-paste the locking rules list, a list is always cleaner.

> > > I wonder if there's a way to rework the locking instead to avoid the
> > > nesting. It seems like sometimes we lock the zspage with the pool lock
> > > held, sometimes with the class lock held, and sometimes with no lock
> > > held.
> > > 
> > > What are the rules here for acquiring the zspage lock?
> > 
> > Most of that code is not written by me, but I think the rule is to disable
> > "migration" be it via pool lock or class lock.
> 
> It seems like we're not holding either of these locks in
> async_free_zspage() when we call lock_zspage(). Is it safe for a
> different reason?

I think we hold size class lock there. async-free is only for pages that
reached 0 usage ratio (empty fullness group), so they don't hold any
objects any more and from her such zspages either get freed or
find_get_zspage() recovers them from fullness 0 and allocates an object.
Both are synchronized by size class lock.

> > Hmm, I don't know... zsmalloc is not "read-mostly", it's whatever data
> > patterns the clients have.   I suspect we'd need to synchronize RCU every
> > time a zspage is freed: zs_free() [this one is complicated], or migration,
> > or compaction?  Sounds like anti-pattern for RCU?
> 
> Can't we use kfree_rcu() instead of synchronizing? Not sure if this
> would still be an antipattern tbh.

Yeah, I don't know.  The last time I wrongly used kfree_rcu() it caused a
27% performance drop (some internal code).  This zspage thingy maybe will
be better, but still has a potential to generate high numbers of RCU calls,
depends on the clients.  Probably the chances are too high.  Apart from
that, kvfree_rcu() can sleep, as far as I understand, so zram might have
some extra things to deal with, namely slot-free notifications which can
be called from softirq, and always called under spinlock:

 mm slot-free -> zram slot-free -> zs_free -> empty zspage -> kfree_rcu

> It just seems like the current locking scheme is really complicated :/

That's very true.
