Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011031.outbound.protection.outlook.com [52.101.65.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECCF41EB3E;
	Wed, 28 May 2025 02:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748397639; cv=fail; b=Xbzh3bOV0q2Jf4IxKTCa77Gc4hn+AygBdsM1dEQggUvak9+VHfTHlhedaVv1iJM6a6727ZXQBi/pr0FGgvBOrqkDYReWU2BeJvq7AVxZfqFEgq1mazFHe/vzwgYk32s46bQU9CbRoiHSDV44h5MP0/EB0DUn8cuCvXs+wB6+NgA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748397639; c=relaxed/simple;
	bh=KnMzLIhxzPuvcWdt+B6ngeE/CDY78UmZiluKKb1XRIY=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=aTLrDDYFXfZSB4PWE9q5BwOHM0nJ+NfWeYP8/Y0m7k3DLINviVFPtvxLv3HBSWuB606BSoa9ojQHacyYFpJ5dS78TizFoX9Bui2nE3CiTnJ+kBejSOSpdgIXZQ2DHHRGT6G+95ehZ8kAPmRM5S0GSQ5fyiadOAVvK+KyiNZSLJI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Uj62Jkhs; arc=fail smtp.client-ip=52.101.65.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Uj62Jkhs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qFGjzgJe3Q7AiZAR4T49tI9fLKvXHQvk7LJARKb5/dteccEcPc2KYmgW/tBOtJPj3/51w++DY+/3Glzfe1R5e6r6DdDshtzxipaSKoemcj0EZ2ZJpo4co1Eqzz7wTGofGUcGCHUJP+bIz+oF06J9A5rzIHHkYFq0QJ0ZC8Qha4OrkzPcA1lLiQoh+K/p/IVE4HGBF+aAMOdKPywFoX1NZ/82i/gjZhEzF1zWJzN5RRfbT41pHzhOBtJFLEuk7p6EK/f7jcaLJUDC7kPbYXtd9GP/eVsxFTTAZEbFlXMJLBB+vbphSRntnpxDbnA4741yRcaDTVXIVK7Uvtuk+V0+KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qnewhzu+QXT5K5r55hToLn0xglWP7GBnPhPFNsIl3Wk=;
 b=ktTF5wTsH8CjpWU7RsmuV1sKZJJ4kp3rs+KWB+J2NLUUpe57dgc+FA+3VtDQpIQaIJJiUQ+I9yZURySshPoduqv6iVILBBOLwDKcGpe+Jmxl6MGR2Gdp41Vz+xCQdyYrLirCzajtQiMHO1nkf/icT8e04lO5+fEEdbjVrQXWMkoeATiEPTIZZxF+Lamw8+vdPA4rFUl1riVla32bwXDVtjL+7JRWJmVcpgUg6OBc/kJW9t7H3eTizGEWMnfxp1YwIha9XQo3TP1VEJyi9oaGPBp3E5LCNWyFC6pGdxNLh0/78fhf4oFb9Q64Lw505wL2IW8uj23urbmHihPVXTlJ2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qnewhzu+QXT5K5r55hToLn0xglWP7GBnPhPFNsIl3Wk=;
 b=Uj62JkhsJuyiCSLyX+Q+vqRTm2SGKCuHWx49QY7THDOway7SXZf4dj4bC4dpqCnvHaEufsFIBbI88QjTUur2KzdgJeanHPOHFQrMRuo3MwookZbMCustN3ReGfQZzu5fySW3xIlO2DKzogunSNsQeleviySg+1HwPKH88x6HFmH+MKziuO/wdeYBvmwYK3f9YbsuHa9FM7+W9+5sA90qFwZlIn4PdAoFTD0vcpgSNGqPl4/KXtjGvMGV2ZbbxC7548sKtqyX+6JS4CXf6tRKww4+GQg3CCYcnAdV1rqyeRiuIkiuD6ttcBa5BZUThwuZluwwZS8LzYoPfqZ/v0dxxw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by PA4PR04MB9293.eurprd04.prod.outlook.com (2603:10a6:102:2a4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Wed, 28 May
 2025 02:00:34 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%4]) with mapi id 15.20.8769.022; Wed, 28 May 2025
 02:00:34 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com,
	carlos.song@nxp.com
Subject: [PATCH v2 0/6] arm64: dts: imx943: Add sound card support
Date: Wed, 28 May 2025 09:58:31 +0800
Message-Id: <20250528015837.488376-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0043.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::12) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|PA4PR04MB9293:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d7c5d4d-7f22-4eac-14c8-08dd9d8b6ec3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9o7TLpV+Q5NQO+XvgldiyNoealINgc5tBB6OqwDuI9K3lKRqkRUnaTbB7bp0?=
 =?us-ascii?Q?lw5aP73KdpR9WUFonXJ7qtNeBi3RuHgB7/210/MqBtUjOOoxK4fTMhkKS2SX?=
 =?us-ascii?Q?AIKq+AS+ovAKcOYME7QI7KpezQ+LK2WP4G//vudJW0zfGspHE76MMJSqS73t?=
 =?us-ascii?Q?XwSckj7F+BLEdKffh61fAf+Vul8xt8DxToNOiWPlU4aFfOU2PWRUNc7jg48J?=
 =?us-ascii?Q?TRPzsqZnd8UB/5meneGvo2Zy1nC30dryCn96U9ETTN2Expx9zG5mXqX4AKUM?=
 =?us-ascii?Q?c0y8+JZmrqM9Fq9Kb9lINheQqyY7z20pqkL2LRMeyY24o0uFUi9W+0miuMfe?=
 =?us-ascii?Q?7vdD2ZeLqtLWYCZddzmkMRhW5PQR+Ava/FyNttNP7NUBez145bcdfvuLDL9+?=
 =?us-ascii?Q?GuGqQkYUWkdKeDnVMinyUCYtpN5J3GyH8wGGZaPYVGvcTMm4gH3BX6C0fMnL?=
 =?us-ascii?Q?G3y2vaSkBwmU5hdJXV600JLnZ4n19Br1y1Jj1pAbIF50O0/Cza4zH5qu8wGa?=
 =?us-ascii?Q?BGe8Ap0VYCcWGfDSplaX0PYgbyzxsSYeoSBCdm6NKoviXE38YLB9YCddkKhM?=
 =?us-ascii?Q?x5v4NJnTkvA03Z5nzhr9rH3TKbeFGoN7NSrUyIiXYIPDj6irut8E/OpG/XcY?=
 =?us-ascii?Q?BmZ7cewdSh1BdKO2i32q8F8szTnGpo4Xl/9szzOR169qDXntsUIncpsHeyN+?=
 =?us-ascii?Q?MnuGi/fRgeVwxfZxOgdS43iStnXi6ojn2UNc5GHf9RdnsGczkeD/TybBLtcf?=
 =?us-ascii?Q?pB1+Hn2fuX4Txwb5IoeOoqBlq9DG4fEqN6rIGhBqBvOhiBrjUDk+ajti3zq6?=
 =?us-ascii?Q?JUhgEZGOJPwbcF1E1M9p3v5dNqZcUUNE0K4JYncr+fFbRF4FzGsdydP3bCMs?=
 =?us-ascii?Q?Nzc6Rmq0GFdQ64RwjQHoyHkM1cp68ErkI7XsxZl4CJwGBCMaNilCtdGhlrLu?=
 =?us-ascii?Q?JYKEpkVdwr4eZ1K0SJVf+AuQ+g571KbyqA6o1RT2dLQUOEdZhFrFtNzG0QkM?=
 =?us-ascii?Q?9AG8Mw6StYYWZ7K3l6TUCADjGhbP4EqcxVGcOMSvNcJYnQ5lfunIVC6XjX5T?=
 =?us-ascii?Q?zNMTZYQg5N7+cZXmetdS6mPSQwVcYH2l0DYkXeuEecDl3y6/AjoAd2Ice33z?=
 =?us-ascii?Q?u54q3v9b4VxTEtvgEuBiZjjpvRRythTVgTAhE8kFZAAxjU24rvfiwdltnam2?=
 =?us-ascii?Q?An2qO3X7VhIsyous4qx5AZq66YzYJj++sCTM8w6xu70L6MNvaZYb4yrxboam?=
 =?us-ascii?Q?t/nt+O1pomTdfB271uUhyEnFa2E8meRAetGvOA3AfqsOrW9hYjNAuVJDEnaY?=
 =?us-ascii?Q?YZqHamZdIxn7PX8qAjMxbkcZ1+aE+ungFjQJT+tG5xkhni6DZhOOdahcv19j?=
 =?us-ascii?Q?obY7vxfsci2+xelFZj9WuUr3qIyzerwqT/3E8k6UtfOcClNbTKHQk7nSvgB+?=
 =?us-ascii?Q?m8shXEhWQl1IOaegh+id4Q+OJGw6FoiqIMG+ribG3sqa5t3jzHT06MwGycgB?=
 =?us-ascii?Q?U63Elos7p17N9wc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BqI7Egr8sqYOPGN3n6neYwDp0eM5UrPmhA1f+X/vfM6nWgCN7UGuvyETLWPq?=
 =?us-ascii?Q?0XEuSPRLeAwsLHqE1yW5urAa45ESJOpXugHKTyB1fdoRBWjgNXmN0ZOXX7zs?=
 =?us-ascii?Q?k8AdHte1g6BMS+oPKM2byY84gTilLp8/dXk6+ROAnlgu5ROk2vTIUY7sLnwm?=
 =?us-ascii?Q?+dUJRxa86/+/1ZXgoi4WghRDYvduUrLy8XqUBWkWM3peyB0vqHuEMw0pF0+d?=
 =?us-ascii?Q?TPGiRODakKiq8MXbAXK4ZG0zCxWjiXK020r+OaV649cKFjj8u9Hgfd/gCfJT?=
 =?us-ascii?Q?AeTVgyHzNbcV7XKcNEE2UncLWi8ApNaLwG3sSOGsoXxq6mIsJHLxKN7YkQ3b?=
 =?us-ascii?Q?M1RlY/T/JQ87CRkU9Y1WYSIQLesztE/D7IlfaqSsoGJUyFhkUb8JGh+EhM5F?=
 =?us-ascii?Q?xM7yPAwh177bxVj2c4r8CwRulcHIXorMrzsniNA0LCHvS4CS3O4ee/c4GNeh?=
 =?us-ascii?Q?XIRGYUKXJWLFEzpbjx7pl9Dg2j57b0Mk+Pws3qizWyvfDG0Pbh86n8nvmqfa?=
 =?us-ascii?Q?tz3gKP8QWqpUv13XD+/1VzIZEONHPNV97hdbulz7E0UHqWh20vomzR41hjBI?=
 =?us-ascii?Q?RXiFlCg18V4SO5XDr1g3mYIl0zEx6qTjZvKjxo+R7eE3ijwGvSMLtFWsVDM/?=
 =?us-ascii?Q?yWjoxYHcgFc7GBRwOy0oFXrpAXb/9g9+NofwVfcQ5Cdho3IBkWUR0yvMFoFd?=
 =?us-ascii?Q?vRSxzelT05tmk+R+QMaZcq+BgkhLLVSltYJURnn6bmVsfB5VnxTvE2SDN04l?=
 =?us-ascii?Q?eVC88/xKV8aPVerWTgaYsXrWOKQDrAWpDkYKCxPzxkU1zhlsdW8/3MH2KuT4?=
 =?us-ascii?Q?fIoq9S3hDmCYy8w+iOxUGkcQjDo+uSuLHALRET7SuiPSoAwjgdijGss9a8gO?=
 =?us-ascii?Q?5+qslW0bFmgrcqML+cl3pMcOpR0IF1J2N3Da+FvBCrmViELWOGXQZXWnk2++?=
 =?us-ascii?Q?SOzFrFsQ1UE26eBhKuGhkCueWHvEOrsjNmlTjmBZcSjx7KxwWQ7sBnsJI7eb?=
 =?us-ascii?Q?f/QaYIEv+azRlxdIoNJibwBNp0ce5I/jLo4A0tgk+ol7sWhNOJq/j8l0HyyH?=
 =?us-ascii?Q?iGacaGsBgIw6SgHGB/WCfXlGhfJSFqN359zGEWqoLr1hKH4ZM0mmEwRhfqpZ?=
 =?us-ascii?Q?JgAYG4v0wJG9CXc0LlGORnW9hcpybrehqsrwYHm8Abcqygm4o/0b1xoMCSPD?=
 =?us-ascii?Q?Bc3xBqsHc3ndblGq+YoUjs5KWEc80adOI3BlV6gSuXKre+HjCWWJPvB2qbTg?=
 =?us-ascii?Q?rPnNulJ5Pfp1naLi90OjuP4V6EF48DJx1QJO5Ix1Wps4qiaP6sUc8s527zuv?=
 =?us-ascii?Q?GrR2h1xOrncI3ASxrH3R3/3CHwzzK8Vz9q5X+s8dc7FL9K5ZsbAt4jDMQ90W?=
 =?us-ascii?Q?3eGxnx+d8d2jCQyKL63Pro1w0PFNuFkKhT/od8vr+OTC21uyBiP24vTZXrsZ?=
 =?us-ascii?Q?d5Ac2fUCgNh+6F7A1Uodg+V2Hd4ItZZJbxjKZueTiIBH0WANp9Em/+bvu0wm?=
 =?us-ascii?Q?3hys6slgUA0BNtzEtmuU8y3XUu4Rc6ojpWJW0zRWCmQ7vjmaviLC8zJCP/uU?=
 =?us-ascii?Q?6I1WdwtY0OIMSLNJ5YDmS3Z3w8S2Z3T36hJw74sw?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d7c5d4d-7f22-4eac-14c8-08dd9d8b6ec3
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 02:00:34.5540
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GiAlW+/EDc9cOdern3I0i98gOgH5N109yZoUFFf4ZqqaTrHZgYTgNGS5ER3+b5gjpRTlU8Sj3Rh3BbgPCiA2bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9293

Add sound card and related i2c device support
- micfil
- bt-sco
- wm8962

changes in v2:
- use (FSL_EDMA_MULTI_FIFO | FSL_EDMA_RX)

Carlos Song (2):
  arm64: dts: imx943-evk: add lpi2c support
  arm64: dts: imx943-evk: add i2c io expander support

Shengjiu Wang (4):
  arm64: dts: imx94: Add micfil and mqs device nodes
  arm64: dts: imx943-evk: add sound-wm8962 support
  arm64: dts: imx943-evk: add bt-sco sound card support
  arm64: dts: imx943-evk: Add PDM microphone sound card support

 arch/arm64/boot/dts/freescale/imx94.dtsi     |  30 ++
 arch/arm64/boot/dts/freescale/imx943-evk.dts | 432 +++++++++++++++++++
 2 files changed, 462 insertions(+)

-- 
2.34.1

