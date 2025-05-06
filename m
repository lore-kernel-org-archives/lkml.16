Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215A1265CDF
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 09:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746522968; cv=none; b=nZusj7Ownhqa3GNn0GrxmoZuwOuh49LtErka9/DqvyBNqWlAUe9hUEHZ7mTccf3wqDG+pVuheWIa5TwpR2uL7jU8RpcLE6dsrh5vynhwO6mP8ZZm1GJPT+pMc0vafm6P/d6F5ddYqsaJqYCGPn1y0x1EphAmn02qZfW8X1dQyvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746522968; c=relaxed/simple;
	bh=NTETrChhHu1SWRLGxQXS0ULL8LxUqx5fYfNsaNPm0RQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Rir3xaNtrZkm5uaVOf4/OBlrekE1wxEHGenYYQysyJRIXE9+FNi4tTZlHzbjoRG4eRO/qqOSiphHZTfZcR8Ba8zQniwQV4XS3R9VxY7WRW4eKT3+V/slS1iFWuyipzYWVixPyYrIi81yEqhgREGzYdjzBjXb/8LUXZDKnaH/Mgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dkRHcrw5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dkRHcrw5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746522965;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cM9nFeh27bM7Wvl/HR46xgCmYEKVT5TCD8lohg1hb44=;
	b=dkRHcrw5ogGX6Q7nqtVD/dKKk4x61T8N2sADrbsU7PnTK9ZuEZ3QUXmX19Hjbqt4Aap4j/
	OH9EIlrMCh8RRHZrFojicCCxH8ShwlpfsoZFwnJ75a07zHtquvGwaMb/M8oA1i5XYWxXgd
	pchNzASM8edaYggV2ckFGLqzw2XBvF4=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-449-RaHm5LdxNSqZISVGaa4sRw-1; Tue,
 06 May 2025 05:16:02 -0400
X-MC-Unique: RaHm5LdxNSqZISVGaa4sRw-1
X-Mimecast-MFC-AGG-ID: RaHm5LdxNSqZISVGaa4sRw_1746522961
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EFD4B1955D64;
	Tue,  6 May 2025 09:16:00 +0000 (UTC)
Received: from gmonaco-thinkpadt14gen3.rmtit.com (unknown [10.45.224.215])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 188CA1956096;
	Tue,  6 May 2025 09:15:57 +0000 (UTC)
From: Gabriele Monaco <gmonaco@redhat.com>
To: linux-kernel@vger.kernel.org,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Waiman Long <longman@redhat.com>
Cc: Gabriele Monaco <gmonaco@redhat.com>
Subject: [PATCH v4 0/5] timers: Exclude isolated cpus from timer migation
Date: Tue,  6 May 2025 11:15:35 +0200
Message-ID: <20250506091534.42117-7-gmonaco@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

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

The first 4 patches are preparatory work to change the concept of
online/offline to available/unavailable, keep track of those in a
separate cpumask, change a function name in cpuset code and allow to
query the timer base idle state from a remote CPU.

The fifth patch extends the unavailable status to isolated CPUs, which
is the main contribution of the series.

Changes since v3:
* add parameter to function documentation
* split into multiple straightforward patches

Changes since v2:
* improve comments about handling CPUs isolated at boot
* minor cleanup

Changes since v1 [1]:
* split into smaller patches
* use available mask instead of unavailable
* simplification and cleanup

[1] - https://lore.kernel.org/lkml/20250410065446.57304-2-gmonaco@redhat.com

Gabriele Monaco (5):
  timers: Rename tmigr 'online' bit to 'available'
  timers: Add the available mask in timer migration
  cgroup/cpuset: Rename update_unbound_workqueue_cpumask to
    update_exclusion_cpumasks
  timers: Add timer_base_remote_is_idle to query from remote cpus
  timers: Exclude isolated cpus from timer migation

 include/linux/timer.h                  |  6 +++
 include/trace/events/timer_migration.h |  4 +-
 kernel/cgroup/cpuset.c                 | 14 +++---
 kernel/time/tick-internal.h            |  1 +
 kernel/time/timer.c                    | 11 +++++
 kernel/time/timer_migration.c          | 65 ++++++++++++++++++++------
 kernel/time/timer_migration.h          |  2 +-
 7 files changed, 79 insertions(+), 24 deletions(-)


base-commit: 92a09c47464d040866cf2b4cd052bc60555185fb
-- 
2.49.0

