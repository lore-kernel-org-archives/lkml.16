Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48805262811
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 12:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744200513; cv=none; b=M+vEbKWNpLsszXBVlCvVX+sO367rABSB77nkZqpr8kMHFeWjnhjuHNNDOoAXZ+5QiBY1Dnnm5g7X1nEOuOu464+btGGRuqLolPvCbacau1MUK3WWNw1x5SahE8eRTp2kPhYH8Z+GLFfq0FDy1Y9Nwk/p97pf7E5F1X6UcM/JiOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744200513; c=relaxed/simple;
	bh=VmkTbUGH49uWbFWwHprZpcWbZczCvck7DO4P3whc+uI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aVzbFIoVqVNBr4Sr3W/GsLal/PK4TffnddAKkYKtOmMAGN2GHS5Um0tgtY+lWf7cV7Oyv+aVdj3EgUDkpbYrOv2msnDJIJpnTpwx88/wgOr2PlH5QiLdpBJTdws/Q69gkdoZm/K1+YN10urz+xZ38tAtxlBF9/RfQGJT3vS0hwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=X0iREXfq; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="X0iREXfq"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-224100e9a5cso70680995ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 05:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1744200511; x=1744805311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h9d+efQ8xuINK9fEQQiZtPNOWqjFlfihj42Q0OJNtFE=;
        b=X0iREXfqJO7pqM58nFJrWdOlD1jZbSlDpQwVPpmdg8+/qCOIu4ua/QiskReCf+V4nk
         dGrX2MI+M3gPQOHTml75FzztWfGhhMbtBzeaT1bPnv8miwsDBudYRY6jfT2bzCWDb39n
         r9GnDcCdGaImedwMysSjM/uyYJyc9u2UNqJOtSww7Qxq4RBr5SmyTKxIFnKVmBL2yfOU
         cvOHVGq0wDIOlSyKEODw7dQRiC6vfY92JXJZhMyor5R2VlyDxUTwqCFlYxt3NUH4qein
         SMfZXj0NTzehEWA8k9r7aYuUll8C5gz4Sx4D/jkjz5U1ZvMF+I6+H57iFUJiCojsWvTy
         C4vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744200511; x=1744805311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h9d+efQ8xuINK9fEQQiZtPNOWqjFlfihj42Q0OJNtFE=;
        b=RyCzhrcvMrBjmmTrq1QMHL4Tj8XPREDQljgYpqYKjkG5PE8uLFx9UbLmxtj5fwLkre
         wPz4C1/1CZGWETT3/7FqbHKAdsWPSmd/n7jWXHEjdntS/xTDKAS55du2YAT9+tEYtRIf
         P0C/luNeLsPBhTriHp6zm1zIhhv6bIYeXpvCZjvTVK9V0wP5Pj2PgAMK1l9WWcOwPTCz
         Ursgt5uCCdz/UOuphpLmkoySLtluhhJ3yiKrHT8dGxt7ArBL5MV3S67KFLIVAdgnCWED
         ZOU+F5YqjykXKU/VEFdV6pY4nG0ngfcsvvioIlsPfY63Ajf1Cu9KkM2hfCqa3YIVAoft
         02Og==
X-Gm-Message-State: AOJu0YwWH/mhgN2mZKRsEYB+YOWTSR/KneJ3mc8UcOqq5ocMyHQXW3Kc
	arddQQAM2p+b5PmLVxqzUUV+o7gLg9zxuWrf3OooB6gqMTHN4hv4NXUwvVB23w==
X-Gm-Gg: ASbGncuk8R9lBEwTrsbU0CVT714UhXB5bj4e/2+ujRtB9fU9tmNdvKd1+D7Ztp3Q5Ee
	tUzXK+ufy/ckkaKbn9YR1p7t+fjPC6CtnE/Jlju6DcxBjhZMj8KgsO5envD7f5QMQBa0V8iRjgU
	7QCR1bTlGmOUGryjz8Gc2eSk0heUN3lA5wbcCU5Ryvf/vomxRKPhIpSYJY6Np/nsfz1QBYfzNu9
	/ukW6z9OpRIxDyPB0XHb/h0y/uwwqScZ8JpVV0GHJytwO8oZm6ADcBUIn8iOrVtSMETwH8kgVoy
	upZoVM8n+MkfiZhbwCge9wtaWrVT6i4JWR0Z0TsTkvUnPwfF+m/EtUGPteM+p7efafQ=
X-Google-Smtp-Source: AGHT+IE2y5wslPjDoDurBBERMau0q7WCZLb7js7d+fFeoxj+WKnS9RsyGHo3PO6AQnMn9smocobl1w==
X-Received: by 2002:a17:902:e750:b0:224:256e:5e4e with SMTP id d9443c01a7336-22ac2991b3dmr31796375ad.16.1744200511458;
        Wed, 09 Apr 2025 05:08:31 -0700 (PDT)
Received: from n37-107-136.byted.org ([115.190.40.11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b8c62dsm10017875ad.95.2025.04.09.05.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 05:08:30 -0700 (PDT)
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
	Jan Kiszka <jan.kiszka@siemens.com>
Subject: [RFC PATCH v2 4/7] sched/fair: Take care of group/affinity/sched_class change for throttled task
Date: Wed,  9 Apr 2025 20:07:43 +0800
Message-Id: <20250409120746.635476-5-ziqianlu@bytedance.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250409120746.635476-1-ziqianlu@bytedance.com>
References: <20250409120746.635476-1-ziqianlu@bytedance.com>
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
 kernel/sched/fair.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 4152088fc0546..76b8a5ffcbdd2 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -5882,6 +5882,20 @@ void init_cfs_throttle_work(struct task_struct *p)
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
@@ -6716,6 +6730,7 @@ static inline void sync_throttle(struct task_group *tg, int cpu) {}
 static __always_inline void return_cfs_rq_runtime(struct cfs_rq *cfs_rq) {}
 static void task_throttle_setup_work(struct task_struct *p) {}
 static bool task_is_throttled(struct task_struct *p) { return false; }
+static void dequeue_throttled_task(struct task_struct *p, int flags) {}
 
 static inline int cfs_rq_throttled(struct cfs_rq *cfs_rq)
 {
@@ -7146,6 +7161,11 @@ static int dequeue_entities(struct rq *rq, struct sched_entity *se, int flags)
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

