Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010065.outbound.protection.outlook.com [52.101.69.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2181E9B04;
	Fri,  6 Jun 2025 19:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749236518; cv=fail; b=Q1AhaeMqPDmj/kgxbvBGRqXq21bohnbslnPHt7CDA0Np3CAcsi2uigHI8StipG29KnuWqvshCMYshDbRpsS2gFpPVTO8KoofQF/rRMTY3gAvGjmS8MUJ+7wmTieOO42rVhWcGDaPAg7rL63PpvGVG+TA6dyw5wMaV1P2PseqsmA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749236518; c=relaxed/simple;
	bh=prA3DpAWXS6sYxjpjalZ0ana2R+n6ZU46ro6sLXIWVM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AT74JjO+pfCt3SEMx7YYYdrlDhIsbHaZEw8IgBu6xiWUEoZa4Ful3q2wLIE+lp1JqWkDOc0flsrm+0OOh+4nPXPJwgoDOo14Sp3PYNVp/KeD6iFiVu6Qak1BSau7qJdInlaXn2O2SjPa+MyKFu/kPb22QaTUi1HIUKd4ei1Pkk4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GR0ix0Ss; arc=fail smtp.client-ip=52.101.69.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GR0ix0Ss"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TVmHHlcltIcugzFOdfPbvy/vPWELb42JvfoR+T4+quE3RwhgWo9qpN6ZoFaIaqSV6teeGUNjPvQr0/jzCiNT9VVVwK+GjdMQ2IPT/n3M/FRmUa+DzqPNfmAPws2jnspoJbv/Wgnp/8HXr5TuCHLkSbpwtfMbSY5MSnGJ+ZXNHAV/3o++XO8KOVdQiagOV+rXjxm1uO5EPkbarHsyXVh9idTxc9zGqqNoFMqt/z+475d/dFCa03bJ65/q2+NuqJI95YjC40VaAHmPp7Km8i6H6kFHrL3ojaClH4zR88p29v/0MiDxhJtWxSn518VC6S42QO+1ryaPSnqSlEM9XVvoSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=94UVkWvwY0AiTboaqxocMlTTZJODzybpo3qo+qegR40=;
 b=zHRqs0Cc0DJE4XaXOdsQJlqlYEnAUeCPtWw46zZ4u2Dj138okFpiPSG+m0y/KIpVz35s0p6//FBxbn/Igd6KvFDGtlbmFgvwGOBwhfGCx+xoer1g6O0iVzysJz3iJCznaad+oAgq9P65cKNryzFXeHavzByluKUE5/aIrP9Yb/v1FmBJbXcJlaYhdpmIwoOt78czVtsFIq9PPI9icOWV1XdXfi9xQ4oijUZNpDjc+dZObagddaNg6s0h+b+nJN4TY1zHusNnzTM42rdyms0mtZQOEE6DfiCXpciCmpQskbIDWVV7Ai8kJwWFFVoU1h65niejh7JN1ldZastDSVKdzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=94UVkWvwY0AiTboaqxocMlTTZJODzybpo3qo+qegR40=;
 b=GR0ix0SsHlP1T3RNhq+kVkxkSYy/UVf/Goq4nJnmbxl+ABBRHzZpDT55S4TrqOwqaFl0ejQhFL8H/hGgrF4v+Exr8ftrRCxIqXFssn0laYEacc1iFCuHpcAh6ILqjdUishm+OAZPLx6XSyQXzQZ4j76wRvV0/F9KDTsaGUeLYUbWeUVQttuVl6JCciJb01rg9iZmcHZ1qKv/sKfCe/Ul2v804fFchAEK+55VdYaLTgJYrK6t7YLweZeatFEHifZC+ZMWYcpd8Y8G1u8IjorsHJukPXOvAJFeBn2f2BhoGWyHimgZxlcjV4kCQbXwdAcaFL4UorPODjOW1Xi7iN1IHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DBBPR04MB7563.eurprd04.prod.outlook.com (2603:10a6:10:206::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Fri, 6 Jun
 2025 19:01:52 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8769.025; Fri, 6 Jun 2025
 19:01:52 +0000
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
Subject: [PATCH v2 2/4] arm64: dts: imx95-evk: add USB3 PHY tuning properties
Date: Fri,  6 Jun 2025 15:00:42 -0400
Message-Id: <20250606190045.1438740-2-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250606190045.1438740-1-Frank.Li@nxp.com>
References: <20250606190045.1438740-1-Frank.Li@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2PR07CA0007.namprd07.prod.outlook.com
 (2603:10b6:a03:505::12) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DBBPR04MB7563:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bab507a-1fd0-40ec-3442-08dda52c98fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hOvmXhMOlwT+Ine+zAeYbMKdIpGYsmZr58as7LmDqgTb1tdrXUrZmtV4CqmH?=
 =?us-ascii?Q?JsBpguZjab3mU4OqzWnWdeBqlmCd9SvKMYpDeHtLO4tDMNPI4u1ckZb3hjQg?=
 =?us-ascii?Q?ykdDN3OJPB4dZu5ynkGNyWmIDdKs6iCILZAAi8Eg7HO52pbkZQU1hP95sptO?=
 =?us-ascii?Q?K3giOhygFe6XI9ji4wXlchT9Wnvqty33kePDHNMFyZyRXX/3omGFdS5KLg2J?=
 =?us-ascii?Q?T+GwOASKzh0uNuKWwiV7LMbXch5c9Q/FFqNJKwopgfpINJeD7K6NRsEc3J8W?=
 =?us-ascii?Q?EU8T+rSkPz6S7BhZJya84Q5CRj0x+cSANeluwFn25TnQgykgJXCpp1P2g3Ee?=
 =?us-ascii?Q?DZr8A+RyXZyYwUXNoTAs+ZyK1yn5wZZel/KQyfqMO1PaBPEhyygmeT0pZkQB?=
 =?us-ascii?Q?e9Ss6qujUMyBz6TwVt1p6YrShssLjV46j3TeT6CfRuuTZN338sBg7YhWuY/R?=
 =?us-ascii?Q?3VQMcK9HkXoFP7i48oHjEMnb/oTzfYi2dAPVNTAiuVkL7bS6HziQ+foKqcYN?=
 =?us-ascii?Q?Q4Wtc4pp2MMbKkI52T9DMSaPZzHdTJ07kNJOjLzlfnaG/A02JK7f2cAsHyRn?=
 =?us-ascii?Q?8x0d8b7PmmDE3HONiQZklOCHFdT4GggkIYqC704fRpq6cufp54ECzpvAqpBZ?=
 =?us-ascii?Q?tV7oVlRQsiwv52DJJc1FAgrHTrD0WxCtyTeyyDcaz0yWarloQkoGey74gnjq?=
 =?us-ascii?Q?eWDxVkg+xtj+2g9o+YZYQM1UTEJoQiIeK+4Tk2jKA+jYSWwTn0wkFYM1ER4G?=
 =?us-ascii?Q?RW2CqaUFM7lwEVMMvVGbhBBUD2p4HbQ5wny3AjQMBOJbJ5t+b9ScR21D2Y0c?=
 =?us-ascii?Q?K8bRqjjug1uqLu7qy1BZJxfd2uPdqvQNOZwRi391njHjRNHdqDhXiPED6P+E?=
 =?us-ascii?Q?525Tjp2C3krCoqULiqL+9N9dsGvYgHCnLzSHf339U58Ng1z4NtVfVVEbBJc8?=
 =?us-ascii?Q?Npv0OzSbomz3U+BIyOiuUS7AWg/svA67eNO0yfcVBp5zfTy653GdsAWeeWb1?=
 =?us-ascii?Q?M09gWejdeYLoL2EHRUwbU9NDcvvU7vTzYpoFVTPtwkm6MJplGQP25HBmTrKe?=
 =?us-ascii?Q?t/OY+6BrtDTrMTEK61xQ41wiglLRs7d6Cr9FnThWKIpYv2q20t/EFUICgf4w?=
 =?us-ascii?Q?K5BfLs9d1o6WzYuHPrQ2hQgS1FBrLiOmsdmKOylahgD35v8TqTdQvGmexcf4?=
 =?us-ascii?Q?/HOEqMNr3eL+FqKY2ljWq9ZoXdzeUxMKp0XHX5yVfrvp3cF2nVX/qbnoftM+?=
 =?us-ascii?Q?570Oe2HtCQKnS7Lip7/duVjIBGzq40Cun9TKFPX4kRrJ4aeSL/O1md0kjOQD?=
 =?us-ascii?Q?YCBolLAXX6xgPrg43AzFy0mv9hZm02hL8PetflFiSpw2TOjYG0sM1DJNRTD+?=
 =?us-ascii?Q?XILyqGLTS76tmeaUFzhPSzR/qY8Rq5YDq/QktM6F9y5Zm0yrb78DxLqwuAGY?=
 =?us-ascii?Q?/rPykfuT0a5euFfN2MnS/AVQVeR2YGcQDuUHpX3PoiDfeP8XXbYqDav3npS5?=
 =?us-ascii?Q?ZLb76Bs433CwMBU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9C7kcZg5QFdPnnW4ACENGMVS5CT4Wq5EoSo84jBNW733iby0U3jql3rFX51l?=
 =?us-ascii?Q?jjQ46dQAREaoY7gThSStqfe0OfErfcrGpruWiHwMCdDXIF9KTBfWktLwRNGT?=
 =?us-ascii?Q?It3bSHIPRZ1uP9FKnzgzp8u80Y6z5GKNWSji9vCh3gsxWUU10kFe3c+dOqsV?=
 =?us-ascii?Q?BJaufY8v3bmCjS6MKHy04c39Z+ejFGoYV4iiFlchn6q/i3MgTdpencrP3klJ?=
 =?us-ascii?Q?llSVs/WADtnqOaFz5zi9NyzQYqfV5K0KiHFNCKuTJ+Hqumb3n9wzYSOSfjGy?=
 =?us-ascii?Q?8qc+JNSSlziC6zq7QvQ1uO1W7Z8DYaDuXLDFuhBuLRzMWrW/+nMvWLDPmISB?=
 =?us-ascii?Q?DcOWz9c/tWuUczrGzxfB5cQ3D/a6We4qIKr4luRbrQKI5C4NCMk3GR7LU/9B?=
 =?us-ascii?Q?PJ2awLmB1DUi3xVsjJbUSfZ4cpHb+/1OvsXZSaW5cegrL+Eu8IM9C9jDc5du?=
 =?us-ascii?Q?qNXOH8UJk4QcTKzFRYCknFs56tzTW8D+eHr91AO/sfc/ypm0AmMOb6sPXMLL?=
 =?us-ascii?Q?HolUFhKZSScTmvAWtM7zn0UcOHl7skuPScVkbIgXEA0nFzopoPkb6RmuIirN?=
 =?us-ascii?Q?y9Lc3pgfE369+45P9nYqbW0wfhctJBsu5KCyTwyuSEpUuuMkpjfFCkruO1qe?=
 =?us-ascii?Q?h6LzBQl3ObmWo5p3D/963hBs8rqk1bbz6sfPvBlbjEXKhEDhYEpkNkyODfZt?=
 =?us-ascii?Q?AGxzjIX6TkN0X2OyyrPD1f66FNMlAO/fJSoR7j1PMxo1pZPhKDXJRfgX5rqz?=
 =?us-ascii?Q?J6nqXmeiUnn1s2zcBfuyoMhG1hAho7jnSivMZJHdMJ0ZMdFH+i1zjHUY1WlN?=
 =?us-ascii?Q?S8ExIZVK6Qx9ud8jyBpdFHa3rDEB8Kaxs/ciu8T5mqb8wiuz94dxi5TH/C0f?=
 =?us-ascii?Q?KaYYV2WR3eg8ENYyE2oJCU8Zvvb42CBVgbjZMKk11zwI09SFQxKemTkt9xzh?=
 =?us-ascii?Q?i40g0TemrQQeckyiq/Z/DQP12lx6ZAWI8UqHw1F2/gIdtb8KmnbO9ysEM8h3?=
 =?us-ascii?Q?ejam8EzF+RjLpU2JJe3ZusMw6vQFq/qzWDVarp0BR46Xy0axNhGE6yui4oML?=
 =?us-ascii?Q?RfBLHTHkGYdnNcn05p1st536Ka6YJk3+qp8gjkM1KC2HQYnErI6kVn5Hpuhb?=
 =?us-ascii?Q?obeTvdmeFkfwPbjptsE++oizBD63pFmpY2F+bWS9rVBDfXpZy5kWVNEFKKlZ?=
 =?us-ascii?Q?HmHUSIk82g9/sUJh58sViOu3Yg+8ap+VQQfZxaMfK2lNML9pcOeWIO/SAaDp?=
 =?us-ascii?Q?tuEpKVZhDw/WowMLAAyQ+RQd0adHF80htLNJWPDNLqAJf9FJNhPVelOipy1z?=
 =?us-ascii?Q?W8eX4rmxfkucVYOgED64NGdsdY+E+P1hbIby7iXPEzH5RCiA9zvwEyWahIBV?=
 =?us-ascii?Q?XtUPj76aiskMnILEGwJEMM+HQoNM7jOsjJitkfYehjiL/OQPxooJCiiYTGek?=
 =?us-ascii?Q?aaRDaj9FXggwqjPg8opspyQmoyY3Ah40p3zlwqTqiL/EtJ2b+SzObtH2EC4k?=
 =?us-ascii?Q?J/USAXZKZzEaqQQaJ6KYU6sUxLAWBG92AYqTmCVDopBJnJHgW9yJh0l9zIIr?=
 =?us-ascii?Q?bX+LhfsQ0vFQmlQYCvmDR81WcKHDQKr/7DlMySxL?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bab507a-1fd0-40ec-3442-08dda52c98fe
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 19:01:52.2382
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1gcyLfr3mxmpUxaqlCO2a8WrFkxaHW1HImjWOYfsNpx2h9E2O632qtQYisnlhV99swS9kUk8C9Cg2jw0CKcbZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7563

From: Xu Yang <xu.yang_2@nxp.com>

Add USB3 PHY tuning properties for imx95-15x15-evk and imx95-19x19-evk
boards according to signal measurement results.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v2
- none
---
 arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts | 3 +++
 arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
index 6c47f4b47356a..e54f3b982127a 100644
--- a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
@@ -1070,7 +1070,10 @@ usb3_data_hs: endpoint {
 
 &usb3_phy {
 	orientation-switch;
+	fsl,phy-pcs-tx-deemph-3p5db-attenuation-db = <17>;
+	fsl,phy-pcs-tx-swing-full-percent = <100>;
 	fsl,phy-tx-preemp-amp-tune-microamp = <600>;
+	fsl,phy-tx-vboost-level-microvolt = <1156>;
 	status = "okay";
 
 	port {
diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
index 5d85849e867fc..ea70ef4e85690 100644
--- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
@@ -615,7 +615,10 @@ usb3_data_hs: endpoint {
 };
 
 &usb3_phy {
+	fsl,phy-pcs-tx-deemph-3p5db-attenuation-db = <17>;
+	fsl,phy-pcs-tx-swing-full-percent = <100>;
 	fsl,phy-tx-preemp-amp-tune-microamp = <600>;
+	fsl,phy-tx-vboost-level-microvolt = <1156>;
 	orientation-switch;
 	status = "okay";
 
-- 
2.34.1

