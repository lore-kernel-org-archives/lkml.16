Received: from mail-qk1-f201.google.com (mail-qk1-f201.google.com [209.85.222.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2461F4626
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 21:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743629379; cv=none; b=smx1yakToDd9mlNwIhH31rjjBeI/77yVVtKpCXuqVfPDdIKUpN96AtwKAjHIUHC8KRg8kSCvUDajPlxzBmgGdJsWseznHKp5g9gyXt5gKask/RhfUGbIcQVqwZFG/nUmT3w6EOnqxXZYDj8T8wWi1Al5T+JYW3c3yonnzNAFEzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743629379; c=relaxed/simple;
	bh=2G7UjKnIOjEPAPd3NhOenv5qzdjdy1SHNhYpKWoUmIc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=IXUXO2JlJlZpeAOUTW3OuapCVWWY96tXZU6Vyqx2QwiLIlsgC4CpoACZdXJQWlf7tyD3RGt0/+V3jQ5t26Y0Bz4MxT9eEQ+no1mYHJSVgF1CYKRC76mS+QlnkRCU8UIAW5v8BbjOV8kKR+Hfz8BRw9bXb5LAXzFp2VwGoNHrj88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--zecheng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=k6vEFLwa; arc=none smtp.client-ip=209.85.222.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--zecheng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="k6vEFLwa"
Received: by mail-qk1-f201.google.com with SMTP id af79cd13be357-7c5d608e6f5so54289485a.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 14:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743629377; x=1744234177; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rU8F8RZIMGWJj4A3yvo+APx32OMnN5qYRGx2eoq/58A=;
        b=k6vEFLwa3Up4s3l+Fyyju5wldd/ZodELFNHvScWDf8Rq9h1zWKwR86GfWxJXTXqY06
         KgXE3ui1g4aoMA2yeif6hCpRG0wqAXuQDhWaRr1bTIaqACtXzwisHuFoQzAhjYaYhB97
         LexAThitr4r/TPe94TQdh+zCeOSjnfJcGZW/DpIUzDPvfNSmbJ9qYBWEIx+7aC4wU8yb
         HkCaLqt5csymV4g02dbm2IzXfcz06fLQMzp+PCfVcXXyYbXqETUYHnKwx1mFvvxe14R3
         dKIOi2jN1jgjsTQoMW2TEuMmF8rdW2XKvYM7Z8UUvSEdxJ9uD4kT11waUGCW7nw+/RN8
         aJjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743629377; x=1744234177;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rU8F8RZIMGWJj4A3yvo+APx32OMnN5qYRGx2eoq/58A=;
        b=SbGRTzeWs7Exstqlrxgj/sFRFVQW/Jp5rAscfgDj/Z/N7NLKso/Ot5jmgERZgyMU0o
         Eal4Zr7mF+wukFWL+MaU5I/5O/xJnr2Cw4nAHfeyM+bD0SZhz0qA4KEO0rFivJDlBzZM
         xAhAOkOHHGeN5TcF9BBE+xgRexGUaxWzmh0BwQyI3jReYQBlq4102GJCU+K7vfLVZxqx
         wWPXJahvQDU54YTUzdr2EyIRXrHQfXSu338kjemSV8uELviuPRLeWr9zbGb7c8dwNzIH
         wMTJLfRCRzQm4w8HP6XWeSqeIroVMKI0xAh8ezirJ5fj3x9xH/kvWVAjHXoCteKwBL65
         3n0A==
X-Forwarded-Encrypted: i=1; AJvYcCVvjpsn7mLWBpPxQsqQgNbPcG000XJTlujgiPjW/LmVuggtg5a3IX3dqe8JJiYNhhd025k7kfg6jvSW4pc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwW72V450AQbrg1bN0zbAZw79y0mAPINddg2Ijlx1cHZ787ZB9u
	KbV9pGp5LcVG8XF2q6ICsVSdx5TnG6mwaK28ISsrl/UthMrLWs9Y/dtEGv14Ur4OnJTd/NWrz80
	0T/Tkdw==
X-Google-Smtp-Source: AGHT+IEmwLTLK2l/g92J7Xh04IuA4bjjXeYkHBGRcQOgu+8USi5mFl6Ah6iy2T14rAfCQa8zwhyGXvZPRV8P
X-Received: from qknri8.prod.google.com ([2002:a05:620a:8f88:b0:7c3:cf05:bbdf])
 (user=zecheng job=prod-delivery.src-stubby-dispatcher) by 2002:a05:620a:4487:b0:7c5:6291:904d
 with SMTP id af79cd13be357-7c76dfc5844mr19068485a.38.1743629377115; Wed, 02
 Apr 2025 14:29:37 -0700 (PDT)
Date: Wed,  2 Apr 2025 21:29:02 +0000
In-Reply-To: <20250402212904.8866-1-zecheng@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250402212904.8866-1-zecheng@google.com>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250402212904.8866-3-zecheng@google.com>
Subject: [RFC PATCH 2/2] sched/fair: Reorder struct sched_entity
From: Zecheng Li <zecheng@google.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, Xu Liu <xliuprof@google.com>, 
	Blake Jones <blakejones@google.com>, Josh Don <joshdon@google.com>, linux-kernel@vger.kernel.org, 
	Zecheng Li <zecheng@google.com>
Content-Type: text/plain; charset="UTF-8"

Group the mostly read fields in struct sched_entity to the first
cacheline when `CONFIG_FAIR_GROUP_SCHED` is set. This moves the
additional fields from `CONFIG_FAIR_GROUP_SCHED` to the first cache line
since they are mostly accessed and generally read most. Currently these
fields related to cfs cgroup scheduling is placed on a separate
cacheline from hot fields `load`, `on_rq` and `vruntime`. Although
`depth` is not as hot as other fields, we keep it here to avoid breaking
the #ifdef boundaries.

Also adds a compile time check when `CONFIG_FAIR_GROUP_SCHED` is set to
check the placement of the hot fields.

Signed-off-by: Zecheng Li <zecheng@google.com>
---
 include/linux/sched.h | 37 ++++++++++++++++++++-----------------
 kernel/sched/core.c   | 20 ++++++++++++++++++++
 2 files changed, 40 insertions(+), 17 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index 9c15365a30c0..e9f58254999d 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -545,40 +545,43 @@ struct sched_statistics {
 } ____cacheline_aligned;
 
 struct sched_entity {
+#ifdef CONFIG_FAIR_GROUP_SCHED
+	/* Group the read most hot fields in sched_entity in a cache line */
+	__cacheline_group_begin_aligned(hot);
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
+	__cacheline_group_end_aligned(hot);
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
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 84ee289d98d7..58bcd7d55eca 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -8474,6 +8474,7 @@ static struct kmem_cache *task_group_cache __ro_after_init;
 #endif
 
 static void __init cfs_rq_struct_check(void);
+static void __init sched_entity_struct_check(void);
 
 void __init sched_init(void)
 {
@@ -8492,6 +8493,7 @@ void __init sched_init(void)
 	BUG_ON(!sched_class_above(&ext_sched_class, &idle_sched_class));
 #endif
 	cfs_rq_struct_check();
+	sched_entity_struct_check();
 	wait_bit_init();
 
 #ifdef CONFIG_FAIR_GROUP_SCHED
@@ -10755,3 +10757,21 @@ static void __init cfs_rq_struct_check(void)
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

