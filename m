Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA452356D9
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 15:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750952639; cv=none; b=DNlugJs5ZxZ/miQNyT6uPr9oxhB78CzKyx2YsdC6t2UayqLktMVc2XY2lLk6cXsPvFk3we6LTFo26p3QSfEfQQKz1SuWQqY0L4moNzofDOotATa6yYAlw82eZLQhH/M4G2dkSxbWvoH5GwgKrjaaY5tWN4OFXOBLuc33iIoZNSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750952639; c=relaxed/simple;
	bh=b5lcKs9aOPMXhuRIKGEgNsvkUABvdeSf7Xfh1pdtv5U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ak2IV5P5lXQZXFeHbkVeJEr9DyVGQU3bBTPAhvbhATllp40zB1ed1CbjCwZPrKdPKaaGM7gd6jzeFVKuoD9sIcuzideTRTJ/tGEDP4oKc9T7OpzH0qsqVyKFG2eA74KRc0W67v5AgLpdzyvbgtd0c02oBynTppWBfYk6leXVnpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HNoUup7q; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HNoUup7q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750952638; x=1782488638;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=b5lcKs9aOPMXhuRIKGEgNsvkUABvdeSf7Xfh1pdtv5U=;
  b=HNoUup7qRZbvDY7OMeSAxJVJwFAXf/AUHhjKhpUZ2h1Ax+JTJrQbOy5H
   8OcxMTzS+0dSqSmLihyfd9Fg+an2pBAMMGpiH9qM6Inxok5co91XicL1l
   rZT9deBAAl4HY/Q9AyHik9K1iqM5cLTVOTXCxViZ2iVuHRJ8VW/0Itkzn
   xEk6fBDmsIfrmx1oGr3OuiI3/mM79NginIN71FHGdEw8T4CUHDWGk1fbd
   GxjJpGoyBlmUBLqmwjfQcsAJtbo/EQbpjqXqsq74FRXAWSCw7mzD3f+C4
   iOl+9llcBEp6e0lH/baJPMRYOdk0EmFgQxsTkJzZJKdXe4wA6swXbh5+9
   Q==;
X-CSE-ConnectionGUID: BkJYxPHUTfObf84HKIWvqg==
X-CSE-MsgGUID: BH6QiyOfR6mmokCxIx076Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="57064317"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="57064317"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 08:43:58 -0700
X-CSE-ConnectionGUID: VMu0uuBZQ6SEEPpItui8Vg==
X-CSE-MsgGUID: K6hX7waQTeq1CN+ZUp3Nig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="158048384"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa004.fm.intel.com with ESMTP; 26 Jun 2025 08:43:57 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 874512AD; Thu, 26 Jun 2025 18:43:55 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>
Subject: [PATCH v1 1/1] mfd: davinci_voicecodec: Don't use "proxy" headers
Date: Thu, 26 Jun 2025 18:43:54 +0300
Message-ID: <20250626154354.324439-1-andriy.shevchenko@linux.intel.com>
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
 include/linux/mfd/davinci_voicecodec.h | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/include/linux/mfd/davinci_voicecodec.h b/include/linux/mfd/davinci_voicecodec.h
index 556375b91316..9acd703dd5ca 100644
--- a/include/linux/mfd/davinci_voicecodec.h
+++ b/include/linux/mfd/davinci_voicecodec.h
@@ -10,11 +10,13 @@
 #ifndef __LINUX_MFD_DAVINCI_VOICECODEC_H_
 #define __LINUX_MFD_DAVINCI_VOICECODEC_H_
 
-#include <linux/kernel.h>
-#include <linux/platform_device.h>
+#include <linux/bits.h>
 #include <linux/mfd/core.h>
-#include <linux/platform_data/edma.h>
+#include <linux/types.h>
 
+struct clk;
+struct device;
+struct platform_device;
 struct regmap;
 
 /*
-- 
2.47.2

