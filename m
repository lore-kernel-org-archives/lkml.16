Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68662F8C35
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 16:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751647598; cv=none; b=r10ml2J0ZLz74yIIue2CiajUs71roUXXbReu0sZJlnEuQVAvAnaFKbSu2RBMRifq17y1Bsqu9RPC3vhmg/GQtI7lgAKud5zFJfk3QuDJCflHyj/1M0/clmzWZJtwfwhwuFbCPx8xjIfcI2+ifjQ/dtAgP1yWf4tzg//lsttyIis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751647598; c=relaxed/simple;
	bh=IlroywlKbJTxbgFXfvixBNi1PxBQUvaIHsJkVuBe1aM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Qy6w3s7lZ2yH9rUJA+TkJw01/79gAeGr0xCr7qBC7O+dvoHj8OFSP7Ik3SsIUh3/UUdc7wV3+XhjHe8dU7APKiDnaOz/V5BsahsQnZL3RRQls/vyz5HNzwYi3Aspd4rgFO5ObOktwnMXOQcYyYpX3kk5NhnwTZQ9PzhUXDHeAks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ejKO+aLG; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ejKO+aLG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751647597; x=1783183597;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IlroywlKbJTxbgFXfvixBNi1PxBQUvaIHsJkVuBe1aM=;
  b=ejKO+aLGANbQrKCaMxiULS6hAvdfNO52Vqe/o4SxUUYG9YYLgAMyZI+l
   mVP6xgS5XA4eYHVM2PPPTXirehQgJ8kZNP/aQFAQVuqqMw+lSgm7KsxqL
   UeSkQnLpb4KeWAD3udkg2vsxEDY0wf2nqKEOlZuflp9A/gavzHbOylAVy
   +JR3ehpt2CTY2hcXecgOl04yui78VmcHWrEYRDt2chDbFAQyEQIUQ4wL3
   feM8GuPGisPrvgcR3XcEPQLSghXB1q65hDJzAlI+HKoRaAkDar05kyIXn
   /vK5CkSzRBWYr72UVsVts3LovtOqIX2jwXbTLa/Q++QIjjoyZ5uJQ5s/E
   A==;
X-CSE-ConnectionGUID: kvsv3ppQQl2n98bzSw1XuQ==
X-CSE-MsgGUID: cByZoZa4SYicW2MZQc1X3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11484"; a="57755802"
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; 
   d="scan'208";a="57755802"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 09:46:36 -0700
X-CSE-ConnectionGUID: sfepZw5SSQifL1zEGSr6/A==
X-CSE-MsgGUID: JeyJguHKTs6UO5UFJbmD2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; 
   d="scan'208";a="154424725"
Received: from unknown (HELO bnilawar-desk2.iind.intel.com) ([10.190.239.41])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 09:46:34 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: anshuman.gupta@intel.com,
	rodrigo.vivi@intel.com,
	alexander.usyskin@intel.com,
	gregkh@linuxfoundation.org,
	daniele.ceraolospurio@intel.com
Subject: [PATCH v7 07/10] drm/xe/xe_late_bind_fw: Reload late binding fw during system resume
Date: Fri,  4 Jul 2025 22:20:35 +0530
Message-Id: <20250704165038.1464460-8-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250704165038.1464460-1-badal.nilawar@intel.com>
References: <20250704165038.1464460-1-badal.nilawar@intel.com>
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
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
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

