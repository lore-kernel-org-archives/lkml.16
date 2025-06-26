Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2AE32EB5CA
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 15:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750951393; cv=none; b=koL8R83MbTVdY8Zj9ki75dsr8gTHgLL9gXXt9xW83B6fWUprUvsf2y5V6JjeHH8CBCzhWiu+VJ12GREdBYD/qadmMOoYGx5CyFQyOf5QAW746deva1kZirLJ88HvuZcB/q18lcPuzAghUjM1Gb+VxNlGgnQTfWUaqXdfGBdV6Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750951393; c=relaxed/simple;
	bh=i6XIwfrmqqyD44a9t3N13e4CHHC6SNOoZlcuVE+DCxo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QBKY90BrVijEC8GTSJE6M8TWEBd66J+dXninzCsqYlsp+r19z4euREK9a6wRyzIv5zDsU8kfBVBKc348Ow3ERIEFuwR/cUhFAgzEtDTMVdn70y948Eq9/mG36raPgLyUNnsoYlEQRPw7VWyFzIIw0SjpTjV7ihmjfquHmr6/wR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VGjr12/6; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VGjr12/6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750951392; x=1782487392;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=i6XIwfrmqqyD44a9t3N13e4CHHC6SNOoZlcuVE+DCxo=;
  b=VGjr12/6dPR+Hv2wPLqs8aQt1WHcyO4uIAjTg+uSNM8RaGh3fY3Wf2Io
   EuVin58iNx+TJGAJpbSnlZ7QH7TpXWCupEVAg+l0T8HCiFlfWdedky3Bw
   ThGoNPLdL2oQRcAhuWdha6TvIor6QOhLyJTaZFnpMhrupXS/S9wCL/W/f
   Vcmg0n+5d4mP0czVC9MjyMt+2LyfJO2309wMzOUBQ40mUxUgN4s3U/ZZD
   mJRj9yAouA5gi3ly8DR9GiGJ6lmjzA7xZx+zgigiYPZFbm8tIj3rQReiW
   c5AXMR5iA9+rYoE1xsKzM04NBFGYZhe+R+SdFyTBlk7cDdeifnoOQTAch
   Q==;
X-CSE-ConnectionGUID: Mw8R3pFySj+GQ12XXJkG/A==
X-CSE-MsgGUID: KWif+pxYQaiTRiATudQTSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="53194155"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="53194155"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 08:23:11 -0700
X-CSE-ConnectionGUID: ztUFUrDURcCBnFsHryDMDQ==
X-CSE-MsgGUID: 4/ntBjmaR7CnoOBrquX5EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="152169075"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa007.fm.intel.com with ESMTP; 26 Jun 2025 08:23:10 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 81DB42E2; Thu, 26 Jun 2025 18:23:08 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v1 1/1] regulator: core: Don't use "proxy" headers
Date: Thu, 26 Jun 2025 18:23:07 +0300
Message-ID: <20250626152307.322627-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update header inclusions to follow IWYU (Include What You Use)
principle.

Note that kernel.h is discouraged to be included as it's written
at the top of that file.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/regulator/coupler.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/regulator/coupler.h b/include/linux/regulator/coupler.h
index 73291f280a23..5e314a4294fb 100644
--- a/include/linux/regulator/coupler.h
+++ b/include/linux/regulator/coupler.h
@@ -8,7 +8,8 @@
 #ifndef __LINUX_REGULATOR_COUPLER_H_
 #define __LINUX_REGULATOR_COUPLER_H_
 
-#include <linux/kernel.h>
+#include <linux/errno.h>
+#include <linux/types.h>
 #include <linux/suspend.h>
 
 struct regulator_coupler;
-- 
2.47.2

