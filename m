Received: from relay.hostedemail.com (smtprelay0010.hostedemail.com [216.40.44.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF0B2E54D3;
	Tue, 17 Jun 2025 14:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750169488; cv=none; b=RJnmB73N9vHvxG6TvV09MJvvG6Z2KjOpMoDsm8QiSGvBBRqyb2JymdyxBR/Tzt259a+ttREoa3S/ubD28JBAIeVfM+FekE3ybT90oJXZcsAr74STFtmS8KPRm21YDXYPgilHKM/konXo8mxAcbB92bmW4Bg6hmKw99q0jZj1Mu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750169488; c=relaxed/simple;
	bh=8hWn08TVxi6nt+yOHQco8htVd+VJW89Ty/tb+h0FAWo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WTpqZcNOBW8Ru+8TFHR7yH8MKBAVCg+fhomUnAwMm12hQpTZpkFiwnSEZYFaOikqgQ2cRM55URjllAf4r3y/eR4JVykms8Hosuh5vjz8/h2mL9NQRAVKhK3Z79QKE1V6cFfCPUn4z6/DtaRqnJBbi/+dsM30FxOWMbH/jc4EUsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf03.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay06.hostedemail.com (Postfix) with ESMTP id AAFF21003EA;
	Tue, 17 Jun 2025 14:11:21 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf03.hostedemail.com (Postfix) with ESMTPA id EA9736000B;
	Tue, 17 Jun 2025 14:11:14 +0000 (UTC)
Date: Tue, 17 Jun 2025 10:11:20 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Lyude Paul <lyude@redhat.com>
Cc: rust-for-linux@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Boqun Feng <boqun.feng@gmail.com>, linux-kernel@vger.kernel.org, Daniel
 Almeida <daniel.almeida@collabora.com>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann
 <dietmar.eggemann@arm.com>, Ben Segall <bsegall@google.com>, Mel Gorman
 <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, Will Deacon
 <will@kernel.org>, Waiman Long <longman@redhat.com>, Miguel Ojeda
 <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo
 <gary@garyguo.net>, =?UTF-8?B?QmrDtnJu?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor
 Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, David
 Woodhouse <dwmw@amazon.co.uk>, Jens Axboe <axboe@kernel.dk>, Sebastian
 Andrzej Siewior <bigeasy@linutronix.de>, NeilBrown <neilb@suse.de>, Caleb
 Sander Mateos <csander@purestorage.com>, Ryo Takakura
 <ryotkkr98@gmail.com>, K Prateek Nayak <kprateek.nayak@amd.com>
Subject: Re: [RFC RESEND v10 03/14] irq & spin_lock: Add counted interrupt
 disabling/enabling
Message-ID: <20250617101120.7c946656@gandalf.local.home>
In-Reply-To: <20250527222254.565881-4-lyude@redhat.com>
References: <20250527222254.565881-1-lyude@redhat.com>
	<20250527222254.565881-4-lyude@redhat.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: htncteuttkzwxctxcewje7ky5ojwunj1
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: EA9736000B
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX191AI3waoI7kPuJd6QW3xXci6eqEX5WyfE=
X-HE-Tag: 1750169474-160759
X-HE-Meta: U2FsdGVkX19IO9TtLFKVfjxlKj7qi+gPSxhlEdfuSkv7pW1CDk4ZrvExk3X1Vq58BvA6w7kNOz/SbFQ175reXw1CYYswZ9zgyQt6WjtwRMeFcHyVjMW/5O3Y8WrQnP3JabQp3te4WaIodqAZH4f4tng2P15nwhlM7Mb0gXjCUu5v78oq6UHb6I7F308prDJku4bPYnWqvoKj9SMCQlhSiyC0klBXUBtDnJON9EhyMrqYv0eTGgl+PmRmqQKeIxnFKInIDRcQp0FP+6PPxty+Ivrms2ghSMZVPCWh9dIfv5HPPL6pXWrCstHaQWQ/qU9LXdvfQ5LHVOdvGKgLTvzGEk+ZXbUPBb4R

On Tue, 27 May 2025 18:21:44 -0400
Lyude Paul <lyude@redhat.com> wrote:

> +static inline void local_interrupt_enable(void)
> +{
> +	int new_count;
> +
> +	new_count = hardirq_disable_exit();
> +
> +	if ((new_count & HARDIRQ_DISABLE_MASK) == 0) {
> +		unsigned long flags;
> +
> +		flags = raw_cpu_read(local_interrupt_disable_state.flags);
> +		local_irq_restore(flags);
> +		/*
> +		 * TODO: re-read preempt count can be avoided, but it needs
> +		 * should_resched() taking another parameter as the current
> +		 * preempt count
> +		 */
> +#ifdef PREEMPTION
> +		if (should_resched(0))
> +			__preempt_schedule();
> +#endif
> +	}
> +}

I'm confused to why the should_resched() is needed? We are handling
interrupts right? The hardirq_disable_exit() will set preempt_count to zero
before we enable interrupts. When the local_irq_restore() enables interrupts
again, if there's an interrupt pending it will trigger then. If the
interrupt sets NEED_RESCHED, when it returns from the interrupt handler, it
will see preempt_count as zero, right?

If it does, then it will call schedule before it gets back to this code.

-- Steve
