Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8F72C2AC8;
	Tue, 29 Apr 2025 12:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745929439; cv=none; b=CylKIHN1dfcV/O117XblUIJctGn8ICsRNVZFV/N4420kI9KWYa7iejrM5YHJGi0iWWlfn6b3yafuazJ0uweO/dXrxeXrbNrUUD7u4rD0fUJNWnZ22mbKKsG4rFWZQuof7HL30XA0D0vk/RhEWL+ERRvcnlMzcUwLmDhyA3KF0YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745929439; c=relaxed/simple;
	bh=6D2eOiO8wtFS+Z7xOmqxliK7y2kRiVLMvyJz9Bj3anI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VIbqTpiXLFyXNYf88KD5RMtMCBLN9H//N18CZrg1g6fCX1WTfrjyN4087HdpY4WbAaipgjv+HRuiWzAMUdVq8xc/CHkMMsx93vaw8L1MdzdVy9f2s61fgNiGVexBipA0BJp1vROm7yEnctV28SGD5vGn8OTa4ihB0m4dm6VOZRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fogDslDn; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fogDslDn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745929437; x=1777465437;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=6D2eOiO8wtFS+Z7xOmqxliK7y2kRiVLMvyJz9Bj3anI=;
  b=fogDslDnCfbBolydhSOPnwZ29C8g0D4enN2VmksOnLqxyscjW+doPxtt
   RbppXyDEg8XTAanlwDdE50G4GuZ9VX/WmD/vlzDNTLlrlgL1zTXc8LnKe
   0EEtlfIRALwtQsuVLrRlu197Lq5VWe0Tsyva3o+Ld2OB/dmtVisEmeryp
   EkRPw5cgKLWLV1ZahJry6rtzH5ERRADJCarhpHYe/YuipkwsG+bXLRMDi
   Gne5DLpX11LpPfUiPqtPgozWaEA5sJ0t3Uf7KqcqRcGbq2ZXDnF2z1vWr
   LdNwPQJmj3yxnwmIZrXOdFDql/RDW0FKgpMPZEvWyz6thd5fgWrVEE/Tj
   Q==;
X-CSE-ConnectionGUID: fHexwftlSj+Yv5Dyeef1ZQ==
X-CSE-MsgGUID: MFp/IR1YSK6mLoHyzSTvzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="51371504"
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="51371504"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 05:23:56 -0700
X-CSE-ConnectionGUID: AbYHISptQz20/4tHRh9tgA==
X-CSE-MsgGUID: zSz8F3yFRDCNuSdLrVuC1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="138609618"
Received: from unknown (HELO yungchua-desk.intel.com) ([10.247.118.225])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 05:23:54 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH] soundwire: update Intel BPT message length limitation
Date: Tue, 29 Apr 2025 20:23:37 +0800
Message-ID: <20250429122337.142551-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The limitation of "must be multiples of 32 bytes" does not fit the
requirement of current Intel platforms. Update it to meet the
requirement.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 Documentation/driver-api/soundwire/bra.rst | 2 +-
 drivers/soundwire/intel_ace2x.c            | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/driver-api/soundwire/bra.rst b/Documentation/driver-api/soundwire/bra.rst
index 8500253fa3e8..c08ab2591496 100644
--- a/Documentation/driver-api/soundwire/bra.rst
+++ b/Documentation/driver-api/soundwire/bra.rst
@@ -333,4 +333,4 @@ FIFO sizes to avoid xruns.
 
 Alignment requirements are currently not enforced at the core level
 but at the platform-level, e.g. for Intel the data sizes must be
-multiples of 32 bytes.
+equal to or larger than 16 bytes.
diff --git a/drivers/soundwire/intel_ace2x.c b/drivers/soundwire/intel_ace2x.c
index 5b31e1f69591..f899c966cfaf 100644
--- a/drivers/soundwire/intel_ace2x.c
+++ b/drivers/soundwire/intel_ace2x.c
@@ -245,7 +245,7 @@ static void intel_ace2x_bpt_close_stream(struct sdw_intel *sdw, struct sdw_slave
 	cdns->bus.bpt_stream = NULL;
 }
 
-#define INTEL_BPT_MSG_BYTE_ALIGNMENT 32
+#define INTEL_BPT_MSG_BYTE_MIN 16
 
 static int intel_ace2x_bpt_send_async(struct sdw_intel *sdw, struct sdw_slave *slave,
 				      struct sdw_bpt_msg *msg)
@@ -253,9 +253,9 @@ static int intel_ace2x_bpt_send_async(struct sdw_intel *sdw, struct sdw_slave *s
 	struct sdw_cdns *cdns = &sdw->cdns;
 	int ret;
 
-	if (msg->len % INTEL_BPT_MSG_BYTE_ALIGNMENT) {
-		dev_err(cdns->dev, "BPT message length %d is not a multiple of %d bytes\n",
-			msg->len, INTEL_BPT_MSG_BYTE_ALIGNMENT);
+	if (msg->len < INTEL_BPT_MSG_BYTE_MIN) {
+		dev_err(cdns->dev, "BPT message length %d is less than the minimum bytes %d\n",
+			msg->len, INTEL_BPT_MSG_BYTE_MIN);
 		return -EINVAL;
 	}
 
-- 
2.43.0

