Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2048.outbound.protection.outlook.com [40.107.105.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05F326158F;
	Wed, 30 Apr 2025 15:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746027413; cv=fail; b=B6bQUTGgm1QGFkQ7ok3EY8EvDZgPNOV8URtbNKCuk1yVoUV4CsiPCqKHn7lvgPqu+ybtk9bG3sq6/uO4b5pxeeqSwWC55LT044lDLNsGAjo6jb7ZLZ7HNhtWB2s08uOY6mHF/Mr2NKp6tWysaeB3XKK1Zy2MZur4o8OIUyXvuVA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746027413; c=relaxed/simple;
	bh=+DTT4vfNAUcwKp6TQOTk5EkO44XnGlP8dEAiKyxHKl0=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZGmh2bizeOTVSHNe2EGGxlnFklCv6bEFFfYqzbY82CQZUELeL/nfTLM0LecakHwbMUOaHlxFBTNPu80NBE9ktg3lxD0NceodkqwIgXMnkkpvjhFBUi1F5WbtEeOtyrEgulQKGIqYjDZ9udGY3qi8wxh6UVMVkKsVuKQKkAM+/G0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=NXIawRss; arc=fail smtp.client-ip=40.107.105.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="NXIawRss"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qv8Xtr48oV3+01ssn6s5pS7EE2r9MNqwdCwatHjGrbmkP4JNjNlWhubnMvdCOE7B2ALsPlddmVLpeBk7+iazFqG2NwAEzo1VfwPHfn4294ekhTSVt1i8tTDmdjN0JEcafrQxqZSC/ZNjxhlYmSK0ZHcp83S1ykEuXp0pmNjluLf2fM7TFb+jktMsHvU3lgmvB+J5xmmItJykI6XSYSABYTVZyjrq/H7m4LcZYs3N4Cmk734YdeuQshKHxkgqgQtjqTuYBvYt0jVJmu5/MkfPy8SUrc94C+bkUGEuf5y8VKbJKjSCKNTLExLWGStxa5RFxBGF1OviQ7qcMroQ71k1eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jA/v+EvS4HThaeyy5xe5UoShrszJiDm9ANSIqPXQ7uo=;
 b=dlTCPdO8eDku6vyD1SkeZ3KrnJ1T0sQcCC8HnKO5XGeagOx6C4J2KJc2qwoCJm9AyZyu+InfINLletuytQHRIKIEBxaLFeXrexu5E7zttOPFcipZbbVUjs13joerowQcpickUNUtVoQKzXs0T0AQ7qM2d3tkagKnfWi4YsD4ySplHBXEov4toYt41gs8SmMA/k6kQSY+pVaavuGe0qGMVpI4HdsIcel7SKKwjJj6m5ZEyq5NzU9/JZPVdj4Jl+8RzWE7ywEZlDDVUOxgVGhu1XcJroydcKTjke2IDpHZwQ95Jgo1epxx/taKJEGd16yJj/rQLU1aQmMzgJz34B6GoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jA/v+EvS4HThaeyy5xe5UoShrszJiDm9ANSIqPXQ7uo=;
 b=NXIawRss4inR0aZwziRwkNG5L93LeMsZflOm9sicV9QcNcq2f7j2rO3TD4DUOEWKwwDYv+rgV7xTzKY47Ml74t/3qUm5+6zRPLH5qn5z+IXm1pqrRRHgQ3ktwrNfju3xATTLVSUao/ROdsBGvhqmpymEX9rvrNDyvKfDAWU7VC0yJvKjdTUwipVO23a0dJ1wifRYyIAMBy9VrsPCF61UHygvWwJfjRmLlU1bNg3i7cd9lpYhGgG3Fjs8IQgNlApBYk+SxH05xOanEOLUFw+WJRKoCsZX6+oz9W9DMdUb1h9CI4QchCd1PqO7riYYeoryf2jILsmVPESmM5lfvaR7RQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by PAXPR04MB9665.eurprd04.prod.outlook.com (2603:10a6:102:240::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.29; Wed, 30 Apr
 2025 15:36:50 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e%3]) with mapi id 15.20.8699.019; Wed, 30 Apr 2025
 15:36:50 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 4/6] arm64: dts: lx2162a-qds: make the QIXIS CPLD use the simple-mfd-i2c.c driver
Date: Wed, 30 Apr 2025 18:36:32 +0300
Message-Id: <20250430153634.2971736-5-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250430153634.2971736-1-ioana.ciornei@nxp.com>
References: <20250430153634.2971736-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P190CA0038.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d1::17) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|PAXPR04MB9665:EE_
X-MS-Office365-Filtering-Correlation-Id: 9591669b-8e44-4bac-862f-08dd87fcd307
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SW7WyVcHrXuH/Qbtpre5wvD8BRKyrNyhMk7M5gMZKvyYDFb+9NOyyZKn+bzU?=
 =?us-ascii?Q?EGtj8rMp7LGiIofnimCWmd9wzpmr8VXWvAZMZbUD5j19x8TpSpcLCgMe0BZB?=
 =?us-ascii?Q?mvDbmMf4/A5pDvdRIRxz6ccl8TBLEp9ogttOsc2Q47b6kLQmBv1kXuczzMLF?=
 =?us-ascii?Q?DkTFW3tB8/9bSJF2nugsIlsY1a1Hnq0duTRm3pbMPuOXhNXk0dGED2zHeN/T?=
 =?us-ascii?Q?UDESMLlrrqWZS5dBT9VK32UK8cwKKy554KjZlZPjfA6nKX2X6zDAMEVs1Y1J?=
 =?us-ascii?Q?Bgjl44Rw58kai4T4dJy0zcmHsWDcy2D80AarK6UG5vwDXYY5DcOLh3OMdXEB?=
 =?us-ascii?Q?zxKMZSpbnsIArI4BGNGkRgSmJN8bYWn180uSRAeQF+cpk9TbCHAvdoqWEuAb?=
 =?us-ascii?Q?A4zxv+sZXpDsZ7Y3CrQKNQUa1NNQ4e7uqG3wRhOzphlot21u5ZK2CX1YcFhg?=
 =?us-ascii?Q?1IEm0bS8BjGcWSXz9UIgs4W2B+5VeGY4WqpVvWr4jgoMe1tTLvqBwFGPj1r5?=
 =?us-ascii?Q?JofvLLpjBGRDot6SOE+k4qdnHsNJSVdUOFOW92S7a1UhFdnw7wIC74AyLrMn?=
 =?us-ascii?Q?Zq1QFDQhoVbsglx7LCA26wh/vRSRYBjBRBdGmX2FoJSouLynynvh0t+yamgv?=
 =?us-ascii?Q?J99Te3bB38v5Wa80z2mS1yhA4xABwVaMZ8YU/eF4O8DHuK681t5DlMfyVkRx?=
 =?us-ascii?Q?ZZGRubbYvhUFclOKTsLeWIK9q+zEZ3yD7ZeYFbBGxKqX21p43vE7tu0wv/9T?=
 =?us-ascii?Q?y3pusFyzy5mvQD/Eq5izDnuuJrdsdRVCKavSvTlemukX7Ca8QAhcqFp2A02i?=
 =?us-ascii?Q?NFqC4vOb11Hjixj6Yn+SI573Fj62ZnSroLpCsOKUM3bbt+Gk92riyJVaiKvG?=
 =?us-ascii?Q?zCp1iIUswV5XE6WcODQBr5NofNJxI5j1EpKFx5/XlbGTfAPwTUdriTAIS9fF?=
 =?us-ascii?Q?+ZfNqDIwx/A8/GARPIXhGCWkndynkouVaH6ezi7jzhqRPpzT2DO8Rb8cDvz+?=
 =?us-ascii?Q?WJZ9OVRgYJ4bvqQeItJspOt1C/1qb+gmIadXX5Vmbbt1t8OOSlsoJYM+OsIZ?=
 =?us-ascii?Q?g/31LMyqSAeqgi+F3WVEosEmSLB4cWVwAjhjCwgiIPfJbdMeJ5Xjy/2gW+3a?=
 =?us-ascii?Q?jhZ/LMS76mhr8uL7VbJy61d/515UrOd+no41GG7xhdLOxSv6SlptjHAiQp/J?=
 =?us-ascii?Q?PMmV8JNuP5YDdEEyVojwBB4fRweIo7OhKSTXI+UZ9mwsucXzpNvWnJk1Zv49?=
 =?us-ascii?Q?uyCa1z3hMob5Vy9/t842MSItnrJtac9k2FalgckSrEgYbfQuQsqoRYONZ6H3?=
 =?us-ascii?Q?UirzgKQAjyEKNsd9Ai7vtgTgN1O/e1OmSWC2uTQH4myd0cNyXBjSfdMM8/JR?=
 =?us-ascii?Q?vmy4UVa4qrZH1onXejFeWOfj/k3Ythj0PG86hsbwzI2orxRq9UJ59W+6u5r5?=
 =?us-ascii?Q?hALwdhcwpDE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SYL606/DGDZVx/XZEdoVk+yy1LTz8JdKKP31mBKSbVcde5576XZfrCmMS9/Z?=
 =?us-ascii?Q?l/XBZVIBSPMKaW/JmFC/JONwLCePd0MbxSh775JJAg3XelSMAryQ//8179bL?=
 =?us-ascii?Q?PCfmkR7uw8f7OAE4kmAlh3ZFw/htPFd3duswhq67zffIsqwporX7zZgWMEC5?=
 =?us-ascii?Q?y69OC4A/RlGmfzb/BVc8/6UO47Dalye7YrhtMiokLx++jVWctL4TV1+KQ7aH?=
 =?us-ascii?Q?uTLBE7HSslLUtKJeQD/Wpm5tHMC+YpnmtqwiKrSSdsUdDkWSIFcUZmHKcUGk?=
 =?us-ascii?Q?P995oJdU2XZonqhlCRxmBh3IiNP1PalEroZfuXFqgwoNOUXQuaBI23bEKp2e?=
 =?us-ascii?Q?Yvf58ZS7+WSR9ZSHEoVtGlWp9LnsFhIIAn1wArhYJD4jVxVCXF+X5I1nKSWf?=
 =?us-ascii?Q?+3K5omKZjIsmFHb/a5qdWhHZT/8Fob/361bA0VHttyMajex3QF4raOGJkSCp?=
 =?us-ascii?Q?xLHp2qg6lCSa4ZZQKFx6JluZDuHGOmlitbnp6dGX3CgS9lQrqS+ll0bFF1kw?=
 =?us-ascii?Q?gZ74jrYEa+/g89MasfoNo0GoJIrl2jgACpQnj/w7WcogeLEeeZYD04AX8Ilq?=
 =?us-ascii?Q?YGK4Euh0E7J9uHnTqZ1wircWjch9XYOwyXdYi2zImo186f/X7tZo/Gt+NK2r?=
 =?us-ascii?Q?pUyBfsukCvhvJ2i4W9kdBhIposwYqBmWWp2cJZ8P1cLU9BF3z3NNkytof5vd?=
 =?us-ascii?Q?DPCl8eATax4X0xBJcpQMu1ytJYOIiEE1DgVIn0N7Tm7HmGEngGwaJylD6Zns?=
 =?us-ascii?Q?M5ncR+GZdMwsNkruzJdInQxKUoczBe2MbJEBU+n86smujA4iM1k60FqrcrgT?=
 =?us-ascii?Q?NGI+tMf3U+1Jick/lJGDcFINWCbQ5eaCTFLXBP7YO9iaj8lKIHoeA777NSK1?=
 =?us-ascii?Q?QGWZL0wpK9PnuYq3O6COR60Fm1TZe+vniXfzPepdYWOiQgGqmuw++PWu2p5f?=
 =?us-ascii?Q?jo47Mcouog5MhoL4I+QYVIq1RP1YU46Nh2GhQw6LxDL3z3Wpg3xFpkwd3okV?=
 =?us-ascii?Q?fnYSoxCm7ABcr3JkGKsJhru61BtNeYoqyvDZe52ziAApwrTDEehPkkygodGk?=
 =?us-ascii?Q?C1nPJ/kaghi/NoxMJePgQCS/om+KNL22yynDQuCKzWVR3Yv3OoP6875yKqmd?=
 =?us-ascii?Q?pyuUPMdloHNw+1YxPI863CqShxVhCI6JhIlt+l872a9ODEMtjZBhzTHnDHzO?=
 =?us-ascii?Q?R/BTV82DODBlRP6RlYTggctWKw4YB4N7FF/nUP8k1ZOL/o5ZeCHqTmZCf4g0?=
 =?us-ascii?Q?21c0jjHI/a2QODSzFezXDCPl7PR+siR4Vvas2/Qvo5YchxK6b3zIBdprpNoC?=
 =?us-ascii?Q?HxHz0iHi1I8KLV1zs41SfZlMnjOlsku0pkE1+x5t/fOAjwWsjNMkyTiB8ELy?=
 =?us-ascii?Q?B+rIM1TvGaClkzqiDr0hJGUCtb3IQh0V1mpCB7JF709qju4qKCCNYxIjicD/?=
 =?us-ascii?Q?UKGUTdTggH7ooNyecYHIuR8fj0FvaNaP6BSpMia7FImSUOA9t4bofIs6rriF?=
 =?us-ascii?Q?TZH93lQWhzG0SgvFlOh531zwzWTLTUm5n630fPgNhTldFMn5Jws/PVlq3Sm3?=
 =?us-ascii?Q?xAg95z1vd2RM5nkq7gSTK8g6kIAlMXIZ78Z78HWL?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9591669b-8e44-4bac-862f-08dd87fcd307
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 15:36:50.1264
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ToAsu2FAWYaRY3P8x7JoQl1YSVpJvAgAGZK6BlQ5x2w0SB0lfNooBosC1iiIPK23ElPcHDl1x9DiBzH4e7g9LQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9665

The MDIO mux on the LX2162A-QDS never worked in mainline. There is a
downstream driver for the QIXIS FPGA which is very similar to the
already existing drivers/mfd/simple-mfd-i2c. Since the HW works with
simple-mfd-i2c.c there is no point in upstreaming the other one.

Adapt the compatible string and the child node of the FPGA node, so that
the simple-mfd-i2c.c driver accepts it.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
 arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dts | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dts
index 9f5ff1ffe7d5..53a88e0b54ff 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dts
@@ -267,12 +267,14 @@ &i2c0 {
 	status = "okay";
 
 	fpga@66 {
-		compatible = "fsl,lx2160aqds-fpga", "fsl,fpga-qixis-i2c",
-			     "simple-mfd";
+		compatible = "fsl,lx2162a-qds-qixis-i2c";
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

