Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86702237703
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 23:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744069262; cv=none; b=mhOvxq0ibnUefLHe+Rq2o+grFUvuBVxjX5WbbXbWKxWwFcsyaWB34wZHKzXSqNmtUof3xEDAE6lMJmsJvK+ofeFZj3z/dKgC4Ivdgk+hG2zGl9e5MA57/sOiAEZxEosWHto95kCKcmv/OsQw0UAlDDrOaSndHxqNBJpWwOd43EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744069262; c=relaxed/simple;
	bh=k2dKeDvK8ctetzdumGpNReFcjpN/c5jQdWJNXvokbFQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SujJpfilU6IYpVabSNPqIWQ9xqtaHi5bVchACoBAQcYbpwm/MvrlJSnglmZxz6EuMGMNECUm++yQm8yZg70G7orK0RnDKYQCpAZPEQKaTSAOSVwTaOytPtGVvdxvwVGOXsbW/xeECPPEdUg1p1HhlQbqiwN4Zr90fT1RvnCD7Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TYQs8chl; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TYQs8chl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744069261; x=1775605261;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=k2dKeDvK8ctetzdumGpNReFcjpN/c5jQdWJNXvokbFQ=;
  b=TYQs8chl1uTZ1sKEruemMh1ffwo5vLcdIxmvgpwJ+ehdRxVJb+teQF+2
   R6XBp2ckFMU9ACfIf0mvkGZHFQAD+UZe9K3scd5eqm11Z0XVPcvOce7O3
   JxOuFDzCz4d1fE7XrlKM/6VIx7aWM8gtsfYUFoDRNTi1MpoE6H3ml+NKJ
   iXVQ42Qtla7NefkUU6qPCS5xSEx98W7Os56TfgM/Pr3G56S1hNqnI5lLU
   K/SFmSk5zRFdQI/n+79eukR/ybFVQlF/cfufjpt0UqLpzdA1WlhYXCb65
   sVHVpIDVD//V/ZgTF+1tpcFs6nci7u/gupOvOuhA+taONx/tZzwm119AN
   Q==;
X-CSE-ConnectionGUID: 6OHd7NiDTB2rnFiEfDpMNQ==
X-CSE-MsgGUID: NoJe/Wv8Ryyqx/nTqrQvoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="48193263"
X-IronPort-AV: E=Sophos;i="6.15,196,1739865600"; 
   d="scan'208";a="48193263"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 16:40:55 -0700
X-CSE-ConnectionGUID: oAaIfCk3TLeF8pyli6FFsA==
X-CSE-MsgGUID: /OcgcXIMQ6OFVvTuxk4MZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,196,1739865600"; 
   d="scan'208";a="165315512"
Received: from agluck-desk3.sc.intel.com ([172.25.222.70])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 16:40:55 -0700
From: Tony Luck <tony.luck@intel.com>
To: Fenghua Yu <fenghuay@nvidia.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
	Peter Newman <peternewman@google.com>,
	James Morse <james.morse@arm.com>,
	Babu Moger <babu.moger@amd.com>,
	Drew Fustini <dfustini@baylibre.com>,
	Dave Martin <Dave.Martin@arm.com>,
	Anil Keshavamurthy <anil.s.keshavamurthy@intel.com>
Cc: linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	Tony Luck <tony.luck@intel.com>
Subject: [PATCH v3 20/26] x86/resctrl: Add and initialize rdt_resource for package scope core monitor
Date: Mon,  7 Apr 2025 16:40:22 -0700
Message-ID: <20250407234032.241215-21-tony.luck@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250407234032.241215-1-tony.luck@intel.com>
References: <20250407234032.241215-1-tony.luck@intel.com>
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

Add a new resource for monitoring these events with code to build
domains at the package granularity.

Signed-off-by: Tony Luck <tony.luck@intel.com>
---
 include/linux/resctrl.h            |  1 +
 arch/x86/kernel/cpu/resctrl/core.c | 11 +++++++++++
 2 files changed, 12 insertions(+)

diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index 25f51a57b0b7..c03e7dc1f009 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -232,6 +232,7 @@ enum resctrl_scope {
 	RESCTRL_L2_CACHE = 2,
 	RESCTRL_L3_CACHE = 3,
 	RESCTRL_L3_NODE,
+	RESCTRL_PACKAGE,
 };
 
 /**
diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index f0f256a5ac66..9578d9c7260c 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -99,6 +99,15 @@ struct rdt_hw_resource rdt_resources_all[RDT_NUM_RESOURCES] = {
 			.schema_fmt		= RESCTRL_SCHEMA_RANGE,
 		},
 	},
+	[RDT_RESOURCE_PERF_PKG] =
+	{
+		.r_resctrl = {
+			.rid			= RDT_RESOURCE_PERF_PKG,
+			.name			= "PERF_PKG",
+			.mon_scope		= RESCTRL_PACKAGE,
+			.mon_domains		= mon_domain_init(RDT_RESOURCE_PERF_PKG),
+		},
+	},
 };
 
 u32 resctrl_arch_system_num_rmid_idx(void)
@@ -431,6 +440,8 @@ static int get_domain_id_from_scope(int cpu, enum resctrl_scope scope)
 		return get_cpu_cacheinfo_id(cpu, scope);
 	case RESCTRL_L3_NODE:
 		return cpu_to_node(cpu);
+	case RESCTRL_PACKAGE:
+		return topology_physical_package_id(cpu);
 	default:
 		break;
 	}
-- 
2.48.1

