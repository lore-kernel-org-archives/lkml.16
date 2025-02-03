Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27A8211495;
	Mon,  3 Feb 2025 19:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738610134; cv=none; b=AuePp721KHXbHhUW2jT8ZL6fpP/9EI15FG7hV2kziFiyqM4RUOTaJP7HNfSJjv6shDBwYJV8boz0XoOFoH6jG9rPpLgJx2gx1C6TGmnhMbpV5sfVXwmSFG36Qs6iOlXNLtKtoIDBnP98DZlt4OV9HgeQrvL43pkqPEixXtTZ14s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738610134; c=relaxed/simple;
	bh=qi3vHTjWPQ95vzXYY1SIxCkwYIb7BFGycZRDGyY6K6c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bLLG7KcBxCbIi1xiERKR0BxG7oidvCD4AytrFT0EShZnD1Yljogdav0tDuuu/X8bws7BEDqkn/qYnlsD58AlbXqZEtMJzCBmglzdMHqdbxfBYrc+AxEjxe7MsBOz74ripGGQQtElYyu4v4RqA+u6LpqaS0QVKhGjLhN0zLI1G2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UQ2gJ7Ga; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UQ2gJ7Ga"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738610133; x=1770146133;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qi3vHTjWPQ95vzXYY1SIxCkwYIb7BFGycZRDGyY6K6c=;
  b=UQ2gJ7GaoEdwjF3m0laEgy2ZZQ8os+LcS+BRNy0PKCYN+RvmJTO4UAfC
   RyEEZxnKc8fHqaCsVPf2POGV6t2r8aYi7R+6YLiPe+8VNAr1oKwtM/SBm
   yk53wclDulHtgnyzFr2LbAq5qXWSmombe/wij42ranBPiQqwzfaZW7KPS
   /wvhSdiN7MV/rNRQp5HJtd2sU7tZQaKpdnFMIz4HAWuHpdFRBgpq1lT5A
   KWjJbvYON2Qc5QIxf8pGMH0ILqwwgsRVsVHRXV9n7mqPbECYiHYffAeD1
   ysgbkbw8MRLC3zFq3M1qHenBSzHam4HSmq8MSpntL0I8qLl3sEmskMBQx
   w==;
X-CSE-ConnectionGUID: WLZGzHSpSWeKhsLRCcukww==
X-CSE-MsgGUID: 8BNF3zfYTs+dPcY5jr4RWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="43043127"
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; 
   d="scan'208";a="43043127"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 11:15:30 -0800
X-CSE-ConnectionGUID: 8PGdqJF2TbqcYi5IduPU/g==
X-CSE-MsgGUID: 2rt/8lFUSrCcXMA7XtjeEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; 
   d="scan'208";a="110266549"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa007.fm.intel.com with ESMTP; 03 Feb 2025 11:15:27 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id D7E4E399; Mon, 03 Feb 2025 21:15:25 +0200 (EET)
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
Subject: [PATCH v2 2/3] usb: dwc3: gadget: Add support for snps,reserved-endpoints property
Date: Mon,  3 Feb 2025 21:10:54 +0200
Message-ID: <20250203191524.3730346-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20250203191524.3730346-1-andriy.shevchenko@linux.intel.com>
References: <20250203191524.3730346-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The snps,reserved-endpoints property lists the reserved endpoints
that shouldn't be used for normal transfers. Add support for that
to the driver.

While at it, make sure we don't crash by a sudden access to those
endpoints in the gadget driver.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/usb/dwc3/gadget.c | 60 +++++++++++++++++++++++++++++++++++----
 1 file changed, 55 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index d27af65eb08a..93b1e389a983 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -547,6 +547,7 @@ static int dwc3_gadget_set_xfer_resource(struct dwc3_ep *dep)
 int dwc3_gadget_start_config(struct dwc3 *dwc, unsigned int resource_index)
 {
 	struct dwc3_gadget_ep_cmd_params params;
+	struct dwc3_ep		*dep;
 	u32			cmd;
 	int			i;
 	int			ret;
@@ -563,8 +564,13 @@ int dwc3_gadget_start_config(struct dwc3 *dwc, unsigned int resource_index)
 		return ret;
 
 	/* Reset resource allocation flags */
-	for (i = resource_index; i < dwc->num_eps && dwc->eps[i]; i++)
-		dwc->eps[i]->flags &= ~DWC3_EP_RESOURCE_ALLOCATED;
+	for (i = resource_index; i < dwc->num_eps; i++) {
+		dep = dwc->eps[i];
+		if (!dep)
+			continue;
+
+		dep->flags &= ~DWC3_EP_RESOURCE_ALLOCATED;
+	}
 
 	return 0;
 }
@@ -751,9 +757,11 @@ void dwc3_gadget_clear_tx_fifos(struct dwc3 *dwc)
 
 	dwc->last_fifo_depth = fifo_depth;
 	/* Clear existing TXFIFO for all IN eps except ep0 */
-	for (num = 3; num < min_t(int, dwc->num_eps, DWC3_ENDPOINTS_NUM);
-	     num += 2) {
+	for (num = 3; num < min_t(int, dwc->num_eps, DWC3_ENDPOINTS_NUM); num += 2) {
 		dep = dwc->eps[num];
+		if (!dep)
+			continue;
+
 		/* Don't change TXFRAMNUM on usb31 version */
 		size = DWC3_IP_IS(DWC3) ? 0 :
 			dwc3_readl(dwc->regs, DWC3_GTXFIFOSIZ(num >> 1)) &
@@ -3395,14 +3403,52 @@ static int dwc3_gadget_init_endpoint(struct dwc3 *dwc, u8 epnum)
 	return 0;
 }
 
+static int dwc3_gadget_parse_reserved_endpoints(struct dwc3 *dwc, const char *propname,
+						u8 *eps, u8 num)
+{
+	u8 count;
+	int ret;
+
+	if (!device_property_present(dwc->dev, propname))
+		return 0;
+
+	ret = device_property_count_u8(dwc->dev, propname);
+	if (ret < 0)
+		return ret;
+	count = ret;
+
+	ret = device_property_read_u8_array(dwc->dev, propname, eps, min(num, count));
+	if (ret)
+		return ret;
+
+	return count;
+}
+
 static int dwc3_gadget_init_endpoints(struct dwc3 *dwc, u8 total)
 {
+	const char			*propname = "snps,reserved-endpoints";
 	u8				epnum;
+	u8				eps[DWC3_ENDPOINTS_NUM];
+	u8				count;
+	u8				num;
+	int				ret;
 
 	INIT_LIST_HEAD(&dwc->gadget->ep_list);
 
+	ret = dwc3_gadget_parse_reserved_endpoints(dwc, propname, eps, ARRAY_SIZE(eps));
+	if (ret < 0) {
+		dev_err(dwc->dev, "failed to read %s\n", propname);
+		return ret;
+	}
+	count = ret;
+
 	for (epnum = 0; epnum < total; epnum++) {
-		int			ret;
+		for (num = 0; num < count; num++) {
+			if (epnum == eps[num])
+				break;
+		}
+		if (num < count)
+			continue;
 
 		ret = dwc3_gadget_init_endpoint(dwc, epnum);
 		if (ret)
@@ -3669,6 +3715,8 @@ static bool dwc3_gadget_endpoint_trbs_complete(struct dwc3_ep *dep,
 
 		for (i = 0; i < DWC3_ENDPOINTS_NUM; i++) {
 			dep = dwc->eps[i];
+			if (!dep)
+				continue;
 
 			if (!(dep->flags & DWC3_EP_ENABLED))
 				continue;
@@ -3818,6 +3866,8 @@ static void dwc3_endpoint_interrupt(struct dwc3 *dwc,
 	u8			epnum = event->endpoint_number;
 
 	dep = dwc->eps[epnum];
+	if (!dep)
+		return;
 
 	if (!(dep->flags & DWC3_EP_ENABLED)) {
 		if ((epnum > 1) && !(dep->flags & DWC3_EP_TRANSFER_STARTED))
-- 
2.43.0.rc1.1336.g36b5255a03ac

