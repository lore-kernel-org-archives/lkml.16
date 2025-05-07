Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500DF286D64
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 14:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746628491; cv=none; b=ZfXhi4lZ/pXIqc2Ze8RpA42cNGyAdhzJ33uwhbr7ny5UPk2D6fb+cHf0a3dMZkUszjUvIHiddPG7om6ozSVtdKbcAyipOhZRRoqZBLTEMHWBJJAci+wroffhpo+AMn2/LaL0SmWEgjim8shnaF1bl9l6M6edEqncpQvVhX+b8k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746628491; c=relaxed/simple;
	bh=0gNRnHp0lYcF48lsVadyWaPO5wqh2fr3pWkBS9xX3i4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aR5tdchY1sI0Uvw1nys8s8yPZS82uz1HLCh4U8O/9FMz+o1J/HVL1xXYm3dBlRnKeepacRFFlDaMluQNT7hkt/R2TX6kLlTPXupDlmx+8sRIU7XN5o+qP4pmgVdY/fdLAL9/UC9EHs5EOTtCaeKS4b6C1PM8PhSJfUpfTmb3Q8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MV+0X/Mh; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MV+0X/Mh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746628491; x=1778164491;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0gNRnHp0lYcF48lsVadyWaPO5wqh2fr3pWkBS9xX3i4=;
  b=MV+0X/Mh4S/P91BK+oIOp4vfn0kSuuY1nIa4XnrDIhYvP/A09k7VOpH6
   RQCQ8zn9sxT44iYk7XRMkGxj0F4Aq1ojfTiq8j1+eTepwxr+YR8uDCt+O
   4RJLmwSbZu0BnO5qxh9Dwx3yoo7yCntRGYmSp6D2+ALZhiKvakkvIcJGS
   tuHqQXUcwjbaXiemCfSGaaN/F/QaLWaDPaNeJcNPa+jVkgigmpT5ZxIHs
   HZq8cGEuiO5K4uEoK8ce9g8vpVl2vl9sUuNQQjSKkj+ivZniTqYD/qttm
   FjxB7Gf8VllMHtx8NQukVy+ZqIqQ1V6iJb9rfCLAZ/uKmDnvkr/8SG5NO
   w==;
X-CSE-ConnectionGUID: x+R1Uj1JS52J7b4ZJ1jkBQ==
X-CSE-MsgGUID: hEySKInBTSCPkddh1ZJwCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48378079"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="48378079"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 07:34:48 -0700
X-CSE-ConnectionGUID: YDbV30CyRTqBUTloa0auZg==
X-CSE-MsgGUID: /feiHKp+QZO3rpUnMm/+Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="135943612"
Received: from kanliang-dev.jf.intel.com ([10.165.154.102])
  by fmviesa006.fm.intel.com with ESMTP; 07 May 2025 07:34:47 -0700
From: kan.liang@linux.intel.com
To: peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	irogers@google.com,
	linux-kernel@vger.kernel.org
Cc: Kan Liang <kan.liang@linux.intel.com>
Subject: [RESEND PATCH V2 2/4] perf/x86/intel/uncore: Support customized MMIO map size
Date: Wed,  7 May 2025 07:34:25 -0700
Message-Id: <20250507143427.1319818-3-kan.liang@linux.intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20250507143427.1319818-1-kan.liang@linux.intel.com>
References: <20250507143427.1319818-1-kan.liang@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kan Liang <kan.liang@linux.intel.com>

For a server platform, the MMIO map size is always 0x4000. However, a
client platform may have a smaller map size.

Make the map size customizable.

Signed-off-by: Kan Liang <kan.liang@linux.intel.com>
---
 arch/x86/events/intel/uncore_discovery.c | 2 +-
 arch/x86/events/intel/uncore_snbep.c     | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/x86/events/intel/uncore_discovery.c b/arch/x86/events/intel/uncore_discovery.c
index 8680f66c3e34..142cf714bfe2 100644
--- a/arch/x86/events/intel/uncore_discovery.c
+++ b/arch/x86/events/intel/uncore_discovery.c
@@ -650,7 +650,7 @@ void intel_generic_uncore_mmio_init_box(struct intel_uncore_box *box)
 	}
 
 	addr = unit->addr;
-	box->io_addr = ioremap(addr, UNCORE_GENERIC_MMIO_SIZE);
+	box->io_addr = ioremap(addr, type->mmio_map_size);
 	if (!box->io_addr) {
 		pr_warn("Uncore type %d box %d: ioremap error for 0x%llx.\n",
 			type->type_id, unit->id, (unsigned long long)addr);
diff --git a/arch/x86/events/intel/uncore_snbep.c b/arch/x86/events/intel/uncore_snbep.c
index 76d96df1475a..2f5c2eb1ce0c 100644
--- a/arch/x86/events/intel/uncore_snbep.c
+++ b/arch/x86/events/intel/uncore_snbep.c
@@ -6408,6 +6408,8 @@ static void uncore_type_customized_copy(struct intel_uncore_type *to_type,
 		to_type->get_topology = from_type->get_topology;
 	if (from_type->cleanup_mapping)
 		to_type->cleanup_mapping = from_type->cleanup_mapping;
+	if (from_type->mmio_map_size)
+		to_type->mmio_map_size = from_type->mmio_map_size;
 }
 
 static struct intel_uncore_type **
-- 
2.38.1

