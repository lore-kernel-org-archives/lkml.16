Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD892556E
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 07:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739001562; cv=none; b=mPVUNvjWKvH4lQsEV3fTyRnKgxkmSBSL/sL9fY6LHxlsrlSZ2j4MhjEfNwnDlE1RtMfXbIvWtJXYHKGhlPzjytKSr+IcrZDmW38IIHQ6FQNHqV6lY0ZwDvsfMRiglKNyvpTrMHhvm5WGOUKIUqD25tNTSFt9qZGtZEoxqw2BdcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739001562; c=relaxed/simple;
	bh=NYH1EIR1w30hMUBzWFLtaK9NEC0+m6W1SVQ1YrLKHCQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iDObdWb12L33CImqsGBcuab9to492WQZbGw2AQmrrN9sI+ZIdWcanblYOAq0Mjm+JgT4XrrV/opn8hZQy2pJimmZyyk0/wnubIStNOE454gaWcnA+aJbLlCDkvmtEk3lDvDogAmr7IO+aTXb5K/2DzIwJALW1x2NApWE2V+OiAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J6TsYr+B; arc=none smtp.client-ip=209.85.216.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J6TsYr+B"
Received: by mail-pj1-f67.google.com with SMTP id 98e67ed59e1d1-2f44353649aso4187904a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 23:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739001560; x=1739606360; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wIqjiMV/Bkb39K9yqJeN0eIM7HEpUk3IzO0W9QqPo48=;
        b=J6TsYr+BxlfWMXt5XFF6AUrA/WLXACVN2WHb3m5zogpc4hVoKSu4eLsyggJEe17vvw
         fWFkNGQ9UKdzIjjZwHQcVwKg5fsKiN3Bl5bfGuV7twFVpgtrTxZYWSHaUmunKPY4sbrX
         K1DYElRa3kgi6zVVoiw0otVVs8U4Yu423YRot8cGR9SEyh2IoiYP93eK5Ao4wbU/ngdR
         zssYjvs61my0/WTDTi5BIPnDBr9GTbYza2/G8yE0+C0flUX8NbVv65/D6cd+PiLU6Qwr
         Atdr2v8GyRfXDhW5+pF/DeSAZ5DF36GgBh+S5BHKsAKdCm/8w21VaU+Y+7Yz6jusKxPE
         6B7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739001560; x=1739606360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wIqjiMV/Bkb39K9yqJeN0eIM7HEpUk3IzO0W9QqPo48=;
        b=fFmWHDS/UzEEePbBwn0eQLtfTCvamvikMP5ePUZyID95/b2D68FDDPrtntEEukiWuV
         lACSCDODaLyfEiOSDXtW7YS5h6/xWzrWX0ccCcJA/wkNGFodH3F3UxYQgN9Iet0rWKUs
         kCBjWV+tI573pYja2tvi4SPZ9ioq2nF6okear7MyPD2lbLOPBg7ES4cLfLS+iomNHUQY
         T/ZI3uFmcHNHkunVI3+WEn6RsbfaJIaP1gfToKfnH1m8OgmSPrgu5x7MxHwGukTuzwwa
         NgtL2osnwsQD6wSEVyV9ESxUXhCfg0LaWB6UXT/N6Zv3sQk2cuc2L+Zg7Zsnp5PIogrv
         mTBA==
X-Forwarded-Encrypted: i=1; AJvYcCUKLWThHnFRRy93uY7cW5tSKAxTLQsDp7bDjrr09KKwPyAEVnTmiLtILY8EA90TF4dtIay0MFpO1Yjq3rE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz58M9T3SCiEfk/BSMNvenpGIVmce69SeATVgLMHySllAAVy6aM
	8dh98rfNzM3vU74/1f68aXc3X4uBQcez0kBvH9aTbCLwW4mO8P3b
X-Gm-Gg: ASbGncv2YXltWQ598jHJwfhJbpbtbDzJJwM9y5A1Lap/UveXwEyBseE4ElUC4tolbcT
	7mteTtaCA0Cd7nmG8ZUGBq+G4D4iK7Tl8hHQMnys8lyxi1ShkWxG7zH5zUtkuy7IaRrNfZLpnW3
	ZbR/bYLj8zTmy6FZ0zu3m+ncFrmYrbpK+rCawameeivqn8y7PLr/llm3n0Pg0cmwfNdas9mWbem
	qRUHGFvSDSnrWqatIPJM3fATjZNYX61CcJ3Ll/VB08V8/hkcQ2sLxfudl6RihXAV9v/UPbOy3Qd
	AtD433REqt/19jB53HlfRcCs2UipPTi/h4g=
X-Google-Smtp-Source: AGHT+IERz0lSqkbAawZEXTcF7FnORJti+So8tSKmF9Ij4QWWVOc+x9NZM+EqsWBO0DF7n+IULqDtDw==
X-Received: by 2002:a05:6a00:22ce:b0:730:4c55:4fdf with SMTP id d2e1a72fcca58-7305d44c8bamr10696189b3a.7.1739001559939;
        Fri, 07 Feb 2025 23:59:19 -0800 (PST)
Received: from localhost.localdomain ([114.67.205.189])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73048e1e80fsm4087401b3a.157.2025.02.07.23.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 23:59:19 -0800 (PST)
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
Subject: [PATCH V3 2/2] sched: Reduce the default slice to avoid tasks getting an extra tick
Date: Sat,  8 Feb 2025 15:57:48 +0800
Message-Id: <20250208075747.14104-1-15645113830zzh@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20250208074821.11832-1-15645113830zzh@gmail.com>
References: <20250208074821.11832-1-15645113830zzh@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update sysctl_sched_base_slice with debugfs, limit its value and
update normalized_sysctl_sched_base_slice.

Rename the function sched_update_scaling to sched_update_scaling_or_slice,
it is no longer related to CONFIG_SMP and return void, as the previous
function always returns 0 and there is no need to judge the return value
again, just like the function update_sysctl.

Signed-off-by: zihan zhou <15645113830zzh@gmail.com>
Reviewed-by: Vincent Guittot <vincent.guittot@linaro.org>
---
 kernel/sched/debug.c | 52 +++++++++++++++++++++++++++++++++++++++++---
 kernel/sched/fair.c  |  8 +++----
 kernel/sched/sched.h |  4 ++--
 3 files changed, 54 insertions(+), 10 deletions(-)

diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
index fd7e85220715..f40d9d638939 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -166,6 +166,53 @@ static const struct file_operations sched_feat_fops = {
 	.release	= single_release,
 };
 
+static ssize_t sched_base_slice_write(struct file *filp, const char __user *ubuf,
+				   size_t cnt, loff_t *ppos)
+{
+	char buf[16];
+	unsigned int base_slice;
+
+	if (cnt > 15)
+		cnt = 15;
+
+	if (copy_from_user(&buf, ubuf, cnt))
+		return -EFAULT;
+	buf[cnt] = '\0';
+
+	if (kstrtouint(buf, 10, &base_slice))
+		return -EINVAL;
+
+	base_slice = clamp_t(u64, base_slice,
+					NSEC_PER_MSEC/10,   /* HZ=1000 * 10 */
+					NSEC_PER_MSEC*100); /* HZ=100  / 10 */
+
+	sysctl_sched_base_slice = base_slice;
+
+	sched_update_scaling_or_slice();
+
+	*ppos += cnt;
+	return cnt;
+}
+
+static int sched_base_slice_show(struct seq_file *m, void *v)
+{
+	seq_printf(m, "%d\n", sysctl_sched_base_slice);
+	return 0;
+}
+
+static int sched_base_slice_open(struct inode *inode, struct file *filp)
+{
+	return single_open(filp, sched_base_slice_show, NULL);
+}
+
+static const struct file_operations sched_base_slice_fops = {
+	.open		= sched_base_slice_open,
+	.write		= sched_base_slice_write,
+	.read		= seq_read,
+	.llseek		= seq_lseek,
+	.release	= single_release,
+};
+
 #ifdef CONFIG_SMP
 
 static ssize_t sched_scaling_write(struct file *filp, const char __user *ubuf,
@@ -188,8 +235,7 @@ static ssize_t sched_scaling_write(struct file *filp, const char __user *ubuf,
 		return -EINVAL;
 
 	sysctl_sched_tunable_scaling = scaling;
-	if (sched_update_scaling())
-		return -EINVAL;
+	sched_update_scaling_or_slice();
 
 	*ppos += cnt;
 	return cnt;
@@ -505,7 +551,7 @@ static __init int sched_init_debug(void)
 	debugfs_create_file("preempt", 0644, debugfs_sched, NULL, &sched_dynamic_fops);
 #endif
 
-	debugfs_create_u32("base_slice_ns", 0644, debugfs_sched, &sysctl_sched_base_slice);
+	debugfs_create_file("base_slice_ns", 0644, debugfs_sched, NULL, &sched_base_slice_fops);
 
 	debugfs_create_u32("latency_warn_ms", 0644, debugfs_sched, &sysctl_resched_latency_warn_ms);
 	debugfs_create_u32("latency_warn_once", 0644, debugfs_sched, &sysctl_resched_latency_warn_once);
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 34e7d09320f7..0fe7c4530a87 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -981,8 +981,8 @@ struct sched_entity *__pick_last_entity(struct cfs_rq *cfs_rq)
 /**************************************************************
  * Scheduling class statistics methods:
  */
-#ifdef CONFIG_SMP
-int sched_update_scaling(void)
+
+void sched_update_scaling_or_slice(void)
 {
 	unsigned int factor = get_update_sysctl_factor();
 
@@ -990,10 +990,8 @@ int sched_update_scaling(void)
 	(normalized_sysctl_##name = sysctl_##name / (factor))
 	WRT_SYSCTL(sched_base_slice);
 #undef WRT_SYSCTL
-
-	return 0;
 }
-#endif
+
 #endif
 
 static void clear_buddies(struct cfs_rq *cfs_rq, struct sched_entity *se);
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index c7cf4cc57cdd..3ac73cbd711f 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -1923,6 +1923,8 @@ init_numa_balancing(unsigned long clone_flags, struct task_struct *p)
 
 #endif /* !CONFIG_NUMA_BALANCING */
 
+extern void sched_update_scaling_or_slice(void);
+
 #ifdef CONFIG_SMP
 
 static inline void
@@ -2088,8 +2090,6 @@ static inline void update_sched_domain_debugfs(void) { }
 static inline void dirty_sched_domain_sysctl(int cpu) { }
 #endif
 
-extern int sched_update_scaling(void);
-
 static inline const struct cpumask *task_user_cpus(struct task_struct *p)
 {
 	if (!p->user_cpus_ptr)
-- 
2.33.0

