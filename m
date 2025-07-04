Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F09286415
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 07:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751615643; cv=none; b=r2KQ4Qyn/MpUD09c8YSM53+ohhwd0J/b44/2QW2vGRV6sD8jPJpV461tTiiVf3xREXVaVmS1oNdUSSF0LXWhAqK86Gaqti1Fa8vTBO0914MlMw51wIvBZbA28n8tut1xAsuXT+S0rv2Tq73jo/Uym9UrnuY5E/XNO4k5ZFFBWG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751615643; c=relaxed/simple;
	bh=2ytS98LP09yxUibnFIJ15FCH120g81M7gToAN6HatlE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GYuwmTTOSdzNE3msnMfgvnK5uepmNJaoyhP4mgatiZjJ9hefVmTLvHm3xQ6BRO+Jg9zFo7dMAQ8tIaXG6J+EqdCA/45XAjCUdO+Olx/mroEV/LxDlgMEZpSDT0xaeffcNTrQTmVIXQPlgoco3+7fWUO/J2XCt9huB3O05ZZjwnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=leyJnn35; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="leyJnn35"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751615641; x=1783151641;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2ytS98LP09yxUibnFIJ15FCH120g81M7gToAN6HatlE=;
  b=leyJnn35wA1fclrEMPDqejnN+NT+wnDJyH2jfAWilYUkAvsCXPkoGkNw
   wl8+epK3MWsWM0VQpidVfsuht2KDPWUvEx8lwAXx54zPJPOrNf/5NVJ+p
   jNmzFNCFChr2XLbLFs3AwR0MN4BLJoJR5ZLKQEg0ZiY1S/KJlC4x5xtw1
   i2AqT7snd1OlElVGEKC6sCkuxp2GgbUrWSWTGw0py8JB8wLjE0Ri33qNT
   ryvVCtHkiTyU5LRmTc1emTlo5DqVQKs0HL6YQNxSP6M3w4F37Qk/WwlTT
   oTU+PCjDpa2bo5v2VcbSooT/QEeaizVLaatpmXdGCVCalylzLiJPxU5Kk
   A==;
X-CSE-ConnectionGUID: Ev9syrP0QDiawrKv+2OxZw==
X-CSE-MsgGUID: 2YOVGBitTQmQLmo4VnOsFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="76494446"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="76494446"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:01 -0700
X-CSE-ConnectionGUID: MHb23xx3RHCVWynOmTIl3A==
X-CSE-MsgGUID: +zKqp9/NRbmdahhWuJas7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="158924153"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO svinhufvud.fi.intel.com) ([10.245.244.244])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:53:59 -0700
Received: from svinhufvud.lan (localhost [IPv6:::1])
	by svinhufvud.fi.intel.com (Postfix) with ESMTP id 1470F44394;
	Fri,  4 Jul 2025 10:53:57 +0300 (EEST)
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
	Maciej Falkowski <maciej.falkowski@linux.intel.com>,
	Oded Gabbay <ogabbay@kernel.org>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 01/80] accel/ivpu: Remove redundant pm_runtime_mark_last_busy() calls
Date: Fri,  4 Jul 2025 10:53:56 +0300
Message-Id: <20250704075356.3216699-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
pm_runtime_mark_last_busy().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
The cover letter of the set can be found here
<URL:https://lore.kernel.org/linux-pm/20250704075225.3212486-1-sakari.ailus@linux.intel.com>.

In brief, this patch depends on PM runtime patches adding marking the last
busy timestamp in autosuspend related functions. The patches are here, on
rc2:

        git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git \
                pm-runtime-6.17-rc1

 drivers/accel/ivpu/ivpu_job.c | 1 -
 drivers/accel/ivpu/ivpu_pm.c  | 2 --
 2 files changed, 3 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
index 060f1fc031d3..05a1a768e1c9 100644
--- a/drivers/accel/ivpu/ivpu_job.c
+++ b/drivers/accel/ivpu/ivpu_job.c
@@ -1049,6 +1049,5 @@ void ivpu_context_abort_work_fn(struct work_struct *work)
 	mutex_unlock(&vdev->submitted_jobs_lock);
 
 runtime_put:
-	pm_runtime_mark_last_busy(vdev->drm.dev);
 	pm_runtime_put_autosuspend(vdev->drm.dev);
 }
diff --git a/drivers/accel/ivpu/ivpu_pm.c b/drivers/accel/ivpu/ivpu_pm.c
index eacda1dbe840..761b4d7e1a5a 100644
--- a/drivers/accel/ivpu/ivpu_pm.c
+++ b/drivers/accel/ivpu/ivpu_pm.c
@@ -359,7 +359,6 @@ int ivpu_rpm_get(struct ivpu_device *vdev)
 
 void ivpu_rpm_put(struct ivpu_device *vdev)
 {
-	pm_runtime_mark_last_busy(vdev->drm.dev);
 	pm_runtime_put_autosuspend(vdev->drm.dev);
 }
 
@@ -428,7 +427,6 @@ void ivpu_pm_enable(struct ivpu_device *vdev)
 	struct device *dev = vdev->drm.dev;
 
 	pm_runtime_allow(dev);
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 }
 
-- 
2.39.5

