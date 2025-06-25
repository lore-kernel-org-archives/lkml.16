Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DEA52C3271
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 10:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750848593; cv=none; b=j19aDjMBHWY8L041+/DPQgwCQPePOSTGqxx5b+JVXoEJivVbGyxU0BuhnfXq/eYoYsyWpEolcboKg+LNeOvAbz+NUPH82uD23Yie7qCb2OzYhSyq2riRHiieH1IqimGHOp0wpydGkeUtnN57GC3ARHG26qWqZYLMCWKiDAqedTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750848593; c=relaxed/simple;
	bh=lguU4o6aUN2stOTWqfnfnDaZwtADYf9c17OoNO+kN+g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i+7a6fAfnGgx8NK1ytuPrWZWcxSGBX0WWmYZ/6gkfG4Sn08JSkms78C5GrMqQgGJP+6wixxU3ZkLu8AvEvvHGyQjL+AsTI019yk0dCYNC9+Mgwtf03q8RzH+dg1GIj3ttnK5jwi8GdMQ5LFGJ/6M8qfCT2m1Vq4ZT5Ic5DVL24w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=DqE37cz3; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="DqE37cz3"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-450cb2ddd46so8428045e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 03:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750848590; x=1751453390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Boc71yOhKdq+sO4E1lJ2X5ivogqpS39M7x8lV0gqqV0=;
        b=DqE37cz3RKBJkWaJISwxvDwAeMUjvcGYCbTPDVfuX4POVPPMcpgaEjs3AK+n/v1FYO
         JE84VEih3GKn/poIUGpY4jic8R7Uz3iQXddGc7R3s+/uCvhrx2920BUOC38YF1uvviGc
         VFDzlNvEydfLr0F5Xmysy9paYtHMH/H/1pZtMRL7qn9pMrswf4UFC+RmIp7vfQLaw2w8
         cz6q5HFyiLN5D8KYYijQn+CGV15BHLj/o/2WMeahOwDXHfsP2Q890Mz/i+Qds7INype7
         Xrj5ykNe9YODmaUeilUQEnlMkzVDusWrsM2FGBUXpny4CXCpFgDFBaAxNCgnV0QimypJ
         78LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750848590; x=1751453390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Boc71yOhKdq+sO4E1lJ2X5ivogqpS39M7x8lV0gqqV0=;
        b=qg/e5GFsjskciMyVOWNI69S1tXvD/HGr9cEsm7xd/UNfVagLOPdWQUVOYo6r1uTytb
         OgOMA+amkOATbXKzJpBlk633wwJqFY3FUArm0HykcldT38eWSxhCBAeawAmIlZmZS6Ky
         uZG8tNCCMTOdV06nrH8e5TKxQU2KqxE455ZKjVpj1cQ0ThdW+VevaGHDY72fibJN/TAq
         gGMBpF6VQeOieYpPwH7M6Rmu6HkjusMulyxLdLnHaLBG8IjHHvOLzvBcxhwYG+KfZ1tZ
         lXSP04IZzYiCA4N8MmeJDTNpMGrE64sEVCCnjPtgpJlk3BoYT/f3X7GwfrH/wWvEZGQW
         0w7Q==
X-Gm-Message-State: AOJu0Yyz+FMJeXu5LIH2WNdC6o7UeZH9LWPsEf9u1O2YBTSpBZ1nXot+
	Io0ibS1+d9vkVkYFIe1r6S60AzpO35LYAl6k/RWpLWoXMJZv6wZeWDFYVmr67GYeszX4xctuInI
	s/QpBGN4=
X-Gm-Gg: ASbGncuZZFo+kbA0MjZG2yNxdecre1I7cb2DRIS1MFAr+P2xwxmnDVQTXRApHxvHWRh
	yGxDQSZkzrMPOpOszMaf6NGQgihrwjpbtvVCY84nyivCDAtoaU9j1M1ks4pNRjmpN7LSLFA7hMz
	XCwJI1tH+pC3rjsmf/VWtZiRuhgC4qrH6o/wq9+eL1d36rfQw57sFmsNhpcc6RBqJBzEwO1x/vd
	Ui5+AqkY5xADm5APTjh7YXmKzer+oZVYpvARJ4CAYiwUXROw1TrUEI3lzXM4ulhmgm2D50Y43mS
	PvB/FeqcLDNN61HYXyFeag9MDXLYwwj8Z8DMK1LCgTpejP7vXXD4+YYMXxv3OqBMBTVXEhVoDHw
	PwM19V4tXUg==
X-Google-Smtp-Source: AGHT+IE3HgD7aRaw1i+F279R71mN3N7LL7b95NmZYPT0OgxsjL8Q0PeRN2xKyVa7QShbPSy/f2VnZw==
X-Received: by 2002:a05:600c:8519:b0:43d:42b:e186 with SMTP id 5b1f17b1804b1-45381aaff76mr19922645e9.8.1750848589567;
        Wed, 25 Jun 2025 03:49:49 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538233c49fsm16195055e9.7.2025.06.25.03.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 03:49:49 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v1 07/10] Workqueue: mm: WQ_PERCPU added to alloc_workqueue users
Date: Wed, 25 Jun 2025 12:49:31 +0200
Message-ID: <20250625104934.184753-8-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625104934.184753-1-marco.crivellari@suse.com>
References: <20250625104934.184753-1-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Currently if a user enqueue a work item using schedule_delayed_work() the
used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
schedule_work() that is using system_wq and queue_work(), that makes use
again of WORK_CPU_UNBOUND.
This lack of consistentcy cannot be addressed without refactoring the API.

alloc_workqueue() treats all queues as per-CPU by default, while unbound
workqueues must opt-in via WQ_UNBOUND.

This default is suboptimal: most workloads benefit from unbound queues,
allowing the scheduler to place worker threads where they’re needed and
reducing noise when CPUs are isolated.

This default is suboptimal: most workloads benefit from unbound queues,
allowing the scheduler to place worker threads where they’re needed and
reducing noise when CPUs are isolated.

This patch adds a new WQ_PERCPU flag to all the mm subsystem users to
explicitly request the use of the per-CPU behavior. Both flags coexist
for one release cycle to allow callers to transition their calls.

Once migration is complete, WQ_UNBOUND can be removed and unbound will
become the implicit default.

With the introduction of the WQ_PERCPU flag (equivalent to !WQ_UNBOUND),
any alloc_workqueue() caller that doesn’t explicitly specify WQ_UNBOUND
must now use WQ_PERCPU.

All existing users have been updated accordingly.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
CC: Andrew Morton <akpm@linux-foundation.org>
---
 mm/backing-dev.c | 2 +-
 mm/slub.c        | 3 ++-
 mm/vmstat.c      | 3 ++-
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/mm/backing-dev.c b/mm/backing-dev.c
index 7e672424f928..3b392de6367e 100644
--- a/mm/backing-dev.c
+++ b/mm/backing-dev.c
@@ -969,7 +969,7 @@ static int __init cgwb_init(void)
 	 * system_percpu_wq.  Put them in a separate wq and limit concurrency.
 	 * There's no point in executing many of these in parallel.
 	 */
-	cgwb_release_wq = alloc_workqueue("cgwb_release", 0, 1);
+	cgwb_release_wq = alloc_workqueue("cgwb_release", WQ_PERCPU, 1);
 	if (!cgwb_release_wq)
 		return -ENOMEM;
 
diff --git a/mm/slub.c b/mm/slub.c
index b46f87662e71..cac9d5d7c924 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -6364,7 +6364,8 @@ void __init kmem_cache_init(void)
 void __init kmem_cache_init_late(void)
 {
 #ifndef CONFIG_SLUB_TINY
-	flushwq = alloc_workqueue("slub_flushwq", WQ_MEM_RECLAIM, 0);
+	flushwq = alloc_workqueue("slub_flushwq", WQ_MEM_RECLAIM | WQ_PERCPU,
+				  0);
 	WARN_ON(!flushwq);
 #endif
 }
diff --git a/mm/vmstat.c b/mm/vmstat.c
index 4c268ce39ff2..57bf76b1d9d4 100644
--- a/mm/vmstat.c
+++ b/mm/vmstat.c
@@ -2244,7 +2244,8 @@ void __init init_mm_internals(void)
 {
 	int ret __maybe_unused;
 
-	mm_percpu_wq = alloc_workqueue("mm_percpu_wq", WQ_MEM_RECLAIM, 0);
+	mm_percpu_wq = alloc_workqueue("mm_percpu_wq",
+				       WQ_MEM_RECLAIM | WQ_PERCPU, 0);
 
 #ifdef CONFIG_SMP
 	ret = cpuhp_setup_state_nocalls(CPUHP_MM_VMSTAT_DEAD, "mm/vmstat:dead",
-- 
2.49.0

