Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E6217A2F6
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 02:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745287866; cv=none; b=DARqNY7oslEUA5wKGLUSXhMMA4ZSAf8t3JidojOQeK1vHQcDnMnVHcP4bPL+7guO6nteX/eULyW4U2NekA0Xyxb+sYFuUrNEc2lF7swBDpRoAUIm4ohU0Wu6IYppYua2Om6i2oE3b7x1vkzxJ6hDO/hZj/7FljVTu8OB73KXdA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745287866; c=relaxed/simple;
	bh=wSB3TcrHzsBMjKoXN8XX6pC5Ipzx41I/J0mpvh4KtQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=npN+F2//5nX6Xjz8xJxFGSUs1BbkNTSustRvja4CYM0YBSHjjrKsDtgnf9EkxGWh6rm/8HLJkrV4z5anHVWH2imVRbRwSr08Cy7EKBBK35loNmtuhM+T+s77rKQFeHRE0evAJoI+2uyLzLEuPAA1WP3PTe/iMjPO3FULNuEzlZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=fcE1sA/A; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="fcE1sA/A"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2295d78b433so52281455ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 19:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1745287862; x=1745892662; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1vG3Eqn/qxv/B7+u6U4NrwV7EYTDwknsScUPHvYhDmE=;
        b=fcE1sA/AVroCLKtlywQXlYwzoo/t/m/BuM0WL43Iq/DlQC7xeqzRqoyeXJTN7iGM07
         Cr4VV4WQow8OycaM2RtOyWc0phQ/8Dw7bHZpUY0GjCmzsISMHNEtG7ydBxtFq1JPZPbj
         CIvNfgWEn9vU6Le2BxsDVfMA0mj0nSl/6tM1+EbcE+CSnWaqVlb9Vf39t9ziTL/5I7qz
         VxpHiVMQ2eGvKyXLq9e8x6dZlnHKHz4N+5gBt4/Roqs846c4NLYm/vrKahZi+BztVYSJ
         HNZwrWFVj9j2AMEpVWOVpE5pT2Xwu+gQdBUWukGPx1Ip83YjynUBY/WTVO+QSo6vcBK7
         Qz8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745287862; x=1745892662;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1vG3Eqn/qxv/B7+u6U4NrwV7EYTDwknsScUPHvYhDmE=;
        b=jVtplshqpYqIbaoUrNM/gjTfD1mTlKdzcg/L4fW/9aj5jndfRbnEoz8PStR73OgMOF
         XZV9OMHZTQRuFcePRMPq3BwVRuFp9z6vSFilkDCQ9srZ70ZOSpu71vi/kYqNuChdLWTb
         H/rUgl1YA0C0qgzaPSv+rpZM7PGFApL3eHr20XfNMIIFcakQuWkKlXifpsO1++h2QNO1
         dbjcMRxYxRmIYMELxaLmST9VPcaypb00faSPAo4yFmjIrVOFMSMZmaZ2oS7AUK6sqqtk
         d0Al86Nm+6JWEHq97a8zuNHrLO2eEvitZ/xQf33pWQjXkj/s76n5DCb0sDeaRUpp32Sx
         l3lw==
X-Forwarded-Encrypted: i=1; AJvYcCXQnVmc6BH8HRpax3Uw7YvpLiEGzTsL8XBBQiYpuR33piiiLEsghHeNVM6y801ywOVXgMaFJcVPfmxMRjk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCorZJklpUbD6C2LfKVEromi7MREZX2o1z+FwL9cJhDTiBjnJA
	5iXCzpPobk4dn82Y3RIjY/hYmISlIDsDda9JuS6cyGGhyTj2EGwLmpZgn7+6Tw==
X-Gm-Gg: ASbGnctlKOvwAt2zBYNvq80kb2sLMEdStV3JWBJsfoGzN5J8xOPd2U7qG4arw0vAe+v
	u/VUjQvL+kaTJ8zNHaAqINmHA3oLgiPjq76Pe1hW/sQQ2ZKqBf4RICfeP0iv7KNNHNBTUku/O8f
	N09bLLYPhAzH2mfbvYvIJ22vMVmNjeMTZLy1HunruRt007Oz0O6Z6TO3+QsJNBVaTp7Ebgmi8zn
	BKg+liq4fPiqy5dDL+pqbCbZmERdG+NNYfaQMMo9cUFph7wRgRKSGaebA6jXEyuYaeENzr2T6Lb
	OCex9D37OBfELWv01Ho087AFwn2022gZesy3r3fc
X-Google-Smtp-Source: AGHT+IEKgkwJZGXIQNV/qQ0PIK6gbpHYTy39fVNFv3bQmmf5WCjrN3PHpIaY9ZJRQQWqBERs2hWSRQ==
X-Received: by 2002:a17:902:f602:b0:224:160d:3f5b with SMTP id d9443c01a7336-22c536207c7mr210682035ad.49.1745287862215;
        Mon, 21 Apr 2025 19:11:02 -0700 (PDT)
Received: from bytedance ([115.190.40.11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50ed1d63sm72855165ad.198.2025.04.21.19.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 19:11:01 -0700 (PDT)
Date: Tue, 22 Apr 2025 10:10:54 +0800
From: Aaron Lu <ziqianlu@bytedance.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	Florian Bezdeka <florian.bezdeka@siemens.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Ben Segall <bsegall@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Don <joshdon@google.com>, Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Xi Wang <xii@google.com>, linux-kernel@vger.kernel.org,
	Juri Lelli <juri.lelli@redhat.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Chuyi Zhou <zhouchuyi@bytedance.com>,
	"Sebastian Andrzej Siewior," <bigeasy@linutronix.de>
Subject: Re: [RFC PATCH v2 0/7] Defer throttle when task exits to user
Message-ID: <20250421120648.GA3357499@bytedance>
References: <20250409120746.635476-1-ziqianlu@bytedance.com>
 <cee5bca4e2b024d3406b40b84c0d5db91c7d276f.camel@siemens.com>
 <20250414120407.GC3558904@bytedance>
 <7483d3ae-5846-4067-b9f7-390a614ba408@siemens.com>
 <0a06f6c4-5d69-4fd1-badd-92fd55d8f38d@amd.com>
 <55687bb5-7e8a-4d7d-a597-6f97087cab32@siemens.com>
 <5e919998-338c-4055-b58a-e4586134956c@amd.com>
 <f5111e9f-bdee-480a-b29a-d8d1c207a600@siemens.com>
 <ec2cea83-07fe-472f-8320-911d215473fd@amd.com>
 <e65a32af-271b-4de6-937a-1a1049bbf511@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e65a32af-271b-4de6-937a-1a1049bbf511@amd.com>

Hi Prateek,

On Tue, Apr 15, 2025 at 09:19:20PM +0530, K Prateek Nayak wrote:
> Hello Jan,
> 
> Sorry for the noise.
> 
> On 4/15/2025 4:46 PM, K Prateek Nayak wrote:
> > Hello Jan,
> > 
> > On 4/15/2025 3:51 PM, Jan Kiszka wrote:
> > > > Is this in line with what you are seeing?
> > > > 
> > > 
> > > Yes, and if you wait a bit longer for the second reporting round, you
> > > should get more task backtraces as well.
> > 
> > So looking at the backtrace [1], Aaron's patch should help with the
> > stalls you are seeing.
> > 
> > timerfd that queues a hrtimer also uses ep_poll_callback() to wakeup
> > the epoll waiter which queues ahead of the bandwidth timer and
> > requires the read lock but now since the writer tried to grab the
> > lock pushing readers on the slowpath. if epoll-stall-writer is now
> > throttled, it needs ktimer to replenish its bandwidth which cannot
> > happen without it grabbing the read lock first.
> > 
> > # epoll-stall-writer
> 
> So I got confused between "epoll-stall" and "epoll-stall-writer" here.
> Turns out the actual series of events (based on traces, and hopefully
> correct this time) are slightly longer. The correct series of events
> are:
> 
> # epoll-stall-writer
> 
> anon_pipe_write()
>   __wake_up_common()
>     ep_poll_callback() {
>       read_lock_irq(&ep->lock)		/* Read lock acquired here */

I was confused by this function's name. I had thought irq is off but
then realized under PREEMPT_RT, read_lock_irq() doesn't disable irq...

>       __wake_up_common()
>         ep_autoremove_wake_function()
>           try_to_wake_up()		/* Wakes up "epoll-stall" */
>             preempt_schedule()
>             ...
> 
> # "epoll-stall-writer" has run out of bandwidth, needs replenish to run

Luckily in this "only throttle when ret2user" model, epoll-stall-writer
does not need replenish to run again(and then unblock the others).

> # sched_switch: "epoll-stall-writer" => "epoll-stall"
> 
>     ... /* Resumes from epoll_wait() */
>     epoll_wait() => 1			/* Write to FIFO */
>     read() 				/* Reads one byte of data */
>     epoll_wait()
>       write_lock_irq()			/* Tries to grab write lock; "epoll-stall-writer" still has read lock */
>         schedule_rtlock()		/* Sleeps but put next readers on slowpath */
>         ...
> 
> # sched_switch: "epoll-stall" => "swapper"
> # CPU is idle
> 
> ...
> 
> # Timer interrupt schedules ktimers
> # sched_switch: "swapper" => "ktimers"
> 
> hrtimer_run_softirq()
>   timerfd_tmrproc()
>     __wake_up_common()
>       ep_poll_callback() {
>         read_lock_irq(&ep->lock)	/* Blocks since we are in rwlock slowpath */
>           schedule_rtlock()
>           ...
> 
> # sched_switch: "ktimers" => "swapper"
> # Bandwidth replenish never happens
> # Stall
> 
> From a second look at trace, this should be the right series of
> events since "epoll-stall-writer" with bandwidth control seems
> to have cut off during while doing the wakeup and hasn't run
> again.
> 
> Sorry for the noise.
> 

Thanks for the analysis.

I'm testing this reprod with this series and didn't notice any issue
yet, I'll report if anything unexpected happened.

Best wishes,
Aaron
