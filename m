Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B781362
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 02:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750990763; cv=none; b=eVi6VFnXn30i95nucq8QcrojepCOXpNNK/PUhKE6y5S7QXruN8vV9y+k7tjdKb+FrWToxPTPghr/pWSbIkNDdwG0NHSxLzF2Yw2ZCTNXNrlvG34aOgfLBX2UiS//ILSmPw8JeYl83u+0c5hM33N6L7jj0rT06Oa0jFQBX1LHTqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750990763; c=relaxed/simple;
	bh=8q6CJM/GFRlLq9Smxp01oFMgHVTi2ex5Wzz319Dh4eM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Nd7saBwURI2v/3LZMYQ+eCw4Z+gIDL9UsISGrHk09eIamSgRbsrgQoYzFR5DpV+k76nuBlh7oJR3slS5KB2WtvbPXBrtDmYuFwmIBXCnx+WyPX4/ghqcUt+qwOQWaSbBWqIEGSixx8WWD2J0A2CBsXurwV96Hkxa/Im7O0kPlUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=k4wYBXQ0; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="k4wYBXQ0"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-313154270bbso1953479a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 19:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750990761; x=1751595561; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZWwZXUo62mcX92TFX431sVQuGGLnxjqGO4qZhUCoR54=;
        b=k4wYBXQ0weAUwcfC+L1LUrQ9W3G9aYh7Y4bfx4ExV+RW1hl9ICTcVSphfqyxR50AzW
         sUib7aT/gIxglQhlnYy0N+w7KEwQ3TIVJGG9uee708PkO9fkKWw5NvGqAQV2m3/u1u6Y
         atn6N+7wDUjoDz6KmphsWx+xq+GExeOat7V2FHufRI9crcFGMWV9P7zOZhcc6w4jIZag
         CKGe90q41mNd64oDTKL5/zH6PoHMeuUPS7vGpaZEUtcj2UHMjX/pPSqDw24UGoQbI4wI
         qCCEkmiIOd3mL7EwWMInQXDjqly7LGfC/dEag+hiF6ChUUmcqcQepVKv1RGtqwF0lajG
         KT+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750990761; x=1751595561;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZWwZXUo62mcX92TFX431sVQuGGLnxjqGO4qZhUCoR54=;
        b=LARjrm/FF3UZmV9gpT7oz+1u3InjHMP6aqrxSUvzSwQMYFuByCt2sAX29AtlJZnc9W
         lfYZplIeLmZmnYraQXMSjtf+NqNF8Wt1BzF6EYesINBhDrmPzbRnlEZfws0T+7/unVYD
         Z9j9onaAsxPkB9+qI2/sRa2jvmOsK6/ANuOKh2dL+Qd9kcIG952GrAYgarUUcCeVAuF7
         DrVjnUT6nfC7WsQjGNzUH9eQ6OC1UNmrGMWdHiuiuMtOPatYGwdZ+a2i+MFOzMxyobLP
         PGZAhXB3zNR7hVA9n5C2U8fccyIo9v2rL7YL7BU7jdqsM9V7vRtFD5f1d0op7LyZ4c4g
         Drew==
X-Gm-Message-State: AOJu0YxbqPtW2tg7Uh5VlwwN8dFxBBa9ICTjUZ2hbrmOSbbXwGYArzVP
	5V7baoaL7vS820S/vY4vRaQgpRo4M2R75Y5UlrNQUFZ5zWL8df23ktcGC9XjfiLoZDa+yE2SSbo
	ztIkt6IgV
X-Gm-Gg: ASbGnct1VOkuYzQa0hfZlhrewDo/WYCOQC8LqLE5Fh6uG095boHkByx0gCNVp1mg2uY
	rg1k2xxI0N1hEU32fEXX9D7P3Epr46UajMRuWxaxQLrWyjrbsbLi56wbF9YFMveVQx+vmWjsBu1
	fZEMN72Rd8XVpmODJMGHR+WLyO9y0o8s9EJUhZZfb72DZRhKIJzrkymyvl1byx0fF5AhKTZz7I3
	fgmLl6IbPkOpVIAqkRKKbYXd75ALKPI3meTHpHq/6sYgEKCAhFj6GcuGDQtuT5ruqckH3WrJGmx
	7NV4Ap/Mbkwix1TmXD1bR7/d0LcBwUCHtj3zheT57tnRcPUbzOma5pZIRMsbZDDkrK0UAfMFEhs
	KsEHdMQTnSNSl+QwWE/wlA3bisn++P9OGa8pFms9BkQ7i0fMK
X-Google-Smtp-Source: AGHT+IG/s6ATLPSKxfmzWXxp3UkhyhFpRn9zyuTIyeOzxumVvJMn1cbO+0L/Fo75LsD0jPY+4+ZCXg==
X-Received: by 2002:a17:90b:278e:b0:311:ffe8:20e6 with SMTP id 98e67ed59e1d1-318c8ecd20cmr1903986a91.3.1750990760898;
        Thu, 26 Jun 2025 19:19:20 -0700 (PDT)
Received: from ynaffit-andsys.c.googlers.com (225.193.16.34.bc.googleusercontent.com. [34.16.193.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-318c1394288sm962304a91.2.2025.06.26.19.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 19:19:20 -0700 (PDT)
From: Tiffany Yang <ynaffit@google.com>
To: Tejun Heo <tj@kernel.org>
Cc: linux-kernel@vger.kernel.org,  cgroups@vger.kernel.org,
  kernel-team@android.com,  John Stultz <jstultz@google.com>,  Thomas
 Gleixner <tglx@linutronix.de>,  Stephen Boyd <sboyd@kernel.org>,
  Anna-Maria Behnsen <anna-maria@linutronix.de>,  Frederic Weisbecker
 <frederic@kernel.org>,  Johannes Weiner <hannes@cmpxchg.org>,  Michal
 =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>,  "Rafael J. Wysocki"
 <rafael@kernel.org>,
  Pavel Machek <pavel@kernel.org>,  Roman Gushchin
 <roman.gushchin@linux.dev>,  Chen Ridong <chenridong@huawei.com>,  Ingo
 Molnar <mingo@redhat.com>,  Peter Zijlstra <peterz@infradead.org>,  Juri
 Lelli <juri.lelli@redhat.com>,  Vincent Guittot
 <vincent.guittot@linaro.org>,  Dietmar Eggemann
 <dietmar.eggemann@arm.com>,  Steven Rostedt <rostedt@goodmis.org>,  Ben
 Segall <bsegall@google.com>,  Mel Gorman <mgorman@suse.de>,  Valentin
 Schneider <vschneid@redhat.com>
Subject: Re: [RFC PATCH] cgroup: Track time in cgroup v2 freezer
In-Reply-To: <aEDM_s7y8xMKJHph@slm.duckdns.org> (Tejun Heo's message of "Wed,
	4 Jun 2025 12:47:26 -1000")
References: <20250603224304.3198729-3-ynaffit@google.com>
	<aD9_V1rSqqESFekK@slm.duckdns.org>
	<dbx8y0u7i9e6.fsf@ynaffit-andsys.c.googlers.com>
	<aEDM_s7y8xMKJHph@slm.duckdns.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 26 Jun 2025 19:19:18 -0700
Message-ID: <dbx8y0tej595.fsf@ynaffit-andsys.c.googlers.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Tejun Heo <tj@kernel.org> writes:

> Hello, Tiffany.
>
> On Wed, Jun 04, 2025 at 07:39:29PM +0000, Tiffany Yang wrote:
> ...
>> Thanks for taking a look! In this case, I would argue that the value we
>> are accounting for (time that a task has not been able to run because it
>> is in the cgroup v2 frozen state) is task-specific and distinct from the
>> time that the cgroup it belongs to has been frozen.
>> 
>> A cgroup is not considered frozen until all of its members are frozen,
>> and if one task then leaves the frozen state, the entire cgroup is
>> considered no longer frozen, even if its other members stay in the
>> frozen state. Similarly, even if a task is migrated from one frozen
>> cgroup (A) to another frozen cgroup (B), the time cgroup B has been
>> frozen would not be representative of that task even though it is a
>> member.
>> 
>> There is also latency between when each task in a cgroup is marked as
>> to-be-frozen/unfrozen and when it actually enters the frozen state, so
>> each descendant task has a different frozen time. For watchdogs that
>> elapse on a per-task basis, a per-cgroup time-in-frozen value would
>> underreport the actual time each task spent unable to run. Tasks that
>> miss a deadline might incorrectly be considered misbehaving when the
>> time they spent suspended was not correctly accounted for.
>> 
>> Please let me know if that answers your question or if there's something
>> I'm missing. I agree that it would be cleaner/preferable to keep this
>> accounting under a cgroup-specific umbrella, so I hope there is some way
>> to get around these issues, but it doesn't look like cgroup fs has a
>> good way to keep task-specific stats at the moment.
>
> I'm not sure freezing/frozen distinction is that meaningful. If each cgroup
> tracks total durations for both states, most threads should be able to rely
> on freezing duration delta, right? There shouldn't be significant time gap
> between freezing starting and most threads being frozen although the cgroup
> may not reach full frozen state due to e.g. NFS and what not.
>
> As long as threads are not migrated across cgroups, it should be able to do
> something like:
>
> 1. Read /proc/self/cgroup to determine the current cgroup.
> 2. Read and remember freezing duration $CGRP/cgroup.stat.
> 3. Do time taking operation.
> 4. Read $CGRP/cgrp.stat and calculate delta and deduct that from time taken.
>
> Would that work?
>
> Thanks.

Hi Tejun,

Thank you for your feedback! You made a good observation that it's
really the duration delta that matters here. I looked at tracking the
time from when we set/clear a cgroup's CGRP_FREEZE flag and compared
that to the per-task measurements of its members. For large (1000+
thread) cgroups, the latency between when a cgroup starts freezing and
when a task near the tail end of its cset->tasks actually enters the
handler is fairly significant. On an x86 VM, I saw a difference of about
1 tick per hundred tasks (i.e., the 6000th task would have been frozen
for 60 ticks less than the duration reported by its cgroup). We'd expect
this latency to accumulate more slowly on bare metal, but it would still
grow linearly.

Fortunately, since this same latency is present when we
unfreeze a cgroup and each member task, it's effectively canceled out
when we look at the freezing duration for tasks in cgroups that are not
currently frozen. For a running task, the measurement of how long it had
spent frozen in the past was within 1-2 ticks of its cgroup's. Our use
case does not look at this accounting until after a task has become
unfrozen, so the per-cgroup values seem like a reasonable substitution
for our purposes!

That being said, I realized from Michal's reply that the tracked value
doesn't have to be as narrow as the cgroup v2 freezing time. Basically,
we just want to give userspace some measure of time that a task cannot
run when it expects to be running. It doesn't seem practical to give an
exact accounting, but maybe tracking the time that each task spends in
some combination of stopped or frozen would provide a useful estimate.

What do you think?

-- 
Tiffany Y. Yang
