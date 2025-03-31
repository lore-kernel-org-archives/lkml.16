Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6853F9CB
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 07:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743405300; cv=none; b=dCx3XAGJwTFm/xQ7JN0pssMZiz/pYCuDIRheeWaw65grGejbwS2Q78ZwRdTg1VNQUK+BbgE42df0wb7X4AJCUkV1s/JtIv5yFJc6HapgGout2OiOluySmw4BATkK7Lo+7Vg4C4Xk7lMCpE4I9wzTHetyEUfm6AP+qgc+zg/jupA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743405300; c=relaxed/simple;
	bh=S9PLDZwlG5H+w+pVSMdCcSg1mFwcQbvBvxpNPhwVhLA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QtYZvA9cKznS0bXE2grRR5TQTwmUWxF4RgP4vCBcJQI0Y7IZqobjwKn0NLX/sdO4+aWwbWbF9ryzigJw+0C0YVAxHJPSaVKlOxuY5J0ypLUfzfcFZAP208HBGvCIgzJzL2oWp9ViyY4MeuoXnzX8UN1LI8gmWgFkBK/OnyaJZu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d2S5QZcg; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d2S5QZcg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743405299; x=1774941299;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=S9PLDZwlG5H+w+pVSMdCcSg1mFwcQbvBvxpNPhwVhLA=;
  b=d2S5QZcgHRcbNy8A8FBxs74UUR2HYIVP8MrWA6V0UKcamPx3u+W+T8ca
   y3IL6T8mCB7HYehf6et5bL/2RN3qXiLLOnpjXTkp2xwmAHn+te9U0jo4e
   hfA/F991S51n7aXvjU1NOpxbxlH0AuAGulYI1aO2rzecKcOVo7TxLHcwQ
   DtIATDLKFf2bVrOCEYad9/vCnIpXdf56oBn5xHhF2mEq6EhNIsiK+PNVn
   02rZ3rBzMeNnHCRuyinAQvAPYDaiKyu6zOb2r8Tsu64vf3p/7UtLwVwOr
   JjUD6AISym8A8jGB3jgXYC6zUipDz17uMkprzghWoYVikxB+kC2qYSK0X
   Q==;
X-CSE-ConnectionGUID: mkgPBX6ZSmqLZiz764b07A==
X-CSE-MsgGUID: o3udL39QR32lumROi6twAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="47405486"
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; 
   d="scan'208";a="47405486"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 00:14:58 -0700
X-CSE-ConnectionGUID: LA0GxrAORYSgJ6o2AYSWww==
X-CSE-MsgGUID: oMQXemDARSOWSW/dU9e+3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; 
   d="scan'208";a="126919645"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa008.jf.intel.com with ESMTP; 31 Mar 2025 00:14:56 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 4CECF1B4; Mon, 31 Mar 2025 10:14:54 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] coresight: cti: Replace inclusion by struct fwnode_handle forward declaration
Date: Mon, 31 Mar 2025 10:14:53 +0300
Message-ID: <20250331071453.3987013-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The fwnode.h is not supposed to be used by the drivers as it
has the definitions for the core parts for different device
property provider implementations. Drop it.

Since the code wants to use the pointer to the struct fwnode_handle
the forward declaration is provided.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/hwtracing/coresight/coresight-cti.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-cti.h b/drivers/hwtracing/coresight/coresight-cti.h
index 16e310e7e9d4..8362a47c939c 100644
--- a/drivers/hwtracing/coresight/coresight-cti.h
+++ b/drivers/hwtracing/coresight/coresight-cti.h
@@ -9,7 +9,6 @@
 
 #include <linux/coresight.h>
 #include <linux/device.h>
-#include <linux/fwnode.h>
 #include <linux/list.h>
 #include <linux/spinlock.h>
 #include <linux/sysfs.h>
@@ -17,6 +16,8 @@
 
 #include "coresight-priv.h"
 
+struct fwnode_handle;
+
 /*
  * Device registers
  * 0x000 - 0x144: CTI programming and status
-- 
2.47.2

