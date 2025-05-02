Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93414C8E
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 11:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746183752; cv=none; b=k4ap2NHYisxLC3yo2x91Tll+Cahhd0pSUoSKer5O79gstYOQjo6DuzAwHv4rApXWqxIiFX4SsfgjxhGBpmgdAURmgFtbAQ7IuVWZmeo5D91tWdRRUo4LMYAYkA4omnuatndAWW2eiesvRQF+tg0mPmRqaE3wYDIxEQWJCf7upiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746183752; c=relaxed/simple;
	bh=ZsI7OgdJVVImXFDZ9pgwbV0jbQs1sJiJ6jcC5/WcP1I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z8v2pIGLZePzL0AUu5hZA4MK/Myl2GIuADl22py1xh9EUV9ZoxaBUPpmX2PWrIwrpiGMA1pNeWMDfCpk/xpJ3mxuyeM9JGyw4/FDJ+Wv/H9wdJm3QsTCZixu85mlj5UtHToOCU2mj0qJFs1tcLhmMkf1sVYxZdlsBwDglQ197V0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=rrGvUyYi; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=QEqQhrt4; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="rrGvUyYi";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="QEqQhrt4"
Date: Fri, 2 May 2025 13:02:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746183731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZsI7OgdJVVImXFDZ9pgwbV0jbQs1sJiJ6jcC5/WcP1I=;
	b=rrGvUyYijgXjUkgbQvyvBkzpiZo4ho8YFc09Qg1sTFvs/E0RH5lv80TUIUeATsY7lNGO03
	B9S8XltYiKx2teZoDDK8VD/hn5tpj8qStLatqzqHYJN/FgzYRCQBymVVJo9a47ci1tmraf
	wIgbVfbrrKGiPmRjEH66dLupZrXskUB/K43yhPtLR+DtppSQunfzqwy0wnqdi+by9oyxtR
	Pvr6O0bZsWxS6Oq2WxhfB6kbxOMzIXK5BUGFepvj6Hmtnm/zri1M8jzR8D8QUHSV4PJsO8
	IOlqjrll8A1wHAghTVmk5IxfwtGzGw1S8mpor9vDohmKxHiFxq+ysM6lUFbJ3w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746183731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZsI7OgdJVVImXFDZ9pgwbV0jbQs1sJiJ6jcC5/WcP1I=;
	b=QEqQhrt4brxmbpkaqLvts4Nnt8BcZHO9FB9pfJVQllB5zJZQszLzmDb6JuIyn91oX03FpM
	GAIB2i8d4kOfgEDw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Prakash Sangappa <prakash.sangappa@oracle.com>,
	linux-kernel@vger.kernel.org, rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com, tglx@linutronix.de,
	kprateek.nayak@amd.com
Subject: Re: [PATCH V3 4/4] Sched: Add tracepoint for sched time slice
 extension
Message-ID: <20250502110210.rZX1iHcg@linutronix.de>
References: <20250502015955.3146733-1-prakash.sangappa@oracle.com>
 <20250502015955.3146733-5-prakash.sangappa@oracle.com>
 <20250502091434.GV4198@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250502091434.GV4198@noisy.programming.kicks-ass.net>

On 2025-05-02 11:14:34 [+0200], Peter Zijlstra wrote:
> This is horrific coding style. But really why do we need this? I'm not,
> in general, a fan of tracepoints.

I suggested a tracepoint so that we see why the NEED_RESCHED flag
disappeared. The trace would show a wakeup, the need_resched flag would
be set and the flag would disappear without an explanation.

Sebastian
