Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011022.outbound.protection.outlook.com [52.101.70.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C93270EDF;
	Fri, 20 Jun 2025 08:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750409186; cv=fail; b=NRI6OhIGVVM+O9CbIxMh+laktmm0ajAPhI2ZC7mS8s9VSjx0PwQBA9WuUud1U8JB3IQMMTDRvs5TNQ7o2eIBr9e0+T4tTvFSVbVoxMzPBrwVmmi2o7lkuGTe3DQQZQMxHtUP28C8ZdJCPdLElLnjw5OHT2Z7mhmol2SBmauetuc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750409186; c=relaxed/simple;
	bh=x9+WGhML9my4sChRs8UT9nNdVpTMliu1hz9rJNIKICM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Q8YeoDqXE+SIjvRnpkYwB6CpfJbSCjhaX+0gHjOAG9gHuSwCeI0VYWK0cHiGJxyMGz2pOiaq59VkgJS/C1Yvobqrbm0gwsKaKmMZVqzw3TedC473sWYOC9i2vZOsc3kxIymSi+NfZf8mhrlqGSoVB+ZR7dD3srVY/qXpXAGOAO0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=fail smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=bc6lIj/Y; arc=fail smtp.client-ip=52.101.70.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=mt.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="bc6lIj/Y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m38oKjtEBKQiwm3jgLaxUg2WaRchPBTYqW0+yUDq0qqhWs7Z+ko5kPQyfPWsXEXMoN8tcbH+u/UyscQy9bmwiABozaWemlPo+MDCtlKBnV/YQ31y1GgWXATvgoIk1rw3JAP/5k1Ma6nrRKE1GPjHo7nLjmtEECFrzDgXtUZPTNsWstw/Xo/xaw4wzKm2nEErnCRUuvrGkVDiDozqbcmZ+gSyT7WymAHLX5sm8w+MLzViiMfIDxS7eExsbpOJgttSP4tde80mOUUvZAP9RgtJNLLIUa1Nz8lCJGbg12G9KobtojuCejLK7yM62Ga9XdA9rC0ZAD7Ly0/vNR6zxa8EIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4+Q4DtEDAkGgyCm64bhcklWZJRyc5WKXJAzBuPtDojE=;
 b=g6od2C6xykgeyZiEvINijcvr6hFc8qiCq9AUIx031nIcFE8vICoNewec5h0US4pGpDMmfAqQBl7J886ZwP9vJSnlKi6ZFAwXrvkyWH5mReQOrmaso9ppRXRvAr1QN4ip29WsWYBZqLOsy0HcV5u/C+lpDzD8CBrBAL1UtgVfWm7NT599Zy9lOCzwIQbes6e3BPL1HFS+YYsust984uEeJETqPJID88q37y8TPg3O+7c17V6FKDlmrUd8JVisfdGwuro7Uz3hb475y0ECMOJf+5v+imxZbCAgexGh8j9LgJ16jNdXZ2f6U9+Fbewyddpg4XSuE+bDHuw82Mrqt4ph2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4+Q4DtEDAkGgyCm64bhcklWZJRyc5WKXJAzBuPtDojE=;
 b=bc6lIj/Yb2PYFBuWjYCcnYRh8HIA/gjOnZ0XawZc6i8n7T2x6vnrB7aCxDpqUI+Q6Iis2SX5B4/01TzV/53E+SMs/7N0ktRyV29BgKYrRI/MlULnq5KQC9zrBCfpu/d7C0H6RisgxRdJXjjzrPPm5vz+WqLnVkB/aRXmB8vTDDOPMIBHOUgpv0oK58c49QXfrwYD2HP3Vp9DGh30aOTV9C+7aihED6FfPkuiIrtRkFW0CDGry4epsEzrvvyCbG7tb0ABXoa310/p2wos8RsWwFwbcqgmRFbYq3y2gaB2XVm1DCSVG6KWgJrx0faTAeaIDaGZQV5D5bxWdVUDo82AgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from VI1PR03MB3856.eurprd03.prod.outlook.com (2603:10a6:803:66::33)
 by AS2PR03MB9490.eurprd03.prod.outlook.com (2603:10a6:20b:59a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.23; Fri, 20 Jun
 2025 08:46:15 +0000
Received: from VI1PR03MB3856.eurprd03.prod.outlook.com
 ([fe80::e9fe:470f:27e0:b265]) by VI1PR03MB3856.eurprd03.prod.outlook.com
 ([fe80::e9fe:470f:27e0:b265%5]) with mapi id 15.20.8857.016; Fri, 20 Jun 2025
 08:46:15 +0000
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
Subject: [PATCH v2 4/4] MAINTAINERS: Add entry for METTLER TOLEDO BOARD SUPPORT
Date: Fri, 20 Jun 2025 10:41:45 +0200
Message-ID: <20250620084512.31147-5-Wojciech.Dubowik@mt.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250620084512.31147-1-Wojciech.Dubowik@mt.com>
References: <20250620084512.31147-1-Wojciech.Dubowik@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR2P278CA0088.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:65::19) To VI1PR03MB3856.eurprd03.prod.outlook.com
 (2603:10a6:803:66::33)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR03MB3856:EE_|AS2PR03MB9490:EE_
X-MS-Office365-Filtering-Correlation-Id: cf5d664e-a0cb-40fb-56a3-08ddafd6eaea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cFbSFsHUtBtO7+jRCW+/dvd0fW1b4FMfwvAvdV136AlHGbRQ3awIh53zECsG?=
 =?us-ascii?Q?kqGtv3TK2zsmf546iQIlq1Z8ONc+fiq/3m/T3p0sDtj6OWto9MEWXBEgm5js?=
 =?us-ascii?Q?2Tvr7r7hEfzFqWqtNW4HmOwcH+VGyDH7uyGKz0PznS0dijiOut6BniWnn0AL?=
 =?us-ascii?Q?/SS+Q2EeR5freAi4SP+HJyhGmW6DWxQBRGalXTu/23i2IStkT96FvIG+Rr2s?=
 =?us-ascii?Q?l/fwGRoiDFxi1l9kJexPL7uO+t44ie0/MFuNZb92blyRE82tvqpUvrww5lZs?=
 =?us-ascii?Q?N5nupAwAGsvpNeCEjmI+65NKe8ZaigG3RPRIP0+KunhPeiieuahFmG6qQlyx?=
 =?us-ascii?Q?bUJEbrXIKZQPJjJPmEKfb5TY05G8+yWL2ZtDq62UE3sphYVvhUMx+ql0rrZ4?=
 =?us-ascii?Q?mOY7VXOHlM4GZoDDHg18+Tnzyp1uaVnMBUxt7vKogDqjHyDn9psGrUYgej5W?=
 =?us-ascii?Q?TBseynjKz0mVbdLTB8dFkGCXffVi3BECFkzmkuH36we1FzdoZawpBGA5CZo3?=
 =?us-ascii?Q?GugLyN8OtH1Vf7DGNqUiWmRwGZDSieIQBFGibVI6ebHJrmp8ojqPVwQX+GhS?=
 =?us-ascii?Q?rclStE8kYGmEZYH8pv7wE3IZTqkPvwiheW7SVC5tQkaWIb8iZT9U57U6XNq2?=
 =?us-ascii?Q?7dwLyIzSR2oa7JdlLVNE8gXCImvIDMz+O6P8bWgY6CPxgV+7LCHphF2KJCV0?=
 =?us-ascii?Q?kzHYStgMxCHpc/OeFEVW+ActXPFR6+ul7kGfcyUL9cE1OtjNB5YpJoLy8ufJ?=
 =?us-ascii?Q?jQfPtaPkBwBXyF0xortXBIQeDAyrW54JMQly1m4lHP7j8syRaGzp6TFznwQl?=
 =?us-ascii?Q?KpvcaTWrY5E3yXVQKKzSYFMAbWqAxfCjqJ235pRHNtLvIDKqBX+nIO+vJPpf?=
 =?us-ascii?Q?PAqmD/dZvfQCrqB75OaXKekoWfmbSMLKnXexQLSPQQOhaSf4NeYLLOr1iIP6?=
 =?us-ascii?Q?ZPFj0lq/ZwflSKfoZ3P3DbBV6uBvVfkl+NrrvaO+ChzrGoVJf1ndyWpwiYEw?=
 =?us-ascii?Q?p8x3BKCmap55z5pXR/xT1I6xfpV0Ofyu4J8SOQCDnHRUo4JyyoJ3rHZudOxQ?=
 =?us-ascii?Q?Y0F6gJ+gpKA8bl4j+5stbbeW8TLQ4Es3aPI3AtmR9G8aRAxgwR7m8zweumOQ?=
 =?us-ascii?Q?biCaR4GuJYCmf053chSM+A7pfr0uUdBI7KayE1/LWsAK1y5b/TxzTYCe5oVG?=
 =?us-ascii?Q?tO2/58t+9yhblLSNa9Bh50Y6XAaUPNQExwmjO471s4aZ126D1qBc8Kp4Ihl7?=
 =?us-ascii?Q?Y4FEevewiG96esyeKUtL+72yu9WDju2iwKweuON+ciBaukcOjTbGPtaStB0C?=
 =?us-ascii?Q?oMvCNAYQxACMFGyPGdxoJUsDGjtk+JtnBu1E4gdSvsRsB4316KBiKtY7NTgG?=
 =?us-ascii?Q?t7xMGkOmoNESaZ9Ts4AogAdpASDHok25WKPIHYlWqXQiQpskBOKY26YUuG6q?=
 =?us-ascii?Q?tBgqHIgcHGI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3856.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5uVcdbQvLTquxUaGQKEM0WNRbzAqQMcQ57CH+p+Eubg0HL1Ky9oCCUrhWqGr?=
 =?us-ascii?Q?PTUEdm3LZ8tOYiAk+VeeSYNwHZGX0sCUdYS4NrryAn1FGjAVlqyA86T/4AHd?=
 =?us-ascii?Q?4o9330Op11tPYYUCyM1o6/cGLyNkGajljA5HE6bik7PWKquDmY2bmPasVURy?=
 =?us-ascii?Q?I2njNEMpjJJj8RGkH0oT6ri7YjVeQrIzmNoN8DCKcBOSXl4q1ysOnOHenC6Z?=
 =?us-ascii?Q?uzU05Xa+cWBkB/BUq90fFQs7wV1FW+DxHQXar6K6v3/S13gqExpQH4qEyu2W?=
 =?us-ascii?Q?Eu4W58sOgtgDxSdHzIgpzXxDn+P9hqfXDN/w5d17mIdvV8e4GaDV4X3VZHyD?=
 =?us-ascii?Q?RMRJWrC94inquGhrYLMUpv04lWjkTe8Y7TBLGOj/1xTTgjd2H0+HnqJz05pZ?=
 =?us-ascii?Q?kfqIYxIoWeMFDXUEwr7mvjjPGaljkDkTDpVoOvbiw1dtZXb1KzDde7B0aQtB?=
 =?us-ascii?Q?aSd87bQW2T4numTm7Z3VeNjpOHUOPPCKylfzd+ZHo3Ad2RAuGQJEPOFwcgVS?=
 =?us-ascii?Q?gHe+FIFgJ2AIScdtdiDbWVuQODX7n0FQJxad0v3edomet46ADnXuJMi+LjKE?=
 =?us-ascii?Q?zUBDo9eLc3HEtz8k3kWfjPOTEjxranH6XMwsp20+dx9w/6RYpvokfuaPDYF7?=
 =?us-ascii?Q?PBPmzHCM7258Eh8DFt0miouHvJumNxZ6INE9g0ykumhUu8K5iv/ayuNO1FbY?=
 =?us-ascii?Q?fUdJI1KcaJG15RZ4yBZhjWsi76yd3bQp6wT73blJ/jjL5+7AZQzj4OLhsDiJ?=
 =?us-ascii?Q?55NrmUThKDKQ8IUO4N69bWYdpLM3n/EtA6by3Rh/W+/s5R0cBEbUJI+1FhQO?=
 =?us-ascii?Q?pKSn5+9WqiHGd+U+qnhRhU3q09vnfxtnVw2LBtuKCNqVxiz2tLZCQJcgdqti?=
 =?us-ascii?Q?WXc/8/iQQeT2kS6E9puyegx2+2fwwBJOtOIYfrvSQ2xn1VdSfgyW124N3gSl?=
 =?us-ascii?Q?KWOBKUR7kYURl/ZgjP/HYJQ+XJsZfkainwSyM4YI1MqWHRLeaKjjzVVxMeA4?=
 =?us-ascii?Q?tiD8p4A9rKvCzgUljT0dqy2j6ki96NU6dgq7OXknaqAwnvxn7L0iYqMcHZTv?=
 =?us-ascii?Q?lneU0BmAYfAmWEc8deaR59hSlL4b097z1mqf09pj4AU6rl8zub6fHPKh5vfe?=
 =?us-ascii?Q?bjyLQgpdBbIo/CuvkH81qnvoP7hT00cTVHhFnOecyoxxRcNpOSWF3T8j67p6?=
 =?us-ascii?Q?tdag7pAo873sqPUgmWZziBTWX2lQvyGBTY4eBEuQlSogyqDTlelYYZ9ue6A8?=
 =?us-ascii?Q?RncuNwJlOE6eQdUPZ0jl5zVIZ+mTJ+B9Cgb9rgPdArog63mYwZA6CrYN/thN?=
 =?us-ascii?Q?T6IOi9lOd9WP5lb0SyyOy01pZDCAAmtbIeLq1YHLiUjdEltRchjpTMw7xLAD?=
 =?us-ascii?Q?nOkdjGAOKWAQ6TUIj3y07ZpiaQM+193qMZyzw+sow/FsXsv6htl5eyTPnSO4?=
 =?us-ascii?Q?CQNDC/IjziPy3oZIPpFfJ4VAp7pmFgVZ5R45uaODFdr+wQNE6jZED4vNzCvM?=
 =?us-ascii?Q?wWXlajz0sKphiglALUYXNizB77PfqHkh5xVUgfZxKDMrpd6AEJ3dNqd+vQdL?=
 =?us-ascii?Q?hFYx3a7t3Xwl/G1X4YwtldQAcpIryRlns4tlnPgFg2jHpylzsryLNvbw17f7?=
 =?us-ascii?Q?h5K64VWl/wAqq+IdN8q+KMh0RGF3kAvTGF7/q5k7EYCv2Gh6RbvZ+xOzmPSt?=
 =?us-ascii?Q?M8iAag=3D=3D?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf5d664e-a0cb-40fb-56a3-08ddafd6eaea
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3856.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 08:46:15.6614
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vT6IALvau1FzxLEKhWwtDotiVZGAY9EPU1FjqCH25w1xXWSY9lUFkrsD9O3C7tsobXhSKxeVL0PnvNSav1Aowg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9490

Add a new MAINTAINERS section for the METTLER TOLEDO BOARD
SUPPORT covering imx8mm-mt-* device tree files.

Signed-off-by: Wojciech Dubowik <Wojciech.Dubowik@mt.com>
---
 MAINTAINERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f584e170cfc3..a81fae7ccec2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16109,6 +16109,11 @@ S:	Maintained
 F:	arch/arm64/boot/dts/marvell/armada-3720-eDPU.dts
 F:	arch/arm64/boot/dts/marvell/armada-3720-uDPU.*
 
+METTLER TOLEDO BOARD SUPPORT
+M:	Wojciech Dubowik <wojciech.dubowik@mt.com>
+S:	Maintained
+F:	arch/arm64/boot/dts/freescale/imx8mm-mt-*
+
 MHI BUS
 M:	Manivannan Sadhasivam <mani@kernel.org>
 L:	mhi@lists.linux.dev
-- 
2.47.2

