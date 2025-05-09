Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2053.outbound.protection.outlook.com [40.107.22.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0037322FDFA;
	Fri,  9 May 2025 15:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746804619; cv=fail; b=J83TNKhKEepQZqMS7VKGjeK8eUn5aKw3KCf9ji6vco6y34rlYKVlvvO+snc0rDUGLmtVVttjmnOWBQN2fms0/66Nn5cqyYK80WrIxvc12w7MZG8KG+7SGR0fD2zVqxW84S5vb0qLFzeN5qdQdwtYLrcoDLAvAkFjlMO7KPfMiiY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746804619; c=relaxed/simple;
	bh=t2Ro1dOh4oOg24tYlxpzXxBHqk5NExl9ka2IE1hgIZ4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IjbtHvfHFCH+3t+sUndAPF10wUNoRnrRjqmMDs3bBOmur58/g4T4yl4LL+DEZouGTnaoHXNCW5fEm/H2y7B0ccOP2DQG4Qhgjo3qD1PfqROica/mtNjbCGKp9C0/JaN6blZkomFFP+FrdS38efC4LSd3bb9cXosi/LPxob52YL4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=F9khxOvE; arc=fail smtp.client-ip=40.107.22.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="F9khxOvE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xqC/28oDlgz67YKYgCwLMFUh4fwaeYdw1K6Y2BqADZlOYRggufBn6Z7SPbsBiiHoKmJxtKEem+kxVhvp9YLwYAKszP/m+K0PvNRIQqOF0OSAzx3UHpWLnyBhxOV3Xj528EJBFSaPbVbiH9r863b0PL476m5X1Q/w9U2AzlQs1aW8mXumjgJagve/HmzE4Az2lj0a2kyIoXo52Aej9eEgRPkBJeHUqCqbgjK2ONIDE3SHr+YKhhtzqjnM65io6hqyqI4AQ/eGpCaUfbfDx3q12IvO+xYlcY2PPthKkTNUqp74ldNJFu0TZ+zH+r7xKGQHeegPqI5xxfqi3t67NsnVnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=86SfYbVl1SYoJgyGPyMz5a0ERxtUwM0woM1SYTaz0hg=;
 b=j83u+kpYASPolI7jwFhnh7bHqN/ufSpYYufQYULlciZJzKXNcBatE4Y2TxJBPdzliXU6dy9E36wa1QqTn5qNxQkFCI/9iGJThIBiI+2GDw0u67DiZgHCe1eigddqN0HV7qV5yYivC4IZVkrVnK9mTodW6x3hK1qcqQcuNXFfGTj/Cin2WQMk1iQ179X9jB56gdJalCJAU2XJYU6RxKLV5Ody+TlQtzIsZM6KK4V2nNR/X901qNbIfyei/tqB76CAU6/a//OrAAQzCtQO7GEVB2M+yMp/T7o0Y+7yg57pQN6ZGDXbj94XrxdWm2PK6gopUZVTEjrtSgLlKauz1DAmNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=86SfYbVl1SYoJgyGPyMz5a0ERxtUwM0woM1SYTaz0hg=;
 b=F9khxOvEfKNyPeI9BZibFVP4Kv8rPqwhmZY5D8cKRwKwaYvfW2JhPr++JSQBPkMUgnEUhB4Uk6RGugT8JKiEfUB897BFbhkX0QXIo3laqY8Kl6xamofJ9LpqDnBWfV/j3fGtkBD8sPtANc1e5xfDIAdlArZtPw2hH3dul/SDivEYM3To+ZRl6YAK1jZSi4H74XxuoA8e4tdYHYArfIpGAxYUyw+GAL3tvcZhUJD10PSa/tAr83WAzuvhHB5tiX/6jarIVXx6FskMGP3DDMpocRqAfmQ6n/B+nl/jhkEXVOX+9HngSqk5Rmndr/duWh1Kqtsdp56hzGK9gdWFPEo5IA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by GVXPR04MB9974.eurprd04.prod.outlook.com (2603:10a6:150:11a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Fri, 9 May
 2025 15:30:09 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e%3]) with mapi id 15.20.8722.020; Fri, 9 May 2025
 15:30:09 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: vladimir.oltean@nxp.com,
	Ioana Ciornei <ioana.ciornei@nxp.com>
Subject: [PATCH v2 5/6] arm64: dts: ls1028a-qds: make the QIXIS CPLD use the simple-mfd-i2c.c driver
Date: Fri,  9 May 2025 18:29:39 +0300
Message-Id: <20250509152940.2004660-6-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250509152940.2004660-1-ioana.ciornei@nxp.com>
References: <20250509152940.2004660-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR03CA0036.eurprd03.prod.outlook.com
 (2603:10a6:208:14::49) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|GVXPR04MB9974:EE_
X-MS-Office365-Filtering-Correlation-Id: 4331a26f-d2ca-4d81-8a7a-08dd8f0e6148
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QKKo0Hm+uaOzBCVy9fAfjP9k73BR/KUaJZNOItugwSx7IgE16DkklPLs/zaI?=
 =?us-ascii?Q?cCV8tcyQ5WzJCNX58kzSQD9iY78Wh9ya9fYs5rOslsG/GblYTW7ekK1Bzpu4?=
 =?us-ascii?Q?IhssyJawIjtZlktAz7+JJHccB4RMIl/TKq2wNrNV4GREIAIiivriP95/gHVh?=
 =?us-ascii?Q?SQWXe3/lioc/3TzjpfreYqFNgvrOa1tJeJ3wy6dYA+UH/n4OwYM+DhJHGvaB?=
 =?us-ascii?Q?Q2IHhh/bItRVdCWJzag32fRxLsGi/l6cf1j1DABBEl/MEKLoBMaC+NkrifkS?=
 =?us-ascii?Q?+SVg/PvtHBzrWoTlH8jhldZDcFUKhrtOhKveS1/fx9oiy0DsI6aO9jZLDEhG?=
 =?us-ascii?Q?sTQlC7CuuJyOfjgf8L23O5+7IWMNh/atXj7dw7KoPSOcDOxoy2rOn8GX86vy?=
 =?us-ascii?Q?IwnsKkNQ3t0tDF4y4/vopYeEYjd/uNEs8iQ8yVgeiaPXrpkrKF8CrecY3kUM?=
 =?us-ascii?Q?GPGoJILWY92Jbc/fIoDuJBjcMe5jlFpcbznTD4d3p6OPJ0WqwSQFcz02v2Zs?=
 =?us-ascii?Q?Z7CXz7FHVmqO1PXSmrm5rbOahMJl+RLjAeAzaenes8ZdHEUSM21qozAsc7X8?=
 =?us-ascii?Q?yL2PA5DVjC4SPpbJy0QmLT8pXoY9tBP4N+GQLdb+CbCyP/UsYnCSiQU59ZJ0?=
 =?us-ascii?Q?tvELEBai9JFIMvQi1TCrcaxTV0yze2kU2hVCpIGnChZdH/KPLQG7tVRMYmjy?=
 =?us-ascii?Q?lpAo9PoLMT3EwKj73zWjvod5Ix+JbmgtYJxa8VoaMQyZI+WmuP3AvykSUo3h?=
 =?us-ascii?Q?U8vFXAv3pAcAS4+4kM6Kwnqrcr9EYBmzmH1zHJe6NNSnn7TLvNwcpGEAzhUh?=
 =?us-ascii?Q?4jxoUW1yhDSW7Som3ylPS7jf2r1QuVsxnvACGAnHDCMHE9RHF0ZGtqqwr4hC?=
 =?us-ascii?Q?QtffJMSR8RER+bSqY6sZDsx9/vvkS/Hd0pfKXJhwRO2st6gj+Cjmgkb0eX/J?=
 =?us-ascii?Q?T1JZ2oY6LZivvDnik2LDIJZ1aOM1oujble8cfqKJIUVO1IQsN93C64yUO4Nr?=
 =?us-ascii?Q?FRHtGKoYOb5I0KNmdq+G6g94GNPp0hvbm8JUkQQ5hMUa17bahcmVmGCZhqhX?=
 =?us-ascii?Q?yBuGYOSX6WOVvMVAi8KNkBgAe7JJ6HFPmCALHNIC+H4kjKJt/tfur9Jz87Qb?=
 =?us-ascii?Q?2C7OKQGzo1gvia9oAMvBj2ppGPFpYVgLNC+va1KYO8sIKKe+NlX6J5Opy93u?=
 =?us-ascii?Q?P0BB2Uyq37zOgmaiVPJt0KHalxjp/vS0wgjeqzTQhKd2fs7SWMpOiB+EKqP3?=
 =?us-ascii?Q?pausFLScpI2w9oXdf6GVmLPu+MUbGqvYUuJ0aRjAm78oFNxNn6hVDnDOvirF?=
 =?us-ascii?Q?vv3ZiFJp3rDZP5Y30Z0GYJLeaG7BBN/eRzIMyoijoJ5YUiIUhDpM1aHXPEQ3?=
 =?us-ascii?Q?6MXI9n9e0JP2Li7w+H3SNJeARVQIwvNRhWAsPOmsJSjdonpr/vfb4Q+WKsY0?=
 =?us-ascii?Q?ScjNEZDWRxs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?flRy/Nt3ATyeryajGNWYSU27TqID7qQ3dk1UkLQ7mSljYiO+PfxgDPBhcTYs?=
 =?us-ascii?Q?f/KIYbkXVqtgWO7cry6bjyZMyrlUY8IrWN2xa01iaM4JZsiBB9EVov3VsuJI?=
 =?us-ascii?Q?vQedG9h1L2iZq3kOL5YQ1gSrj1HpzaqVJfJuMwaV5a3YZERoGTtxpXT7Z7sh?=
 =?us-ascii?Q?1jtIUmn5OekLdkgiuQOsnNfs6vzK2uqzPbzliww5rFhVV1rIgH7f2Hm5d9gJ?=
 =?us-ascii?Q?JY4Ol3AXyJMI4KDsmhafxP2gbUOQ3Y53WT/otuAbxHz3ZtfPEM+Fjnt5nKkK?=
 =?us-ascii?Q?jgTRy1ArzbGMA8u51lSatU0OTAYV+GHan36h/2+6+h302qUwPCelqW3YBSEK?=
 =?us-ascii?Q?U0GVQtE60AE8wqfN8LcjjVr08zynO/wlJkC+MZDxPB7/XlyIn2/aKDbjJBHP?=
 =?us-ascii?Q?4hKeUa24Yo5ujA/YbUceEHbEEOIgtH47geItfw1Oq2umiZ3PepcdHHDpFH5Y?=
 =?us-ascii?Q?imwphOS1ZL4vc1Iy5hX59GEVarKeSlZZBYx1/34RfVJwozadK6ZYdsF2s7fZ?=
 =?us-ascii?Q?vciXxZ+QKcXsb8b8s+ugNqJ2U5KPLQy3MDcsAt4ttjXikU2QmwqlnKol+X+t?=
 =?us-ascii?Q?j2vKhl+aWCbWAk79yoBQbdZkVEwVjkmveMfyAoCTaPcacpRAgGN6PTPfJkBz?=
 =?us-ascii?Q?y6PZ/l3jFu2nrHQgB4Xr4g9aajQrEbHHr2scgxjHritdroyr/9cckHGSXYQd?=
 =?us-ascii?Q?+nBesB/J/9VL6YHNzjuCV0HapkNgqc0huP66zOXIkY6YGar26Vew2tYzqp4K?=
 =?us-ascii?Q?1HByJ4pYNWJnis4Oc1u3ZUQx8MipVzYSRkLIWcyaNk/69QNxC0Yp/0O2ZK+I?=
 =?us-ascii?Q?RwIhrfmYNAuwrU1ALTgzWmysnOsGvtnv99LSX6E3dMvGSChmWS+IBU0j5pX1?=
 =?us-ascii?Q?FRgRIhEvIe80LNDtPf3vP4lnkJpSbwiM1fgncivgpWo/TXZcTPRWRt/ZU9ls?=
 =?us-ascii?Q?nKRgXG5o3hw2b+vpPNztigrxkwbirtJvQk/o3SfzGt6ySo+tKxSlzz5pNKZW?=
 =?us-ascii?Q?3gM7c9aZ7g/t05dbQ0p0wUYI/65Ri3ilcQHybg5KoeSYJBSi66zSHVZrpdCk?=
 =?us-ascii?Q?ryMeZqajYs9j5FciB4K0uqgOHdD6uWwUkdbBmKST4zJyHeRJSA6WpfLBGPbG?=
 =?us-ascii?Q?1XyU6/pnzkJXI6GsDjm6iGke3qgPlMJmntUm7EQDFNe/vxK78tUvGqnfoWsx?=
 =?us-ascii?Q?Oxg13JUt8rGbkZtQnbFp3yP/Ea/tcswH5+dNJFdbn/CO5KN8VEWFsb80WgVg?=
 =?us-ascii?Q?15+o4LLh6bJzytT+fXy6JPuEqgR9AVr1dBYA56fFBToEzFJfWgtP86Jg9zRF?=
 =?us-ascii?Q?GroNJZCz3auJsjDQNU7b3ps/+QgItI6OiZa6v0ffe3LF8uorELI+PPux/4K0?=
 =?us-ascii?Q?LPx1jE01f7RwZtvG0XRVLznhdL8SLiElZnddUy+w6aPRGOCmzykrlWlX78y4?=
 =?us-ascii?Q?ff0fFzpT608NIJPglFyGxeMR6K7cg5vvuxKPhodSEqU3dy3rqixKu4TfGjsL?=
 =?us-ascii?Q?u/w30+riTxuYFNzj8RPntYQg/PO3T5Vbgjc/e+iAxuBg7NdjuEQU2l060Dal?=
 =?us-ascii?Q?C1xpPE+H3HhHCQ63NByVHU3oVf1vO9UTVY0Hr3Ia?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4331a26f-d2ca-4d81-8a7a-08dd8f0e6148
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 15:30:09.5280
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zV1vPnUErzPxEjPNVsDNhI4K9Q8CFi4DucfQWGneWHTzY5LmZe7xtA/DTM+o+tNQWd2fYbJy0fBsl0L+ErqUpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9974

From: Vladimir Oltean <vladimir.oltean@nxp.com>

The MDIO mux on the LS1028AA-QDS never worked in mainline. This is
because the on-board QIXIS FPGA does not have a driver that could probe
it and register an I2C regmap for it which could, afterwards, be used by
the child devices - such as the mux-controller.

There is a downstream driver for the QIXIS CPLD:

https://github.com/nxp-qoriq/linux/blob/lf-6.12.y/drivers/soc/fsl/qixis_ctrl.c

That driver is very similar to the already existing drivers/mfd/simple-mfd-i2c.c,
and the hardware works with the simple-mfd-i2c driver, so there isn't
any reason to upstream the other one.

Since we want the QIXIS CPLD to have child nodes with "reg" and the
current format lacks that, change the compatible string so that we make
it clear that by using the simple-mfd-i2c driver, and its
fsl,ls1028a-qds-qixis-cpld compatible, we expect dt nodes children with
the reg property.

Since the QDS (QorIQ Development System) boards are not made to deploy
any production software on them, but rather made to be used exclusively
by engineers to test/prototype SoC features, breaking compatibility with
device trees is not an issue.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
Changes in v2:
- updated the commit message to explain better the context
- used the new compatible string

 arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts
index 0bb2f28a0441..40e1bae52ef5 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts
@@ -338,17 +338,18 @@ sgtl5000: audio-codec@a {
 	};
 
 	fpga@66 {
-		compatible = "fsl,ls1028aqds-fpga", "fsl,fpga-qixis-i2c",
-			     "simple-mfd";
+		compatible = "fsl,ls1028a-qds-qixis-cpld";
 		reg = <0x66>;
+		#address-cells = <1>;
+		#size-cells = <0>;
 
-		mux: mux-controller {
+		mux: mux-controller@54 {
 			compatible = "reg-mux";
+			reg = <0x54>;
 			#mux-control-cells = <1>;
 			mux-reg-masks = <0x54 0xf0>; /* 0: reg 0x54, bits 7:4 */
 		};
 	};
-
 };
 
 &i2c1 {
-- 
2.25.1

