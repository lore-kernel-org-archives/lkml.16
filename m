Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B539A22424C
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 10:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744282504; cv=none; b=Pt0HCiHbfbHlfhtlCSi0XAh+E7G8GQjm+0ihiXJqp82JZMqNNHEcWicXOJ9SQzeGgvSf/elBSeQVN7KUMHrekqn9YNRiCh5qmPkzZgGWdqNze537QUFRL3r4xnycmqoR7lEzLbzozGw9LX2kOZBUHgn+mhzi+wTZYxggy8GZdDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744282504; c=relaxed/simple;
	bh=IU/I3UNvLpdNB2ZIPExAFMurgfw5tJ/e6AnVepNdgW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MSP3cIIx7LXh9B30w1vIhXyy9P3RSQJ9wsFzSagVmr2Wm0XnfJh5mhpTWaecd4aa2lVhgXPOgVmVXuPht0G7i8ro+Z4FgPcPuNqHLHiXZneOd4rYDA3+uygbBXRCc1Is5ryn3PGmpbOza11QcZesUU7ENO3dQpRD+WgSx4MGP70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kk126twi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kk126twi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC13DC4CEDD;
	Thu, 10 Apr 2025 10:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744282504;
	bh=IU/I3UNvLpdNB2ZIPExAFMurgfw5tJ/e6AnVepNdgW8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kk126twilrRZOWaxe6Ra0Mb+OqjPRyZFAq/U/V3FMGE3UCk3VBn/3Cdrl/WCNGyaQ
	 ZMZsUI0kr1e+qLMBPZ3WjLKavhROIVwaxnPQ5Eiop+eGANYLEzUgaig/IowhbbUf9G
	 lL41HScMwvLdfUUn8BBlmByXT6kI4z5rMLEg1C+3oE5Tl0JCoyTM8maQsoXr4j7GM8
	 5YueqBxzIqPjAskNKv/08wwz6AOvH8ysNpzhmPJDyPKpTGR2yCycUSzI5tWDVlu7N+
	 soHLijEmb0h0sDJGR1QfBZmIHuoIO+jEO8QyGuRjeD7faUJuHiO8BBi1+J36rIJ9tY
	 OIQG/ZS469T0A==
Date: Thu, 10 Apr 2025 12:54:58 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, Andy Lutomirski <luto@amacapital.net>,
	Dave Hansen <dave@sr71.net>, Brian Gerst <brgerst@gmail.com>,
	Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Chang S . Bae" <chang.seok.bae@intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Fenghua Yu <fenghua.yu@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Uros Bizjak <ubizjak@gmail.com>
Subject: [PATCH] x86/fpu: Clarify FPU context cacheline alignment
Message-ID: <Z_ejggklB5-IWB5W@gmail.com>
References: <20250409211127.3544993-1-mingo@kernel.org>
 <20250409211127.3544993-5-mingo@kernel.org>
 <20250410073948.GT9833@noisy.programming.kicks-ass.net>
 <Z_eZMN4PcOwFnskB@gmail.com>
 <20250410103057.GE30687@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410103057.GE30687@noisy.programming.kicks-ass.net>


* Peter Zijlstra <peterz@infradead.org> wrote:

> On Thu, Apr 10, 2025 at 12:10:56PM +0200, Ingo Molnar wrote:
> > 
> > * Peter Zijlstra <peterz@infradead.org> wrote:
> > 
> > > On Wed, Apr 09, 2025 at 11:11:23PM +0200, Ingo Molnar wrote:
> > > 
> > > > diff --git a/arch/x86/include/asm/processor.h b/arch/x86/include/asm/processor.h
> > > > index 5ea7e5d2c4de..b7f7c9c83409 100644
> > > > --- a/arch/x86/include/asm/processor.h
> > > > +++ b/arch/x86/include/asm/processor.h
> > > > @@ -514,12 +514,9 @@ struct thread_struct {
> > > >  
> > > >  	struct thread_shstk	shstk;
> > > >  #endif
> > > > -
> > > > -	/* Floating point and extended processor state */
> > > > -	struct fpu		*fpu;
> > > >  };
> > > >  
> > > > -#define x86_task_fpu(task) ((task)->thread.fpu)
> > > > +#define x86_task_fpu(task)	((struct fpu *)((void *)(task) + sizeof(*(task))))
> > > 
> > > Doesn't our FPU state need to be cacheline aligned?
> > 
> > Yeah, and we do have a check for that:
> > 
> > +       BUILD_BUG_ON(sizeof(*dst) % SMP_CACHE_BYTES != 0);
> 
> Ah, missed that. Clearly I need to improve my reading skillz :-)

Admittedly it's written a bit obtusely - how about the patch below?

Thanks,

	Ingo

============================>
From: Ingo Molnar <mingo@kernel.org>
Date: Thu, 10 Apr 2025 12:52:16 +0200
Subject: [PATCH] x86/fpu: Clarify FPU context cacheline alignment

Suggested-by: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Fenghua Yu <fenghua.yu@intel.com>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Oleg Nesterov <oleg@redhat.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Uros Bizjak <ubizjak@gmail.com>
---
 arch/x86/kernel/fpu/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/fpu/core.c b/arch/x86/kernel/fpu/core.c
index d0a45f6492cb..3a19877a314e 100644
--- a/arch/x86/kernel/fpu/core.c
+++ b/arch/x86/kernel/fpu/core.c
@@ -607,7 +607,8 @@ int fpu_clone(struct task_struct *dst, unsigned long clone_flags, bool minimal,
 	 * We allocate the new FPU structure right after the end of the task struct.
 	 * task allocation size already took this into account.
 	 *
-	 * This is safe because task_struct size is a multiple of cacheline size.
+	 * This is safe because task_struct size is a multiple of cacheline size,
+	 * thus x86_task_fpu() will always be cacheline aligned as well.
 	 */
 	struct fpu *dst_fpu = (void *)dst + sizeof(*dst);
 
