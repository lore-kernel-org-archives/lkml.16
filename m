Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2711326B082
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 10:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744279863; cv=none; b=opdSq/NFN76C6FtdTrWqwzaMYkWWqekmlsHoflHMPTFaqHtJtTcWlb8D5q06lARQG/JTWSid4rUj2T0PpAkiOywYLmxn+StbITNPwIy0AGLxZOQW1oG8JqjxPwAJzGWUMpQd5UtRuhRpJWNaCuBV1rGl6+KE0ZFvGqed9sLCmcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744279863; c=relaxed/simple;
	bh=gwLU3oHBnP1CGzhlbfusqr3CH+aeXMeGuEnETOCoWmo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ECa6jvgHYrpi/gvjCmYrxgn3Af0wJN/hc3aOrMxq7vpfwkTy7tdnWGNC+0Q1Fmcaaptcb4JlKNpfl2cgMlJ8oHSK8RKJc6NcHV1w1Ar5cJTCx/j/hSND7RwASQhN1IBFnvVUIYwr5uspNhZYMC+QO2qVm1AtE9rUcc96SPHwMQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ooxeZtDS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ooxeZtDS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C9A5C4CEE9;
	Thu, 10 Apr 2025 10:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744279862;
	bh=gwLU3oHBnP1CGzhlbfusqr3CH+aeXMeGuEnETOCoWmo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ooxeZtDSeV2UDHKdI1eVyt1hI1GetuXBkaEVpmg0vaLLiEoJF6XDj+VRFDB0WLrRi
	 RcEo3GMlHqm/eJOUi6FPCGLsQbYKEXHQzDfh/3nU2xvZY4z4ICnWN34sParrvzrWYW
	 Ke1hWqkAmwZs2YPJSmSVuvu4KEkFMkjpAog3qdt09IB5hgMbT/GuyFBKled+yRopcD
	 oJMEDyKzd29EJYNDxOepDrQ3FQYu/8hxPnhzooGfla91uxqLhLWyrXvDLMO1zznduc
	 kyTbhTISND2j7yKP5Kvh3bT9+JywZEfZzTdiWciXAL6/Bes7f5Eo7xw5hkJYisxugx
	 OfZ7pvZiZZutQ==
Date: Thu, 10 Apr 2025 12:10:56 +0200
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
Subject: Re: [PATCH 4/8] x86/fpu: Remove the thread::fpu pointer
Message-ID: <Z_eZMN4PcOwFnskB@gmail.com>
References: <20250409211127.3544993-1-mingo@kernel.org>
 <20250409211127.3544993-5-mingo@kernel.org>
 <20250410073948.GT9833@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410073948.GT9833@noisy.programming.kicks-ass.net>


* Peter Zijlstra <peterz@infradead.org> wrote:

> On Wed, Apr 09, 2025 at 11:11:23PM +0200, Ingo Molnar wrote:
> 
> > diff --git a/arch/x86/include/asm/processor.h b/arch/x86/include/asm/processor.h
> > index 5ea7e5d2c4de..b7f7c9c83409 100644
> > --- a/arch/x86/include/asm/processor.h
> > +++ b/arch/x86/include/asm/processor.h
> > @@ -514,12 +514,9 @@ struct thread_struct {
> >  
> >  	struct thread_shstk	shstk;
> >  #endif
> > -
> > -	/* Floating point and extended processor state */
> > -	struct fpu		*fpu;
> >  };
> >  
> > -#define x86_task_fpu(task) ((task)->thread.fpu)
> > +#define x86_task_fpu(task)	((struct fpu *)((void *)(task) + sizeof(*(task))))
> 
> Doesn't our FPU state need to be cacheline aligned?

Yeah, and we do have a check for that:

+       BUILD_BUG_ON(sizeof(*dst) % SMP_CACHE_BYTES != 0);

And task_struct is allocated cache-aligned, which means when we do this 
in fpu_clone():

+       struct fpu *dst_fpu = (void *)dst + sizeof(*dst);

the FPU pointer is guaranteed to be cacheline aligned as well.

'dst' in that context is the new task_struct.

BTW., Oleg suggested in a previous discussion for us to replace the 
task->thread.fpu pointer with a build-time calculation - but I'm still 
not sure it's a good idea.

Thanks,

	Ingo
