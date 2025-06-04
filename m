Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97FE7244676
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 14:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749048879; cv=none; b=c52MpRlVwqMr8eueiqkvChUFfbLsnOlAu1WVa/FZnreqTgXEHkE20L5B8Mkb6vBUMx+cwdSt0hHVgUnXA977roAvmQmxsUk/tctCqGH6706pFrYY19k6GTzHH3jYKqqlrVRb6ICtMd/kTlbr7HP/0hkwgGLojxpFPLpqoZSBocw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749048879; c=relaxed/simple;
	bh=sgeP8nwiGIpuBx+dgMdGkb+1cKr9369mNa9Bxpd/9KA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ntDji7G6aehHydNeGNd24oG4s7MEZDK9gM5wO9oZb9PjLyVfEsV2qfxENOD0gUSY0nCGbx4RmDkV1ABYDDMOskNEGAIb4kL4ZaWWWJZADYzAenUhTbaHZOsKRH5BLYV5pS1tEieMi8S9w8+kmcTDsz91xXCGaQNKD814svIWqxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=dcqkK06A; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=VJ7OWk5m; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="dcqkK06A";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="VJ7OWk5m"
Date: Wed, 4 Jun 2025 16:54:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749048875;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t+GklqgiXpfWwoTgD2+sv9pbUA69eJpokVhh8L8oICU=;
	b=dcqkK06A1rVjMD0wieSFSbduiVIO9omZirRP8PECZc4XneznS/0oswirwDRKoe+Q7LIt5A
	3b3j07U5MQaTKEZGgAkFLLtzDvD2239q3Y6l+LpTajAurIO7+hQGpSVdbg11g+iHA5h85Y
	I8iq+44oPnYmThtBERVjNnDvtF+Q9MSFKJBzWEtjg7spOEdMezTdZQnz0ylhRmP6wWvUxJ
	k/SvAdBRFA/u0x5VRfUeIDT60RMEh8Iq3yBTRvCoEuUNXzpMfHr4cs07bjyJOSez5yMG0b
	SfGTQncXCdT4uNyINoxhPFMLS7kpbiGHC6Q/OQraf5sVLlhLNhEo4M63QGmFdw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749048875;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t+GklqgiXpfWwoTgD2+sv9pbUA69eJpokVhh8L8oICU=;
	b=VJ7OWk5mBO5UiReza7CCbxlgGl1bLsJc7SEzhFIPete8XM3hEYkHvH9cMlNQZaLgn25F8F
	OfMMiFJmdC+SR8Cg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Prakash Sangappa <prakash.sangappa@oracle.com>,
	linux-kernel@vger.kernel.org, peterz@infradead.org,
	mathieu.desnoyers@efficios.com, tglx@linutronix.de,
	kprateek.nayak@amd.com, vineethr@linux.ibm.com
Subject: Re: [PATCH V5 1/6] Sched: Scheduler time slice extension
Message-ID: <20250604145433.KCPMF8zm@linutronix.de>
References: <20250603233654.1838967-1-prakash.sangappa@oracle.com>
 <20250603233654.1838967-2-prakash.sangappa@oracle.com>
 <20250604103106.1465f847@gandalf.local.home>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250604103106.1465f847@gandalf.local.home>

On 2025-06-04 10:31:06 [-0400], Steven Rostedt wrote:
> On Tue,  3 Jun 2025 23:36:49 +0000
> Prakash Sangappa <prakash.sangappa@oracle.com> wrote:
>=20
> > @@ -2249,6 +2251,20 @@ static inline bool owner_on_cpu(struct task_stru=
ct *owner)
> >  unsigned long sched_cpu_util(int cpu);
> >  #endif /* CONFIG_SMP */
> > =20
> > +#ifdef CONFIG_RSEQ
> > +
> > +extern bool rseq_delay_resched(void);
> > +extern void rseq_delay_resched_fini(void);
> > +extern void rseq_delay_resched_tick(void);
> > +
> > +#else
> > +
> > +static inline bool rseq_delay_resched(void) { return false; }
> > +static inline void rseq_delay_resched_fini(void) { }
> > +static inline void rseq_delay_resched_tick(void) { }
> > +
> > +#endif
> > +
>=20
> Can we add a config to make this optional. I don't want to allow any task
> to have an extended timeslice over RT tasks regardless of how small the
> delay is.

I asked to get RT tasks excluded from this extensions and it is ignored.
Maybe they were benefits mentioned somewhere=E2=80=A6

> -- Steve

Sebastian
