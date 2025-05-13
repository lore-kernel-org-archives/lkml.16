Received: from out30-97.freemail.mail.aliyun.com (out30-97.freemail.mail.aliyun.com [115.124.30.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8437F1E5B9D
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 13:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747142931; cv=none; b=IdcOKe612/erUnsxeaRzIATGcExDuvdTZv7yA5oirsHtpMWPwR5Hx0zPQjtCCbw6ETKuX9SOIr3r+uCH3tBZMPzJdEwvJHf9pTE3fsz2rZpvOLdE4UVQWrPXdvf+gly+FFvO3JMhhFrYSKnR+jO0mu7RT1Xb8a83mD6kZA+NGeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747142931; c=relaxed/simple;
	bh=UeQ0R6/2OS4BggIY2zYE8XT+93b2kOy9oTbdqkpSZ/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FEEXPsWh30eis3R45X7UxVfJXtfJZ+nNry2u0YP8sFXrO2GwNnkoQc3vv+Lvfe+xzi61UVni552KP8a3wJPnaCxp7tUw2HWBz+uJ45Om8YzQc7fy8n4k4qVmcxcj0E4+edbObWBS9yTgUpSXPwqHnJhrXz3kyZGkDnZqOl1KJw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=omVlSl+s; arc=none smtp.client-ip=115.124.30.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="omVlSl+s"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1747142924; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=SogKgca4SRd3X5KRN0cFvcTQeBOkLPMuNvAdEG4/e1U=;
	b=omVlSl+sY2nOnPrCLpvvMC+f5MX8/QLRAyeZb+1ICP9XWD4IkSdukKt4MYHhSKD0J8YV9rGDN/caqvpDLHdaH1Trl6H6fuLndm+hSRbiUbtK3Y4ZmKGtP+jiKgwljQlesRjWUwuo1beCSATP2zlnyezyA9EVlACWw+iNQrOK1TI=
Received: from localhost(mailfrom:feng.tang@linux.alibaba.com fp:SMTPD_---0WabVqvr_1747142606 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 13 May 2025 21:23:26 +0800
Date: Tue, 13 May 2025 21:23:25 +0800
From: Feng Tang <feng.tang@linux.alibaba.com>
To: Petr Mladek <pmladek@suse.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Lance Yang <lance.yang@linux.dev>, linux-kernel@vger.kernel.org,
	mhiramat@kernel.org, llong@redhat.com
Subject: Re: [PATCH v1 1/3] kernel/panic: generalize panic_print's function
 to show sys info
Message-ID: <aCNHzXkz4wfnIDPM@U-2FWC9VHC-2323.local>
References: <20250511085254.61446-1-feng.tang@linux.alibaba.com>
 <20250511085254.61446-2-feng.tang@linux.alibaba.com>
 <aCMXf0JOi1g6ZI8u@pathway.suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aCMXf0JOi1g6ZI8u@pathway.suse.cz>

Hi Petr,

Thanks for the review!

On Tue, May 13, 2025 at 11:57:19AM +0200, Petr Mladek wrote:
> On Sun 2025-05-11 16:52:52, Feng Tang wrote:
> > panic_print was introduced to help debugging kernel panic by dumping
> > different kinds of system information like tasks' call stack, memory,
> > ftrace buffer etc. Acutually this function could help debugging cases
> > like task-hung, soft/hard lockup too, where user may need the snapshot
> > of system info at that time.
> > 
> > Extract sys_show_info() function out to be used by other kernel parts
> > for debugging.
> > 
> > --- a/include/linux/panic.h
> > +++ b/include/linux/panic.h
> > @@ -16,6 +16,17 @@ extern void oops_enter(void);
> >  extern void oops_exit(void);
> >  extern bool oops_may_print(void);
> >  
> > +#define SYS_PRINT_TASK_INFO		0x00000001
> > +#define SYS_PRINT_MEM_INFO		0x00000002
> > +#define SYS_PRINT_TIMER_INFO		0x00000004
> > +#define SYS_PRINT_LOCK_INFO		0x00000008
> > +#define SYS_PRINT_FTRACE_INFO		0x00000010
> > +#define SYS_PRINT_ALL_PRINTK_MSG	0x00000020
> 
> Please, remove this option from the generic interface. It is
> controversial. In the current form, it makes sense to replay
> the log only in panic() after all the other actions:
> 
> 	console_verbose();
> 	bust_spinlocks(1);
> 	panic_other_cpus_shutdown(_crash_kexec_post_notifiers);
> 	printk_legacy_allow_panic_sync();
> 	console_unblank();
> 	debug_locks_off();
> 	console_flush_on_panic(CONSOLE_FLUSH_PENDING);

OK, will do.

In my RFC version, I did reserved it for panic use only :) and
added the support to general case in v1 after some hesitation. 

https://lore.kernel.org/lkml/20250507104322.30700-2-feng.tang@linux.alibaba.com/

> 
> All these operations have some (side-)effect which increases
> the chance to actually see the messages on the console.
> 
> I think that it was primary meant for graphics consoles. But there
> it would need to be used together with printk_delay
> (/proc/sys/kernel/printk_delay, sysctl printk_delay).
> 
> Note that it creates a hairy code. It is the only reason why we need to
> call panic_print_sys_info() twice with "false" and "true"
> parameter.

Yes.

> 
> That said, I could imagine a generic use, for example, after forcing
> ignore_loglevel or so. Otherwise, I do not see any advantage in
> flushing the same messages again, for example, on serial or network
> consoles where they are likely already stored. We could add this
> later when there is a real-life demand.

You are right, one main usage is for some product which has only graphics
console and no serial one. And we also used for serial console sometimes,
when the console have a lot of user space message mixed with kernel ones,
and we'd like to see the full clean kernel messages.

> 
> > +#define SYS_PRINT_ALL_CPU_BT		0x00000040
> > +#define SYS_PRINT_BLOCKED_TASKS		0x00000080
> 
> The generic approach might deserve a separate source file,
> for example:
> 
>     include/linux/sys_info.h
>     lib/sys_info.c

Thanks for the suggestion! I'm really not good at naming. 

As panic.c is always built-in, I'll put sys_info.c as obj-y.

> Also I always considered the bitmask as a horrible user interface.
> It might be used internally. But it would be better to allow a human
> readable parameter, for example:
> 
> 	panic_sys_info=task,mem,timer,lock,ftrace,bt,all_bt,blocked_tasks

Yes, it's convenient for developers, as a cmdline parameter being parsed
at boot time.

But I think bitmask may be easier for runtime changing as a core parameter
under /proc/ or /sys/, or from sysctl interface. There are also some other
modules use debug bitmask controlling printking info for different
sub-components.

And we have similar control knobs for hung, lockup etc.

Or should I change the name from 'xxx_print_mask' to 'xxx_sysinfo_flag'
in patch 2/3 ?

> 
> The console reply might be handled by a separate:
> 
> 	panic_console_reply=1
> 
> And it would obsolete the existing "panic_print" which is an
> ugly name and interface from my POV.

Agree it's ugly :). But besides a kernel parameter,  'panic_print' is
also a sysctl interface, I'm afraid renaming it might break user ABI.

> > +extern void sys_show_info(unsigned long info_mask);
> > +
> >  extern bool panic_triggering_all_cpu_backtrace;
> >  extern int panic_timeout;
> >  extern unsigned long panic_print;
> > --- a/kernel/panic.c
> > +++ b/kernel/panic.c
> > @@ -208,33 +200,44 @@ void nmi_panic(struct pt_regs *regs, const char *msg)
> >  }
> >  EXPORT_SYMBOL(nmi_panic);
> >  
> > -static void panic_print_sys_info(bool console_flush)
> > +void sys_show_info(unsigned long info_mask)
> >  {
> > -	if (console_flush) {
> > -		if (panic_print & PANIC_PRINT_ALL_PRINTK_MSG)
> > -			console_flush_on_panic(CONSOLE_REPLAY_ALL);
> > -		return;
> > -	}
> > -
> > -	if (panic_print & PANIC_PRINT_TASK_INFO)
> > +	if (info_mask & SYS_PRINT_TASK_INFO)
> >  		show_state();
> >  
> > -	if (panic_print & PANIC_PRINT_MEM_INFO)
> > +	if (info_mask & SYS_PRINT_MEM_INFO)
> >  		show_mem();
> >  
> > -	if (panic_print & PANIC_PRINT_TIMER_INFO)
> > +	if (info_mask & SYS_PRINT_TIMER_INFO)
> >  		sysrq_timer_list_show();
> >  
> > -	if (panic_print & PANIC_PRINT_LOCK_INFO)
> > +	if (info_mask & SYS_PRINT_LOCK_INFO)
> >  		debug_show_all_locks();
> >  
> > -	if (panic_print & PANIC_PRINT_FTRACE_INFO)
> > +	if (info_mask & SYS_PRINT_FTRACE_INFO)
> >  		ftrace_dump(DUMP_ALL);
> >  
> > -	if (panic_print & PANIC_PRINT_BLOCKED_TASKS)
> > +	if (panic_print & SYS_PRINT_ALL_PRINTK_MSG)
> > +		console_flush_on_panic(CONSOLE_REPLAY_ALL);
> 
> I do not see any advantage in replaying the log at this stage.
> It might make sense to replay the messages printed before
> the critical situation. But it makes sense only when they
> might be filtered/blocked before and can be seen now (unblanked
> consoles, forced  ignore_loglevel, or so).
> 
> I would keep this in the bitmap for backward compactibility.
> But I would ignore it my the generic print_sys_info().

OK.

> And I would replace panic_print_sys_info(true) call with:
> 
> static void panic_console_replay(void)
> {
> 	if (panic_print & SYS_PRINT_ALL_PRINTK_MSG)
> 		console_flush_on_panic(CONSOLE_REPLAY_ALL);
> }

Nice cleanup! Will do. I'll fold this change with this patch.

Thanks,
Feng

> 
> > +	if (info_mask & SYS_PRINT_ALL_CPU_BT)
> > +		trigger_all_cpu_backtrace();
> > +
> > +	if (info_mask & SYS_PRINT_BLOCKED_TASKS)
> >  		show_state_filter(TASK_UNINTERRUPTIBLE);
> >  }
> 
> Best Regards,
> Petr
