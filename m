Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012028.outbound.protection.outlook.com [52.101.66.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E24C21B8F2;
	Thu, 15 May 2025 15:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747324617; cv=fail; b=jY/cw+Y9YFab9pbKJGz7dm0pLe9PdgsoHeokoWiZYml15R2Kj2/Ytekmeecp5mPisLYpW1KHe4nN9BLBSMPzCRvy0f3TcmZaz33sNA5S9PDVeYpRf99hynbwxRgRq1bnRDcfV4DSp/g5vwsjqj7FV4sbtNZap68JhRc3f+bNJLU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747324617; c=relaxed/simple;
	bh=DdYJRsyevIJcyJWLgYa/mWWMX2eEdTVtvGAALs0vu/4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ctgSDO3dTSRa/k264wzHpt7UZkWdPKLgqk/w0f/KEiEybJh2A2sYKoecfZl2209+/Vl5rudkyUqZarQCui+M7aKSfq4iCsLgUv6/zozjUMvnADGPWvlqo2TKbE48f6HOKdYhYtaHCLUI/qf5y5G09yxfPkOHpHZAv9NpxU83WSg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=lWWgrIvo; arc=fail smtp.client-ip=52.101.66.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="lWWgrIvo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d+LSwVD/a1NDuqiJc+mxYLs/qJucg3H/3tmahFWsa7+Y5uzwfJNPWlO2UnXovAkniUY2slgNi4rh9gqvPcZrmr1V6NwwjlLkP8/7JJj1jgP2MpNl+z/TRk7reUPwWP4N+hqJlhqRILaf+smdLxEC4hn51RGmiurgo33McOKXvlYGjXMJkBvRBTudTgbYTFoOaUzCC6NKjOUvm337agE0yCEwswIG3cG9lunOGazAnKBBBZUCkwvTmydzX5zW8DpI6m1EXMA9eYyR3OL8zKoG5aNNHwZgdMopFcCN8U5TVk2BrV1Oo0Wbuftdd+b9bXhuasRLxwh4qWYvd1ieykJvmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NAO+xg9gt1+LTDYhyM/kQaFb6X1CJyu+3BIkEk9iaLM=;
 b=YQDM+oiDIbfZZQ7bBGfVG6m+V5Oei2XhTNsOPvHbsn0jTIVTAuuaKLReK6BFU1GTx/VKR8HIb0seUTRKq0aRhPqBvDeuBbNKR/jx06KXsVqMBeEDEa+iAfwJEN0Iju2J1Oqx+SBNeXfJDN2DDuwNLD3ezA3fU5MsfZqIIpUwKvmX3874yevpbT9ZlloRjIITvg0AFX6eQqrxtO0dhlvdbZcXfI+2FmQAYExmuoh98Nd2f+pHT1Q+ZWLfG1IjoeFN/f7ffirektmSZCD3DSqvkX8UUV4Cvgne2IOQ9OYc0/nv2bhLfOa1IUqssXMJsk+hW9WRZsjNTmWDN94GTL33PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NAO+xg9gt1+LTDYhyM/kQaFb6X1CJyu+3BIkEk9iaLM=;
 b=lWWgrIvoPNYn71J+IAWsZfjMOBlMRjqAAT4g1Z0KQXRYsYfjq9OiXNCrCapA4LWYwcr6zRl6IA6XuxpMJ0sJBuDVkmPr/gmWJ+hRhmdam1pXAKzX4yqdDL3j6O612H7eBfDO/Rij5IBi2VyXjKdAAx+mw9ccjoVFejqM392fROFvDOBPt6IuAzvXfZpxFVaxfmScuL5xBNKSj1dS2B2PI40B1FfXkcQty3KV3G4SohvAxSt3w8MTFDreLP/s7JgMgzN1fmhLKKW7mvIzbGcm591U236LtkiXnVpJXGUgzeiLa0mRKwa//D7DJtUqAxrZ4iziIEbT8FM55dJY2QbieA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by GV1PR04MB10197.eurprd04.prod.outlook.com (2603:10a6:150:1a4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Thu, 15 May
 2025 15:56:50 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e%3]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 15:56:50 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	vladimir.oltean@nxp.com
Cc: Ioana Ciornei <ioana.ciornei@nxp.com>
Subject: [PATCH v3 2/6] mfd: simple-mfd-i2c: add compatible string for Layerscape QIXIS CPLD
Date: Thu, 15 May 2025 18:56:24 +0300
Message-Id: <20250515155628.233007-3-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250515155628.233007-1-ioana.ciornei@nxp.com>
References: <20250515155628.233007-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM4PR05CA0026.eurprd05.prod.outlook.com (2603:10a6:205::39)
 To AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|GV1PR04MB10197:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e91ffab-f052-4473-0f38-08dd93c91a98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Rt+v+AzTKRPWrllWdhwpAdhbLHjt6aH41Jidiu0orE15iGWZxM8wkPbjgxLX?=
 =?us-ascii?Q?7vkoPI04tUrZ9wH0adCb0LPU3IT4IBDiLciNn0PbtiAfsTseEAp3p41b4IBG?=
 =?us-ascii?Q?D18EH0xh7DY1iJiC6VKS8n5P9Z5WW9GIHMuBQ09YSl0YwbBrAVI82dr23dxE?=
 =?us-ascii?Q?9pnbvOCamY0D2CXK/Hok/S9EOc0UyKz8pLar3xWuhiMM8FsCMutdPjEuoQVV?=
 =?us-ascii?Q?Sf0gxIAYozojz2aSreExqc1Vp0uJ6PCYZXmyYwFJlnNt7Cj3yq3Ijfd1a4Jk?=
 =?us-ascii?Q?aWRGYFzuJhclJ2I9DSDKQ04EzpzgmvBb0WI+0GqUV2/BZXjFniR/rdMSnpJF?=
 =?us-ascii?Q?XnR05NmnlFsM4UPh863zlz2tudQwc6/n1xW5gFnW6YS+6qefBZrw8eBtmGgs?=
 =?us-ascii?Q?baZgfutF4cDKM9oTn8qTf66iXcPKyw1FsWdr566H8neRT1BOuRq/X2kGUVRu?=
 =?us-ascii?Q?XzrnH9GhgzpRqzwjZXqgjrKQBpdW2Xfq3jV3SvO6oIFpXA0ODj0OAS1/zv3N?=
 =?us-ascii?Q?2svn3MwTEiL6qBp5BYNPZiJMm/YlRcA68BX7BEvNKMXbUwTywm3KGIL1roKv?=
 =?us-ascii?Q?K6fQ2bkn6Hgn50yKFCgdOQxR66OHnYQrvQNULWkmcYpGu1Nx0Ty5/SPc0gzG?=
 =?us-ascii?Q?ptoSs4/aVka2l34iouyEzGzAL09VbqPo3WxvMA6whb7+GUIL0itEw8tTfoKR?=
 =?us-ascii?Q?6mXia0iwfuOks6VyIXzqTRYCHqzPHTboENpNmc9hMeiobpP1z9nTvOi2Rv9s?=
 =?us-ascii?Q?VSFe4RvTCAZOTj7rQJHSGiKRhVQdbS59VOOAZVz9sexXpJenyfLS5D8EA//E?=
 =?us-ascii?Q?BwDZ47Wx0a3ghXfWUkHGy/GD0INcZUwsjmTBRPAarX6VvQv51c/C+ybk1tWV?=
 =?us-ascii?Q?toZCCkE3433nc0AEp2jgpWnESb6u/2AHof0fGr9MLeYwGKvv628JAwwbxRJu?=
 =?us-ascii?Q?ZBNE+1Smwa3yGTiUWJPtQ4DLn1g195CpwC+t8aZVG9J2OXHzM5vNsTvVdqE5?=
 =?us-ascii?Q?70yJNllc/0QGnkRqMRvhRDGhn8EWsstWyRpAH0S7sNdEuLfsj+vfBSXVSSKf?=
 =?us-ascii?Q?pFI+PHohxiXeYkvVHYwWnHnYTh3EowS9u0l6iCjuc6GbihFQoA+v80QeMy7N?=
 =?us-ascii?Q?mbhH3eCMt6+y78lMP76LMRc+9Onkc1tDvvZYieJxanr9dqtEiISSDnkUlrNF?=
 =?us-ascii?Q?vR/MUYGzZ6oYoe3/1/4jaRWXvaz2rOxPIIb3gT405v4SPlu9sCBeIjfbjY+8?=
 =?us-ascii?Q?UFVCpz3Rg/7xTwF9+6Ct4SrFS+VnYvOm41Rj2SDOi9zLr5VMayPZUVp46Gu8?=
 =?us-ascii?Q?/usSbvt+oRhZHRz+SJ//3wyb84798J1VPJIIm/AE76b9EBaX/yeXizVqFsZQ?=
 =?us-ascii?Q?UwuNT2CvUcQlThKHEDvI14JQPxDjrl6rOWGqeCARkv9WPcKO+yjoYeponTS6?=
 =?us-ascii?Q?G0ynBpiOT2Y=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?c2FcANLv1almZU1fB2xtGXLW4d8R/tr2IG8sWuNHfeDDATgi00QXyjHUt+fW?=
 =?us-ascii?Q?mooiKU3JjTjVGH7eMA7ww8rxPr+2vcXVt6Kp4TLLCeO2sVX3JdNk6tBpjKKX?=
 =?us-ascii?Q?Pb95iXc9bl8JaBoJwAKBVsJpNJ1wWYJiYcDQtha8ZTmafgQH/TG8z5IJEbJ+?=
 =?us-ascii?Q?1v/zz9sBF3Y+2Yd0ZW7OpWHF63PhnjFyIpz3Ze0CSdGfAGmDdvVtpAYmyxku?=
 =?us-ascii?Q?6HHsaA1WpweacyUqegQART/g9tf1w4TuO2qGiD8f8WriuAXVky5eDSKD9jOE?=
 =?us-ascii?Q?B30QCapKyx8u+JLHHBZkUet81mQGKGrMjR6UMZPEhw7JHHP0xSb2X/1w9o73?=
 =?us-ascii?Q?Fv/9ODl2KFUEYcUVw6zs1CWe5hfS8DzzvtocRpP7oD/t0TqTFY7EZnL96QAs?=
 =?us-ascii?Q?NLKZ8OEZ4DheIZ2DVidWtnQ9FoHBUTdlfjoLuJ61XQidJRWNpFZDUSJneFO4?=
 =?us-ascii?Q?RUy7zXbr0uLn47f2CCOOR5zdGXPyj3iyz61bRz8sFFUldfHQlAbgGonZ2u89?=
 =?us-ascii?Q?+Ka3/Yyv/4JmhMF1Vb6wE/eygUWSykFbkakHbDfGEnwI9lUghEa41ud8djR1?=
 =?us-ascii?Q?Q9X9WgTeZW2kCSTIvzoQt+UJOTxstVQvZ1pqZkaGXTKG0eg4sZk52IPzcMZ7?=
 =?us-ascii?Q?48TEqqQHifW/uHQMbkSLK3r4jBPucnmPseC4B7TopgTE1seBsrzHoUB0Skls?=
 =?us-ascii?Q?O9u7KNViAAj9x3ES/KqNBpGDEcN2uVB5vjUnm+vteISzjZKa5I+f3bcIthkk?=
 =?us-ascii?Q?Ifi1HyRYkMgMWPgajWGWKn9rClzj4pmEVxO8TH6CtHrwIOI6Pjx9UP9iROMq?=
 =?us-ascii?Q?zdWsU6cQkd8PVjcuEqAutpzOV4FrrnDOVBO90pluPX42kkcxZif2ejGNvkBp?=
 =?us-ascii?Q?AC4b0+NwmRyAL7Yw92LSFIo9Bj+0Ir234e+FjVVQKPs61h0kCac704B3M5NT?=
 =?us-ascii?Q?8cK81ft0IK30NZa7IsEpaOBnWHtwIYtSu3FEI6Jl4MH2cJ8kjkww0Zb32MxR?=
 =?us-ascii?Q?l5ndca10smVPpsBesD3Tv+zK8Ctsx8sauSgMrGo4w2M2ESVORliuSMum8F12?=
 =?us-ascii?Q?x3z+quQaQW2a/B/FdLyn3W9T6WhT+rARMdQ7u4O9hl1TDHJVnM2iaOXaj4Dz?=
 =?us-ascii?Q?6qhIPmz04kmf4andIaY8prR7+gwz8ZrXaquTzvzqY0Co9L9XV82KE87J26Z8?=
 =?us-ascii?Q?j3d9nd4QYHXWt1Ceiay+UXIMV4RWLaWYrwnpZs3O9phFHUCh0zjPQukRauO+?=
 =?us-ascii?Q?v8BZASvo59KMkN1C5EF5GKFHTZ/IEQ72FlrRG8AgWUJCB9W8hRPj63oe2Uio?=
 =?us-ascii?Q?EG0WS0h4F2SsSDhkJY7Yh/dlgJeteWR4XuD0Y9aZmXA4ouTyDXJLrUJMdkUo?=
 =?us-ascii?Q?5b4ow2zkYx4TxKifHVae9wYCdoyBv4E7G+Fxj5GRgRYIDUg7NgOHdRUgyEx9?=
 =?us-ascii?Q?xc48bykqOtRRMbilKJoE18JS6iTh3ecy3ZayrBSSNyloUUzTPhGHhIrwaD5y?=
 =?us-ascii?Q?xLAblIEdWG3C53MbCFtVyKFKLb7fNm8bJvaOxYnUNiF8wKaxZySyCgAnupdc?=
 =?us-ascii?Q?jEzO1rbvVa/79J9chuEY2RTYNru02N9rphcquhf3?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e91ffab-f052-4473-0f38-08dd93c91a98
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 15:56:50.1274
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D3NgUzf7DM73FXNemfZc0zIGhUpNVPcoiqHVUXeIneMatKVfxaRxeIuuu8pRds93C4nmZY4zzMYiiEHZW8jFVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10197

The QIXIS CPLD found on Layerscape boards such as LX2160AQDS, LS1028AQDS
etc deals with power-on-reset timing, muxing etc. Use the simple-mfd-i2c
as its core driver by adding an individual compatible string for each
board. By using the simple-mfd-i2c driver any child device will have
access to the i2c regmap created by it.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
Changes in v3:
- none
Changes in v2:
- use the new compatible strings

 drivers/mfd/simple-mfd-i2c.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
index 22159913bea0..2ae47282e658 100644
--- a/drivers/mfd/simple-mfd-i2c.c
+++ b/drivers/mfd/simple-mfd-i2c.c
@@ -99,6 +99,9 @@ static const struct of_device_id simple_mfd_i2c_of_match[] = {
 	{ .compatible = "maxim,max5970", .data = &maxim_max5970},
 	{ .compatible = "maxim,max5978", .data = &maxim_max5970},
 	{ .compatible = "maxim,max77705-battery", .data = &maxim_mon_max77705},
+	{ .compatible = "fsl,lx2160a-qds-qixis-cpld" },
+	{ .compatible = "fsl,lx2162a-qds-qixis-cpld" },
+	{ .compatible = "fsl,ls1028a-qds-qixis-cpld" },
 	{}
 };
 MODULE_DEVICE_TABLE(of, simple_mfd_i2c_of_match);
-- 
2.25.1

