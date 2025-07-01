Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E6425F98A
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 21:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751403802; cv=none; b=CqSPzlHJaS4uEfudWTjbiBZ/ecyFglnKGVermBg97k2FKVjqo3fshAnTNXGXav4af1a1eYiYdZEYs6M4U3ejF+BPywmA7w0x9es9hnTSxISoEYeb1RgYuuV1MK9YuBTvHYkJ5YkfmCFGXkLFtDrHujnma2l2bt1BjmdarZcxYDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751403802; c=relaxed/simple;
	bh=pwHlLQfORhjW4/C5V75CliIjDTJcJfGKliHIazOkgxY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Dcgw00AojZeHnHBecfCxlOcnnhtvPAg+1LAZ5Z+7fweJ/95c7LHV2wLEXlXmug3678+VscXKw0AQ9g0NV2X1kRa+Q27jQovJdhLofT3SBzmZgYR8sCPCBCPgwmu6FMTXqe9mndemoa/HEBxhhd2HZKoIz7J2DsM78uB7ZqZ2GqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--zecheng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xjv0yIWh; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--zecheng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xjv0yIWh"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e87af703ef2so4719068276.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 14:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751403799; x=1752008599; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=J2m3w6cd5O8puHWWtgeTVQTKU9Uuv7a92ubmbeQ56F8=;
        b=xjv0yIWhSnJzjguEdGLupiSWgo2J8/NZNZCsrxc1KcbakKhEW6nmN8Me1BdcRtlvQ/
         8JM4EcL5lrpu2wi52yM/Z3Jc2ZGeheONtNltkWVSDJHcHO8ATCt5CyYnVkhYngyNmVt/
         OsG49rELLqmXlSUDQbVhjMl9A5vUT8ex/2PgDTW8yGyjB3U2hZI0usCRIE/jnRWfX2dv
         V/RJvmTL6dDb7T+Lw94iIkbgzOjhdGxrIaqsP/d8FHzUJQDUeIx2pa/FKeCgnwD2RkG6
         6FM5/ypaAyw3AlNuauCZl0dFRV3/ryh9CHmmvSIATUKuFEHZSnNzEQr7NFr+7bHjuXvC
         zM3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751403799; x=1752008599;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J2m3w6cd5O8puHWWtgeTVQTKU9Uuv7a92ubmbeQ56F8=;
        b=TYIu0/MQiQWlSEWhnb/eaKVVMMhK1+w//cawjistfiOU0jEowMVdBt7Bx8xYIjo51n
         +yQka0hSAGy2igqjiEIUOhf2t/VX/M2HixQlr85jRws8IzmZ6cYFsNtTZzkKcaWdiEu+
         VbEMYBNGyI32rv8ZBtvsIKzYgRc6MrEifFX8fs9qXGtSrM4zkYbhyftfXpn/gl6pfetF
         k/l5e6I1tyvC1C+3dVoRuBvmhgh9wcpY/rA2Wex5Dlcfc2qACLeqKJNCZO847kSTWmVo
         bSihLdAqJcFlFtej8bmS5G/sBoSfRqVZY4QFZli3dMDrEuR6ECQuZEvsBchp+dTwnMrA
         BQ5w==
X-Forwarded-Encrypted: i=1; AJvYcCV4PUxIE/ZgspNLu2jHAU/cGMLgj9BBxoNpNAcSpiMg4kcS5bdLseoa2Q9PS56NFGVDOaF4crdG07zJWjs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxiqw5YqLurgPixgkkfpIEjCMy8O1fXtAHjD2a4PfVfXfxfzu8N
	rVyyrod4mWxOSj8BRyqaDWNIy3J7XfqjCjlJGFxojkENP/fVliW4KP7l3f1QAnz4aJ4zNKJWDs3
	nJWYBVdNyTg==
X-Google-Smtp-Source: AGHT+IFvDODHQS9w1n6gMVIZDFwfF9DaUNpieWFQP7GJtD852sSSCnuu1E/wnmL94zofYsS7nb3WFs6M3xM3
X-Received: from ybbdg18.prod.google.com ([2002:a05:6902:e92:b0:e81:d47f:318b])
 (user=zecheng job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6902:450e:b0:e84:4721:919b
 with SMTP id 3f1490d57ef6-e897e40cd36mr278347276.43.1751403799388; Tue, 01
 Jul 2025 14:03:19 -0700 (PDT)
Date: Tue,  1 Jul 2025 21:02:27 +0000
In-Reply-To: <20250701210230.2985885-1-zecheng@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250701210230.2985885-1-zecheng@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250701210230.2985885-2-zecheng@google.com>
Subject: [PATCH v3 1/3] sched/fair: Co-locate cfs_rq and sched_entity
From: Zecheng Li <zecheng@google.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, Xu Liu <xliuprof@google.com>, 
	Blake Jones <blakejones@google.com>, Namhyung Kim <namhyung@kernel.org>, 
	Josh Don <joshdon@google.com>, Madadi Vineeth Reddy <vineethr@linux.ibm.com>, 
	linux-kernel@vger.kernel.org, Zecheng Li <zecheng@google.com>
Content-Type: text/plain; charset="UTF-8"

Improve data locality and reduce pointer chasing by allocating struct
cfs_rq and struct sched_entity together for non-root task groups. This
is achieved by introducing a new combined struct cfs_rq_with_se that
holds both objects in a single allocation.

This patch:

- Defines the new struct cfs_rq_with_se.

- Modifies alloc_fair_sched_group() and free_fair_sched_group() to
allocate and free the new struct as a single unit.

- Modifies the per-CPU pointers in task_group->se and task_group->cfs_rq
to point to the members in the new combined structure.

Signed-off-by: Zecheng Li <zecheng@google.com>
---
 kernel/sched/fair.c  | 23 ++++++++++-------------
 kernel/sched/sched.h |  8 ++++++++
 2 files changed, 18 insertions(+), 13 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 7a14da5396fb..3a1b55b74203 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -13356,10 +13356,11 @@ void free_fair_sched_group(struct task_group *tg)
 	int i;
 
 	for_each_possible_cpu(i) {
-		if (tg->cfs_rq)
-			kfree(tg->cfs_rq[i]);
-		if (tg->se)
-			kfree(tg->se[i]);
+		if (tg->cfs_rq && tg->cfs_rq[i]) {
+			struct cfs_rq_with_se *combined =
+				container_of(tg->cfs_rq[i], struct cfs_rq_with_se, cfs_rq);
+			kfree(combined);
+		}
 	}
 
 	kfree(tg->cfs_rq);
@@ -13368,6 +13369,7 @@ void free_fair_sched_group(struct task_group *tg)
 
 int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
 {
+	struct cfs_rq_with_se *combined;
 	struct sched_entity *se;
 	struct cfs_rq *cfs_rq;
 	int i;
@@ -13384,16 +13386,13 @@ int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
 	init_cfs_bandwidth(tg_cfs_bandwidth(tg), tg_cfs_bandwidth(parent));
 
 	for_each_possible_cpu(i) {
-		cfs_rq = kzalloc_node(sizeof(struct cfs_rq),
+		combined = kzalloc_node(sizeof(struct cfs_rq_with_se),
 				      GFP_KERNEL, cpu_to_node(i));
-		if (!cfs_rq)
+		if (!combined)
 			goto err;
 
-		se = kzalloc_node(sizeof(struct sched_entity_stats),
-				  GFP_KERNEL, cpu_to_node(i));
-		if (!se)
-			goto err_free_rq;
-
+		cfs_rq = &combined->cfs_rq;
+		se = &combined->se;
 		init_cfs_rq(cfs_rq);
 		init_tg_cfs_entry(tg, cfs_rq, se, i, parent->se[i]);
 		init_entity_runnable_average(se);
@@ -13401,8 +13400,6 @@ int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
 
 	return 1;
 
-err_free_rq:
-	kfree(cfs_rq);
 err:
 	return 0;
 }
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 475bb5998295..6f32a76d38c2 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -740,6 +740,14 @@ struct cfs_rq {
 #endif /* CONFIG_FAIR_GROUP_SCHED */
 };
 
+#ifdef CONFIG_FAIR_GROUP_SCHED
+struct cfs_rq_with_se {
+	struct cfs_rq 		cfs_rq;
+	/* cfs_rq's sched_entity on parent runqueue */
+	struct sched_entity 	se  ____cacheline_aligned;
+};
+#endif
+
 #ifdef CONFIG_SCHED_CLASS_EXT
 /* scx_rq->flags, protected by the rq lock */
 enum scx_rq_flags {
-- 
2.50.0

