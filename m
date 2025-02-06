Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBB22248B2
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 08:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738830400; cv=none; b=KbsEDf54Z4gca13twyFo/FDHMm1xzweHstP5MozbtXCwYrcc574dH7Fwyz6ktZb8KUAoRt20aTgsmdF5m/kYrwvdq2t7dRGOS7dKf+E/AtKFPp7cJdQKWz8bPeXb8lVJyo8xAv2ze/CsPPmsiLgg/cwRQU0EWQT0TULszAgctBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738830400; c=relaxed/simple;
	bh=52wRk3SznrfEJoHtR1xl7/jAP4p0cP3HWb9A2fgmKHE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z8Nrlj8VB2mPEZvftSN8op6nyE8Z9QfkdrI9+XYMDT0jBXWB9B9oeJzN2PYaeSOSqGRc/p4pQjpJxepFUenx2nVfWURJtvZ3zMO4EB9dDLdcJ75tJcPPW+VXV5Zicpt75iQo7+4HFJYkrxDmvfqKuOXwSwa5j9/ElGdhJJ9AuNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=g8vMM88P; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ygs3gv4g; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="g8vMM88P";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ygs3gv4g"
Date: Thu, 6 Feb 2025 09:26:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738830396;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=y7yn31S5+WkTjV1+0qPR9v48o1ew83Px5+6NG1IqRQI=;
	b=g8vMM88PTwYStI0kJDY9MEdEPpk5nApUrjpqkyGlrfNHhGu3lBEtvummEGcXXDAmjBqeCH
	EBKzfMa5M1G+zU6+D4tq9f+fmWUouyBaMnCM7vqQR8I8D0mfm5Et1n+qhnJWJ9fVcRR2gG
	7kAfYm12lYfZhQUEBbuvTBxPVNCb0q+LpSFu2W05LqlS17w8JQICwWDqSrjUprlnzQcPrJ
	WsSD5R6QCWJoa8swUK8U146NR+9YtPZoq6UV20QZls/se8dVWWKjrVp9+KGfUUiD3Ax20z
	eCckHXe5zltM17hhcKx+Hh2K+f1RDTDkvM1ybvZaeHibn0jXTJ3l152mp9tBGA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738830396;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=y7yn31S5+WkTjV1+0qPR9v48o1ew83Px5+6NG1IqRQI=;
	b=ygs3gv4gfPo6kEwC2Q5D7gNHL/t7J9FygnRR44QxN9ugfxi9HK9qaNx8HjtEk8KVwRAfaK
	wsoQyUh540zt5wDA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Minchan Kim <minchan@kernel.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Hillf Danton <hdanton@sina.com>,
	Mike Galbraith <umgwanakikbuti@gmail.com>
Subject: Re: [PATCHv4 01/17] zram: switch to non-atomic entry locking
Message-ID: <20250206082635.dZ1qhyhU@linutronix.de>
References: <20250131090658.3386285-1-senozhatsky@chromium.org>
 <20250131090658.3386285-2-senozhatsky@chromium.org>
 <20250131145536.d7a0483331b0ebfde80a5754@linux-foundation.org>
 <itapje7ikrv532bwn67udwtjmmmyqp6j4yqc777smbi4rjgmm6@6se3rdy6ufbk>
 <20250206073803.c2tiyIq6@linutronix.de>
 <46ttdyaiweca7qou2t3mx5jy7hefg3htrv4covt5htcex7zaq4@p6is3ukmtbhy>
 <20250206081326.xMa5Z5oJ@linutronix.de>
 <zgaitute72xlzukunnhioqk4e2copgtkonxtn7iuvjq6gufwhr@yg4kry4wq3p2>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <zgaitute72xlzukunnhioqk4e2copgtkonxtn7iuvjq6gufwhr@yg4kry4wq3p2>

On 2025-02-06 17:17:41 [+0900], Sergey Senozhatsky wrote:
> > Okay. So there are requirements for the sleeping lock. A mutex isn't
> > fitting the requirement because it is too large I guess.
> 
> Correct.

I would nice to state this why a generic locking implementation can not
be used. From what I have seen it should play along with RT nicely.

> > > > > static void zram_slot_lock(struct zram *zram, u32 index)
> > > > > {
> > > > >         unsigned long *lock = &zram->table[index].flags;
> > > > > 
> > > > >         WARN_ON_ONCE(!preemptible());
> > > > 
> > > > you want might_sleep() here instead. preemptible() works only on
> > > > preemptible kernels. And might_sleep() is already provided by
> > > > wait_on_bit_lock(). So this can go.
> > > 
> > > wait_on_bit_lock() has might_sleep().
> > 
> > My point exactly. This makes the WARN_ON_ONCE() obsolete.
> 
> Right, might_sleep() can be disabled, as far as I understand,
> via CONFIG_DEBUG_ATOMIC_SLEEP, unlike WARN_ON_ONCE().  But I
> can drop it and then just rely on might_sleep(), should be
> enough.

It should be enough. mutex_lock(), down() and so on relies solely on it.
As I said, preemptible() only works on preemptible kernels if it comes
to the preemption counter on and !preemptible kernels with enabled
debugging.

Sebastian
