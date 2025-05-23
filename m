Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2080.outbound.protection.outlook.com [40.107.247.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95FE8297B72;
	Fri, 23 May 2025 16:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748017081; cv=fail; b=je+rW+6pMqaqHf5RXUvQaV0xI9jgMhSICdb2/S4zsQamnDUvI/u6nazs0UO6oAQQcXfxwxO1RAT6RHhOJGW4TJRjvJnAMxllBsf15+cTpWnyEW+URNHTe005m/CDthNwE4H4/X6WhivsHrznVFVduP8nWXAKix96Yhw9+tWzkiM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748017081; c=relaxed/simple;
	bh=feb5YloesLl43G5f84SgqgbWokhhNPjgWlVHxBkL7Gg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=E0ryngVzUX9Y1JbNv849yzrzi+cMoWJSzy1hSrHnJPwb2+m+mLa8+13o560DNU5nTYv3ZxlvquH6DyzQswe6AXycbn5wa+X24rXkIxmzl6YMevymjK1za6WZF342IfoWtXsFHXS5Kxjbg5WXCtKlTR3RExz9O1M5mPOb3L9zsIY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=dGjVKEKQ; arc=fail smtp.client-ip=40.107.247.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="dGjVKEKQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jrvq7PWOIvuQIugadb5gBUVTbJl7puj37XhOGN1PYGWwgD0PnNTjiGg0FqxfLlCR+cxRVLZ/7htllSrofx6YZkPEARayk2ue9C8I1BsZMt+iOQoByqmf/MqeWlaIzVjzU4wSxbpMkSnmmYILRfyjnM0fOtiKn/75MzQtS2nCOATOCiNNxjORIZ1x8Nw+sEjKTP0VP9OLJpPfEXz1j/m0Qssb7YQxthlTgX6mjq4oCFbK9PFNFDKtv+U5eX3mTWmWT1Rn3GORbTrJeHa8EywjR118zl16OASkm/qoioFk4XvA/aYCH782DKbP185EywY/HlC3qW5aek3DzYKhcCFw3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jbJhFalVVjVZfaH85BFHAcbOYeAEA0RMss+9Wu7fm14=;
 b=VsLWIIPc66wjTaO1FWjip3YYYL2hDIWddnKS0t90Cd5JNdC19Y2E2CCBpL9c38FTqrL06I0RtS+a4ZwR09DB0ifKrcrmpDzMWN580tJv3OALGtF5tqUI7zAOCYVYLsMERjzgeS/KNSgcxdDf4/3Z1kVo3vAG09R8824a8b9050hUFwaLWoZzc7WpQ9AQWa/0nhcbDW1r1NqVxPm9NNnY2BojAAUgA8xhNNpn9f7+nmk9zAYEhvh/s4m+Nm8OfhEO/cnZ2ZrtocGzxs4k4caC6qRVkwcvyqmaoR3aqrhbSUOToHMq3VZ5bCAoJmx3400y44CI0ewKdIjPGAeNy03JvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jbJhFalVVjVZfaH85BFHAcbOYeAEA0RMss+9Wu7fm14=;
 b=dGjVKEKQ/vrTfiQJsv4kJb6HsSVZSEPp6/LghedFtfa+ZDX00XI1FHn9QXUfUaS+Gps8of/4AgFkT+HQUoreIU/vYdrQhWlSgyprZ90AXclS22ffBYHUV80UHViFkX1LPr1iD5R9lwejbozcRkfEnKyHgvsF+XP0ymsNQRD0xXjSTF4hEGz+WmBdRt/dOQFreFtJvT9SZXVkd7aKdvbn58DzXZkM5TIjGnXWdlyyY9kzPHEoDbG8+HyOcvavzD1uCixyuE4IsaEJgx8ftmxNo3mEt4rTBFrK5BRX8pcF2/XkXUK52NHQPjwC/sAzE1Z0bAU2v0hNHKjBqv3/WKKlyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM7PR04MB6966.eurprd04.prod.outlook.com (2603:10a6:20b:109::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Fri, 23 May
 2025 16:17:58 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Fri, 23 May 2025
 16:17:58 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Stefan Agner <stefan@agner.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE VYBRID ARM ARCHITECTURE),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 5/6] ARM: dts: vf: vf-colibri-eval-v3: add power-supply for edt,et057090dhu
Date: Fri, 23 May 2025 12:17:24 -0400
Message-Id: <20250523161726.548682-5-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250523161726.548682-1-Frank.Li@nxp.com>
References: <20250523161726.548682-1-Frank.Li@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0003.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::10) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM7PR04MB6966:EE_
X-MS-Office365-Filtering-Correlation-Id: bdd10a5d-b19a-4d2c-e75c-08dd9a1561f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UoUXoOoJCnBCmdarfKerOloUOa0v1GqAyrcX5j5LFHY32tgfvw6dfy0I0JHp?=
 =?us-ascii?Q?iNT8UMiINlW71RIP2n81x4GX1knA6jc/5EJiwCA4Lte2u1o6rj37WTafE2UA?=
 =?us-ascii?Q?Ww4Ce4BKj8Gbuz2kXroLZbbIHdH1ftqWwHny11PdOZOOC4YM5pEFYSTnPIPQ?=
 =?us-ascii?Q?FGyibEY/Bzsk2Vs8jIX3AumYdS9GeWcuW1MmxSQWRHeL/APJDlqL/N26yAD1?=
 =?us-ascii?Q?ct1eNPr5mfJ3G1af0NSMf7/vJQB6RxcfAsOVp7OeN+giGk6TAQzoIHbwpMfw?=
 =?us-ascii?Q?EyUTErXX0E1JPRq2JwIZ0wX171Um5/lA6nuSxfRFIJOGuCkBslywyMG0AJPh?=
 =?us-ascii?Q?W1DtDG/BrC0Sa9R3jTlhuBxnF56q3Mj9kvdBoFiLC4lEub6BwA99Bj+Mwpeg?=
 =?us-ascii?Q?jMor55mMmwsfABKA1AWa3QgGO8GGCLrILXZ8gY1EhuNpigLrJ3M+cw5ZjGfV?=
 =?us-ascii?Q?YGrAqbXl42orR0bYGutp4CP5JwgYhoEYjtRZK0oodC2BySd+MSpYywwQUpGT?=
 =?us-ascii?Q?i3IroX+8p1iz7kapAnljHeozhgUqyJzEMfMcp9wcZzSbWsQaKPEVswlUjXi0?=
 =?us-ascii?Q?gGZVoFZ7Rw+q0Ail1eFLFcVuy9gWuHDjY3NTbV+no+6Y4GQhr2amNVQhLkyu?=
 =?us-ascii?Q?BQ3ytjyqhw4aT7inOsiQttov2sykWp66HSjlv8/913EyeB3Mg3zJGDbxKVrO?=
 =?us-ascii?Q?nRGBbgtuq+hGxsG824N+DNZ/6QvRd3Hw52L+/YcpUQlmvjsHSQddXJMMk/cX?=
 =?us-ascii?Q?W2bCuqvWL7ykxJKtZNbTHJS0rO4XfiFF7+jXQ4hK/Yi6d9BJ41VMmbXR1mGF?=
 =?us-ascii?Q?uclLVx48KyaCRT8N0ns3Lv8DIwpHWKuoA1N607elXOIw9MqhH4XTDpfHK7MG?=
 =?us-ascii?Q?gqFKA6kSAxwKHGrkOMhiiqOD2Hk14E+zW/O0egLqrdZLBPapAOYOa7zHmdaI?=
 =?us-ascii?Q?l41wzOVD3mjLiDFwEYrbPfzH0+kNLuvs+0GIRJhoITbNvmpgElWFpmbJIlbh?=
 =?us-ascii?Q?5ZmHye3WYVojS+7iiO3UChPIYFkDW94bGdybIjc4Fpbf/iLJx5xFkWxSnTVA?=
 =?us-ascii?Q?Vw5H3PWnpkTzDSdf83oJvBSJwImcx+zPZc6HmlZw8b8Gd5HY+ArwLNHSisP9?=
 =?us-ascii?Q?FA+AmQRc6qteWoNC1d3ET829o2tDVVj/BH4u6eAysIbzs5rDC+vE60/CRtcl?=
 =?us-ascii?Q?u1MRRz63OXLSRqj7tR3ETe0q3dE2RCMyMt9tlOYUIozSVSdZEDoNoktNaTab?=
 =?us-ascii?Q?TDuzgFCzCqzL2KGf8jLBs4AxaW7pvp9AjT/6MAv+IS4t10rHnudjLNUvha01?=
 =?us-ascii?Q?o7Bv4lBG56JHsaFaPaWtL3dEJkg0JsrTidYMLTT9TAsOgPrkoUeGoAt9558a?=
 =?us-ascii?Q?fN2spzBtlI5ipD6NGK+eTX4gl8Bo6+jvwXS8f3d+tjaJNmOBuN1cNWsH/NXa?=
 =?us-ascii?Q?MS76Ld7XDBxtvcg/WPC9CmoGJZumyrdK6bu7Wt2xUvdONp8FX0oxDla9xOPC?=
 =?us-ascii?Q?gvO/Vf0FWudmstI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?juzPDxzbFqHXz6a433QWJeB017tiWevA4T6gg0xckYdfT/0KzwWmMusDkZXk?=
 =?us-ascii?Q?uCJLyUpsH+Sc6vb/a8impbuhx7E9t11CkZnB6e+o2texpRVKdKavLbAPA1rY?=
 =?us-ascii?Q?fl9aFMrnawJYTPidPSWxYsGTS5drng1Qv0dGjps7tjjQxymaG195Sk1EZZdC?=
 =?us-ascii?Q?LOqJZWkkffa+UdhjdiZbqHaE9dH4SWCTYZieqvAX8I2QA+FvRO1AZbHHWeRJ?=
 =?us-ascii?Q?rQoimjCfBuaUMzpsoyVGmAuWcHN2YnNC4llPMSgs/jPYjdq+UMMxePZJW+2i?=
 =?us-ascii?Q?OLASTJeb0Lw9TJbV4WGD8b/GEtYZJoiPi14V6iBH2zm4I+/G2L+XCREG+Jw9?=
 =?us-ascii?Q?VFPz186EdN0Y1LCkVliDHN7H1dFYR37JGXuYJBBXV+h5a2IL9p657uo6c6J1?=
 =?us-ascii?Q?ZJ2zx1q1lamOYHBY3JmIrcxyYsnESOkTxSvxE6jf2FTNAwFjjwxDbINI4V6F?=
 =?us-ascii?Q?GItD7oHgs+qRJtuorr5OH0iEpAewVYXM9N8dlN7np5YDNvKqvfkC0EhXqXFx?=
 =?us-ascii?Q?qrFjpAdvHxP45716fI1buRSx7USP1zoadvaF9YURTQ1VDVuiVXiU/0Nb94P6?=
 =?us-ascii?Q?jFqXqX6fFiAYEaOPaStu1EcjfDxQkkF/TttKzXRwhBlobSu2k/JwM7J2vE1f?=
 =?us-ascii?Q?VM2zgjt/HmVTvkDWz6Fx4QE2GHNxW2QdAoJbXyYbMXVBSsVwjpIVYFHH2qGn?=
 =?us-ascii?Q?v89vVnZAL5EvyU4UvY4y+BU6Um6fo3QGQngOM2GKowiOKkvzVURdsPH9Wly2?=
 =?us-ascii?Q?c4dIf6tK+RRU1L46jpAXsFprMfpsuSL1xc2MVG5fdWn1qrpIRiqyIuhECuXr?=
 =?us-ascii?Q?JQMBJN+0FeoJPGeBDcj6nC7pfQWwJFivw15gNe+Ac2dClRGsmhcP6mhqan9+?=
 =?us-ascii?Q?bjsYPF+LpykS/liDKTG2kpReST3zACWHpVVBG7ez8aCJNsuUbY3QWY/txboB?=
 =?us-ascii?Q?4isvNbNSqISHYX+0a6ef5A3G5boS7VpBYI/1ItV8vRYXAW55jS3ymDZ7UimF?=
 =?us-ascii?Q?R5oGz715EKi9NAWze8WuaiL1AVGMR+KKW3GeuKJ/92VzsdAIUzJrLspts1Om?=
 =?us-ascii?Q?TDpgBUMw5eYlCUzMTSe29dny94mjtRroOpWEs202au3OrJjL7r57x6FzWjII?=
 =?us-ascii?Q?9v9AP+pMrW/5aTCOzDKizFb8tSFTotdIHVlIndJm5ZT6dxl2Ije/nnWCRTVI?=
 =?us-ascii?Q?dDLImQC02nu34Ar7in1BDfm0GLfWPkY4eGzpXkiBAe9BmvQjfk+RMZbYH3lq?=
 =?us-ascii?Q?RPdLROpibxffXyrfu9FNoEwnBx66ARyJH/jHueNuNG1ix2HXiUpHDaallDql?=
 =?us-ascii?Q?JpLhAoUlgUg5RcgCeA5zmbVzrhn1nuoUdFBkC0WhkVJpZkbhoUFAUSqqyj76?=
 =?us-ascii?Q?t84GuAgIpmHa4h/Ftoh4j3yrKKjLEW7oljD38JBFwuG4umgfTmc6IGGK4n8S?=
 =?us-ascii?Q?dPFcicSKLgkAD/XpbhSXWKN+bQA5tarfT99WERAStJ2VRp3+P3KJ61nASsJk?=
 =?us-ascii?Q?1OktKh1iA1yYwdWPqtFlBgRmYGP8o8QI4nFlF8vUBN6Ljd58fkhtH2glnGk4?=
 =?us-ascii?Q?saDAFKeVO+cXa0DcsbDMZ23cAiIVuRx7SZMJT1dx?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdd10a5d-b19a-4d2c-e75c-08dd9a1561f8
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2025 16:17:58.8599
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lGTrkhzMdfMPNltEjtvgMT0De9OAmXvRy/RAnXYDRp7u+Lge3XWKw6BBrB86QL3tj/XmaNLX4PuWVtm0T8x3jQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6966

Add power-supply for edt,et057090dhu to fix below CHECK_DTB warning:

arch/arm/boot/dts/nxp/vf/vf610-colibri-eval-v3.dtb:
    panel (edt,et057090dhu): 'power-supply' is a required property

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/vf/vf-colibri-eval-v3.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/nxp/vf/vf-colibri-eval-v3.dtsi b/arch/arm/boot/dts/nxp/vf/vf-colibri-eval-v3.dtsi
index 69c6647118e14..86c360868e4bf 100644
--- a/arch/arm/boot/dts/nxp/vf/vf-colibri-eval-v3.dtsi
+++ b/arch/arm/boot/dts/nxp/vf/vf-colibri-eval-v3.dtsi
@@ -17,6 +17,7 @@ clk16m: clk16m {
 	panel: panel {
 		compatible = "edt,et057090dhu";
 		backlight = <&bl>;
+		power-supply = <&reg_3v3>;
 
 		port {
 			panel_in: endpoint {
-- 
2.34.1

