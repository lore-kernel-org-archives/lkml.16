Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE7F2741CA
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 10:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747737721; cv=none; b=r7X2CC+AzRZdwM22bjAGEES/kHjzhEsx+7Ve98sNpPJmmosJ3W5kYtWAu29g0zka36thguGW7z88hZ0f7Hl/PieMT/05nS8+nrBuMGEOOXSkDqf+rEnxZdNWe8Qp91jxNM1Yq5xpjvmsqW1ElL0Tk4rYHnGrHpT1rRrzn2qCJmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747737721; c=relaxed/simple;
	bh=mUWTXN9HHfTlRXKGpPk+mQJc0KnWojsAPguAI+nOV+U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fL8w3M40/eEqj0qEjTGPXkRO6BdJM2SS+j+p8MzFauNv3hE9UVQOXP0Wd5H7rPu/JorkTrGspemH0k1i17Bd0egRAebeFdAq2ooWymouo29HKw7rpGQxRAZ2EM6YHTDWnLXWlGMcHOe+7yXd8dDBfQWDOKnFIQukQYqWqTonjZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=U5qMx1CD; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="U5qMx1CD"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b0b2d0b2843so4193583a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 03:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1747737718; x=1748342518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o/EhzKMaxIvvDCcy/f4feKI9fqwkuL11s7nWdOGRixo=;
        b=U5qMx1CDhFxQ2AbPAyPfVLaEQQOIMtN5iSLgBUaZTEMy49KWN+0ZiNJyiGwiDVkbbY
         KTyLDiRC5oAfn4n2sG6OxBHCSvYISwl97l35paU7KwqxiEJvsNDu4p4RSWjjwkCCUw2v
         L6nzp50qRyhkso9a27CzU2MnsMg1FwUposHld9loTQl/dSCg59QFqxKE7F/rfb/uM0ad
         0mHVSOghIUTbgJMo8kcmr+YwopSyvpcSB4nS1lf+BUcE+L2mh3y3GGbpjpcRyDdPXOnt
         t7oJ9cKDRFTqdZgDcMdTN/pvU8UavNHjxPsTEcbN0LPAT3qhcVTJdsaj6EBYdqjZF55y
         3XQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747737718; x=1748342518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o/EhzKMaxIvvDCcy/f4feKI9fqwkuL11s7nWdOGRixo=;
        b=XKDtgPWgjlsuMKbK4Lbkt4acJkohSgtN8DK5H2nR/ws23BWBTneiWFAoPjWQkYdIjq
         6H64lYMrMCFPQtVQDTEE8EceZLpPbuRSth9TNimNvYGNNmOzlKM4L6Mt+/Ej2qs/LtDX
         D6Hnq+18uaiOrfVnpouLln1n23ZN4xYcydZmyNR2WvtNfU5rAO0i7mTJtCSngKQhSnGd
         K2PwaBTpHUeY38kW6XussB0hR/DrQgTvtp67Loq0PnLBrW6avw/ghJ2Vt23u3LqjnSz9
         X/HZZwngEND3bkXuzmH4VvmrlD6cuzkuQ00AyOPqky3AJ5dSKLdi9/QAWMQBEatqdlR7
         zM9w==
X-Gm-Message-State: AOJu0YxiIYYt+7e6Z3slSyAcR2KGInRbiWRDjw9HAQw07b8FYHas+e3b
	rIlWOc5U3ujfbdtLHjr4fV5+AEwnX+qxdk6khtALXSVfUvdJ6/1fTYht3DuJhAzXVQ==
X-Gm-Gg: ASbGnctQR5tIZAw5I59Ch1ED3GIg0JFr19CDLHu2r3OA7u15Lf/8SWG8/MtynUFz1OP
	XvIrHX79CxxbnZBI6e2vXQXjlYI0GeOBG9cK2GoEPwpnXOdTeyodrSJdQ2OYPnlR2PwhTVk7PWA
	3JlzlBEfeQjcT30r6f/vXQpVzb+BgSIolZTW2HYts7E2Z6IGXn2MLMOaymxr3l8IwR3fJobBFDK
	EXNgDEQAnTVP+HWnDKybmJ7Q8vmfJoKloxp+x0gDD5imhHrdEmOLxwKDebMGBKopeLvg8XD7ksW
	yfAdzOpN0fYX+10UKA7e2rYx9K6izKiJeY2eWtpQ+ns0bwIlroyfyGNRuMjFZ6GNuQnro1vgmAw
	ryw==
X-Google-Smtp-Source: AGHT+IHKvJUSPKPdHp3qQ5+Ubc2geQwAfPn/IejVahVN8wD99rI82HgnXp5cQMlWsXUPZMovKC/fmQ==
X-Received: by 2002:a17:90a:e706:b0:30e:5c7f:5d26 with SMTP id 98e67ed59e1d1-30e7d5aca67mr25983405a91.24.1747737718476;
        Tue, 20 May 2025 03:41:58 -0700 (PDT)
Received: from n37-107-136.byted.org ([115.190.40.14])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f365e5d31sm1359431a91.38.2025.05.20.03.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 03:41:58 -0700 (PDT)
From: Aaron Lu <ziqianlu@bytedance.com>
To: Valentin Schneider <vschneid@redhat.com>,
	Ben Segall <bsegall@google.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Don <joshdon@google.com>,
	Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Xi Wang <xii@google.com>
Cc: linux-kernel@vger.kernel.org,
	Juri Lelli <juri.lelli@redhat.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mel Gorman <mgorman@suse.de>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Chuyi Zhou <zhouchuyi@bytedance.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Florian Bezdeka <florian.bezdeka@siemens.com>
Subject: [PATCH 4/7] sched/fair: Take care of group/affinity/sched_class change for throttled task
Date: Tue, 20 May 2025 18:41:07 +0800
Message-Id: <20250520104110.3673059-5-ziqianlu@bytedance.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250520104110.3673059-1-ziqianlu@bytedance.com>
References: <20250520104110.3673059-1-ziqianlu@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On task group change, for tasks whose on_rq equals to TASK_ON_RQ_QUEUED,
core will dequeue it and then requeued it.

The throttled task is still considered as queued by core because p->on_rq
is still set so core will dequeue it, but since the task is already
dequeued on throttle in fair, handle this case properly.

Affinity and sched class change is similar.

Signed-off-by: Aaron Lu <ziqianlu@bytedance.com>
---
 kernel/sched/fair.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 74bc320cbc238..4c66fd8d24389 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -5866,6 +5866,10 @@ static void throttle_cfs_rq_work(struct callback_head *work)
 		update_rq_clock(rq);
 		WARN_ON_ONCE(!list_empty(&p->throttle_node));
 		dequeue_task_fair(rq, p, DEQUEUE_SLEEP | DEQUEUE_SPECIAL);
+		/*
+		 * Must not add it to limbo list before dequeue or dequeue will
+		 * mistakenly regard this task as an already throttled one.
+		 */
 		list_add(&p->throttle_node, &cfs_rq->throttled_limbo_list);
 		resched_curr(rq);
 	}
@@ -5881,6 +5885,20 @@ void init_cfs_throttle_work(struct task_struct *p)
 	INIT_LIST_HEAD(&p->throttle_node);
 }
 
+static void dequeue_throttled_task(struct task_struct *p, int flags)
+{
+	/*
+	 * Task is throttled and someone wants to dequeue it again:
+	 * it must be sched/core when core needs to do things like
+	 * task affinity change, task group change, task sched class
+	 * change etc.
+	 */
+	WARN_ON_ONCE(p->se.on_rq);
+	WARN_ON_ONCE(flags & DEQUEUE_SLEEP);
+
+	list_del_init(&p->throttle_node);
+}
+
 static void enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags);
 static int tg_unthrottle_up(struct task_group *tg, void *data)
 {
@@ -6834,6 +6852,7 @@ static inline void sync_throttle(struct task_group *tg, int cpu) {}
 static __always_inline void return_cfs_rq_runtime(struct cfs_rq *cfs_rq) {}
 static void task_throttle_setup_work(struct task_struct *p) {}
 static bool task_is_throttled(struct task_struct *p) { return false; }
+static void dequeue_throttled_task(struct task_struct *p, int flags) {}
 
 static inline int cfs_rq_throttled(struct cfs_rq *cfs_rq)
 {
@@ -7281,6 +7300,11 @@ static int dequeue_entities(struct rq *rq, struct sched_entity *se, int flags)
  */
 static bool dequeue_task_fair(struct rq *rq, struct task_struct *p, int flags)
 {
+	if (unlikely(task_is_throttled(p))) {
+		dequeue_throttled_task(p, flags);
+		return true;
+	}
+
 	if (!(p->se.sched_delayed && (task_on_rq_migrating(p) || (flags & DEQUEUE_SAVE))))
 		util_est_dequeue(&rq->cfs, p);
 
-- 
2.39.5

