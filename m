Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40146303DF4
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 16:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751474893; cv=none; b=qk41qWK+YgYQdVrj1lmGTo7xJ3Ai7U333pIX+Q2JLscHHirWnSVX+9uEbeZNN+NDGJtAX7brJ50aKN4J9YwgBUdP74ZrBs7guU0Q0tPOp3KC499Do2l1BGNR4nZKUHYjd4gQRxpx+17iHuboc7NrPz0jdytfzdgjyfsbOA/FbLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751474893; c=relaxed/simple;
	bh=CVPEMvHxy+G3ghl0MmEF80BkbhRbo4yNjg3nTiGO010=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=b40WlXB7G7B+dYDq3Fl5olSXB2LOfRWLP0jejuoIq0rpt2tsZ23i4uKYEqYrsv4ZCz2Kk/DU8gh6OUhIjuxqzuJwLURK63v1gP+qOpul+3xMBfLaii6SpF3tDmA7Ukm6xyqxzXm2NxS7kEdUD33foh1H9RHpV9Mj4BcAqu2slC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CHq5OjWJ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CHq5OjWJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751474892; x=1783010892;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CVPEMvHxy+G3ghl0MmEF80BkbhRbo4yNjg3nTiGO010=;
  b=CHq5OjWJGTkhgi0s+lfO2Ql8pVfKMNDjpnrCk6p17dHvb9b7R5B1LjYC
   6P/XC17GBSuJPkT4zOMBe/j41DvqALRXqzvlocSDpFh5l//HZW7DJqnG3
   CbQ44l7T3/UO7ZGMM+AVDBvOr8XT2nyrUSvSR38GfU0ygzM6D7sC4OtN6
   WzkM3hTT7HqIPPXG9DxMXvSvcvq/mhX0D0W56EUs/ebGzf+GEAcPgYAjn
   m178SNblA+BZwmcBkeleZqB0zY3FnQc/Q8pq+cUob20HTdrtCQ4QVpipL
   pwKxSWDSlTvwf032L3n5Zv6n/eiHJPPm/A5ZMiL3AgRpZSyPGpTU9dUYw
   A==;
X-CSE-ConnectionGUID: Oh7nA3XLQcaTMDMGRKyCWQ==
X-CSE-MsgGUID: 9OPpwsJ0SA24ViI2Jk/kDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="64380758"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="64380758"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 09:48:12 -0700
X-CSE-ConnectionGUID: F+QOKJaFT3KY1g0tpRAAJw==
X-CSE-MsgGUID: V0W9pgY5SUWvsL69duBcPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="153535618"
Received: from unknown (HELO bnilawar-desk2.iind.intel.com) ([10.190.239.41])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 09:48:10 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: anshuman.gupta@intel.com,
	rodrigo.vivi@intel.com,
	alexander.usyskin@intel.com,
	gregkh@linuxfoundation.org,
	daniele.ceraolospurio@intel.com
Subject: [PATCH v5 06/10] drm/xe/xe_late_bind_fw: Reload late binding fw in rpm resume
Date: Wed,  2 Jul 2025 22:22:12 +0530
Message-Id: <20250702165216.557074-7-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250702165216.557074-1-badal.nilawar@intel.com>
References: <20250702165216.557074-1-badal.nilawar@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reload late binding fw during runtime resume.

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
v5: Flush worker in rpm suspend is not needed any more as
    xe_late_bind_fw_load gets the rpm ref before queuing worker
    to ensure worker completes lb fw loading.
---
 drivers/gpu/drm/xe/xe_late_bind_fw.c | 2 +-
 drivers/gpu/drm/xe/xe_late_bind_fw.h | 1 +
 drivers/gpu/drm/xe/xe_pm.c           | 4 ++++
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
index 56166816a535..3fb84d2f0a76 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
@@ -82,7 +82,7 @@ static int xe_late_bind_fw_num_fans(struct xe_late_bind *late_bind)
 		return 0;
 }
 
-static void xe_late_bind_wait_for_worker_completion(struct xe_late_bind *late_bind)
+void xe_late_bind_wait_for_worker_completion(struct xe_late_bind *late_bind)
 {
 	struct xe_device *xe = late_bind_to_xe(late_bind);
 	struct xe_late_bind_fw *lbfw;
diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.h b/drivers/gpu/drm/xe/xe_late_bind_fw.h
index 28d56ed2bfdc..07e437390539 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw.h
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw.h
@@ -12,5 +12,6 @@ struct xe_late_bind;
 
 int xe_late_bind_init(struct xe_late_bind *late_bind);
 int xe_late_bind_fw_load(struct xe_late_bind *late_bind);
+void xe_late_bind_wait_for_worker_completion(struct xe_late_bind *late_bind);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index ff749edc005b..734fe259600e 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -20,6 +20,7 @@
 #include "xe_gt.h"
 #include "xe_guc.h"
 #include "xe_irq.h"
+#include "xe_late_bind_fw.h"
 #include "xe_pcode.h"
 #include "xe_pxp.h"
 #include "xe_trace.h"
@@ -550,6 +551,9 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 
 	xe_pxp_pm_resume(xe->pxp);
 
+	if (xe->d3cold.allowed)
+		xe_late_bind_fw_load(&xe->late_bind);
+
 out:
 	xe_rpm_lockmap_release(xe);
 	xe_pm_write_callback_task(xe, NULL);
-- 
2.34.1

