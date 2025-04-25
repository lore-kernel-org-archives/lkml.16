Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB70C1A5B92
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 19:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745611083; cv=none; b=QgcTgQxLuyR1g9snSwcfDV3TM/OILeqBRpMwFygNWo/UXxgLCPJgRyPZC3NOSh/cOZLalIH7pHu7AHbczWvJ9LZgArMHZkMOqpMnyv0/Ax4jpZEy4HrAn6W3jGTUY49baVndUgMkVoO8cENAJwylq9FrqF9rUNahoQ3aZ/77Yvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745611083; c=relaxed/simple;
	bh=bEBUcjADCd3zfsE3rxcNbisFN5xwKcKbxpfCkmKbuW4=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=YJA/Xy5IMZ8yJl5shIUJypfsnw7F+sdXNZBt2kxi1MCL3WtS3nWGMquvAgc5WcIufl2zUuaE0/ZJFNND/W9oou5o7HEp8WRWf5cKD9wg4EP4wjA6m/lIm9Sn4WcobPN4w5ma0Mt6jp0nMCQYir48nykvUwLgxLfwptG1CAH3ky8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=G7GkrNnU; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="G7GkrNnU"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-309f0d465bdso2825487a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 12:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745611081; x=1746215881; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ElGhi8jor+XgJnYQ39DMHzZzJy0F5BMVEsDOoJJ5QCQ=;
        b=G7GkrNnUhpFO3XvlpxGAlX7loTY5wheoVtMDsPCItwJ56NkGHRhJo5D6KibsnsUQlQ
         NxdboWhV7HqP3LgllYeurC13+bNulQhqPxEwsmT7barSCDrec+au30t9SlOby9l1xI6a
         zpck/SZlnGNYSUmzxmZybRdurPmqIPj6HpZpJiKe8EckrYqIpiGLSqAyIhdaTlLSF48M
         mFcClSzJAIGhkhy8sJ4xqjb8WTtNIAlnCgd0wxZuUFnC7vB4FHGm/7Y8Hom+YwoZUeCK
         OiEDz8GnP01AUW//kQtvR1nBaBb/LppP0Nq7UIZOA5HGoWAo8H3mrZpuf7X82EpJ2Vhz
         lhaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745611081; x=1746215881;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ElGhi8jor+XgJnYQ39DMHzZzJy0F5BMVEsDOoJJ5QCQ=;
        b=gxKNHhLlFIdEcsWoESxkFk66N5QfZUfybyrTBJb+/tM3DwTnLUhRufJ3khoiyTJ2w+
         aD7qK3l63rU+G3pDoA7f1mUG+an9WExQXQbMEsj8lmzZEc1xHECIA+DKZYllaDF0el2d
         3c09Vrlx2a4uT4NrEn9Q4VMGNc643lrBAEUEtO1g1y4R9CCU6xHBwogVZCe4yMItmbi0
         nUtju76NLMEEXjQ1r3p57cPXoaHZF8wNfjqTuklF7U5TkoSRzU7yMADBnqAzqPAObZOA
         m9uEyK0XwFfDEIC6B1A3Vh9vqvI+T28Wy94xKWXjp/8f0WwTmQZK/MRkyNGJu0/H7tJo
         APgw==
X-Gm-Message-State: AOJu0YyaGaBkDbc/9+ehpTQBkCAhqjm/jfaGZug6Ek1HHjwXtcZK+TEe
	fkGobQnYg/I7afmlpAQiSv0G8djxx08NyWWBW5NBVOSkOGit52W44EACjP3RJUpY09YzFBEqp5f
	4CT8BRLr40JQ3v897Bp8/jEbF+WSTTqMo2utFdBzFY5Jqe6c3U4HNbYF19gyYRZ3NYZ8Hg8yYE/
	PleucgK15D4HEGV7cfuszJeoNwq7dOjHq6GRTV4VZULyz5
X-Google-Smtp-Source: AGHT+IH7w+H2q6k2sc5zQnvneid2gmd9k8gH49CvGOB1+GxUYPK4WUIq8cEsO+L5IvZ7bZIgonZO7sYT6L9O
X-Received: from pjbsb5.prod.google.com ([2002:a17:90b:50c5:b0:2ff:4be0:c675])
 (user=jstultz job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:c88b:b0:2fe:b016:a6ac
 with SMTP id 98e67ed59e1d1-309f7df179fmr6240725a91.15.1745611081099; Fri, 25
 Apr 2025 12:58:01 -0700 (PDT)
Date: Fri, 25 Apr 2025 12:57:55 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.850.g28803427d3-goog
Message-ID: <20250425195757.2139558-1-jstultz@google.com>
Subject: [RFC][PATCH v2] sched/core: Tweak wait_task_inactive() to force
 dequeue sched_delayed tasks
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
Reported-by: peter-yc.chang@mediatek.com
Signed-off-by: John Stultz <jstultz@google.com>
---
v2:
* Rework & simplify the check as suggested by K Prateek Nayak
* Added Reported-by tag for proper attribution
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
2.49.0.850.g28803427d3-goog

