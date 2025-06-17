Received: from relay.hostedemail.com (smtprelay0016.hostedemail.com [216.40.44.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2835E2E88A0;
	Tue, 17 Jun 2025 15:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750173124; cv=none; b=tjSNRNEw3tLhATeuAAv112amU9iKAc5+g/8u6bmadPqxcy08BePEsyxBJONo8zm2KcWRLnGE2UEKRqW2ImvgCL095lMmoHpjK4pJx6YekBWufcndKFYY48NVzub9wqexfeaOJLMtuYiGGkJkG4j7bCnwdh80XW5HF8l9BXlnvsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750173124; c=relaxed/simple;
	bh=iSVaWuGCzz2VvOehEKH/IXJYB849DKqm1zj3HRIKzDY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PYH/fbB1LaHjbheP33HRZ5wdPkwWb76zFFV5jbeSLvJ3uGS2w3wRBr0PEAw3kwpK5TFesquoglSHY+Iz+UjC27Wj0D5SSV3mUROwBvcZQoz+MEXjaALAilxGl1pvaonuNufEUs5EpTzI1uXc4GYzO2YUPvUuP2LWWtB988cLVw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf05.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay04.hostedemail.com (Postfix) with ESMTP id 439FB1A045C;
	Tue, 17 Jun 2025 15:11:58 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf05.hostedemail.com (Postfix) with ESMTPA id 89CEA20029;
	Tue, 17 Jun 2025 15:11:51 +0000 (UTC)
Date: Tue, 17 Jun 2025 11:11:57 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Lyude Paul <lyude@redhat.com>, rust-for-linux@vger.kernel.org, Thomas
 Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, Daniel Almeida
 <daniel.almeida@collabora.com>, Ingo Molnar <mingo@redhat.com>, Peter
 Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
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
Message-ID: <20250617111157.36b1b17e@gandalf.local.home>
In-Reply-To: <aFF84rW5fNXrnwC8@Mac.home>
References: <20250527222254.565881-1-lyude@redhat.com>
	<20250527222254.565881-4-lyude@redhat.com>
	<20250617101120.7c946656@gandalf.local.home>
	<aFF84rW5fNXrnwC8@Mac.home>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 89CEA20029
X-Stat-Signature: e3s8h6w1kni6rrrrihmu9ypukputaqry
X-Rspamd-Server: rspamout06
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19TknEx4XMi3HQmIWa4vCKYwjQ2yQ7MiEQ=
X-HE-Tag: 1750173111-5368
X-HE-Meta: U2FsdGVkX18p34QXPUmiazssk0nZAEejI7F9//J6Y1czVHu2YbcdQFCBV6tmYvtnO9Tk0AQMRJtid2GWkOtzzEwVEGb4A0bBWbj11kWKwqgabO02dpVdW21qfPSsjlNWmZMIROtuxLS+NCkvVAkNW/4AQ8an5wErcRhO4LOJtu2Vj9GPheiMoCDnKZ6EOC+QU8D0JMlOzsndXC0gQjWXyygpAmhbkIUgBkjplw1o0Lxiun+XOygNaIYLFg/YaIwkuy4P6IYfunrKokOFC2v+1rowpo6rRIW60VHIHE86L3Ma7H5Al3WLrAGJ0UZaU9PudGNw1BrZxwuk3NGV+xcYNMaXADFurvM+

On Tue, 17 Jun 2025 07:34:10 -0700
Boqun Feng <boqun.feng@gmail.com> wrote:

> Because the new local_interrupt_{disable, enable}() participate the
> preempt count game as well, for example, __raw_spin_lock_irq_disable()
> doesn't call an additional preempt_disable() and
> __raw_spin_unlock_irq_enable() doesn't call preempt_enable(). And the
> following can happen:
> 
> 	spin_lock(a);
> 	// preemption is disabled.
> 	<interrupted and set need_resched>
> 
> 	spin_lock_irq_disable(b);
> 
> 	spin_unlock(a);
> 	spin_unlock_irq_enable(b):
> 	  local_interrupt_enable():
> 	  // need to check should_resched, otherwise preemption won't
> 	  // happen.

Ah, because preempt count can be set to non-zero *before* interrupts are
disabled. That makes sense. Thanks.

Hmm, I wonder if we should add a comment stating that here?

-- Steve
