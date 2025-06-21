Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011051.outbound.protection.outlook.com [52.101.65.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA66F26A0F3;
	Sat, 21 Jun 2025 19:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750532851; cv=fail; b=Qd/H/pV4lMrMTwDP/TsrhrvTTmCGZz1D3sYKJzjx59zGsAELbD0e/zjPFXMOEJMxFpURquTBwJA2IUG3lMgv2T/Fu/3hK/0rM4wtL7hYAwsxOHr6+zKeWVp/JNTQeR69P+xYFMjQZP9JqweE53nMvIDBa+mkRWXTidlc/rzvCVE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750532851; c=relaxed/simple;
	bh=/BU3hgn5yD1T/4P6vtGOx7X6s0wuPbUXKqHBNF2pSaQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LSu8Uu236Jfjf3xfCJvme08jOWVAlt3MTTZZh1KUv4J85iaOHtNZX4HCLq+qCEeBhEb1dWDzCj5QTVpQAXkxvVXMtbWpsXolT8zTHf9w/bUlWQTMd3Z7Pyo41/ay4LmFWWmaG8taF/BChIPi32YHVVNIojy8FNDtAZT3+c918jE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com; spf=fail smtp.mailfrom=leica-geosystems.com; dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b=kcU66npb; arc=fail smtp.client-ip=52.101.65.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b="kcU66npb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v6eg8YH/V6TtkfTuJW0NKneua38V2xfu2owtJRLrOsiY4uZj8WODMWZ5joxWiABM4wrIVqYloJfExrWMMjeQU77TvsewqqRWgFc8ifZbdI7NvzQ7fjdXmtTMB4wYR598zNP8UUyiesSl4HcRTCamGCCBxpfWS5yeMQYG8T/R3HIxA7JOirKWERnf4IVAGRIYK7gJ7h8L5ycY8Tmt8+UCSv3GxyYapyTLzxLMFU3MWjxraf5KpRsbDoU/hlsMDeM73zSEEnDfkhEVFpEEnRF46lSvx+ZvZ7qY2C3gj/r5hgMO0LOxegc4Y4uZYfXWfPzl6v6v4gV0vyaPfbTibh00CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dbnmzeNVrOqJ7l8cdc0wCZw3ORYcI5MQc6Nwc4wkfww=;
 b=HghtMI20mZjtBYnYwg6Jl6oR5g3sUzONJBR1eVmpXHpN2OD8XvHvT3ZrSbiTp/emWhZ7DDRr3Sb7mZJJecLk5h/7C9Pu9bTHNMZYkb+dCvbOeXrcja6MnHsWZARIGq10XSt54uY/aDAsQDqXPH2KFMpcg8EpjrJ4rYovbiiUaqF1Doh1Dl1ctXI4B+aGgwA0xIWejmKyu2LjqOx67pXtbMgx9HDeps5Jja+ZrVxNvvic0y/kVT7JGDQ/NzLBIlnJeCVa9mf9SceRX9wev1NNRc2YX4qfL3nkCZZF15N4LBxpr+F3UBJ44rtX6wOefV844EFZhB8ufrj0T/+k1r1pHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dbnmzeNVrOqJ7l8cdc0wCZw3ORYcI5MQc6Nwc4wkfww=;
 b=kcU66npbXYkMPQHuZ8/c7mvBNxz22H2WT1eUWHRIxosdNkUo0Bltx8zb5f4Vp940kLUKre4GJOnRvlOpT9FspL4Xj2+b6l91hTnuHhfvmKNCIPKoLJHAxPdohkdq2ecE2MWLOgbzUfdAr0WxEaHhd1/024GJAfyDcIBARYHmE7c=
Received: from AS9PR04CA0114.eurprd04.prod.outlook.com (2603:10a6:20b:531::19)
 by AM7PR06MB6818.eurprd06.prod.outlook.com (2603:10a6:20b:1ab::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Sat, 21 Jun
 2025 19:07:26 +0000
Received: from AMS0EPF000001B2.eurprd05.prod.outlook.com
 (2603:10a6:20b:531:cafe::96) by AS9PR04CA0114.outlook.office365.com
 (2603:10a6:20b:531::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.27 via Frontend Transport; Sat,
 21 Jun 2025 19:07:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 AMS0EPF000001B2.mail.protection.outlook.com (10.167.16.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.21 via Frontend Transport; Sat, 21 Jun 2025 19:07:25 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Sat, 21 Jun 2025 21:07:21 +0200
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Date: Sat, 21 Jun 2025 21:07:15 +0200
Subject: [PATCH 2/3] usb: dwc3: gadget: Simplify TRB reclaim logic by
 removing redundant 'chain' argument
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250621-dwc3-fix-gadget-mtp-v1-2-a45e6def71bb@leica-geosystems.com>
References: <20250621-dwc3-fix-gadget-mtp-v1-0-a45e6def71bb@leica-geosystems.com>
In-Reply-To: <20250621-dwc3-fix-gadget-mtp-v1-0-a45e6def71bb@leica-geosystems.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 bsp-development.geo@leica-geosystems.com, 
 Johannes Schneider <johannes.schneider@leica-geosystems.com>
X-Mailer: b4 0.14.2
X-OriginalArrivalTime: 21 Jun 2025 19:07:21.0578 (UTC) FILETIME=[B724ACA0:01DBE2DF]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001B2:EE_|AM7PR06MB6818:EE_
X-MS-Office365-Filtering-Correlation-Id: f9a1703a-bc5a-450b-6a21-08ddb0f6dc3d
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YUxwL0IxNkRmL0RTUmtPakRibmE5U2lvdlBWRlIyUlZUazY1RUhhaENZVVlu?=
 =?utf-8?B?eEdLVjJTMjJmQVFCR2laOUNUS01zalNiUWhodlBKMHZlOEhOU1ppYVFNNXZE?=
 =?utf-8?B?NWhuS0xKTDVoM1FhNHJOSVhMWVJidTJST0NNMEtBcGppQTlndEt3K0xKYkxR?=
 =?utf-8?B?WjVlU0I2dHJYSmhnSUNVWGk4bkZpWnQ4TFRLekVJMThhbHNGV3NiTXB2V1Nz?=
 =?utf-8?B?Z3hROStlKzFrZ0RNb2VzSTh5dWVwNlNRaFdqMUFVamJmbTRMMlRUOXJRd0Fv?=
 =?utf-8?B?VWFheEZRUU5NeUJVbGtmZU5uK0lYczBZNXlhdGsrUWtyVVFnWTNQRXJxdk5w?=
 =?utf-8?B?c0VJN0dXL2ZPTkxrdlgzejd5WXZJdHdZQzhEZUliV2JMK3d3b0dRNUZTNGRh?=
 =?utf-8?B?S2JkYTZBSmkxZElPcVdnckhBOFo3bXkyR2hPdEhObGNuR29QSlJSNEpwcTlN?=
 =?utf-8?B?NGxycnNlMlJtRGxJRTQ5bEtvMFRQY1VYWno4Yk1WdWY3SkMyUUdyZTF4dGN3?=
 =?utf-8?B?aWZIMjhXUkVhelg4MVoya0hDek8rK3Z1blRNOTJmcEo5WVEvOEFBeGp0L1Yr?=
 =?utf-8?B?L3lXalp4MkY3RzBRNWp5TTFDeGRUSWhFcEwrY3BnS3doTlJWVVNPM3g1b3F6?=
 =?utf-8?B?UlJtREx5MEJwckZ6RkxHdnEya1VDQ2F3My9NMXJTblMvcUxqM1gyMmZlOXU0?=
 =?utf-8?B?RWFORHc3WmUyQWNURVkycjI1b2F1bTZTUjBGWkZYUElSVFhBc2lJSjRQRURV?=
 =?utf-8?B?dGwxN29IWmRuSXo4VHYwRnNPRy9kTHNIVDFGWEpOcDBLUCtXMFJLaWk1cHJU?=
 =?utf-8?B?OUFHK1o1TGtjYlpCWS9ybjlwa0E4M1dqcDh4WU8vR2s5OURVSFAyK2ljZGJ6?=
 =?utf-8?B?ZkVCNUZiVFRFSXFRTEdkOHhqNzNyR0dlMHp4M3pJYk42VW1Zdlp2Tmovb2Rl?=
 =?utf-8?B?TVpmWk9UWE5DT0VtQXI2Y3VXT0QwU25zZjZNek1TNHg1d3RqcXlJUGplZE92?=
 =?utf-8?B?R2E1YkFkcEtJRFRnanU2SXRnWlR0cVM2RThmSllYaDJiWjVZMGhVNXlUbm9k?=
 =?utf-8?B?bkZWaVp1SitVRGRwUSsrY3VaUUprWmNMQk16aDhKNW9mYU04c2hoaVc5WmNP?=
 =?utf-8?B?QjNPUzkyaEVjV09wWEpTdVhlMjc5OUd5SUx1S0piNkdlTms2RDEwL3NlV2x2?=
 =?utf-8?B?MlozOTVKYm14UlAyOUcvRUI5VVU5YkZOWmxvUXg1UDhuRG40R3ZDOHVUdTdP?=
 =?utf-8?B?Y25Dek5OWlZRQWMyakk1TnIwalplMWNLdE5ienNQMUVZUlJQd2pLVVZZTmNN?=
 =?utf-8?B?WlUvVEhkWmJsT2NpVDJrbTVrdWdkblVKT1VSa0xjRFdQdnkxOGZNZ1JWdmZ1?=
 =?utf-8?B?T01LdnU0WWRxTEgrTndySFB6YUQzWWdkNEZhcXp4T1FRSC9RUzlNV3NFY01h?=
 =?utf-8?B?RCtoYmluaUFGTnZ5UDBoaFpPS1o3K1ptN05kbWQrSzZEcE13cTAwMkN3aFZY?=
 =?utf-8?B?OTlvVTY1azRQcTBmNzNnZ1g4V1FRYzFpNUV6SmRTdXFvUXoyZ2Y3NVN3SkFC?=
 =?utf-8?B?T0VKYkVWaWtqb0xmcHVHUzJUNnIvcXpIeUFQWnFxOWdlQlZEQlVsVzRReDVU?=
 =?utf-8?B?T3hiNXFFTHZNeUgrblg5UExEbzcyTmtPZXRPWWkzMVlKNXM4NWRzb3RNcm9M?=
 =?utf-8?B?cTBiU2ppblVLT3U2NzZnTmMvL0dRUHpEY24zU09zQ3FUWkh2M3VEUUNMMDUr?=
 =?utf-8?B?UGtmZHRQRitaMlRiQ0I1b0taeUZucmREbDl1dlFnYW9FQkRQMjhRSmo2K2pl?=
 =?utf-8?B?ZkZQMkttYWo1WW9ZemtWZjBzMXhyb0ZLRWNGajJlTWMrMjl4M2RuM1RWTExV?=
 =?utf-8?B?Z093dSt0L1pRelowU281SW4zZnp0SG43bkxGL2NWVm45TFc2WVRqNHp1amNx?=
 =?utf-8?B?UEFaQVpxb01VVk9jMGRhNnl4WFJ3SkRQOWFQOVdmMmd3QkZRdHVZTnRIT1FI?=
 =?utf-8?B?RndkRE5tVFNmYTJUcUVRRFU0NkNOak9BOUVGVUZ0MjRKMkZsbGRQeHp5elY1?=
 =?utf-8?Q?KnprMu?=
X-Forefront-Antispam-Report:
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2025 19:07:25.9008
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9a1703a-bc5a-450b-6a21-08ddb0f6dc3d
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001B2.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR06MB6818

Now that the TRB reclaim logic always inspects the TRB's CHN (Chain) bit
directly to determine whether a TRB is part of a chain, the explicit
'chain' parameter passed into dwc3_gadget_ep_reclaim_completed_trb()
is no longer necessary.

This cleanup simplifies the reclaim code by avoiding duplication of
chain state tracking, and makes the reclaim logic rely entirely on the
hardware descriptor flags — which are already present and accurate at
this stage.

No functional changes intended.

Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.com>
---
 drivers/usb/dwc3/gadget.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 99fbd29d8f46d30df558ceb23d2afe7187b4244c..a4a2bf273f943fa112f49979297023a732e0af2e 100644
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

