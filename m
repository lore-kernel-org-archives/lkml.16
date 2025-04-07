Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24FE23AE83
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 23:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744069263; cv=none; b=RWPHPaK88Jh5lI4gVAORSBcAfrtLTSZORW3jieu9ut7nh/edWzDocVebySqJTlByvn3jLAIxp7d2k+5yL3CPwxspNMJAJfMyFOfL86GluIa3agnQOJn/NnZl2aiQuyLudp1lTK2QVRtBIYIunhNUPAFURH6pY+IQCGVXJjsRSKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744069263; c=relaxed/simple;
	bh=uPpyvGLmew8c8rVdcBQQM9qRJMHVlmbtLeyTb5Ivg1s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dwQvoUuaDpmoRCMTYJ26EMotP81H8lX85D+fy5Je5mNBi5DbeKNqezE8hzu+7bTcTnbMuCd6oFywMlJNFxX0tzY3z5EjChhwDrJ+mizZN9gxpZuQsS61e6iCXfGGiMD/bRsxpSJhtbxX1b3nxSvUyvblk428fSHB9N2R1y01LgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DhtxHGZ6; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DhtxHGZ6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744069262; x=1775605262;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uPpyvGLmew8c8rVdcBQQM9qRJMHVlmbtLeyTb5Ivg1s=;
  b=DhtxHGZ6wcXBAi+AplRxZh1LfVZUDMhMb1yOJvRNNx3SVoF1SB0oLVWF
   TbPjs5GA3mHjjbogRwWD7RuI2d6I7kst9Y6f7STkLBQz+odJFYW82HJRe
   dxg4Vb3ru52soVEjqPIZScShmaS84pzZBAGyFdRYmuc9d6KBVQOL7QIO3
   zN6AhDJSTzSlNUnAwxjV/lZn+D9CI8pq1QMjoLu+Tkeqk0msVaT8NsAFP
   1a9FiS7xfMnIdIWMh9lvXxcd9oQbmOlv4dvc2u+tGV7UrS2Ayu83kA+vv
   6V9s014xxKsB1CeBfMOA10VLH1MmdUEreKtv+WY/+sY/rFcBHJnwnlgHz
   w==;
X-CSE-ConnectionGUID: nzx+q76XSuKculYtOukpfA==
X-CSE-MsgGUID: 6mfh0DbHSBe6S/cjQmtb7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="48193270"
X-IronPort-AV: E=Sophos;i="6.15,196,1739865600"; 
   d="scan'208";a="48193270"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 16:40:56 -0700
X-CSE-ConnectionGUID: 8FW9qs64RKCH4VUyYl+8YA==
X-CSE-MsgGUID: MggWdzOBToy4lbOOWVAuBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,196,1739865600"; 
   d="scan'208";a="165315515"
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
Subject: [PATCH v3 21/26] fs-x86/resctrl: Handle RDT_RESOURCE_PERF_PKG in domain create/delete
Date: Mon,  7 Apr 2025 16:40:23 -0700
Message-ID: <20250407234032.241215-22-tony.luck@intel.com>
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

Add a new rdt_perf_pkg_mon_domain structure. This only consists of
the common rdt_domain_hdr as there is no need for any per-domain
data structures.

Use as much as possible of the existing domain setup and tear down
infrastructure. In many cases the RDT_RESOURCE_PERF_PKG uses the
same functions but just skips over the pieces it does not need.

Signed-off-by: Tony Luck <tony.luck@intel.com>
---
 include/linux/resctrl.h            |  8 ++++++++
 arch/x86/kernel/cpu/resctrl/core.c | 32 ++++++++++++++++++++++++++++++
 fs/resctrl/rdtgroup.c              | 11 ++++++++--
 3 files changed, 49 insertions(+), 2 deletions(-)

diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index c03e7dc1f009..6f598a64b192 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -169,6 +169,14 @@ struct rdt_mon_domain {
 	int				cqm_work_cpu;
 };
 
+/**
+ * struct rdt_perf_pkg_mon_domain - CPUs sharing an Intel-PMT-scoped resctrl monitor resource
+ * @hdr:               common header for different domain types
+ */
+struct rdt_perf_pkg_mon_domain {
+	struct rdt_domain_hdr   hdr;
+};
+
 /**
  * struct resctrl_cache - Cache allocation related data
  * @cbm_len:		Length of the cache bit mask
diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 9578d9c7260c..6f5d52a8219b 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -542,6 +542,29 @@ static void setup_l3_mon_domain(int cpu, int id, struct rdt_resource *r, struct
 	}
 }
 
+static void setup_intel_aet_mon_domain(int cpu, int id, struct rdt_resource *r,
+				       struct list_head *add_pos)
+{
+	struct rdt_perf_pkg_mon_domain *d;
+	int err;
+
+	d = kzalloc_node(sizeof(*d), GFP_KERNEL, cpu_to_node(cpu));
+	if (!d)
+		return;
+
+	d->hdr.id = id;
+	d->hdr.type = DOMTYPE(r->rid, DOMTYPE_MON);
+	cpumask_set_cpu(cpu, &d->hdr.cpu_mask);
+	list_add_tail_rcu(&d->hdr.list, add_pos);
+
+	err = resctrl_online_mon_domain(r, &d->hdr);
+	if (err) {
+		list_del_rcu(&d->hdr.list);
+		synchronize_rcu();
+		kfree(d);
+	}
+}
+
 static void domain_add_cpu_mon(int cpu, struct rdt_resource *r)
 {
 	int id = get_domain_id_from_scope(cpu, r->mon_scope);
@@ -571,6 +594,9 @@ static void domain_add_cpu_mon(int cpu, struct rdt_resource *r)
 	case RDT_RESOURCE_L3:
 		setup_l3_mon_domain(cpu, id, r, add_pos);
 		break;
+	case RDT_RESOURCE_PERF_PKG:
+		setup_intel_aet_mon_domain(cpu, id, r, add_pos);
+		break;
 	default:
 		WARN_ON_ONCE(1);
 	}
@@ -668,6 +694,12 @@ static void domain_remove_cpu_mon(int cpu, struct rdt_resource *r)
 		synchronize_rcu();
 		mon_domain_free(hw_dom);
 		break;
+	case RDT_RESOURCE_PERF_PKG:
+		resctrl_offline_mon_domain(r, d);
+		list_del_rcu(&hdr->list);
+		synchronize_rcu();
+		kfree(container_of(hdr, struct rdt_perf_pkg_mon_domain, hdr));
+		break;
 	}
 }
 
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 5ca6de6a6e5c..34fcd20f8dd7 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -4020,6 +4020,9 @@ void resctrl_offline_mon_domain(struct rdt_resource *r, struct rdt_mon_domain *d
 	if (resctrl_mounted && resctrl_arch_mon_capable())
 		rmdir_mondata_subdir_allrdtgrp(r, &d->hdr);
 
+	if (r->rid == RDT_RESOURCE_PERF_PKG)
+		goto done;
+
 	if (resctrl_is_mbm_enabled())
 		cancel_delayed_work(&d->mbm_over);
 	if (resctrl_arch_is_llc_occupancy_enabled() && has_busy_rmid(d)) {
@@ -4036,7 +4039,7 @@ void resctrl_offline_mon_domain(struct rdt_resource *r, struct rdt_mon_domain *d
 	}
 
 	domain_destroy_mon_state(d);
-
+done:
 	mutex_unlock(&rdtgroup_mutex);
 }
 
@@ -4104,12 +4107,15 @@ int resctrl_online_ctrl_domain(struct rdt_resource *r, struct rdt_ctrl_domain *d
 int resctrl_online_mon_domain(struct rdt_resource *r, struct rdt_domain_hdr *hdr)
 {
 	struct rdt_mon_domain *d;
-	int err;
+	int err = 0;
 
 	WARN_ON_ONCE(hdr->type != DOMTYPE(r->rid, DOMTYPE_MON));
 	d = container_of(hdr, struct rdt_mon_domain, hdr);
 	mutex_lock(&rdtgroup_mutex);
 
+	if (r->rid == RDT_RESOURCE_PERF_PKG)
+		goto do_mkdir;
+
 	err = domain_setup_mon_state(r, d);
 	if (err)
 		goto out_unlock;
@@ -4123,6 +4129,7 @@ int resctrl_online_mon_domain(struct rdt_resource *r, struct rdt_domain_hdr *hdr
 	if (resctrl_arch_is_llc_occupancy_enabled())
 		INIT_DELAYED_WORK(&d->cqm_limbo, cqm_handle_limbo);
 
+do_mkdir:
 	/*
 	 * If the filesystem is not mounted then only the default resource group
 	 * exists. Creation of its directories is deferred until mount time
-- 
2.48.1

