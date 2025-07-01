Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011009.outbound.protection.outlook.com [52.101.70.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EEFE1C84C5;
	Tue,  1 Jul 2025 21:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751405114; cv=fail; b=N7RwtA8FriaueW57DBLFWwk5/9De57Mr3Q85acH2A3LcsVefBh+YgCmvF52IAhO6dJ1LUm4SDdUiNuUXV4311vaCyGflW9v+JpA2pVL4hrLPlzybL3n094geHvlKF/rz267AfzVWegxwdp3p63pGCk1NY0QWWpmMgKXMexXEZAY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751405114; c=relaxed/simple;
	bh=TOSeSHW0hV+ufxs4OsqsC6eIf70Umo534sGxOQn58cI=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=bDzQWwI8ecuJjk47R+Cz8F46UE7UMSXUs9CMwtcvrZV23Rzx2agLf9UR1lfChlTZlEx97UFUMBq8uHIgLRGAoicPUKN8waTPTjDcJr2rxcBbuNylM3KeInllYK/8yjxhEhLCpkr++Xy/K1vA8fEY65bqDf7QCMCrfSRqyxPji1w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Rr/zQNeC; arc=fail smtp.client-ip=52.101.70.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Rr/zQNeC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u6hBrpVNJ+vR44J9BMgHzIBJG+/lEUkIDj5tvQfe22Un+KmVJSMDDnDYaeLqXU//OT9+i6jDuQjBmssjGnwV72E5QltjmQY8pL8j1/RBa4BmoRjoLzHIHG8VL7bGqcFQGzn0RQMzc8yE+i3A079mJkfthCddgFDc6Exi3lQlNunRlZqevt+NArZuaNbwqvMnn1daTBfh1ch+7R2AJXwx5t7MkA0MhyI+pnwnSgPfXki9+IDNY9cmKLeXa/Nn1MY2HT6tbYR20kyzj9+VpkKXUYaGmJHMOXugjE1hMIiTr5axDAKjDAcyN9WpxGJVRggTxk5618bjbnxBIeZs2C86gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TLi5BFAHP1zLkagP+f0skAk5JLbzCqyNxSPOgyPy2jA=;
 b=BNG0RViuQkR1qGKBn2/7TlnKT619ussn+bS3GYa9gkD2xyAX0GkNM0dijyPHoA1IcHLgqVrSpm+pd+INJyHVct7WymZ1zHJm7W7UEzFDkBVFv+3j4TtAL5KtAPFETAanXoFqlLJDae9O0mN3tf6cRf5O7qdVTKccyDhR9ioCVzx+wA4Ak+lxFf5JI1sv/l6IbF31rizd+JiK8Vk1lIGxegaPJyT+Ub6/2ArN49DzCEaF9g+GdbjVnDr390KP8D1in14WXcWJzQb1OKiENo9qdPFEVeHx0NAjOGiJ6bwP0rqqpTUsVM8iJyVGwPrZSZXHot/aGq23etegMDfZbYKaFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TLi5BFAHP1zLkagP+f0skAk5JLbzCqyNxSPOgyPy2jA=;
 b=Rr/zQNeCWdfmph1MynDGr9fHYnaMIRFwwhHEwIHVzT3a3IYOXyqjnA3fcMWNGITSx798EKBRVb0X2wOCPRYUbLHVJKLXM+6UEoJ6lKxNmS+jR8UdBGPxK+ZsP4GoIw3E8zrwyDHqxqLxExLn8inZmq6GbK+QgCi2Of7XaUcRnGdk8nNWj3Vf237A1YtBhEW4JDrJ1nqKFCRL0uMnZuBJyED1ylc+6UGc6zm/JHo+Nd2F6pn30m8XoK5t6PPqsQImBAGzsGujcEA2dFFlhemkDeJEdeqxCJzXqbjdhZJfGuRqfzt/RRuVYHsZYrOOA54LOqXYOLnXIVGN0eLrUzg9BQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB8895.eurprd04.prod.outlook.com (2603:10a6:102:20e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.19; Tue, 1 Jul
 2025 21:25:08 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8880.029; Tue, 1 Jul 2025
 21:25:08 +0000
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
Subject: [PATCH v2 1/1] dt-bindings: mtd: convert lpc32xx-slc.txt to yaml format
Date: Tue,  1 Jul 2025 17:24:54 -0400
Message-Id: <20250701212455.3106629-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR04CA0038.eurprd04.prod.outlook.com
 (2603:10a6:208:1::15) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB8895:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d770821-bd24-4fdf-2e59-08ddb8e5c128
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3e+YLbeqRalDEUXv7g0y2noM2phXkhPbaP3BSLsuDxSr/L1H6uRWIC2SjfXm?=
 =?us-ascii?Q?tF+BiciA+u7MdXn90Q6VD72JBtUV+Wb4KwnLI6MOkEGEvvQWXi0JpmfDw+M7?=
 =?us-ascii?Q?J36RMVWd5hrq5sy3yLi78bmGHmPyjM2kmaczuy5vtp9a6ZBV4n35E9oJDgGd?=
 =?us-ascii?Q?TWLAqZJW3ICiU91zvoGMCat6UJofvEOQJwIW74GQNMb+ssZovvT/mFgWoYc4?=
 =?us-ascii?Q?FHgaE0RH/vuzBNjuaSXEc/QDK4QFIV6c5zD5+DYsRNEKS2r7YZ/NM8qrO2Dk?=
 =?us-ascii?Q?+KSZae7R83EVSotw7NKQGWTJte9r5eYp9RnGg11d0J/XENe1FG1/A/l65RtL?=
 =?us-ascii?Q?xbYD2d9sCrNzNOGmzHzAAR4bEnILLWvSztLA/FQX/3KI11mmru9q/Q/1VqUV?=
 =?us-ascii?Q?L11xOyhc0Iat4fYswPojlxLtSJZMQkdzq4AY4guNkwxGqaALpLmCZMlm6o3E?=
 =?us-ascii?Q?F9aBoof1Z/eGTVlnNw9N7kRpDn8UKxDYnvE8wUXL6BSZnVKGn2EqinwcLwBO?=
 =?us-ascii?Q?XlNqz4VK8Z+XRdqXZ/81wJh1OAjDQVOnHmg92aICaYWdoVXPrODtvYPB1Tg3?=
 =?us-ascii?Q?l2WwuNclYYuMAi4LizxslyENHciUuh0XXTZJdG/ELB1R6sModTBVR2omWJA9?=
 =?us-ascii?Q?cSQQu5Nlt0aIqRucRAtWPVO5JltcNKPjVpTh63XbIQ1kVmvPZgNrikiVOOUc?=
 =?us-ascii?Q?gFuFNDrxJsMNUe/aKm+Al6XWCMvjMo0eJTStXNnsLXeGrsPnox1Rdtw1T7zs?=
 =?us-ascii?Q?oqxdbABal6dE0ptmVi6F67ZrSrLSk3xSeo0HeqlxiAc+kf7IDxlQpMeiIlsT?=
 =?us-ascii?Q?OLb0Kf+Cp/+lUTlc7Jr6Ny6yOeIAdoYAe9TlG0Ie56ProRZAZFPIAu4QQ5m4?=
 =?us-ascii?Q?ZBnEaYdo80ToJlFyjOrp51THFtFvKfsM4rykLE8QC8/795twNdjt3H9U5fj2?=
 =?us-ascii?Q?7/tnTi7MeP+8tkoZQpZZvSswxA5Puu8yTTBpFhSiZQQqLzpwH7puRQZq4ora?=
 =?us-ascii?Q?oKx4y2See2nb4LQDz/bpd+C3GPc6S6wnOJvl8X4rkc20n4UqQ3/9XslYZr42?=
 =?us-ascii?Q?Qa3qoWz7ebk9mY68pdpCRmj+vcb7YlptK5jd4dMCuBLk6Fzd2fFOemp5kCZb?=
 =?us-ascii?Q?FjoRGVgfwuR34c9Kqom+Nyk/Pqlpy/eAb3nbR8W2NnWEKu3EDzOHrYvOfkRG?=
 =?us-ascii?Q?BUOpfhUXJZIGLtIgKKjwF0SvV7L2+KDfYbSA9EoTGiR7v5kfAJ78oAJhTAez?=
 =?us-ascii?Q?jwt+OqYm/zYeCyRrqdjTNeQQMO4aqQztin5bQrngvoAp15ySvIWkIDPcIJtn?=
 =?us-ascii?Q?VjDXvSl71J1ArXInLaoBtzil/GOl8g5FmhqcvZoXJz8BT9PIli9HMxKUtN6F?=
 =?us-ascii?Q?TT1lAMrO94nSXAdpViI6YUOddSbz1Vow3qQEUkGiAuql71A9sUO5Kn6uAcGe?=
 =?us-ascii?Q?OjUaCCqV/BO4rAlF6yiYVA0IZWtCJ8Ch88brYuaCAkDMKLNZ4BcC4g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(19092799006)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?X9Nh9Eifv0RyQCtWrOXkaEdG2ct/Sdsf4ZIXY5iL+u4HpwkD62N3L684m4BJ?=
 =?us-ascii?Q?hlCcOHQkS3HP5YojVmzlqHYy/2Mqk/drQT38GIU0e3QYtvZhmrufmjKvpCc6?=
 =?us-ascii?Q?WDvNDucDuV+ulmlephwwhdiia9LuceTZtf2yHE3f22ENG0bYhTtmOT3JsEsl?=
 =?us-ascii?Q?HPpINvZNn2H7J7q0Vd8kmHoa5AVxEAovqZqy8hVJQ5PuLi0d+P2aCDbwukfT?=
 =?us-ascii?Q?CDf8LHfYnnLdGLlSsGW1q5dvGwFM44TEdL6ERne0pJJiyL9u+wiNVfqeILvi?=
 =?us-ascii?Q?U3RF6SBDa1d9D2YWg9HSdVG7w2IBmknvir3lbvtxDGhGE5TjVLES6p62+guF?=
 =?us-ascii?Q?x/Z/ax1QH3zRC/9Yv+/DK549lnLQCIq6IJB14sJPcu77q8aL8nLkHFtfcO0H?=
 =?us-ascii?Q?cYnNQo/2kfE+/T+EeZeeaTnOfndcblhbbd2irS2Fg+hfqp0uSdHbbz4zUWJw?=
 =?us-ascii?Q?6afebyCzbqODDYHO7MGXUAcll2kqGlX2NNRsFKZmYE3GBRzS9RDPFPV8OPXN?=
 =?us-ascii?Q?8I/N2hy7Aba2eGMsc0miGcqABbaOQ2PA/u01HTmbwfbvgeuTy6wffgVoqYW9?=
 =?us-ascii?Q?z+YC0Iq76XMfzg2IFv2o+a5TjaTFDeo/vuuy37kT5+rydN5n8Q0TYVxku71r?=
 =?us-ascii?Q?8UR6hDQCLqGrMFaOEGT6HoBAoHplFzMDQEJabfOgjwfhGaG+5hy7cvUx9zPp?=
 =?us-ascii?Q?6f7JwCuEVc4v0bxpscX1ty0wPF2jXrjqg9Zxh2nzFdAyLh29nUA4A7vUnD2a?=
 =?us-ascii?Q?97KU9jQbbfWkNkwKMPQGna6Y0oHXXItVmqnMcktQZmXFRYqe1LY58+tRwBSz?=
 =?us-ascii?Q?74Uxa5fvlwlSQHoAYtuzJhN1gokKipJWwKecChLdmxAYC8h+P3oefrCdJfky?=
 =?us-ascii?Q?SPRWAEZcF7yE9qv9jYWdfi4J6YN44924ohjtvD2OzB22gWt8v41PP42/g3a4?=
 =?us-ascii?Q?ZteElBKXr0ePzvwNsTpZivOJXxPWl69cd8UIRsIjS8Dmt+iKechP9dt/ftHn?=
 =?us-ascii?Q?BPCzBiFnY7Zmi0qq4FXn2xkzcexM7fd5rvRolEn/NQDpOnBivKS0WgbwjAb8?=
 =?us-ascii?Q?9hqR+Pks3xA6plQPbcbiMwM88dsTMcIR3HfqsPuRUruQubve/UOgMosnu4gh?=
 =?us-ascii?Q?U9feerP4RdxFwb0vUjwS1KX0pVeW+RRWkwEVK9//dceeBONeRBsZw/l+08Cv?=
 =?us-ascii?Q?il86FcSGt85XFRnfbqzVwwR24EZ+KQyjn7JFAp5zZXG6Ac6bvanAB0Me4klN?=
 =?us-ascii?Q?6SVK7N6iIza/vvEbKPG0+4AWC31YQkCC7aVnvxP2Nc7ujfYIH0edf4iGPZUc?=
 =?us-ascii?Q?jnWdEwjAKlqwXOysB3dbZI5h/oQow/CMBfj5mVF3ji0PLDzUyEyQ3xxIQGuR?=
 =?us-ascii?Q?w4XSJhqHlMkls2ptVRqlNHe61UoWXT+gNadxR0le+adMHI0fv/cpjeZvNvFV?=
 =?us-ascii?Q?79//RR+pGtp/0CFGHBVaex/Ys7676fdNcBF5EXWE6SgoYmaC7S0pKjZvr/V3?=
 =?us-ascii?Q?mcFzqYOgMGMAPcEUkWJP+1JOllJdjXYtrULO2uTwEj88XkOJLcRfZOiBPQgn?=
 =?us-ascii?Q?FLuUfH5J0ZKaYHehwTp8/z1Lx44lk6GufXpYuEWD?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d770821-bd24-4fdf-2e59-08ddb8e5c128
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 21:25:08.7090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lzKyOJo8fqpngc7bf2tRj9RzWzKBeNG+wwbsFcRKtxCmUanliQdnYuM4uImGSqD1oEehgSQ9jKqdFW6jpYE9zA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8895

Convert lpc32xx-slc.txt to yaml format.
- add clocks and partitions to match existed dts.
- allow nand-on-flash-bbt.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v2
- fix miss 's' at partition.yaml
- remove ref nand-controller.yaml because existed dts have not nand child
nodes.
---
 .../devicetree/bindings/mtd/lpc32xx-slc.txt   | 52 ----------
 .../bindings/mtd/nxp,lpc3220-slc.yaml         | 96 +++++++++++++++++++
 2 files changed, 96 insertions(+), 52 deletions(-)
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
index 0000000000000..ff2110b58bedc
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/nxp,lpc3220-slc.yaml
@@ -0,0 +1,96 @@
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
+    $ref: partitions/partitions.yaml
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
+additionalProperties: false
+
+examples:
+  - |
+    nand-controller@20020000 {
+        compatible = "nxp,lpc3220-slc";
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

