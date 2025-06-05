Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D8F91F8733
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 07:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749107665; cv=none; b=dobOG316fqAUUwqjGoGPnxqnh8xH7PJoK2LZ+5enUpEKiRK6uMAvVDbOR28+AlKR69i6gvsinCyVifJnTaDS9ojBEj3Ntpg7UbGi/E//FCJjir+tdLNbI1kDC4EusoLdKHpx/UBBxZNM5x4SX6hU2p9xyzFNwjEr9+N+7etNbJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749107665; c=relaxed/simple;
	bh=YU9rGe6PQ/oncQIwLOd08cwWq3mkY+bBsBW0gw/jR/8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JAcRq3Zb38f5aBMObjRaf1S6NavqxhWtHsKOf0RUwY1usvZUtySoyi81iC8Pbntc6Q4Ur8eMyJgle04HDn2qaACPymePB/X0JloV2HfgGCAcSCRSJ7dX/u/P08s8ipj78sBF4+JLY8QYS7DSwxkqZzKrmGmTLFJnEPTqeiD98aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HKdNSqT5; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HKdNSqT5"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a0ac853894so505661f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 00:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749107661; x=1749712461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9nh62+5aAxVtkRzDZeSU5sYBKB02VhcaGkXgdn/hDMs=;
        b=HKdNSqT5yWcZGXcF/P/4ojT2N+Z4PACKY2e/APN0DIe5vf2fXVlFjwaIzj2tV1vIyl
         XTs1uxw9bjbpxd8kxzK+4lP8FE4ZxFtoiZvMGU/eAPO869278mpXUxmDAwKF/luWfm3s
         VWHWepXI6Sain1xRLDyc0uhJFBK1jm5YaQYznGqukYn6Yg+CSnaPILi7OUSRcxba1aOg
         dmV7XuPlyMgDFKE8Z2+U5nTJU62zeUxih0llnnUZcr+5G1HHL8p/WtV52h/WJWmK7hfk
         VQkngKfpRpx0iAUtcfV5aTe5yjcf58pYMUD6fMTVfBmP+cv453fc7bHOKM3Evj5D3PO6
         /bQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749107661; x=1749712461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9nh62+5aAxVtkRzDZeSU5sYBKB02VhcaGkXgdn/hDMs=;
        b=GfD1B7WiFRJFEiRPwjZGzP4xGagukmSk+OHt6uXT+xyU3i5J/6DB+hLzncKIpao2en
         0qLTShvjfg/x7FNBi/GTl/xuey1Znm2YWe5F65aCnQ9Ewb7xdeP5jXdQO8wikSs7cUT3
         9xb4hETRfj2s3CB5g86qKTAG+FO1+KBK8tnyc6bGK9MAbnShcbddwhlhjSYJ3Pw9Tj7x
         /SQ/cw3RUq+7R/weK1omgywQGPyOQ19jD670brBzD84gQysM7Na/Inzp0MgtVbMtFfFY
         200urvwCKAVvYmWvn1FGcDwBEBlQKm3Xql6jt5faO3i6ZeL9EF0NLIwLfU6Yp2enH6Bb
         Aevw==
X-Gm-Message-State: AOJu0YwnGzH717t91NqpJyIYNAiA05IO0BLSqQQAi7pbYshGDF2Cm71T
	pIwLDdNl79+Gdyn8mOgZU9VHbXaLPQpFR/uXjRlRNyC932Fb3K/QpPfz
X-Gm-Gg: ASbGnctX6GWlXOVIaJX4YluOZAikDjxG5j3JgUs4BtElbfiRPQshgBTwKkc671k8Obn
	makennYDFvGGFNSISY/xCEPyLqBrJzLTuqhvpbGioUlIWFuwATc0qp5y/uAVSMNp+fA75xgXfgj
	TOJpz9ldA76bjgDD4IpQpz4YsktNdoF0YTh6K46EcUXZjfy4FpSZswbkj5RZmmKq9r0A8QcKeOk
	bkatxuDeJ8j5rxHS5kvTume//SDtfUtJ0ZKSRNFtR0XeT9xJiW3dS3rS/Y8mXkR4nNl8Vz57clJ
	cMv5Y0YX+TyKfNN+cmsgtFxRz481puMjNFzHvncOwQKtmjEBi0ybEUGv/DjAO9mn
X-Google-Smtp-Source: AGHT+IGv+oN1bVg0NyG4r2WniX6HBaM/A1WRGrcYCxIUzHTSdM6xSA8ckdTGMcnQY/Nkd4WY+qpg+Q==
X-Received: by 2002:a05:6000:2207:b0:3a4:f2ed:217e with SMTP id ffacd0b85a97d-3a51d9806e6mr4449079f8f.42.1749107661414;
        Thu, 05 Jun 2025 00:14:21 -0700 (PDT)
Received: from localhost.localdomain ([78.210.56.234])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f00972b5sm23885431f8f.76.2025.06.05.00.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 00:14:21 -0700 (PDT)
From: Yuri Andriaccio <yurand2000@gmail.com>
To: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>
Cc: linux-kernel@vger.kernel.org,
	Luca Abeni <luca.abeni@santannapisa.it>,
	Yuri Andriaccio <yuri.andriaccio@santannapisa.it>
Subject: [RFC PATCH 2/9] sched/deadline: Make a distinction between dl_rq and my_q
Date: Thu,  5 Jun 2025 09:14:05 +0200
Message-ID: <20250605071412.139240-3-yurand2000@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605071412.139240-1-yurand2000@gmail.com>
References: <20250605071412.139240-1-yurand2000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: luca abeni <luca.abeni@santannapisa.it>

Create two fields for runqueues in sched_dl_entity to make a distinction between
the global runqueue and the runqueue which the dl_server serves.

Signed-off-by: luca abeni <luca.abeni@santannapisa.it>
---
 include/linux/sched.h   |  6 ++++--
 kernel/sched/deadline.c | 11 +++++++----
 kernel/sched/fair.c     |  6 +++---
 kernel/sched/sched.h    |  3 ++-
 4 files changed, 16 insertions(+), 10 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index 4f78a64be..6dd86d13c 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -725,12 +725,14 @@ struct sched_dl_entity {
 	 * Bits for DL-server functionality. Also see the comment near
 	 * dl_server_update().
 	 *
-	 * @rq the runqueue this server is for
+	 * @dl_rq the runqueue on which this entity is (to be) queued
+	 * @my_q  the runqueue "owned" by this entity
 	 *
 	 * @server_has_tasks() returns true if @server_pick return a
 	 * runnable task.
 	 */
-	struct rq			*rq;
+	struct dl_rq			*dl_rq;
+	struct rq			*my_q;
 	dl_server_has_tasks_f		server_has_tasks;
 	dl_server_pick_f		server_pick_task;
 
diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index 26cd0c559..7736a625f 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -71,11 +71,12 @@ static inline struct rq *rq_of_dl_rq(struct dl_rq *dl_rq)
 
 static inline struct rq *rq_of_dl_se(struct sched_dl_entity *dl_se)
 {
-	struct rq *rq = dl_se->rq;
+	struct rq *rq;
 
 	if (!dl_server(dl_se))
 		rq = task_rq(dl_task_of(dl_se));
-
+	else
+		rq = container_of(dl_se->dl_rq, struct rq, dl);
 	return rq;
 }
 
@@ -1685,11 +1686,13 @@ void dl_server_stop(struct sched_dl_entity *dl_se)
 	dl_se->dl_server_active = 0;
 }
 
-void dl_server_init(struct sched_dl_entity *dl_se, struct rq *rq,
+void dl_server_init(struct sched_dl_entity *dl_se, struct dl_rq *dl_rq,
+		    struct rq *served_rq,
 		    dl_server_has_tasks_f has_tasks,
 		    dl_server_pick_f pick_task)
 {
-	dl_se->rq = rq;
+	dl_se->dl_rq = dl_rq;
+	dl_se->my_q  = served_rq;
 	dl_se->server_has_tasks = has_tasks;
 	dl_se->server_pick_task = pick_task;
 }
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 7a14da539..f489e0419 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -8976,12 +8976,12 @@ static struct task_struct *__pick_next_task_fair(struct rq *rq, struct task_stru
 
 static bool fair_server_has_tasks(struct sched_dl_entity *dl_se)
 {
-	return !!dl_se->rq->cfs.nr_queued;
+	return !!dl_se->my_q->cfs.nr_queued;
 }
 
 static struct task_struct *fair_server_pick_task(struct sched_dl_entity *dl_se)
 {
-	return pick_task_fair(dl_se->rq);
+	return pick_task_fair(dl_se->my_q);
 }
 
 void fair_server_init(struct rq *rq)
@@ -8990,7 +8990,7 @@ void fair_server_init(struct rq *rq)
 
 	init_dl_entity(dl_se);
 
-	dl_server_init(dl_se, rq, fair_server_has_tasks, fair_server_pick_task);
+	dl_server_init(dl_se, &rq->dl, rq, fair_server_has_tasks, fair_server_pick_task);
 }
 
 /*
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 475bb5998..755ff5734 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -381,7 +381,8 @@ extern s64 dl_scaled_delta_exec(struct rq *rq, struct sched_dl_entity *dl_se, s6
 extern void dl_server_update(struct sched_dl_entity *dl_se, s64 delta_exec);
 extern void dl_server_start(struct sched_dl_entity *dl_se);
 extern void dl_server_stop(struct sched_dl_entity *dl_se);
-extern void dl_server_init(struct sched_dl_entity *dl_se, struct rq *rq,
+extern void dl_server_init(struct sched_dl_entity *dl_se, struct dl_rq *dl_rq,
+		    struct rq *served_rq,
 		    dl_server_has_tasks_f has_tasks,
 		    dl_server_pick_f pick_task);
 
-- 
2.49.0

