Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2080.outbound.protection.outlook.com [40.107.247.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531DB297A4C;
	Fri, 23 May 2025 16:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748017077; cv=fail; b=MPjH1PnPf9Rd3fGIPJh0BxU7vweikc1UFrfzTBvwoXFjqkkhpyTrwCYkJGcOMpt2tYqzOMCwmH83+8eZPcJPjzsmkNBH4Di/7PDdZrk2NxbxyIuHMUCGKAh576N5HT45WJ9H0jAQdsraCSB8cfcl5Pd32gZxOMg1uUwu2xbvkhE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748017077; c=relaxed/simple;
	bh=McoGr/TL/LYPFBc4/J26+EPgb57P45G4LM7rKKtxFRA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AYQJZNzSb/tskvHmEjPPKsgwuUP0KWQA4t4TD3mcAc+PfrIEfkTRnG38UPO2vv+jgau4uBTpl+B8kIy/FuAjHwAdynM7noCkvdFcutQRbtRsxRaNb4f6hdUqhClqSt0n/dn9zvmxCYphi3//jbMunlVtTCRYyPfdnsJ9ta/txDQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=F5+cDv9L; arc=fail smtp.client-ip=40.107.247.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="F5+cDv9L"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QlrV3LFRGdupg/kUXSii/ucnFDwxpTMiU1iPbFowet83fWUL+90zl/F4XExg2jQahh2X9D2jMXZEJ6L2xFZ/tL780yI2gzDZbclumUGY00aMcLnww+hxeD/ebDHCxIH6m3zvCs1m2hj8PB1Zr1gapZh+GgKLay+29f3rWsAwwK92JfVLSJag6xgv6iHg2MSg3XIEaBj0HdjfajET0p/KljOh8HlB+LfIT5CN+iQdaTI7X2o1uT+7Xzul0kEuWgwjBkL9FDssceuIqcGplhUJ7/TTU/g1jzLlUdXDldWIE6gpmXm7gmCoj2T/o9N/rBXfHXOz4irjZQoXNERKYf+i9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TmyXCOITD7boG8wxv8lz/15qzWTK/d8pwmxnKz9TXto=;
 b=QakjfGPO3kTZA8iyQWIIFI2UHZtnYOZwx7x7xJqYVG06923VxpznxDYnhmzkxmT7EFzlZAXXBP+XKgIfZ+mkUsuPnzPCu+06AMSHe4ilzYKd70zRLf8m2sAPxobKeLm8n5539nWEx3+2VOifO2LLym/F3ArasZg4P5zqlNjL3X6HOabMx9PAJ2wS+fNRUA8xhEg3J2rc7Ar3MLmfbD6LPHppB+/GVdj6jxgzcWY4eyeDFsTP0oyUYnxONJDfmmhsocDv3uSyUSC+JWKjwcknEmDRlAFBU2Bcs6xUFiUmPhw+3TTC3qu7bKjZPq6D9DY7eWRSCc+Kcw4kE3PfjxtwPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TmyXCOITD7boG8wxv8lz/15qzWTK/d8pwmxnKz9TXto=;
 b=F5+cDv9L+4RtjURDDjkvvBz4OZ7yk8CFbluPJ0GzqgbY5iaiKR+ApqZBTX7qjkKmgR7FDPis3h+Dk22bMqVDOqtHxeuXtA/r1yyDdNgKnik4JhTcPMxJ7tKuDsO8Ej9TpQh/xCWl4+IP3pQgxLNzuVDbqcntiYUZyHb0AEY03zZ6+kVLU07dPqHdPs2y/Lu+RwJy/A3U/copgv5qaGJKjQEl3t4R2mvTPyC/bChNspSVZc+zAKQeVRWLy2MAU/tnqeAOK2THVPMklt4fwa1FveNDl3PUap5zgtRCd5dVFcyzNwRptp7aJOMOdMiTPxkdCQc2u0stkMrVS8Z7h0oxnA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM7PR04MB6966.eurprd04.prod.outlook.com (2603:10a6:20b:109::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Fri, 23 May
 2025 16:17:51 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Fri, 23 May 2025
 16:17:51 +0000
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
Subject: [PATCH 3/6] ARM: dts: vf: remove redundant layer under iomux
Date: Fri, 23 May 2025 12:17:22 -0400
Message-Id: <20250523161726.548682-3-Frank.Li@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: f4409b41-a49f-455d-8273-08dd9a155da0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FPz8E5u+MkEN9e+TM+BCY0xO6591zC9FNiLtr7VENMJC0S91nraQyboepBNC?=
 =?us-ascii?Q?K+WjgwukeOg4/mPdQvT2/mj04ZeiPUDUpGrpHmY0kfDb57Am+FObqQSKW99M?=
 =?us-ascii?Q?y8QqwlJYexKXmZfkJjhtrIgeRJto7tfbrervuHEHNFn0+sZvfHBvYEuQbUNe?=
 =?us-ascii?Q?XT0p5zZUx3Fa0JOf4GPiZz71afSaSyQwE/DDRTObI3sjL0Ws1NEyD8rpvgew?=
 =?us-ascii?Q?R/gFHGu4ylNOsyaxXZfIqJ61CCZAoyEw3Sdgv/pztiegof9Xvhh5IGK+f2AV?=
 =?us-ascii?Q?2+EUq8LfGA42/lefMnCmJawDVseVS9Ls29O6tB0bZs5AP5wAYXzXYo+9PEw2?=
 =?us-ascii?Q?6NDj4kqM/3dBqnM8nKiUJg1LwnZ0nyGHxoUPtNZFgCyHj6tdwXD49WyeVvQo?=
 =?us-ascii?Q?yJsDZ85oDzFx7joP6fuUrl6SvQLp4RWgfy6W1594PLr8GQr75+UaIGjGE0By?=
 =?us-ascii?Q?Sp/gHCuuYMIwCwcvRyKQiZoUxFdOwa5jnw6thh4Z7Y52harTgWcN9YAPD6xP?=
 =?us-ascii?Q?bQL4q4WwTfFxPZQoqBUrzLhoOt1xUZKkV1TU082u5KWp3jAr08pIYyOLjOxD?=
 =?us-ascii?Q?s6vmYydyOPRadQ4kpNwvHH9g4rkuJhu4DvKgjYR/lE9d6lMAwUje8AlQXCRl?=
 =?us-ascii?Q?OOqsNU6jOsiGG5Z7Bc8pilU4ABooX0AuSy9EYR6VX8ZyXXRki3I3e9TFi7d0?=
 =?us-ascii?Q?wL/gqcr+Wwtksn7XWwf6UCy6a2qJdu2tb2rJ/5Ut4tYCiKIr1BJwKXVldrOK?=
 =?us-ascii?Q?Ef+zyMz9tHMnFtQQZ6TYSZBdrt4U4P6+WWF/Iih1wNGJBLkZjUPY7CEjkaFz?=
 =?us-ascii?Q?P6Tex3Gq06wnMXBAxeXkZEu9jLSpOEq27jFro7j19xMxE7yqgyMZHXgHAP8p?=
 =?us-ascii?Q?N+BUtDjnqwWC5MsUIMho8UVJP5zZUfWiEFsJ6/88PkgRzNeaKp5IsbPOMxYx?=
 =?us-ascii?Q?TUBDQT44xqUSNss1zcjLmayzAiI/KO9aUMX2vfhct7M+vIwJXTlaF4xasSze?=
 =?us-ascii?Q?TYdTpegsCWyU9BraybX6nzFBW6Rx0/gBy+q53Ezb5wH4uWiQlopiaOOnaQm4?=
 =?us-ascii?Q?wa4JvKa9lmPOn9eec4qiWT389pKTYyELwCDqYtI8wugafqqlyFVgHGcluHMl?=
 =?us-ascii?Q?LmhMNFvS/6xo2Mg6TQ18Qsy9poTDiUKxPFDAVBrnDm4QFNeEwhFghlr+zJm6?=
 =?us-ascii?Q?rP25zT0hAc1FNvDgAT+BWVi7knh9sHJbu2iMdbUMQyoVjOnZIKM/1r41GGYa?=
 =?us-ascii?Q?R2oYwEjnwQpv2fHDlQW3iBrmJwdENXOAgwnPc5VLXb4mFNXl3USdis4SDA+G?=
 =?us-ascii?Q?vKNWqwNY6X8SCkcr+1DTrOvy4jWIireHuyefK2W55r2Q3K84MQP5LPs29QDB?=
 =?us-ascii?Q?0xCKXW8yWS0v69dPZznrp6+nWl0ZIftBAZDhxvbEd4BXgAI3DycPSROauW11?=
 =?us-ascii?Q?9ckWlwE7rpm6qjRSAuYluQk5Kn/2+1cdQe92Nvxcvn8dxxPiMrPj6tyTgnMh?=
 =?us-ascii?Q?WPVsIKf1rMMD+Ko=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JC9K3pR4Qzj8L4Qxfq7+1ktSRtP8ZKGtECt8BLiLGqx7T+uo5tkXo0buY92X?=
 =?us-ascii?Q?Cb6o/Y3tVde2EAJOjla8yIXg0WEkMQ+43taAAp7YTA+wr2OgdA2h4umlNd78?=
 =?us-ascii?Q?47svZ8+mNMSOaXH9LuFug7HhRn6D3fbGiuDScoQbK8f6Sb+VoAbxSvKR6s1Q?=
 =?us-ascii?Q?DZzpo9K5aUguHOu2Q9ZcDc8nboUQMChljHJHPMhHhN8FzJJah86KARXt88NA?=
 =?us-ascii?Q?7fzyhktcOixnBGZNe8WP2MIY6NPmeftM2in5Sm/CI9sdGeLwf8pwd3+sKk8X?=
 =?us-ascii?Q?F5R6Hh7OemwpE9tTBS7PF2czI60ffkho/1BKhmpUa9C1FtaxYfVBJdJsHZVc?=
 =?us-ascii?Q?DZ7ewSaaFlkG52edzt6uAAKt11M93PH0Dm4aoq4elmjRbcxwc9aPkJbHTPz2?=
 =?us-ascii?Q?t0tVakKMgPG4rZPON63DSITbCUNR+tZfW3UivqW/799EO9G1PsE1hSAdcNyS?=
 =?us-ascii?Q?oU8Ety6BZdwB4eNBuBZxv46XIANPzAnTyRWgd2CKpgyA8AhY13R9ZEZG2R/v?=
 =?us-ascii?Q?Qk7Yaj4gLryT4zsCsjwe+kvFRAaMDi1aEEL7SbIUw+SEmooNt1qwo6Q3A4IL?=
 =?us-ascii?Q?ubbbzRMPzx51TOrNl7+l9RwYb8vn4lMQDqXRhATN4dah5uXg3tAsVDmBopo+?=
 =?us-ascii?Q?ZNs1QTjrJIphofRDtRCiA5QsuwkdacfsaohG7SwrNmeCpTpfcBy+vCk5w1oP?=
 =?us-ascii?Q?PWeBwUNjwfwiXcBOYlAjXamUQSlz2BIN/VIun5TkEkKF84qtZv8SklBoiqmS?=
 =?us-ascii?Q?ol9h7HYc/LGwxs0WZ44AEO6boPqPib5VH9vmbDaK7gW3dC9uBEjKNpu/sf9v?=
 =?us-ascii?Q?qp+XktoXK+g/nfdEFmZWs2BlpkTreb2tpSMuZ1SUY+OPsEH+j7Hj29N7Et5r?=
 =?us-ascii?Q?J+5m3vP1n4J3AkLkEetog1koH0TToX8gVJIWG8WImMPkLM1EW30/iUjj0ODZ?=
 =?us-ascii?Q?ZvvL/23sNpFq2jCfWqJOEIkPtE9cPYOBKWwSaA0hhqbjLucjRm6defOQNN/m?=
 =?us-ascii?Q?lFoJ9Qt436VChd9jXWCEin2Gnr4zfFk3KQiIIiobXqxEAFDqR4w6lCXaF3ct?=
 =?us-ascii?Q?vrdcAmAt8FqaSD3qLxfDgbUmNP3cDUXN+ZEmggOIABDcZN3rwcshfVQHm5/B?=
 =?us-ascii?Q?7SWRXjkkLlpHd8HlRsoUAj8mCFkTwG9QdVIjdqOBahVrbe71HRHoBJnvkQPK?=
 =?us-ascii?Q?UlD/ZkMMleWYFXt0VUEaULZVx76+BFZzkz0nT7zR8F5aOd51ni6ctw8OsLSk?=
 =?us-ascii?Q?s2mBHzQZPmN/obEx21Zt75Uouwymm2dniDlwssFmBbXos5byhOG2gvFCQkhX?=
 =?us-ascii?Q?WdiqJRJUXyWGFzAbw3dT+O3R/PT2kr2iJIobpltmg72T4b32j+I26n10FIqe?=
 =?us-ascii?Q?wMgpWOwyyUkaRw854sx2rBEN29wtbol1aTHMdn12DJzx+2+nCbAeDOcLTR6s?=
 =?us-ascii?Q?Nj7hZjczG7Jm6FxA6/VVCvhpUpMIZa3UItzkxIETn6duwhPxTAVvRgvWau9D?=
 =?us-ascii?Q?vDvVC7T6EG7JUD9dLM9mQalEERTtqlEdG4LlyHsBhUnp+8H2RaARkM1PiknZ?=
 =?us-ascii?Q?bXNOCtou1R0y8YPlfZOihOeWtbbOJrEhISGC7H8i?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4409b41-a49f-455d-8273-08dd9a155da0
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2025 16:17:51.6947
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jIqER/oZuDWW7kpwAZ7wg2qt9qog8ZyOrnGAHldhgDzZA44TpsaFUTF/MljJh2UJUIhP4Me69mYUUUVRAh1o9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6966

Remove redundant layer under iomux and add grp surfix for pinmux node name
to fix below CHECK_DTB warning:

arch/arm/boot/dts/nxp/vf/vf610-colibri-eval-v3.dtb: pinctrl@40048000 (fsl,vf610-iomuxc):
    Unevaluated properties are not allowed ('vf610-colibri' was unexpected)

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../boot/dts/nxp/vf/vf-colibri-eval-v3.dtsi   |  10 +-
 arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi      | 348 +++++++++---------
 arch/arm/boot/dts/nxp/vf/vf500-colibri.dtsi   |  44 ++-
 arch/arm/boot/dts/nxp/vf/vf610-bk4.dts        |   2 +-
 arch/arm/boot/dts/nxp/vf/vf610-cosmic.dts     |  60 ++-
 arch/arm/boot/dts/nxp/vf/vf610-twr.dts        | 228 ++++++------
 arch/arm/boot/dts/nxp/vf/vf610-zii-cfu1.dts   |   2 +-
 .../boot/dts/nxp/vf/vf610-zii-dev-rev-c.dts   |   8 +-
 .../boot/dts/nxp/vf/vf610-zii-scu4-aib.dts    |   8 +-
 arch/arm/boot/dts/nxp/vf/vf610-zii-spb4.dts   |   4 +-
 .../boot/dts/nxp/vf/vf610-zii-ssmb-dtu.dts    |   6 +-
 .../boot/dts/nxp/vf/vf610-zii-ssmb-spu3.dts   |   4 +-
 arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dts  |  16 +-
 arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dts   |  12 +-
 14 files changed, 369 insertions(+), 383 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/vf/vf-colibri-eval-v3.dtsi b/arch/arm/boot/dts/nxp/vf/vf-colibri-eval-v3.dtsi
index 5a19da9313ae6..69c6647118e14 100644
--- a/arch/arm/boot/dts/nxp/vf/vf-colibri-eval-v3.dtsi
+++ b/arch/arm/boot/dts/nxp/vf/vf-colibri-eval-v3.dtsi
@@ -142,11 +142,9 @@ &usbh1 {
 };
 
 &iomuxc {
-	vf610-colibri {
-		pinctrl_can_int: can_int {
-			fsl,pins = <
-				VF610_PAD_PTB21__GPIO_43	0x22ed
-			>;
-		};
+	pinctrl_can_int: can_intgrp {
+		fsl,pins = <
+			VF610_PAD_PTB21__GPIO_43	0x22ed
+		>;
 	};
 };
diff --git a/arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi b/arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi
index cc1e069c44e62..98f9ee1b00306 100644
--- a/arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi
+++ b/arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi
@@ -171,180 +171,178 @@ &usbphy1 {
 };
 
 &iomuxc {
-	vf610-colibri {
-		pinctrl_flexcan0: can0grp {
-			fsl,pins = <
-				VF610_PAD_PTB14__CAN0_RX	0x31F1
-				VF610_PAD_PTB15__CAN0_TX	0x31F2
-			>;
-		};
-
-		pinctrl_flexcan1: can1grp {
-			fsl,pins = <
-				VF610_PAD_PTB16__CAN1_RX	0x31F1
-				VF610_PAD_PTB17__CAN1_TX	0x31F2
-			>;
-		};
-
-		pinctrl_gpio_ext: gpio_ext {
-			fsl,pins = <
-				VF610_PAD_PTD10__GPIO_89	0x22ed /* EXT_IO_0 */
-				VF610_PAD_PTD9__GPIO_88		0x22ed /* EXT_IO_1 */
-				VF610_PAD_PTD26__GPIO_68	0x22ed /* EXT_IO_2 */
-			>;
-		};
-
-		pinctrl_dcu0_1: dcu0grp_1 {
-			fsl,pins = <
-				VF610_PAD_PTE0__DCU0_HSYNC	0x1902
-				VF610_PAD_PTE1__DCU0_VSYNC	0x1902
-				VF610_PAD_PTE2__DCU0_PCLK	0x1902
-				VF610_PAD_PTE4__DCU0_DE		0x1902
-				VF610_PAD_PTE5__DCU0_R0		0x1902
-				VF610_PAD_PTE6__DCU0_R1		0x1902
-				VF610_PAD_PTE7__DCU0_R2		0x1902
-				VF610_PAD_PTE8__DCU0_R3		0x1902
-				VF610_PAD_PTE9__DCU0_R4		0x1902
-				VF610_PAD_PTE10__DCU0_R5	0x1902
-				VF610_PAD_PTE11__DCU0_R6	0x1902
-				VF610_PAD_PTE12__DCU0_R7	0x1902
-				VF610_PAD_PTE13__DCU0_G0	0x1902
-				VF610_PAD_PTE14__DCU0_G1	0x1902
-				VF610_PAD_PTE15__DCU0_G2	0x1902
-				VF610_PAD_PTE16__DCU0_G3	0x1902
-				VF610_PAD_PTE17__DCU0_G4	0x1902
-				VF610_PAD_PTE18__DCU0_G5	0x1902
-				VF610_PAD_PTE19__DCU0_G6	0x1902
-				VF610_PAD_PTE20__DCU0_G7	0x1902
-				VF610_PAD_PTE21__DCU0_B0	0x1902
-				VF610_PAD_PTE22__DCU0_B1	0x1902
-				VF610_PAD_PTE23__DCU0_B2	0x1902
-				VF610_PAD_PTE24__DCU0_B3	0x1902
-				VF610_PAD_PTE25__DCU0_B4	0x1902
-				VF610_PAD_PTE26__DCU0_B5	0x1902
-				VF610_PAD_PTE27__DCU0_B6	0x1902
-				VF610_PAD_PTE28__DCU0_B7	0x1902
-			>;
-		};
-
-		pinctrl_dspi1: dspi1grp {
-			fsl,pins = <
-				VF610_PAD_PTD5__DSPI1_CS0		0x33e2
-				VF610_PAD_PTD6__DSPI1_SIN		0x33e1
-				VF610_PAD_PTD7__DSPI1_SOUT		0x33e2
-				VF610_PAD_PTD8__DSPI1_SCK		0x33e2
-			>;
-		};
-
-		pinctrl_esdhc1: esdhc1grp {
-			fsl,pins = <
-				VF610_PAD_PTA24__ESDHC1_CLK	0x31ef
-				VF610_PAD_PTA25__ESDHC1_CMD	0x31ef
-				VF610_PAD_PTA26__ESDHC1_DAT0	0x31ef
-				VF610_PAD_PTA27__ESDHC1_DAT1	0x31ef
-				VF610_PAD_PTA28__ESDHC1_DATA2	0x31ef
-				VF610_PAD_PTA29__ESDHC1_DAT3	0x31ef
-				VF610_PAD_PTB20__GPIO_42	0x219d
-			>;
-		};
-
-		pinctrl_fec1: fec1grp {
-			fsl,pins = <
-				VF610_PAD_PTA6__RMII_CLKOUT		0x30d2
-				VF610_PAD_PTC9__ENET_RMII1_MDC		0x30d2
-				VF610_PAD_PTC10__ENET_RMII1_MDIO	0x30d3
-				VF610_PAD_PTC11__ENET_RMII1_CRS		0x30d1
-				VF610_PAD_PTC12__ENET_RMII1_RXD1	0x30d1
-				VF610_PAD_PTC13__ENET_RMII1_RXD0	0x30d1
-				VF610_PAD_PTC14__ENET_RMII1_RXER	0x30d1
-				VF610_PAD_PTC15__ENET_RMII1_TXD1	0x30d2
-				VF610_PAD_PTC16__ENET_RMII1_TXD0	0x30d2
-				VF610_PAD_PTC17__ENET_RMII1_TXEN	0x30d2
-			>;
-		};
-
-		pinctrl_gpio_bl_on: gpio_bl_on {
-			fsl,pins = <
-				VF610_PAD_PTC0__GPIO_45		0x22ef
-			>;
-		};
-
-		pinctrl_i2c0: i2c0grp {
-			fsl,pins = <
-				VF610_PAD_PTB14__I2C0_SCL		0x37ff
-				VF610_PAD_PTB15__I2C0_SDA		0x37ff
-			>;
-		};
-
-		pinctrl_i2c0_gpio: i2c0gpiogrp {
-			fsl,pins = <
-				VF610_PAD_PTB14__GPIO_36		0x37ff
-				VF610_PAD_PTB15__GPIO_37		0x37ff
-			>;
-		};
-
-		pinctrl_nfc: nfcgrp {
-			fsl,pins = <
-				VF610_PAD_PTD23__NF_IO7		0x28df
-				VF610_PAD_PTD22__NF_IO6		0x28df
-				VF610_PAD_PTD21__NF_IO5		0x28df
-				VF610_PAD_PTD20__NF_IO4		0x28df
-				VF610_PAD_PTD19__NF_IO3		0x28df
-				VF610_PAD_PTD18__NF_IO2		0x28df
-				VF610_PAD_PTD17__NF_IO1		0x28df
-				VF610_PAD_PTD16__NF_IO0		0x28df
-				VF610_PAD_PTB24__NF_WE_B	0x28c2
-				VF610_PAD_PTB25__NF_CE0_B	0x28c2
-				VF610_PAD_PTB27__NF_RE_B	0x28c2
-				VF610_PAD_PTC26__NF_RB_B	0x283d
-				VF610_PAD_PTC27__NF_ALE		0x28c2
-				VF610_PAD_PTC28__NF_CLE		0x28c2
-			>;
-		};
-
-		pinctrl_pwm0: pwm0grp {
-			fsl,pins = <
-				VF610_PAD_PTB0__FTM0_CH0		0x1182
-				VF610_PAD_PTB1__FTM0_CH1		0x1182
-			>;
-		};
-
-		pinctrl_pwm1: pwm1grp {
-			fsl,pins = <
-				VF610_PAD_PTB8__FTM1_CH0		0x1182
-				VF610_PAD_PTB9__FTM1_CH1		0x1182
-			>;
-		};
-
-		pinctrl_uart0: uart0grp {
-			fsl,pins = <
-				VF610_PAD_PTB10__UART0_TX		0x21a2
-				VF610_PAD_PTB11__UART0_RX		0x21a1
-				VF610_PAD_PTB12__UART0_RTS		0x21a2
-				VF610_PAD_PTB13__UART0_CTS		0x21a1
-			>;
-		};
-
-		pinctrl_uart1: uart1grp {
-			fsl,pins = <
-				VF610_PAD_PTB4__UART1_TX		0x21a2
-				VF610_PAD_PTB5__UART1_RX		0x21a1
-			>;
-		};
-
-		pinctrl_uart2: uart2grp {
-			fsl,pins = <
-				VF610_PAD_PTD0__UART2_TX		0x21a2
-				VF610_PAD_PTD1__UART2_RX		0x21a1
-				VF610_PAD_PTD2__UART2_RTS		0x21a2
-				VF610_PAD_PTD3__UART2_CTS		0x21a1
-			>;
-		};
-
-		pinctrl_usbh1_reg: gpio_usb_vbus {
-			fsl,pins = <
-				VF610_PAD_PTD4__GPIO_83			0x22ed
-			>;
-		};
+	pinctrl_flexcan0: can0grp {
+		fsl,pins = <
+			VF610_PAD_PTB14__CAN0_RX	0x31F1
+			VF610_PAD_PTB15__CAN0_TX	0x31F2
+		>;
+	};
+
+	pinctrl_flexcan1: can1grp {
+		fsl,pins = <
+			VF610_PAD_PTB16__CAN1_RX	0x31F1
+			VF610_PAD_PTB17__CAN1_TX	0x31F2
+		>;
+	};
+
+	pinctrl_gpio_ext: gpio_extgrp {
+		fsl,pins = <
+			VF610_PAD_PTD10__GPIO_89	0x22ed /* EXT_IO_0 */
+			VF610_PAD_PTD9__GPIO_88		0x22ed /* EXT_IO_1 */
+			VF610_PAD_PTD26__GPIO_68	0x22ed /* EXT_IO_2 */
+		>;
+	};
+
+	pinctrl_dcu0_1: dcu01grp {
+		fsl,pins = <
+			VF610_PAD_PTE0__DCU0_HSYNC	0x1902
+			VF610_PAD_PTE1__DCU0_VSYNC	0x1902
+			VF610_PAD_PTE2__DCU0_PCLK	0x1902
+			VF610_PAD_PTE4__DCU0_DE		0x1902
+			VF610_PAD_PTE5__DCU0_R0		0x1902
+			VF610_PAD_PTE6__DCU0_R1		0x1902
+			VF610_PAD_PTE7__DCU0_R2		0x1902
+			VF610_PAD_PTE8__DCU0_R3		0x1902
+			VF610_PAD_PTE9__DCU0_R4		0x1902
+			VF610_PAD_PTE10__DCU0_R5	0x1902
+			VF610_PAD_PTE11__DCU0_R6	0x1902
+			VF610_PAD_PTE12__DCU0_R7	0x1902
+			VF610_PAD_PTE13__DCU0_G0	0x1902
+			VF610_PAD_PTE14__DCU0_G1	0x1902
+			VF610_PAD_PTE15__DCU0_G2	0x1902
+			VF610_PAD_PTE16__DCU0_G3	0x1902
+			VF610_PAD_PTE17__DCU0_G4	0x1902
+			VF610_PAD_PTE18__DCU0_G5	0x1902
+			VF610_PAD_PTE19__DCU0_G6	0x1902
+			VF610_PAD_PTE20__DCU0_G7	0x1902
+			VF610_PAD_PTE21__DCU0_B0	0x1902
+			VF610_PAD_PTE22__DCU0_B1	0x1902
+			VF610_PAD_PTE23__DCU0_B2	0x1902
+			VF610_PAD_PTE24__DCU0_B3	0x1902
+			VF610_PAD_PTE25__DCU0_B4	0x1902
+			VF610_PAD_PTE26__DCU0_B5	0x1902
+			VF610_PAD_PTE27__DCU0_B6	0x1902
+			VF610_PAD_PTE28__DCU0_B7	0x1902
+		>;
+	};
+
+	pinctrl_dspi1: dspi1grp {
+		fsl,pins = <
+			VF610_PAD_PTD5__DSPI1_CS0		0x33e2
+			VF610_PAD_PTD6__DSPI1_SIN		0x33e1
+			VF610_PAD_PTD7__DSPI1_SOUT		0x33e2
+			VF610_PAD_PTD8__DSPI1_SCK		0x33e2
+		>;
+	};
+
+	pinctrl_esdhc1: esdhc1grp {
+		fsl,pins = <
+			VF610_PAD_PTA24__ESDHC1_CLK	0x31ef
+			VF610_PAD_PTA25__ESDHC1_CMD	0x31ef
+			VF610_PAD_PTA26__ESDHC1_DAT0	0x31ef
+			VF610_PAD_PTA27__ESDHC1_DAT1	0x31ef
+			VF610_PAD_PTA28__ESDHC1_DATA2	0x31ef
+			VF610_PAD_PTA29__ESDHC1_DAT3	0x31ef
+			VF610_PAD_PTB20__GPIO_42	0x219d
+		>;
+	};
+
+	pinctrl_fec1: fec1grp {
+		fsl,pins = <
+			VF610_PAD_PTA6__RMII_CLKOUT		0x30d2
+			VF610_PAD_PTC9__ENET_RMII1_MDC		0x30d2
+			VF610_PAD_PTC10__ENET_RMII1_MDIO	0x30d3
+			VF610_PAD_PTC11__ENET_RMII1_CRS		0x30d1
+			VF610_PAD_PTC12__ENET_RMII1_RXD1	0x30d1
+			VF610_PAD_PTC13__ENET_RMII1_RXD0	0x30d1
+			VF610_PAD_PTC14__ENET_RMII1_RXER	0x30d1
+			VF610_PAD_PTC15__ENET_RMII1_TXD1	0x30d2
+			VF610_PAD_PTC16__ENET_RMII1_TXD0	0x30d2
+			VF610_PAD_PTC17__ENET_RMII1_TXEN	0x30d2
+		>;
+	};
+
+	pinctrl_gpio_bl_on: gpio_bl_ongrp {
+		fsl,pins = <
+			VF610_PAD_PTC0__GPIO_45		0x22ef
+		>;
+	};
+
+	pinctrl_i2c0: i2c0grp {
+		fsl,pins = <
+			VF610_PAD_PTB14__I2C0_SCL		0x37ff
+			VF610_PAD_PTB15__I2C0_SDA		0x37ff
+		>;
+	};
+
+	pinctrl_i2c0_gpio: i2c0gpiogrp {
+		fsl,pins = <
+			VF610_PAD_PTB14__GPIO_36		0x37ff
+			VF610_PAD_PTB15__GPIO_37		0x37ff
+		>;
+	};
+
+	pinctrl_nfc: nfcgrp {
+		fsl,pins = <
+			VF610_PAD_PTD23__NF_IO7		0x28df
+			VF610_PAD_PTD22__NF_IO6		0x28df
+			VF610_PAD_PTD21__NF_IO5		0x28df
+			VF610_PAD_PTD20__NF_IO4		0x28df
+			VF610_PAD_PTD19__NF_IO3		0x28df
+			VF610_PAD_PTD18__NF_IO2		0x28df
+			VF610_PAD_PTD17__NF_IO1		0x28df
+			VF610_PAD_PTD16__NF_IO0		0x28df
+			VF610_PAD_PTB24__NF_WE_B	0x28c2
+			VF610_PAD_PTB25__NF_CE0_B	0x28c2
+			VF610_PAD_PTB27__NF_RE_B	0x28c2
+			VF610_PAD_PTC26__NF_RB_B	0x283d
+			VF610_PAD_PTC27__NF_ALE		0x28c2
+			VF610_PAD_PTC28__NF_CLE		0x28c2
+		>;
+	};
+
+	pinctrl_pwm0: pwm0grp {
+		fsl,pins = <
+			VF610_PAD_PTB0__FTM0_CH0		0x1182
+			VF610_PAD_PTB1__FTM0_CH1		0x1182
+		>;
+	};
+
+	pinctrl_pwm1: pwm1grp {
+		fsl,pins = <
+			VF610_PAD_PTB8__FTM1_CH0		0x1182
+			VF610_PAD_PTB9__FTM1_CH1		0x1182
+		>;
+	};
+
+	pinctrl_uart0: uart0grp {
+		fsl,pins = <
+			VF610_PAD_PTB10__UART0_TX		0x21a2
+			VF610_PAD_PTB11__UART0_RX		0x21a1
+			VF610_PAD_PTB12__UART0_RTS		0x21a2
+			VF610_PAD_PTB13__UART0_CTS		0x21a1
+		>;
+	};
+
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			VF610_PAD_PTB4__UART1_TX		0x21a2
+			VF610_PAD_PTB5__UART1_RX		0x21a1
+		>;
+	};
+
+	pinctrl_uart2: uart2grp {
+		fsl,pins = <
+			VF610_PAD_PTD0__UART2_TX		0x21a2
+			VF610_PAD_PTD1__UART2_RX		0x21a1
+			VF610_PAD_PTD2__UART2_RTS		0x21a2
+			VF610_PAD_PTD3__UART2_CTS		0x21a1
+		>;
+	};
+
+	pinctrl_usbh1_reg: gpio_usb_vbusgrp {
+		fsl,pins = <
+			VF610_PAD_PTD4__GPIO_83			0x22ed
+		>;
 	};
 };
diff --git a/arch/arm/boot/dts/nxp/vf/vf500-colibri.dtsi b/arch/arm/boot/dts/nxp/vf/vf500-colibri.dtsi
index 8af7ed56e6539..ae3403c766d69 100644
--- a/arch/arm/boot/dts/nxp/vf/vf500-colibri.dtsi
+++ b/arch/arm/boot/dts/nxp/vf/vf500-colibri.dtsi
@@ -40,30 +40,28 @@ &nfc {
 };
 
 &iomuxc {
-	vf610-colibri {
-		pinctrl_touchctrl_idle: touchctrl_idle {
-			fsl,pins = <
-				VF610_PAD_PTA18__GPIO_8		0x006d
-				VF610_PAD_PTA19__GPIO_9		0x006c
-				>;
-		};
+	pinctrl_touchctrl_idle: touchctrl_idlegrp {
+		fsl,pins = <
+			VF610_PAD_PTA18__GPIO_8		0x006d
+			VF610_PAD_PTA19__GPIO_9		0x006c
+			>;
+	};
 
-		pinctrl_touchctrl_default: touchctrl_default {
-			fsl,pins = <
-				VF610_PAD_PTA18__ADC0_SE0	0x0040
-				VF610_PAD_PTA19__ADC0_SE1	0x0040
-				VF610_PAD_PTA16__ADC1_SE0	0x0040
-				VF610_PAD_PTB2__ADC1_SE2	0x0040
-				>;
-		};
+	pinctrl_touchctrl_default: touchctrl_defaultgrp {
+		fsl,pins = <
+			VF610_PAD_PTA18__ADC0_SE0	0x0040
+			VF610_PAD_PTA19__ADC0_SE1	0x0040
+			VF610_PAD_PTA16__ADC1_SE0	0x0040
+			VF610_PAD_PTB2__ADC1_SE2	0x0040
+			>;
+	};
 
-		pinctrl_touchctrl_gpios: touchctrl_gpios {
-			fsl,pins = <
-				VF610_PAD_PTA23__GPIO_13	0x22e9
-				VF610_PAD_PTB23__GPIO_93	0x22e9
-				VF610_PAD_PTA22__GPIO_12	0x22e9
-				VF610_PAD_PTA11__GPIO_4		0x22e9
-				>;
-		};
+	pinctrl_touchctrl_gpios: touchctrl_gpiosgrp {
+		fsl,pins = <
+			VF610_PAD_PTA23__GPIO_13	0x22e9
+			VF610_PAD_PTB23__GPIO_93	0x22e9
+			VF610_PAD_PTA22__GPIO_12	0x22e9
+			VF610_PAD_PTA11__GPIO_4		0x22e9
+			>;
 	};
 };
diff --git a/arch/arm/boot/dts/nxp/vf/vf610-bk4.dts b/arch/arm/boot/dts/nxp/vf/vf610-bk4.dts
index 2492fb99956ce..e36c854dc2974 100644
--- a/arch/arm/boot/dts/nxp/vf/vf610-bk4.dts
+++ b/arch/arm/boot/dts/nxp/vf/vf610-bk4.dts
@@ -458,7 +458,7 @@ VF610_PAD_PTE16__GPIO_121	0x1183
 		>;
 	};
 
-	pinctrl_gpio_spi: pinctrl-gpio-spi {
+	pinctrl_gpio_spi: pinctrl-gpio-spigrp {
 		fsl,pins = <
 			VF610_PAD_PTB18__GPIO_40        0x1183
 			VF610_PAD_PTD10__GPIO_89        0x1183
diff --git a/arch/arm/boot/dts/nxp/vf/vf610-cosmic.dts b/arch/arm/boot/dts/nxp/vf/vf610-cosmic.dts
index 703f375d7e240..f1e6344b0c697 100644
--- a/arch/arm/boot/dts/nxp/vf/vf610-cosmic.dts
+++ b/arch/arm/boot/dts/nxp/vf/vf610-cosmic.dts
@@ -47,39 +47,37 @@ &fec1 {
 };
 
 &iomuxc {
-	vf610-cosmic {
-		pinctrl_esdhc1: esdhc1grp {
-			fsl,pins = <
-				VF610_PAD_PTA24__ESDHC1_CLK	0x31ef
-				VF610_PAD_PTA25__ESDHC1_CMD	0x31ef
-				VF610_PAD_PTA26__ESDHC1_DAT0	0x31ef
-				VF610_PAD_PTA27__ESDHC1_DAT1	0x31ef
-				VF610_PAD_PTA28__ESDHC1_DATA2	0x31ef
-				VF610_PAD_PTA29__ESDHC1_DAT3	0x31ef
-				VF610_PAD_PTB28__GPIO_98	0x219d
-			>;
-		};
+	pinctrl_esdhc1: esdhc1grp {
+		fsl,pins = <
+			VF610_PAD_PTA24__ESDHC1_CLK	0x31ef
+			VF610_PAD_PTA25__ESDHC1_CMD	0x31ef
+			VF610_PAD_PTA26__ESDHC1_DAT0	0x31ef
+			VF610_PAD_PTA27__ESDHC1_DAT1	0x31ef
+			VF610_PAD_PTA28__ESDHC1_DATA2	0x31ef
+			VF610_PAD_PTA29__ESDHC1_DAT3	0x31ef
+			VF610_PAD_PTB28__GPIO_98	0x219d
+		>;
+	};
 
-		pinctrl_fec1: fec1grp {
-			fsl,pins = <
-				VF610_PAD_PTC9__ENET_RMII1_MDC		0x30d2
-				VF610_PAD_PTC10__ENET_RMII1_MDIO	0x30d3
-				VF610_PAD_PTC11__ENET_RMII1_CRS		0x30d1
-				VF610_PAD_PTC12__ENET_RMII1_RXD1	0x30d1
-				VF610_PAD_PTC13__ENET_RMII1_RXD0	0x30d1
-				VF610_PAD_PTC14__ENET_RMII1_RXER	0x30d1
-				VF610_PAD_PTC15__ENET_RMII1_TXD1	0x30d2
-				VF610_PAD_PTC16__ENET_RMII1_TXD0	0x30d2
-				VF610_PAD_PTC17__ENET_RMII1_TXEN	0x30d2
-			>;
-		};
+	pinctrl_fec1: fec1grp {
+		fsl,pins = <
+			VF610_PAD_PTC9__ENET_RMII1_MDC		0x30d2
+			VF610_PAD_PTC10__ENET_RMII1_MDIO	0x30d3
+			VF610_PAD_PTC11__ENET_RMII1_CRS		0x30d1
+			VF610_PAD_PTC12__ENET_RMII1_RXD1	0x30d1
+			VF610_PAD_PTC13__ENET_RMII1_RXD0	0x30d1
+			VF610_PAD_PTC14__ENET_RMII1_RXER	0x30d1
+			VF610_PAD_PTC15__ENET_RMII1_TXD1	0x30d2
+			VF610_PAD_PTC16__ENET_RMII1_TXD0	0x30d2
+			VF610_PAD_PTC17__ENET_RMII1_TXEN	0x30d2
+		>;
+	};
 
-		pinctrl_uart1: uart1grp {
-			fsl,pins = <
-				VF610_PAD_PTB4__UART1_TX		0x21a2
-				VF610_PAD_PTB5__UART1_RX		0x21a1
-			>;
-		};
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			VF610_PAD_PTB4__UART1_TX		0x21a2
+			VF610_PAD_PTB5__UART1_RX		0x21a1
+		>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/nxp/vf/vf610-twr.dts b/arch/arm/boot/dts/nxp/vf/vf610-twr.dts
index 876c14ecceb69..e7c2f6d46ab23 100644
--- a/arch/arm/boot/dts/nxp/vf/vf610-twr.dts
+++ b/arch/arm/boot/dts/nxp/vf/vf610-twr.dts
@@ -166,131 +166,129 @@ codec: sgtl5000@a {
 };
 
 &iomuxc {
-	vf610-twr {
-		pinctrl_adc0_ad5: adc0ad5grp {
-			fsl,pins = <
-				VF610_PAD_PTC30__ADC0_SE5		0xa1
-			>;
-		};
+	pinctrl_adc0_ad5: adc0ad5grp {
+		fsl,pins = <
+			VF610_PAD_PTC30__ADC0_SE5		0xa1
+		>;
+	};
 
-		pinctrl_dspi0: dspi0grp {
-			fsl,pins = <
-				VF610_PAD_PTB19__DSPI0_CS0		0x1182
-				VF610_PAD_PTB20__DSPI0_SIN		0x1181
-				VF610_PAD_PTB21__DSPI0_SOUT		0x1182
-				VF610_PAD_PTB22__DSPI0_SCK		0x1182
-			>;
-		};
+	pinctrl_dspi0: dspi0grp {
+		fsl,pins = <
+			VF610_PAD_PTB19__DSPI0_CS0		0x1182
+			VF610_PAD_PTB20__DSPI0_SIN		0x1181
+			VF610_PAD_PTB21__DSPI0_SOUT		0x1182
+			VF610_PAD_PTB22__DSPI0_SCK		0x1182
+		>;
+	};
 
-		pinctrl_esdhc1: esdhc1grp {
-			fsl,pins = <
-				VF610_PAD_PTA24__ESDHC1_CLK	0x31ef
-				VF610_PAD_PTA25__ESDHC1_CMD	0x31ef
-				VF610_PAD_PTA26__ESDHC1_DAT0	0x31ef
-				VF610_PAD_PTA27__ESDHC1_DAT1	0x31ef
-				VF610_PAD_PTA28__ESDHC1_DATA2	0x31ef
-				VF610_PAD_PTA29__ESDHC1_DAT3	0x31ef
-				VF610_PAD_PTA7__GPIO_134	0x219d
-			>;
-		};
+	pinctrl_esdhc1: esdhc1grp {
+		fsl,pins = <
+			VF610_PAD_PTA24__ESDHC1_CLK	0x31ef
+			VF610_PAD_PTA25__ESDHC1_CMD	0x31ef
+			VF610_PAD_PTA26__ESDHC1_DAT0	0x31ef
+			VF610_PAD_PTA27__ESDHC1_DAT1	0x31ef
+			VF610_PAD_PTA28__ESDHC1_DATA2	0x31ef
+			VF610_PAD_PTA29__ESDHC1_DAT3	0x31ef
+			VF610_PAD_PTA7__GPIO_134	0x219d
+		>;
+	};
 
-		pinctrl_fec0: fec0grp {
-			fsl,pins = <
-				VF610_PAD_PTA6__RMII_CLKIN		0x30d1
-				VF610_PAD_PTC0__ENET_RMII0_MDC		0x30d3
-				VF610_PAD_PTC1__ENET_RMII0_MDIO		0x30d1
-				VF610_PAD_PTC2__ENET_RMII0_CRS		0x30d1
-				VF610_PAD_PTC3__ENET_RMII0_RXD1		0x30d1
-				VF610_PAD_PTC4__ENET_RMII0_RXD0		0x30d1
-				VF610_PAD_PTC5__ENET_RMII0_RXER		0x30d1
-				VF610_PAD_PTC6__ENET_RMII0_TXD1		0x30d2
-				VF610_PAD_PTC7__ENET_RMII0_TXD0		0x30d2
-				VF610_PAD_PTC8__ENET_RMII0_TXEN		0x30d2
-			>;
-		};
+	pinctrl_fec0: fec0grp {
+		fsl,pins = <
+			VF610_PAD_PTA6__RMII_CLKIN		0x30d1
+			VF610_PAD_PTC0__ENET_RMII0_MDC		0x30d3
+			VF610_PAD_PTC1__ENET_RMII0_MDIO		0x30d1
+			VF610_PAD_PTC2__ENET_RMII0_CRS		0x30d1
+			VF610_PAD_PTC3__ENET_RMII0_RXD1		0x30d1
+			VF610_PAD_PTC4__ENET_RMII0_RXD0		0x30d1
+			VF610_PAD_PTC5__ENET_RMII0_RXER		0x30d1
+			VF610_PAD_PTC6__ENET_RMII0_TXD1		0x30d2
+			VF610_PAD_PTC7__ENET_RMII0_TXD0		0x30d2
+			VF610_PAD_PTC8__ENET_RMII0_TXEN		0x30d2
+		>;
+	};
 
-		pinctrl_fec1: fec1grp {
-			fsl,pins = <
-				VF610_PAD_PTC9__ENET_RMII1_MDC		0x30d2
-				VF610_PAD_PTC10__ENET_RMII1_MDIO	0x30d3
-				VF610_PAD_PTC11__ENET_RMII1_CRS		0x30d1
-				VF610_PAD_PTC12__ENET_RMII1_RXD1	0x30d1
-				VF610_PAD_PTC13__ENET_RMII1_RXD0	0x30d1
-				VF610_PAD_PTC14__ENET_RMII1_RXER	0x30d1
-				VF610_PAD_PTC15__ENET_RMII1_TXD1	0x30d2
-				VF610_PAD_PTC16__ENET_RMII1_TXD0	0x30d2
-				VF610_PAD_PTC17__ENET_RMII1_TXEN	0x30d2
-			>;
-		};
+	pinctrl_fec1: fec1grp {
+		fsl,pins = <
+			VF610_PAD_PTC9__ENET_RMII1_MDC		0x30d2
+			VF610_PAD_PTC10__ENET_RMII1_MDIO	0x30d3
+			VF610_PAD_PTC11__ENET_RMII1_CRS		0x30d1
+			VF610_PAD_PTC12__ENET_RMII1_RXD1	0x30d1
+			VF610_PAD_PTC13__ENET_RMII1_RXD0	0x30d1
+			VF610_PAD_PTC14__ENET_RMII1_RXER	0x30d1
+			VF610_PAD_PTC15__ENET_RMII1_TXD1	0x30d2
+			VF610_PAD_PTC16__ENET_RMII1_TXD0	0x30d2
+			VF610_PAD_PTC17__ENET_RMII1_TXEN	0x30d2
+		>;
+	};
 
-		pinctrl_i2c0: i2c0grp {
-			fsl,pins = <
-				VF610_PAD_PTB14__I2C0_SCL		0x30d3
-				VF610_PAD_PTB15__I2C0_SDA		0x30d3
-			>;
-		};
+	pinctrl_i2c0: i2c0grp {
+		fsl,pins = <
+			VF610_PAD_PTB14__I2C0_SCL		0x30d3
+			VF610_PAD_PTB15__I2C0_SDA		0x30d3
+		>;
+	};
 
-		pinctrl_nfc: nfcgrp {
-			fsl,pins = <
-				VF610_PAD_PTD31__NF_IO15	0x28df
-				VF610_PAD_PTD30__NF_IO14	0x28df
-				VF610_PAD_PTD29__NF_IO13	0x28df
-				VF610_PAD_PTD28__NF_IO12	0x28df
-				VF610_PAD_PTD27__NF_IO11	0x28df
-				VF610_PAD_PTD26__NF_IO10	0x28df
-				VF610_PAD_PTD25__NF_IO9		0x28df
-				VF610_PAD_PTD24__NF_IO8		0x28df
-				VF610_PAD_PTD23__NF_IO7		0x28df
-				VF610_PAD_PTD22__NF_IO6		0x28df
-				VF610_PAD_PTD21__NF_IO5		0x28df
-				VF610_PAD_PTD20__NF_IO4		0x28df
-				VF610_PAD_PTD19__NF_IO3		0x28df
-				VF610_PAD_PTD18__NF_IO2		0x28df
-				VF610_PAD_PTD17__NF_IO1		0x28df
-				VF610_PAD_PTD16__NF_IO0		0x28df
-				VF610_PAD_PTB24__NF_WE_B	0x28c2
-				VF610_PAD_PTB25__NF_CE0_B	0x28c2
-				VF610_PAD_PTB27__NF_RE_B	0x28c2
-				VF610_PAD_PTC26__NF_RB_B	0x283d
-				VF610_PAD_PTC27__NF_ALE		0x28c2
-				VF610_PAD_PTC28__NF_CLE		0x28c2
-			>;
-		};
+	pinctrl_nfc: nfcgrp {
+		fsl,pins = <
+			VF610_PAD_PTD31__NF_IO15	0x28df
+			VF610_PAD_PTD30__NF_IO14	0x28df
+			VF610_PAD_PTD29__NF_IO13	0x28df
+			VF610_PAD_PTD28__NF_IO12	0x28df
+			VF610_PAD_PTD27__NF_IO11	0x28df
+			VF610_PAD_PTD26__NF_IO10	0x28df
+			VF610_PAD_PTD25__NF_IO9		0x28df
+			VF610_PAD_PTD24__NF_IO8		0x28df
+			VF610_PAD_PTD23__NF_IO7		0x28df
+			VF610_PAD_PTD22__NF_IO6		0x28df
+			VF610_PAD_PTD21__NF_IO5		0x28df
+			VF610_PAD_PTD20__NF_IO4		0x28df
+			VF610_PAD_PTD19__NF_IO3		0x28df
+			VF610_PAD_PTD18__NF_IO2		0x28df
+			VF610_PAD_PTD17__NF_IO1		0x28df
+			VF610_PAD_PTD16__NF_IO0		0x28df
+			VF610_PAD_PTB24__NF_WE_B	0x28c2
+			VF610_PAD_PTB25__NF_CE0_B	0x28c2
+			VF610_PAD_PTB27__NF_RE_B	0x28c2
+			VF610_PAD_PTC26__NF_RB_B	0x283d
+			VF610_PAD_PTC27__NF_ALE		0x28c2
+			VF610_PAD_PTC28__NF_CLE		0x28c2
+		>;
+	};
 
-		pinctrl_pwm0: pwm0grp {
-			fsl,pins = <
-				VF610_PAD_PTB0__FTM0_CH0		0x1582
-				VF610_PAD_PTB1__FTM0_CH1		0x1582
-				VF610_PAD_PTB2__FTM0_CH2		0x1582
-				VF610_PAD_PTB3__FTM0_CH3		0x1582
-			>;
-		};
+	pinctrl_pwm0: pwm0grp {
+		fsl,pins = <
+			VF610_PAD_PTB0__FTM0_CH0		0x1582
+			VF610_PAD_PTB1__FTM0_CH1		0x1582
+			VF610_PAD_PTB2__FTM0_CH2		0x1582
+			VF610_PAD_PTB3__FTM0_CH3		0x1582
+		>;
+	};
 
-		pinctrl_sai2: sai2grp {
-			fsl,pins = <
-				VF610_PAD_PTA16__SAI2_TX_BCLK		0x02ed
-				VF610_PAD_PTA18__SAI2_TX_DATA		0x02ee
-				VF610_PAD_PTA19__SAI2_TX_SYNC		0x02ed
-				VF610_PAD_PTA21__SAI2_RX_BCLK		0x02ed
-				VF610_PAD_PTA22__SAI2_RX_DATA		0x02ed
-				VF610_PAD_PTA23__SAI2_RX_SYNC		0x02ed
-				VF610_PAD_PTB18__EXT_AUDIO_MCLK		0x02ed
-			>;
-		};
+	pinctrl_sai2: sai2grp {
+		fsl,pins = <
+			VF610_PAD_PTA16__SAI2_TX_BCLK		0x02ed
+			VF610_PAD_PTA18__SAI2_TX_DATA		0x02ee
+			VF610_PAD_PTA19__SAI2_TX_SYNC		0x02ed
+			VF610_PAD_PTA21__SAI2_RX_BCLK		0x02ed
+			VF610_PAD_PTA22__SAI2_RX_DATA		0x02ed
+			VF610_PAD_PTA23__SAI2_RX_SYNC		0x02ed
+			VF610_PAD_PTB18__EXT_AUDIO_MCLK		0x02ed
+		>;
+	};
 
-		pinctrl_uart1: uart1grp {
-			fsl,pins = <
-				VF610_PAD_PTB4__UART1_TX		0x21a2
-				VF610_PAD_PTB5__UART1_RX		0x21a1
-			>;
-		};
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			VF610_PAD_PTB4__UART1_TX		0x21a2
+			VF610_PAD_PTB5__UART1_RX		0x21a1
+		>;
+	};
 
-		pinctrl_uart2: uart2grp {
-			fsl,pins = <
-				VF610_PAD_PTB6__UART2_TX		0x21a2
-				VF610_PAD_PTB7__UART2_RX		0x21a1
-			>;
-		};
+	pinctrl_uart2: uart2grp {
+		fsl,pins = <
+			VF610_PAD_PTB6__UART2_TX		0x21a2
+			VF610_PAD_PTB7__UART2_RX		0x21a1
+		>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/nxp/vf/vf610-zii-cfu1.dts b/arch/arm/boot/dts/nxp/vf/vf610-zii-cfu1.dts
index 7e72f860c3c51..24eae049af69a 100644
--- a/arch/arm/boot/dts/nxp/vf/vf610-zii-cfu1.dts
+++ b/arch/arm/boot/dts/nxp/vf/vf610-zii-cfu1.dts
@@ -333,7 +333,7 @@ VF610_PAD_PTB17__I2C1_SDA		0x37ff
 		>;
 	};
 
-	pinctrl_leds_debug: pinctrl-leds-debug {
+	pinctrl_leds_debug: pinctrl-leds-debuggrp {
 		fsl,pins = <
 			VF610_PAD_PTD3__GPIO_82			0x31c2
 			VF610_PAD_PTE3__GPIO_108		0x31c2
diff --git a/arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dts b/arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dts
index 4f99044837f8d..7a209c9c57a4d 100644
--- a/arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dts
+++ b/arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dts
@@ -429,7 +429,7 @@ ethernet-phy@0 {
 };
 
 &iomuxc {
-	pinctr_atzb_rf_233: pinctrl-atzb-rf-233 {
+	pinctr_atzb_rf_233: pinctrl-atzb-rf-233grp {
 		fsl,pins = <
 			VF610_PAD_PTB2__GPIO_24		0x31c2
 			VF610_PAD_PTE27__GPIO_132	0x33e2
@@ -437,7 +437,7 @@ VF610_PAD_PTE27__GPIO_132	0x33e2
 	};
 
 
-	pinctrl_sx1503_20: pinctrl-sx1503-20 {
+	pinctrl_sx1503_20: pinctrl-sx1503-20grp {
 		fsl,pins = <
 			VF610_PAD_PTB1__GPIO_23		0x219d
 		>;
@@ -450,7 +450,7 @@ VF610_PAD_PTA21__UART3_RX	0x21a1
 		>;
 	};
 
-	pinctrl_mdio_mux: pinctrl-mdio-mux {
+	pinctrl_mdio_mux: pinctrl-mdio-muxgrp {
 		fsl,pins = <
 			VF610_PAD_PTA18__GPIO_8		0x31c2
 			VF610_PAD_PTA19__GPIO_9		0x31c2
@@ -458,7 +458,7 @@ VF610_PAD_PTB3__GPIO_25		0x31c2
 		>;
 	};
 
-	pinctrl_fec0_phy_int: pinctrl-fec0-phy-int {
+	pinctrl_fec0_phy_int: pinctrl-fec0-phy-intgrp {
 		fsl,pins = <
 			VF610_PAD_PTB28__GPIO_98	0x219d
 		>;
diff --git a/arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dts b/arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dts
index 62bd53917eaff..b3d338312df4f 100644
--- a/arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dts
+++ b/arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dts
@@ -745,7 +745,7 @@ VF610_PAD_PTC8__DSPI1_SCK		0x1182
 		>;
 	};
 
-	pinctrl_dspi2: dspi2gpio {
+	pinctrl_dspi2: dspi2gpiogrp {
 		fsl,pins = <
 			VF610_PAD_PTD30__GPIO_64		0x33e2
 			VF610_PAD_PTD29__GPIO_65		0x33e1
@@ -817,13 +817,13 @@ VF610_PAD_PTA23__I2C2_SDA		0x37ff
 		>;
 	};
 
-	pinctrl_leds_debug: pinctrl-leds-debug {
+	pinctrl_leds_debug: pinctrl-leds-debuggrp {
 		fsl,pins = <
 			 VF610_PAD_PTB26__GPIO_96		0x31c2
 		   >;
 	};
 
-	pinctrl_mdio_mux: pinctrl-mdio-mux {
+	pinctrl_mdio_mux: pinctrl-mdio-muxgrp {
 		fsl,pins = <
 			VF610_PAD_PTE27__GPIO_132		0x31c2
 			VF610_PAD_PTE28__GPIO_133		0x31c2
@@ -843,7 +843,7 @@ VF610_PAD_PTD12__QSPI0_B_DATA0		0x31c3
 		>;
 	};
 
-	pinctrl_sx1503_20: pinctrl-sx1503-20 {
+	pinctrl_sx1503_20: pinctrl-sx1503-20grp {
 		fsl,pins = <
 			VF610_PAD_PTD31__GPIO_63		0x219d
 			>;
diff --git a/arch/arm/boot/dts/nxp/vf/vf610-zii-spb4.dts b/arch/arm/boot/dts/nxp/vf/vf610-zii-spb4.dts
index 2a490464660c0..423d185c971f6 100644
--- a/arch/arm/boot/dts/nxp/vf/vf610-zii-spb4.dts
+++ b/arch/arm/boot/dts/nxp/vf/vf610-zii-spb4.dts
@@ -323,7 +323,7 @@ VF610_PAD_PTC17__ENET_RMII1_TXEN	0x30d2
 		>;
 	};
 
-	pinctrl_gpio_switch0: pinctrl-gpio-switch0 {
+	pinctrl_gpio_switch0: pinctrl-gpio-switch0grp {
 		fsl,pins = <
 			VF610_PAD_PTB28__GPIO_98		0x219d
 		>;
@@ -343,7 +343,7 @@ VF610_PAD_PTB17__I2C1_SDA		0x37ff
 		>;
 	};
 
-	pinctrl_leds_debug: pinctrl-leds-debug {
+	pinctrl_leds_debug: pinctrl-leds-debuggrp {
 		fsl,pins = <
 			VF610_PAD_PTD3__GPIO_82			0x31c2
 		>;
diff --git a/arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-dtu.dts b/arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-dtu.dts
index 078d8699e16d7..d5c7f710c3146 100644
--- a/arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-dtu.dts
+++ b/arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-dtu.dts
@@ -284,13 +284,13 @@ VF610_PAD_PTC17__ENET_RMII1_TXEN	0x30d2
 		>;
 	};
 
-	pinctrl_gpio_phy9: pinctrl-gpio-phy9 {
+	pinctrl_gpio_phy9: pinctrl-gpio-phy9grp {
 		fsl,pins = <
 			VF610_PAD_PTB24__GPIO_94		0x219d
 		>;
 	};
 
-	pinctrl_gpio_switch0: pinctrl-gpio-switch0 {
+	pinctrl_gpio_switch0: pinctrl-gpio-switch0grp {
 		fsl,pins = <
 			VF610_PAD_PTB28__GPIO_98		0x219d
 		>;
@@ -310,7 +310,7 @@ VF610_PAD_PTB17__I2C1_SDA		0x37ff
 		>;
 	};
 
-	pinctrl_leds_debug: pinctrl-leds-debug {
+	pinctrl_leds_debug: pinctrl-leds-debuggrp {
 		fsl,pins = <
 			VF610_PAD_PTD3__GPIO_82			0x31c2
 		>;
diff --git a/arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-spu3.dts b/arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-spu3.dts
index 22c8f44390a96..344cc2b4d0ad5 100644
--- a/arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-spu3.dts
+++ b/arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-spu3.dts
@@ -330,7 +330,7 @@ VF610_PAD_PTC17__ENET_RMII1_TXEN	0x30d2
 		>;
 	};
 
-	pinctrl_gpio_switch0: pinctrl-gpio-switch0 {
+	pinctrl_gpio_switch0: pinctrl-gpio-switch0grp {
 		fsl,pins = <
 			VF610_PAD_PTB28__GPIO_98		0x219d
 		>;
@@ -350,7 +350,7 @@ VF610_PAD_PTB17__I2C1_SDA		0x37ff
 		>;
 	};
 
-	pinctrl_leds_debug: pinctrl-leds-debug {
+	pinctrl_leds_debug: pinctrl-leds-debuggrp {
 		fsl,pins = <
 			VF610_PAD_PTD3__GPIO_82			0x31c2
 		>;
diff --git a/arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dts b/arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dts
index 2c2db47af4416..86d32f54c250f 100644
--- a/arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dts
+++ b/arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dts
@@ -50,14 +50,12 @@ &uart2 {
 };
 
 &iomuxc {
-	vf610-colibri {
-		pinctrl_uart2: uart2grp {
-			fsl,pins = <
-				VF610_PAD_PTD0__UART2_TX		0x21a2
-				VF610_PAD_PTD1__UART2_RX		0x21a1
-				VF610_PAD_PTD2__UART2_RTS		0x21a2
-				VF610_PAD_PTD3__UART2_CTS		0x21a1
-			>;
-		};
+	pinctrl_uart2: uart2grp {
+		fsl,pins = <
+			VF610_PAD_PTD0__UART2_TX		0x21a2
+			VF610_PAD_PTD1__UART2_RX		0x21a1
+			VF610_PAD_PTD2__UART2_RTS		0x21a2
+			VF610_PAD_PTD3__UART2_CTS		0x21a1
+		>;
 	};
 };
diff --git a/arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dts b/arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dts
index f7474c11aabd0..454b484368cb7 100644
--- a/arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dts
+++ b/arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dts
@@ -79,12 +79,10 @@ &uart3 {
 };
 
 &iomuxc {
-	vf610-cosmic {
-		pinctrl_uart3: uart3grp {
-			fsl,pins = <
-				VF610_PAD_PTA20__UART3_TX		0x21a2
-				VF610_PAD_PTA21__UART3_RX		0x21a1
-			>;
-		};
+	pinctrl_uart3: uart3grp {
+		fsl,pins = <
+			VF610_PAD_PTA20__UART3_TX		0x21a2
+			VF610_PAD_PTA21__UART3_RX		0x21a1
+		>;
 	};
 };
-- 
2.34.1

