Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A952EACF4
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 16:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750870620; cv=none; b=VgI7Q1lTWgEIZzd42cqM6q0yZrUJaUPNCD7CxFmme+1b95yYJwnx456F96vobeQea2CZpcorVf9n5E7RrVzepUhTXGaWfcQSymQN1pfDA20eFVA/GlD90vrV1pGAlJg+x6b/nmZA3B+13kFVVNDhZtzyfJTeP0FZepvj0PsOBz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750870620; c=relaxed/simple;
	bh=KOQQsCoE0oqkeAm/Y0aoPQ+O5D3xfSmk4KxH6jeeGRY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BNAxUSyT2aixrpP4Ap2j3StmooqEkWkqkEbu1a89xQ+7ijWMydLiomLswSm7Yofpu54KjpfK/1DVktn6RCbutv95AhXddMcWig9Jd9rsGVMtCvLVztBTO3TWWvVmXSH96/l3KWiBc4bWzx0Xa8ZiHFhERX/rgkY3r/jAD7PShEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lEE6cOH3; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lEE6cOH3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750870619; x=1782406619;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KOQQsCoE0oqkeAm/Y0aoPQ+O5D3xfSmk4KxH6jeeGRY=;
  b=lEE6cOH3VtYlMZK8lCmPvrT2wxKKIOqnc1G0NKeKFBUCza8L8Dx2qop7
   z2MfVs1JkMT8D6/ty5jFU0J9t/UeRwmZsCLlH4ZNiiO3vxPXiROJcSyee
   BnGBUQBZv6MlkIM+Qflq/CIplqxp7/dWV9THVB5dSJcDKKVaDy1e1SqYj
   be2LWvGQ5JdPDfrvWO7lQ48O+JSZfjfrsXg+pVjQ3ZyRqDgMu2LnocY8w
   L7BK3w/zLC5cg5hpboSkM3x8eq7PI1jsbywR5tfMMtpcC1VDliP7aoro1
   oOpYpE89Ywae7aqhUJPP+Tr4vOoo2Mk8W96k9YvX//xRJGPCagqsc1LyJ
   g==;
X-CSE-ConnectionGUID: 4/UH5f2gR9+lUg1uyrriQw==
X-CSE-MsgGUID: PkoeotfeTsO1oEcurrplgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53214457"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; 
   d="scan'208";a="53214457"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 09:56:59 -0700
X-CSE-ConnectionGUID: 6xHZ9QIXS+aLcdDHtaz0pg==
X-CSE-MsgGUID: gHz9xzKtR1CzDvLpoKgVnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; 
   d="scan'208";a="151696709"
Received: from unknown (HELO bnilawar-desk2.iind.intel.com) ([10.190.239.41])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 09:56:56 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: anshuman.gupta@intel.com,
	rodrigo.vivi@intel.com,
	alexander.usyskin@intel.com,
	gregkh@linuxfoundation.org,
	daniele.ceraolospurio@intel.com
Subject: [PATCH v4 07/10] drm/xe/xe_late_bind_fw: Reload late binding fw during system resume
Date: Wed, 25 Jun 2025 22:30:12 +0530
Message-Id: <20250625170015.33912-8-badal.nilawar@intel.com>
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
index 91923fd4af80..f49b7b6eab97 100644
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

