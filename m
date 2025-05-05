Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9552701B1
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 14:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746456507; cv=none; b=sirQTVMAgkz83+ylYkvu10Z+4YAYn+bLDQiQrcdsz0RDv8QMr1vjz+T4tQcfiNCcV+hvq0QZFg/W3jwnxhF2F1hPTTLmsIqejrv9BHrFkij0V7m1HCMsr1CZ5LeWFq1NTZ1d0/kEORFf+FUF9mMuT472h4vJroUyjvqp6BDaIqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746456507; c=relaxed/simple;
	bh=ddNygQOAIU8bWfPaIhPNv582SP0aau5pz5XcxK1GgTY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DJjFBsg33VIinqni/gvHBYXfsIYWWVHcSwFZw32n3wyEgWE2vwoytotJh4tBFgDCqmYBTKqUsik7lQ4j1KLcGbNso/V0KSt7eFd0/V0tr2LRuSEUzuxHSBQ5yMq9cNlQvoALXQG9mZpZep2sSxdoCZT92mY3d4NPNJLTKBcnh1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3788C4CEE4;
	Mon,  5 May 2025 14:48:25 +0000 (UTC)
Date: Mon, 5 May 2025 10:48:30 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Prakash Sangappa <prakash.sangappa@oracle.com>
Cc: Peter Zijlstra <peterz@infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "mathieu.desnoyers@efficios.com"
 <mathieu.desnoyers@efficios.com>, "tglx@linutronix.de"
 <tglx@linutronix.de>, "bigeasy@linutronix.de" <bigeasy@linutronix.de>,
 "kprateek.nayak@amd.com" <kprateek.nayak@amd.com>
Subject: Re: [PATCH V3 1/4] Sched: Scheduler time slice extension
Message-ID: <20250505104830.36f22a4d@gandalf.local.home>
In-Reply-To: <C3F85063-68B5-4C6D-B95F-27B72DBFA178@oracle.com>
References: <20250502015955.3146733-1-prakash.sangappa@oracle.com>
	<20250502015955.3146733-2-prakash.sangappa@oracle.com>
	<20250502090529.GU4198@noisy.programming.kicks-ass.net>
	<20250502090643.3809b6f5@batman.local.home>
	<C3F85063-68B5-4C6D-B95F-27B72DBFA178@oracle.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 5 May 2025 01:51:39 +0000
Prakash Sangappa <prakash.sangappa@oracle.com> wrote:

> > I countered that this "optimization" would only affect those that use
> > the extended time slice and would not cause any issues with current
> > applications that depend on its current semantics. =20
>=20
> Still wouldn=E2=80=99t  that affect performance of the application using =
the extended time slice optimization?
> A sched_yield()  could end up in do_sched_yield(), if =E2=80=98shed_time_=
delay' is not set as the thread had been rescheduled.

So I haven't taken a deeper look at your patches, but the patches I had,
one bit was reserved to let the task know that it received an extended time
slice it should reschedule as soon as possible. The task should only call
the system call after releasing the critical section IFF the kernel
extended its time slice.

As it shouldn't have to do a system call if the kernel didn't extend it.
Otherwise what's the purpose of this feature if it is always doing system
calls after leaving the critical section.

-- Steve
