Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC04523AE9A
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 22:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747867874; cv=none; b=swb/54OyNla7z4qp4i2TmjM74E2Ko0y+PbfTFnX8mUUzQSH/YLu/C/8zpIuFOxKTBIQu+mqO2q4ILyttdm3TOd+QXFnfzgUDZKirLIQKYsav6L94qvH7dswUAUFTJm9TjFS+iwTOXDrIuC+kX5gKt/CfIMhCLosLCimtcrqaz/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747867874; c=relaxed/simple;
	bh=Vuq2Y1X1WqGtNgyMA65DiHUQ7pD0Ew/rt+rgo5WAH70=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W7X3uC6rdJU70uPUic2bZEKd+PZB2q+ZjhY4RTRgUtLMknKaLtopVUnbq1URuIHk6XbL0gOeHVT/mUyUCt0XOXRXkArOfkbQoGQpboOiaXGQXGhIo/qKPHESR16HQM2cU79/begMBfvUqwy+R2n/xhgTswlxvFzvveYJ+xK1fZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dymt+6s6; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dymt+6s6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747867872; x=1779403872;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Vuq2Y1X1WqGtNgyMA65DiHUQ7pD0Ew/rt+rgo5WAH70=;
  b=dymt+6s6EfW2rn7AZSkQZ+ZkyvLHyzKfiC6wU82jrC2q4iIlOiUAnfdU
   pqJApZ9HtuIQwuR7wftp3wizqCHfHAsB/HJDPO5SrMeAxn1feOw6IDpTA
   hL8pczEQvQQeTgT9XCufxpOuGzw+nNtoKfSQJbOx/EjCX4fE3UZwRrr/N
   fhaKHZ7FH1AnLqiT717QlGWf1jdEV98lodsgjPb5DZbS/25LOWdJmioT6
   dPON2usUthsFnlP6oSK78RQiPYJ8b6hRkbzU7vsGU+ftFawaCTZbbzjYS
   VNrlNwA3KERpV6J0kmtt8Y2/+h+WV/TlT1gZYJlgnNJvbKuxR17DyQt9y
   Q==;
X-CSE-ConnectionGUID: Bf/BEhsCQFe9SEwu6AqWnw==
X-CSE-MsgGUID: md+9ZUvjRWWQqTTuN6G7Gg==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="53677822"
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="53677822"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 15:51:00 -0700
X-CSE-ConnectionGUID: pC9+aHUnSQ6Kze+YGjV2dA==
X-CSE-MsgGUID: 3cV8fQp7TGaBMx0MQwIr6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="141352193"
Received: from agluck-desk3.sc.intel.com ([172.25.103.51])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 15:50:59 -0700
From: Tony Luck <tony.luck@intel.com>
To: Fenghua Yu <fenghuay@nvidia.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
	Peter Newman <peternewman@google.com>,
	James Morse <james.morse@arm.com>,
	Babu Moger <babu.moger@amd.com>,
	Drew Fustini <dfustini@baylibre.com>,
	Dave Martin <Dave.Martin@arm.com>,
	Anil Keshavamurthy <anil.s.keshavamurthy@intel.com>,
	Chen Yu <yu.c.chen@intel.com>
Cc: x86@kernel.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	Tony Luck <tony.luck@intel.com>
Subject: [PATCH v5 23/29] x86/resctrl: Enable RDT_RESOURCE_PERF_PKG
Date: Wed, 21 May 2025 15:50:41 -0700
Message-ID: <20250521225049.132551-24-tony.luck@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250521225049.132551-1-tony.luck@intel.com>
References: <20250521225049.132551-1-tony.luck@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RDT_RESOURCE_PERF_PKG resource is not marked as "mon_capable" during
early resctrl initialization. This means that the domain lists for the
resource are not built when the CPU hot plug notifiers are registered.

Mark the resource as mon_capable and call domain_add_cpu_mon() for
each online CPU to build the domain lists in the first call to the
resctrl_arch_pre_mount() hook.

Signed-off-by: Tony Luck <tony.luck@intel.com>
---
 arch/x86/kernel/cpu/resctrl/core.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 18d84c497ee4..f07f5b58639a 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -763,14 +763,27 @@ static int resctrl_arch_offline_cpu(unsigned int cpu)
 
 void resctrl_arch_pre_mount(void)
 {
+	struct rdt_resource *r = &rdt_resources_all[RDT_RESOURCE_PERF_PKG].r_resctrl;
 	static atomic_t only_once;
-	int old = 0;
+	int cpu, old = 0;
 
 	if (!atomic_try_cmpxchg(&only_once, &old, 1))
 		return;
 
 	if (!intel_aet_get_events())
 		return;
+
+	/*
+	 * Late discovery of telemetry events means the domains for the
+	 * resource were not built. Do that now.
+	 */
+	cpus_read_lock();
+	mutex_lock(&domain_list_lock);
+	r->mon_capable = true;
+	for_each_online_cpu(cpu)
+		domain_add_cpu_mon(cpu, r);
+	mutex_unlock(&domain_list_lock);
+	cpus_read_unlock();
 }
 
 enum {
-- 
2.49.0

