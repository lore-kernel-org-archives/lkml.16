Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013037.outbound.protection.outlook.com [40.107.162.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992C726FDA5;
	Sat, 21 Jun 2025 19:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750532853; cv=fail; b=YHXi5B8wUqnUxVUuQn7o1lLJOgw5LmfodFzQRCrPtKO/cs6ChATvDx2CbSW0n/MPmc/ldQnYIJuQy20KOztgRqzTcnNpnChu7EkxQ+6Jto8Q4Nee8UI/m3C3euErLQFSmWvGe4qeX6E7bizPVBsb7vX8M3PPo3CWwkEwzdv87gY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750532853; c=relaxed/simple;
	bh=4ipMAEiyk61X6apx5AapvvwuwNX8+6h8B1105l7Jf0Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BXTBtwrmh3NjzLrP5qRd4fFPOZtJL2S4V4ZZ077rwWkvvLZtmkUtz3GApWFCwov+wljiLgTrQrlbI34fERqoD54hwXvIvXxIY402rmFPQOVHziLGu23QSsHL2JUbwpx8QJIhhERiexgXbdTsWGZiiXYjaTaXB4UGElJ5cacU4V0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com; spf=fail smtp.mailfrom=leica-geosystems.com; dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b=dfuNJwnM; arc=fail smtp.client-ip=40.107.162.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b="dfuNJwnM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xcqCJ0NbHCwHUlquWoXbfqFWTkbm2PLqepPVoiKh4ltiBjONZR58uzs4zXfRkdUbxJ2+DAsuvShxgNvuu9AwxrDkuHzavL7nMBZmlDpAj3b9Neh3EOSYiW0lm4t15KkOMD2AAexRES3tOgYyzW0S38nUOcGp061Kaz0S++WWcMMazY13Lnxt8miBGAvLkq0Gi7QkJNoX9VR0gxXwq5GR6gnpqVLA40SGUzlPRx+m1UzUI2vWOwYNz6Fu/aeSKSJpWTyID0qBswgf0lrasZzO4G6TszshuqoQgmfWgr1sh1jOd23blomvxw1kbEsJ7Jhn7dNE/l6RqVKBKxF14TyEVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YY7rMcxqP2rAwDJPSB6KS7LsXqmQvydyaHzNXoh2K2U=;
 b=gncFnHk7K9LJaWjRzg7KS/BRdLOaTSMqCuCLUTnRMiLex6pycDEjxd9paSGypsMScgEaohXUfWkAapOz/H5CpMioZDxipxoi7btXi4fAuJQKp+MiAHh27NgnJ61JxMeiHjJ/O7GEJ0zgbFRyOOkMIKmasesSeUlFLmOYe8UPIbwT87H23G0BIRczRngqrE69Me0fRknUmWCS6y/Nphuw+F9og/+nkLysAOjyloEJeE3B7qkFLY/Cx3cj0HXnfcpmnqkytdghqrhazoUJTkFqwMIqPF6HtNdYTj8qQYswqdytBCSYOav0ItTCDxLPfAx6DOAjnJF4sDVc+uca92ehGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YY7rMcxqP2rAwDJPSB6KS7LsXqmQvydyaHzNXoh2K2U=;
 b=dfuNJwnM9hQSEhmika5sjwjRmXJiSkPOogWXiJBnWATGjQ9duz4H69bMXr1AX3AWxQJarKeKJ+W6fghT7qaLqd4eKbLNUC3Syql2SLajtV5j8ND74imTnf79X5rlDx2Em9CVM0wOEBGE2KlRdQ2oAbBA3jpvUiSlRz60G1Ictm4=
Received: from AS9PR04CA0115.eurprd04.prod.outlook.com (2603:10a6:20b:531::25)
 by VI2PR06MB9090.eurprd06.prod.outlook.com (2603:10a6:800:227::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.26; Sat, 21 Jun
 2025 19:07:26 +0000
Received: from AMS0EPF000001B2.eurprd05.prod.outlook.com
 (2603:10a6:20b:531:cafe::1b) by AS9PR04CA0115.outlook.office365.com
 (2603:10a6:20b:531::25) with Microsoft SMTP Server (version=TLS1_3,
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
 15.20.8857.21 via Frontend Transport; Sat, 21 Jun 2025 19:07:26 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Sat, 21 Jun 2025 21:07:21 +0200
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Date: Sat, 21 Jun 2025 21:07:16 +0200
Subject: [PATCH 3/3] usb: dwc3: gadget: Simplify logic in
 dwc3_needs_extra_trb()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250621-dwc3-fix-gadget-mtp-v1-3-a45e6def71bb@leica-geosystems.com>
References: <20250621-dwc3-fix-gadget-mtp-v1-0-a45e6def71bb@leica-geosystems.com>
In-Reply-To: <20250621-dwc3-fix-gadget-mtp-v1-0-a45e6def71bb@leica-geosystems.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 bsp-development.geo@leica-geosystems.com, 
 Johannes Schneider <johannes.schneider@leica-geosystems.com>
X-Mailer: b4 0.14.2
X-OriginalArrivalTime: 21 Jun 2025 19:07:21.0609 (UTC) FILETIME=[B7296790:01DBE2DF]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001B2:EE_|VI2PR06MB9090:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e698a22-a4dd-4f3c-f880-08ddb0f6dc97
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MmE3ZExtTjE3b1BSUGhzbmh3U1pYdWtRNEZ6Q21wNlB0RStWcUNMS1pRb2Nx?=
 =?utf-8?B?UEpFQUJ0eUE3Mk9URHpLTW9HZ1hkN1QycDBteEVuUWJqRDV3ejk2MXdZeFIr?=
 =?utf-8?B?YWlQTVVpQVh4bEdYMk01ekE2N3BHeitJSGdPb0hCS1I1dVFIc3UyTHFzR2Nh?=
 =?utf-8?B?MVpadjFmUit4dEZzSFp2OE0xU2NieDh6cW5NenZjcG0rZkJ4ZlEySWdFRDBL?=
 =?utf-8?B?QkRrbzRIbkxSYXJ1VGtxcFdycmk5V2pubjBKdGFUVWRDVG5kTGJ3QkNRSUkr?=
 =?utf-8?B?eVFKNmtQc1o0ZGo0Ti9jOHNpVDRJMmQyemJ5U29HQnhPVG9HYkNxTTBqQUFO?=
 =?utf-8?B?cXJDUnVEbURmTVhMRWV5MDQxeG1SN0J0N2szODNsdS9yLzVHVlJ6WU5JbXQ4?=
 =?utf-8?B?QmNsM0dabkZqR1RZbHl5ZVRTZWV4cWdmelhmNVljcmJvL0VDRjlRMUVLZ2RV?=
 =?utf-8?B?ODNueVZQeE5QVlRmTjlVQllLQ0x3RzVUajgwL2xhMFB4UzhkSUdvc2NHWllv?=
 =?utf-8?B?NUJ0ekJacGVvYWlxeFB6QjZZS3pJWVJoTlNzOTRCL3VudmdpQmN0ODNUZUw1?=
 =?utf-8?B?YW5RWGVaMXpDOEhXRGRTWVpjdEVLMUsxMWl5TjJUdzVHUmxvOHBCN3VKWG01?=
 =?utf-8?B?MnJkNmwzdkNiU2N4Tm9RaG9sZnkyYVRwcGFBekV6dmxCUU55cU9kU2g5YlBD?=
 =?utf-8?B?dmFOcjRPZHlrNXZEZ3l0Z3JpTll3aVc5WHFyb0ZWeUNXNFVQb3ppSWRBRDhS?=
 =?utf-8?B?eWpEZldVVEdONzg0dHlsRWNNelVKeHI3VFZTaXpKMStkNWtQOTl4RTVZdlBW?=
 =?utf-8?B?bmFyVUZYU3R3YU5XOStOLzBDdU1ZVjE2RUczZTZ6VVQ1SW9sd21id25lWFZ3?=
 =?utf-8?B?Um1nYWdjM014ekJXVzl0Z09MWGRJaW9YSWpVM3Q0Z2NjMmh0MG1hVXF5UGdO?=
 =?utf-8?B?TVlMbUN5RWdJY05OSWRsYy9SZ0tTeDJUajUvTVZMTWRnZHJweEdMQVJyNXN6?=
 =?utf-8?B?ZUNLVUZZeHc1U3dMdkZMcVVlclQvUzM1UE53MkNOQkZvOGswVUNRSks3QnVs?=
 =?utf-8?B?OHpJVVdXYjBnTEwxQnJORDErUGRGSXo4ZU1GeEFZWmlJc3lsbTdSNHJLcGpw?=
 =?utf-8?B?dHI1bzNjZS9ZdmNrWVJSMFg2SnZOanpka21OUW9YMldtTVltU0YzT1hwNmM3?=
 =?utf-8?B?a0g1cDRZUlJUTkxFSWJqWC9Tdmt5OTcveEt6NEl4czhXcHVCVmd0a1V6b2Jk?=
 =?utf-8?B?Z3R4Rm5iK1ByM3FtTHRiVWFOdEZiSGR0ZE51Y0x5Y3hqb0k4Yys3TUFYZEZp?=
 =?utf-8?B?Zkw3eStTSXZaQnhEM01LWXE5TU16VHdKYXlxdURXT25FKzdkWnBKZkNuWEQv?=
 =?utf-8?B?aitJZ005QzNGUEFQdWdrYWs1TEZId2NEY2c3OVozRk1kR21vNjc1VnlBYkVq?=
 =?utf-8?B?ZXRab0U0bCswdlNWTG5lU2RSMmFvZlBwYmNHeDN5ajdnUTlGNVZkTDJlL1hz?=
 =?utf-8?B?Mm9pOXQ3U1prL1Y0YjFrbGtUK0p1WFV5cmszd0ZlWXdjMjhGMWV1eUFIZDVF?=
 =?utf-8?B?UDBJZ2RLaHJ5WmVQNzBVNmxFb3RJVGFmak82bENIOVBnQlVHNTBlUTExT3E4?=
 =?utf-8?B?bmJrcjNzQVhHVDB4dEF2TExXY3doTXVialJ4U0JmaFdqTzJmaXl6d3V0RUlG?=
 =?utf-8?B?NzVpOXgrVjh2SFhEQzgxT3Z0VlppV2pzWnR1cUpyejdMdkZINzA2dFhDbm40?=
 =?utf-8?B?VXFEWlByakVNVUhBaVM1L3NNcW1QdzBsRmJUaHVxeDBpUGZEQ3ZPNG8vNHVi?=
 =?utf-8?B?TWpDZTZkN3lWTkdHQ29YMTJITVF2enk0UDExVTBtcU1RcjNVVlFTOUw5Si9G?=
 =?utf-8?B?SHhhaWFNaEY4QXh5bElBNHVMUGtHOUdsczA0dURpZTh3cDFkVFY1WmdmL1pQ?=
 =?utf-8?B?S0xsSXdJS0NKMnA1TWN1Si9WNUljZ0t4dzBJeUt6OXBGeWNmdzhPWmdhbXdC?=
 =?utf-8?B?ZnBZUVBVWWkvQTdPTnpJaGdFSkgra1VkS3AraDhzeUY5RzVRU2dhNHVoVzhG?=
 =?utf-8?Q?mYFPwn?=
X-Forefront-Antispam-Report:
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2025 19:07:26.4931
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e698a22-a4dd-4f3c-f880-08ddb0f6dc97
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001B2.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR06MB9090

The existing logic in dwc3_needs_extra_trb() checks multiple conditions
in a compound expression to determine whether an extra TRB is needed,
either for a ZLP or to handle short OUT transfers.

This commit simplifies the logic without changing behavior:
- Returns false early for isochronous endpoints
- Separates the conditions for IN vs OUT transfers
- Makes intent and flow easier to read and reason about

No functional changes intended.

Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.com>
---
 drivers/usb/dwc3/gadget.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index a4a2bf273f943fa112f49979297023a732e0af2e..32d0fb090f4c2ffab61ae6eee29a02efd32ed032 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -1420,12 +1420,13 @@ static bool dwc3_needs_extra_trb(struct dwc3_ep *dep, struct dwc3_request *req)
 	unsigned int maxp = usb_endpoint_maxp(dep->endpoint.desc);
 	unsigned int rem = req->request.length % maxp;
 
-	if ((req->request.length && req->request.zero && !rem &&
-			!usb_endpoint_xfer_isoc(dep->endpoint.desc)) ||
-			(!req->direction && rem))
-		return true;
+	if (usb_endpoint_xfer_isoc(dep->endpoint.desc))
+		return false;
+
+	if (!req->direction) /* OUT transfers */
+		return rem != 0;
 
-	return false;
+	return rem == 0;
 }
 
 /**

-- 
2.34.1

