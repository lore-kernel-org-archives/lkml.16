Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012069.outbound.protection.outlook.com [52.101.71.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F5D1FFC55;
	Sun, 29 Jun 2025 09:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751187866; cv=fail; b=nSjmPoS0/6+fXKz/2gpz+GeMqxNUEtM+YrFSKyY/PtgIMgIz0+N/zEmquMn/gQovDMXExTkbziPZv0OXF0gYystLkG2LUMtr2OSC2YNnJ3GFv7blLKALAqukGOsWwJVq7UQ6EiyKkO4obGv44/edZWCVAaPuephviCB3GKtEb18=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751187866; c=relaxed/simple;
	bh=t6+9ybLjwRMR3EIce8WdphSfHC8Ul3FupqDU3nPMQzw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JVW7HEvwqFM8UEhxZqdFDHcWA7B3B+M97Zk4jR30t8VWsgMIzjOCYfiXcmTpvMBIbU9w4z1w9JioVO98PbN7P559EPBjee/mILt+mD3D/IKBskUe7dkOwu28GBUNi7PLL+FdVmdHlw5IHv+1BLvjjaUGSn8sjGFosEzX6wqJHPk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com; spf=fail smtp.mailfrom=leica-geosystems.com; dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b=RNQb0Vm1; arc=fail smtp.client-ip=52.101.71.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b="RNQb0Vm1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HrVvvrDV3A+cNcfVeaCdgKEcYoSBEPfPcpBGF1Bqp53zD48iCJphYc5eiHIypZUDZd9E2Sp9N9C4VzuQjdcpz+4UQ4ckR6IOj6JO2qMPlJAJCFlOZtgS7/xdl2KwrDvVa2mtToSYG5bopF1PKGU9bGEkum2/gmWcQg1qDgO6stBpgJO/CdynKEJoPXmUWz00NzPpaKDvEEXW35iPbZgQpWOsCQBH1/Q7m886GIyp+JqMUcaAaTVnKow21fTpB2+5fAswKxK3lN/Vve3fgT5XCB/vK4Dt+QBhYDM+canLO7MsTEUWE6IySCi4P67Z0+syrGjSEYB258X4zJoiUP04DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2xvgD2JbP4cYrUzUbx9xDduVHjgSgSiOyVZ9C+sdk60=;
 b=OOCgpCvPzZ1N04C2tt+kxE01PBQnlin/AgPb3Qj5dIWEO7GzzYB1L5VO+cJ7Hk/Ry5DwLvlllPSieoKQA27c2LADDdi1nks5yytAOBJmQ5ZlderxtR4sbdkZRQM+0BT4hTnrxT0SioG/gWugfjY303xU7as2c/1lxREBv3Rub66r+Abfc6VFRXzOwUYJ6TGPxT08WN0c+OBngoNw3CskGRFoJfmA9S3YYyH1/2gjExSYpys/fNPlleAoY3qLrR1rs9hUEaRRmWzZUbmEV2gA5n66PRz1pR+SM2O9muZhac5IwjQB/WceVHEcRnAa7A55Ek2UJYCkVsH6jk18WKvJRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2xvgD2JbP4cYrUzUbx9xDduVHjgSgSiOyVZ9C+sdk60=;
 b=RNQb0Vm1havLYJyHYk8c4JMJbJ+uBYksxXPjgVajlpKAF0UEZidGvLPB3+LbxdDVpQU+WuxSzKgeP9OkD10MMVpkAlJDzIbnALpZtbN1a438tV+YBaqDxjV6VP6bT3JvG1VpYdB40q2tv+62CBZKMsYA19h8k3IGs45y3VhNVfs=
Received: from AS4P190CA0057.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:656::6)
 by DB9PR06MB7241.eurprd06.prod.outlook.com (2603:10a6:10:210::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.27; Sun, 29 Jun
 2025 09:04:20 +0000
Received: from AM4PEPF00027A6A.eurprd04.prod.outlook.com
 (2603:10a6:20b:656:cafe::a6) by AS4P190CA0057.outlook.office365.com
 (2603:10a6:20b:656::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.27 via Frontend Transport; Sun,
 29 Jun 2025 09:04:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 AM4PEPF00027A6A.mail.protection.outlook.com (10.167.16.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.15 via Frontend Transport; Sun, 29 Jun 2025 09:04:18 +0000
Received: from GEO-H84s5E2W8Pk.lgs-net.com ([10.60.34.121]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Sun, 29 Jun 2025 11:04:17 +0200
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
To: Thinh.Nguyen@synopsys.com,
	gregkh@linuxfoundation.org
Cc: kernel@pengutronix.de,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bsp-development.geo@leica-geosystems.com,
	Johannes Schneider <johannes.schneider@leica-geosystems.com>
Subject: [PATCH v4 2/2] usb: dwc3: gadget: Simplify TRB reclaim logic by removing redundant 'chain' argument
Date: Sun, 29 Jun 2025 11:04:14 +0200
Message-ID: <20250629090414.294308-2-johannes.schneider@leica-geosystems.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250629090414.294308-1-johannes.schneider@leica-geosystems.com>
References: <20250629090414.294308-1-johannes.schneider@leica-geosystems.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 29 Jun 2025 09:04:17.0741 (UTC) FILETIME=[CB334FD0:01DBE8D4]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A6A:EE_|DB9PR06MB7241:EE_
X-MS-Office365-Filtering-Correlation-Id: 53bf51f2-0d8e-498b-3b36-08ddb6ebeded
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TmNPeXFsOFBXeXVsUEtCaUVhSWd4RDZ5aUJzYWdFWmJIOERIQnpPc3AwUHVW?=
 =?utf-8?B?ZHNNaEM1M0tCZFBEa3V6SDNpMU9tVmFQVDJWV3ZBNk5qRS82R0g5aldEVzJG?=
 =?utf-8?B?T09ibWp0TmJCNjlRWk4yNE9YRE5rNlRLU1RIeTI5YkJOMm1oYitNbjhuMU8v?=
 =?utf-8?B?T3JKMUVsL3RJZU1vTkFpejQwRm1wYS9UUTJWTy9yQ1lwQW1yRHovYk5IYk4w?=
 =?utf-8?B?U1RzSG1wVm10RmlyVkVPdjdBcXpJK0x3Zm5oalpHNnY3cXBzaDlNR0lpZ3BT?=
 =?utf-8?B?eVJ4TWdsc3pEQnpVYTNPMDZrV0c5cTJHNXJWZUMxby9JTkUwTCsvbVNTL3Z3?=
 =?utf-8?B?UVVZVTJjUVUwVnNpSEJjK2VnZ3ZDblUyNGsxL0ZZVTIxcGt0Q0RPY3dIZkJs?=
 =?utf-8?B?dUpnWEg0bUV4aU5rMXIzZzhBUHl1UXhBZW44QUVnY2pvK3g4dHpwcXRuMlF2?=
 =?utf-8?B?NU1jeXkxV0kvekY4YW4rb0dnUHNJUXdnWHRZTWloRVNuS3VvdUNoRHZMSzRK?=
 =?utf-8?B?Rnd5U2dDM0o3ckxva1NMRW9DejRSVmZ4Q3dwdkwwRjJlVzJvUlhESUVPWk5U?=
 =?utf-8?B?MUlISDRON3ZRMmlBQmFFM3BYNUo0ZDRRVFAveWJBNW1rendMV1JVTjJHRnl2?=
 =?utf-8?B?K2VFOEdzSTlMa01tcFBtclBqS1RwT2tENFF4Z1Q4Um53WC84ZWJiQVBlci9P?=
 =?utf-8?B?cVJhZTZVSDhWUmVFTG1OMWtSTjlpM1hNWU1vcjBYYjg5a1lTR2djOGtXcDUx?=
 =?utf-8?B?VzlZUlZvZnQxbFlRWlBmYXYrb1MzMDljVmRWc2lKT1FXcTljdE16N3JLVkN1?=
 =?utf-8?B?Q1VoZ0trRDA4NGs2UlpqVmwweHJBb3I2UFpLV25zK1lLNDhOS0Nlb1RsRitP?=
 =?utf-8?B?VWk0YXBQcjNRVU5BbTlBcmlLVG9rUUpucCtrQnpjSXVmTm01TU9PUVhET1JP?=
 =?utf-8?B?TUhBMS9Qb0RwQ0hxODJiWmRUOG1uOGFGVFpuTWtRRWU3cVIwZmY4U3pGWU1X?=
 =?utf-8?B?eHNnQzl3dHpzRE1HM0p4VVNPSk5SeXdXd2U1VzlYWm1MRG8xMWVTajRSWENK?=
 =?utf-8?B?QlpsUU9vK0pVU251RUU1UklLbmtaeUlWdGhCR1ZZdUFpdXJrazFUdktVWmZq?=
 =?utf-8?B?ZEhIbWMvWklBd045WCtvUlRVTk0wN0JXZ0dHU1E2U1Mya1ZhMVRqaUVFOThX?=
 =?utf-8?B?SVlndXV4bmIwR2lYL1NNY1EvREtzRDZ1L21XazZDQ0hzbVRJQm91eGhLaU1x?=
 =?utf-8?B?RnpmczYwT2xrUHVNWDl3U3ZXRVZlcDJJSHgrN1pkVlhkNjZERlEwQjRnYlpj?=
 =?utf-8?B?OWVKYTltaEpGUkNpTEN4aXdidnpJWFVZeXBRc2hvMGlkWWV2dktaSFlDSmVq?=
 =?utf-8?B?QnNsa1oraWxFVHF4UEV6azRJRlNtNm5VbDEydWtoSjZ5QndLc1lDUEJNb1RB?=
 =?utf-8?B?RWNOT1JhbVF1cDhxckEzMS9vZkpTVHlZNGxtSjc0VUIyazFOZmtWT3U3YUtO?=
 =?utf-8?B?bnFMRDZCY0k4cGQ1OTE3cXJjaU1vdmsyUEx2OGZPejRWWEs3KzJsNUpKbVZO?=
 =?utf-8?B?ejdJakFVOWVFbG8zaHp5YkYrcXBxWnpvMTdvUFlaRXZleE5ZMGtPYUNQbEdJ?=
 =?utf-8?B?dmJ5THBYK0l1b0cycllibGphVGUySkVncCtzY2lHS1FnazRiSzRINlNJZWwv?=
 =?utf-8?B?VUpNamlQdVV1cGRBMmFvRkFZQ2VOZGlSVXZnNktieUUzdTRHeHZPUTlvTVhR?=
 =?utf-8?B?ckhDcmpPclRRUkFTdVJRaWRNRU40Z0JKVS9lRGZoekZSa1Iyb0ZvNXFGL3JW?=
 =?utf-8?B?ekJicUUyeWtwaFBhVXJwbkttV0ovRFJUYXB2djR3Q2VrZGVFbldjUXBRWlhK?=
 =?utf-8?B?RXlrRmpuKzB3TkZsMTZ0VFZwcDRJdkpnYitUYVpmRVVTWVhrcjVKOXFBZUlL?=
 =?utf-8?B?dlhDYkRYdXF3c21mUTNVYU9GeGVIRGtsUkVIS1JtRE1aM3hvUTI5eDU3UHUx?=
 =?utf-8?B?amN4MWZwazcySThjTHJnczBzTERJUGVKdUpVblNsMUdOdCtPTjJYRkcvM3Yr?=
 =?utf-8?B?VDBicENWa2djcHZRdFhjaGVuaHNsR0lHaG9IUT09?=
X-Forefront-Antispam-Report:
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2025 09:04:18.0859
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53bf51f2-0d8e-498b-3b36-08ddb6ebeded
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A6A.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR06MB7241

Now that the TRB reclaim logic always inspects the TRB's CHN (Chain) bit
directly to determine whether a TRB is part of a chain, the explicit
'chain' parameter passed into dwc3_gadget_ep_reclaim_completed_trb()
is no longer necessary.

This cleanup simplifies the reclaim code by avoiding duplication of
chain state tracking, and makes the reclaim logic rely entirely on the
hardware descriptor flags — which are already present and accurate at
this stage.

No functional changes intended.

Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.com>
---
Changes in v4:
- None, patch content is the same
- re-assembled into a patch-series, and re-submission to solve b4 troubles
- Link to v3:
  1. https://lore.kernel.org/all/AM8PR06MB7521A29A8863C838B54987B6BC7BA@AM8PR06MB7521.eurprd06.prod.outlook.com/
  2. https://lore.kernel.org/all/AM8PR06MB752168CCAF31023017025DD5BC7BA@AM8PR06MB7521.eurprd06.prod.outlook.com/

Changes in v3:
- re-submission as singular patch
- Link to v2: https://lore.kernel.org/r/20250624-dwc3-fix-gadget-mtp-v2-0-0e2d9979328f@leica-geosystems.com

Changes in v2:
- None, resubmission as separate patches
- dropped Patch 3, as it did change the logic
- CC to stable
- Link to v1: https://lore.kernel.org/r/20250621-dwc3-fix-gadget-mtp-v1-0-a45e6def71bb@leica-geosystems.com

---
 drivers/usb/dwc3/gadget.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 99fbd29d8f46..a4a2bf273f94 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -3497,7 +3497,7 @@ static void dwc3_gadget_free_endpoints(struct dwc3 *dwc)
 
 static int dwc3_gadget_ep_reclaim_completed_trb(struct dwc3_ep *dep,
 		struct dwc3_request *req, struct dwc3_trb *trb,
-		const struct dwc3_event_depevt *event, int status, int chain)
+		const struct dwc3_event_depevt *event, int status)
 {
 	unsigned int		count;
 
@@ -3549,7 +3549,8 @@ static int dwc3_gadget_ep_reclaim_completed_trb(struct dwc3_ep *dep,
 	if ((trb->ctrl & DWC3_TRB_CTRL_HWO) && status != -ESHUTDOWN)
 		return 1;
 
-	if (event->status & DEPEVT_STATUS_SHORT && !chain)
+	if (event->status & DEPEVT_STATUS_SHORT &&
+	    !(trb->ctrl & DWC3_TRB_CTRL_CHN))
 		return 1;
 
 	if ((trb->ctrl & DWC3_TRB_CTRL_ISP_IMI) &&
@@ -3576,8 +3577,7 @@ static int dwc3_gadget_ep_reclaim_trb_sg(struct dwc3_ep *dep,
 		trb = &dep->trb_pool[dep->trb_dequeue];
 
 		ret = dwc3_gadget_ep_reclaim_completed_trb(dep, req,
-				trb, event, status,
-				!!(trb->ctrl & DWC3_TRB_CTRL_CHN));
+				trb, event, status);
 		if (ret)
 			break;
 	}
-- 
2.34.1

