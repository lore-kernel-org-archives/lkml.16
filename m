Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013034.outbound.protection.outlook.com [40.107.162.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74BC1F7902;
	Tue, 11 Feb 2025 10:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739271530; cv=fail; b=AIeiiWPyBzj1CoT/5bqEyqe82vt5bL5raXO9BMcO7pIWdln9XFQtZS1FJNPLIgaaa8b4X6oL6SBXE5rxMcvoprca91xXb1LBqWYjnfRL/q3W4KcsjW5kjwOhKBawyCEi67aLzSKvghIngwrzuawH184Lc5zva7oipZ0fL1E7UgA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739271530; c=relaxed/simple;
	bh=J2Kf9O3L7RDlc/Ka8w+Dg7o3jI1MBTOUObSBqwjvTHo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ChzOmvxMA3nPbU6Clw7K8/CyOC4hA87eAFJdsLwOa+f+p6bADErR3uLKF+R6A9fajOyd8ZmOUjdZAHjf2PJeGBJT8ER9BpXnWzGOTca9Yi5jO8XUgLFTo5xue0gK6Gsi7dCzGiTAD0LfBacqEekrXGGsFkzIPGgDLj6vIimCq8Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com; spf=fail smtp.mailfrom=leica-geosystems.com; dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b=QR4nlkrk; arc=fail smtp.client-ip=40.107.162.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b="QR4nlkrk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AaYTKr+f5nQzJFnGWrt2yOS0UpwIK7FwgsuOH1raHTbkJmJ4PPZV/OaoyKHnSCmYk+CnRxYGYkoZvgjPWY7+8m1k8mKAY0wjEENpz6YlPf6fU4huGt6ZItul5zoghZ9dQpRTKIWUJYzpJiEFEVSiL/A9lohJ4UjtI9cD2hAfaWyS/6+diB3UkfC3HYtS4qQTnh7sZAK5uN8YXE5HUcc95tQiNj9TMlMkD8GE4roIAAUtAbXFFg2Aiaxw14O2dactZxtScn172g7gkdlAtkFx/t4JbUtxVUJXHTCbIv0ULcWc3B/HT5+2C5z7ECIBKbcwdoabM7CuqVJ/WSlfqOGm6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u+jSjXG+SU9IJ68DVWe4x1idfOEaHoVs8EPRHlEB3Zo=;
 b=bQ/caDAPkV1jMr4J/DXw9V7GQSuDSwYBBxKKrLF1x1OLu+j3+zd0V5SeQAXAAYfX/tO/CqhrpJEoVTGjlRLqroxTlESermpX06mT81/hYGXuN1JLk3mgBtYEdF6gYIqqXmjY0m1MzOJ7cJQ6fbxdkxlF9HnvAMmhh55ifOn/EoJTTL2NbASaeNWt78DW0k+X+mMZCtpNyTt9SYGMD5vB6i1bCrXOaEfFK3gTmfq4UJjz4LZZZjjR8BcDcElLP2JzMZGnSouiTBnqmaNEQtFSD2UQmBWCEzaWSl5tafPdCz9yZCfbjkswxMstQmT1jpwNwGfDuB8XJqVZCL0AUAzYmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u+jSjXG+SU9IJ68DVWe4x1idfOEaHoVs8EPRHlEB3Zo=;
 b=QR4nlkrka28MGonrATab+kD0/whEAwLXVRJzMC4nRE/cK93owppvwakWQR043qS85yg9V2IXeP/YGFiM5gZBdB/JGWhGdgc+UHEOPJo0wPTMKBORSdz3VG3zI/bW2m0mveJiBoAxgIlrp/ThCfEG32i48c/Umg2GPP/PIcwEDl4=
Received: from DUZP191CA0043.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f8::26)
 by DUZPR06MB8868.eurprd06.prod.outlook.com (2603:10a6:10:4ae::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Tue, 11 Feb
 2025 10:58:44 +0000
Received: from DB5PEPF00014B97.eurprd02.prod.outlook.com
 (2603:10a6:10:4f8:cafe::11) by DUZP191CA0043.outlook.office365.com
 (2603:10a6:10:4f8::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.31 via Frontend Transport; Tue,
 11 Feb 2025 10:58:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 DB5PEPF00014B97.mail.protection.outlook.com (10.167.8.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8445.10 via Frontend Transport; Tue, 11 Feb 2025 10:58:44 +0000
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
Subject: [PATCH next 3/3] usb: misc: onboard_dev: add vdda support for Microchip USB2514
Date: Tue, 11 Feb 2025 11:58:39 +0100
Message-Id: <20250211105839.3328105-3-catalin.popescu@leica-geosystems.com>
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
X-OriginalArrivalTime: 11 Feb 2025 10:58:42.0956 (UTC) FILETIME=[EA2E7CC0:01DB7C73]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B97:EE_|DUZPR06MB8868:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ea67311b-94e9-454a-161a-08dd4a8b0d5c
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SZCeKw3SAjzAkXl/e8lCw646UEUo3TBE2J1X6xDz/obr1d+X1kG8YWYF5e1v?=
 =?us-ascii?Q?edMZU18xqKuz4a2kYl3qhUnW6z6FyKieXA5mx7gKBildqlRwzCVtUQgmWGKJ?=
 =?us-ascii?Q?TxtFCbo1CO01BX+3ewRolbuEfp7WMoDSus1rvW1KxvPhgq7WP0IOu6IeGbP5?=
 =?us-ascii?Q?tObvnY4DVxYlGB0rkcBMSQxZYDr9laQ7UwH++m7fcCta3dtFQoryoSkB9wgw?=
 =?us-ascii?Q?4NZ5O1tH+6mDrewicjKbivEUTJXbVLurADn7372TTJaLn9miw9E7L35geXoP?=
 =?us-ascii?Q?FWcXhZTowriuOQXzs9PRcO0OD61uSl13R2ETP45IEm3EdUnSpPl3LhI3457G?=
 =?us-ascii?Q?il0sG/2SYsgdsZXMQgGaGpkhvyL71k3hUnToDrtoqlDwzq165tSSCMTt3kTd?=
 =?us-ascii?Q?s2ef1C3iw0CrMDDb0s7Wgoxe8KQl8VCMANNBYruHdCn8vdO+WHjZTHarwcGS?=
 =?us-ascii?Q?X2GLOluLL7/xwPAVvq5uOWONl2jSU1kPABebronalBZiBU21aF8u6WlMVNoL?=
 =?us-ascii?Q?5c6hnfbafOc+TrPKP28NEMQw4MMeMcGMX17O4hhpUbIA9NZCDWSNxx9DFMa4?=
 =?us-ascii?Q?VieUtkcUpmWaeuwD0bNTnDz8tT9iMofb593pbXI7ZQqGhdJMmO2XyhRyALuI?=
 =?us-ascii?Q?RbIW3uH30EMMk4tO3nVP3oKqNPx5dQAHk1qucwlbbp4SWU22mFxtQT7wOpZ1?=
 =?us-ascii?Q?6g2TGAFIi3lpEdIcAi/opO3BtvTowNuVZSaV2YCpWr6Lj46XD3RQzdR8xtoN?=
 =?us-ascii?Q?hKwAN98EiyiCqGYFDhz+VLldjqIml3GZBT5wohrvvQ+JEDzMuySMCr6TWxvq?=
 =?us-ascii?Q?KIoPy/65KlKFV8Sig3AhYXs1ChYeyUgXjzYaHzNQNSwdWCe3d8x7c0b6eE8Z?=
 =?us-ascii?Q?tf56yQG3diznsfDODqNJp4sHLRYa9wYXjaEaMKIRGwmi1q4ocgaL/ouycqAe?=
 =?us-ascii?Q?ZMOIPU8s/5iK0gsFFJChVrlZhQPITMkkcHDExoAkZtt86vnF1wspDGPbCg08?=
 =?us-ascii?Q?8mFAFvUwdHNXEEluClgkSPsdMM4KEc0jyz7thaeNkbIQStpyQ5tNb6AMdLFN?=
 =?us-ascii?Q?8iTTfKENRq0vCplgcKsFBL9wcW0ov68B3EQhSOMD4uF46BKFfw9IodZgTbXZ?=
 =?us-ascii?Q?aubspt1Ip3U5dg70/U04tzFk2KSAp+mzSrm9ZQiRlzWdJRM2LJZWFXoltgJ8?=
 =?us-ascii?Q?L98f+N8ZkMdIkJIxMP7n6mRb707s6MgGcTxsz2YLo6ZFEsZE2R1mtjeLiCDL?=
 =?us-ascii?Q?TDnWaHlj2WYuN9VEWTt/pvWOWoPybC142mEeydFBc7TDW0hZQ/l3mT4tGWB/?=
 =?us-ascii?Q?11Rtra66G4T5RtvlqgwDVUyKXbRv7s8P+kCfa+Q2TxgE4UXKnRG8Yxr0bXEO?=
 =?us-ascii?Q?20SNdYMWIS7bWdll075uZEnrTIID0FyT94E/iRmuZU1eltS1/2SUNRyDMhCK?=
 =?us-ascii?Q?bgczOnVaRb6JjFuvhaAsg3kTYe1i6j6Jo+h2wYGeve1Od8iy9E9r1oxrmb8K?=
 =?us-ascii?Q?Gig1QEQVLgrW2ds=3D?=
X-Forefront-Antispam-Report:
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 10:58:44.0120
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea67311b-94e9-454a-161a-08dd4a8b0d5c
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B97.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR06MB8868

This hub is powered by digital and analog 3V3 power rails, so provide
the possibility to use different regulators for digital (vdd) and analog
(vdda) power rails.

Signed-off-by: Catalin Popescu <catalin.popescu@leica-geosystems.com>
---
 drivers/usb/misc/onboard_usb_dev.h | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/misc/onboard_usb_dev.h b/drivers/usb/misc/onboard_usb_dev.h
index 317b3eb99c02..933797a7e084 100644
--- a/drivers/usb/misc/onboard_usb_dev.h
+++ b/drivers/usb/misc/onboard_usb_dev.h
@@ -23,6 +23,13 @@ static const struct onboard_dev_pdata microchip_usb424_data = {
 	.is_hub = true,
 };
 
+static const struct onboard_dev_pdata microchip_usb2514_data = {
+	.reset_us = 1,
+	.num_supplies = 2,
+	.supply_names = { "vdd", "vdda" },
+	.is_hub = true,
+};
+
 static const struct onboard_dev_pdata microchip_usb5744_data = {
 	.reset_us = 0,
 	.power_on_delay_us = 10000,
@@ -96,7 +103,7 @@ static const struct onboard_dev_pdata xmos_xvf3500_data = {
 
 static const struct of_device_id onboard_dev_match[] = {
 	{ .compatible = "usb424,2412", .data = &microchip_usb424_data, },
-	{ .compatible = "usb424,2514", .data = &microchip_usb424_data, },
+	{ .compatible = "usb424,2514", .data = &microchip_usb2514_data, },
 	{ .compatible = "usb424,2517", .data = &microchip_usb424_data, },
 	{ .compatible = "usb424,2744", .data = &microchip_usb5744_data, },
 	{ .compatible = "usb424,5744", .data = &microchip_usb5744_data, },
-- 
2.34.1

