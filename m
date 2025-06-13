Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F382E764E
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 14:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749823538; cv=none; b=asRRV4cjFh25fNVbE3fIBAozRfQk+tcxxKOTw1PbISrXsqOomc1QAUhCzdB+eVu+9K1FATomuiKDbYMnNM0M5Qo7Vole3lrEm8aLeCYIlu7y4Doyow3ew7Y2ZkWBwR6xCJYu3Ly0NqZkpFiRGth/4g33GyvpxHK6L+VFhokxu7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749823538; c=relaxed/simple;
	bh=zmOD1/rUzfz7QYBoFYJmCP01VLNfng0/qUUtfTajsEE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nl57+mEiDcQG9IlptbLVMn9UPlGnGkK7ZXmQwCuPXu9RfXJjnngLzm5Ums5H0pqlU5XRI8UQ5CAgCKwB7U9TCQHlSX1ehsRyfffm/ovpJVva8wISuMq0y9ddQjjAKooiRGBhP60DRGgOdNJ9HPG9WhgXyyRUYuWQbMFRnrOoxH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y+OknngF; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y+OknngF"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-450ce3a2dd5so19780245e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 07:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749823534; x=1750428334; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xZq3HPM5M5NgUioHq85yF6dGPT1Zo3ahkiRvy5p1DrM=;
        b=Y+OknngFFnQ7PX356+X9TE0Rr4nS0mvkGpsZzuc5hdV6rYKGUfan46/1IRCBed0/pA
         2P0Qm2V3xS7R39owVnLev/4JhJJrO9+jxiMksPms5PzJFLGG3CvuDxw5JXnJSN49gqFF
         kfEX77q16+DneJen7DPadgCCy7s9+hiJrzsGPj7ZCafH9mCT/b9ZlQ9Q6/SYumQGDZLo
         3azlrwklboV4Q64zKlfCKb4ZPhqT797DNhfIhEOtuR8uEjDDuvGEglqCZM6/NvtINCzV
         Q1qWpSWCFo1FdJCKpNLwKY+l6OI1ZlmB5ba2wzdqx6GlzlAqjX3WIoE8MKfLGLZaxZyD
         r32Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749823534; x=1750428334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xZq3HPM5M5NgUioHq85yF6dGPT1Zo3ahkiRvy5p1DrM=;
        b=UZK1OBTl06vvlEWun4tS1HAFXtAPTamu2zfxFKF233rsKQGIldFoCAHgt3xkpnvP8+
         iosAaJMEWh+thaDYPnP78v1DmQ7bDK2vrobuYBsppDvAW9k2w7hBdKaRkLI3s2qLTiah
         f2/OahE0xaFGhn8BDtsxGfnkP1QvLDVbQvp207fgBmKKjxDcoacZaSFg3+dzf4XwQ+7s
         Qmio09mYvR0VACXT5V4ip42ArvD1skBT38tCZMLb3xDKmHJzq1ckMt48Zq+aCatX32W6
         Ojn22oz41ZMQRTvyh1W7pclM3CPgDVa8+QtspjwxTQsgDH6Mu6x6oJeDKAikgPTstafR
         gX3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWcJy+3eEXr6PLsEQO027m7kH4UcS7gAq2qxQhyw3VkOuWlpZu5Oz4VWe44ogmLDrDZbUZk852ocgng8O8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyATI2/WEOCB+wFnIBilc9IVzKRiYMRQSbfn7Z2JC0+uyffjdte
	U2Rk6rIQDE8cFz5n41IjIJKhupirac+aFgsinP5qI3jsy/NYjm1qAI6w0I6r0TAOarU=
X-Gm-Gg: ASbGncv5At/rwbu089ogL1YmFkL2DR8qfvWm61QUzFjDDXYedyRLJe0mPRGfSdtV5h1
	uPnbPkKswesxpS/msrfTZEfwDM6NDevs9gp6p3pfzJBvDps/jUnwMbd7z5FJ2dtiJUgH1M31W9O
	4tg5RyGHqMRAIiOsVfAf52LEzQB6jvicSNENS6SxMvs5pEDnONgC1MzsWcHAGJ2qCQ6gYsp124K
	nyjBeZxmduxqWZhWKAqjETBPod61kpdaGhNGIIwMA+kUEuluwgktONEh8wTvdGgxIVOuMcjFvsA
	6YINWX+8/SB1Dd88ebOaegc4L+sm6Eo1ITUeedK28/keJFEMxrIeLyMczMcz5fIrbrAHkQ==
X-Google-Smtp-Source: AGHT+IGJi/KZjt3wz1bY/aheeiTy+Pzp2o5DcLZKAfstFU+yQeDHcPOrBNopjtO43z6PODIO9wIcBA==
X-Received: by 2002:a05:600c:1ca2:b0:43d:878c:7c40 with SMTP id 5b1f17b1804b1-45334ac986bmr41624025e9.10.1749823534008;
        Fri, 13 Jun 2025 07:05:34 -0700 (PDT)
Received: from vingu-cube.. ([2a01:e0a:f:6020:f98:f3a4:ec28:1d4e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b27795sm2472276f8f.71.2025.06.13.07.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 07:05:33 -0700 (PDT)
From: Vincent Guittot <vincent.guittot@linaro.org>
To: mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	linux-kernel@vger.kernel.org
Cc: Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH 4/4] sched/fair: Improve NO_RUN_TO_PARITY
Date: Fri, 13 Jun 2025 16:05:14 +0200
Message-ID: <20250613140514.2781138-5-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250613140514.2781138-1-vincent.guittot@linaro.org>
References: <20250613140514.2781138-1-vincent.guittot@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The slice protection of RUN_TO_PARITY should also be applied with a
minimal quantum of time for NO_RUN_TO_PARITY in order to ensure a minimum
runtime for each task with same slice duration but also to ensure
periodic switch between threads.

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
---
 kernel/sched/fair.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index d8345219dfd4..73bde511c53b 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -921,15 +921,20 @@ struct sched_entity *__pick_first_entity(struct cfs_rq *cfs_rq)
  * one in vlag, which isn't used until dequeue.
  * In case of run to parity, we use the shortest slice of the enqueued
  * entities.
+ * When run to parity is disable we give a minimum quantum to the
+ * running entity to ensure progress.
  */
 static inline void set_protect_slice(struct sched_entity *se)
 {
-	u64 min_slice;
+	u64 quantum;
 
-	min_slice = cfs_rq_min_slice(cfs_rq_of(se));
+	if (sched_feat(RUN_TO_PARITY))
+		quantum = cfs_rq_min_slice(cfs_rq_of(se));
+	else
+		quantum = min(se->slice, normalized_sysctl_sched_base_slice);
 
-	if (min_slice != se->slice)
-		se->vlag = min(se->deadline, se->vruntime + calc_delta_fair(min_slice, se));
+	if (quantum != se->slice)
+		se->vlag = min(se->deadline, se->vruntime + calc_delta_fair(quantum, se));
 	else
 		se->vlag = se->deadline;
 }
@@ -981,7 +986,7 @@ static struct sched_entity *pick_eevdf(struct cfs_rq *cfs_rq)
 	if (curr && (!curr->on_rq || !entity_eligible(cfs_rq, curr)))
 		curr = NULL;
 
-	if (sched_feat(RUN_TO_PARITY) && curr && protect_slice(curr))
+	if (curr && protect_slice(curr))
 		return curr;
 
 	/* Pick the leftmost entity if it's eligible */
@@ -1215,11 +1220,8 @@ static inline void update_curr_task(struct task_struct *p, s64 delta_exec)
 	cgroup_account_cputime(p, delta_exec);
 }
 
-static inline bool did_preempt_short(struct cfs_rq *cfs_rq, struct sched_entity *curr)
+static inline bool resched_next_quantum(struct cfs_rq *cfs_rq, struct sched_entity *curr)
 {
-	if (!sched_feat(PREEMPT_SHORT))
-		return false;
-
 	if (protect_slice(curr))
 		return false;
 
@@ -1307,7 +1309,7 @@ static void update_curr(struct cfs_rq *cfs_rq)
 	if (cfs_rq->nr_queued == 1)
 		return;
 
-	if (resched || did_preempt_short(cfs_rq, curr)) {
+	if (resched || resched_next_quantum(cfs_rq, curr)) {
 		resched_curr_lazy(rq);
 		clear_buddies(cfs_rq, curr);
 	}
-- 
2.43.0

