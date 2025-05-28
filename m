Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350FB275111;
	Wed, 28 May 2025 09:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748423439; cv=none; b=j3AditVrxyi/VJr3YJ2P4UEjBsIoZ/MOlIqTUA3wRP/983s/Q6fEfwOQioelBK4m9D/4vlivOmuAx/bvSCA6psq+JdZSrI4OYjcDLARgx2FYLAUG8ABYN/8WR2g6bbJmqH9lTrlIKW36iZuk/ZoHz83kRMX+mgGxFvHpKI7uNUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748423439; c=relaxed/simple;
	bh=Ia2GozwV4a8lhyp5neP6FN7joVX9OC4FCSS0RVxVnDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D5OC3JqKfTsw4r0+XdQP5Cak1dFahiUoze8DYA7CzZixXaZH6o/rTZ5GpA7bXfGujppUHAtlwz5Pa8Fh1li+kveIFxZxfBido1Vz3yzRFLEmCCYFtVRFyBBZDMiGLE4SnKev5FQX9aJ6ypWhunGzjhUN6ZPVC05WgClI7i75ss8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=n80odNv+; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="n80odNv+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=f6UBhiqU0OYkhGbwcIEcEvBe+Cw0gb40pBFliPLoPzM=; b=n80odNv+N9ONWYA1sCuYXOgxON
	wVHEbZdcisAMdQq1mjr0VsxZt3IJEp+TxKV/nWSpoajpOCz1zRxwJ9NzgXyKSZRpJVKfXGQ7N7Bcg
	686Q0qsKPQwPpFgDuUe3utYZZ7CrMl6fptdnNDNpgbQ+ScqWjUaeUMiOOnVKoFnQIi6QIjVzu5l7T
	ke/r5pSL9I9wOY9RmJ993URFMvBvY3MDG/R+pE3/Y5LacpC4N7FwjpnBrcqeKqt6etQULRZJGnp4E
	yOXSXJ8jDnqww8d6uuwSQkMb4T2yF5SUxSelCD6OMCMl+f8DSj9jR6OhUFAK1k4UYy5eUxT2ZJhyq
	8b2ymuRg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKCno-0000000DQmJ-19iM;
	Wed, 28 May 2025 09:10:24 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id D38FB3005AF; Wed, 28 May 2025 11:10:23 +0200 (CEST)
Date: Wed, 28 May 2025 11:10:23 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Lyude Paul <lyude@redhat.com>
Cc: rust-for-linux@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Boqun Feng <boqun.feng@gmail.com>, linux-kernel@vger.kernel.org,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	David Woodhouse <dwmw@amazon.co.uk>, Jens Axboe <axboe@kernel.dk>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	NeilBrown <neilb@suse.de>,
	Caleb Sander Mateos <csander@purestorage.com>,
	Ryo Takakura <ryotkkr98@gmail.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>
Subject: Re: [RFC RESEND v10 03/14] irq & spin_lock: Add counted interrupt
 disabling/enabling
Message-ID: <20250528091023.GY39944@noisy.programming.kicks-ass.net>
References: <20250527222254.565881-1-lyude@redhat.com>
 <20250527222254.565881-4-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527222254.565881-4-lyude@redhat.com>

On Tue, May 27, 2025 at 06:21:44PM -0400, Lyude Paul wrote:
> From: Boqun Feng <boqun.feng@gmail.com>
> 
> Currently the nested interrupt disabling and enabling is present by
> _irqsave() and _irqrestore() APIs, which are relatively unsafe, for
> example:
> 
> 	<interrupts are enabled as beginning>
> 	spin_lock_irqsave(l1, flag1);
> 	spin_lock_irqsave(l2, flag2);
> 	spin_unlock_irqrestore(l1, flags1);
> 	<l2 is still held but interrupts are enabled>
> 	// accesses to interrupt-disable protect data will cause races.
> 
> This is even easier to triggered with guard facilities:
> 
> 	unsigned long flag2;
> 
> 	scoped_guard(spin_lock_irqsave, l1) {
> 		spin_lock_irqsave(l2, flag2);
> 	}
> 	// l2 locked but interrupts are enabled.
> 	spin_unlock_irqrestore(l2, flag2);
> 
> (Hand-to-hand locking critical sections are not uncommon for a
> fine-grained lock design)
> 
> And because this unsafety, Rust cannot easily wrap the
> interrupt-disabling locks in a safe API, which complicates the design.
> 
> To resolve this, introduce a new set of interrupt disabling APIs:
> 
> *	local_interrupt_disable();
> *	local_interrupt_enable();
> 
> They work like local_irq_save() and local_irq_restore() except that 1)
> the outermost local_interrupt_disable() call save the interrupt state
> into a percpu variable, so that the outermost local_interrupt_enable()
> can restore the state, and 2) a percpu counter is added to record the
> nest level of these calls, so that interrupts are not accidentally
> enabled inside the outermost critical section.
> 
> Also add the corresponding spin_lock primitives: spin_lock_irq_disable()
> and spin_unlock_irq_enable(), as a result, code as follow:
> 
> 	spin_lock_irq_disable(l1);
> 	spin_lock_irq_disable(l2);
> 	spin_unlock_irq_enable(l1);
> 	// Interrupts are still disabled.
> 	spin_unlock_irq_enable(l2);
> 
> doesn't have the issue that interrupts are accidentally enabled.
> 
> This also makes the wrapper of interrupt-disabling locks on Rust easier
> to design.
> 
> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> 
> ---
> V10:
> * Add missing __raw_spin_lock_irq_disable() definition in spinlock.c
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>

Your SOB is placed wrong, should be below Boqun's. This way it gets
lost.

Also, is there effort planned to fully remove the save/restore variant?
As before, my main objection is adding variants with overlapping
functionality while not cleaning up the pre-existing code.


