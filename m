Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940BD171D2
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 00:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738628399; cv=none; b=VYS83oVdKCXUYa7fQ1po3RT8biP520my1xAkcGaNvhzPNyE9A0emEvUUxwhe2Be0jATlRdMEWDdPwgTmUoM4W+Tn+4mCA4/IXQuxSYUlK+1BFyb9msANPgU4qV5gmhCM2yfh4o7wWtenX8bX/bUCbxn35cXC34GdmzpjlCegAxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738628399; c=relaxed/simple;
	bh=w+7nQhJ8V2Za9tjSacV+hWmFD0TVRwJZZr4hlwqDBQY=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=kCdPmHdLFWvsUWGTUSuk4fl/7vpWnZHJlVs0cmm9+HSCCevA8H1PmGepHQWXLk2M5EMduFggEJGu28w5rlOC2ohDNmfT9d+QNC1K7EUL2W/3iIYxvalPcl8fDlF8gYJIuOl7fIQLq9TB2xv382mWVrKnS1dk6eoZX4d2RsoCP5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=QXznbcOR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="QXznbcOR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A865DC4CEE0;
	Tue,  4 Feb 2025 00:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1738628398;
	bh=w+7nQhJ8V2Za9tjSacV+hWmFD0TVRwJZZr4hlwqDBQY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=QXznbcORwAbGrrVlo2x0+VNGFnYXsk4uwGmrL7rKo0DrOsKqkbD13eUe8lo6pEWrC
	 ubCdl5NsC34rfAj0Y7/LYG6Pbrr73btn2pFc8HiXEiEkU68h3bNQxBLE6ql6jxM5FF
	 +2xURsoMG2jkGdmcbAb08EaILXVCwYq4gGjxcd3o=
Date: Mon, 3 Feb 2025 16:19:58 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Minchan Kim <minchan@kernel.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCHv4 01/17] zram: switch to non-atomic entry locking
Message-Id: <20250203161958.b529e20fb7aa07645ed029eb@linux-foundation.org>
In-Reply-To: <dj2k36obadhbxlvecsdhdyf7edkmtgocf55jkbiq5gbnpvkygt@mcwolkrhicvq>
References: <20250131090658.3386285-1-senozhatsky@chromium.org>
	<20250131090658.3386285-2-senozhatsky@chromium.org>
	<20250131145536.d7a0483331b0ebfde80a5754@linux-foundation.org>
	<dj2k36obadhbxlvecsdhdyf7edkmtgocf55jkbiq5gbnpvkygt@mcwolkrhicvq>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 3 Feb 2025 12:26:12 +0900 Sergey Senozhatsky <senozhatsky@chromium.org> wrote:

> On (25/01/31 14:55), Andrew Morton wrote:
> > > +static void zram_slot_write_lock(struct zram *zram, u32 index)
> > > +{
> > > +	atomic_t *lock = &zram->table[index].lock;
> > > +	int old = atomic_read(lock);
> > > +
> > > +	do {
> > > +		if (old != ZRAM_ENTRY_UNLOCKED) {
> > > +			cond_resched();
> > > +			old = atomic_read(lock);
> > > +			continue;
> > > +		}
> > > +	} while (!atomic_try_cmpxchg(lock, &old, ZRAM_ENTRY_WRLOCKED));
> > > +}
> > 
> > I expect that if the calling userspace process has realtime policy (eg
> > SCHED_FIFO) then the cond_resched() won't schedule SCHED_NORMAL tasks
> > and this becomes a busy loop.  And if the machine is single-CPU, the
> > loop is infinite.
> 
> So for that scenario to happen zram needs to see two writes() to the same
> index (page) simultaneously?  Or read() and write() on the same index (page)
> concurrently?

Well, my point is that in the contended case, this "lock" operation can
get stuck forever.  If there are no contended cases, we don't need a
lock!

And I don't see how disabling the feature if PREEMPT=y will avoid this
situation.  cond_resched() won't schedule away from a realtime task to
a non-realtime one - a policy which isn't related to preemption.

