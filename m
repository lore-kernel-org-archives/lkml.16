Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B076209681
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 15:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738597879; cv=none; b=kEnhDMJMF3z2fs+7hMS2MaOjsJF6IBjiJrAGpEdZ4hu5G5bYZvJtNmMRK9E9QEO4ZFHIr3IEFWzp58yOkYujikMwDHFGMBspUyBFVVos3rshXpye/3c4Ta/Cfm3L466/1JB2ERhDrYQUAje3iBpD+jLhHwMNSvBcoJka9++yyr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738597879; c=relaxed/simple;
	bh=e8N0Aob9bWqLhNePorMvSnmf+ovzuHoW9bu593uZPdY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s0awp4zuHfMGciFHl8/bMGv9mFdHgTUWS5EKxbfkobSXWQ3lxGpVeFU53Je6kalk90YGWsvB1fZCvCcXyCiqzdc9eWncsPvl6U01jxxUiZadhJjYExs/YDPu6DlAC4vb6GVtFQaTv4nHVeUwQbNpSuqws0+iPUzBXVXGkKRmUQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=HBg2lJq5; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=dMGsAtDy; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="HBg2lJq5";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="dMGsAtDy"
Date: Mon, 3 Feb 2025 16:51:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738597876;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v7RnrCaV5xQ03TwmmjrTbH5ki25PvHPH8YZBjrzbXRg=;
	b=HBg2lJq5njsLys3qQUM9Sp3MsdHfp0QXw7+v5WOKXgRzoiSWvHkHFSOAKQ4yGIyaW/G5FD
	bujST94qzM4/Igh/q0Lj5fLn0XcGJpTx07os2t4s0wX2wRQ24xEUXSsiJupNzhA++hJKJF
	uw2pIvzBlXMMcSVzu5rbzOKOGe12BLDDr9MaC1TcViikZAZy6n0TMyAOEqZTDBbuunRSCS
	yrPamVF0r3Rxp1M4u4tauVK7TETXySW5vTsttQ0O3tHqETtXJgR3NRxuA7WYDoxHjpSJrQ
	PO9jU+CvR7M9WWBYdlr6u2991qeb3udeAoB3OGfl98ivw05ZTI1p23h0f7z9UQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738597876;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v7RnrCaV5xQ03TwmmjrTbH5ki25PvHPH8YZBjrzbXRg=;
	b=dMGsAtDyiFtBh3f/Y67cU5pLW9rYAvhMOB07Uc/mxZAoWAE7++emdDvxxrd0vlZOIKRIo8
	bz5Bwd9RugQ1Q4Dw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org,
	=?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v8 03/15] futex: Add basic infrastructure for local task
 local hash.
Message-ID: <20250203155114.YVGnCHUT@linutronix.de>
References: <20250203135935.440018-1-bigeasy@linutronix.de>
 <20250203135935.440018-4-bigeasy@linutronix.de>
 <20250203142743.GI7145@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250203142743.GI7145@noisy.programming.kicks-ass.net>

On 2025-02-03 15:27:43 [+0100], Peter Zijlstra wrote:
> On Mon, Feb 03, 2025 at 02:59:23PM +0100, Sebastian Andrzej Siewior wrote:
> > The futex hashmap is system wide and shared by random tasks. Each slot
> > is hashed based on its address and VMA. Due to randomized VMAs (and
> > memory allocations) the same logical lock (pointer) can end up in a
> > different hash bucket on each invocation of the application. This in
> > turn means that different applications may share a hash bucket on the
> > first invocation but not on the second an it is not always clear which
> > applications will be involved. This can result in high latency's to
> > acquire the futex_hash_bucket::lock especially if the lock owner is
> > limited to a CPU and not be effectively PI boosted.
> > 
> > Introduce a task local hash map. The hashmap can be allocated via
> > 	prctl(PR_FUTEX_HASH, PR_FUTEX_HASH_SET_SLOTS, 0)
> > 
> > The `0' argument allocates a default number of 16 slots, a higher number
> > can be specified if desired. The current upper limit is 131072.
> 
> Hmm, I would expect 0 to disable the local thing.
> 
> Now, I realize this is somewhat tricky, since there might be futexes
> inside it. But mapping 0 to some default value seems.. well, odd.

Looking at this from the top of the series:
- The default value (currently 16) supposed to be something sane so the
  user does not have to worry about it. We could increase it if needed.

- Currently each thread will alter the limit if needed based on the
  formula. So even if you set it to 2 or 16, once you have 16 threads
  you will have 64 buckets.

- The number of buckets can only be increased, not shrunk. There is no
  technical requirement for it other than "avoid a race where you use a
  lower number if a lot of threads a fired at once".

- It is not expected to go back to the global hash.

- The upper limit is the same limit as for the global hash.

All the things I mentioned are open for debate:

- We could force the user to specify a power-of-number for the buckets
  (due to current implementation) and not round.

- We could allow to increase and shrink the number of buckets. Allowing
  it to shrink by accident if many threads are fired at once.

- We could say the user knows best and disable the heuristic once a size
  has been requested.

- We could use 0 to disable the local hash and use the global one
  instead if this is a requirement. Doing this before a thread is
  created is preferred. Later might get tricky.

Sebastian
