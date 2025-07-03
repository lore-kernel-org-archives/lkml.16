Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317C22FEE2D
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 19:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751570833; cv=none; b=hAyEwx14yD2QZ7sw/xcYdRdngG4MKAFoAQ0bpwd8sDbeZWkNGtMmDGCVGziNY/ddDs+DGHuRQA7tUJ3LkgLi6uQ2JsQpWpCl1qLB89nms8rMU9gaxcXQCYdLmy9ZF52GE7o4jp+uTMIJu5hHKin9XNX4v02YyyTjciPh8eTkNr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751570833; c=relaxed/simple;
	bh=/UhG+PrAWuDRKhnrnXNOPvjeJ896dmbS6DO0ehBJdK0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GaOcUHOVeHjr+a0aCLoc0+WXV86MrcLjmCpxw5g5Gd4cP4Ao9mxwV+x/GJlpl7wkHYJcHxQv5XFRgZ8jT4mbVnUuMscbpl76AO+Ofn8QeMArS/53izgjl1yJ+Ergbmvl3CxicDquBAKhLTM2L79XeaB2guXh30SFIbnN2gffuIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jOFYgMlT; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jOFYgMlT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751570832; x=1783106832;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/UhG+PrAWuDRKhnrnXNOPvjeJ896dmbS6DO0ehBJdK0=;
  b=jOFYgMlT3mfdL+Tje39jqaac0hvoykRrAZ0pIJZ6DD4p8txTTVDDZD4X
   iByLwqQ81EcQHIT5njOXfKipAFl4eJ4saw2Dl4MWPWI4zz2fiFsb5H5Sg
   BlTQhGupAkkwtt/V0JUtQwlSrwNa9zz5Is2iamAvwBuEMExh3kTeCU+cq
   a5x8XbTJ4Q0/XxUArc7LKfowjBuYISPtZGNC+Q5uass2N5spjnudc1fdG
   mDIaUZKJSwdDPRUgeAmR6m0mbXlbx/XZIOTHG/9feUBcmtKoixtUok3Pn
   iCIyWJJVQJFH1OzgkAJPDirk5fiTkhyky0aQkSFwtVj3OdmM0wj4fqI/o
   w==;
X-CSE-ConnectionGUID: f8/VQb8nQHqzdHEFIyLkbg==
X-CSE-MsgGUID: ZHkvdTSVTby3hSQ7rwyhpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="65362029"
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; 
   d="scan'208";a="65362029"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 12:27:12 -0700
X-CSE-ConnectionGUID: 8IbSuC9IQ2COae91Y/TvkQ==
X-CSE-MsgGUID: IXhIDOK1QX6M7FHkEc6tAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; 
   d="scan'208";a="191624698"
Received: from unknown (HELO bnilawar-desk2.iind.intel.com) ([10.190.239.41])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 12:27:10 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: anshuman.gupta@intel.com,
	rodrigo.vivi@intel.com,
	alexander.usyskin@intel.com,
	gregkh@linuxfoundation.org,
	daniele.ceraolospurio@intel.com
Subject: [PATCH v6 10/10] drm/xe/xe_late_bind_fw: Select INTEL_MEI_LATE_BIND for CI
Date: Fri,  4 Jul 2025 01:01:06 +0530
Message-Id: <20250703193106.954536-11-badal.nilawar@intel.com>
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

