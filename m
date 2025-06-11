Received: from out30-110.freemail.mail.aliyun.com (out30-110.freemail.mail.aliyun.com [115.124.30.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5BD283C8C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 13:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749649396; cv=none; b=SeZ7wK4IspGrMRB+QF41YBoCXZg2PbYw+rb1AcJLKhK1M3MXG8J+ClpZ/hjoi3v1FRdi6LiIhJN5rFYrEQ4kJXd6zbOY6uw3WG7Mh92V6bmurik+F/Bw0j/axlaMtw0gUXMDA2hvvauVTf/vaf5gb6xzekVmH7TM8pruRYnWAxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749649396; c=relaxed/simple;
	bh=d7M2Yf2nMMYVtXgp6jVsep8bS5X2JaEQTLw12tFnuH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WY6DOj4XvGbAhR2wzifIe8RRVj9sbO9EniURfqH2kFtWRq5VeluBJXxQ33NXVdwDi8eh0VrEtW08rheqbIzWd3p+4on0oQ5hneplIsc9RPHsdnvIgZsdRD1ia4QpVVYFfIGalcZDwOayOvkulLTr9aZ7JPwK/G9zU7MSUteUidE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=vH9Kn9zY; arc=none smtp.client-ip=115.124.30.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="vH9Kn9zY"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1749649382; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=uNWfyrwsZewb1ypeWW/hB0H0RxCft6Ku1ei4fo0t4Ck=;
	b=vH9Kn9zYLkCSr7Eu3ZJvl4ZKv5tuPchQ349pNA+YtQ6hfJPf3l6hMzUnfYK5XE8RVLqwf3CXL+d1Vv5VLdW/QYTNuKnyyzpT5pCRZbfEGF0jt5O9bYryPgXOMOtgnn9DzLfttpNwu+ZCMhgPgpIRY9kfmaqVrooM1yWM0gcT5A8=
Received: from localhost(mailfrom:feng.tang@linux.alibaba.com fp:SMTPD_---0WddMyx3_1749649381 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 11 Jun 2025 21:43:01 +0800
Date: Wed, 11 Jun 2025 21:43:00 +0800
From: Feng Tang <feng.tang@linux.alibaba.com>
To: Petr Mladek <pmladek@suse.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Lance Yang <lance.yang@linux.dev>, linux-kernel@vger.kernel.org,
	mhiramat@kernel.org, llong@redhat.com,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH v1 1/3] kernel/panic: generalize panic_print's function
 to show sys info
Message-ID: <aEmH5JbdwFopOU4g@U-2FWC9VHC-2323.local>
References: <20250511085254.61446-1-feng.tang@linux.alibaba.com>
 <20250511085254.61446-2-feng.tang@linux.alibaba.com>
 <aCMXf0JOi1g6ZI8u@pathway.suse.cz>
 <aCNHzXkz4wfnIDPM@U-2FWC9VHC-2323.local>
 <aCXCpGkXJ1x9ncHS@pathway.suse.cz>
 <aCbPOry4r_ac0zUL@U-2FWC9VHC-2323.local>
 <aC1lKGWOuYXP7Bmt@U-2FWC9VHC-2323.local>
 <aEhS4iybzwYYMkJF@pathway.suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aEhS4iybzwYYMkJF@pathway.suse.cz>

On Tue, Jun 10, 2025 at 05:44:34PM +0200, Petr Mladek wrote:
[...]
> > > > Note:
> > > > 
> > > > One question is whether to use sysctl or module parameters.
> > > > 
> > > > An advantage of sysctl is the "systcl" userspace tool. Some people
> > > > might like it. But the API is very old and a bit cumbersome for
> > > > implementing.
> > > > 
> > > > The sysfs, aka include/linux/moduleparam.h, API looks cleaner to me.
> > > > But the parameters are hidden in the /sys/... jungle ;-)
> > > > 
> > > > I would slightly prefer "sysctl" because these parameters are easier
> > > > to find.
> > > 
> > > I will think about the string parsing in sys_info.c, and in the backend,
> > > a bitmap is still needed to save the parsing result, and as the parameter
> > > for sys_show_info().
> > 
> > Hi Petr
> > 
> > I tried further this way, and with below patch on top of current 1/3
> > patch, the 'panic_sys_info' sysctl interface basically works, as parsing
> > user-input, and save it in 'panic_print' bitmap. 
> 
> It does not apply. It seems that it depends on another change which
> crated lib/sys_info.c...

My bad. It could be another my local change which follows your suggestion
of using a panic_console_replay() cleanup.

> > It has  one problem that it doesn't support the string parsing as a the
> > kernel command line parameter (auto-derived from sysctl interface), I'm
> > not sure if we should add a __setup() or early_param() for it, or it's
> > fine?
> 
> Ah, I was not aware of this. We need to make it working from the
> command line, definitely. I would go with __setup() for now. We could
> always switch it to early_param() when anyone requires it.

OK.

> See some more comments, below.
> 
> > ---
> > diff --git a/include/linux/sys_info.h b/include/linux/sys_info.h
> > index 79bf4a942e5f..d6d55646e25a 100644
> > --- a/include/linux/sys_info.h
> > +++ b/include/linux/sys_info.h
> > @@ -17,4 +17,8 @@
> >  
> >  extern void sys_show_info(unsigned long info_mask);
> >  
> > +struct ctl_table;
> > +extern int sysctl_sys_info_handler(const struct ctl_table *ro_table, int write,
> > +					  void *buffer, size_t *lenp,
> > +					  loff_t *ppos);
> >  #endif	/* _LINUX_SYS_INFO_H */
> > diff --git a/kernel/panic.c b/kernel/panic.c
> > index 3d9cf8063242..8ca9b30f0fe4 100644
> > --- a/kernel/panic.c
> > +++ b/kernel/panic.c
> > @@ -88,6 +88,13 @@ static const struct ctl_table kern_panic_table[] = {
> >  		.extra2         = SYSCTL_ONE,
> >  	},
> >  #endif
> > +	{
> > +		.procname	= "panic_sys_info",
> > +		.data		= &panic_print,
> > +		.maxlen         = sizeof(panic_print),
> > +		.mode		= 0644,
> > +		.proc_handler	= sysctl_sys_info_handler,
> > +	},
> >  	{
> >  		.procname       = "warn_limit",
> >  		.data           = &warn_limit,
> > diff --git a/lib/sys_info.c b/lib/sys_info.c
> > index 4090b2e0515e..27de6f0d0a4d 100644
> > --- a/lib/sys_info.c
> > +++ b/lib/sys_info.c
> > @@ -4,6 +4,121 @@
> >  #include <linux/console.h>
> >  #include <linux/nmi.h>
> >  
> > +struct sys_info_name {
> > +	unsigned long bit;
> > +	const char *name;
> > +};
> > +
> > +static const char sys_info_avail[] = " tasks mem timer lock ftrace all_bt blocked_tasks ";
> 
> It is a bit confusing to have it space-separated when the parameter
> is comma-separated.

Aha, right.

> Also I am not sure why there is the leading and
> trailing space.

I tried to give more space to avoid 'char names[strlen()+1]' 

> I would expect:
> 
> static const char sys_info_avail[] = "tasks,mem,timer,lock,ftrace,all_bt,blocked_tasks";

OK.

> > +static const struct sys_info_name  si_names[] = {
> > +	{ SYS_SHOW_TASK_INFO,	"tasks" },
> > +	{ SYS_SHOW_MEM_INFO,	"mem" },
> > +	{ SYS_SHOW_TIMER_INFO,	"timer" },
> > +	{ SYS_SHOW_LOCK_INFO,	"lock" },
> > +	{ SYS_SHOW_FTRACE_INFO, "ftrace" },
> > +	{ SYS_SHOW_ALL_CPU_BT,	"all_bt" },
> > +	{ SYS_SHOW_BLOCKED_TASKS, "blocked_tasks" },
> > +};
> 
> I guess that this is just an RFC. Anyway, I would expect that
> SYS_SHOW_* values would be defined in sys_info.h.

Yes, in 0001 patch, they are defined in sys_info.h   

> > +
> > +/* Expecting string like "xxx_sys_info=tasks,mem,timer,lock" */
> > +static int write_handler(const struct ctl_table *ro_table, void *buffer,
> > +				size_t *lenp, loff_t *ppos)
> > +{
> > +	char names[sizeof(sys_info_avail)];
> > +	char *buf, *name;
> > +	struct ctl_table table;
> > +	unsigned long *si_flag;
> > +	int i, len, ret;
> > +
> > +	si_flag = ro_table->data;
> > +
> > +	/* Clear it first */
> > +	*si_flag = 0;
> > +
> > +	table = *ro_table;
> > +	table.data = names;
> > +	table.maxlen = sizeof(names);
> > +	ret = proc_dostring(&table, 1, buffer, lenp, ppos);
> > +	if (ret)
> > +		return ret;
> > +
> > +	buf = names;
> > +	while ((name = strsep(&buf, ",")) && *name) {
> > +		for (i = 0; i < ARRAY_SIZE(si_names); i++) {
> > +			if (!strcmp(name, si_names[i].name))
> > +				*si_flag |= si_names[i].bit;
> > +		}
> > +	}
> > +
> > +	return 0;
> > +}
> 
> The above function is defined but not used. The same code is
> copy&pasted in the if (write) section below.

I forgot to remove it in code clean :)

> I think that we would need a helper function which could be used
> in both sysctl_sys_info_handler() and in the __setup() callback.
> 
> Something like:
> 
> static unsigned long sys_info_parse_flags(char *str)
> {
> 	unsigned long si_bits = 0;
> 	char *s, *name;
> 	int i;
> 
> 	s = str;
> 	while ((name = strsep(&s, ",")) && *name) {
> 		for (i = 0; i < ARRAY_SIZE(si_names); i++) {
> 			if (!strcmp(name, si_names[i].name)) {
> 				*si_bits |= si_names[i].bit;
> 				break;

Good catch! thanks

> 			}
> 		}
> 	}
> 
> 	return si_bits;
> }

Will do.

> > +
> > +int sysctl_sys_info_handler(const struct ctl_table *ro_table, int write,
> > +					  void *buffer, size_t *lenp,
> > +					  loff_t *ppos)
> > +{
> > +	char names[sizeof(sys_info_avail) + 1];
> > +	char *buf, *name;
> > +	struct ctl_table table;
> > +	unsigned long *si_flag;
> 
> Nit: I would call this "si_bits_global" to make it more clear that
>      this is pointer to the global bitmask.
 
Makes sense.

> 
> > +	int i, ret, len;
> > +
> > +	si_flag = ro_table->data;
> > +
> > +	if (write) {
> > +		/* Clear it first */
> > +		*si_flag = 0;
> 
> There is no synchronization against readers. IMHO, it is not worth it.
> But we should at least update the global value only once.
> 
> We should define a local variable, e.g.
> 
> 		unsigned long si_bits;
> 
> and do the following:

Will do.

> > +		table = *ro_table;
> > +		table.data = names;
> > +		table.maxlen = sizeof(names);
> > +		ret = proc_dostring(&table, 1, buffer, lenp, ppos);
> 
> I would pass the "write" parameter here instead of the hard-coded "1".
> Do we know that it should be exactly '1'?
> 
> > +		if (ret)
> > +			return ret;
> 
> 		si_bits = sys_info_parse_param(flags);
> 		/*
> 		 * The access to the global value is not synchronized.
> 		 * Update it at once at least.
> 		 */
> 		WRITE_ONCE(*si_bits_global, si_bits);

Thanks for the suggestion.


> > +		/* Expecting string like "xxx_sys_info=tasks,mem,timer,lock" */
> > +		buf = names;
> > +		while ((name = strsep(&buf, ",")) && *name) {
> > +			for (i = 0; i < ARRAY_SIZE(si_names); i++) {
> > +				if (!strcmp(name, si_names[i].name))
> > +					*si_flag |= si_names[i].bit;
> > +			}
> > +		}
> > +
> > +		return 0;
> > +	} else {
> > +		bool first = true;
> > +
> > +		memset(names, 0, sizeof(names));
> 
> I guess that you took this from read_actions_logged().

Yes, I referred the seccomp.c in many places.

> It looks too paranoid to me. I do not see it anywhere else.
> IMHO, if the proc_dostring() does not stop at the trailing '\0'
> then most interfaces would leak data.
> 
> > +		buf = names;
> > +		for (i = 0; i < ARRAY_SIZE(si_names); i++) {
> > +			if (*si_flag & si_names[i].bit) {
> > +
> > +				if (first) {
> > +					first = false;
> > +				} else {
> > +					*buf = ',';
> > +					buf++;
> > +				}
> > +
> > +				len = strlen(si_names[i].name);
> > +				strncpy(buf, si_names[i].name, len);
> > +				buf += len;
> > +			}
> > +
> > +		}
> > +		*buf = '\0';
> 
> IMHO, always adding this trailing '\0' should be enough.

OK.

> 
> > +		table = *ro_table;
> > +		table.data = names;
> > +		table.maxlen = sizeof(names);
> > +		return proc_dostring(&table, 0, buffer, lenp, ppos);
> 
> I would pass the "write" parameter here instead of the hard coded 0.
> But it is a matter of taste.

I think it's obviously better :). will change.

> 
> > +	}
> > +}
> > +
> >  void sys_show_info(unsigned long info_flag)
> >  {
> >  	if (info_flag & SYS_SHOW_TASK_INFO)
> 
> Best Regards,
> Petr
> 
> PS: I am sorry for the late reply. Too many things have accumulated
> over the few last weeks.

No problem! I really appreciate your review and suggestions, like
your help on reviewing my early 'panic_print' patches years ago.

Thanks,
Feng

