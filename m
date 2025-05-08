Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5930622F16E;
	Thu,  8 May 2025 23:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746745379; cv=none; b=GDZXvfmeIHffPDrsoeDwI3dbFdlDvl2wVySJaTfYNObZ3kvkLe1OatCh6E86Jnfe+3dcf+Rcx3lzJKv76NFSrqSHVAu0W7QIMS/JSbZVmmxuoSn0fpjMS0enzTyaSKtXAWZCul8D5KaVpfcckqeBLvvq3p1J2RXbh2qrrh6hid4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746745379; c=relaxed/simple;
	bh=WdQ4JG5BjEA7oa3VdlBozxTenaZiZHLvCwlK31IZXyQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AMKQzgDFJDlQ+oSxwEuJpTQf9I6yQwZFlKtv5/Zf0LrVj5apCebBNfCKACQkdu1DFkQZO+CxgzyJ9F0Y3UJeRPoL+jQZ/60m9saYvlsDRRTu5tXtlrvtxmEwi0KwljDWdwpGeGnncLjFxsZiZwybP0LezpazC3+FA/qkwPItuto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZE73e3yB; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZE73e3yB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746745378; x=1778281378;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WdQ4JG5BjEA7oa3VdlBozxTenaZiZHLvCwlK31IZXyQ=;
  b=ZE73e3yBIeE/6PNfbpHONvt3Y5olJw2Wy9DySZhbDmY8qFzx8+HySU1z
   O1A+3NBwtipj/aPPhu4yODnu5Mh5WYaUBp5IEHd73P+d5Ooyj++YiZWt6
   i/idkT8/+mgyVDEHVb3ZruZ1Im7Z190pGFK8Afu0PDjMGT+LXvNulatCo
   yjwLLGiiTdrHF2nBW4aTzTNX2gu2S5rpDOV31Vn7v7yahFQL7o30I+aGq
   xZLe3EccP1UGmQOBrOONqCRKGkU3EjinZ88l1LKMv6icWEeEo21GqGpNq
   /hGz6fdgjC/4gj5W4BKv4u6KE9o/J0aFBq+sbHzsEbeyR4A36idsyAZfL
   w==;
X-CSE-ConnectionGUID: 3MlHt+dwQgepXeMzyG94Sw==
X-CSE-MsgGUID: mduKFZ+PQJ6Uu0VaiA7iZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="59552599"
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="59552599"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 16:02:54 -0700
X-CSE-ConnectionGUID: dWWu9wz7Rz2VMdowzHVizg==
X-CSE-MsgGUID: Qmg9DSZbR6uCmnTV7tPhJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="136931256"
Received: from spandruv-desk.jf.intel.com ([10.54.75.16])
  by fmviesa010.fm.intel.com with ESMTP; 08 May 2025 16:02:54 -0700
From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH v3 3/5] platform/x86/intel: power-domains: Add interface to get Linux die ID
Date: Thu,  8 May 2025 16:02:40 -0700
Message-ID: <20250508230250.1186619-4-srinivas.pandruvada@linux.intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250508230250.1186619-1-srinivas.pandruvada@linux.intel.com>
References: <20250508230250.1186619-1-srinivas.pandruvada@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The die ID in the Linux topology sysfs is a logical identifier that
differs from the one presented in CPUID leaf 0x1F or via MSR 0x54.

Introduce an interface that returns the Linux CPU die ID based on a
given package ID and power domain ID. This mapping is stored during the
CPU online callback in an array.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
v3:
No change
v2:
No change

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
2.49.0

