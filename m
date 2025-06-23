Received: from out30-131.freemail.mail.aliyun.com (out30-131.freemail.mail.aliyun.com [115.124.30.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C9B1DDD1
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 03:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750648035; cv=none; b=OIWnJ7rt3rLXeX4tV30t6Njg5hsV0rW+QUBwoIalca7SHI8dWGUHxqvh1uMP7zgML9LtgqmVwpej3fU5ELCoV73lFzauT2K0DSUYvtsCNy/Cf+fc+NnTdyoLFOe0sSxINfn7VhQMJwoadZuvXr+ND3vhG+zRhVYfKHc8aca4Q9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750648035; c=relaxed/simple;
	bh=Uv3MVPKnp1fO86XVPwxUoL4xNgW7a6lR3l6rPo3tWQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tbQz9WhKq+zwP/uY7P5mpv7clCGliBDan8i08puc8jBNMbBkt8bLrg5L55UAhl8zlosRRg9L48cqFYHHTfhDLqzNFksXuU31in2GaYDfjpmCHxeIRuj+yJP1/dSGJqbRG3RYvQi+ebaj8LgdAabYRNydU/UsV4wG4RFi0Tvfub8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=Tyz80OYj; arc=none smtp.client-ip=115.124.30.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="Tyz80OYj"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1750648025; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=JO+tuAoW03LmFnspGWX4QJYgSpEAh86DYYpscV+7kMI=;
	b=Tyz80OYjWW/Kh1vLiMGXQaE7/IB7fVxBfTWUatlb5JUpI70nJ14zB9KcWqaO3imB980u/iFDn9vSo9SP9q0FXp9Gr2I7yp55Bo3dXzYglhCTRHLTe5062N89UCp3RYz4dUqJzce111dmAuqM0IotfEoDbdWVbjvw4KG6bc/4tNc=
Received: from localhost(mailfrom:feng.tang@linux.alibaba.com fp:SMTPD_---0WeSFcsc_1750648023 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 23 Jun 2025 11:07:04 +0800
Date: Mon, 23 Jun 2025 11:07:03 +0800
From: Feng Tang <feng.tang@linux.alibaba.com>
To: Petr Mladek <pmladek@suse.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Lance Yang <lance.yang@linux.dev>, Jonathan Corbet <corbet@lwn.net>,
	linux-kernel@vger.kernel.org, paulmck@kernel.org,
	john.ogness@linutronix.de
Subject: Re: [PATCH V2 2/5] panic: generalize panic_print's function to show
 sys info
Message-ID: <aFjE121WcfADtbDo@U-2FWC9VHC-2323.local>
References: <20250616010840.38258-1-feng.tang@linux.alibaba.com>
 <20250616010840.38258-3-feng.tang@linux.alibaba.com>
 <aFV8ZFZ0Qy715hdR@pathway.suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aFV8ZFZ0Qy715hdR@pathway.suse.cz>

On Fri, Jun 20, 2025 at 05:21:08PM +0200, Petr Mladek wrote:
> On Mon 2025-06-16 09:08:37, Feng Tang wrote:
> > 'panic_print' was introduced to help debugging kernel panic by dumping
> > different kinds of system information like tasks' call stack, memory,
> > ftrace buffer, etc. Acutually this function could also help debugging
> > cases like task-hung, soft/hard lockup, and other cases , where user
> > may need the snapshot of system info at that time.
> > 
> > Extract sys_show_info() function out of panic code to be used by other
> > kernel parts for debugging.
> > 
> > --- a/include/linux/kernel.h
> > +++ b/include/linux/kernel.h
> > @@ -27,6 +27,7 @@
> >  #include <linux/math.h>
> >  #include <linux/minmax.h>
> >  #include <linux/typecheck.h>
> > +#include <linux/sys_info.h>
> 
> There will be only few users of this API. There is no need to
> include it via this generic header which is included almost
> everywhere.
> 
> Some people are working hard on getting rid of this header file,
> see the comment at the beginning:
> 
>  * This header has combined a lot of unrelated to each other stuff.
>  * The process of splitting its content is in progress while keeping
>  * backward compatibility. That's why it's highly recommended NOT to
>  * include this header inside another header file, especially under
>  * generic or architectural include/ directory.
> 
> Instead, please include the new linux/sys_info.h in panic.c directly.

Makes sense! WIll change.

> >  #include <linux/panic.h>
> >  #include <linux/printk.h>
> >  #include <linux/build_bug.h>
> 
> > --- /dev/null
> > +++ b/include/linux/sys_info.h
> > @@ -0,0 +1,20 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#ifndef _LINUX_SYS_INFO_H
> > +#define _LINUX_SYS_INFO_H
> > +
> > +/*
> > + * SYS_SHOW_ALL_PRINTK_MSG is for panic case only, as it needs special
> > + * handling which only fits panic case.
> 
> This flags is really special. I would even rename it to match
> the function where it is used:
> 
> #define PANIC_CONSOLE_REPLAY		0x00000020
> 
> And it would be better to do the rename (ALL_PRINTK_MSG ->
> CONSOLE_REPLAY) already in the 1st patch where panic_console_replay()
> was introduced.
 
OK.

> Also it would make sense to update the documentation (in 1st patch),
> something like:
> 
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -4533,7 +4533,7 @@
>  			bit 2: print timer info
>  			bit 3: print locks info if CONFIG_LOCKDEP is on
>  			bit 4: print ftrace buffer
> -			bit 5: print all printk messages in buffer
> +			bit 5: replay all messages on consoles at the end of panic
>  			bit 6: print all CPUs backtrace (if available in the arch)
>  			bit 7: print only tasks in uninterruptible (blocked) state
>  			*Be aware* that this option may print a _lot_ of lines,

Will change.

> > + */
> > +#define SYS_SHOW_TASK_INFO		0x00000001
> > +#define SYS_SHOW_MEM_INFO		0x00000002
> > +#define SYS_SHOW_TIMER_INFO		0x00000004
> > +#define SYS_SHOW_LOCK_INFO		0x00000008
> > +#define SYS_SHOW_FTRACE_INFO		0x00000010
> > +#define SYS_SHOW_ALL_PRINTK_MSG		0x00000020
> > +#define SYS_SHOW_ALL_CPU_BT		0x00000040
> > +#define SYS_SHOW_BLOCKED_TASKS		0x00000080
> > +
> > +extern void sys_show_info(unsigned long info_mask);
> 
> Please, do not use "extern" in new header files. This is from
> Documentation/process/coding-style.rst:
> 
>     Do not use the ``extern`` keyword with function declarations as this makes
>     lines longer and isn't strictly necessary.
 
Thanks for the note!

> Also the header file is named "sys_info" but the API is "sys_show_*info".
> It would be more user friendly to consistently use the same prefix
> for the entire API, for example:
> 
> #define SYS_INFO_TASK		0x00000001
> #define SYS_INFO_MEM		0x00000002
> #define SYS_INFO_TIMER		0x00000004

Yeap, shorter and cleaner.

> 
> void sys_info(unsigned long si_mask);
> 
> I am sorry that I did not tell your this in the RFC.
> I focused on the bigger picture at that time.
 
No problem. Thanks for the review!

- Feng

> > +#endif	/* _LINUX_SYS_INFO_H */
> 
> Best Regards,
> Petr
