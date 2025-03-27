Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BDA442C0B
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 09:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743066318; cv=none; b=oCG4nuoYA57VoQo6BTKrD49KV1MlXjA4dA1QAVoce5sncCM2t/KPrOENBD0mODgeg48QpSbnBWxEILqxD5x6Ge1Nc5qDNi5JOZ5KCRP/ba5fS48rGdN36aFXoU++Hq1q/F/DqU4Z31xRDlbwvsTR1LzgF5/dBNHJFBy9xk8qQ1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743066318; c=relaxed/simple;
	bh=RkMbqzjbc432nRH2DHf5PBzhWmoY1DhhHxnl/jiSVgw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RUu6E/13XN6g4nYSCJ3njTxHPI28V5cc6wwDRUyfL1hti6nqNE9aKaVFN6+hgGQTW2EAimlqpo8c/qqUMxlXkzEP6QuElmNjypXh7sky5l73bNFzdwGfG8IwkdCfWmWE7IhZSe98FN+hcg1ANeJKT/VZm+G7Ux95DV9ZCtZ4Ki4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=boJFyhyP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="boJFyhyP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B65AC4CEDD;
	Thu, 27 Mar 2025 09:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743066317;
	bh=RkMbqzjbc432nRH2DHf5PBzhWmoY1DhhHxnl/jiSVgw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=boJFyhyPBr5Y99lj3ccmHPJ+vhwoKRsSFNJTgWYKHhDP8yXJUU6Aenqp0/DVPvkW0
	 r7k7YOgRspj+stm3IsRaoIhd5pRfk/539z2zdWvphbIFJ6UGjpNk6t2uNC4RBxy/mf
	 APlCDBC3DLemN9b/QbXg272MCXoa4c6OASAFyEt92sbb98MQfIbC/I1sdaUPZsbTHo
	 s/CYPV/+XqHNZxWgoTPCQQutwBn/9j2zUmM5iJdk5Y+b6XvpdbKCHhBN/oV6yQZVxP
	 EOVD8TeAa+JtNiqHYsKh3dE6ilIky/cRuPXVMin8oSxJm1V51P3dU7mB6uPP1R0VGG
	 TnXNCHpT+9xAQ==
Date: Thu, 27 Mar 2025 10:05:14 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH 5/5] bugs/core: Do not print CPU and PID values
 in__warn() output
Message-ID: <Z-UUynBp8ZdTPaJx@gmail.com>
References: <20250326084751.2260634-1-mingo@kernel.org>
 <20250326084751.2260634-6-mingo@kernel.org>
 <20250326085248.GA25239@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250326085248.GA25239@noisy.programming.kicks-ass.net>


* Peter Zijlstra <peterz@infradead.org> wrote:

> On Wed, Mar 26, 2025 at 09:47:50AM +0100, Ingo Molnar wrote:
> > For most warnings it's repeated anyway a few lines later, as
> > part of the register dump:
> > 
> >   WARNING: CPU: 0 PID: 0 at kernel/sched/core.c:8511 sched_init+0x20/0x410
> >            ^^^^^^^^^^^^^
> >   Modules linked in:
> >   CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.14.0-01616-g94d7af2844aa #4 PREEMPT(undef)
> >   ^^^^^^^^^^^^^^^^^^
> > 
> > In fact the later dump is richer, as it includes the 'comm' line as well.
> > 
> > As a side effect, this makes some space for the 'file' field to be augmented
> > with extra information (the condition string in particular).
> > 
> > Signed-off-by: Ingo Molnar <mingo@kernel.org>
> > ---
> >  kernel/panic.c | 7 ++-----
> >  1 file changed, 2 insertions(+), 5 deletions(-)
> > 
> > diff --git a/kernel/panic.c b/kernel/panic.c
> > index d8635d5cecb2..3101c21ca39f 100644
> > --- a/kernel/panic.c
> > +++ b/kernel/panic.c
> > @@ -725,12 +725,9 @@ void __warn(const char *file, int line, void *caller, unsigned taint,
> >  	disable_trace_on_warning();
> >  
> >  	if (file)
> > -		pr_warn("WARNING: CPU: %d PID: %d at %s:%d %pS\n",
> > -			raw_smp_processor_id(), current->pid, file, line,
> > -			caller);
> > +		pr_warn("WARNING: %s:%d at %pS\n", file, line, caller);
> >  	else
> > -		pr_warn("WARNING: CPU: %d PID: %d at %pS\n",
> > -			raw_smp_processor_id(), current->pid, caller);
> > +		pr_warn("WARNING: at %pS\n", caller);
> 
> Over the years I've had concurrent WARNs interleaved on the console.
> This duplicate information would allow untangling some of that.

Fair enough.

With patch #1 below:

 - Reintroduced CPU and PID

 - Added a '->comm[]' to the warning line: in practice it's often more 
   valuable than a PID...

 - Re-ordered the fields of information by value: higher value to lower 
   value.

Here's an overview of the output variants (-v3 is the latestest):

 -vanilla: WARNING: CPU: 0 PID: 0 at kernel/sched/core.c:8511 sched_init+0x20/0x410
 -v1:      WARNING: CPU: 0 PID: 0 at [ptr == 0 && 1] kernel/sched/core.c:8511 sched_init+0x20/0x410
 -v2:      WARNING: [ptr == 0 && 1] kernel/sched/core.c:8511 at sched_init+0x20/0x410
 -v3:      WARNING: [ptr == 0 && 1] kernel/sched/core.c:8511 at sched_init+0x20/0x410 CPU#0: swapper/0

I think I like -v3: a poor guy's single line trace entry in essence.

I suppose we'll have some worst-case situations with really complex 
conditions bloating the output when they trigger, but a quick git grep 
suggests that most WARN_ON_ONCE() instances are sane, in kernel/ at 
least.

Side note, found some WARN_ON_ONCE() weirdnesses:

  kernel/sched/syscalls.c:        WARN_ON_ONCE(sched_setscheduler_nocheck(p, SCHED_FIFO, &sp) != 0);
  kernel/sched/syscalls.c:        WARN_ON_ONCE(sched_setscheduler_nocheck(p, SCHED_FIFO, &sp) != 0);
  kernel/sched/syscalls.c:        WARN_ON_ONCE(sched_setattr_nocheck(p, &attr) != 0);

I don't think WARN_ON()s with complex side effects are considered 
kernel META these days, right? The pattern in patch #2 below is
longer, but less surprising, IMHO.

Thanks,

	Ingo

---
 kernel/panic.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/kernel/panic.c b/kernel/panic.c
index 01746e89a7a1..6478dd70ec6d 100644
--- a/kernel/panic.c
+++ b/kernel/panic.c
@@ -724,10 +724,15 @@ void __warn(const char *file, int line, void *caller, unsigned taint,
 
 	disable_trace_on_warning();
 
-	if (file)
-		pr_warn("WARNING: %s:%d at %pS\n", file, line, caller);
-	else
-		pr_warn("WARNING: at %pS\n", caller);
+	if (file) {
+		pr_warn("WARNING: %s:%d at %pS CPU#%d: %s/%d\n",
+			file, line, caller,
+			raw_smp_processor_id(), current->comm, current->pid);
+	} else {
+		pr_warn("WARNING: at %pS CPU#%d: %s/%d\n",
+			caller,
+			raw_smp_processor_id(), current->comm, current->pid);
+	}
 
 #pragma GCC diagnostic push
 #ifndef __clang__

 kernel/sched/syscalls.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/syscalls.c b/kernel/sched/syscalls.c
index c326de1344fb..1a91231d3ad8 100644
--- a/kernel/sched/syscalls.c
+++ b/kernel/sched/syscalls.c
@@ -846,7 +846,10 @@ int sched_setscheduler_nocheck(struct task_struct *p, int policy,
 void sched_set_fifo(struct task_struct *p)
 {
 	struct sched_param sp = { .sched_priority = MAX_RT_PRIO / 2 };
-	WARN_ON_ONCE(sched_setscheduler_nocheck(p, SCHED_FIFO, &sp) != 0);
+	int err;
+
+	err = sched_setscheduler_nocheck(p, SCHED_FIFO, &sp);
+	WARN_ON_ONCE(err);
 }
 EXPORT_SYMBOL_GPL(sched_set_fifo);
 
