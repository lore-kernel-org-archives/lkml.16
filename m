Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2125.outbound.protection.outlook.com [40.107.20.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4EA627C84A;
	Tue,  6 May 2025 11:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.125
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746532548; cv=fail; b=X4LMdFgY9zi5v5EFUsLKUimLUMtCI/gG1JYcaroxOS4RGcvl4O9g3Q2685e+oSYDdZS4mM/8BhexOZ7OqJzPDhZRF0nkBt2A2CJ40BENq+YsLH0DdSnnMoCITtjE1yhSbIhgtr9jf1FT8Hpfmssvo448TBxOH3xMoIGJ1Yg0Tvg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746532548; c=relaxed/simple;
	bh=NK7HH2T3mkkzPo9BXa+szV0uH0/pGtkhiX/MEOr/t7I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fVEQR+F5FkuWBddOuweD/kUuUKcNctvZxWBIcR3+EqyFI9qnibMxuOgAeJpIIb9APdqeynZehiGCU5BVVx2vBDIC460XOqtqOjqzm7txNYlzolSYIUCpurCNMSsdIX0uT2p42+ajM54mpJdYAcbNfd/OSMA25+DoecjOrle2TXY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=eXZ34ZwY; arc=fail smtp.client-ip=40.107.20.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="eXZ34ZwY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lm1hE0tAj8Kfb5C/+aWLzyVPPfX5nT5Ej23gpN8B4TDS1xff0HUsd25jzpBPYA+AxjoANdDCGf/D4NtljYCuVuz7szxDBUqX+H8IV8hks/Fl9vlGCpsIavKVP/5UtyiSuB4O/YTR+d0ghlAHljSZt2Y3fCH9xmc2koTR4kDadmQDkAetT4uWUFCVauS7EP0mJ2dFT2y/2MMmw6HG2+b7eTJuyqMcS/Sr9NHP9Ya2z2lTa5V69mFSrWYSAxnGDEMaMdFTTqIc34m/fdMmdIAkGKsx5CMuR/E36FkbDhvtdTugYVX7s8nukjyG/MZ9sdWyHviG91iCnqBrGT6I2yUFHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sNkXtWomnfaFf/H4wGW9Wf9Ff4SZCermg3RHkTVkirA=;
 b=tY6Zk9O2oG+DSUZRqr4z0kz6U0/Oyb8OwMqWG6xpWs9bdEmSj7lz+D/1+ckn7Ujun9l+epkWkH4h4yLs/6puVrxJ3k71IUkQdUTQl8jHmM+rYNY2d3duhyGV1am+uLh3XfTekyzvkTbTKdT3B2sm4qQ9L6FsLTEtk8dA8kXta/ViA1l8Z9hdpWeLcGuheXYz4I6iz8D4V+yZUkgyCoxrajkLWX3HPs+/DB4uaFm6o9lQjg7yy5lu0NIUKX5+DEyJlldlBfiSZDXynfJy3p0h0wJCw9TlCPL7DDGn6rFPkblUB8uP4M0YcrWNEC9GXDcC4+GptudW5KgU3ZBMy/3Tww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=ti.com smtp.mailfrom=phytec.de; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine header.from=phytec.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sNkXtWomnfaFf/H4wGW9Wf9Ff4SZCermg3RHkTVkirA=;
 b=eXZ34ZwYz0KfcKavq2KTmMTIaQgp3aVE0U+7J0/xITeqHtNIR78nqITNUnjyqz9OK5TNUUBcKcre9xRJLbwoCNZLyUvj4WBDGiwUGA188D0vhEK0gdqjnuo0mlbicXc2xvGQKjykBpomS5NGZpy72r/kzXIMvAZgXVk9A2oy3AsRiyb66ZFOaddDj42GypRK8iP/MSksgyr2l+qNDe0TULU4IeQCFl298K8ZsWTMyvILro95F6L6P0VgmPTiWsgPSBEzJkECVx9oJfYHxWcjPK6xJ5GnL2kS28BxEtQkodb3qPsocIh0aCLRZFZUac4dD8I01MgGfVtkQUCQWIVb6w==
Received: from AS9PR01CA0034.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:542::17) by AM9P195MB0806.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:1fe::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Tue, 6 May
 2025 11:55:40 +0000
Received: from AMS0EPF00000190.eurprd05.prod.outlook.com
 (2603:10a6:20b:542:cafe::66) by AS9PR01CA0034.outlook.office365.com
 (2603:10a6:20b:542::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.20 via Frontend Transport; Tue,
 6 May 2025 11:56:04 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Diagnostix.phytec.de (91.26.50.189) by
 AMS0EPF00000190.mail.protection.outlook.com (10.167.16.213) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Tue, 6 May 2025 11:55:40 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 6 May
 2025 13:55:25 +0200
Received: from ls-radium.phytec (172.25.39.17) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 6 May
 2025 13:55:23 +0200
From: Daniel Schultz <d.schultz@phytec.de>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <upstream@lists.phytec.de>, Daniel Schultz <d.schultz@phytec.de>
Subject: [PATCH 3/4] arm64: dts: ti: k3-am62a-phycore-som: Reserve main_rti4 for C7x DSP
Date: Tue, 6 May 2025 04:55:01 -0700
Message-ID: <20250506115502.3515599-4-d.schultz@phytec.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250506115502.3515599-1-d.schultz@phytec.de>
References: <20250506115502.3515599-1-d.schultz@phytec.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: Diagnostix.phytec.de (172.25.0.14) To Florix.phytec.de
 (172.25.0.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF00000190:EE_|AM9P195MB0806:EE_
X-MS-Office365-Filtering-Correlation-Id: 884fe690-421b-47d3-8f7e-08dd8c94ec82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?p7BZZn2vmWG+saeqwQLgwGEsCwQg/cAT/nVGos2bCexcJcG7MAJ0j+JJI44r?=
 =?us-ascii?Q?qqGAKtMgomO4wP9XPdeJNVQBl5z84MGvmUXD9nfcupXtl0mS7ioTaMBs2Ks1?=
 =?us-ascii?Q?yi7oF+9Y3P9WESX8e96c4b2v7SLGeNWBtRhhTNSSubRvV0DzzwDNN8H1OoHa?=
 =?us-ascii?Q?IC+0uv+bePL9zK+EASPeCxPdtkukHcZUfhFjkZyxMdFIvFtgLIL5IA/xYwYp?=
 =?us-ascii?Q?eQ3MFZguEhLUeSdSb04ad8HORyivZ9w0RI1/79lmI4pv/vaBAxCWMg4gLXAJ?=
 =?us-ascii?Q?bH16wsCshMPdY90cVXWFQoj/wXLqmGCT71L2CBi5i1cQPKl8wqe19lpl/Q0K?=
 =?us-ascii?Q?qhF4JZsD6he28se8KpaPZaXeBCKcE1s8Dp+dpssrkEr+uRXJWDCQYyjT0cWz?=
 =?us-ascii?Q?0zEq1a+58SpFKBgLAoRwk+L0iQ+mzZmhbfx039Ulm9CU5KDav0ke75wZrbC8?=
 =?us-ascii?Q?d8N38ugd3Ngc34NtxV5lrhLcvjH2TmQdYylcbBBAqFWgE1H0Ooi1KrPzRt7t?=
 =?us-ascii?Q?7oQ0LVEZcr3R6W/I2Cq4dY+7QYi+lzC8JXjna0pJV/IIZttDIMbJm8c8NuIT?=
 =?us-ascii?Q?RwsoqOpUHD9MP1Ef82ajrXOjwsoBFcAjkFLZbM7BdZVfxj3YUISkhlD17Qpi?=
 =?us-ascii?Q?CapFyebPCxPYJk5W3y3ojvvhQibLq+ozfvXSW1GCntsdVGsgNftnl2Jr/ysn?=
 =?us-ascii?Q?ZGFBAsepzProyvWgAMJ5ihIv2Xb1+5BmtoynHSSrBG3Vd0dw45Idv12KJiIq?=
 =?us-ascii?Q?tb8swWz/MnYWcvmWRL4/fb5EmIro2dDa0KSHey84FVmFYhBtXFUAMVn8cebH?=
 =?us-ascii?Q?efmGQ6rkrIETqnXpuNQHE8RlyE4y+WVlPKPYNS3vrkauMNGh8z2kMmR1KzFs?=
 =?us-ascii?Q?8TvtJ84vQLNKrPNyKTFAY0EtVp0DHudWzuSoVrQkCdTjml51ZmoYYEAKNaDT?=
 =?us-ascii?Q?lt7p2UNzfoCOMiurBPiPIRsvEsbir6/FKKcyaNcUxwz75B9aalBqVgOAUNt6?=
 =?us-ascii?Q?T9K78odMW81CTejlsJlamtzKG2IRN9XkcQ2dZjFv/+sRNRPTFPl4y0yMSLvW?=
 =?us-ascii?Q?5E0oncsCzPYfL9BcJY9hh7N62H5T6vW0fWXXWxc7apDTEO11E39l7Ou+A7+G?=
 =?us-ascii?Q?+SxoK62XsKvK60U5w23/9X22lCWJjtB5WQMl1w/yoLfJ2ZJQKpAteKehiD4c?=
 =?us-ascii?Q?9d7iku89CHh6/yk16fpHODKBn9DC0EZ4mqUtsfUfSim2VGGm6uIdqjy6WdRZ?=
 =?us-ascii?Q?00m0aYuoywcggyu7HSvC0trV9JdchFnIQB3KNeZA271ISYtI544FLPwz9PlE?=
 =?us-ascii?Q?Va/R1iq/rpsjq5JUSXKc9Lx2ABErcun3VuYKlrS4ZVLMymsveXusMD4oRds2?=
 =?us-ascii?Q?zDyB/yk4yAPhZ2mdfeJdnA41nZTquTv8xvaN5CMZvTuNq8KrfTIkJ7eCNYTS?=
 =?us-ascii?Q?Qo6DGlC6A43iEe4WVINrg4xQbroRF6lVRVcjTSgloxBLMUn5Dkr8ZrilTF2K?=
 =?us-ascii?Q?yU+gKtKokfhncs33lZT8DtEHotTUSVWPVYnO?=
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 11:55:40.7063
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 884fe690-421b-47d3-8f7e-08dd8c94ec82
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000190.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9P195MB0806

The main rti4 watchdog timer is used by the C7x DSP, so reserve the
timer in the linux device tree.

Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
---
 arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
index fc252543f18a..343118af448b 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
@@ -366,6 +366,11 @@ &main_gpio_intr {
 	status = "okay";
 };
 
+/* main_rti4 is used by C7x DSP */
+&main_rti4 {
+	status = "reserved";
+};
+
 &mcu_r5fss0 {
 	status = "okay";
 };
-- 
2.25.1

