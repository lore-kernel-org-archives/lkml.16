Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF1F156968
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 07:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738828031; cv=none; b=Eur/k8F+l9m63gE2ecuKVlP4wwrUw71ZRNMeqri4F5BRPdjvA79Dwx1Jpe2uzWIe6Bw/XUF8TP50Ic43HzMCrkShTc87i1xC4G3aiVThoKln3S1lJSfb3ATM7hbB3OhKjbCplc09PopQCvTxXYpXZ1O3/BpLMRXSTfMLoxUU6YU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738828031; c=relaxed/simple;
	bh=zPJWMPt/N02vQSRF79vFxDV4zUaF4imCzlvRWODmNSI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=omGy1XUV2TgwKLH5k8HglKyBnQGedV8Ajz13vPA+DbLtbO5xwSAqaNzm8L207sxd1x4HQpHGWbdzhGSq9MadCzWyCH7OSoic5BHDPJALvzCvUr7BJiQN6rOPBgZeHLs5CZEQTrSWGJalWjee0J2lpkiL58j+Et5qkXM4TyntvVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Hbtsxf6q; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Hbtsxf6q"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-21f301269cdso9989365ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 23:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738828029; x=1739432829; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=biMRc3fGoaOBSDFj2CcD30wMdiQPWFVETBwCmRR/cHY=;
        b=Hbtsxf6qNApW4HbuAVr89T4t2Fe2v6qWRanHQhlsE4Zpm6LnmvyvpcVxa05B5kanFF
         zlu6zCfgTRWXbyIT/dcicbU4apG7RpCV3ZvNj7dQqruAXUT0cOzkaes9RwAU/nCePh5o
         GDMEf1BWjBBTaGDYjcTK4c1yiTfuizQt7Z+m0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738828029; x=1739432829;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=biMRc3fGoaOBSDFj2CcD30wMdiQPWFVETBwCmRR/cHY=;
        b=ZEm5ujbXrs+K1iaqDg7hYKFG9GQuvkNg+QQ2Av+UJ5eIGKS8pvMAipazRQF2gu13Tz
         VajH+g6AmeUwTcx+u1z8YpbyOgGh/GNscS81Qbwfk3aSbxyPv3hjBUBhBHqnSlk9rAx6
         1T7Aqjv4puKZCwRK+N3dMR0qB7MP/Xs0D7Eox5OKNG3/bjxYzX1rOS9YlCromAMufbjC
         S9uKYM+w6bFX1+KLVVVx51pzpblc+udEh/vGniSR+iAW3GENlwtQLoXeuCkj32jr+G6N
         GwZf/nYvOCfY+3IAQfWgKcvmpsmsMw4HIe02/mflBcFm/b4k+Dx0tilY1YzJAFoNawjh
         GHOA==
X-Forwarded-Encrypted: i=1; AJvYcCVC4bL2jUyddhdQdwMsI6JXErk8AhyGtEBK9NNf7SlC1NM34Des5Z4iFg54bq8FXUeO5i0QqjFvfhNRR3c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrC1h6ONL3+JzdEwpF5Cla4xPMYoX5qHjrgfpt62waH+dHH8j4
	bsFFRm2+MiTNzjK9UIfvK2vGH3j7uLSlllwY/eC2B9Hap134vca/S0wp5dCfKOfVN166MoJeTlg
	=
X-Gm-Gg: ASbGncu3eW5tqXYoZXbGxN2m7H2gya/bekqXnWwKRSiB27sI7vpb0SBXjc65zk3P0W/
	VQNfYKFL9nKh4+RW8JX7/fQBATmIcCjAcfoXDE6fY6wk+/HiGWMC+Go+Yvr3Kaw6LuGVtEJ2iBK
	zoSDA7fFustSQAm8l4sl9WNZfVHbBClFK5ek7E0wka3CN9ococpwQNUeJ+ec67uulcNVwaiO3DH
	UetmgJkUy47UaZuFuJTRSGRUL6P7qzfjVc7ueDg55aQTxNPFZcGDH+jXtIRuEh3b9dtzj7lrR9Y
	m0w5ywlD1EmWJYUOQl8=
X-Google-Smtp-Source: AGHT+IFEIahDVpsRpMFTqaJvxTh7l1xv1hlgDIwPM1sGOynIktgBvR6HXJgMi6JHKvqQbqMMxnceSA==
X-Received: by 2002:a62:f247:0:b0:730:399f:9593 with SMTP id d2e1a72fcca58-730399f9e50mr6203147b3a.2.1738828029329;
        Wed, 05 Feb 2025 23:47:09 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:28ab:cea4:aa8a:127a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73048ae7558sm682026b3a.68.2025.02.05.23.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 23:47:08 -0800 (PST)
Date: Thu, 6 Feb 2025 16:47:02 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Minchan Kim <minchan@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Hillf Danton <hdanton@sina.com>, 
	Mike Galbraith <umgwanakikbuti@gmail.com>
Subject: Re: [PATCHv4 01/17] zram: switch to non-atomic entry locking
Message-ID: <46ttdyaiweca7qou2t3mx5jy7hefg3htrv4covt5htcex7zaq4@p6is3ukmtbhy>
References: <20250131090658.3386285-1-senozhatsky@chromium.org>
 <20250131090658.3386285-2-senozhatsky@chromium.org>
 <20250131145536.d7a0483331b0ebfde80a5754@linux-foundation.org>
 <itapje7ikrv532bwn67udwtjmmmyqp6j4yqc777smbi4rjgmm6@6se3rdy6ufbk>
 <20250206073803.c2tiyIq6@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250206073803.c2tiyIq6@linutronix.de>

On (25/02/06 08:38), Sebastian Andrzej Siewior wrote:
> On 2025-02-06 16:01:12 [+0900], Sergey Senozhatsky wrote:
> > So I completely reworked this bit and we don't have that problem
> > anymore, nor the problem of "inventing locking schemes in 2025".
> > 
> > In short - we are returning back to bit-locks, what zram has been using
> > until commit 9518e5bfaae19 ("zram: Replace bit spinlocks with a spinlock_t),
> > not bit-spinlock these time around, that won't work with linux-rt, but
> > wait_on_bit and friends.  Entry lock is exclusive, just like before,
> > but lock owner can sleep now, any task wishing to lock that same entry
> > will wait to be woken up by the current lock owner once it unlocks the
> > entry.  For cases when lock is taken from atomic context (e.g. slot-free
> > notification from softirq) we continue using TRY lock, which has been
> > introduced by commit 3c9959e025472 ("zram: fix lockdep warning of free block
> > handling"), so there's nothing new here.  In addition I added some lockdep
> > annotations, just to be safe.
> > 
> > There shouldn't be too many tasks competing for the same entry.  I can
> > only think of cases when read/write (or slot-free notification if zram
> > is used as a swap device) vs. writeback or recompression (we cannot have
> > writeback and recompression simultaneously).
> 
> So if I understand, you want to get back to bit spinlocks but sleeping
> instead of polling. But why? Do you intend to have more locks per entry
> so that you use the additional bits with the "lock"?

zram is atomic right now, e.g.

zram_read()
	lock entry by index   # disables preemption
	map zsmalloc entry    # possibly memcpy
	decompress
	unmap zsmalloc
	unlock entry          # enables preemption

That's a pretty long time to keep preemption disabled (e.g. using slow
algorithm like zstd or deflate configured with high compression levels).
Apart from that that, difficult to use async algorithms, which can
e.g. wait for a H/W to become available, or algorithms that might want
to allocate memory internally during compression/decompression, e.g.
zstd).

Entry lock is not the only lock in zram currently that makes it
atomic, just one of.

> > It currently looks like this:
> > 
> …
> > static __must_check bool zram_slot_try_lock(struct zram *zram, u32 index)
> > {
> >         unsigned long *lock = &zram->table[index].flags;
> > 
> >         if (!test_and_set_bit_lock(ZRAM_ENTRY_LOCK, lock)) {
> > #ifdef CONFIG_DEBUG_LOCK_ALLOC
> >                 mutex_acquire(&zram->table[index].lockdep_map, 0, 0, _RET_IP_);
> > #endif
> >                 return true;
> >         }
> >         return false;
> > }
> 
> I hope the caller does not poll.

Yeah, we don't that in the code.

> > static void zram_slot_lock(struct zram *zram, u32 index)
> > {
> >         unsigned long *lock = &zram->table[index].flags;
> > 
> >         WARN_ON_ONCE(!preemptible());
> 
> you want might_sleep() here instead. preemptible() works only on
> preemptible kernels. And might_sleep() is already provided by
> wait_on_bit_lock(). So this can go.

wait_on_bit_lock() has might_sleep().

> >         wait_on_bit_lock(lock, ZRAM_ENTRY_LOCK, TASK_UNINTERRUPTIBLE);
> > #ifdef CONFIG_DEBUG_LOCK_ALLOC
> >         mutex_acquire(&zram->table[index].lockdep_map, 0, 0, _RET_IP_);
> > #endif
> 
> I would argue that you want this before the wait_on_bit_lock() simply
> because you want to see a possible deadlock before it happens.

Ack.

> > static void zram_slot_unlock(struct zram *zram, u32 index)
> > {
> >         unsigned long *lock = &zram->table[index].flags;
> > 
> >         clear_and_wake_up_bit(ZRAM_ENTRY_LOCK, lock);
> > #ifdef CONFIG_DEBUG_LOCK_ALLOC
> >         mutex_release(&zram->table[index].lockdep_map, _RET_IP_);
> > #endif
> Also before. So it complains about release a not locked lock before it
> happens.

OK.
