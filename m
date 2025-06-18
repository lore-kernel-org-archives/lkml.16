Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0982F94B9
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 18:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750273010; cv=none; b=oZgC/ATNmwnBGKY1ycvSEhvxjgafi8H0q3TYyodsD4pvYyZ9zOz6NGmoIpap4jWVHmf/GCz0jAgzvuCmyH6zINlEszBwL3uN4C4girgEeNZDP1WTEt6ddgYMT/kOXsIntQcEJ8mix1cyAdVe9pssw1sBTAgFr/OzmOVi0q48FNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750273010; c=relaxed/simple;
	bh=/QlIPjWdA1TnP52ODGEsC//2VUd/jKvKyK//m+hXviw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IIsu3JxgwpySvQtMuhiuUys17vEHlFLWcoCi6AAp1ibxYQauLBmk9Wa51IStit/W94Ef9maqroqVg5kP3NcABa+hYFLcwfs3ZNXtH6GSLxrZgLyLpg/SYfJqCoHdZQtCe5/jgTVuL0x3Ka/2cL4CQjvxJOqFpLtE01t8rv/g9Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KHmGVLLM; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KHmGVLLM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750273009; x=1781809009;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/QlIPjWdA1TnP52ODGEsC//2VUd/jKvKyK//m+hXviw=;
  b=KHmGVLLMCdgMYAsOXIWKr3IsrQKQ4aA4VyOlYBbDPIYBIbrgM7Tch7Es
   P2uIEfl7ZM+8uzdAyawG9evBc2Xst1I3p7Lfz1IDhn/qcYoDtWFj3TqxL
   IEFfnGUpXe/DF+TIYP3qtw0LIA/rXXrwwJUAe6mxBpPPfuMAFXJcCWip8
   HdJX+XMqkYaLwPC66hWC/sDku1pmFfvRIrBJM3TxjPWzRBeVPDrQMJvp2
   Aefqp0yGtscViuVJWA8pKl5I9VQtL9Gm0sptR1+GX6jvu5rjY+0MZn7zO
   tX39xeGrfNV9w5Jx9kEOfxjaTYwUKs/3KlJyq4J4rpu0MpEHZC7e9h/CB
   w==;
X-CSE-ConnectionGUID: 4mqkhSicRXGXNA1e1PpSdg==
X-CSE-MsgGUID: 0ahKeYArR+mRlmCgaoE2NA==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52210207"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="52210207"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 11:56:49 -0700
X-CSE-ConnectionGUID: ykx6gxnfRHm8Oz26A7Wf9Q==
X-CSE-MsgGUID: Eim7miTsTLyZTrvNm/AUvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="153951851"
Received: from unknown (HELO bnilawar-desk2.iind.intel.com) ([10.190.239.41])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 11:56:46 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: anshuman.gupta@intel.com,
	rodrigo.vivi@intel.com,
	alexander.usyskin@intel.com,
	gregkh@linuxfoundation.org,
	daniele.ceraolospurio@intel.com,
	jgg@nvidia.com
Subject: [PATCH v3 06/10] drm/xe/xe_late_bind_fw: Reload late binding fw in rpm resume
Date: Thu, 19 Jun 2025 00:30:03 +0530
Message-Id: <20250618190007.2932322-7-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250618190007.2932322-1-badal.nilawar@intel.com>
References: <20250618190007.2932322-1-badal.nilawar@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reload late binding fw during runtime resume.

v2: Flush worker during runtime suspend

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_late_bind_fw.c | 2 +-
 drivers/gpu/drm/xe/xe_late_bind_fw.h | 1 +
 drivers/gpu/drm/xe/xe_pm.c           | 6 ++++++
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
index 54aa08c6bdfd..c0be9611c73b 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
@@ -58,7 +58,7 @@ static int xe_late_bind_fw_num_fans(struct xe_late_bind *late_bind)
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
index ff749edc005b..91923fd4af80 100644
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
@@ -460,6 +461,8 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 	if (err)
 		goto out;
 
+	xe_late_bind_wait_for_worker_completion(&xe->late_bind);
+
 	/*
 	 * Applying lock for entire list op as xe_ttm_bo_destroy and xe_bo_move_notify
 	 * also checks and deletes bo entry from user fault list.
@@ -550,6 +553,9 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 
 	xe_pxp_pm_resume(xe->pxp);
 
+	if (xe->d3cold.allowed)
+		xe_late_bind_fw_load(&xe->late_bind);
+
 out:
 	xe_rpm_lockmap_release(xe);
 	xe_pm_write_callback_task(xe, NULL);
-- 
2.34.1

