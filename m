Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96592E6D30
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 14:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749823533; cv=none; b=FAUICSOjc68qp/9K8q8pmNPs8/AyfaPJK6kV3hxolXcbGzBvixcivurzz5fSiKJ7naEVaV36YEw5JCK8NrqadWcfVGGEnj7ColHuZngBNcfkf6Vet1xtHnKjh4pq5CxhS6W9Yym84y4r8biVNyCOk9gEMm7fuwnq9Us9wswzZr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749823533; c=relaxed/simple;
	bh=2eXxHhED6PDOz4B5DoRIvFYZNAZy41feC2bruyyVAjk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oeydJ1hipGtSzze5xSwhRYmyxEqZuFaORS2F+VjgHi0BP9tCq0BqfCbzlKLPjv1uj9+HTZdNOeqg9f1SYhSkwuA/oNy0utvmiF9ELjivDLJA09NlR6uN2mE88PafDqfgxSAM2js6LlbWcRi6+kxbztO0dfC5wFY3cl/64EzhbMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a8vW2LFG; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a8vW2LFG"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a53ee6fcd5so1417857f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 07:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749823530; x=1750428330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VlLCOC1uXTQGtq6J0ady+FM7lD87zFauRi/dRFmiIlk=;
        b=a8vW2LFGVH4yAhWRJn3ydEqM+UhObsoi8FOI6R6ou8jScHD0wuZ/RfmlKGgzSeNwcs
         23W8bA02Bq9aQ8lz9o+RFP5W1p0E3jIwLIMBgnPv4sOrGSN1kr/z2BaY8Y7JmNvkIB9h
         x+mEV99xtT3NqP7qcM2VHT1jGla7gHelqJUrU57jylV7jgl15iSwLklCw4srJJZjTtnl
         TmP4xUy3/HTZUDeZvaIA07X2eSpTWOuUwEeXiIzmgBXjkGc2hsHuGlRllikNv/pFxyQa
         acnFq2wS4s8T2Xyk2r640B7jzgX6EQ4317dOUv2Qo/g6LXZ7OF6d/kRW9/JLkfV5S6wy
         59wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749823530; x=1750428330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VlLCOC1uXTQGtq6J0ady+FM7lD87zFauRi/dRFmiIlk=;
        b=xEL+3RRfPFBs6x544JFDy4STH7+N8Qg1pSYWPhsq+48geXdwgYQu/tAjj9gL3GNRzf
         XFigTxXhjrKKfXxhuNXCKM1R63oIKLTppho77iPAiAh7gJc4aHzVaofCITzuP4GL7Zsb
         bbDLl0owbEFZDp3ir5hMNKOA7KNA9gGILx0jeBtoKq5hJGKy+adbpojrXSjheAmWBXhb
         mb/hmdwFY81gu1ifLhWV2nTICxgLdPRYdVl49KTt9JgweHaqsQvhlarailCv73wJoYpM
         4go688ov8sDFdiRUrMjJxHvohG4RKUN68pPWnA8yioHG/MmUTeAiJG5oP7lgyIa/Tndn
         fqVw==
X-Forwarded-Encrypted: i=1; AJvYcCUiIV7gI9gKGqUWJEORGiMd4YKrjDLfR4sa1u6vSCURxZtlc+M6eiY1k8yTO+BZuG2ZIRSD0meR0dxXC+Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGNkK9OaEw7xftoaovd1E2JKCNoaywvvCVM2uJWdpU1QwYtdZQ
	4PQN32fW3taHBn1X7uym3s8u1Z2DyHbtkkpbbRnkKH3YKC1GuL46q9uUD6fELYZJdW0=
X-Gm-Gg: ASbGncuKqFD2kkG4TJQjKl6/w1t4Dyws2lGT/FpR5V5/1yHm75NFPSCS6LlYOigU/aa
	dDmHc1BaemufFuahGcOlGbJMxokZXldAfcN0rNBUSsAt7Dg8sq8+gjkAtpeUNO7WojCiE5G4bVE
	Lv5Eo1nJoruZmiKkDJZY4RZrX1HX+uDVD1LyPkJ+c6kt6jLqsb6We3thNrQrixgBRq5Vqszm1Pd
	3bXtxRJJbDDYvYJZFJRcmNRQ9SVdYXDlW9Qar9bUuCEpwPzDXMUcosO27x6WNmKCfaxX/gX1ezd
	Ta79i2DlgZWM67m/OUCbKFCM3fnhvXM4KRHc/qibC+3MyJ/P7fcItuKte2wWjr3pTi1m4w==
X-Google-Smtp-Source: AGHT+IF15AytVCT2tzFg06jLZDIADSIK1fHSnv83Zlv8R00kApPyS6NdCtGbJ6XFm30zsMZSvB8vQA==
X-Received: by 2002:a05:6000:1ace:b0:3a4:f723:3e73 with SMTP id ffacd0b85a97d-3a5686709d3mr3065738f8f.16.1749823528506;
        Fri, 13 Jun 2025 07:05:28 -0700 (PDT)
Received: from vingu-cube.. ([2a01:e0a:f:6020:f98:f3a4:ec28:1d4e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b27795sm2472276f8f.71.2025.06.13.07.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 07:05:27 -0700 (PDT)
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
Subject: [PATCH 2/4] sched/fair: Increase max lag clamping
Date: Fri, 13 Jun 2025 16:05:12 +0200
Message-ID: <20250613140514.2781138-3-vincent.guittot@linaro.org>
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

From: Peter Zijlstra <peterz@infradead.org>

sched_entity's lag is currently limited to the maximum between the tick
and twice its slice. This is too short compared to the maximum custom
slice that can be set and accumulated by other tasks.
A task can accumulate up to its slice of negative lag while running to
parity and the other runnable tasks can accumulate the same positive lag
while waiting to run. This positive lag could be lost during dequeue when
clamping it to twice task's slice if a task's slice is 100ms and others
use a smaller value like the default 2.8ms.
Clamp the lag of a task to the maximum slice of enqueued entities plus
a tick as the update can be delayed to the next tick.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>

[ Rebased and Fix max slice computation ]

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
---
 include/linux/sched.h |  1 +
 kernel/sched/fair.c   | 41 +++++++++++++++++++++++++++++++++++++----
 2 files changed, 38 insertions(+), 4 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index 4f78a64beb52..89855ab45c43 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -576,6 +576,7 @@ struct sched_entity {
 	u64				deadline;
 	u64				min_vruntime;
 	u64				min_slice;
+	u64				max_slice;
 
 	struct list_head		group_node;
 	unsigned char			on_rq;
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 44a09de38ddf..479b38dc307a 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -676,6 +676,8 @@ u64 avg_vruntime(struct cfs_rq *cfs_rq)
 	return cfs_rq->min_vruntime + avg;
 }
 
+static inline u64 cfs_rq_max_slice(struct cfs_rq *cfs_rq);
+
 /*
  * lag_i = S - s_i = w_i * (V - v_i)
  *
@@ -689,17 +691,16 @@ u64 avg_vruntime(struct cfs_rq *cfs_rq)
  * EEVDF gives the following limit for a steady state system:
  *
  *   -r_max < lag < max(r_max, q)
- *
- * XXX could add max_slice to the augmented data to track this.
  */
 static void update_entity_lag(struct cfs_rq *cfs_rq, struct sched_entity *se)
 {
+	u64 max_slice = cfs_rq_max_slice(cfs_rq) + TICK_NSEC;
 	s64 vlag, limit;
 
 	WARN_ON_ONCE(!se->on_rq);
 
 	vlag = avg_vruntime(cfs_rq) - se->vruntime;
-	limit = calc_delta_fair(max_t(u64, 2*se->slice, TICK_NSEC), se);
+	limit = calc_delta_fair(max_slice, se);
 
 	se->vlag = clamp(vlag, -limit, limit);
 }
@@ -795,6 +796,21 @@ static inline u64 cfs_rq_min_slice(struct cfs_rq *cfs_rq)
 	return min_slice;
 }
 
+static inline u64 cfs_rq_max_slice(struct cfs_rq *cfs_rq)
+{
+	struct sched_entity *root = __pick_root_entity(cfs_rq);
+	struct sched_entity *curr = cfs_rq->curr;
+	u64 max_slice = 0ULL;
+
+	if (curr && curr->on_rq)
+		max_slice = curr->slice;
+
+	if (root)
+		max_slice = max(max_slice, root->max_slice);
+
+	return max_slice;
+}
+
 static inline bool __entity_less(struct rb_node *a, const struct rb_node *b)
 {
 	return entity_before(__node_2_se(a), __node_2_se(b));
@@ -820,6 +836,16 @@ static inline void __min_slice_update(struct sched_entity *se, struct rb_node *n
 	}
 }
 
+static inline void __max_slice_update(struct sched_entity *se, struct rb_node *node)
+{
+	if (node) {
+		struct sched_entity *rse = __node_2_se(node);
+
+		if (rse->max_slice > se->max_slice)
+			se->max_slice = rse->max_slice;
+	}
+}
+
 /*
  * se->min_vruntime = min(se->vruntime, {left,right}->min_vruntime)
  */
@@ -827,6 +853,7 @@ static inline bool min_vruntime_update(struct sched_entity *se, bool exit)
 {
 	u64 old_min_vruntime = se->min_vruntime;
 	u64 old_min_slice = se->min_slice;
+	u64 old_max_slice = se->max_slice;
 	struct rb_node *node = &se->run_node;
 
 	se->min_vruntime = se->vruntime;
@@ -837,8 +864,13 @@ static inline bool min_vruntime_update(struct sched_entity *se, bool exit)
 	__min_slice_update(se, node->rb_right);
 	__min_slice_update(se, node->rb_left);
 
+	se->max_slice = se->slice;
+	__max_slice_update(se, node->rb_right);
+	__max_slice_update(se, node->rb_left);
+
 	return se->min_vruntime == old_min_vruntime &&
-	       se->min_slice == old_min_slice;
+	       se->min_slice == old_min_slice &&
+	       se->max_slice == old_max_slice;
 }
 
 RB_DECLARE_CALLBACKS(static, min_vruntime_cb, struct sched_entity,
@@ -852,6 +884,7 @@ static void __enqueue_entity(struct cfs_rq *cfs_rq, struct sched_entity *se)
 	avg_vruntime_add(cfs_rq, se);
 	se->min_vruntime = se->vruntime;
 	se->min_slice = se->slice;
+	se->max_slice = se->slice;
 	rb_add_augmented_cached(&se->run_node, &cfs_rq->tasks_timeline,
 				__entity_less, &min_vruntime_cb);
 }
-- 
2.43.0

