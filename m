Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227A31EBA1C
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 16:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738253685; cv=none; b=Rk0ZzQ6J7hIVtP0+2k9adcU7itKJIn9QXFiQF1ImIq9DMp0fYAhGCbRuzfsip/GYpI41A/kImV6i0moIc7f0tu2KDNKspxccInd7A1Segm/cLDqrkGKq6YRaOqac0ScSQDkG800ueasP1VdZoyEKDe7YyiQqtde6Ejdv0xb1GXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738253685; c=relaxed/simple;
	bh=tmIeveDmnQObobDvSiz0vbXJE9o9XIlvL+oQ3Ns0A4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bHLnIMATiozFjhBIF9nKcVFw3WSznaLBBYCs+d+AlUGI1QuIukw0N8hnsnzGgjYnQK3eMcHnRmF2uKTO67/ZyWkYaS3vo1qEvv2FX3OcYcQx4dNuc0f2jtDkt7vDCVMoMqBdZmrAwn5RahxHEMq6D5J2zWqVj6MZjRRcXRpu348=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=vokXiv+Q; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Sbd3hR5z; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="vokXiv+Q";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Sbd3hR5z"
Date: Thu, 30 Jan 2025 17:14:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738253675;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G103NOQeZO/912gTHo3Zy0BEdDJk2aj90MmEXGhW0e8=;
	b=vokXiv+Qero0Rw6XoOZ5PQv5Ds69EnaKyVnQmxhy5z98ZOQkWakFs+ElSCtLWXt9AbMqn2
	EfQlMYSTHTdUbRnlkdKvWcasKF8PxH2Gw19m1dVpiPyWi3pHZDJBg0fSN74cpG/gnl1mkn
	uAMb7rd1vPy2UlgCxWLC8/XReEaWFr3JPCjlY3BKnHOjV/TxrLs8vH+U24cvF4SJ90v18i
	eMzX3Qc97xxT4+4M+ipsz/ATpKkIi9VubcXg+CP2nEGiCKAJe5X4ySEZJ4oMfvgEIkf5yq
	ho2ZnXukbtVm1EhgFAL8kGGQqFxZPin36wuzpc6ANLWyVY+jALI39UpVv+KChQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738253675;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G103NOQeZO/912gTHo3Zy0BEdDJk2aj90MmEXGhW0e8=;
	b=Sbd3hR5zIRle69ykBJHqG1efMwrCscnRsXxPPGdHIIpyozfmXeF1XCVuYdWjokvWOII68N
	Xt3udXXG5B9wMGDA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Shrikanth Hegde <sshegde@linux.ibm.com>, mpe@ellerman.id.au,
	maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
	npiggin@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/1] powerpc: Enable dynamic preemption
Message-ID: <20250130161434.0PELHkzk@linutronix.de>
References: <20250106051919.55020-1-sshegde@linux.ibm.com>
 <20250106051919.55020-2-sshegde@linux.ibm.com>
 <20250130145409.D_so_mR1@linutronix.de>
 <05f6f732-e155-4b60-8c4e-984e42e51ee4@csgroup.eu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <05f6f732-e155-4b60-8c4e-984e42e51ee4@csgroup.eu>

On 2025-01-30 16:03:09 [+0100], Christophe Leroy wrote:
> Le 30/01/2025 =C3=A0 15:54, Sebastian Andrzej Siewior a =C3=A9crit=C2=A0:
> > On 2025-01-06 10:49:19 [+0530], Shrikanth Hegde wrote:
> > > --- a/arch/powerpc/kernel/interrupt.c
> > > +++ b/arch/powerpc/kernel/interrupt.c
> > > @@ -25,6 +25,10 @@
> > >   unsigned long global_dbcr0[NR_CPUS];
> > >   #endif
> > > +#if defined(CONFIG_PREEMPT_DYNAMIC) && defined(CONFIG_HAVE_PREEMPT_D=
YNAMIC_KEY)
> > > +DEFINE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
> > > +#endif
> >=20
> > I am uncertain here: Do you need to DEFINE it? It is set by the sched
> > core which also defines it. It should be same thing after all, right?
>=20
> As far as I can see it is not handled by sched core.

=E2=80=A6
> It is in common entry but arm64 and powerpc don't use common entry.

Okay. So it is defined in the generic part (so you have to define it on
power) but it is used by sched-core (search for
	preempt_dynamic_enable(irqentry_exit_cond_resched);
).
It might make sense to define it there (in the sched part where it is
used) but this is out of scope here, it just confused me :)
Thanks for the pointer.

> Christophe

Sebastian
