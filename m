Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11BDC28A1FB
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 21:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751060751; cv=none; b=mk5//+lkTVD6F2533HZSWjB4s0yOFRw9QdDAtoTGeH0oV8kQfBGwPURS7tudZ1kNY9c28SRJxDfIMia4jzK1y+sCfpOxndh+lXoZGPTL2Z19l2XpZ2ORfmhC3HBw5Wze0xGsgAcMAe3kgW5f0w+W9LqLJwfK7qTTMkRzs9n+Ei0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751060751; c=relaxed/simple;
	bh=SXgoQ1idQ/QAggHeUOTb6B7xD04V/Ud51LpI1El6PZc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mhbNqfpqjC4ajX31RGtzVKzNemxR+sHWA7fsm7vtCkIDzprVExvLsbpxTchgnfbBUP6VU6Zhev7kZWaYenv7WowKUPPzHHJtPn460ItOMIUjKoiauzC83vjXPiIIAJHQUNUwWTPA3mIIWBwqvnMSk2QAX6318Fhf4nIYPUfsucM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yd+1CupH; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yd+1CupH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751060749; x=1782596749;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=SXgoQ1idQ/QAggHeUOTb6B7xD04V/Ud51LpI1El6PZc=;
  b=Yd+1CupHB6EFZyOLkPrmPy/CJNxOVoyWojLzircAe6qk/FpAM+vko0V/
   Zy9QfCQgeu1iZmJa9IxXNOojZckTU7SFZ7Q4uosQmuHZEYwppHXHnh48O
   4kS70kVHQkyBP2fN3brLiDHCOQFNLrHRR8M71tEhQNljMpO5hjxPZGyie
   +AnZrT1DCm7Jc/iADzJ6G97UaGyttgQHPP37JOwB95VEPp/FGdp9VvqFp
   udwooULa/grtvadxl/jXb51R39P34pUO1568FwGZPTTz1+GfnixpjRPku
   G+8BLcVS/e5MkkJ+D48tfWZ8FqaZNR/A1TEUrh24X8nwppva0Dr5a9o+K
   w==;
X-CSE-ConnectionGUID: ZYpSJf67T7y9sVDuIKVPVg==
X-CSE-MsgGUID: MeZUQOcRRhCT6KZzqepUpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="57063809"
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="57063809"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 14:45:47 -0700
X-CSE-ConnectionGUID: PVgiLh26QASebbFsDd+gMA==
X-CSE-MsgGUID: 8MmuCRbaTN2yssdus7W7dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="190092872"
Received: from unknown (HELO [172.25.112.21]) ([172.25.112.21])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 14:45:47 -0700
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
Date: Fri, 27 Jun 2025 14:45:30 -0700
Subject: [PATCH 4/4] sched/topology: Keep SD_PREFER_SIBLING for domains
 with clusters
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-rneri-fix-cas-clusters-v1-4-121ffb50bbc7@linux.intel.com>
References: <20250627-rneri-fix-cas-clusters-v1-0-121ffb50bbc7@linux.intel.com>
In-Reply-To: <20250627-rneri-fix-cas-clusters-v1-0-121ffb50bbc7@linux.intel.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
 Juri Lelli <juri.lelli@redhat.com>, 
 Vincent Guittot <vincent.guittot@linaro.org>, 
 Dietmar Eggemann <dietmar.eggemann@arm.com>, 
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, 
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, 
 Tim C Chen <tim.c.chen@linux.intel.com>, Barry Song <baohua@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 ricardo.neri@intel.com, linux-kernel@vger.kernel.org, 
 Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751060764; l=1754;
 i=ricardo.neri-calderon@linux.intel.com; s=20250602;
 h=from:subject:message-id; bh=SXgoQ1idQ/QAggHeUOTb6B7xD04V/Ud51LpI1El6PZc=;
 b=Zu4su9EKrTEx4BlG79NOL/rURGcBoHIzn3WokFj1mO43ZaORCJ3I7yTHMPDm0g5JpEa/UyqJ3
 D8DQUFnVh8HAzaMKuzf1ZpMbCj3+bcUR4765BIVeCoOYJDCzEc947Oa
X-Developer-Key: i=ricardo.neri-calderon@linux.intel.com; a=ed25519;
 pk=NfZw5SyQ2lxVfmNMaMR6KUj3+0OhcwDPyRzFDH9gY2w=

There are topologies with scheduling domains that contain CPUs of
asymmetric capacity and grouped into two or more clusters of CPUs of
equal capacity sharing L2 cache. CONFIG_SCHED_CLUSTER requires to
balance load among clusters sharing a resource.

Keep the SD_PREFER_SIBLING in the child domains to indicate to the load
balancer that it should spread load among cluster siblings.

Checks for capacity in the load balancer will prevent migrations from
high- to low-capacity CPUs. Likewise, misfit load will still be used to
move high-load tasks to bigger CPUs.

Remove unnecessary parentheses while here.

Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
---
 kernel/sched/topology.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index 8e06b1d22e91..61786cfdc78f 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -1689,8 +1689,15 @@ sd_init(struct sched_domain_topology_level *tl,
 	/*
 	 * Convert topological properties into behaviour.
 	 */
-	/* Don't attempt to spread across CPUs of different capacities. */
-	if ((sd->flags & SD_ASYM_CPUCAPACITY) && sd->child)
+	/*
+	 * Don't attempt to spread across CPUs of different capacities. An
+	 * exception to this rule are domains in which there are clusters of
+	 * CPUs sharing a resource. Keep the flag in such case to balance load
+	 * among them. The load balancer will prevent task migrations from
+	 * high- to low-capacity CPUs.
+	 */
+	if (sd->flags & SD_ASYM_CPUCAPACITY && sd->child &&
+	    !(sd->child->flags & SD_CLUSTER))
 		sd->child->flags &= ~SD_PREFER_SIBLING;
 
 	if (sd->flags & SD_SHARE_CPUCAPACITY) {

-- 
2.43.0

