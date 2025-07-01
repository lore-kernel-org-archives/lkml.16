Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10AE725A33A
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 10:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751367423; cv=none; b=oFF7DwRx4DKIf06gEpvaXzcf+C3Xj9GYl6jxYMb9uOQCqbWaa97XD2FD8TxAV4TQ2JV1Y99Rs5UjgVrhq1dh3qFt5plRdz0Epyw0fOdPC0r6GAWrfiuaXyKJBPkX+Nyd4W5FjB7pSxiWe6kayu81GEPX5OvUH0JqlYakBaPmjaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751367423; c=relaxed/simple;
	bh=oggiuRkpsfgjptBqTHTgT0syKqEumoLD0QCF4biYLCo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kPEqXadNXceMFU04B72bVPnLMJCHfYEMPeDRqBg9GhIyqfIlFdamDSMJFr5aA80mbUsMIu6fH6c8u0+RY7s9WHoRP1am2Y3f8gzcG+tk/fuvgriNSuJZT8+AVo2qiVkrSPn2qY3ZxoUQ2qckeBeADjQfK4KfdMUt+NE+8+bR28Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=jdrkgKK7; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="jdrkgKK7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=oggiuRkpsfgjptBqTHTgT0syKqEumoLD0QCF4biYLCo=; b=jdrkgKK77zQJcqDsyCPNzigcRV
	gE1a2ycBy1eSSAOJ2xg01b9DSOaJZu2OcvFTkBzMcim7YX+4Z70MCIzzA607Bsj80ynZRYcUQsiIs
	1yMtxG+vtspvnHUQtwPrnIGbBpMY0pOtdksDHr3IDxpT2ZW4MX/Oc5HHg7MPr25Y/km3cDAlRUXKF
	jAU85joCn7RZvasJbECBbs+rccwr00vMOxnIYURomgh1JX3Bc7gO0e605n3B2aQT4NiLTLABmFcal
	yntIuJyGVhF6Esr0wgDRbxHhmysmvvhVP7oxH+xNYc/eQc+DeUUHnYdtgDveko0arZj+2aVj7uZ7m
	4BeDGu3A==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWYfW-000000074LM-3Yuo;
	Tue, 01 Jul 2025 10:56:55 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 7DB36300130; Tue, 01 Jul 2025 12:56:53 +0200 (CEST)
Date: Tue, 1 Jul 2025 12:56:53 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Prakash Sangappa <prakash.sangappa@oracle.com>,
	linux-kernel@vger.kernel.org, rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com, bigeasy@linutronix.de,
	kprateek.nayak@amd.com, vineethr@linux.ibm.com
Subject: Re: [PATCH V6 1/7] Sched: Scheduler time slice extension
Message-ID: <20250701105653.GO1613376@noisy.programming.kicks-ass.net>
References: <20250701003749.50525-1-prakash.sangappa@oracle.com>
 <20250701003749.50525-2-prakash.sangappa@oracle.com>
 <87cyakmhdv.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87cyakmhdv.ffs@tglx>

On Tue, Jul 01, 2025 at 10:42:36AM +0200, Thomas Gleixner wrote:

> What's worse is that it breaks the LAZY semantics. I explained this to
> you before and this thing needs to be tied on the LAZY bit otherwise a
> SCHED_OTHER task can prevent a real-time task from running, which is
> fundamentally wrong.

So here we disagree, I don't want this tied to LAZY.

SCHED_OTHER can already inhibit a RT task from getting ran by doing a
syscall, this syscall will have non-preemptible sections and the RT task
will get delayed.

I very much want this thing to be limited to a time frame where a
userspace critical section (this thing) is smaller than such a kernel
critical section.

That is, there should be no observable difference between the effects of
this new thing and a syscall doing preempt_disable().


That said; the reason I don't want this tied to LAZY is that RT itself
is not subject to LAZY and this then means that RT threads cannot make
use of this new facility, whereas I think it makes perfect sense for
them to use this.


