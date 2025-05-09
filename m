Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454B223958A
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 16:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746809537; cv=none; b=KZx++Cp7pBav+Volidz6JgpLjunAMVxy5LDiuAA6P66KPxTDYsMjhJKbl8Mcik4g5wpL4XhkVd94J6YAHlbnDtsQiHvQr1dNLofmNKYi6PzbnYtgsQXd3mN73ng++l0I3imw4Y6GAjuUFjSnK1XioiZ9QCwL51JSJ1g8i4cjxq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746809537; c=relaxed/simple;
	bh=MPYhgm6iWVqeKJ5zbCg/gVgBRawAwkQ4rc6APfeAXl8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BaqPefAUPl3sdBJ5nm7bODgQNOfAXtejX4nYqVZi8v8BdcwDErEiZtG0UqjcP8D5S6DMYS3RTZynt6joDmLZsBeJg/+Qa+TXpgnaasfwoe5h/J1vF9tiq3d0bCgI2nrqLM2w6RLc8lkWwlqvzZvt2xwITLMmFL4HNTIrQThQNS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GhFFnxqp; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GhFFnxqp"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac6ed4ab410so338551766b.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 09:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746809533; x=1747414333; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MPYhgm6iWVqeKJ5zbCg/gVgBRawAwkQ4rc6APfeAXl8=;
        b=GhFFnxqpJA7XA/M7DImGvVQ0XcQGphxLWvfzgqjdBX+bVL8Io4KqEm+4Rjk5mYt67o
         JtWzFdu+2HOoFfHxbP0yGhLI8+iKyCEFdA5ac5GuSj6IFt3Hxxc23CvJnapYT/cJo3NP
         avTlY4DyiJHylTsmGV9Ne9yWC8Aq1+7ZgcOkemUucBXxHO3w1+I5hpHtq0ZwxAOIhZx+
         1dSz4Ne94uF9Q3qGrrKMUnSDJawizn/ZTGJ4HOx0QYgK6e+4n9Qrc4R90fC0qQUREyhI
         WsAQ5CEM7K9Wclny+dryuPS0zauj3NuyAmjLnEHshuhk4bD1nBfcT8sI6S5PWmuJi5Zp
         dCXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746809533; x=1747414333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MPYhgm6iWVqeKJ5zbCg/gVgBRawAwkQ4rc6APfeAXl8=;
        b=OuFHT2D6cjEG1cUoMvDGcu8MMZJGkNTBP4Y7+W6PlQ9Q1RmqBFZCn2S0P9uC8h//oo
         naAY5bNWdnzKu1ePitUOrOroarTyzvUIEOviky740B8uwC0nnc3/4pM0DdYurnBHiADL
         bbSvTWGRH4bSMh6E8kYHC49DysqHTBPwVmmJXZ2FPPZTk5v02MZrByan+BYT2MSD87KE
         zGfkQxY+HYDbIW/1GyRz7MbIAGzMM3P2ZdFanpqUg4p3/IyUx5x/B6uep34Rv24DjGKM
         D4MtoRWpC/6xG/7iKvymx8fbvgUXHreyJfQXh6dPwvlawO2O8lsSat9MuaUe86cPucgB
         ASxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKoQTH1Ng9L/B4Gc6e+NtQDMYJMnJtAlZO1FOCHvJc+BHPGmyWmLGjgOdn7J2yYXq60g+VFG+WO5Pb0fs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrGAkfgGk7xL6cS7na6KIk2e3qKFXV7d8j9q/YPcubkNhH4wxU
	r4LJc+H0S1GJgIx+TnQJ8TxMI2/cmAzxmNAy4hQrOLORJznGyoUZb3r8p6pkEKqY4fFfNyJy+2j
	U1daO8rDJOXS5SsL2OVCk86HfT/xZ935r+yXh
X-Gm-Gg: ASbGncv33B8EGoZYTYt/Gfmib47aVuCB3JaXvxtDRya8vYA9YO3HH9lJscb4J8Awq23
	BrW+aPmr2bIKwnnawrT4JvdHD73kS+pT9Hk369E4bXNy5/8UapKqz8apiYzajd+7RDkA7qVKNAk
	/8vfwnVrpKRsVvh7mp9HAtVhzzw/7mXDZGlhuEzxHtvJGan1HUzXEjD/BL
X-Google-Smtp-Source: AGHT+IGNmQDZ3Zs7DCjn3XA55T3gmgFTAE0YeeoKqQyv8kpQZk9x6BYPeAUbrAL1cDPCvsiyga6f3luTtHZOxuwBYJM=
X-Received: by 2002:a17:907:3e8d:b0:ad2:3555:f535 with SMTP id
 a640c23a62f3a-ad23555f608mr18764466b.5.1746809533397; Fri, 09 May 2025
 09:52:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506183533.1917459-1-xii@google.com> <aBqmmtST-_9oM9rF@slm.duckdns.org>
 <CAOBoifh4BY1f4B3EfDvqWCxNSV8zwmJPNoR3bLOA7YO11uGBCQ@mail.gmail.com>
 <aBtp98E9q37FLeMv@localhost.localdomain> <CAOBoifgp=oEC9SSgFC+4_fYgDgSH_Z_TMgwhOxxaNZmyD-ijig@mail.gmail.com>
 <aBuaN-xtOMs17ers@slm.duckdns.org> <CAOBoifiv2GCeeDjax8Famu7atgkGNV0ZxxG-cfgvC857-dniqA@mail.gmail.com>
 <aBv2AG-VbZ4gcWpi@pavilion.home> <CAOBoifhWNi-j6jbP6B9CofTrT+Kr6TCSYYPMv7SQdbY5s930og@mail.gmail.com>
 <b7aa4b10-1afb-476f-ac5d-d8db7151d866@redhat.com> <CAOBoifjzJ=-siSR=2=3FtKwajSgkXsL40XO2pox0XR4c8vvkzg@mail.gmail.com>
 <9fdad98e-9042-4781-9d73-19f00266711b@redhat.com>
In-Reply-To: <9fdad98e-9042-4781-9d73-19f00266711b@redhat.com>
From: Xi Wang <xii@google.com>
Date: Fri, 9 May 2025 09:52:01 -0700
X-Gm-Features: ATxdqUGQZI0u5dKFxPdPebOwNGcQTibf5jos_nhRRXIYthHWVUId2xtFCY7q4S8
Message-ID: <CAOBoifhXFKu-Y7ZtSBErEZTc+Zp_0-VY6o4A1KM5ii1uzN5iqQ@mail.gmail.com>
Subject: Re: [RFC/PATCH] sched: Support moving kthreads into cpuset cgroups
To: Waiman Long <llong@redhat.com>
Cc: Frederic Weisbecker <frederic@kernel.org>, Tejun Heo <tj@kernel.org>, linux-kernel@vger.kernel.org, 
	cgroups@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, 
	David Rientjes <rientjes@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Dan Carpenter <dan.carpenter@linaro.org>, Chen Yu <yu.c.chen@intel.com>, 
	Kees Cook <kees@kernel.org>, Yu-Chun Lin <eleanor15x@gmail.com>, 
	Thomas Gleixner <tglx@linutronix.de>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	jiangshanlai@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 8, 2025 at 5:30=E2=80=AFPM Waiman Long <llong@redhat.com> wrote=
:
>
> On 5/8/25 6:39 PM, Xi Wang wrote:
> > On Thu, May 8, 2025 at 12:35=E2=80=AFPM Waiman Long <llong@redhat.com> =
wrote:
> >> On 5/8/25 1:51 PM, Xi Wang wrote:
> >>> I think our problem spaces are different. Perhaps your problems are c=
loser to
> >>> hard real-time systems but our problems are about improving latency o=
f existing
> >>> systems while maintaining efficiency (max supported cpu util).
> >>>
> >>> For hard real-time systems we sometimes throw cores at the problem an=
d run no
> >>> more than one thread per cpu. But if we want efficiency we have to sh=
are cpus
> >>> with scheduling policies. Disconnecting the cpu scheduler with isolcp=
us results
> >>> in losing too much of the machine capacity. CPU scheduling is needed =
for both
> >>> kernel and userspace threads.
> >>>
> >>> For our use case we need to move kernel threads away from certain vcp=
u threads,
> >>> but other vcpu threads can share cpus with kernel threads. The ratio =
changes
> >>> from time to time. Permanently putting aside a few cpus results in a =
reduction
> >>> in machine capacity.
> >>>
> >>> The PF_NO_SETAFFINTIY case is already handled by the patch. These thr=
eads will
> >>> run in root cgroup with affinities just like before.
> >>>
> >>> The original justifications for the cpuset feature is here and the re=
asons are
> >>> still applicable:
> >>>
> >>> "The management of large computer systems, with many processors (CPUs=
), complex
> >>> memory cache hierarchies and multiple Memory Nodes having non-uniform=
 access
> >>> times (NUMA) presents additional challenges for the efficient schedul=
ing and
> >>> memory placement of processes."
> >>>
> >>> "But larger systems, which benefit more from careful processor and me=
mory
> >>> placement to reduce memory access times and contention.."
> >>>
> >>> "These subsets, or =E2=80=9Csoft partitions=E2=80=9D must be able to =
be dynamically adjusted, as
> >>> the job mix changes, without impacting other concurrently executing j=
obs."
> >>>
> >>> https://docs.kernel.org/admin-guide/cgroup-v1/cpusets.html
> >>>
> >>> -Xi
> >>>
> >> If you create a cpuset root partition, we are pushing some kthreads
> >> aways from CPUs dedicated to the newly created partition which has its
> >> own scheduling domain separate from the cgroup root. I do realize that
> >> the current way of excluding only per cpu kthreads isn't quite right. =
So
> >> I send out a new patch to extend to all the PF_NO_SETAFFINITY kthreads=
.
> >>
> >> So instead of putting kthreads into the dedicated cpuset, we still kee=
p
> >> them in the root cgroup. Instead we can create a separate cpuset
> >> partition to run the workload without interference from the background
> >> kthreads. Will that functionality suit your current need?
> >>
> >> Cheers,
> >> Longman
> >>
> > It's likely a major improvement over a fixed partition but maybe still =
not fully
> > flexible. I am not familiar with cpuset partitions but I wonder if the =
following
> > case can be supported:
> >
> > Starting from
> > 16 cpus
> > Root has cpu 0-3, 8-15
> > Job A has cpu 4-7 exclusive
> > Kernel threads cannot run on cpu 4-8 which is good.
> There will still be some kernel threads with PF_NO_SETAFFINITY flag set.
>
> >
> > Now adding best effort Job B, which is under SCHED_IDLE and rarely ente=
rs kernel
> > mode. As we expect C can be easily preempted we allow it to share cpus =
with A
> > and kernel threads to maximize throughput. Is there a layout that suppo=
rts the
> > requirements below?
> >
> > Job C threads on cpu 0-15
>
> A task/thread can only be in one cpuset. So it cannot span all the CPUs.
> However, if there are multiples threads within the process, some of the
> threads can be moved to a different cpuset as it is threaded. With
> proper thread setting, you can have a job with threads spanning all the
> CPUs.
>
> Cheers,
> Longman
>
> > Job A threads on cpu 4-7
> > No kernel threads on cpu 4-7
> >
> > -Xi
> >
>

Partitions cannot have overlapping cpus but regular cpusets can. This is
probably where regular cpusets are still more flexible.

-Xi
