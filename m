Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2053.outbound.protection.outlook.com [40.107.22.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309E022F77A;
	Fri,  9 May 2025 15:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746804615; cv=fail; b=TfI/kXfCxkX+wXPBglsi4tCH7Hj3Q1lsS49WJuEalBzB345flAQofBOiWehgd6fUG+WHivLluj1j9Xf++5InXXmaCfUhzc6kGr0f77LNx3uir6iKRoEC8+YBXQCcakupGurPaE/X7+kzSafZIHoHaJdPCuJCt3wMel7SaZkTjsE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746804615; c=relaxed/simple;
	bh=SlG2OUMfs+O6ujenHgmO0B8SwwpG6c4uDO50oAZXYPc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cekvXeTR+fNu6bcJuAnlok5Ht+5XP1IA29lq8SpFE07CQfW+ppjUYALJZfJlmz9Te3Ng4u1mkUOeewQApTIG+FhcvC5jJrVSsRqnSEd+YYyaO7ovu+7mY40tC76FJepO/peNFRwSxnnEm51eXDIjGGlZlV/6WriEIop6oil4uNY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ZYGQMGue; arc=fail smtp.client-ip=40.107.22.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ZYGQMGue"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eq3SKkof0W+itLLHo0AKCd6IGAwDOwcSNRdazl+XpeEl9W9u9JmNwwu8YVsM/mpui041WMnrTJlngYBerLuFY+zcBTxLU/rC3Vwwu5G87b8/V5esqzLR47AtCKrXEvJNCuMpYyBiL0xo5e3H6hrJaiZaWU6nuW1ldUVe5yKP0yTEssbnIWeV4fFRqYK4K+dvG425hGZC7WKIHYHWWuiagxlL/e7CIu8/agtLAzHhJehTXHPI0yNrSrgyKYYfPKmmYHVrFwGZEKuoQANYUxcZw/xSRr8ABEjRcLe3T1+qNmFUOyQjk9hw2BxSheJp0XIh2B5Z1gSresFX3tltPL5GVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=omBcq2X2sBfF7iQ5YHAkWQcmtrYsmPKdXdxE1gFpKdg=;
 b=yfoLY0EtGrLgl2bBnK4ePpDtGlnJ+SMd4o/Lhn+fiTrnRQXkJNM37fx0i/uO/BjRrRG3PpgZav58eFLHCWW56K/OVp2+wJAw6vrk9YMdj9+4exEHJcJEE9IRAXr8RKC1KEtW3QyMyxcK7mfJYzJc9AKT8sgoHbVl79L3G15HQLkCZxJlfunjiNA95XrzxtMRN0ovft2ycIORJveBrPx3TwC0eQz1JVE7/x/Y+9DqG0aIuxEGx6fOShwtJhP06Rryb+RMA1z+JIRoRFJFn62R1WPRJEacU0bIGLNgg2feUksSM8xHbmCQ13e2SzUpk0NsNNcTnGwZpXTYXoXt7Mdf+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=omBcq2X2sBfF7iQ5YHAkWQcmtrYsmPKdXdxE1gFpKdg=;
 b=ZYGQMGueELfjNJM7yTkdgnngk2LLZe1V84tqbs0UZsXyjLCMSLtethAhaJElNwkJ8YniqrRQGQOpkN7hopl6/vcJ82KYNWgPSV4dy8QEI6rLWYFviSKBVf2b9I4p3IJZs8Cy/j63DGq22b0lCRxJGqjnAmJmj+Uxfi9pO15xa7i2RhU4xY6jIbEsuV5fPqhHe9YCoqVeSHBgOmjl63hJHB40AOU1sb9ZlnmO9ecYByEurmeDSqIqxD3iaJUYEHUI5MUCSUR5FqbLuDSaavamZEHjGmmkcmPBJqY67jv0nSOjabyODmHms4v34YoHHAzXj2UwKBurPFAyVkOPjV1zeg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by GVXPR04MB9974.eurprd04.prod.outlook.com (2603:10a6:150:11a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Fri, 9 May
 2025 15:30:05 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e%3]) with mapi id 15.20.8722.020; Fri, 9 May 2025
 15:30:05 +0000
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
Subject: [PATCH v2 3/6] arm64: dts: lx2160a-qds: make the QIXIS CPLD use the simple-mfd-i2c.c driver
Date: Fri,  9 May 2025 18:29:37 +0300
Message-Id: <20250509152940.2004660-4-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250509152940.2004660-1-ioana.ciornei@nxp.com>
References: <20250509152940.2004660-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR03CA0004.eurprd03.prod.outlook.com
 (2603:10a6:208:14::17) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|GVXPR04MB9974:EE_
X-MS-Office365-Filtering-Correlation-Id: e5eb6349-6627-487b-8ad4-08dd8f0e5f92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bkXBtU83sYwz4kVxhUtXBYLYCp0r/d77XVgUPHp5CsyJd/0/AwBxNgkv64jI?=
 =?us-ascii?Q?HBEurCp0nD5UOYYC35Mi9At7EVNlBjXKMGs/RyTGwCXZLiY5sQITlPWrCzSJ?=
 =?us-ascii?Q?cTFDs4ND2vSNhqs34JBXnhvliBTrNIqtcqzGenvENaGRdwgIS23MKmtwhj6K?=
 =?us-ascii?Q?uloXcZi4jaMXdWuVBxixpm0UBElMKFoHsDx+yvd7kbuiQPgQ/8PyHqkH+/S2?=
 =?us-ascii?Q?DxlJLMDlLqcudYld4mEJUhJKwp6Lcc4nFfDp1qlt0QJmMjn+PQBgar/8Zlar?=
 =?us-ascii?Q?f4byMy4Z96uq7LEPXN42xAuQNO9ghX+Rxm9m/DQkm2RfoDu4VgNYs96y9Ewh?=
 =?us-ascii?Q?NiWjcBoSgECd/rdHVd1X8k5PddmMSSe2lapODHXAo0KS+j5En8xNLthWx+KF?=
 =?us-ascii?Q?N9G+oG/gTwI+BC6iba1DveT9puTBgbd60VkeZ27kN8nKpxqdnXRs8ZymPt6X?=
 =?us-ascii?Q?Q+12nGHZUOKMMqRDZ6/46LiuyRgm3Mk0cDu5E1ZCwqqHOL++2zwtVYW0I0WC?=
 =?us-ascii?Q?ACPTMA3OtNzfLCVb0o5hf0AiVQRFrW4Z5OEUBxSgrsiBhMtZz+aWGfKBrz9a?=
 =?us-ascii?Q?OXnqlbKW6D745XaIflD0BCVLOfXKGzBWDm4SYNj0Bhy5VHQN/dy88uvL9iFo?=
 =?us-ascii?Q?zFSG++8Saoa2fyuaRc0GOs73q2bePDxtZRiBGUgg2IJkpq1uIaoJMZXwBAcX?=
 =?us-ascii?Q?unFegUyMihjGqR4qo9cvvg1k8HflMY4ITUXTft3ggByMOh95KePF5aQsu+2L?=
 =?us-ascii?Q?ZkyBzUI4BMJRIY546bmZ7dHS7zLltscmBRAvy1LP45h4RCyh9KrAQyU5vHvp?=
 =?us-ascii?Q?QA+04sLbv1yvuhxwFI7B4lcmBsP0lfPZiTbJa74brJCIv4w1HnBWM70VPz7k?=
 =?us-ascii?Q?qv028wM8w7hyxTFDYRcZ1LdYlV88lobU4GTqA/b8e7Lc35nRTqX6UwnLr7kQ?=
 =?us-ascii?Q?bkxG2shdWK1cPVett/fRYiCOQ0lscaz/bdQ8hvTH4oe3PjXMjDUCmEOsvPsU?=
 =?us-ascii?Q?RVQ2MtO8PhruiyjWPMRNDXw4inJ0PbN86WoKo7l/huwEAI3fMdwPnKEjq/Pa?=
 =?us-ascii?Q?KeWNyCszqo3ku9yf5Lfp3v+4v4pyWDyN06jBSc1mEVkHkkPOUDITgI/ZD7qE?=
 =?us-ascii?Q?VaJ/E4oYRk1aOD27fjhb5KZTPQ763oyNki2TDRQogpf2hFdblH6yaxziyo2f?=
 =?us-ascii?Q?7TJKl7IAdEX2cKk1Ir0B8nWDVs/c8lHXH8kSUr0Gl2swBAZg3fUPOd0A0bOd?=
 =?us-ascii?Q?9/dcFbuAg11OZlv3EN2jyQo928sv/pY2FXnZPn5IUI67EN7jeMWMA8AZZfrp?=
 =?us-ascii?Q?OvxBVfvtW/shbJvHpgMRyPShb5mBx+vmX/kSYIXrxANns+rF128+2HldbWPt?=
 =?us-ascii?Q?M/t/kXxJCR18nuwdminb9KJctAh5v/r+t0Dvgp9sCqRQzQKDMih/9tH8Nuta?=
 =?us-ascii?Q?C7KVx0BUHPk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BgqQA1MrOJbt7KaIAQUhI8bYCBNZ48l0zEACoqF5nVM042n2HiGDTfCEZlvh?=
 =?us-ascii?Q?CKzEgx+7BhR/AN62MBbY8oHBJ5BCmXpz1QWqfNNUzRMS3E/yKw1QvnwC6hoA?=
 =?us-ascii?Q?5AdN7Pdi5v5pS4pnxANwxzphRfhSVHfs8eS7ycknCx9CFIjg7D1IMnAZIN5e?=
 =?us-ascii?Q?ZaPUyNr4l7LJTPkk1jiBDkiQpbhHWrHlXaU/EYIQpuCkOhvDE58V6RM6SqoK?=
 =?us-ascii?Q?TsuIzXuk3CcDsLC4jXfto+d9Fx3OPx7b0rWOsweuzkXV2wXZc5QLzR5iQ633?=
 =?us-ascii?Q?T7hoXyl99aMsqC24tyF0du1FbQ6w4WNUsypg5f8MHvqgxZEqUTSPanMlrHAN?=
 =?us-ascii?Q?vTK9cCDFMPd1KbsKXyT9A5aSRqdB/1Wy5XFFYlicgDTU54b90A4ekpQDa5n+?=
 =?us-ascii?Q?XTOEaGXrmhWX+UG7/qyZa8wQ0nniBVqSUy9re5lm06TbZe47DwehuGjOVcGX?=
 =?us-ascii?Q?+W2LqhOOmchQGSf3WD6hUPrzcx8o9YRm7Etc3foALyDZTwhgUjiWXk8bZ8kk?=
 =?us-ascii?Q?nCkbWri5yJ4A7RTHR44UylwIDOV7wbO9tL6g+G3d7jyDn86XZCUzdW88tFu2?=
 =?us-ascii?Q?mVNB1kYIF6AQKXBf+vtgs41pr7Aptt3LLbzJEX0wQ3owB4BDj2Iryttvw0fp?=
 =?us-ascii?Q?rkKctKYLB56DKVEHcJ2fvjXowb3leygj2s+JeRWQLlFxGtjuxdF88AxSpDp+?=
 =?us-ascii?Q?747NUEHvaPfxcEPdF/2IllGCoq+jIz9/4BC3t5TVWpZI5c6L2oY8y2tNPF01?=
 =?us-ascii?Q?fMniYP5JuRNjbUWWHj/Buh1qpfnBAhD5BFX/uTCG5BKW9FidcVzh4rq8oiQc?=
 =?us-ascii?Q?z+OwQkgMTfmJQtl/HAm4i5OL8rdjSQLvgGt2y6y2OXbA5aUyfzfvtG42lP2W?=
 =?us-ascii?Q?sMZYCuMzDHwtVVksJeChvJhbQhGTAVuCEtzCoRiEiM39oo2+4SJVAvkQUtb3?=
 =?us-ascii?Q?IP49Q+X4wBR78vTkxyqgCgqTeCc0afuIqUbZPfuERmrJ3bYnmxQJ5BVrR6kZ?=
 =?us-ascii?Q?DORZGQyehA460sm1x9gshQ6szt8/IX4Ef0Wab86UmKUwEArturWjgqaVT1Lf?=
 =?us-ascii?Q?hJH9hDOD/7uSEsENTPMk2qnN4wL9BqA+c01XYMXIyLxj0fM0OGlPwfHMdeTC?=
 =?us-ascii?Q?nQPRSQhapwNl0sBeGP7LqUXoCEgTwv1+Z1UhCJr8GY37B6VCfYWm2MGilfYx?=
 =?us-ascii?Q?1pudF9q9ZVoBBzSBGegIbIJJPPz0tMDAkE9dlz+upG0JpuDC/qDZNZAHaeCg?=
 =?us-ascii?Q?RxTQnfFnYOEvEkjM7yeQgnVLoMu5Pd9dLTiNvoTrYsEnhuZ8IOsRInlO5lMP?=
 =?us-ascii?Q?92+43g6t1RY1/rtdOwZeCCQusa1L5xY08b05cQiOttdLpQKQj5Xy34IJRot/?=
 =?us-ascii?Q?EthrlngRnL8k2d5SmUYY21GhJFPG8Su8evnsdThCN2XQA80zSWuCi37BwgGn?=
 =?us-ascii?Q?AbTQ8VyQNFYYAD8NHxBXsnc8VeuY/Ea+Y34zK95zLuHGGy18+Y+HUbtbddVd?=
 =?us-ascii?Q?sCRud+O4MRua8jlWuU23R0In6GPmRX1/iXAyU8xpY8zzKLFe7NThib8rDfLs?=
 =?us-ascii?Q?tgDe1h8v9z7A+zh8EPId1d8blEy5gXFHC+I3GCjP?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5eb6349-6627-487b-8ad4-08dd8f0e5f92
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 15:30:05.3135
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RUcHZgGvvStbkwPg2J4I+LuvzK5DnRtwHrBTLmW4e0VYX4Y+qHcAy8WqHxC0bOpS636iQEdQJyG3xR3YbOhgvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9974

The MDIO mux on the LX2160A-QDS never worked in mainline. This is
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
fsl,lx2160a-qds-qixis-cpld compatible, we expect dt nodes children with
the reg property.

Since the QDS (QorIQ Development System) boards are not made to deploy
any production software on them, but rather made to be used exclusively
by engineers to test/prototype SoC features, breaking compatibility with
device trees is not an issue.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
Changes in v2:
- updated the commit message to explain better the context
- used the new compatible string

 arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dts | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dts
index 4d721197d837..426fb4c39ab8 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dts
@@ -240,12 +240,14 @@ &i2c0 {
 	status = "okay";
 
 	fpga@66 {
-		compatible = "fsl,lx2160aqds-fpga", "fsl,fpga-qixis-i2c",
-			     "simple-mfd";
+		compatible = "fsl,lx2160a-qds-qixis-cpld";
 		reg = <0x66>;
+		#address-cells = <1>;
+		#size-cells = <0>;
 
-		mux: mux-controller {
+		mux: mux-controller@54 {
 			compatible = "reg-mux";
+			reg = <0x54>;
 			#mux-control-cells = <1>;
 			mux-reg-masks = <0x54 0xf8>, /* 0: reg 0x54, bits 7:3 */
 					<0x54 0x07>; /* 1: reg 0x54, bit 2:0 */
-- 
2.25.1

