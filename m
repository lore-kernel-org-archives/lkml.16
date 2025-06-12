Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B91153365
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 13:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749735234; cv=none; b=HBu9lB+1aqcHfwg+fBh7JSwwR1kj8LaMEnQY9OaDWTIdtxrW9fRFb/ml9G91DsfLbrPCojsJg4T8Gzb0oRpBRG9k2WntzblrNW7hctjb6b2Ws6cHUSvzYNgN/opQuVbIvY5jnwSlcJT4F0NpvsIOtDLnRgdAgxN5cVl8LvR+BuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749735234; c=relaxed/simple;
	bh=3oq/TsZ1z4wCCPvN0GY/8ISgGNeG7rRt8hkIvN7Gbjw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N6J1lZ6PejrKxN1Xz4gIYApHwmow29TqrnumwmwKqzZcfLWlinohp+rglhHrKWeZiBUl0eGU866c4UrN5MinlBVUBPxR5bl1fezSDn73JzlO/T46uQ6uaowHVd9VzQcWaaAfZM7QEoDKrP6ZgHHQ4aQkBeTAr0fQptkX8s5oGfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=HzbSlHzT; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="HzbSlHzT"
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-4531e146a24so6386825e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 06:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749735230; x=1750340030; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q5fs5Wl9aoWy1hRHAin4imbD1HAHMvNGAg/mUjcd1Y0=;
        b=HzbSlHzTAw4QWnGvVoV46Nt5I+ham1j7FRcyg0DxbrsmvStC/YSsc8NT8szOZjvcdL
         fK7F6uyrbSF5cQPIH4V18cSuMLYpt81APYn4/HtxKD+CR5dW598IuvFBj3qBNcqlIwsf
         luaucFLCaD98Ru49/0raRL8cSwJJcJH2Nh9usMg9slsLrSa0sadVAtb+y6FKrQ+J4yRR
         Ppj74w9tHKTa9v2MSTdzfQrTa+S7eh3qx39upLVRrI1FnWYtyKbBblfe2UjdYqAh/oNA
         RWrKvBVeC20Dw5YoE33onaIezCFO/g5KfxpQtnfyp6aTUIZaDWcPq55z7spn9Xx4v3jH
         RW1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749735230; x=1750340030;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q5fs5Wl9aoWy1hRHAin4imbD1HAHMvNGAg/mUjcd1Y0=;
        b=CKcycXn0/Kw3KXPI2w6eWMsL3dZ249KJ2URPZpSyaXzJ3uV6Pt6bfE/fD+/LEAH2SL
         TdJ5ZGAXu25njt+wWJebSU+mbj9F3q220Mc+1JrMEL58PdlOf85Co/kyT/4o15rOqKG9
         +AtHtpKSXFUPNy7S+b7/1JKwa786cByIoZyAAjqv6NB/l/nYXHRlODaPE0TQSy+nSSOH
         fVQCVtwukRJTSIft5DnUCIllwLwHc3hDG9tLpGcM0JPk2nZfOSQcwXD7ak0cyx/QceH8
         Xl1q0427kDGrsqGx5qYgNwqp1ojlrNYo9gUjfdE8F8/Iliz7cBIXEuEU/jT4rA+dvOyC
         UGfA==
X-Gm-Message-State: AOJu0Ywi27PtCDy7D7QbB1P/bKj8+hfHbQIgAjHXDDu7BG5wpXaxY5aW
	83WeiqfEIqD3sX4gxkfgYXiNJnJDSuMuxGK2tgpHa1MUESveXmbzY0f90viXxPr5aqiQs2QucDS
	2/h9GV07eZg==
X-Gm-Gg: ASbGnctyvb/yC8HRizDGzCIv3CCVmEIzwxTo0H6SzAaMCXOIqo42cxONAr5QELIobJE
	5+WBz365kETJ10kuXxgPkkoZZk1MhdDxxamfTs9G3KiOXV1nYBjLVhK35EO9THnund61spV/l1U
	7QqZlTrucXd3pKlb1i2aq7KpoP9J3bmEOFzERy1Um7diHkq5iqtmHNE6iepvzdc+JepiR+xPHba
	xYrF9MxVSgqsv6OJFSEWN0X7+AEWG/j5fqQ5l71FKoEq6BrAusUg9svuoPCnni//GS/HZhP4L5a
	gwHwU66GNN+29Ouz/wOu/1QxoUAg81ULcVt/6gUG+JfU0MeFdrwHY0OGAz219dDjcHx5wRudk6A
	C8hYaxO8G
X-Google-Smtp-Source: AGHT+IGVjyiRLmL6U8a1FMEtfk9cwKGT2T4RUfOg+idGZDd3TkQet2n3gCAOW7m2vAZuB5CAD/J0RA==
X-Received: by 2002:a05:600c:a377:b0:442:ffa6:d07e with SMTP id 5b1f17b1804b1-4532486b9b0mr61736215e9.1.1749735230094;
        Thu, 12 Jun 2025 06:33:50 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532de8c64esm21693285e9.7.2025.06.12.06.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:33:49 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>
Subject: [PATCH v4 0/3] Workqueue: add WQ_PERCPU, system_dfl_wq and system_percpu_wq
Date: Thu, 12 Jun 2025 15:33:32 +0200
Message-ID: <20250612133335.788593-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi!

Below is a summary of a discussion about the Workqueue API and cpu isolation
considerations. Details and more information are available here:

    "workqueue: Always use wq_select_unbound_cpu() for WORK_CPU_UNBOUND."
    https://lore.kernel.org/all/20250221112003.1dSuoGyc@linutronix.de/

=== Current situation: problems ===

Let's consider a nohz_full system with isolated CPUs: wq_unbound_cpumask is
set to the housekeeping CPUs, for !WQ_UNBOUND the local CPU is selected.

This leads to different scenarios if a work item is scheduled on an isolated
CPU where "delay" value is 0 or greater then 0:
    schedule_delayed_work(, 0);

This will be handled by __queue_work() that will queue the work item on the
current local (isolated) CPU, while:

    schedule_delayed_work(, 1);

Will move the timer on an housekeeping CPU, and schedule the work there.

Currently if a user enqueue a work item using schedule_delayed_work() the
used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
schedule_work() that is using system_wq and queue_work(), that makes use
again of WORK_CPU_UNBOUND.

This lack of consistentcy cannot be addressed without refactoring the API.

=== Plan and future plans ===

This patchset is the first stone on a refactoring needed in order to
address the points aforementioned; it will have a positive impact also
on the cpu isolation, in the long term, moving away percpu workqueue in
favor to an unbound model.

These are the main steps:
1)  API refactoring (that this patch is introducing)
    -   Make more clear and uniform the system wq names, both per-cpu and
        unbound. This to avoid any possible confusion on what should be
        used.

    -   Introduction of WQ_PERCPU: this flag is the complement of WQ_UNBOUND,
        introduced in this patchset and used on all the callers that are not
        currently using WQ_UNBOUND.

        WQ_UNBOUND will be removed in a future release cycle.

        Most users don't need to be per-cpu, because they don't have
        locality requirements, because of that, a next future step will be
        make "unbound" the default behavior.

2)  Check who really needs to be per-cpu
    -   Remove the WQ_PERCPU flag when is not strictly required.

3)  Add a new API (prefer local cpu)
    -   There are users that don't require a local execution, like mentioned
        above; despite that, local execution yeld to performance gain.

        This new API will prefer the local execution, without requiring it.

=== Introduced Changes by this patchset ===

1)	[P1] add system_percpu_wq and system_dfl_wq
		
	system_wq is a per-CPU workqueue, but his name is not clear.
	system_unbound_wq is to be used when locality is not required.

	Because of that, system_percpu_wq and system_dfl_wq have been
	introduced in order to replace, in future, system_wq and
	system_unbound_wq.

2)	[P2] add new WQ_PERCPU flag
		
	This patch adds the new WQ_PERCPU flag to explicitly require to be per-cpu.
	WQ_UNBOUND will be removed in a next release cycle.

3)	[P3] Doc change about WQ_PERCPU
        
	Added a short section about WQ_PERCPU and a Note under WQ_UNBOUND
	mentioning that it will be removed in the future.

---
Changes in v4:
-   Take a step back from the previous version, in order to add first the new
    wq(s) and the new flag (WQ_PERCPU), addressing later all the other changes.

Changes in v3:
-   The introduction of the new wq(s) and the WQ_PERCPU flag have been moved
    in separated patches (1 for wq(s) and 1 for WQ_PERCPU).
-   WQ_PERCPU is now added to all the alloc_workqueue callers in separated patches
    addressing few subsystems first (fs, mm, net).

Changes in v2:
-   Introduction of WQ_PERCPU change has been merged with the alloc_workqueue()
    patch that pass the WQ_PERCPU flag explicitly to every caller.
-   (2 drivers) in the code not matched by Coccinelle; WQ_PERCPU added also there.
-   WQ_PERCPU added to __WQ_BH_ALLOWS.
-   queue_work() now prints a warning (pr_warn_once()) if a user is using the
    old wq and redirect the wrong / old wq to the new one.
-   Changes to workqueue.rst about the WQ_PERCPU flag and a Note about the
    future of WQ_UNBOUND.

Marco Crivellari (3):
  Workqueue: add system_percpu_wq and system_dfl_wq
  Workqueue: add new WQ_PERCPU flag
  [Doc] Workqueue: add WQ_PERCPU

 Documentation/core-api/workqueue.rst | 10 ++++++++++
 include/linux/workqueue.h            |  9 ++++++---
 kernel/workqueue.c                   |  4 ++++
 3 files changed, 20 insertions(+), 3 deletions(-)

-- 
2.49.0

