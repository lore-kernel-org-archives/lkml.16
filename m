Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2096.outbound.protection.outlook.com [40.107.104.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72FC32820D7;
	Tue,  6 May 2025 13:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746538594; cv=fail; b=ckqjnztIBrjvsblN6ss2Fxfze6joUkFBpwiFZVBW28ft6xBt3imLaJEU2VxMM3u8521Chn7skZC2JG7/PruhlZMRHRsAEYOmQcLmIyzNbwrky8Lq1sACTM4Q0mCfufC7+ZVll4Aisos1lTByOrYqRZnN8tD31L2QNUgLDtrFVhk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746538594; c=relaxed/simple;
	bh=pJv679D/Be5ASuplXTgZr045Am3WD69oT3EaB5f273U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pz6CHCGirEiy0ilhTbsvFmVav5sz2NtaZo0/p+mZriUs1+GyEDCOgb1URXFciSeibtVyPNbjHrehbvwA4/lJSYz/ZX70mQPD2wUHVOKfiGosun7g7Jbs82ZlJzBl14aSvasUBBi5JtA9jG3OAGkwkdMTCwJ+IstXe6KPobK7p7E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=tui+qVId; arc=fail smtp.client-ip=40.107.104.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="tui+qVId"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kSm7K/8Mzun590SLKmVmrPxUmKy0gGPau+HVo+rnXxzjS8R9OY2QyEM8te3uBGz7fd23Z74uAGi0u7tjlXOZMYS+z31PxhmpDyM8jgNKLQntYRfw8Xossj8BqeE2cxsyT8qkB9uq8PTe9ETFEteQvSCwMDoLumz2+m2vmyQgZ/1E/HV2RuA/icZP3GGjt/llHXO3UA/40osJQP0pBdPL3Hn5flVElx0xDdep3v0RK0hspH9JBvlmk7xG9ex0LRLDl1sBubVIwvAy1EqA/HgWBLZ0RVezKjti6bR6aDeWNQrXOswIqVqFnpv2xS2QIPSNDzEr+a+JlQV78QgmDkvtkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RYE0WuDK14nZpBVz6RL3jRUA/1w3G14NbSB8MkpGhgM=;
 b=UvrNg/WEsAKI/IxfibhEeeORSxYHdZ1S5Il4qKPAActsvjdLRvwkrUCt5sGxopNwMh/jgGaEeltSqJXuoUK6KJ/xLos1VVdEPSfIaBAK5aIjfbNHaagB1ZfqyWqFd3tVstxBd8UToQhDv0Bl877LnFxKNKufchAEx01N95BUAbhIsrLznpasrzScr2t+KWK333XarSTXfkEMWa9LQYGpD+Gs9F8R5Nk3Uk96fi/kk3WzcZqujKG9YPP96v1GdgaPnCNsNK0h59Mr1h5TBRSeYT7ANL/jujlQaR1lG+uxICytOkquo5smqdZRDvNbil+M28SU8Hgw2Azf5AFJLbMF9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=ti.com smtp.mailfrom=phytec.de; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine header.from=phytec.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RYE0WuDK14nZpBVz6RL3jRUA/1w3G14NbSB8MkpGhgM=;
 b=tui+qVIdy99ewgmMtSUsTdZPXPhwJklg0b5JwS3G1U9xfoFTKSViQMg0/++qaVhFwiInvwyyexvzThNdEu+oDbNT8k/RJTnRersOvOlrqcalGKy/TTXwIQYvQw2AgPMNZXD0GKZo01F3inGnaso8O/I6CTPv6HwTo+MTSg7Rr6DzpUqJ1W6PjtO8Lis/GqD3uysV2GgR6orDGVQGj4aDgUQ5eLDUXIg8Ucd2gh3fbvhrbBxxDxKQgT7M1l7oCY3Y0l6GpaVdN5EMtu34rtmuLTW9gEWBwQRT688ykyn94U4nXCZf8Ao+INkC7QqFk8T538INhv1G4/OARtCxCluigw==
Received: from AM0PR10CA0054.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::34)
 by FRZP195MB2661.EURP195.PROD.OUTLOOK.COM (2603:10a6:d10:13e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Tue, 6 May
 2025 13:36:27 +0000
Received: from AMS1EPF00000040.eurprd04.prod.outlook.com
 (2603:10a6:20b:150:cafe::4) by AM0PR10CA0054.outlook.office365.com
 (2603:10a6:20b:150::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.30 via Frontend Transport; Tue,
 6 May 2025 13:36:27 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Diagnostix.phytec.de (91.26.50.189) by
 AMS1EPF00000040.mail.protection.outlook.com (10.167.16.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Tue, 6 May 2025 13:36:27 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 6 May
 2025 15:36:26 +0200
Received: from ls-radium.phytec (172.25.39.17) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 6 May
 2025 15:36:23 +0200
From: Daniel Schultz <d.schultz@phytec.de>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <upstream@lists.phytec.de>, <w.egorov@phytec.de>, Daniel Schultz
	<d.schultz@phytec.de>
Subject: [PATCH v2 1/4] arm64: dts: ti: k3-am62-phycore-som: Enable Co-processors
Date: Tue, 6 May 2025 06:36:01 -0700
Message-ID: <20250506133604.294920-2-d.schultz@phytec.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250506133604.294920-1-d.schultz@phytec.de>
References: <20250506133604.294920-1-d.schultz@phytec.de>
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
X-MS-TrafficTypeDiagnostic: AMS1EPF00000040:EE_|FRZP195MB2661:EE_
X-MS-Office365-Filtering-Correlation-Id: 4dcc46ca-a674-4008-ff44-08dd8ca300a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xJxypl8VsJsPnr2xEw0PcMSORMuBxD9rhAOVM8a48DsMTzGxmPkBLgEcTIuW?=
 =?us-ascii?Q?2Os/0EY+V51LG+oCkXxdG0wXVelSdk6Y5Yfb0xGY4WMD0Ov8mKYtYcfrYTZ0?=
 =?us-ascii?Q?kITIpe1ULxNqlzOQ3dPxVQMxNOyxU6GZJeDvfP3Rc16BPr7hLPHBON/v1Ijq?=
 =?us-ascii?Q?2P5LQ9DekBOFycSlI4IaxwJfAwMmUujFttbN0J0O/Ny0ZyoYzDq+1Wx9H6iJ?=
 =?us-ascii?Q?uFRsb6qfcuX48IF/Nzkx/ZsNHydcu1Csru2C7PVbnmSjzJ2QTB3RZO7XegmP?=
 =?us-ascii?Q?v57IN4OBlAGz2ocEmB6g7Na7AqzAQvlGTwSNzUCsRVHK45d18pywC//95R/8?=
 =?us-ascii?Q?p9VNz2Umfcif+mg8hF1g6sG4lQ7MENaYh0MasDPlzvFJPtGTDojjagV1FuiJ?=
 =?us-ascii?Q?2qwny00coo7SJnnWyWxNvhPcCiFS88sescA6HYWAmyO62Gx5BXFzVShu+1v+?=
 =?us-ascii?Q?cNqYrlJQ5yZFLqkogAz34611k9fbng9ZCzXXi2+C0fO16tvYD3GTxDVUtCeY?=
 =?us-ascii?Q?tg6viE+cnclEmCyYy2BZu8eHKs4sdi0+u9t/oi0JJG6dnlY8nPcnS9jDiXTX?=
 =?us-ascii?Q?GgGOOF2CeOtkTdOYwNHI5pAb4OK9fZvldnnGDh/fqle0+nq3d27nLzHGRFLJ?=
 =?us-ascii?Q?zr9idSneQBw5bKYuR2V2xvkSU2SqhnzLIviXT0NUBfhIoXDnH9neabzVzK3f?=
 =?us-ascii?Q?KFoPuspfAVVza4GTFONUIjtY7RUK0oZv8JmvvwCA2XSE1ZL0KJZuxUuU1+jg?=
 =?us-ascii?Q?DvclsOoFA2LI/RYpXY9l8bjBe0G/xl3oTszh3+5YCLAkXsc9DBPlspWOfc+a?=
 =?us-ascii?Q?sRZMmKWW2LcGSkEn6OV2btekDOrk9c1xdSYWy6y/vdtHK25wUDEGncoURIj8?=
 =?us-ascii?Q?93FU4Yjtic/9cxHpqJpukNMFdZmndwwNCB7g1IJWmMsLLVMJRQ0ueBZB+ehL?=
 =?us-ascii?Q?YaIOvtU0gDQP0DW6WaVXHkp/ZksjNOBJSxlZQx4F3AJHUCdglbIDePsPoDrZ?=
 =?us-ascii?Q?1w5Huk+/4sI6qX+8t3ivr6BtlyGjLHOGn/u2s7+ZThaMY2UkA6O6Cswxz46o?=
 =?us-ascii?Q?KbbgvehK9h5a3xkMlbPfkxnmHi3J+DjJk7/b371nJCjgnhoqTWXAQpveGtjK?=
 =?us-ascii?Q?I6BozC/T/5B4ZMQ7UsdWvhSvK4otWeLZIxHetntgyKIOFrPnQaLdWHgq0+sU?=
 =?us-ascii?Q?YPpTeXb/qd/cAyxhbIRGU0sxHA6FYc+95rM1xZSrONQ496XgDzVzN4SA3Ljk?=
 =?us-ascii?Q?cQkwS5QZYK3m5R5OV3dCJpajMW6lV5XTgJ9f/Ujog6a4mplNdQ5cLQOcN6El?=
 =?us-ascii?Q?8qBp2AlN9nFkAkx4wNix0nENqPMf6XuPhXNyjaGd7UR0hv8COJZz8VXOa3Ap?=
 =?us-ascii?Q?mGP35TpkwsBlCz7cTVKCq1OBOcTDO882NjN9XQaacggnKXQmgEeVNB2OKgg5?=
 =?us-ascii?Q?Kn5OhX2/wl9LITolZw3qFBONu9Ruv+96mlnLVooAAE/OE5p4ccv3cZK+pbUO?=
 =?us-ascii?Q?bu3pX6rx+o/Lc8tCTAlHJgnCehDhDg1abMtm?=
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 13:36:27.4408
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dcc46ca-a674-4008-ff44-08dd8ca300a4
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000040.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZP195MB2661

For every remote processor, set up dedicated memory regions and
associate the required mailbox channels. Allocate two memory areas
per remote core: one 1MB region for vring shared buffers, and
another for external memory used by the remote processor for its
resource table and trace buffer.

Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
---
 .../boot/dts/ti/k3-am62-phycore-som.dtsi      | 35 +++++++++++++++----
 1 file changed, 29 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi
index 55ed418c023b..3075979935d5 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi
@@ -64,6 +64,18 @@ mcu_m4fss_memory_region: m4f-memory@9cc00000 {
 			no-map;
 		};
 
+		wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9da00000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9da00000 0x00 0x100000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_memory_region: r5f-memory@9db00000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9db00000 0x00 0xc00000>;
+			no-map;
+		};
+
 		secure_tfa_ddr: tfa@9e780000 {
 			reg = <0x00 0x9e780000 0x00 0x80000>;
 			alignment = <0x1000>;
@@ -75,12 +87,6 @@ secure_ddr: optee@9e800000 {
 			alignment = <0x1000>;
 			no-map;
 		};
-
-		wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9db00000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0x9db00000 0x00 0x00c00000>;
-			no-map;
-		};
 	};
 
 	vcc_5v0_som: regulator-vcc-5v0-som {
@@ -240,10 +246,17 @@ cpsw3g_phy1: ethernet-phy@1 {
 };
 
 &mailbox0_cluster0 {
+	status = "okay";
+
 	mbox_m4_0: mbox-m4-0 {
 		ti,mbox-rx = <0 0 0>;
 		ti,mbox-tx = <1 0 0>;
 	};
+
+	mbox_r5_0: mbox-r5-0 {
+		ti,mbox-rx = <2 0 0>;
+		ti,mbox-tx = <3 0 0>;
+	};
 };
 
 &main_pktdma {
@@ -386,3 +399,13 @@ &sdhci0 {
 	bootph-all;
 	status = "okay";
 };
+
+&wkup_r5fss0 {
+	status = "okay";
+};
+
+&wkup_r5fss0_core0 {
+	mboxes = <&mailbox0_cluster0 &mbox_r5_0>;
+	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
+			<&wkup_r5fss0_core0_memory_region>;
+};
-- 
2.25.1

