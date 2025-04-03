Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F68210FB
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 14:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743689621; cv=none; b=V8PKW04MhemzD5+1CrroAY2GY+QvZ8OZ4m2HiPX+71tLl81EqlrbuJsUPYHmDdL9ysfG/Vu5tYiBmjxjoeU/K03XLb+4ZgOrfylI/N35XvRi4DOwVRp3wKmxO8A2M1X5lrA3qsxssrKJmdwVOyUWz0KsXcNqJfbOMUolT3snbwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743689621; c=relaxed/simple;
	bh=gHhxqBxljXYX4c7qemwpJh4WVb2cArmJo9uV0JF9qnU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uj14eJXYi0/39If0WAKm0uhCBMWguc/j8bolLZnP8E5mwTihcg1sFSVUkPc6tesacgn9bIzmulvGjTGjjz/30wmGLojqS1ex0RMpFBq5rI6AspQYEH3gROfgAZquMJmBSKb0eZTJ1KvONfOnSOKWggqeGKzTAaybIe6UIseZbo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D+yMbUF4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D+yMbUF4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D727C4CEE3;
	Thu,  3 Apr 2025 14:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743689621;
	bh=gHhxqBxljXYX4c7qemwpJh4WVb2cArmJo9uV0JF9qnU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D+yMbUF48CaPQ/dmGnC6Qx3HmczFvNfHnyu/pKcbuPYko/xj3z0SlFylUWqU0fpNm
	 NrGBEWLRhQ4uuJVh2VcFDK7QshUU9nzaR4BZB/3yVX47Sil4s/GBJV11h2YoqZXJjv
	 SodHKSMxXlUHLwhkfiaDfknCoe3XBTK0pOG++7MQy//s6LliEcpF4n2rMkpXVPDt9L
	 +V2N6z5xZxoek3cAfWuIk2axToXioCp5yud5xe2GIhzp1QKzFQRTEV+jLT9gyhYTg0
	 OGA0PJzj2qLl/TqJ+FgnBwbN/ir4lVGpVhihn+4qYY0tZkIE7G4LG7+95GEYDDmSBf
	 OLp8frc/xiMxw==
Date: Thu, 3 Apr 2025 16:13:36 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Nikolay Borisov <nik.borisov@suse.com>
Cc: linux-kernel@vger.kernel.org, Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 37/49] x86/alternatives: Move text_poke_array completion
 from smp_text_poke_batch_finish() and smp_text_poke_batch_flush() to
 smp_text_poke_batch_process()
Message-ID: <Z-6XkEpiXg4stqLY@gmail.com>
References: <20250328132704.1901674-1-mingo@kernel.org>
 <20250328132704.1901674-38-mingo@kernel.org>
 <65e8ed9d-0fff-4f70-b095-8df52493ebec@suse.com>
 <Z-6PWWyopb86UC6y@gmail.com>
 <a64bc000-4226-4d5c-8486-a230f4ff5065@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a64bc000-4226-4d5c-8486-a230f4ff5065@suse.com>


* Nikolay Borisov <nik.borisov@suse.com> wrote:

> 
> 
> On 3.04.25 г. 16:38 ч., Ingo Molnar wrote:
> > 
> > * Nikolay Borisov <nik.borisov@suse.com> wrote:
> > 
> > > 
> > > 
> > > On 28.03.25 г. 15:26 ч., Ingo Molnar wrote:
> > > > Simplifies the code and improves code generation a bit:
> > > > 
> > > >      text	   data	    bss	    dec	    hex	filename
> > > >     14769	   1017	   4112	  19898	   4dba	alternative.o.before
> > > >     14742	   1017	   4112	  19871	   4d9f	alternative.o.after
> > > > 
> > > > Signed-off-by: Ingo Molnar <mingo@kernel.org>
> > > > ---
> > > >    arch/x86/kernel/alternative.c | 11 +++++------
> > > >    1 file changed, 5 insertions(+), 6 deletions(-)
> > > > 
> > > > diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
> > > > index 1df8fac6740d..5293929488f0 100644
> > > > --- a/arch/x86/kernel/alternative.c
> > > > +++ b/arch/x86/kernel/alternative.c
> > > > @@ -2750,6 +2750,9 @@ static void smp_text_poke_batch_process(void)
> > > >    		if (unlikely(!atomic_dec_and_test(refs)))
> > > >    			atomic_cond_read_acquire(refs, !VAL);
> > > >    	}
> > > > +
> > > > +	/* They are all completed: */
> > > > +	text_poke_array.nr_entries = 0;
> > > >    }
> > > >    static void __smp_text_poke_batch_add(void *addr, const void *opcode, size_t len, const void *emulate)
> > > > @@ -2857,20 +2860,16 @@ static bool text_poke_addr_ordered(void *addr)
> > > >    void smp_text_poke_batch_finish(void)
> > > >    {
> > > > -	if (text_poke_array.nr_entries) {
> > > > +	if (text_poke_array.nr_entries)
> > > >    		smp_text_poke_batch_process();
> > > > -		text_poke_array.nr_entries = 0;
> > > > -	}
> > > >    }
> > > 
> > > This function becomes trivial, why not simply move the check into
> > > smp_text_poke_batch_process and rename it to smp_text_poke_batch_finish ?
> > 
> > Yeah, that's pretty much what happens in patch #47:
> > 
> >    x86/alternatives: Remove 'smp_text_poke_batch_flush()'
> 
> Well, that patch removes poke_batch_flush but still retains
> poke_batch_finish + poke_batch_process. My suggestion is to eliminate
> poke_batch_process name and turn it into poke_batch_finish by moving the
> check from poke_batch_finish into poke_batch_process.

So, in the context of the full tree at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git WIP.x86/alternatives

Standalone smp_text_poke_batch_process() is still needed, because 
smp_text_poke_batch_add() uses it to drive the whole 'batching' 
machinery.

If smp_text_poke_batch_process() finishes for each call, if I 
understand your suggestion correctly, that reduces the amount of 
batching done, which is a disadvantage.

Note how right now it's possible to do something like this:

	smp_text_poke_batch_add(1);
	smp_text_poke_batch_add(1);
	smp_text_poke_batch_add(1);
	smp_text_poke_batch_add(1);
	smp_text_poke_batch_finish();

This results in a single call to smp_text_poke_batch_process(), with 4 
entries, a single 4-entry flush in essence.

Thanks,

	Ingo
