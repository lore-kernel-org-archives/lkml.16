Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B30526F44E;
	Tue, 20 May 2025 10:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747737960; cv=none; b=eQQHse4XjEvnjV4EaVap7/1w5LC+lerJM/7FhFzN4YuF2gIB4n/7CAlLk/2gEjaaEPgLgmKTfXNslPXiSz1bFb2b/8b7HvDXq4nIronych2GZQBxia9J7n+K279T9Yc0QjWA5FeKrCU9oH0n8YY40ZLX4VxCN0GPpxgevY1P82k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747737960; c=relaxed/simple;
	bh=fpyNp3qCk6hRhWdNTjaohRXGYnwRhutJcjDXMy14dQg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=McpBCGHTKSdqtJ2VNLv2+b21xw6gw35OwH7If+HU0sl8DwjFwWGVR6NqjFBu7+J8cBUyMocQkdlr5BcOEIY2Tzd9KjlWDmYPhYDT/1EEIIP9vk3H7VsR+PNXHFtWu1rpIA5a9F3DVJncDhm/qkk7jEm8TXG31ulopu8wGA3wUlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oFEbU0Wd; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oFEbU0Wd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747737958; x=1779273958;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=fpyNp3qCk6hRhWdNTjaohRXGYnwRhutJcjDXMy14dQg=;
  b=oFEbU0WdmM+3macW2OWDW7qmsI7syqSQnydOCpW/jafOixdbj5PJ9k5a
   j0r6/Q2AwbPo/dcsIAeDI3dymk3VFxPoymYqX2blV6h2i//YZy7I5xrLK
   +4x98kgvo5M5KElcPMgMo9x8ihVxiYrFdcrrulK/E+FgMXfzncQ/FH1Y/
   U3qqaLCQ4YdP9FtZvkkOVYfNTgePn1wFNkRHLQdaWEockWDWEUTvLO4At
   h/bWid29R/5S+4Bc++EPJTR3DPEMPMPkTnQ2vCvV7OiT/QtQrYzufeDa2
   0zeS+TLKIcoJcfVJT+4BW7AnNZ5oBsxEp5ceT4wv38Lhjq9NqG2iERLtQ
   Q==;
X-CSE-ConnectionGUID: CKkcXh6uT2eH6wYD8WkzSQ==
X-CSE-MsgGUID: zSlRJ7R9RWiuh41LR+AZog==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="67220244"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="67220244"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 03:45:57 -0700
X-CSE-ConnectionGUID: CevQ1n6jSO2+ILNhVThvUQ==
X-CSE-MsgGUID: XZIgkQ/VT5GW2Pyj8axT1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="144515163"
Received: from wopr.jf.intel.com ([10.54.75.146])
  by fmviesa005.fm.intel.com with ESMTP; 20 May 2025 03:45:57 -0700
From: Todd Brandt <todd.e.brandt@intel.com>
To: platform-driver-x86@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	xi.pardee@linux.intel.com
Cc: linux-kernel@vger.kernel.org,
	todd.e.brandt@linux.intel.com,
	todd.e.brandt@intel.com
Subject: [PATCH v3] platform/x86/intel/pmc Fix Arrow Lake U/H support to intel_pmc_core driver
Date: Tue, 20 May 2025 03:45:55 -0700
Message-Id: <a61f78be45c13f39e122dcc684b636f4b21e79a0.1747737446.git.todd.e.brandt@intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ARL requires that the GMA and NPU devices both be in D3Hot in order
for PC10 and S0iX to be achieved in S2idle. The original ARL-H/U addition
to the intel_pmc_core driver attempted to do this by switching them to D3
in the init and resume calls of the intel_pmc_core driver.

The problem is the ARL-H/U have a different NPU device and thus are not
being properly set and thus S0iX does not work properly in ARL-H/U. This
patch creates a new ARL-H specific device id that is correct and also
adds the D3 fixup to the suspend callback. This way if the PCI devies
drop from D3 to D0 after resume they can be corrected for the next
suspend. Thus there is no dropout in S0iX.

[v2 changes]

Added Fixes line

[v3 changes]

Xi asked that I see if adding the arl_h_suspend call actually made any
difference in fixing the issue of S0iX not being achieved, as there are
4 other platforms that use this same fix in just the init and resume
callbacks. Upon further testing I discovered it didn't matter. So I just
simplified the D3 change and left the fixup call to init and resume.

Fixes: bd820906ea9d ("platform/x86/intel/pmc: Add Arrow Lake U/H support to intel_pmc_core driver")
Signed-off-by: Todd Brandt <todd.e.brandt@intel.com>
---
 drivers/platform/x86/intel/pmc/arl.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/pmc/arl.c b/drivers/platform/x86/intel/pmc/arl.c
index 320993bd6d31..f9c48738b853 100644
--- a/drivers/platform/x86/intel/pmc/arl.c
+++ b/drivers/platform/x86/intel/pmc/arl.c
@@ -681,6 +681,7 @@ static struct pmc_info arl_pmc_info_list[] = {
 
 #define ARL_NPU_PCI_DEV			0xad1d
 #define ARL_GNA_PCI_DEV			0xae4c
+#define ARL_H_NPU_PCI_DEV		0x7d1d
 #define ARL_H_GNA_PCI_DEV		0x774c
 /*
  * Set power state of select devices that do not have drivers to D3
@@ -694,7 +695,7 @@ static void arl_d3_fixup(void)
 
 static void arl_h_d3_fixup(void)
 {
-	pmc_core_set_device_d3(ARL_NPU_PCI_DEV);
+	pmc_core_set_device_d3(ARL_H_NPU_PCI_DEV);
 	pmc_core_set_device_d3(ARL_H_GNA_PCI_DEV);
 }
 
-- 
2.25.1

