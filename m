Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142832F50A8
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 16:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751474896; cv=none; b=tuUmIy8wM7WpgnQKPz7bnBG3iOlAazz2hS06nwp2zqUWtCo7ExdT2iMfCn2Y8FW9n07oURMBpgpjMpnSIAPTQqVWVcAQjunU9GALErMa+vcWlrw4v9vLmWJDLamN7TMm2UI1levfa7Jl38Oza7jMP5rGuGwHsEaebmk/Frh6AZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751474896; c=relaxed/simple;
	bh=26ZVxTovVWawxfzohxN6Dj9Di2Irl9eXzKpJdB1Vttc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Y8I/PPYLhFY96x6PjtmhHvvceE9at6nUlwJHDUmIlUUiiWlojGmboF/m1hFB7KU9iT4+C60e9pe48znJxFQd1U0ccHs9hekK8x3hXNoUAUC6yaAjZhlBkXZbgkV0wqjB9rvGoIaZUAPCB5tEkfSGiHNcKJ0WLZeWHCv8hP8I+hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xz2FQhfI; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xz2FQhfI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751474895; x=1783010895;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=26ZVxTovVWawxfzohxN6Dj9Di2Irl9eXzKpJdB1Vttc=;
  b=Xz2FQhfINtfKUxsgah/7kYNBmFOsInD+YO363yM/PMnRJlQEj5EtRYQQ
   lSStm6CUFnMGMg5P12NLGtB4qxJ2qz4+1MIhcmq3ljQnjXGITTudwsMRl
   kD7KqSlFmFVBlXiReRRrJKxAYvf6HBMjIZ3JM8gCjbk8OG+LLat+YoH4j
   hvEd4AxEH42MwcI8BQOHk2GGYdF1cNIoPFXvP4b/6oOOtlh8BzHb8UxRS
   FLUPstjzuggdRK6ulZKqu8OpEMVQD3hv3MfeSO37qU7GHmv8+NRfcyLFv
   no7BK9UaBmJoY6iwEK6TFxmLDcEXT6MqFl2WsE7exz5P5eDLd8GCibXbL
   w==;
X-CSE-ConnectionGUID: shkZ+7DzTr2SFGhVeTSxyg==
X-CSE-MsgGUID: L65+dIzUQ9C4SMdkKF12ZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="64380762"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="64380762"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 09:48:15 -0700
X-CSE-ConnectionGUID: Azh9/9f3S1aOdzXeux1MAA==
X-CSE-MsgGUID: pUtmIEB8RYGhOVDVOXH/7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="153535628"
Received: from unknown (HELO bnilawar-desk2.iind.intel.com) ([10.190.239.41])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 09:48:13 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: anshuman.gupta@intel.com,
	rodrigo.vivi@intel.com,
	alexander.usyskin@intel.com,
	gregkh@linuxfoundation.org,
	daniele.ceraolospurio@intel.com
Subject: [PATCH v5 07/10] drm/xe/xe_late_bind_fw: Reload late binding fw during system resume
Date: Wed,  2 Jul 2025 22:22:13 +0530
Message-Id: <20250702165216.557074-8-badal.nilawar@intel.com>
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

Reload late binding fw during resume from system suspend

v2:
  - Unconditionally reload late binding fw (Rodrigo)
  - Flush worker during system suspend

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 734fe259600e..13afaf97d831 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -127,6 +127,8 @@ int xe_pm_suspend(struct xe_device *xe)
 	if (err)
 		goto err;
 
+	xe_late_bind_wait_for_worker_completion(&xe->late_bind);
+
 	for_each_gt(gt, xe, id)
 		xe_gt_suspend_prepare(gt);
 
@@ -205,6 +207,8 @@ int xe_pm_resume(struct xe_device *xe)
 
 	xe_pxp_pm_resume(xe->pxp);
 
+	xe_late_bind_fw_load(&xe->late_bind);
+
 	drm_dbg(&xe->drm, "Device resumed\n");
 	return 0;
 err:
-- 
2.34.1

