Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C48223336
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 15:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739200381; cv=none; b=eiw0Y/s4eMoDOOKA/zFyOt96UAHgaWiv0621TI+jYnE1py6HIOyYAaIxwI1PK/5U4bgm//2poETzVbBYKUqJxO9YOTv7M2Ac3OLQmPYM2D9yC81/oUaEHZH/hw19hwkBXfa4wck9HbcdRZRg0gK3tLYaiRny7vgZfL6iu3qnwZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739200381; c=relaxed/simple;
	bh=vRXJ9uOsy6Io5CIxOYOD8ydZyDCFHZfM3eEnQt7c5sU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NtvRomorFEUwLMzpwnYoOJHOpYT5FHwIIFwUgpC4Y9WDDsGt31zu7Jic0JN3CVDIt2jS9uHA4gU71b8jSt20q7zisGDypBxSdnR+TZLvk/h5Sa7Qb336wLbEZTmKvFCgcWrRRGKrLy365m2fBXw3w65YmpcZagA7nWLE8j8FSXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=bYKGlJch; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="bYKGlJch"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ab7917fc0c2so541222566b.0
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 07:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739200377; x=1739805177; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TnS8Fb21gYaFTzUKkHBeeupETZBcyFIfLsl4jvQZsEE=;
        b=bYKGlJchuQxbwZzqanMcZFVcvoSYvNZhx7pXLjYFSnQ9fIB3Cys/UlwKsardsuKDDz
         KBNafuxcNfI53PSc/xmz3CUSoHmr3i34r4nwig9KOKEJcBpDFW17rA53O6Aa4LmYRTgX
         inRPYLTRk5CUztW/onHI1t5E/ERdAr5/ksaAVWKJtdKqSoUH+jqLnnQA4n4ypoJ2uAEG
         laaDQIb7BBueJNoI/psAhCHNYwY7FpL2u8s1uj3M43wlZr0Aum2DioDiT6bOrbBh0fB7
         PbbqKBscR4I14zsKKU84cRz+M8narD8+D7judlSeJmII9E+Aqv3tXpou8Wyg0cRVREb7
         GNPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739200377; x=1739805177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TnS8Fb21gYaFTzUKkHBeeupETZBcyFIfLsl4jvQZsEE=;
        b=T5JhBQ7rwBD4M9eTNglW5eIGe8gobY6CJeRHdBkEVz3W0CaQI0q6PQqNBejS1vsh1j
         7KZiEpknEFeOziiWLqClPgZfRLY1BKnsmnXYl55AeR0JJJV59XCmJc+I6JQ49jPtAiNh
         wgtMY3kXOaLPs5WxxJdxL+dShLqXy6vC9rvlhynWoAVR2VlVcJ4G21wrdfmxvqrQ7TQG
         uUsRHnHRUvUWZFV8k0fxFIPnz2BZFPkqDAUSLcQL9PSHRaUsZaJWGjaAISmGvCPNkMIh
         /Gl6CqqYZ115UQhtGycH8MOv24rjTudmGlaKr3CXQv9nL8nu1OfIabQv10EXGs4IQ6+p
         MjNg==
X-Forwarded-Encrypted: i=1; AJvYcCWtuPW9NGQFEmOQJnWB6TWh09S2xshTh2MTfNzxkLGtVC05Q6lQ/Nr0xWOtuDxPWqkiramzKwEhlolokpU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNiVklMUsXoAWRgqos0mzcEdOYS4MshLy1EaHxipr3o7xg+e6f
	9wFLXKoGKSBjD4p7eV7gBh2H7PSGKyt4VY1Z2A5TjcwUHBWqAc75bpdjjpe+BFU=
X-Gm-Gg: ASbGnctdcIfGbhzez+tdUdMi9X1cMbGCCAhSsbJCky+H3NHkd+DNeV4M6KKd5LBwy1c
	078QPh0oGvOz49O4sUTBWSYVVVd12WiMJ4YmDPOC8tR5iqcRLZm5VxxFBa62Q9bNT6TWzkhBJNQ
	JfrKOahJi4tI+UmHYo/xNjmLe6sTtINIfMe0CDKIkREHZT898P5kXBBf5yZZX15BnkYlVCeWTxg
	Hr4FNUF8/v2mM3MMhj03R5vJ3mM6I3RwyByhvJu+CFGHrLfGgzOd2J2fB1UDaHcNgLck0PgFknx
	Vpvac+u9e2u6JaW42Q==
X-Google-Smtp-Source: AGHT+IGeC3y9dgn3AprFzBwU08Se3CqMxXHrvrh5PMSt4mKEXumoIzf4t5zEtY3KhoTWYTvDWPjqSA==
X-Received: by 2002:a17:907:94c9:b0:ab7:b356:62e0 with SMTP id a640c23a62f3a-ab7b3566f6amr701123766b.53.1739200377255;
        Mon, 10 Feb 2025 07:12:57 -0800 (PST)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab773339e82sm895192866b.143.2025.02.10.07.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 07:12:57 -0800 (PST)
From: =?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>
To: cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Frederic Weisbecker <fweisbecker@suse.com>
Subject: [PATCH 4/9] sched: Add commadline option for RT_GROUP_SCHED toggling
Date: Mon, 10 Feb 2025 16:12:34 +0100
Message-ID: <20250210151239.50055-5-mkoutny@suse.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250210151239.50055-1-mkoutny@suse.com>
References: <20250210151239.50055-1-mkoutny@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Only simple implementation with a static key wrapper, it will be wired
in later.

Signed-off-by: Michal Koutný <mkoutny@suse.com>
---
 .../admin-guide/kernel-parameters.txt         |  5 ++++
 init/Kconfig                                  | 11 ++++++++
 kernel/sched/core.c                           | 25 +++++++++++++++++++
 kernel/sched/sched.h                          | 17 +++++++++++++
 4 files changed, 58 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index fb8752b42ec85..6f734c57e6ce2 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -6235,6 +6235,11 @@
 			Memory area to be used by remote processor image,
 			managed by CMA.
 
+	rt_group_sched=	[KNL] Enable or disable SCHED_RR/FIFO group scheduling
+			when CONFIG_RT_GROUP_SCHED=y. Defaults to
+			!CONFIG_RT_GROUP_SCHED_DEFAULT_DISABLED.
+			Format: <bool>
+
 	rw		[KNL] Mount root device read-write on boot
 
 	S		[KNL] Run init in single mode
diff --git a/init/Kconfig b/init/Kconfig
index 4dbc059d2de5c..5461e232d325a 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1079,6 +1079,17 @@ config RT_GROUP_SCHED
 	  realtime bandwidth for them.
 	  See Documentation/scheduler/sched-rt-group.rst for more information.
 
+config RT_GROUP_SCHED_DEFAULT_DISABLED
+	bool "Require boot parameter to enable group scheduling for SCHED_RR/FIFO"
+	depends on RT_GROUP_SCHED
+	default n
+	help
+	  When set, the RT group scheduling is disabled by default. The option
+	  is in inverted form so that mere RT_GROUP_SCHED enables the group
+	  scheduling.
+
+	  Say N if unsure.
+
 config EXT_GROUP_SCHED
 	bool
 	depends on SCHED_CLASS_EXT && CGROUP_SCHED
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 165c90ba64ea9..e6e072e618a00 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -9852,6 +9852,31 @@ static struct cftype cpu_legacy_files[] = {
 	{ }	/* Terminate */
 };
 
+#ifdef CONFIG_RT_GROUP_SCHED
+# ifdef CONFIG_RT_GROUP_SCHED_DEFAULT_DISABLED
+DEFINE_STATIC_KEY_FALSE(rt_group_sched);
+# else
+DEFINE_STATIC_KEY_TRUE(rt_group_sched);
+# endif
+
+static int __init setup_rt_group_sched(char *str)
+{
+	long val;
+
+	if (kstrtol(str, 0, &val) || val < 0 || val > 1) {
+		pr_warn("Unable to set rt_group_sched\n");
+		return 1;
+	}
+	if (val)
+		static_branch_enable(&rt_group_sched);
+	else
+		static_branch_disable(&rt_group_sched);
+
+	return 1;
+}
+__setup("rt_group_sched=", setup_rt_group_sched);
+#endif /* CONFIG_RT_GROUP_SCHED */
+
 static int cpu_extra_stat_show(struct seq_file *sf,
 			       struct cgroup_subsys_state *css)
 {
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 4453e79ff65a3..e4f6c0b1a3163 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -1508,6 +1508,23 @@ static inline bool sched_group_cookie_match(struct rq *rq,
 }
 
 #endif /* !CONFIG_SCHED_CORE */
+#ifdef CONFIG_RT_GROUP_SCHED
+# ifdef CONFIG_RT_GROUP_SCHED_DEFAULT_DISABLED
+DECLARE_STATIC_KEY_FALSE(rt_group_sched);
+static inline bool rt_group_sched_enabled(void)
+{
+	return static_branch_unlikely(&rt_group_sched);
+}
+# else
+DECLARE_STATIC_KEY_TRUE(rt_group_sched);
+static inline bool rt_group_sched_enabled(void)
+{
+	return static_branch_likely(&rt_group_sched);
+}
+# endif /* CONFIG_RT_GROUP_SCHED_DEFAULT_DISABLED */
+#else
+# define rt_group_sched_enabled()	false
+#endif /* CONFIG_RT_GROUP_SCHED */
 
 static inline void lockdep_assert_rq_held(struct rq *rq)
 {
-- 
2.48.1

