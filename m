Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327331D54FA
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 15:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744989154; cv=none; b=qwtI3H9xdGedZChKDq4MaLCbrTKUqMGi8eq4lJCkVodmfy9UtZap3UMR2+19K7NxhQ54xaGoVv6BRzWGDGGxOpybsptSf1FG1aFLbykuCuISFK7PnUWG0Po0XljuETdSEwcMlqn92wLi0GJ110cMpIv8vpobrflHe7+b5+n22wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744989154; c=relaxed/simple;
	bh=OHfDGh2zvZh4v8uG1Yb47mK+tkd7zbGrizSgWYDOO6k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BjUiLiMgnwN/0zIDlpopSFZM+n95Q4oZ6YEDi6eevpaLHmFgQPdxW7l4doGoyP8S3ZII1KsjuTkV5wQIdXgIWXmfDpjCZwRvk4RnqMkOwI0WxECyT/QB6qpCPJLYzFIK9LBGET/4U+UO4z25GqHnhK48/MfFFDkgXA/EfFityzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hHJ6tSCX; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hHJ6tSCX"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cf06eabdaso19221665e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 08:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744989149; x=1745593949; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WhV1TM0Mbgkr4QEqFoIitrgRuSgoh6FUv77QprZ6WF8=;
        b=hHJ6tSCXdWKsCtBc5Vw74dAw9yGEDW/koqkr81lOAFiYNTbp9zkipEF8lv1iBi+MXB
         aAm06i3d+7yvcGdU5zEzPjHC2RTQKrARbKXRdLODV85B/O283+KdclDZEnyi3LzKHBYP
         5hzitc1VM7vqrkVDmkVaXF+gqTEGusjv/bY2TxBiyxcFD9GtJMP6iMjEt9XACVB93whq
         yYf6uyAy0j/Gh4QX0f0ZPh9W+ddzxAHWVq94G6mpmbGNMzJgJh+VfwwfzMFQvDHfQRlE
         HjgU7K2JuEHdDHP0AQKh+7lBiehwU9HN0a+X8J1XfG9S3Uh/W5uuaInCqWHi01rf+oG+
         sBuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744989149; x=1745593949;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WhV1TM0Mbgkr4QEqFoIitrgRuSgoh6FUv77QprZ6WF8=;
        b=tP2rQk/Gx9KcppU0KbLjRXSg0kuYkgudo3jk7kk9ulc02Z+PGayeJ6e4IjqK5esA8b
         GLy0FZhf4Oab+gfej8EI0XOFBNmCgklQA1H3ZKi7iMRgsr9FgvIXPeE0/siBQ2QiZ8Jw
         W9bXTZdn+vQA/TS14SLAK7hW+m0k8trAI/Es4SEHp5Es2S0vWNildHFqSeBS3S9MH8ZB
         hU13v+RySu3w/oM8crQtwZu2WyyUuqj9oqhKMqvlnv+tFRL/qyj9bxHfT8MQWyHmwKsh
         zcUKa4r6IDN+XKD4sWsy+iCoc3w7w1Idu67AG2Z74yFUcp5iwA0+6CnuLSTS9WCWPjMh
         sXHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzZ/Zobg1gzuFkIAzaPTVP0JKZkDYjoM27sXmhvkOFXDkdPjWGVOdh66AESa2/KhlaJYxFfClRGhRMmwM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMMxgqDSEF3oo8vZgV1V+cU9cSOm8I6JO0s+aAIyOSov3/F/h1
	T79DMpywxOvuavRH4FvNIgqLdB8NZmfjHKuYFlLDa4T6/dlFN/lCAsaYUuiqKLA=
X-Gm-Gg: ASbGncs87PG5/e7hDps8r6zqa+npMulasxEtrZiP6taY/mjRx2ivmDkPs2AhQl0QurR
	e8hG4DHuFl4pf989RA3QzfKKjokZx5a9rtAwAgHq25Znq4Oe7Q4g+2DIs5x1vbWcKc0PP3A3Uk+
	mheHFjJqNyoEkdPY4mewPOMa5Selpc+pNW1TEaR1HpWzU5oIhZ3qsHwv3j7IdTtFM2mK9g3d1Ag
	+ol+4YiKQp65258CxOWwteLC11ubuiHBJzkzJyng9km73t4k4hIEJmHzpeoQUG0prUX5d1DDUec
	ivcpiuiuCLDYM+kcLPUls0CiSWMbmTOt5Sm6iICImNMBjZPfyfCT1fm07Aff
X-Google-Smtp-Source: AGHT+IFl+uwZkkotmuxnBpjqbcXOUHL/1XRPhMTf+tYc2AydCFtes+2Ve1KTeZWmc/60u4asp7lfTQ==
X-Received: by 2002:a05:600c:a4b:b0:43d:683:8cb2 with SMTP id 5b1f17b1804b1-4406ab96871mr27872805e9.14.1744989149335;
        Fri, 18 Apr 2025 08:12:29 -0700 (PDT)
Received: from vingu-cube.. ([2a01:e0a:f:6020:1b29:23a9:fb39:a3cd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5acec8sm25138475e9.16.2025.04.18.08.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 08:12:28 -0700 (PDT)
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
Subject: [PATCH] sched/fair: Increase max lag clamping
Date: Fri, 18 Apr 2025 17:12:25 +0200
Message-ID: <20250418151225.3006867-1-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sched_entity lag is currently limited to the maximum between the tick and
twice the slice. This is too short compared to the maximum custom slice
that can be set and accumulated by other tasks.
Clamp the lag to the maximum slice that a task can set. A task A can
accumulate up to its slice of negative lag while running to parity and
the other runnable tasks can accumulate the same positive lag while
waiting to run. This positive lag could be lost during dequeue when
clamping it to twice task's slice if task A's slice is 100ms and others
use a smaller value like the default 2.8ms.

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
---
 kernel/sched/fair.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index a0c4cd26ee07..1c2c70decb20 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -683,15 +683,17 @@ u64 avg_vruntime(struct cfs_rq *cfs_rq)
  * is possible -- by addition/removal/reweight to the tree -- to move V around
  * and end up with a larger lag than we started with.
  *
- * Limit this to either double the slice length with a minimum of TICK_NSEC
- * since that is the timing granularity.
- *
- * EEVDF gives the following limit for a steady state system:
+ * Limit this to the max allowed custom slice length which is higher than the
+ * timing granularity (the tick) and EEVDF gives the following limit for
+ * a steady state system:
  *
  *   -r_max < lag < max(r_max, q)
  *
  * XXX could add max_slice to the augmented data to track this.
  */
+#define SCHED_SLICE_MIN		(NSEC_PER_MSEC/10)  /* HZ=1000 * 10 */
+#define SCHED_SLICE_MAX		(NSEC_PER_MSEC*100) /* HZ=100  / 10 */
+
 static void update_entity_lag(struct cfs_rq *cfs_rq, struct sched_entity *se)
 {
 	s64 vlag, limit;
@@ -699,7 +701,7 @@ static void update_entity_lag(struct cfs_rq *cfs_rq, struct sched_entity *se)
 	WARN_ON_ONCE(!se->on_rq);
 
 	vlag = avg_vruntime(cfs_rq) - se->vruntime;
-	limit = calc_delta_fair(max_t(u64, 2*se->slice, TICK_NSEC), se);
+	limit = calc_delta_fair(SCHED_SLICE_MAX, se);
 
 	se->vlag = clamp(vlag, -limit, limit);
 }
@@ -5189,8 +5191,8 @@ void __setparam_fair(struct task_struct *p, const struct sched_attr *attr)
 	if (attr->sched_runtime) {
 		se->custom_slice = 1;
 		se->slice = clamp_t(u64, attr->sched_runtime,
-				      NSEC_PER_MSEC/10,   /* HZ=1000 * 10 */
-				      NSEC_PER_MSEC*100); /* HZ=100  / 10 */
+				      SCHED_SLICE_MIN,
+				      SCHED_SLICE_MAX);
 	} else {
 		se->custom_slice = 0;
 		se->slice = sysctl_sched_base_slice;
-- 
2.43.0

