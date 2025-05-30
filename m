Received: from out30-119.freemail.mail.aliyun.com (out30-119.freemail.mail.aliyun.com [115.124.30.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5748D8834
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 02:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748571151; cv=none; b=pBgRDcuXU9ht9oniBB/JEpuZsge5oxt9Igm7gq39e+dhvHo8/ITd5uwR1hPR4NgNZvkXaQl2ONkzPlljMsMaA1chPjB3vHyILfNMLHHslnu8jqgEgXGbvODEn1MhDORV8WJ2X9FkAUl6yisu8NErOoeN9NpYUkSjdSB2e4C835o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748571151; c=relaxed/simple;
	bh=1XvmdRtI85Kz0YI5gUAc9CE1aL2HAudKHOzDg3eV+Oo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PmzDSlJfqjQ8iP+KjhqiVViCuRKKkZRijrF2BAC9jRXis69qyfo+ktibUklu7oo5QQfAHJysFJCGSZhW3JPMPRBbtFUYaKsrFXRhQaSetQgSbsxM27u/+Hap6wmbxADS6Exk7vaIWjIJcFz4Ads+C7TkwI95K01jkjerNtkAqYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=nVqnyfW/; arc=none smtp.client-ip=115.124.30.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="nVqnyfW/"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1748571140; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=O58mqVj7vnmyprQoKgVD7zhBlpfdEg1Th+iGsU2/phs=;
	b=nVqnyfW/Kgbcp7Q4FinVOZBxIG4auopTYL9Pu3pAYS1Yz5DqpLHRpTOtCbE8akkvt/O6h8cMxe1IVSbRnBi1ppw2Qr1m8s6hvmtwGAvjaWOA/toZyh29MeERFEIrzRA4mzoRTn+DYt3wEpILHglcql5u3bJeT3LU5pWm/A4JkUE=
Received: from localhost.localdomain(mailfrom:qinyuntan@linux.alibaba.com fp:SMTPD_---0WcJQhXf_1748571138 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 30 May 2025 10:12:19 +0800
From: Qinyun Tan <qinyuntan@linux.alibaba.com>
To: Tony Luck <tony.luck@intel.com>
Cc: "H . Peter Anvin" <hpa@zytor.com>,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	Reinette Chatre <reinette.chatre@intel.com>,
	Qinyun Tan <qinyuntan@linux.alibaba.com>
Subject: [PATCH V3 0/1] x86/resctrl: Remove unappropriate references to cacheinfo in the resctrl subsystem.
Date: Fri, 30 May 2025 10:12:15 +0800
Message-ID: <20250530021216.58581-1-qinyuntan@linux.alibaba.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

V3:
- According to Reinette suggestion, modify the commit log description to
 make it easier for readers to understand

V2:
- Keep sanity checks in the __mon_event_count to ensure execution occurs
  exclusively on CPUs sharing the same L3 cache cluster
- When reading the top level event, obtain a CPU within hdr.cpu_mask.
  Then use the cacheinfo shared_cpu_map of this CPU instead of using
  hdr.cpu_mask directly
- Adjust code formatting and commit log descriptions.

In the resctrl subsystem's Sub-NUMA Cluster (SNC) mode, the rdt_mon_domain
structure representing a NUMA node relies on the cacheinfo interface
(rdt_mon_domain::ci) to store L3 cache information (e.g., shared_cpu_map)
for monitoring. The L3 cache information of a SNC NUMA node determines
which domains are summed for the "top level" L3-scoped events.

rdt_mon_domain::ci is initialized using the first online CPU
of a NUMA node. When this CPU goes offline, its shared_cpu_map is cleared
to contain only the offline CPU itself.    Subsequently, attempting to read
counters via smp_call_on_cpu(offline_cpu) fails (and error ignored),
returning zero values for "top-level events" without any error indication.
  Replace the cacheinfo references in struct rdt_mon_domain and struct
rmid_read with the cacheinfo ID (a unique identifier for the L3 cache).

rdt_domain_hdr::cpu_mask contains the online CPUs associated with that
domain. When reading "top-level events", select a CPU from
rdt_domain_hdr::cpu_mask and utilize its L3 shared_cpu_map to determine
valid CPUs for reading RMID counter via the MSR interface.
Considering all CPUs associated with the L3 cache improves the chances
of picking a housekeeping CPU on which the counter reading work can be
queued, avoiding an unnecessary IPI.

Qinyun Tan (1):
  x86/resctrl: Remove unappropriate references to cacheinfo in the
    resctrl subsystem.

 arch/x86/kernel/cpu/resctrl/core.c |  6 ++++--
 fs/resctrl/ctrlmondata.c           | 13 +++++++++----
 fs/resctrl/internal.h              |  4 ++--
 fs/resctrl/monitor.c               |  6 ++++--
 fs/resctrl/rdtgroup.c              |  6 +++---
 include/linux/resctrl.h            |  4 ++--
 6 files changed, 24 insertions(+), 15 deletions(-)

-- 
2.43.5

