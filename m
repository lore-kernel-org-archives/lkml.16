Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73469217651;
	Mon,  7 Apr 2025 17:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744046545; cv=none; b=civdrQ9v8csxZrLstIq9xn5RVzsoTAR5u9m0mEvFpTrOFvm6R2lOuIJSW3ZZHNgIW0+NHcDEdbbJs+7Vv7XcAf7xbSUQfTBJY1yF647fcr3AqSZ6BndVae3hT/6/nInmDu0l0GVyMpchk9YetjYrbTTl5UgaEHXC5W7p6c4pSxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744046545; c=relaxed/simple;
	bh=0S+wccTTBpyQyzv6DGXST6NNsNnXj29ujW32O8FjF+E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qie0RFfAoerFAzcodTqyRuilve5oxuqNV5J5cYi0FffTkGOEq1nMRJnVMQz1lBjVhjKSWw2wKiRi579ven9pgyiIxs+szd09DsnopXiPApxZWtIKKl1c8IAOCA2k/Lp38i77l1oNjoLe2ZAhaT1RSu9Wvf7U5473RxtdDqXFsko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zs7fMPMm; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zs7fMPMm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744046543; x=1775582543;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=0S+wccTTBpyQyzv6DGXST6NNsNnXj29ujW32O8FjF+E=;
  b=Zs7fMPMmDeMscFvDr8wClmQ+18Nl9zHHHB8j9dB/3lbTuVZCWALzi+Zr
   mxzUH6my3rBEVRN7BxPIBXuW22g+CpDTvaoGGqgvGdkzZpZdB7uebMISC
   jsANowjB1LZBZ7fJrI/dmUtFxun/q7xJg476SeonZY4vSZCw1hLbo0kki
   oV0rqwkgeWsy9lBhextEZedQHn+77r6R9T1c+8eoNKt2ZUIno+C9LpUTZ
   VDpdgeJg5rFkd5atqPmO4gsVhPojjMAtrBu5qZUYAQteHDAsgigY5lYbs
   sqYURcmqmneixuEcw2h37WNKOsXTqb7J3PjvKVKIphWAU0crHIHrXvuCp
   Q==;
X-CSE-ConnectionGUID: zQyCQo4JS0u1Opb2dC/fQA==
X-CSE-MsgGUID: U1jPzzhmReWr8lfkXEPEzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56107760"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="56107760"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 10:22:20 -0700
X-CSE-ConnectionGUID: 5jJIzlbJTn+H0auAa4eZfg==
X-CSE-MsgGUID: YipJQm0mRTKUl9h8gdlM6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="132867375"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa003.jf.intel.com with ESMTP; 07 Apr 2025 10:22:18 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 16ADAF0; Mon, 07 Apr 2025 20:22:16 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] x86/early_printk: Use 'mmio32' for consistency
Date: Mon,  7 Apr 2025 20:22:14 +0300
Message-ID: <20250407172214.792745-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

First of all, using 'mmio' prevents proper implementation of 8-bit accessors.
Second, it's simply inconsistent with uart8250 set of options. Rename it to
'mmio32'. While at it, remove rather misleading comment in the documentation.
From now on mmio32 is self-explanatory and pciserial supports not only 32-bit
MMIO accessors.

Fixes: 3181424aeac2 ("x86/early_printk: Add support for MMIO-based UARTs")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 5 +----
 arch/x86/kernel/early_printk.c                  | 6 +++---
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 76e538c77e31..d9fd26b95b34 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1407,18 +1407,15 @@
 			earlyprintk=serial[,0x...[,baudrate]]
 			earlyprintk=ttySn[,baudrate]
 			earlyprintk=dbgp[debugController#]
+			earlyprintk=mmio32,membase[,{nocfg|baudrate}]
 			earlyprintk=pciserial[,force],bus:device.function[,{nocfg|baudrate}]
 			earlyprintk=xdbc[xhciController#]
 			earlyprintk=bios
-			earlyprintk=mmio,membase[,{nocfg|baudrate}]
 
 			earlyprintk is useful when the kernel crashes before
 			the normal console is initialized. It is not enabled by
 			default because it has some cosmetic problems.
 
-			Only 32-bit memory addresses are supported for "mmio"
-			and "pciserial" devices.
-
 			Use "nocfg" to skip UART configuration, assume
 			BIOS/firmware has configured UART correctly.
 
diff --git a/arch/x86/kernel/early_printk.c b/arch/x86/kernel/early_printk.c
index b70e6e99fb17..dc053641698c 100644
--- a/arch/x86/kernel/early_printk.c
+++ b/arch/x86/kernel/early_printk.c
@@ -424,10 +424,10 @@ static int __init setup_early_printk(char *buf)
 	keep = (strstr(buf, "keep") != NULL);
 
 	while (*buf != '\0') {
-		if (!strncmp(buf, "mmio", 4)) {
-			early_mmio_serial_init(buf + 4);
+		if (!strncmp(buf, "mmio32", 6)) {
+			buf += 6;
+			early_mmio_serial_init(buf);
 			early_console_register(&early_serial_console, keep);
-			buf += 4;
 		}
 		if (!strncmp(buf, "serial", 6)) {
 			buf += 6;
-- 
2.47.2

