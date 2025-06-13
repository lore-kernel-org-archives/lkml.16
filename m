Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D152E7643
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 14:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749823536; cv=none; b=OcVC+EQiVTTa0M9A1JqXp3JcytSasYVPZKxauHQ5OMS4hGyBAA2rkjHYHcD45pk8MXBDL3yQH5nDe1pZJWwfxVHcKP1GrygKbOS79IenAlTrXTx80tZciJt1Xe3vZ0yIkfLc1rLLg0Fm4dy0QmI+/9lo8fOLadhfHLsunXw/+h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749823536; c=relaxed/simple;
	bh=cdgNVRg3q+p4IrGkgXku/QNcy3g6z+UtJU2ARXzJxKg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SzPFa5Yw1aGjDLQr4Mt1dUAd3jZIy+8tpOjwFDBh0WT6YLY9tIPy99CH/S4RVMjM+4WIi88Frm7ZCLC/tBTgx2+wO4T6AyYkaWczg6/7EHKyri34lwcKh1wk24MTmsbBtYbsMO7P4j3FmlnpR9Y+w/LYjnVvOXxc00PhSY7V3i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VMHpcpm8; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VMHpcpm8"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-450cfb79177so13259295e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 07:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749823533; x=1750428333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0X2uv1HiFv0KbvzxwMCTug/zMsr1b3Ey/vikGScDg4A=;
        b=VMHpcpm8F3RWT3hcfgKRNPp/bHBu8QKQ/sIMGAQ7gycR1kltWM4/aaB5YtRlI0Svdr
         NZyoL137oJE+MYjc+gyIbJ4N/kDwUAG1IX5EUbE3gioZ/lOaBZEXgyuipZ2+/RFqtj/w
         R9eKH8iTzeIy43+NcyZu42sqN/KC3EGd0hCywC6g50+teahCDz95i032GhjmKVxUfxiO
         jf/O9yROeH7UhgBxrzGISTj2+kOJjaRKb9uYE3cjxGS1MlUWOcNbUl4moA2zI5s7sWz3
         5aVuSSvU2k47PP7PgYv3bkWQPvMIxIDIMIGB3lRy973PhwIkojmMpg+9NJKM0BtxbE5k
         vcrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749823533; x=1750428333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0X2uv1HiFv0KbvzxwMCTug/zMsr1b3Ey/vikGScDg4A=;
        b=dan9MXCVqDWoy6hJuaQkR1uDKvpNDo9NS+B6Hu1jCA1l2I6v3PyX14VyTHzT/HJlbX
         25zy8CTwnT6/IKT0o6Q5nI/Xo2WUu7FUboAcrv4wtSQ73WBw8PQQnoa3Fu1nZqaYxfAp
         4hdwavrjjG6Y/L/wHvbf3ia5IAZDgkZllZF0lMXb7uDveEP3xCZQPxqLUQFqOp1hlVYC
         Lc9YWcp3t0+4HkHpJLEgJVvT59HBLfsyp2vykj0Ks+Vo8vIDqXzRc+/HWk1B6iw10L69
         M1K7WMfYu8yQ8/Wg9EWX9jJ5/V14eGhbGRXStXpju/TORPUHKT0UW2mIx/loHHhSDmeX
         RDnQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2nQXp95F4ijMssG75gxuoFsrZ0HEHGzz68lPItS1ZFF0QDZ2h9v0mQwXnxcnr9lcTfJbkjApMe+YqN9s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyS8ff5xhMuQEpvCt59J3oJqahzHJL6AeprzsNV62wsTh4Gh0N8
	FjIh0LrHNafBuqoEuc/LdZrgSbmDb/yqlbnJJ/RgKmRnjGF3AoXcw0Ifq/tXsxRB49s=
X-Gm-Gg: ASbGncteqPyHhIa0ckgd2m24otrT3Tr5GYxe/RLU6qNAEbbZSyoEJG+au7j6DUz0csz
	GyNl+RnXYJtaA6dK2p3jhIgw/yEYicNBC8Y8MrcagbesIbhYnhpyuaSyx5bdsYVlOUZFd7bCHGz
	G44UUeX+jDc2vGZOKdb3CrX1GG7Hu6d0TDcyMvabm1KUzT47crZoHofteTYi8tNFeXlv00TQMQL
	4d17nwas35qZM3/HfWlyhUNDIjqy1HU9EpkZoIXNqIAouKvgHDflF6BfYgNwM4LZp+86Ne6vStr
	AEve6gpojYvd59eXiKJpKb/L1dvQ/V0HZSKpeLVTEzOqXlKnEqCqEmdyyUO9pe4lanEtHA==
X-Google-Smtp-Source: AGHT+IHEQg7HeanKAzRdnE15qL/ZnvtjaZJ+CnD5r16xm2wOZZxjo7b8rbLUIvY0M3veNJmb+OIZ9Q==
X-Received: by 2002:a05:600c:c4a5:b0:43d:46de:b0eb with SMTP id 5b1f17b1804b1-45334a979c1mr35195475e9.12.1749823533071;
        Fri, 13 Jun 2025 07:05:33 -0700 (PDT)
Received: from vingu-cube.. ([2a01:e0a:f:6020:f98:f3a4:ec28:1d4e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b27795sm2472276f8f.71.2025.06.13.07.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 07:05:28 -0700 (PDT)
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
Subject: [PATCH 3/4] sched/fair: Limit run to parity to the min slice of enqueued entities
Date: Fri, 13 Jun 2025 16:05:13 +0200
Message-ID: <20250613140514.2781138-4-vincent.guittot@linaro.org>
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

Run to parity ensures that current will get a chance to run its full
slice in one go but this can create large latency for entity with shorter
slice that has alreasy exausted its slice and wait to run the next one.

Clamp the run to parity duration to the shortest slice of all enqueued
entities.

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
---
 kernel/sched/fair.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 479b38dc307a..d8345219dfd4 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -917,23 +917,32 @@ struct sched_entity *__pick_first_entity(struct cfs_rq *cfs_rq)
 }
 
 /*
- * HACK, stash a copy of deadline at the point of pick in vlag,
- * which isn't used until dequeue.
+ * HACK, Set the vruntime, up to which the entity can run before picking
+ * another one, in vlag, which isn't used until dequeue.
+ * In case of run to parity, we use the shortest slice of the enqueued
+ * entities.
  */
 static inline void set_protect_slice(struct sched_entity *se)
 {
-	se->vlag = se->deadline;
+	u64 min_slice;
+
+	min_slice = cfs_rq_min_slice(cfs_rq_of(se));
+
+	if (min_slice != se->slice)
+		se->vlag = min(se->deadline, se->vruntime + calc_delta_fair(min_slice, se));
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
-- 
2.43.0

