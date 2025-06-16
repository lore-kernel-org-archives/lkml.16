Received: from out30-113.freemail.mail.aliyun.com (out30-113.freemail.mail.aliyun.com [115.124.30.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37CD9156677
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 02:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750041584; cv=none; b=l5OHMhx0D5wi9q3G5GhNr64eKgrhfNy+RMp09UpVcSSCZvqNg/AOtdPTyDliBJQGr1OFjY6ufKtIaN/cDt9MhmTktuNjvQtvSqmb4cqhTAfQNH4xk2KHrNe3oA/TxM2PTDFMmPIXj4BUJzbp88z/ufHTPep/j8rgFeDZj8GtdqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750041584; c=relaxed/simple;
	bh=hSKx08S0S+nckacnBLQaVOyRpGio1mAej+9Ln3Ki6pQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UNiIxV1sSC1N0dnbDFgxNE+Oe83fuV4/x9/GX10uOJBpJ+ZL8jV/+5e+gA9jvyxFVwQc4vHCrGY1G/yKatPaEQNZa2euaZ2S85ug20sRobdSNUpi9yG4mPE7V4Ig7s83kBTVA9KaS4NSAe2Mu3fF6KeeSL6eTEl7ZR3dmk/7Lfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=K245NlyT; arc=none smtp.client-ip=115.124.30.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="K245NlyT"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1750041573; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=mhPm85D5nT62y6AUDl8lNb8ie/j7xAbiY3KcN+bgsm4=;
	b=K245NlyTSceQLbPy+0/IzQOxYPWQ0CM+uTndw1EIHjRwqonEctE+LIJlg90D0In4SSdd9PZ1DC5QgDAsNXt/M1gDPKwYGEOPe8tm2EAupBmc0yn/V+eptOvvsNKLZ4SMvent+n1eIyVjPKr7nGowVKUob/D6ecat9OYtFU5f6Nw=
Received: from localhost(mailfrom:feng.tang@linux.alibaba.com fp:SMTPD_---0WdrPowL_1750041572 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 16 Jun 2025 10:39:32 +0800
Date: Mon, 16 Jun 2025 10:39:32 +0800
From: Feng Tang <feng.tang@linux.alibaba.com>
To: Lance Yang <lance.yang@linux.dev>
Cc: paulmck@kernel.org, john.ogness@linutronix.de,
	Petr Mladek <pmladek@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH V2 5/5] panic: add note that panic_print interface is
 deprecated
Message-ID: <aE-D5B_PQ8z27NTV@U-2FWC9VHC-2323.local>
References: <20250616010840.38258-1-feng.tang@linux.alibaba.com>
 <20250616010840.38258-6-feng.tang@linux.alibaba.com>
 <0088c3f5-d2a0-48c4-b69a-fb385c527b32@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0088c3f5-d2a0-48c4-b69a-fb385c527b32@linux.dev>

On Mon, Jun 16, 2025 at 09:45:16AM +0800, Lance Yang wrote:
> 
> 
> On 2025/6/16 09:08, Feng Tang wrote:
> > Long term wise, the 'panic_sys_info' should be the only controlling
> > interface, which can be referred by other modules.
> > 
> > Suggested-by: Petr Mladek <pmladek@suse.com>
> > Signed-off-by: Feng Tang <feng.tang@linux.alibaba.com>
> > ---
> >   kernel/panic.c | 9 ++++++++-
> >   1 file changed, 8 insertions(+), 1 deletion(-)
> > 
> > diff --git a/kernel/panic.c b/kernel/panic.c
> > index ea238f7d4b54..e8a05fc6b733 100644
> > --- a/kernel/panic.c
> > +++ b/kernel/panic.c
> > @@ -76,6 +76,13 @@ ATOMIC_NOTIFIER_HEAD(panic_notifier_list);
> >   EXPORT_SYMBOL(panic_notifier_list);
> >   #ifdef CONFIG_SYSCTL
> > +static int sysctl_panic_print_handler(const struct ctl_table *table, int write,
> > +			   void *buffer, size_t *lenp, loff_t *ppos)
> > +{
> > +	printk_once("panic: 'panic_print' sysctl interface will be obsoleted by 'panic_sys_info' interface.\n");
> 
> Hmm... I would get scared for a second when I read messages prefixed with
> "panic:"
> from dmesg. That prefix should have a very specific meaning ;)
> 
> Well, we can just change the prefix to something more neutral:
> 
> printk_once("Kernel: 'panic_print' sysctl interface will be obsoleted by
> 'panic_sys_info' interface.\n");
 
Yes. I tried to give the module name, but forgot the name is too scary
for normal users :)

Thanks,
Feng

> Thanks,
> Lance
