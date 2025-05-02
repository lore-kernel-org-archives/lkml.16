Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA25E23FC5A
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 11:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746184295; cv=none; b=DMBcuhrIu6EKummQi/ClI+OvBjaQFwGbV1mV5aGw5FlTDY3um93v/1f3/WCtNSKQfmg2jumf+EK3kDXllCTIEne8NL8vKr9dkWJ7BtNNw+k9M4Abnn3Q0ZwLPy1ktzqkRn3Xx8U/tP8gYnAUxrjux8aGXGoutDdqDJop9qee4OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746184295; c=relaxed/simple;
	bh=lxjGHS3cfRSQaQe4SoSD/hzcMZPlcMfBcwBXxPqcwQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uN212A/jIFzcUUQMC3Fg9al/LO/oLLhiTJfp42kOscLlgszzR0zv0AWPfPuQ6Vz3y424evhuhw2eVzeaSCu8Fuu8vFZIRNP4ln7/zaq1O0nNFxnblPiT0q5FH1i4e5rYLlMYSZmdl5ec9PSeJmhRo6/LuVkDB0g4sMkHHEK1VLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=UaWPp5Fu; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="UaWPp5Fu"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=rOcmUHivWm2VyijzsBx2fgbFNnH4PTajNysnSptcXWo=; b=UaWPp5FubR6G8XSifKUH5oHEqv
	5FWN3MCNRlpz4lbl9v7mMT73rlWRj/zO98rUPFdgD6OiHRLwTJ/hwHqU9M6Zan7Ib1r3QT0UnsvKV
	aYIK+v8giP1CTbM6AIFa66XQVpmY4PecIoapK50uDsN8ZBKlVy4QyRvR21ei25DAcJx7f38NX9LRy
	GuCcJbEx+48GPuKUqxzhAtBWiGBbZkqv4Edb4lCiqpahu54sCVjbyk3uZ0kWwUwACengc0v1KC6BD
	T9Ugjf170jcrK/26huMOjF7lZvJdBXVoA8tMUd9byVJFAo6kEjicaJh77gY+ptGQuKdTF3gWkcr7d
	f2ni50fw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAoIE-0000000F0w4-1kBh;
	Fri, 02 May 2025 11:10:59 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 602C030057C; Fri,  2 May 2025 13:10:44 +0200 (CEST)
Date: Fri, 2 May 2025 13:10:44 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Prakash Sangappa <prakash.sangappa@oracle.com>,
	linux-kernel@vger.kernel.org, rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com, tglx@linutronix.de,
	kprateek.nayak@amd.com
Subject: Re: [PATCH V3 4/4] Sched: Add tracepoint for sched time slice
 extension
Message-ID: <20250502111044.GY4198@noisy.programming.kicks-ass.net>
References: <20250502015955.3146733-1-prakash.sangappa@oracle.com>
 <20250502015955.3146733-5-prakash.sangappa@oracle.com>
 <20250502091434.GV4198@noisy.programming.kicks-ass.net>
 <20250502110210.rZX1iHcg@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250502110210.rZX1iHcg@linutronix.de>

On Fri, May 02, 2025 at 01:02:10PM +0200, Sebastian Andrzej Siewior wrote:
> On 2025-05-02 11:14:34 [+0200], Peter Zijlstra wrote:
> > This is horrific coding style. But really why do we need this? I'm not,
> > in general, a fan of tracepoints.
> 
> I suggested a tracepoint so that we see why the NEED_RESCHED flag
> disappeared. The trace would show a wakeup, the need_resched flag would
> be set and the flag would disappear without an explanation.

Would we not see a timer_start event for the hrtick or somesuch?
