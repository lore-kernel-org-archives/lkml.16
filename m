Received: from out30-113.freemail.mail.aliyun.com (out30-113.freemail.mail.aliyun.com [115.124.30.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63DAE20E6
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 18:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748628983; cv=none; b=jxoz680OssWmScGM5tSuA9FywTGqZMYhGN4E35s+DbGHLSGlngic3RD41qEKenAVqwUIVgoYq4H9y35yTPPW6YJ42JIyG3i2tRdY5VvM+4/xlL30vP4YabTqLkVYxEMo/l513XLCN4ec/QpGJFwT7Jtxmoz9BkfgwZOSWRndD3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748628983; c=relaxed/simple;
	bh=g9x9I/D5iLYNub2uY6+ty3L4YZQgs1kiASUNbQlL4Qw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OEqwAEZxtWDQChrJ/8tc24XQSdDzuXH2rci8UR2TSqPVc5+DCUl25FsS18KD9CPW3R1PuOA9vD7dxNooqK7Yj9j/Yhs6Doqe7tk6TJBwhPQSqMM4W5ijZvJfAfX5BWdUrTaiCAKWAOAQBxr6nPPZMSzHtzUpK3Dck8gIsFj/iSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=Dy9NNCg+; arc=none smtp.client-ip=115.124.30.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="Dy9NNCg+"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1748628978; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=Vgoipm8jNsxeGuLT4hKP6WLOTd56kdYWyDhKuAXv0mU=;
	b=Dy9NNCg+N/Lf1bSDl7PhKraFf8etjbVmGjvXfRAN5solsfvglywBAXzSuqo/bomgp3uie//1Xrfs+3iDpc9TRp+mPDOxxxZUmZHp5bghrnbYfDLWguFxLPZSINlVvdQEzYHhpXoxkE9QTVJuIS5T9aGhQZd1F4E7i4ZmOLgHmpU=
Received: from localhost.localdomain(mailfrom:qinyuntan@linux.alibaba.com fp:SMTPD_---0WcMBeWF_1748628665 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sat, 31 May 2025 02:11:06 +0800
From: Qinyun Tan <qinyuntan@linux.alibaba.com>
To: Tony Luck <tony.luck@intel.com>
Cc: "H . Peter Anvin" <hpa@zytor.com>,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	Reinette Chatre <reinette.chatre@intel.com>,
	Qinyun Tan <qinyuntan@linux.alibaba.com>
Subject: [PATCH V5 0/1] x86/resctrl: Remove unappropriate references to cacheinfo in the resctrl subsystem.
Date: Sat, 31 May 2025 02:11:02 +0800
Message-ID: <20250530181103.34563-1-qinyuntan@linux.alibaba.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

V5:
- Modify the commit log format again. I am truly grateful to Reinette
  for her thoughtful guidance :).

V4:
- Add the tested by and reviewed by tags.
- Modify the commit log format.

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

rdt_mon_domain::ci is initialized using the first online CPU of a NUMA
node. When this CPU goes offline, its shared_cpu_map is cleared to contain
only the offline CPU itself. Subsequently, attempting to read counters
via smp_call_on_cpu(offline_cpu) fails (and error ignored), returning
zero values for "top-level events" without any error indication.

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

