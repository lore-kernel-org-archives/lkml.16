Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F89175A5
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 17:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738688500; cv=none; b=lK3MZTzOAJz7ZBqHP4Z3fM0aUg4KHaG9itS9NiI7A/EQA/OSExTKVcQhqHcXk+KoGKG0+BqYvDyr8vPUIk6RSGQPPJTp/91f1g9J8T3IaMKFh/6u4EY50qA5kCayS7ArspIKmNmNVM7+OYje/XOCxwZBEQgsM2STLVd3zq5bpVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738688500; c=relaxed/simple;
	bh=WJvfMvzLS7mbAAiW0sxsuhIAiVSy3YBvQu/yliPNwKs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sl5wcsa8wadlUyLGceRBLPcWOepfRsXmluzmw2BXq1Pq0eLXRWm/wkGJpQf7SHlB5a3c/p/LTZOCCDnnS0uNZZd2mWi7JreRTyHx0QvuM3IIJ3ODaOWvA7AUASmB0G7t4N6v2ssW+T/lbCC9W7iR2T8cEJBOPWuFA6YVaFoylIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dfRyGPAv; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dfRyGPAv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738688498; x=1770224498;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=WJvfMvzLS7mbAAiW0sxsuhIAiVSy3YBvQu/yliPNwKs=;
  b=dfRyGPAvSGeak/XPDYQZmyzpm4mHPp7nhqARFHYfA1NZ4ZS07wBl/BBo
   uWFheb3/GtVxDpL7Y1OHwnOCnT1zbSxcgb1wdbWyitKjy7lIdxBEPhJvl
   wugAR66V58+Chgb8PJmcYFiVifZuQ6fPLul37YNsBHQSW2peIzn5pkGPj
   xIf8EKlloA7+0jd654W4uYjIflnd9FhxlwFyp0Xmiycg1YlkfkUTl5Yya
   i6ma2lB+lr44VOwQlnUWSSvo9MsNim8tXy4mBkYhbsmcdbQmEIDNtMem+
   UE4kMYz4UY2XxOcWLI8GYLfbUlRPq37IfHGpT3236MSwk1OANoeRP/Fsh
   A==;
X-CSE-ConnectionGUID: oCdYxa5iS5GJ2ULnhLqbzw==
X-CSE-MsgGUID: kR24x4vzT+iq4z4rTdsKbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="64578925"
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; 
   d="scan'208";a="64578925"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 09:01:37 -0800
X-CSE-ConnectionGUID: ahz7DuG+RKKVFAgqjbTpng==
X-CSE-MsgGUID: tOhRJ5BwRsem/1XqWRdsbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; 
   d="scan'208";a="115634106"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 04 Feb 2025 09:01:36 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 10CEC353; Tue, 04 Feb 2025 19:01:34 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] MAINTAINERS: Add pin control and GPIO to the Intel MID record
Date: Tue,  4 Feb 2025 19:01:00 +0200
Message-ID: <20250204170100.48263-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Intel MID record is not listed all related files. Add to there
pin control and GPIO drivers along with HSU (High Speed UART)
and HSU DMA.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3520ce6f9859..095459fbe385 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11866,12 +11866,19 @@ S:	Supported
 F:	arch/x86/include/asm/intel-mid.h
 F:	arch/x86/pci/intel_mid_pci.c
 F:	arch/x86/platform/intel-mid/
+F:	drivers/dma/hsu/
 F:	drivers/extcon/extcon-intel-mrfld.c
+F:	drivers/gpio/gpio-merrifield.c
+F:	drivers/gpio/gpio-tangier.*
 F:	drivers/iio/adc/intel_mrfld_adc.c
 F:	drivers/mfd/intel_soc_pmic_mrfld.c
+F:	drivers/pinctrl/intel/pinctrl-merrifield.c
+F:	drivers/pinctrl/intel/pinctrl-moorefield.c
+F:	drivers/pinctrl/intel/pinctrl-tangier.*
 F:	drivers/platform/x86/intel/mrfld_pwrbtn.c
 F:	drivers/platform/x86/intel_scu_*
 F:	drivers/staging/media/atomisp/
+F:	drivers/tty/serial/8250/8250_mid.c
 F:	drivers/watchdog/intel-mid_wdt.c
 F:	include/linux/mfd/intel_soc_pmic_mrfld.h
 F:	include/linux/platform_data/x86/intel-mid_wdt.h
-- 
2.43.0.rc1.1336.g36b5255a03ac

