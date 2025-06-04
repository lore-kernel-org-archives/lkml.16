Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011067.outbound.protection.outlook.com [40.107.130.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E711022A4F6;
	Wed,  4 Jun 2025 20:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749067414; cv=fail; b=dfqaPYE86Junc5FmhhhqNcS8qNsMYM5S2Arf7uHmFxuI3WJAhZEP8cH/waQgletp/odmtapEPXBrxY6Ule1IH0choTnj9eedr/QR6RQaBcXpXt34s3hvZ7o2skw/EWmovYBeC01q9YlSUH4qVP9riUrJHnsYThd/vLx4HEl9zsY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749067414; c=relaxed/simple;
	bh=XHNxfei0U2ABkikVhKJiFUgEOTROE0lXxx64mFbRY2U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eUoCQvZPP9DlIiqpmqyxD2q58GYZUm78YAfSGXjkVZ9SE/4ljRr/VHNit0rpMnbgTCtdWh1YEmZ2K5KZ6WCBMw+enG7vxPH1pC7r0PIpIqmpTeJuEEaQzrOAsYisv4XI4fhQAlVu8uQF101GOuN+MKwT47BtBtFB1X5G46pNBGE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=FG4KSCpc; arc=fail smtp.client-ip=40.107.130.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="FG4KSCpc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F1xYghRZNxTi6dlAtlblHD3VGTPAlHaRweNSEWiNl6fvZNpUOS+DOK7l4rNibWjUpPkth6DBPDDR4k1skK547drwqDif8oGwaZJGXq6XFRf/mYRK40MUQRzMNxTd13eMkdbnagUdQTJxeubM9u/mehiVtSIo6If9XWemd5tj/4iMPOlQ2JRCZ04Z6lCezlMKLk+zfnL6YBwXewNr+ULBYR5yxKGkV9u9jg/QHfP19kzGPeDDzCVzfoKwCNC603l4pbRsSrVnqvsPb1Vrc1SvWZLEk6Lpm7H5uIK4U/HcdiLObf3yk5by43PmzgNbAYJU+86zvTOcvDtKAXs83/UvmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EA1ORJx2Nq6VYqB3eMmMfZCpu6fGuS566dV40jzNa+c=;
 b=c1dxLv1N3tFZJuCmW3aa4rQqrPyzV9vVuIpGvZg2z1f0YPN2WeS6vCkoV7XwvGi+UI1Qfq76u7OK8k+BCohddSi6JuqyWIpb0kC7c9YONut50U7EAdVrLdFTLE9lgAeOe4PfPvbRXzKkdHgaT7BI3HQaEj+Si3XR1UrtQfsHoTXu3vSapXZJPISed/M8EFOlWF4Li1amm3fCSNfSKFksb5THiU9taxQownfgImamtK27bj+eeoG4TNh+1Xne1icGAney7yXD5zSPjdSbEAb90pIh3u8wbdM9Ulm0t3o6LV1uBHiWStwBYaa2p/ofEQ53N/1zri/dwRdybtT/ipGGbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EA1ORJx2Nq6VYqB3eMmMfZCpu6fGuS566dV40jzNa+c=;
 b=FG4KSCpcBj98AfSaxIRKxtvUNmQSoLZsACWENHsdB57kSbN+p9LO6l8OHFQ8FDc708dOXLiOds29UzkRAOgTa/EowZq7q62Hnc2yb0sDv2/5UPShzhoqNzey2lcSiKfUcbXDFSHY4iRh9c57a4M+7eNTMYxZhd9JUQ0FWSmnlmXKQCUJTWMB7UHfCgqcLMtkrLz3AIoJzOh+AlRsYqv7M7hWzXD4eA2nxvaYo12ZhUvj5a0gLE1JAZRtEWR7n7ji2gMfFMSeprRXKc/cLp8UE6IsMt4RrQg9HRZxe8kH4/v++6QAVtYkugx78dWPjaQat1fEOD9ya8hqfIBbMiR3SA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS1PR04MB9653.eurprd04.prod.outlook.com (2603:10a6:20b:475::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Wed, 4 Jun
 2025 20:03:30 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8769.025; Wed, 4 Jun 2025
 20:03:30 +0000
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
Subject: [PATCH 4/4] arm64: dts: imx95-19x19-evk: add GPIO reset for ethphy0
Date: Wed,  4 Jun 2025 16:03:01 -0400
Message-Id: <20250604200301.1192096-4-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250604200301.1192096-1-Frank.Li@nxp.com>
References: <20250604200301.1192096-1-Frank.Li@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR21CA0005.namprd21.prod.outlook.com
 (2603:10b6:a03:114::15) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS1PR04MB9653:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d447e52-4c9f-43d9-e867-08dda3a2e05f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|52116014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?U6DWaewC+7lpey8+gbm6Enbq2q1evGDk0cY+zs/YZjccZHtxG70B5uV3gNb2?=
 =?us-ascii?Q?yGVkg6iwYNCeJw8kWkcyrTI03x6k8IZUfUhXIWkcyAt9A7f7hA/VwSIeI+iW?=
 =?us-ascii?Q?D4E9YDGHhanNtOCHctT/W1HdRu40gUKIEKzvSkqhjLXuxRtBedKQSNWKmjTK?=
 =?us-ascii?Q?EmCriZi0IP9fM+12v0Ye6YBgZRNqHi1z45ZwB1TaGozd7hkVVGcT+MHSOsGV?=
 =?us-ascii?Q?3mBGLpei9cFjOecLRvHfnAv9xNNzpqHXNx7yw1zFyF2baeCNAB/TI2wnYhwL?=
 =?us-ascii?Q?P1pWeubgOTyXXDmO0gNpifun2cSV/WTSkIX7/cgJIYv6MY21nlDP4ZEcAcb/?=
 =?us-ascii?Q?NrGr2tSrPxwaMLfZP8V8rr6zCeAmEqpVU991YsVYkkkX+E/9ULuOvYFH6Xlp?=
 =?us-ascii?Q?OVMSSWtBJI3OMeHXDmLLwfUeR2q7ckJqenl1Z+g/GXw2ZpCJf3D0XnFI54/H?=
 =?us-ascii?Q?NJuVKOm3LKeS28FUHiqvpmhl//ONRDZKqkq8YEA+xHKAWjAvc2njdN9/zovZ?=
 =?us-ascii?Q?CPVfzMBNcbApkwJYK8bxe8XJKBQo3RSg3qOEQVU/wJuSuUL1vUAnObYPkhGV?=
 =?us-ascii?Q?OnlyNfui5MaZE/UdLPD7Z5BvpB9/rlXMG21hC2K5aKZL5P9Ly8/6ASVBklz+?=
 =?us-ascii?Q?MbVLArIO33W2loMJO8WtyYU8Z+mCWazZqUxrnxg0GF+NRPekd5QJzeB1l5Tn?=
 =?us-ascii?Q?ggW+Jz/Fc11yCJvD2GbIqick/59nJ+SI8yXXuv11MyzezbiXinzJ5h5F4WHH?=
 =?us-ascii?Q?BKcyYpet/qTUrEbm1wpEJIIrKfbp9wmAnkSGAGiAMHZFgw0Fc8l9pUm66Fui?=
 =?us-ascii?Q?OifsJ4m4pXq1XyrVZO4X2qZEAktq8RMOaRlXQcSP4vGkrgfHhd7sxi45+AUz?=
 =?us-ascii?Q?NXSf5dWKWgLY5XNlCD0sK0w/9CwARuV89tOR/xjxN5YmCzQCAJDF21u1YxyA?=
 =?us-ascii?Q?Ld8LHnYLt9DLo1WrEF9VQR8+EUQFVtpP0TWTUbLBEKwvN7YQXPfkHW2OFNQ+?=
 =?us-ascii?Q?/IMVpKxT1froKjGb5JF5DQNyTuNGMdVgpXZjdfF0W/jyqWOxtEUZCRUc7Wpq?=
 =?us-ascii?Q?NvkPHPbOBFB9orZIPSJyZvlHyNdEdRRdxygtt/+slNcPJxcp54X6ugJXO5xP?=
 =?us-ascii?Q?YMkyp0GyfqJqMJYTHXIhFYd0Agdadu3c4QiHQQMLJLz6dsi5Hf2CNpldXaRD?=
 =?us-ascii?Q?MefOIaNOTAHZBBAtwjij6Xyk38YWIkx02y7DirUfoU3GRlkI8TDlPRpLysNy?=
 =?us-ascii?Q?leDYdVAQSjB9r+C6BuS34gDOgr/rNjNydFHYDx7yMjAkdJp2jUAJEObSorTt?=
 =?us-ascii?Q?MHQxu92V2WsjSSGaL5wtCUF69UJJzn5/YhEvT+2MJwF7HhhLO6VLaM4Rw68I?=
 =?us-ascii?Q?18BTnr0hdE2D5/TUeqklKjiWoO0eb5tlZrly02TgyWoFn8yM1bYZwTZ7GnZ2?=
 =?us-ascii?Q?RLSBmfh1oIxsmjnNw6rqkalxJA717D25u5uigzJ/Hx+zVSt7LW0J1llQCi2k?=
 =?us-ascii?Q?In8vthMziwJNjuI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?81b1y6aamTEGqwBH5nBBLPQKpbNsayPwTc25jgm2plcgDaNzA5F16NTKlPZz?=
 =?us-ascii?Q?ZAdGwgF0L0wdOOGfrcDHowmnD1mo4L3D5kVWbVX2xjX77AndbHZ3oUKOsMzv?=
 =?us-ascii?Q?fzpOU9+0JUNnqasKmI1F3RalNslrODNppw/E+ceD+upAc+cW4AZFt12la5pD?=
 =?us-ascii?Q?JRBhKtdbWqkZhlYPYCleSSh6m9JkXNxYqQuD0nf5KLwZpBx6ZdchcS2ni+dA?=
 =?us-ascii?Q?F9I6XZ6RaWObiyIOcFLlQrHXmmqO3GJ4kffZar66+ZVkasgORSV3gsYsuQuz?=
 =?us-ascii?Q?V/ZtLC/CQSp26w+21tMBZHdnSUNWJ1A49h4yICg17gIBejBoNbI+B3moFycu?=
 =?us-ascii?Q?EyUMmH3lvCr7/JbHYy2shBYIM9jMaglzDSgP/UjOgF/2Ux6DoZrHNHFh4cxc?=
 =?us-ascii?Q?94kpNgUeIBxKcUbcUed4F3vl9AWCoi1ZzGPodRG3w0auQKkjjrQ/tN+eBoP7?=
 =?us-ascii?Q?dP/SlH27o3jSl/cePYb4UpnUsFKVH6lI6tN74m+jFn7+sFfLia8AG1apSNVr?=
 =?us-ascii?Q?zUxNHL6quRbDJkmRl3AkECnlvFCeEqEKeBWaI3rPaxj8z/syhIAB6H5pBB4W?=
 =?us-ascii?Q?ciQ1Uh12GG2pk+Xo+1Yl34kxPG/Q2WP8wFSwye7Z5dKU6CI5+67HH/RnvVxF?=
 =?us-ascii?Q?bfJj7sfPpFII2Igkyh4YBTHukeF1pquveT++oxIpfDcX0/gbVxDqlRCBiZr7?=
 =?us-ascii?Q?NDmW9KHgauU6JrCX32yzh+3odIbEW7BfOdMKBRbohe3di99o2a9CMAr+4Aca?=
 =?us-ascii?Q?VlH0UbU6PyWGTo+S5DVFJu2iFdFz1tNvycqxQi15YVKKIMj3GCHnz/HpEIbf?=
 =?us-ascii?Q?Xlpus5avH5t1Tp3WGko2hNg73hc2l1N+otZkYHjdnWgr0N6sh4O8I3usGEuO?=
 =?us-ascii?Q?2X6w3s7ZyAYoTlRSCK23R7gO191waGJwIYgRtK2ol522+5Xbt/PCNA337jGS?=
 =?us-ascii?Q?QS/e8Oyjlv0IoQsDcXXvdHertTpno9/twhIsxad8Cn71G0duROBMid9YEHQ/?=
 =?us-ascii?Q?XjBchWKlw0lD1vHxB7PDcUreElx0OjzRew28alQa8ukmNlPkFaJO/V4CxuTZ?=
 =?us-ascii?Q?OhRmztkSQLFAWBK3JMhA3iyvljtd+19EmwxwlaEsIhd7luy6UkrvxoNxREV4?=
 =?us-ascii?Q?Rt1QnakqEzkLoo/pFE7o5orw8g52Gm4rOY5yM08UJx6OLKCdos0l/kX6F7DM?=
 =?us-ascii?Q?6DGLt1NR8bVjtaJ94i5b8axRnIQaOFpU9i3wxBj728AzaVjFzLoIEUFQXQCI?=
 =?us-ascii?Q?GYba++PQwfG9BFq+TwCWUd+nlp+BTDvDCgCJK69b0fbvRy1LYyq7NWie25F1?=
 =?us-ascii?Q?lNatcfzbNhEqO7UixM/IvfD+Gt6kt5mrMvrrkVPEMKLtKXOesZV3tmIlC+L4?=
 =?us-ascii?Q?W4ivMiZQa4QHevSNZcWAEp71yFP0NX/nR8tJENxu75ty35esy+nbHoyo3PoG?=
 =?us-ascii?Q?R5Gt8IejQok7uyTp84WqJoUzqGGy3z/WYsPZK1/bw4hqcEwrqhqRujuYX4aV?=
 =?us-ascii?Q?K0gS0J9PGXqmtqAX5tatek1TuA/4+WKbG9f16Bq9XOffsvGxCzDxQ3FSMjz6?=
 =?us-ascii?Q?byifEtcDx3TCDVPM/H915c0+gACX+e78EVcSMQvi?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d447e52-4c9f-43d9-e867-08dda3a2e05f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 20:03:30.4933
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IJbCSdJwfVUobMbeEhgleRLOf7UBXLhIF54q7B4z9rmg3kwNbzZSsYs8A8LUb0MMu3yV781syDV5U78otSqP+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9653

From: Wei Fang <wei.fang@nxp.com>

Add GPIO reset for ethphy0.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
index 7fd2b12cacf40..168b12f9ceb1a 100644
--- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
@@ -513,6 +513,9 @@ &netc_emdio {
 
 	ethphy0: ethernet-phy@1 {
 		reg = <1>;
+		reset-gpios = <&i2c5_pcal6408 2 GPIO_ACTIVE_LOW>;
+		reset-assert-us = <10000>;
+		reset-deassert-us = <80000>;
 		realtek,clkout-disable;
 	};
 };
-- 
2.34.1

