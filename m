Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36C727FD4D
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744712728; cv=none; b=G0rBldp0VwRvqvFRHkq902+epfHD5TFim8YxSMr3rW+ETvXf6mO44dgli+vfIHGxRj6E6EsGVqJl3KUE6auCrpEjQENdAnVIczKvMeXSw8T8Gfr88mQIJYdaGAvyf/6zMMrHTzNhIHOahAtlOMavxnKqyQ3/TVG31n+mBinR1fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744712728; c=relaxed/simple;
	bh=ponjRsrZwuKeU1x71qhPSrcFmawhL+HZYjE6WmsyNno=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mCkPQTgUlElY4hdctV3EXrsQTWWyswZUviAWgDJBi9DmJHaGFE9kmLwdWNKnweEsQXvZSjyCxCF5vc6+U8GyXRC/wpKX9Cptbw1rx9yL+1ILsN7kpqY5LGNpNr4NpU9dafnbP+mz3OMGnkLOaz8bTRhz10z/lnbnJIxNXtLb4tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=He16n44G; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="He16n44G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744712725;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=77+uq5YfYmQyhbv/tq4gzWE4Bg8dHelmljzL+w6OCMk=;
	b=He16n44GguMqOr2Oe6Gn+rf0FuidwdHLpAdeohLnNWxDTwibJHFItWI6XCG7DaFsawumjR
	AZjAq5lRDUbFI+fj3ut0PfNx98W5XOYmnCUkLR99DZXLhS8jRqs0F5AzjTYzDBZmCJSQFK
	LRMUg3dbsGat860Z7B74NtCvL5GutR0=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-581-vSVbHsm1M8WSOcY2i78GHg-1; Tue,
 15 Apr 2025 06:25:24 -0400
X-MC-Unique: vSVbHsm1M8WSOcY2i78GHg-1
X-Mimecast-MFC-AGG-ID: vSVbHsm1M8WSOcY2i78GHg_1744712723
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1B58C180AB19;
	Tue, 15 Apr 2025 10:25:23 +0000 (UTC)
Received: from gmonaco-thinkpadt14gen3.rmtit.com (unknown [10.44.32.90])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4A2431801A6D;
	Tue, 15 Apr 2025 10:25:20 +0000 (UTC)
From: Gabriele Monaco <gmonaco@redhat.com>
To: linux-kernel@vger.kernel.org,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Waiman Long <longman@redhat.com>
Cc: Gabriele Monaco <gmonaco@redhat.com>
Subject: [PATCH v2 0/3] timers: Exclude isolated cpus from timer migation
Date: Tue, 15 Apr 2025 12:25:01 +0200
Message-ID: <20250415102500.100415-5-gmonaco@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

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
For this reason, we prevents isolated CPUs from pulling remote global
timers, but also the other way around: any global timer started on an
isolated CPU will run there. This does not break the concept of
isolation (global timers don't come from outside the CPU) and, if
considered inappropriate, can usually be mitigated with other isolation
techniques (e.g. IRQ pinning).

The first 2 patches are preparatory work to change the concept of
online/offline to available/unavailable and keep track of those in a
separate cpumask.

The third patch extends the unavailable status to isolated CPUs, which
is the main contribution of the series.

Changes since v1 [1]:
* split into smaller patches
* use available mask instead of unavailable
* simplification and cleanup

[1] - https://lore.kernel.org/lkml/20250410065446.57304-2-gmonaco@redhat.com

Gabriele Monaco (3):
  timers: Rename tmigr 'online' bit to 'available'
  timers: Add the available mask in timer migration
  timers: Exclude isolated cpus from timer migation

 include/linux/timer.h                  |  6 +++
 include/trace/events/timer_migration.h |  4 +-
 kernel/cgroup/cpuset.c                 | 14 ++++---
 kernel/time/tick-internal.h            |  1 +
 kernel/time/timer.c                    | 10 +++++
 kernel/time/timer_migration.c          | 58 +++++++++++++++++++-------
 kernel/time/timer_migration.h          |  2 +-
 7 files changed, 71 insertions(+), 24 deletions(-)


base-commit: 834a4a689699090a406d1662b03affa8b155d025
-- 
2.49.0

