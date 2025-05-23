Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2048.outbound.protection.outlook.com [40.107.249.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B753EA83;
	Fri, 23 May 2025 14:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748011017; cv=fail; b=Zgmiga1wslH2Z+4Sz07Vly0npLIvn5CJeKdBElbtitCxoE+GGFOi3+ZgKeMQuEzGXUwd/HNCyIrqNpyYCEeQmph/5tJxWtTvPjIw8Gf3G7Iggm3tPwvXsN0SabCtauaPhND1OgIjWr5PBodQffKdeCp4EDZdqnt7RWAW4RNiirU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748011017; c=relaxed/simple;
	bh=OkfR2OVsXA2EMHAlhTIwgYsgoovhlzZKCEgapW5m6nw=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=TvUue6sJIq40CyNJrAlzFTbnTDep2N3VPUIq2rn655g6+1HKQ1he0J+4zfpXHNjNP/AGGl5e19UM1mQy0ImLA4WI9s0kKeISLy5LtO6vV5xBRoxE4OUCBmokZtVXvSfkLsabVq4B7y82L4Gac+bKejyU8rsBbGve3y6vvfu1cZU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=cKWliqe1; arc=fail smtp.client-ip=40.107.249.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="cKWliqe1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w9/oTBl4bz5noxTzWWjMliS6QPMf+dGmvHmibbydkha12uyNfkgdSiO9sMp/S4aHfxI78sK9noFdjKKklZVp0ZHwDomicBegkBozfLU2u4jhSQCa3+OCqFMeWErF+U/0jWWlHubThdZHNbYReiAMMgjbtiL+NFYcsFP9a6ed+egw7MVQELcRGS0t3xcQKKoe5mWPkle/MuXhmWetWQ1QmRMFXnjfoC48xUBTE49kICx73aMYxzabjphbcqT3qq6e4zDJY47CPMyrgD+QkFjGfhdLGhKGEmKwhfMGeu4vL46ENeDUprTAzy/nb7jukHVW8vemXoKNi7I8ECXnT6IKKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fq2VUGxniy/0T5JAjY02d7VSARdwSyatAYrLErlc7vQ=;
 b=n7ull8vqk2CdtcDAdL3MrHwTWfs9iShdv4SYAECE5P1jzRrDu8NRGgNs9opl4pcRUBraJLz5pniifHpt94nJhGs2HcWfg89OQ4H38Br68xgzK/QZFnEAun2afBJmOlGf+w2VJfNVbAy2UoosK6Tc7y8HVMIKCsOUrlL6aSUEYoCQ6VK16qGboFI2LgoOGP54hIDlFuDIs49OME3wX8H9Q6xT5mM+dz72f6+KsEW4zOfieVPSawYTubl4g2hWgOqnJ/KzK08xz7CZfbXMBXH7wBo9vqHm5u2eZremMqcZTwZyqxIKrKqJojOjzDKhBOJ1AI9sBOeCwfmsOiAoZt2lZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fq2VUGxniy/0T5JAjY02d7VSARdwSyatAYrLErlc7vQ=;
 b=cKWliqe124kgusrx2WHuldwE8//mSfMnIEYbctIFj3JiH1EJkvXRwSxqHtiPxJ4qI5FTZnLgh8seQpwE44gwzptTWyF1BiambfNiksml4zgJYYrlbTNiAdGYzzKPM5IxHZzSnbb5126kiBec8saDDUkKKVlRToX7DDfr77ctEI9oKng8fsFXhq9HEx3yWaH9f7LNit0WddpztQFWMJ0PzvTBrVFQ1b+jRGKzIvZnYbM3gkShrKNeArMlITi8f9YrkyaXu5XuLJXQLNIywr2sJ/6VxWFcaoGpQ87cYmSOXwyckDq/z0URJ59GE+0zCftIVWFpsR63V5W1FJpKHlB94g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM9PR04MB8714.eurprd04.prod.outlook.com (2603:10a6:20b:43d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Fri, 23 May
 2025 14:36:52 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Fri, 23 May 2025
 14:36:52 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org (open list:IRQCHIP DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] dt-bindings: interrupt-controller: Add arm,armv7m-nvic and fix #interrupt-cells
Date: Fri, 23 May 2025 10:36:36 -0400
Message-Id: <20250523143637.536759-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0149.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::34) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM9PR04MB8714:EE_
X-MS-Office365-Filtering-Correlation-Id: eab595b8-8211-458a-09fb-08dd9a07425c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dre0Iwi2gU8FZ5SReL/alhVzjf5t6hdXul0hCxkXLpW3P+1b+S6rzHcKMVgO?=
 =?us-ascii?Q?WX/69NZniu40hIr9ltgL3hMCg/Hq/PkGkGjp9Fe/7PUWj/2o8omLSCe+/nSj?=
 =?us-ascii?Q?97LMDLS8cB/0/7rE1GXf/3FpyeiJ68WnOJb6CisgXIz+A4MrRXStaKmb/Xfq?=
 =?us-ascii?Q?ZYJGdbfZZJCBfWszDPeqgFuYbvEi0R0E3pyAX03mBNxvyAYtLYqfbKIsNNyH?=
 =?us-ascii?Q?i8stZc00gVvzH8iZI5GZQhZAknwH+6+RTz5zTMpx8bTge3lqN9lvbAwhOsVP?=
 =?us-ascii?Q?3JBOdn6+zUQtOXuOEbona3MLLVr7ukixek1YOUpoI/V1HEgUegDkCBs1AghF?=
 =?us-ascii?Q?93VTMJgUMO0qvAni2xFHKeE3CdMBk6A2X4cwIekEP/1jN5sr8WDy9/zqDOTX?=
 =?us-ascii?Q?LPeeGHal3dD+FWOccar/cXadPkxdr7rP6xqptcLkty0Wl/ht4URSzMLTBl6K?=
 =?us-ascii?Q?MIrKUYLH2jSmXyzx3fefWNTWIAzvvf2BGuuq3xScdU/c13/YKx2P2ZLunFNG?=
 =?us-ascii?Q?0wMzUfwppaFIKhOrDcLIpFuc+xs5l7o+JvSa4SBR8GXctBMYZzwUkdxV8Tf7?=
 =?us-ascii?Q?zcB5MBWTrOJqRmm9R0EOVh3BMyFdVRlAn1Z41R5SQfCl6VuRjpHlp2AfKTS1?=
 =?us-ascii?Q?RJ6qgfkyyOsiIPcP2FeKF+oOQk/lVeUT4CFRZOpuwL3VeeLI98zBIEkYu5g8?=
 =?us-ascii?Q?EPk0vvog7VJszwMwSo0QgFcOG7EcInbP4NH3d1rDlKqKGZ2GkAJvLq2KLjaU?=
 =?us-ascii?Q?A7X9IUP1jcDtEtyc0ze6ZbUwHlGfj/1Lq89nTAPptH6xEYsLSQZJnPFrgU1N?=
 =?us-ascii?Q?eY5jOTu7kmDBnhaFIvMVbr2hDCiy/GIx4KHpXxaooSn02Mvo9tZYi0b3lXM6?=
 =?us-ascii?Q?M6hU2YLqRMr6SNMiBTrtzZMnnLxgB+kFb0hAxn/fsIpSKeR1p02N0EKGN2Jp?=
 =?us-ascii?Q?TgaGg39xy/GqSqmBEdvOv+QHvutM/sHt1R2A/RS/UY4+hAbSpa3sYtb5yCvn?=
 =?us-ascii?Q?wSyfEy0fPdOnJ/YNfqWvvTuvb0/VEv+Z1CAYr7YABgaly/d7k6eIYVIrt8JD?=
 =?us-ascii?Q?nUTb6iwA6u2p0iRsM+JWRJVhpR4kiHTQtTGZLEUrGegNA9XQ0adqITvTvNgz?=
 =?us-ascii?Q?enUJ+cM1MoQ8b23EGpi1zAPh4HOOXC2t8gBQjUg2nz7UWrYcaCNDuissxBHQ?=
 =?us-ascii?Q?DOp4AztmnsTdGwENZ97zlwjtM66FH3A9dcRoEHlWORqTFLuXLkAcejhrvPFO?=
 =?us-ascii?Q?PTu+A0wGwGULwGzBJvH2nRUAk9iQNXOk+NH/aWm7rflmFYobXZrzvqMfZoOb?=
 =?us-ascii?Q?Ev5Dw4CstTN0SDngBJgQ/rrQWGhIyeABVY9Gk6mH0o3SipzgIiD6jOnJaj7l?=
 =?us-ascii?Q?lJh4W9rlO5IKwFiMNJy1kC1MfzTyMbl6jIzPciTIz2+SZtxBY5qLgJfT2tb+?=
 =?us-ascii?Q?IPhQUtNFf73557z1wu+yrqsvzzUSkXvu5DSgh0cLZSsb5ncDlsVzkw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?v4YU2kX33+wrooUT5MHsL7MwD+cQT05c2B1unF0HObPfpmrS43bJTeUYpGNo?=
 =?us-ascii?Q?TDNDWf7AMUmflx3XCaodOoEm6+vsJ/efoEn1TJDpZpUy05wl18JNd+q9sFN0?=
 =?us-ascii?Q?xbMQztqps3vYlafuMRUa0psxBRvyHpvCOK4O6lzGMBdPisUuBD2Rtp8XglbY?=
 =?us-ascii?Q?4ttfq78qSm/91DJ5H2Uuxk/+nWGxnuUWL+ke0xbrmwL5g7j6fQmsCD31LnQe?=
 =?us-ascii?Q?gb/aWaM95H15y3R3yjE2bqySr6+ffwGiqJNowlcEh+EQDiCsD4TUJ06xoBVu?=
 =?us-ascii?Q?BAlPrs9GYM7KiD8Zy0JZdHGpZMtKsUfQu4kv5ZsL/gc6w0I8qsUKJ11l82c5?=
 =?us-ascii?Q?vqoxmrRTlUuvcBIY5g43GS1SkdvxaCKhRo4X7nELNO54a51/kJyADejzteTC?=
 =?us-ascii?Q?IauYEdLesRHHlqEFI3y5R1wu/tvmbYMPzhdhv8/7vw2XN4qg1aHe33sj5G+s?=
 =?us-ascii?Q?E6jMhiDQ+Hd6vIvgFuPXsktp/nMzfvn9KH7zO6Y+JkVM0BRKOY7EfqfoXAfe?=
 =?us-ascii?Q?Hqd1u+tsV2P98g7euQ/GQHFWKQCUngTxpdaKWAwUy4AyNfRRr0xCB5gTj9xw?=
 =?us-ascii?Q?VN8Ts6/sLrI77b6Wxkmmez6WjmSiTsBu+8l25gKXN395C6Q7jveCTe5hdmcK?=
 =?us-ascii?Q?SwUWfReC7/eQFlG4JI/opeJx/j4ZhbqFhIr1vucXCK8Lax8WODo7hltJhdYA?=
 =?us-ascii?Q?P3WosiQNWlWkPw1NEk0eCCAEgVC2E+3VaXUPzjJQE1i3JyohoFG+lKoxtPFb?=
 =?us-ascii?Q?BQXTqNQqgK4IkBigQUktn79AV4ZZNvx793heV/0sLUCPcE7B0o99p/bDo5JY?=
 =?us-ascii?Q?fDqK1cqRtbd7zFwO/cRkomUTcOb4RUoxslORTCNSM7OatRZx6nLeOc3DrjDc?=
 =?us-ascii?Q?ye6D6fUr3ApwzE7SlJnXmbcgSBtjt6iROtzfQ5DiwzV8RAZo6BcCVsbllCWW?=
 =?us-ascii?Q?qVd6S9oAzCeFYsYmlnqPFEGO77c1sQrhUEQIUC/qyT0SeBa6DjUpNWpY6m6f?=
 =?us-ascii?Q?It/szFtgv8HJm21KI9aJaRSgfs3sqjKZgRnaUwq+CwKUgDxMotN/74rB4HSO?=
 =?us-ascii?Q?9TfwOAC/W+6dQjeTemeW+1JDAmeaexOTmTZUYY1W1yCNk/NG35m3TBUBocOO?=
 =?us-ascii?Q?+Lub0IJ96iw6DWMr+ap89m0zoWDR8Kl9fCKtxw+27guNKx+KgZfzPYyUkYLt?=
 =?us-ascii?Q?DVXAiEaI2eLX2Dyf1LAWsV3xQpD8ixCcND5vC8m7qoSoYmgdG+b3f9OfL7aV?=
 =?us-ascii?Q?Oz6PkNnpJAmyl2UPdbwTF05I3PkGHtqCpsgERzyNSgBMZ5aSJ3yrEmyNk/Qh?=
 =?us-ascii?Q?Ct394HhfWygGojNNWzop+ujNCbZETe445WPVdgfcaL11GCaIXBGy3oDsazzP?=
 =?us-ascii?Q?brKxNEqjjeKTwg6Lbde+wnmHlIjvWHrQ55GprFyq+TGtu9EKxxPPnf387Hip?=
 =?us-ascii?Q?X1CqCcplNg5hI5np+s0Ou8/Wei65Itk4ZTcnE8Z8jCX1QMqlIuVpWeL1b9J1?=
 =?us-ascii?Q?LJt93pAYaxGzTnqw6dID5fA3Ss5HmECzG+FXpG3jDove+e3wkikQTwyfCH7N?=
 =?us-ascii?Q?HGBwc1DMi1OUVYMI2Tk=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eab595b8-8211-458a-09fb-08dd9a07425c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2025 14:36:52.7536
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bSKHGe3MQWjep+7v5hiSsINB7n7zlTll3+xaBcngM4R+saaMD5BbA2+dsNX/NfwOHEjQNd+/6BPhL/zD6cl1Lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8714

According to existed dts arch/arm/boot/dts/armv7-m.dtsi, compatible string
should be arm,armv7m-nvic, #interrupt-cells is 1 and
arm,num-irq-priority-bits is optional property.

Fix below CHECK_DTB warning:

arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dtb: /interrupt-controller@e000e100:
    failed to match any schema with compatible: ['arm,armv7m-nvic']

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../devicetree/bindings/interrupt-controller/arm,nvic.yaml  | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,nvic.yaml b/Documentation/devicetree/bindings/interrupt-controller/arm,nvic.yaml
index d89eca956c5fa..a08632804d052 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/arm,nvic.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/arm,nvic.yaml
@@ -17,6 +17,7 @@ description:
 properties:
   compatible:
     enum:
+      - arm,armv7m-nvic
       - arm,v6m-nvic
       - arm,v7m-nvic
       - arm,v8m-nvic
@@ -30,10 +31,10 @@ properties:
   interrupt-controller: true
 
   '#interrupt-cells':
-    const: 2
+    const: 1
     description: |
       Number of cells to encode an interrupt source:
-      first = interrupt number, second = priority.
+      first = interrupt number.
 
   arm,num-irq-priority-bits:
     description: Number of priority bits implemented by the SoC
@@ -45,7 +46,6 @@ required:
   - reg
   - interrupt-controller
   - '#interrupt-cells'
-  - arm,num-irq-priority-bits
 
 additionalProperties: false
 
-- 
2.34.1

