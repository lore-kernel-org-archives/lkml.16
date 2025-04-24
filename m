Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0BB28F524
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 18:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745519895; cv=none; b=kSZ9QiDyE8UD1RsN8+wWmhTpWKoxrrG0nThDaFX6XhzGKZsGDC+zaLUrApAVebpwGyRO9WyPSudPCWev33aylGiUAHKfLY7v9NsZ97fynicJ1iiNUAqoDSJwP4aOhUJuRo+K1HvOBt9j5dpCg987LUnbmaHs0eViI4toyQN9aFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745519895; c=relaxed/simple;
	bh=hbhB7k26xhi9tiQov2VH5gi/TrTWG2bCnazLNQYTq0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XIXJPHqOCvxrg3QOnxuWVFy0Vk2zk40gtN7SEraEzZR4oQ/5O9VBmXpKHHhbKu/ZyH3G5JdJ9CNe2+2dOdetggdcOzNelK+DXUbWXtm0MgjMOH+NHMQwyaTYgizLMZbLWu2PfyYEPgz2nZdHtd97fFGFpnoFVv1BrQoPo6NjhVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=zYJFuCxb; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=fhLL9E/v; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="zYJFuCxb";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="fhLL9E/v"
Date: Thu, 24 Apr 2025 20:38:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745519892;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4M5zx9ouUAG+r9bw1dUE0AO5CXj+NR6UunbImKwlF5s=;
	b=zYJFuCxbxeTcaDuqb4dIQrjuI9azMAaKnwSPPF4c9D+lFOCiKEN3ASs9ZSes8Aw7+KntYD
	EC41x1j5TPJIZxIxyIIiS7HHqT6p2pnzFWBRL0rvfAwWHb/PwSlU3TWGTO9FQE40m4tVJI
	n8bEZlx3Wzmb/f9fFEUX5tOmlVrePlDM/mLIsjDeaztoY7YwCvt836cPwM4jDgYV1p7waS
	RmpvIXTk0/QlE2F1fRhHkAmdm7lvaYULa+APDjHkq1fNNdnZm1xSJ/ZT138Er9HTKeDx7z
	VbyFzAPPj0dWdbD+G9tLzK6NJ5I6Lv98a2Oihr5sJKQiDWlhi9zEmhIVOEEXxA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745519892;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4M5zx9ouUAG+r9bw1dUE0AO5CXj+NR6UunbImKwlF5s=;
	b=fhLL9E/v4wtVCytpxlE9X1iPCCtM7ki7HsY72WaRZBO90WZQT6wttVoN0s4mwxz5CVHYiA
	kEVR83i9ft3NhTAw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
	christophe.leroy@csgroup.eu, gautam@linux.ibm.com,
	vaibhav@linux.ibm.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] powerpc: kvm: use generic transfer to guest mode work
Message-ID: <20250424183811.7_MLThpt@linutronix.de>
References: <20250421102837.78515-1-sshegde@linux.ibm.com>
 <20250421102837.78515-2-sshegde@linux.ibm.com>
 <20250424144215._ooDjDz9@linutronix.de>
 <365ba747-9311-45ab-b798-80ba4e578796@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <365ba747-9311-45ab-b798-80ba4e578796@linux.ibm.com>

On 2025-04-24 21:27:59 [+0530], Shrikanth Hegde wrote:
> > > diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_h=
v.c
> > > index 19f4d298d..123539642 100644
> > > --- a/arch/powerpc/kvm/book3s_hv.c
> > > +++ b/arch/powerpc/kvm/book3s_hv.c
> > > @@ -4901,7 +4901,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu=
, u64 time_limit,
> > >   	}
> > >   	if (need_resched())
> > > -		cond_resched();
> > > +		schedule();
> >=20
>=20
>=20
> > This looks unrelated and odd. I don't why but this should be a
> > cond_resched() so it can be optimized away on PREEMPT kernels.
>=20
> This is needed, otherwise KVM on powerVM setup gets stuck on preempt=3Dfu=
ll/lazy.

But this makes no sense. On preempt=3Dfull the cond_resched() gets patched
out while schedule() doesn't. Okay, this explains the stuck.

On preempt=3Dfull need_resched() should not return true because the
preemption happens right away. Unless you are in a preempt-disabled
or interrupt disabled section. But any of the conditions can't be true
because in both cases you can't invoke schedule(). So you must have had
a wake up on the local CPU which sets need-resched but the schedule()
was delayed for some reason. Once that need-resched bit is observed by
a remote CPU then it won't send an interrupt for a scheduling request
because it should happen any time soon=E2=80=A6 This should be fixed.

If you replace the above with preempt_disable(); preempt_enable() then it
should also work=E2=80=A6

=E2=80=A6
> > > --- a/arch/powerpc/kvm/powerpc.c
> > > +++ b/arch/powerpc/kvm/powerpc.c
> > > @@ -34,6 +34,7 @@
> > >   #endif
> > >   #include <asm/ultravisor.h>
> > >   #include <asm/setup.h>
> > > +#include <linux/entry-kvm.h>
> > >   #include "timing.h"
> > >   #include "../mm/mmu_decl.h"
> > > @@ -80,24 +81,17 @@ int kvmppc_prepare_to_enter(struct kvm_vcpu *vcpu)
> > >   {
> > >   	int r;
> > > +	/* use generic framework to handle need resched and signals */
> > > +	if (__xfer_to_guest_mode_work_pending()) {
> > > +		r =3D xfer_to_guest_mode_handle_work(vcpu);
> >=20
> > there is nothing special you do checking and handling the work. Couldn't
> > you invoke xfer_to_guest_mode_handle_work() unconditionally?
> >=20
>=20
> I followed what was in arch/x86/kvm/x86.c. Since xfer_to_guest_mode_handl=
e_work does the same check
> it makes sense to call it without checks too.

Yeah but I guess x86 did some other updates, too.

> Will update in v2.
>=20
=E2=80=A6
> > > -
> > > -		if (signal_pending(current)) {
> > > -			kvmppc_account_exit(vcpu, SIGNAL_EXITS);
> > > -			vcpu->run->exit_reason =3D KVM_EXIT_INTR;
> > > -			r =3D -EINTR;
> > > -			break;
> >=20
> > I don't how this works but couldn't SIGNAL_EXITS vanish now that it
> > isn't updated anymore? The stat itself moves in kvm_handle_signal_exit()
> > to a different counter so it is not lost. The reader just needs to look
> > somewhere else for it.
>=20
> ok. thanks for pointing out.
>=20
> AFAIU it is updating the stats mostly. But below could keep the stats hap=
py.
> I will update that in v2.
>=20
>         if (__xfer_to_guest_mode_work_pending()) {
>                 r =3D xfer_to_guest_mode_handle_work(vcpu);
> +               /* generic framework doesn't update ppc specific stats*/
> +               if (r =3D=3D -EINTR)
> +                       kvmppc_account_exit(vcpu, SIGNAL_EXITS);
>                 if (r)
>                         return r;

Either that or you rip it out entirely but that is not my call.

Sebastian
