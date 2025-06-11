Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E6E2874EA
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 13:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749647705; cv=none; b=nkYrhp8QnXgAWOelqkE0A421YW2tE8azaj2LyRxeMPslyfmzoxsos6/7WF4vVG5J4PZucLcmVygjsV9cJkhSStDYWXk/Pzyfy1weOUUoqZq6UK4bsXY6GMrlZIyISO8JVx0ovViOQWfD238SZ3odEceglZ5HRrXiFxRRQxKsQyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749647705; c=relaxed/simple;
	bh=xdTWOf8dpTJuc+vDnclzqJl21j+xYSOMWX1f9TX2HB8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h7zLvsLiK1hMpM8Sh6K3tdQRcWHa8fwm7BpGJkkUTu5BBuGpS1u32YqR/Spd+LOhttvKv5yO2f84Yi9Xn1PTTk0zt24VzaExaRJhdWZ/SG+ofI7wnTnmx9xEa7ya26xk11NoTr5T63TqHaHbz2dA+vZsCCkkeXoQQ58P7SGDHkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=T2iJhb1e; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="T2iJhb1e"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45024721cbdso57162355e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 06:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749647701; x=1750252501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NYuW1RWl2WHwN9nKC4eyrLynhVtMDg5bWkA8n4Ub08I=;
        b=T2iJhb1eYGImOmOD/IE+bggLCbuPIMOTPjwVflBVy4jJAMdzSpFRYp6R/KkFivtlIw
         M0GpGBHdrZ45M5NYgJDi8yC5S8Wy4lHOxYMAVorAnl3N/xD0FEPfxsMKp7oR5VaNwtX1
         mxmSQl9u+MF7EmzZZfcHXiV+fXrcfDTJSiviJrQ0vm9zakuBtDLGEKyzBRNuC5TCkEod
         zNndVMnS2l4yCBw/sM8j14v9nbj+yzFbvswK8OvQ3/ypLm3QuYgklAmMT1hSdWFNmtsG
         79Yl0+AOaKVmr3exgmUEw7MHRid/njvcNL9s+JDaZOwaV41r8sZ9mjzVONV+j/x2YQ4r
         U1tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749647701; x=1750252501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NYuW1RWl2WHwN9nKC4eyrLynhVtMDg5bWkA8n4Ub08I=;
        b=X6h0OGNORHKstomawi0fopqE8L0wTI5lOeGE9iKE4hzDJQ2NcTawGocd8G0ZtIc2ye
         qTNXrZ0/sZOXvx8amLRC2LozHiqBziAnjss3wOTX/B8GqAymkWzonX96OAzQHYdcc897
         tUhPShEsQuGEnoeTsZKlsg6PDOUGvjVbUbqNS5xRfOPXAm8buJYtjgqlV40D+989uobN
         sbfhQfhiRYJ4MT7QwjzComzJVzM+BrJDof0aOMz/XHOn+lBrkC/RTLS0BNKYByQ2UCm3
         86XcIR7wl+GpWJbTFMcwG99QokHJKa8SC8dF2esF7jzdL90+vaDymc/BIuL9arOHp9iR
         IDDA==
X-Gm-Message-State: AOJu0Yy5ni4MFDIKZfU0HXp6NYS9pAq3pyw9fPBQCmOHidSqF9BQbmzD
	HHjogMXDM30XthfMTa/aFcmZcvqf6MN79bwjzJ+ikijRScCSYAbVTx4RBzHrchnYzgy3rlosYO8
	r7zvTN5E=
X-Gm-Gg: ASbGncsHekDmSWA7wJupKVHO6eMkF8PD/fStM3zvonXI8ligkNXv8vSo9OCKlg01e4N
	eQLjBesZ4IifB+qZWJt7WwT9JYNu3brv+sjH9yZ6V7umP7t10OUL9SPU2QRvILusl7RtGL4mGo9
	bDDbjUKFdPmkiaXEcTp/FhyUr9Kn+eDmp0QVsgt2CrzLsKW67A7m18swiCrpSz47g9Fu5ug+WeJ
	gXWZwM8Y/p/h26qTvGKcdTmV38k0iu7fdxzkctBRmRl0gDJ7vegAcaKflVgB/tTr8fwmLhl4LTv
	9QKfgzq5JFBJswErf/V1igu2xnoCPSkTrnEECDKLFQqF69163PhJE0GD16NJqBUdjDXRy3jWNHZ
	5K1TKQgOrUaI=
X-Google-Smtp-Source: AGHT+IF8IVTdjs6wWJxY4QsdEeAtNusyVaJ5Ak+pqxhp2HqBIOuzFD6gxh43+d9OV8PSMrMs7kvR8A==
X-Received: by 2002:a05:600c:3583:b0:453:608:a18b with SMTP id 5b1f17b1804b1-4532487b27amr27189425e9.9.1749647701248;
        Wed, 11 Jun 2025 06:15:01 -0700 (PDT)
Received: from linux.fritz.box ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5323b67ccsm15300103f8f.40.2025.06.11.06.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 06:15:00 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>
Subject: [PATCH v3 6/9] Workqueue: mm: WQ_PERCPU added to alloc_workqueue users
Date: Wed, 11 Jun 2025 15:14:35 +0200
Message-ID: <20250611131438.651493-7-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611131438.651493-1-marco.crivellari@suse.com>
References: <20250611131438.651493-1-marco.crivellari@suse.com>
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

