Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70601BD035
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 07:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749107663; cv=none; b=DiHyDwQcjNQLLWXjV3IqlroEWmXaiXzf5+wkvTZ3ARijWLavWQD/9jRSDipa019/Dks1/I9QKAEEeShw62CJ5crA1LCgnkgxNvxS9ildDKjIYqDTZNlcX0ZQzr4YIl9GvGhaAF1htV53SiSBYCPAXcT1a8LFAaLhaSJPTlOymT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749107663; c=relaxed/simple;
	bh=l+ADq0dkQ0ISKn3AbvpIXY0kRmGqx3DmbHvcx4xzB6s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gKF08y3kaIjdfGFEV3Ftsm7ezUth9+2Vx2On7+wxKOvB2kIAlQ0Y7/lEhwu5FEYQMIc9rmHPrL918KXx/lfJID3SMmHUX0aMj91rn+zXvyVZAG7651ogCtxSMGuiT8NhmvwT8yfXKFKLhUWvOOXzr+acPvYV5Ikxiwq64aoPgpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GNI2AHV5; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GNI2AHV5"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a3673e12c4so348033f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 00:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749107660; x=1749712460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4bgsNX+3yqAc+84E0G9kZgZo/o3wMNKh9J6Vou91qVE=;
        b=GNI2AHV5ubOyVAnybhDvrlz82/ASQKC7DzW+x7N2N1TBGZxBPT44ljB6F8NXKfvfcJ
         nUWaeTWbmO83pAoD6h5/L+LarYQ7Dd1CFp76t19fB48Hc2IW4taHfJZ0KP0niTm+tipu
         AB7dA11YyXzxknJSH/4Rt/GsF+0KOTjGtna3VLJn2hnTnIhxp7e6dSAMe8MlCsuGSwem
         cKkB75O4d6G4+GGdpPhyOZyyt4HG8leDpcW8JpCmmUcwglLcSjDIa0KR2cQnFBpfA9DT
         5B5ApF6zlzJfdH6M1BbruS4VFlrUZxWOXz5wv1gpeN2wA3WOnZN23sZA/6fZlajpJcS3
         0QpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749107660; x=1749712460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4bgsNX+3yqAc+84E0G9kZgZo/o3wMNKh9J6Vou91qVE=;
        b=Dt4kfY8+VqxlZqRX+XW5wxb3lmwIVqRl7bEAp7fsdVKiJJZk4kHm950b5KjAngY4/d
         3ayrQslVOTAcV1LaSLv6/PNRLmlFFn6HsPMYfHiNZGXuEaOvrYGCJeG9tcPVrn6oAlS+
         vMUCfCawdtZiSBxH+FwNoxVqmU+ryv0V/NGxEo7wGgPdUK+EcmL3mO3jpPSn/aFykBdH
         f5dw6/GVtkK2z/k5Nxr95ICZhAnqAq1gMFp+elaHkMqGwpZxF0SlYC4jxHrdeoV5mKog
         lP+c8bj7gtqmNf7HuMF0jxBpxJ2H+ERm0FxFyhNfW+ronQK/q8U8DNHUsjjSVlycnqmI
         87tQ==
X-Gm-Message-State: AOJu0YxT0ie7dW1BXQhrsTwApXuPQRcl2frW5h1fZPFFB5sZoE1yJIb3
	x4suuQxWoxr6EINgzby3gIDAAg0mBHH9zhJAWuV1Mb0vEPJS1orsxOLN
X-Gm-Gg: ASbGncvVZ9A91+SsbP8fzch4nlzXfy6o4laFEBIWCet8FtmMrqKA/PIUDS2h+A8P3Qy
	wGX5KIjFU+bQ+Ac5xykAPCTU2vPdvPv54lMaSQxpvj0XxVSzLllbSlDVpApPGoO0GhsSd5keXnr
	P/ep+FgpOteAu1RNBj8uU4YOeA9/m5uEAfy29RslQFfN+4cdQlvclCOa+1lCPs6sfe8Bex2QkNH
	rRH1hvL2NUpPMgRy3FaouxtMx2Trwab08udNBvIA8zBFBuZ+pxHOOJU3a9Ls4/eHfeBNy3veK9i
	09ELCHkM/pWvtspQikwLfliS6ks+MtvzEkj5Tw327GIq42efGqoBY0OBZCI0JlA6
X-Google-Smtp-Source: AGHT+IHKRat52YZ2v9YBVBgALfknsV6OcA4Bw2gnvLID8VBbh1J5mB1Y3NobJd5cyaYad2I0lchxFw==
X-Received: by 2002:a05:6000:24c8:b0:3a4:f520:8bfc with SMTP id ffacd0b85a97d-3a51d95874fmr4682403f8f.36.1749107659790;
        Thu, 05 Jun 2025 00:14:19 -0700 (PDT)
Received: from localhost.localdomain ([78.210.56.234])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f00972b5sm23885431f8f.76.2025.06.05.00.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 00:14:19 -0700 (PDT)
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
Subject: [RFC PATCH 1/9] sched/deadline: Do not access dl_se->rq directly
Date: Thu,  5 Jun 2025 09:14:04 +0200
Message-ID: <20250605071412.139240-2-yurand2000@gmail.com>
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

Make deadline.c code access the runqueue of a scheduling entity saved in the
sched_dl_entity data structure. This allows future patches to save different
runqueues in sched_dl_entity other than the global runqueues.

Signed-off-by: luca abeni <luca.abeni@santannapisa.it>
---
 kernel/sched/deadline.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index ad45a8fea..26cd0c559 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -935,7 +935,7 @@ static void replenish_dl_entity(struct sched_dl_entity *dl_se)
 	 * and arm the defer timer.
 	 */
 	if (dl_se->dl_defer && !dl_se->dl_defer_running &&
-	    dl_time_before(rq_clock(dl_se->rq), dl_se->deadline - dl_se->runtime)) {
+	    dl_time_before(rq_clock(rq), dl_se->deadline - dl_se->runtime)) {
 		if (!is_dl_boosted(dl_se) && dl_se->server_has_tasks(dl_se)) {
 
 			/*
@@ -1244,11 +1244,11 @@ static enum hrtimer_restart dl_server_timer(struct hrtimer *timer, struct sched_
 			 * of time. The dl_server_min_res serves as a limit to avoid
 			 * forwarding the timer for a too small amount of time.
 			 */
-			if (dl_time_before(rq_clock(dl_se->rq),
+			if (dl_time_before(rq_clock(rq),
 					   (dl_se->deadline - dl_se->runtime - dl_server_min_res))) {
 
 				/* reset the defer timer */
-				fw = dl_se->deadline - rq_clock(dl_se->rq) - dl_se->runtime;
+				fw = dl_se->deadline - rq_clock(rq) - dl_se->runtime;
 
 				hrtimer_forward_now(timer, ns_to_ktime(fw));
 				return HRTIMER_RESTART;
@@ -1259,7 +1259,7 @@ static enum hrtimer_restart dl_server_timer(struct hrtimer *timer, struct sched_
 
 		enqueue_dl_entity(dl_se, ENQUEUE_REPLENISH);
 
-		if (!dl_task(dl_se->rq->curr) || dl_entity_preempt(dl_se, &dl_se->rq->curr->dl))
+		if (!dl_task(rq->curr) || dl_entity_preempt(dl_se, &rq->curr->dl))
 			resched_curr(rq);
 
 		__push_dl_task(rq, rf);
@@ -1527,7 +1527,7 @@ static void update_curr_dl_se(struct rq *rq, struct sched_dl_entity *dl_se, s64
 
 		hrtimer_try_to_cancel(&dl_se->dl_timer);
 
-		replenish_dl_new_period(dl_se, dl_se->rq);
+		replenish_dl_new_period(dl_se, rq);
 
 		/*
 		 * Not being able to start the timer seems problematic. If it could not
@@ -1640,12 +1640,12 @@ void dl_server_update(struct sched_dl_entity *dl_se, s64 delta_exec)
 {
 	/* 0 runtime = fair server disabled */
 	if (dl_se->dl_runtime)
-		update_curr_dl_se(dl_se->rq, dl_se, delta_exec);
+		update_curr_dl_se(rq_of_dl_se(dl_se), dl_se, delta_exec);
 }
 
 void dl_server_start(struct sched_dl_entity *dl_se)
 {
-	struct rq *rq = dl_se->rq;
+	struct rq *rq;
 
 	/*
 	 * XXX: the apply do not work fine at the init phase for the
@@ -1656,9 +1656,9 @@ void dl_server_start(struct sched_dl_entity *dl_se)
 		u64 runtime =  50 * NSEC_PER_MSEC;
 		u64 period = 1000 * NSEC_PER_MSEC;
 
+		dl_se->dl_server = 1;
 		dl_server_apply_params(dl_se, runtime, period, 1);
 
-		dl_se->dl_server = 1;
 		dl_se->dl_defer = 1;
 		setup_new_dl_entity(dl_se);
 	}
@@ -1668,8 +1668,9 @@ void dl_server_start(struct sched_dl_entity *dl_se)
 
 	dl_se->dl_server_active = 1;
 	enqueue_dl_entity(dl_se, ENQUEUE_WAKEUP);
-	if (!dl_task(dl_se->rq->curr) || dl_entity_preempt(dl_se, &rq->curr->dl))
-		resched_curr(dl_se->rq);
+			rq = rq_of_dl_se(dl_se);
+	if (!dl_task(rq->curr) || dl_entity_preempt(dl_se, &rq->curr->dl))
+		resched_curr(rq);
 }
 
 void dl_server_stop(struct sched_dl_entity *dl_se)
@@ -1712,7 +1713,7 @@ int dl_server_apply_params(struct sched_dl_entity *dl_se, u64 runtime, u64 perio
 {
 	u64 old_bw = init ? 0 : to_ratio(dl_se->dl_period, dl_se->dl_runtime);
 	u64 new_bw = to_ratio(period, runtime);
-	struct rq *rq = dl_se->rq;
+	struct rq *rq = rq_of_dl_se(dl_se);
 	int cpu = cpu_of(rq);
 	struct dl_bw *dl_b;
 	unsigned long cap;
@@ -1789,7 +1790,7 @@ static enum hrtimer_restart inactive_task_timer(struct hrtimer *timer)
 		p = dl_task_of(dl_se);
 		rq = task_rq_lock(p, &rf);
 	} else {
-		rq = dl_se->rq;
+		rq = rq_of_dl_se(dl_se);
 		rq_lock(rq, &rf);
 	}
 
-- 
2.49.0

