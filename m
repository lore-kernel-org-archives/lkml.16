Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF23E1A8F94
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 15:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738510334; cv=none; b=HbBDMUzbL/KKSmjmmAt3cIWVW3+uI107RORD5voaaenjKfLuzknyX7JuuGhP2UaKh+gE4hQXejfkdRV5oD6gRDxBCfPidAKkgDzmbbBzgO4NhImScLSM65dHBCDQ/0zYFM4VabzxSyP/EI1Eon4D+PB6JLuEtbHGlZwMSNUgIwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738510334; c=relaxed/simple;
	bh=VvWWVrGhwkzFAzZF1yHt4kw16HH/WMG3SEHknxIyqho=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MI7Yx0T6VRMY1FrgO7dQcZLc+jHYFF0H/Qxt/eFtpUz+6o9/Ye78LkNQPRFlhC/Y76KpUhpR4uH6YW6mtw2mRJNHx2fcMmqC5mtLDkPh9Pfn3txBHSF/rBnad259gPzw675OT/+ZpKV+JFoKkl4yAR9A01hPs+8R8uFFaXtGXn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cZinBkOu; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cZinBkOu"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2166022c5caso53150945ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 02 Feb 2025 07:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738510332; x=1739115132; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RVt0ALKfRfo4x5CDax6LxuHxtkR4ZbFtVjkz+DlL14M=;
        b=cZinBkOuhudujZ25mvYNmsWs7Eti5B/lE9o3yIApiX6Buz6VfsB6N8RdtNNms+SKlG
         asqaHgaqcbJc18w4xH9swXU4J8C8brRCAnl/Pb7Ffjjfw4xWEW28OqkGkrlDn9uEkcxp
         YgA9RNCsFsUzz+lpqxoqHwo0Zcafh1Mg1F1LikT1rlbtbQfEZlVgdFToizVLz/vMOCz0
         5Ta/BrMBYoxq6SCfNydLtsVAiFQlDoldiZGQMsYcPOtKu9zfM6uApFtH1sDJmxJnZYBr
         zUm7ys2LuQyz95p8QuLhxERbKStKn2u/ZWPMpFZkk7ZmF7f6icq9Ak38Focq+apZcWA+
         1yRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738510332; x=1739115132;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RVt0ALKfRfo4x5CDax6LxuHxtkR4ZbFtVjkz+DlL14M=;
        b=SE6UQl8dQ/mttB1yGdKaxFtVKSXER2VwVKTGnZnSJOxu3tBS+PMjPZZB9ed1x5+2fE
         RjURju1jM9cjh13m4jkR1KLYDBRhZ1pBAP+bXM1HWc9k1XPRfQD/1vmqtDsOOh+u25Dw
         ng+6/wMNQlS7P68Za39dqqVlowbx8hzFEZIM9Oeh9zOPOR1tEUmCal3Z+eUidQ8c0Pkr
         JBkWbeKq/9T1m/n1u5P/+ppnHehJk8EUduuGRMn2B90duNUrqQMaNsXefKpjyRqNJX9z
         1oyMIBLrclgA7/2d03Hnb0kNG0tR9ozfQmEGIINEmCxSguCtDtV9qyB3GObhys10VJaA
         JM4A==
X-Forwarded-Encrypted: i=1; AJvYcCUfxCu1RDVgANlVTsK2FxP+yRE7bXJkL2L7UwMfKkP91Ulits93dwEZvCBNxieidEqaavLwX++LxfY3bjE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWu0Z74g3h7pBfp1TUl4LMR4UT+RNLJ2BFSO5+OV7s3NdHnUAj
	pMnkd/1m+y7SmrPawNUEGy9/h+lY6+tpljRJqmCVr1FDrBce/8M7
X-Gm-Gg: ASbGncs29FreU1nFPLuX74y8W1XJTupEZiDTF7B8OvzdtyZYFjI96t9PmMsPsd5YbZe
	5uL+DMHVlX4jRVYZRGDnSZRHfsVrzGB9rsPCzdZyi4n9nwYYpAUjNyW6cETz8rmI6F4EBj7IdOv
	Sw0IRQwHfVLxRq6p9dW2VMpIooTIA4W8STUFvbBAmAqp5wYet8umPLGSTPTaQJ+9eCUCbPicYtO
	Hr9UycsmwWdMsVZ5WtJaW33j+o4IzGdSYPU3/vVnFghKtZgqZXXpwYRI1+7OQ/sd+vaCsl2o8uX
	YTMtoAWZVLgHK2O0RLW1n7k=
X-Google-Smtp-Source: AGHT+IFCMj7lYIJy16tFRlmijBZJac5S9TVLtN6rqs0qBOZhLUJYjf5C0czRsVH744jnZ34RP+uAJA==
X-Received: by 2002:a05:6a00:80a:b0:727:d55e:4be3 with SMTP id d2e1a72fcca58-72fd0beabb1mr26092856b3a.7.1738510331965;
        Sun, 02 Feb 2025 07:32:11 -0800 (PST)
Received: from atom0118.. ([2405:201:c009:5a8a:1c53:67e0:65fb:eab4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe6427b95sm6704719b3a.49.2025.02.02.07.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 07:32:11 -0800 (PST)
From: Atul Kumar Pant <atulpant.linux@gmail.com>
To: mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org
Cc: Atul Kumar Pant <atulpant.linux@gmail.com>,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] sched: Fixes typos in comments
Date: Sun,  2 Feb 2025 21:02:00 +0530
Message-Id: <20250202153200.72444-1-atulpant.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes spelling errors in the comments.

Signed-off-by: Atul Kumar Pant <atulpant.linux@gmail.com>
---

changes since v1:
  added changelog
  removed an incorrect fix

 kernel/sched/core.c     | 2 +-
 kernel/sched/cputime.c  | 2 +-
 kernel/sched/wait_bit.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 3e5a6bf58..451e30249 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -8998,7 +8998,7 @@ void sched_release_group(struct task_group *tg)
 	 * that tg_unthrottle_up() won't add decayed cfs_rq's to it.
 	 *
 	 * We therefore defer calling unregister_fair_sched_group() to
-	 * sched_unregister_group() which is guarantied to get called only after the
+	 * sched_unregister_group() which is guaranteed to get called only after the
 	 * current RCU grace period has expired.
 	 */
 	spin_lock_irqsave(&task_group_lock, flags);
diff --git a/kernel/sched/cputime.c b/kernel/sched/cputime.c
index 0bed0fa1a..f8ada8239 100644
--- a/kernel/sched/cputime.c
+++ b/kernel/sched/cputime.c
@@ -584,7 +584,7 @@ void cputime_adjust(struct task_cputime *curr, struct prev_cputime *prev,
 	stime = mul_u64_u64_div_u64(stime, rtime, stime + utime);
 	/*
 	 * Because mul_u64_u64_div_u64() can approximate on some
-	 * achitectures; enforce the constraint that: a*b/(b+c) <= a.
+	 * architectures; enforce the constraint that: a*b/(b+c) <= a.
 	 */
 	if (unlikely(stime > rtime))
 		stime = rtime;
diff --git a/kernel/sched/wait_bit.c b/kernel/sched/wait_bit.c
index b410b61ce..4197f5ed2 100644
--- a/kernel/sched/wait_bit.c
+++ b/kernel/sched/wait_bit.c
@@ -204,7 +204,7 @@ EXPORT_SYMBOL(init_wait_var_entry);
  * given variable to change.  wait_var_event() can be waiting for an
  * arbitrary condition to be true and associates that condition with an
  * address.  Calling wake_up_var() suggests that the condition has been
- * made true, but does not strictly require the condtion to use the
+ * made true, but does not strictly require the condition to use the
  * address given.
  *
  * The wake-up is sent to tasks in a waitqueue selected by hash from a
-- 
2.34.1

