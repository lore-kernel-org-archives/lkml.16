Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7D1146D6A
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 01:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750730163; cv=none; b=NxisD1d9+2/Cdqy7uFEzKUKifkAtc9ySQP4ixdhKtATNFLFbE/wVZcHAP8RXBMcLPFIqxp5ZMx4UQ31E0LHq3cvmHhVcCdUjQN7Wbe+VAR0Ctg+hvtf9z6FoHbPlkgnTgPxIivIwZojSOJixnBEIneOwwRZRfzIFNR36OSHnxWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750730163; c=relaxed/simple;
	bh=5p61nrFwG6OcxRXcfdbvTuN9D8eXZhEFDOpqTbztMdM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a6oa/llyokvUzB7iIpuZIa01LjtScVsmH6jRdmZ/7be/D12dLnJBWTRGkYytyzu6SQWGpLpkDCrp/+51nDitibfAAWxIHrzTlq88j8+fKsiQIiVpIikUDiZ18epQvw6mNPoCY+8CxpBK1b2tpila4Wd1ceyM5Fc9i/ihc0POXH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=R8bwwTuZ; arc=none smtp.client-ip=115.124.30.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="R8bwwTuZ"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1750730157; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=5FF2Rr9o7Nq8LA+Z0toU4V+eb1i3Wxay65maXg4Jcgo=;
	b=R8bwwTuZa2k8mcrEocwEz7NIFeU4Ht5CxMr6Fvdr+LI+MJyndc2fpZmU++DE4INh//QoB/lyhMEvGMHUSezAfeo04ucYB8N9R/4Ck9RLqdC876+B1GqXkFSwBa4EaEk3y/+S7eAsPjgYT2ETQUWkWivWputoS0RDJONbYzblB4o=
Received: from localhost(mailfrom:feng.tang@linux.alibaba.com fp:SMTPD_---0WeeA.zH_1750730156 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 24 Jun 2025 09:55:56 +0800
Date: Tue, 24 Jun 2025 09:55:55 +0800
From: Feng Tang <feng.tang@linux.alibaba.com>
To: Petr Mladek <pmladek@suse.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Lance Yang <lance.yang@linux.dev>, Jonathan Corbet <corbet@lwn.net>,
	linux-kernel@vger.kernel.org, paulmck@kernel.org,
	john.ogness@linutronix.de
Subject: Re: [PATCH V2 4/5] panic: add 'panic_sys_info=' setup option for
 sysctl and kernel cmdline
Message-ID: <aFoFq7CJKGxZ-N-9@U-2FWC9VHC-2323.local>
References: <20250616010840.38258-1-feng.tang@linux.alibaba.com>
 <20250616010840.38258-5-feng.tang@linux.alibaba.com>
 <aFltDlSKKCv3Cito@pathway.suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aFltDlSKKCv3Cito@pathway.suse.cz>

On Mon, Jun 23, 2025 at 05:04:46PM +0200, Petr Mladek wrote:
> On Mon 2025-06-16 09:08:39, Feng Tang wrote:
> > Add 'panic_sys_info=' setup which expects string like "tasks,mem,lock,...".
> 
> This patch actually adds also the sysctl interface. It should be
> mentioned in the "Subject" and here.
 
I mentioned 'sysctl' in the subjec line, but maybe it's not obvious :)

> That said, it might be better to add the sysctl interface in
> the previous patch and add just the setup() here.

OK.

> 
> > --- a/Documentation/admin-guide/kernel-parameters.txt
> > +++ b/Documentation/admin-guide/kernel-parameters.txt
> > @@ -4541,6 +4541,19 @@
> >  			Use this option carefully, maybe worth to setup a
> >  			bigger log buffer with "log_buf_len" along with this.
> >  
> > +	panic_sys_info=
> 
> 
> > +			String of subsystem info to be dumped on panic.
> 
> I am not a native speaker but I have troubles to parse the above
> sentence. See below.
> > +			It expects string of comma-separated words like
> > +			"tasks,mem,timer,...", which is a human readable string
> > +			version of 'panic_print':
> > +			tasks: print all tasks info
> > +			mem: print system memory info
> > +			timer: print timer info
> > +			lock: print locks info if CONFIG_LOCKDEP is on
> > +			ftrace: print ftrace buffer
> > +			all_bt: print all CPUs backtrace (if available in the arch)
> > +			blocked_tasks: print only tasks in uninterruptible (blocked) state
> 
> This blob is hard to parse. I suggest to replace it with something
> like:
> 
> <proposal>
> 	panic_sys_info= A comma separated list of extra information to be dumped
> 			on panic.
> 			Format: val[,val...]
> 			Where @val can be any of the following:
> 
> 			tasks:		print all tasks info
> 			mem:		print system memory info
> 			timers:		print timers info
> 			locks:		print locks info if CONFIG_LOCKDEP is on
> 			ftrace:		print ftrace buffer
> 			all_bt:		print all CPUs backtrace (if available in the arch)
> 			blocked_tasks:	print only tasks in uninterruptible (blocked) state
> 
> 			This is a human readable alternative to the 'panic_print' option.
> </proposal>

Thanks! It's much better.

> > +
> >  	parkbd.port=	[HW] Parallel port number the keyboard adapter is
> >  			connected to, default is 0.
> >  			Format: <parport#>
> > diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
> > index dd49a89a62d3..2013afd98605 100644
> > --- a/Documentation/admin-guide/sysctl/kernel.rst
> > +++ b/Documentation/admin-guide/sysctl/kernel.rst
> > @@ -899,6 +899,24 @@ So for example to print tasks and memory info on panic, user can::
> >    echo 3 > /proc/sys/kernel/panic_print
> >  
> >  
> > +panic_sys_info
> > +==============
> > +
> > +String of subsystem info to be dumped on panic. It expects string of
> 
> Same here.
> 
> > +comma-separated words like "tasks,mem,timer,...", which is a human
> > +readable string version of 'panic_print':
> 
> I would replace it with:
> 
> <proposal>
> A comma separated list of extra information to be dumped on panic,
> for example, "tasks,mem,timers,...".  It is a human readable alternative
> to 'panic_print'. Possible values are:
> </proposal>

Will change.

> > +
> > +=============   ===================================================
> > +tasks           print all tasks info
> > +mem             print system memory info
> > +timer           print timer info
> > +lock            print locks info if CONFIG_LOCKDEP is on
> > +ftrace          print ftrace buffer
> > +all_bt          print all CPUs backtrace (if available in the arch)
> > +blocked_tasks   print only tasks in uninterruptible (blocked) state
> > +=============   ===================================================
> > +
> > +
> >  panic_on_rcu_stall
> >  ==================
> 
> The rest looks good.
 
Thanks!

- Feng

> Best Regards,
> Petr
