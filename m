Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0513513B791
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 06:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738908939; cv=none; b=PEQATiJnW1yxgmhMN2TA1kLi/YK6JIQj9qbxOhJlB0P1vhE4yAHb/CCJFRxnmXDEFW9J8WAFy/jssNm141pgXH1g3gTU57XYPUkZcaX/25JE7QW4YQ1zP3FmE2MC9NR48rYM5KHqtFAQqd9WC0GAUqb5sN1jqpTzHO1Pyws68l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738908939; c=relaxed/simple;
	bh=M8TXGk/PYHN7tZ/qk9weZpHSf5KfVZ+12wEOEPBvsNE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EyAWmA/FadW4O189V1odFbfl9Lj0FuxVi7qZTBuDTytGSfemUvHIGvweP9niPlpFE+0tzI2eI87/Z8aE78TwO+gVK/jdMwkr+MX/o8txv5mRiQiDOTbYppoUX5o+Q26bwoeNswt7cndJUgK+C2c+IlmAo1EpV0lM3JWaRW/OVbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aqocwG8M; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aqocwG8M"
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-21f0bc811dbso41535175ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 22:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738908937; x=1739513737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pc0d3IeUyKXn7ajlIilqfGDxOeSfWxBgCDj0yI4TU/I=;
        b=aqocwG8MdPmajzWUb8ejN9wKoqJUgy5USvgcYpQdDaiieYPY5mmW2bcB3euO5FHBjV
         VmbfigmvREablYtFnn8cfzvtEfGybxLKFzWf89HovLmkUAnFiBvgYxwFW89QkQqV3ev+
         TiK93CM2svMlNf2gTSzjR5hxqEiJHUHPOiqSXIlXHsT33dN9b2iD6w/IzTQ4ErfzLF9h
         I+wPOE1kpvX86kTzMJH4RYD1DZHdXK3QKKZw6brcac1gKWJBWqA6LfeTizqt0qAHyHy+
         8i1MuQtovEP5AJkEOltv5gnLaEPR2RqXhXX5p0Z1NlFnZmWFRg2uAfCFpQUp6xTQX9S2
         LYVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738908937; x=1739513737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pc0d3IeUyKXn7ajlIilqfGDxOeSfWxBgCDj0yI4TU/I=;
        b=bLYEbpYgk3OX5gtOMMT4eIXryRBPhQzIFTElXhQt+JF97rdWRdbBtHZozXUI2IIkuG
         b9ctxoDQfB5Px9yC4sO+gFqBizutumGM+eq4Lox5L11EfRAkoK/djdsT3/NdABAEN63U
         Fdkakc8iMbLa7aKgJVrqUsIGhp2yKysBMPOH0OfrMZewDTKoPKRQGczHqbdYHVuGvhLw
         O7WKUEtPpnoEkPvYCgVjA5YKP6ywOxCbDa3F1jpBmH/TSjnwZa+OGFM6KfeF43Cacfno
         M/uXrHxDuNoHPUTHgVK1zMRNgdVAOGaN+6hZxpICCKevhoDVOWaugEktDmiZCtIHLi9W
         Q9SQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0m+dGCEVFA4r8GRRemRYGDnWM8KFzvCh4BygK7CU3LhxDm+xvWNfAPungGZ9jcGw36/78T24yKqU8T64=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm0TY+3OBB1Ic2h9YoKt5QL394rOJBqYQ3NG1UyC9Al/NG5S9t
	rDEw47cHhd9VL62GTFlTB+JEU4ySgzSdkXbIERgq8oPmgh60SirH
X-Gm-Gg: ASbGncvWNf1g0/Cy86XmPM8LLYjaqw7O3/lIqHBCSXA/betx3kVRsBAPyUJbOXWH/D6
	+qx65XYl5AtHYsEqvyCwieT+xY8FvQ+9dsEZ58onbpAClyDHeyISxtamsI07L6zu+0eFgcnKfCJ
	VZu6uqtsbHNelm4KqPDs3F3gW8j12SORhU8Eu2P3SQZG7kEikMZsO8MqnwpXc0JyPnt9Uihu17g
	qakhnZE4uGJUm1FR6JLe0d+o7RlVjjL1EUEGBjL2jz67ob2mZYX9jcge6DI5fHw9KO4aS6f/6fF
	Aelv4jE+SqwUX1vhHcuc5MXybOEbt/B9FIs=
X-Google-Smtp-Source: AGHT+IGp5Au8lMSsNEuE09EeQNPJ2JqbpcpsDFsXUrLsQqibKO9Z07VGbPoCUjT3m+PqUgdJjyEopw==
X-Received: by 2002:a17:902:f745:b0:215:b18d:ca with SMTP id d9443c01a7336-21f2f1e7263mr119073955ad.18.1738908937124;
        Thu, 06 Feb 2025 22:15:37 -0800 (PST)
Received: from localhost.localdomain ([114.67.205.189])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ad51aee5bb1sm2309779a12.38.2025.02.06.22.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 22:15:36 -0800 (PST)
From: zihan zhou <15645113830zzh@gmail.com>
To: 15645113830zzh@gmail.com
Cc: bsegall@google.com,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	linux-kernel@vger.kernel.org,
	mgorman@suse.de,
	mingo@redhat.com,
	peterz@infradead.org,
	rostedt@goodmis.org,
	vincent.guittot@linaro.org,
	vschneid@redhat.com
Subject: [PATCH V2 1/2] sched: Reduce the default slice to avoid tasks getting an extra tick
Date: Fri,  7 Feb 2025 14:14:00 +0800
Message-Id: <20250207061359.31442-1-15645113830zzh@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20250207060917.30201-1-15645113830zzh@gmail.com>
References: <20250207060917.30201-1-15645113830zzh@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reduce the default slice, add a comment explaining why this modification
was made.

Signed-off-by: zihan zhou <15645113830zzh@gmail.com>
---
 kernel/sched/fair.c | 47 +++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 43 insertions(+), 4 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 26958431deb7..754b0785eaa0 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -71,10 +71,49 @@ unsigned int sysctl_sched_tunable_scaling = SCHED_TUNABLESCALING_LOG;
 /*
  * Minimal preemption granularity for CPU-bound tasks:
  *
- * (default: 0.75 msec * (1 + ilog(ncpus)), units: nanoseconds)
- */
-unsigned int sysctl_sched_base_slice			= 750000ULL;
-static unsigned int normalized_sysctl_sched_base_slice	= 750000ULL;
+ * (default: 0.70 msec * (1 + ilog(ncpus)), units: nanoseconds)
+ *
+ * The old default value for slice is 0.75 msec * (1 + ilog(ncpus)) which
+ * means that we have a default slice of
+ * 0.75 for 1 cpu
+ * 1.50 up to 3 cpus
+ * 2.25 up to 7 cpus
+ * 3.00 for 8 cpus and above.
+ *
+ * For HZ=250 and HZ=100, because of the tick accuracy, the runtime of tasks
+ * is far higher than their slice.
+ * For HZ=1000 with 8 cpus or more, the accuracy of tick is already
+ * satisfactory, but there is still an issue that tasks will get an extra
+ * tick because the tick often arrives a little faster than expected. In this
+ * case, the task can only wait until the next tick to consider that it has
+ * reached its deadline, and will run 1ms longer.
+ *
+ * vruntime + sysctl_sched_base_slice =     deadline
+ *         |-----------|-----------|-----------|-----------|
+ *              1ms          1ms         1ms         1ms
+ *                    ^           ^           ^           ^
+ *                  tick1       tick2       tick3       tick4(nearly 4ms)
+ *
+ * There are two reasons for tick error: clockevent precision and the
+ * CONFIG_IRQ_TIME_ACCOUNTING/CONFIG_PARAVIRT_TIME_ACCOUNTING.
+ * with CONFIG_IRQ_TIME_ACCOUNTING every tick will be less than 1ms, but even
+ * without it, because of clockevent precision, tick still often less than
+ * 1ms.
+ *
+ * In order to make scheduling more precise, we changed 0.75 to 0.70,
+ * Using 0.70 instead of 0.75 should not change much for other configs
+ * and would fix this issue:
+ * 0.70 for 1 cpu
+ * 1.40 up to 3 cpus
+ * 2.10 up to 7 cpus
+ * 2.8 for 8 cpus and above.
+ *
+ * This does not guarantee that tasks can run the slice time accurately every
+ * time, but occasionally running an extra tick has little impact.
+ *
+ */
+unsigned int sysctl_sched_base_slice			= 700000ULL;
+static unsigned int normalized_sysctl_sched_base_slice	= 700000ULL;
 
 const_debug unsigned int sysctl_sched_migration_cost	= 500000UL;
 
-- 
2.33.0

