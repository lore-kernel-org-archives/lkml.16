Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515D71F4167
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 15:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738857439; cv=none; b=lgJkzd+N/30nv/OIJ7i3FA/TSKHXXkpMC5O4aPn1mfpWhZil035y4IMMyYjfSypb914BnTL0yR+afV8wPWLc6BnLxnANHa0fqRa2+wAw5LcKaJmUhPPVVK67b0KVNudiixU1m2uYjQCn2UncAMU1ak2ibDRRucPgwfymoKXS2cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738857439; c=relaxed/simple;
	bh=YPajX8nCSGBf9V3ZHzKYAKLOs6k0s/iLE39cDtTE8ps=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tuh08yXp2Hn/cdvgRoKZAsB1cQSryOvrns843WfjLv9ti04k1XSlDAOFlTFy7gdV5HKBL3ppiyqfmqmYyA54/ZaI2+oHXb7554gId0s1Jm51JQoAqEJEcmib7erILaLRDGps+61DUNA6iE0O3dTQjprOyoieHbdBEeCmEBJ0h3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=0f/MBqbm; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=bBbHxIFp; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="0f/MBqbm";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="bBbHxIFp"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738857435;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WUS7QF01PtNB4guceIDp7iQ+gnX/+AoTYNyE9Ac7D+I=;
	b=0f/MBqbmP8RRmChU3RbOqwshp/q2IcLpcybaKtjCSn4kXaDk2rnfIp4OEuGhE0LGTqF1Fp
	+b5lqHHT18TVnB8/e9AFrFFcLIE+bQshW0N835VQD8FE+aug643oP62zgxZ3DzsvqQi5pA
	7Cil1Szad9ly9GMRTKJK/pf6pFn5l4QA5L03s5s871skmR2gPpOLZJGptqNeFqN/6bD+NX
	K9uKXnLUuGR7xMbTK+eZxhncJ+dUOevGkbxXx33arbnFsJlBsl9lG8b6X4kUUM3zJD7JkX
	HENUPlIMdXfv32fZ8K+Lmn8+f/iKJFgLcKtEPB+5WFVpPq0zaLAuhdyYg2Io/A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738857435;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WUS7QF01PtNB4guceIDp7iQ+gnX/+AoTYNyE9Ac7D+I=;
	b=bBbHxIFplOoyqtZfRGVOxqCW8IAN3UnFSbYR6mGDGS7azBQjYulf8HAYtQmmtsVS8BuZsj
	2hJYMnEXHiW/m+Bg==
To: Oleg Nesterov <oleg@redhat.com>, Andrew Morton
 <akpm@linux-foundation.org>, "Eric W. Biederman" <ebiederm@xmission.com>,
 Frederic Weisbecker <frederic@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>
Cc: Mateusz Guzik <mjguzik@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] exit: change the release_task() paths to call
 flush_sigqueue() lockless
In-Reply-To: <20250205175159.GA8714@redhat.com>
References: <20250205175136.GA8702@redhat.com>
 <20250205175159.GA8714@redhat.com>
Date: Thu, 06 Feb 2025 16:57:14 +0100
Message-ID: <874j17nk11.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Feb 05 2025 at 18:51, Oleg Nesterov wrote:
> A task can block a signal, accumulate up to RLIMIT_SIGPENDING sigqueues,
> and exit. In this case __exit_signal()->flush_sigqueue() called with irqs
> disabled can triger a hard lockup, see
> https://lore.kernel.org/all/20190322114917.GC28876@redhat.com/
>
> Fortunately, after the recent posixtimer changes sys_timer_delete() paths
> no longer try to clear SIGQUEUE_PREALLOC and/or free tmr->sigq, and after
> the exiting task passes __exit_signal() lock_task_sighand() can't succeed
> and pid_task(tmr->it_pid) will return NULL.
>
> This means that after __exit_signal(tsk) nobody can play with tsk->pending
> or (if group_dead) with tsk->signal->shared_pending, so release_task() can
> safely call flush_sigqueue() after write_unlock_irq(&tasklist_lock).

I can't find a problem with that.

> Also, kill clear_tsk_thread_flag(TIF_SIGPENDING), it was never needed.

I'm not entirely sure about that, but it does not hurt to clear it,
right?

> TODO:
> 	- we can probably shift posix_cpu_timers_exit() as well

I think so.

> 	- do_sigaction() can hit the similar problem

Indeed, but that's a tough on to solve.

Thanks,

        tglx
