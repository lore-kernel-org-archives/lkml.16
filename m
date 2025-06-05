Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A49520C004
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 07:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749107678; cv=none; b=RegUlox/FVZOMSZ2ITT7SzXxrPitbl0eOTTwWkrNesrEoJmS3F8dCI0m5nb97NtTg4Qkmw6MI23BvikJalkyHgaPtVpzlu/c33HFhO6i2QkP+W8VAY1tKbKAieUGYBgm23upQXQf+Y/vE/fKocb5zdSha7/AnRkl08JgxK95+/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749107678; c=relaxed/simple;
	bh=n/1RffjE+hyND1ErJYWBkrmY8OjexFlJQTMC+knE7EA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LxaM4nWCwHCi8h7+O+nNJKML7flaNfcfcVG1P9JaKilX2hVf2Dwh6lPu8VzvvkN3F8GKMzDn7CAFEcGgNDig7wFmAJO7RRkBGwGtJ3/2cG3KN8+wDNmCOT5aMCCgyxb5fjtp6pttdpA1Dfkoxm4Xw4LY/aFaTQDFS4cYRxLyvvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AKWQx7TC; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AKWQx7TC"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-451d54214adso4622365e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 00:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749107674; x=1749712474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mKxyhVouN1ABOrb3lXqLiY73ZUC/lGOicpA/Buk0ZmU=;
        b=AKWQx7TCk5ce9zxYxxcf+R+/8yu37DoEzDniP3mTp04ihxkVDdHmsDEO/hmeS5E7qg
         QQRrL7C7Nc5/nKjrGIXUnDBl5OIX3XxEglpHseK09WqlKa/X6KS9eMOrxEji4AJOXp2y
         Br/egI5iuOl3ejqPyGtYHFMdNA9n5le7bMz47Ri8jnf2cUm0r0A1AO7rOh0gfZBzYlOg
         8KIFuMCRv7b8zb4ZiAvHLkpSVRhPYYroFlS1DLdIL7BVUUYCRYXr7EU9hUIcdQiTn+2j
         lvX2FkXTQWIwjE9C5WceH9WDgTZuT4h39KnOska+Bomi9bsHWWWBkgZZWLJt+kahwFpQ
         aNNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749107674; x=1749712474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mKxyhVouN1ABOrb3lXqLiY73ZUC/lGOicpA/Buk0ZmU=;
        b=aYuLuB2SC0/2OCWthVdIyeInnLdJfLkrv16FU3lLjSkDhfkxjL3ozvF1B/pDbzhOM1
         ZquFH6eIV24JYZ8XN/je0vP3GwvzMjni2EJCYKLds5CjtwscwAHHMoUcyzO6RyYjNgIP
         nqxH/XuaM6fOGizQ3IqYy1Kmn0IXK31MMVwLqOCtysXIyx52v77lZbVF4dirZ/G1TfJi
         WMLvOl31n9te83zSr1wk4BXtrm3XjIauOrgvA5wJ/uJPHyCja06DFtqZmPe3x20giBxj
         tbAnb6Q9hvm00C7asgQYiifinm1WF8o2+pCNGmB9YNEHU36/tFr1vll6Xa775mcQkpR8
         jJDg==
X-Gm-Message-State: AOJu0YxtkMgflA4Pu1KMXi1evwqzWKP9tyghSkBebzz1kz6EZGdk0FrV
	dAkDNqaUjw1/I35IrIjew1yBWp1mUUt3x1dqkS7/TxbthxH4Syt35VJM
X-Gm-Gg: ASbGnctIQMAVWF6FzkZWW4ZXsY+Hk3wSBAjKH31wkNW++yyIHKad0QQS2abk7wBm3m4
	vvbfk4yp11MIZZnx9gqNaTjn2zzE0kXYMPDsSkmrcAjzUtF5Mu0QyYFHm+bkAh6QAIBz8zc7vx5
	jv9zxssfUlQUqndn+kEYOov1Biv5NRhm3GkYXdw+G+SDnTngFj7yzfiP8tUZ9HBedj8shuOudks
	SYw0OXmUzlzy+kP0IdojFnWzaVdoEbxQqDiRTJw1oO+cGRa//CSXomFaMGHtk7f1IkR8yXEfkgM
	mWX0ro0hSX3CDokbwSxMPiWwPdt3oNBIZwxEnVbp/t7AQLY1NjzQb+h3tLS29Te6
X-Google-Smtp-Source: AGHT+IGZHVzghn3Kotyh1egqmzIGcPFdoD85lXAfz8fek545or5JPUdFw9sM8yF+4DSAeAoNkTv2kw==
X-Received: by 2002:a05:6000:40d9:b0:3a4:dbdf:7140 with SMTP id ffacd0b85a97d-3a51d9673aemr4750996f8f.49.1749107674221;
        Thu, 05 Jun 2025 00:14:34 -0700 (PDT)
Received: from localhost.localdomain ([78.210.56.234])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f00972b5sm23885431f8f.76.2025.06.05.00.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 00:14:33 -0700 (PDT)
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
Subject: [RFC PATCH 8/9] sched/rt: Remove support for cgroups-v1
Date: Thu,  5 Jun 2025 09:14:11 +0200
Message-ID: <20250605071412.139240-9-yurand2000@gmail.com>
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

Disable control files for cgroups-v1, and allow only cgroups-v2. This should
simplify maintaining the code, also because cgroups-v1 is deprecated.

Set the default rt-cgroups runtime to zero, otherwise a cgroup-v1 kernel will
not be able to start SCHED_DEADLINE tasks.

Allow zeroing the runtime of the root control group. This runtime only affects
the available bandwidth of the rt-cgroup hierarchy but not the SCHED_FIFO /
SCHED_RR tasks on the global runqueue.

Notes:
Disabling the root control group bandwidth should not cause any side effect, as
SCHED_FIFO / SCHED_RR tasks do not depend on it since the introduction of
fair_servers.

Signed-off-by: Yuri Andriaccio <yurand2000@gmail.com>
---
 kernel/sched/core.c     | 22 ++--------------------
 kernel/sched/rt.c       | 13 +++++--------
 kernel/sched/syscalls.c |  2 +-
 3 files changed, 8 insertions(+), 29 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index cad2963a2..9c8bc9728 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -8566,7 +8566,7 @@ void __init sched_init(void)
 
 #ifdef CONFIG_RT_GROUP_SCHED
 	init_dl_bandwidth(&root_task_group.dl_bandwidth,
-			global_rt_period(), global_rt_runtime());
+			global_rt_period(), 0);
 #endif /* CONFIG_RT_GROUP_SCHED */
 
 #ifdef CONFIG_CGROUP_SCHED
@@ -9198,7 +9198,7 @@ static int cpu_cgroup_can_attach(struct cgroup_taskset *tset)
 		goto scx_check;
 
 	cgroup_taskset_for_each(task, css, tset) {
-		if (!sched_rt_can_attach(css_tg(css), task))
+		if (rt_task(task) && !sched_rt_can_attach(css_tg(css), task))
 			return -EINVAL;
 	}
 scx_check:
@@ -9873,20 +9873,6 @@ static struct cftype cpu_legacy_files[] = {
 };
 
 #ifdef CONFIG_RT_GROUP_SCHED
-static struct cftype rt_group_files[] = {
-	{
-		.name = "rt_runtime_us",
-		.read_s64 = cpu_rt_runtime_read,
-		.write_s64 = cpu_rt_runtime_write,
-	},
-	{
-		.name = "rt_period_us",
-		.read_u64 = cpu_rt_period_read_uint,
-		.write_u64 = cpu_rt_period_write_uint,
-	},
-	{ }	/* Terminate */
-};
-
 # ifdef CONFIG_RT_GROUP_SCHED_DEFAULT_DISABLED
 DEFINE_STATIC_KEY_FALSE(rt_group_sched);
 # else
@@ -9912,10 +9898,6 @@ __setup("rt_group_sched=", setup_rt_group_sched);
 
 static int __init cpu_rt_group_init(void)
 {
-	if (!rt_group_sched_enabled())
-		return 0;
-
-	WARN_ON(cgroup_add_legacy_cftypes(&cpu_cgrp_subsys, rt_group_files));
 	return 0;
 }
 subsys_initcall(cpu_rt_group_init);
diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
index 9d17bda66..ce3320f12 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -2197,13 +2197,6 @@ static int tg_set_rt_bandwidth(struct task_group *tg,
 {
 	int i, err = 0;
 
-	/*
-	 * Disallowing the root group RT runtime is BAD, it would disallow the
-	 * kernel creating (and or operating) RT threads.
-	 */
-	if (tg == &root_task_group && rt_runtime == 0)
-		return -EINVAL;
-
 	/* No period doesn't make any sense. */
 	if (rt_period == 0)
 		return -EINVAL;
@@ -2297,8 +2290,12 @@ static int sched_rt_global_constraints(void)
 
 int sched_rt_can_attach(struct task_group *tg, struct task_struct *tsk)
 {
+	/* Allow executing in the root cgroup regardless of allowed bandwidth */
+	if (tg == &root_task_group)
+		return 1;
+
 	/* Don't accept real-time tasks when there is no way for them to run */
-	if (rt_group_sched_enabled() && rt_task(tsk) && tg->dl_bandwidth.dl_runtime == 0)
+	if (rt_group_sched_enabled() && tg->dl_bandwidth.dl_runtime == 0)
 		return 0;
 
 	return 1;
diff --git a/kernel/sched/syscalls.c b/kernel/sched/syscalls.c
index 6c6666b39..45a38fe5e 100644
--- a/kernel/sched/syscalls.c
+++ b/kernel/sched/syscalls.c
@@ -636,7 +636,7 @@ int __sched_setscheduler(struct task_struct *p,
 		 */
 		if (rt_group_sched_enabled() &&
 				dl_bandwidth_enabled() && rt_policy(policy) &&
-				task_group(p)->dl_bandwidth.dl_runtime == 0 &&
+				!sched_rt_can_attach(task_group(p), p) &&
 				!task_group_is_autogroup(task_group(p))) {
 			retval = -EPERM;
 			goto unlock;
-- 
2.49.0

