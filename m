Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD2A211A1E
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 15:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749570298; cv=none; b=tu1e16AEbhj7RAgOYpauQxLh9tndiSeglDTMGcC//dlmi+RFyepODQLNy9elP5HFoVaRBX7Pak+ocotxBUPEjtimc9fxmUd6droocCJQQgnM35i3aSNoyDfUW5/CyoEaVRgTJAEgEm8Kd16L3PlmkLfiYbG2TWdGt9L2wv55gXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749570298; c=relaxed/simple;
	bh=Rla2NC0IsssbJXQ1RoJxriUM3hKSAJIPGdydRwMIZDU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XHBXC+54FJkLMvRrdHoY+meyucIZ2f8OoE3dXBj9sFJebiNoMUZHynOlts6uDKlGXCZuSpx8jiyeqhUrWckq6LjmlukxRIlhStBPKlCgoUunKM2Q4CQADslfH32ZM7P2OMXMtdpbykk2oPRcR7xVW5DbNA6jLfzRSP0UD4ifi+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=VVfboFxQ; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="VVfboFxQ"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a5257748e1so3817116f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 08:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749570294; x=1750175094; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0koZFfyn6Ixo5NvYXN9S/EpcQahjS1g2mZVlD4cg4Gc=;
        b=VVfboFxQjBBOHpbweVoZ0hbEOf6Yiu0hViXK2teJK659LvJCDPHoOJ8/r+R6qy12Ge
         kzBK9he5YfMLeHJ1/XIEJX0xhhB8TZc7xm9eV7/5YCJrlhc/7MpaRCEoK8zqCQf4QfeJ
         /KWS/AqSoes1Sd8Iu/kZZfvszkUFg+VYSYrZer8rnyZFLD+dOp6bPTepHSS3Qe/YIHYQ
         1Ill3N3OeTMeI+zloTc1JR8KQTE7wOaaVYnoz/4PSzvqBcpq5OLuVSVOHQYDx9Et00/5
         ys2wik8gT0dHpH30svLzOmPqA0L6wfOUsnFSHcpqetsmxP0TeFnvViC/PFnsg8WiPl+w
         G6UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749570294; x=1750175094;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0koZFfyn6Ixo5NvYXN9S/EpcQahjS1g2mZVlD4cg4Gc=;
        b=PMcIkyXT9Cbu3eaWwtqB/osly8GjUjDFCYVHPwvuURxDSyPxb7VqrfplvfKr9ZtH0A
         7bxIf8hvad61KKBtcqZNKBhxDB2jj/i9NStEgpc4SqYgpBwOljsphfv80Ga8CG8/rEU6
         WWrR2Y2dc+R2JFTpswB/ZQ3gM+ZCvgWtUy48zD8aemaaqrqa3pirFzMTMYZO1ZKKNlPa
         3XDn79OsFbFHgXWqwR2pQhmLBPVy1+VxJSN4WiP9iU/fIckZ9YCEErXkSrLNCOiyRQf8
         qyhpNdojvf2B/9yGz7ZQBHZUbJ/9p1jFOlQy3YIUa7x3SCFbWSJ3klOaPYjlnHJjVXy7
         9wYA==
X-Forwarded-Encrypted: i=1; AJvYcCU8l228nShT/ASGwzE1jiGIFVrwyc2P4hN8B68wwrcOBlwo1snYpnhiZ9ioBeKbkQr5mI2yR6FoSju39pU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcS1NYzfxALyGFU7Srg6JCWjbiIjlUZ8ipPbzcD9zqA9UNfbA8
	R2VqVuiImcBX4uVykt3rO0f/LxfNKnDsReM85/lw3HPwHD4GPpSR2rOxY4TQe5cUmC8=
X-Gm-Gg: ASbGncsJZHtfeFDRQAchW+sKEHnDg/3sOBf9yn65BQ8ZjATi76OhWO9/qgbdmf2/+8l
	29HmZVx9ovDyoZC5ao/DhO7VVbqbnek2V1sUuWu+rVgeVnOD22rhqlCI0rWMvHlZCpIC8/lyCdo
	TUFn3ZUisVrDtQe5/gn5lmYC0I43mQbstdNZf1BCyX4cZ4dh6JfuY77usyUndxgiOoqeLSVcXv+
	wFayU0xsR8IcNndDzhOAKfYSaqQoj4hsqrm9tLAyFx7hs+386W6U5yIfOWmY0r8RbE/GIbGSxIi
	OjMX28fjukagYQwcv+5oq3toAmm3HzM8OXnPKYkmghtgv/lW7ACZqL3A9I3/VE2Bcr2p9viwAdg
	=
X-Google-Smtp-Source: AGHT+IGChqS2To/xeOuKKluQ09tK0u4F+d+8jaasqs0zAfsPs0Lwv4qvWe4Wzt+UQPH4m30vONJtSg==
X-Received: by 2002:a05:6000:144f:b0:3a4:febd:39f2 with SMTP id ffacd0b85a97d-3a5319a7a67mr13741605f8f.37.1749570293526;
        Tue, 10 Jun 2025 08:44:53 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b084f60sm7826020b3a.101.2025.06.10.08.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 08:44:52 -0700 (PDT)
Date: Tue, 10 Jun 2025 17:44:34 +0200
From: Petr Mladek <pmladek@suse.com>
To: Feng Tang <feng.tang@linux.alibaba.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Lance Yang <lance.yang@linux.dev>, linux-kernel@vger.kernel.org,
	mhiramat@kernel.org, llong@redhat.com,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH v1 1/3] kernel/panic: generalize panic_print's function
 to show sys info
Message-ID: <aEhS4iybzwYYMkJF@pathway.suse.cz>
References: <20250511085254.61446-1-feng.tang@linux.alibaba.com>
 <20250511085254.61446-2-feng.tang@linux.alibaba.com>
 <aCMXf0JOi1g6ZI8u@pathway.suse.cz>
 <aCNHzXkz4wfnIDPM@U-2FWC9VHC-2323.local>
 <aCXCpGkXJ1x9ncHS@pathway.suse.cz>
 <aCbPOry4r_ac0zUL@U-2FWC9VHC-2323.local>
 <aC1lKGWOuYXP7Bmt@U-2FWC9VHC-2323.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aC1lKGWOuYXP7Bmt@U-2FWC9VHC-2323.local>

On Wed 2025-05-21 13:31:20, Feng Tang wrote:
> On Fri, May 16, 2025 at 01:38:02PM +0800, Feng Tang wrote:
> > On Thu, May 15, 2025 at 12:32:04PM +0200, Petr Mladek wrote:
> [...]
> > > > > The console reply might be handled by a separate:
> > > > > 
> > > > > 	panic_console_reply=1
> > > > > 
> > > > > And it would obsolete the existing "panic_print" which is an
> > > > > ugly name and interface from my POV.
> > > > 
> > > > Agree it's ugly :). But besides a kernel parameter,  'panic_print' is
> > > > also a sysctl interface, I'm afraid renaming it might break user ABI.
> > > 
> > > A solution would be to keep it and create "panic_sys_info="
> > > with the human readable parameters in parallel. They would
> > > store the request in the same bitmap.
> > > 
> > > We could print a message that "panic_print" has been obsoleted
> > > by "panic_sys_info" when people use it.
> > > 
> > > Both parameters would override the current bitmap. So the later
> > > used parameter or procfs/sysfs write would win.
> > 
> > Reasonalbe.
> > 
> > > Note:
> > > 
> > > One question is whether to use sysctl or module parameters.
> > > 
> > > An advantage of sysctl is the "systcl" userspace tool. Some people
> > > might like it. But the API is very old and a bit cumbersome for
> > > implementing.
> > > 
> > > The sysfs, aka include/linux/moduleparam.h, API looks cleaner to me.
> > > But the parameters are hidden in the /sys/... jungle ;-)
> > > 
> > > I would slightly prefer "sysctl" because these parameters are easier
> > > to find.
> > 
> > I will think about the string parsing in sys_info.c, and in the backend,
> > a bitmap is still needed to save the parsing result, and as the parameter
> > for sys_show_info().
> 
> Hi Petr
> 
> I tried further this way, and with below patch on top of current 1/3
> patch, the 'panic_sys_info' sysctl interface basically works, as parsing
> user-input, and save it in 'panic_print' bitmap. 

It does not apply. It seems that it depends on another change which
crated lib/sys_info.c...

> It has  one problem that it doesn't support the string parsing as a the
> kernel command line parameter (auto-derived from sysctl interface), I'm
> not sure if we should add a __setup() or early_param() for it, or it's
> fine?

Ah, I was not aware of this. We need to make it working from the
command line, definitely. I would go with __setup() for now. We could
always switch it to early_param() when anyone requires it.

See some more comments, below.

> ---
> diff --git a/include/linux/sys_info.h b/include/linux/sys_info.h
> index 79bf4a942e5f..d6d55646e25a 100644
> --- a/include/linux/sys_info.h
> +++ b/include/linux/sys_info.h
> @@ -17,4 +17,8 @@
>  
>  extern void sys_show_info(unsigned long info_mask);
>  
> +struct ctl_table;
> +extern int sysctl_sys_info_handler(const struct ctl_table *ro_table, int write,
> +					  void *buffer, size_t *lenp,
> +					  loff_t *ppos);
>  #endif	/* _LINUX_SYS_INFO_H */
> diff --git a/kernel/panic.c b/kernel/panic.c
> index 3d9cf8063242..8ca9b30f0fe4 100644
> --- a/kernel/panic.c
> +++ b/kernel/panic.c
> @@ -88,6 +88,13 @@ static const struct ctl_table kern_panic_table[] = {
>  		.extra2         = SYSCTL_ONE,
>  	},
>  #endif
> +	{
> +		.procname	= "panic_sys_info",
> +		.data		= &panic_print,
> +		.maxlen         = sizeof(panic_print),
> +		.mode		= 0644,
> +		.proc_handler	= sysctl_sys_info_handler,
> +	},
>  	{
>  		.procname       = "warn_limit",
>  		.data           = &warn_limit,
> diff --git a/lib/sys_info.c b/lib/sys_info.c
> index 4090b2e0515e..27de6f0d0a4d 100644
> --- a/lib/sys_info.c
> +++ b/lib/sys_info.c
> @@ -4,6 +4,121 @@
>  #include <linux/console.h>
>  #include <linux/nmi.h>
>  
> +struct sys_info_name {
> +	unsigned long bit;
> +	const char *name;
> +};
> +
> +static const char sys_info_avail[] = " tasks mem timer lock ftrace all_bt blocked_tasks ";

It is a bit confusing to have it space-separated when the parameter
is comma-separated. Also I am not sure why there is the leading and
trailing space.

I would expect:

static const char sys_info_avail[] = "tasks,mem,timer,lock,ftrace,all_bt,blocked_tasks";

> +static const struct sys_info_name  si_names[] = {
> +	{ SYS_SHOW_TASK_INFO,	"tasks" },
> +	{ SYS_SHOW_MEM_INFO,	"mem" },
> +	{ SYS_SHOW_TIMER_INFO,	"timer" },
> +	{ SYS_SHOW_LOCK_INFO,	"lock" },
> +	{ SYS_SHOW_FTRACE_INFO, "ftrace" },
> +	{ SYS_SHOW_ALL_CPU_BT,	"all_bt" },
> +	{ SYS_SHOW_BLOCKED_TASKS, "blocked_tasks" },
> +};

I guess that this is just an RFC. Anyway, I would expect that
SYS_SHOW_* values would be defined in sys_info.h.

> +
> +/* Expecting string like "xxx_sys_info=tasks,mem,timer,lock" */
> +static int write_handler(const struct ctl_table *ro_table, void *buffer,
> +				size_t *lenp, loff_t *ppos)
> +{
> +	char names[sizeof(sys_info_avail)];
> +	char *buf, *name;
> +	struct ctl_table table;
> +	unsigned long *si_flag;
> +	int i, len, ret;
> +
> +	si_flag = ro_table->data;
> +
> +	/* Clear it first */
> +	*si_flag = 0;
> +
> +	table = *ro_table;
> +	table.data = names;
> +	table.maxlen = sizeof(names);
> +	ret = proc_dostring(&table, 1, buffer, lenp, ppos);
> +	if (ret)
> +		return ret;
> +
> +	buf = names;
> +	while ((name = strsep(&buf, ",")) && *name) {
> +		for (i = 0; i < ARRAY_SIZE(si_names); i++) {
> +			if (!strcmp(name, si_names[i].name))
> +				*si_flag |= si_names[i].bit;
> +		}
> +	}
> +
> +	return 0;
> +}

The above function is defined but not used. The same code is
copy&pasted in the if (write) section below.

I think that we would need a helper function which could be used
in both sysctl_sys_info_handler() and in the __setup() callback.

Something like:

static unsigned long sys_info_parse_flags(char *str)
{
	unsigned long si_bits = 0;
	char *s, *name;
	int i;

	s = str;
	while ((name = strsep(&s, ",")) && *name) {
		for (i = 0; i < ARRAY_SIZE(si_names); i++) {
			if (!strcmp(name, si_names[i].name)) {
				*si_bits |= si_names[i].bit;
				break;
			}
		}
	}

	return si_bits;
}

> +
> +int sysctl_sys_info_handler(const struct ctl_table *ro_table, int write,
> +					  void *buffer, size_t *lenp,
> +					  loff_t *ppos)
> +{
> +	char names[sizeof(sys_info_avail) + 1];
> +	char *buf, *name;
> +	struct ctl_table table;
> +	unsigned long *si_flag;

Nit: I would call this "si_bits_global" to make it more clear that
     this is pointer to the global bitmask.


> +	int i, ret, len;
> +
> +	si_flag = ro_table->data;
> +
> +	if (write) {
> +		/* Clear it first */
> +		*si_flag = 0;

There is no synchronization against readers. IMHO, it is not worth it.
But we should at least update the global value only once.

We should define a local variable, e.g.

		unsigned long si_bits;

and do the following:

> +		table = *ro_table;
> +		table.data = names;
> +		table.maxlen = sizeof(names);
> +		ret = proc_dostring(&table, 1, buffer, lenp, ppos);

I would pass the "write" parameter here instead of the hard-coded "1".
Do we know that it should be exactly '1'?

> +		if (ret)
> +			return ret;

		si_bits = sys_info_parse_param(flags);
		/*
		 * The access to the global value is not synchronized.
		 * Update it at once at least.
		 */
		WRITE_ONCE(*si_bits_global, si_bits);

> +		/* Expecting string like "xxx_sys_info=tasks,mem,timer,lock" */
> +		buf = names;
> +		while ((name = strsep(&buf, ",")) && *name) {
> +			for (i = 0; i < ARRAY_SIZE(si_names); i++) {
> +				if (!strcmp(name, si_names[i].name))
> +					*si_flag |= si_names[i].bit;
> +			}
> +		}
> +
> +		return 0;
> +	} else {
> +		bool first = true;
> +
> +		memset(names, 0, sizeof(names));

I guess that you took this from read_actions_logged().

It looks too paranoid to me. I do not see it anywhere else.
IMHO, if the proc_dostring() does not stop at the trailing '\0'
then most interfaces would leak data.

> +		buf = names;
> +		for (i = 0; i < ARRAY_SIZE(si_names); i++) {
> +			if (*si_flag & si_names[i].bit) {
> +
> +				if (first) {
> +					first = false;
> +				} else {
> +					*buf = ',';
> +					buf++;
> +				}
> +
> +				len = strlen(si_names[i].name);
> +				strncpy(buf, si_names[i].name, len);
> +				buf += len;
> +			}
> +
> +		}
> +		*buf = '\0';

IMHO, always adding this trailing '\0' should be enough.

> +		table = *ro_table;
> +		table.data = names;
> +		table.maxlen = sizeof(names);
> +		return proc_dostring(&table, 0, buffer, lenp, ppos);

I would pass the "write" parameter here instead of the hard coded 0.
But it is a matter of taste.

> +	}
> +}
> +
>  void sys_show_info(unsigned long info_flag)
>  {
>  	if (info_flag & SYS_SHOW_TASK_INFO)

Best Regards,
Petr

PS: I am sorry for the late reply. Too many things have accumulated
over the few last weeks.
