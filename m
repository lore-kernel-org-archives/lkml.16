Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9D1237160
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 16:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738859260; cv=none; b=Qj9xxymkhuE/ymyvcC6YjDT1HGeu8+se6AzM16Y1RpXaClU79IZpEVwHV5/tfuT2HbgaA0e4sTIBhb1Rxa18vmUmaHRGk7cSuwwl9jt74WDxL9f0P1GgewXQTpx0pEETlmoOO4+Bi0QKdgk5HhFgzkzTEnlLJc4NUKzFvkxOzD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738859260; c=relaxed/simple;
	bh=/30hunRctV+muvIrepXV2jV/mLIA4bbEtMlX67pDZKc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nRSlAtjzT5iiTwCOKLDVQzYdQTi//er4LZgCANYN3BtbGE/CdJSTbUYaS8HYLDwDQDz7UArMjvZ70kdfVdDqOV9/Xnyb5RIhs35UKaz3z6B2AMv26ZOaicYJIdr65oobfcQ4T24KMea4RsuqIq5+D51Ts4CeJRmSl2v9ss0zxRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sx5Res9x; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sx5Res9x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54DE2C4CEDD;
	Thu,  6 Feb 2025 16:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738859259;
	bh=/30hunRctV+muvIrepXV2jV/mLIA4bbEtMlX67pDZKc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sx5Res9xjqRFux1VsLBPpCczacP1fVS1mdNdMLDMtdLBPO6aMg4cUmtCCqwm3v/Ys
	 RsTkjlwLx9r9AOBBt7QMGD+9z+d/nRbncpBJH9uIfg79CUHe8qgy2a0UWKU2LNRzdN
	 5bmMusOnk+s8uWscCtOZXCmQZpmc9Mu23ceaBtujNMiDLbWpFmfgiskk/0vKJTTwy4
	 b0qJ15vci1zVOf3jSsYHQ5ns32LF1YHuXPayxrOPMxU3tFQokVd6JVi5iOjnM8gwmX
	 7InOEvseOljkFYEv1I5zCRgbzfoPVGqqhr4auFFJXsQ49J0huovFk7MvYRED31+V5v
	 O6N660Q0FFVpw==
Date: Thu, 6 Feb 2025 17:27:36 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Mateusz Guzik <mjguzik@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] exit: change the release_task() paths to call
 flush_sigqueue() lockless
Message-ID: <Z6Ti-AoQC6EQzPWO@localhost.localdomain>
References: <20250206152244.GA14609@redhat.com>
 <20250206152314.GA14620@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250206152314.GA14620@redhat.com>

Le Thu, Feb 06, 2025 at 04:23:14PM +0100, Oleg Nesterov a écrit :
> A task can block a signal, accumulate up to RLIMIT_SIGPENDING sigqueues,
> and exit. In this case __exit_signal()->flush_sigqueue() called with irqs
> disabled can trigger a hard lockup, see
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
> 
> TODO:
> 	- we can probably shift posix_cpu_timers_exit() as well

Hmm, can't a timer be concurrently deleted between __exit_signal() set
tsk->sighand = NULL and release sighand lock, and the actual call to
posix_cpu_timer_exit() ? And then posix_cpu_timer_exit() calls timerqueue_del()
on a node that don't exist anymore?

That would even trigger the warning in posix_cpu_timer_del().

> 	- do_sigaction() can hit the similar problem
> 
> Signed-off-by: Oleg Nesterov <oleg@redhat.com>

Reviewed-by: Frederic Weisbecker <frederic@kernel.org>
