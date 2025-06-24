Received: from out30-100.freemail.mail.aliyun.com (out30-100.freemail.mail.aliyun.com [115.124.30.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FC31F5823
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 01:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750730300; cv=none; b=CUUfurr5jQ/YvJ8rH2NOYCeTh39dxeVlMMYHZzIfeHgOq4DCUeYMpWP1wuJ2bOu9cWVu/ObTRdnD7rOc+zigIpojl+vBTDsDPLNW9PsMRfWB5Uab5hizpB3IjUGrwxRZ0sw9Qef4UXna8mVpzxNyPkbf32B66nNY1uPbo45i7ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750730300; c=relaxed/simple;
	bh=ad1CRdxhimTQoc4mVUECK73MorHW2QAepV0h1yZjQvY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HEGy5x4jrPLLVyQhgorSyk3KnZUoXyDEuAjHcY1Eav6zvdHQlNe1rI0apI/w0q4T7qiWBkBq8Qse+fvF3SYN9VpmPO9QlM713AOsOV8JPW81wa+fLx5bmXtF2KVPMQNwDirx6KpMtlEew+gKAwMgopyNfyqjFrhKTJyEePM0m88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=PtW5XDfi; arc=none smtp.client-ip=115.124.30.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="PtW5XDfi"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1750730290; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=Z79fTHSkmTmx2HsAIYRcS2dqelrSRbFVyUYyBEoggcw=;
	b=PtW5XDfiDo4qTga/atf65PSPlHHvcIxETp3jlua3eghT7tFpbmgHp2Xzohc1NV34br+XrDF/doNZwv4RUkxms3FrvH++yD4JTAvugP+Li/SbQJZq63aUyacbXBrlF8vFRl2RjJg9vzNzjGbKlF9Hbi/QW97/EGNhIPczFBRAn7s=
Received: from localhost(mailfrom:feng.tang@linux.alibaba.com fp:SMTPD_---0WeeA0u9_1750730289 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 24 Jun 2025 09:58:09 +0800
Date: Tue, 24 Jun 2025 09:58:08 +0800
From: Feng Tang <feng.tang@linux.alibaba.com>
To: Petr Mladek <pmladek@suse.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Lance Yang <lance.yang@linux.dev>, Jonathan Corbet <corbet@lwn.net>,
	linux-kernel@vger.kernel.org, paulmck@kernel.org,
	john.ogness@linutronix.de
Subject: Re: [PATCH V2 5/5] panic: add note that panic_print interface is
 deprecated
Message-ID: <aFoGMI_1I_cZ9O8g@U-2FWC9VHC-2323.local>
References: <20250616010840.38258-1-feng.tang@linux.alibaba.com>
 <20250616010840.38258-6-feng.tang@linux.alibaba.com>
 <aFlxLK8f276_5TZf@pathway.suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aFlxLK8f276_5TZf@pathway.suse.cz>

On Mon, Jun 23, 2025 at 05:22:20PM +0200, Petr Mladek wrote:
> On Mon 2025-06-16 09:08:40, Feng Tang wrote:
> > Long term wise, the 'panic_sys_info' should be the only controlling
> > interface, which can be referred by other modules.
> 
> Strictly speaking, 'panic_sys_info' is not a complete
> replacement for 'panic_print' because it does not allow
> replaying the log buffer during panic.

Indeed, I forgot this part.

> I suggest to add a separate parameter "panic_console_replay"
> for the missing functionality first. And 'panic_print' will
> be obsoleted by both 'panic_sys_info' and 'panic_console_replay'.
 
Will do.

> > --- a/kernel/panic.c
> > +++ b/kernel/panic.c
> > @@ -76,6 +76,13 @@ ATOMIC_NOTIFIER_HEAD(panic_notifier_list);
> >  EXPORT_SYMBOL(panic_notifier_list);
> >  
> >  #ifdef CONFIG_SYSCTL
> > +static int sysctl_panic_print_handler(const struct ctl_table *table, int write,
> > +			   void *buffer, size_t *lenp, loff_t *ppos)
> > +{
> > +	printk_once("panic: 'panic_print' sysctl interface will be obsoleted by 'panic_sys_info' interface.\n");
> > +	return proc_doulongvec_minmax(table, write, buffer, lenp, ppos);
> > +}
> > +
> >  static const struct ctl_table kern_panic_table[] = {
> >  #ifdef CONFIG_SMP
> >  	{
> > @@ -107,7 +114,7 @@ static const struct ctl_table kern_panic_table[] = {
> >  		.data		= &panic_print,
> >  		.maxlen		= sizeof(unsigned long),
> >  		.mode		= 0644,
> > -		.proc_handler	= proc_doulongvec_minmax,
> > +		.proc_handler	= sysctl_panic_print_handler,
> 
> This handles only the sysctl interface. We should do something similar
> also for the "panic_print" command line parameter. It would require
> using core_param_cb() instead of core_param().

OK, thanks!

- Feng

> >  	},
> >  	{
> >  		.procname	= "panic_on_warn",
> 
> Best Regards,
> Petr
