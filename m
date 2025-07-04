Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5FE2D8DC8
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 14:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751639788; cv=none; b=G9UKDIpTbmim3+8rE8ESfQhCEDtUdIEuenCtxJ9MxvWl8UwmJDGLyiAYt7IMf35dDAGGDiP+tPZyTU8ZyI1lHZbTfJUj4FrwipMqJnJpTBnCkxcEmkB0JZSYcuYc2/0vVArlVymlUM2PqKwcD8vOKR6e1TcJ4EepzDSvpfl1Ezk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751639788; c=relaxed/simple;
	bh=K3IdBv+el5XcgNdSoavpeFZhuDRUnWvXjoODKRwd5TY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P8c02rdGzWdCcI8crbCUUvkjoBp/7vDD83xJIwv2OxufJ/HhMpIWWMsSAhPZhfnDhJnODZEfCaE7fa2oig2f9q/N8Wc+6zTLeULmgG9hqg2toTI4EE9GrWQ6e7XaayM4NEOMfv7ZdGqvB8A/RSt6Rviaa14GE86p0A3crmT5KkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mGSbXR2M; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mGSbXR2M"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-453749af004so4930065e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 07:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751639785; x=1752244585; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HlHWzk+mMbngQROsiCm7HVXVg8kCE36dvYmeJzMAcTk=;
        b=mGSbXR2MwFiVeQVFaoE8/z5Wp+RkM21Sae4tmKmulcqPCN1tCRP4aTBn2U2DsReza9
         jCdi5uAZEF31EClaeHZori12nTHaqlGLE/oFk6p/SNir6JisE1m/rBlXkHVIllxeWq3N
         LBlaylIkeHX8JuARjRLLmSv0UCpm+hWKfZ8SJRokADL7ejx7Un8fTpVAaTwEXfUrNftL
         vVdIYNH/cGJZCGwsfOKlZ1XtEGlP0CaeWPmD65ca6chXRjY3IQ7FrStS69BturUfUo8u
         8AMAJHWlDCUWDFLRlQ7zzm4FeB6UUKPBW3JSR/1KnmOppEx2jQSMw0r+xtSeBQcxpG6A
         wfzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751639785; x=1752244585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HlHWzk+mMbngQROsiCm7HVXVg8kCE36dvYmeJzMAcTk=;
        b=dWMfsxQsUs4w1Ikf8y922BOu1DdooipW2g51qcsGRuz9Jtq4KYTz34oDDr2HvZEVPt
         8W+cvwywxkLsd/ysQ0VOAtxTtGtPkXv5h/wxGCNj2kXZnik/pDdqNALK4/mH0bo7v/ET
         P23DegTf6GmZ7LDFSVm9IGEINRX51eIbbH2VNyxCCMclXbUWBVJ94ljZUvokwmseA5fN
         Ub+W0BmQ3m2RPiFn7bqzOB5lM+qgQT7g1UlfAHYIuPWebceDPDVRl67mC7bwNZTtOu4h
         HtGK6ZAdQTd0J5XZsMcX1uUbyl2lcOszo/2L4YmTI9s05HAsVZUWXmlISGC3cL5Qg5Ys
         h4eQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNQMIIAeCd6rVIwI5D4noQMU4iuNFoTe/Mpip2Tpe9y6pKvcJwG6gkPCBl5T//MDP0GozRHoUGest+ejo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdlLDmFMKNx2Bitj6uJIkCPiFG9C2nnLIfh98P8qkj2r+7kku9
	uTQI90PHUeI8b4cuCyIZ81hIJppe/rmn6k4oLC/A+QENV9miXdxQpL8qH67iE2nILR8=
X-Gm-Gg: ASbGncvYshll2w9mIaQxC2NY0ngj5FcnZ1tgyX9lfeQna/E3cLk6GROH8nqCBwRhj1N
	RyUW7DihbHpu3Aq9LpyU1rUbMu6rbOZAXe9V3QsRcijXWmZFR3L6cJ/M+9WP5LNfLz6KcXg8lPP
	TzqXV2XkV6Y8WDKi95uxl9WJ/AvUaJgF3yesJhPqM3Oy+Su3H24+FpgIbJiPIpKFUxGMJyAUrOi
	QLOE8QeHgrcEGch+rc0DO5jIxjUOZF3mFI3V+tIjtlzmwAKy7NGUcDqIc1IeWH25zVR7l//Gcd4
	k/JgDkl/hQoMOpY3E9OMibBx+b7pQYAzmFdpvrBnHgv2CJ7iZbqf9PHWJY/mx+NibRsSBwE=
X-Google-Smtp-Source: AGHT+IGvvno6QlrWBE/NdjghYUhex+mwx0AnVdFXd2l6QiVmsJOhVKLHywWVUqvnXSGBpQ40EPsH5Q==
X-Received: by 2002:a05:600c:4e8f:b0:450:d614:cb with SMTP id 5b1f17b1804b1-454b31158e6mr27299975e9.33.1751639785291;
        Fri, 04 Jul 2025 07:36:25 -0700 (PDT)
Received: from vingu-cube.. ([2a01:e0a:f:6020:7ff5:bbf8:9357:784a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b4708d0beesm2690186f8f.36.2025.07.04.07.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 07:36:23 -0700 (PDT)
From: Vincent Guittot <vincent.guittot@linaro.org>
To: mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	dhaval@gianis.ca,
	linux-kernel@vger.kernel.org
Cc: Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH v2 5/6] sched/fair: Fix entity's lag with run to parity
Date: Fri,  4 Jul 2025 16:36:11 +0200
Message-ID: <20250704143612.998419-6-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704143612.998419-1-vincent.guittot@linaro.org>
References: <20250704143612.998419-1-vincent.guittot@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When an entity is enqueued without preempting current, we must ensure
that the slice protection is updated to take into account the slice
duration of the newly enqueued task so that its lag will not exceed
its slice (+ tick).

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
---
 kernel/sched/fair.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 2a0348b0cc3d..58f25f0be25f 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -889,12 +889,12 @@ struct sched_entity *__pick_first_entity(struct cfs_rq *cfs_rq)
  * When run to parity is disabled, we give a minimum quantum to the running
  * entity to ensure progress.
  */
-static inline void set_protect_slice(struct sched_entity *se)
+static inline void set_protect_slice(struct cfs_rq *cfs_rq, struct sched_entity *se)
 {
 	u64 quantum;
 
 	if (sched_feat(RUN_TO_PARITY))
-		quantum = cfs_rq_min_slice(cfs_rq_of(se));
+		quantum = cfs_rq_min_slice(cfs_rq);
 	else
 		quantum = normalized_sysctl_sched_base_slice;
 	quantum = min(quantum, se->slice);
@@ -905,6 +905,13 @@ static inline void set_protect_slice(struct sched_entity *se)
 		se->vlag = se->deadline;
 }
 
+static inline void update_protect_slice(struct cfs_rq *cfs_rq, struct sched_entity *se)
+{
+	u64 quantum = cfs_rq_min_slice(cfs_rq);
+
+	se->vlag = min(se->vlag, (s64)(se->vruntime + calc_delta_fair(quantum, se)));
+}
+
 static inline bool protect_slice(struct sched_entity *se)
 {
 	return ((s64)(se->vlag - se->vruntime) > 0);
@@ -5468,7 +5475,7 @@ set_next_entity(struct cfs_rq *cfs_rq, struct sched_entity *se)
 		__dequeue_entity(cfs_rq, se);
 		update_load_avg(cfs_rq, se, UPDATE_TG);
 
-		set_protect_slice(se);
+		set_protect_slice(cfs_rq, se);
 	}
 
 	update_stats_curr_start(cfs_rq, se);
@@ -8730,6 +8737,9 @@ static void check_preempt_wakeup_fair(struct rq *rq, struct task_struct *p, int
 	if (__pick_eevdf(cfs_rq, !do_preempt_short) == pse)
 		goto preempt;
 
+	if (sched_feat(RUN_TO_PARITY) && do_preempt_short)
+		update_protect_slice(cfs_rq, se);
+
 	return;
 
 preempt:
-- 
2.43.0

