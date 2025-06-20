Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67EC0220696
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 12:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750422474; cv=none; b=sGG8xumUnRetSaS90nRvgzpnZY8LBZoktRcrYyUA2d+/6ALZq+mUmSpkdl5PImAMORw2v/IHSpqwHBph5JjDW0pE8fPmde/yvrqwJSAVEuPWu2aFzlQGARfwTN0MAgZ74QaQqQHMlASE2VJyutmcVIwchiRtLeeOSKIbDuDRDWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750422474; c=relaxed/simple;
	bh=+X4HipRIq+J2ON+qLoXQtPdB6JpfFCAxFh5A9SABbH0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Om7eIwSw22+70jeQj1Jkgr+QhXZJBJMMkyGgU9MJN3W3u3OwbeaqPWbhGVSiuGmRX0RptUA/NSjUyWutJk3S4rD9t2/RGu8Kt3v2utAlzd2vzS56OcSHM6KVH9USJL0zGj2XCh1Tlt64EeEYMlqKPMsWiqI4aNCRwEwyyuxcCfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KDhQBldA; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KDhQBldA"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2353a2bc210so14970715ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 05:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750422473; x=1751027273; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QEocjAYqKEkY+hSTJFMKsjk9/XRXyymLEZn31502qxk=;
        b=KDhQBldAEXxSVA5VuENMis5tRdoj9rTOiNPX0ppsR7hPCZdUK6DxDg5/pRajrYve5D
         G+Vausd1qodSvv7JFBUEY4+ie+pT8XtE2tQfKJ2mPh7HaBh4fUKHgQzstnBQD2zG4H81
         kK+mP6uYD56mCPR/ad/dWR8syXVchi1VYyp6sdvB9OoIpWACkza1ZXt/uLObq7B34u82
         vyABFXE7tlG1lz8Zi4qDYU7qlIPECcqt3vBpqMHZRUMOLZn0sH3c5lKjS7fKtZ03yevV
         Fy5JxbZeRuOWiuODK9tCLCmCLBygA3wMfuRW8sK+dDAH01+xEq7vqsgRrQqYY2w6QMFo
         MmXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750422473; x=1751027273;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QEocjAYqKEkY+hSTJFMKsjk9/XRXyymLEZn31502qxk=;
        b=C+z/6CU556woiTCwcIcE5JCEr+so6TEjtwMYsxdJq7ggKqcc6GYGdDCTG+5Gk1YHCw
         998c9enJFfhY9ItZcYSC/89IxMobbvAjdRdPCTkti48jWFQteaqiUDjVqPTHj1seTLrD
         QuZFBQ652EaGooYDbJ0Ffu9GBdoeCq6YEZyG+9OFtS3AFhXW6eG7XUZmup/EXMYYR10n
         9Wk0pL7zgMUKEF4hWG3AkDxB9KK+PjPbQNGf8eou8pvlBgMYyjDAJiCiI+/wcWhROccD
         qqhK0UDJ94TU4BqqrkmF9ZmXCFAz7I1bg+IbHCw5ywPgxTgtLEbWkCv6hsyRIWogN4kw
         9PZA==
X-Forwarded-Encrypted: i=1; AJvYcCUqyhhtHiOz+SYP99e17RRMQo7RVDamcEBT/TozagRPG1yIciaP/OIDSyY57GH9rOqcHbAYnZ128CkS3Lg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjDjuMVnyCBYP4BeRy8bQNxgHFLTgxvCstUysog7ypci/XOJyS
	Confc7gYCWaFm0N0aajGxnWhpuKh+xthkrHxMjNYVEr4AM0lgXvvze12z9QOSjBM
X-Gm-Gg: ASbGncvffjBGdy4bvEDgQKA3Wi1xiIsmm8ixm+5s9SJrxqh9UaOjBZvswGmwzi7MnGd
	rMFgFvptk3z2l751sxQH6tB65no2cMz46DC0RhyOHBmN1USw5vtq+uCXQoyASgLrZGrdrna18mG
	SwBLCPSrSzWDLsEEJ3yW8z7p7gY/cGtL2bK37yhOgv/7mwp40z5OTf7BTw8fMweUfRldPWpnayV
	HSssHYjGVw+ZF4V1Gyn+x+Lj93cScZTuw6E2xXSsgKcfeIm8VwF58bbkzI112PqSB4rRRkiegOZ
	IEbBmW/JvYo/1jZD2uB/lq7uXYddgwryQmpdZberEIxHy0EMQ/REKgsM81rpvR/+18IVtvzyxbF
	hLeXEXNjn
X-Google-Smtp-Source: AGHT+IEnXi6DBx0CYmyTvYOiLCXe6zhbTcGB7f/MIED+yLrawXV25RkssTAqsM1VJ+h9BEOJeGr6lA==
X-Received: by 2002:a17:902:e842:b0:235:7c6:ebd2 with SMTP id d9443c01a7336-237d991f9f4mr44340985ad.31.1750422472749;
        Fri, 20 Jun 2025 05:27:52 -0700 (PDT)
Received: from shark.hitronhub.home ([2407:4d00:ac00:1c13:9629:b33c:2fa:30fa])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d83d101esm17622575ad.64.2025.06.20.05.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 05:27:52 -0700 (PDT)
From: Shou-Chi Chen <tuxsogi@gmail.com>
To: mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org
Cc: dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	linux-kernel@vger.kernel.org,
	Shou-Chi Chen <tuxsogi@gmail.com>
Subject: [PATCH] sched/deadline: Fix typo "a entity" to "an entity" in comment
Date: Fri, 20 Jun 2025 20:26:30 +0800
Message-Id: <20250620122630.1113563-1-tuxsogi@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Corrected a grammatical mistake in the comment of deadline.c,
changing "a entity" to "an entity" to conform with proper English usage.

Signed-off-by: Shou-Chi Chen <tuxsogi@gmail.com>
---
 kernel/sched/deadline.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index ad45a8fea..e1c0a2443 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -848,20 +848,20 @@ static bool dl_entity_overflow(struct sched_dl_entity *dl_se, u64 t);
 
 /*
  * Pure Earliest Deadline First (EDF) scheduling does not deal with the
- * possibility of a entity lasting more than what it declared, and thus
+ * possibility of an entity lasting more than what it declared, and thus
  * exhausting its runtime.
  *
  * Here we are interested in making runtime overrun possible, but we do
- * not want a entity which is misbehaving to affect the scheduling of all
+ * not want an entity which is misbehaving to affect the scheduling of all
  * other entities.
  * Therefore, a budgeting strategy called Constant Bandwidth Server (CBS)
  * is used, in order to confine each entity within its own bandwidth.
  *
  * This function deals exactly with that, and ensures that when the runtime
- * of a entity is replenished, its deadline is also postponed. That ensures
+ * of an entity is replenished, its deadline is also postponed. That ensures
  * the overrunning entity can't interfere with other entity in the system and
  * can't make them miss their deadlines. Reasons why this kind of overruns
- * could happen are, typically, a entity voluntarily trying to overcome its
+ * could happen are, typically, an entity voluntarily trying to overcome its
  * runtime, or it just underestimated it during sched_setattr().
  */
 static void replenish_dl_entity(struct sched_dl_entity *dl_se)
@@ -3104,7 +3104,7 @@ static void prio_changed_dl(struct rq *rq, struct task_struct *p,
 
 	if (task_current_donor(rq, p)) {
 		/*
-		 * If we now have a earlier deadline task than p,
+		 * If we now have an earlier deadline task than p,
 		 * then reschedule, provided p is still on this
 		 * runqueue.
 		 */
@@ -3123,7 +3123,7 @@ static void prio_changed_dl(struct rq *rq, struct task_struct *p,
 	}
 #else
 	/*
-	 * We don't know if p has a earlier or later deadline, so let's blindly
+	 * We don't know if p has an earlier or later deadline, so let's blindly
 	 * set a (maybe not needed) rescheduling point.
 	 */
 	resched_curr(rq);
-- 
2.34.1

