Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2058.outbound.protection.outlook.com [40.107.249.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9573D295506;
	Thu, 15 May 2025 05:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747286479; cv=fail; b=KDEbdenpEiUWjV0zyJyOo1Ovv2+Y53S6jj3zEHkdtPk0c73bBcumqV7CMOv4gosMEbTDCS8iaM43f1gnqzqmdMbAk62zmEPZfWd/nDP73MU2j4eH6anqY0hZFxjoDRkL+w2mUshWrM/E62IKmUQjDzlCc+otg7LOaHcD2ZRHE3A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747286479; c=relaxed/simple;
	bh=KZot17l59U0B7oFkBXJVUlJVAe/+ZIVb550K0sPAeW8=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AG7ksMGwyY7kDXAYkPiTfYBkGe2PCIekOv+yXh0UY/K5tDPP43uikIcHUS79kNs2pD06UdFy7uOcjSABo2caY9W1uq5NA4Mrazy3/4q6y51jTWPFdvPKAoWodF39/bMNfZJsIu2PL2c8E6PiFjm2rWYLYWZscqedMWZ6ABl77Ww=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Hl8cgLWL; arc=fail smtp.client-ip=40.107.249.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Hl8cgLWL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VbElmfL05RAYOqZmZVEwG9IfTxl1kdGY7uymLt139OOUj4tAoL0ec+WOfW4AaIVx50T38ZYY+Q+RSt85ZzxX0cj9BMEHzdeTsK6t3XRgIvID460CSasW1EryG38DVmFP4cRkPXVKCtxheHXY2JEjLSUVgipr2NnpE9ucmAAslEsaUD74AMYdwcYifY7lghwyPgRPVd7O4qzuffkFuChMqTMyPIgB9ND+8rFzA4lCyvQ7XiH1Hhr+U23tg/VOEoFBnwRk8+kpXwED1YQZyYiS9EfexIi6D4SKdWH9gjFx4Fc14v8nzDse0cEk1waeqWnmP59uWCynjqf13DiUWTUhVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8unsvvQZ4UVuRm0Nv4oATMatHU72U+C/tDpNHj38hsM=;
 b=y2j/X/pUIJ4tdpjSY5G99a8AlPcknkS16ppsYoJNY3xWb0s+kCqZB5Rf8aSpwWC5D4gWm1mNZ2jpNf6b58SdXj6tND2nOfej4eBuVaM0zmolopwolBeUS3eidlRCcNIB6nOXLY467B2JY22aCgM/7EN93p+nj7JgSpmjwC1cuFPuyHhSCUmX0jfwWth1LbF7s5vk86Lq24H1alLOwaFQeyRl7a2B74K+t5nVZNtCpoBIw7g5ZRpNXBQ2IiYD6hJImYaz6bYw3wwtYKUPyDWfbhS93DXnxKwvj3pCMqgoss0ZgnHu+Tmz7cE0YxQyycxc3HAhJ+eS2h8Hqo5R5fDRHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8unsvvQZ4UVuRm0Nv4oATMatHU72U+C/tDpNHj38hsM=;
 b=Hl8cgLWLXxXMJyfMrfqcu3IKmAS+tZrfWNLkYMnWefNr+lrkCv5TD9x9hOWBQJyozrwg8kHWt1JW/iG3D8uowWbPaCLyb3AkZ+wVe3UD5tiomGo9o9rVLpTwZbM1KHuT0mfCgyXucL/1sopUN33AUj/iL8oIoB+9Nm3xnx7s9pKE67uwdCvyD1hfOttengsQCWMzHDahCnvcEupe/xLAmx0EAl57CgaCsRK/e1c3AfHG2HEdOOQs2cXWTGQB1ykojhI3T5r6mvrFFWUoJVJFN0ZdOZpsyKg7E9EUqSD16yXNuxuaGGVvNwPzZTrqD1PfB99QvV7EwtjesETzT4bQgg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by PA1PR04MB10914.eurprd04.prod.outlook.com (2603:10a6:102:480::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Thu, 15 May
 2025 05:21:16 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%4]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 05:21:15 +0000
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
Subject: [PATCH 3/6] arm64: dts: imx943-evk: add i2c io expander support
Date: Thu, 15 May 2025 13:18:57 +0800
Message-Id: <20250515051900.2353627-4-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250515051900.2353627-1-shengjiu.wang@nxp.com>
References: <20250515051900.2353627-1-shengjiu.wang@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: ef24e2a0-0fa4-40bb-319b-08dd937050c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sdvXUgxbEvVdmf5rZ7Yvat3FzvuCUqwDc8aw7/zQpHAZ41hvA78Xji5e8Jsu?=
 =?us-ascii?Q?Aa0qrbKzIpY58aUXFfQvcq7xYIVzufFcFr9CazJTmfDy5/b6ABb1tHuMme7o?=
 =?us-ascii?Q?VLB6zu4HzUzfu/QIJra1hb3NzZaO9BvpMp1cL3eQbrfofZzfob05Av2sPDkb?=
 =?us-ascii?Q?p3pMIj67xT56rgyCZjr+fnyZ0SISzDlGrtx7G8VlxOmnTAIHcAUkw1UDellZ?=
 =?us-ascii?Q?kXsclqaaSMaoZVOvyQq4tBWxrz+m/8T6Aht5+GTORzzZtKT8FklzEdsqoqif?=
 =?us-ascii?Q?LiM94aAlzmuCWOYe34VQCF9qubuZElbAIUdoazYknOGxDqdtfuEsYICYFpFZ?=
 =?us-ascii?Q?Ltqw6qPd0grnSK+T3NBz4r8GGLCV4/C/S28t5l1sev8zdqNalJHVYeLoIhI3?=
 =?us-ascii?Q?os+33uwlML4babwI/apDMdvr5BhNKCDKGb8vB9GF409KJ0jE3i+6iE9j58AH?=
 =?us-ascii?Q?xK1GbvCM7YP7VMLIPhfT5yeB0CGMmfMgp7yiKwOmb9V3iNvZYOZd6UsM/kfz?=
 =?us-ascii?Q?mH69LBy7vKeHh5SScs4oQeP3HpKVH4jtmwrKhdP0Il7Ghl1RRq0QqKk/39G6?=
 =?us-ascii?Q?zVEzCKo3nqMrh5Oq+lF390yWNnnZyAjIT7bRe9HGGzL/mbCdTCdsG+qPeyTa?=
 =?us-ascii?Q?1Z7Awh69s7pmTc67RSWIB/uNVBZslzoESNAvSpRGxzvRzTyYd8jqEf2CGB8X?=
 =?us-ascii?Q?1PWHDN+W/uCBfdf1PagWu6NJknvohSUGTt7A8rfsAFpbaGXlriio1AA4UQg5?=
 =?us-ascii?Q?MbAdxckdTmab0A8SvI+VVq5A5CqTd4nEOUl9F5SkkO9P3VCPIiYI/6uQNgAI?=
 =?us-ascii?Q?XjZBljCZvLnZKWjy169Mm5kF8KU5cnEKaNEf6zprH25PXNxjBNkS4a0gZlwz?=
 =?us-ascii?Q?FSlFsL70qrDregb0Sr7cr+yfkI13/sWEuw6YYc8uNl6IsUEEsRxYGoE5vHK9?=
 =?us-ascii?Q?6netvuyUVaW4R33fHviiE5Vbc0ueUnQIYcVdMFb3hZzydNYnT4/IDHnHULWS?=
 =?us-ascii?Q?Zja9X0mraWi2tM39CojPxPtTbl1yxALF7tZfhCzRJni/NWBF8BQhO8TybLDs?=
 =?us-ascii?Q?Jxfm0XINHUKFtp+GHF6kEJqwchT/SqbLb81EIApkh9sO6z+vrhjcK1bGXG3k?=
 =?us-ascii?Q?yifQNjLhBddPCNHfLa13Lu0uBomGaO1kefaMeA+D3/cKQRfhbMJ7ARTp8XHQ?=
 =?us-ascii?Q?4Y/UJziI5K6jkNffgisvB1JKXNo1Apeg9wx6pveYEIfJzSDtxjLTaDqMp9Mm?=
 =?us-ascii?Q?lNVtCEBFcloLVjzdmMQRfLn49Okr+am4vgUe7gHISL4JV6qgU0kx1Q7tklim?=
 =?us-ascii?Q?3Ko26JZFvfOIA+R6VJmvrGVE4HWySkeBWzT2Pxo1CMQW+MIVlbn0UXpJOi1y?=
 =?us-ascii?Q?PWB/pnS0jEs2XIiSVNVE5Pw4H6WP3isnJRGDAl8+vpdo/GxioTAgheQRM5uX?=
 =?us-ascii?Q?ZIicx7nGO24UcM9vAs/fos6FHxB3zIdhuhmeWbck2X3bY7CZB+dH2JTJ7Um0?=
 =?us-ascii?Q?e4+QJwWHoYeCxCs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QgCWZr6Oyq0/gFdjDY0bweBeDz5+ZQY1z0tkQEjRsoqOoMhoVqZCjtQg97fc?=
 =?us-ascii?Q?rmge6Rcv1FdDgCZzD8TvV2PrtVQMoanOv0cFtWVLAuwgtVl83tBji5+WHEnf?=
 =?us-ascii?Q?x2zkQc++SDpgJke6PIrgmAEg9Uuw3PhsXjB2z8V9bVIPmhDcAtCaatESEWXu?=
 =?us-ascii?Q?gFmVn2OSJXf1RnpUPLLVrpjuz2waPuYh8pfNxrsqrgPiNpiagrOToGRMAa8X?=
 =?us-ascii?Q?31TPwuV1q+/oWBsBg84srWzjdk6fnOZHMQBsNpqEhk0QY60KTBpMn8dW9HGW?=
 =?us-ascii?Q?cTu65EqK7x84D6mAKM5X2cVa01D3BReE+e7iZnOuySXee7dGhNGsEpnh/owp?=
 =?us-ascii?Q?IEY2IV72MJhFF5r6ApfHHowjQdGT/+zgj8jls/iFR5/3teJMLxtEOmgU+FjW?=
 =?us-ascii?Q?zmloCBnl93EEyW6x3BfWTK1UTaa8GsPcwSgTvsnkqzOt4B6jYhRp9OE1YFxK?=
 =?us-ascii?Q?FTdB7WFnVQeNfnDyiCKRbiZx+2hQjzSdPFGN3imTxrX8m6vvPhllz6KKscpy?=
 =?us-ascii?Q?7CkvRqAa+146zNyw7sTUK3HId749VDKiLGH8QMvn79rSl19bHTUmvFQBDX8j?=
 =?us-ascii?Q?RJFL4SbFyICiJRLoJXP67v4UG2bU553gimoU3sV0AZCE8QuYistbLNV9Cvmy?=
 =?us-ascii?Q?dwNS3ez2NpjYQp0G7xRXbvDoszc0V/L/i0MDqWIpPh9sNK29IH81NZvKfDUN?=
 =?us-ascii?Q?B5NzknmMiQ1LteBv4RyqublGWKRcxtg3wLNKg/obiUSOQH7Neoep4C3Nrj0Q?=
 =?us-ascii?Q?DzTg6d/wSE3YAPWvJHsZ/M2lPhx9xBRI7HsdCNXqG4SOxLhtZ7inNUxrNo7J?=
 =?us-ascii?Q?D3/lDrKqY3eoNZZV2uCzJS/Pa5n0FxSgxGNRKijimkLNd5WDMvZt4yyFxXTI?=
 =?us-ascii?Q?RHBPvpMcBbqh8stVY2EG4q1BnkMlY7od8y0C3/EKBxwynueiRnTWa4r1FOHR?=
 =?us-ascii?Q?1QRbypUVZi1SN7Ta7WSBCqiTpg0i4um9g3daZQghUx16la4Eg66BwHQhXr0Y?=
 =?us-ascii?Q?2CXwV1p79Y1PxYo0P7Was3n0c0e4Z5aTMGltWtxR9QCdb88GYLv9J7+igBLO?=
 =?us-ascii?Q?+3aceQ7bSHmh7gxIcC4SEkP9o6hzg3+/icxTSMyqSIGg4EaTyVwEgieDwqhM?=
 =?us-ascii?Q?SxGRvpSnQipHE0aWB3eufgQznjKrUp7r9c/zlWBlCVGna1lN3SePT9SFN1wA?=
 =?us-ascii?Q?4cQ6yohzzVxkjhkpzW3Jwr/kgCWS4iJZ4Z/yFA/fRWHE/51uyDFHDSE5ugw3?=
 =?us-ascii?Q?Pa7CUv6OW0Kxai5+UEfp2GpbkTad3maUN9X+QqXoI/ADctBoKUqrNii50KuW?=
 =?us-ascii?Q?t1SAuPwHGUzexzb4oDum+IekDUfEvK30/I6EX7yOTIMWkHO6ZC0VMa9D2kI/?=
 =?us-ascii?Q?87NKIlcP19ttY+F/GQJFQndRSfdr3H5G9m6Uwyttw84dgE1srNSZVj0zTD2r?=
 =?us-ascii?Q?rTPO5reZPsDFTp9Cp/3l6fR9xVQgQiPVbiEmAmHOoyH4YK7xzcDt00XUtfQl?=
 =?us-ascii?Q?xcNpl0JHqSKUfVQnPZVZFuMX1g5aAKAyzq/gtYzvBYEF7K6nz4dx4c+w05da?=
 =?us-ascii?Q?lLBhNJmB6WllDnxZYs44IbC+ZnCzK3uJixKG7zsh?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef24e2a0-0fa4-40bb-319b-08dd937050c8
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 05:21:15.9374
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zOntW/9Z5sfD4H/D8MYnXiMWcnjLDRygyfxPxZGxPX8ew4cj8etMXHrvLK1FHCkelbBSUKeApDzp6T+lZNDNFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10914

From: Carlos Song <carlos.song@nxp.com>

Add i2c io expander support for imx943 evk board.

Signed-off-by: Carlos Song <carlos.song@nxp.com>
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx943-evk.dts | 105 +++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/boot/dts/freescale/imx943-evk.dts
index a566b9d8b813..ff6e9ac5477f 100644
--- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
@@ -62,6 +62,13 @@ &lpi2c3 {
 	pinctrl-names = "default";
 	status = "okay";
 
+	pca9670_i2c3: gpio@23 {
+		compatible = "nxp,pca9670";
+		reg = <0x23>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
 	pca9548_i2c3: i2c-mux@77 {
 		compatible = "nxp,pca9548";
 		reg = <0x77>;
@@ -102,18 +109,63 @@ i2c@5 {
 			reg = <5>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+
+			pcal6416_i2c3_u46: gpio@20 {
+				compatible = "nxp,pcal6416";
+				reg = <0x20>;
+				#gpio-cells = <2>;
+				gpio-controller;
+
+				sd-card-on-hog {
+					gpios = <13 GPIO_ACTIVE_HIGH>;
+					gpio-hog;
+					output-high;
+				};
+			};
+
+			pcal6416_i2c3_u171: gpio@21 {
+				compatible = "nxp,pcal6416";
+				reg = <0x21>;
+				#gpio-cells = <2>;
+				gpio-controller;
+			};
 		};
 
 		i2c@6 {
 			reg = <6>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+
+			pcal6416_i2c3_u48: gpio@20 {
+				compatible = "nxp,pcal6416";
+				reg = <0x20>;
+				#interrupt-cells = <2>;
+				interrupt-controller;
+				interrupt-parent = <&gpio3>;
+				interrupts = <13 IRQ_TYPE_LEVEL_LOW>;
+				#gpio-cells = <2>;
+				gpio-controller;
+				pinctrl-0 = <&pinctrl_ioexpander_int>;
+				pinctrl-names = "default";
+			};
 		};
 
 		i2c@7 {
 			reg = <7>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+
+			pcal6408_i2c3_u172: gpio@20 {
+				compatible = "nxp,pcal6408";
+				reg = <0x20>;
+				#interrupt-cells = <2>;
+				interrupt-controller;
+				interrupt-parent = <&gpio3>;
+				/* shared int pin with u48 */
+				interrupts = <13 IRQ_TYPE_LEVEL_LOW>;
+				#gpio-cells = <2>;
+				gpio-controller;
+			};
 		};
 	};
 };
@@ -147,18 +199,59 @@ i2c@1 {
 			reg = <1>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+
+			pcal6416_i2c6_u50: gpio@21 {
+				compatible = "nxp,pcal6416";
+				reg = <0x21>;
+				#gpio-cells = <2>;
+				gpio-controller;
+			};
 		};
 
 		i2c@2 {
 			reg = <2>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+
+			pcal6408_i2c6_u170: gpio@20 {
+				compatible = "nxp,pcal6408";
+				reg = <0x20>;
+				#interrupt-cells = <2>;
+				interrupt-controller;
+				interrupt-parent = <&gpio4>;
+				interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
+				#gpio-cells = <2>;
+				gpio-controller;
+				pinctrl-0 = <&pinctrl_ioexpander_int2>;
+				pinctrl-names = "default";
+			};
 		};
 
 		i2c@3 {
 			reg = <3>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+
+			pcal6416_i2c6_u44: gpio@20 {
+				compatible = "nxp,pcal6416";
+				reg = <0x20>;
+				#gpio-cells = <2>;
+				gpio-controller;
+
+				/* eMMC IOMUX selection */
+				sd1-sel-hog {
+					gpios = <0 GPIO_ACTIVE_HIGH>;
+					gpio-hog;
+					output-high;
+				};
+
+				/* SD card IOMUX selection */
+				sd2-sel-hog {
+					gpios = <1 GPIO_ACTIVE_HIGH>;
+					gpio-hog;
+					output-high;
+				};
+			};
 		};
 	};
 };
@@ -171,6 +264,18 @@ &lpuart1 {
 
 &scmi_iomuxc {
 
+	pinctrl_ioexpander_int2: ioexpanderint2grp {
+		fsl,pins = <
+			IMX94_PAD_CCM_CLKO4__GPIO4_IO3		0x31e
+		>;
+	};
+
+	pinctrl_ioexpander_int: ioexpanderintgrp {
+		fsl,pins = <
+			IMX94_PAD_GPIO_IO45__GPIO3_IO13		0x31e
+		>;
+	};
+
 	pinctrl_lpi2c3: lpi2c3grp {
 		fsl,pins = <
 			IMX94_PAD_GPIO_IO16__LPI2C3_SDA		0x40000b9e
-- 
2.34.1

