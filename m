Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011022.outbound.protection.outlook.com [52.101.70.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526B426F463;
	Fri, 20 Jun 2025 08:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750409180; cv=fail; b=eOkpEg25NIeG+yIBTW/F24RxERI7eQdipzs/IkIcqghZXQNAr/r/T4ZKLBaqXNlRNgeZzIvOYz+74fobTf7eWa8yPMovbZA5V0RBqhRhwnJVofeaY2irSCQIgfTWSO6/j75zwk4Hlzu6lD/bpYv4HXT6YUJWXUKhG0NPfKYiKek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750409180; c=relaxed/simple;
	bh=WzO6cxXGbWPrQz+MtP7eWtvrZTBkBOP8b3zh3UaCbfI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=r81BwS/5tmWi5tHyzKr6CEwKr32AXkj/qf9fsJzT8B+rngkHk5zZHbJ5AqTgcUMY+/iQggiPV6PzqYejjf8Xcc7HsyVZHednntf1YyVFRkduqhyNSndnSTh3Y7od5Oq8/uOiJtHBqKP0hLXvZwA6G0yJ9SBuKOxfTFbhTih2aBk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=fail smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=GptNxKGp; arc=fail smtp.client-ip=52.101.70.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=mt.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="GptNxKGp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i0mIHnxavpbRzd1kL3DU448Y+1B7ga9oe6v7+hD2z9pmVR7HcQV+uMIDoQI4A4s47qcOKwADEWzJrFs5+4vp2jD/ioEwqBE0SHOQsxXiroLEUUBsGCCJMb2n1IWZ03FhK8go7oZyUwXdaFr5xCEQOfJMg9zxN919J8co2nNpUFKD8GoVYhZid/TjRJs8DhSHdCvHbTJkxiVhmYwbSVZ2s2nVmPJZ4fSJaaEqkhRUSma/njs5Apg1aUwt4HRIUMQHYtE2VCj9iIJvS/0dEXnEnoWhTBaKjh6Fgp75C9RilX47j2iwlay5ETtuHM1qO2g4ulir8FGDouJdbwoKsr+ZoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BCO1VCVW6kbV8RN+0a370v+W9LQX8R8kxRgL6SJa7uk=;
 b=BUDhQTUY+ogN+4/v2Ryxu158PaOCc6kdGQFbaALYz+myfgxgtWTnc2Gsc03zY/ahtFHpQnbHNA+1znYBun42atSG/cJHsk3iNKQSzHOO1FgVJm5tTA1abv0XDxWBtxChw6XJAxy4fnb9Qp6rE7qL1SU9lqnZqSttU3LRJ98BAzPvf63LiAu/75B9B0KS28cUIkchRbNTjmDL6WUqNeSOdT1Ro6lJNsH7G3GusocvjUlg15wS85W7K9n68wxyDSEbwy/86QUNeVgXuAX1oTiPAVJBXjvTs6jkUD2iAC9un/UDntVrmFZNmOOZiN2pNQsKwUvvjSD5zqxWZCxYwIL+ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BCO1VCVW6kbV8RN+0a370v+W9LQX8R8kxRgL6SJa7uk=;
 b=GptNxKGpkwR9rftHSme4fj9SHCDnz8tooPfRaW9ZvwkwOZH4MN8nkDwQaTR+JUD9TkMSs4ob80j+XD5DzmNawh3G54wDi0ZTRmTxfW6FtjLKldq4AnxhkDyIJWTgUNfpTL9FM6qDZPnv9EsQx6JrOxrZXWICbLruKwfAOaLCXhWebN2IizYUUz8MTOOVmymSErhOqr958pNgNp1zvPDbXYJTfcT7KJlpAnBjLjeS2NFvp3rvn0nySXBR8g6AO68M7oFMPIlstckn/a+5ktBtFwHBthB5HtC/RmTRrbAuI6aIdV6A3K/heMCP3K0T73yjmrKaAXk4RfsRK++y67IlkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from VI1PR03MB3856.eurprd03.prod.outlook.com (2603:10a6:803:66::33)
 by AS2PR03MB9490.eurprd03.prod.outlook.com (2603:10a6:20b:59a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.23; Fri, 20 Jun
 2025 08:46:13 +0000
Received: from VI1PR03MB3856.eurprd03.prod.outlook.com
 ([fe80::e9fe:470f:27e0:b265]) by VI1PR03MB3856.eurprd03.prod.outlook.com
 ([fe80::e9fe:470f:27e0:b265%5]) with mapi id 15.20.8857.016; Fri, 20 Jun 2025
 08:46:13 +0000
From: Wojciech Dubowik <Wojciech.Dubowik@mt.com>
To: linux-kernel@vger.kernel.org
Cc: Wojciech Dubowik <Wojciech.Dubowik@mt.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Wojciech Dubowik <wojciech.dubowik@mt.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Marek Vasut <marex@denx.de>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Frank Li <Frank.Li@nxp.com>,
	=?UTF-8?q?Jo=C3=A3o=20Paulo=20Gon=C3=A7alves?= <joao.goncalves@toradex.com>,
	Michael Walle <mwalle@kernel.org>,
	Heiko Schocher <hs@denx.de>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Max Merchel <Max.Merchel@ew.tq-group.com>,
	Tim Harvey <tharvey@gateworks.com>,
	Primoz Fiser <primoz.fiser@norik.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Kever Yang <kever.yang@rock-chips.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/4] dt-bindings: vendor-prefixes: Add Mettler-Toledo
Date: Fri, 20 Jun 2025 10:41:42 +0200
Message-ID: <20250620084512.31147-2-Wojciech.Dubowik@mt.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250620084512.31147-1-Wojciech.Dubowik@mt.com>
References: <20250620084512.31147-1-Wojciech.Dubowik@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR2P278CA0038.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:47::7) To VI1PR03MB3856.eurprd03.prod.outlook.com
 (2603:10a6:803:66::33)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR03MB3856:EE_|AS2PR03MB9490:EE_
X-MS-Office365-Filtering-Correlation-Id: 113f1060-cea2-421b-6c91-08ddafd6e8c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AMSNhrI2/af1EoTLsY0n68nnVna4j0zRGsWIpa9qOQ1CxSl4zqDZjbZsGUCR?=
 =?us-ascii?Q?QpWjgWsIOuaeP5YrEOMVwnGinncceVAZQ4nXYFD/x7T2C2AImUxQ8wug3Pqk?=
 =?us-ascii?Q?9itGIfCLKnvHVnHk/4FNjNEuSTnkPe9Xgv7A7CClmAiJz6TmUMLhksgCHcAR?=
 =?us-ascii?Q?kY1xuixVtz/RdtXpIoC/pbyFMVfcuD1LC5HyC6pkoNxdfsQjMNtlIsl5GPSA?=
 =?us-ascii?Q?OtKmRoUahUmD0QBwpW16TvH3RYLRlAXg5EQNfNwMnxi+eX6RLO6Np+J7EZ+1?=
 =?us-ascii?Q?I9514/sp0mNWz8zdURied+tpdZCKk7NoBQIEQ+VPZQQ2K7kElyO3lQ3px72H?=
 =?us-ascii?Q?V+eAFbf02JotuZBGGRCQfnH5eV1y9mVwETECbjtu4SgqmZSctHdbiXQdLb1a?=
 =?us-ascii?Q?5Hk0slwvthSSbwfYtWpARC2bgItMuRcbme5zTMZ5aVzvlUGDKNVYDXIyrQun?=
 =?us-ascii?Q?7yAZfW70GvjGV/ExG42SWWlS7JupfAG2JIBLTtupwGlze0G7rjhPRskz4Jvk?=
 =?us-ascii?Q?poxzNqMDe5dJ2zww8CpH8NRWyWJexQsBUmQx/aTO4x7XqFinU6p494AESCnB?=
 =?us-ascii?Q?BhU46w7/znxe7IoDAgLO4dvoEcQgXcYIdhgKI55V029NTgT7cbRnUmvn0mlZ?=
 =?us-ascii?Q?nRR+AMDymPklYbD2S5hUy6KYmhc8ST8GENhSUurFz499JhZz7txeecsbrxy8?=
 =?us-ascii?Q?yfsb0D13F1nAope1kDTBdTEDCXyRxqb/hllRv8EnigyI0bLKApYESGs85Kgs?=
 =?us-ascii?Q?mBmI1jJURhviCsxUh1B8HuHEDDVOcZGWgHRFK39/+U4y0NUjh6eFXN1Rfhts?=
 =?us-ascii?Q?hU+VHQULmNqoYGWdzpWcyCEvq0caowOhcF560MpSrvoZogOu1bmIzbfdIjFV?=
 =?us-ascii?Q?KCHXEI8m5TgvmZC/BKP+AQfwspw1+w3oC6MFsBBdTMpK4uWol2VnrH0VEM1U?=
 =?us-ascii?Q?YuQ7m1H2iFCBAwdKghdx5vZijAOl/saOF+Nqp3O9a4yVZ0Hce2KR8mC4alp7?=
 =?us-ascii?Q?AhQyS5z7Tr0UEKW2V8R9p73N6GHraOeL1e9OClkZbSf6RgHf17ooegyEIrBX?=
 =?us-ascii?Q?ggo9ISL4d+/zcsJhvCVuXdM8tMAjlg3tVHMUliNrIv5ml8wAHY7p5PCIsxpU?=
 =?us-ascii?Q?OcQ4wda4SgZDEgsS8H3sjSFwK+Cs0uE/3zW1K6u/mNvxXgqAY+zEurUEWwW+?=
 =?us-ascii?Q?VvZiHBOLmo5g+jsJylOXXLuXEgJgh3IFb4BW6p2+rcWl77JF7NLEcP1gLKoA?=
 =?us-ascii?Q?wGSJ41KD4UsjuBSP6myP+C+YLxSRfXHuop9y0b/pEu/YtME78a9l4RG6zGYm?=
 =?us-ascii?Q?SIG9s0zl6DXjPE/EoVUmJ18MLYYdMQq3A5RTRy9XSf3qMcGJ+dzmpTgij2X5?=
 =?us-ascii?Q?/GL5yWdTL50p+PxfJ0x9eSXmJEoN/4aYgPhG4zKpXu0remI8nfI4x4c25/c/?=
 =?us-ascii?Q?TlkLSwQFvCE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3856.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?R/tWWrebTg8yw/dLd9bHaEfVAEuMUKdusVPqO6XuMYQKou5MaxZ03dMw9Nd9?=
 =?us-ascii?Q?dXpwsusjgU83nGBcS1IcLbO4yQ6/F3iFcPWFcTfiMgT8/W+HDiIGfc1SvT7K?=
 =?us-ascii?Q?LLuhlSW6Y/n1FZ1clgIoD24XHGf7nYw5Y/ney2EvDBZUiNNuXB62e7GLHzcE?=
 =?us-ascii?Q?EW+I883cz1Ru3sr59p5BMiJAEt1wE7PkaKECH2/ULZ/VqFZhR/8JlbdzkVZN?=
 =?us-ascii?Q?uwzAHNqpMA+LwErsKxgXWsJ+7bphl0HG8OGGs9hZmJ2FzwWzsbtHepscK5U3?=
 =?us-ascii?Q?0tU/IfxtcYtVf3HY2LIZZSQCFEjz1ur5VDgaXewd1P3WZsSzXgJ+WS3RfUPG?=
 =?us-ascii?Q?KjVR1B3MP21dPyfnvm2zQ3l3xz4IyaxHkfrjj1QPYZjBU+uUCAGORkViJwb8?=
 =?us-ascii?Q?updJK1w7UKdNO8JBj7HkzeOydRtsy7POdYCHrf7ns3UNuav9y/Q9hOvVe+HM?=
 =?us-ascii?Q?cdH32d3ZHNHlLFg5jv9Uizz6ipx66HMP4Lg62vC4s1HPd1LWjUg/3mfNz+Nh?=
 =?us-ascii?Q?0OcDUaYZhihzOxpq5+tBAh2+Gsd7oXtt0Wt/h2w+2WpcttoSJP4qszpVGfur?=
 =?us-ascii?Q?5o3DtTmETFp+Q8zDtLK71nWwLPb8CxJvScej8xsNEUt+lBMMxE0b3/V3gyTv?=
 =?us-ascii?Q?yJayiE+ktdFUpa6JA8rwj5ItnKO8ko1dUrC2h8zWdwk5y1h86QCcYJtxkpom?=
 =?us-ascii?Q?88k5QxMfFe0MtyHlbkaiuv8YDeZDau/0uilrt66a4dreqZS/5f02UE8nhT8H?=
 =?us-ascii?Q?rwPg1scfJoQyyLeM4dpwhFubcFniKBy8BFOWSUSEpggocsISn0KfOLRQnMbj?=
 =?us-ascii?Q?VP/snvyZQDpgX+piuJTgxm1V31LhF3s9+zCtYHBi1X+5g+AUd1L8K6F7iVr8?=
 =?us-ascii?Q?Awe38QVS4nxQitDYmJS0274bunAOuWdiSIWgWuVQxr3vuM6puvYQ6q6V5L63?=
 =?us-ascii?Q?Z9LTlIroPWAvt5sYJOBFfTlMplEuVQ5Zt0DzLQLr2vXKjsXpZMCW+beE/Afo?=
 =?us-ascii?Q?Nc9r3V00Hwq0yq96h1MFy/FA2i+asRmJla6bNWPojVHuUBex9arAEEUolEIV?=
 =?us-ascii?Q?AAR8lxpfhrU3yjHsiIvo9B8SEb2BMgvicGwMObtNQLuTVPsldy5ciP71nvuh?=
 =?us-ascii?Q?BIiP8dq2+H/jLOvGiz8JPYCjKwpnN05OmS/CNTFZ/dLerJqCR3jRnep4NDw2?=
 =?us-ascii?Q?Lkj0eSAar7uTUnA0QHMpjfsT/R10sRj6ofJ1KgmqbxpbU9k94+hUf8aw55pr?=
 =?us-ascii?Q?Whx6ha7HGZuXskC1RPPnU5t024vUtlNBKTNB6B+nFUml6I7zPGxpkHFn9aG4?=
 =?us-ascii?Q?bvcfr7yOSsUKZ8XdUHB9wqln1TBuTjA5tl6wKOJRawp7WZxMEibCnseOFnHW?=
 =?us-ascii?Q?ABGdoByJw/e6PmhSXmPTwg1XWOYLy3nO11SY8P/q6sh3cNyT1YUilWjZmSIH?=
 =?us-ascii?Q?Q8JY+vunIsrRG0q+W+2lSV1Nql8p1Nqs6MOMqA5cj1PpJhPgv8yKkCiEh2U3?=
 =?us-ascii?Q?s0h+FAozxfYyxViuDXMMN5bHtmF9HZ/UBVxfJ0ZHj6ciqgoNmdO+ejsm3vOe?=
 =?us-ascii?Q?uRDKVvkcYm2Ga202iBeR+tziZ7qzD/jzfV/c8kIrgBbfKB2ekZT54AHbhSuz?=
 =?us-ascii?Q?PmkZELAIBfIAzPHMoCCmJ6XygsorglJFL6MIY4+NlL6md7QYS9a1iMXUUGGO?=
 =?us-ascii?Q?Nh/owA=3D=3D?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 113f1060-cea2-421b-6c91-08ddafd6e8c8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3856.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 08:46:12.9585
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dJIng1WkmhNnVZ1EKLDiFKlqFBkrav4FrUYv68RlSomPKgj4Aux02abmgvl/OgAUQcGEdaHIQh269qfCYEnnDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9490

Add the "mt" vendor prefix for Mettler-Toledo.

Signed-off-by: Wojciech Dubowik <Wojciech.Dubowik@mt.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5d2a7a8d3ac6..0534ae640348 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1018,6 +1018,8 @@ patternProperties:
     description: Micro-Star International Co. Ltd.
   "^mstar,.*":
     description: MStar Semiconductor, Inc. (acquired by MediaTek Inc.)
+  "^mt,.*":
+    description: Mettler-Toledo International Inc.
   "^mti,.*":
     description: Imagination Technologies Ltd. (formerly MIPS Technologies Inc.)
   "^multi-inno,.*":
-- 
2.47.2

