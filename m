Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3299D1EB19B
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 08:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746002595; cv=none; b=I2x1j0H34JNEHUYk9cwC8boIBzilAFbZRmh4VGcU0l54qAaBwaJXAIgpgzCWc/3giETM+gIU9rZXQHL86nIWcf6O8UZcwVd6Cj6QRKwVaLtjaZRC6q9Jah2W12dEzgyS/Oo99Lnp25CwJRrtKSBDUieQWoq6GhlDDI/AIjWGxvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746002595; c=relaxed/simple;
	bh=4d+nRgwO0m0WjbiS+0R/uQKINrYp9RlWa+SVoJv8NV4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DCcGTrNT9zOrF5MSd+urXMjVKIVKoxT5hVXvPkmclK1fqrasvtIwwrXWT3CYC+fZ7b/HQc8o1zW8MeSLwdWvx2E27f8/2AHbeEE9BJnQCIhwB9jNMQd22XVfA9vJUGif/daVD3UgdcB7uzD4t6XXTpglry2yyv63aBV0LEobNGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CV/AWjjs; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CV/AWjjs"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5f7ec0e4978so6872425a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 01:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746002591; x=1746607391; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YywoEVDaYDC9htJBIzSiWueEw3oMNUZft+4Pwn9CzDc=;
        b=CV/AWjjsbSiOl3YgXF/VMJykRM59+iniamk7WYPl1cU3BjL3XVnn5qDN9zj/1Ueb/6
         eln+LtYd5x9VI45hGdvnjAGD+IoIo2uzC1NiGKi+gb+QZN9xxAwR3/A2xz9jG7fXsQ1j
         GOOeP8U4PQYhe+z2NTRM4mSi5L13yFG505daA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746002591; x=1746607391;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YywoEVDaYDC9htJBIzSiWueEw3oMNUZft+4Pwn9CzDc=;
        b=Ia7pdw/m9ser6tEEvyJywIkIJwDIaMV1vNI29RBKhgALQt4eWJyNnSdpLwQp4swr5F
         fKBvKix3zQt5l88pFbHOFocdifaIyzfslJJlDFKkZI+oLaeXDD/nDxs9c8qMdeiw/AHp
         rvI3al1bi+xGZY6YbrQb1NK/Zh+RGoYEO1wjFb7XIA3fdIgQzrTv2EHFUgMP+tv0vlnJ
         vhPwTQKsCJoXUDD9DNUH+MH02XjtMlVPR9ICIL8RTKhRnOsMPUjGSNwH4FB8vXhqNHYS
         zBoA237PEQf7OHafmdl5V2bKTqQZUm9fwut7AHuPVtutLWcSx2AeUs9tomoJ9QonqicG
         SWnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVaBnEvxrttHISvF9f0gHm2Z5a/M/TiUWz/5sbqAYegScAJToMVmLI4ToVVPh6TGWXUa8zfYx/Qg3pg/GI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjNBvqG9jFGIepk1sfdFzilATZfUuBe7H8ybqPvipCLqex3WK7
	tSYYKL7qw9QRUMeqoOHG5WqfmZz1Qz19VQq7SpOteMorl6hVt1CycmLiY3hJ+s910GhuFTZ++uk
	DNg==
X-Gm-Gg: ASbGncu80xVk2Bl5iSYhZ3dhDAW8VxWbDPvL9kwjgPuPWjVIOI9rLX47ZZ6dWtamYUs
	AU2c78a6PwGtoJ9Q1jDkfRfcTWVTEqiByZf5skhMB2h5D5CUwZrZxbtm6zotZdfH/N4p/lrIjQO
	PRFIWArW/tOFJ4fBR9wOHUrE9Tx2HmhRtriGHu76yKB2uWSae5XoZRugXZFeG1HheJOgVEDd/76
	MfpEd7Q6bekJE9SpKTm2HdxamRiblrSskT7/3DqEGcCuojTBR0Pb+ID1GwRoscLms90JPIfgRiL
	V7p9Iz6D2TF09Ws8mCljoOP8EnypSbIcUJ9VX0Z2gnUf7GBdkrULNFtiYf/athhZUw6F/V+e8pX
	M
X-Google-Smtp-Source: AGHT+IE5c0FeVMasJYujppu9ZWRH3HDfe017GmqjWo/SZpJCNjWzjd3rDa0gbH7GZzzcVKZSF5t+rQ==
X-Received: by 2002:a05:6402:5385:b0:5e0:82a0:50dd with SMTP id 4fb4d7f45d1cf-5f89bf17df9mr1983019a12.27.1746002590879;
        Wed, 30 Apr 2025 01:43:10 -0700 (PDT)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f701400570sm8497791a12.29.2025.04.30.01.43.10
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 01:43:10 -0700 (PDT)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5f88f236167so7564a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 01:43:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV8UgIP3bMwcnL2bGVmPrGBkqmHHn5d82CgOLUUYcPFdEIexdEEb+bkFH1rvtnWrS2wEKUHYTZRVDPWm30=@vger.kernel.org
X-Received: by 2002:a05:6402:10c9:b0:5e6:15d3:ffe7 with SMTP id
 4fb4d7f45d1cf-5f8aac01ed0mr54584a12.7.1746002589612; Wed, 30 Apr 2025
 01:43:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250424070436.2380215-1-senozhatsky@chromium.org>
 <aAoZbwEtkQ3gVl5d@pathway.suse.cz> <CAAFQd5A6J-UCy46bp1MYP0imJf3oUL29mxFVLZZZ4JmP2YTvhQ@mail.gmail.com>
 <aAuq-3yjYM97rvj1@pathway.suse.cz>
In-Reply-To: <aAuq-3yjYM97rvj1@pathway.suse.cz>
From: Tomasz Figa <tfiga@chromium.org>
Date: Wed, 30 Apr 2025 17:42:51 +0900
X-Gmail-Original-Message-ID: <CAAFQd5BeJnYXZt06WVFBWu8cvCmXWTe_tH8Ly3ywTNRCjxXCMA@mail.gmail.com>
X-Gm-Features: ATxdqUHV4xIBAA-SfzDnO-kDjeKdAsVebl2zesMOnO2iwTuSso00Zm-K99rpoGc
Message-ID: <CAAFQd5BeJnYXZt06WVFBWu8cvCmXWTe_tH8Ly3ywTNRCjxXCMA@mail.gmail.com>
Subject: Re: [PATCH] hung_task: configurable hung-task stacktrace loglevel
To: Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	John Ogness <john.ogness@linutronix.de>, Steven Rostedt <rostedt@goodmis.org>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 26, 2025 at 12:32=E2=80=AFAM Petr Mladek <pmladek@suse.com> wro=
te:
>
> On Fri 2025-04-25 15:58:46, Tomasz Figa wrote:
> > Hi Petr,
> >
> > On Thu, Apr 24, 2025 at 7:59=E2=80=AFPM Petr Mladek <pmladek@suse.com> =
wrote:
> > >
> > > On Thu 2025-04-24 16:02:43, Sergey Senozhatsky wrote:
> > > > Currently, hung-task watchdog uses two different loglevels
> > > > to report hung-tasks: a) KERN_INFO for all the important task
> > > > information (e.g. sched_show_task()) and b)  KERN_ERR for the
> > > > rest.
> > >
> > > IMHO, the two different loglevels make sense. The KERN_ERR
> > > message seems to inform about that a task gets blocked for too long.
> > > And KERN_INFO is used for an extra debug information.
> > >
> >
> > I agree that two different levels make sense, but I think that
> > KERN_INFO is not necessarily the best one to use, because we have
> > quite a lot of usual/expected things logged with that level, but this
> > clearly is not an unusual/expected event that we're logging.
> >
> > My preference would be on KERN_NOTICE.
>
> Sigh, this is the problem with loglevels. Different people have
> different feeling about them.
>
> A solution would be to add an extra log level. But the full 0-7
> (3 bit) range is already taken.
>
> > > > This makes it a little inconvenient, especially for
> > > > automated kernel logs parsing.
> > >
> > > Anyway, what is the exact problem, please?
> > > Are the KERN_INFO messages filtered because of console_loglevel?
> > > Or is it a problem to match all the related lines?
> >
> > The problem is that when we're looking at the hundreds of reports with
> > various problems from the production fleet, we want to be able to
> > filter out some of the usual/expected logs. The easiest way to do it
> > is by using the message log level. However, if we set the filters to
> > anything more severe than KERNEL_INFO, we lose the task dumps and we
> > need to go and fetch the entire unfiltered log, which is tedious.
>
> Good to know.
>
> This might be an argument for using the same log level for the entire
> report. But it might create new problems. It would be more complicated
> to filter-out known problems. I mean that a single known
> warning/error/emergency message can be filtered easily. But
> creating a filter for the entire to-be-ignored backtrace is more
> complicated.
>

Yeah, but since this filtering would be happening in whatever code
reads those logs, outside of the kernel, we first need to get the
candidate backtraces from the kernel, so having them a log level
appropriate for an unusual event would definitely help.

>
> > (FWIW, we're also developing an automated analysis tool and it would
> > make the implementation much easier if we could simply use the log
> > level to filter out expected vs unexpected events from the logs - and
> > most of the time that already works, the case Sergey's patch is
> > addressing is just one of the small number of exceptions.)
>
> It might be interesting to see the list of exceptions. Maybe, we
> could find some common pattern...
>
> It would be nice to handle all the reports of critical situations
> similar way. It would help everyone. This is why I am not happy with
> a hung-stask-detector-specific setting.
>

I was convinced that the soft/hard_lockup detector also does the same,
but I double checked and it seems like it [1] just calls dump_stack()
that uses KERN_DEFAULT and in our case that defaults to 4
(KERN_WARNING), which is more severe than 6 (KERN_INFO) that we want
to filter out, so I guess making the hung task watchdog behave the
same way would also work for us.

[1] https://elixir.bootlin.com/linux/v6.14.4/source/lib/nmi_backtrace.c#L94
[2] https://elixir.bootlin.com/linux/v6.14.4/source/lib/dump_stack.c#L127

Besides that, I don't actually have any other cases at hand. I guess
we'll find out once we look at more crash reports.

> > > If the problem is matching all related lines. Then a solution
> > > would be printing some help lines around the report, similar
> > > to
> > >
> > >     ------------[ cut here ]------------
> > >
> > > in include/asm-generic/bug.h
> > >
> > > Plus, it would be needed to filter out messages from other CPUs.
> > > CONFIG_PRINTK_CALLER should help with this.
> >
> > I'm not really in love with that idea - it would make things so much
> > more complicated, despite already having the right tool to
> > differentiate between the importance of various logs - after all the
> > log level is exactly that.
>
> Honestly, the more I think about it the more I like the prefix/postfix
> lines + the caller_id. I am afraid that manipulating log levels is a
> lost fight  because different people might have different opinion
> about how various messages are important.

The problem with the special lines is that it completely breaks any
line-based processing in a data pipeline. For a piece of
infrastructure that needs to deal with thousands of reports, on an
on-demand basis, that would mean quite a bit of sequential work done
instead of doing it in parallel and taking much more time to answer
users' queries.

That could be worked around, though, if we could prefix each line
separately with some special tag in addition to log level, timestamp
and caller, though. Borrowing from Sergey's earlier example:

<3>[  125.297687][  T140][E] INFO: task zsh:470 blocked for more than
61 seconds.
<3>[  125.302321][  T140][E]       Not tainted
6.15.0-rc3-next-20250424-00001-g258d8df78c77-dirty #154
<3>[  125.309333][  T140][E] "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
<6>[  125.315040][  T140][E] task:zsh             state:D stack:0
pid:470   tgid:470   ppid:430    task_flags:0x400100 flags:0x00004002
<6>[  125.320594][  T140][E] Call Trace:
<6>[  125.322327][  T140][E]  <TASK>
<6>[  125.323852][  T140][E]  __schedule+0x13b4/0x2120
<6>[  125.325459][  T140][E]  ? schedule+0xdc/0x280
<6>[  125.327100][  T140][E]  schedule+0xdc/0x280
<6>[  125.328590][  T140][E]  schedule_preempt_disabled+0x10/0x20
<6>[  125.330589][  T140][E]  __mutex_lock+0x698/0x1200
<6>[  125.332291][  T140][E]  ? __mutex_lock+0x485/0x1200
<6>[  125.334074][  T140][E]  mutex_lock+0x81/0x90
<6>[  125.335113][  T140][E]  drop_caches_sysctl_handler+0x3e/0x140
<6>[  125.336665][  T140][E]  proc_sys_call_handler+0x327/0x4f0
<6>[  125.338069][  T140][E]  vfs_write+0x794/0xb60
<6>[  125.339216][  T140][E]  ? proc_sys_read+0x10/0x10
<6>[  125.340568][  T140][E]  ksys_write+0xb8/0x170
<6>[  125.341701][  T140][E]  do_syscall_64+0xd0/0x1a0
<6>[  125.343009][  T140][E]  ? arch_exit_to_user_mode_prepare+0x11/0x60
<6>[  125.344612][  T140][E]  ? irqentry_exit_to_user_mode+0x7e/0xa0
<6>[  125.346260][  T140][E]  entry_SYSCALL_64_after_hwframe+0x4b/0x53

where [E] would mean an "emergency" message, rather than something
usual, regardless of the loglevel.

Best,
Tomasz
