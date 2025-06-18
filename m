Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1F52FBFFB
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 18:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750273013; cv=none; b=Cnv0Qiu6MMNLSLHdZ1n2+YN23bUqizjlk0G05Po59PrV8vtPt0hkNqfp+pC0TJDdy5cH4PYrMvlVG4b+VuvMTYeZkNogloO9kKcQUSmqCkhQbFVMMtWkt1fvabMccOp6cPVt6QrbJlK+kP55B7sSXh6x+7gUqflygoCsujOv2U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750273013; c=relaxed/simple;
	bh=X+WyNxNuM0Q4IQ8urTprc524L7zLkn5i46sj2rLJYsY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LSYmcjZY+6x1TteKiyle/mATn/sTP/zfR9Y1g2awdGqo94/7GOpzdQZVB8ZrlHp4cQz4JYGO1spgR53wmYFHD6NQqRNgRlHwmYybv0hP/cUqU2GjJaYyd6tzfM+j5WLqr1QpGGcWPCwDBJDXef5ma3MM++VS3gQSZv7D2x2zmz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n/11fzey; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n/11fzey"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750273012; x=1781809012;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=X+WyNxNuM0Q4IQ8urTprc524L7zLkn5i46sj2rLJYsY=;
  b=n/11fzey02Swycg8IbEptMS31cRIjdY9hjCIvrPgLRNOL6NwxsQubXWe
   RhDQOP+xvi8x04dCGNrOEzYcoBePNz2H3cIjPpCDzEbznDo3Zgdgjajtf
   kg1ygSZZ+bOR1IvU7zoExUIINHJJdOul11rZz1LkYjygzLaXcIs7dC4XK
   Us7otr49nLKFX1XOuJ60HYngD52Cz7MupUWEgiZGmf2VAYJtRXpi1d2LH
   RH4+a3mxmIDoKAvKF69jnFeriUsTbIAY7F5Fe2MPhkBe3ZjGCLHD8SWpX
   Nm5RQotVJFc/LeWrmZe/jqr2d0sdajSxsh0VjV1Cpt6SczChWIQvlSViI
   g==;
X-CSE-ConnectionGUID: Vwhu62AARGm3aXMA/59n6Q==
X-CSE-MsgGUID: m6Zqq2XaSF68sSk8Z5Gv2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52210214"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="52210214"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 11:56:51 -0700
X-CSE-ConnectionGUID: RLF7miY+QVaa3v145XwDbg==
X-CSE-MsgGUID: e9Fzr2XfRdW1VkPp1kfWhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="153951931"
Received: from unknown (HELO bnilawar-desk2.iind.intel.com) ([10.190.239.41])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 11:56:49 -0700
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
Subject: [PATCH v3 07/10] drm/xe/xe_late_bind_fw: Reload late binding fw in S2Idle/S3 resume
Date: Thu, 19 Jun 2025 00:30:04 +0530
Message-Id: <20250618190007.2932322-8-badal.nilawar@intel.com>
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

Reload late binding fw during S2Idle/S3 resume.

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 91923fd4af80..6c44a075a6ab 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -205,6 +205,9 @@ int xe_pm_resume(struct xe_device *xe)
 
 	xe_pxp_pm_resume(xe->pxp);
 
+	if (xe->d3cold.allowed)
+		xe_late_bind_fw_load(&xe->late_bind);
+
 	drm_dbg(&xe->drm, "Device resumed\n");
 	return 0;
 err:
-- 
2.34.1

