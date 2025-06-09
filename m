Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011067.outbound.protection.outlook.com [40.107.130.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174E021D3CC;
	Mon,  9 Jun 2025 16:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749487994; cv=fail; b=mYTn0zQYtr4StlxxuTMgSPUcHmsshpeOz90mUHaHXxUK0obRJ+tUJOPtt+wik1ywUnHTwcR/lpf5ibmc2GVHxwXA3sqka6uW3Y0Vlf+yuqK07E22y0WixwQ3pkOF6OYSAH5vkvqbE+GI5BMmvCcSaewEkEYWWZ3HAe9B0yiViQA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749487994; c=relaxed/simple;
	bh=kPtJHH/TPVZwLcn8we9sl1srhPwSr9vhaGIa70xIntQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bWPGGbb7Fh//SP1KzyREvgnbk2jz1CJJ+I6iAgQ/HRvV/Is08a/+dGmyEP0kNPHfRAaSDvr91qxOPXivPcQeTqGK9eUzAwO/pj8Tk9MEiQhhufzizTPFYTe8HbllkyJPoi56Vl9fTC+TMoITQRl1n4Qry9bQnKmS72nkpc+d0RA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=CslSoC09; arc=fail smtp.client-ip=40.107.130.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="CslSoC09"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xk3kyZHeik3oltLE7Q2hVAQFUZ5zotjpPzr52NimFTtBuFo9MiLrjsItMmTfceHUDUZpvlG2bD/H8nNeYiaKl0Pv9QohgwUMY6dfjhQsr9MXor7hhHtm6ljSWeUNcvNvilzzfrfDksRfOJ9nbFa3yGYFZGAr0s/l6wBWKw3HjDMR8vMBs91viyT6t11RUuyGsXFX2odzop/H3D4/X3ypJNkw1wZP9UrGReHv6CJYKFPl9o/2DbU/ZfA14C2xIah/PqLtJ4Zsz2ba8GZD3zz+udCYvBkcgqwwBRHRGOSoO42NAm6KF6bEg3XRsdGxoGPXMh+5KqiC62mDrQI3df/wMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e8L8RMwW3lhKuYRg3BEo0AwktzNH5VoEMc4I3FIb4zU=;
 b=rwmHtW+RFkk5qqqKGzblS3if5XqmuGaPIMMWsAnwQw7olQF/sLdmTJDCgIZPsBCPnSSfdq05S7lhrd09E7Id5AfWEqCqM3jP8dEaJsA7Lk0YO+0wG8JQ9VnFAmdXtVuYhRndE8X1evSVMf/+68CcMiab2bIR0aU+4YO+XPxXCqgBYPYtFWvJRLFBGNVSCCuZxkqpjea4kne38Xx9/zOVpSng5Clr0NtkIysQsC9h4V6WU1SsP/8IVnpNlFXtWUA8WWM+tEYvygEjzMh8BVzQXfg7SLgPCXV/yMkSkM2OhAiKUYEa5aVL9sYx9Jxa/p5y3S6HVaxinjHAp9YUCGUgRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e8L8RMwW3lhKuYRg3BEo0AwktzNH5VoEMc4I3FIb4zU=;
 b=CslSoC09tvBellfAi5v9ewGtVWZeLc7vw1O2jYkBWTtW0pqA2DOsRrKkEylb2XYfD3epfW4SVPJe2VSAKpTPwADz3CA/c5Htl9Tm0Jdm/DtrGuMF+CbOxUemL2t9USiQ22MzMn+eOpYW1RYEPa9w2LAZdxwZa/CB9rmu8hhLcnzS4CoGx9tTJi6h3s8ddkSaxBK6KUc5/bVxknrU6ky3G6dacgMr5Vu1z+PbHvtH9lYtNpNVdP3WN8MYQALhtScuh0HDB91KNcBHB6jJ/nrRswr2NM4AKoGQDSzsXnS7nrSe4C6y2SxpGjw14qYTZzKjzKIkdoDPp7VPaAWp92ajNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI0PR04MB10230.eurprd04.prod.outlook.com (2603:10a6:800:240::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.26; Mon, 9 Jun
 2025 16:53:12 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 16:53:12 +0000
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
Subject: [PATCH v2 6/6] arm64: dts: imx93-11x11-evk: remove the duplicated pinctrl_lpi2c3 node
Date: Mon,  9 Jun 2025 12:52:37 -0400
Message-Id: <20250609165237.1617560-6-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250609165237.1617560-1-Frank.Li@nxp.com>
References: <20250609165237.1617560-1-Frank.Li@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 53aa7119-93c9-4002-4f4a-08dda7761e98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|366016|52116014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RsYoXJrLamX47fUQ7IeE+kVyEZbDdchkaPwsuaY41ox7OPY0sXF359imZxRJ?=
 =?us-ascii?Q?2wt1IMaT236MkHt5oTCRl4jYmKIOAW+GGOjh+TTm5KqunZBDOBVRL3itjTPv?=
 =?us-ascii?Q?nt0kR2H0/acEMxya2IbyH5ZtwfBmRLjHSWe3Vm2tdqpyc15czpe37pYoJvVM?=
 =?us-ascii?Q?Fl8ir1D01eyU0C7JaJhLPeIQ9fz83lkhrWUcj3Z+cpgYxI9azHmpFR4hfNyZ?=
 =?us-ascii?Q?r5AdozPNHV/hmP1+o64HUtHAbkME2tPasHK44HutXmzu/C4UzH4vYIL6hQT0?=
 =?us-ascii?Q?T2LZ3mq9N2JAb9YN0QvK6WO9il2f2+5AhJeA0GrhIXuAp2xK0gQdgjx4nCRs?=
 =?us-ascii?Q?7dLY7leeMVBIbBX+/Cosqe14KALItknj3Tzo0OSEyTzT0ezUSwgb/qAoHvdL?=
 =?us-ascii?Q?yBrwbZTptpxOOcAZvRs2cWaQAfFXYYkbeZPppsOFcAkjs8hhUKPxaBf0a5pf?=
 =?us-ascii?Q?W2maBQNswki9CMn0mx3w0GEMypceJWEeaLlFwbeu4yKROu+W7uFB1lfDdT8p?=
 =?us-ascii?Q?DLKqE4F/bqvlIfLuWdc2655K/idTXPJKe9vVNk9mAjBsd57Y7bDmjht16Mj9?=
 =?us-ascii?Q?SbquWSCFw3ZvSgrFSFQrGN7OSNzh5Y+XTUVlGiAak0MdxEIMmM5GeMscEO5v?=
 =?us-ascii?Q?FQlfMwNX26YFnDKq4FvQUEi+BSWiCUlob7Q6JBEBdgOWsBThoceTpI32tvSD?=
 =?us-ascii?Q?Vzq69WvfqOYzRFR6E9jzxilDque5mD72HA82Dw9EgDmKD/PSSEbujsovFE/l?=
 =?us-ascii?Q?+OKC3ZayzZZeLRUjioF/PKukhy8+OjnGhJACN6XdA1tkIN1I1dTJKmbqDIvl?=
 =?us-ascii?Q?QLvKCCo2m44QLsZj+n1/Mpf2gtCuBPRCrI9Xf6SjSzTL4rXu1yrw/BSx8zYJ?=
 =?us-ascii?Q?SDKgvov1jmmoj1/YT+i4CAHQ8dHunvs3+4DxVRkt4JOielU/PgiSCcoPKDWg?=
 =?us-ascii?Q?F0Pwgi+zC2yitHV887WIj1fm8xsP1qwFuHwldkFHbYbfNmcB97el6OyWGBus?=
 =?us-ascii?Q?gHSg8QWKkOsEHjF4ROUpsXyYxa5i2E9AHF53PcYDpQPK2UKY7qEnKbe5cD/v?=
 =?us-ascii?Q?XhHT/v69bhjr7R79pYMOgNHAThwHhBXx7NAQHM2l1vqRmoXy/wAjGNpVtjh8?=
 =?us-ascii?Q?wpMN0AHdTTZZ9t0cTRFpOCJGn+i3CDNxnbWtJZtrZw+ZXOH960WPmoF/ti+t?=
 =?us-ascii?Q?4XcACpjf4VYhDhjd2lWvCce9Z8c5QUcKkGoOGGSv3dr1PnsRBtel1z4mhPzp?=
 =?us-ascii?Q?pDYHUexjuF2mFdH+eKNrUInrFOgURIyP/bdJiKAukJTJX4dZ25v9GuNJOySe?=
 =?us-ascii?Q?v79G0mcxsHkl1RkK+BbkLLMkw/5cbGqkmIlmNl6jTUqhYiKy7SYz66vJeQUi?=
 =?us-ascii?Q?rBUSN7iBQZ2dOHCyAFyevJcQh+NL8jAj2IXU4SCsGWpSmx1PVlp1lDAY+kRE?=
 =?us-ascii?Q?XRiYfM6e6zt0sw4cV3VfYvNMy6vvaeaDV+pa+wkOzFzurqsq2QX3ynNfT8kA?=
 =?us-ascii?Q?7F/mxVLARWHkSdg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(52116014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qFqmiWttXS5IT2zPp3DjU/5chvXF46V/4SJNnBYcWbc8WASeIqNICYGhKjsw?=
 =?us-ascii?Q?3jhaF9fAmNkjgbQEIHrw5HQqCl0SHJRv7asEIJBwfgoQMZGT57RJ757Dtrsl?=
 =?us-ascii?Q?4/za//2CVbIxOkFOUwT5XWIpXxcEvGwT9/26dvm5xQpsFQE0TX0vCi/x8Um2?=
 =?us-ascii?Q?uLRDpTKe9yCX87pOa7aiJZ4Ar/lOXpBNvv/hSoYFxOr7ip4BSriD933smhyi?=
 =?us-ascii?Q?YJnHj4aybYoGepOsSVLuPIaCR45rHR+wkH9XPo/rfVHU70wk0hf0V/ikr20R?=
 =?us-ascii?Q?9aRt0TO3Z2m0xCo8FojHFOMvRxopbIVPQM3c9aUaYo+G19JEXsl6Z/pjpN8I?=
 =?us-ascii?Q?YAEjwybeRNE/iID+k90n7zm1ocFFklxuENdeh2g9G28lTwH2ub4nkyPtkaUx?=
 =?us-ascii?Q?5sXl64a1xjgfPPHRy8/syQ91kWZANvoM3l0TBecU2F2bt+1sV8oXXalHfKiO?=
 =?us-ascii?Q?UC5Btx2AUqhg3RdO2AAkb4HSKwJ6y9KEYLWavOLS+t3aTaiI7b40DUerQ6ky?=
 =?us-ascii?Q?93sEOTtlUDB6N5dQ6Xqp5AVMK2eXnZ6yK0c3hUhAOjelQyWYIn+nAkNKVmEA?=
 =?us-ascii?Q?7m2sxH9XUxHkpyvKWfaJbX7s8PzvfZjur5vgNLs+WWMfDHZNeSgII9RTYb4z?=
 =?us-ascii?Q?J6Ai4pkl2y5qz7h2QOQoiB1C/5rSR1w5ZMqPoGMVV55kj2+lq6NxzJtX4W7c?=
 =?us-ascii?Q?lIlp+g9hLZDHttcDxONsa7aaUwMgQO28JdNjxLB9OE+ovE7wwu60MT5Te9Iv?=
 =?us-ascii?Q?RDs1ZzkI4HJMfgz4lgZFukpVrZ7xAtm+H6jgThuibyPE6STU1JY+j2GA8eOm?=
 =?us-ascii?Q?qAdSZe3aVKcrty1K4O6crBWfcUUn50+Idd95MFQrLKs6KzLQjZlsOdlfEVMi?=
 =?us-ascii?Q?ZNqeMb1uzji1xMpupwuRPdUxj4bopL05fy14nyRIdKrRBqqJ99az95nDZFx5?=
 =?us-ascii?Q?fvrNtTZFRHN9qUovo461qBEepqt2DTbrHIO5U0GsAacsrB935Tz69VZ5/UH/?=
 =?us-ascii?Q?mprKCRc9+Gpgywpo5lrQeH6wChXyhqdd28EzOnPF8bBqyGvLPv+iAvculHwA?=
 =?us-ascii?Q?hW6Q0MOfpVzq0FKiigTF86/q+4TSMosiVC/QJHDxC/mf5eDzlk5cNUyo6QfW?=
 =?us-ascii?Q?8uyQZ7nL0FqqCrvuxtwz33ZbtBcJbRCMxN3MuFo+aregmsUI6/0YuPSdcU8+?=
 =?us-ascii?Q?ssX43fM6XfEJ1ML50eo3Z+qabbaItKN+d8EApHjoARqyavzS6tkhGL5pZ2/t?=
 =?us-ascii?Q?p6je5tCvVJXZHqS9HRQ4J94LzgJv2HedCTCIdQWcDNVKVF/YJbmjpAyne+Mr?=
 =?us-ascii?Q?9KZbJj+ITfTIbpvekkkcQmt2BGr5PLLyhRvklBGPkf2CNgHyDYAwzggKhnVv?=
 =?us-ascii?Q?1udEV/tX/Y/dBEcm6/0PqtuDywkIqjl4dyOd6oNWU8dZpaOb9No842gNs3Tz?=
 =?us-ascii?Q?UTcA5S8kZ9ojq0Ppg60fJp/Qdl97OMKgfjenM/fbVN7zQgeKOt0eo7KhpClj?=
 =?us-ascii?Q?Z2gj1LRDRiXhZZV2l/e2K0D37G7sND5t2/SowD37Pmf5vCnOntjWRoMT/iNz?=
 =?us-ascii?Q?E7HRlHDVVMYykYC0+ik73i+T5iyQdBbvgoqvZl+t?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53aa7119-93c9-4002-4f4a-08dda7761e98
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 16:53:12.1047
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5V4i9n0k8O2hzPfOt+we9+XEuJrxayPDYDIogF9bEIK4oLcjTEYMgVplblKMo2Fo2H5rr3KHc7iXT6nRYAYZaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10230

From: Joy Zou <joy.zou@nxp.com>

Remove the duplicated pinctrl_lpi2c3 node.

Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Joy Zou <joy.zou@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v2
- add peng fan review tag
---
 arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
index 31fb1cd8daba2..e24e12f04526c 100644
--- a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
@@ -722,13 +722,6 @@ MX93_PAD_ENET2_TX_CTL__ENET1_RGMII_TX_CTL	0x57e
 		>;
 	};
 
-	pinctrl_lpi2c3: lpi2c3grp {
-		fsl,pins = <
-			MX93_PAD_GPIO_IO28__LPI2C3_SDA			0x40000b9e
-			MX93_PAD_GPIO_IO29__LPI2C3_SCL			0x40000b9e
-		>;
-	};
-
 	pinctrl_fec_sleep: fecsleepgrp {
 		fsl,pins = <
 			MX93_PAD_ENET2_MDC__GPIO4_IO14			0x51e
-- 
2.34.1

