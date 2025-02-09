Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6838433987
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 06:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739081629; cv=none; b=cfVxl2LkGbOwVZnTkV4bosEBNF8J3Zf8mApxXOuQUG8f4xDmM8zRsCxmiAW9qI8tq0/BRY8KfTNxW3uH3AJITSgvm2ZIx8xeXC2ylN1n9CLFdC7rQClqmAg6k3vuvOLAgVsBuRxkdVL2SbhGDqRooVBBKoUI2iGH+HrU8PWei+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739081629; c=relaxed/simple;
	bh=LKw6HaeW05jbHUxXDx+rmwHbEdYlclYGnPRLLJQzy60=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sgTxfB2UTcYpSt1YNFvHehF46kkt/ebkBxhe+RYBwE5avYXNn1i5j4YyIohoKI83r8u9gv9PkAbSSrebZwwLF0mSFaj8YOP3ueER4G5k8QCo8lVWMkxDTzuhwwWGoqaVdGzE0UdMVU/BZCn8kxjvv73x/aRaoeHLCIM0yQhkgtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=H9ccN0Zs; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="H9ccN0Zs"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2f9b8ef4261so842267a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 22:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1739081628; x=1739686428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WiWK8iJRg8z+aUiF8sWc5hRLfRD7QwQ2HIsrRNActc8=;
        b=H9ccN0ZseS4y15P+AXw8rC2y9kMrGrwXpPKM3jsXraTpdjclAgp2Hu2opRCQcQKInB
         fxA3ySVrlqCpo/zvK++PLM6QbxpQ7JyxvIFP8mPCwIalXKlUnKLew3kvBUhVHpN6oilG
         E9noWaKqRt2qmvr6xGG1UVabgKxB5ZkLJFYyUAlKfHvgVcmCJQ5aYosfvS2yhVU94hnE
         eKM/nN7FOcxx/MiRC2ezptBNXqh+nUNWde8AvJEc3ynaJStKc/7WePjVSHsraoYeprhW
         mSJgqhhFt0KEGSoyL/p9mQhAmvJ3rp4e6AbfasGbteMiHzNI2AwSPA0urUaya07iB2YH
         l9fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739081628; x=1739686428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WiWK8iJRg8z+aUiF8sWc5hRLfRD7QwQ2HIsrRNActc8=;
        b=sH3P12WHCGzlEn8yinosHQHPQw0s2+U39Be1gbUeSEXdf/67vPbzZofwSTVyc0j8oX
         3UO4OznfiU6IMvsHkCnuEfKItvZvlq5YG62/TgQZqVSmOfUzi3aA/2Q4Uk2mLMKnchut
         kJIq54bu6iq8QdMa2LjSzTtIw4fw/VNIXLxdG0jbKaSPQ7tQ76XeDojK71qVGU/flwNo
         kpxKP/RNCNgflB5b7UhJmeVShtZqF6bDG8kaKBU+rLEqYqbnsJwIYpmhk7sfQNSRPh6v
         xiTMrlfW/hOt2BEJs6oOZLAuVwDLjQVDByuLuNZRqPBpZYBKijdhkHUA54RqYhUz/32V
         uFsA==
X-Forwarded-Encrypted: i=1; AJvYcCUxKmdAhjzVIo5/zVbGKb6UbyOcY0rP9uC0gITlLwkbdaQz/sE5hxcTKDxJifzedOJUeJbx88caBDtg7jA=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywuw6Eo0XCg03sxQE/T0MQZuxFNxoOfmvi8nIp0T4HqXzNpityx
	f8L0VJ191CmX1Z/twehFnG/SrYOxNU7M/SR95fGXk7ZJ/hr6tQN/n9RaIAe+QQA=
X-Gm-Gg: ASbGncvRj8qwNmTmlezTk/d9DkIca3rCIx+jHGhLrl92uPD2R8G0y1F1dQieojm38Ec
	GgtTMCUbeLSF/uLMkpVAsA/R9KwIqtuNxjP9ryoHSWglaerrP87Ui6azmCQj04X2vt7sQLOzcIz
	J64q7LGOBtdwRTaWTAdh9s0O5tuajRgbbHbM9ag5q3Cp9JjqSlhnXjg5GbtU/UVkOHHp/EiM21u
	fTEysTdctjDNc68PTgHs2NMyQqqHtVXARgQfM10NqdPjaO+peuk6gzqJ5HaAn2e3fHLaJfF/aK9
	WHXg8sBoVgH1vWH3otXV/tfuwtxMxNHFZe0yEj9JjCbpyPmOWefgAw==
X-Google-Smtp-Source: AGHT+IGRgPIlfYH1ct5Tu30ErenkcRUA1vil+502uZDCnpli5A1imHo8KSrBBiH8PxnY1CraKeS7OA==
X-Received: by 2002:a05:6a00:1955:b0:730:8a0a:9ef5 with SMTP id d2e1a72fcca58-7308a0aac96mr244659b3a.3.1739081627747;
        Sat, 08 Feb 2025 22:13:47 -0800 (PST)
Received: from C02DV8HUMD6R.bytedance.net ([139.177.225.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73048ad26b9sm5550700b3a.50.2025.02.08.22.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 22:13:47 -0800 (PST)
From: Abel Wu <wuyun.abel@bytedance.com>
To: Johannes Weiner <hannes@cmpxchg.org>,
	Tejun Heo <tj@kernel.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Bitao Hu <yaoma@linux.alibaba.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Abel Wu <wuyun.abel@bytedance.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Yury Norov <yury.norov@gmail.com>,
	Chen Ridong <chenridong@huawei.com>
Cc: cgroups@vger.kernel.org (open list:CONTROL GROUP (CGROUP)),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 1/2] cgroup/rstat: Fix forceidle time in cpu.stat
Date: Sun,  9 Feb 2025 14:13:11 +0800
Message-Id: <20250209061322.15260-2-wuyun.abel@bytedance.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20250209061322.15260-1-wuyun.abel@bytedance.com>
References: <20250209061322.15260-1-wuyun.abel@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The commit b824766504e4 ("cgroup/rstat: add force idle show helper")
retrieves forceidle_time outside cgroup_rstat_lock for non-root cgroups
which can be potentially inconsistent with other stats.

Rather than reverting that commit, fix it in a way that retains the
effort of cleaning up the ifdef-messes.

Fixes: b824766504e4 ("cgroup/rstat: add force idle show helper")
Signed-off-by: Abel Wu <wuyun.abel@bytedance.com>
---
 kernel/cgroup/rstat.c | 29 +++++++++++++----------------
 1 file changed, 13 insertions(+), 16 deletions(-)

diff --git a/kernel/cgroup/rstat.c b/kernel/cgroup/rstat.c
index 5877974ece92..c2784c317cdd 100644
--- a/kernel/cgroup/rstat.c
+++ b/kernel/cgroup/rstat.c
@@ -613,36 +613,33 @@ static void cgroup_force_idle_show(struct seq_file *seq, struct cgroup_base_stat
 void cgroup_base_stat_cputime_show(struct seq_file *seq)
 {
 	struct cgroup *cgrp = seq_css(seq)->cgroup;
-	u64 usage, utime, stime, ntime;
+	struct cgroup_base_stat bstat;
 
 	if (cgroup_parent(cgrp)) {
 		cgroup_rstat_flush_hold(cgrp);
-		usage = cgrp->bstat.cputime.sum_exec_runtime;
+		bstat = cgrp->bstat;
 		cputime_adjust(&cgrp->bstat.cputime, &cgrp->prev_cputime,
-			       &utime, &stime);
-		ntime = cgrp->bstat.ntime;
+			       &bstat.cputime.utime, &bstat.cputime.stime);
 		cgroup_rstat_flush_release(cgrp);
 	} else {
-		/* cgrp->bstat of root is not actually used, reuse it */
-		root_cgroup_cputime(&cgrp->bstat);
-		usage = cgrp->bstat.cputime.sum_exec_runtime;
-		utime = cgrp->bstat.cputime.utime;
-		stime = cgrp->bstat.cputime.stime;
-		ntime = cgrp->bstat.ntime;
+		root_cgroup_cputime(&bstat);
 	}
 
-	do_div(usage, NSEC_PER_USEC);
-	do_div(utime, NSEC_PER_USEC);
-	do_div(stime, NSEC_PER_USEC);
-	do_div(ntime, NSEC_PER_USEC);
+	do_div(bstat.cputime.sum_exec_runtime, NSEC_PER_USEC);
+	do_div(bstat.cputime.utime, NSEC_PER_USEC);
+	do_div(bstat.cputime.stime, NSEC_PER_USEC);
+	do_div(bstat.ntime, NSEC_PER_USEC);
 
 	seq_printf(seq, "usage_usec %llu\n"
 			"user_usec %llu\n"
 			"system_usec %llu\n"
 			"nice_usec %llu\n",
-			usage, utime, stime, ntime);
+			bstat.cputime.sum_exec_runtime,
+			bstat.cputime.utime,
+			bstat.cputime.stime,
+			bstat.ntime);
 
-	cgroup_force_idle_show(seq, &cgrp->bstat);
+	cgroup_force_idle_show(seq, &bstat);
 }
 
 /* Add bpf kfuncs for cgroup_rstat_updated() and cgroup_rstat_flush() */
-- 
2.37.3

