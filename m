Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245508634F
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 13:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749735236; cv=none; b=sXjFVKgX71m5w/c8BIznetbI6U8V+DZSq3ikAZnXLuvTDr3vgjNayAWMtPCNEY/VSWrdenYx0qvFk2OgWfv9Flvtb6D7J1rRL8LpgmGvYqaCAiKz+0dJ8cIaMC6hOKSZiUY+1RoKHct4ttks7DkwmouVh+isxbXFztKM1DIwIaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749735236; c=relaxed/simple;
	bh=F0mystQxc8odjVizXasG0Wt1qEHEaqRlBLBIQs/waeg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rLBLYfvqRXK8M+DGl/3kwJsAfBRBdyhhomheQ+SJIPUfXCqi5F7+ewz+hLZWqFreWqGCHw4nu7u6Rtw7RfiVONsS9/IsOMGSDdXYAvZ5ePPkzKcttGWZkltxKOF45xHvQZr4glWiv0qO7xc2x52IEL6kjgVmWzNpzlGJBiGYLc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=FbaJTtP+; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="FbaJTtP+"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so11522765e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 06:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749735231; x=1750340031; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P7AG7Lmd8NgX7vxU9n/9mwL9FoiLpgOdc5FFwZWBx08=;
        b=FbaJTtP+4yeTzhleTGLr8ExJxg72f2w6X2G9YnmNnwT3Ti9Q+Oa2PplJ0rvkjzsD3i
         yE78GoYABtDvdqvti8zhQTzhffzpTdue7UY+y2I/6XAgx6iZwSO+9bvjpCo7eVv9U4x9
         h3EHgmsauXnP7FLgRwwLJy7pmCyJIxSir7O6ciL8o1gek8wE6nsmQWHdmvlLqrPLBmD/
         fAYRcUZ8jYyQ8zhZkYQNgJB/cwJJZXqlAoAFrId4+WRbCzya3QW460cpf6yqAWDDWony
         WNyssGyxaxqfYeA07+MGLdQcStV34ZRnVlezcrdn0c+25+LSUJBUdO5m6s6pUcDV9cHC
         qi+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749735231; x=1750340031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P7AG7Lmd8NgX7vxU9n/9mwL9FoiLpgOdc5FFwZWBx08=;
        b=b9+Feujp9IUhq5NsvkDcnQ/0UCXR/YBrRO4Vdb1CWbf2VcpX9/ut0E7Q79vYp46uJR
         lgPYCG4d3ZtZGh/MiQ7cRIS4pX/PSbYyNe99DdTEE1JSjWMRHw+R5SjxaNRNLNdVCvUr
         VQGPgodFIhwPYZ9zssw71KRxEcfoOyxm2gAPfW8V8K7jwbky1lPUkllFIIUNseLYpVHO
         1IHfv+jStAyzIT4OckIEfEMoS72BR+9Jzc2dkEfxSg3H6ZL1k0bRy0r8CQDOiPedNHEF
         WJw6uB7PjEAftH/PEFDVnabadZKIQGu6qV0Fb6wrL6mrtwW0LYAfL90Av9376xOaHT1J
         pb+g==
X-Gm-Message-State: AOJu0YzHVXIq8Akq9mjoZpMbrCVsWYyzp5SLgndkk40llL/WF1HVgqai
	hIeO5dnE9Hd2G+jYLT/ZU82GjSebcBIXc9rDwJOf/G+d/PBPjh7mltkS20bRdkDHwJJllrUJ1pA
	RqJg7KQE=
X-Gm-Gg: ASbGncv15YlhMKqM8YzfCr1+2Pe9a0CWUOyrGcKNg3jCN+6wIN3x9VsTbUaWljpbtsy
	VlDI0wPVP45QVG/vgdtGhwRQ45RtVDN6e4LMPYGOuFSq159GFtEyOBFVB9agvJcKkvL0gIfnS1x
	gYmKS8ohevF49/MlURtDskj/gaztSsAtz+vOYvnvICe/2z2oBdt7bLvZTCzhtalnpKyRKBzr5Mo
	k2BqQcHqSkAdlM7i3Eo8avPT5A31S+mrgei/7fJViB8y5LipvITmSVzhylcfoTxh30gpYtnBtR3
	gCTRZBWuuYv7XW3VVoLR1ZugD0FIC6GVBHoOK5wHmr/yV9dxTMCpC+TI+0oRdVY8bHH1Lmljkyd
	4QNIuQRLw
X-Google-Smtp-Source: AGHT+IEeZTp8YOhI7smKvCWWFRN2PyCUiyqci01EuuMxnPhn5vbeAZEX/ZkNfcYJG/Tc6KCaBEO60g==
X-Received: by 2002:a05:600c:34c1:b0:442:ccf0:41e6 with SMTP id 5b1f17b1804b1-4532d2bd4f3mr33267905e9.3.1749735231136;
        Thu, 12 Jun 2025 06:33:51 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532de8c64esm21693285e9.7.2025.06.12.06.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:33:50 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>
Subject: [PATCH v4 1/3] Workqueue: add system_percpu_wq and system_dfl_wq
Date: Thu, 12 Jun 2025 15:33:33 +0200
Message-ID: <20250612133335.788593-2-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612133335.788593-1-marco.crivellari@suse.com>
References: <20250612133335.788593-1-marco.crivellari@suse.com>
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
CPU affinity constraint, which is very often not required by users. Make
it clear by adding a system_percpu_wq.

system_unbound_wq should be the default workqueue so as not to enforce
locality constraints for random work whenever it's not required.

Adding system_dfl_wq to encourage its use when unbound work should be used.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 include/linux/workqueue.h | 8 +++++---
 kernel/workqueue.c        | 4 ++++
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/include/linux/workqueue.h b/include/linux/workqueue.h
index 6e30f275da77..502ec4a5e32c 100644
--- a/include/linux/workqueue.h
+++ b/include/linux/workqueue.h
@@ -427,7 +427,7 @@ enum wq_consts {
 /*
  * System-wide workqueues which are always present.
  *
- * system_wq is the one used by schedule[_delayed]_work[_on]().
+ * system_percpu_wq is the one used by schedule[_delayed]_work[_on]().
  * Multi-CPU multi-threaded.  There are users which expect relatively
  * short queue flush time.  Don't queue works which can run for too
  * long.
@@ -438,7 +438,7 @@ enum wq_consts {
  * system_long_wq is similar to system_wq but may host long running
  * works.  Queue flushing might take relatively long.
  *
- * system_unbound_wq is unbound workqueue.  Workers are not bound to
+ * system_dfl_wq is unbound workqueue.  Workers are not bound to
  * any specific CPU, not concurrency managed, and all queued works are
  * executed immediately as long as max_active limit is not reached and
  * resources are available.
@@ -455,10 +455,12 @@ enum wq_consts {
  * system_bh[_highpri]_wq are convenience interface to softirq. BH work items
  * are executed in the queueing CPU's BH context in the queueing order.
  */
-extern struct workqueue_struct *system_wq;
+extern struct workqueue_struct *system_wq; /* use system_percpu_wq, this will be removed */
+extern struct workqueue_struct *system_percpu_wq;
 extern struct workqueue_struct *system_highpri_wq;
 extern struct workqueue_struct *system_long_wq;
 extern struct workqueue_struct *system_unbound_wq;
+extern struct workqueue_struct *system_dfl_wq;
 extern struct workqueue_struct *system_freezable_wq;
 extern struct workqueue_struct *system_power_efficient_wq;
 extern struct workqueue_struct *system_freezable_power_efficient_wq;
diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index 97f37b5bae66..7a3f53a9841e 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -505,12 +505,16 @@ static struct kthread_worker *pwq_release_worker __ro_after_init;
 
 struct workqueue_struct *system_wq __ro_after_init;
 EXPORT_SYMBOL(system_wq);
+struct workqueue_struct *system_percpu_wq __ro_after_init;
+EXPORT_SYMBOL(system_percpu_wq);
 struct workqueue_struct *system_highpri_wq __ro_after_init;
 EXPORT_SYMBOL_GPL(system_highpri_wq);
 struct workqueue_struct *system_long_wq __ro_after_init;
 EXPORT_SYMBOL_GPL(system_long_wq);
 struct workqueue_struct *system_unbound_wq __ro_after_init;
 EXPORT_SYMBOL_GPL(system_unbound_wq);
+struct workqueue_struct *system_dfl_wq __ro_after_init;
+EXPORT_SYMBOL_GPL(system_dfl_wq);
 struct workqueue_struct *system_freezable_wq __ro_after_init;
 EXPORT_SYMBOL_GPL(system_freezable_wq);
 struct workqueue_struct *system_power_efficient_wq __ro_after_init;
-- 
2.49.0

