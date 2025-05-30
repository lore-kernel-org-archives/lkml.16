Received: from out30-101.freemail.mail.aliyun.com (out30-101.freemail.mail.aliyun.com [115.124.30.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17023278146
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 17:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748627441; cv=none; b=iMU8sx8+FU7JbzJBBZMBzCoeuWn7dAiBMtj9mF3+VJ0ho7Ctdi1DMFSCauxqK1NRNFRZJEeW/GfYj+BHTv6lOq2dBRWE0WnuZf66avgjg4Oa8MBTiyKv1fGfhsAN6QEQW3teWgrFYlJ86RNIDooBW2H1ysN3vfoknLvZSK2R06c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748627441; c=relaxed/simple;
	bh=V9k3q5zaDeZPO44a5lqK3f3expFPIc+XbGlwvLaHooI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mCiUm86Ucrv2K5x/BPapsMp0KglE7zhflANwHpT/DxeMPsgNQAhfIfRfYbva5yf322B5G6SJw0TIUvl3T+FC50rCIjhWt8orxQEJELR1VKCSc8Rs23/wQnQjfu512hPrAz1AzEslJSSmsDw/UjBLyFoQJX6SFuckNupBdL0WZaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=LeyNKKSn; arc=none smtp.client-ip=115.124.30.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="LeyNKKSn"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1748627431; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=XimTDkWcSAmgdKNam8nAO6lUSTOa2teCt2mzK0aaMr0=;
	b=LeyNKKSnrjqo3X403tYe3iFm2itZKd6Gi7EJDSogRlAuQ1S8bPzUtSIqvrZgQmmvLBP3cRLajdwM4RzkQiV1BTNV/JpwWXfGjVrzm+ucFZ+mkFVSX8UKESeMgZP4yMtKx+v1ENq+VRaqHicql6gipdqSWaDR/jULqzknw7VL5J4=
Received: from localhost.localdomain(mailfrom:qinyuntan@linux.alibaba.com fp:SMTPD_---0WcMBXbd_1748627429 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sat, 31 May 2025 01:50:31 +0800
From: Qinyun Tan <qinyuntan@linux.alibaba.com>
To: Tony Luck <tony.luck@intel.com>
Cc: "H . Peter Anvin" <hpa@zytor.com>,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	Reinette Chatre <reinette.chatre@intel.com>,
	Qinyun Tan <qinyuntan@linux.alibaba.com>
Subject: [PATCH V4 0/1] x86/resctrl: Remove unappropriate references to cacheinfo in the resctrl subsystem.
Date: Sat, 31 May 2025 01:50:26 +0800
Message-ID: <20250530175027.30140-1-qinyuntan@linux.alibaba.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
zero values for "top-level events" without any error indication. Replace
the cacheinfo references in struct rdt_mon_domain and struct rmid_read
with the cacheinfo ID (a unique identifier for the L3 cache).

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

