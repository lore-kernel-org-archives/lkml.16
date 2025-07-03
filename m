Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9FE2FBFF2
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 19:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751570825; cv=none; b=etuKyUrsvKHcqh/NZ6CuFVel6RnBxZcOsKNpMUR/dw/Agaf/MS79PNhrlnciu2QOH5oYbjikpsi5a+dmb+JlPEALtnOIpAVlZkqJdOibfI+08129OmRTRN9WqaFODqkcWYoVDTRjXhpcyRbncqJLVYAdjEu5fjHhiFX16+8zhjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751570825; c=relaxed/simple;
	bh=IlroywlKbJTxbgFXfvixBNi1PxBQUvaIHsJkVuBe1aM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VBKr8MZ81+MJzeiLiZIP+EShDAAiqEMDuafY8RpBCLLPSYykVvocdcsyJix7uE/sQSYkEFJjyu8R54cTp6Qrx000QF/BlaUa+M91+tYOBg61Ni97xeIH4POsnHjhlg+09mqligcxDO1JMKyNeU4QRD1YhOhEB91fmvLuhs/EWGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AiMdVhIN; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AiMdVhIN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751570824; x=1783106824;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IlroywlKbJTxbgFXfvixBNi1PxBQUvaIHsJkVuBe1aM=;
  b=AiMdVhINlsF9vV8PtO5Ub1URz7ke4X/oAOLgVQBqUi4lO5xElSUiOQzc
   CuFXqRrq4KcvRYbrlEHvMpQQRe8SnLnJ1zou4HiBnoY09roVPU82pd5AC
   SoX7rOoUulPfefoFMclB5KFDHQQHGTp3OOUC+km1ORgYHq0aH4cRlyhOQ
   8rOkPH/At4JKaNbbBhF8U97Ajh8SkqeURXd2j+0h7LvjghcYASqi2SFNZ
   YvFIlLL9Cukowtjv2wveIqOYJefyU23ZmyPV8+Uw1FnQx26HSD8JnRqsE
   rcVVczHC/5ETcDEhq2xFsgX6YrhAy9Qzm7Wg6H3WcV6X/XmMN8lsuTrJw
   w==;
X-CSE-ConnectionGUID: g8r1wHSNRGq9XWApz2Aq+A==
X-CSE-MsgGUID: c4JIyxO2TWmcn1pgfBSD2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="65362014"
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; 
   d="scan'208";a="65362014"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 12:27:04 -0700
X-CSE-ConnectionGUID: Ot3QpFn2QPWjwczOGpdDBA==
X-CSE-MsgGUID: 9k49KdGKQIuEI1z7vnArxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; 
   d="scan'208";a="191624662"
Received: from unknown (HELO bnilawar-desk2.iind.intel.com) ([10.190.239.41])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 12:27:02 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: anshuman.gupta@intel.com,
	rodrigo.vivi@intel.com,
	alexander.usyskin@intel.com,
	gregkh@linuxfoundation.org,
	daniele.ceraolospurio@intel.com
Subject: [PATCH v6 07/10] drm/xe/xe_late_bind_fw: Reload late binding fw during system resume
Date: Fri,  4 Jul 2025 01:01:03 +0530
Message-Id: <20250703193106.954536-8-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250703193106.954536-1-badal.nilawar@intel.com>
References: <20250703193106.954536-1-badal.nilawar@intel.com>
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

