Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013059.outbound.protection.outlook.com [40.107.162.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2513E1F5617;
	Mon, 23 Jun 2025 20:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750710227; cv=fail; b=LU3WNBzyzs3b7W9Ei2Zi7h8UBsqGWIEHFYDJfJHowt4HeRCUupee2rS2BsofLKov7txZkPgzebQQ1Ix0KDltqHvqdasqdT0hPJKQhd0TCNtuza0SZIqrCFMHIjsb8z7YR5Vzm0wQPeTjVcGi9kNfQRihxAcSgRyzJIQ2eW1KC2g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750710227; c=relaxed/simple;
	bh=MX+gm1n7+v2Ab+9NoSAOlP5/b9h616zUuYO+rZ4XXsg=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=ezgtomdKY/UeXJSRTSbMYfo6Zwlx6XTYw7VXZImOOWBGrOX89+J7bP6Oz8aDjeyOabdi8ccTXdC9nROALrL4tcnxQSw0m9wxouabPv/g/rEYB8Wf55kxOdM+MFGlnwjzNFjAzFd3RoADdQy/d1P0oMbOPebBRty5nprvTaxx9zk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=dIkDTK5y; arc=fail smtp.client-ip=40.107.162.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="dIkDTK5y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eKGO0KYnT2u+zJw1TCvf9t96/h043HGEYPwf370w7LFZi/mfyOUYK6dcPTacNjX5+gmysaz/rLC8+li6gChst2tAe1xF6MI2nnxW+42mGICnvfmFgHNfyDbCdezwQEje3p1ubBNezojT9/T5BuMm1ZV+Pnzot+vwREtWO/oCSzU1cMl/B6PMa9U/mkOsdX0FDmXAu+YRfBAwozqiiY8YNEe4IYCrOYxp4LRpWCUBNXw0hYJkGbcbnwduRlG2olbRq6nAfb5UnyB1H2TmvMjGc/Bbw8ZmxipYMBqcDyVN5P8tdQzHBEuqpsUhgJiWScOc+61FR11s2w58qkfJaIBVYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2R5EYf0ii4ki87sUkd2ZrBk7khcHYT6AalShPbVmQ6c=;
 b=Oa19ALQl3VXtvBD/yPA9M49ZqHH9cK/3efBsfiyewaPlCO1WWiM8+ZppKhStIFsjYk/oKVcE8AFeyNauH/PZJJPZc7icsWBii9x31lWkgQ9B+3BJVg3o5fMMEXUWSWKUxSqYUjjtHWIg4AfulEkU1o9+HUo1KvQcn4ezeWDWufnlHPc0CWGvbie6X9PaNWSvFBrYYsJowM/N2cXwE5vwqMHb4233R1wv+gaSoOg4xVfWeE3wGpknJ3j+7dXo0uPj3uRuA2ma5T3hLE8UEd7mXL/iiTqc92Wo2gbf9wg9JB7aMiXWhSrxAJYKf68plNvSAHeflW7ZDa5nf7Ls5Qxsdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2R5EYf0ii4ki87sUkd2ZrBk7khcHYT6AalShPbVmQ6c=;
 b=dIkDTK5yl4W0mpY6at8xsyh4qnpyR6GMBmMSv+u96Ij8OYo/SQ+PKxKr0qyaj3kNHA3BACY0tvZpeYOJbO/0La1vljzqavAEtedSr/Aqb86+pq22njVh+RPJr9wGmdk3Uo4YcOGIxmZlkg0Gp5EFG/DFI+KDchBxUuszBRMHmlIHASdrODYF5VDLhhduwJ6OINWzV0nwFrjR1bRUX/X4zcS0U+MPz8p9R8b3gT1RNQBmiM2dsidInHOxxqU91bLpmNdllXt+rQbjFPFfw7MMMdd1LjIDKu8/CwpF14rhT2Ntlrgnry5eQQ3oL3OLYIuVmd4D4YvjOOlJD3EGShhRpQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB8973.eurprd04.prod.outlook.com (2603:10a6:102:20c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Mon, 23 Jun
 2025 20:23:42 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8835.027; Mon, 23 Jun 2025
 20:23:41 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	linux-mtd@lists.infradead.org (open list:MEMORY TECHNOLOGY DEVICES (MTD)),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/LPC32XX SOC SUPPORT),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] dt-bindings: mtd: convert lpc32xx-slc.txt to yaml format
Date: Mon, 23 Jun 2025 16:23:24 -0400
Message-Id: <20250623202325.2468483-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8PR05CA0003.namprd05.prod.outlook.com
 (2603:10b6:510:2cc::24) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB8973:EE_
X-MS-Office365-Filtering-Correlation-Id: 51af3ab4-2a7b-4ee2-a44f-08ddb293d838
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|7416014|376014|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GdqjeOqjCI2Pe5LtHlAbeeaXVd1gT9t9HZu/jkRZyKOMv3j6XzIn1UVGks7n?=
 =?us-ascii?Q?TEJ7e284Lx7K66ZkPLS4jitS2E3SAfjGxWGGctm77q0EhTJ3cM/F/lNd/t54?=
 =?us-ascii?Q?XuuxAPWBH1vLQlwBKS8EGPs02X2nuvUSrElRLjnCM7QSHAemc3vhvnI8oKvd?=
 =?us-ascii?Q?M1KpXHf9mhuP4dP9g/lsWWXsyIwTXohp3O3z1nXLTH9P7BXToleTbHQCSJ3s?=
 =?us-ascii?Q?8VuoqJvxgak62vt6jeU+RcYUzVJ6moe5yuEBmqzYcSZCqHUvd/z6pz78XWpn?=
 =?us-ascii?Q?GJxTfxycigea7QvciiLWv9IeSpM0agbf/JnbbziI8Q4TvKqrDW5qzSr4OfFe?=
 =?us-ascii?Q?kmp/XwFD3p5fnKV1iNwh50qkeE04QnX8w4tpTZYmUJDWHCuEBvjSrdGiwXox?=
 =?us-ascii?Q?HXPa2KUljonKNyaAGab8OqdgcvLGFR74ejXqlCNBMD4ZfeKizFsUsws7sYes?=
 =?us-ascii?Q?L5bMo5oM6YNWmroHQJQ7DJkpLyoWkloFczfn+NUjMbE3froAULUR1ypTtsnr?=
 =?us-ascii?Q?9Af4KCT3EMjhZZ1DJicIzAqRyAyrfWiKnYHC11KGSnmd2Dh0w4M20VO8iXxz?=
 =?us-ascii?Q?o/DKCzuVGaDrAXixjOgfJRqjGNabJ8i5qZbugGtitAiazLz37zPZPzWl3rXT?=
 =?us-ascii?Q?y1PyQmBK2uB5kGthl8b+LagTTOrvjqwKg5nk9ZqdQDiaJkVg7xpKLlVii36o?=
 =?us-ascii?Q?8kFEc4z0pjIXKuy9hEAzo9gq7BEyHYYjzSPQQDZNkKVZLqFqMl1VnCUxq+2k?=
 =?us-ascii?Q?DKCZ+O5bu+ptOmTsWjkI9Xs4yUfhIZAHFYMVVQs5u6qSv0DS8EAw0cO5Wal6?=
 =?us-ascii?Q?Whuzma4SaogniHld2uH+u7zKjiE4Ga/4WaXv29MUYNBSHOfuhqcGV56dTui/?=
 =?us-ascii?Q?bNIGEwKUHrAU94nK3KoXHqrZHD/wgM32bO/7vbdw9IiqYeJwRTHlsmdoNNpw?=
 =?us-ascii?Q?/fTguyqaPCwWvCmZQux4yyWo8I3whoYitomOGdmtEN7vmZcp+hWerJoyQ72o?=
 =?us-ascii?Q?sfLvdX2cDxLY98wSLZyUFblQYWfa/EXCrYcytAK3DecFDGxYG1ImXH9glfF+?=
 =?us-ascii?Q?QLhU9+8ld7XtkxxCAUuKslO6XX1y8Tk+0m70SqPc6HxP7A/4Yo16tH4eE6WV?=
 =?us-ascii?Q?NS8VqLKl1QpnvTJ3YAFG+xgyaosT7fcA1PE07RABYXCzejKK9YEt5oETK0EL?=
 =?us-ascii?Q?irJk79MxkwvVbFOV2dzK1jQXNSZchiCQGGyystqKbD0zkV0DXXkHTj4/B5YU?=
 =?us-ascii?Q?mb93GaklDNx9Th9qzhCXx+olCha4hRP0jC6lmVkdbny0yP1c/NsSUMuUxSTV?=
 =?us-ascii?Q?r6kb4Pp/OJnhms+gMq/L/exZwZn+jLtL7UrIRqX4kcDK/Gyc3IXyoL0rqGDE?=
 =?us-ascii?Q?5fVJRLM1W8vLdQUELUCkmwyZy4Q8geirvFm9vP3nGteKJSxmyGGGRIFsAONL?=
 =?us-ascii?Q?8YNAStLxOFoczA0Wf5MDFksKwuttVvvB?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(7416014)(376014)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?a9wwR8lyllXUg3cG/v9j2RdXj+mwNpmb6P+G0iFCNEVhNFAA7IzjDP6j+ZOY?=
 =?us-ascii?Q?EPJnKgiJ/1/rH8WPPDqpzTvRM40Q6yO5nqtH2l8BMaq9++z+fgwq0NL6qx22?=
 =?us-ascii?Q?AdubF+BpkE25fCxzwoUVOpeYsD1yCLw+6Op5abP4Nz9TBUonrVDYGaeB2JlA?=
 =?us-ascii?Q?AuCc8onTBK7ru2nTiJWCpRvXKOmuX8IWgCoOkg4bM1Vsi2OeaY07xCTZdrrz?=
 =?us-ascii?Q?hvakUYXfzuRh9LLQqQY7JOs+zoIyvs4YK0SlmAbTaH6PuYo0E6FGQre0UHdM?=
 =?us-ascii?Q?r2sl0l8oc1gTvGOStHSybmCbs/T1XtOBr7q5xfSZJjsayI/bkpDbz/3FAUwu?=
 =?us-ascii?Q?LEWOnys9vDPEnq41MiRFFJbHBYsNpoC4uZMHBdZ5hycGsRKEMe0mW8HvdWmc?=
 =?us-ascii?Q?jNRShaAT6YxOkdMR2XvtAAZJtUySykaz7lV9qN0Yl6cwYRoadZMT8zwxFjle?=
 =?us-ascii?Q?YXIXTFdrfwCfBQ/9kpqv9vHxCPs7rrn2wNCAwx6ygtNJnoSq0YUm5OYx2ANd?=
 =?us-ascii?Q?vG6XunW+lgWXtsVR23X0yijcIHYfhPlbaww8Xr4bk86LBySo7Du++CTQL0b/?=
 =?us-ascii?Q?bInftpM9KuyiLJpfbuvDd1sPITwWGFCo2c4f1thxVPFMPsUvJnQCTOkxB6Yj?=
 =?us-ascii?Q?YhnoeYZqvBiK3ypb7uDtbY5jD1zFqQ4wkinjonhM54qTxhIkBf2iZpuCLPlN?=
 =?us-ascii?Q?AEJ3QoGsUkPiBb3izvWYpaW+C6qobT9c3DrPx73aN5oawMscMSo1eXC+4uVi?=
 =?us-ascii?Q?vyjUSaY5ZdLrjHFbA8RDA/wsGJaN9pR01Cjx98OTRZvGMMoNIXHqeQ/hzxbf?=
 =?us-ascii?Q?RIczTO5h+FCIEjNUN/eXhDWA8RH9wTqvFSSJ4StF9UmPY28ip0G5vEFvet7U?=
 =?us-ascii?Q?Q/4Dkq0/zQYxkjtxgNMsRhbDYCvWXYTXbLhpRYRi9aoUyp/JnYcciwU7fKBa?=
 =?us-ascii?Q?AMuTZfT7O6QDydUJ82pYM/4/iqTYDsl/SPU/FLSIDDZr3sBrkFJomUhp8woJ?=
 =?us-ascii?Q?J3nfqsZN/D7zg2qFKCr3p3lXd853k0jCE07u1dbkrWWBqqvcYr6OlIBCeWyK?=
 =?us-ascii?Q?8KDP9ys6PRLfNtsSbE1FNi5qzIuTyvmUDAdbl6/g9CAsMf+QgsMmG79fC1sX?=
 =?us-ascii?Q?rNR/CfvCbOSD719Dzh4xZ9BoC1HV6ujc9DSSJ9PrgO+SEh9Fls5jKcfSw4wp?=
 =?us-ascii?Q?XtZpiWVIaVygOkLCOnpD5650tpAgBksKz6j4C1iWWoCqmc3BZHBJRkyBe1DK?=
 =?us-ascii?Q?iJ5omyca2s7ClNTqeoVU/SKDAlHSvD4efyCPT5lMxtB8ksflBr6MLtq6rBa2?=
 =?us-ascii?Q?bLg2Yk3K3qnNE90cZNJ4ealBg1GGetLZxVQ8hj7DNHTNg4ow6ghIMNt7DDsa?=
 =?us-ascii?Q?Lrma82XEIP09yN7NH67Vr3r+KjViFkDH88y29CR5+8KLds52DhyIriX83Wez?=
 =?us-ascii?Q?oorko/uogR2MVsox2rTWi84v7gDhjZk9XN82TeP6LDRcv8K7P3NoxkCZ8aoq?=
 =?us-ascii?Q?PYUGvnJ354shwv379BeMUh9KbATI2HOQ/D2KMolMjDr5orYr8792IjfsYsZY?=
 =?us-ascii?Q?TeqgFm1qSeZv/AjAJ0cgCOzvS/C+RmOG0J2LGAOo?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51af3ab4-2a7b-4ee2-a44f-08ddb293d838
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 20:23:41.6658
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w6AeYWj8f1Fzli1TjGifREZ78iLGS1BgccMCrzJDTO8zY93EXR/C98sT+t+wYX1pnijgwNkPO2FSzhmw0vwAkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8973

Convert lpc32xx-slc.txt to yaml format.

Additional changes:
- add ref to nand-controller.yaml

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../devicetree/bindings/mtd/lpc32xx-slc.txt   |  52 ---------
 .../bindings/mtd/nxp,lpc3220-slc.yaml         | 101 ++++++++++++++++++
 2 files changed, 101 insertions(+), 52 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mtd/lpc32xx-slc.txt
 create mode 100644 Documentation/devicetree/bindings/mtd/nxp,lpc3220-slc.yaml

diff --git a/Documentation/devicetree/bindings/mtd/lpc32xx-slc.txt b/Documentation/devicetree/bindings/mtd/lpc32xx-slc.txt
deleted file mode 100644
index 39f17630a3011..0000000000000
--- a/Documentation/devicetree/bindings/mtd/lpc32xx-slc.txt
+++ /dev/null
@@ -1,52 +0,0 @@
-NXP LPC32xx SoC NAND SLC controller
-
-Required properties:
-- compatible: "nxp,lpc3220-slc"
-- reg: Address and size of the controller
-- nand-on-flash-bbt: Use bad block table on flash
-- gpios: GPIO specification for NAND write protect
-
-The following required properties are very controller specific. See the LPC32xx
-User Manual:
-- nxp,wdr-clks: Delay before Ready signal is tested on write (W_RDY)
-- nxp,rdr-clks: Delay before Ready signal is tested on read (R_RDY)
-(The following values are specified in Hz, to make them independent of actual
-clock speed:)
-- nxp,wwidth: Write pulse width (W_WIDTH)
-- nxp,whold: Write hold time (W_HOLD)
-- nxp,wsetup: Write setup time (W_SETUP)
-- nxp,rwidth: Read pulse width (R_WIDTH)
-- nxp,rhold: Read hold time (R_HOLD)
-- nxp,rsetup: Read setup time (R_SETUP)
-
-Optional subnodes:
-- Partitions, see Documentation/devicetree/bindings/mtd/mtd.yaml
-
-Example:
-
-	slc: flash@20020000 {
-		compatible = "nxp,lpc3220-slc";
-		reg = <0x20020000 0x1000>;
-		#address-cells = <1>;
-		#size-cells = <1>;
-
-		nxp,wdr-clks = <14>;
-		nxp,wwidth = <40000000>;
-		nxp,whold = <100000000>;
-		nxp,wsetup = <100000000>;
-		nxp,rdr-clks = <14>;
-		nxp,rwidth = <40000000>;
-		nxp,rhold = <66666666>;
-		nxp,rsetup = <100000000>;
-		nand-on-flash-bbt;
-		gpios = <&gpio 5 19 1>; /* GPO_P3 19, active low */
-
-		mtd0@00000000 {
-			label = "phy3250-boot";
-			reg = <0x00000000 0x00064000>;
-			read-only;
-		};
-
-		...
-
-	};
diff --git a/Documentation/devicetree/bindings/mtd/nxp,lpc3220-slc.yaml b/Documentation/devicetree/bindings/mtd/nxp,lpc3220-slc.yaml
new file mode 100644
index 0000000000000..db9cf4efb2212
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/nxp,lpc3220-slc.yaml
@@ -0,0 +1,101 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/nxp,lpc3220-slc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP LPC32xx SoC NAND SLC controller
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+properties:
+  compatible:
+    const: nxp,lpc3220-slc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  gpios:
+    maxItems: 1
+    description:
+      GPIO specification for NAND write protect
+
+  nand-on-flash-bbt: true
+
+  partitions:
+    type: object
+    $ref: partitions/partition.yaml
+    unevaluatedProperties: false
+
+  nxp,wdr-clks:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Delay before Ready signal is tested on write (W_RDY)
+
+  nxp,rdr-clks:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Delay before Ready signal is tested on read (R_RDY)
+
+  nxp,wwidth:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Write pulse width (W_WIDTH) in Hz
+
+  nxp,whold:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Write hold time (W_HOLD) in Hz
+
+  nxp,wsetup:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Write setup time (W_SETUP) in Hz
+
+  nxp,rwidth:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Read pulse width (R_WIDTH) in Hz
+
+  nxp,rhold:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Read hold time (R_HOLD) in Hz
+
+  nxp,rsetup:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Read setup time (R_SETUP) in Hz
+
+required:
+  - compatible
+  - reg
+  - gpios
+
+allOf:
+  - $ref: nand-controller.yaml
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    nand-controller@20020000 {
+        compatible = "nxp,lpc3220-slc";
+        #address-cells = <1>;
+        #size-cells = <0>;
+        reg = <0x20020000 0x1000>;
+        nxp,wdr-clks = <14>;
+        nxp,wwidth = <40000000>;
+        nxp,whold = <100000000>;
+        nxp,wsetup = <100000000>;
+        nxp,rdr-clks = <14>;
+        nxp,rwidth = <40000000>;
+        nxp,rhold = <66666666>;
+        nxp,rsetup = <100000000>;
+        nand-on-flash-bbt;
+        gpios = <&gpio 5 19 1>; /* GPO_P3 19, active low */
+    };
-- 
2.34.1

