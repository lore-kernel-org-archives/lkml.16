Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75399209F4B
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 15:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738598061; cv=none; b=LVVplE01wmtksiZC2OjeIEhqHdZOKwgmLFi/sXfHOxZkKJxah8Ff1R+0945RKF8P6Wb1GQp+V7GB8G2Km9L/aZE4ekpDJ0ZhY/4RmPzLO7GlXZ9nygg/xSmsIo1o01jxzKVi6yZz+dsycBs3CG+s365UqhBa4ajGNvZkdx2KMvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738598061; c=relaxed/simple;
	bh=2uzxuXxCUqGlrNQfLHKCS7lCbFYVdkz7inCWMTp4bP4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gSGR7dKTLYw3eVzeGHsLzFjoG2gIBmwnIHowr8DDNcQ8IKd8pPqNxtb26m2fW4b8z1ecT5LpIX6/dqa+WD28IxzECJ9QN0hw7eNn4TjhnoeqtV2hxXeiIXHkVy20jFb2q03czTugdIxpKEajn6o0b6Bl5Zqsc/VmL6G1GhES9vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=PfaYDwQl; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=rDAEIGZY; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="PfaYDwQl";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="rDAEIGZY"
Date: Mon, 3 Feb 2025 16:54:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738598058;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EXS/+3JWuWKMaxeqFYBlxN1H7/OO5J5PClcj+nahk7Y=;
	b=PfaYDwQlu/KzepPvidcljIrQpBq129BC/OUnT4lSdi4pW4RNCbnRggX6zJqMVBr5Fa14l2
	BWL0mb41FPdfP5peWvIr+otx1fkM7qcxeBdXrkIFSwXfKF5C2hf87BSeDp5KOgbaBQjAlZ
	vcHPJhNVXC59lNQrDplQs10W4cGm42YnnKlAOzEUHUV3LIVbrGdSkTnk29QZJ5C7ZyTsiU
	wkx6DxlcMt/6vLtOXN4rL7YKVSd5UoVGMcOtjdSMgNcBzyMIrayTLb6SxPxLdEbgvzOswL
	Q/Blu5iy6NzARV2ls5IuOT0jg9f/dLO6wX+3ievru70woUOAmOZStwM6xTY6LQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738598058;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EXS/+3JWuWKMaxeqFYBlxN1H7/OO5J5PClcj+nahk7Y=;
	b=rDAEIGZY/tIal1fUmNeee9PG9uIGQyaiAqCS0LJQFOc3eIWzI/hxYliGO0xpupb2khYfZz
	GLQdMNr2IfS2hiBg==
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
Subject: Re: [PATCH v8 04/15] futex: Allow automatic allocation of process
 wide futex hash.
Message-ID: <20250203155417.UxZ0aBrC@linutronix.de>
References: <20250203135935.440018-1-bigeasy@linutronix.de>
 <20250203135935.440018-5-bigeasy@linutronix.de>
 <20250203143602.GK7145@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250203143602.GK7145@noisy.programming.kicks-ass.net>

On 2025-02-03 15:36:02 [+0100], Peter Zijlstra wrote:
> On Mon, Feb 03, 2025 at 02:59:24PM +0100, Sebastian Andrzej Siewior wrote:
> > Allocate a default futex hash if a task forks its first thread.
> 
> This makes it so that private futexes are *always* on the mm local hash;
> there is no way to disable this.
> 
> This seems somewhat extreme.

That was the plan. But disabling it before creating threads is doable if
needed.

Sebastian
