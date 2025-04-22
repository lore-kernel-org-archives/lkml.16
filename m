Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013048.outbound.protection.outlook.com [52.101.67.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21FA1A5B86;
	Tue, 22 Apr 2025 06:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745305047; cv=fail; b=gKMGUiJvk70tg76gX8AbRsOpeJ1yWc2SmFhgeo+COSkFN9xRdjJlNMvc/qGaO0K1kMh8OZkOowY/S/AJ56zIoiL8jqKsr0/qLoZRglTnHhqlSBJX4PNg0n/mCXfm/KGJyg6uaWOtc0IWeLQGbmOT0TaWmJoy/Lm2uFQiSnceoFQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745305047; c=relaxed/simple;
	bh=eGvWPKcVsZNxPUDLRxHQwiWVp75AQpZHnlIp4ZPXdmE=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=G/BUz3Ssf3QTcOoMvIh9U92Q2QC+K17mFD8XuLRltPSsZk+bdj+G42bqa/CA74CMcZ/gWXH/TCvTom4cNcYBrVs6wtpQkyKLOIagR+apRrelXFwPnsC8tRN2NMvVSdL2OsrHO8T1gPqVfLEnHZyHQ7Mt4eW7tE2f/OeNOSgvLVU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=UBknqMQG; arc=fail smtp.client-ip=52.101.67.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="UBknqMQG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d6tGpQyU8+Tp8ckMyRz8vc/6ClSASsM3S5u8FVZHc28jlAIBzfsvPQ90+sJmq6GsDTWVJp8RO+ke+aSTuKethVWUSWB+HuJbLYDQCYM4kRm/hkBMHUWWhoD8ZKu62EMDbjc3j/t+TJbBx2fRFR9n5ujChu7krPbkiKlcpU4QTy5zID8sfnPc31hBOmDFTgoCY9E49aK/brARy0I8lCwj5eY4dcLMY/AQ0XWY7srSQE6UAX69vK1fMbPcTpqfuvxwTWt6HRpooxL6wzHoAMQ/pKymd7Lif17vP5UN9cwRcH8er1RFCqTkZo8VtpRh9XG7OtjVbwHB7ieC4RQ1TNH0+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kMzVUyEr6ZFHVtXGGhM2m5bO0oZPm4IVLjs6zdGTisA=;
 b=boo3lF2Fm6haE0qoL5Qv4VjoRKBKshbvgcsBNGZ2z9EBUOKNOr91ESVdeNGsJqdqD1B8UdrvENfwySx/Gr92aH3Js97WHcTNId2Gh5bArfiTEXg2kdjI5pOtA2nBGLJgezI5DUrPpPN8AABo+2mC7vcJ6jLBDLOb3DkqZhw7Tk2NYmWZXsvdcMEH8EMtnKSrmYxyBx5I1jf/AD0QbTEHZClQg8FhmJWsDWsIomHxw4xH4+mcv1OgrT2ZGKZw9tdMbfh4ROY8xEQ8BuKzN0jTDFd/R0zP9yu8LBHpzQa4/UgZyT2ZWtJer2/jEgrCcjYOyxQg6c3drltJygnwZIYqYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kMzVUyEr6ZFHVtXGGhM2m5bO0oZPm4IVLjs6zdGTisA=;
 b=UBknqMQGsAh9N+rmRJjzhSmDdScZ7nx7eG1hzSKX8sB4lZo+jF7QW72tAEu8JQZlM28wz0Zoy/Av+eUubfacGCgTyRpkfmFesYqLU84kBYX1iFx66iRLlNlvGdQUx7M7yOz/8cuinEJe/XVsFv0ijcc1ucWFjJ788cieLhTr8478cA3rP7R08wQI2MmVygugAYQXPbvla4O+Nlr3Aq+Zn2DkV+Mjkf0Xxv5p6huXt+K97SvHCx6RdksY43yIgARSWMegt1RmVP12/WxABGq2A54JoWu/xTYsgB+pQwHBI9wmyRpXcFBclbG9Jv4fDb0g6VJTWY81Mh4ZlJz+xdZhvA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14) by DB9PR04MB9937.eurprd04.prod.outlook.com
 (2603:10a6:10:4ec::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Tue, 22 Apr
 2025 06:57:22 +0000
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687]) by VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687%7]) with mapi id 15.20.8655.031; Tue, 22 Apr 2025
 06:57:22 +0000
From: carlos.song@nxp.com
To: miquel.raynal@bootlin.com,
	Frank.Li@nxp.com,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	conor.culhane@silvaco.com
Cc: linux-i3c@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH V3 0/3] support different number of clocks for svc i3c controller
Date: Tue, 22 Apr 2025 15:08:50 +0800
Message-Id: <20250422070853.2758573-1-carlos.song@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P192CA0028.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e1::13) To VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI2PR04MB11147:EE_|DB9PR04MB9937:EE_
X-MS-Office365-Filtering-Correlation-Id: e1cd21e6-ec88-42dc-6c43-08dd816aee01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|1800799024|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fKqlCxXslE7NzsUyOJUjbORHp2Fc7ZPHLCnd0VFGDhVsZG4bOY231RLXYeio?=
 =?us-ascii?Q?Es2yeN9wX92SjD7Os0UnMtHPTcSH/qkG0bVHnP4WZ3BfGICd5lmyhb8I2Clm?=
 =?us-ascii?Q?CQZF2kAJIaQmWfikGgtclSh8GIcow3u0QlcuSgASjIDRLLu0mmWuTzP6L/52?=
 =?us-ascii?Q?hhS4kaCTSDpROBTq2FsKsOfyQGHbFL8sTtzoB2qts+xI3MRwNECRZyllC0Lk?=
 =?us-ascii?Q?xZN6CpKGAMc8cfugCTBSr+Cn3hjo0zAz+Su3xc0PzZdMwxBZM56TBDErlkcW?=
 =?us-ascii?Q?hFz7OVrQlfPvMPV9SMb/hWrxrr/JXFlcBZI7KqYN1pxutFR4X/o/tqS60bw6?=
 =?us-ascii?Q?9GFmIry9Im5LLU9IkvcwLbaWhomeQpfDSwJ1r7v4gtJTByxBaprya+yvSFLO?=
 =?us-ascii?Q?mAzrMltZOJlJ5IlbP78THKVDTgJsza1VOGcOMKyjk8O9YEoWRzE8RfHdrX8g?=
 =?us-ascii?Q?DghvkB0x/KXG3my0tAYGF89FMB/Y8ZJWd0J0HSJvrwEhdo2airwF2ku7JYfV?=
 =?us-ascii?Q?gVvOWgyB9JiH7QqJ73rz4bpHAXzW9WaUo0IWYqXACPurFXZTWVeta7iltRJz?=
 =?us-ascii?Q?XG2/6dPbePYo2lKGvvF+5h+vc4/Yh0X49rERpAZJ/XS8HstcN5I1QRYFXPmk?=
 =?us-ascii?Q?zLGhEpSNT4qmPseMQYXInUM3PRyYADT5HR9oauZ4O9n4DSRu6lRNw8q8a3UR?=
 =?us-ascii?Q?duVLD0JWFM2fGB24WojEtHFCHnT912UIeK/xv4z8jnrlGDE4HfKr3Y+SpGa/?=
 =?us-ascii?Q?UjvOvMzddz4a3f4h77xJQe17XRafhRFXhpSPik8d3oJtUPid+FSxsNVXLo1E?=
 =?us-ascii?Q?UIemAvXblftaXx+RbL92UzTvlOr3ZWnVLTr/LzJzh6GKEVkSHhvIttAZYDDj?=
 =?us-ascii?Q?xblwu3TPE+j0vQGybvPFIh+K55A4yusIINQ6+WJULelyHrkpcxeamQxNeakH?=
 =?us-ascii?Q?iZrUiih/jhlhJxtRMCLMfOpmF9vCnMsiXsvqpGw6gKrCy18juR6ilAcMIo3+?=
 =?us-ascii?Q?IUytzKjbWWFK82/KmJagq34S8Q3S0DD7cLhU3L5ctrdkiIGA3UyGCla4lr0U?=
 =?us-ascii?Q?LCvt2rYZNEF31dXnlNLy1LZRPDIVo7crueL9L+yv1BkB63T6hy2lgQM4b8tR?=
 =?us-ascii?Q?J+bNnSqXVlUkIVNVPFQXfVXV1Vc+K/HHWBhf7KKOjQ9lWnFcY27YY5xN8+Ty?=
 =?us-ascii?Q?vrW1OQWDqrS6DORiqC8j4AN+polkPRpGZZemsu3nRHWlvStqxjxrxiyX/SMh?=
 =?us-ascii?Q?8fT2mloyaIClncMNMqOfyHVYnUdUNKydKctBzEffjmJdyUe9f95s2pnwD87A?=
 =?us-ascii?Q?ebxWWXf0PSLMElzjnxM0VXq7DPUlGmdPUJ+KYZJmmdTapRkLQAS9omqLk/Hm?=
 =?us-ascii?Q?sOuIZgBJrEXhG4X/4y5COcmi/vx2FVW8uSFhtXRGbzQFMKvqKlfz6lP9rQcB?=
 =?us-ascii?Q?oxQZ6hN0WpkA1iLAa4WY5P6AJQv6rS9+7/vNha+imF6TXgeHXVrEjnkO1ku7?=
 =?us-ascii?Q?t6QvUuqsoAkvVOA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2PR04MB11147.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(1800799024)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jiK8umZqZY2mYgh5hZM1qCVuJCO7ANS2NPd6oiMDvTG9v0y7IpVLtyUDkAia?=
 =?us-ascii?Q?ahVIXQXSE5rEVbR7jBwuzwR7sBteHdTv+ydOZkJc0tZyODoRfGzDXIU9XsF9?=
 =?us-ascii?Q?KCcaAHNrQHflLD6o29rhJTWN6BHl/HYa6V76Dc5eCcBtgF/xLLRMssAg5lhP?=
 =?us-ascii?Q?js23RgY16ECo3h9zCWZXZPpehpDog1TCzVH6QFZ0W8cVGGExPIvhuf5tcLTI?=
 =?us-ascii?Q?rFS7A5Sz2Enqubt1KRJhH4/j5CpZbakmM9KFmkyPPth6+odc9EZOzyFo7vi1?=
 =?us-ascii?Q?nyF/gc5q1r66OlBMJF18s1Q2bGWjuJYmb04cwPmGOzxISKC/lXRfhF41k4/E?=
 =?us-ascii?Q?vCLi0iCzYPzTykzORLhLiCuSVsqWmx361/LdvA85Ytb9J+lwg0Zt0TSjU2YV?=
 =?us-ascii?Q?p0706YdDpliCMaCpz3e40QNKpevdYoNskmmJIx0Le4G0tpZmc0SITEuoNPwF?=
 =?us-ascii?Q?bPW7jKbg6qRVOy0PSGDlBsLfIjfbZ5G4qIvkiZliOWFBVxZpS+7tt9XCk8j6?=
 =?us-ascii?Q?jGajr7o0aALd6uoEq0gwdjWcUbg5XcrmDL2OBzVnoMUXhQPYenurN24+Izzf?=
 =?us-ascii?Q?PWaesor5Ou78HO5fMjUFM/JcowKrl26bi1MVRlwD0KJcpczxN8fo4YVEmJ2n?=
 =?us-ascii?Q?WSzvXdSRcW80q8ml4BhisaAw6+Vy63P0up+sAwxbCbYW3P+mK4eP56NAUXLL?=
 =?us-ascii?Q?XZPKfyumbQx1uS362nuvztaSfM89elMNeSgEPhhecuHcaQMfeihrPaHK1/O7?=
 =?us-ascii?Q?cOHY+xexpnE7K5211yewubIc4igok2U9+sxIE+4JrV+vumETWSnf2+T3V5vg?=
 =?us-ascii?Q?6NwDhKr/QlrwLZVqIFC3i5u5HwLGpVct4/5OigZBYv8GBFopYqv/AkHADk71?=
 =?us-ascii?Q?/PPtRCiet87ZaOjNg51sFyhJB95mII/1SqpO2A6pS6UDvH5PuPEHOgTqre+m?=
 =?us-ascii?Q?ihvMqF9YxHzeU4JyVB02R95Vs+3xva0+gAdZ6uKG0EQNfpjIH101pFjxrpNT?=
 =?us-ascii?Q?wzoQkyFo/HYxNfI07UP578NeaZ0VP07hhsphSnRnM+mwa/uSn6ULo4pe8w1f?=
 =?us-ascii?Q?m8GDDXDtzaXj6WKLIaOKfg8QV/tUM2aX1ArUgTa7jBNa2Vo5uv8/6UoFfXXj?=
 =?us-ascii?Q?HmTvnVvSQvdC2npujN6dT6pbXjTOgWgSS+Tccxx8cVu8YRnD1O7/UWFhqn3i?=
 =?us-ascii?Q?7+IgT4AbuYVT2T65yetRuZwRud7j/9BPs227va+GqDgTel6jxG4QVtYD/Z7Q?=
 =?us-ascii?Q?QpYFqnGBZiTxFdfHnDMSn/WjD3I4bg907vulXceis8Nmb64jd96Z3jRNyiW8?=
 =?us-ascii?Q?OhNuR4ulO4/uvs55eLuIuTxfFsc3/pRzTjV+CVWescpXRrZ6K7xJjJpax7Gc?=
 =?us-ascii?Q?OEBAWddOvJwDLy1Yjr+ZauSKyD0UapR07JTfsD9rhSfAwFuW6Ctts/EPbMvq?=
 =?us-ascii?Q?MWU4p+UIR8tTi1fF1iB6lWxRacDDWZ3V8AAO7AjQq5jmLAVH7qVVjzaSLVMT?=
 =?us-ascii?Q?l0DNKQXMSzjDhLQsEGAXT40JmOp6c0Mod3sx7B3Q6NmRQW87yAsVoN2RW8U9?=
 =?us-ascii?Q?X+h+g+mw9F8I4YbYax10KxkEa8E25E9azFPxxked?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1cd21e6-ec88-42dc-6c43-08dd816aee01
X-MS-Exchange-CrossTenant-AuthSource: VI2PR04MB11147.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 06:57:22.0698
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: szZcc5xUc85WxMPPAR+YglWOjqGxP/2nMRVeZjQCW8lCa22hjL39ed85SaXhTsEY5ARxbY8LJ6xyD1P1J2zcPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9937

From: Carlos Song <carlos.song@nxp.com>

I.MX94 and I.MX95 I3C only need two clocks and legacy I3C needs three
clocks. So add restrictions for clock and clock-names properties for
different Socs. In driver, use the clk_bulk API to handle clocks to
support different numbers of clocks more easily. Make the code cleaner
and more flexible.

---
Change for V3:
- Remove unrelated fix in imx95.dtsi.
Change for V2:
- Fix bot found errors running 'make dt_binding_check'
- Fix warning from bot test. Use -EINVA instead of uninitialized ret in
  dev_err_probe
- Use master->fclk = master->clks[i].clk instead of devm_clk_get
  (dev, "fast_clk");

Carlos Song (3):
  dt-bindings: i3c: silvaco,i3c-master: add i.MX94 and i.MX95 I3C
  i3c: master: svc: switch to bulk clk API for flexible clock support
  arm64: dts: imx95: correct i3c node in imx95

 .../bindings/i3c/silvaco,i3c-master.yaml      | 45 +++++++++--
 arch/arm64/boot/dts/freescale/imx95.dtsi      | 10 +--
 drivers/i3c/master/svc-i3c-master.c           | 76 +++++++------------
 3 files changed, 69 insertions(+), 62 deletions(-)

-- 
2.34.1

