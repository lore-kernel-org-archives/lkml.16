Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B744B22CBFA
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 11:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746790949; cv=none; b=GOZ8DRQYtfkRgKUA5iFx6eeApC1vDismppTv5EyrgJxc2tOF7c6MiVwiMzfECP2DKfGX9tMU1snukwruG5evWTaXwUUM+8mZs0OH2M2ntZy4GR5+0hR7OVf8Zdok18Jb1R3Zbyedp/bCYNrGcDOlMLbfpl/891SGDUc1vUWvI34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746790949; c=relaxed/simple;
	bh=iK2diWWL7SEKJTvivh0AhIesSNavfkhZunYjEvgYPoE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z+rYm04+WAzj707YYLDpScJpJghXBvfOYcqJz9JnJJ/f5n8pPS+8/AIPZi4YJQqSYFpo2ZIc+v3bx8XdOmg3bUTxAKG0ZjEKul+aphdssKa+12tvxSXwb5rrrtcOlUTam1rkC5B1udU9GZa0WmYWqfJ2pvMPc+Nil+/VSy1GOqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=UIddWNpX; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Qu8Rma97; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="UIddWNpX";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Qu8Rma97"
Date: Fri, 9 May 2025 13:41:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746790945;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=snQGn3xkyfkLKxl270cjn9zJAlwW6Miuy7BG3qnc0b4=;
	b=UIddWNpX+tQFvNsJ7wKQUOZXz6yVrsTTZTVDB1na2HLLLfuXF8NL7/oaFKvjt1XSvpKJ/Y
	KlSEu3Ln9Wt8EDWDISVq6sR/QDdz11neT5rZCEEjNi9jjGPc7czNlwj7RIdI0ddYUj47W8
	NU3z1RjNz3B36G2xTMxBk5sbEvcSzDwlu1tM/YnM8UxtT+HPmeA0zOysaPgi5GY2WIBnjG
	KgGdCg5qRZiL8Plw1vyAJekrYhFG5/b538k5yPARS0SZOIqoKsyoM/ju9rZmt+JYFG9ZR0
	lbKGIwl1C+VFnjaj9He7yXSChnDkEH0gawH9cpzmpFJIVnrAh6ZN8hPW8RPs8Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746790945;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=snQGn3xkyfkLKxl270cjn9zJAlwW6Miuy7BG3qnc0b4=;
	b=Qu8Rma97oz0zQ19GvOE/G4qR6LspFZ/V58cFLIEzQdurLhq0dAHiaeBmoRu1mF4e4h3HrK
	+Ub9MXvWI3gdKOCg==
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
Subject: Re: [PATCH v12 00/21] futex: Add support task local hash maps,
 FUTEX2_NUMA and FUTEX2_MPOL
Message-ID: <20250509114105.HZdDPPO5@linutronix.de>
References: <20250416162921.513656-1-bigeasy@linutronix.de>
 <20250416163142.aKBzQeqK@linutronix.de>
 <20250502194807.GD24078@noisy.programming.kicks-ass.net>
 <20250503100905.GG4356@noisy.programming.kicks-ass.net>
 <20250505073036.ikHE6K4T@linutronix.de>
 <20250506073611.GH4198@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250506073611.GH4198@noisy.programming.kicks-ass.net>

On 2025-05-06 09:36:11 [+0200], Peter Zijlstra wrote:
> Well, if you do stupid things, you get to keep the pieces or something
> along those lines. Same as when userspace goes scribble the node value
> while another thread is waiting and all that.
> 
> Even with the unconditional write back you're going to have a problem
> with concurrent wait on the same futex.

We could add a global lock for the write back case to ensure there is
only one at a time. However let me document the current behaviour of the
new pieces and tick it off ;)

Sebastian
