Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE95A210FB
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 13:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743687518; cv=none; b=SvbW0uMXdmYHvfgZmsTI96aikXdmT6X1pPZayaupa+G+KWYFeDgG9gL6NmPIRgQFM2f157GcZf426E96lNejADu4BzIO0zQQk66Fl2FSkoxXmZ7ETixk4IDd9LUvAfRO2exUs7iKhhMjAPUFJn3XONaTxAyO0f+im1y3wLu2b9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743687518; c=relaxed/simple;
	bh=JHzdSFydC+uC4HWChPbdg50TrWmRki5mVoVrDRvdqR0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N/jz+xzxOvwZjmXx+Ea6qjf4lPmzGBuQxTcCr7YWAT1+rS+1LKZZYGLLnJKXWp/MWFM8UeQdGBSEEzt5cOnI9jv8mToUjj5Ae/o7BM8P9yNyfP13BkSrnLi7CserhaPuBsfM4thPvEazUIUw0QvIIrddPhhBCicEkY+SJM0+veU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s5bL3o32; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s5bL3o32"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 732FAC4CEE3;
	Thu,  3 Apr 2025 13:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743687518;
	bh=JHzdSFydC+uC4HWChPbdg50TrWmRki5mVoVrDRvdqR0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s5bL3o32urj0D80Hj3GYV3iVDHNPqpY7/S0CdlL7ofRBg0xCOIViYjRQInQMCprac
	 YyYfPE4NOMz6TEDMfLalYBz351UyfaX+IFgl9Pe5JsHR8A8HAcTLPn7dBIEZEJ1pJO
	 fFxsqmQesrkn90PMVsAi12hKwcR0olW27le0+4erM9gOC5n6lhqToJan2Bpnd8vOZN
	 LNekQIE7/CgeHiefApWeIvgm/LyTcB0E3ulCqSP9kN1pvVqE17AfBN3vN4+qVAaccY
	 vEAd/8UVlWHsBOUigykbJg6ovqODfMH7S8Lrd0xxn+XFvWZQL2XtqWSQbqau4zgS20
	 FEbi0LU34QOeA==
Date: Thu, 3 Apr 2025 15:38:33 +0200
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
Message-ID: <Z-6PWWyopb86UC6y@gmail.com>
References: <20250328132704.1901674-1-mingo@kernel.org>
 <20250328132704.1901674-38-mingo@kernel.org>
 <65e8ed9d-0fff-4f70-b095-8df52493ebec@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <65e8ed9d-0fff-4f70-b095-8df52493ebec@suse.com>


* Nikolay Borisov <nik.borisov@suse.com> wrote:

> 
> 
> On 28.03.25 г. 15:26 ч., Ingo Molnar wrote:
> > Simplifies the code and improves code generation a bit:
> > 
> >     text	   data	    bss	    dec	    hex	filename
> >    14769	   1017	   4112	  19898	   4dba	alternative.o.before
> >    14742	   1017	   4112	  19871	   4d9f	alternative.o.after
> > 
> > Signed-off-by: Ingo Molnar <mingo@kernel.org>
> > ---
> >   arch/x86/kernel/alternative.c | 11 +++++------
> >   1 file changed, 5 insertions(+), 6 deletions(-)
> > 
> > diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
> > index 1df8fac6740d..5293929488f0 100644
> > --- a/arch/x86/kernel/alternative.c
> > +++ b/arch/x86/kernel/alternative.c
> > @@ -2750,6 +2750,9 @@ static void smp_text_poke_batch_process(void)
> >   		if (unlikely(!atomic_dec_and_test(refs)))
> >   			atomic_cond_read_acquire(refs, !VAL);
> >   	}
> > +
> > +	/* They are all completed: */
> > +	text_poke_array.nr_entries = 0;
> >   }
> >   static void __smp_text_poke_batch_add(void *addr, const void *opcode, size_t len, const void *emulate)
> > @@ -2857,20 +2860,16 @@ static bool text_poke_addr_ordered(void *addr)
> >   void smp_text_poke_batch_finish(void)
> >   {
> > -	if (text_poke_array.nr_entries) {
> > +	if (text_poke_array.nr_entries)
> >   		smp_text_poke_batch_process();
> > -		text_poke_array.nr_entries = 0;
> > -	}
> >   }
> 
> This function becomes trivial, why not simply move the check into
> smp_text_poke_batch_process and rename it to smp_text_poke_batch_finish ?

Yeah, that's pretty much what happens in patch #47:

  x86/alternatives: Remove 'smp_text_poke_batch_flush()'

Thanks,

	Ingo
