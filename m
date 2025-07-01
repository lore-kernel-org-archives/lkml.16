Received: from relay.hostedemail.com (smtprelay0017.hostedemail.com [216.40.44.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF352749FE
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 14:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751381363; cv=none; b=CMKdBczdXUH7lXgYgsNskaaiDFrBxQSnfs9UaS6uJGqJo7R36JhGpm4UjNipw08O8/B7t3ozuJl8GBHeq1vwsmFH/zJCo+Ll79FQ0mKAbUQfldkhldA2IGh1MEPKNtYgunNdYekmLHxjsq3IoGyLRnWDp0tfyqlelJ02V9eSWMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751381363; c=relaxed/simple;
	bh=iKmT41Za4/hmW6xbmFqTp7RuYz3GE4VTYt2/Q6ebCK4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sLJu/IVlYu/w8gKbBAOMh6UynxHlfy7TM8UIkVqXA9OsnpnOeF8PNo2RsA5+htPdZUw3SjdzTnPbmpGcl5VS598Xk2383Sj/ZxAhVP7hapfGYVj4F/aX+JRh9ykitUM2zZIoyCDzvyaXuSGUnhNwy5I1ZISgKUvrKH4h2paRspA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf08.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay05.hostedemail.com (Postfix) with ESMTP id EAD0259358;
	Tue,  1 Jul 2025 14:49:15 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf08.hostedemail.com (Postfix) with ESMTPA id D23E620028;
	Tue,  1 Jul 2025 14:49:13 +0000 (UTC)
Date: Tue, 1 Jul 2025 10:49:14 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Peter Zijlstra <peterz@infradead.org>, Prakash Sangappa
 <prakash.sangappa@oracle.com>, linux-kernel@vger.kernel.org,
 mathieu.desnoyers@efficios.com, bigeasy@linutronix.de,
 kprateek.nayak@amd.com, vineethr@linux.ibm.com
Subject: Re: [PATCH V6 1/7] Sched: Scheduler time slice extension
Message-ID: <20250701104914.7bb80161@batman.local.home>
In-Reply-To: <87wm8skrzj.ffs@tglx>
References: <20250701003749.50525-1-prakash.sangappa@oracle.com>
	<20250701003749.50525-2-prakash.sangappa@oracle.com>
	<87cyakmhdv.ffs@tglx>
	<20250701105653.GO1613376@noisy.programming.kicks-ass.net>
	<87wm8skrzj.ffs@tglx>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: dgof3kcrq8fs4mz1umzmojdsk8fiprsd
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: D23E620028
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/4AsAtKxxYd5GZXmFqJTt96pXTaog0UME=
X-HE-Tag: 1751381353-679307
X-HE-Meta: U2FsdGVkX1/hr0I6Gpqu+kXPE+UUCMk9qas1ntVGlK6y74GaYarbBqCLBoisjTl7Vu60+kPZao2A5GJhELF3EHurz0hJzUBSWUwpFXxQSAS0RhwDXcqP3FMTxriNGU8zg4TNWuQWwa2UDaAm5vx97QZzrCbID5tB4hegXSMVWai5Y7C8ShyWcgArmOFWkdDg2B0FpOmDRFVbfmNGdsLogWS4yj+YVBKtjUcSg8o/UPb+qP+pgUY6JjqUwikj/ZkVvjIQCauPIkozg3/Vpzx47uv6yM1T+gFrOz7j2FFdNpU+xJ1FrU4qybS8e6ZGrKemzeyb9hFq5rDc94IFiTNWEMdQ/fZxHL9s

On Tue, 01 Jul 2025 14:36:32 +0200
Thomas Gleixner <tglx@linutronix.de> wrote:

> > That said; the reason I don't want this tied to LAZY is that RT itself
> > is not subject to LAZY and this then means that RT threads cannot make
> > use of this new facility, whereas I think it makes perfect sense for
> > them to use this.  
> 
> Fair enough, but can we pretty please have this explained and documented
> and not just burried in some gory implementation details, which nobody
> will understand in 3 months down the road.
> 
> Also if we go there and allow non-RT tasks to delay scheduling, then we
> need a control mechanism to enable/disable this mechanism on a per task
> or process basis. That way a RT system designer can prevent random
> user space tasks, which think they are the most important piece, from
> interfering with truly relevant RT tasks w/o going to chase down source
> code and hack it into submission.

BTW, I already showed[1] that any amount of delay this adds will build up
on top of the current worse case latency. So just saying "we only delay
5us which is in the noise" is incorrect when you have a system that has
a worse case latency of 30us. Because that 5us now makes it 35us.

Which is why I said this must be able to be disabled. I wouldn't want
this on any RT system, unless it can be configured as Thomas states
that it can be limited to specific tasks and is default off for
anything that the admin doesn't explicitly state it's for.

[1] https://lore.kernel.org/all/20250609165532.3265e142@gandalf.local.home/

-- Steve
