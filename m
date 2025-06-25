Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4BA25F78A
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 12:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.38.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750854693; cv=none; b=rwB8uMNsxr4GMU/5heJAMJnZpfpuhctvev6r13efDjTxZAhiL8a7vZX1ZaM/LASrBsyoW3snXsSbsKI2tq6y3af4NKRPZmGGZb/6AB6CFzpCssZbtGlgORBNKrJc8QCy7qdasfqS0XL6oa6cHpkRzO3yplz57TrY1N0y0SQx+Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750854693; c=relaxed/simple;
	bh=nGFTrLM1x130MEmLW9Uo5hqoBt/joa/UbPRhWusf7dY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=auzdjiBu42BBqfm+1mrkxhywcH07x0w0RABeAqUASqNGfJKydp6GWxA8LjKs9b5BUBC6ePiD5rjWgRQFhF161bIQm46eVCMOumtrG9Vh0QCzOsIdy0DQgsvxXhN98Hjky+PkAVRdbkwIRXjyy8slmagAusZ1e6YX4xqobeBjFH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net; spf=pass smtp.mailfrom=sipsolutions.net; dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b=a7fCQE2H; arc=none smtp.client-ip=168.119.38.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="a7fCQE2H"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=mu+JBFMxFcmkWvemWRejcBfCpbK0S9r03CkeNyEZeTc=;
	t=1750854692; x=1752064292; b=a7fCQE2HTlaIXmHlF3RvkDEshiiZaqeCmMCGMXhQ8Qsc0nP
	nQBI/qfCSsrGhG536bTawfuIQNjku6UUB2RCjDGY0HdB0wDEQgdXwy2A7Wgnud5iZklDtoGSiphtS
	NPXfo55T8eeTDBfTbiXEMSAZjbxzuM7TUA6A+9vx4KEcDWVlozyV3gGX+9ib/8LxyFgM6wtwUhFAE
	o4IPFhlwkQ8WRF/62USMLvVkrgy5JVNrdO14k1M8SP329xzWuxyxSL+ULMs94aMLh6qluOXv07cwS
	SlSAy3Vy8vzU/nWFF3fos4PB7++dDwv3j3NnRHBk/61fK0G1plm3doa/GhKB/LgA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <benjamin@sipsolutions.net>)
	id 1uUPHh-00000009yMk-3tw7;
	Wed, 25 Jun 2025 14:31:26 +0200
Message-ID: <0e5eeb22a56e92ff377fcfb0cc0e768d71ed4ae9.camel@sipsolutions.net>
Subject: Re: [PATCH RFC] um: time: fix userspace detection during tick
 accounting
From: Benjamin Berg <benjamin@sipsolutions.net>
To: Thomas =?ISO-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>, 
 Richard Weinberger	 <richard@nod.at>, Anton Ivanov
 <anton.ivanov@cambridgegreys.com>, Johannes Berg	
 <johannes@sipsolutions.net>
Cc: linux-um@lists.infradead.org, linux-kernel@vger.kernel.org, Thomas Meyer
	 <thomas@m3y3r.de>, Anton Ivanov <aivanov@brocade.com>
Date: Wed, 25 Jun 2025 14:31:24 +0200
In-Reply-To: <20250617-uml-tick-timer-v1-1-01aab312f56b@linutronix.de>
References: <20250617-uml-tick-timer-v1-1-01aab312f56b@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-malware-bazaar: not-scanned

Hi,

On Tue, 2025-06-17 at 15:52 +0200, Thomas Wei=C3=9Fschuh wrote:
> The cpu usage timekeeping triggered by the tick credits passed time to
> either the kernel or the currently running userspace process.
> On UML, tick interrupts firing while userspace is running are not marked
> correctly so this bookkeeping is broken and always credits the idle task.
>=20
> The rootcause is the following callchain always passing user_tick=3Dfalse
> to account_process_tick():
>=20
> um_timer()
> =C2=A0 -> handle_irq_event()
> =C2=A0=C2=A0=C2=A0 -> tick_handle_periodic()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -> tick_periodic()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -> update_process_times(user_t=
ick=3Duser_mode(get_irq_regs()))
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -> account_process=
_tick(task, user_tick=3Dfalse)
>=20
> As a result CPUCLOCK_VIRT does not advance,
> breaking for example signal(SIGVTALRM).
>=20
> The issue can be reproduced easily with the selftest
> tools/testing/selftests/timers/posix_timers.c,
> which hangs in the ITIMER_VIRTUAL/SIGVTALRM testcase.
>=20
> Fix up the IRQ regs by correctly setting is_user in the IRQ registers.

So, in principle, this looks like the right thing.

What I am not sure about is accounting if the userspace task is
currently executing a syscall inside the kernel thread. The current
code will incorrectly interrupt the userspace process in that case and
you are now adding CPU time accounting on top of the same logic that is
already not quite right.

Said differently, need to think about it a bit more. I suspect we might
need to set/clear a flag in the userspace function for this.

Benjamin

>=20
> Fixes: 2eb5f31bc4ea ("um: Switch clocksource to hrtimers")
> Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
> ---
> I'm not familiar with UML, so this is probably not the right fix.
> Feel free to treat it as a bugreport instead.
> ---
> =C2=A0arch/um/kernel/time.c | 7 ++++++-
> =C2=A01 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/um/kernel/time.c b/arch/um/kernel/time.c
> index ae0fa2173778f43273fd0550f77fc99bbb1c3e3a..a6c17302403aeb3170a110411=
7c4e713e3afdfe0 100644
> --- a/arch/um/kernel/time.c
> +++ b/arch/um/kernel/time.c
> @@ -856,6 +856,7 @@ static struct clock_event_device timer_clockevent =3D=
 {
> =C2=A0
> =C2=A0static irqreturn_t um_timer(int irq, void *dev)
> =C2=A0{
> +	struct pt_regs *regs;
> =C2=A0	/*
> =C2=A0	 * Interrupt the (possibly) running userspace process, technically=
 this
> =C2=A0	 * should only happen if userspace is currently executing.
> @@ -864,9 +865,13 @@ static irqreturn_t um_timer(int irq, void *dev)
> =C2=A0	 */
> =C2=A0	if (time_travel_mode !=3D TT_MODE_INFCPU &&
> =C2=A0	=C2=A0=C2=A0=C2=A0 time_travel_mode !=3D TT_MODE_EXTERNAL &&
> -	=C2=A0=C2=A0=C2=A0 get_current()->mm)
> +	=C2=A0=C2=A0=C2=A0 get_current()->mm) {
> =C2=A0		os_alarm_process(get_current()->mm->context.id.pid);
> =C2=A0
> +		regs =3D get_irq_regs();
> +		regs->regs.is_user =3D true;
> +	}
> +
> =C2=A0	(*timer_clockevent.event_handler)(&timer_clockevent);
> =C2=A0
> =C2=A0	return IRQ_HANDLED;
>=20
> ---
> base-commit: 9afe652958c3ee88f24df1e4a97f298afce89407
> change-id: 20250617-uml-tick-timer-82ea89495cc6
>=20
> Best regards,

