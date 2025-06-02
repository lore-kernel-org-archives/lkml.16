Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54DC228CB5
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 18:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748887572; cv=none; b=eEXUgs8s0eRFUPw4EABI4WnuONC1OYfCYTIRkFNGRZz0WdCDVqt4O0O70f8kPMxbMTO2bY3EaCFocORcIacedUvMUP+jNOdir584vak08s1aQ3nPR/VzK58u7q9eVt+AReHcrmDoICw0EOWp48I9PqUhtD5wCT80oBLsH4PT+nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748887572; c=relaxed/simple;
	bh=xt14giH4H2Boj1LehC8v8p2UGvEQ5ROsW4o3kmI6NEs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Tk0JxWB8gaJ+LR3DavUZ7fFLYWCAotKwqFKBMw31atCeBdg0O6U8QrSw6VDf9yFXVLUQaQKyel59KibVjm3vopdaeiicCGf4lm1Og4W6SZzVaYbUugaxMI3foGnoqleFSxFept7cF9hC3azuqCxOyr4Gd4BmixXaa5Mp/t3LK6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--zecheng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cDCgLPKc; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--zecheng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cDCgLPKc"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e812d1126deso2499508276.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 11:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748887568; x=1749492368; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=TCrDrn8l7ZQ01wUSaHvfLKKVmhd43n1nTteE9Ulczlg=;
        b=cDCgLPKcWRFllHkTi4FeWQ5onVOJOtDwIOQ2p1O2t/DZCXOC+uzdN1VHsGLRz3aShe
         yil294lM8LYZwb8bXiCW9xFyckN6tVwXQFnAA4pGKhkcWu1J+9XKbkvKIyWwPeglUsEg
         aR+1ppDndrWUX93xpUe8jhxQqmRDEE7QFEFUPxn4kYdcuj1FMIcimAbeNg1beV8dY43z
         fUWQjDM0sf3C2wEHlFxI7zOrad9zQHBdJnNUiTUVKLbKz/tkxPCztdgFXaju7sKvV6+8
         gGeRFCccRdEnndF+QJYjt06ngNixMFcGexjVQC0wZLxpNvCjgKhKoDb1VU/tGjvyhlJc
         OBrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748887568; x=1749492368;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TCrDrn8l7ZQ01wUSaHvfLKKVmhd43n1nTteE9Ulczlg=;
        b=vgq6HFKY/FydoJyk5YMsFY2OxqpEJhA3fvaD7CWVKoSAOasXwvHmBPgJN812vo3j3E
         Rlm5P5ZXXx8YMuXHtalY0efTfv5laeb5T5fRyfDW1VSqLNxis8RioMKaIKXupZTot08d
         4N2fjEnzK3ABdJxHqupcDCAgsvzI0YUW4I4opfUvlO33tJh1RXq7CU2gjB5dFZg6bg16
         MuFlguX6jWhBiiyhUdS7Lal3zRBDz3dL5O9whJYCTpO2d6IP56eJ+vK8XmZMtyThw5gr
         85yOn7h1//7QjNo8E+xeBQy6vesL/5uBQRamXHaKQB2qPo0KX9z2xvYbPafveA+Jpy1O
         qKNg==
X-Forwarded-Encrypted: i=1; AJvYcCVYLuqrdj/EPg5bfvMlqYxfQM5u7A9vrCDZCJ4ydyqCDInuDeamYku8vU8naHvbRnAnnTKuIi+dy3hCAIQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyB4Nc8le7c2RNhGaKFhvjQ0nrnvGZB2euNqaN8A9vKohsmyDZJ
	L+q6SjPR+nbGKQDTKkjgMavTmJ70FjAs/N961hPdixlYlRyGSzoGzcIpgXfEI+t96wu2LQIeHR5
	GD3OSE4+4ZA==
X-Google-Smtp-Source: AGHT+IHcNb6bKXDTsa0HdCWFtVoy0XH/LU/dCeX+oRa/ab36fKnnncKj2TfD6Sgznxdk3pAEH4A7mfXJlwlp
X-Received: from ybbgr8.prod.google.com ([2002:a05:6902:6208:b0:e7d:6f4c:cf59])
 (user=zecheng job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6902:c04:b0:e7d:a6f8:2eb2
 with SMTP id 3f1490d57ef6-e8128c7348dmr11955643276.35.1748887568266; Mon, 02
 Jun 2025 11:06:08 -0700 (PDT)
Date: Mon,  2 Jun 2025 18:05:43 +0000
In-Reply-To: <20250602180544.3626909-1-zecheng@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250602180544.3626909-1-zecheng@google.com>
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250602180544.3626909-4-zecheng@google.com>
Subject: [RFC PATCH v2 3/3] sched/fair: Reorder struct sched_entity
From: Zecheng Li <zecheng@google.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, Xu Liu <xliuprof@google.com>, 
	Blake Jones <blakejones@google.com>, Josh Don <joshdon@google.com>, 
	Madadi Vineeth Reddy <vineethr@linux.ibm.com>, linux-kernel@vger.kernel.org, 
	Zecheng Li <zecheng@google.com>
Content-Type: text/plain; charset="UTF-8"

Groups the mostly read fields in struct sched_entity to the head of the
struct when `CONFIG_FAIR_GROUP_SCHED` is set. The additional fields from
`CONFIG_FAIR_GROUP_SCHED` are related to CFS cgroup scheduling and were
placed far away from the hot fields `load`, `on_rq` and `vruntime`. They
are moved together to the head of the struct to exploit locality.
Although `depth` is not as hot as other fields, we keep it here to avoid
breaking the #ifdef boundaries. Adds enforced alignment of struct
sched_entity to ensure the cache group works as intended.

Also adds a compile time check when `CONFIG_FAIR_GROUP_SCHED` is set to
check the placement of the hot fields.

Signed-off-by: Zecheng Li <zecheng@google.com>
---
 include/linux/sched.h | 39 +++++++++++++++++++++------------------
 kernel/sched/core.c   | 20 ++++++++++++++++++++
 2 files changed, 41 insertions(+), 18 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index f96ac1982893..b20b2d590cf6 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -567,40 +567,43 @@ struct sched_statistics {
 } ____cacheline_aligned;
 
 struct sched_entity {
+#ifdef CONFIG_FAIR_GROUP_SCHED
+	/* Group the read most hot fields in sched_entity */
+	__cacheline_group_begin(hot);
+	struct sched_entity		*parent;
+	/* rq on which this entity is (to be) queued: */
+	struct cfs_rq			*cfs_rq;
+	/* rq "owned" by this entity/group: */
+	struct cfs_rq			*my_q;
+	/* cached value of my_q->h_nr_running */
+	unsigned long			runnable_weight;
+	int				depth;
+#endif
+	unsigned char			on_rq;
+	unsigned char			sched_delayed;
+	unsigned char			rel_deadline;
+	unsigned char			custom_slice;
 	/* For load-balancing: */
 	struct load_weight		load;
+	u64				vruntime;
+#ifdef CONFIG_FAIR_GROUP_SCHED
+	__cacheline_group_end(hot);
+#endif
 	struct rb_node			run_node;
 	u64				deadline;
 	u64				min_vruntime;
 	u64				min_slice;
 
 	struct list_head		group_node;
-	unsigned char			on_rq;
-	unsigned char			sched_delayed;
-	unsigned char			rel_deadline;
-	unsigned char			custom_slice;
-					/* hole */
 
 	u64				exec_start;
 	u64				sum_exec_runtime;
 	u64				prev_sum_exec_runtime;
-	u64				vruntime;
 	s64				vlag;
 	u64				slice;
 
 	u64				nr_migrations;
 
-#ifdef CONFIG_FAIR_GROUP_SCHED
-	int				depth;
-	struct sched_entity		*parent;
-	/* rq on which this entity is (to be) queued: */
-	struct cfs_rq			*cfs_rq;
-	/* rq "owned" by this entity/group: */
-	struct cfs_rq			*my_q;
-	/* cached value of my_q->h_nr_running */
-	unsigned long			runnable_weight;
-#endif
-
 #ifdef CONFIG_SMP
 	/*
 	 * Per entity load average tracking.
@@ -610,7 +613,7 @@ struct sched_entity {
 	 */
 	struct sched_avg		avg;
 #endif
-};
+} ____cacheline_aligned;
 
 struct sched_rt_entity {
 	struct list_head		run_list;
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index ba89cd4f2fac..dcc50df9e8ca 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -8525,6 +8525,7 @@ static struct kmem_cache *task_group_cache __ro_after_init;
 #endif
 
 static void __init cfs_rq_struct_check(void);
+static void __init sched_entity_struct_check(void);
 
 void __init sched_init(void)
 {
@@ -8543,6 +8544,7 @@ void __init sched_init(void)
 	BUG_ON(!sched_class_above(&ext_sched_class, &idle_sched_class));
 #endif
 	cfs_rq_struct_check();
+	sched_entity_struct_check();
 	wait_bit_init();
 
 #ifdef CONFIG_FAIR_GROUP_SCHED
@@ -10805,3 +10807,21 @@ static void __init cfs_rq_struct_check(void)
 #endif
 #endif
 }
+
+static void __init sched_entity_struct_check(void)
+{
+	/*
+	 * The compile time check is only enabled with CONFIG_FAIR_GROUP_SCHED.
+	 * We care about the placement of six hottest fields below.
+	 */
+#ifdef CONFIG_FAIR_GROUP_SCHED
+	CACHELINE_ASSERT_GROUP_MEMBER(struct sched_entity, hot, parent);
+	CACHELINE_ASSERT_GROUP_MEMBER(struct sched_entity, hot, cfs_rq);
+	CACHELINE_ASSERT_GROUP_MEMBER(struct sched_entity, hot, my_q);
+	CACHELINE_ASSERT_GROUP_MEMBER(struct sched_entity, hot,
+				      runnable_weight);
+	CACHELINE_ASSERT_GROUP_MEMBER(struct sched_entity, hot, on_rq);
+	CACHELINE_ASSERT_GROUP_MEMBER(struct sched_entity, hot, load);
+	CACHELINE_ASSERT_GROUP_MEMBER(struct sched_entity, hot, vruntime);
+#endif
+}
-- 
2.49.0

