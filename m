Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED06B25A624
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 05:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738646482; cv=none; b=WDb/VlbAJVxsyOrP1R85J6wTndHol9x3ZfOScS6Ow2BgUroTSvK9/g/2+6ot6tgTdWdHN5jA1ISbFzOys2cn3bccygr/3ofa+hMS+xagVF9u7BSrb7b5VuWZKzjwZW5q9TXoez2ODyfkyihuxfr1xhzgRsHqiessKFit3koFeHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738646482; c=relaxed/simple;
	bh=f3pv/3r9Cg7VkFnFC8LwFtyxxt5z6DKW3Kzn97iL+FU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tCgjYGp1gHbxBTo/+vWyNI/SudugdfDnaZdFFYvHmCrrZ24OAxWXljfNfeSqSMXMeH1NbEuO7KMEqXwBYCimcaUCJDBLTJ+H1LE1YEAtum9mtIbSlbkT+go2BByAuq7J/Yfcm/xR4kfMesJRGx0KNh9nhf2Bw7OObVvsurAolGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=eQ+LlOS+; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="eQ+LlOS+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=nDM6LskktHhvtPiqfzPE1aj2TKOmBHHpMjPChI15y6I=; b=eQ+LlOS+y2YNlY0vM4y2nOqGjF
	vmMg7h2hW3RuBnA1KYwL2Mse5sbEMiHBqaUOMrwC1Fm8HA3OX7NUoZKzeM7ehB7xk/y1U9U4WJ3dS
	bd3ANWE9MIlAIQLH2lLGZQjmyGLXom46rB5IJyk9C9AhUVIEw02ZR5XRxbp5xL0kWLDynlHCfgETo
	2BUZk6Xm3JN9a3HwP/f48VBOfIx3kGjf1LAUuTQLR/Z5Cf+gZe8slkWDk94GTkwoVXv5G/Gs+jFUW
	nrXEXSN6lOJU9l0HEO2vWpJlSVb/BsYv1ozTAfsWX17FBvYnoUQZsX0K3kqKJ3DyUqIFJDrilalsq
	hkymfQyQ==;
Received: from [58.29.143.236] (helo=localhost)
	by fanzine2.igalia.com with utf8esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1tfBMs-003J1R-Dj; Tue, 04 Feb 2025 06:21:08 +0100
From: Changwoo Min <changwoo@igalia.com>
To: tj@kernel.org,
	void@manifault.com,
	arighi@nvidia.com
Cc: kernel-dev@igalia.com,
	linux-kernel@vger.kernel.org,
	Changwoo Min <changwoo@igalia.com>
Subject: [PATCH v4 0/7] sched_ext: Implement core event counters
Date: Tue,  4 Feb 2025 14:20:50 +0900
Message-ID: <20250204052057.67776-1-changwoo@igalia.com>
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
  - Modify scx schedulers to demonstrate the usage of the new BPF APIs.

ChangeLog: v3 -> v4
  - Do not include the already applied patches (1-4) from the patchset.
  - Add a missing scx_agg_event() for SCX_EV_ENQ_SKIP_EXITINGk.
  - Move SCX_EV_BYPASS_DISPATCH loggig to select_task_rq_scx() and
    do_enqueue_task().
  - Move scx_bypass_timestamp inside the scx_ops_bypass function
    (renamed to bypass_timestamp).

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

Changwoo Min (7):
  sched_ext: Add an event, SCX_EV_ENQ_SKIP_EXITING
  sched_ext: Add an event, SCX_EV_BYPASS_ACTIVATE
  sched_ext: Add an event, SCX_EV_BYPASS_DISPATCH
  sched_ext: Add an event, SCX_EV_BYPASS_DURATION
  sched_ext: Add scx_bpf_events() and scx_read_event() for BPF
    schedulers
  sched_ext: Print core event count in scx_central scheduler
  sched_ext: Print core event count in scx_qmap scheduler

 kernel/sched/ext.c                       | 51 ++++++++++++++++++++++--
 tools/sched_ext/include/scx/common.bpf.h |  4 ++
 tools/sched_ext/scx_central.bpf.c        | 21 ++++++++++
 tools/sched_ext/scx_qmap.bpf.c           | 19 +++++++++
 4 files changed, 92 insertions(+), 3 deletions(-)

-- 
2.48.1

