Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2054.outbound.protection.outlook.com [40.107.244.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B9F1F1515;
	Thu,  5 Jun 2025 18:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749148189; cv=fail; b=rSMVQRqvmeNzhnc7bwuCmZYDGMvDSE2CiVVuAsmvqvAqN4h1PgjWJawvn1ADQh+eURmdRsra0/yt7tFgW7ou9oUMjbezvIZkyEU7m4bOD7x12mnUhQJMW36/NtjyabwQf0avNPYjapSRpe6ix6NzGRWz9w/UnGFAxDwUHln7fxg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749148189; c=relaxed/simple;
	bh=MCFz8LKJ8ff6hnsPNxV2FJVGktvEmShsjTNKAMRTh54=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=aELfWxW4FiSkWELbvfLEo3r37TCWHisE/HIf7Ph/Pl/EvecI/5A8ZyCOiL8/ejuEGsfKhMMhRjnR8HWIZMiomhJunTEFkwIwPsZT01vf4CNJNnX61k+vvn1QUcZEqEo7D8YFHJ2WvzRLRVXYPUypVbIlSC2UiTbGh86+fiVulEg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=mQWxTIBn; arc=fail smtp.client-ip=40.107.244.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="mQWxTIBn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B38EeKDf3M2fWqtZmebVy8P2rJlCz0WOwmz2zXwHUzipjygDBZR6btPWLoHNUgBobh5wEL+6oCMn+LBVWoY9Bieq5GL97wzhlycudJZZ9fdqqyUVBpfx7CV1Q6ggQj7vrJViR+Jk9efB2MIE/ng84Gw7NacBaeNLF5WjP6A8L3++kNEgkFtq3K/XcZqlYjvprMuR/kDUs5yiFtaRMJ2dwnJf9dt8doEaHdJp5AbAJ/Mjr5ixSd4owGXcMInQ791hViBF3h5EYJ1BlfIam0Cn28qmkR3GuDe+v9uZQrMVuf+rBSfZhusC8Rss18TQBC4RpUFiVESC5lY7vNBoxGcCdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UBOkRwEQvLXKYGTn0VC+09AwyvnINSXidmZ9vbum7xI=;
 b=DVyFnPGl5FTqlDrO3i4Svgr54ZdoY3nmfP1vjJwvIzvIBeKTRtfJAYRYxmQdUGpMUf6VggAnDfuXqAgHv7xEaclKO3IMuTueCsqHUe10DNFOnEhUotghFIHg4PIOmW60aQrTOFPBbOir0EV/Ei6qERuZ1J0CfmSV8o2lArAbB7cFwpsIyS8tZOgou13f+a4+iy69Rt9MMbfV8GelFzQ+nHNv7lGz2cK42d7VfpgjAq7t4euI4LzMIBAHoJOlksYpKzfhGLeMGQHV8fmGcDZT2xB0qLXBvJbVXg7u3ZJ6klqxRPL92WVYIlBAhkiGw/qPONUlorwgmDFx3yZxkXkdug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UBOkRwEQvLXKYGTn0VC+09AwyvnINSXidmZ9vbum7xI=;
 b=mQWxTIBnVybaQLrsqAEKNwFbyIHBR8vAAIQ/E8ffYxIz45bX1UxFeMVKANM0dwIyrDKo6krhO2zEkZQaAySWlHlsfaI2doGnC2+LeEoHUC8qU/mRl1gPQ4iOpGT/4SwC79XJ7udfIrwa++EUwYEkH42LmAOVkLB0C622MhXo83s=
Received: from BN1PR13CA0020.namprd13.prod.outlook.com (2603:10b6:408:e2::25)
 by PH7PR12MB5901.namprd12.prod.outlook.com (2603:10b6:510:1d5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Thu, 5 Jun
 2025 18:29:45 +0000
Received: from BN1PEPF00004682.namprd03.prod.outlook.com
 (2603:10b6:408:e2:cafe::4f) by BN1PR13CA0020.outlook.office365.com
 (2603:10b6:408:e2::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.9 via Frontend Transport; Thu, 5
 Jun 2025 18:29:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00004682.mail.protection.outlook.com (10.167.243.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Thu, 5 Jun 2025 18:29:45 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 5 Jun
 2025 13:29:43 -0500
Received: from xhdradheys41.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 5 Jun 2025 13:29:41 -0500
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <gregkh@linuxfoundation.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <michal.simek@amd.com>
CC: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, Radhey Shyam Pandey
	<radhey.shyam.pandey@amd.com>
Subject: [PATCH] dt-bindings: usb: microchip,usb5744: Add support for configurable board reset delays
Date: Thu, 5 Jun 2025 23:59:31 +0530
Message-ID: <1749148171-1729610-1-git-send-email-radhey.shyam.pandey@amd.com>
X-Mailer: git-send-email 2.1.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: radhey.shyam.pandey@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004682:EE_|PH7PR12MB5901:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bc66e09-2484-42b4-d89b-08dda45ef258
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3USuY4Ar5oT799eO+RrC/VNkTkaVFfE2iGHudQRpKBYe/xJHixVi8okWBUS3?=
 =?us-ascii?Q?6yv3Jmfq1VYj7vokUPLUVu/MhvI6u1aWYUBEKX2jmq3+Hj+q/ye8rsH35pNL?=
 =?us-ascii?Q?lHiBiSPzGzMffh998hOTVRqkzf2E3PaOTUFVfnUoOt15Ok0ZgKcmTLbZTd9C?=
 =?us-ascii?Q?N9vweoDSxg3iMBsR0Pd+unkErS6uwBQ3Pgzyk/lEBB3PXx5GD6MlGBMjxV7p?=
 =?us-ascii?Q?KEGyPnKI6h0HzqOJ14TIZmXKs4Ta95tksxsRhFD9/X0miEyOsdCxPB6cMGhR?=
 =?us-ascii?Q?/e72olXsnNvAMOeN2bGGpOxgulzTGvCHzRCxPsbDHifCmRs6X+FFqz41rNLp?=
 =?us-ascii?Q?KnxIzbLLDuR87hdlk/G0x/Am6KNJE9rRd3oK3GEr5ITIcbeUlnKS9kpMXbtr?=
 =?us-ascii?Q?abcKhcNkRd/TdCPqCppR6ZnP0RDHEsmvxjgie5Ip39rMRcj8UHGCxEraxVS/?=
 =?us-ascii?Q?tfJWLbWJ6iDwuYnClM9gtCTOZija03ULS18XPzw3fXtrc7JT8sfnn/sDtF1G?=
 =?us-ascii?Q?+zTslPkwLNeQYPhvyhrTlKwjRE8UFVF7QeLGGbG8jc98cqabmH1tDAXH/U5M?=
 =?us-ascii?Q?vnHO7U8kppvHqHUf9E0a9GryA3/Br0JibiRsD/5nrXjWQpldOVcKT1WkdYkc?=
 =?us-ascii?Q?iZB+bTtLyWtU5prVzhx7n6HaTfKNpssgPF8vw4OnjrnRKLJKVvP+FVtNnfk3?=
 =?us-ascii?Q?uOZty1du6PcMhCybOHLZqr4/XpmLgeUvi80vlwRDnkfyim4sgxF+HJEmxLiY?=
 =?us-ascii?Q?/IE56oFZgHvyRLifB5xpFuzhd33ZLBjNqb67UswhIl14cFwdnPJhvSFFOd3d?=
 =?us-ascii?Q?XAC7Wzcne4qnwsvZesqRcAq+0UhUggguQAsbnsD27NIROamt3wq6sGKUzvGK?=
 =?us-ascii?Q?ymSPbPwZsHhu02grvgac1Y1XGSINHsT4aOU+6yr/xMdAXeydVf664Fmu3lRh?=
 =?us-ascii?Q?Qu8BSTMl2ezqfzoRQEgTkk6iDCTP67WWraVybMiqgS03GTQuX4S+5G0mFohL?=
 =?us-ascii?Q?ZgZwFF1o8tnVK99Uorl2m3ESuvDyfMQhrx+4fl3rLybv2KxUa6qKqMSayClh?=
 =?us-ascii?Q?Gl7EOJN5At7ZnT6u3FVX2m8nh0/00GSQ1JRoUp8aMOLA2bgaIgCx9SgTEK2M?=
 =?us-ascii?Q?JH/QIBLweK/BLWpNz3Z+cgKxhECWKfIfY+4lB61FFcW0sIoKx6jJDdf+/bpr?=
 =?us-ascii?Q?dmi3Pv7HrGgq2W0FF8qjd3G6eKpfTZj2y9iL51CA9cioLewET0C2ghbMtZ8n?=
 =?us-ascii?Q?Xs8WFT9yyYqfRQxcMnLUqTlrF7eiiXES27+voO1SlpvpJTJRl+ibb8Df7X7/?=
 =?us-ascii?Q?jQMCHCqxhm5t15aXbe8AA/Q8xrw6pFrfil0WLwy5cgir9gUxn03ovCHUvSV2?=
 =?us-ascii?Q?Zy1ug7FFq3zb2mli0eukT8Yygi2bMqrLYMuHY0GIS0fheIoBw94vTZt33cN8?=
 =?us-ascii?Q?1Vhycn7b1LS/p6jqPFjuH6NvMzk35jJ+n0GTpzyNY7ccC1yvd6Au+o8JZl4+?=
 =?us-ascii?Q?IKwYSFs0FPchs+TrdGuajObNzgo4Mt4MWh2T?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 18:29:45.5845
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bc66e09-2484-42b4-d89b-08dda45ef258
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004682.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5901

Introduce 'reset-delay-us' and 'power-on-delay-us' properties. Default
delays in datasheet are not good enough for Xilinx Kria KR260 Robotics
Starter Kit (and others) so there is a need to program board specific
reset and power on delay via DT.

Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
---
Taken reference from mdio.yaml[1]
[1]: Documentation/devicetree/bindings/net/mdio.yaml
---
 .../devicetree/bindings/usb/microchip,usb5744.yaml   | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/microchip,usb5744.yaml b/Documentation/devicetree/bindings/usb/microchip,usb5744.yaml
index c68c04da3399..94a2bebd32da 100644
--- a/Documentation/devicetree/bindings/usb/microchip,usb5744.yaml
+++ b/Documentation/devicetree/bindings/usb/microchip,usb5744.yaml
@@ -52,6 +52,16 @@ properties:
     description:
       phandle of an usb hub connected via i2c bus.
 
+  reset-delay-us:
+    description:
+      RESET pulse width in microseconds.
+
+  power-on-delay-us:
+    description:
+      Delay after power on in microseconds. USB5744 Hub requires some
+      delay after reset to get to state when SMBus configuration
+      data is going to be accepted.
+
 required:
   - compatible
   - reg
@@ -69,6 +79,8 @@ allOf:
         vdd2-supply: false
         peer-hub: false
         i2c-bus: false
+        reset-delay-us: false
+        power-on-delay-us: false
     else:
       $ref: /schemas/usb/usb-device.yaml
 

base-commit: 4f27f06ec12190c7c62c722e99ab6243dea81a94
-- 
2.34.1

