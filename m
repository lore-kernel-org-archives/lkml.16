Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD41E2F2A
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 04:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745556561; cv=none; b=i+nWabXZ1d+JGxrGe2oDrM2h3JEjTw8fwxGHcZJZrezMwjhu9hlJ4nM5Rf3wleUocM4dFhFAbguo8T2qGzXn8ZnD1IZ2eqgpxZbFPFUxjf6440oVtaaSVIiVzACmhaCsuZsUqW6qHxMS+wXESzP6s/xTjEDpgcVHrMFqnwxrqFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745556561; c=relaxed/simple;
	bh=ek7jDglku38LBMCM9GkWQf7BRRG2dtEBSfJ6fre7R9s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qaw081lMkAjrbg6CaML6AvInyVxifReIZ/aAUepH+wrVAZf39cE3uzg3SV9Z/YLMH9T3sF8kaB69eCiW4Z273ROkX2ekfgzVHefa4EXvBsCzCg6xclhfgASUhMbw9Nt8PeyZ9GIavKZ+kL7Z2a0lTMvdAn74SYyk3SqWqKCRhDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HNe4vULc; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HNe4vULc"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-af908bb32fdso1632796a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 21:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745556559; x=1746161359; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qNjXa192lDg+yXMxIW5y+aiEwxDhbcIwqjcnpQRWUs4=;
        b=HNe4vULcwtOeDa6fdoqZJ12zL3pcgAC7XVU2EpZiXvJyuPHU6QVj/bBBT3BFOdXc/S
         Dp1uVOcpr37kY1gegVqKcMXdsx31Ip8+rJBoy4skuBZZLUZ5ilMmkWHagVIFujKYF9d4
         Eg7KURrGTP4uqOU2JVAprDQRMnstgxiV2PICI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745556559; x=1746161359;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qNjXa192lDg+yXMxIW5y+aiEwxDhbcIwqjcnpQRWUs4=;
        b=uGy+FKpd+gM3RdBe2QxZcMaLe1s+UjCYI1xiin+rer6btxFcUO5+otQ1LW4MtFINmL
         ErjgDluKZH40bd6BN6lKVHbK3w4Tjt95MajmkrEZxM9wUjZCrxdu/x5s0lhgRYixu5iz
         +u/xHYZDXuYzloPX/AS3IJOmzHXQQlQK5+OPBOrSt5D0KnuqvT7KMHhzme7aU7wfr7De
         P6kQjEK0x0a8fOkbM10hS0RmNZkhASQ8q7MUGuiefh+KsuoOH892L9StgnhDTAV2dfkZ
         ageywYc2jag2h38RUCSdndg49P9F4Ev37wdhYiCKZKIiWy7fHzwVl8gMjpQnKPq9XFOS
         tt2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXH9E885XkIFufDdI2dx8xSD9A3tEGmQ6ljVQWBCZWr/X7aA09a/S8R6OZ8OtKz1F+QlM3rq4GKtYtEFkI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2XkBh4dUD0Od3vX8vPkVFH4y+/HksxP/cMJH9bLfQqPl+ZhB+
	9dTWfiO73DNkQqk4+hSDZx4OVxxovPK7dCYM8NcUp1HrdwiWIrS48q2OTyOlmA==
X-Gm-Gg: ASbGnct94N3nodE4nDjK5Jofr+9JqMovOT++88O9ROp/BXzO1ImviaSjPvA/7wVI1SF
	EAjYrptAFLqydBkZ6lbKjbd2WiPk5kPb9h4ylRVzv3+/J92ypLmkCcjS/5zjUqy88ihd08fNS3G
	oxV8VrsY49upHa1v0cPPV6Pmg5NWN7RvvmIlrglgOt5v9/AjlsG1gxOADmvafABxtcnJdvUd//v
	K+wR16+BlkjHPG07M545KZ3TOH03i8LG8ORkqGz5ARpOBJh3hjLSuuXkxV/vMeReDMyzZeRio6+
	dM1qhdQ2Jstm3MsAlDxgIj3ctsJwdXgFAYslhu8M7vRL
X-Google-Smtp-Source: AGHT+IEG4FS/R2kI8KY7Y6BMKDQ4ChbQOGPNNqqjLITe8vIAO2Fdq+bz9kbGfId2k7kn9aSzzPLDZA==
X-Received: by 2002:a05:6a21:6d84:b0:1f0:e6db:b382 with SMTP id adf61e73a8af0-20445d6f33amr6372289637.8.1745556558879;
        Thu, 24 Apr 2025 21:49:18 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:31bc:3ff4:5c95:74bc])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15f76f45d2sm2059846a12.11.2025.04.24.21.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 21:49:18 -0700 (PDT)
Date: Fri, 25 Apr 2025 13:49:13 +0900
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
Message-ID: <xhkbymqobtva6j7xmwzvh5g2tvuixvu2hwfdozed6hijrt3vkl@rywdhz43e52y>
References: <20250424070436.2380215-1-senozhatsky@chromium.org>
 <aAoZbwEtkQ3gVl5d@pathway.suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAoZbwEtkQ3gVl5d@pathway.suse.cz>

Hi Petr,

On (25/04/24 12:58), Petr Mladek wrote:
> On Thu 2025-04-24 16:02:43, Sergey Senozhatsky wrote:
> > Currently, hung-task watchdog uses two different loglevels
> > to report hung-tasks: a) KERN_INFO for all the important task
> > information (e.g. sched_show_task()) and b)  KERN_ERR for the
> > rest.
> 
> IMHO, the two different loglevels make sense. The KERN_ERR
> message seems to inform about that a task gets blocked for too long.
> And KERN_INFO is used for an extra debug information.
> 
> > This makes it a little inconvenient, especially for
> > automated kernel logs parsing.
> 
> Anyway, what is the exact problem, please?
> Are the KERN_INFO messages filtered because of console_loglevel?
> Or is it a problem to match all the related lines?

The latter one.  A made up example, just to demonstrate what we are
getting now:

<3>[  125.297687][  T140] INFO: task zsh:470 blocked for more than 61 seconds.
<3>[  125.302321][  T140]       Not tainted 6.15.0-rc3-next-20250424-00001-g258d8df78c77-dirty #154
<3>[  125.309333][  T140] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
<6>[  125.315040][  T140] task:zsh             state:D stack:0     pid:470   tgid:470   ppid:430    task_flags:0x400100 flags:0x00004002
<6>[  125.320594][  T140] Call Trace:
<6>[  125.322327][  T140]  <TASK>
<6>[  125.323852][  T140]  __schedule+0x13b4/0x2120
<6>[  125.325459][  T140]  ? schedule+0xdc/0x280
<6>[  125.327100][  T140]  schedule+0xdc/0x280
<6>[  125.328590][  T140]  schedule_preempt_disabled+0x10/0x20
<6>[  125.330589][  T140]  __mutex_lock+0x698/0x1200
<6>[  125.332291][  T140]  ? __mutex_lock+0x485/0x1200
<6>[  125.334074][  T140]  mutex_lock+0x81/0x90
<6>[  125.335113][  T140]  drop_caches_sysctl_handler+0x3e/0x140
<6>[  125.336665][  T140]  proc_sys_call_handler+0x327/0x4f0
<6>[  125.338069][  T140]  vfs_write+0x794/0xb60
<6>[  125.339216][  T140]  ? proc_sys_read+0x10/0x10
<6>[  125.340568][  T140]  ksys_write+0xb8/0x170
<6>[  125.341701][  T140]  do_syscall_64+0xd0/0x1a0
<6>[  125.343009][  T140]  ? arch_exit_to_user_mode_prepare+0x11/0x60
<6>[  125.344612][  T140]  ? irqentry_exit_to_user_mode+0x7e/0xa0
<6>[  125.346260][  T140]  entry_SYSCALL_64_after_hwframe+0x4b/0x53
<6>[  125.347772][  T140] RIP: 0033:0x7fa4bd8be687
<6>[  125.348958][  T140] RSP: 002b:00007ffecf417820 EFLAGS: 00000202 ORIG_RAX: 0000000000000001
<6>[  125.351161][  T140] RAX: ffffffffffffffda RBX: 00007fa4bd82e300 RCX: 00007fa4bd8be687
<6>[  125.353221][  T140] RDX: 0000000000000002 RSI: 00005621f5c65860 RDI: 0000000000000001
<6>[  125.355338][  T140] RBP: 00005621f5c65860 R08: 0000000000000000 R09: 0000000000000000
<6>[  125.357424][  T140] R10: 0000000000000000 R11: 0000000000000202 R12: 0000000000000002
<6>[  125.359677][  T140] R13: 00007fa4bda175c0 R14: 00007fa4bda14e80 R15: 00007fa4bdb59f70
<6>[  125.361551][  T140]  </TASK>
<3>[  125.362363][  T140] INFO: task zsh:470 is blocked on a mutex likely owned by task zsh:470.
<6>[  125.364467][  T140] task:zsh             state:D stack:0     pid:470   tgid:470   ppid:430    task_flags:0x400100 flags:0x00004002
<6>[  125.367493][  T140] Call Trace:
<6>[  125.368359][  T140]  <TASK>
<6>[  125.369180][  T140]  __schedule+0x13b4/0x2120
<6>[  125.370364][  T140]  ? schedule+0xdc/0x280
<6>[  125.371486][  T140]  schedule+0xdc/0x280
<6>[  125.372518][  T140]  schedule_preempt_disabled+0x10/0x20
<6>[  125.374049][  T140]  __mutex_lock+0x698/0x1200
<6>[  125.375326][  T140]  ? __mutex_lock+0x485/0x1200
<6>[  125.376572][  T140]  mutex_lock+0x81/0x90
<6>[  125.377773][  T140]  drop_caches_sysctl_handler+0x3e/0x140
<6>[  125.379391][  T140]  proc_sys_call_handler+0x327/0x4f0
<6>[  125.380715][  T140]  vfs_write+0x794/0xb60
<6>[  125.381951][  T140]  ? proc_sys_read+0x10/0x10
<6>[  125.383083][  T140]  ksys_write+0xb8/0x170
<6>[  125.384329][  T140]  do_syscall_64+0xd0/0x1a0
<6>[  125.385461][  T140]  ? arch_exit_to_user_mode_prepare+0x11/0x60
<6>[  125.387110][  T140]  ? irqentry_exit_to_user_mode+0x7e/0xa0
<6>[  125.388566][  T140]  entry_SYSCALL_64_after_hwframe+0x4b/0x53
<6>[  125.390194][  T140] RIP: 0033:0x7fa4bd8be687
<6>[  125.391268][  T140] RSP: 002b:00007ffecf417820 EFLAGS: 00000202 ORIG_RAX: 0000000000000001
<6>[  125.393367][  T140] RAX: ffffffffffffffda RBX: 00007fa4bd82e300 RCX: 00007fa4bd8be687
<6>[  125.395506][  T140] RDX: 0000000000000002 RSI: 00005621f5c65860 RDI: 0000000000000001
<6>[  125.397494][  T140] RBP: 00005621f5c65860 R08: 0000000000000000 R09: 0000000000000000
<6>[  125.399701][  T140] R10: 0000000000000000 R11: 0000000000000202 R12: 0000000000000002
<6>[  125.401663][  T140] R13: 00007fa4bda175c0 R14: 00007fa4bda14e80 R15: 00007fa4bdb59f70
<6>[  125.403579][  T140]  </TASK>

So there are <3> and then <6> lines and we can't easily tell when to
stop parsing and what to consider part of the automated error report
and what not to, there also can be some other <6> lines in between.

> > Introduce CONFIG_HUNG_TASK_STACKTRACE_LOGLEVEL so that (a)
> > becomes configurable.
> 
> I am not sure if adding hung-task-specific config option is
> the right solution. I guess that other watchdogs or other
> similar reports have the same problem.
>
> It seems that several other reports, for example,
> watchdog_hardlockup_check(), or __die(), are using KERN_DEFAULT
> which is configurable via CONFIG_MESSAGE_LOGLEVEL_DEFAULT.
> 
> A solution might be using KERN_DEFAULT for sched_show_task()
> in hung_tasks detector as well.

So my worry with CONFIG_MESSAGE_LOGLEVEL_DEFAULT was that, if we
set it, say, to 3 (KERN_ERR), then how many "false positives" we
will get?  There are many printk("") calls in the kernel that
default to MESSAGE_LOGLEVEL_DEFAULT, as far as I understand it:
	git grep "printk(\"" | grep -v TP_printk | wc -l
	9001

But maybe that is the solution.  Do you want to switch sched_show_task()
to KERN_DEFAULT for all or would it be better to still introduce
sched_show_task_log_lvl() can call it with KERN_DEFAULT only from
kernel/hung_task.c?
