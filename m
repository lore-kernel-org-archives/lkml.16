Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385172063D7
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 14:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738592871; cv=none; b=F6zwUcmgbSysYQCHjRB4ZWf9XFV+yS84VZRmd/f3n7fdFKbSGrql0eubfiQItoq5GF42OiDFof9Ir9kO57o/bJPe2S/szA5TB3vYrWHYkmnJxjKiCTrLdS0+GScUvqA7FZSFunu4vJjdMCT34XOfGHCs2PKObJ5z/NNnBphQG2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738592871; c=relaxed/simple;
	bh=GxwFoLlSJdqqUis2C5JDBGnJsOwNSZkIVOZMR4U7ngg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nBpepnA7WMwKMp/HYZTU9bPUjGGP60J2d2iZOjBd+MFltiqnZaKBO+FfOOD31WIdmPh5zYUNmWBRi5ppuAX7foQOQ5GdtglgI0gw2qXdmLjG5cbFr5mqBlLJhBYzmjQAf6/kumzfNNYht7WC1K2O7wD6n22Y76SEf6oqoDc0kxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=GUltqbBA; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="GUltqbBA"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=lS1m6otJ19LvMQIThmddQhHubfGv7UkNSWZYOmK+a6Y=; b=GUltqbBA+s+rHIayfs+GVDtGet
	9+/FEYvRwc70WOSISGGn2Y/oKiyG+dSEfVjNpUnwrkcbTmpeUgBBzOb5YoYbIPOO0LFRbRGVzwoQi
	BkH5AM9W5kbvr4n0YdbNc+35E+fSBPf184JLU8fChVxl3HPAp+IDIkeC8pSY45s2dV2QamQEBCnHX
	GlWicplr7zvCfWZvgl2OQGCe8ZIl2cC8q7JDbmBm5S+Cv8AwkIvur0xS2JdktONViOl99TyZHVPJy
	CNp3lqEr0NR7AMxc8pTaKOaLZiWJtpbAR6yoY+K3seWcV1weCcveCUwviif8fTHMTzqjxJeYkzZ/q
	3ZPUTb1Q==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1texQO-0000000G6B9-0gfe;
	Mon, 03 Feb 2025 14:27:44 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id BA1AF300310; Mon,  3 Feb 2025 15:27:43 +0100 (CET)
Date: Mon, 3 Feb 2025 15:27:43 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v8 03/15] futex: Add basic infrastructure for local task
 local hash.
Message-ID: <20250203142743.GI7145@noisy.programming.kicks-ass.net>
References: <20250203135935.440018-1-bigeasy@linutronix.de>
 <20250203135935.440018-4-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203135935.440018-4-bigeasy@linutronix.de>

On Mon, Feb 03, 2025 at 02:59:23PM +0100, Sebastian Andrzej Siewior wrote:
> The futex hashmap is system wide and shared by random tasks. Each slot
> is hashed based on its address and VMA. Due to randomized VMAs (and
> memory allocations) the same logical lock (pointer) can end up in a
> different hash bucket on each invocation of the application. This in
> turn means that different applications may share a hash bucket on the
> first invocation but not on the second an it is not always clear which
> applications will be involved. This can result in high latency's to
> acquire the futex_hash_bucket::lock especially if the lock owner is
> limited to a CPU and not be effectively PI boosted.
> 
> Introduce a task local hash map. The hashmap can be allocated via
> 	prctl(PR_FUTEX_HASH, PR_FUTEX_HASH_SET_SLOTS, 0)
> 
> The `0' argument allocates a default number of 16 slots, a higher number
> can be specified if desired. The current upper limit is 131072.

Hmm, I would expect 0 to disable the local thing.

Now, I realize this is somewhat tricky, since there might be futexes
inside it. But mapping 0 to some default value seems.. well, odd.
