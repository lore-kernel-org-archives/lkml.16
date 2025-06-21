Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D4342AAF
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 14:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750515679; cv=none; b=tkI/xZG5ey0rc7Pp/2jW4yESGi88UDbsayq9KdSgOZuZn47B8bXFDNu0v/sDjg2swr28XY2BXpqLLjBQLIngtEeaPZfPyjdmx3ArZcs2C7gOoYOLn1bG28ZFasUAlWp/VY8MpwjZU7FPhmnqdnGAXxF8iMdNJHErOQSro1OhqNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750515679; c=relaxed/simple;
	bh=a6BlRqSfHQlvefEVC08xvlJog4CEmuZAGNbXYcFf/Gc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ldlriN9dn9gZOWykhcLX7DkdHl+oJqkBW5FTCPbnjvH/4e1P4ISDnEzM+VvQwGRwdjQGE8QqOL/suRna6ckp61JnO6DGHDrLlBxKThD7Fu6cB+vbywA5GPezJsi7048vhCcZ1FzxeeZmn+Y3Fit6b2HXZJQX1cWiPd9XRqSLcU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZNmqXhMj; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZNmqXhMj"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-234f17910d8so24915855ad.3
        for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 07:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750515676; x=1751120476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vwDurvSgK2htFO9bOmxa7V8X+aB2h3beEOIpZBhlVQo=;
        b=ZNmqXhMjovNd5Em3u1OXSp2nXltEIVzlliVKfTd40/Vt2clcm5L/ageGWHh4tHURZ7
         PrqIyrwS27k3lWBPm9e2bGNaku6LGLVeE0xkw4r+RjWN4mMDdIQiJs2fC9JwYmL4SE8U
         ZpbZYkuJaCLGw6lhxPVBwhBSjtRYa/qfIm8kzCacruWKfkxCWqJ24yg3gy3VMWHcNkug
         z4pd9QCTUSAkHgx9aiEaavJMQWeMK32wm4/cATxin5YIdszjaulHmmSct3fS+/1zeHgE
         GrUSl9tGVOFhULxdT9ZxENr6def7NqN715Fom3dTIE2a8owZVR9gglTe3uJjgx8AiL0l
         zlQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750515676; x=1751120476;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vwDurvSgK2htFO9bOmxa7V8X+aB2h3beEOIpZBhlVQo=;
        b=CflCUXuMi+jEGlC84ZmY5b4RBZCqOvyTuOEk5S2g0dmsxY30hY6i0eogVla/sn7eq/
         TiMiRdM3tuHhxOxV3oiQcxN69IkntOmBY63lADL0ZpVzXSvYUcAh6URJC33NJNoWqLN3
         X5EHyRtpA9Nd8IRLYzShJ1jRM5b6xL9jbBPGlXQTq5K9CPCZOh2rIm55WGaivhqlNd1U
         XYEMW1x2IaC++mPGRGeiM+KZUZP9cF6opSEJsC0ywGgQy90/S1SwqJ2zHLd2vWvyo5s2
         OAOh9O2q31mZRT0948p+HggxYSp6NfAxEEvozmq0zf0/BdLKw5EO364Nt4GQ4gryPNIu
         FWJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGP5eXYkkbjbcmsXSgVVBJ1L3QPzH1hVXMe+Z8w+VodZ4sYknRnmZrn1m8DvUuSXEFaCSMi0CrtY4pB04=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7krnKiHlt695D37qZ0hy5VDtxUyW5mmvYZnnsbW+R/0nJYZ7G
	lk7CMFO8BcbA3Q6NgO7Zm3GyZIca8GIIQcTURZwpeFeVNwwESLJyrm5r
X-Gm-Gg: ASbGncuMt8RK+o9LiOaG7n62qOM/7P2v79b3zqKDyuH+p83+FvxFxSG1rbLopc4lVM2
	QmqzC4jbzEXrZI3kTEI5a1D4KffTwJl5r3xxUxW5NviG13QyFd2CAVvB/jWR32bcxm3MUTlSFLH
	/xcfLIVVOXO7qMYlLNOPwb6kBzO2RMiLJjZzIdlWgQ4jaiFiU1TVSKdgeRt59WP3m+hFa5E9MqE
	NlKhDo/pwCPp3Ifv7SyW9i9KsccLJlLZ/IWaquvSpnvJBH8Fb/JqzwKr9rEzcAkqoYlqsdK1d8Y
	oNral7KXhuq8RjmA69ip+1HtVG4us+rmQoDPhXgEaOfmTuem57MGmj8cMkHOi+ZRUhiZQAs=
X-Google-Smtp-Source: AGHT+IExVWfTqZj+HH7vrSo1zUInY28xVet76T3K065fZfPLGRKzo/BID7WtBN7znnRdDc81qLKZZA==
X-Received: by 2002:a17:903:1aa7:b0:234:8a4a:adad with SMTP id d9443c01a7336-237d98f9968mr105339465ad.26.1750515676512;
        Sat, 21 Jun 2025 07:21:16 -0700 (PDT)
Received: from jemmy.. ([58.246.155.81])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d86d5ea7sm40862725ad.206.2025.06.21.07.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 07:21:16 -0700 (PDT)
From: Jemmy Wong <jemmywong512@gmail.com>
To: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	linux-kernel@vger.kernel.org
Cc: jemmywong512@gmail.com
Subject: [PATCH v1] sched: Move curr check into __enqueue_entity and __dequeue_entity
Date: Sat, 21 Jun 2025 22:20:55 +0800
Message-ID: <20250621142055.7110-1-jemmywong512@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The check for se == cfs_rq->curr is common logic used before calling
__enqueue_entity and __dequeue_entity. Move this check into the respective
function bodies to simplify the code.

Signed-off-by: Jemmy Wong <jemmywong512@gmail.com>

---
 kernel/sched/fair.c | 32 +++++++++++++++-----------------
 1 file changed, 15 insertions(+), 17 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 7a14da5396fb..24cbb4b6c3fb 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -849,6 +849,9 @@ RB_DECLARE_CALLBACKS(static, min_vruntime_cb, struct sched_entity,
  */
 static void __enqueue_entity(struct cfs_rq *cfs_rq, struct sched_entity *se)
 {
+	if (unlikely(se == cfs_rq->curr))
+		return;
+
 	avg_vruntime_add(cfs_rq, se);
 	se->min_vruntime = se->vruntime;
 	se->min_slice = se->slice;
@@ -858,6 +861,9 @@ static void __enqueue_entity(struct cfs_rq *cfs_rq, struct sched_entity *se)

 static void __dequeue_entity(struct cfs_rq *cfs_rq, struct sched_entity *se)
 {
+	if (unlikely(se == cfs_rq->curr))
+		return;
+
 	rb_erase_augmented_cached(&se->run_node, &cfs_rq->tasks_timeline,
 				  &min_vruntime_cb);
 	avg_vruntime_sub(cfs_rq, se);
@@ -3797,8 +3803,6 @@ static void place_entity(struct cfs_rq *cfs_rq, struct sched_entity *se, int fla
 static void reweight_entity(struct cfs_rq *cfs_rq, struct sched_entity *se,
 			    unsigned long weight)
 {
-	bool curr = cfs_rq->curr == se;
-
 	if (se->on_rq) {
 		/* commit outstanding execution time */
 		update_curr(cfs_rq);
@@ -3806,8 +3810,7 @@ static void reweight_entity(struct cfs_rq *cfs_rq, struct sched_entity *se,
 		se->deadline -= se->vruntime;
 		se->rel_deadline = 1;
 		cfs_rq->nr_queued--;
-		if (!curr)
-			__dequeue_entity(cfs_rq, se);
+		__dequeue_entity(cfs_rq, se);
 		update_load_sub(&cfs_rq->load, se->load.weight);
 	}
 	dequeue_load_avg(cfs_rq, se);
@@ -3834,8 +3837,7 @@ static void reweight_entity(struct cfs_rq *cfs_rq, struct sched_entity *se,
 	if (se->on_rq) {
 		place_entity(cfs_rq, se, 0);
 		update_load_add(&cfs_rq->load, se->load.weight);
-		if (!curr)
-			__enqueue_entity(cfs_rq, se);
+		__enqueue_entity(cfs_rq, se);
 		cfs_rq->nr_queued++;

 		/*
@@ -5363,8 +5365,7 @@ enqueue_entity(struct cfs_rq *cfs_rq, struct sched_entity *se, int flags)

 	check_schedstat_required();
 	update_stats_enqueue_fair(cfs_rq, se, flags);
-	if (!curr)
-		__enqueue_entity(cfs_rq, se);
+	__enqueue_entity(cfs_rq, se);
 	se->on_rq = 1;

 	if (cfs_rq->nr_queued == 1) {
@@ -5506,8 +5507,7 @@ dequeue_entity(struct cfs_rq *cfs_rq, struct sched_entity *se, int flags)
 		se->rel_deadline = 1;
 	}

-	if (se != cfs_rq->curr)
-		__dequeue_entity(cfs_rq, se);
+	__dequeue_entity(cfs_rq, se);
 	se->on_rq = 0;
 	account_entity_dequeue(cfs_rq, se);

@@ -5624,14 +5624,14 @@ static void put_prev_entity(struct cfs_rq *cfs_rq, struct sched_entity *prev)
 	/* throttle cfs_rqs exceeding runtime */
 	check_cfs_rq_runtime(cfs_rq);

+	WARN_ON_ONCE(cfs_rq->curr != prev);
 	if (prev->on_rq) {
 		update_stats_wait_start_fair(cfs_rq, prev);
-		/* Put 'current' back into the tree. */
-		__enqueue_entity(cfs_rq, prev);
 		/* in !on_rq case, update occurred at dequeue */
 		update_load_avg(cfs_rq, prev, 0);
+		cfs_rq->curr = NULL;
+		__enqueue_entity(cfs_rq, prev);
 	}
-	WARN_ON_ONCE(cfs_rq->curr != prev);
 	cfs_rq->curr = NULL;
 }

@@ -6910,12 +6910,10 @@ requeue_delayed_entity(struct sched_entity *se)
 		update_entity_lag(cfs_rq, se);
 		if (se->vlag > 0) {
 			cfs_rq->nr_queued--;
-			if (se != cfs_rq->curr)
-				__dequeue_entity(cfs_rq, se);
+			__dequeue_entity(cfs_rq, se);
 			se->vlag = 0;
 			place_entity(cfs_rq, se, 0);
-			if (se != cfs_rq->curr)
-				__enqueue_entity(cfs_rq, se);
+			__enqueue_entity(cfs_rq, se);
 			cfs_rq->nr_queued++;
 		}
 	}
--
2.43.0
