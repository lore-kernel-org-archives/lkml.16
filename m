Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064741EE033
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 12:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751373396; cv=none; b=ae/lmA6oBEQrgVFiK+2fOF4XdToWruryQ5n9gI2VJbtdMlLgtg6P19xALVgYgcGqsIfeUZhx9o7szWyQQocleSkVBMky+gwbQvteATW+3Li6DIAbuNrWAEdvMQ87B+WsQcqgF9pXFayr1+d5qc7uU6L3Rxf/BCmjLK+TbjNyBcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751373396; c=relaxed/simple;
	bh=W12Yhw3sXZTmOZLA38ysKFIxHhOVeKiuKkrnsCOS+DA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Y5GganxQP0vNTeq4CheasYjvRIYo7q5mvI04DPzKod6wR+SpuCWh+Hy1SE/GSAj9s+5I6O1ZIG2Ur72sdauC3qVbOHY72mLgOh0TZZr3qHNetruLMGnHu6FdZLP1tJdEXmkjbWLR5lj7C8yKqIzPOMKzDvBk2a4Uc5ta0m0iy2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=OwvFQB3y; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=IfAqSNMg; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="OwvFQB3y";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="IfAqSNMg"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751373393;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+sY1f4B7fjRrQ3WdipT/fABy7JQ/JQgaHUZOvZ133tE=;
	b=OwvFQB3y4hEr55/+UxtkzoouFL220qYsnEZ2FQxORteLKZVgUJdHoas/F0naaf6cDZIGoE
	jWkeczOlGfhn0rdDrPqg++sQVMzbJNyJ+QsVhVwmIr7ZrTNIsGG6quH+7u4Cio02HnBEFe
	k8nAoNI/3zV2iPO+u/DCn2cSws/VLg25B00kbCtGboOmroiB00fNSyOdIEfSbVEuN4gRS0
	YAduzxH0n+StdRKNb0PmlgRd+M6xlNeeWt4oJgfYgzz/jAltbrPivLuIHvUB4CfEhSFccY
	xpOWKpcLXMMLHgJOOsRZeeLeU7d0XYDJKtaviTFI4sOU7dZCM8Rzqa06uzmpfw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751373393;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+sY1f4B7fjRrQ3WdipT/fABy7JQ/JQgaHUZOvZ133tE=;
	b=IfAqSNMgYqNT0ctIjEZc+EBIWc4e+NZjLs1F4CulTk7FUktUj81C3NaiwtMBkgCbSjgh3L
	WqMmuGeDc9JdzeCg==
To: Peter Zijlstra <peterz@infradead.org>
Cc: Prakash Sangappa <prakash.sangappa@oracle.com>,
 linux-kernel@vger.kernel.org, rostedt@goodmis.org,
 mathieu.desnoyers@efficios.com, bigeasy@linutronix.de,
 kprateek.nayak@amd.com, vineethr@linux.ibm.com
Subject: Re: [PATCH V6 1/7] Sched: Scheduler time slice extension
In-Reply-To: <20250701105653.GO1613376@noisy.programming.kicks-ass.net>
References: <20250701003749.50525-1-prakash.sangappa@oracle.com>
 <20250701003749.50525-2-prakash.sangappa@oracle.com> <87cyakmhdv.ffs@tglx>
 <20250701105653.GO1613376@noisy.programming.kicks-ass.net>
Date: Tue, 01 Jul 2025 14:36:32 +0200
Message-ID: <87wm8skrzj.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Jul 01 2025 at 12:56, Peter Zijlstra wrote:
> On Tue, Jul 01, 2025 at 10:42:36AM +0200, Thomas Gleixner wrote:
>
>> What's worse is that it breaks the LAZY semantics. I explained this to
>> you before and this thing needs to be tied on the LAZY bit otherwise a
>> SCHED_OTHER task can prevent a real-time task from running, which is
>> fundamentally wrong.
>
> So here we disagree, I don't want this tied to LAZY.
>
> SCHED_OTHER can already inhibit a RT task from getting ran by doing a
> syscall, this syscall will have non-preemptible sections and the RT task
> will get delayed.
>
> I very much want this thing to be limited to a time frame where a
> userspace critical section (this thing) is smaller than such a kernel
> critical section.
>
> That is, there should be no observable difference between the effects of
> this new thing and a syscall doing preempt_disable().
>
> That said; the reason I don't want this tied to LAZY is that RT itself
> is not subject to LAZY and this then means that RT threads cannot make
> use of this new facility, whereas I think it makes perfect sense for
> them to use this.

Fair enough, but can we pretty please have this explained and documented
and not just burried in some gory implementation details, which nobody
will understand in 3 months down the road.

Also if we go there and allow non-RT tasks to delay scheduling, then we
need a control mechanism to enable/disable this mechanism on a per task
or process basis. That way a RT system designer can prevent random
user space tasks, which think they are the most important piece, from
interfering with truly relevant RT tasks w/o going to chase down source
code and hack it into submission.

Thanks,

        tglx
