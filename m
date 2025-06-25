Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE642EACFB
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 16:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750870618; cv=none; b=FgZvpTRKqlv4CemKlZTWk+TvHtGosbJTqsYpKoLBlYKq4Rae55uRhoT0p5nizhKo/cDO0k/jgQrCfotw5sAFtmORXmTnYQTQ6wvhc8wZG5eOGVdjmaF4lzKKWnK5T4zBO11JOPsefePDu1T8dnTtNDU6B5sCqnM+Rndkh1rJEEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750870618; c=relaxed/simple;
	bh=E72XAmwLEXP/cIfDQ5XSxKLgy7353qIEmfUuR7ydBVY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XXmY5bvkCDyobdfzsWyF2kTaUiB5B1skW6y/ftRYyTp9uq1sSWVBMNZoKOgz1VTSATnVeHvkw5KW/NfYhcytbk1DLCyE7AiBHJ5xBtlXi2dnnEruCSaNk5U7TK96Wby38/cnBbMHZ76LRpaq9+iwaq5Y/LvMhMp/VcI14QuW+GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ewEYtxLU; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ewEYtxLU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750870617; x=1782406617;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=E72XAmwLEXP/cIfDQ5XSxKLgy7353qIEmfUuR7ydBVY=;
  b=ewEYtxLUFy2VK8NYZEAu2K7vr6o7uWUbqKHRYH8jPvfNuBEzQyxPVHmd
   tEHMFj7lvcV5CyDRcZZc4T1t/4brPlpGiGWY0AJqbx6FwXT/hsOFj+5r6
   s58sH9P2vPVbQNAnffmoraZjvuq8t2KprdTrMNbKMwSW9CBDeKFUWqSd4
   QgFsHbd8MuISR4Ylip2t6HlO7bNutzGyTkNXMNRYfU8vSWLqsJpKRHYzg
   /PuW4tfpE9lTgmHy0xAxrn7klrANIr+YSZGNWqwpO5aNnV1uVN2c/cipW
   bw085evX9gHs2rYjBh/jsTTb3l15o24Xl8/n2Q0B7c6UxUfORs/NMaDUa
   g==;
X-CSE-ConnectionGUID: MSL2/gErTX+cBbA5FLS15w==
X-CSE-MsgGUID: BbIyne4hRmuIRuN09tn5YA==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53214453"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; 
   d="scan'208";a="53214453"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 09:56:56 -0700
X-CSE-ConnectionGUID: 3uBLudaDRKmk2vQH8jnnpw==
X-CSE-MsgGUID: VC4Q+YAtSg+EZyqY7EcukA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; 
   d="scan'208";a="151696699"
Received: from unknown (HELO bnilawar-desk2.iind.intel.com) ([10.190.239.41])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 09:56:54 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: anshuman.gupta@intel.com,
	rodrigo.vivi@intel.com,
	alexander.usyskin@intel.com,
	gregkh@linuxfoundation.org,
	daniele.ceraolospurio@intel.com
Subject: [PATCH v4 06/10] drm/xe/xe_late_bind_fw: Reload late binding fw in rpm resume
Date: Wed, 25 Jun 2025 22:30:11 +0530
Message-Id: <20250625170015.33912-7-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250625170015.33912-1-badal.nilawar@intel.com>
References: <20250625170015.33912-1-badal.nilawar@intel.com>
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
index 52243063d98a..737780336000 100644
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

