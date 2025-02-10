Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DEBE23C387
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 15:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739200383; cv=none; b=RDhkz+tY0vPjJfzNDqUDh5cEs0IgNQBWQGfOq0YpBe+PiO4vKM13ij5Ann5O5r+B6ODpt9PVf56SAiOP9pxvzLDep/30ftiqYEegILPbNgXAayiLh3m41zncbnVxb87tKAnJn/b1tzG8ANSZ0sg7wo8jm24nrRoPZJ69tmV/IMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739200383; c=relaxed/simple;
	bh=pi9xguxgmi8jgveuQ3APRb4E+MjxkvqvRH3D05xwEJo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U9skMaBI//V6MlBTDB1VXrkH3Z15ZVvtna7FurFqRPdQ5X7MKHcePLVWqykXDL6eqGX53OikkmtrSisHFEzLg5gHnyhEGTUUovgSheMA9j7R/aSkyyKgfTYbxgwgX8Aw3wQaOmzUrq2PI2QHWvh/APDUZ4brvtLuzYvpJUYXBlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=OFy4zNEF; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="OFy4zNEF"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ab7a342ef4eso431405566b.0
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 07:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739200380; x=1739805180; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tsKAVR4VpZ3o1CX3CIQeDuMn525H6M2KaGLkBcm6fQw=;
        b=OFy4zNEFZ6VIRIJ2HT3Qijood/Mh9pogOcbwjJKnLdIyFOYNbgJVnmrUuNYS2k0elb
         4RzZ9ADZBjfxcQ5EN4yi5BbAtAk5QNjkaDwuXYFF+HL+wBWSgICbq+fnoCWA3Bn8Xx/I
         jl3Vb0pX8TefGc2Zwb/wrtuD9MLJ5jPCO8WIG8WrF3i6J7iPcMyFFl0csJHC3052DtYh
         kJvdaCh32IGDwtCgu6d58YoDF62eZFn6UPKtgM4SN2dWRGcxBTjGD2lVXwv8bUPHdfoZ
         22jJS1hkO6MqXJoBx1LHgFKSBQZ/masyvOYEiL/6rIyBhEZeoK82o8t37N0bmKhJSI3Q
         fTIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739200380; x=1739805180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tsKAVR4VpZ3o1CX3CIQeDuMn525H6M2KaGLkBcm6fQw=;
        b=sqgB/LnxFWEtaTCzJre4OQ0J01Y9dxj0+2E3SF8UQ0+3vr2OcF/uiMtqf88qw5u39P
         pkKoYe76GNMysXM+fS841OzHtqy7WmuYi91URlEJb42k3AAG7vbXovdylh8PlYzCAlA9
         Vu1xPUepqyGGTd/nqoDlKZ2sHdhP/r31IB8aroF3EeJtOIssd7/GyGV5IT2QDkRCAmxd
         c9LZsL5qLQy6Ln6x7AcDvQ4y9gjrt8CamOy2lqvcm3gAA0hdcbRwsxXMcFoh1MflOVn4
         QY+s25jJw5UlpWvbxnAdklVByMAhQ3+2X5NGlZyil/C1/2Eh0kE6vdPtIKGXRvO9lHih
         ekUw==
X-Forwarded-Encrypted: i=1; AJvYcCVW9bJSMUfNWA7CWE0o61S4ZA4+AkWPaVQ33Ht2gugTNVbZfA1Oos5IaHt5Mf3X5fcOs/cJfRao7wJJcUQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywkj0RTfyo+Joe/sbJwi6xzmM0mTZhwxsX86haqa1Kl4jHS0bvP
	FQEgVMoYpuwVGvUTfgZwXK5YnquqZwHLf6aS47ZvLiT7guZAuL2dBnxyQwsHL8M=
X-Gm-Gg: ASbGncsxfvQCGSajdmqC9YQ26m4SNWNhTRzGP/yTDwjiFRBHSZb76XIQtCEWmicjJ3w
	/RrYaU9k/W7bkEgDmTsWBjVQ40gPrN72vdTJLSzZps5ZIIfDCfCDAhK4ecIMQhxK9BOKpZfvbrT
	LCPP3Obi/HWj0e9qr8ZkVUJAKW9Z+4zTVLnm4Y9X5ZjFZBREliTEFbDf4vfrUbrAZ3ThlNGi5fx
	8nrdA8tJNEaCexr6Plv1+QQey9a8KfhQn9c15si4kaNPS0g/N7I3MZNfa2k3DU9tsBhVZtGcYLo
	GvBN+IHd1bL/OoxegA==
X-Google-Smtp-Source: AGHT+IHT6NnKwYsI6TprB2iMRHM/h1jJUEiVDEKn7peT9uyPdC0s/d7xz0F+2KsYIHFQId6TRqa5Nw==
X-Received: by 2002:a17:907:360c:b0:ab7:63fa:e4a8 with SMTP id a640c23a62f3a-ab7897b37ffmr1256700366b.0.1739200379887;
        Mon, 10 Feb 2025 07:12:59 -0800 (PST)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab773339e82sm895192866b.143.2025.02.10.07.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 07:12:59 -0800 (PST)
From: =?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>
To: cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Frederic Weisbecker <fweisbecker@suse.com>
Subject: [PATCH 8/9] sched: Add RT_GROUP WARN checks for non-root task_groups
Date: Mon, 10 Feb 2025 16:12:38 +0100
Message-ID: <20250210151239.50055-9-mkoutny@suse.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250210151239.50055-1-mkoutny@suse.com>
References: <20250210151239.50055-1-mkoutny@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

With CONFIG_RT_GROUP_SCHED but runtime disabling of RT_GROUPs we expect
the existence of the root task_group only and all rt_sched_entity'ies
should be queued on root's rt_rq.

If we get a non-root RT_GROUP something went wrong.

Signed-off-by: Michal Koutný <mkoutny@suse.com>
---
 kernel/sched/rt.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
index 1633b49b2ce26..d0acfc112d68e 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -178,11 +178,14 @@ static inline struct task_struct *rt_task_of(struct sched_rt_entity *rt_se)
 
 static inline struct rq *rq_of_rt_rq(struct rt_rq *rt_rq)
 {
+	/* Cannot fold with non-CONFIG_RT_GROUP_SCHED version, layout */
+	WARN_ON(!rt_group_sched_enabled() && rt_rq->tg != &root_task_group);
 	return rt_rq->rq;
 }
 
 static inline struct rt_rq *rt_rq_of_se(struct sched_rt_entity *rt_se)
 {
+	WARN_ON(!rt_group_sched_enabled() && rt_se->rt_rq->tg != &root_task_group);
 	return rt_se->rt_rq;
 }
 
@@ -190,6 +193,7 @@ static inline struct rq *rq_of_rt_se(struct sched_rt_entity *rt_se)
 {
 	struct rt_rq *rt_rq = rt_se->rt_rq;
 
+	WARN_ON(!rt_group_sched_enabled() && rt_rq->tg != &root_task_group);
 	return rt_rq->rq;
 }
 
@@ -506,8 +510,10 @@ typedef struct task_group *rt_rq_iter_t;
 
 static inline struct task_group *next_task_group(struct task_group *tg)
 {
-	if (!rt_group_sched_enabled())
+	if (!rt_group_sched_enabled()) {
+		WARN_ON(tg != &root_task_group);
 		return NULL;
+	}
 
 	do {
 		tg = list_entry_rcu(tg->list.next,
@@ -2609,8 +2615,9 @@ static int task_is_throttled_rt(struct task_struct *p, int cpu)
 {
 	struct rt_rq *rt_rq;
 
-#ifdef CONFIG_RT_GROUP_SCHED
+#ifdef CONFIG_RT_GROUP_SCHED // XXX maybe add task_rt_rq(), see also sched_rt_period_rt_rq
 	rt_rq = task_group(p)->rt_rq[cpu];
+	WARN_ON(!rt_group_sched_enabled() && rt_rq->tg != &root_task_group);
 #else
 	rt_rq = &cpu_rq(cpu)->rt;
 #endif
@@ -2720,6 +2727,9 @@ static int tg_rt_schedulable(struct task_group *tg, void *data)
 	    tg->rt_bandwidth.rt_runtime && tg_has_rt_tasks(tg))
 		return -EBUSY;
 
+	if (WARN_ON(!rt_group_sched_enabled() && tg != &root_task_group))
+		return -EBUSY;
+
 	total = to_ratio(period, runtime);
 
 	/*
-- 
2.48.1

