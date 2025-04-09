Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A15F261593
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 12:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744200494; cv=none; b=ZLwy6awpjyRnhqJcJ3ABJj2+da4OYpzyrZxg0NIHd4f15pOIOdDbSFugMoLGsJO45vioaq4hddQLdl6Dc7OMYMJzCT82pxduJmDa/kolrd4AQ2v5qpGO4qNzExEmJrMZJKPW7TAokSIVs3903iOKdFUJLJipQ8O3esJQP26UX1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744200494; c=relaxed/simple;
	bh=9glDjXquJfqO6C9W/LiTBdIBwxP+T5lvdPxOUIqveuI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=P4gegrskyBMy3h32jAiaSVAOpBN/8GVY+lfJ9wOFh1uwQmicKCaPCg6HDWnzLGbsQtabMyHEv0G1Uxi/yAQ827Zgzq92gUMR4cRuh1X+taSdcBj5y+hLH+j6Gtw7XxC3my8NhhRhrvAsrssU2y4oYLd/ollE84Khev7hKbrwS6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=RTYvVG0E; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="RTYvVG0E"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-225df540edcso6284535ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 05:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1744200491; x=1744805291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0G4KHeZYSdHP0bakHehhXz8YvR1HH0AVesSjdKA/SFo=;
        b=RTYvVG0EK+IBMZiwS195VnrWPq9l9bpwRyLggkGqL6Tg3/AgrQ6xHl8ztRtijEW5bn
         iAPnK88WREgBEBGiFGr5ShRHp3jI/PwS5/V/GC2qrpNiXVyOhOgMMlMxC89dQfFsgoti
         iCmM+HPIk3QQ0DZcl2ykcow35KsytiBu3QBg6wJ6oD9JZPp5TbaGHFxZxAHivW06Kry3
         MoGoWQxNq/s9/ud6+VVvqeAJ/zDJUw9Evf9iPo4Di1NdImE8Ofh2Q6nTiAIs7kyoy9Uw
         ah7lM+j60a17Gsmk06xkyU6UqdMF9NNXif79ds/ae9QIte1R6lE8wlWkwo0Nxd/0tbQN
         yOyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744200491; x=1744805291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0G4KHeZYSdHP0bakHehhXz8YvR1HH0AVesSjdKA/SFo=;
        b=jMX6FpgbknjNuABmp4/uXXtEJKe2ORtANiA2DYUSI2iBkwL3kOahrLxMAa1NH6yJ33
         QQyvR023F2XKPVW5aVSdsbGenje/xMmuQKxDrjzHoYHFr+fxvk5pufZQtnNqTG1nFqVE
         z3ivbjlQr6scfIBZhJLAEtweiH22Wu5QIsbB/taQDmM+gmDuzSOjH/2NspLgN/zcTIaz
         JBp0c+B6I4M7H+2/AhZRJDX1rB6mpeDOB1CC2HxRKL31Ja9bOLMH/6FI0iCp9y4+lytK
         i/yFZ9N/QjnR0D76mo+JX9yJUwMcfJ1MwyJfwreuSo2+rwQ+fQY1t4IvmqjEELExZo9T
         GD/w==
X-Gm-Message-State: AOJu0Yy64qVvWJnRSLge3MFkRQ7C64g87JPhwMzztm7/6JIN+V5xJou7
	n9svBd2nJ2c1VwgkMKLvixFfaWfYDVJt6DD5RA4JAl8VUyOHojWW4y0ptVVfLg==
X-Gm-Gg: ASbGncuvihBflTEI4HHEvUyOXEn3zbQGdubLAGF1cHo6oWNNGbM3wXULPbeHnr7dYJe
	O73/77CizLcqODZ0iHzNRhP6F/+tUcQUJeiINTIln7BwYTW8kOpGgCs/sJr4Yn5HUASO5QfYC4N
	HUUVsLFf7ynRIBpi8JLvnyiIfftI7uv27qZOr7xalEWGVgFrNLp7MS7LVs48fPzkac1SyzI+iMJ
	s9vaIjM7hdncxtqa7uSmdWlk8A9czVv+bmxtRnn80qCUiHcJWCq7WMqQHfsbnI1EQlgBE4RZpnS
	10abIVTPtZh525hkD0F2v1m3ER+UCry0mBRG5j8RHCxj1qIQJVjgrfTE
X-Google-Smtp-Source: AGHT+IHCPanQS0GuZf7KyCMruQ/cZnhPHMapypJWdh/EsdTJuf9XaMPAcRacN2sdK9eNOuAfC3pTFw==
X-Received: by 2002:a17:902:f68d:b0:223:517a:d4ed with SMTP id d9443c01a7336-22ac325acccmr36547005ad.15.1744200491279;
        Wed, 09 Apr 2025 05:08:11 -0700 (PDT)
Received: from n37-107-136.byted.org ([115.190.40.11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b8c62dsm10017875ad.95.2025.04.09.05.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 05:08:10 -0700 (PDT)
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
Subject: [RFC PATCH v2 1/7] sched/fair: Add related data structure for task based throttle
Date: Wed,  9 Apr 2025 20:07:40 +0800
Message-Id: <20250409120746.635476-2-ziqianlu@bytedance.com>
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

From: Valentin Schneider <vschneid@redhat.com>

Add related data structures for this new throttle functionality.

Signed-off-by: Valentin Schneider <vschneid@redhat.com>
Signed-off-by: Aaron Lu <ziqianlu@bytedance.com>
---
 include/linux/sched.h |  4 ++++
 kernel/sched/core.c   |  3 +++
 kernel/sched/fair.c   | 12 ++++++++++++
 kernel/sched/sched.h  |  2 ++
 4 files changed, 21 insertions(+)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index f96ac19828934..0b55c79fee209 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -880,6 +880,10 @@ struct task_struct {
 
 #ifdef CONFIG_CGROUP_SCHED
 	struct task_group		*sched_task_group;
+#ifdef CONFIG_CFS_BANDWIDTH
+	struct callback_head		sched_throttle_work;
+	struct list_head		throttle_node;
+#endif
 #endif
 
 
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 79692f85643fe..3b8735bc527da 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -4492,6 +4492,9 @@ static void __sched_fork(unsigned long clone_flags, struct task_struct *p)
 
 #ifdef CONFIG_FAIR_GROUP_SCHED
 	p->se.cfs_rq			= NULL;
+#ifdef CONFIG_CFS_BANDWIDTH
+	init_cfs_throttle_work(p);
+#endif
 #endif
 
 #ifdef CONFIG_SCHEDSTATS
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 0c19459c80422..894202d232efd 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -5823,6 +5823,18 @@ static inline int throttled_lb_pair(struct task_group *tg,
 	       throttled_hierarchy(dest_cfs_rq);
 }
 
+static void throttle_cfs_rq_work(struct callback_head *work)
+{
+}
+
+void init_cfs_throttle_work(struct task_struct *p)
+{
+	init_task_work(&p->sched_throttle_work, throttle_cfs_rq_work);
+	/* Protect against double add, see throttle_cfs_rq() and throttle_cfs_rq_work() */
+	p->sched_throttle_work.next = &p->sched_throttle_work;
+	INIT_LIST_HEAD(&p->throttle_node);
+}
+
 static int tg_unthrottle_up(struct task_group *tg, void *data)
 {
 	struct rq *rq = data;
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index c5a6a503eb6de..921527327f107 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -2703,6 +2703,8 @@ extern bool sched_rt_bandwidth_account(struct rt_rq *rt_rq);
 
 extern void init_dl_entity(struct sched_dl_entity *dl_se);
 
+extern void init_cfs_throttle_work(struct task_struct *p);
+
 #define BW_SHIFT		20
 #define BW_UNIT			(1 << BW_SHIFT)
 #define RATIO_SHIFT		8
-- 
2.39.5

