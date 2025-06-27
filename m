Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BABDC1922FA
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 11:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751025118; cv=none; b=KdobzlT9EBkzDANt1Ibd+iZCD7nqxdxIcLgldnAyZvWnrUiUOPtzFTeUMQ6X3+QaE2z2oM448joXbulmpvQHUCgRnZfpTaBvSQOOB5ZGOkuUKDYRtvshC7Zs04lrucDE8RG6YwnCu0tuncd8smwvP6cEb+yXpICxS0pswVuRBus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751025118; c=relaxed/simple;
	bh=u27nDc6rZMaQW7nqNobLZ8KdWYwai/PRSGtN9/yQFeE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FvSuYBbUCG3PpGyBHssw7+SBLO0afPTgOIFW3SpC8vHuoZXvWej3ePA5XoksSkV67I3HP+7jp+vTMIRehD2/d8oTIf8n0liehqz8CcXlW0mAe7PtWeLznk3Bv+X7QhKL+VgEo4nABvtJIwrp9QuGaQyNGw0VHajNq2tvK1RPMDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LXJ2mkzb; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LXJ2mkzb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751025112;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DdpMZsYkzpkBZ7fPVy2ITXB3SEDZQJpjzRAZLPz7eVU=;
	b=LXJ2mkzbAq5NlvNi3ieqzP0LUZLpdRQuQ9MTYT/GUtS2mSXE7MjYu9hnHcpIu1zCgD9Z8/
	sTr+Lf2ynHmKLN6RoxQyV/Y43t7WhQJ0ZHgjAM9F//RZkHhxwAoQP5WhiGLnmFmm4f7VWe
	Mj/k5zZaLhNYO0bjSbNHixUx6zclyuA=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-155-5pjdeJ_MO2CpTYDQBeS1NQ-1; Fri,
 27 Jun 2025 07:51:49 -0400
X-MC-Unique: 5pjdeJ_MO2CpTYDQBeS1NQ-1
X-Mimecast-MFC-AGG-ID: 5pjdeJ_MO2CpTYDQBeS1NQ_1751025108
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 75A0F19560BE;
	Fri, 27 Jun 2025 11:51:47 +0000 (UTC)
Received: from jlelli-thinkpadt14gen4.remote.csb (unknown [10.44.32.84])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B184C19560A7;
	Fri, 27 Jun 2025 11:51:39 +0000 (UTC)
From: Juri Lelli <juri.lelli@redhat.com>
To: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Waiman Long <llong@redhat.com>
Cc: linux-kernel@vger.kernel.org,
	Marcel Ziswiler <marcel.ziswiler@codethink.co.uk>,
	Luca Abeni <luca.abeni@santannapisa.it>,
	Juri Lelli <juri.lelli@redhat.com>
Subject: [PATCH 0/5] sched/deadline: Fix GRUB accounting
Date: Fri, 27 Jun 2025 13:51:13 +0200
Message-ID: <20250627115118.438797-1-juri.lelli@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Hi All,

This patch series addresses a significant regression observed in
`SCHED_DEADLINE` performance, specifically when `SCHED_FLAG_RECLAIM`
(Greedy Reclamation of Unused Bandwidth - GRUB) is enabled alongside
overrunning jobs. This issue was reported by Marcel [1].

Marcel's team extensive real-time scheduler (`SCHED_DEADLINE`) tests on
mainline Linux kernels (amd64-based Intel NUCs and aarch64-based RADXA
ROCK5Bs) typically show zero deadline misses for 5ms granularity tasks.
However, with reclaim mode enabled and the same two overrunning jobs in
the mix, they observed a dramatic increase in deadline misses: 43
million on NUC and 600 thousand on ROCK55B. This highlights a critical
accounting issue within `SCHED_DEADLINE` when reclaim is active.

This series fixes the issue by doing the following.

- 1/5: sched/deadline: Initialize dl_servers after SMP
  Currently, `dl-servers` are initialized too early during boot, before
  all CPUs are online. This results in an incorrect calculation of
  per-runqueue `DEADLINE` variables, such as `extra_bw`, which rely on a
  stable CPU count. This patch moves the `dl-server` initialization to a
  later stage, after SMP initialization, ensuring all CPUs are online and
  correct `extra_bw` values can be computed from the start.

- 2/5: sched/deadline: Reset extra_bw to max_bw when clearing root domains
  The `dl_clear_root_domain()` function was found to not properly account
  for the fact that per-runqueue `extra_bw` variables retained stale
  values computed before root domain changes. This led to broken
  accounting. This patch fixes the issue by resetting `extra_bw` to
  `max_bw` before restoring `dl-server` contributions, ensuring a clean
  state.

- 3/5: sched/deadline: Fix accounting after global limits change
  Changes to global `SCHED_DEADLINE` limits (handled by
  `sched_rt_handler()` logic) were found to leave stale or incorrect
  values in various accounting-related variables, including `extra_bw`.
  This patch properly cleans up per-runqueue variables before implementing
  the global limit change and then rebuilds the scheduling domains. This
  ensures that the accounting is correctly restored and maintained after
  such global limit adjustments.

- 4/5 and 5/5 are simple drgn scripts I put together to help debugging
  this issue. I have the impression that they might be useful to have
  around for the future.

Please review and test.

The set is also availabe at

git@github.com:jlelli/linux.git upstream/fix-grub-tip

1 - https://lore.kernel.org/lkml/ce8469c4fb2f3e2ada74add22cce4bfe61fd5bab.camel@codethink.co.uk/

Thanks,
Juri

Juri Lelli (5):
  sched/deadline: Initialize dl_servers after SMP
  sched/deadline: Reset extra_bw to max_bw when clearing root domains
  sched/deadline: Fix accounting after global limits change
  tools/sched: Add root_domains_dump.py which dumps root domains info
  tools/sched: Add dl_bw_dump.py for printing bandwidth accounting info

 MAINTAINERS                      |  1 +
 kernel/sched/core.c              |  2 +
 kernel/sched/deadline.c          | 61 +++++++++++++++++++---------
 kernel/sched/rt.c                |  6 +++
 kernel/sched/sched.h             |  1 +
 tools/sched/dl_bw_dump.py        | 57 ++++++++++++++++++++++++++
 tools/sched/root_domains_dump.py | 68 ++++++++++++++++++++++++++++++++
 7 files changed, 177 insertions(+), 19 deletions(-)
 create mode 100755 tools/sched/dl_bw_dump.py
 create mode 100755 tools/sched/root_domains_dump.py

-- 
2.49.0

