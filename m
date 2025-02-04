Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D46E206F17
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 09:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738661296; cv=none; b=qFrZyORUsss+j3D2XcTtDkPHYWPE6XW5ajw9tSeQFP6d1wujbU974gXfQ6cujgkxFV0t9w2umicedLcihT/aD08//NLBvpVKRF7D2LXVYlKBhZsshzyEIgsscbJDQFrZOKH4pvzYIZgyh0gxgYqu1rtz2tcJFSVX61l9Akm8X28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738661296; c=relaxed/simple;
	bh=65JVhxdXQGsMohzOnNWRBzY67jDzX0XfRFA5pfUh9no=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=R8NQQnKKs809oGPFmMJmZj/URCF41MqdIWVO3AHLjwYv8gziWSAGhd5gJYK5ZTDeADLoXQgFBtbZU54WMzHXwHKOFyc/a0MwPpgMLbzZ+XwEzQ1ZDiJwN81lYEkr40wMWNl8Q98cL9TFaRwVZVYRh9mddb2ufCyj5clPi7srkfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=mCGhPS0D; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=A1r3nAQJ; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="mCGhPS0D";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="A1r3nAQJ"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738661292;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IxUhzMpZbBLI24vAgo0RXEQvd0b3kP29hyIxwVLwatQ=;
	b=mCGhPS0DHUwuRWQm44gBhIszb1e72y/U7MORY7e66FXUq8YfBscCibIJBeEuKpwLftqM8l
	G+OkrEUa7O4vwTxbVRfpXNlMgEKmrc79ZU0m/vlE+y5DPAFaNcv8rk0nF5yO2RaYPT/Z2t
	JoQ8MkcwIJyuG1SemB8Yxc3x+5HJlBylEvoCzTIc+q8IRnc2LA2/eXJtZRg+5ptfqUyP9F
	RDMNarbt+REFMqA/GlLMwTHLF893O3yDYRGVXSvErl00k3BqmV8EowThZTH46F3dIR5m6d
	Fkcv9rDEoey8/f3oerIy6TyoiNt8EgQjQJwlK0mzxvQEMh/m/VHnzL/JcpN65g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738661292;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IxUhzMpZbBLI24vAgo0RXEQvd0b3kP29hyIxwVLwatQ=;
	b=A1r3nAQJfG/G6wJiuEXiKyr4CHoP6qmmv5LtlQPq/j+V1yTRs7ebuXhDYIcbs90Nf2BW+Y
	F5Ik50dM03CFevDA==
To: Peter Zijlstra <peterz@infradead.org>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org, =?utf-8?Q?Andr=C3=A9?= Almeida
 <andrealmeid@igalia.com>,
 Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>,
 Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
 Valentin Schneider <vschneid@redhat.com>, Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v8 03/15] futex: Add basic infrastructure for local task
 local hash.
In-Reply-To: <20250204084135.GN7145@noisy.programming.kicks-ass.net>
References: <20250203135935.440018-1-bigeasy@linutronix.de>
 <20250203135935.440018-4-bigeasy@linutronix.de>
 <20250203144101.GL7145@noisy.programming.kicks-ass.net>
 <20250203155251.cAKJlgIZ@linutronix.de>
 <20250204084135.GN7145@noisy.programming.kicks-ass.net>
Date: Tue, 04 Feb 2025 10:28:11 +0100
Message-ID: <87ldumnjo4.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Feb 04 2025 at 09:41, Peter Zijlstra wrote:
> On Mon, Feb 03, 2025 at 04:52:51PM +0100, Sebastian Andrzej Siewior wrote:
>> On 2025-02-03 15:41:01 [+0100], Peter Zijlstra wrote:
>> > Notably, I'm also still thikning about all that pending FUTEX2_NUMA
>> > stuff.
>> 
>> With local-hash there is still room for FUTEX2_NUMA?
>
> Yes, single process can span multiple nodes, and then you still get the
> cross node contention issues.

This is strictly about process private futexes, while FUTEX2_NUMA covers
both shared and private futexes and helps to avoid the hash collision
and resulting contention problems which are caused by the current global
hash.

With the private futex seperation you obviously get the cross node
memory access problems, but not the general contention issues which
FUTEX2_NUMA tries to address.

Thanks,

        tglx

