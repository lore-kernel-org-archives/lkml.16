Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554D8136988
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 04:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745297040; cv=none; b=k1AJyIFfrqQKJsDSov9S8WykrkYvYD7lnxCY3mVqWDU9vDucgv1QODkeO4NkCnPlkuF2KVsj0gVr54AR5HiYPzDL8vmTNWEuEZxuzbSf1/oeRXKorl33Yh4jV5vzjeLEwsjpQfn8hNu63AG65pUxP41NVSlS/KaYHYfs5c2ycwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745297040; c=relaxed/simple;
	bh=i+D2YEf/4fhpjjD1fZ+3R3wPVV39LN2fijYTdWl+sYc=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=dZAhjGbUDx2AFnlN0b3ESTYg60tIoiFLwB2E9AlrWqWRSoSpRWeI+KSoODYd+brKcxVF40ujalMbxF3BMmH6+VS7CY1EKNnGMpaTwzdzfWBx6U4FV3JtDXkLUUypJ9IyPCaKG8//+aoekZYftY+9t8yf5jnEQH4KOiPwNAKDz2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cnwVKfBm; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cnwVKfBm"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-896c1845cb9so4275798a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 21:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745297038; x=1745901838; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OMmFR27feHohiG2lQNR6bQsxIcQsMWncMxBCrcKvZNc=;
        b=cnwVKfBmIJp8TUFzrdq0hn3s74iwO4k0kNUg2UPiTvBK97CeTdmzGsjDI4Abi+upS3
         ELCxEqBh+Xx2PZNolU46agi/ZJAWYUPIIe1Pr/H+HgUZjQQ4us8o3WIjYAVV7K85j7OT
         1wB06+qEcSZvT6RuoTyHSjbZ8XZnbZnunCkbAYaj/dxiiuUv7jqSdu6GxOtf9+xdD/IP
         9tEpNOOG2TMGWwZQl8OFD7hwT6A/FVkFjeB9CULBBnFSntZK9GxVb/UQn8J0whgSerW5
         8tkVvDRa3IRWcmxim+sCibCrqOEV+wdok7EHAI6VKgSwv2XpvtF/bdkxThFiRSMVYgW7
         PRWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745297038; x=1745901838;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OMmFR27feHohiG2lQNR6bQsxIcQsMWncMxBCrcKvZNc=;
        b=qSsDGR5p0hXctf/K6zw4Mgy5wZfNEpGSnBQ5W94jzVxu6JusyaXkUjc5DbYyeABMJF
         MvLtRLWPLGIq+zK5/Hm/UAdMO/GGsR29OnaXHNYNo8lnCR8daMK921J9gYenToiC7H2A
         qly6hMnelrrRnfg8YcWcLL9Ck4S/RuKFhUi3D76ENY4RhDIZUWz1BSoIC0p5ZSjCLO3i
         gTATGJd2xHEQptnzJNPE87QRRK2OwLunDCD0bjsGDtkkt/JWP/SQWY4+rprxgcwTvsRO
         AIMXvpdZ1pJHmvAdPRtVEeoNISlVQGMZdjSe7AqWdxmE+WnNJlabMKucfhg7J9PZNsnB
         IHCA==
X-Gm-Message-State: AOJu0YyFW6A/7ucIGiG6H5tWMpXYVg9+69frgbVf0telvu1cxnJ5zG9E
	qk4spWxUhHMmFtuaf90xZlDgbR8BMW7E8JNARf2+nrdw8I0CPFAsQDIgDnZuop9BxRcfBc6Deel
	OpG94fZgujcZxTrkWK6yDzKop+0uKmMjUjQeh5YYsLhXx68llBFwNbcyhGcJAjhKc00F6zJJUKX
	QH2XyrHDG3xC1j+ntN4P82RY2freDwzPvbTcL/nr+37/Kt
X-Google-Smtp-Source: AGHT+IF4a68nX6HkGf5QzDN5LJNE72LkorYborqQLUSbjAymqaQbDl+KAheVo/MycLLz2s798H+JIw0BOnBo
X-Received: from pgbf37.prod.google.com ([2002:a63:5125:0:b0:af2:3b16:9767])
 (user=jstultz job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:2d07:b0:1f3:323e:3743
 with SMTP id adf61e73a8af0-203cc60d6bdmr19705780637.12.1745297038495; Mon, 21
 Apr 2025 21:43:58 -0700 (PDT)
Date: Mon, 21 Apr 2025 21:43:45 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
Message-ID: <20250422044355.390780-1-jstultz@google.com>
Subject: [RFC][PATCH] sched/core: Tweak wait_task_inactive() to force dequeue
 sched_delayed tasks
From: John Stultz <jstultz@google.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: John Stultz <jstultz@google.com>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, kernel-team@android.com
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
task_on_rq_queued(p) and p->se.sched_delayed, manually dequeue
the sched_delayed task with DEQUEUE_DELAYED, so we don't have to
constantly wait a tick.

This seems to work, but I've only lightly tested it, so I'd love
close review and feedback in case I've missed something in
wait_task_inactive(), or if there is a simpler alternative
approach.

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
Signed-off-by: John Stultz <jstultz@google.com>
---
 kernel/sched/core.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index c81cf642dba05..43f0931a3cd8a 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -2287,6 +2287,14 @@ unsigned long wait_task_inactive(struct task_struct *p, unsigned int match_state
 		running = task_on_cpu(rq, p);
 		queued = task_on_rq_queued(p);
 		ncsw = 0;
+		/*
+		 * If task is sched_delayed, force dequeue it, to avoid always
+		 * hitting the tick timeout in the queued case
+		 */
+		if (!running && queued && p->se.sched_delayed) {
+			dequeue_task(rq, p, DEQUEUE_SLEEP | DEQUEUE_DELAYED);
+			queued = task_on_rq_queued(p);
+		}
 		if ((match = __task_state_match(p, match_state))) {
 			/*
 			 * When matching on p->saved_state, consider this task
-- 
2.49.0.805.g082f7c87e0-goog

