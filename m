Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013025.outbound.protection.outlook.com [40.107.159.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6EB212D97;
	Mon,  9 Jun 2025 16:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749487979; cv=fail; b=PcrFzqDqQ4leuBdR7Y4byvzm0HjBbAchipxEDvxRmljxatw10EkzTPTexR8hPI+WR9eRWbeYx1527nQkN9cV/HVqk+aaaOhfOhYjElUT1SBoY89C/doElUpokjpmxs3zkK7yh+lX68GhtB3o87aeIdluoGotj+MdsCRnpENT6cg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749487979; c=relaxed/simple;
	bh=mCJj5okYV04Iuif4tDQHXWrza4xKLIu2ll2yrqwJ9As=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=PrCldhpd4Xo8cvYMv2IUcHVDIP8TuGptBII1p8FNzTbfwkgo0r0XjmsbQmYs3xg62K9XeDtD2NwjaGBkalFrrjdW0egxNviSkGbzuVgVgqzyHy0MrWxA1WPSmNKZu5jvNQhGse2McVkK3h9WahYLfRYb+rWPaf414qAP3746diE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=XimlcU2q; arc=fail smtp.client-ip=40.107.159.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="XimlcU2q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j/2mqxanV5x7/YzHKCk6t+V1ys3cP/Qj9INOYx99FUkcqOMWksNusyKYnu6sgnTDNW9UuIFiBx9E2mwdAM8xIvs7ElfQawOpNu+g3e8o8TCZP/Yv2/sqs28DKBfKdH+zfdsH1TGfCeDfX2JiNUCAbvyruJ8fFTeQexNBCp7ULg8CK39HkP7VfZWTQ4mVIFAyeerWzmpfcixS5UcK0PujGwIwYThwJ/np4X1PAibL9TjxCBIEaEyW1VCkWRbIzKjEDjE9LsOeR2nrg5LbHP6k5NDkWV0lxap07rp6uaXqgkN1qlqWXjLNuZNTGDWG3blVJmKgS4Rly0CjpHCON5mzgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VL2Z8NiCTAdJYErBB25eBacExQmUIR7K4Q0DwRAQoGU=;
 b=d7Q/Ae6RmUBJweZEnHAt73AxsB8MfLXW7P3/9KHqsTM5X3Lfl9Ff1bYP5dwbbCBNLLm2PoWYM572EzMhVZ2L9TBfho+RyunJjr3JBaWFXCuXxRuthlsIoAYUvhfF0PooRvGQD/5ntWXvSCmhtyW5cH4fDUG4Tm9nd9hSuwXyvoCecuSDIwA1xKNqUcZfZA7wmVDe2geV6hnRUnj16GC3WB9LtYRZIsQ/DQcS8afzlDjsfVWvmXykhZKpEbD7Vn2Opo6gEUM5oBC60UPPrX4cX0s2a+o5pmYPDG1jHHaeuicFspu7KWLmo1gNrYSdxOdTMDmYe2RmrTRjWvV5NIKZUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VL2Z8NiCTAdJYErBB25eBacExQmUIR7K4Q0DwRAQoGU=;
 b=XimlcU2qLfRO80sgXssYl4eIelcN/JRvRGJMeRKvm5egO80IJeoisXZpGT7JXia2iYSqrho6ypXK/LtpN2fI2Yt3w4SJAjypta66Aov9RmCJSEGXnUSbPL3z9R8bHHHSrkIpGm33x94DlJlKR1r2ZXpBjVjzMMR90Lc7mb2e2KRgaGXMkxET/8rc4QJxlSYUoOoJRmaFdAEG9RLM/sjBQSD/fgac1cgrXkH4NwbQg+hEyh3rHnMJlH5aqmaBA3Y7sS+Mut7vNS8uqFNvZ2m7FUW5hpPc1ammw0A5UzRbgeHil6fDYNN1EwrMFj8LhjW5e1e0x1Dv702NpshycvLVXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI0PR04MB10230.eurprd04.prod.outlook.com (2603:10a6:800:240::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.26; Mon, 9 Jun
 2025 16:52:54 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 16:52:54 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH v2 1/6] arm64: dts: imx93-9x9-qsb: add IMU sensor support
Date: Mon,  9 Jun 2025 12:52:32 -0400
Message-Id: <20250609165237.1617560-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0193.namprd05.prod.outlook.com
 (2603:10b6:a03:330::18) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI0PR04MB10230:EE_
X-MS-Office365-Filtering-Correlation-Id: c652774b-d71c-4e3a-858a-08dda7761408
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|366016|52116014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lT33B15jiQDfR27brpH6i2lZ16qyWRTAVhPmiAp+EwTXx+m2uh/xN2sP29oR?=
 =?us-ascii?Q?DSvlwiKPldkQg3QTAmcpboKP68+mlw7pIpEnewsu3WxH5KkjLQKEnTN5parB?=
 =?us-ascii?Q?CDiA5Ldw5+uzE9U8naaEm0ZLzPAcxaNktAbV5EKGiKlu6zAev0upM8kGUJm5?=
 =?us-ascii?Q?G9TBBGdC33+/CjIRSGGkXi4hRWXGd6PKcqv4fUM6rxnpTjRCVjo25b9dzGLs?=
 =?us-ascii?Q?2pEwF0UZKIC3QbOgOe4R5YGZR/ZKwicI0fVnTdHkGI05TMvMnc1EPXF7dbvg?=
 =?us-ascii?Q?g9ROLE5B7Eo6MF/rlseYR2Efu+lV2/UDBurwbPusggWFtDWWzDK2mCaJWy/U?=
 =?us-ascii?Q?NqJV2LqVbhsOJYFrBXQyBgvyieG5NxD5YCJl/Ndr2VT3y7/soQBOCWU2wGpS?=
 =?us-ascii?Q?WNEFh80HZPM+W36zEIQXj2Y7qb2fMfxZqkni7kOiUreu9q9ATIzmBZ7ZUzWu?=
 =?us-ascii?Q?IVh9GTPe8uoBd5kcGa+1fJwtBqTTCVKaoXbEEFHKBRLgQA8Tg2NFh3tSs8Qy?=
 =?us-ascii?Q?8ewVoKdRR/w64sGtCg+Fcy/MEg9ztBqUnCdJ+mz6m2g2MWb++83/XNk42PDQ?=
 =?us-ascii?Q?SXfq1hB54w5hETM0fPUhu+vyB5b9UFKp38e9bWgd+mc+plYOqXEMJeJwSXFj?=
 =?us-ascii?Q?JiJP4kthHukuh0MFOTdu/Om4Tl+h5jQCN6q4Y/24S8cWukt+f5VLdu/tJ9Wf?=
 =?us-ascii?Q?mrK+VG2TyBgiYQG/8ro3rlsTLK/+H5betjDJbf0ZLFkfInJAZS/3keoYOJLh?=
 =?us-ascii?Q?zuHLpSeKmFOFit1QWslvONf1BVMebUwAMtBmMsF3OFgV/noM1mUTScCkQIMv?=
 =?us-ascii?Q?FKKe4MCJLaOAqSN5lBDPc0Wcmjcy+8QItoicnDZLAyhXM9nJFWYrCc7P/uEJ?=
 =?us-ascii?Q?jePbuWGREBLmfe+blis8KazydJ/eykpYISMxLPzD/dkZQYAR61aYjExKxf10?=
 =?us-ascii?Q?+tOPdC6fSADmPIRsxKXhTYRWlm24JrB2FqnRt5lTZgnKpQ2bbfOUtcG5/daZ?=
 =?us-ascii?Q?NXeSkovn0bYXTOehXkmjy6yImJDAj86kkl7lB19eaMPF025t6hSIB6zZYEjG?=
 =?us-ascii?Q?HkI7+Mcm+7Ho8S3FuuOh2elYBD6DoTSxG8oaO3feSdoIZucnq/nFqj1a+4Pv?=
 =?us-ascii?Q?QORlzdDXrmvEmkF9jpRC+iFN00jjevcUuOm7v8BWYwAezcnMFfjHLr4wK9u+?=
 =?us-ascii?Q?wU9ZAJsl4fNtydzfjqS4sBSatDIYUB0ZKhvfjyycRU8z3/veIAZHljrQVJE5?=
 =?us-ascii?Q?71EXK+HCarhYJhEHaKTLAn2LV6r1Xpc11+O0sfoagMjocAzIj+ItRz8HNq16?=
 =?us-ascii?Q?xe1//08ZuMhnjqSg6XgR4EgyoKvvU8h4kgvxgWn9Z5fNNhfApN+qO5898k9J?=
 =?us-ascii?Q?iTXuX8A5/vDRbr8oIVfh/UNx3aHRCLMFEwGZ30oTiUAbtj0x1F3PnpVEz34I?=
 =?us-ascii?Q?pccgkzfrliIGAiVD81RPlDNbTuU/YPBCFxawbmfPsVcU02Pr4sZjP8Zp3syS?=
 =?us-ascii?Q?0oO7W9Mt+ZCO77k=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(52116014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lw445XPPnylXhEBANjHGc0VFOtlnEJs1EQ0CwGUsxwcxIEJBKLDOzI3VfI8U?=
 =?us-ascii?Q?3P6jGdpS57rLGTDM2gZfaj2zhynEx4R5FP63Gj4SrJpoFMeE7l/JYmJnkIHp?=
 =?us-ascii?Q?yNgdtExNYQcFfBGUVZFsZZKKOXs2YdP2tKYhiRE6GULz7zoYI2O4ezXdDNKl?=
 =?us-ascii?Q?mmCYXhzA7sqoBn/Ha947xDTBZDGsahdZDhfp1gnPj6WyVn3T32Eknr4x78eK?=
 =?us-ascii?Q?xqJxnAJ6v69Zh8iXjO6pYGRx+teN69SoI5G/rHfZVaclE/tfcIokMP0XzIq7?=
 =?us-ascii?Q?Y+HObNe9syCPZSv0pVWIysiGwjb0wAQHC8mJKh1BR2qS5OV4CbE8KRdP5OiN?=
 =?us-ascii?Q?5L9cR/jveWuD3StqGRPSyXrsFH23v77EWDVW+Eo7LyIRMMybreUNJmkkG9TR?=
 =?us-ascii?Q?+YMv+KN44FE8uED5M78sskNLsiL8XwLFIa9rWfnDmWevjXlrQYfDAim9UgV7?=
 =?us-ascii?Q?g6ch1i8d8orZAnDM3SUZB8HqeLyU0k9Zuvzi096nQles3RS/QDzLw/K70Pbm?=
 =?us-ascii?Q?nXuaAp4bdxPx6QJV3Ck2TkrwsY3UNQhCdmx2207CFf6gL/J/zR2Yw6qp5s2Z?=
 =?us-ascii?Q?KOSX8KK8NnZ4F09PazcPYzDGr0kRQdnU1nQwtP60MoCrkYw8yV/ckfZWhyTc?=
 =?us-ascii?Q?hpK3s2+gsOYBAqvizW19aieuFTUyUNOlQyOolcD9RW+VxaPQS9TC/IdqBdIe?=
 =?us-ascii?Q?Wdb7qFUsB5gChG9DVVy3fFNnYfvesa7TtfL5QHpZOo2hrBO7+Rv+Aj2RYqCh?=
 =?us-ascii?Q?Pja52pqn2FhkgcrH8PbBMVul/216mJWA50LXfNs0qLRumJUF7RhxQAt8AwX/?=
 =?us-ascii?Q?OuwVkqGpJnW/xBzOVc17q+GnYhBr2ITNcqS9kH67JX83IxwqnHEpLn77mfBN?=
 =?us-ascii?Q?cmBTR384lQ9CIqlxnZ+eXx8lyUfG4+k8+BBuRZvxn6w9JO3+yPZxc3rdfwoO?=
 =?us-ascii?Q?Qw6gYquTo4JKbtA++ySLyBuCqJ8m3NP1la2pZQhJlfULyFuM4V9A2aiGKaQj?=
 =?us-ascii?Q?xewJqropRPzc934U4kQKsFCmmdPU9XCcvHE3SPizcBrwhQby6/72F0d19Oyr?=
 =?us-ascii?Q?2WcF/eh6ShFyuTl2UfDOqXL2C92IxHIIcb7qusf2WOjClHuHSYjNNt8B7Tb6?=
 =?us-ascii?Q?/QuDtmk+m2S7w3HwGcByv0FQYZOeraR1TTjG0EK5bDj0kyfQA/YwAmcjvPRs?=
 =?us-ascii?Q?M1sn2kTNYY0qKSdvVqi5KVe+ZUdcxBkgNNbm5W8hfaOJu8VRFh4ifliM5Ydr?=
 =?us-ascii?Q?SyGzWR+SkIYua6SUEOKF1MlD6WMxs4pBSyoUfPfsKTKlrxaCoNdBVIVUXoTj?=
 =?us-ascii?Q?jsx6NG2kRdn7dp7dle76MgH89bWvSKbJh9XIFmPaLkflx4dS6axX24BbyfxJ?=
 =?us-ascii?Q?Ji6r7/7RErGg8L43cbb0oYMdVvxVD66iptK1iYZmzrcw0KgilHfETnzQRHW9?=
 =?us-ascii?Q?Dna83iJ5fM0bmtFJ5gGL3RdUm0c8BSdb254Ldyr0i1WfAyqa+s0X+IJu7c6Q?=
 =?us-ascii?Q?venRUWoZlKAafmBxZ8+TuuYDP2ZaCjoe5linpOp0i3/NZtvjELM9do0rYiAH?=
 =?us-ascii?Q?cbIoskys6i2uPJUutq3NH+N2nd7BalubWIIYj9gQ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c652774b-d71c-4e3a-858a-08dda7761408
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 16:52:54.4081
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CjEHbljsrn7qSQpUcNaQJTwnmFrSfjtZDsmcPrdBXALu99SlcNKnyrk86uidv07QE6o7QLZQPyDyEInh/4QIiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10230

From: Haibo Chen <haibo.chen@nxp.com>

The i.MX93 9x9 qsb has a ST LSM6DSO connected to I2C, which a is 6-axis
IMU (inertial measurement unit = accelerometer & gyroscope). So add the
missing parts to the DTS file.

Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v2
- add peng fan review tag
---
 arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
index 75e67115d52f9..acbd981ba548a 100644
--- a/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
@@ -265,6 +265,11 @@ rtc@53 {
 		interrupt-parent = <&pcal6524>;
 		interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
 	};
+
+	inertial-meter@6a {
+		compatible = "st,lsm6dso";
+		reg = <0x6a>;
+	};
 };
 
 &lpi2c2 {
-- 
2.34.1

