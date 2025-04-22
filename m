Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155AC202F79
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 09:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745315735; cv=none; b=fT3QzmM7JAfH7S7QY4GJ5N8FWlTGHxEC9UShZCGXzxJsDpKR53FSsRxjLN/QARypi/VTIiChw5sFvxlstnWYEFx15WRsJHmXvyf2fqTFCvqAA/sAl6GbDnArg/6+DNwV29GoHXdZHqMOUkfcPf7o7H2s8uRw2YJ4VTEK29S3TbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745315735; c=relaxed/simple;
	bh=GVeCytkqBHTIFfuO/f3/wRrcO3CkD6UJCYhLUQrST38=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YaCAm7vJZreRr1rZcx7hzCUTOJuw+24wvUFu6xLiqIWfHzY6WXajKqKK4cDaJuLIMWQ0hnSMghTklHnsqsqAoMSX7uTpum90HjZSBNMJ893uIqLU8+RDxJSPfYUNbfjUkk7svSQnoxAdz0kPeUsgta6RFykrHChpq/nlL7X13zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CxOXTgwv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CxOXTgwv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36325C4CEE9;
	Tue, 22 Apr 2025 09:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745315734;
	bh=GVeCytkqBHTIFfuO/f3/wRrcO3CkD6UJCYhLUQrST38=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CxOXTgwvIY/E9QTBVfF/DAMGXU7V/hqauHR3ktG2ziiuPSAsq1vsywKIeVMGC6rLl
	 RsW7Z4y5rAHuAXBEAKh0Iv3QCxTzEoZ1aTwQY6XHF6GLor8JlT39gY8XAbG2Mxghu6
	 WQYMVanONvS34Bdj6FwMq8NBUIuYp8vEWE126937SjnYYMi+cxSAoPcCJLuY1ihu9+
	 S8vK2PphSOzordgNt9UxxCsY9mNvmIanzRb5QAyOj3LjrrcVIyxLtHfnTV+zurohgY
	 5OccrkMTlRteTZl7wHZLYc9eOr2vGipqZdjhuVR88WwM2amwZvngNOyJGzMyqgM7ud
	 GB6Ht1F2Rt20w==
Date: Tue, 22 Apr 2025 11:55:31 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: John Stultz <jstultz@google.com>, LKML <linux-kernel@vger.kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>, kernel-team@android.com,
	Frederic Weisbecker <fweisbec@gmail.com>
Subject: Re: [RFC][PATCH] sched/core: Tweak wait_task_inactive() to force
 dequeue sched_delayed tasks
Message-ID: <aAdnk0PH6H5q7nGz@pavilion.home>
References: <20250422044355.390780-1-jstultz@google.com>
 <20250422085628.GA14170@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250422085628.GA14170@noisy.programming.kicks-ass.net>

Le Tue, Apr 22, 2025 at 10:56:28AM +0200, Peter Zijlstra a écrit :
> On Mon, Apr 21, 2025 at 09:43:45PM -0700, John Stultz wrote:
> > It was reported that in 6.12, smpboot_create_threads() was
> > taking much longer then in 6.6.
> > 
> > I narrowed down the call path to:
> >  smpboot_create_threads()
> >  -> kthread_create_on_cpu()
> >     -> kthread_bind()
> >        -> __kthread_bind_mask()
> >           ->wait_task_inactive()
> > 
> > Where in wait_task_inactive() we were regularly hitting the
> > queued case, which sets a 1 tick timeout, which when called
> > multiple times in a row, accumulates quickly into a long
> > delay.
> 
> Argh, this is all stupid :-(
> 
> The whole __kthread_bind_*() thing is a bit weird, but fundamentally it
> tries to avoid a race vs current. Notably task_state::flags is only ever
> modified by current, except here.
> 
> delayed_dequeue is fine, except wait_task_inactive() hasn't been
> told about it (I hate that function, murder death kill etc.).
> 
> But more fundamentally, we've put so much crap into struct kthread and
> kthread() itself by now, why not also pass down the whole per-cpu-ness
> thing and simply do it there. Heck, Frederic already made it do affinity
> crud.
> 
> On that, Frederic, *why* do you do that after started=1, that seems like
> a weird place, should this not be done before complete() ?, like next to
> sched_setscheduler_nocheck() or so?

You mean the call to kthread_affine_node() ? Because it is a default behaviour
that only happens if no call to kthread_bind() or kthread_affine_preferred()
has been issued before the first wake up to the kthread.

If kthread_affine_node() was called before everything by default instead
then we would get its unconditional overhead for all started kthreads. Plus
kthread_bind() and kthread_affine_preferred() would need to undo
kthread_affine_node().

Thanks.

-- 
Frederic Weisbecker
SUSE Labs
