Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9007E1F941
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 13:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746020739; cv=none; b=X6AtP8RMCrXXGR2akQpfJA2pnSZt6aG4TiB2XjLg/79B7HSYAedY51D6vUT7g0YCV1Y+2i9Hgq8qK/W3BoSkf5MdmLKmYYxUhuv0KLeta/GAQTD8Mf4nTR1JZLjFcRwoPhw6XyJr8usQvn2KA7kquZlCjBROXdhVmdR4Daymbk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746020739; c=relaxed/simple;
	bh=3FfutpMKrNfBR2/l99g1e02PoDEb4lX4KVKzxY/cV74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cIDjn+DtEpH0BmunSkaVlKJQ4TE1vsfKYb6omTvuDw+o6IXmkQWyR7Iz4+XnwseOWoFQ9BPHaR1vfcXjqzFpLUTxFsemNk5EvRPQZHlEvpO0yXa8u0fYpI67W5CpVZr3yS7OAKXdO3dnJR9ACuwWD3RgkfZPmGj8Ld5mRv6O2rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZYkFQ5pE; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZYkFQ5pE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746020736;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=k90/V1Lu0i517FPuuLC36ybJso/3NYI6nHmrS9bCtMA=;
	b=ZYkFQ5pEVbHiLVpFKcovQ41rtNNFFZ5kPRn6mMbsxKGRCF3KNAqAm9enSPGTCLO5Dj1TXa
	Z1HhdHIxLVQZCkzOLS07HC7jkszfH+/qFlo6u6mHtLzgFWrx8WaGnLE1alDanvfsCykYjl
	TxztF3ZLVkqA8LmsMu4qKD9ATQOR5k4=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-76-ADVg4nJhMxe7l5zi5TTBbw-1; Wed,
 30 Apr 2025 09:45:31 -0400
X-MC-Unique: ADVg4nJhMxe7l5zi5TTBbw-1
X-Mimecast-MFC-AGG-ID: ADVg4nJhMxe7l5zi5TTBbw_1746020730
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8BC4218001CA;
	Wed, 30 Apr 2025 13:45:29 +0000 (UTC)
Received: from pauld.westford.csb (unknown [10.22.80.236])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B95F6180047F;
	Wed, 30 Apr 2025 13:45:25 +0000 (UTC)
Date: Wed, 30 Apr 2025 09:45:22 -0400
From: Phil Auld <pauld@redhat.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: John Stultz <jstultz@google.com>, LKML <linux-kernel@vger.kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>, kernel-team@android.com,
	peter-yc.chang@mediatek.com
Subject: Re: [PATCH v3] sched/core: Tweak wait_task_inactive() to force
 dequeue sched_delayed tasks
Message-ID: <20250430134522.GA133753@pauld.westford.csb>
References: <20250429150736.3778580-1-jstultz@google.com>
 <20250429153605.GA69823@pauld.westford.csb>
 <20250430124425.GN4439@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430124425.GN4439@noisy.programming.kicks-ass.net>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

On Wed, Apr 30, 2025 at 02:44:25PM +0200 Peter Zijlstra wrote:
> On Tue, Apr 29, 2025 at 11:36:05AM -0400, Phil Auld wrote:
> > Hi John,
> > 
> > On Tue, Apr 29, 2025 at 08:07:26AM -0700 John Stultz wrote:
> > > It was reported that in 6.12, smpboot_create_threads() was
> > > taking much longer then in 6.6.
> > > 
> > > I narrowed down the call path to:
> > >  smpboot_create_threads()
> > >  -> kthread_create_on_cpu()
> > >     -> kthread_bind()
> > >        -> __kthread_bind_mask()
> > >           ->wait_task_inactive()
> > > 
> > > Where in wait_task_inactive() we were regularly hitting the
> > > queued case, which sets a 1 tick timeout, which when called
> > > multiple times in a row, accumulates quickly into a long
> > > delay.
> > > 
> > > I noticed disabling the DELAY_DEQUEUE sched feature recovered
> > > the performance, and it seems the newly create tasks are usually
> > > sched_delayed and left on the runqueue.
> > 
> > This seems odd to me. Maybe I'm just misunderstanding something but
> > I don't see how newly created tasks should have accumulated enough
> > runtime to have negative lag that needs to be decayed. 
> > 
> > That said, I think it does make sense to dequeue in this case. 
> 
> Well, they start at 0, any runtime will likely push them negative.
> 

I thought they "made a request" and got a slice when entering the
competition so would not immediately go negative when executing.
It's now been a while since I read the paper though...

Starting at 0 (service that it ought to have is none) and going
immediately negative seems to imply never having positive lag. But,
like I said, probably just misunderstanding something :)



Cheers,
Phil
-- 

