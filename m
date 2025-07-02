Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077B2309A59
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 16:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751474905; cv=none; b=bsL9fsa4+JBAPgofyQzvKtiqh+447p9ZJqw2+Ie0Lq9heNPvIssjM9D+Q+3zfIBtSzm3s5ux46S++W3q49gAksT1otWEiFNC5rgTx1cBnMKGVm29puTAeVuDPCY0XCYqHLZET9xg75sUC1MmpAtfiTB80TyJHEh5wN63ZMrsJc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751474905; c=relaxed/simple;
	bh=/UhG+PrAWuDRKhnrnXNOPvjeJ896dmbS6DO0ehBJdK0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=avygDeoenCr4/zQa327v8bIJfaOC6beUw6PE0Ci52kcbk6nPoBEVjnf2F+XrTvKtDmE9rFbqhbPiMwjkR8znpTeA9foImr7oh3JSqNYPFfFSHrBrwtEioLQHnBV/au/IJ+PwJQTsVYa+LUKoElfOslMvnssPHtn0CYcH6FTgsIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jD5NprB6; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jD5NprB6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751474904; x=1783010904;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/UhG+PrAWuDRKhnrnXNOPvjeJ896dmbS6DO0ehBJdK0=;
  b=jD5NprB6MIm4GK6r/euCt86fgrZVfoW+L+4qhuU16BvJbM34k5CTidEw
   M3I+YKNMG2FrTH6KyW0pdL0BpXE/msuPnAgFTbfnj5yqODV7tELV2WZS9
   sbRonXuZcFEguLHNjqBSG9OB7Uxf2O1ZoduW/16N88gyQ/L7dsUfa2fOi
   DCGgmEvOzareQPPNV/DKb6CG+qPV3pZlSqzVWkmNH24dJIligefvIakjb
   X1eexxXbbUNVn1X/GfxKqXLJnhAy7v/kHTigffmsoAjvkKz0HmdDbVmNv
   tFwgW4OR2H/ELFD631T4gi85p/9J54Vd89njQr23FYjL7CBYBkOBcUz+y
   A==;
X-CSE-ConnectionGUID: dZLN3yqQTgWeg26JiQWe0Q==
X-CSE-MsgGUID: tQKUWimcRV6v5Objg40s9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="64380776"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="64380776"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 09:48:23 -0700
X-CSE-ConnectionGUID: HfLPk9H5RgC66SksB7ji/g==
X-CSE-MsgGUID: +3JOh8DWQ96JHGtNuBumYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="153535675"
Received: from unknown (HELO bnilawar-desk2.iind.intel.com) ([10.190.239.41])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 09:48:21 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: anshuman.gupta@intel.com,
	rodrigo.vivi@intel.com,
	alexander.usyskin@intel.com,
	gregkh@linuxfoundation.org,
	daniele.ceraolospurio@intel.com
Subject: [PATCH v5 10/10] drm/xe/xe_late_bind_fw: Select INTEL_MEI_LATE_BIND for CI
Date: Wed,  2 Jul 2025 22:22:16 +0530
Message-Id: <20250702165216.557074-11-badal.nilawar@intel.com>
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

Do not review

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index f66e6d39e319..ef3f4807b0b3 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -45,6 +45,7 @@ config DRM_XE
 	select WANT_DEV_COREDUMP
 	select AUXILIARY_BUS
 	select HMM_MIRROR
+	select INTEL_MEI_LATE_BIND
 	help
 	  Driver for Intel Xe2 series GPUs and later. Experimental support
 	  for Xe series is also available.
-- 
2.34.1

