Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3749125A647
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 08:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738744777; cv=none; b=W2YybW9urs7wJXjhVBxn0NkvSw2t80KQwJb5irZNJ7gkzURGnq1YNfx6ToIxrOK2ltjSYWc7S/+TPXfkE815+QXZKlo+3jQd+tA60Jqhp+Qo5thp75ZBs1SYi+02OEoXojNXutluyfh395id0PwX6J8boW32xsrYR9v0kugJKfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738744777; c=relaxed/simple;
	bh=FHffW/gwom0PiJdcz48UdhiaUFvLFpwvQHcw2MVjYBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K0gUPY1XQgDTHpSsz4oQGu3JtUB52gU1yD8slKVcsPug2VGsFn3UOiwAcXYfFtA+zPAbsO3KV6Yci/SXt+N6aVHrQOy3bz0ypKhX2Fj6jadvqq3/rOPKDu6xkubQuoGOUcMDXYZ0aMp7YWxso4+dGSdGqaK2qCoCE4X6DQ9BieY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=cHqhMo2x; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Ctt9cKlg; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="cHqhMo2x";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Ctt9cKlg"
Date: Wed, 5 Feb 2025 09:39:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738744768;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TSpRIc96bph54i7urUEB6ib3zLo8wB2lwxryc/iMExU=;
	b=cHqhMo2x9wmEzvsMoG4hoFPMC9qv+HbOnRw/YVyseovhhuWDjHb5h0iDt18THgzOSr9bFQ
	iLxvPZO1AgFnkXJhaRSllKQajABkYyauxEOQBeL+wBeYplbPwTjeVt6przZ2jNBTe96Vt+
	Iwcz/8ixnNF3ivOH+QVBSLCVrKCjGozCCXANSc+MplBxqpymQYVRrcmpZzzT+58QJYTCke
	lCphdh51FRxjyB4HpdZsgtxtUhEsZU4EnfepamHJZMLDsbHjoZflygzaQXqhiEDEElW5+p
	/7Xfah/sddK7tV/2b5JUIf1AWS/2yficqjEkoYxTeRSfQNxq5ma4FqLxLHE6yg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738744768;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TSpRIc96bph54i7urUEB6ib3zLo8wB2lwxryc/iMExU=;
	b=Ctt9cKlgAHGvfQRZyaV4DDEv8W0n6L2Q2I+lzHACVOqlyOLSK198wBFCrs1PYfbix2577k
	Dw/hHyThwErfdjAw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org,
	=?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v8 03/15] futex: Add basic infrastructure for local task
 local hash.
Message-ID: <20250205083926.etxnZAoP@linutronix.de>
References: <20250203135935.440018-1-bigeasy@linutronix.de>
 <20250203135935.440018-4-bigeasy@linutronix.de>
 <20250203142743.GI7145@noisy.programming.kicks-ass.net>
 <20250203155114.YVGnCHUT@linutronix.de>
 <20250204103447.GU7145@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250204103447.GU7145@noisy.programming.kicks-ass.net>

On 2025-02-04 11:34:47 [+0100], Peter Zijlstra wrote:
> On Mon, Feb 03, 2025 at 04:51:14PM +0100, Sebastian Andrzej Siewior wrote:
> 
> > All the things I mentioned are open for debate:
> 
> So how about we add sysctl_futex_private; when set to 0 it will disable
> the private hash for every new task, unless task explicitly calls
> PR_FUTEX_HASH_SET. When non-zero, it is the base for the auto-scaling.
>
> (then BASE_SMALL would have this default to 0, otherwise 4 as per this
> patch set)
> 
> I would let PR_FUTEX_HASH_SET override and disable auto-scaling. There
> is nothing more annoying than a computer that thinks it knows better.
> User asked for N, user gets N etc.
> 
> If user sets 0, fall back to global hash.

Looks sane. I started with PR_FUTEX_HASH_SET to avoid the rehash at
runtime. Now that I have this working PR_FUTEX_HASH_SET does not look
needed. But okay. Having a default enable or disable with the sysctl and
a PR_FUTEX_HASH_SET which sets a requested value and disabling
auto-scale looks okay.
Assuming the user knows best. Even that it is hard to get right given
random pointer and so on.

> Anyway, none of this solves anything when a process has both an active
> RT part and an active !RT part (which isn't uncommon AFAICT).
> 
> Then the RT bits will still get interference from the !RT bits. Do we
> want to complicate things and consider that?

I don't think so. The active and inactive are common but it is still the
same process so you can expect it. The ugly part is when it is an
entirely different task and it is random which one it is.

Sebastian
