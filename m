Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F7913A3ED
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 07:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738307398; cv=none; b=EwmLRS2qBa6A9uhzLc2HOIUsehgtPna9AtS+R1YG3BcpShHTzRVSt3/xKSMQ90oOVyLmLnUZsoK9e73ZpcWnVnMehUnE1wPJVxBNHOHwFAqfNj2MwP/dHE/OMadnEhs7feJXFOLR3tkGXozuVJGEW0uoo41YtrHgVgggrp14tWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738307398; c=relaxed/simple;
	bh=A2ic+7mQySi1oRutj8zYs658wdmlNXYhK9CBH+NdLwA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f7RnZ8Nb1Ry5a/cCXiY4iY0I/P2aa/oGRVdWIIHUQ6CGZg1zZ+6zR2tC00WII56TFIq/GaXS76GbAVtwr90SKC99x5agVeRMofD7EqAawj7KWIC+yrKFubTRUrZVIgy2mtjs0zmwG4vUh5auJGEd5a/jZnCjtmhwqQQ4E/vALCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=RYtOt5bC; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="RYtOt5bC"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=UEBaNnguLmBHG50izi8yxcdvLLphd5vnG22v3zDObaE=; b=RYtOt5bC9M0ok8zGZHGnBQstK9
	Odd0JnSufc0yQ3EhhkoWhOewiPSYKyG8/4dIbT0fVkNTD3rFijcGNu16bNjA5B8OlupxeTBFxN1Yc
	FHGEYD+eHp9uwDkiP5I8pKodFWx9L+rznXMQRLmRhT759inpy7OdazfHNtd40VtZA8cBvSigAa1iK
	cpbzaogsePApZfmjh20EsNGX6/XY/5k4tQZqZB9CfqGBOQwVrtMloYyquxmRnfQdDHbjeUlGRccnT
	L6/TjvzZ0Rkzk3Pfrlc+e2bu3gLl6UUoNbZFQ4IhNELZPWFuLj2tVgXSWU4aVcS2MDEvluS9NOT9y
	+BmiDKbg==;
Received: from [58.29.143.236] (helo=localhost)
	by fanzine2.igalia.com with utf8esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1tdl9o-001KXg-0c; Fri, 31 Jan 2025 08:09:46 +0100
From: Changwoo Min <changwoo@igalia.com>
To: tj@kernel.org,
	void@manifault.com,
	arighi@nvidia.com
Cc: kernel-dev@igalia.com,
	linux-kernel@vger.kernel.org,
	Changwoo Min <changwoo@igalia.com>
Subject: [PATCH v3 00/11] sched_ext: Implement core event counters
Date: Fri, 31 Jan 2025 16:09:27 +0900
Message-ID: <20250131070938.95551-1-changwoo@igalia.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sched_ext core often has to override the BPF scheduler decisions,
and some events could be interesting but not easily visible.

This patchset aims to address such a problem in the following manner:
  - Introduce an infrastructure to collect such events in a scalable and
    extensible way and to expose the collected events to the BPF scheduler
    in a compatible way.
  - Define seven events to be collected.
  - Modify an scx scheduler to demonstrate the usage of the new BPF APIs.

ChangeLog: v2 -> v3
  - Rename scx_bpf_event_stats() to scx_bpf_events().
  - Add a prefix SCX_EV_ to all event names.
  - Change the implementation SCX_EV_SELECT_CPU_FALLBACK such that
    record the selected cpu (p->scx.selected_cpu) in
    select_task_rq_scx() and compare it in enqueue_task_scx() to
    reliably count events.
  - Change the implementation of SCX_EV_BYPASS_DISPATCH such that log
    the event where the condition is initially detected.
  - Modify scx_qmap to print the core event counter every second.
  - Remove unnecessary white space in patch 6.

ChangeLog: v1 -> v2
  - Rename scx_event_stat and scx_bpf_event_stat() to scx_event_stats and
    scx_bpf_event_stats().
  - Rename event names following the convention of $COMPONENT_$EVENT.
  - Rename event_stats to event_stats_cpu.
  - Drop the enum scx_event_kind and related macros.
  - Revise scx_add_event() to use this_cpu_add().
  - Add __scx_add_event() to use __this_cpu_add().
  - Move the event counter resetting code to the loading of a BPF scheduler.
  - The bypass-related event is further categorized into three events:
    BYPASS_ACTIVATE, BYPASS_DISPATCH, and BYPASS_DURATION.
  - Revise SELECT_CPU_FALLBACK to capture the case of the chosen CPU is not
    allowed.
  - Move is_cpu_allowed() from core.c to sched.h to use in the
    SELECT_CPU_FALLBACK code.

Changwoo Min (11):
  sched_ext: Implement event counter infrastructure
  sched_ext: Add an event, SCX_EV_SELECT_CPU_FALLBACK
  sched_ext: Add an event, SCX_EV_DISPATCH_LOCAL_DSQ_OFFLINE
  sched_ext: Add an event, SCX_EV_DISPATCH_KEEP_LAST
  sched_ext: Add an event, SCX_EV_ENQ_SKIP_EXITING
  sched_ext: Add an event, SCX_EV_BYPASS_ACTIVATE
  sched_ext: Add an event, SCX_EV_BYPASS_DISPATCH
  sched_ext: Add an event, SCX_EV_BYPASS_DURATION
  sched_ext: Add scx_bpf_events() and scx_read_event() for BPF
    schedulers
  sched_ext: Print core event count in scx_central scheduler
  sched_ext: Print core event count in scx_qmap scheduler

 include/linux/sched/ext.h                |   1 +
 kernel/sched/ext.c                       | 197 ++++++++++++++++++++++-
 tools/sched_ext/include/scx/common.bpf.h |   4 +
 tools/sched_ext/scx_central.bpf.c        |  21 +++
 tools/sched_ext/scx_qmap.bpf.c           |  19 +++
 5 files changed, 237 insertions(+), 5 deletions(-)

-- 
2.48.1

