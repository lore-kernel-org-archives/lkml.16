Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2D224BBFD
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 12:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746189098; cv=none; b=bFt7lS8av7d2eIwFn8Ik3sDQAiTOBmsLUBfooPgwjvPHiRPHf7YQUhR5p9+Gc1hEFsVi4lAvJRHuz8Hi9j5yHuKwROSLVMN0iyGWVv4/naAyDhiE6ej2lWATWn8p5VbrOwfZdcYRXjUbBZutBXcfbGJqA5BDxhoiy1y1TLms6lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746189098; c=relaxed/simple;
	bh=XesEG/0KvQlQV0UEHbw2alP/dDBhq3XhIOw7ALm9CfU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tkjlwHB1XKXAM4654kXZXzy0jzzL0N3hy5CAp93fzcm4Kbxoo4erBTtbZd2d3ss/vVMP07Xec+6ObYUnvf3i/eDokm1GNBWeveiyFpUARUdKuW1KOSmJaVxHmISKPDcrUX7D1jZBQGikcF3MR8iO+0PXSTO0/Uia3W4ynXQUs+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=dZzgyc/J; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=/3To1Us1; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="dZzgyc/J";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="/3To1Us1"
Date: Fri, 2 May 2025 14:31:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746189094;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l/ps/KnLOGHL6+wgjhHsQWYaOPZoEkEqnfArzWRawig=;
	b=dZzgyc/Jx4pWYVxAI3jk4myI0wWutMBehsuMmDUNViApCehaoM0VEYBgJl8Xt+Y6/wqgbi
	cRpMWV6mJcYuBZiVh+BVD3IEAfzUmQO2uypHhAMmPBBe/m92/+gV7KbkqslV3xLpGJaEyK
	Hm4UBOvOtn1t8hl+KyOr5vSnk1SLLGwzs7qIaKWuMC9QQu4d4z0XmurB62vEttzbYBMLu/
	YWVFiACC4p1x74av46EyOgSYW3X1rNyxN8Jn7tCpCZCJt6lELcJzU9UsOeg0xzw1Ck1iaO
	5fVljhJzK8pYHkg0lao1WWECRdywmVrlf6MTi1qX+GvgvSERzi3OzgrbYU3DDQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746189094;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l/ps/KnLOGHL6+wgjhHsQWYaOPZoEkEqnfArzWRawig=;
	b=/3To1Us1j6sBLnH+ixHLadDwWm+zG6mFH/XSbv0ikWEFKfqr/yvf+BxsH3lKix1aw4ubxT
	9ldnHOGlM5lVVRDw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Prakash Sangappa <prakash.sangappa@oracle.com>,
	linux-kernel@vger.kernel.org, rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com, tglx@linutronix.de,
	kprateek.nayak@amd.com
Subject: Re: [PATCH V3 4/4] Sched: Add tracepoint for sched time slice
 extension
Message-ID: <20250502123133.4pGihD-W@linutronix.de>
References: <20250502015955.3146733-1-prakash.sangappa@oracle.com>
 <20250502015955.3146733-5-prakash.sangappa@oracle.com>
 <20250502091434.GV4198@noisy.programming.kicks-ass.net>
 <20250502110210.rZX1iHcg@linutronix.de>
 <20250502111044.GY4198@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250502111044.GY4198@noisy.programming.kicks-ass.net>

On 2025-05-02 13:10:44 [+0200], Peter Zijlstra wrote:
> On Fri, May 02, 2025 at 01:02:10PM +0200, Sebastian Andrzej Siewior wrote:
> > On 2025-05-02 11:14:34 [+0200], Peter Zijlstra wrote:
> > > This is horrific coding style. But really why do we need this? I'm not,
> > > in general, a fan of tracepoints.
> > 
> > I suggested a tracepoint so that we see why the NEED_RESCHED flag
> > disappeared. The trace would show a wakeup, the need_resched flag would
> > be set and the flag would disappear without an explanation.
> 
> Would we not see a timer_start event for the hrtick or somesuch?

Yes, we do. That would mean we need timer:hrtimer* in order for the
sched:* to make sense.

Sebastian
