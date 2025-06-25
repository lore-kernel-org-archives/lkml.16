Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A12C291C01
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 10:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750848589; cv=none; b=fGGWF97SAMaBMf+3qSCHi+m5CBjkvEPx4O12Wk6+6EEg/YUeFvJEGh3KpFvzrKEKsix2BaVoSw4vHU2hAuqYD0WVcJ5CwjX4ohZ7lk+Wh0kAHsnKf+6zeXykNNRLmmYZOtN/i/wms5iSi7Z+ObHTp/a/r/B9A5ww0Mk1ms6E6CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750848589; c=relaxed/simple;
	bh=lIqcr/42jMKTWS1dAKMz0yvwJ/ZAHGm1zdUQ3Dwh+ic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vi7vwG/gXFwhRi7hr4HRset/Rs9BDhFfTlaeK0wXzmH6pAMUjK4m1LLAsosd5BjTpFIWPJjMg0hcDXYl/EI1mubo6LQPKI4hdxuZCAIo7j2gQReHkgiQAG+2wT22cIylDjARulum8KkPtdCWCp54pP9AsRbUJ2rKc0tkLlrbldI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=CRLMz5j+; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="CRLMz5j+"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-450cfb790f7so10511265e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 03:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750848585; x=1751453385; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Wf7xFvpyqjNhht2xO4+W1t7dI2NL8pfw37E0LPaej0=;
        b=CRLMz5j+7q7UTcvt7fkEWD0Z6BqYiGXq+j0lt43sNVe4rf98LLjwykJaX+URMVqOIx
         kXF3zOv0Rp1yymUybmsR4S8369XxXUJaABRAZKouhtajGNLvfx1sYZMoHIztMn78GZXx
         Qdz1f87W0iCl04z1G8fuSkG8MCcag08qvfB5KUoSX5kVSNhW+aL1PBH8KsBuslcSKWYL
         gdExl/VXZj2bI4bTZeZyTwfbNGDoNRK0Djl/X267NXQPsZABSLYR+OFV/EOF7SjiU/6G
         Kf4v8s++VU5Sa/jR4YXMmIYHemFkZyc/xsM3LAt+XvUdSKbboGbdofXa/QKJYzezJuIk
         B3HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750848585; x=1751453385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Wf7xFvpyqjNhht2xO4+W1t7dI2NL8pfw37E0LPaej0=;
        b=qnNYhVgINWPysS9bNF4mBXcVyX5ZCr3OExlGHaPUH2XeS8msMOf9u41GvApgpU8Aue
         th5I3IfYvm6+8K7NbYPPG7XjMTm0SaxsmxEacu2irqlmm1Jdcjm/yB5SPAta05Zf2+Am
         qYpZUyA8kGKH1Zqv35epz75eZx3smIUBlWSZPpJixhwjnHq/nVO/iwRmSowtNbGKMqpo
         WNeO+RvVfwf2WQuOC/EZubfrISmBPl2y6/QwC64ys+mtbJsVd3Kn+AHHOFxJK+GEmCBg
         JrDD9JfVLz5ZeqI8hSuFq2NeY2Qg6+PYT3PLVrF3+PFuXL6/XyoCp8Hj/tybKkGdHYM7
         hqJQ==
X-Gm-Message-State: AOJu0Yzz+gKpgPZHlGvu5qCAGnI+HP2P17dig7Mxl7mUxPDbXqH1Cofs
	/pRUv9gITjcVtmadnO9tkQ1N3NXjX2nB0JX1EIv08yip9KQ/m46uUx4TIAjNekGjVOEr0UWjVjP
	P52efidI=
X-Gm-Gg: ASbGncuAM5IQBnM8JLA0ZaLX3ny2MfoT97WCVVp/oIKQcyLQ7MYuKcmPmeiGtNhTyJy
	YpcWx5qqA+G0qf7CCmwqoxwkegxauSlHIowRBP47QBao8ntNupDVfPF4zg+tVKGA9zRNTlkVnP3
	kxmRU0bRCxNRDlaGxSwJZ6RcvbpIr31E9JXPdKfm7CGTLcH/jKfNjGBV/gsWvAQ6c6P18JDZCX5
	jkNoRjewbr8vOk6O6zs8yDo6LQMLgqy5XmRhzVva5JTZ9BbdlTvIUyr1C7EyiRJuWSYr7yDy46o
	suP8+Zbqs6DRAwvZvHUfpU0b14NYXfr/ah8pCyXD0slPoOgWUQe7SeKiKdOe1rvigNijfDwZ0b0
	lPa20RQshZA==
X-Google-Smtp-Source: AGHT+IEC49BCaJXy5dK7QYQZaF12sEvybfhy9ZnHhrnZRQBsKflkylm3RfP8V81BhLvgOdn6+5jHgA==
X-Received: by 2002:a05:600c:35c9:b0:450:b240:aaab with SMTP id 5b1f17b1804b1-45381af0dc6mr24242675e9.8.1750848585282;
        Wed, 25 Jun 2025 03:49:45 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538233c49fsm16195055e9.7.2025.06.25.03.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 03:49:44 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>
Subject: [PATCH v1 03/10] Workqueue: fs: replace use of system_wq with system_percpu_wq
Date: Wed, 25 Jun 2025 12:49:27 +0200
Message-ID: <20250625104934.184753-4-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625104934.184753-1-marco.crivellari@suse.com>
References: <20250625104934.184753-1-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently if a user enqueue a work item using schedule_delayed_work() the
used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
schedule_work() that is using system_wq and queue_work(), that makes use
again of WORK_CPU_UNBOUND.

This lack of consistentcy cannot be addressed without refactoring the API.

system_wq is a per-CPU worqueue, yet nothing in its name tells about that
CPU affinity constraint, which is very often not required by users.
Make it clear by adding a system_percpu_wq to all the fs subsystem.

The old wq will be kept for a few release cylces.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
CC: Alexander Viro <viro@zeniv.linux.org.uk>
CC: Christian Brauner <brauner@kernel.org>
---
 fs/aio.c            | 2 +-
 fs/fs-writeback.c   | 2 +-
 fs/fuse/dev.c       | 2 +-
 fs/fuse/inode.c     | 2 +-
 fs/nfs/namespace.c  | 2 +-
 fs/nfs/nfs4renewd.c | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/aio.c b/fs/aio.c
index 7b976b564cfc..747e9b5bba23 100644
--- a/fs/aio.c
+++ b/fs/aio.c
@@ -636,7 +636,7 @@ static void free_ioctx_reqs(struct percpu_ref *ref)
 
 	/* Synchronize against RCU protected table->table[] dereferences */
 	INIT_RCU_WORK(&ctx->free_rwork, free_ioctx);
-	queue_rcu_work(system_wq, &ctx->free_rwork);
+	queue_rcu_work(system_percpu_wq, &ctx->free_rwork);
 }
 
 /*
diff --git a/fs/fs-writeback.c b/fs/fs-writeback.c
index cc57367fb641..cf51a265bf27 100644
--- a/fs/fs-writeback.c
+++ b/fs/fs-writeback.c
@@ -2442,7 +2442,7 @@ static int dirtytime_interval_handler(const struct ctl_table *table, int write,
 
 	ret = proc_dointvec_minmax(table, write, buffer, lenp, ppos);
 	if (ret == 0 && write)
-		mod_delayed_work(system_wq, &dirtytime_work, 0);
+		mod_delayed_work(system_percpu_wq, &dirtytime_work, 0);
 	return ret;
 }
 
diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index 6dcbaa218b7a..64b623471a09 100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -118,7 +118,7 @@ void fuse_check_timeout(struct work_struct *work)
 	    goto abort_conn;
 
 out:
-	queue_delayed_work(system_wq, &fc->timeout.work,
+	queue_delayed_work(system_percpu_wq, &fc->timeout.work,
 			   fuse_timeout_timer_freq);
 	return;
 
diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
index fd48e8d37f2e..6a608ea77d09 100644
--- a/fs/fuse/inode.c
+++ b/fs/fuse/inode.c
@@ -1268,7 +1268,7 @@ static void set_request_timeout(struct fuse_conn *fc, unsigned int timeout)
 {
 	fc->timeout.req_timeout = secs_to_jiffies(timeout);
 	INIT_DELAYED_WORK(&fc->timeout.work, fuse_check_timeout);
-	queue_delayed_work(system_wq, &fc->timeout.work,
+	queue_delayed_work(system_percpu_wq, &fc->timeout.work,
 			   fuse_timeout_timer_freq);
 }
 
diff --git a/fs/nfs/namespace.c b/fs/nfs/namespace.c
index 973aed9cc5fe..0689369c8a63 100644
--- a/fs/nfs/namespace.c
+++ b/fs/nfs/namespace.c
@@ -336,7 +336,7 @@ static int param_set_nfs_timeout(const char *val, const struct kernel_param *kp)
 			num *= HZ;
 		*((int *)kp->arg) = num;
 		if (!list_empty(&nfs_automount_list))
-			mod_delayed_work(system_wq, &nfs_automount_task, num);
+			mod_delayed_work(system_percpu_wq, &nfs_automount_task, num);
 	} else {
 		*((int *)kp->arg) = -1*HZ;
 		cancel_delayed_work(&nfs_automount_task);
diff --git a/fs/nfs/nfs4renewd.c b/fs/nfs/nfs4renewd.c
index db3811af0796..18ae614e5a6c 100644
--- a/fs/nfs/nfs4renewd.c
+++ b/fs/nfs/nfs4renewd.c
@@ -122,7 +122,7 @@ nfs4_schedule_state_renewal(struct nfs_client *clp)
 		timeout = 5 * HZ;
 	dprintk("%s: requeueing work. Lease period = %ld\n",
 			__func__, (timeout + HZ - 1) / HZ);
-	mod_delayed_work(system_wq, &clp->cl_renewd, timeout);
+	mod_delayed_work(system_percpu_wq, &clp->cl_renewd, timeout);
 	set_bit(NFS_CS_RENEWD, &clp->cl_res_state);
 	spin_unlock(&clp->cl_lock);
 }
-- 
2.49.0

