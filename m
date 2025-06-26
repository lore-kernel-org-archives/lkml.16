Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32EA42E5423
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 16:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750956605; cv=none; b=Vb9SFa81+5nTjlFP3zX2wU2DuDITWvBGZs3JVGbscnb6LSA1rj091k2JKDdhpCCtN+MoMoiXCQ0U66Zvn8cTNrnYMo2UTkc5PoYVj2eO5GnMCKidB8hz8168mtpLt51REziqkxE/wnyRHJIdY00aCGSS2fI/k2r4lfxg3WS8dqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750956605; c=relaxed/simple;
	bh=ixo7bJsQmnGV+5RozZo8jcxCPZZ7U9d0UgkIM6AZykU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f8hgbW1pV0P4mk3vVl0Ht+l8tFEZvteEJJkUPHWe5fQk2ERncQfQ9CE+dDKEu3R/p4V2hI3i9H75Ff520JROR+tdJlJGHMzNzMU43iYC7LAtTtchXgJDOG9CxC67UGBhqNl9UER3E+tRfTIGGfEFKO0q7iDgSLCMb7sFHZHAGRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gh2zL2IF; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gh2zL2IF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750956604; x=1782492604;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ixo7bJsQmnGV+5RozZo8jcxCPZZ7U9d0UgkIM6AZykU=;
  b=Gh2zL2IFFzpCqMIxdMYpiUUPmShqLAMel7xv06RJsGWfXA2M36LC3YZ2
   27yJdVAlrR/F9NRXXmB25vbY1oCY+2CYssIIQ5QHcH+bbuxYIjL/wa7nA
   AS7VXkeq3ianYBjLSQ2TObnZ/O5iLmSTa4cSDQTgL/D0Tk4wrmo8IIy9X
   9EnRyubvkOzPZ+85KbXmh+Sc10CpHmhsLCnKvIRdGpxQZi6zlG91i3X41
   AO5CWE3FlP284AlgvCLO49KppWYhDHAqq4TJN1E9x7zk9EOqqyH21UceS
   i8Nsso2eSHKQd/oSEQ2wG1ehdEb1RP6BflpNyOohgY3BnxH4iDxGZpFMT
   A==;
X-CSE-ConnectionGUID: /qXXWounRDOQlbXNPTDFiA==
X-CSE-MsgGUID: 6TQVmczcT/GMDjUXHgDKzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="53136445"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="53136445"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 09:49:58 -0700
X-CSE-ConnectionGUID: hmM+XgG0RrC7Lqmu2KtvNQ==
X-CSE-MsgGUID: +lXwONQGRwieTaitsKZ9xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="153069250"
Received: from agluck-desk3.sc.intel.com ([172.25.103.51])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 09:49:57 -0700
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
Subject: [PATCH v6 16/30] x86,fs/resctrl: Add and initialize rdt_resource for package scope core monitor
Date: Thu, 26 Jun 2025 09:49:25 -0700
Message-ID: <20250626164941.106341-17-tony.luck@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250626164941.106341-1-tony.luck@intel.com>
References: <20250626164941.106341-1-tony.luck@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Counts for each Intel telemetry event are periodically sent to one or
more aggregators on each package where accumulated totals are made
available in MMIO registers.

Add a new resource for monitoring these events so that CPU hotplug
notifiers will build domains at the package granularity.

Signed-off-by: Tony Luck <tony.luck@intel.com>
---
 include/linux/resctrl.h            |  2 ++
 fs/resctrl/internal.h              |  2 ++
 arch/x86/kernel/cpu/resctrl/core.c | 10 ++++++++++
 fs/resctrl/rdtgroup.c              |  2 ++
 4 files changed, 16 insertions(+)

diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index 23e2874105e3..76c54b81e426 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -53,6 +53,7 @@ enum resctrl_res_level {
 	RDT_RESOURCE_L2,
 	RDT_RESOURCE_MBA,
 	RDT_RESOURCE_SMBA,
+	RDT_RESOURCE_PERF_PKG,
 
 	/* Must be the last */
 	RDT_NUM_RESOURCES,
@@ -252,6 +253,7 @@ enum resctrl_scope {
 	RESCTRL_L2_CACHE = 2,
 	RESCTRL_L3_CACHE = 3,
 	RESCTRL_L3_NODE,
+	RESCTRL_PACKAGE,
 };
 
 /**
diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
index 4dc678af005c..53ced959a27d 100644
--- a/fs/resctrl/internal.h
+++ b/fs/resctrl/internal.h
@@ -239,6 +239,8 @@ struct rdtgroup {
 
 #define RFTYPE_DEBUG			BIT(10)
 
+#define RFTYPE_RES_PERF_PKG		BIT(11)
+
 #define RFTYPE_CTRL_INFO		(RFTYPE_INFO | RFTYPE_CTRL)
 
 #define RFTYPE_MON_INFO			(RFTYPE_INFO | RFTYPE_MON)
diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 03c481725fdb..a5f01cac2363 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -100,6 +100,14 @@ struct rdt_hw_resource rdt_resources_all[RDT_NUM_RESOURCES] = {
 			.schema_fmt		= RESCTRL_SCHEMA_RANGE,
 		},
 	},
+	[RDT_RESOURCE_PERF_PKG] =
+	{
+		.r_resctrl = {
+			.name			= "PERF_PKG",
+			.mon_scope		= RESCTRL_PACKAGE,
+			.mon_domains		= mon_domain_init(RDT_RESOURCE_PERF_PKG),
+		},
+	},
 };
 
 u32 resctrl_arch_system_num_rmid_idx(void)
@@ -433,6 +441,8 @@ static int get_domain_id_from_scope(int cpu, enum resctrl_scope scope)
 		return get_cpu_cacheinfo_id(cpu, scope);
 	case RESCTRL_L3_NODE:
 		return cpu_to_node(cpu);
+	case RESCTRL_PACKAGE:
+		return topology_physical_package_id(cpu);
 	default:
 		break;
 	}
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 9dac8017a2f8..d9bb01edd582 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -2195,6 +2195,8 @@ static unsigned long fflags_from_resource(struct rdt_resource *r)
 	case RDT_RESOURCE_MBA:
 	case RDT_RESOURCE_SMBA:
 		return RFTYPE_RES_MB;
+	case RDT_RESOURCE_PERF_PKG:
+		return RFTYPE_RES_PERF_PKG;
 	}
 
 	return WARN_ON_ONCE(1);
-- 
2.49.0

