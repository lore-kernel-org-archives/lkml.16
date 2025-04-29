Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5628921ABD3
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 15:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745939261; cv=none; b=VkQGWMPtMmXrSSgy/q2Z62XWeVzXez/GwN1EWfr/sc0b2nEzvzf+khyjZeGmy3MBsvevsau+Q6XqTvfLeDO8U9iYyjUU+muIDCWLztcceFM6li0fJyCW9KoJIrpojj4txPA+fD6ZzZ8HSQ/YC30kwrWYiOp6aXTWdtHSrk68R1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745939261; c=relaxed/simple;
	bh=yWvLS+L1vwhGX/x64llCG0tlFfpZ48J1mGjHGuD7HgU=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=aMUDuITwzMJsvIMoViVPmSCzqXDN4MangzBnXtHjGVCDN++yycJ5cMnbjdLwc+bSclxJ1TMnTmT1NB9H7n6WBQF4nTkl6SKy7G3ZSxaYIw+3Zi2basHmQOd2x+fj1GfYVGcxRQUtDBJ/mE1R9eUBJDbISDsRy3wJbx/nkuEEAtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YxWm+WXq; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YxWm+WXq"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-af9564001cbso3693619a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 08:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745939259; x=1746544059; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/YTmetfmZSii2yQiCrQzYOAurMpZM7O82nYLhh7qEWA=;
        b=YxWm+WXqUJIaHkv6QhQS9tweIzopvjEW/obry5an50ZMhlTR80uF7y3SNz6uW/X07d
         45CxkA2z8CamIpOA/vn9Je2huOGu+Q9zgWORfU2G8+wWqq7UnYdXwYw4oBl8G7JgEP+i
         25Dy9AdIxM/yMcpiI4aJIppMVAGYb69Gh+mCYNKE/8C/75ie8Tht3PvdHAXn9f2QTYDO
         L76SSPuMJxDM81FOmvtz5Z6pKqMCtscuN6AsiNA8Kxbt57cQGy9pFLP1N0/UVbiBQ1mW
         1+e1o7I+MaMjpeeS/SbrtlzPGeRQStw43YU5B+beSaRNP7TycNcdpGHkxtjW7+346tnD
         w9Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745939259; x=1746544059;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/YTmetfmZSii2yQiCrQzYOAurMpZM7O82nYLhh7qEWA=;
        b=n23zIJX50lT3CzwsKbSrKSP11b62BCQXmVvuai0Z0wat4t8LwOA/GdwSf/utQb+3XZ
         OKfi/lTcT+Pp6/tZF7F5UUYagAheZ+T2093tRFw6nbkRzQPpMBWVFwAC49EdITansfZX
         4+Dmmoy9tDiYDuYWFAyA4VG4Z3frTDRUewCHZnWWpx97F/ByBXRYNjKabbq77/UCrarj
         oCAg+YxE3fZ6+ovWTR/Mvy7IKPl37U1q69Tz1OXQMTPxIQSlAGhsHuXYs9zQdC8ZzC/T
         m+zRqMYqXpmmS2h19rtVb3YyIfjiTBFyt4P7wcIN09doJ8s33cnWZ84/tBevBnxZ7PBY
         6lIw==
X-Gm-Message-State: AOJu0Yyg2jnV5n2whzC/Uz2UzS8sPIwiWUlHMXS/4+1cjnLTubsytGy1
	17QvCtB6t+66aud4lWuFV/Ztr0iRt6BLPIqE0NcVuklICaYCrV/UJAU89etw1m0Sictxkm2pR1A
	PaHqAdTERuRtQxYl9LWyrwi2H8SJwyDUr2G0B8V803bpVW+2lvhhx0lJ7eCRKiZ8dpzshn7xX+n
	hoOBVSPMFpN7cq3WImwwJiOCa3ySqN8unP9UUKcmY3jZc6
X-Google-Smtp-Source: AGHT+IFZOhJvojlvQHDx0AbPbHCighCjEuRE0mLrm8jLKFC4Cmo8aMpAvbaOIxxS7sQX73zFIE3gkA29CXjy
X-Received: from pgac2.prod.google.com ([2002:a05:6a02:2942:b0:af3:30b9:99a4])
 (user=jstultz job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:329f:b0:1fd:f4df:96ed
 with SMTP id adf61e73a8af0-2093e818762mr5666246637.26.1745939259424; Tue, 29
 Apr 2025 08:07:39 -0700 (PDT)
Date: Tue, 29 Apr 2025 08:07:26 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.901.g37484f566f-goog
Message-ID: <20250429150736.3778580-1-jstultz@google.com>
Subject: [PATCH v3] sched/core: Tweak wait_task_inactive() to force dequeue
 sched_delayed tasks
From: John Stultz <jstultz@google.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: John Stultz <jstultz@google.com>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, kernel-team@android.com, 
	peter-yc.chang@mediatek.com
Content-Type: text/plain; charset="UTF-8"

It was reported that in 6.12, smpboot_create_threads() was
taking much longer then in 6.6.

I narrowed down the call path to:
 smpboot_create_threads()
 -> kthread_create_on_cpu()
    -> kthread_bind()
       -> __kthread_bind_mask()
          ->wait_task_inactive()

Where in wait_task_inactive() we were regularly hitting the
queued case, which sets a 1 tick timeout, which when called
multiple times in a row, accumulates quickly into a long
delay.

I noticed disabling the DELAY_DEQUEUE sched feature recovered
the performance, and it seems the newly create tasks are usually
sched_delayed and left on the runqueue.

So in wait_task_inactive() when we see the task
p->se.sched_delayed, manually dequeue the sched_delayed task
with DEQUEUE_DELAYED, so we don't have to constantly wait a
tick.

This seems to work, but I've only lightly tested it, so I'd love
close review and feedback in case I've missed something in
wait_task_inactive(), or if there is a simpler alternative
approach.

NOTE: Peter did highlight[1] his general distaste for the
kthread_bind() through wait_task_inactive() functions, which
suggests a deeper rework might be better, but I'm not familiar
enough with all its users to have a sense of how that might be
done, and this fix seems to address the problem and be more
easily backported to 6.12-stable, so I wanted to submit it
again, as a potentially more short-term solution.

[1]: https://lore.kernel.org/lkml/20250422085628.GA14170@noisy.programming.kicks-ass.net/

Cc: Ingo Molnar <mingo@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Juri Lelli <juri.lelli@redhat.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Ben Segall <bsegall@google.com>
Cc: Mel Gorman <mgorman@suse.de>
Cc: Valentin Schneider <vschneid@redhat.com>
Cc: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: kernel-team@android.com
Fixes: 152e11f6df29 ("sched/fair: Implement delayed dequeue")
Reported-by: peter-yc.chang@mediatek.com
Tested-by: K Prateek Nayak <kprateek.nayak@amd.com>
Signed-off-by: John Stultz <jstultz@google.com>
---
v2:
* Rework & simplify the check as suggested by K Prateek Nayak
* Added Reported-by tag for proper attribution
v3:
* Add Fixed-by: and Tested-by tag suggested by Prateek
---
 kernel/sched/core.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index c81cf642dba05..b986cd2fb19b7 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -2283,6 +2283,12 @@ unsigned long wait_task_inactive(struct task_struct *p, unsigned int match_state
 		 * just go back and repeat.
 		 */
 		rq = task_rq_lock(p, &rf);
+		/*
+		 * If task is sched_delayed, force dequeue it, to avoid always
+		 * hitting the tick timeout in the queued case
+		 */
+		if (p->se.sched_delayed)
+			dequeue_task(rq, p, DEQUEUE_SLEEP | DEQUEUE_DELAYED);
 		trace_sched_wait_task(p);
 		running = task_on_cpu(rq, p);
 		queued = task_on_rq_queued(p);
-- 
2.49.0.901.g37484f566f-goog

