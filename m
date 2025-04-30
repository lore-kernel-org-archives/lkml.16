Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2048.outbound.protection.outlook.com [40.107.105.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0956A264F9D;
	Wed, 30 Apr 2025 15:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746027417; cv=fail; b=eASEDvUGJoy4gegl2pYCD66hh5TBe/mQNCGEZ/PAQ5yZuX4IQ0WcqXOOUHNkJi9ngMWvgkovI8FZxv8zIS8jvn29NN/LwM0ijCvsU4XGMuseNd0JfL3QENkLoy+c5Vdg0eU836g8qIZ8u6qx9l9N/bikCOfzVL1DY0vbr+pN4Ok=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746027417; c=relaxed/simple;
	bh=8gCoh6ENFESGaPCtYhHHyYA4HSuundSCQxpK6sY8kS4=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fX8afxp5hX0i0jtaoZP8MS8UfX7IInFtX/pCSfJVTcc/4iI8WIBJC0r35yhdFvcOsBu3aja2OTg5/R9mEE6/xlvhQmeSnVnnbZ+zCNYZsXhmuhYKbAx30pRY7Xf+L6D4ibCDN2+SNjfMZvvz2rnKrPm9GewIJDAd16V3yEh1/eY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=KEk174T9; arc=fail smtp.client-ip=40.107.105.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="KEk174T9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cnTOjS+VmQjJDmFip8EBzyxQSt0oJyejujXCQE5VwFy1CldXK6vCLSt9a9RuZdH6xvtB17cS5dhJLIq2CaPAGHzgzLwe/a7tHoJmNxXYmZDx82Vt6V928zWHfw/i85z3XIUcIMvJpWlLUsDEYkOZxMXKYiebfN9U+RoXo0Fo4E/AZyl8NX0p0/SWCDEYV0FmTs1/wVyp1M9vhphGKzIQq41m7htBSptV7NIE0gs/dylu0/n025VUog+mWSn9rNmEwJZXBWGgNj/h/0+e1no/BrdOQ5aZZwg2OLpNyc/8fguYDHAzyRbPKLOsh5VvfsqMngsTYpwEziKRy1r1lWLgqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fir7xy+AO3BVnr92s8Ioj8cHIDtXS4Tzoe6yBV2ZOew=;
 b=jMLNQOwEjKrbr/bgbZVvMGNMFrS2gnenMSFIETrJ7KKEf3TvXjZCdHanP38ITjfqESX2uQWdT/elwWicxsHB4gTDmAR2KiX6+t2gcYOg2+HtK9tEQeqmvu4QwVozT9/kpDnYHX3EgZJn4/tmIfP7vKjOL/pUKgg3CyB/bFFqMZUsxpQEgSARbpEurW6HoenfzYZ/8g+c8pmRwb372g2ugMFFcgwEHOSu2y9lIo4gVIcusPtNd+J0BBofrABboMDsmnhLGSazvMYILsegQOiNnFTDKCrf0PCuaxZbzVYdm81NkRumoLm7i9iL7jnkmofp/jEZJfzQGJHt9Vpv1q8crw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fir7xy+AO3BVnr92s8Ioj8cHIDtXS4Tzoe6yBV2ZOew=;
 b=KEk174T9qLVKhNUbnCppSO1tVBXFwguzgnsILV8+4u3EcOluxdufc3FmjxtMC4rF8uIkgu2jUA1KpsCP9VmyvxS38uq6oFRUSq1mo7nAf0YnU043FIKWxCsq0ZmV1LN3wXspNsk09UuGO1SBhSP2DcgIUj115zzNlZWEkjwY8Fuwe9UY8aUtop4MD+DDJld3GP6DO6qP/OzGrt4CuGJozwZOkZ5FZOWScpV9iIwh6cAUlQ/vCYaoPHnABUPybydSDMbGBj0ZVA6LmfzxHeAc9QqvBd3q7B+wgKQOcfnXFrQRO0tTzkE5IJFhsay6GP69CCvW3cHk4xr6RsYrzQ7fJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by PAXPR04MB9665.eurprd04.prod.outlook.com (2603:10a6:102:240::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.29; Wed, 30 Apr
 2025 15:36:54 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e%3]) with mapi id 15.20.8699.019; Wed, 30 Apr 2025
 15:36:54 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 6/6] arm64: dts: lx2160a-qds: add the two on-board RGMII PHYs
Date: Wed, 30 Apr 2025 18:36:34 +0300
Message-Id: <20250430153634.2971736-7-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250430153634.2971736-1-ioana.ciornei@nxp.com>
References: <20250430153634.2971736-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P190CA0045.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d1::16) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|PAXPR04MB9665:EE_
X-MS-Office365-Filtering-Correlation-Id: 24ef8930-2e6b-4c81-aeb0-08dd87fcd5a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?W7uSiwuOH6kcG0oCyRTjLSJ4QuhMKH6vIm6V/Iaz84PBxFVFb3M+D+ITiSwL?=
 =?us-ascii?Q?GPH648fejeRz+1nHj1dH+TUhL1qeXAcWl4t4pLAlJQYmDGhHL12hbO7oDag8?=
 =?us-ascii?Q?l95fad9Lai0sjkQbQY7EcAjbhOQHtG6vbkeciYh+mrl8QYdqwp+V/yRc1+Pq?=
 =?us-ascii?Q?7i0bDuR2YegxR04TDvrWPgvYCqEPKQlzzI1W4n3TNJZpBaqbJ9IdtgVu9fBQ?=
 =?us-ascii?Q?+1/Xs6/OSDZKq02dDar0e/MleJK4hrCfxpDEJUjZ/+MewQX2vWXhshPGY2Qc?=
 =?us-ascii?Q?LA3RgoUKySpkpShfaj58lGAWO/BUwhQIqhwE+hRbFlhpqICn4TF/psZsmeNl?=
 =?us-ascii?Q?3Ify+/oqiaxwEBUrbrnS4OwxxvKfDvUy1OJ7000cA+chTFV3sYd3sr0uM+25?=
 =?us-ascii?Q?bRE1bWk17cYTvw9OQQtBrF3BNKWGJ2ZSMvloWMA8iUu3zttbPJJltzVgnsxJ?=
 =?us-ascii?Q?X07uDU7/Wq//A6WNhQSfbuCFmLBskMdbbjL5JSSUTBSWqcYL4e/2RWU67RVV?=
 =?us-ascii?Q?CKY6hgJa8o0NjYLhiSc0fJcYmUH9jhbm2IKz215DKZ3/sd8q7c+qjJlbAoBp?=
 =?us-ascii?Q?A0vvF5CeQ7bsR+hvqbeZ2rMTiQ193eWLnyRiWAXeiNEWFoNPiAsSGlfSTBvI?=
 =?us-ascii?Q?soe3m1crdH6vUSM35ZW6jWJydOT32j2ORKAbPazO18TWM+LR47U4AgBlk5Dk?=
 =?us-ascii?Q?bxA2SQszPiwfeKxGDaX+LSG1AlI0pzSQsaFPC1WlTBwzxA4PWyQSs5J1qoIx?=
 =?us-ascii?Q?foAJYwp3uibwHghcMUCN7J6qFNlC0MCl5PaKEoNl8/Gg3aFpbWyvHnkgaFFW?=
 =?us-ascii?Q?BNDhvH7LQnnBZ22qqqchrNumBWVkPbAMpcA4o/990rZlG/KgDMLZGNryXLYO?=
 =?us-ascii?Q?GJuIHgwLe13ZA8LB2evgzP5boIWhUtY5YPdKKB7sF2uZ24YNgylsyOCO8pi5?=
 =?us-ascii?Q?8jW2rNCXWz/1/9LyrTjAcoslVTdiXQP17uch7+UvF7dl4EE5CI62Cwtqb1Rr?=
 =?us-ascii?Q?/e5HnPyjdxfh4v+p3+iMx22/PFv7KFT0g4x5NafY38BVS0fEGeJqWiJIkIu3?=
 =?us-ascii?Q?otc7Wz/UwLLhnvFvTUxbVdkX0OmWpDmuS1xDfZXcABpQX0wYVYYQ8KFhT6Gb?=
 =?us-ascii?Q?67AtrxfUdwhfxae4xriijWMPoQvaVReJBMzjfJKVH6kjXGsej0hs0mBFQA6W?=
 =?us-ascii?Q?DwOQ7iGDLttjD7rMFUf46m3ZWSL07WJy+dh4cOaEzJzehaQFELhU7csdqu4A?=
 =?us-ascii?Q?SwW6hKlkc7ln8o6qNlEtCYFE61hy8Aj2gssp6Mmn/xuRgbXymd2GjJqbVrvK?=
 =?us-ascii?Q?NhpTZcQ39qjNqo0hdYqjEV7Ux/mRY4/vUMnAdYb9GznMT6k9PhOQjghbxwcC?=
 =?us-ascii?Q?BXI6+ZIv8vZg3bsksA4XkZuopjFsYn7Hjp7YD+4yKYY63NKY1KeBrLZg6bjJ?=
 =?us-ascii?Q?77eKneh/qIs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?m8HYcVxFJChyrpsMfK9gGdDWQ5lin6Z+yW++mroOjbohSFH+4ZoE5GqJuKjB?=
 =?us-ascii?Q?I/JqJqKof7msC49scU2dOjj2t8X7daGts9Lml7/q0BQ7bWeI7s/HfCs+aqdk?=
 =?us-ascii?Q?cLo8QWp6h2GdqrJXyWlwZ0gNgorOYrc4pnkKnTFi+vuEkWLAzohOQKgzls6W?=
 =?us-ascii?Q?lNUMxXpQYO7bNEFRRtZ1b4iUbcVrOgzwcJ3cjKKZGJWMoGUKYFjpS9NdD3Nx?=
 =?us-ascii?Q?dO3za5xa2D5y+d7g1XIsuu2rrhkKT1LGeYm6oG4TphJXpVoI0rIEvhgn2eIQ?=
 =?us-ascii?Q?ERZ9OJ1XV+OFiNBe1FBqeyuUv1wg4nip42w3kKYV7t5UI65x1fQ1hocQSX5h?=
 =?us-ascii?Q?cTi58N/5CMNO8XsnS8kAHq8szPfAw7QOeftItsH7SgGhSFUeVXUgx1mxUYK5?=
 =?us-ascii?Q?Zg6h0vj9GF1GqunXV/OkSbw5YiKech6G+L3OR1lnIXe1vrcI4eChW70Rn/TJ?=
 =?us-ascii?Q?lMKt0yYLOZPk1B/qKnjWN5aJB5S9Yv3SlzM/e/fhQuHUQV3S6WAdcC2M6DkC?=
 =?us-ascii?Q?qW0AhAOUzTyxQRmSDEgyzcBjD/K4nvWpjBCu5P43qUvM2qIhgZDlbMIjlKTL?=
 =?us-ascii?Q?sn/01KSP1lhEP6TphD5UlA4QiQRzLp3UkfDzpQS+Ityq0FtLgA/B0/1Hvz4P?=
 =?us-ascii?Q?mQkhmLT5hWWvvv6TEJjGe50Q4hS7Dp1udGCTTYz8j5+YKTmzknnNUBlF533h?=
 =?us-ascii?Q?jx7MNi2AZbxE6cqoBAxUVTAo23dJIZ09QiWTcfRLdD2mv5bTCSWsCrh9+PaZ?=
 =?us-ascii?Q?1PTthkaic/RE7OJWiopKFfu/bE7imKeg9Rd9q1+t7tHsinQVlt+JWFN1IFDp?=
 =?us-ascii?Q?KKdoGMcZeavHRkuA0bg4rqgM2PnpUW91m/JOnQkR1AbEFIo5KuWPvuTgWTHD?=
 =?us-ascii?Q?AvJigHPmmdmSH143ZENKT9MoDg1JO+GgkFQWe/lqWyCBqKfd3VcpUPmciL/6?=
 =?us-ascii?Q?sK8WXbLiJgg44MFpi7rlvzst+Bx57cTppVliNST5gvUG5/F/OJqF5IAz3nNH?=
 =?us-ascii?Q?Mm8HDoCQKRA729eW6igenaUolMayKrN9duQEXSfoUK/ccpVrqB5jGhoIliKb?=
 =?us-ascii?Q?fzD6MLOSwTvPLtKPy+92EOCCl25EhHn64WNE72FEdBSe4dBMV4JmfTOnoszA?=
 =?us-ascii?Q?lg5OZel7lXiUjKW7u8vlXznHf7zu3Tg4chYOo2uJkOWeV2KB4m63ymwZ/KHA?=
 =?us-ascii?Q?DB/fdoLz9K1X7XpCbaY7nkHsJLQMLtjKskiGdtoAM3H47T1M8HlU4BFqiqTQ?=
 =?us-ascii?Q?vIngEjVw85TVVUItf4hAiFE6Kdh8HFjx8dFCLDk1jPf2Nl5loUgn47rdnbuX?=
 =?us-ascii?Q?WyIgxzsfhno8XUnrpzNDH7jnfeO+8Wol7yk9rqpAvdWi8BuBKmC/+TwJkGOP?=
 =?us-ascii?Q?naYrsN1HZlRViQfJAvdTsampDk+44i0Cvx6XlZ7+mC4HqOEK0N4W24V59oPJ?=
 =?us-ascii?Q?UXxhlAv/QmLwjeQ2CH5PesYF8q0Gtx2vv775+Ats15qRZMJ19h6H7jXAygeh?=
 =?us-ascii?Q?hSw510yQvGA26iwNUbLMUtG/0/w969nbZ6sP1VsWuZxsc9iTS4T0jqZsMwQT?=
 =?us-ascii?Q?KKmmzbnZ9THpp9JZ/3nPc/4azDi97SvkPUkoKiOP?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24ef8930-2e6b-4c81-aeb0-08dd87fcd5a8
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 15:36:54.6389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /W1APlgilEYLTa7NEEamCDdbDUIcEEwiyFdoo+zBDYJE8bXOc3g58p8u3LyTRQ1paOJ0RyFY+YdohXiOy4UI0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9665

Describe the two LX2160AQDS on-board RGMII PHYs on their respective MDIO
buses behind the MDIO multiplexer.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
 .../boot/dts/freescale/fsl-lx2160a-qds.dts    | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dts
index d1db38d6a027..a40fdd949a8e 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dts
@@ -43,12 +43,22 @@ mdio@0 { /* On-board PHY #1 RGMI1*/
 			reg = <0x00>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+
+			rgmii_phy1: ethernet-phy@1 {
+				compatible = "ethernet-phy-id001c.c916";
+				reg = <0x1>;
+			};
 		};
 
 		mdio@8 { /* On-board PHY #2 RGMI2*/
 			reg = <0x8>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+
+			rgmii_phy2: ethernet-phy@2 {
+				compatible = "ethernet-phy-id001c.c916";
+				reg = <0x2>;
+			};
 		};
 
 		mdio@18 { /* Slot #1 */
@@ -169,6 +179,16 @@ &crypto {
 	status = "okay";
 };
 
+&dpmac17 {
+	phy-handle = <&rgmii_phy1>;
+	phy-connection-type = "rgmii-id";
+};
+
+&dpmac18 {
+	phy-handle = <&rgmii_phy2>;
+	phy-connection-type = "rgmii-id";
+};
+
 &dspi0 {
 	status = "okay";
 
-- 
2.25.1

