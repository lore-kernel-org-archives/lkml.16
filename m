Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B39E259483
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 14:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745592962; cv=none; b=n3quiMOZ8Y7iVZMTwSqzy9Eks00a9kfWfZbYppdsS7MY4k3EXQeYoECIiHxzu3VbYpFGGIs4Nqgbc6DPRQNch8mQDW623Ig3NymVg6vzmP9roOlBgYVcqXYQRjcIjumm80XsDa65aMV1f+cpMUkRNNvydX9zQJsAfulK7mz7C2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745592962; c=relaxed/simple;
	bh=Skqcgh8PtxclxdmdbrawzglN71VPDDZQI2CXZmEw3bA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t0sdukIWaKDGWJUB7mxAlmzvYSF7Cl6DcdYbDjl3/zUplTzcq03WtEzuKM03i+Djaz+GKrsrkOCMK4KL1IKVaX0vC/QNoRRZH0IOHMIeX3ldtPruAZvCkG2v4OANy9JNe/YDr12B0kuJl9RsoMBcEq5pbkihu9ShGGRfaPg/Pq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=aNivC7Ty; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="aNivC7Ty"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso22651325e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 07:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745592958; x=1746197758; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9wi3Z4F/ZXo2lSh1mTkLkRMTQraUNG6drOWw2/TXm2o=;
        b=aNivC7TyEMTsgX9viYEa3LvvCEauImDcbbPE4p8RgphRsqmk2egtni5ZcFWWuFKAVf
         Pv6hLdMs+fDsn9YnsoVl13cnTDdsfqDyv3uGptKX3wFaX8cCR3Dk4bGnjgYrertYyHgz
         P53Th0IcqFMK6IJXi4WSopWGB241waMDm1V3qhLUEiYEJHBRS9o2ryPX4+eGRRWTlZpu
         hsO5f067wBRg/qTIj+VaXmxwNzk2ioFywUvx19xhKT64OrvUOECo9F0tVdRK5/Fu31ii
         asOhKyK5JcLFeJ+oZGn0jamEfYdmRtZhgX5NItxuLKcPOu6au+WwyeLncu+Y1bPs79m3
         bgtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745592958; x=1746197758;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9wi3Z4F/ZXo2lSh1mTkLkRMTQraUNG6drOWw2/TXm2o=;
        b=BBTO7sWD4JvlfPhPFLifMEJ/gr7kjhU1qlYkgyvJpr0A09Q0EFq80YDtYs9+TTUXHO
         O/T4L9GoJtUnQ87AYRzejh2FpA4tTBb+YY6yiVUNFv10PUecP2yVl934Xj0wAreltABs
         YL3Z6W7A3bO3ymmZ9QjyE97MXuimXknnO5lzYnFPns0YCRU4+Y+17bViywj06xxQbMOQ
         oJ89bBrx1hP7uBTSuq9GVHiIRvmadJBOvF10SApjYPd6hvKXuTfY40PPqYzCi67WdU9I
         tMZtORf3Gxd7eDH35gCRRPReS/YlgjO4tvw+WcUUsA5TORA7CmAQFH7cpKzoCYsnZrjK
         w0wQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWsh3YapJWaBuMGqCDuX+r7uRwJpD9p5CtbeeqbiRMnx77FNU1tCpcKEllzokAbYs7ZyKH9Hj9unRqA7A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKDbVZcn6p3+1IOz9ewdy5oMPY/bTjEC/G7EKMu8atj1xNaUDM
	cAYm7CFZn26ZjTX0H+hN6+YWeYToJ8zYDYh6gLY97ceuOFgzpBhkGhNWYlhs1nU=
X-Gm-Gg: ASbGncsQnVFDAzFNZpgPLKgiip50jbsqMFYNUBsw7eOe8UGDHqfwV/mUyFu/igSBD59
	zl2CCJrRE9XeYgHOEHuJoDxp/KjgpVpEqXxIUI2SNRzxZDdoHLnzQFDzwoJsH/NdRTdJ3tOjO/q
	ZBJsMkThKdq7xUIM4w3XCzv1TFgJQ7CvhVaHwDaElcU3LoxWCeWgLQvuB8ox+fIBZeSgE6EWOM7
	ZX+W6wFFWTL9SGKkLNgwN9Dpoei/v9YY5K09nV0GgoXzmVxzOtPmcRAeAfPlprC2QKesPMwyVeS
	7Le8E+3GGy62Tcz48rNUB19paPB2t+V903S9ChLd11s=
X-Google-Smtp-Source: AGHT+IFgIRokUZYTYI70Z7OlSIFK/SGUSJHZsWnIET747+TcTmVoXGAOSPAik/ehs/Dbq7WC4ivhng==
X-Received: by 2002:a05:600c:510e:b0:43c:f3e4:d6f7 with SMTP id 5b1f17b1804b1-440a66b02d8mr25061715e9.31.1745592957584;
        Fri, 25 Apr 2025 07:55:57 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4408d8d191bsm85485845e9.1.2025.04.25.07.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 07:55:57 -0700 (PDT)
Date: Fri, 25 Apr 2025 16:55:55 +0200
From: Petr Mladek <pmladek@suse.com>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Tomasz Figa <tfiga@chromium.org>,
	John Ogness <john.ogness@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hung_task: configurable hung-task stacktrace loglevel
Message-ID: <aAuie7Pgm3_9MsXK@pathway.suse.cz>
References: <20250424070436.2380215-1-senozhatsky@chromium.org>
 <aAoZbwEtkQ3gVl5d@pathway.suse.cz>
 <xhkbymqobtva6j7xmwzvh5g2tvuixvu2hwfdozed6hijrt3vkl@rywdhz43e52y>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <xhkbymqobtva6j7xmwzvh5g2tvuixvu2hwfdozed6hijrt3vkl@rywdhz43e52y>

On Fri 2025-04-25 13:49:13, Sergey Senozhatsky wrote:
> Hi Petr,
> 
> On (25/04/24 12:58), Petr Mladek wrote:
> > On Thu 2025-04-24 16:02:43, Sergey Senozhatsky wrote:
> > > Currently, hung-task watchdog uses two different loglevels
> > > to report hung-tasks: a) KERN_INFO for all the important task
> > > information (e.g. sched_show_task()) and b)  KERN_ERR for the
> > > rest.
> > 
> > IMHO, the two different loglevels make sense. The KERN_ERR
> > message seems to inform about that a task gets blocked for too long.
> > And KERN_INFO is used for an extra debug information.
> > 
> > > This makes it a little inconvenient, especially for
> > > automated kernel logs parsing.
> > 
> > Anyway, what is the exact problem, please?
> > Are the KERN_INFO messages filtered because of console_loglevel?
> > Or is it a problem to match all the related lines?
> 
> The latter one.  A made up example, just to demonstrate what we are
> getting now:
> 

Note: I do not have strong opinion. I am rather thinking loudly.

When I look at it. A prefix line:

<6>[  125.297687][  T140] ------------[ cut here ]------------

> <3>[  125.297687][  T140] INFO: task zsh:470 blocked for more than 61 seconds.
> <3>[  125.302321][  T140]       Not tainted 6.15.0-rc3-next-20250424-00001-g258d8df78c77-dirty #154
> <3>[  125.309333][  T140] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> <6>[  125.315040][  T140] task:zsh             state:D stack:0     pid:470   tgid:470   ppid:430    task_flags:0x400100 flags:0x00004002
> <6>[  125.320594][  T140] Call Trace:
> <6>[  125.322327][  T140]  <TASK>
> <6>[  125.323852][  T140]  __schedule+0x13b4/0x2120
> <6>[  125.325459][  T140]  ? schedule+0xdc/0x280
> <6>[  125.327100][  T140]  schedule+0xdc/0x280
> <6>[  125.328590][  T140]  schedule_preempt_disabled+0x10/0x20
> <6>[  125.330589][  T140]  __mutex_lock+0x698/0x1200
> <6>[  125.332291][  T140]  ? __mutex_lock+0x485/0x1200
> <6>[  125.334074][  T140]  mutex_lock+0x81/0x90
> <6>[  125.335113][  T140]  drop_caches_sysctl_handler+0x3e/0x140
> <6>[  125.336665][  T140]  proc_sys_call_handler+0x327/0x4f0
> <6>[  125.338069][  T140]  vfs_write+0x794/0xb60
> <6>[  125.339216][  T140]  ? proc_sys_read+0x10/0x10
> <6>[  125.340568][  T140]  ksys_write+0xb8/0x170
> <6>[  125.341701][  T140]  do_syscall_64+0xd0/0x1a0
> <6>[  125.343009][  T140]  ? arch_exit_to_user_mode_prepare+0x11/0x60
> <6>[  125.344612][  T140]  ? irqentry_exit_to_user_mode+0x7e/0xa0
> <6>[  125.346260][  T140]  entry_SYSCALL_64_after_hwframe+0x4b/0x53
> <6>[  125.347772][  T140] RIP: 0033:0x7fa4bd8be687
> <6>[  125.348958][  T140] RSP: 002b:00007ffecf417820 EFLAGS: 00000202 ORIG_RAX: 0000000000000001
> <6>[  125.351161][  T140] RAX: ffffffffffffffda RBX: 00007fa4bd82e300 RCX: 00007fa4bd8be687
> <6>[  125.353221][  T140] RDX: 0000000000000002 RSI: 00005621f5c65860 RDI: 0000000000000001
> <6>[  125.355338][  T140] RBP: 00005621f5c65860 R08: 0000000000000000 R09: 0000000000000000
> <6>[  125.357424][  T140] R10: 0000000000000000 R11: 0000000000000202 R12: 0000000000000002
> <6>[  125.359677][  T140] R13: 00007fa4bda175c0 R14: 00007fa4bda14e80 R15: 00007fa4bdb59f70
> <6>[  125.361551][  T140]  </TASK>
> <3>[  125.362363][  T140] INFO: task zsh:470 is blocked on a mutex likely owned by task zsh:470.
> <6>[  125.364467][  T140] task:zsh             state:D stack:0     pid:470   tgid:470   ppid:430    task_flags:0x400100 flags:0x00004002
> <6>[  125.367493][  T140] Call Trace:
> <6>[  125.368359][  T140]  <TASK>
> <6>[  125.369180][  T140]  __schedule+0x13b4/0x2120
> <6>[  125.370364][  T140]  ? schedule+0xdc/0x280
> <6>[  125.371486][  T140]  schedule+0xdc/0x280
> <6>[  125.372518][  T140]  schedule_preempt_disabled+0x10/0x20
> <6>[  125.374049][  T140]  __mutex_lock+0x698/0x1200
> <6>[  125.375326][  T140]  ? __mutex_lock+0x485/0x1200
> <6>[  125.376572][  T140]  mutex_lock+0x81/0x90
> <6>[  125.377773][  T140]  drop_caches_sysctl_handler+0x3e/0x140
> <6>[  125.379391][  T140]  proc_sys_call_handler+0x327/0x4f0
> <6>[  125.380715][  T140]  vfs_write+0x794/0xb60
> <6>[  125.381951][  T140]  ? proc_sys_read+0x10/0x10
> <6>[  125.383083][  T140]  ksys_write+0xb8/0x170
> <6>[  125.384329][  T140]  do_syscall_64+0xd0/0x1a0
> <6>[  125.385461][  T140]  ? arch_exit_to_user_mode_prepare+0x11/0x60
> <6>[  125.387110][  T140]  ? irqentry_exit_to_user_mode+0x7e/0xa0
> <6>[  125.388566][  T140]  entry_SYSCALL_64_after_hwframe+0x4b/0x53
> <6>[  125.390194][  T140] RIP: 0033:0x7fa4bd8be687
> <6>[  125.391268][  T140] RSP: 002b:00007ffecf417820 EFLAGS: 00000202 ORIG_RAX: 0000000000000001
> <6>[  125.393367][  T140] RAX: ffffffffffffffda RBX: 00007fa4bd82e300 RCX: 00007fa4bd8be687
> <6>[  125.395506][  T140] RDX: 0000000000000002 RSI: 00005621f5c65860 RDI: 0000000000000001
> <6>[  125.397494][  T140] RBP: 00005621f5c65860 R08: 0000000000000000 R09: 0000000000000000
> <6>[  125.399701][  T140] R10: 0000000000000000 R11: 0000000000000202 R12: 0000000000000002
> <6>[  125.401663][  T140] R13: 00007fa4bda175c0 R14: 00007fa4bda14e80 R15: 00007fa4bdb59f70
> <6>[  125.403579][  T140]  </TASK>

and a suffix line

<6>[  125.403579][  T140] ------------[ cut here ]------------

might be helpful for both automated monitors and humans => win win solution.

> So there are <3> and then <6> lines and we can't easily tell when to
> stop parsing and what to consider part of the automated error report
> and what not to, there also can be some other <6> lines in between.

All the related information should be printed from the same context.
It is "[  T140]" in this case. The only exception would be backtraces
from other CPUs.

> > > Introduce CONFIG_HUNG_TASK_STACKTRACE_LOGLEVEL so that (a)
> > > becomes configurable.
> > 
> > I am not sure if adding hung-task-specific config option is
> > the right solution. I guess that other watchdogs or other
> > similar reports have the same problem.
> >
> > It seems that several other reports, for example,
> > watchdog_hardlockup_check(), or __die(), are using KERN_DEFAULT
> > which is configurable via CONFIG_MESSAGE_LOGLEVEL_DEFAULT.
> > 
> > A solution might be using KERN_DEFAULT for sched_show_task()
> > in hung_tasks detector as well.
> 
> So my worry with CONFIG_MESSAGE_LOGLEVEL_DEFAULT was that, if we
> set it, say, to 3 (KERN_ERR), then how many "false positives" we
> will get?  There are many printk("") calls in the kernel that
> default to MESSAGE_LOGLEVEL_DEFAULT, as far as I understand it:
> 	git grep "printk(\"" | grep -v TP_printk | wc -l
> 	9001

Just for record, this still counts also many other printk() wrappers,
e.g. bpf_printk(), srm_printk(), dprintk().

It should be more precise with -w option:

	$> git grep -w "printk(\"" | wc -l
	2830

That said, I agree that it might still mean a lot of false
positives.

> But maybe that is the solution.  Do you want to switch sched_show_task()
> to KERN_DEFAULT for all or would it be better to still introduce
> sched_show_task_log_lvl() can call it with KERN_DEFAULT only from
> kernel/hung_task.c?

If you want to go this way then I would introduce sched_show_task_log_lvl().
It would allow to fix the various reports incrementally.

For example, I see sched_show_task() used in show_cpu_pool_hog() in
kernel/workqueue.c and some other messages are KERN_INFO. So, using
another log level in sched_show_task() would cause mess here.

That said, you probably want to fix workqueue stall report
as well. I believe that you have the workqueue watchdog enabled
and it has the same problem as the hung_task detector.


My opinion:

I think that using the prefix/postfix "cut here" line is a win-win
solution. And I would personally go this way.

But I understand this might have other problems, like the need
of the full log (the other reply from Thomasz Figa). You really
might want to use the same loglevel for the entire report.

If you want the same loglevel then I really suggest to introduce
a generic CONFIG option, e.g. CONFIG_CONSISTENT_REPORT_LOGLEVEL
and use is everywhere to force the consistent loglevel,
for example, hung taskdetector, workqueue watchdog, soft lockup
detector, Oops, ...


Idea:

Some people complained about a non-consistent loglevel when pr_cont()
lines were not connected because another context (CPU, task,
interrupt) added a message in between.

I had an idea to store the last used loglevel in struct task_struct.
But it did not look worth it just for continues lines.

This might be another use-case. So we could add something like:

struct printk_context {
	u8	deferred;	/* printk_safe/deferred nesting	counter. */
	u8      emergency;	/* nbcon_emergency nesting counter */
	u8	level:3;	/* last used or forced log level */
	u8	flags:5;
}

and one of the flags might be

enum printk_context_flag {
	pr_ctxt_force_level = 0x0,	/* Force the same loglevel for	all messages */
};

and then we could create an API:

void printk_force_loglevel_enter(const char *lvl)
{
	struct printk_context *pr_ctxt;

	pr_ctxt = printk_get_context();
	/* FIXME: make sure the it returns a valid level 0..7 */
	pr_ctxt.level = printk_get_level(lvl);
	pt_ctxt.flags |= pr_ctct_force_level;
}

void printk_force_loglevel_exit(void)
{
	struct printk_context *pr_ctxt;

	pr_ctxt = printk_get_context();
	pt_ctxt.flags &= ~pr_ctct_force_level;
}

, where printk_get_context() would return the right struct
printk_context either from struct task_struct for task context or
a static per-CPU variable for IRQ or NMI context.

FIXME: We should integrate the above with the existing:

	  + printk_context used by printk_safe_enter()/exit()
	  + nbcon_pcpu_emergency_nesting
	  + ??? (Did I miss any other printk context counter/flag?)


Also we could even create an API for consistent reports:

static atomic_t printk_report_count = ATOMIC_INIT(0);
static bool printk_force_report_loglevel = IS_ENABLED(CONFIG_PRINTK_FORCE_REPORT_LOGLEVEL);

int printk_report_start(const char *lvl)
{
	int report_id = atomic_inc_return(&printk_report_count);

	if (printk_force_report_loglevel)
		printk_force_loglevel_enter(lvl);

	printk("%s---------- Report No. %d start --------\n", lvl, report_id);

	return report_id;
}

void printk_report_end(const char *lvl, int report_id)
{
	printk("%s---------- Report No. %d end --------\n", lvl, report_id);

	if (printk_force_report_loglevel)
		printk_force_loglevel_exit();
}

This API would help to standardize the reports from various watchdogs:

  + The "start/end" lines would help both humans and bots.

  + The optional loglevel forcing would help to filter the messages depending
    on whether people want to see all details using the same loglevel
    or not.


My problem with the log level manipulation is that I do not know what
loglevel right. The loglevel might be important with slow consoles which
need not be suitable for all the details.

Best Regards,
Petr
