Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61EFC1D5160
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 14:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751639783; cv=none; b=SZN7tJyxYqAN9YwLc5P9aj7gnvoEB6Q5lgKYFbdYQ3fhCTEb8rqQuaH1AnZwTiS3crFF8dOW6vL5f01CK9ftsQ88HuBeHa0pQ6KtrofoswHQj8GCFOQlcwZe6SauR/ddTZwKhy/yfP2leNLwYK0BwMxFSR/JLluwERPCv+/3t18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751639783; c=relaxed/simple;
	bh=IMei/8c6pmBRsKoOsdcBeLsytStZSh1iZmG6LyRhsE8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kp05G1iApLl08fdJylScvxe7jht6FFoHrtmEG52DHadVoZnwiYCjgJ4C/vGXMpnCCPd2CNnLT/5BLRA+wfFqlGB7B11RPYX9rWPLBWXoisqNUz6J722NLtObebIPtaycdcVprkoSSAWGAldh91OJ1uah8cazGEXN3A9gIOP0IsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wANgeTTj; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wANgeTTj"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a6e8b1fa37so750212f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 07:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751639780; x=1752244580; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bRdhy0PS9cNMbTKE1Nz2Cs1tq+5xbD9yaeYP0EZmAec=;
        b=wANgeTTj9beYhVEVRR+ZP5wb9NhD71gSh3+k1WbOuEntYduQqd7C9Z3pEIcuZR6o5P
         4TTvzSGY/4OcH6v0wkI4jYgsVjSj+XzlmxsoQMnbjvMS6wnem8tvOIdtRKmj69pYfngs
         PAKNYSrIDjvWCktSo2FC7+zX5HQpPLdPw9CQijkCx4hAD9wHW32XC6C8+dA67l/LIcEc
         +sJV0i7HCURce5HTj7sXtBrZVxFJbRsG9+8I0KMWiG57KJRMrWB0baNR+jTW8TvV/mpJ
         IXncZMyqD0X4ix+2Tz1BGiqqxMi7eU8aBD10F/LhICLD2oANr4KMveugXKbTcBMTSa/B
         gA2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751639780; x=1752244580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bRdhy0PS9cNMbTKE1Nz2Cs1tq+5xbD9yaeYP0EZmAec=;
        b=Yl42jg/RT2rDKrxqY26xaxy8/3lEsUAo9HZAVy6fhZue5ijmnthpOyfUr6XLCxzh6S
         i2t/AqB0M8efg3E6gVR9zHYqG6IJeL3i/pWhMTIGA0Flt4RMj7pgCRfkdbTJwenFNxK5
         SeGn0UCQEhGaYplWN3+AZ8S0ovogqBZYI6PBTWlUxr/xVRGMiqOPIvzShvhLpW3YWnjk
         5qP5LOEdW3gpbKmkl5cod+6S7ibP02dS7ghps7vWRKeLWe8UeXBLU9M3gWASIzeE71Tu
         LJXtFElvgXixQlHTCM6fWJK2Dt2wT1O/RPGGsgC5qv4MRDHZWOcpoIsB4vOcN3S9dimO
         5tRQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4bo1VbwXl/2GCBi78LEuQBLOAPKkNcjKaW8tZbxmiHHq+fneMNu3nlUAlvCoRmQIBRD59erqYDK6qhLU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjqLUKP+4x+/wdp4MciiJFE8TySt56e8BAHcdDkMN+L739mjii
	TJfobksm7RBzuXERI/z21xlM8VXXJEIcdxTgNE78twIsOZB1oemyyauKsDEMzz3ao0Q=
X-Gm-Gg: ASbGnctfze3xa991fDcIzVXA+zbFbeB9nWCC0ZBCalKvh8aq8P9ZvoJrb5BD2UC185d
	m2LutiUH2DEyGWkU4IO+v5UXMfsC0Qb6TbVlNN3XAB5i8MurH9fVH1yvn5Top5SnyYSCNyhdz6x
	0D/D+gXjshoWOzItLfz0xg7Zt5n6c1Q8f7Y+ESLmQfACyDjLG6V6QVg/0OisVwyBmyZEpHFXz01
	NQOCCC28DIlg3lRZ9JW/LTbYX0+LExp04z4ZQmo48PWaK9nqpV6zv63o9uVZXwtDfJhDEYACW1C
	L+CW63I8OCZTZ6JeMIJI6FWG94rCA0mGN6U5H6PANs3g1CopbD2bl3G/CZQXsSIMHBj0aR9pr7s
	CT3Ofrg==
X-Google-Smtp-Source: AGHT+IHujtNrBdBkPZltMcNKHstTitn0yuqfdi6VLO7pfyAgbQrIZyeba2N0/ZXwe11lmXMVQDfC8g==
X-Received: by 2002:a05:6000:18ab:b0:3a4:eb7a:2cda with SMTP id ffacd0b85a97d-3b49660bfbdmr2674200f8f.30.1751639779682;
        Fri, 04 Jul 2025 07:36:19 -0700 (PDT)
Received: from vingu-cube.. ([2a01:e0a:f:6020:7ff5:bbf8:9357:784a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b4708d0beesm2690186f8f.36.2025.07.04.07.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 07:36:18 -0700 (PDT)
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
Subject: [PATCH 2/6] sched/fair: Fix NO_RUN_TO_PARITY case
Date: Fri,  4 Jul 2025 16:36:08 +0200
Message-ID: <20250704143612.998419-3-vincent.guittot@linaro.org>
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

EEVDF expects the scheduler to allocate a time quantum to the selected
entity and then pick a new entity for next quantum.
Although this notion of time quantum is not strictly doable in our case,
we can ensure a minimum runtime for each task most of the time and pick a
new entity after minim time has elapsed.
Reuse the slice protection of run to parity to ensure such runtime
quantum.

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
---
 kernel/sched/fair.c | 30 +++++++++++++++++++-----------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 43712403ec98..0c1abb079ebb 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -882,23 +882,34 @@ struct sched_entity *__pick_first_entity(struct cfs_rq *cfs_rq)
 }
 
 /*
- * HACK, stash a copy of deadline at the point of pick in vlag,
- * which isn't used until dequeue.
+ * HACK, Set the vruntime up to which an entity can run before picking another
+ * one, in vlag, which isn't used until dequeue.
+ * In case of run to parity, we let the entity run to its deadline.
+ * When run to parity is disabled, we give a minimum quantum to the running
+ * entity to ensure progress.
  */
 static inline void set_protect_slice(struct sched_entity *se)
 {
-	se->vlag = se->deadline;
+	u64 quantum = se->slice;
+
+	if (!sched_feat(RUN_TO_PARITY))
+		quantum = min(quantum, normalized_sysctl_sched_base_slice);
+
+	if (quantum != se->slice)
+		se->vlag = min(se->deadline, se->vruntime + calc_delta_fair(quantum, se));
+	else
+		se->vlag = se->deadline;
 }
 
 static inline bool protect_slice(struct sched_entity *se)
 {
-	return se->vlag == se->deadline;
+	return ((s64)(se->vlag - se->vruntime) > 0);
 }
 
 static inline void cancel_protect_slice(struct sched_entity *se)
 {
 	if (protect_slice(se))
-		se->vlag = se->deadline + 1;
+		se->vlag = se->vruntime;
 }
 
 /*
@@ -937,7 +948,7 @@ static struct sched_entity *pick_eevdf(struct cfs_rq *cfs_rq)
 	if (curr && (!curr->on_rq || !entity_eligible(cfs_rq, curr)))
 		curr = NULL;
 
-	if (sched_feat(RUN_TO_PARITY) && curr && protect_slice(curr))
+	if (curr && protect_slice(curr))
 		return curr;
 
 	/* Pick the leftmost entity if it's eligible */
@@ -1156,11 +1167,8 @@ static inline void update_curr_task(struct task_struct *p, s64 delta_exec)
 	cgroup_account_cputime(p, delta_exec);
 }
 
-static inline bool did_preempt_short(struct cfs_rq *cfs_rq, struct sched_entity *curr)
+static inline bool resched_next_quantum(struct cfs_rq *cfs_rq, struct sched_entity *curr)
 {
-	if (!sched_feat(PREEMPT_SHORT))
-		return false;
-
 	if (protect_slice(curr))
 		return false;
 
@@ -1248,7 +1256,7 @@ static void update_curr(struct cfs_rq *cfs_rq)
 	if (cfs_rq->nr_queued == 1)
 		return;
 
-	if (resched || did_preempt_short(cfs_rq, curr)) {
+	if (resched || resched_next_quantum(cfs_rq, curr)) {
 		resched_curr_lazy(rq);
 		clear_buddies(cfs_rq, curr);
 	}
-- 
2.43.0

