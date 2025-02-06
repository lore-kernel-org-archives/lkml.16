Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D398B20C032
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 07:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738827488; cv=none; b=SslKpdhX12EoBLOG2jUEz+aZLDJO1kyG3wbnUcSsoDLjvuCSTcdEL0ItzQwuFIL5aLIxTnqvZ/HvoWSYfB2VD6YyIXaNNMOzuKQneQtG8GOWzK+OA+eWdrAsvhW0dopxEI9aGXP8kwxt0EB8dupb/G+32Fr24daPUr5jGv0XMqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738827488; c=relaxed/simple;
	bh=EyGe1UfcXbMoU+uCUT8epWa9MjazPWv9ZvOrFkHKyhA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rz4fRWDtkdMRvNIP67n5BoFmz+p0FnIpW2QsF7rreIfipVjAo7NI1eAG8fji7+4fVOx2LlwWiL3oHKAbc8cY6AcZqHhn8LntYsps4EUr0ndxMD1uXFtegu/jrTFrnkJhumdoKWeijStC53tEJvZ6nEKtDGZfebU66JJZhyx2VZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=QwvIpg8C; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=OkBHMCTR; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="QwvIpg8C";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="OkBHMCTR"
Date: Thu, 6 Feb 2025 08:38:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738827484;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6Dlnv+jpgMFjGanz60mPgQXAr/AkzQst+XBYrEHi1U8=;
	b=QwvIpg8C8FaZdXC84w7m1q+UiRnLbTpcK+l7aQhqZOcWLchdGzVA1k6dwaqDBwJH3TviP4
	Qhq4xJnRfKAcz7cbka76OsuWkz4BdCdwmOe3aR9Rh61WFVrrt4UFcnehti3cWZbv3L2/Mf
	HZhiXqKH0USBiYmkq9g8NTTk5Kre3uMAX4siGOLgXOKQ4fp5nal+0JJpBJtuocQUB5IXF/
	xgwLo2BUfbr/xyW5BFR3we42m4aewTQpTlPfx17T8xr4nwn18tKQf+QhbzXXPBWEYz8dZG
	0IKei1JndN6sDmAVs97R0ft+cFk3bHPzP5sCEVEZsr83BSBACuNnQCOag3vGpw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738827484;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6Dlnv+jpgMFjGanz60mPgQXAr/AkzQst+XBYrEHi1U8=;
	b=OkBHMCTRR1gddF6WYTPazVl0aqmcDGmlNBBR0aUo4uUeaoffezWqgQ8OgSdxeDKL4gHPEu
	GhXUgB2mSHaiiDDg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Minchan Kim <minchan@kernel.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Hillf Danton <hdanton@sina.com>,
	Mike Galbraith <umgwanakikbuti@gmail.com>
Subject: Re: [PATCHv4 01/17] zram: switch to non-atomic entry locking
Message-ID: <20250206073803.c2tiyIq6@linutronix.de>
References: <20250131090658.3386285-1-senozhatsky@chromium.org>
 <20250131090658.3386285-2-senozhatsky@chromium.org>
 <20250131145536.d7a0483331b0ebfde80a5754@linux-foundation.org>
 <itapje7ikrv532bwn67udwtjmmmyqp6j4yqc777smbi4rjgmm6@6se3rdy6ufbk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <itapje7ikrv532bwn67udwtjmmmyqp6j4yqc777smbi4rjgmm6@6se3rdy6ufbk>

On 2025-02-06 16:01:12 [+0900], Sergey Senozhatsky wrote:
> So I completely reworked this bit and we don't have that problem
> anymore, nor the problem of "inventing locking schemes in 2025".
>=20
> In short - we are returning back to bit-locks, what zram has been using
> until commit 9518e5bfaae19 ("zram: Replace bit spinlocks with a spinlock_=
t),
> not bit-spinlock these time around, that won't work with linux-rt, but
> wait_on_bit and friends.  Entry lock is exclusive, just like before,
> but lock owner can sleep now, any task wishing to lock that same entry
> will wait to be woken up by the current lock owner once it unlocks the
> entry.  For cases when lock is taken from atomic context (e.g. slot-free
> notification from softirq) we continue using TRY lock, which has been
> introduced by commit 3c9959e025472 ("zram: fix lockdep warning of free bl=
ock
> handling"), so there's nothing new here.  In addition I added some lockdep
> annotations, just to be safe.
>=20
> There shouldn't be too many tasks competing for the same entry.  I can
> only think of cases when read/write (or slot-free notification if zram
> is used as a swap device) vs. writeback or recompression (we cannot have
> writeback and recompression simultaneously).

So if I understand, you want to get back to bit spinlocks but sleeping
instead of polling. But why? Do you intend to have more locks per entry
so that you use the additional bits with the "lock"?

> It currently looks like this:
>=20
=E2=80=A6
> static __must_check bool zram_slot_try_lock(struct zram *zram, u32 index)
> {
>         unsigned long *lock =3D &zram->table[index].flags;
>=20
>         if (!test_and_set_bit_lock(ZRAM_ENTRY_LOCK, lock)) {
> #ifdef CONFIG_DEBUG_LOCK_ALLOC
>                 mutex_acquire(&zram->table[index].lockdep_map, 0, 0, _RET=
_IP_);
> #endif
>                 return true;
>         }
>         return false;
> }

I hope the caller does not poll.

> static void zram_slot_lock(struct zram *zram, u32 index)
> {
>         unsigned long *lock =3D &zram->table[index].flags;
>=20
>         WARN_ON_ONCE(!preemptible());

you want might_sleep() here instead. preemptible() works only on
preemptible kernels. And might_sleep() is already provided by
wait_on_bit_lock(). So this can go.

>         wait_on_bit_lock(lock, ZRAM_ENTRY_LOCK, TASK_UNINTERRUPTIBLE);
> #ifdef CONFIG_DEBUG_LOCK_ALLOC
>         mutex_acquire(&zram->table[index].lockdep_map, 0, 0, _RET_IP_);
> #endif

I would argue that you want this before the wait_on_bit_lock() simply
because you want to see a possible deadlock before it happens.

> }
>=20
> static void zram_slot_unlock(struct zram *zram, u32 index)
> {
>         unsigned long *lock =3D &zram->table[index].flags;
>=20
>         clear_and_wake_up_bit(ZRAM_ENTRY_LOCK, lock);
> #ifdef CONFIG_DEBUG_LOCK_ALLOC
>         mutex_release(&zram->table[index].lockdep_map, _RET_IP_);
> #endif
Also before. So it complains about release a not locked lock before it
happens.
> }

Sebastian
