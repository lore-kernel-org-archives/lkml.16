Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2096.outbound.protection.outlook.com [40.107.21.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3BB85947;
	Fri, 31 Jan 2025 09:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738316154; cv=fail; b=O+lcZUCUdGuRfLREhg7tUF3LzYnoWwL3QEihGvuJSrKZlchdgdJcXfj52c6ovZeMcLB46b+b+bCxHCBglvjOidCGL05wMf9oBw1QYIcxANoXhlfKDJQMpFCvSI8U0fKhneitrxaDc363DifW9VztyIamsk1zKTKH/HddpT7eCrI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738316154; c=relaxed/simple;
	bh=M/F2rNfIGQst0+LWk45C2L3p8dXyVnnM+BnxpIJTS/c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Un7tfd12/fCVJhpppc9uAgxh1MSNxdkB79NfPBHWgPBXxhm6JkkgQfcFM1lDTAObdw1b2jxADq1FD+Fx8go81YAt5VZoW4b553J7a/euJkkLEIJHd5R7pL4uGNE0incejG3S1XZBMBJrHuRHMqwgb0HpZEiCUnsZy9gs/UQOiEY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=g0Saj6f6; arc=fail smtp.client-ip=40.107.21.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="g0Saj6f6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yeNhqnucpsNYCUe9OctGEdEfVNeGDvbjYtwEoBtKR8f7DySGVDwd4PCzpPutm5bZtAtLBwkG2TydI4rjnX7gnutRYkrT4oLCyQos/OnxS0uVGwr9XPgeikKRkvsX/rLsJBoolZYjr8cURco4tV1qjLjGzQSXzm2twN+lVG78S+0YJTaLQiXxRkVAvpfLb5mFAkTUNYnN8m3HlbKAO8jnVIngq51X101X+cr3MgnKQU8BJjR6gqCFLEQixPr9dOamepUgmexT9m6uBF4UQmyPfA171wcPlEbOAQsgP7/a6vfobq2+rGusB+bAj0vKhYaY0qpQXzgX955uSmx/thfGiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=si6mym3g7jhVIB8CmdS2U7Ka2MFi9bM3MvXvEmd4r3Q=;
 b=m6GFEjN0JB2OMLL5azg38JRb4avfr6pV7louowwRIX/gQDxhKEMJwfqcSzrvJovus0ETf4sDzB7tHrjiPiaqvfwV+CdLxjvoJRZ0y7stOdH+1XMnjk7V0xyD4RR1advxmEqasC0aSPslkn/3dFkqXfMxY5VPLdSV0PTjn4vnB/mTqSfz7ctYfMsfUyBbt73kRCW/I94aoSY6eZbG9/TcRtCF6ZshPDOBhS9L6vZ+HZLxPU3tbXZV7ySNdZJugXSVFxi8XNGEGhLC/yXMUSS9+tglpxDpR7pZnxqwEsQNuaEayydSaMkpTfV7IQD/oK2paMS3ub5M3xsrsv67y/RAgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=ti.com smtp.mailfrom=phytec.de; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine header.from=phytec.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=si6mym3g7jhVIB8CmdS2U7Ka2MFi9bM3MvXvEmd4r3Q=;
 b=g0Saj6f6uOo3DEBN9ndWzjGWAhGVv71eprz4DCo/AZ2ItUFE83XrMwzfLmVhCFLVpoCLc6NeM+wlBBizlmuxnwVfXZz9o+HOArMHbVqLJrEWT79W1D0NbSaLuylSIewd1KAWBKTgQYZ0mXFjUWMODxu5i1FI11VI5GA9gW92gVv84HHf3iPo4KcOuy72nmtWW0OUKLknBW/6R0cu08UnVrY/BbU6LiwqBh+A//ZF1xic+DA99nCTic5VxjjjBEWte8w/wo7VvDUIfPXkA3qwVzi6MCMqh+JFwYFMx8ODVIBsSIRKUP4fs1vuwgXP5xMMjZ8COGf1kkZ24hUO8xHymw==
Received: from DUZPR01CA0004.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::20) by DU0P195MB1982.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:10:3e6::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Fri, 31 Jan
 2025 09:35:46 +0000
Received: from DU6PEPF0000B61C.eurprd02.prod.outlook.com
 (2603:10a6:10:3c3:cafe::d5) by DUZPR01CA0004.outlook.office365.com
 (2603:10a6:10:3c3::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.20 via Frontend Transport; Fri,
 31 Jan 2025 09:35:51 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Diagnostix.phytec.de (91.26.50.189) by
 DU6PEPF0000B61C.mail.protection.outlook.com (10.167.8.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Fri, 31 Jan 2025 09:35:45 +0000
Received: from Berlix.phytec.de (172.25.0.12) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Fri, 31 Jan
 2025 10:35:43 +0100
Received: from augenblix2.phytec.de (172.25.0.11) by Berlix.phytec.de
 (172.25.0.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Fri, 31 Jan
 2025 10:35:43 +0100
From: Wadim Egorov <w.egorov@phytec.de>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <kees@kernel.org>,
	<tony.luck@intel.com>, <gpiccoli@igalia.com>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <upstream@lists.phytec.de>
Subject: [PATCH 2/2] arm64: dts: ti: k3-am62-phycore-som: Reserve RTOS IPC memory
Date: Fri, 31 Jan 2025 10:35:31 +0100
Message-ID: <20250131093531.1054924-2-w.egorov@phytec.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250131093531.1054924-1-w.egorov@phytec.de>
References: <20250131093531.1054924-1-w.egorov@phytec.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: Berlix.phytec.de (172.25.0.12) To Berlix.phytec.de
 (172.25.0.12)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B61C:EE_|DU0P195MB1982:EE_
X-MS-Office365-Filtering-Correlation-Id: 53a03839-e2df-463c-3df7-08dd41daa35d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qKF+qceWEij3nWx5+F22LJbo6ZNlSKviKywdMd3EvdV2FAXVZST29xyxSIOH?=
 =?us-ascii?Q?XQqF3L9RafiwwteNEPT9VmPvMb1G4ZjXLx3AEuIGxiK1p1Fu2ptlW26eOjCD?=
 =?us-ascii?Q?B2Prnh5QYEYo2Nr1sVOo7mL52plFiGNKUwmtmHf2ibJ5V8GtNRpQY8KcxIM4?=
 =?us-ascii?Q?VEmMMOPU1joVvXTMMyKxAGUZywbUrXwRlWJ4CUPTT8zQtyTcKKHXvnM2Atqo?=
 =?us-ascii?Q?IAyPmSPQPP44yppKM0podEqMFWSe2k7CBumQ89TKsdeKzhpbt9GRmWHd0Wu5?=
 =?us-ascii?Q?hwc5VoDst/0hhUNmDkeO2uBmloykX8Q4h9uzlDDErKApKIrxMybhsfi92DZO?=
 =?us-ascii?Q?i2ZFguBILiEp4KDPSo3Ur2K5JebVGwOBEQim1FSaLLtHodoz19SrsfxP5qXp?=
 =?us-ascii?Q?87uczu1kEl2ax8xqqLDhGgVZ9LQto/JmkAkIXS7KzPjjkOnPFFCAvqq040le?=
 =?us-ascii?Q?ZU5dz+fUAIIQPWlrTe6EmQUFaMKF7HHdkxpLHHl3Ykn4+WEORjkW0Fg8c7z5?=
 =?us-ascii?Q?+K5EvueAC45WdacMvGUhEWhCC7kFNtzL4Ng421OnwM1yzAAJnwKMyIU1ZJ5U?=
 =?us-ascii?Q?PhXhUpwyxNOENzQwxe/wl8WnEqli5jpj6xvEh0DajC/nKbAaJmadMkv0q2BC?=
 =?us-ascii?Q?7fCz8F4q2DAdNqZ5Ddp0sqMMvUm2Kq4pjxKD+4AsEYBy+ibY+Yk4rJhl2nMU?=
 =?us-ascii?Q?x4jMbtz79HCayGxV40ayGKOKGy6SuuA/lwv2F0l47eRcK2OypT71fe9EN2VJ?=
 =?us-ascii?Q?YvUPExC46flMduRPuBrUKfCcHct7FpTs87B9hXunIQB6pMoTgp57MqRO8P9o?=
 =?us-ascii?Q?w0wO3mSC8iYObYhkOOQiD4knYIAoG5DNcWdnnJi4Ztk7j4aiwYsMFh1UIpv6?=
 =?us-ascii?Q?J1KIDtaG71grhRN60zLG65rlcRIAuX1tWQ5osIFQlKWSIIPJKzpQKphg9n4S?=
 =?us-ascii?Q?b5DEg1OhpskZwlbUpPvxhxBOv9iSXL4BBBSEe4bs6bdreIm6/5fRc2XSPZiY?=
 =?us-ascii?Q?3rmiW+2raiQ1IQ0whYuRZoI4/DXMsqahclEWfEBCF1sTdJNaoDRW4K2Wv3jx?=
 =?us-ascii?Q?iLqqe9nRvLXCAQoeO8SnrdmhOQJCh+jP1XYoGgLaNQ6Th7kIWFFUrZc3CAUK?=
 =?us-ascii?Q?UwS6B3E9QcxLO/70Jqft1I9rEWacOTsmb+uVM2LqfZxQVfa2941Q0oMoboSz?=
 =?us-ascii?Q?2AOmcv0vljC08Ha+qyH21vG86b+DZOiWPWntFDSu7dz8uPY+tnjiRFYBo2ie?=
 =?us-ascii?Q?j/24wuMm91Cd9RB0MkdeXOxDUKM9YVVEbqHpHCjgp94D/GRgxdAHP0I5nx7t?=
 =?us-ascii?Q?IyHjj1ap9Gd2unHgK10OmYokTYeyvOivJUmWgR3VvW5IlPpR+3pH1hIHOtzv?=
 =?us-ascii?Q?IjACegKQyrCLXpFQiWU6n/fVpQ7v4CqGby6W7j2y4KHA+Ffu9YnM7u5cdNy0?=
 =?us-ascii?Q?QYhnzsGpmiU7eLJkCgb0EIHmOr5kgY/eTZEDGsnoINjEWx4MrbqpMQav7Fjp?=
 =?us-ascii?Q?nsslGdlysB+yF3k=3D?=
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7416014);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 09:35:45.5326
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53a03839-e2df-463c-3df7-08dd41daa35d
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000B61C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P195MB1982

Reserve a portion of memory for inter-processor communication between
all remote processors running RTOS or baremetal firmware.
Move ramoops to lower region so the IPC fits to the correct address.

Signed-off-by: Wadim Egorov <w.egorov@phytec.de>
---
 arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi
index 2ef4cbaec789..4bffa8ce0410 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi
@@ -36,15 +36,21 @@ reserved_memory: reserved-memory {
 		#size-cells = <2>;
 		ranges;
 
-		ramoops@9ca00000 {
+		ramoops@9c700000 {
 			compatible = "ramoops";
-			reg = <0x00 0x9ca00000 0x00 0x00100000>;
+			reg = <0x00 0x9c700000 0x00 0x00100000>;
 			record-size = <0x8000>;
 			console-size = <0x8000>;
 			ftrace-size = <0x00>;
 			pmsg-size = <0x8000>;
 		};
 
+		rtos_ipc_memory_region: ipc-memories@9c800000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9c800000 0x00 0x00300000>;
+			no-map;
+		};
+
 		mcu_m4fss_dma_memory_region: m4f-dma-memory@9cb00000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x9cb00000 0x00 0x100000>;
-- 
2.34.1

