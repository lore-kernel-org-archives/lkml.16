Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87FF9266590
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 15:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744212034; cv=none; b=UH1v0FqT58cmcspqytmLDeofjdkb5FnMm1qpfENCuTFkb4awuA1HQ3yNi8WVTuVln9m/TFSpgNZ2u50TgHzGT/n0yJrnWrVl9CiPFSOtI6HUejSsSFNhTeQtS/kkHy0S37fABsy82V95TW4je+jhlni8rGTeqzTTuvZAFjVnCkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744212034; c=relaxed/simple;
	bh=wvxh8lwoLsyUbbz4RwtGZ5qYbKVzbyQ1oKpLckjWKCo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J8CV5UPYUcYoqHRJv2UpUxSE83k1Rx2zkzK3m3Tv7I5eFcPOfVeSXNQcszL243NguFI4UzUgK2X7ixjF/DH8oj6PCdLpbhYfJARv8Om2eUCdoZLgE/X0FFDtewBt2NuWBvl40RW5jLrwnUdqAImzook9JPeieXP8xmo65bn1TeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=FK2pdF+r; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="FK2pdF+r"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=gshT9vClu0C9NalEwM3sCiZY65lnHDMp99yP0jkhTiE=; b=FK2pdF+rxcaCs98eDT57ylJ8lZ
	NUXwUrO709u/Gp5I4I9QUWH8OhUrLIUJY4vHtlwPhLDtASqjxjiea4XIBiAJqCNB82BsvJrzxtptN
	LAlQ9elOT5+GXXkYZVxmcWiND0FdyEX8+MXdl2Jko4YVpvPFQQZfcVqsBP+cLYWdxfuAO4EiFKlX7
	fWrPEJQu4UYfDX2WTFLg3jKq+kwb7O9D/EwsQAUvKWZm6BCkVoN694p6SAh/AjE0ItTem9aFee+YM
	mciCCAPhHIXpJq/iTO54UHf6ziJ7iUgUV/IpJmNj6+nrFWOd5vATp7XsqmXp8FSvb39jBDQ0o4j+r
	Y4LRjXWQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2XE1-00000008duw-205n;
	Wed, 09 Apr 2025 15:20:25 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 167353003AF; Wed,  9 Apr 2025 17:20:25 +0200 (CEST)
Date: Wed, 9 Apr 2025 17:20:25 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Gabriele Monaco <gmonaco@redhat.com>, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Ingo Molnar <mingo@redhat.com>,
	"Paul E. McKenney" <paulmck@kernel.org>, linux-mm@kvack.org,
	Ingo Molnar <mingo@redhat.org>, Shuah Khan <shuah@kernel.org>
Subject: Re: [PATCH v12 2/3] sched: Move task_mm_cid_work to mm work_struct
Message-ID: <20250409152025.GK9833@noisy.programming.kicks-ass.net>
References: <20250311062849.72083-1-gmonaco@redhat.com>
 <20250311062849.72083-3-gmonaco@redhat.com>
 <20250409140303.GA9833@noisy.programming.kicks-ass.net>
 <c0df7480-1c18-421f-9348-2d39b7bebb49@efficios.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c0df7480-1c18-421f-9348-2d39b7bebb49@efficios.com>

On Wed, Apr 09, 2025 at 10:15:42AM -0400, Mathieu Desnoyers wrote:
> On 2025-04-09 10:03, Peter Zijlstra wrote:
> > On Tue, Mar 11, 2025 at 07:28:45AM +0100, Gabriele Monaco wrote:
> > > +static inline void rseq_preempt_from_tick(struct task_struct *t)
> > > +{
> > > +	u64 rtime = t->se.sum_exec_runtime - t->se.prev_sum_exec_runtime;
> > > +
> > > +	if (rtime > RSEQ_UNPREEMPTED_THRESHOLD)
> > > +		rseq_preempt(t);
> > > +}
> > 
> > This confused me.
> > 
> > The goal seems to be to tickle __rseq_handle_notify_resume() so it'll
> > end up queueing that work thing. But why do we want to set PREEMPT_BIT
> > here?
> 
> In that scenario, we trigger (from tick) the fact that we may recompact the
> mm_cid, and thus need to update the rseq mm_cid field before returning to
> userspace.
> 
> Changing the value of the mm_cid field while userspace is within a rseq
> critical section should abort the critical section, because the rseq
> critical section should be able to expect the mm_cid to be invariant
> for the whole c.s..

But, if we run that compaction in a worker, what guarantees the
compaction is done and mm_cid is stable, but the time this task returns
to userspace again?
