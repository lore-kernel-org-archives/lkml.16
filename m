Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8134B1CA84
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 15:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739200383; cv=none; b=Hv1CgA85HtJ8edAZP+Mo+pj05y++uqWmkE3e5yWogax7twKa9rLZ5cgLfwHlTIJuMrdvXh8r3qkJ5UACTjEenIPy1daXknbgAywFGIMWPPGvczcNQROBbfATja9NX7egNHnWu0rk0mFXPASqACs1kxX5sjrpIuxnyMNheHRAbwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739200383; c=relaxed/simple;
	bh=NEXQa8SMxoUZIhEM2LZtR5hPu3GN/muNBmbxrg6/Pks=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PhJmYoxvKK05uCZN2ols/tNsxQp1V6SPZ4ByokAwMOqMKFstZHFG4nvSV2eiV00/OMbwDaPJOPM7QDakjfd+x4Y4wSr4tKxzB5c3E6oY/j9vt+1slek4TREjdAsNLWMNH/a26MXsyxxkC8/GdQtVyY99+KHWkbwa1dBp/QxBkgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=XR/xLSMG; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="XR/xLSMG"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aaec111762bso1086868066b.2
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 07:13:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739200379; x=1739805179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HcDctnJZ8SS/Sh/C+IjYe92Zf0/KDo0yTr6Uc7WvnrA=;
        b=XR/xLSMGiZHIg/MK+pj/LhzN6/y515tyAMHM3+D99T5oQdWbivvYEyT8cZ3HEY5mKl
         6CGIQkxK9Uo+31Kg253/noB3nuTf5O+8nLTZ2KDwQN1DQIVB0xF1A9T4JxTI11BQ0AsG
         TjO/jB7bOPkAvEqIeVE9nlDsXhpIYDpEeVQEuL8YZcOVd/9bwtPilYUV13K1q5R7bOAq
         laLQHW0Gv/R1tlvyJ6ZPhRRm5tr2bz5oG11Kdy7dPIvSYGzTclqKKgaiwYpBPPSsBu6P
         j6BMJDGRNvKYDypUOxAjGkgT1CTBa5qJK4YwMeYzZ79u1hG/bc7wfkMk1q33qtclfSub
         aP5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739200379; x=1739805179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HcDctnJZ8SS/Sh/C+IjYe92Zf0/KDo0yTr6Uc7WvnrA=;
        b=GmEqgrSftu/br/GS5evPibfFVLs+qdpUsLkXgi7Y7pthWcVqAPVbwHqDsY5jltFZPh
         +20V2VkgndSApUtCFzDSNs6YscAxxr9TyasmRCr0/KK10oz7UWRmrcBH2Cpu0JP3XWMk
         CNK9VpZ/2LLYIkme5p9d2dOGzYqwX0eCY+kEVrSzJ06WINYh1ctDeB+NxuD3iHSH2nVb
         tQoMgTJZi0PP97Offi9Q2I7Ex0+WY4BYDh9v7un/SjI6xog87ZJQi1jQqUZJphbyMqcj
         jiSKmmr8OZsYNDrES1BADoa+jTli+fZrDQnTRhLiA3KIknn2a99KVWLZPHCRU2HIsTCP
         k+hA==
X-Forwarded-Encrypted: i=1; AJvYcCVwlgavf7H/tRzcxYGvzlBmGQ6MAaXvKscF/nUVmmSyhqq6cwMbgrItRx766w7OcLX+sJPiKbCh3/4yfuU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz0eeQoQVn9md3UVLY3zvm0KxJGoM1vQ2EUwJfs4AwtbWsiDeM
	cztz2KRUzFOK/6picuonVXPeTIC0s7vqgq5uq78wzUUDyGIGcxrZJjSc5+Ol+5I=
X-Gm-Gg: ASbGncuT0y+F3emoyzPoWNnTY8xs166YFGg+qYffXgMcyOwy7p3lclsu6v3hVliRkrR
	ykp1yz06hsSa1Rz89eLAMjbpojSureVwIzf63CqK5+4cgnvyqqW/V4D2rbP/Oc6zI1EJ1CW00j/
	17KFOey44hTlozrQdxZ37wPHV4DmNJ4/hYKS29IKBj9svhIXLasGQ4Z665dgnhbNdoWMuc+ei2s
	6g1IC5Hu1HkiedhjVokw1xgLY7oX3Bs18lpGB88cUiDYGAo4NLrk02vkaM2FTaJ/QyEbwTR0KSh
	+HeSLJ822akXd3xhqg==
X-Google-Smtp-Source: AGHT+IHquCmS/Ws+N8ETp6qk1W23JXufqv87KorQqO19dV0bfSzpED9DtUd1td8zYliKuvNKqQEfZw==
X-Received: by 2002:a17:906:110c:b0:ab7:c3c9:2ab1 with SMTP id a640c23a62f3a-ab7c3c92cd1mr379092866b.50.1739200378588;
        Mon, 10 Feb 2025 07:12:58 -0800 (PST)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab773339e82sm895192866b.143.2025.02.10.07.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 07:12:58 -0800 (PST)
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
Subject: [PATCH 6/9] sched: Bypass bandwitdh checks with runtime disabled RT_GROUP_SCHED
Date: Mon, 10 Feb 2025 16:12:36 +0100
Message-ID: <20250210151239.50055-7-mkoutny@suse.com>
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

When RT_GROUPs are compiled but not exposed, their bandwidth cannot
be configured (and it is not initialized for non-root task_groups neither).
Therefore bypass any checks of task vs task_group bandwidth.

This will achieve behavior very similar to setups that have
!CONFIG_RT_GROUP_SCHED and attach cpu controller to cgroup v2 hierarchy.
(On a related note, this may allow having RT tasks with
CONFIG_RT_GROUP_SCHED and cgroup v2 hierarchy.)

Signed-off-by: Michal Koutný <mkoutny@suse.com>
---
 kernel/sched/core.c     | 6 +++++-
 kernel/sched/rt.c       | 2 +-
 kernel/sched/syscalls.c | 3 ++-
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 5b67b4704a5ed..a418e7bc6a123 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -9166,11 +9166,15 @@ static int cpu_cgroup_can_attach(struct cgroup_taskset *tset)
 	struct task_struct *task;
 	struct cgroup_subsys_state *css;
 
+	if (!rt_group_sched_enabled())
+		goto scx_check;
+
 	cgroup_taskset_for_each(task, css, tset) {
 		if (!sched_rt_can_attach(css_tg(css), task))
 			return -EINVAL;
 	}
-#endif
+scx_check:
+#endif /* CONFIG_RT_GROUP_SCHED */
 	return scx_cgroup_can_attach(tset);
 }
 
diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
index a427c3f560b71..f25fe2862a7df 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -2866,7 +2866,7 @@ static int sched_rt_global_constraints(void)
 int sched_rt_can_attach(struct task_group *tg, struct task_struct *tsk)
 {
 	/* Don't accept real-time tasks when there is no way for them to run */
-	if (rt_task(tsk) && tg->rt_bandwidth.rt_runtime == 0)
+	if (rt_group_sched_enabled() && rt_task(tsk) && tg->rt_bandwidth.rt_runtime == 0)
 		return 0;
 
 	return 1;
diff --git a/kernel/sched/syscalls.c b/kernel/sched/syscalls.c
index 8629a87628ebf..7b1689af9ff1e 100644
--- a/kernel/sched/syscalls.c
+++ b/kernel/sched/syscalls.c
@@ -634,7 +634,8 @@ int __sched_setscheduler(struct task_struct *p,
 		 * Do not allow real-time tasks into groups that have no runtime
 		 * assigned.
 		 */
-		if (rt_bandwidth_enabled() && rt_policy(policy) &&
+		if (rt_group_sched_enabled() &&
+				rt_bandwidth_enabled() && rt_policy(policy) &&
 				task_group(p)->rt_bandwidth.rt_runtime == 0 &&
 				!task_group_is_autogroup(task_group(p))) {
 			retval = -EPERM;
-- 
2.48.1

