Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13FE1524C
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 07:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738825280; cv=none; b=oYzZ6N+v7gkT8iIC7M6nYEuL6bkEkjiEvXS76f/oSXXV5H9AL6mNZlsbihiKY54xzdCnWBiMs1luDPPkKFzbm6oc8R3VeSWXMIL0NhrCwjMaPAMffMAa3uLU2MA6VDCFJex5q5yJHD9rDKPmtEfMYcjl1XRIEdzAfBypjbrmqmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738825280; c=relaxed/simple;
	bh=HSaiirMl170KNbwnqMjHyurpX7M/VsNxhb3VJsCI4M4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G73QZB9UTyqekSZ12cX2q8ndUvSD7RRTzkLwak+XqFBlhM8bfMXZjpZnJ0E/bWPjXXG5Ipy8YnaE1o0VPGQ6RXO3flBPs1ODsmxUZ1eEp0JERd8NfTjQQbjYPdxqhzRqnudcMmo88jcKriWPXgEomPwTC1Q3zLICQ6GCy57vOzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JdvPxkf8; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JdvPxkf8"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-21ddab8800bso8670385ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 23:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738825278; x=1739430078; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sxNsy78Ojle1Pdtt2/9uoDPHjLQXKw9uXc9cm/JVoXs=;
        b=JdvPxkf8SjV+/NH8f+hyoPq4IpjYG/XsC8uUbiYw0XkKisJBmQ8O8LrwSoYOThB49C
         kDPoMbO8l9m+bwk+Nmr+uCAwnmpurdHdU0dbLCM48pddiu8WhbmjtYyxCkC09TxCiOqt
         YoW9pJi+1QLCvu86lF2hf3tsZeG0KaTSQE6rM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738825278; x=1739430078;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sxNsy78Ojle1Pdtt2/9uoDPHjLQXKw9uXc9cm/JVoXs=;
        b=g6PlEivXTtALXOGXaQM4CW11ZCbBOya0Kn6dACWtAuSTHa+DETNt2MiCWyJGcz3QJ4
         gIjvgFShVNtWe4kXUtpKXACu2Lp1calezADt/WVLcKJ8MI9CL39KFTLiD8Vb+oW7w8Dr
         B1FTltJBFEuw2317fZrCXFe4Ll3yRdofRdkU9K7mY0zJDG6NLCPRzKhhHiobVN/g6bhq
         HPaQjvE6Nbcry7MPp7XvViXXS2UjiaybHvSRsEgqWUhWl7yv87FJjhirb87AoYE0ScdQ
         YVNOD/rbEDSC9PhyD9YNg73VyBErK8xzYOg5UrtZYfP3lGbJip8lpUNBeb6tsIexeS/J
         UjOg==
X-Forwarded-Encrypted: i=1; AJvYcCVYDqZ/3SlUSAKMCaaOx28QrinuVPLZZYSvzyFwIjFX2cz1tRLxyBQ0hJav5DlHjwN7eJ473KvtMBNArcA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwM156QsOn02wyZHgJzHMBTvvDN+rqHH3YViBJEZ2I4wcZ6amLP
	I00/rhrJg/KBGyuJfyiTPUZiLu0S3lbXOBgsHpctYsoImm9k0+Hp3Ehrw4Oq0n8Tx1169audJxk
	=
X-Gm-Gg: ASbGncvAIOyd/BKvQiVDxJg7a/VqNe/60yH9RLTcXh28QbWZRqfkdPUIGeYiwBENJLF
	GSO8bBON12O6hj6lVHyahV0UoFEwPdHKrOb2wh2ma1ipTSNWQr6Uov5rVeGKWO7FUpPgYmC9LnD
	OXbI2XD8FchCES1xDghjz3xsUPRCEwi0/C+CgeFxvCoiW2j5+hWJumuFqRMyvzqU8LIlCX3SF81
	Rd/ZF+Ht+MSKx2agIQ9dgx8cZa2P+kpToTj2qtX/ipFsxn4mN8RLwowu3bct1fvK7NdYinUkTmC
	s9oCopxjPmrvxBIp16E=
X-Google-Smtp-Source: AGHT+IG4YvkGAKTcjpC9qozwv2pX6qryRKN7DcO5vmBTThC2QwtQnRZvkBNlJbFGOMFGr5/DKovTAQ==
X-Received: by 2002:a05:6a21:a44:b0:1db:de38:294b with SMTP id adf61e73a8af0-1ede88ca7e2mr9801666637.38.1738825277996;
        Wed, 05 Feb 2025 23:01:17 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:28ab:cea4:aa8a:127a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73048a9d903sm596092b3a.13.2025.02.05.23.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 23:01:17 -0800 (PST)
Date: Thu, 6 Feb 2025 16:01:12 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Minchan Kim <minchan@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Hillf Danton <hdanton@sina.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Mike Galbraith <umgwanakikbuti@gmail.com>
Subject: Re: [PATCHv4 01/17] zram: switch to non-atomic entry locking
Message-ID: <itapje7ikrv532bwn67udwtjmmmyqp6j4yqc777smbi4rjgmm6@6se3rdy6ufbk>
References: <20250131090658.3386285-1-senozhatsky@chromium.org>
 <20250131090658.3386285-2-senozhatsky@chromium.org>
 <20250131145536.d7a0483331b0ebfde80a5754@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250131145536.d7a0483331b0ebfde80a5754@linux-foundation.org>

Cc-ing Sebastian and Mike

On (25/01/31 14:55), Andrew Morton wrote:
> > +static void zram_slot_write_lock(struct zram *zram, u32 index)
> > +{
> > +	atomic_t *lock = &zram->table[index].lock;
> > +	int old = atomic_read(lock);
> > +
> > +	do {
> > +		if (old != ZRAM_ENTRY_UNLOCKED) {
> > +			cond_resched();
> > +			old = atomic_read(lock);
> > +			continue;
> > +		}
> > +	} while (!atomic_try_cmpxchg(lock, &old, ZRAM_ENTRY_WRLOCKED));
> > +}
> 
> I expect that if the calling userspace process has realtime policy (eg
> SCHED_FIFO) then the cond_resched() won't schedule SCHED_NORMAL tasks
> and this becomes a busy loop.  And if the machine is single-CPU, the
> loop is infinite.
> 
> I do agree that for inventing new locking schemes, the bar is set
> really high.

So I completely reworked this bit and we don't have that problem
anymore, nor the problem of "inventing locking schemes in 2025".

In short - we are returning back to bit-locks, what zram has been using
until commit 9518e5bfaae19 ("zram: Replace bit spinlocks with a spinlock_t),
not bit-spinlock these time around, that won't work with linux-rt, but
wait_on_bit and friends.  Entry lock is exclusive, just like before,
but lock owner can sleep now, any task wishing to lock that same entry
will wait to be woken up by the current lock owner once it unlocks the
entry.  For cases when lock is taken from atomic context (e.g. slot-free
notification from softirq) we continue using TRY lock, which has been
introduced by commit 3c9959e025472 ("zram: fix lockdep warning of free block
handling"), so there's nothing new here.  In addition I added some lockdep
annotations, just to be safe.

There shouldn't be too many tasks competing for the same entry.  I can
only think of cases when read/write (or slot-free notification if zram
is used as a swap device) vs. writeback or recompression (we cannot have
writeback and recompression simultaneously).

It currently looks like this:

---

struct zram_table_entry {
        unsigned long handle;
        unsigned long flags;
#ifdef CONFIG_DEBUG_LOCK_ALLOC
        struct lockdep_map lockdep_map;
#endif
#ifdef CONFIG_ZRAM_TRACK_ENTRY_ACTIME
        ktime_t ac_time;
#endif
};

/*
 * entry locking rules:
 *
 * 1) Lock is exclusive
 *
 * 2) lock() function can sleep waiting for the lock
 *
 * 3) Lock owner can sleep
 *
 * 4) Use TRY lock variant when in atomic context
 *    - must check return value and handle locking failers
 */
static __must_check bool zram_slot_try_lock(struct zram *zram, u32 index)
{
        unsigned long *lock = &zram->table[index].flags;

        if (!test_and_set_bit_lock(ZRAM_ENTRY_LOCK, lock)) {
#ifdef CONFIG_DEBUG_LOCK_ALLOC
                mutex_acquire(&zram->table[index].lockdep_map, 0, 0, _RET_IP_);
#endif
                return true;
        }
        return false;
}

static void zram_slot_lock(struct zram *zram, u32 index)
{
        unsigned long *lock = &zram->table[index].flags;

        WARN_ON_ONCE(!preemptible());

        wait_on_bit_lock(lock, ZRAM_ENTRY_LOCK, TASK_UNINTERRUPTIBLE);
#ifdef CONFIG_DEBUG_LOCK_ALLOC
        mutex_acquire(&zram->table[index].lockdep_map, 0, 0, _RET_IP_);
#endif
}

static void zram_slot_unlock(struct zram *zram, u32 index)
{
        unsigned long *lock = &zram->table[index].flags;

        clear_and_wake_up_bit(ZRAM_ENTRY_LOCK, lock);
#ifdef CONFIG_DEBUG_LOCK_ALLOC
        mutex_release(&zram->table[index].lockdep_map, _RET_IP_);
#endif
}
