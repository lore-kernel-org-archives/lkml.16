Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0BF277C87
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 14:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751639785; cv=none; b=fpvscjGd2161UgDggsA0tIDtQRJOjTzhfFlKDyiKGAOs7bOe/wvY8dYg2sdIbxPc3ta7WaukoycD7QHrRr0WwntIQiuZSGz9RRmEhxf4Y3vozphFICfzc8lncIhWj4n+gCot62/tKwfwqcCXqS30WgJA3q/9fpuYvw2vdTli/HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751639785; c=relaxed/simple;
	bh=SmX4X7jKxJ5nUVgxLet7QD+gkKR7OJDqWd/BGi4oyAo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DWVozgXjsqfHanW3NbD8qHl6nJjqonZiJDqcIskRp8PxKSuW+IjM/5UVyaOuQFLkFepF8IPNAhsC3j4xUpZbYAoQQXKB9vei0OOGRqkXWlAju/H7c07WpW72p45nd3n2eF78P+llnDM5KdmufrcbpcuJC1HSbBamrTy/Tcwi+F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RxGvzKhe; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RxGvzKhe"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-450cb2ddd46so5425015e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 07:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751639781; x=1752244581; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gTVfhwaTdFeDSqwW2OxB6k98i/VGElPyJ4deZ0hrVio=;
        b=RxGvzKheMVjYxh9SG+bcCIUfUh7pC/3X4JSb35VYFm28QAq3uJ9XM2MD5FyzOj4nN+
         8om8fzmtPOUqRxyFLTy4hDbprgvkdETHpaINHLh7aBcrMycyjd7w+TeCtvqA/5sN5xEa
         DPo66o4CyTSbLgpRs5hdaON+tKt+jEpaBpmJa6L4cGETFqCbEp/V1r2/uWOUjbH8Ec/D
         pVTXSHkq/pJ3thf+S7/+0DnGispojIwZ1RB3+ewCpppTmK6jt+tJqXc7VkRPbuDhzRZH
         eSpaGTdnP6k9H+dFkbjTVlbFuiLjmoBfuB2kb6n8o9/8wfP3aFrOR20XCfvLFh30em5b
         kwkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751639781; x=1752244581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gTVfhwaTdFeDSqwW2OxB6k98i/VGElPyJ4deZ0hrVio=;
        b=M3yVbYU5XiTFL851c/dxhQms+O5ebb4i+qHimQG4A2L40UrQN7aqYtPxYp9Y4RNLMo
         ItXGMSjd6Xc1gAa5uwNlRQmD4CckOn06rQPgJXEPRH2RokKY5D9LdHwVdRF8KBeBMeOI
         wSw+8LSoGSH7Vy5NXiQ5awZNHvuEeJh+KLmyEz+XQGE3KuFTmm0QC1u7DC/hKdd5/Gll
         IzZnjDskOwxzUj3zNNwpxKe6W7AonMmdM071Lye8HOI3FS3hDLittB374h0plv6yFa9u
         bD2F+A8rAkLWi96ZWCAC9Ehdw/HDG7Z4KGOW3HEx6vEVWpRD6hZoJZ3bNj5o6ZEFwJRX
         u22A==
X-Forwarded-Encrypted: i=1; AJvYcCX7+FgpvfaUXRbztTi+/g3z/txc6r0w+N9tTxxwuw0/oda8Wn6biYQF9EBr/q8EevvD8rdi7yOjNkQvjtc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxqvl9zB/gC1wF1qHhIdMl7Pg7BZUl1d4xEV64mLOWQ2Snaax+J
	hpOQTTuUckoBclygxrq/EDlAnHHxk59peJDLkFfXBx1VDF7FDeqGFsc73+6GGa4x9Uc=
X-Gm-Gg: ASbGncvpCPI1CO/g6/mwmSA/Shm878WWmUaN1KmH9Ml/HWmxHiBED1xP7tAbz+YhAjf
	H0676iP5Ta8XpfKAzVsVnGCPG6e9qhMYzAM+FXAKNjKwrC0FUNq+u5uaQjJOofV26h/0DUO7BK5
	U9BgHUU0zYWlTIAikTpEtAQHB1u9Q77/bipgCyB7h1Nbe2RA0Yv2Lc7NF7ZOSCRty9I2x8VYHTW
	JM/q2trLKXenXONIco+pHHeQ6M9FmjAUS4Anl2HaAfFiLav8qZNFUtqvIHDE8MXPlkQc17SBw8e
	5EWy9uHtTXtv//nSV4e1pkY2+K3qBJUxTg5HWfhSd60gdvqzwo8M48F/mx8gerkQgusbQVXb+Uw
	aFYN2Mw==
X-Google-Smtp-Source: AGHT+IFvFB0VeJyxN/6532jT3ADchtzSmPWDTvhxX9uwYcL7DOeuanxIvtxAGrRXPpFk4ndeXddrsg==
X-Received: by 2002:a05:600c:820c:b0:453:23fe:ca86 with SMTP id 5b1f17b1804b1-454b8ea7cefmr7010495e9.4.1751639781382;
        Fri, 04 Jul 2025 07:36:21 -0700 (PDT)
Received: from vingu-cube.. ([2a01:e0a:f:6020:7ff5:bbf8:9357:784a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b4708d0beesm2690186f8f.36.2025.07.04.07.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 07:36:19 -0700 (PDT)
From: Vincent Guittot <vincent.guittot@linaro.org>
To: mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	dhaval@gianis.ca,
	linux-kernel@vger.kernel.org
Cc: Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH v2 3/6] sched/fair: Remove spurious shorter slice preemption
Date: Fri,  4 Jul 2025 16:36:09 +0200
Message-ID: <20250704143612.998419-4-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704143612.998419-1-vincent.guittot@linaro.org>
References: <20250704143612.998419-1-vincent.guittot@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Even if the waking task can preempt current, it might not be the one
selected by pick_task_fair. Check that the waking task will be selected
if we cancel the slice protection before doing so.

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
---
 kernel/sched/fair.c | 44 ++++++++++++++------------------------------
 1 file changed, 14 insertions(+), 30 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 0c1abb079ebb..2e624a769b86 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -931,7 +931,7 @@ static inline void cancel_protect_slice(struct sched_entity *se)
  *
  * Which allows tree pruning through eligibility.
  */
-static struct sched_entity *pick_eevdf(struct cfs_rq *cfs_rq)
+static struct sched_entity *__pick_eevdf(struct cfs_rq *cfs_rq, bool protect)
 {
 	struct rb_node *node = cfs_rq->tasks_timeline.rb_root.rb_node;
 	struct sched_entity *se = __pick_first_entity(cfs_rq);
@@ -948,7 +948,7 @@ static struct sched_entity *pick_eevdf(struct cfs_rq *cfs_rq)
 	if (curr && (!curr->on_rq || !entity_eligible(cfs_rq, curr)))
 		curr = NULL;
 
-	if (curr && protect_slice(curr))
+	if (curr && protect && protect_slice(curr))
 		return curr;
 
 	/* Pick the leftmost entity if it's eligible */
@@ -992,6 +992,11 @@ static struct sched_entity *pick_eevdf(struct cfs_rq *cfs_rq)
 	return best;
 }
 
+static struct sched_entity *pick_eevdf(struct cfs_rq *cfs_rq)
+{
+	return __pick_eevdf(cfs_rq, true);
+}
+
 struct sched_entity *__pick_last_entity(struct cfs_rq *cfs_rq)
 {
 	struct rb_node *last = rb_last(&cfs_rq->tasks_timeline.rb_root);
@@ -1175,27 +1180,6 @@ static inline bool resched_next_quantum(struct cfs_rq *cfs_rq, struct sched_enti
 	return !entity_eligible(cfs_rq, curr);
 }
 
-static inline bool do_preempt_short(struct cfs_rq *cfs_rq,
-				    struct sched_entity *pse, struct sched_entity *se)
-{
-	if (!sched_feat(PREEMPT_SHORT))
-		return false;
-
-	if (pse->slice >= se->slice)
-		return false;
-
-	if (!entity_eligible(cfs_rq, pse))
-		return false;
-
-	if (entity_before(pse, se))
-		return true;
-
-	if (!entity_eligible(cfs_rq, se))
-		return true;
-
-	return false;
-}
-
 /*
  * Used by other classes to account runtime.
  */
@@ -8666,6 +8650,7 @@ static void check_preempt_wakeup_fair(struct rq *rq, struct task_struct *p, int
 	struct sched_entity *se = &donor->se, *pse = &p->se;
 	struct cfs_rq *cfs_rq = task_cfs_rq(donor);
 	int cse_is_idle, pse_is_idle;
+	bool do_preempt_short = false;
 
 	if (unlikely(se == pse))
 		return;
@@ -8714,7 +8699,7 @@ static void check_preempt_wakeup_fair(struct rq *rq, struct task_struct *p, int
 		 * When non-idle entity preempt an idle entity,
 		 * don't give idle entity slice protection.
 		 */
-		cancel_protect_slice(se);
+		do_preempt_short = true;
 		goto preempt;
 	}
 
@@ -8732,22 +8717,21 @@ static void check_preempt_wakeup_fair(struct rq *rq, struct task_struct *p, int
 	/*
 	 * If @p has a shorter slice than current and @p is eligible, override
 	 * current's slice protection in order to allow preemption.
-	 *
-	 * Note that even if @p does not turn out to be the most eligible
-	 * task at this moment, current's slice protection will be lost.
 	 */
-	if (do_preempt_short(cfs_rq, pse, se))
-		cancel_protect_slice(se);
+	 do_preempt_short = sched_feat(PREEMPT_SHORT) && (pse->slice < se->slice);
 
 	/*
 	 * If @p has become the most eligible task, force preemption.
 	 */
-	if (pick_eevdf(cfs_rq) == pse)
+	if (__pick_eevdf(cfs_rq, !do_preempt_short) == pse)
 		goto preempt;
 
 	return;
 
 preempt:
+	if (do_preempt_short)
+		cancel_protect_slice(se);
+
 	resched_curr_lazy(rq);
 }
 
-- 
2.43.0

