Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA421DED58
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 11:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738926058; cv=none; b=VKZorzzwdhunlMigDxMJ8L5MQItqSBRCWJV8BhBRBCNEM4kg7HAamknF21wSGWmcrHYWFfS92WmeuxxwTHFqADDKscvmdHL3mNabUyQ4zbye3jJDM3Xj8vuAjExTGkT269ijT5J7aq8o0ntuosDnpfIwd34n5llv1m3BxANCvko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738926058; c=relaxed/simple;
	bh=ND6hyoxlDXntD4lr9CxXkDZB0S8XhihlSQSUomBwZ8o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YjpFtv9H+fCf1Nz/42pWJoy8r48wg7ION8F1nsW7eMg4ybicBUObe6OnxpGoJiSWn2XinF/qhN1TaZk3pG4/147OQgUZSEvamwiXKL4b+mOabl0pikt2AduIcEW2QiARvWu6tFsDqalYGAVLcCiVQd2o5yGV62os9QNgyp0oLZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=f2LYInOT; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=RaqhgcBu; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="f2LYInOT";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="RaqhgcBu"
Date: Fri, 7 Feb 2025 12:00:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738926052;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vfsUlhtHiJhl83lKMUrwmrR3sEtm/wa5PfIaal738eA=;
	b=f2LYInOTB6R3wqsY6FyVjt0McjVzSZ+yWUffvyYWQtNNeW7rX0KCBm4i7oLJvJ6UAm4adM
	musuInJiae5FkiIxmd+YLvkhl8enAqFvKuFaZLpJ5hdz7MltuVcnoWyZmAFX2GuZCt6GeQ
	csD0sEDPr+CKCyyNk2VjyTG2dMxljpdX7/ZTLbdLc4wYkdGsKiHeHsp5J1J/NPoaZslrKc
	8GQWnbU8YZJS2bnD/nXs6kt/ojqwygUJedz999IT+RF0MmPsFrb1fZbtX1xAJVPmph53Vn
	VMp1P14b12hIa91BoHwlDRs6QaDkp/api74D8F565LlF58XAXp+hmVchNhTDpA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738926052;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vfsUlhtHiJhl83lKMUrwmrR3sEtm/wa5PfIaal738eA=;
	b=RaqhgcBuIMKrPI9h/hTz3YEKeTwItGQ4SobbA0GHw/p4N2hR4HngXRKO7ALXpJcBtWT4fz
	BLkCOlg2x6ll9QBw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Juri Lelli <juri.lelli@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	=?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>, Ingo Molnar <mingo@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v8 03/15] futex: Add basic infrastructure for local task
 local hash.
Message-ID: <20250207110050.stt_l7KT@linutronix.de>
References: <20250203135935.440018-1-bigeasy@linutronix.de>
 <20250203135935.440018-4-bigeasy@linutronix.de>
 <20250203142743.GI7145@noisy.programming.kicks-ass.net>
 <20250203155114.YVGnCHUT@linutronix.de>
 <20250204103447.GU7145@noisy.programming.kicks-ass.net>
 <20250205083926.etxnZAoP@linutronix.de>
 <Z6XVLqexaKZr0cy1@jlelli-thinkpadt14gen4.remote.csb>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Z6XVLqexaKZr0cy1@jlelli-thinkpadt14gen4.remote.csb>

On 2025-02-07 10:41:02 [+0100], Juri Lelli wrote:
> Hi,
> 
> On 05/02/25 09:39, Sebastian Andrzej Siewior wrote:
> > On 2025-02-04 11:34:47 [+0100], Peter Zijlstra wrote:
> 
> ...
> 
> > > Anyway, none of this solves anything when a process has both an active
> > > RT part and an active !RT part (which isn't uncommon AFAICT).
> > > 
> > > Then the RT bits will still get interference from the !RT bits. Do we
> > > want to complicate things and consider that?
> > 
> > I don't think so. The active and inactive are common but it is still the
> > same process so you can expect it. The ugly part is when it is an
> > entirely different task and it is random which one it is.
> 
> Not entirely sure we are thinking about the same situation, but it looks
> like we have cases of RT tasks that are affected by the underlying issue
> this set is about because they make use of libraries. So, in this case
> we have a cross-process (RT/!RT) situation that I am not sure we can
> address sanely. What do you think?

I wouldn't advice to use "unknown" code in a RT application and even
threads. Audit libs before using them and not just collect them.
A lock without PI in your RT thread is not good. A lot of locks, not
knowing the "locked" time, also not good. Things that work most of the
time due to the fastpath and only break from time to time.
Also, a thread does fork() once during start up and things may continue
to be good but may catch up eventually.

> Thanks,
> Juri

Sebastian
