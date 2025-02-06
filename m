Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1111F1537
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 08:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738829611; cv=none; b=pXVj3maSxBEJEax+dHnHq/3x/a89Q8a8H2q28QufIfSwaM1s7GfvaKdq6DGON74VkP3ZHW3cvAvVxZnn9Ma+F681YanGNbQjaeFn3B6LfziH/htqp5BaB3YmEOe8LTbqtUVwsJTSLZDRFSDsWcVNeOr7zJPOOy8JM123sWGrbF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738829611; c=relaxed/simple;
	bh=u81orweX9eJasGjUm606Z3vk612NAdvtbbjWqk30QZg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L6I9CVz/J1JjQUFLHFIZkwWrw7qUe4WYlXqQe5G2fP8MRHzD/QcreZc0hyQAjqWCdAbs5AVsHX+eOf72v61eTKJjWvcjGo2XItjhJFThTRaDqTJeK4izcQIqVu/WmfpZwo97JgkdG+LTyGiAO7jisPeEWaFgKBE4Yz7Fej4a7+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Oe/tJGi3; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=oz+jz5G7; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Oe/tJGi3";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="oz+jz5G7"
Date: Thu, 6 Feb 2025 09:13:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738829607;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DSHPctppgFx2T7kb8w2YlXg5yJ2iuC5dB380kfJlnXg=;
	b=Oe/tJGi3G1xy7Z8YgIulGWCc3RaKrVWsdv8Pg3wJjyZ8YqrhPwzvPMYPVwAN8T7ZvuGMzX
	IAqov2Mxcm2LTv8/1GEO7chMBJ1HjYuCUsec8yxqE+/Ur/lEzBL42JxtV6FmoAtNS0R5WV
	X/hcwQQSog62ZbOFSqSUqbaCrGTvRFLck2+7ZAhWx/4zGXfmf7mC34pnZJtSMuYtaUwBZe
	V09VrrvvcNzpt3JkMroH7PMFzW3hh56souMN43VXZXkcT/rxrcosFGsrCoWT+/05mKEgeb
	Tzpjf2oivnEP8ORvkTmL2TXibJGDR8QhDhCtb0dF7DhAXNpDlX+BMIoVxDBsvA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738829607;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DSHPctppgFx2T7kb8w2YlXg5yJ2iuC5dB380kfJlnXg=;
	b=oz+jz5G74rb08mjGxe3fYTOBQCbcntiJJY1do5B5WkmVq0/LVjfZ0lR+6LeHzl5Pfn2mCE
	LxbepFgS7bk46TAg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Minchan Kim <minchan@kernel.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Hillf Danton <hdanton@sina.com>,
	Mike Galbraith <umgwanakikbuti@gmail.com>
Subject: Re: [PATCHv4 01/17] zram: switch to non-atomic entry locking
Message-ID: <20250206081326.xMa5Z5oJ@linutronix.de>
References: <20250131090658.3386285-1-senozhatsky@chromium.org>
 <20250131090658.3386285-2-senozhatsky@chromium.org>
 <20250131145536.d7a0483331b0ebfde80a5754@linux-foundation.org>
 <itapje7ikrv532bwn67udwtjmmmyqp6j4yqc777smbi4rjgmm6@6se3rdy6ufbk>
 <20250206073803.c2tiyIq6@linutronix.de>
 <46ttdyaiweca7qou2t3mx5jy7hefg3htrv4covt5htcex7zaq4@p6is3ukmtbhy>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <46ttdyaiweca7qou2t3mx5jy7hefg3htrv4covt5htcex7zaq4@p6is3ukmtbhy>

On 2025-02-06 16:47:02 [+0900], Sergey Senozhatsky wrote:
> zram is atomic right now, e.g.
> 
> zram_read()
> 	lock entry by index   # disables preemption
> 	map zsmalloc entry    # possibly memcpy
> 	decompress
> 	unmap zsmalloc
> 	unlock entry          # enables preemption
> 
> That's a pretty long time to keep preemption disabled (e.g. using slow
> algorithm like zstd or deflate configured with high compression levels).
> Apart from that that, difficult to use async algorithms, which can
> e.g. wait for a H/W to become available, or algorithms that might want
> to allocate memory internally during compression/decompression, e.g.
> zstd).
> 
> Entry lock is not the only lock in zram currently that makes it
> atomic, just one of.

Okay. So there are requirements for the sleeping lock. A mutex isn't
fitting the requirement because it is too large I guess.

> > > static void zram_slot_lock(struct zram *zram, u32 index)
> > > {
> > >         unsigned long *lock = &zram->table[index].flags;
> > > 
> > >         WARN_ON_ONCE(!preemptible());
> > 
> > you want might_sleep() here instead. preemptible() works only on
> > preemptible kernels. And might_sleep() is already provided by
> > wait_on_bit_lock(). So this can go.
> 
> wait_on_bit_lock() has might_sleep().

My point exactly. This makes the WARN_ON_ONCE() obsolete.

Sebastian
