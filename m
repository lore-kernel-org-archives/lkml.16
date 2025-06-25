Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854402EE26A
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 16:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750870628; cv=none; b=YC1J6NCcgfGVeCkmnpYcfFnBDvmKuKjiv2Jf9tYEvNToDr6JIvfkFdVneiOJuP7XU0BiVxyL+hRvQnIVqLg3gzBk7T78I8CTIiKZcAkEWNlod50ToJrqrFeQIC09ZXOhlZ+1H6Pk4S4nswJPbYjjPknAuuf36B721qeT8Y/22fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750870628; c=relaxed/simple;
	bh=wBhqdHFT6q92MdaZKb3oeHHxeJu1lqs/E+7CU/KnemU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rpWaPlNQ2Vv0OB6fPdQQNkTKjX6AU8aWK7P9/+YG1kGtasAnmr5S3HRWWe/qmj+vUH9a+XaS6KlOjM28CKMULVCY6+BuC37GY+0bykXWWxYfnaDXOx++qjORb9H/IzCqL/Hczo0SFKCCVXboAak96Uxu+eyfsl3P3YiB63NsZLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mNgLB8Ds; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mNgLB8Ds"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750870627; x=1782406627;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wBhqdHFT6q92MdaZKb3oeHHxeJu1lqs/E+7CU/KnemU=;
  b=mNgLB8Ds2bQQs4PRPvP/CvxKXLcsQqxIgP92RizEQYzIRMyYkTifpe5y
   gnUgf9FiZql14xEsgCaTePt4Xx1XYaJvzpZ9ULDA1fZdryp/QpnK7DacX
   o5o3vJzbY1Vy568WIoI63oQwhRyad/k3F818UJusDWtIV64fBuH0ovZz1
   UbjT8Yv+Ftv5EgKIGxjvBOWmHn27aZCPeVlRZ+XDlxCD9USZQvVN0G08a
   /jFUZHSsHNfyzkXfg1lJoqCWKaeQpJiH13OPsq9M7/LtBWoEwIWD9FNUJ
   Mh4w9ebF9CMKjHyI+LLG8vYcOlNjjbNth6h9vrLlQZLT1GB81CrqWJcfn
   g==;
X-CSE-ConnectionGUID: yDV8OeL1T5WQXEWXpKV1+A==
X-CSE-MsgGUID: RoCu3jsiS0G+9lu/8A1aJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53214467"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; 
   d="scan'208";a="53214467"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 09:57:07 -0700
X-CSE-ConnectionGUID: 3X4X4U68Ttq5Zj9Z5nIKSw==
X-CSE-MsgGUID: TapVp8apSniM0HuyJr/5Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; 
   d="scan'208";a="151696740"
Received: from unknown (HELO bnilawar-desk2.iind.intel.com) ([10.190.239.41])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 09:57:04 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: anshuman.gupta@intel.com,
	rodrigo.vivi@intel.com,
	alexander.usyskin@intel.com,
	gregkh@linuxfoundation.org,
	daniele.ceraolospurio@intel.com
Subject: [PATCH v4 10/10] drm/xe/xe_late_bind_fw: Select INTEL_MEI_LATE_BIND for CI
Date: Wed, 25 Jun 2025 22:30:15 +0530
Message-Id: <20250625170015.33912-11-badal.nilawar@intel.com>
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

Do not review

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index 30ed74ad29ab..b161e1156c73 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -44,6 +44,7 @@ config DRM_XE
 	select WANT_DEV_COREDUMP
 	select AUXILIARY_BUS
 	select HMM_MIRROR
+	select INTEL_MEI_LATE_BIND
 	help
 	  Driver for Intel Xe2 series GPUs and later. Experimental support
 	  for Xe series is also available.
-- 
2.34.1

