Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720E71C5F13
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 03:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746589454; cv=none; b=CV6/oXBsy3MomaVLgmwYl4xMAgAR2wtnT06Pcrkep4WeiN5hBOjRUq102pkp3HLAK6dnl/KnEqVjGm3n00mIlhCNhoXwRmxZgICuWzZ2jNyPBKDEsSsalBAgGI4M0wgFal3w/R47mnXmbVvEq+vzGuLogk6HuVzlFgUrkVq8MrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746589454; c=relaxed/simple;
	bh=ZuyvyGJRgOf6b34z52aP6GoJUzazlvD+31gfs6Y7pHc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I+r694folnVrrzI3HeQlFvjfr6GHENA1OJZIik5bhixvNCtGtQYOIfjDIE1YIsku59RVQBr2+HO7w2zyJwf/634EwXJp1UKcZpHUOOMRSaGjTMgXlLzm2DrucNRdPutsZuqpeV/eEPQqveMM38Sbnvvt79XfHCnSDhJQHWLqgPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qbKWJtoA; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qbKWJtoA"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ad1e8e2ad6bso96828366b.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 20:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746589451; x=1747194251; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZuyvyGJRgOf6b34z52aP6GoJUzazlvD+31gfs6Y7pHc=;
        b=qbKWJtoAejErecmHFe7rbthznhxoENtBJHUhVPWRXURmzq7Nbg1M45J3Ag2jI5z8kK
         QFLKPkUC7OMkDsCHubrLsb9LMhMS2w2XXnTFRjJoOztCCpEwAW12RP4M4A5d5l292L0u
         RsvX4Is5ru36DZALikJwghI+rYEtKMpsHU98Z6tnGdSIYaOCxJCO2Da4cNT3EqULqMHQ
         thBgHTDRocoH8H3y4UP+nTAypFrVoQjkK0fxeBkWAf8vCufdBlx74zsibguw9Q3vTSpv
         JPw0ndT/qcCe/w6DuNzQA2vPa4Wc5WkzNnogH4MvYDeg2mE4SClngfP00C4dw1gJ0GBI
         FOJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746589451; x=1747194251;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZuyvyGJRgOf6b34z52aP6GoJUzazlvD+31gfs6Y7pHc=;
        b=DfNxqRqepbXyYbTaSeNuuDNg+4Il0BfxZEn7VJYzdOHKNKnGe6nmnf29cYg1j3/Yt3
         xmitwnAq50HgMri/dYKp3aAo5g0ejdxoB8UfWqC36oEfVRwj/pm7fSmU6by2qrCs0oz6
         sDVeEswmxofbABkuQFVmprqrF4Vxkn63HJ7fdWQSrakd7GYoOlyecdPxqyBzQSYf0eFp
         uGa/0/1b21gtn1jz+B2IAhBGDELMyZzCTqKqUQ2VVvZmWtNW7Wmh9dZdCkW03xka6ubE
         wnr7WhnGxA8kUaPZ8zPFe51KUJKboxppHwK6cOLyX/ASvgr1mk+MwaLk074tRBnyKIM0
         ux7w==
X-Gm-Message-State: AOJu0YwViSCUX17OBiBxMijJairVDT4ghwQyOkitMKruhfRTf2/+ArRG
	cZEZH2Bjn3mzAGNfI+GeIGyTMEPqHUR2GqlGA963KOWf8otQuli2iQUchle3Ahu3pbXlwbTKMOS
	8QF3etgatPU9poa/I2UpTrErjdPvtjTB2iDH3
X-Gm-Gg: ASbGncuBVEldjlD1ge3/7dCzO6VO3VzmcOZKnMSHIl/KAWpLCJmSDwDgDJOhpFtOr7m
	U82I2QuYpmdmtGoBV6F07l0ZU1xARf/XvMJoZ5is005KvtBE8RjBfYVuoSHA2YKMYLZsKEfZcX/
	GLT9XtdJz8HfXzLwbQRjIJNzbYlaBzs30kOP7/EFcfPlFznx6H8Dz6xgrEfj5gGA+luA==
X-Google-Smtp-Source: AGHT+IH7IGKTEFhC4cr8+0rRXEHJu2nDGTsN/0//XY9q17g/0aaFrfhBXbLnWK9RCYRx9yAZA3AgFcdYqMmUhKmXe28=
X-Received: by 2002:a17:907:1c0b:b0:acb:5c83:251 with SMTP id
 a640c23a62f3a-ad1e8e2b9demr175785266b.53.1746589450585; Tue, 06 May 2025
 20:44:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506183533.1917459-1-xii@google.com> <aBqmmtST-_9oM9rF@slm.duckdns.org>
In-Reply-To: <aBqmmtST-_9oM9rF@slm.duckdns.org>
From: Xi Wang <xii@google.com>
Date: Tue, 6 May 2025 20:43:57 -0700
X-Gm-Features: ATxdqUHUz2sResNmX2xSRB_WefjQNHw4KWqWeezZNZ8hfP4zrd-J_xJY7gN2DcY
Message-ID: <CAOBoifh4BY1f4B3EfDvqWCxNSV8zwmJPNoR3bLOA7YO11uGBCQ@mail.gmail.com>
Subject: Re: [RFC/PATCH] sched: Support moving kthreads into cpuset cgroups
To: Tejun Heo <tj@kernel.org>
Cc: linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, David Rientjes <rientjes@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, Waiman Long <longman@redhat.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Lai Jiangshan <jiangshanlai@gmail.com1>, Frederic Weisbecker <frederic@kernel.org>, 
	Vlastimil Babka <vbabka@suse.cz>, Dan Carpenter <dan.carpenter@linaro.org>, Chen Yu <yu.c.chen@intel.com>, 
	Kees Cook <kees@kernel.org>, Yu-Chun Lin <eleanor15x@gmail.com>, 
	Thomas Gleixner <tglx@linutronix.de>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 6, 2025 at 5:17=E2=80=AFPM Tejun Heo <tj@kernel.org> wrote:
>
> Hello,
>
> On Tue, May 06, 2025 at 11:35:32AM -0700, Xi Wang wrote:
> > In theory we should be able to manage kernel tasks with cpuset
> > cgroups just like user tasks, would be a flexible way to limit
> > interferences to real-time and other sensitive workloads. This is
> > however not supported today: When setting cpu affinity for kthreads,
> > kernel code uses a simpler control path that directly lead to
> > __set_cpus_allowed_ptr or __ktread_bind_mask. Neither honors cpuset
> > restrictions.
> >
> > This patch adds cpuset support for kernel tasks by merging userspace
> > and kernel cpu affinity control paths and applying the same
> > restrictions to kthreads.
> >
> > The PF_NO_SETAFFINITY flag is still supported for tasks that have to
> > run with certain cpu affinities. Kernel ensures kthreads with this
> > flag have their affinities locked and they stay in the root cpuset:
> >
> > If userspace moves kthreadd out of the root cpuset (see example
> > below), a newly forked kthread will be in a non root cgroup as well.
> > If PF_NO_SETAFFINITY is detected for the kthread, it will move itself
> > into the root cpuset before the threadfn is called. This does depend
> > on the kthread create -> kthread bind -> wake up sequence.
>
> Can you describe the use cases in detail? This is not in line with the
> overall direction. e.g. We're making cpuset work with housekeeping mechan=
ism
> and tell workqueue which CPUs can be used for unbound execution and kthre=
ads
> which are closely tied to userspace activities are spawned into the same
> cgroups as the user thread and subject to usual resource control.
>
> There are a lot of risks in subjecting arbitrary kthreads to all cgroup
> resource controls and just allowing cpuset doesn't seem like a great idea=
.
> Integration through housekeeping makes a lot more sense to me. Note that
> even for just cpuset thread level control doesn't really work that well. =
All
> kthreads are forked by kthreadd. If you move the kthreadd into a cgroup, =
all
> kthreads includling kworkers for all workqueues will be spawned there. Th=
e
> granularity of control isn't much better than going through housekeeping.

For the use cases, there are two major requirements at the moment:

Dynamic cpu affinity based isolation: CPUs running latency sensitive thread=
s
(vcpu threads) can change over time. We'd like to configure kernel thread
affinity at run time too. Changing cpu affinity at run time requires cpumas=
k
calculations and thread migrations. Sharing cpuset code would be nice.

Support numa based memory daemon affinity: We'd like to restrict kernel mem=
ory
daemons but maintain their numa affinity at the same time. cgroup hierarchi=
es
can be helpful, e.g. create kernel, kernel/node0 and kernel/node1 and move =
the
daemons to the right cgroup.

Workqueue coverage is optional. kworker threads can use their separate
mechanisms too.

Since the goal is isolation, we'd like to restrict as many kthreads as poss=
ible,
even the ones that don't directly interact with user applications.

The kthreadd case is handled - a new kthread can be forked inside a non roo=
t
cgroup, but based on flags it can move itself to the root cgroup before thr=
eadfn
is called.

-Xi
