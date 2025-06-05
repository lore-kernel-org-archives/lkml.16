Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013069.outbound.protection.outlook.com [40.107.159.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E12B27F4E7;
	Thu,  5 Jun 2025 20:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749157167; cv=fail; b=BUFRAQVseT0eOay8apWWXafx3Q+1+m+HNtaaVkUiuw3BWs41DKjlw/4T2nIZ75H0UItwYP5yCyj1orzodNsKlquUGrlLzNRi5W2s7YU7eqC++/Is+5JaNdmF9aTjHNGN2iV5rSjT1q8gpM99ZS5vi0SbT20NwbUETZBj+3g9D3c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749157167; c=relaxed/simple;
	bh=1IpsqBQ9BrQeY5JYFS9U/sbkLf5XjSmiBA8Z9xfyVtk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LvpuXok40nXvFaCMbV7Kh3mVFFe9D+ZdFPEG+toeQf+KqARak1N+Dzbx+mQKZ959+gksqx6Tl6try2Xta9wwg2hsZJMKS7OQacEQeGUVkVJvK+/U7Hb8+T+1H/VioJ8C2J5Tg96AeWujO3Eyhw88CWHLJIZ0Na8vkViAWMy/evo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=czkKqbVw; arc=fail smtp.client-ip=40.107.159.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="czkKqbVw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YCmYTaiuAo0LTp4ul7NyVxpghnJCkw30/4UTsTIHsb+9yxuSxddcYuycO0E+c3p7hjVDEf/sdaoxCqPfrdzt4BXl8biZODs6wSOplgSOfbhH1ijceb1/4d7otkXURL41L0qwgR6BXs0kZO5t/mdaMAJte99T16nAFzP3xis5dk7IWaG1BqR8eQ8AfJnYibM+CTXywJJmLdbVp2CYNj1hZlibvuhOUBwT9VlpRiTuXV1HyIm48dbcqT93F2u2kEYz1JjwaSrPIMmub85UryVtdee2h/SaKSXKnAins6jW/67F/6K0Wk2IWlp+EnA+O0C37AW9TFsFLLOjyFL+BMm7LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nc3LuUCYuQ18WkALrBHMwYoFPfiLTI0jE4+21jT3N5c=;
 b=yZdIXDmTeaQTueevEKXun5BYtb9JlUr9FU5rjGyOutLbHany8O42qc5OFuX4qVpKoCYcUDLPAGcYJYBp5kEB4sVAhyjkwiH9f9C6BgNq8sDiDnI2zpxsSf0HUAhBi0WHATTqfwxb8OXekTg9HHY6f2RxzHE3d6i/GhzNa/gS+THICi2ECrIHfAvsvFV4qqMG2rtoeDkTaJeAKmk9h+2uW20mHmefri+68NGm2wNs4MrKLCygDLrBI3Zx+LgT37+AabBSSYFtv2PsEF49qM4SeATybUFNfz2OnC1il4caGD2gCzAtz6lsWAIFNh0tcCnf5B5d6/wpxel6HFstsgkmrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nc3LuUCYuQ18WkALrBHMwYoFPfiLTI0jE4+21jT3N5c=;
 b=czkKqbVwL6+uLMV0J6z43/ty1QyH5HTTg9etKag81dlbBnZtnK3fEyj39kmAwas8SVdoXuNJqiiRTNzL/gnPxempzm2fJ/4Oj9Gd5aux2F08zbTrolE3kPNFaQDeV3qTDZMuF+NeEBOfFOEj9bAZPj6kr2vp2vDQfvV7ZZWKT14jUlXDT2VAn2aLP03FCMoPPImUjp0e+KfRULb0QYYqh1kFfvPsP6aqn8EewRLORsL4w5e0NWBjxEjjkNl091bEwS1B4ccSWlI4bTzBOxUl++gMgS/k5rwj1jzsE4evxQ4ShpeyqqrZhf4w8zrho2XGxsDT1QHclVkeACqzPoc8iQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS1PR04MB9697.eurprd04.prod.outlook.com (2603:10a6:20b:480::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Thu, 5 Jun
 2025 20:59:22 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8769.025; Thu, 5 Jun 2025
 20:59:22 +0000
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
Subject: [PATCH 6/6] arm64: dts: imx93-11x11-evk: remove the duplicated pinctrl_lpi2c3 node
Date: Thu,  5 Jun 2025 16:58:53 -0400
Message-Id: <20250605205853.1334131-6-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250605205853.1334131-1-Frank.Li@nxp.com>
References: <20250605205853.1334131-1-Frank.Li@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH3PEPF000040A3.namprd05.prod.outlook.com
 (2603:10b6:518:1::57) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS1PR04MB9697:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b247973-2e7c-48d8-96b9-08dda473d889
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1V9bHfT21aYfDY/K9KKf//qsBhyEjVqlrDv03QVZZU7PL3s+L7buB8/YQUsy?=
 =?us-ascii?Q?VN8IOMQesMVtHcW7qDU6ANmLVQz7rkt5KtpHytALw5R45DiSb4TTN85FQRke?=
 =?us-ascii?Q?9UeyK8q2SQ0Ouq/uj/hfFyyy67k6zDGve7EGI9ufCcOzwJwezPiGie9N2dy0?=
 =?us-ascii?Q?C+lxc9fWUQLkfzR4JcDJM2Gkrr1FRZnFYDFC+KsUcjhjhfkskKB/6GzbCbIT?=
 =?us-ascii?Q?9Ja1s1UCRp6jHeshktIB7RqfVAG6MAfLjMSDP6fuvCWI3zQdcw82GQrtamwJ?=
 =?us-ascii?Q?bq51hkAvKvGUaEpZxjK24/x5be3iHV/MVZsqZvE2RPkm3KNfSrJoAr+hEDc7?=
 =?us-ascii?Q?pIodypuc0M/uibEwZf3uC19/jVN3YglyaKa8iNKkbPlTb024jQlIjg5Szxd4?=
 =?us-ascii?Q?GTEo+foFEiwhgMLNZq0zc+HIFIkLjMtyFA+MYgdfdd+sQPNiVMVfeu6Q0hli?=
 =?us-ascii?Q?CZA6+GrrhT/Y6LC1Wzoy+odgBZ+OW7mEw/CZ/Dq1b1nepuL4NyyFePYPD8FN?=
 =?us-ascii?Q?FwyRwknUYU2EP3ecGkN/8a6oYFuC5K+dOXm0B2QgRo/Y3E1DvusxkyRwGK3A?=
 =?us-ascii?Q?wa8JMxMFrAKvX2ZfqGTkixjHEdQZUpgWqt+sx27J9rYxNl2KpDeb1TMepiT/?=
 =?us-ascii?Q?mzsCxqqed76dUU1B5n2SBoRW50sMMfSNLP7jmbjCWlm2+laMS0sWLcRRNQfO?=
 =?us-ascii?Q?5iuWdUfI3o17225K+N+a9I+0Ss6vZ7Azas+oLMP6SFHBOe4zgJ1W1+zGkZm5?=
 =?us-ascii?Q?gRXxPPY92qW4AA4vVDbonniYIfCtqj54TIebG7xyhVr6tl8PTua9TnEETISs?=
 =?us-ascii?Q?p2pMYQn2vbf5a8MuN5m8a9sIzsGsUcBI9LDpvDx8iG4BjW0KXTbWaohM36cW?=
 =?us-ascii?Q?kjzfCz8walTc03jYffiIgc4BwKToyjWQiwiCe6zZl2rnZGtQclYzqWZww8ts?=
 =?us-ascii?Q?fzdkoUxDVzEdn3B852nF1Tv33yKadtqxviyPYzNOsRP0HT1EOpDIZYiwnEaD?=
 =?us-ascii?Q?6in2K2u4F9iYvQ1PD/d56eF/reeyWQZJ4w48X/htS7DzZFOX7e9aafnZevds?=
 =?us-ascii?Q?etwUNtz7uBBDRGUV/P8DVJrX+TOG056hl0YSGtjtP4VZZnHyaSdKpP4AMkBN?=
 =?us-ascii?Q?gFcX1Qd/kTUSIYvn6cERldXoiw7QIEIJlp7iyc2RAUxqiqaUrxuPk00tHVku?=
 =?us-ascii?Q?6MHYCp52CEH2GdejYvPj9TCUTe1cnA50lo/ueZbQu4f/lzQNbtnPAkD1Cc5B?=
 =?us-ascii?Q?LOE0hqjp52ASrlxyDG9vIUIsD4J1X+cLJBs32ExUmZeiMYCf24yyno+bDJWW?=
 =?us-ascii?Q?lWV4nu52xoF8Js88DCeB7xoRr5Wp/JdEnA5HGkwaxJuC7CIO1/DM0g2aPxbI?=
 =?us-ascii?Q?RqIBfJ3DIrMdBcp7807Qnozd/fbc5bx8qZL+6jenBemmUyR1tdn+Jl+pIKP7?=
 =?us-ascii?Q?zMK0gy41U8nBEkAAIvvQfClWooitliUmqtrTcXHPQpyjL7D/c38w1ycnts+X?=
 =?us-ascii?Q?a3iVHKXjKG7rMYg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?84w1ecJ3FVmGi+sLs1zPiUcqBWO0FtdlLCeomtc3pPyw/PmZIHBc56tqqOa2?=
 =?us-ascii?Q?boF4grERL5ZqWR/a7b3WWPMT26X5ACbMQym1pCyzf+l19X+ScPURMdnQ13p3?=
 =?us-ascii?Q?BZzTO2G5tRNFZA+WZz/HPWKl6YNyv4yu31mCV+TuLGHFqRQsUtbx8jTTdR40?=
 =?us-ascii?Q?o1iUIxwTfIFpHEO/vDnHhkQIp/mD5jxsdVfpiOzfFjbrENG7DI/3IWQdcYNL?=
 =?us-ascii?Q?UUT4gZ3JBRWtuPjUsCnnO/AtaKAtQbxYiCGqJyc9mqXu64BILTGk1O6wOdBQ?=
 =?us-ascii?Q?w85hnT21pMXwwQwypXXA6b91W+QUyg3JrAuujGBk5S/YPVboW5K8czMpbScm?=
 =?us-ascii?Q?RzeUwvo5yeRe1TdWT0qkMh7g2Sl78pBaGdZ/9DV45IkA+HJE05wLXFV1zbvU?=
 =?us-ascii?Q?stalOWl4XComyZB66Sspuf4UTzg/Y341So+0WHJSaVXW7zldiXh5kjO3Inup?=
 =?us-ascii?Q?qPgOCVpNQU2xRRvHmz/yJlYCigGUxK8/nYtH0djoVZ26Fd4ShRR+sSB8eM6W?=
 =?us-ascii?Q?1N04VJZ/FLxZ4BlvThaOEJfoliCkiuwKt9OWIJTtK89LSH0lQCNZYYFUjrby?=
 =?us-ascii?Q?NYYuRqrmvzH9JM+p4TKKKmCIEyao3cC4Cq8cdoP4ehZ3kBaS31iSPoXD15UT?=
 =?us-ascii?Q?HPO5XsIhqh9nOy5kOEfji1mAT7Ho7onuoSQ3QufKh9nyIMwYGoPHJCEfgJHH?=
 =?us-ascii?Q?t1+FIBX4MNh49u3Bvp+xvqZPJTAK0lJAUNZR04QN3ZARnwIOcaAPpP69VtMM?=
 =?us-ascii?Q?LLvgMDYSTsO5yBWOqVHmd8GXAbwIj8c+3wSvo2AvU820/CVa2RCT6/3PjIbv?=
 =?us-ascii?Q?JNzjChuSBYJ+Bcucudy2v1T29wUpuqsqPizkd92QGzqz7alS14bnGaAYeoXA?=
 =?us-ascii?Q?2T+2B9YPAEj8sJ+GChgsJr5Gs4gzGooGrdr6iQm3FC5DE3JZuFhOiifvlBwT?=
 =?us-ascii?Q?yJlAaiGgHKhgwVafD6xsj0uTfMmBnR/hD81/6JS3v01bMcuxyG15utq9CCfr?=
 =?us-ascii?Q?Wwy3xIvLbAyJ9gnBNhIE4tDYAFNhjdWPCIG/CMUkb+K7IOkbLWAxTR0g5ASW?=
 =?us-ascii?Q?kmO5GILEEwDnJMkyLSMMiwTMUV7hDA9gcXp2lXP7FXu2ZH9rwsmO68aiCYCJ?=
 =?us-ascii?Q?iRfw57+HKwnA0CC8G2G9oiGIW9MthrWwuzNDc5sfb7DG3bbSzkGGo0q1cHuH?=
 =?us-ascii?Q?vqGGZv8v7GJVsJc9TlchSRRhwsgoKmngwO8kOw9P/zEied49+ZlXkzldT/Lp?=
 =?us-ascii?Q?IYW+t9jlss2HBQyqogzhnq7zX52zv6E4ieJN0DEybOVrlCgW76fnr4RuQGF3?=
 =?us-ascii?Q?gz1LV21p8jnNS2CChjU27aCEtcoPBk3s48fOvRy+HBOA14ASvav1pYgX8Mvp?=
 =?us-ascii?Q?f1RLRNxqn35hWXxJxTvWM6nQeQE2MtizefrbP7mvByguRp7JfoTnicNS8J3J?=
 =?us-ascii?Q?fbVeGhP10fh6qTpI5eoOB2aJRSiqc/gDEPalW02MTC1gWzWWCByTb1BxIwUF?=
 =?us-ascii?Q?XLdPmpmH+lMLapcmupy+tEeQthRZ1eQFg4/TnxL7t39uQIAAMnmBgltLZfWx?=
 =?us-ascii?Q?MZjJcunr/FBBFOBV8KLKxcQfQW4iM5qmicMu09Qq?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b247973-2e7c-48d8-96b9-08dda473d889
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 20:59:22.0461
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YZb9hxv9Y36yyCHtn2SJfiQKzUneRLoJCGfe7CAvHESvPazD1u3GKxXE8PVJlcFQLuCs5PhL0tws8s+ZDX4RYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9697

From: Joy Zou <joy.zou@nxp.com>

Remove the duplicated pinctrl_lpi2c3 node.

Signed-off-by: Joy Zou <joy.zou@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
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

