Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11013033.outbound.protection.outlook.com [52.101.127.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8B215B102;
	Thu,  8 May 2025 05:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746683786; cv=fail; b=NC8r+IurikS+uQZwbwTnK6WbHbrN/RtB6c68Yv7HSH3Ic1iF34WbmaJKqELMV1vVgl6b7c2O29MzsIlGYjU8JlEQEBmRPDu7lJ9dq8V0ZODcMeSPkhKqtl6LfEuM0yu1wtdm9S49vZzt2W+C738hN6pvkTUjr31qEAFc67dfdXs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746683786; c=relaxed/simple;
	bh=Yuc9rvXoS2bwTM3+KfVZW4cZa5tZlV+A81IhAkW/YYA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=mENvSjWXvlRp8uUag076Dr3k0roqao0TqLfI0OiKav7St5ILMqUcrx+gZNS6fIYFSRzN9eGe3Ysg47pNQZmO5xDGBUhUnMNJ4gsgjD/pmOanCQlqQZ9ydoImvwFNAUgk6zdGMee0xxdUrylos8Qtopl+GAa8oMThZmwU/qzrLyI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; spf=pass smtp.mailfrom=wiwynn.com; dkim=pass (2048-bit key) header.d=wiwynn.com header.i=@wiwynn.com header.b=P2VzNdd5; arc=fail smtp.client-ip=52.101.127.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wiwynn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wiwynn.com header.i=@wiwynn.com header.b="P2VzNdd5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H4BgVT+aT3bUwlcP4yHMroVDHwJ7iLZ83uhTtXONQjctterRUEQZsfwwr3QxqvBoogs8UuLKph+AYxh6HeF4ehSJqt3p58U/74pdlAD6JEGeW29/4TaWHNTDm8qorjQRHlGd99/M3Rvp3HlyL6yLscrXMptx1UdUI22uCRgmZPMkWXmcRxxNNiyv34Jr7q1YrKqBjcSpAT8EeRr5e8sF2nuqvF9p1V4qq9NHYv5J73nB0uzwwRG0WqwWCB6gJRD4Pq060q3yM7bIMK1Eup+HxrxGFuMQRk4zXfgLbDHt7+2RTKoRdqYS+Hbd6xdXdz0fyAGubcB7pPy1QpBYV3FE2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E9pT+X53FMlPm/ampBllVyPBsPRYDRC0bt9PWv7nsFw=;
 b=G/9JbC04zOwikdKflY9WxxWYcaf7ZAtT/+pYQksAn/7Wv0GsjVO8GFXYCrc3nCqgRgUbucB2rqaDumt5gZob03vbxBjDY7nuALp3IoIagVAlGlu8s2ILjiKZlwVBTv+F/zeJaig4kMV4MXu9m/5ZXel9ckBoNeGNx0xzr0axrnUEsJ5JFrDN5nL0XnP+nYW5JRmz3LZj2gU26hR7eYy5TAIgKNe/IvIU2WpVStYQx5XNSJNGZFQZYq+fK+U4PXUOo1eud5c+KtT99ge9pQ9WZHeWjbt5ZQtjH83PwvlmvkRzGG6HgHDS9FRaC92Hu648ygq44h1WOjDMZ/YyppkGIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E9pT+X53FMlPm/ampBllVyPBsPRYDRC0bt9PWv7nsFw=;
 b=P2VzNdd5h9VRAPUdwB1rnsygktm8UghSP03P1ZO+V0dk4GiSiUCD0ctnjSlFQYqaT+TLoXkq/T0l84by3v2dg86pcsSzzqfleMAecV6AYNLcXley5TsiVXxgLZR2KZcGJZf/220ac9tychkQPAQP0PG94m5moez11QAbOr09q5k1/STR0pV/9IgSdAYw+bo/S+cjBdHCBW0JkuKWqoQQhOgoBu1fpgdIlGqt5j8IDb0JxGEKOL8pY3mbJ5AM/TQZAxsZBi5CxySamIwFgKuVDrjBz6p4CgJwPoTCNzY11oyu3lBtovQezw1nARoaoEuZWcDxZ6ZYZ3DnF4cHMGq8+g==
Received: from SG2PR04CA0214.apcprd04.prod.outlook.com (2603:1096:4:187::17)
 by TY0PR04MB6254.apcprd04.prod.outlook.com (2603:1096:400:329::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Thu, 8 May
 2025 05:56:18 +0000
Received: from SG1PEPF000082E8.apcprd02.prod.outlook.com
 (2603:1096:4:187:cafe::3) by SG2PR04CA0214.outlook.office365.com
 (2603:1096:4:187::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.23 via Frontend Transport; Thu,
 8 May 2025 05:56:17 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG1PEPF000082E8.mail.protection.outlook.com (10.167.240.11) with Microsoft
 SMTP Server id 15.20.8722.18 via Frontend Transport; Thu, 8 May 2025 05:56:16
 +0000
From: Delphine CC Chiu <delphine_cc_chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Marshall Zhan <marshall.zhan.wiwynn@gmail.com>,
	Delphine CC Chiu <delphine_cc_chiu@wiwynn.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] arm: dts: aspeed: yosemite4: add gpio name for uart mux sel
Date: Thu,  8 May 2025 13:56:11 +0800
Message-Id: <20250508055612.2613605-1-delphine_cc_chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E8:EE_|TY0PR04MB6254:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b9c1fcb2-18d2-4df1-23fe-08dd8df50c75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8HzAaJutdJo4Ni+2QkyO5Z+JJWBPSkGbglCqxPZBjiDQb/792qbDaVRXgcVk?=
 =?us-ascii?Q?Sn0UWEoPVzukVp7gx0WS0Cj8umFePYug0sDEIZP38rWfGBmDBuPLq9C//4dv?=
 =?us-ascii?Q?cmEPtBHyaPsedg2q2SuwE3gL25jk/jyYHWjFDwDOaYxIlsr1KXoJ4S1tTJdo?=
 =?us-ascii?Q?N8FTwRq3cfhCMVHphPyt7rFIRaVYL4PHI4FDPeFZT2uBU9Qx5mq6PTzfhZi9?=
 =?us-ascii?Q?4MR4ko39ksUeibTkj5A5boefIxP0fbji+BcUqnhGkrO9mDa4/R3f1KFZC7YM?=
 =?us-ascii?Q?jg/A6eOU6qu63gs0zvTC3EojroWAgqPrDP0j+6rNnJxee6hYLCuFWy+vJLjV?=
 =?us-ascii?Q?vuOpE72cm9WAP8RkEN+cCgx+/Van1JVhfnUUwdXygnd+6hp5Ksm+LoL33BgL?=
 =?us-ascii?Q?VQE65mEPTztMewlziW5uEWRDmrE25/Zc3uDkEGSCojT8XxqP7xf3Z1b3+m+R?=
 =?us-ascii?Q?6iWMY2CihmvLX433uMYK9faxrGSOnAoMYUNS/g7fICBLGxMgLZHb6so2FJ0k?=
 =?us-ascii?Q?tMUmf3VEi6N1dCTgGb1/2VkDYCgiGuarkIIvToHvKlNAvNe6TmVG1KosNbpC?=
 =?us-ascii?Q?y+0fFrsKchE08FxaOKkm03PcAI4oa9dVz0IE6eHGx8xCY1r7V+cC6O1a+ZHt?=
 =?us-ascii?Q?xcX3cNhKpM33EbUgSmnptHMFmYLC1dwe4nyUqmo0rHN0g1sFoWrisHIynIBH?=
 =?us-ascii?Q?FVpxaR9ksExwVsBcqNCzVMnnIOvT2ILJE9BDXc+dIuA/TyEN1fDI6ilnVIPy?=
 =?us-ascii?Q?5LoFxJb7eMn91ksMyQPIo8DoAHBAV/k4uIzwsCZkGFJxa/bVW/yQTFj15tJW?=
 =?us-ascii?Q?fV+a7Xqide5KOYyTV722Ikp+7/+r/O1cPpKffE5UwIpiS5HedGwD+AB4aXdp?=
 =?us-ascii?Q?PlvCo1PXPUcb7b6pvkdIzFcWiA0cQ9usdfMqlx2TXc2Rw5fL1vJ+erWXd8Xq?=
 =?us-ascii?Q?pydpGkwAFrqfPEmdoFbxoytDG4pPx7DKbfyU3G8h9sP7pO1HPox4kcKl93UQ?=
 =?us-ascii?Q?ZTN2gyZrnmqVEYvYzz6yfe0Pc0GN8u25R1qIvOWThG05LkTMcw4K4NUzsO5G?=
 =?us-ascii?Q?cYuqj2BiqwWN67M7nzJrP/DMF2Dpn1phD69Yiq+oMXJKXZ4fidf/cHdwAGo3?=
 =?us-ascii?Q?GVmqoNLKit5jm7NVYNIdZcbdeREt2KpqKKIucQoR6OEHrJQjD+GgNFVyjvz2?=
 =?us-ascii?Q?is+i9mabSfMIVK730wL6oMy0lx0wAPiJBvgQ2G11ORf+Ku6gQywpacFu+Lzn?=
 =?us-ascii?Q?fTMwToQIbVLP8lEpEpHkVj/KHxEklRMqvBbE1m436JcIbO1J1BOeuT2VXhhY?=
 =?us-ascii?Q?koc3VnrnvMECPUnaiRxqo1aPQuXyVNbFUQT8srKizYTyDYbuykxo9wy+Ab3j?=
 =?us-ascii?Q?KnjRUaE742pp829IGoF8obzeHgjZKoyFCje2F9vhE0r2+K70+Cw4ANs6ZFm7?=
 =?us-ascii?Q?/Mn0CpjUowt6qYhFkYxzrRH4jGYaleEBsXfGGLejrj6hJL2FtgFl1irXlGCI?=
 =?us-ascii?Q?N+gUym2CHsqqdfL4w0DzfKAy4gdTP2rbDyeI?=
X-Forefront-Antispam-Report:
	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 05:56:16.4775
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9c1fcb2-18d2-4df1-23fe-08dd8df50c75
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource:
	SG1PEPF000082E8.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR04MB6254

From: Marshall Zhan <marshall.zhan.wiwynn@gmail.com>

Add gpio line name to support multiplexed console

Signed-off-by: Marshall Zhan <marshall.zhan.wiwynn@gmail.com>
Signed-off-by: Delphine CC Chiu <delphine_cc_chiu@wiwynn.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 29f224bccd63..ac0678aef7d2 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -189,6 +189,11 @@ gpio@22 {
 		reg = <0x22>;
 		gpio-controller;
 		#gpio-cells = <2>;
+		gpio-line-names = "SLOT1_UART_SEL0","SLOT1_UART_SEL1",
+                                  "SLOT1_UART_SEL2","","","","","",
+                                  "","","","","","","","",
+                                  "","","","","","","","",
+                                  "","","","","","","","";
 	};
 
 	gpio@23 {
@@ -235,6 +240,11 @@ gpio@22 {
 		reg = <0x22>;
 		gpio-controller;
 		#gpio-cells = <2>;
+		gpio-line-names = "SLOT2_UART_SEL0","SLOT2_UART_SEL1",
+                                  "SLOT2_UART_SEL2","","","","","",
+                                  "","","","","","","","",
+                                  "","","","","","","","",
+                                  "","","","","","","","";
 	};
 
 	gpio@23 {
@@ -281,6 +291,11 @@ gpio@22 {
 		reg = <0x22>;
 		gpio-controller;
 		#gpio-cells = <2>;
+		gpio-line-names = "SLOT3_UART_SEL0","SLOT3_UART_SEL1",
+                                  "SLOT3_UART_SEL2","","","","","",
+                                  "","","","","","","","",
+                                  "","","","","","","","",
+                                  "","","","","","","","";
 	};
 
 	gpio@23 {
@@ -327,6 +342,12 @@ gpio@22 {
 		reg = <0x22>;
 		gpio-controller;
 		#gpio-cells = <2>;
+		gpio-line-names = "SLOT4_UART_SEL0","SLOT4_UART_SEL1",
+                                  "SLOT4_UART_SEL2","","","","","",
+                                  "","","","","","","","",
+                                  "","","","","","","","",
+                                  "","","","","","","","";
+
 	};
 
 	gpio@23 {
@@ -373,6 +394,11 @@ gpio@22 {
 		reg = <0x22>;
 		gpio-controller;
 		#gpio-cells = <2>;
+		gpio-line-names = "SLOT5_UART_SEL0","SLOT5_UART_SEL1",
+				  "SLOT5_UART_SEL2","","","","","",
+				  "","","","","","","","",
+				  "","","","","","","","",
+				  "","","","","","","","";
 	};
 
 	gpio@23 {
@@ -419,6 +445,11 @@ gpio@22 {
 		reg = <0x22>;
 		gpio-controller;
 		#gpio-cells = <2>;
+		gpio-line-names = "SLOT6_UART_SEL0","SLOT6_UART_SEL1",
+                                  "SLOT6_UART_SEL2","","","","","",
+                                  "","","","","","","","",
+                                  "","","","","","","","",
+                                  "","","","","","","","";
 	};
 
 	gpio@23 {
@@ -465,6 +496,11 @@ gpio@22 {
 		reg = <0x22>;
 		gpio-controller;
 		#gpio-cells = <2>;
+		gpio-line-names = "SLOT7_UART_SEL0","SLOT7_UART_SEL1",
+                                  "SLOT7_UART_SEL2","","","","","",
+                                  "","","","","","","","",
+                                  "","","","","","","","",
+                                  "","","","","","","","";
 	};
 
 	gpio@23 {
@@ -511,6 +547,11 @@ gpio@22 {
 		reg = <0x22>;
 		gpio-controller;
 		#gpio-cells = <2>;
+		gpio-line-names = "SLOT8_UART_SEL0","SLOT8_UART_SEL1",
+                                  "SLOT8_UART_SEL2","","","","","",
+                                  "","","","","","","","",
+                                  "","","","","","","","",
+                                  "","","","","","","","";
 	};
 
 	gpio@23 {
-- 
2.25.1

