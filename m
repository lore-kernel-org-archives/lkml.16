Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C932D746E
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 15:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746199856; cv=none; b=IzITD83Rbqru9R5uwdpWDOWrdKjGgrY1zk0lyt1n51CIPAn7kkoZd8N1PQeqI78zJ1Uajp3jW6VYfWyjZEn1RArMznIr4BSd3QRq7Hdgm0OClXFee/olZJNcPhW6dQWVIDTXF1XmFPnTuthM6YXYhNMbICDuJa/wujEktYvtVus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746199856; c=relaxed/simple;
	bh=QGCmV0kVyGuw7Z7It5zmSwy+XdrcMXink/+6g8Ef144=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=UxHrNEmOckJpm4iKRXfA+zZTZQEhSGV+zLlxi9uiYOJeqsCEhq4ZQlIjnmPJWBNWVIjycGRhKFKbDfmjQ+HX0/2U++BCWxMYx1i/FsNErJDMXk/QjXo2h8zMFSbF5nSZl31syA/XniFQp93GRN4saeHpgRYQBcsufPhsNatQ1xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=AryFXd5t; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=+IIMJ2im; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="AryFXd5t";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="+IIMJ2im"
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746199852;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=A1yvt1e3Eah5A4nWGUKKgNc1iSLD6l9nhmRr3bwt9os=;
	b=AryFXd5t9s64GTXOdaOppxPUvBdyhT+IWY/bXgMmFPRl/h0l3JwulTkK9dfsWeu2SZRVQD
	xMEtL1NqnNYMJ5tmw07cgLOrpmy5bvxD4qJtyyoKEgIozkAint01I777M5ocz39ViAnqwS
	vYO2ZUeR1AlSlLXgghK5wdbgcltnLbuuiQN163UAjUGnFwsIJt47udNf/oupNXK21wUJuR
	ABRWIMZ7Zti+RF4vDJ5Bxh3Ng4aSTiNT5TlBKDDWRexvWgniLbHshJz1B9uDGwtuKfw9v1
	JlcdXyJ/Zo2vXiBNUYerC+L63mhxR4Uw1CK/VG8ZNKMnjapdaKmIkyXMBtu1fQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746199852;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=A1yvt1e3Eah5A4nWGUKKgNc1iSLD6l9nhmRr3bwt9os=;
	b=+IIMJ2imXcnbiQqqVrHDM+24EfOjb2kv/yQVKDI5yhwR9evrbD1yE0VQoPHWQ4UwI5XJNh
	sEYe36bvEIMISCAA==
To: Petr Mladek <pmladek@suse.com>, Tomasz Figa <tfiga@chromium.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Ingo Molnar
 <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Juri Lelli
 <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, Ben Segall
 <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Steven Rostedt
 <rostedt@goodmis.org>, Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hung_task: configurable hung-task stacktrace loglevel
In-Reply-To: <aBTfN5cSrPvHHvCS@localhost.localdomain>
References: <20250424070436.2380215-1-senozhatsky@chromium.org>
 <aAoZbwEtkQ3gVl5d@pathway.suse.cz>
 <CAAFQd5A6J-UCy46bp1MYP0imJf3oUL29mxFVLZZZ4JmP2YTvhQ@mail.gmail.com>
 <aAuq-3yjYM97rvj1@pathway.suse.cz>
 <CAAFQd5BeJnYXZt06WVFBWu8cvCmXWTe_tH8Ly3ywTNRCjxXCMA@mail.gmail.com>
 <aBTfN5cSrPvHHvCS@localhost.localdomain>
Date: Fri, 02 May 2025 17:36:52 +0206
Message-ID: <84tt63c9n7.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On 2025-05-02, Petr Mladek <pmladek@suse.com> wrote:
>> The problem with the special lines is that it completely breaks any
>> line-based processing in a data pipeline. For a piece of
>> infrastructure that needs to deal with thousands of reports, on an
>> on-demand basis, that would mean quite a bit of sequential work done
>> instead of doing it in parallel and taking much more time to answer
>> users' queries.
>> 
>> That could be worked around, though, if we could prefix each line
>> separately with some special tag in addition to log level, timestamp
>> and caller, though. Borrowing from Sergey's earlier example:
>> 
>> <3>[  125.297687][  T140][E] INFO: task zsh:470 blocked for more than
>> 61 seconds.
>> <3>[  125.302321][  T140][E]       Not tainted
>> 6.15.0-rc3-next-20250424-00001-g258d8df78c77-dirty #154
>> <3>[  125.309333][  T140][E] "echo 0 >
>> /proc/sys/kernel/hung_task_timeout_secs" disables this message.
>> <6>[  125.315040][  T140][E] task:zsh             state:D stack:0
>> pid:470   tgid:470   ppid:430    task_flags:0x400100 flags:0x00004002
>> <6>[  125.320594][  T140][E] Call Trace:
>> <6>[  125.322327][  T140][E]  <TASK>
>> <6>[  125.323852][  T140][E]  __schedule+0x13b4/0x2120
>> <6>[  125.325459][  T140][E]  ? schedule+0xdc/0x280
>> <6>[  125.327100][  T140][E]  schedule+0xdc/0x280
>> <6>[  125.328590][  T140][E]  schedule_preempt_disabled+0x10/0x20
>> <6>[  125.330589][  T140][E]  __mutex_lock+0x698/0x1200
>> <6>[  125.332291][  T140][E]  ? __mutex_lock+0x485/0x1200
>> <6>[  125.334074][  T140][E]  mutex_lock+0x81/0x90
>> <6>[  125.335113][  T140][E]  drop_caches_sysctl_handler+0x3e/0x140
>> <6>[  125.336665][  T140][E]  proc_sys_call_handler+0x327/0x4f0
>> <6>[  125.338069][  T140][E]  vfs_write+0x794/0xb60
>> <6>[  125.339216][  T140][E]  ? proc_sys_read+0x10/0x10
>> <6>[  125.340568][  T140][E]  ksys_write+0xb8/0x170
>> <6>[  125.341701][  T140][E]  do_syscall_64+0xd0/0x1a0
>> <6>[  125.343009][  T140][E]  ? arch_exit_to_user_mode_prepare+0x11/0x60
>> <6>[  125.344612][  T140][E]  ? irqentry_exit_to_user_mode+0x7e/0xa0
>> <6>[  125.346260][  T140][E]  entry_SYSCALL_64_after_hwframe+0x4b/0x53
>> 
>> where [E] would mean an "emergency" message, rather than something
>> usual, regardless of the loglevel.
>
> This is an interesting idea. It has several advantages. It would:
>
>   + still allow to filter out the extra details on too slow consoles [1]
>   + work even when the "cut here" prefix/postfix lines get lost
>   + obsolete the config option forcing the same loglevel in emergency
>       section => safe space in struct task_struct. [2]

So I guess this would introduce a new printk_info_flags emergency
flag. The information needs to be stored in the ringbuffer.

> [1] Note that there is still floating a patchset which allows to define
>      per-console loglevel, see
>      https://lore.kernel.org/r/cover.1730133890.git.chris@chrisdown.name
>
> [2] It might be eventually replaced by a config option which would show
>     all emergency messages on consoles.

Which, when enabled, would simply result in setting LOG_FORCE_CON
whenever the new emergency flag is set.

John
