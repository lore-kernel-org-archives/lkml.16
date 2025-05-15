Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2060.outbound.protection.outlook.com [40.107.249.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA6D191;
	Thu, 15 May 2025 05:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747286470; cv=fail; b=FuAi5EIyLh3MEBWTZ8U2edRZT/E3wZRfMA2Lgsgq20kDLU8JtcQYyp5jm3vUITXpNRhuFC+0vQayUm6oVWMK33DLin+qTMvD0fFUskKnHhQ+LQmrhaZ2MywvEA4vODkFi+GPadEOCpVfq2n55ACYvCVKohoNcmEsDhxcr0fyX9o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747286470; c=relaxed/simple;
	bh=AazVoDDtQiQUsGZGZUkzpalnlkTggSq1AL4iqdI9w5A=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=tNP4CIh8IGCFvs945fc8zm3E5wKmZeEN7HdVHnNbVEsa3D7qWXnDRD8tQpckANrc4iTx3V0+JuO1hZEz4YOFxvxuU0jBnKzxmFt8fRFQyfQ05TIHnNC08S0kc/VCRFaEVI/5XqXG/qtAtjLb4UPk570u64peL9XZUnUpKjKRtSM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=SkyYSq2D; arc=fail smtp.client-ip=40.107.249.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="SkyYSq2D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H5FQoQWJ4K4vEGzQMQEGYsy7c/4ORwYtgfr/wQvi+RH4uIiVP9dsNQR9KBcuKoV5U4GYZGB2vGLW6ylbI3TSQNq20wANMSTE8mR2GSH3IfZZLNuN5Hr9g6B7Ixs6ZPtnGum4KSjahy70kXiM1ePwWEfWLx+2ONHY/QNCWrNeuOedEVqqZMxQedcE7d0CsCT8rnvEIg7CZx9aNZLycpYOF9+Ygc+oYeAOYdehf0S6qvmy2tl/TbOUiKAb/d2t7G9gehgowjMYcstOj/avL4TtXIyn5qdH6PFq4TBaN7/lOOQc3guu83fglKZLYaS1MKzouQ033t723EM7P0s5lfMesg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UWIYowIf3xsj4ByiwvJpeqB69YjCsMK357Txuwo2iu8=;
 b=s4RxPBVq3kClxBVNjMBHC1Z59an+3zN7eRygzCEb6byARW4I9+BNUqv4p9+beb1TyEG+qRZMJaWuYnbaCioUkmzotHy44frzDT4CxuM9+IQrJ3YL7gPgXfIUyuuq6G3EKCC5CEuq3NGJbHmgp0v31jgG1luARPl2S8yJUT2ptBX9KHa+ANXeAW3aU2rZYFk6FQjdJo++W/rGEqf/WyxutXo4sv4TOKmVqo8fkpeEUf+CD60BlUZMN/3uEJSme+KfExnRWd6OQ2QEVjqyPzReDhGtutonyEjeu0mvebk1Ye2gxp5x9XXabODdi949Vx0s2A/s6f1+AlX+UkmTzDT2Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UWIYowIf3xsj4ByiwvJpeqB69YjCsMK357Txuwo2iu8=;
 b=SkyYSq2DEunelWY1uWIUrcOVJiu8+xKBJKQY2GydY1FEgS3nD16WBOc1/o6ZSN0rszQsk8hL82+PIzyK45nYhr+Q+67g5j7l0DoQPd9fUg0LDulBWuMMHMJjWqt0NKXkUjXvytJsoCPZUlI9PYvd0GA/phpNsAC46okaej9gf6lCA2RnJ1w52Ua+CYlevwzbGHhZG5As4NDZUd3YhV8L2k3l2pOiLChN+rb+aDaFO71C1tD3CQbyPvgZoW2j0F7rjLtkUth4Wggd9ZrVX2i0azwvOHONbBmB4GIQhO8uHNKQqtx3rz3X6ntMz6sGVKZCErg9hnNwyT/591zO0931Kg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by PA1PR04MB10914.eurprd04.prod.outlook.com (2603:10a6:102:480::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Thu, 15 May
 2025 05:21:04 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%4]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 05:21:04 +0000
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
Subject: [PATCH 0/6] arm64: dts: imx943: Add sound card support
Date: Thu, 15 May 2025 13:18:54 +0800
Message-Id: <20250515051900.2353627-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0184.apcprd04.prod.outlook.com
 (2603:1096:4:14::22) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|PA1PR04MB10914:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a9f08a7-78f3-4622-4510-08dd93704994
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LiS8RfPK+ouslZpEHAQcIVnFWlWWbKeZnkp7ek2Kq376EbjKdX2erJAxIf+H?=
 =?us-ascii?Q?X443iu9XSnotIHdAQhk49Xac/8TgU0Dm3U3ygYPaefiHskjtH6WQsW8oS7oR?=
 =?us-ascii?Q?W3qXqojPztu6czfBbhTt20aTLChaqnxQpAQ9ifemCAFGC7hI9xu8vo+VNZ4T?=
 =?us-ascii?Q?LTBadaTxdi/I/t70vFAucbeuKbKXfIDTh/alUbij744yoy96pn3JB1ptoQPA?=
 =?us-ascii?Q?Z08TFv6xok9cq9yDZ2cAgi0DYoYbnrAgCvqnpseyGlGLQyA73PYYxCDWrybd?=
 =?us-ascii?Q?enFQ1tohjDJU/HqLT2q495qkztk9n3D4cBU+1xIInvNU2D6aPMpVkeczaE5C?=
 =?us-ascii?Q?yNCSetUkWulWEVZCHJIPI2h6tRcL4YNL+XRAYpefiAzmoE82ERfr8TYAsecx?=
 =?us-ascii?Q?6b/xS7xGyg1XEDYMvGADdHJNuRcur2LUWN0eIFCkEjJ3erPYAm1t0OfkWBbh?=
 =?us-ascii?Q?JEIMRhN76+EisEZ5jHKCtk0DbMZFhcjpRd9Sk5hTDqiDCB+wJ83p70RiZdV9?=
 =?us-ascii?Q?X+cO6hCjuYonVcwqnOYXYAG9m6KZUFRonCANPw0oviiE6kalZ21WqnI2K9jl?=
 =?us-ascii?Q?p/zE5r7Rzh6kkxG1aoChoXvLj1gIAIj6gimV4jDTnc75Hy892An24R5CB8Yj?=
 =?us-ascii?Q?zw7JLIjIkPSjUPgn4YiRRKdn7XM868KqgWKaoZLB12zE9MLbecT1GCZcbXaz?=
 =?us-ascii?Q?qyat0AdXD1YVxvh3XYSoFTUXMd/lWNABY4o6Wf6HCJ6KVCeGgFCrS6jAGI6v?=
 =?us-ascii?Q?R+KtMYo5qLB6ud5Y8l5C28r3dRsiGQUaVgDUIVqvk6p2iy5+oSqAIEoxTC9Y?=
 =?us-ascii?Q?fFaWX6ajZcGTuPjr3TNb2mxZfJOJMlYLvQZdLQicgH6Qy2ha7onKFmlAjBXd?=
 =?us-ascii?Q?vUkXI2uKH+laWobAIfO3O52BHA/mzeJZfzhwl4lO15SvjFQP8QuJBcpkI9dI?=
 =?us-ascii?Q?LJjhVLz/CB3+JMFpCiHXMaKX6xoiH0tv3wEgb6qlgYN8elY2ExkKrAMzZcVr?=
 =?us-ascii?Q?OzdDbUknFZ/qewd7qlGxDr+aqIsInEDMuFNLISO+/IR8f8aZfTw4uMdUmbhp?=
 =?us-ascii?Q?j5udxwiOOaEFTF8wSyx7serz9GAHdKXo3bS3mHWzjw4Cvvlmm3ZUcSzxVR3D?=
 =?us-ascii?Q?ReOBT3gfy4ZYW2zV1qPfDS6mNfidb60DyoBWnWBO1jmeD8SJAzMm2F3qgqya?=
 =?us-ascii?Q?CqMw3OyAD2DTQCMFtcnTLCaS7joJy+mOHixl+mcKmHHMQAmVa6icIoZLspbg?=
 =?us-ascii?Q?n4wWgPrNRsI9mDSUf414ZMJC467jo4BgHl2OJYc1avDb74rsDRlpriWuSv3Z?=
 =?us-ascii?Q?FrASQASyaCBrpn/iaOs7h0u1IkHPrso+8jrGGV6sK9jEIWUIXsNbfToau8JF?=
 =?us-ascii?Q?6GM2uES71JqLRS9jQ0pwDfnMepbcLvkVxcRoXdiDAbdhNl3Isz3qDYnw2bno?=
 =?us-ascii?Q?kMcAMXSInvChaDPqB/2azJdI6BZMEfNe2L4j93WMITLnh6gSL77H5cfzmBZy?=
 =?us-ascii?Q?sUipSQN7ORqVL90=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Isg48EC5ybzBTXychhnYIPg71eRfPUXwaSfd8XGTttDFrNFLKlVoG/cwLHyY?=
 =?us-ascii?Q?nj7KIZBSdMgkQvLwo5ttcd1ZQmFplEv4B3psaGAcdInYSCr2sjL8A81/uJ4k?=
 =?us-ascii?Q?lZSYJgWLZD/WlWDKA+GySrORexhqqs1PsjcKj3vw2f3r/RqylLKejxVYQtBc?=
 =?us-ascii?Q?ygUZxazg4Di0JFMaHpEj+T4fjfGoaE7lYOxZxFLoVjHEDchfRExsRqBtd8RV?=
 =?us-ascii?Q?v3uPff6EO/3MIvWw7wEyN9j7gBBUAwom2+gVMUjNv+14R+s6MAeX3KRjzCdi?=
 =?us-ascii?Q?ud1H3DLr4ZECXGn+cc86JSP6AZKJq2cRuzxOw1vmOHTusHp1+crTFaD3JMBG?=
 =?us-ascii?Q?LChEb0LoBm4XXMhlOiEqEijNPHa3IrEtpaxD+U6EbxSopm+MtRC64N5XGAVi?=
 =?us-ascii?Q?j1O0CCs0Jbpjkdjw8ZaH7/spPwpeSRBYQUHPopYuAUhaipV9TfAyyD3SEv0Y?=
 =?us-ascii?Q?sHQgKxQCPmuCrsNNTpJvXbwOF1grAjUNsZEFJUI3mvNiqargUrCr7LtM6egZ?=
 =?us-ascii?Q?R3afLBQjc87VKAQQSukuwZoHGxZuishIv63W/TgkNjYJjo8GWka4UQZ47hnE?=
 =?us-ascii?Q?HxSymtMmMmlzzbCYJaJd5uKnnpPfA2c+dBY2wJVrtWNv5XcKG6w24tz9Njwe?=
 =?us-ascii?Q?ugPAZlle4PfrQFVN7gOATwVMdfoqCrGumqL+Ssvjh8J2zvj6rjRiZinQJZ9Z?=
 =?us-ascii?Q?wVbZKM9jgwMXAc+dG7Vwb6e+ynCT0Hn01Z5OF3WDfknV/YhytvEB51xDRwgu?=
 =?us-ascii?Q?klKPd7HfsYm6eob4Nsw7drxBQYEJdb7PJZ8dIyiknM4+kULthBboLTSKAjDj?=
 =?us-ascii?Q?ZPeSCMji+6CYB1TZXj0sWn6tHsQbIXmxNdBB3+Bz0c2pTjMu+aa/qIf8YyiS?=
 =?us-ascii?Q?PrHg5+zsGKAiKrP4h7RmLvy93qdHVdoU6na3fpIgHUh9mcvGAo/jfd1tBw4L?=
 =?us-ascii?Q?0Fs3dXoJITFsW2MWpXlW2zyf/qK0iaO6NEXuujtNmIraN6I7Apk8U4Bxr7KG?=
 =?us-ascii?Q?0FrroKsfLQx61xCdP3FjrHyzi3JF9fPjYhFnGYD4w2Xz65xLfaiuCwbr6RcO?=
 =?us-ascii?Q?/7loBm5R/dWPSp13woaxUeNYpC6vAEcBXYlRi4wITXONcRSUwI1IFWaYZzR5?=
 =?us-ascii?Q?mgwWnBo9H0OzwDUjVb4GUoEuPoMAUGaYhAoVYGCJJ7sVSh3KZKR8MBoogYMX?=
 =?us-ascii?Q?NyjFgvns906UJp65OhPSm1vvgsqGrs4PG4KUGoA2EmeuK+UiKXj5rQnqWy9M?=
 =?us-ascii?Q?4kJe/tOE2gxLgMhf8TZpmAqL2no+tMzOewRXX+7udDelRlSRNgz2TSxaPKts?=
 =?us-ascii?Q?D1tnC+8JuI+f/lQYV5MPyqiGMZ13XHy1T6Zo+z2q+Iqw5pNl1GqRGEkJkAkn?=
 =?us-ascii?Q?siMNcn1i8ajZ5e9WKbgCByLAkTxH+dRF9ov90lm4w+3lH1wOPQ5V+caacr4z?=
 =?us-ascii?Q?TtqqM/EswC+AxR3/XB+wHRUbRZBJEod/tYmxi/tUtsZ3DsTG5SURFkhLtcrV?=
 =?us-ascii?Q?DCWtF1fFLLQIIkcbTnKLVu9VC6AegnxkkqO9OaVo6xbEjCEsXJ16IILyO/Xm?=
 =?us-ascii?Q?xx68VbUBDqBDJatZEBYBrFKlwzCxEIMI1aJLrvPZ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a9f08a7-78f3-4622-4510-08dd93704994
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 05:21:03.9985
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NgvBraaC5okaqJk6ugfltMCtxGW6GmCJOxJOohRJpASYip8AyOh+p21l/9juASBWwajt4OgDbuh9GxSpM13aMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10914

Add sound card and related i2c device support
- micfil
- bt-sco
- wm8962

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

