Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011000.outbound.protection.outlook.com [52.101.70.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4EB6BFC0;
	Sat, 21 Jun 2025 19:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750532849; cv=fail; b=iE37sA8qxjDsAqTtZfBLMT6aatKaPB/8cd+H899hOiu559u13FEVusxkgPB8EApv9XRc374MwF5ysiavOmcz4+D6sSYYfmfzfuw2GHaS+l33G6xsC+kFqSmAAXQl1IqEsPcoX/utzAz+1H8E9hVLKgnM8W+A/O+uXueZqomenSQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750532849; c=relaxed/simple;
	bh=q0pw8JOFO6NN76gNdxP5KCs+I/ys8AjSdBOrNJMFuiQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DYYPnzX1Lz1dVCjoo7dDEJtwH1yl9Lmua5NXY+ms90q0k9Ex7YL2msKU3UE/LK0aGcOTxHILxYMNJmFdu+WGj1NBjB9y2q+bESDcaf3P76NaXLhcwapQmKJyF3HvhUTDgNOzozpOo82T/2gAIhawN2DSYOqiiUjMJHOkEtdCSHM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com; spf=fail smtp.mailfrom=leica-geosystems.com; dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b=IhFdAMh9; arc=fail smtp.client-ip=52.101.70.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b="IhFdAMh9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P3TAT9A40Fx8b9004CAUB1XMmWJXwl3b1T2UyXQuuNBBImxWLeFeImdEf7yQv2su+Zsoes0NMH0++B3PX6k7CwCHlHkbTvUXs/qQbrmcBhgWWJxaHicw9OZq6ICgt6RUfx8RkFVj+Ii5fwiW1aavVZ6nwUwyItYy2NQoW7uVxDng7Bb66Dh9l1MTqbviW4SqcWHdsos3RA11mMDVKY4wgR9nYJyRRSW16hVA9cGBmJC1Q+/K2CwAHKFuBVvHpan78iyXUjT4EXPvTFylabDoLCPoHMwSrEv1yEp2wGhSb4ulTWJsN3VhhNZxGE4/Ofm0jZxB/kuE2/2r8od40C3lzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vH0FhQ3c9hbWJnd3Xj6ppfB/L4R39sOTLQp+N25MDoQ=;
 b=BInf8wBW17929MPMh3QlVky/3qW4c4tV83FBf0vA4rUx0c4HtH/fgvQs/Gr6gddW7Uhov+OfAnb0qDKSsSKEK/l/FExYFDN/tAvnGdhalt1hmVex9idBTrfTuS+8r0wcua6snYVorenrI0oN4+7eXaZuwYMjrfwDp2aH7aV2VP/ehb1eoTJktXcr2tmR24TaKMAp8zqQ5KYjvbthHjk1lFr76nKSEzD21ivf5klVcnmqpZ67kSRSPJFIWwftEM/YhguBFrrj/XRG2pos0CvyvDvoE5Kr6oQwrmtbwDyCNoRttDvOmAC7rRkHRqbjJpF4uA00lROxqozucncOHg/nog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vH0FhQ3c9hbWJnd3Xj6ppfB/L4R39sOTLQp+N25MDoQ=;
 b=IhFdAMh99UAh9szn6P+w2m6swNxHnpTDoFHyIPe8OF5+eaTVfIEJqw5q9gQn+LLQ/Pasyo4gq7Hbvudqf+ScfjmFyCLWG+PPzXC/hA9vEFuavVraGeqPoRRoKkcoN+KgYiQ3Qtg3GWNLDZJc9Tr4Cgvw/F4utovnP4bj7btwEJU=
Received: from AS9PR04CA0112.eurprd04.prod.outlook.com (2603:10a6:20b:531::13)
 by AS8PR06MB7799.eurprd06.prod.outlook.com (2603:10a6:20b:332::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.26; Sat, 21 Jun
 2025 19:07:23 +0000
Received: from AMS0EPF000001B2.eurprd05.prod.outlook.com
 (2603:10a6:20b:531:cafe::35) by AS9PR04CA0112.outlook.office365.com
 (2603:10a6:20b:531::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.27 via Frontend Transport; Sat,
 21 Jun 2025 19:07:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 AMS0EPF000001B2.mail.protection.outlook.com (10.167.16.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.21 via Frontend Transport; Sat, 21 Jun 2025 19:07:21 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Sat, 21 Jun 2025 21:07:21 +0200
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Subject: [PATCH 0/3] usb: dwc3: Fix TRB reclaim regression and clean up
 reclaim logic
Date: Sat, 21 Jun 2025 21:07:13 +0200
Message-Id: <20250621-dwc3-fix-gadget-mtp-v1-0-a45e6def71bb@leica-geosystems.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAOECV2gC/x2MywqAIBAAfyX23IJaSfUr0cF0sz30QKMC6d+Tj
 gMzkyBSYIrQFwkCXRx53zLIsgC7mM0TsssMSqhGaCXR3bbCmR/0xnk6cT0PrKzojDZTW1sNuTw
 CZeO/DuP7frWBy6NlAAAA
X-Change-ID: 20250621-dwc3-fix-gadget-mtp-3c09a6ab84c6
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 bsp-development.geo@leica-geosystems.com, 
 Johannes Schneider <johannes.schneider@leica-geosystems.com>
X-Mailer: b4 0.14.2
X-OriginalArrivalTime: 21 Jun 2025 19:07:21.0547 (UTC) FILETIME=[B71FF1B0:01DBE2DF]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001B2:EE_|AS8PR06MB7799:EE_
X-MS-Office365-Filtering-Correlation-Id: 74676eda-7415-4e0f-989e-08ddb0f6d9c5
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bWxzNFVVaEdadFVpRnlDV1Y3OXdkdk05TEMrZk5VS0phRGVTbUY1T1VuN2pL?=
 =?utf-8?B?Z2hYeSt6NHMwQUJBWXhBU3dyUWg2OWZBZ1hxWEQ1L2VObTdrYThwTmtNUjBM?=
 =?utf-8?B?Vk9QWlA5Z241MDV2QWFPMmhlMVQ2RGhKb29reHNhRFQ2aXlpMXdoR2FlQmpK?=
 =?utf-8?B?aGpZYkZGaEJIS2NWLzhLL3EwSFhPZVVKbmVQODh3cGZWaFh2T1RPYUxOMys0?=
 =?utf-8?B?ZGV5aEt0WURrRU1DaUtEbWtLa3A3Unlla09pTGxHenJxVUJ0Z0krL1RWQ0Mx?=
 =?utf-8?B?QTRzZzFkdTlyckxaMnA4WTJZUWlZTHd0dExROGIyaW9oUTh3SzdDRW96UWVI?=
 =?utf-8?B?TVFrT1Q0RXZTdGE1QVArdis1bkxlSGNIOHpaakR6WjN2VFlzdGJaeG9OOHFB?=
 =?utf-8?B?R2QrazR6QjJlTjh4enRaQnF6RlhGeWI5UG5VQUpJdmI3c0xEWThjcW1MbzNF?=
 =?utf-8?B?bVpFT3B0c1ZJaWVCc2thczV4TnRINldCanduKzVvOU15ZDFvUmg3elZvMlpY?=
 =?utf-8?B?cGppMVhzYUNOcTlsU2VPRi9ZanVIVnhjRW9GWDNXT05MWG5wbFg5Q1hneklU?=
 =?utf-8?B?dllvMThWdDBRb3ZOS3lDWVBCL0RTNlJsZFNSSDhxa01IdE5BWVVLazJod21r?=
 =?utf-8?B?OFdCYm5pNUNkZmdJd292OTg3YVpBOVZRcXl3ZHRsdnVoVWxTQ3pEOEZJc3Jp?=
 =?utf-8?B?UHBPZnNqdHo4Zmhsb3BvbUZHSGdIc0x1OWVCOHFzNktKakFuSzlyTWVISHFG?=
 =?utf-8?B?eVVSUHo0ZmZBSWVoMmxibWlqVS9JTGxIblRELy9RaXdrVUNiMXhMQzFjT2RG?=
 =?utf-8?B?WnFIaUZYN2JhRmZ4b0tPWjNiOXRBc29HSjB2RldvMXBMWGlHeFRmM3FWaXZD?=
 =?utf-8?B?OEhEWGtUbDJPRFFyRE1EZjdXU3IrbURxZm9mU1JTckppY1R1dzZ0Z0JxRWRX?=
 =?utf-8?B?ZkpjazVTTm00WFpzelJXRFIzMnoraU5ublBoTE9kL3NBVlQ0MkR4MXY5STZi?=
 =?utf-8?B?SHR2ZU5PZjhncWFaVmpWR2JScHlwdFQ4U0ZJR1RHRmVhaEdiR3VFRVNzTkhv?=
 =?utf-8?B?dDd5L2dvTVIvS0IzZmVhQlBMVkUxbGhGNUNYMDEyNU8wWFk3c0tDbURyZTlr?=
 =?utf-8?B?UDgrK016N0EyTVA3WXdmbG1mT29PdEJHZE1PanlmSHU5WFNhRjBNSFF2NlpN?=
 =?utf-8?B?OE5DLy84Rk1VZ1FWN0cwYmJxSnRpYnJrRk5Ua2lqVUJ1VDRpckdhRkpvZHNa?=
 =?utf-8?B?M1dNdCsxMVpKZXlHZTBRWThvS1M4S3FOa0tKWUNiVDl1TnozcVpEb2ZrQzNy?=
 =?utf-8?B?RzFSRVkveWpIdHVEREpDWVNIekdwL0I3cENLckFlWjh0SXJtU3Mxak5lWTVa?=
 =?utf-8?B?ZjZud1pkMHd4SXNOZVp3VFN1US9zS3BhWFMwdkp2NkpJbnZFWGMxTjYrU2VZ?=
 =?utf-8?B?TUJ0S0I5SGkxcHE4SSttbmFwbUo5Yjl1bTVYUzM2cGlQekVuNDl0Rzl5VUtl?=
 =?utf-8?B?V2ExYll6RzVJWERDYUcrK3oxK1RwL0NMYnE5NHkraGdMN1JNZDBHNjJkQmp2?=
 =?utf-8?B?R0dBQnZ4TmRYZmxhekE5TlcyQ1l4ZGdHQ3lLcGZCM1dvNC9VZG5ZeWtGV0Vl?=
 =?utf-8?B?aHQxeUg1cjZvcER0bkRLZVpUQzQ4bXNhbG1LZHpKdTZwbnRhRTdMTU5GYWRD?=
 =?utf-8?B?eEVETmRpcXBHMTYyMHZHODB5QlFuSzBkcEdWZTFkVXpHajQxbk0rR1lXTW82?=
 =?utf-8?B?L1lNeUtjYnBlUURtdFhLK3ZlWFZkOFN3RkVwNkVVdVE2N0VIQW5ZS09WM1NM?=
 =?utf-8?B?cy81SzQ0RWdURU9qODl5Y0M1YS8vMFhtcHM2TlFybklWeDJFamJvOGY5cjJL?=
 =?utf-8?B?NU1RUTJVTlI1UjZaY2RGRGlIaWxVcUhuZU9uUTFQdzJnZzUrUk9jSTJTall0?=
 =?utf-8?B?ZTlZUk1HeSs2TG1JWXlFVFRuT2ZBaU9xN2xSWUVEbVc1dnp6ejlQUzFHTjVJ?=
 =?utf-8?B?VWxrZ2lhc1Z1MmVWekVLK3RjUzZGdmIvQkwxK2pabHZjRGt4MWFVbjc5KzJo?=
 =?utf-8?Q?Rb2BLU?=
X-Forefront-Antispam-Report:
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2025 19:07:21.7542
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74676eda-7415-4e0f-989e-08ddb0f6d9c5
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001B2.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR06MB7799

Hoi,

This patch series fixes a subtle regression introduced in the recent
scatter-gather cleanup for the DWC3 USB gadget driver, and follows up
with two clean-up patches to simplify and clarify related logic.

Background:

Commit 61440628a4ff ("usb: dwc3: gadget: Cleanup SG handling") removed
some redundant state tracking in the DWC3 gadget driver, including how
scatter-gather TRBs are reclaimed after use. However, the reclaim logic
began relying on the TRB CHN (chain) bit to determine whether TRBs
belonged to a chain — which led to missed TRB reclamation in some
cases.

This broke userspace-facing protocols like MTP (Media Transfer Protocol)
when used via FunctionFS, causing incomplete transfers due to skipped
zero-length packets (ZLPs) or improperly reclaimed short TRBs.

The "offending" chunk from 61440628a4ff:
80                 ret = dwc3_gadget_ep_reclaim_completed_trb(dep, req,
81 -                               trb, event, status, true);
82 +                               trb, event, status,
83 +                               !!(trb->ctrl & DWC3_TRB_CTRL_CHN));

Patch 1 fixes the issue by ensuring the HWO bit is always cleared
on reclaimed TRBs, regardless of the CHN bit.

Patches 2 and 3 follow up with simplifications:
- Patch 2 removes the now-redundant `chain` argument to the reclaim function
- Patch 3 simplifies the logic in `dwc3_needs_extra_trb()` to make the conditions easier to read and maintain

All three patches have been tested on a imx8mp based hardware, with
userspace MTP (viveris/uMTP-Responder) over FunctionFS and resolve the
regression while preserving the recent cleanup work.

Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.com>
---
Johannes Schneider (3):
      usb: dwc3: gadget: Fix TRB reclaim logic for short transfers and ZLPs
      usb: dwc3: gadget: Simplify TRB reclaim logic by removing redundant 'chain' argument
      usb: dwc3: gadget: Simplify logic in dwc3_needs_extra_trb()

 drivers/usb/dwc3/gadget.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)
---
base-commit: d0c22de9995b624f563bc5004d44ac2655712a56
change-id: 20250621-dwc3-fix-gadget-mtp-3c09a6ab84c6

Best regards,
-- 
Johannes Schneider <johannes.schneider@leica-geosystems.com>

