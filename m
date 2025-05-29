Received: from out30-133.freemail.mail.aliyun.com (out30-133.freemail.mail.aliyun.com [115.124.30.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83791B4231
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 03:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748488620; cv=none; b=BBz77sIxbOzC4u9FVafXB7pvRG8HJRnLo5Xkb33uG79ZA17ydWTXJ8N5jagJoBSrgfQTPCmUY1XRjVs3T3UMOX8YP6y6J+0P8wNr2Axn3Rr4l7KtsKcT+R6xwwI7zwfmnWHwtDn+4n/8c9Z0q2Cswfp0t2Io1STR8NxN6mD+CTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748488620; c=relaxed/simple;
	bh=u2INpLpp6LNjo5bN/yBhudW9HZjqJ0SBRfJfnlCDQso=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HcfchxaNLthMLxck0iu/DAnXy2gdxWwgdKX7b9+JzM+MJt80zl/Uryo3rQ7g0zmGC7vnvdFgd7gF9RzxwWcsB3lPkxZ4nDPf/DMTBGBKoHXoAY8dmUCsXW0fweb7DUHjNiy2gA//DjfF+wweaTqbVu4Ozobih1SPZAFVc5W/+4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=kbhJspqm; arc=none smtp.client-ip=115.124.30.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="kbhJspqm"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1748488615; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=x5JgqFBzttSo11sSAziqCVcXUzpDKWbxRc0ZpqHVyGU=;
	b=kbhJspqmnsYUYka0dmyH+0nmWisb3GY/G5gIB5kON2yZE+nGwabNJW7Ke0AfKyZ3Czeods4GlPSiDGxsrC14REdL5f5eBirqfop8EQ2XeqSjx90Jz2KM7ZvEoZC+rAMh6Gg+2TFCNxuscXJx8HWoeFgEkZMKzR4x4n5J/RjhpX4=
Received: from localhost.localdomain(mailfrom:qinyuntan@linux.alibaba.com fp:SMTPD_---0WcFfwzB_1748488613 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 29 May 2025 11:16:54 +0800
From: Qinyun Tan <qinyuntan@linux.alibaba.com>
To: Tony Luck <tony.luck@intel.com>
Cc: "H . Peter Anvin" <hpa@zytor.com>,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	Reinette Chatre <reinette.chatre@intel.com>,
	Qinyun Tan <qinyuntan@linux.alibaba.com>
Subject: [PATCH V2 0/1] x86/resctrl: Remove unappropriate references to cacheinfo in the resctrl subsystem.
Date: Thu, 29 May 2025 11:16:49 +0800
Message-ID: <20250529031650.63880-1-qinyuntan@linux.alibaba.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

V2:
- Keep sanity checks in the __mon_event_count to ensure execution occurs
  exclusively on CPUs sharing the same L3 cache cluster
- When reading the top level event, obtain a CPU within hdr.cpu_mask.
  Then use the cacheinfo shared_cpu_map of this CPU instead of using
  hdr.cpu_mask directly
- Adjust code formatting and commit log descriptions.

In the resctrl subsystem's Sub-NUMA Cluster (SNC) mode, the rdt_mon_domain
structure previously relies on the cacheinfo interface to store L3 cache
information (e.g., shared_cpu_map) for monitoring. However, this approach
introduces risks when CPUs go offline:

The ci field in rdt_mon_domain is initialized using the first online CPU
of a NUMA node. When this CPU goes offline, its shared_cpu_map is cleared
to contain only the offline CPU itself. Subsequently, attempting to read
counters via smp_call_on_cpu(offline_cpu) would fail, but returning zero
values for "top-level events" without error indication.

To resolve these issues:

1. Replace direct cacheinfo references in struct rdt_mon_domain and struct
rmid_read with the cacheinfo ID (a unique identifier for the L3 cache).

2. The hdr.cpu_mask maintained by resctrl constitutes a subset of
shared_cpu_map. When reading top-level events, we dynamically select a CPU
from hdr.cpu_mask and utilize its corresponding shared_cpu_map for resctrl
to determine valid CPUs for reading RMID counter via the MSR interface.

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

