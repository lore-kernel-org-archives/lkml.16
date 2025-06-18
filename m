Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A692F948D
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 18:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750273021; cv=none; b=onNsbr1zFNrUzRDKIgt9hAy04AKrOlBTIGGYz5D+gRDsoaI6QpXMKdTidHzBpNurSpy8aufmfSQl3wUK6xKpKqauMl8sP8b97z2pVHTRvJHzGqH+q2cWrjwr9QYTauxp1GIBHz+e2QJ6bHSZu7zUVExBwmpp34U8BxsRHBBH/mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750273021; c=relaxed/simple;
	bh=wBhqdHFT6q92MdaZKb3oeHHxeJu1lqs/E+7CU/KnemU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=J5BYijtEgtzwySM0mvvj4zsuJQ4aTsBcQsF2uWfZNkPJQmiFx2CiGl9fbrMNo2w4vBTj9zFk2Gi0TT9VQzE6zFfaL/n21cPDb4Eepho5+Gk9xqOBkJamK93UOznBKvwNAJUTTk1STdbXCA1omy2GVQrMnagUwTrmVglUoVAJR2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VPGDRFxz; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VPGDRFxz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750273020; x=1781809020;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wBhqdHFT6q92MdaZKb3oeHHxeJu1lqs/E+7CU/KnemU=;
  b=VPGDRFxziDKV2sDWaupmmUN8JNMPaN7LZoYRJvHwAorbT4pkWNkX+ozi
   Cdouf9Q7jI4DwAq3/cMCF/aTb5ByhLkuiOSH9K2tP6uL0YHLwoEsZVwRv
   JHsUvhXpwozZfqTDLkFEJvvOixhLsvEv6J+vpeoDmtM6EYMC9nxaVQ2kU
   tJJ3GsnXE2heQV+sBdlQtfbHfDcaDnuH2g8nGcFQs9jh40Hy9Q9NUL+b0
   2mEywGYFqqJ28Lw4tXdN7JJjrYz5bvHL1f3X8YaISiV/5ZHnM0PefWH2O
   PfKdq5QXprCZBsOmPKgj54o5jeY0N2S3Afn602dDu4QyhEzHDVLJNkwWX
   g==;
X-CSE-ConnectionGUID: 3BbSVN7OQmqNGap+8JcUYg==
X-CSE-MsgGUID: j3vU0LqiQdKDXdKj9ZAyIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52210231"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="52210231"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 11:57:00 -0700
X-CSE-ConnectionGUID: YA/pEJfJSCm3aBMB9JG+MQ==
X-CSE-MsgGUID: y8jRlaalRlyeXScKPUB1Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="153952160"
Received: from unknown (HELO bnilawar-desk2.iind.intel.com) ([10.190.239.41])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 11:56:57 -0700
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
Subject: [PATCH v3 10/10] [CI]drm/xe/xe_late_bind_fw: Select INTEL_MEI_LATE_BIND for CI
Date: Thu, 19 Jun 2025 00:30:07 +0530
Message-Id: <20250618190007.2932322-11-badal.nilawar@intel.com>
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

