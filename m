Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2244B1E7F
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 14:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746716064; cv=none; b=XYtKSpPLgeCYeOMzYTZTHT7lJeJ9mQedFuGRVLjiwqhvasEmEAi3KGNbP6xEtrR2pQNNpZypgCSQ1qA+dXKTPIUC1Gw2qq9j8ZOLTAXrx/GhdV0yk+spyT3JidRW5aM7SqYYR7ZdXSG4Fk8r1mN4IY0WbvNDgOOQxz4FtsmcC+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746716064; c=relaxed/simple;
	bh=vMSvWNNFJuyiAewWmXC0mkGKgecFaJHeULT4trwhlJY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h6ip0x3Fo93eXMRMnpS8ka54fTM+sf+xepNVFxnLdiXMRinC7qyJWwxmguCIY/zb3+hhNYzFrIAcGOg25tdxpsmQ01YLoozEzWoDVst0IRAw9ovxZVRxvT6EFTlGCM5wJzk/XEYQ+NcCZuhLNQNy/cJlpTrZMbRUSSacj3OOf1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jLXYCPoX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jLXYCPoX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746716061;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RzZVeYKmmHaTC9/g7R2ccCFuHqWQpvg7LhUUdLA6V0I=;
	b=jLXYCPoXOK9VwuV0eQLAJTvFhj1fqJyV+Gdw6th7gQQ/NgPWCtJFFVMcdeJo9dIvxCxaCt
	U3FLJGnPCXt+1UMTAlsKGyliGGwN5CnplUJjex+3+zGX3Jgvky0vLtmmmC124CFF/hNIYC
	UmKYDwWlvjYgmkrBMB0Z1XPBA4MwPCI=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-513-8hvgGo-hPmaLCDEM_msxwA-1; Thu,
 08 May 2025 10:54:19 -0400
X-MC-Unique: 8hvgGo-hPmaLCDEM_msxwA-1
X-Mimecast-MFC-AGG-ID: 8hvgGo-hPmaLCDEM_msxwA_1746716058
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B3D5718002A5;
	Thu,  8 May 2025 14:54:18 +0000 (UTC)
Received: from gmonaco-thinkpadt14gen3.rmtit.com (unknown [10.44.32.32])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9D1CC19560B3;
	Thu,  8 May 2025 14:54:15 +0000 (UTC)
From: Gabriele Monaco <gmonaco@redhat.com>
To: linux-kernel@vger.kernel.org,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Waiman Long <longman@redhat.com>
Cc: Gabriele Monaco <gmonaco@redhat.com>
Subject: [PATCH v5 0/6] timers: Exclude isolated cpus from timer migation
Date: Thu,  8 May 2025 16:53:20 +0200
Message-ID: <20250508145319.97794-8-gmonaco@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

The timer migration mechanism allows active CPUs to pull timers from
idle ones to improve the overall idle time. This is however undesired
when CPU intensive workloads run on isolated cores, as the algorithm
would move the timers from housekeeping to isolated cores, negatively
affecting the isolation.

This effect was noticed on a 128 cores machine running oslat on the
isolated cores (1-31,33-63,65-95,97-127). The tool monopolises CPUs,
and the CPU with lowest count in a timer migration hierarchy (here 1
and 65) appears as always active and continuously pulls global timers,
from the housekeeping CPUs. This ends up moving driver work (e.g.
delayed work) to isolated CPUs and causes latency spikes:

before the change:

 # oslat -c 1-31,33-63,65-95,97-127 -D 62s
 ...
  Maximum:     1203 10 3 4 ... 5 (us)

after the change:

 # oslat -c 1-31,33-63,65-95,97-127 -D 62s
 ...
  Maximum:      10 4 3 4 3 ... 5 (us)

Exclude isolated cores from the timer migration algorithm, extend the
concept of unavailable cores, currently used for offline ones, to
isolated ones:
* A core is unavailable if isolated or offline;
* A core is available if isolated and offline;

A core is considered unavailable as idle if:
* is in the isolcpus list
* is in the nohz_full list
* is in an isolated cpuset

Due to how the timer migration algorithm works, any CPU part of the
hierarchy can have their global timers pulled by remote CPUs and have to
pull remote timers, only skipping pulling remote timers would break the
logic.
For this reason, we prevent isolated CPUs from pulling remote global
timers, but also the other way around: any global timer started on an
isolated CPU will run there. This does not break the concept of
isolation (global timers don't come from outside the CPU) and, if
considered inappropriate, can usually be mitigated with other isolation
techniques (e.g. IRQ pinning).

The first 3 patches are preparatory work to change the concept of
online/offline to available/unavailable, keep track of those in a
separate cpumask and change a function name in cpuset code.

Patch 4 and 5 adapt isolation and cpuset to prevent domain isolated and
nohz_full from covering all CPUs not leaving any housekeeping one. This
can lead to problems with the changes introduced in this series because
no CPU would remain to handle global timers.

Patch 6 extends the unavailable status to domain isolated CPUs, which
is the main contribution of the series.

Changes since v4 [1]:
* use on_each_cpu_mask() with changes on isolated CPUs to avoid races
* keep nohz_full CPUs included in the timer migration hierarchy
* prevent domain isolated and nohz_full to cover all CPUs

Changes since v3:
* add parameter to function documentation
* split into multiple straightforward patches

Changes since v2:
* improve comments about handling CPUs isolated at boot
* minor cleanup

Changes since v1 [2]:
* split into smaller patches
* use available mask instead of unavailable
* simplification and cleanup

[1] - https://lore.kernel.org/lkml/20250506091534.42117-7-gmonaco@redhat.com
[2] - https://lore.kernel.org/lkml/20250410065446.57304-2-gmonaco@redhat.com

Gabriele Monaco (6):
  timers: Rename tmigr 'online' bit to 'available'
  timers: Add the available mask in timer migration
  cgroup/cpuset: Rename update_unbound_workqueue_cpumask() to
    update_exclusion_cpumasks()
  sched/isolation: Force housekeeping if isolcpus and nohz_full don't
    leave any
  cgroup/cpuset: Fail if isolated and nohz_full don't leave any
    housekeeping
  timers: Exclude isolated cpus from timer migation

 include/linux/tick.h                   |  2 +
 include/linux/timer.h                  |  9 +++
 include/trace/events/timer_migration.h |  4 +-
 kernel/cgroup/cpuset.c                 | 82 +++++++++++++++++++++++---
 kernel/sched/isolation.c               | 20 +++++++
 kernel/time/tick-sched.c               |  7 +++
 kernel/time/timer_migration.c          | 77 ++++++++++++++++++++----
 kernel/time/timer_migration.h          |  2 +-
 8 files changed, 180 insertions(+), 23 deletions(-)


base-commit: d76bb1ebb5587f66b0f8b8099bfbb44722bc08b3
-- 
2.49.0

