Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011002.outbound.protection.outlook.com [52.101.70.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC041F4632;
	Tue, 11 Feb 2025 10:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739271528; cv=fail; b=O1s2pDjnM+azL2pnDqdcV0gLdSVZUaeNqfsffWFaggquEjR9KY6MOrYhMA+x07TQfay5spfQXwCcqcnL4eO2vyEN8VZLIXcu6I8NXMM9rsEfZxuZMdzFO+4slbatsBUoNfIr0Wro9rtOvLfxx4fEK0/I9tNVfsqz16hBcf8yztE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739271528; c=relaxed/simple;
	bh=XZD4Na7FizcrSSaenZBIQpPZ0kAOa9QVs5tOFQdUp5w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tbQmEYjYMN69vfI5/0Z9K6AKDuLC/L50Fr6dBWAy3HkkOU/L6l5gRD5Eo8Q0qMACEW6pjFWpRFHu2KAIV69eL2NRG0LOTdpeb2jzVON1r3Cz1Mugi/f8SegDnAWXpxPqUfAFmEQFiYDk72L+CXC/H8I7O0aBpm7viv7z40nz3rc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com; spf=fail smtp.mailfrom=leica-geosystems.com; dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b=NKFnJSo1; arc=fail smtp.client-ip=52.101.70.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b="NKFnJSo1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FEVmBa0069MAjIsPqO9AOh0xRS0RxuVsmhFjrHJaCind7On1AKwCwApiudpVQPGmFZph1lEaWuRdHXTmsPg2RyHit/P19+jzTEjm5grOzVguKDLFgUm4rqpotHTLjrRMYsUIqdxUMSx38bKeD6i6LV32QJpdJwo7/fLlb5L8r8jYS/TYTsryISxWD0rSSmYYI9jEK11a61eLhMlrfoEwe/EqGZzFmyVJVESPeLq4NmWyfUynAoT2Ncd1iLZzGlBqmaPgld/eWK/ogi9DAQ5Q28IamEhamsfJoMST+MLLbmzFEhfUCyAByoW/VgQBQDlG9Q9bngAMQYgMgojRIm5+qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9MVuzxfa2FmNeP8/oOW6qchp2+jgvW/QGUlG14SQK/U=;
 b=q633jjHpZjWZkRhY3lXQXTORZEwaJAMarnPyatK/KUENYjJYfOPBPegp4Heg+cs+Pca9Eaz2ZKaS2JGS6DvGjBeBfxeh6WvPstHK3WyAtniwHta6SbX2XHJtMqgmI7ZZDTBw09PHP4vZzGvy3Nr52jQ1udInCiIHWjHGXhhf3UANwstrq9rns4hZ9gQ98IkBQAO4OO18udaqinNhuUj0vAnAecPMcSMxAi8wys2egjFqka/TNuoGrwNth41tm3J8hXlF2UZhjmjK5e4XMp8VpDPgcanQODcP6v55lDcyANl5P71OzRLTUcjGtJZLZjZxMc7/jGTkcXHfNYr5hIhRVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9MVuzxfa2FmNeP8/oOW6qchp2+jgvW/QGUlG14SQK/U=;
 b=NKFnJSo1s6UFTmB0Jv1NdlfSCJsMU/K06IJ0Dru/7mB3EmtKfXmPZWJ51vaGj/6OKTCqQn/ETkSAiDdwv0huMjaW4ZxKdqu9RTwpflVzUCZtw3ukdxuSJTKGhZffpoyTCvg0cn51RnMsjKNVEi/myyR/zodJk4XH6pScnOglHMA=
Received: from DUZP191CA0028.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f8::24)
 by PA1PR06MB9774.eurprd06.prod.outlook.com (2603:10a6:102:441::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Tue, 11 Feb
 2025 10:58:43 +0000
Received: from DB5PEPF00014B97.eurprd02.prod.outlook.com
 (2603:10a6:10:4f8:cafe::d9) by DUZP191CA0028.outlook.office365.com
 (2603:10a6:10:4f8::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.31 via Frontend Transport; Tue,
 11 Feb 2025 10:58:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 DB5PEPF00014B97.mail.protection.outlook.com (10.167.8.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8445.10 via Frontend Transport; Tue, 11 Feb 2025 10:58:42 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Tue, 11 Feb 2025 11:58:42 +0100
From: Catalin Popescu <catalin.popescu@leica-geosystems.com>
To: gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	festevam@gmail.com
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	m.felsch@pengutronix.de,
	bsp-development.geo@leica-geosystems.com,
	Catalin Popescu <catalin.popescu@leica-geosystems.com>
Subject: [PATCH next 2/3] dt-bindings: usb: microchip,usb2514: add support for USB2512/USB2513
Date: Tue, 11 Feb 2025 11:58:38 +0100
Message-Id: <20250211105839.3328105-2-catalin.popescu@leica-geosystems.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250211105839.3328105-1-catalin.popescu@leica-geosystems.com>
References: <20250211105839.3328105-1-catalin.popescu@leica-geosystems.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 11 Feb 2025 10:58:42.0393 (UTC) FILETIME=[E9D89490:01DB7C73]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B97:EE_|PA1PR06MB9774:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 3a476094-7eb3-4357-6e03-08dd4a8b0c91
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rQKAN8W21pAsrzFHoGtgVHO8D8cf38OEgP4ynHcSnfLp00SDC91DfjQ/6tJe?=
 =?us-ascii?Q?gMQrZO6+fl2plUmk9/Z/jx3ciLVRtQJVsaAwaeoD6JS51i2cO33PVyHYu1/+?=
 =?us-ascii?Q?kV69X5oxBpRodecmqHcNDnA01RpFvVDmjcmX4IBjLMvyLEOhUh2XieRm6jXt?=
 =?us-ascii?Q?rbCHM1qZu7iRoiM57ISCzL876IIQpopvFJYEo0VkhXUhjX5jdF4BWiQA8RgY?=
 =?us-ascii?Q?GMUzWzJ3UMxj5sdyKDxOG2kVHh+dn80b6oKpW28veMQ+VjTlNkaf8o2IRTKC?=
 =?us-ascii?Q?5EysqsN7fYY7enWb/7nR2sdnZPcf3TJPs0Wz3JDSWzzgII85Gs+uvUAYSzmP?=
 =?us-ascii?Q?VCrQ1R6/1d99COzfglUbsJalCoA3vI2qB4ZJthC5ZPpoflOdg4tVNer4j8a1?=
 =?us-ascii?Q?/GSfwFmS6D9lvp8OoF1/AM+F1UFT8RzopM5lpOSsDzwKbsO8yzH7To7si1N+?=
 =?us-ascii?Q?CSXH9xhLy8SMEXJ/SjfqzyIZdbGQrEfWfHzsbpDQqNsMnvAfTA9sAipySsa5?=
 =?us-ascii?Q?LHoNrsNMVwy7puX0ieON92C/GbO+ryUiqE5XZJTzt/elgjsh5Z1e9OPEAH5d?=
 =?us-ascii?Q?AIb1o/484ZLvdNPzl60ZRYxGnn477ePXCzNDCMeCEmJpqbqr2AoFpgvXrASL?=
 =?us-ascii?Q?0AFhRlllQv1c4Ywets6Ma2AUg+xOjDnd5GHokqPXuGFVn8URIV4eW7Hn47ma?=
 =?us-ascii?Q?6RFGJ0uilRqaj/z6jZh2sbZmW4jkN3t98Nr1RdW0te2rPrzFuY5xQb0CVzRv?=
 =?us-ascii?Q?z4Jhfnm4pHIzBeHRCZohSP1Am+23/y1tXou8PORy7vWJTVV56maXKi9wOMlt?=
 =?us-ascii?Q?vWomFaIHiejSLzm8hnTAJ3PbhB54ElP8L/RbGnclSWp7IY6ehOQDGtfwKIn9?=
 =?us-ascii?Q?fBVRSaaXRkdEtEqryI/uOWppNcW7RGQVJhxyCqT9DENu70r2ZdK54EgEpt5f?=
 =?us-ascii?Q?Zx2eC2xa9SDUjDVq4r178IhfOGSamljWnL7mxF/XU3hi0v2xLnhK+9d/kR5x?=
 =?us-ascii?Q?I2kIgF+C+ZvQySdwiJgINKyLNzmz/JdlbvYdltgkr8x8Psw+9F+afwp1tbTr?=
 =?us-ascii?Q?lqb7QRSgxBTwQ9ADdI2hwv0PEHAsjXH1eqH9Y/PQXzOS+FArz34vN//BUrOK?=
 =?us-ascii?Q?SSxvFNyQBMaIQMlPtKpTcWNZ9FDNnGbdE6lOh7eVydmZqMjlY9yhn7O9wU4W?=
 =?us-ascii?Q?7Dz1i6NSaHb303eKJ76CIkceOEZ1PB6X3UcqpnzcM1TQ0kAKHFHOauiMEVdd?=
 =?us-ascii?Q?vpJg7WPl8I3B7Gjsti/5mtiG7crU01qXXavrhrZNiKYF9BUHIgJbJNm62iRo?=
 =?us-ascii?Q?y8ebQ23tyz7aFu3Zrqh54J4hbAvPCfCrPpxsNaQUed23bT7MWqhEkzl//Kfn?=
 =?us-ascii?Q?GChz9f6DnrMH9XvNfMbwhwrx44+n72iV4TWDquXR1wuDWuqYB7NyuQzUwZh2?=
 =?us-ascii?Q?ChUzF9urkl+4RuGcWvJIpffeCZIuWfiugXNNOiaTlwhQDtQTYwmetFXwWSpZ?=
 =?us-ascii?Q?G7ZmXa7VYtZuR9Y=3D?=
X-Forefront-Antispam-Report:
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 10:58:42.6839
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a476094-7eb3-4357-6e03-08dd4a8b0c91
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B97.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR06MB9774

Extend support to Microchip hubs USB2512 & USB2513 which are identical
to USB2514 but offer less downstream ports (i.e. respectively 2 and 3
ports).

Signed-off-by: Catalin Popescu <catalin.popescu@leica-geosystems.com>
---
 .../bindings/usb/microchip,usb2514.yaml         | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/microchip,usb2514.yaml b/Documentation/devicetree/bindings/usb/microchip,usb2514.yaml
index 743f7a22f13d..d159cde04c84 100644
--- a/Documentation/devicetree/bindings/usb/microchip,usb2514.yaml
+++ b/Documentation/devicetree/bindings/usb/microchip,usb2514.yaml
@@ -14,11 +14,18 @@ allOf:
 
 properties:
   compatible:
-    enum:
-      - usb424,2412
-      - usb424,2417
-      - usb424,2514
-      - usb424,2517
+    oneOf:
+      - items:
+          - enum:
+              - usb424,2412
+              - usb424,2417
+              - usb424,2514
+              - usb424,2517
+      - items:
+          - enum:
+              - usb424,2512
+              - usb424,2513
+          - const: usb424,2514
 
   reg: true
 
-- 
2.34.1

