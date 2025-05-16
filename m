Received: from out30-112.freemail.mail.aliyun.com (out30-112.freemail.mail.aliyun.com [115.124.30.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264EA17E4
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 05:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747373894; cv=none; b=p9hD2pdOpQCu6QaXM/XratWsOPP3wgdgQUWYY6jOvyyw8LWJ25Pm8ooNNbyYtv0MvjSkHAj9VE2Xc0Wy2JdDS4S2vFHcrVgxg3lFmXOBnMo6+TVmfezLHwNMds3eJOFhLjtPa/Z4SfARQCG4Sl7AntXwYxtL3Uj9BSTVvbbP9vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747373894; c=relaxed/simple;
	bh=aPbiX9hNXQGlvyxvgNBdx0mVYr36VQOZZXZehJl1gTc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jV2w3wDx4FgGfbVt52B2Zqb7FWpvlH3ZCfri7bDoBvEDFCUtHvQS7vMU+s4KoYdrF2Ojs0M5P5zCFNiqvFGXNulCtCjzRqUKdwHogzdX98iL/1lr563x3GxgbOWY0PuwL11sjvKwP9QWblGntlWo3nZxthknldEtLszcQ/sPuQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=Z/CIceFg; arc=none smtp.client-ip=115.124.30.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="Z/CIceFg"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1747373884; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=SGK2pVlA7JEZeD/X0WI0GX7OlKpnsT8ceac4MJIueAg=;
	b=Z/CIceFgUu6XOZt1RzZaIt9iH8B930qA63DdW4F4iFTBDV0SfJXpUZN3ergJozPVSN39uD8SAGggC7jdGF3Uncr5E7j+YKnjyazzqXL8QQv4gF+OdxIbrEtFTRjy2SCzSCuPfjSPv6bDjYfAV6AxKM6VI2pZbxsiKL/ouIkDCBM=
Received: from localhost(mailfrom:feng.tang@linux.alibaba.com fp:SMTPD_---0WauPIS6_1747373883 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 16 May 2025 13:38:03 +0800
Date: Fri, 16 May 2025 13:38:02 +0800
From: Feng Tang <feng.tang@linux.alibaba.com>
To: Petr Mladek <pmladek@suse.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Lance Yang <lance.yang@linux.dev>, linux-kernel@vger.kernel.org,
	mhiramat@kernel.org, llong@redhat.com,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH v1 1/3] kernel/panic: generalize panic_print's function
 to show sys info
Message-ID: <aCbPOry4r_ac0zUL@U-2FWC9VHC-2323.local>
References: <20250511085254.61446-1-feng.tang@linux.alibaba.com>
 <20250511085254.61446-2-feng.tang@linux.alibaba.com>
 <aCMXf0JOi1g6ZI8u@pathway.suse.cz>
 <aCNHzXkz4wfnIDPM@U-2FWC9VHC-2323.local>
 <aCXCpGkXJ1x9ncHS@pathway.suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aCXCpGkXJ1x9ncHS@pathway.suse.cz>

On Thu, May 15, 2025 at 12:32:04PM +0200, Petr Mladek wrote:
> On Tue 2025-05-13 21:23:25, Feng Tang wrote:
> > Hi Petr,
> > 
> > Thanks for the review!
> > 
> > On Tue, May 13, 2025 at 11:57:19AM +0200, Petr Mladek wrote:
> > > On Sun 2025-05-11 16:52:52, Feng Tang wrote:
> > > > panic_print was introduced to help debugging kernel panic by dumping
> > > > different kinds of system information like tasks' call stack, memory,
> > > > ftrace buffer etc. Acutually this function could help debugging cases
> > > > like task-hung, soft/hard lockup too, where user may need the snapshot
> > > > of system info at that time.
> > > > 
> > > The generic approach might deserve a separate source file,
> > > for example:
> > > 
> > >     include/linux/sys_info.h
> > >     lib/sys_info.c
> > 
> > Thanks for the suggestion! I'm really not good at naming. 
> > 
> > As panic.c is always built-in, I'll put sys_info.c as obj-y.
> 
> Makes sense.
> 
> > > Also I always considered the bitmask as a horrible user interface.
> > > It might be used internally. But it would be better to allow a human
> > > readable parameter, for example:
> > > 
> > > 	panic_sys_info=task,mem,timer,lock,ftrace,bt,all_bt,blocked_tasks
> > 
> > Yes, it's convenient for developers, as a cmdline parameter being parsed
> > at boot time.
> > 
> > But I think bitmask may be easier for runtime changing as a core parameter
> > under /proc/ or /sys/, or from sysctl interface. There are also some other
> > modules use debug bitmask controlling printking info for different
> > sub-components.
> 
> Good to know. Could you please give me a pointer to some other modules
> using the bitmask? I believe that they exist but I can't find any.
> I wonder how common it is...

Definitely not common :) I only know one: ACPI, which has 2 debug knobs,
'debug_layer' is a bigmap to control which sub-component's msg to be
dumped, and 'debug_level'.

> Anyway, I personally find words/names easier to use.

True. For me, I have some notes sticked on my monitor: one about characters
for /proc/sysrq-trigger, one for panic_print, one for struct page's flag :)

> For example,
> I like the following interfaces:
> 
>   #> cat /sys/power/pm_test
>   [none] core processors platform devices freezer
> 
>   #> cat /sys/kernel/debug/tracing/available_tracers
>   blk function_graph wakeup_dl wakeup_rt wakeup function nop
> 
>   #> cat /proc/sys/kernel/seccomp/actions_avail
>   kill_process kill_thread trap errno user_notif trace log allow
>   # cat /proc/sys/kernel/seccomp/actions_logged
>   kill_process kill_thread trap errno user_notif trace log

Thanks for the info, will check them.

> > And we have similar control knobs for hung, lockup etc.
> > 
> > Or should I change the name from 'xxx_print_mask' to 'xxx_sysinfo_flag'
> > in patch 2/3 ?
> > 
> > > 
> > > The console reply might be handled by a separate:
> > > 
> > > 	panic_console_reply=1
> > > 
> > > And it would obsolete the existing "panic_print" which is an
> > > ugly name and interface from my POV.
> > 
> > Agree it's ugly :). But besides a kernel parameter,  'panic_print' is
> > also a sysctl interface, I'm afraid renaming it might break user ABI.
> 
> A solution would be to keep it and create "panic_sys_info="
> with the human readable parameters in parallel. They would
> store the request in the same bitmap.
> 
> We could print a message that "panic_print" has been obsoleted
> by "panic_sys_info" when people use it.
> 
> Both parameters would override the current bitmap. So the later
> used parameter or procfs/sysfs write would win.

Reasonalbe.

> Note:
> 
> One question is whether to use sysctl or module parameters.
> 
> An advantage of sysctl is the "systcl" userspace tool. Some people
> might like it. But the API is very old and a bit cumbersome for
> implementing.
> 
> The sysfs, aka include/linux/moduleparam.h, API looks cleaner to me.
> But the parameters are hidden in the /sys/... jungle ;-)
> 
> I would slightly prefer "sysctl" because these parameters are easier
> to find.

I will think about the string parsing in sys_info.c, and in the backend,
a bitmap is still needed to save the parsing result, and as the parameter
for sys_show_info().

Also if we go 'sysctl' way, in the future, some exising interface like
'sysctl_hung_task_all_cpu_backtrace' could be deprecated and integrated
into the 'hung_task_sys_info'? 

Thanks,
Feng

> Best Regards,
> Petr
