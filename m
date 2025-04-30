Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558412DC77B
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 01:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745976854; cv=none; b=WpV6pe5f3NIS/gpW4qlEOc3fbad9bsvAHhGRyrVnQj7O9+jhSoL+jhLiBSowHJydImnz4f9ueQJ+q5B/nzMElbT89ZTHaYSQNLtuc/Cj6GvbZky26cNn0MACY1WKpcEiDv08cTfgBsrbnqVgHmH/g5m0u+0l/vEkZ6gd8mx8Lww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745976854; c=relaxed/simple;
	bh=Qzsizl9xOR3WbZSV2R5ClOru9CUZ0Rg5dLl0VpimHz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TNtfbbTdLpAWsi1zl69uaZXj7WJaSn3hEmhCGXXsDD9Jj5Ofmj+luMJ0U+lEkyrZ1z5X1jeq7Be4vgaO+c9dKlPvvvo0x1uoyhqggHcMLz9kVrxK+f2RvGhpq7rcJ8u//36GEdFu7SPKhyzh+kF7x+HDuJm+yBIwuGe0Y/h1hpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gvha3SVk; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gvha3SVk"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2241053582dso100730885ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 18:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745976852; x=1746581652; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XP8swGeiZl3u2MJr3JSz8ME7bb0MSeYDJrUTCVj+PzQ=;
        b=gvha3SVkobG+GMMFUoaj0pXQUfFwqEkOYDcAtWsB7DwSwLWxReT6619rxKBKWfdSnz
         CUXIqFuMw88a6xI1mQ02u5o4dEYhy/sKL8fUMx6kSiSV8Ppt4ANX1dEHndT7/JiHbogG
         i95LwbEbuX6SLfpVj1Wf0EdIu2yBchvLzhJtw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745976852; x=1746581652;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XP8swGeiZl3u2MJr3JSz8ME7bb0MSeYDJrUTCVj+PzQ=;
        b=wOlQlN+MRd4VjHKsQQVMqUzIHEBFZdiCbSaMwDGnA78NV5wv1+kxfiOMlD0V2S3ETb
         yWJLXDIyUakOqpvB0B7AKoXL9xcCOWQBUdDAUyfiwRh6sWFcsTpATmAFWi8SZRurE7EI
         F8yzOQJFMwtLh6ctGgWN+TmDwFVva69WjxfYEUQzGaCP+5ecbcGX/VMEFd9AOGJtNsRF
         FNYnFBft36P+d73NscKmxnusGaIYBlFb7ETLNjzNWeZhRozjDjCj2ijibBGufy8wqli/
         47zUUqdAIkIgwg0Jsgl2sK7BiOVcVmdD1W+J+hiKBdS9QT4wEc5TAYRO26JJV1710nyl
         vnVA==
X-Forwarded-Encrypted: i=1; AJvYcCXgpVq5yv6xxvgcKIhoGre1ZEk+jUCo3kH4VsSd04ZLHlux+GVSCqGW4E3MtScaepIK6JmvvevJBCoaV6I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxU+NPIoUpRl6nSuanbp3/4UoE/bKV/PRxlpz0zO4J9m7ovhDOM
	+R/j1zuvVGygI31o7r8rdRPabC6aVmscqdodGOxSIEsvOj7XubunhGlWvRM5WA==
X-Gm-Gg: ASbGnct87Wo08TN07N/sMQ5RRA7GQCAHwM+n/GjdaDbwCL0eOQbcOYgJwz3eN09QNKT
	xr5Zogqj9wTY8C8WbEUBe3B8lL+aX/s+d/9s4QxQeLbDFPjAVuqJLPwxngAiirnQWeZsNnNFJQ5
	BHkhFkWF75uR676huTumS1u7hWPthpzg0mpwHwnzpvMbpwILQW7SZQwYT1Jw1Y1qJJs59kX7fiv
	KFo8Qa3wEFYDOzUHFvY3O9sWWItFM3AJZFMd1qYUjT3HX0yjQ54jT+fHp33l01Zo4oTrl8bwxQC
	feF5CPzON+JjHPHW1ikdfSFIInFsmThK+DAEXspgqBbd
X-Google-Smtp-Source: AGHT+IFULLCr1qoErJoDcaJ8m0lKNQH83OUKiOlyyZA5xEuZMbroQkSZkTU1IpjOeVEdA4f10mvRXQ==
X-Received: by 2002:a17:903:22ca:b0:223:f9a4:3fb6 with SMTP id d9443c01a7336-22df5764863mr9711775ad.11.1745976852510;
        Tue, 29 Apr 2025 18:34:12 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:92cd:5354:744b:319b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5101636sm110097515ad.180.2025.04.29.18.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 18:34:12 -0700 (PDT)
Date: Wed, 30 Apr 2025 10:34:07 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Tomasz Figa <tfiga@chromium.org>, John Ogness <john.ogness@linutronix.de>, 
	Steven Rostedt <rostedt@goodmis.org>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hung_task: configurable hung-task stacktrace loglevel
Message-ID: <3f5nqvveevlfabujnmc7ume54y2zga6ovtxdnpmneynonw5m34@2t677akblpd3>
References: <20250424070436.2380215-1-senozhatsky@chromium.org>
 <aAoZbwEtkQ3gVl5d@pathway.suse.cz>
 <xhkbymqobtva6j7xmwzvh5g2tvuixvu2hwfdozed6hijrt3vkl@rywdhz43e52y>
 <aAuie7Pgm3_9MsXK@pathway.suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAuie7Pgm3_9MsXK@pathway.suse.cz>

On (25/04/25 16:55), Petr Mladek wrote:
> > > Anyway, what is the exact problem, please?
> > > Are the KERN_INFO messages filtered because of console_loglevel?
> > > Or is it a problem to match all the related lines?
> > 
> > The latter one.  A made up example, just to demonstrate what we are
> > getting now:
> > 
> 
> Note: I do not have strong opinion. I am rather thinking loudly.

Sure.

> When I look at it. A prefix line:
> 
> <6>[  125.297687][  T140] ------------[ cut here ]------------
> 
> > <3>[  125.297687][  T140] INFO: task zsh:470 blocked for more than 61 seconds.
> > <3>[  125.302321][  T140]       Not tainted 6.15.0-rc3-next-20250424-00001-g258d8df78c77-dirty #154
> > <3>[  125.309333][  T140] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> > <6>[  125.315040][  T140] task:zsh             state:D stack:0     pid:470   tgid:470   ppid:430    task_flags:0x400100 flags:0x00004002
> > <6>[  125.320594][  T140] Call Trace:
> > <6>[  125.322327][  T140]  <TASK>
> > <6>[  125.323852][  T140]  __schedule+0x13b4/0x2120
> > <6>[  125.325459][  T140]  ? schedule+0xdc/0x280
> > <6>[  125.327100][  T140]  schedule+0xdc/0x280
> > <6>[  125.328590][  T140]  schedule_preempt_disabled+0x10/0x20
> > <6>[  125.330589][  T140]  __mutex_lock+0x698/0x1200
> > <6>[  125.332291][  T140]  ? __mutex_lock+0x485/0x1200
> > <6>[  125.334074][  T140]  mutex_lock+0x81/0x90
[..]
> > <3>[  125.362363][  T140] INFO: task zsh:470 is blocked on a mutex likely owned by task zsh:470.
> > <6>[  125.364467][  T140] task:zsh             state:D stack:0     pid:470   tgid:470   ppid:430    task_flags:0x400100 flags:0x00004002
> > <6>[  125.367493][  T140] Call Trace:
> > <6>[  125.368359][  T140]  <TASK>
> > <6>[  125.369180][  T140]  __schedule+0x13b4/0x2120
> > <6>[  125.370364][  T140]  ? schedule+0xdc/0x280
> > <6>[  125.371486][  T140]  schedule+0xdc/0x280
> > <6>[  125.372518][  T140]  schedule_preempt_disabled+0x10/0x20
> > <6>[  125.374049][  T140]  __mutex_lock+0x698/0x1200
> > <6>[  125.375326][  T140]  ? __mutex_lock+0x485/0x1200
> > <6>[  125.376572][  T140]  mutex_lock+0x81/0x90
[..]

> and a suffix line
> 
> <6>[  125.403579][  T140] ------------[ cut here ]------------
> 
> might be helpful for both automated monitors and humans => win win solution.

suffix/prefix lines should improve things, I think.  We don't enable
printk-owner in the fleet, we probably should, but we don't for whatever
reason.

[..]
> > So my worry with CONFIG_MESSAGE_LOGLEVEL_DEFAULT was that, if we
> > set it, say, to 3 (KERN_ERR), then how many "false positives" we
> > will get?  There are many printk("") calls in the kernel that
> > default to MESSAGE_LOGLEVEL_DEFAULT, as far as I understand it:
> > 	git grep "printk(\"" | grep -v TP_printk | wc -l
> > 	9001
> 
> Just for record, this still counts also many other printk() wrappers,
> e.g. bpf_printk(), srm_printk(), dprintk().
> 
> It should be more precise with -w option:
> 
> 	$> git grep -w "printk(\"" | wc -l
> 	2830

Good point.

> That said, I agree that it might still mean a lot of false
> positives.

Agreed.

> > But maybe that is the solution.  Do you want to switch sched_show_task()
> > to KERN_DEFAULT for all or would it be better to still introduce
> > sched_show_task_log_lvl() can call it with KERN_DEFAULT only from
> > kernel/hung_task.c?
> 
> If you want to go this way then I would introduce sched_show_task_log_lvl().
> It would allow to fix the various reports incrementally.
> 
> For example, I see sched_show_task() used in show_cpu_pool_hog() in
> kernel/workqueue.c and some other messages are KERN_INFO. So, using
> another log level in sched_show_task() would cause mess here.

Good point.

[..]
> If you want the same loglevel then I really suggest to introduce
> a generic CONFIG option, e.g. CONFIG_CONSISTENT_REPORT_LOGLEVEL
> and use is everywhere to force the consistent loglevel,
> for example, hung taskdetector, workqueue watchdog, soft lockup
> detector, Oops, ...

Yeah, that's a logical next step, if we go this way.

[..]
> int printk_report_start(const char *lvl)
> {
> 	int report_id = atomic_inc_return(&printk_report_count);
> 
> 	if (printk_force_report_loglevel)
> 		printk_force_loglevel_enter(lvl);
> 
> 	printk("%s---------- Report No. %d start --------\n", lvl, report_id);
> 
> 	return report_id;
> }
> 
> void printk_report_end(const char *lvl, int report_id)
> {
> 	printk("%s---------- Report No. %d end --------\n", lvl, report_id);
> 
> 	if (printk_force_report_loglevel)
> 		printk_force_loglevel_exit();
> }

Looks good to me, however

> My problem with the log level manipulation is that I do not know what
> loglevel right.

Excellent point.  Sort of feels like we are back to square one.
If we just KERN_INFO everything, then someone might come up with
a patch to make it KERN_ERR, or ALERT (because they panic the system
right after that print-out and it cannot be INFO.)
