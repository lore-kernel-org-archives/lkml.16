Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF39028134E
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 11:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745321553; cv=none; b=f9NzKQQebpFcxhIQQsP7nlkenj7hdnP8MZhDYaIJuxbk6+qNcWFvXRcC9lhuuK/oyrCe79zQHjaS6cyl9GG9UofkSmyAhzn2ucvinum7UANnVuRRhtz07pgaHr1xFyfTBLcMMT9saWctqPqj8vU1N5S7YUHQUEjoRPimKcBgpwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745321553; c=relaxed/simple;
	bh=qwn4Lief7wgubEepkWmBxUkY4oGRDY4M3wvf/KtKAN4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y2Y+Pzxnc0qdcTeHetGdaZIFE4cN/UPA7rU4tx7Rx3NEXeTDGYE1vTIGGXJ6mkyjf2RW6tY58O4r6mux871L5cWAxDNjV7Kibcd6aHTzazPqogHTW13SHbslBtCHtZJ+hwpkznd+jVE0/xhN5vkPJZQxI2QWGnnVYhpLAr61EWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=InMJhGSb; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="InMJhGSb"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so57784385e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 04:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745321550; x=1745926350; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cvmS58q+1N4NLUDG3LIuB02O70ZoHihiBJ1Y750u6aM=;
        b=InMJhGSbSf2vRyZy3H0hOHFGjxMh5v8/b1pfyuuNRneG9ouTMrkl5sOl6d/o+mW8jO
         b4nRmOid/Fgd21pftd3i2zvebOGTYpjrm9uFUzNzisOjfxpB/I5LKy2voJjOAfAq1qDw
         8iWhTQ9LwnYqJatLWC4SsyxUGZ2s6pANa/9aAHSZjC+1/BTC4lZDPmgwpELqw0i5Hvkl
         2n1uOm6F3ngwHiX6t0b+c4GQjKH6cU0KSWF6Dq1WIaj/q0UpLgu0FiZG1n4NOUG1JmyK
         2EBlZN1zxpKCvOH2VhmWkVuYYzgHSB13VRIyGa0HMlf3m/5lpWpDbHrXrgwBzMvO0gK5
         lyjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745321550; x=1745926350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cvmS58q+1N4NLUDG3LIuB02O70ZoHihiBJ1Y750u6aM=;
        b=dgU/Ow4BtHbXfRlxVCVZyt5ZOKMtIMqFe1ZrrPYSp6R6M+VyUTgW9ImXGAdrWF/i8T
         lhSSanmbovQVuc8+KZP1aX66z7kRsw/nTjlx+i/0HjgkZg47Mv2/aCnmR5SVnPTFIL+6
         pX59OkZxrggzIIAmGUJ6cAJb5FwroSlcbFxqDH/hkG9CunkWAmOiP32vw8X1blBCnZNu
         6wx3dUvC1CNUU9zVHQRmX5ce4Rnh9QPIwIkK5xX5b/++6tmXGzc7qghIARnV6OwDYyu6
         JGJJHka0pGK4Dm+wWDwTJumU/Lpq7rMmqzlxWqd9HRzMJVSGvEp4wiwX3jcU/ROkgoq7
         35zA==
X-Gm-Message-State: AOJu0YwUFJDYVaG/LH2a8r0SXBJPE9k8N2ra6iiYK8LkeVi2NT4V+291
	b6HT9MWHnT7Tf4FC89xZHVxSei2ryLpDsciqVgdIiO6cUPozUp2RFdakuqFel7M2NaRkApvPhuS
	G
X-Gm-Gg: ASbGncsLxcLI+dsfMTowuO5bCOoedWN9Es+/+MO/jyPYfyLE3Wce7nVslZtT9XKf1/u
	nbZ04s/bmw5wOZByd94qQaVPUFj5WdErrpMDwXfOLKxZ9viPPw4XkdChC59dIu458mfyDXRfsuy
	nwlPM80RyTv1+sJeSofVs4q+P6SoOhaphO6IeIXOcaZQYklweug/9CnXtR5i+ineQtvPcJ+MeUw
	HYRiRsBBrjGNH0Blmwkao0pum1mmDvRZ0S+K88FP8pvJn9NNIha6LrZR11dSfxaHuyrmoU92bOK
	Ymi6REcVdwy1tspmIJbM1fMDw9Nyyd9xwXI1QQ76mIE94Y1NXM9c
X-Google-Smtp-Source: AGHT+IEGyrx2mGjKmUnsFcIC3SpcjXAJAkCfqaXdm/X2mvwM46sWClIbCzBR8wdxshvHGYRPAtMSRQ==
X-Received: by 2002:a05:600c:1e15:b0:43d:82c:2b23 with SMTP id 5b1f17b1804b1-4406abfaae3mr114731845e9.23.1745321549987;
        Tue, 22 Apr 2025 04:32:29 -0700 (PDT)
Received: from eugen-station.. ([2a02:2f0a:131e:0:1820:da87:73b1:d80c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa49312fsm14907887f8f.70.2025.04.22.04.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 04:32:29 -0700 (PDT)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	andersson@kernel.org
Cc: linux-doc@vger.kernel.org,
	corbet@lwn.net,
	tglx@linutronix.de,
	mingo@redhat.com,
	rostedt@goodmis.org,
	john.ogness@linutronix.de,
	senozhatsky@chromium.org,
	pmladek@suse.com,
	peterz@infradead.org,
	mojha@qti.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	vincent.guittot@linaro.org,
	konradybcio@kernel.org,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	eugen.hristev@linaro.org
Subject: [RFC][PATCH 13/14] sched: add sched_kmemdump_register
Date: Tue, 22 Apr 2025 14:31:55 +0300
Message-ID: <20250422113156.575971-14-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250422113156.575971-1-eugen.hristev@linaro.org>
References: <20250422113156.575971-1-eugen.hristev@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add function to register scheduler info into kmemdump

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 include/linux/sched.h | 1 +
 kernel/sched/core.c   | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index 9c15365a30c0..441f5a6099f6 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -1820,6 +1820,7 @@ extern int cpuset_cpumask_can_shrink(const struct cpumask *cur, const struct cpu
 extern int task_can_attach(struct task_struct *p);
 extern int dl_bw_alloc(int cpu, u64 dl_bw);
 extern void dl_bw_free(int cpu, u64 dl_bw);
+extern void sched_kmemdump_register(void);
 #ifdef CONFIG_SMP
 
 /* do_set_cpus_allowed() - consider using set_cpus_allowed_ptr() instead */
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 00ea6f31973c..8615fd02d4db 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -66,6 +66,7 @@
 #include <linux/vtime.h>
 #include <linux/wait_api.h>
 #include <linux/workqueue_api.h>
+#include <linux/kmemdump.h>
 
 #ifdef CONFIG_PREEMPT_DYNAMIC
 # ifdef CONFIG_GENERIC_ENTRY
@@ -8672,6 +8673,12 @@ void __init sched_init(void)
 	scheduler_running = 1;
 }
 
+void sched_kmemdump_register(void)
+{
+	kmemdump_register("runqueues", (void *)&runqueues, sizeof(runqueues));
+}
+EXPORT_SYMBOL_GPL(sched_kmemdump_register);
+
 #ifdef CONFIG_DEBUG_ATOMIC_SLEEP
 
 void __might_sleep(const char *file, int line)
-- 
2.43.0

