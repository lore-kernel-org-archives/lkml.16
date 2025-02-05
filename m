Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1B2212F97;
	Wed,  5 Feb 2025 08:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738745144; cv=none; b=KeabiUMgdU8Q13c3hSKhZzCYSU4kAQAJlYrzCmSRfBOrORNDFJXKSF4xnwDkHZO0D1PZ0PVg/MespDFZoUoyo/v8VVpWgi/Xjw+qj8KKv0R94r6wEdR5XAR3FFjLODVe0cr17EhdtA7LVHG9d9s3phTyLCu+OmvtcQjxuFWm7aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738745144; c=relaxed/simple;
	bh=S7Io1ezRLS9OSfuanXxPbqRqVeSh30vzJM/zqT3Ck0A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HlIcDr2/B0bBp5+0PghDwu60NzGL6AMq63y65kJar2AmRToDelLaD1TDEuIEADbWL6fVTiXLuwr2kSe6PDb3p3Pe5GZkhzrcf2IVPvFrGNQRI2ZLZwJ4+7ErFsAXNwoha21P2VH8imAgVRYpX8TGz9tpzTopARimXUwjfgLW7oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NGN6BKSH; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NGN6BKSH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738745143; x=1770281143;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=S7Io1ezRLS9OSfuanXxPbqRqVeSh30vzJM/zqT3Ck0A=;
  b=NGN6BKSHJWCKUKJPSRDcjmdHOcnp7ljKYjd7ClQoTI/L//7BL+6V4FpQ
   2t8l56fTr48zxLXtMx0KrKgQmfNDU0CTUlHj6KpPfs2i+Q2k8zJvxyJWH
   WG8ENF/zrp0/JGmeZ0rV9jCBteev9oKOCSujVyrh88l2prUbqFSSzl70E
   tVe1UdUJErt/iGoknPEE5jAlk87uGM1QAOrhJDRCR2RFVFKHOhql639Ol
   JjH1a0+odlnCXCapJWSy3NCkPmW/iO9cyFdwEa27moWo+UUX1LORPLWNL
   yrEvs0WGvW+CVFSucrAUkRVj0qFCkEAK9NcHKLaJojV/PecqWxZVgo1Ze
   w==;
X-CSE-ConnectionGUID: PgwYt3jAQFCtWQcA1SywrQ==
X-CSE-MsgGUID: W3rjINohR72cUAiTKXfX4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="38532489"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="38532489"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 00:45:42 -0800
X-CSE-ConnectionGUID: u4Jh3TgRRsa072zx407B5w==
X-CSE-MsgGUID: oFmSZjL7T/e1Ol67CNF64A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="115887803"
Received: from mdroper-mobl2.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.223.241])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 00:45:42 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 02/16] soundwire: cadence: add BTP support for DP0
Date: Wed,  5 Feb 2025 16:45:16 +0800
Message-ID: <20250205084531.158763-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250205084531.158763-1-yung-chuan.liao@linux.intel.com>
References: <20250205084531.158763-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>

The register definitions are missing a BULK_ENABLE bitfield which must
be set for DP0.

In addition, the existing mapping from PDI to Data Port is 1:1. That's
fine for PCM streams which are by construction in one direction
only. The BTP/BRA protocol is bidirectional and relies on DP0 only,
which breaks the 1:1 mapping. DP0 MUST be mapped to both PDI0 and
PDI1, with PDI0 taking care of the TX direction and PDI1 of the RX
direction.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 drivers/soundwire/cadence_master.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
index f367670ea991..f7654a7fd53f 100644
--- a/drivers/soundwire/cadence_master.c
+++ b/drivers/soundwire/cadence_master.c
@@ -184,6 +184,7 @@ MODULE_PARM_DESC(cdns_mcp_int_mask, "Cadence MCP IntMask");
 #define CDNS_PORTCTRL_TEST_FAILED		BIT(1)
 #define CDNS_PORTCTRL_DIRN			BIT(7)
 #define CDNS_PORTCTRL_BANK_INVERT		BIT(8)
+#define CDNS_PORTCTRL_BULK_ENABLE		BIT(16)
 
 #define CDNS_PORT_OFFSET			0x80
 
@@ -1901,13 +1902,20 @@ void sdw_cdns_config_stream(struct sdw_cdns *cdns,
 
 		if (cdns->bus.params.m_data_mode != SDW_PORT_DATA_MODE_NORMAL)
 			val |= CDNS_PORTCTRL_TEST_FAILED;
+	} else if (pdi->num == 0 || pdi->num == 1) {
+		val |= CDNS_PORTCTRL_BULK_ENABLE;
 	}
 	offset = CDNS_PORTCTRL + pdi->num * CDNS_PORT_OFFSET;
 	cdns_updatel(cdns, offset,
-		     CDNS_PORTCTRL_DIRN | CDNS_PORTCTRL_TEST_FAILED,
+		     CDNS_PORTCTRL_DIRN | CDNS_PORTCTRL_TEST_FAILED |
+		     CDNS_PORTCTRL_BULK_ENABLE,
 		     val);
 
-	val = pdi->num;
+	/* The DataPort0 needs to be mapped to both PDI0 and PDI1 ! */
+	if (pdi->num == 1)
+		val = 0;
+	else
+		val = pdi->num;
 	val |= CDNS_PDI_CONFIG_SOFT_RESET;
 	val |= FIELD_PREP(CDNS_PDI_CONFIG_CHANNEL, (1 << ch) - 1);
 	cdns_writel(cdns, CDNS_PDI_CONFIG(pdi->num), val);
-- 
2.43.0

