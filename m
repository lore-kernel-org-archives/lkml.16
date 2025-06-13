Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9301E13B284
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 19:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749842748; cv=none; b=P7/JvRKTJEFCUphJFHPoCbcGu7ngxTmCJgqA81H3smpELthdD8LSmggjtmEcB73Gox4wimFPx/6d5I1Y86ySvTgR94z7QkJAOsg7pgIKY/8Usy47NqPE92PTQZJvDXLy7DdAAx8mfsdh0f1cE7kfevJIToIe5YW7fKDSCPTRavc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749842748; c=relaxed/simple;
	bh=J3ZXjatFumfwQ+MysXOpcgXm/QalkeLFVT4KolmYqTY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Nuz/jDOALGBAZ+G5U+YRRxPKbjtroLIYe4Z4Dw7dTA7RoqbmLuj8jSufNTF3gmTgQ2j+QG+diWTlTzPkg/JNiIK3/wPB5LPeA0fEtB+pJ6XZPtXZB/VrsBdzPDzP7/Ba+aJHUJ8ydjpIA2CqBspAv728ZtKFmlkr8hz12hIWI0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ZSbyNm7R; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=WijLb2Z6; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ZSbyNm7R";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="WijLb2Z6"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749842744;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fkP3PDsNSOWMMuIXn3icFd1CY/1KXGrja6OrkwqMzHQ=;
	b=ZSbyNm7RRQac9du7kTXc7LJN57PK5cM6d7kb3FLmOH4XEWuc5BtE1LQfTbdMA8Zgkgjnar
	XPdwY2fNI8VJwWBld/9gKjVfZlffXC4Iie+gA2j57ZeWK7K/xgRuCVCDAU6gSqvCOy3Iem
	k880OOyO8Kvp6l2vk0O2ytxGDv7FGJVUQXHquDI2zbmX7Beo+yd48mpqcBzCdmLtcAblI0
	uxazGg2MAd4Z7nx9FaTntg2Ji7WkuD78nuqgR26ctlRO1OlRntfB72S5T20UU3VYqhnOE1
	EXoJKuZxlnxMdOgq35TDm9CEtxuOVf3nDqJeAd2cA+NPY9OjriH/s86Z7dXdIg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749842744;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fkP3PDsNSOWMMuIXn3icFd1CY/1KXGrja6OrkwqMzHQ=;
	b=WijLb2Z6s1/q75OA19N3LAefBc6CcZJ1oOJnK5HyG9RIa/dl7VGbpP14wIGi03JQNGCQ2G
	notQQd8V/zMDqqBQ==
To: Oleg Nesterov <oleg@redhat.com>, =?utf-8?Q?Beno=C3=AEt?= Sevens
 <bsevens@google.com>,
 Frederic Weisbecker <frederic@kernel.org>
Cc: Zander Work <zdw@google.com>, security@kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] posix-cpu-timers: fix race between
 handle_posix_cpu_timers() and posix_cpu_timer_del()
In-Reply-To: <20250613172650.GA26022@redhat.com>
References: <CAGCho0V0x_Y2+vg5G8-r45Xc6uftLbZK5K1=vpavd_4783fogQ@mail.gmail.com>
 <20250613172650.GA26022@redhat.com>
Date: Fri, 13 Jun 2025 21:25:43 +0200
Message-ID: <87msabphoo.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 13 2025 at 19:26, Oleg Nesterov wrote:
> If an exiting non-autoreaping task has already passed exit_notify() and
> calls handle_posix_cpu_timers() from IRQ, it can be reaped by its parent
> or debugger right after unlock_task_sighand().
>
> If a concurrent posix_cpu_timer_del() runs at that moment, it won't be
> able to detect timer->it.cpu.firing !=3D 0: cpu_timer_task_rcu() and/or
> lock_task_sighand() will fail.
>
> Add the tsk->exit_state check into run_posix_cpu_timers() to fix this.
>
> This fix is not needed if CONFIG_POSIX_CPU_TIMERS_TASK_WORK=3Dy, because
> exit_task_work() is called before exit_notify(). But the check still
> makes sense, task_work_add(&tsk->posix_cputimers_work.work) will fail
> anyway in this case.
>
> Cc: stable@vger.kernel.org
> Reported-by: Beno=C3=AEt Sevens <bsevens@google.com>
> Fixes: 0bdd2ed4138e ("sched: run_posix_cpu_timers: Don't check ->exit_sta=
te, use lock_task_sighand()")
> Signed-off-by: Oleg Nesterov <oleg@redhat.com>

Reviewed-by: Thomas Gleixner <tglx@linutronix.de>

Linus, I assume you take it directly or do you want me to play the
intermediary?

Thanks,

        tglx
