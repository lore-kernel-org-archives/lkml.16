Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A289626AAB5
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 16:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746462860; cv=none; b=Cojxj1WWngzqn5gIkv1oGCucjPTgGi9Zpbzi7ODnYRf9YAbL8Hjm2ocQO0MehiOonXLxbbVojr7/GZEzVtWo2k3tOeov5OZUvidf4b6tjXR4DbPMdkl9UJaxht4xlBxiMcjQzFySP3mPIbWytB2eHf8ZXdoLxBSMbF6F8v/0CAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746462860; c=relaxed/simple;
	bh=CW770d+fDaAWrrz9w9a8CWzd2O84j7SkZzT4r0lCr0k=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WAEBZNGYOoQMAUwM3aKn55mEWsQmiIzTTkwkYdfTVLYYX7t9fJf6Rt2bLAhKeTUSO1UAtAUM0weOCw4Px8HCHq/3lINWMiI2wBoz3ATGsPCgsv5PedTJXa5q+jNlhTDQf33ryZj0bI1yWH9xzenBtC//yNC4sB+Qzk86wb6cbf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42BB4C4CEE4;
	Mon,  5 May 2025 16:34:18 +0000 (UTC)
Date: Mon, 5 May 2025 12:34:23 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Prakash Sangappa <prakash.sangappa@oracle.com>
Cc: Peter Zijlstra <peterz@infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "mathieu.desnoyers@efficios.com"
 <mathieu.desnoyers@efficios.com>, "tglx@linutronix.de"
 <tglx@linutronix.de>, "bigeasy@linutronix.de" <bigeasy@linutronix.de>,
 "kprateek.nayak@amd.com" <kprateek.nayak@amd.com>
Subject: Re: [PATCH V3 1/4] Sched: Scheduler time slice extension
Message-ID: <20250505123423.3494a18b@gandalf.local.home>
In-Reply-To: <4D9FC618-1BD6-4126-8B1D-96ECD497CA90@oracle.com>
References: <20250502015955.3146733-1-prakash.sangappa@oracle.com>
	<20250502015955.3146733-2-prakash.sangappa@oracle.com>
	<20250502090529.GU4198@noisy.programming.kicks-ass.net>
	<20250502090643.3809b6f5@batman.local.home>
	<C3F85063-68B5-4C6D-B95F-27B72DBFA178@oracle.com>
	<20250505104830.36f22a4d@gandalf.local.home>
	<4D9FC618-1BD6-4126-8B1D-96ECD497CA90@oracle.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 5 May 2025 15:58:12 +0000
Prakash Sangappa <prakash.sangappa@oracle.com> wrote:

> Yes the application would only call they system call to yield cpu, if the=
 extension is granted.=20
>=20
> The =E2=80=98RSEQ_CS_FLAG_DELAY_RESCHED=E2=80=99 bit in the =E2=80=98rseq=
=E2=80=99 structure  is cleared when the=20
> time extension is granted. This would indicate to the application that a =
time extension was
> granted. The application is expected to call the system call if this bit =
got cleared.
>=20
> However, It is possible that the thread gets rescheduled within the exten=
ded time window due=20
> to another wakeup or runtime expiry, which the user thread would not know=
 unless we add
> another bit to indicate it got rescheduled in the extended time. Also, if=
 the task=E2=80=99s critical section
> ran longer and the hrtick rescheduled the thread, the application would n=
ot know.
>=20
> Or we need to guarantee the thread will not get rescheduled in the extend=
ed time?
>=20
> I believe it would be same with your patch also.=20

So, my patch had a bit that got set when an extension happened.

Bit zero was set by the kernel.

Bits 1-31 was a counter (so that the code could nest).

On exiting the critical section a task would call something like:

static inline bool dec_extend(volatile unsigned *ptr)
{
	if (*ptr & ~1)
		asm volatile("subl %b1,%0"
				: "+m" (*(volatile char *)ptr)
				: "iq" (0x2)
				: "memory");

	return *ptr =3D=3D 1;
}

[..]
	if (dec_extend(&rseq_map->cr_counter)) {
		rseq_map->cr_counter =3D 0;
		yield();
	}

That is, the user space task would increment the counter by two when
entering a critical section and decrement it by two when exiting. If the
counter ends up as 1, then it not only is out of all nested critical
sections, it also knows it was extended and will schedule out.

My kernel patches would set the bit if it extended the time slice, but if
it then scheduled the task, it would clear it again. That way when the task
is scheduled back on the CPU it will not call yield() again.

-- Steve
