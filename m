Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4159222A1C5
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 13:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745587896; cv=none; b=iJ0Phy31tbbWr0OY6VBgqvwnbmzP4rJpasUMk2DRzA+yvLsNmbfXFHirzynjlUihmakTiWnD3eBxWrMdwZ6rwJ0KDBCp2Is6ZYABxVklrCVw8OaKCOFfoiibsiunfmKDZJ0f3Qg7MY0lT1VPZo1e9ZaQjR+gScWiF9LzqB/OU5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745587896; c=relaxed/simple;
	bh=0fmDWMUe5tQquTBn1XbYU0KLvWwXIUVP6pNJIR/mQSM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OCx+eVokVYm9GlrbktOXZi9H8LI35+q61HHKjT76j8U0R0ZLufdpsyQ2pzjsB3s5ebQXRhTx2UqhKGU447BNklKwwc3Eu5yheSTOoMW1/c14xsVSqcPnSKN/g0C4wMq9qcY7txc4xvJVVxTcAw1FvxHMCFA+9nbY+qPnJOfcZho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=NbrJ58cQ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=M3uDObKF; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="NbrJ58cQ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="M3uDObKF"
Date: Fri, 25 Apr 2025 15:31:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745587892;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=djfFPUnOt5o5/K/Hxm87135eBcbaPqNQQBh2lVeaSNc=;
	b=NbrJ58cQQLxXBxZtAXQe+0leM/OhjC7mHW8Q6Fun3qTXFaeuG2CKR161yMy4wpc4h3RfQi
	g5o/RQfSg71p32NL3qGFc+4TdwcAU21CMoOOn8FqeMIYCxl77P8qlO5aANA59mLuuEfHDB
	eWhP0GDSwOqIF2pmoJNqvZb2bL6IoW4Y6v8o6GoXXwK7gk3v78LD9316Me35ZTcs6NGLbp
	QLRYwuGkE4KD8JgDeLhCzMffGtDUIoyHxERltw6I7HINzowzQ3Akwus0dkD7LN8ZSV138K
	+sZkzS25dwZaENmXKMAXGoBC80mT8UMekbc9tAsKbCQztZp9j1LmzFNct79f6Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745587892;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=djfFPUnOt5o5/K/Hxm87135eBcbaPqNQQBh2lVeaSNc=;
	b=M3uDObKFOzxgMvD4Ccg/EIEXg+NEN+pYyyvPdzNbKq2UCYS8t2y5jdWSue//HRtzaIq07G
	00U/v3RpfBKzeoBQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: npiggin@gmail.com, vaibhav@linux.ibm.com, maddy@linux.ibm.com,
	linuxppc-dev@lists.ozlabs.org, christophe.leroy@csgroup.eu,
	gautam@linux.ibm.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] powerpc: kvm: use generic transfer to guest mode work
Message-ID: <20250425133131.DTvWJE29@linutronix.de>
References: <20250421102837.78515-1-sshegde@linux.ibm.com>
 <20250421102837.78515-2-sshegde@linux.ibm.com>
 <20250424144215._ooDjDz9@linutronix.de>
 <365ba747-9311-45ab-b798-80ba4e578796@linux.ibm.com>
 <20250424183811.7_MLThpt@linutronix.de>
 <2891b989-6249-4e84-969e-f11af3f92b0b@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2891b989-6249-4e84-969e-f11af3f92b0b@linux.ibm.com>

On 2025-04-25 16:49:19 [+0530], Shrikanth Hegde wrote:
> On 4/25/25 00:08, Sebastian Andrzej Siewior wrote:
> > On 2025-04-24 21:27:59 [+0530], Shrikanth Hegde wrote:
> > > > > diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> > > > > index 19f4d298d..123539642 100644
> > > > > --- a/arch/powerpc/kvm/book3s_hv.c
> > > > > +++ b/arch/powerpc/kvm/book3s_hv.c
> > > > > @@ -4901,7 +4901,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
> > > > >    	}
> > > > >    	if (need_resched())
> > > > > -		cond_resched();
> > > > > +		schedule();
> > > > 
> > > 
> > > 
> > > > This looks unrelated and odd. I don't why but this should be a
> > > > cond_resched() so it can be optimized away on PREEMPT kernels.
> > > 
> > > This is needed, otherwise KVM on powerVM setup gets stuck on preempt=full/lazy.
> > 
> > But this makes no sense. On preempt=full the cond_resched() gets patched
> > out while schedule() doesn't. Okay, this explains the stuck.
> 
> cond_resched works. What you said is right about schedule and preemption models.
> Initially I had some other code changes and they were causing it get stuck. i retested it.

so it is unrelated then ;)

> But looking at the semantics of usage of xfer_to_guest_mode_work
> I think using schedule is probably right over here.
> Correct me if i got it all wrong.

No, if you do xfer_to_guest_mode_work() then it will invoke schedule()
when appropriate. It just the thing in kvmhv_run_single_vcpu() looks odd
and might have been duct tape or an accident and could probably be
removed.

> on x86:
> kvm_arch_vcpu_ioctl_run
> 	vcpu_run
> 		for () {
> 			.. run guest..
> 			xfer_to_guest_mode_handle_work
> 				schedule
> 		}
> 
> 
> on Powerpc:  ( taking book3s_hv flavour):
> kvm_arch_vcpu_ioctl_run
> kvmppc_vcpu_run_hv  *1
> 	do while() {
> 		kvmhv_run_single_vcpu or kvmppc_run_vcpu
> 			-- checking for need_resched and signals and bails out *2
> 	}
>
> 
> *1 - checks for need resched and signals before entering guest
I don't see the need_resched() check here.

> *2 - checks for need resched and signals while running the guest
> 
> 
> This patch is addressing only *1 but it needs to address *2 as well using generic framework.
> I think it is doable for books3s_hv atleast. (though might need rewrite)
> 
> __kvmppc_vcpu_run is a block box to me yet. I think it first makes sense
> to move it C and then try use the xfer_to_guest_mode_handle_work.
> nick, vaibhav, any idea on __kvmppc_vcpu_run on how is it handling signal pending, and need_resched.
> 
> 
> So this is going to need more work specially on *2 and doing that is also key for preempt=lazy/full to work
> for kvm on powepc. will try to figure out.

Okay.

Sebastian
