Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE23B1B4F0C
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 09:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738919279; cv=none; b=vAc6BLrQwrPXuOTugo32QO8T2aPN/cwzmGTmhyHFjnmrDsSxqtgFBs9TUd6VBg+Bg/tIN85Mii8w3iysB+w4RlkTF4fRrrZd+8uWwxCe1d3NBcLoW/6dMB12kcfO8u9G+Z/GkSR20jZ4mVbDGEwQZohwvjdxQHEHLARbyJocfxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738919279; c=relaxed/simple;
	bh=RzgMObT/rzAH3vCHH7FuwwVdkjHG6MOSST3vEqa7WSs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l0ArTcpSVgiQcSuDCRKpV3BL6XCX+bRy0ctdqB3ObqnlpfkhdpmxeE3TsF7RfQxayzWWJjs0vBgUURDZ/Ut91qwMWEImOLMSJsG2/TDNLNqhWB1OKTG7FaOht7EpTGm82CuHU8PT/KxrF5f7QR2imzSbBoURNNlBjrX1/X6VBE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=O5KSfCiY; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=YB16Lpm8; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="O5KSfCiY";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="YB16Lpm8"
Date: Fri, 7 Feb 2025 10:07:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738919270;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GH6hO7lZGavsfKmBNtmJaMBznUZmzJg44wq2hRWXts4=;
	b=O5KSfCiYGgH0PzQ7Ksbjg8fiz0RM8Q30hpV1QSILJgFqXLaLooO+bVVx3m3tZ4aVyCqFli
	Blx9F4wm1d0NdKo+CVWDm0sMNQXBCfBp0CaUvxtO+tYqY/ZR/pY8+QPHwkxZF8W7Caw9NR
	xru/5WScoSB2fjaGybN8geqWiJrwrQWHBcNxFoghTvyiQVNhAZA4rJT+ixuk5l6ZwDIG/1
	WEfJhrlX1hEB9euiebX3xWsgjG/5XlvHuz65gWGhYs5SIJVkUPgrK0KvN8u0dQballd2rr
	knjNLQ/6JuhqStjuMOi8RZ8a9/nqsLomo3QuBzqSHnOKrChPLj+/16YfwrXAuw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738919270;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GH6hO7lZGavsfKmBNtmJaMBznUZmzJg44wq2hRWXts4=;
	b=YB16Lpm8kpJjjImbwTxAt3h1yMYjcKBF+cqpApT2Ox46iK0i/UwAs0XJfdK0r4DOV8yvsL
	rDFaT1RU8c5eYxDA==
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
Subject: Re: [PATCH v8 13/15] futex: Resize local futex hash table based on
 number of threads.
Message-ID: <20250207090749.O9ZoqVBL@linutronix.de>
References: <20250203135935.440018-1-bigeasy@linutronix.de>
 <20250203135935.440018-14-bigeasy@linutronix.de>
 <20250204102146.GT7145@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250204102146.GT7145@noisy.programming.kicks-ass.net>

On 2025-02-04 11:21:46 [+0100], Peter Zijlstra wrote:
> > +	if (IS_ENABLED(CONFIG_BASE_SMALL)) {
> > +		buckets = 2;
> > +
> 
> Or... you just disable the local thing entirely for BASE_SMALL and have
> it fall back to the global hash.

If we don't assign a local hash on auto resize for CONFIG_BASE_SMALL
builds then we need to also disable PR_FUTEX_HASH_SET_SLOTS. Not against
it at all, just pointing out.

The reason is that there is at least one spot (exit_pi_state_list())
where I need a stable view of the hash. I ensure this by grabbing a
reference so this pointer does not change.
If this local hash is set to NULL then we are single threaded and it can
not be assigned. If we are multi threaded then the pointer is not NULL
and PR_FUTEX_HASH_SET_SLOTS based assignment will be delayed.
But if we are multi threaded and the local hash is set to NULL then it
could be assigned at which point the whole logic breaks.

Sebastian
