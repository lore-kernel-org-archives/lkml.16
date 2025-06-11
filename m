Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E41281357
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 13:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749647700; cv=none; b=Ic/GO2Nn0FG9ao6HQnRTNtc+gI1G2bwVZMvQwcq6jS2ed18gA+ojB5a2SUBgXeRuFi2wz9qoO/tSLw63vkCnjVPoXXrUb+L2L0ppMuHq8mAKvQcIjRoDk0z7fnayCDScoZ3j9I9UaOV8rCxU4fyWOioW8seKbxGvX/AwNaC1F0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749647700; c=relaxed/simple;
	bh=nxPWFf3cevMBeZnqTBUR2KxNKDC+KbXW/fVZ6nY33qE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V7qhlTxUw132Q2gE3OmGRgQwLyd373CuOZKfKZinYD9OtORR/zcNw+1Iod57dF1DJZ7an3+91MUnpdYKkOtiz2ZF1UCAlczlK0ZIDlwmePWcBssR77EqzpxRLLXg9DQ5VUZS/cu8YJweEUhUvYy2J0N5yaQJR7abAjyWXczyLVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=I+vFanr5; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="I+vFanr5"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-451d3f72391so86361585e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 06:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749647697; x=1750252497; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zOjKIJH1ol0JJuOKGy0y64ALk2zaD7FKRkqyE44Vz4c=;
        b=I+vFanr5NQRuotfa8HNhVCgZb8CrDCnwMsfi+FDhYEXiPrWA4hUTLCCgdVOMrV/3+z
         HFK+UdPJWlch5WE5Tac4m0Q/CjerY29zMITkuP+TGwGP1X06BAHykFSFDjL31VbO8loK
         voCt6/EV1mHg9vH2MFczHypG64Us8OwfT9jr+MmzTlY2wCpNUEXiTWTGIz9poIO5aX/S
         IjkPWBZ6T1JHNPhdBzM5yeFAU1T67oyk6SDXIW+86PufM4Jk5xSAdEnTU4aGMQiGYVsV
         wljV8xTmcDp6o1G6nhgA2zl1WPIGrW9ok1sYPd6CfAJJtRfd2bIWA+lZaCFMB3yNGs4X
         9mjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749647697; x=1750252497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zOjKIJH1ol0JJuOKGy0y64ALk2zaD7FKRkqyE44Vz4c=;
        b=TJda8AAuPDkV8xV96yhmYx59uwr/mAQH2uqiwCnr3jnxFQDgP+KzrkbNDrhNJkPhdQ
         r8XV0dWWRNQ9a3sFcMGpyNdZceOXX4IPRlt/MkIwrMyyk7mvMHKhkC5WGNhES8WqVJ/v
         IAYsEVeKSDa48XYGPUEzCAGJRahCYwzu5CSplMpWjOUnrVJkdZeyEskfyh0CG6lUpg+r
         bpKjHrku/dbnJaSKMwAZm8DT7feIip9zCjkQXzXtyVMQP7kd7ZZD6lftvphhDGEmjVY9
         3rgH5dV9/7hCL9mBliqOOcOhwFzwo6ksHk6nrQFC9Ga8/Qjan99tgsKGQzdI4RG5WFgb
         U5+A==
X-Gm-Message-State: AOJu0YyDuHzqSmSCZPBrypkoMAMyv2RjJ4Rx1DeNodDnUwMG255/LHzB
	3YF+6WdZDL4/JOuLQpTq/RPq0t+2BYiWV0b3XkB105QmvLT1zmczWVk9JsSwHWCnFLT3IPyspBZ
	K+au6OBE=
X-Gm-Gg: ASbGncvOA42v4Giez1Vsamr2PQec4VNFQKEsP7J3MH4bdZFvEWR0cd7R7RLhUUxKT+3
	3Hi8cI44/wT+rozyw6KIUT0IF2iUXW5zyBkBqDIpoXZZTFMTnIg+H3eumwLIbcDcd608GgXK8fl
	NVSkwbWwm/bH7umKKxqcPVWm6wjzjX9eq/qb0Q3hg26rUfj9iQzc5lD7VfKn/sppLjYdWcu4gYL
	j04tTnBGXjlOk+1zT00mCSyE1IS3xIdlycerlKRxhK/qXEUceNf3lY9fDAkygbkXLDKV82a7VTA
	oE060cH9ySsr25un/RJ1XLdFJvbshcBEdP+VG6A/ekAJRGUXSHqYyCJy41j9RJDzmFHIC42JFig
	cYeAFG9kbrQA=
X-Google-Smtp-Source: AGHT+IFvv30ivA7IIrSDgnMOgxi2gRygJfJjVsH3mGhuozRGYC3EyXjjsYx4Wje+9IDSAHjFIroiaA==
X-Received: by 2002:a05:6000:188b:b0:3a4:e6c6:b8bf with SMTP id ffacd0b85a97d-3a558af94cdmr2469652f8f.52.1749647696541;
        Wed, 11 Jun 2025 06:14:56 -0700 (PDT)
Received: from linux.fritz.box ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5323b67ccsm15300103f8f.40.2025.06.11.06.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 06:14:56 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>
Subject: [PATCH v3 1/9] Workqueue: add system_percpu_wq and system_dfl_wq
Date: Wed, 11 Jun 2025 15:14:30 +0200
Message-ID: <20250611131438.651493-2-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611131438.651493-1-marco.crivellari@suse.com>
References: <20250611131438.651493-1-marco.crivellari@suse.com>
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
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/include/linux/workqueue.h b/include/linux/workqueue.h
index b0dc957c3e56..74b0042709cd 100644
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
-- 
2.49.0

