Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8037924167F
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 22:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744843495; cv=none; b=aw70GIAsMu3QTbQ/BFnIYa2jAiapaUQXsFFw/Pl4bsDZHtj0vhfzT2Aw7VsqXvatGYcypcpAUfq7GOgFkXdv6g/w1QLfEe6JMAUn+FrCJBeAe1mqwYTWe/nzyfI6I3rwlF/S4zatPuyuGLhnW779WWkpjyJ6dG3aqB8FZYvZ+U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744843495; c=relaxed/simple;
	bh=CRCbwclWEuMkmltCUIfq585m/tN0OI6YJ3cR36q4fTk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WrfXoEeO9WruFK/ssPJUrG7YYDkV3dxZ4uzhtVZaJvAbVCS1DCPcyfNSv8lZ+q6Oqid3g/Bq9ft/Smc+yKbY3ayvlja3FtenYdt6cuAhSvHTttMObSj2rBny/VWchJABwAchvgVjr21SnFubjKVazDtWEd9/yPs/G+FQN6p/tyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AmvkhNN8; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AmvkhNN8"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54954fa61c9so207138e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 15:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744843491; x=1745448291; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/SZ4X6HmPbkcgagZTVHKLhymfbHooZUoxc6csj9F4fY=;
        b=AmvkhNN8tkvQ39lZZh1CThiHwdgRS3nIPBuM04siAwFSLhrmSLeHQbe3VMpLzlYE/3
         P5kRPzem3iBleU+vaH7tKMPG0elD7FqP6nThl6wid6PX8LdrJqh7VVLjU3bC2fDBz6of
         NxCkV4lonXxFk6f7BBBBAcINbqZ0ChYzDDjTrmoXkMY9vvrdEbtpVkk7VFS7EJUGR6WW
         Z1qCuEsFgwBzvfZnqpNdw4wqAle/R0TuWWuM2/3VBfWbLqAfxSylTG7F1oaYqfQMZw52
         fK9uWsBh0mjpFDWlx5uhz0PqkKuikIfjRYaIyHH6J8KRFq11/iI6LmtwCuuXq5OG8VQ1
         ak3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744843491; x=1745448291;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/SZ4X6HmPbkcgagZTVHKLhymfbHooZUoxc6csj9F4fY=;
        b=H+hsRf68hd7xp8A8zyQxIarukTcRKRKXFY/QXN4EajX46HN/wEEQpmlUF4jF633ET4
         yKmsnynM/fQji/M9XuBzjyXZQ1qtL4n4zWEeCrQUS5PVP9U5lFb/g+I+Ksr8UHIk+zXl
         qdDgGg/opG1QCOllxUZYWYRx9Aj14b+7NdZG2mjOsI5vkcfAqXm/Ijn+aqU2oeXtTgjD
         GDBHlwQdqCflC3EvU0YupTkEgUi/li2QwYdFGuebmrmj4hRW7KGpEx5zgmWXHoojUgye
         GR/HaXoqRBbvDfwqp6BM6bDcwhaTyO57IkJRPFLQ8g6qz9FiK651cylBIdt+EYpTRjuf
         sJHA==
X-Gm-Message-State: AOJu0Yyw2SzEDCw0ceJ1XLrvRYSZhvp0d79XK/rRBce1zS3SusBQUI2k
	0XTUiEucaHJ7I97Ex5znoQSdP9C6S8kn5LmKgon1le64AlM0nnxAxHeKndG+OdMMpd0+oQ8ZVoS
	pJ7LX5qsqyVjXMPPa7Zz2T1xCAh3SzQGocYnxVdisl2hZ/MzYOscHkw==
X-Gm-Gg: ASbGnctP1TxBKU7VB8V+nMWQGhSpIN4jz0BU/JSbgoDctTl6nAiLnTNFZ1tGyBU92ED
	ZIlH1Z+bipt/DrssEIpEaX6oEVZ3Nxoy+igt0fq98D6WFyEvMoOwF2b8gG9DNnlsMQTtW/74ARh
	5LUmVLgUGSaclC3R8R7SlPikDFeHPMPl3welhMj4MROeKFiArrqf4=
X-Google-Smtp-Source: AGHT+IEqtDZ+oJANL/pBDeB3tJk2VG1IbTPbldfu2pTRlJ6hM7RmzMrjcB8GWPxvFsVNylcWxh+/+S/kpV7XZZyUziI=
X-Received: by 2002:a05:6512:10d5:b0:549:8675:c388 with SMTP id
 2adb3069b0e04-54d64af3fbbmr1198461e87.52.1744843491208; Wed, 16 Apr 2025
 15:44:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250412060258.3844594-1-jstultz@google.com> <20250412060258.3844594-4-jstultz@google.com>
 <Z_zQvuPOlMj3oM3z@jlelli-thinkpadt14gen4.remote.csb>
In-Reply-To: <Z_zQvuPOlMj3oM3z@jlelli-thinkpadt14gen4.remote.csb>
From: John Stultz <jstultz@google.com>
Date: Wed, 16 Apr 2025 15:44:39 -0700
X-Gm-Features: ATxdqUGf3aB8UaF2KEk5lV4q5BZXhRVyfJDXVMUV0bA3I1vAFK5V5JJgyfIddtE
Message-ID: <CANDhNCoj++FfLJLXAkPiROZFAj6EkvwHT7LrFK+r=oR5jmjzMQ@mail.gmail.com>
Subject: Re: [PATCH v16 3/7] locking/mutex: Add p->blocked_on wrappers for
 correctness checks
To: Juri Lelli <juri.lelli@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Valentin Schneider <valentin.schneider@arm.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Qais Yousef <qyousef@layalina.io>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Valentin Schneider <vschneid@redhat.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, 
	Zimuzo Ezeozue <zezeozue@google.com>, Mel Gorman <mgorman@suse.de>, Will Deacon <will@kernel.org>, 
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Metin Kaya <Metin.Kaya@arm.com>, 
	Xuewen Yan <xuewen.yan94@gmail.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Suleiman Souhlal <suleiman@google.com>, kernel-team@android.com, 
	"Connor O'Brien" <connoro@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 14, 2025 at 2:09=E2=80=AFAM Juri Lelli <juri.lelli@redhat.com> =
wrote:
> On 11/04/25 23:02, John Stultz wrote:
> > From: Valentin Schneider <valentin.schneider@arm.com>
> >
> > This lets us assert mutex::wait_lock is held whenever we access
> > p->blocked_on, as well as warn us for unexpected state changes.
> >
>
> ...
>
> > +static inline struct mutex *__get_task_blocked_on(struct task_struct *=
p)
> > +{
> > +     return READ_ONCE(p->blocked_on);
> > +}
> > +
>
> Shouldn't we check that wait_lock is held also when reading blocked_on?

Yeah, later in the series when I switch to the task->blocked lock we do:
https://github.com/johnstultz-work/linux-dev/blob/proxy-exec-v16-6.15-rc1/i=
nclude/linux/sched.h#L2267

I think the difficulty here is just we don't have the mutex pointer in
this context to assert lock->wait_lock is held.

I guess we could assume blocked_on is the right mutex and assert that
we hold that one if it is non-null.  I'll take a shot at that.

> And, if that's the case, why do we use READ_ONCE?

So, I was thinking this was because we pulled blocked_on in some
contexts without holding the lock and we wanted to avoid the compiler
rearranging things, but it's not used that way now, so I'll drop this.

Thanks for pointing this out!
-john
