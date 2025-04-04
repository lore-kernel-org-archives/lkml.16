Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567381A01CC
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 09:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743760454; cv=none; b=D8ElV0xS0q+W2hvFmbLILM1u/IJXvGiaVFHF9w3bWjVgJUYzr3i3GGkjej/iYGK97HEfxY/Wz1vh7llVNboxLPACxZzV2X+yIR4QGj00kx/p0BX6fjYrLhYmhd3Tj2cZdhB4MJjKMjtH2T6PXrcD9j8oO4IjQeXjGEaurXyDYSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743760454; c=relaxed/simple;
	bh=yX3Ex5RHQyM/HKZNpgti3QXPbWFXK3eAGQkT2vtWDnI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=tmY9SlCbVS+6MFx85xEfYcKX8x1lewsBGZPut1c12m5rlPen+hYNBhp8+GN6HNfQgZA8Xm/ZDjHyWFwpSWxe+B0cYYF9W1bI3pgi6geTngKGfifPrmVqIaavLWM3mqmYxvo2nRR4vDAiSZ8bU3lbhq3WjmfrXsYhNVG4tNNS6ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chungbuk.ac.kr; spf=pass smtp.mailfrom=chungbuk.ac.kr; dkim=pass (2048-bit key) header.d=chungbuk-ac-kr.20230601.gappssmtp.com header.i=@chungbuk-ac-kr.20230601.gappssmtp.com header.b=qvhTMRPK; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chungbuk.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chungbuk.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chungbuk-ac-kr.20230601.gappssmtp.com header.i=@chungbuk-ac-kr.20230601.gappssmtp.com header.b="qvhTMRPK"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-22548a28d0cso24622495ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 02:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chungbuk-ac-kr.20230601.gappssmtp.com; s=20230601; t=1743760449; x=1744365249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VU5yH4ZHcbKI7QYJsJwbbbc4yWtXNzt4P+PtprtJTyg=;
        b=qvhTMRPK+UxkkpCZcar4tDq4+IzxvusXrx6spzQIQ8RbZusLTD6N6G1O5t+OA1+QGN
         0M8DqgGPgdfKYuzewP+UlI4MGmPFQcb002Lb0G7GbWriAWx8rvJSh4zZOppv9ZVGSEpB
         PRrlG+W5IKjAlwcBiukU3qiFSjk6h6L6SsqossWL7gcV2WKny7YoHw8FVAWXiukKsr5O
         sTxKj79L6PrXDvQW02vCzzaXkKvhpJhmZpDVCiTO3xN+0z2Mk0VpvbBjBsfLLBm+kuf5
         5MGkH7g6YuS8g0Eg2Wm4XD4v0xcYLN1QsKhAU5E8s+cy7yvpNckGWHfVnX4jaDVCNaRr
         GSEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743760449; x=1744365249;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VU5yH4ZHcbKI7QYJsJwbbbc4yWtXNzt4P+PtprtJTyg=;
        b=iIQ0U8OyVN4iQTue6KLF0s+9RGxV5O2BFuP7fpAiSxwkB8kPCffMcpcZBUgX527TW6
         uKQqMfDz01h969pOhyqwME2RzA62W0K+0yC+uCyjBl8gXgLXAZ6krJJ5bXRX6VjshZAl
         NIIQUejtcJ4DFX9pIugTEEEGQ8rX1FgcwlKmGv8FetoFSdo/RhyhWy+5Bj+8A/n2Ns6L
         0nniAC3A78Zw2Mzps6Eo37VetSo2O9ILnt6o7yj+IkXYpVQGqqqNL0GDrHnVODJgqn2b
         AqfIGCLftkauTlE9F+0yKgrMDFPRqWX/vSGL1W1+PMIUFzX+qY/Ly6dlgnMk3Z9j/uoX
         az3g==
X-Forwarded-Encrypted: i=1; AJvYcCVAFC2dCwcezoMKUV0MI6/hb++wSWwK/F7IhghhrdVAPiyEoszcdoHkhlc+lf5BIGOOQRsrddW6nr6iUIc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlDRvZXW6u6vJk4y4Kook89gYGnCsRNXfwiC9II1TEAY6ojOWU
	ojOmtnLRSIWOdHE5nqjv96uE2K6rrJG9cyfHov64s4Zl+Y1ywB9Gt3aftoKghvA=
X-Gm-Gg: ASbGncvJ9GdxcS0prudgc5rdbOzXwjSNHJI4dwnLHdWG1Bh0lH84cVZdeD368nqxZw+
	RCSrrWrHIz774Ss6miq/kL4OeATHuMuHh8CXS+WTx7DupevWArxLdaKE7rIyPu1EkXeFDTdPU0u
	eXUbuZ8l+fhDT+85Gz3AX1fecoP8elDIGgsgAXL1m7G6bqZCxGzI0lqmXyIxfcTT6LpooyGz1Wv
	6tX94rSr46o83rAK3PaxNdo4YYrACim9TYsXKXA0JE8ytRBseIFYCScxDFwSjPFJqV+Tueh+jii
	fnrP/tE0iO6C4tOkLDptjhq7hobFXzK8RYGhQuch9m4JABpTJUmZ
X-Google-Smtp-Source: AGHT+IHFq96ZJe5VCPPovoDk4iTmtfwQqXu1IBlzkp+BardCtYvpVoRcG349EulE0UMZaHgInFU1fQ==
X-Received: by 2002:a17:903:19cd:b0:224:584:6f05 with SMTP id d9443c01a7336-22a8a8b80edmr40410015ad.41.1743760449019;
        Fri, 04 Apr 2025 02:54:09 -0700 (PDT)
Received: from 44-machine.. ([113.198.137.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229787764ffsm28308925ad.248.2025.04.04.02.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 02:54:08 -0700 (PDT)
From: Binwon Song <qlsdnjs236@chungbuk.ac.kr>
To: mingo@redhat.com
Cc: peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	linux-kernel@vger.kernel.org,
	heesn.jo@gmail.com,
	Binwon Song <qlsdnjs236@chungbuk.ac.kr>
Subject: [PATCH] [BUG_FIX] scan period increase until max when migrate fail
Date: Fri,  4 Apr 2025 18:53:54 +0900
Message-Id: <20250404095354.311156-1-qlsdnjs236@chungbuk.ac.kr>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Binwon Song <qlsdnjs236@chungbuk.ac.kr>
Co-developed-by: Heesn Jo <heesn.jo@gmail.com>

We observe that the NUMA scan period does not change properly. The dynamic adjustment of NUMA scan period aims to find an appropriate scan period,
but I believe the current implementation does not behave as intended.

Once a migration fails, the uninitialized values cause the if condition to be repeatedly satisfied, resulting in an immediate return.
This occurs because the initialization code is placed below the conditional block that checks for migration failure.
as a result, the NUMA scan period (numa_scan_period) keeps increasing with every placement evaluation,
eventually reaching its maximum value. This can significantly delay subsequent NUMA balancing attempts,
even in cases where retries might be beneficial.

To prevent this, proper initialization is required. However, upon reviewing numa_faults_locality[2],
we found that it only increases but is never used elsewhere. Given this, it is better to remove it entirely.

To address this issue, we utilize the task->numa_pages_migrated variable to track migration failures.
Initially, this variable was accumulated only when TNF_MIGRATE_SUCCESS was set, but we now explicitly reset it to 0 when TNF_MIGRATE_FAIL is set.
This allows us to reliably detect migration failures (numa_pages_migrated == 0 → migration failed).
With this approach, the numa_faults_locality[2] value is no longer necessary.
Since numa_pages_migrated is not used elsewhere, using it for this purpose does not cause any issues.

Additionally, we confirmed that vmstat tracks only the number of migrated pages, which is unrelated to numa_faults_locality or numa_pages_migrated.

Ultimately, this bug fix enhances the responsiveness of NUMA migration and reduces the size of task_struct by removing an unnecessary long variable.
---
 include/linux/sched.h | 2 +-
 kernel/sched/fair.c   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index f96ac1982893..cd0aa51d85ae 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -1394,7 +1394,7 @@ struct task_struct {
 	 * period is adapted based on the locality of the faults with different
 	 * weights depending on whether they were shared or private faults
 	 */
-	unsigned long			numa_faults_locality[3];
+	unsigned long			numa_faults_locality[2];
 
 	unsigned long			numa_pages_migrated;
 #endif /* CONFIG_NUMA_BALANCING */
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index e43993a4e580..5576a784d1b4 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -2717,7 +2717,7 @@ static void update_task_scan_period(struct task_struct *p,
 	 * migration then it implies we are migrating too quickly or the local
 	 * node is overloaded. In either case, scan slower
 	 */
-	if (local + shared == 0 || p->numa_faults_locality[2]) {
+	if (local + shared == 0 || !p->numa_pages_migrated) {
 		p->numa_scan_period = min(p->numa_scan_period_max,
 			p->numa_scan_period << 1);
 
@@ -3237,7 +3237,7 @@ void task_numa_fault(int last_cpupid, int mem_node, int pages, int flags)
 	if (migrated)
 		p->numa_pages_migrated += pages;
 	if (flags & TNF_MIGRATE_FAIL)
-		p->numa_faults_locality[2] += pages;
+		p->numa_pages_migrated = 0;
 
 	p->numa_faults[task_faults_idx(NUMA_MEMBUF, mem_node, priv)] += pages;
 	p->numa_faults[task_faults_idx(NUMA_CPUBUF, cpu_node, priv)] += pages;
-- 
2.34.1

