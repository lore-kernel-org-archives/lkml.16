Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5A1139CE3;
	Mon,  3 Feb 2025 19:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738610205; cv=none; b=plSpd1OdCFyluLt3PcDburHvE0G9U1tb/znFkIp+y76st8McBVdm5XOa5xg/6DB56EwPElKJwEkcBkWguIS6ZJfr3dvrLEeRSy2gx/7mvjDSRaV7rTUiMdG50ev7qEVEM87YxBTfQFbDk+hgOjuDH4DB8T6jAnFW1unuQss1J9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738610205; c=relaxed/simple;
	bh=KyxS/VFzowY3TT/f2zu8rNl6KxCFGMJpC3jrH3DGZZo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bbYRejYsBxBZi6Oh4OQreZwc3pFXq0Ymy888Ea8tr+fYIRzinvpn1xELdoHUicGOKp/OG/wI4Gv8ngGz4TEtjqUPKKK/r/YGqiZo7PicPBXTRPwUpkrNjbUZs9/177n4SYJXbm+vkueJ9mLsNEtmkHF9/7FV1ivQr9zzC65jwKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hxvI25Pi; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hxvI25Pi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738610204; x=1770146204;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KyxS/VFzowY3TT/f2zu8rNl6KxCFGMJpC3jrH3DGZZo=;
  b=hxvI25PiA1vQzEM1s4mPyWbYpbrAc02v5geTukYqMWp8aphpRX+eCP9S
   4wGoA+OfCDbfoVx8gpt9Gk85MpByWTOz6Rb7oWlpwRXnBcITt09X65cb7
   WlZNJxMS3JvLJkclWcHMnFf2yiXW8RYAP5pvyyaLZDWwb5rIEaW6sD1Fe
   b+9NPY5CeD3T0zo9czzaYU1Ac9lKnutToqerRacgRqRldXHSyBh+nATzI
   uOa7I+knvOQfVbUNBfG8h1m1BX2zC1IzbHgaJG9XDW+Vzb/GqjvTMBC7O
   lYIBhlHIkwWja3nQ5tKHEZCJQRGf0w3W//g3w0npuPL4mxnUKuMmhFEiI
   Q==;
X-CSE-ConnectionGUID: TlhJ4PEuR2qbDAkNRfdVJg==
X-CSE-MsgGUID: IR2WD9+XQhKtIwCAJ1Yi4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="50507066"
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; 
   d="scan'208";a="50507066"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 11:15:30 -0800
X-CSE-ConnectionGUID: kY0haL5cTzS8OCgAgXJ+gQ==
X-CSE-MsgGUID: dozJeq+iQFy14+i5+6Z72g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; 
   d="scan'208";a="110917950"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa010.fm.intel.com with ESMTP; 03 Feb 2025 11:15:26 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id DD2EF353; Mon, 03 Feb 2025 21:15:25 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Felipe Balbi <balbi@kernel.org>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ferry Toth <fntoth@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 3/3] usb: dwc3: gadget: Avoid using reserved endpoints on Intel Merrifield
Date: Mon,  3 Feb 2025 21:10:55 +0200
Message-ID: <20250203191524.3730346-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20250203191524.3730346-1-andriy.shevchenko@linux.intel.com>
References: <20250203191524.3730346-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Intel Merrifield SoC uses these endpoints for tracing and they cannot
be re-allocated if being used because the side band flow control signals
are hard wired to certain endpoints:

• 1 High BW Bulk IN (IN#1) (RTIT)
• 1 1KB BW Bulk IN (IN#8) + 1 1KB BW Bulk OUT (Run Control) (OUT#8)

In device mode, since RTIT (EP#1) and EXI/RunControl (EP#8) uses
External Buffer Control (EBC) mode, these endpoints are to be mapped to
EBC mode (to be done by EXI target driver). Additionally TRB for RTIT
and EXI are maintained in STM (System Trace Module) unit and the EXI
target driver will as well configure the TRB location for EP #1 IN
and EP#8 (IN and OUT). Since STM/PTI and EXI hardware blocks manage
these endpoints and interface to OTG3 controller through EBC interface,
there is no need to enable any events (such as XferComplete etc)
for these end points.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/usb/dwc3/dwc3-pci.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-pci.c b/drivers/usb/dwc3/dwc3-pci.c
index 052852f80146..54a4ee2b90b7 100644
--- a/drivers/usb/dwc3/dwc3-pci.c
+++ b/drivers/usb/dwc3/dwc3-pci.c
@@ -148,11 +148,21 @@ static const struct property_entry dwc3_pci_intel_byt_properties[] = {
 	{}
 };
 
+/*
+ * Intel Merrifield SoC uses these endpoints for tracing and they cannot
+ * be re-allocated if being used because the side band flow control signals
+ * are hard wired to certain endpoints:
+ * - 1 High BW Bulk IN (IN#1) (RTIT)
+ * - 1 1KB BW Bulk IN (IN#8) + 1 1KB BW Bulk OUT (Run Control) (OUT#8)
+ */
+static const u8 dwc3_pci_mrfld_reserved_endpoints[] = { 3, 16, 17 };
+
 static const struct property_entry dwc3_pci_mrfld_properties[] = {
 	PROPERTY_ENTRY_STRING("dr_mode", "otg"),
 	PROPERTY_ENTRY_STRING("linux,extcon-name", "mrfld_bcove_pwrsrc"),
 	PROPERTY_ENTRY_BOOL("snps,dis_u3_susphy_quirk"),
 	PROPERTY_ENTRY_BOOL("snps,dis_u2_susphy_quirk"),
+	PROPERTY_ENTRY_U8_ARRAY("snps,reserved-endpoints", dwc3_pci_mrfld_reserved_endpoints),
 	PROPERTY_ENTRY_BOOL("snps,usb2-gadget-lpm-disable"),
 	PROPERTY_ENTRY_BOOL("linux,sysdev_is_parent"),
 	{}
-- 
2.43.0.rc1.1336.g36b5255a03ac

