Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5A82E62C
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 07:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746429286; cv=none; b=NtU8g710Qlu/RRqI+qQNV207zFpU/zaNJBG9ySLlN5/L4iJSNfAB4AukJ2gGsTYJ7zLd4O5cM9OCFJVhuuyQJEz7qe4Q2NtT2hg4mkIbhM4QFAn6HQN+HVTlN196sErE7wj7D4Z2O7nGuDM6QxqVfJGep3ptnN/4xMHKeOlt6Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746429286; c=relaxed/simple;
	bh=ntvgR+0RhYHXBZFPpk/GytmrkyvhnGwsT0YHZ3OosHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ftpAqiMS9gMkNPsQP0C9EjiofbeZqYj7VXIKcAu0aLTe1uUISyvd3h6XoyQwYv7aGZhHBIFVbYbo88mgDHtKJGgYcssPAXeIASkt7U2RIw7602lgp6zllmnbMMLl7FM8AI+YGmZDjmAEMMhUKwtJoE00QuTfkBRqZK0wArgG1yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=jjN/yH8T; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=3kk6zNl3; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="jjN/yH8T";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="3kk6zNl3"
Date: Mon, 5 May 2025 09:14:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746429283;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FHPB3XEe0MVRw2MyKFTBl8Q3rrWxQtgQWTIUHObvouI=;
	b=jjN/yH8T9vN6zYWCDUPD2t+Mvu0wbNKHloKXenBu3pNKe6gmsoDndMYH5IwcIyYipJoZNw
	bgK3heiThvOwAoaFA6A/En67btHyHrMTYq+syIlml6kz5uIN7TL9Xd35kM8CNid+HMPfFB
	zdvw8SI1+ynqDtKk5PglXKEBmhJypttv578P4giulfTi1RjSrLwjAz38wR4QXOTA/jbED7
	MqVcmj1VVqv3YI3803L5mjLRtlDzbGrjuw6m8Xm3gM7oY0yWJqfqLYYYgvRKDdV0LoD6MJ
	8qUjjYCHmQAeu9UCGm0ikvve+v6Lj09nhC2GRF7kL+GdWDOVWb6NqAlAKvfybQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746429283;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FHPB3XEe0MVRw2MyKFTBl8Q3rrWxQtgQWTIUHObvouI=;
	b=3kk6zNl3kE6OD6HkwzWD/cbJVgJjKa6VjMpeH1hAZh7HzM3Pbga1bNAK+7/AdBgzzTFeE3
	Tch6irunWRWeUOBw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org,
	=?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Waiman Long <longman@redhat.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>
Subject: Re: [PATCH v12 15/21] futex: Allow to make the private hash immutable
Message-ID: <20250505071438.C4_3Mx0S@linutronix.de>
References: <20250416162921.513656-1-bigeasy@linutronix.de>
 <20250416162921.513656-16-bigeasy@linutronix.de>
 <20250502180154.GY4439@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250502180154.GY4439@noisy.programming.kicks-ass.net>

On 2025-05-02 20:01:54 [+0200], Peter Zijlstra wrote:
> On Wed, Apr 16, 2025 at 06:29:15PM +0200, Sebastian Andrzej Siewior wrote:
> > My initial testing showed that
> > 	perf bench futex hash
> > 
> > reported less operations/sec with private hash. After using the same
> > amount of buckets in the private hash as used by the global hash then
> > the operations/sec were about the same.
> > 
> > This changed once the private hash became resizable. This feature added
> > a RCU section and reference counting via atomic inc+dec operation into
> > the hot path.
> > The reference counting can be avoided if the private hash is made
> > immutable.
> > Extend PR_FUTEX_HASH_SET_SLOTS by a fourth argument which denotes if the
> > private should be made immutable. Once set (to true) the a further
> > resize is not allowed (same if set to global hash).
> > Add PR_FUTEX_HASH_GET_IMMUTABLE which returns true if the hash can not
> > be changed.
> > Update "perf bench" suite.
> 
> Does the below make sense? This changes arg4 into a flags field and uses
> bit0 for immutable.
> 
> (the point where I got upset is where arg4==2 was accepted :-)

I see, it makes sense. It makes sense and leaves room for later.

Sebastian
