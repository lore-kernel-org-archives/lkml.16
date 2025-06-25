Received: from out30-130.freemail.mail.aliyun.com (out30-130.freemail.mail.aliyun.com [115.124.30.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD0029AAF4
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 09:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750843846; cv=none; b=jWSEoURJbdciUVHOvNUdyYHDpQIjqGC9FSR/wySD53k6IMXOI22Zi68jHb7E7NjHEM7CsSc6UFNtyNLLWSpAkDzjaLoYJJxo/HrkTjGr9Pjp59onMBCmzN3F9gOPPrRRhOYcWBlOfBsyMEchaqlc6wXlhMe9xyPRcda7isaY4T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750843846; c=relaxed/simple;
	bh=97XtgOXkBAhr8seA2unCpRws1z7CS2IaTguf6pd2+Z0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tp2TmM5v4Io7O624RDBHMwShXzAOv0lfwcwlj38GW6ECvR/lvnV6wadSulkN6gIdb+m/Yuyylus28xyVv/1VQV5MtaDHC9vTOMkhptdD5ghlcoSeX2uGTSGc+QAQzOh43DTvJBjVP3nl1CoAyD3BDhPlIZw7+GVDa57dRB9+sRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=ItllhR13; arc=none smtp.client-ip=115.124.30.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="ItllhR13"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1750843834; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=DYyB7aqSLQFUCL7HXH1e6PAvwWpQtS+gAl+rAFwFw3Y=;
	b=ItllhR13DsM71qoVf7q+1ArPoCDfkggPKQa/m2WgfqeIxZ2jpJLga7xDQi3lv98INW2uC1t04iC2ZnQSLGtbt67/jls2L2q0xRe7Gb5oHpgz78R/+HrqYzygF4fl4XVSBqxu8RMW+7bjT6Yc6Sh56nh9+2ZVKtW5wbJXiijKeHA=
Received: from localhost(mailfrom:feng.tang@linux.alibaba.com fp:SMTPD_---0WewP0yT_1750843833 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 25 Jun 2025 17:30:33 +0800
Date: Wed, 25 Jun 2025 17:30:32 +0800
From: Feng Tang <feng.tang@linux.alibaba.com>
To: Petr Mladek <pmladek@suse.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Lance Yang <lance.yang@linux.dev>, Jonathan Corbet <corbet@lwn.net>,
	linux-kernel@vger.kernel.org, paulmck@kernel.org,
	john.ogness@linutronix.de
Subject: Re: [PATCH V2 5/5] panic: add note that panic_print interface is
 deprecated
Message-ID: <aFvBuOnD0cAEWJfl@U-2FWC9VHC-2323.local>
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
> 
> I suggest to add a separate parameter "panic_console_replay"
> for the missing functionality first. And 'panic_print' will
> be obsoleted by both 'panic_sys_info' and 'panic_console_replay'.
> 
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

When testing the change, I found  a problem:  'core_param_cb' is not
the real counterpart of 'core_param', that it is a module parameter
instead of kernel/core parameter, and adds the module.prefix to the
parameter, say, the effective cmdline parameter is changed to
'panic.panic_print=' instead of 'panic_print='.

While below patch of 'kernel_param_cb' works fine, but I'm not sure if
it is worth the change:

---
diff --git a/include/linux/moduleparam.h b/include/linux/moduleparam.h
index bfb85fd13e1f..71053d078cea 100644
--- a/include/linux/moduleparam.h
+++ b/include/linux/moduleparam.h
@@ -194,6 +194,9 @@ struct kparam_array
 #define core_param_cb(name, ops, arg, perm)		\
 	__level_param_cb(name, ops, arg, perm, 1)
 
+#define kernel_param_cb(name, ops, arg, perm) \
+	__module_param_call("", name, ops, arg, perm, -1, 0)
+
 /**
  * postcore_param_cb - general callback for a module/cmdline parameter
  *                     to be evaluated before postcore initcall level


Or should we change the 'core_param_cb' to what 'kernel_param_cb' is
doing.

Thanks,
Feng





