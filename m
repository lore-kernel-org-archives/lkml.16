Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01B5C25CC59;
	Tue, 22 Apr 2025 21:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745357692; cv=none; b=q1pFRPw3kKXdxp7vEwYle9sgMDPeKve5k8BkkSv/PWSA77qGfmnnpM6rKFPM499eSMCmyvUfcqT1QnCKCF7NFiCRUyp5o4aNweg56WD6GxK5ZOVpV3gUrz7BzEc+4MABNgnOdB67v8PWYi3upkJ8VYpiC8lcQIXPPcSs5vt/uIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745357692; c=relaxed/simple;
	bh=Lsz0SmSLHBuNAOhBY+Z7GEFPJPrtXYFlVmulYacxyns=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GvpHmnaEQst2lWd9zpZi+a1jgDAzY+SnfsohTwl3gzqr4u/QfJuj75HH/LYewbxus1q3/l07DsUIQ2rL8NSblSDjN3CD34Bxlo/kNd4qI0sg9zkrS3iZ5TNv72LSHYT4BNJO553v7V5or7UgGefBAQrKxBr6AMd/CymnTO50QB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RpJd7j2w; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RpJd7j2w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745357689; x=1776893689;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Lsz0SmSLHBuNAOhBY+Z7GEFPJPrtXYFlVmulYacxyns=;
  b=RpJd7j2wfpmDHFy09wSh6MIYglgEaHlSPgNuFyW+BiSx4ZdYHnO8oFLa
   8LtsjwP3zd2nPicu4QF9FvuRx+lsflGp25Ud8dWfGuVzZnOByvNwySFkN
   +xSy135c1XRiPXbUrde1xAcs4QFwVe/vvfpv82RQ3zownutkDW558dLOX
   +/pjqP4FsSp+DtKQuYU7hRQgMScN4UwV2kRe+bweUeS4LKIf/7Hmnp9mb
   mN/oYllL1jFeV97sffzNUWdzmEZL3JSaFfuHkW/fVHkN3fiAIh/zE0lDD
   VlMaW7HI2urRyMukac0KeYHCHYC5OkMG9GUzet8Vmly7E/O7V9JnkuLIw
   A==;
X-CSE-ConnectionGUID: PdHx6LhUSD6cLEXir8jCzg==
X-CSE-MsgGUID: II1W1QLqTyyPOjFFf8dgUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="46053990"
X-IronPort-AV: E=Sophos;i="6.15,232,1739865600"; 
   d="scan'208";a="46053990"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 14:34:44 -0700
X-CSE-ConnectionGUID: ZZ/6caK2SeyVT2FnRkQcMg==
X-CSE-MsgGUID: LEtV1NOXToucSih3/zmnhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,232,1739865600"; 
   d="scan'208";a="133070685"
Received: from spandruv-desk.jf.intel.com ([10.54.75.16])
  by orviesa008.jf.intel.com with ESMTP; 22 Apr 2025 14:34:43 -0700
From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH 3/5] platform/x86/intel: power-domains: Add interface to get Linux die ID
Date: Tue, 22 Apr 2025 14:34:25 -0700
Message-ID: <20250422213427.1943328-4-srinivas.pandruvada@linux.intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250422213427.1943328-1-srinivas.pandruvada@linux.intel.com>
References: <20250422213427.1943328-1-srinivas.pandruvada@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The die ID in the Linux topology sysfs is a logical identifier that
differs from the one presented in CPUID leaf 0x1F or via MSR 0x54.

Introduce an interface that returns the Linux CPU die ID based on a
given package ID and power domain ID. This mapping is stored during the
CPU online callback in an array.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 .../platform/x86/intel/tpmi_power_domains.c   | 34 ++++++++++++++++---
 .../platform/x86/intel/tpmi_power_domains.h   |  1 +
 2 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/intel/tpmi_power_domains.c b/drivers/platform/x86/intel/tpmi_power_domains.c
index 2f01cd22a6ee..9aaebd74a2af 100644
--- a/drivers/platform/x86/intel/tpmi_power_domains.c
+++ b/drivers/platform/x86/intel/tpmi_power_domains.c
@@ -74,6 +74,8 @@ static enum cpuhp_state tpmi_hp_state __read_mostly;
 
 static cpumask_t *tpmi_power_domain_mask;
 
+static u16 *domain_die_map;
+
 /* Lock to protect tpmi_power_domain_mask and tpmi_cpu_hash */
 static DEFINE_MUTEX(tpmi_lock);
 
@@ -152,6 +154,15 @@ cpumask_t *tpmi_get_power_domain_mask(int cpu_no)
 }
 EXPORT_SYMBOL_NS_GPL(tpmi_get_power_domain_mask, "INTEL_TPMI_POWER_DOMAIN");
 
+int tpmi_get_linux_die_id(int pkg_id, int domain_id)
+{
+	if (pkg_id >= topology_max_packages() || domain_id >= MAX_POWER_DOMAINS)
+		return -EINVAL;
+
+	return domain_die_map[pkg_id * MAX_POWER_DOMAINS + domain_id];
+}
+EXPORT_SYMBOL_NS_GPL(tpmi_get_linux_die_id, "INTEL_TPMI_POWER_DOMAIN");
+
 static int tpmi_get_logical_id(unsigned int cpu, struct tpmi_cpu_info *info)
 {
 	u64 data;
@@ -189,6 +200,9 @@ static int tpmi_cpu_online(unsigned int cpu)
 	cpumask_set_cpu(cpu, &tpmi_power_domain_mask[index]);
 	hash_add(tpmi_cpu_hash, &info->hnode, info->punit_core_id);
 
+	domain_die_map[info->pkg_id * MAX_POWER_DOMAINS + info->punit_domain_id] =
+			topology_die_id(cpu);
+
 	return 0;
 }
 
@@ -212,17 +226,28 @@ static int __init tpmi_init(void)
 	if (!tpmi_power_domain_mask)
 		return -ENOMEM;
 
+	domain_die_map = kcalloc(size_mul(topology_max_packages(), MAX_POWER_DOMAINS),
+				 sizeof(*domain_die_map), GFP_KERNEL);
+	if (!domain_die_map)
+		goto free_domain_mask;
+
 	ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
 				"platform/x86/tpmi_power_domains:online",
 				tpmi_cpu_online, NULL);
-	if (ret < 0) {
-		kfree(tpmi_power_domain_mask);
-		return ret;
-	}
+	if (ret < 0)
+		goto free_domain_map;
 
 	tpmi_hp_state = ret;
 
 	return 0;
+
+free_domain_map:
+	kfree(domain_die_map);
+
+free_domain_mask:
+	kfree(tpmi_power_domain_mask);
+
+	return ret;
 }
 module_init(tpmi_init)
 
@@ -230,6 +255,7 @@ static void __exit tpmi_exit(void)
 {
 	cpuhp_remove_state(tpmi_hp_state);
 	kfree(tpmi_power_domain_mask);
+	kfree(domain_die_map);
 }
 module_exit(tpmi_exit)
 
diff --git a/drivers/platform/x86/intel/tpmi_power_domains.h b/drivers/platform/x86/intel/tpmi_power_domains.h
index e35750dd9273..2fd0dd7afbd2 100644
--- a/drivers/platform/x86/intel/tpmi_power_domains.h
+++ b/drivers/platform/x86/intel/tpmi_power_domains.h
@@ -14,5 +14,6 @@ int tpmi_get_linux_cpu_number(int package_id, int die_id, int punit_core_id);
 int tpmi_get_punit_core_number(int cpu_no);
 int tpmi_get_power_domain_id(int cpu_no);
 cpumask_t *tpmi_get_power_domain_mask(int cpu_no);
+int tpmi_get_linux_die_id(int pkg_id, int domain_id);
 
 #endif
-- 
2.48.1

