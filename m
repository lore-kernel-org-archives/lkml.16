Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2043.outbound.protection.outlook.com [40.107.105.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A524F225D7;
	Fri, 23 May 2025 16:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748017068; cv=fail; b=DdgtzTYJ41Izz7cCHO0jr6PhNw3wtyxPwYvriMbP2tNc0NgKxP5eOP3dUAqP/N67eUNyWZ5e9foHJEZTCIV+YoipYwRLT8Vv1rk0xbUv/i1xmjueD4cSkyZH4XfD/gwtHG42qBoDxrCulXz/DFSOcVCuPfqRYRdieqN309bvGRE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748017068; c=relaxed/simple;
	bh=VQZ9jWucriQ2uMcnKxREWx2zLdJfpv2TZ6P5Lo3Kaas=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=FApMHzuf1tFsazuETSdKzgblQrf0e5k3MU2yM9UBr0TEpsgvaRtg1goTR4cmAkIhQxQHeYxqgh3FGJwlOlz52bNzFx6NOBrjpqU5oejISuPdIatdGTu3wB63n9Qy58+l2oF1uM5qOwlNOuV6ANqKuP8XUaE/fpkwvJBy39ipSIU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=mT+JiD7q; arc=fail smtp.client-ip=40.107.105.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="mT+JiD7q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kii1riFSenXytW02jtDWpS+EVvq1NOGU5f5KSdqW5ZFyXHeIsYV4Q5wM1Yj6WJmZnmAkaWpawTbjT2eco+IqpFvQ443OKvomQhoGBgA84DbFNsjoPcBdOPjgpeqAX7sw+1XQNOFmFzAXafyAtXkCJsNVkWgc+aF5fV7udiNipH6Ey2bMMfwwnjh/V6JQ/D82oE6vXq34egsVMpVTK4qAtFBclEE/dkFL5J5L7pZzwKE89mcQzuCdirNyQOHTj/jUdL/djbeiC6y+cOfcyTWsBzX9UDuLcthUcYFaJD60Hea0DkAYBJqkNuJ4qiE8SJalJFCbMJQG2nvbBWU/wMbs4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GVGNWER3va0+Pg6MSgwGGkU5raRDN4QcBGeHYM/4PRA=;
 b=PQxjCve4wrLYjYCSk8eZlVWnezjaxYz4PTUX1ns0N0LN3ZRDEEXvutWd16/8R+fwmNinO8HpJUQ3jqzCD68uU3GyL7lAhGpkTJvY7/wl4gjMtqXn4fTiAfYvQw4MssWRCAtX/C8yUbAd88s6UHDFkzifuq4Wqq+/cTbV2MMvSjXwNAsfCVjgbXdR7q5S43B49rWfJXCz9BU7v4zfdNa7+lFKJ1MupFx1Zqlz3nMWKR/nDc8didfhJCVLQL9RnHdvEqo6ja5uZoMiHsttnMYvBz73eArTO+demn8RCP9MvSAdcN6LAxzXpbpMl2q8mtOWMWTks9453QxAtbmiqofQzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GVGNWER3va0+Pg6MSgwGGkU5raRDN4QcBGeHYM/4PRA=;
 b=mT+JiD7qJAr9Rj3GvjNO1kKC/5L5+t+vE6R2rt6DUsfIGccsgK14r402b1EFAqcCLU35oD5MamA/uZ0D2n5Xe1SMF6ak9rFJeHo0PRHQ9XHyiMP+9AyYR8NB2wTY09kmdoeQZi/XPizWg9nIfPl/eRyk+StXMSE8lkx1pbl9z183XJ5wygSCdvWXxsfAO69u3F4PlKl7arkYw9m0cpSPfGHLF8gTo48wK5JpKKflw9ql2SNx71krscZS90ApmupFLHy2tlDx/3c5e4M9khes2FMIyOm192UmUKr4wYs3OtpG/pgGSF56zI+7yTzZU+KFo7H5sS3pWB8N0qT0ORLviA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM7PR04MB6966.eurprd04.prod.outlook.com (2603:10a6:20b:109::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Fri, 23 May
 2025 16:17:42 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Fri, 23 May 2025
 16:17:42 +0000
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
Subject: [PATCH 1/6] ARM: dts: vf: remove reg property for arm pmu
Date: Fri, 23 May 2025 12:17:20 -0400
Message-Id: <20250523161726.548682-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-Office365-Filtering-Correlation-Id: 5a599ee1-0a5c-49a0-9084-08dd9a15582c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MyELLx5YbXIiQTMB7CxbWhGNs7jDBkApnuiTGi8ZAoNgxdjcxoq93qv4jgwv?=
 =?us-ascii?Q?t9uqYUXcWixjPHrHzMm+66w1jIs9FtBzZIEiRZc+6a+sfWcq5ZPaB1tnKQVC?=
 =?us-ascii?Q?LSCXsQFWQnkQlpmNHfNZB4SL/K2icmLudabskxKWA15sDAhZOeO53ndryldq?=
 =?us-ascii?Q?CGWsBYQq9ETTcqmbu90qtKGT8PD5QZK3C6Du018hh+/LN5fgW/TVNnaOZMnB?=
 =?us-ascii?Q?qax9VvchzEvl9NGUjUDdi9HhHRO7AUYDM9GqAk4Zen1/47CbsROh8d4O3sAw?=
 =?us-ascii?Q?6f+/lLsoTSEtYaODaaPcWjMVZy4D1iRyOYhG8xY5QAVqwPnB97borWRfmCJb?=
 =?us-ascii?Q?xazopC7mBMaTSPkClwJAGuC5QRzHsX8mzke2WHw9xwAkeuGPj/Sh55H5bj5T?=
 =?us-ascii?Q?BH1cWqBLgrXkU+R2bDmE1UtbEnOeDQnd1d74cW3JmBg9hTyXFea6KI9skP4v?=
 =?us-ascii?Q?7qP8SvCT2vtenPlfnW8NQZv4MBTnOqi3MZYUc26lodCsedJJJNneFRYLL3Y8?=
 =?us-ascii?Q?qGj1Y2zYKndMQesTKT/ptXNtPnvQ86ApsbgY9tVeGtWMbSvISSzEukWypxcU?=
 =?us-ascii?Q?XXol5pShcWIaoYh+nxnW8liogW+k9U9bzsYFAt6n8+qMebYcqEIkTuPgBfWc?=
 =?us-ascii?Q?vfVO4DR13j05gfEZ+vx9TmLo3CcPL5CJvZ8KPLx6WlS8qOCUpzSBAdlaLumC?=
 =?us-ascii?Q?BBkzaltNIn7BWOaJ4NuW3119ynA4cQd9tCDZsyWWns6dEKjJTMZFiqy4AGey?=
 =?us-ascii?Q?lyxBFiWz7K5NkOVm9b13h5og2nJ8Fo8+Yc+Ao7pjNjYYLy0U2F2XctA+Z7AC?=
 =?us-ascii?Q?buagDZsBTJXFeuRU6xWwe6WJ3owAHFZZNWCYHNQMfRozHaXc6BZP6KrVN3zc?=
 =?us-ascii?Q?Ahr2XsZsKKseMgZ6WQO+apQKs0cPLKVa5GQ9yEbCSlQUku8bpSYym0UJUKcU?=
 =?us-ascii?Q?JNTP1UeB3tlfMd5j6c1MfCQo3XITDNMwMMLZ3JOjvxCz4vSPq8MSgM+qjKym?=
 =?us-ascii?Q?l3nZjf6sNGIBX/ZTroVakl6mgl1DLHmIravHycZ2Mq1w2aUg1Js7rxMb//vF?=
 =?us-ascii?Q?LMP5NRSplc4H2hEji2Ng1VvL2QeSkzP4hgqPEtIYEX43n0kZUdVvaYNX59wf?=
 =?us-ascii?Q?NZdPRWGMbEihCbzdzbmS4Z7837IW1KKa2Ty1KNvXIzwWZxJIWqZN5+poqT3X?=
 =?us-ascii?Q?pszqdaTMj9fOoQeNJcit9cj4tg0wfw1F1e1Drnz+9b5yd2B7p77WmfRGGye/?=
 =?us-ascii?Q?CWMizhMyB7uPdPVlwhDV4dZtT+zQIMVVzZNFW7wPR7cNs/oqGA/9gJkOBsrg?=
 =?us-ascii?Q?vw/McmnHGEz0nB8fhEDxiPFitoAhI2MXX3H4FIpSzyA7MrKNTIDLV//R6Al3?=
 =?us-ascii?Q?AwPM7vmqx17ucWz9YJP7CRRXKDscetoCb6qETDrCHnXoIZOP0dta4ZHrcJEv?=
 =?us-ascii?Q?7AMHmVSmCMgCuzckFspi5LdkE4WHvF/lLC5QPpy5PKu9/b9EFPKeosKWvmhl?=
 =?us-ascii?Q?hGey/F9NcRojcLE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gJUnoOrazNrS4OkjtJKWLZc5CVBBOxizn/nv+LMsVaSDrMem4qM+ouuZzJiT?=
 =?us-ascii?Q?sEu9Ai4uw2e3X8FOTcGRvX3jYFAZe0jRdFgLkj644etVDv+xkwqUvHOnK8Sl?=
 =?us-ascii?Q?B0IZGVgX7Etletqs15X3aDlGZ6GpM5zDlM0T2HlS5K/Mzs1EejUyqBCQFfGH?=
 =?us-ascii?Q?EXIslcLLg1lSUq1nQqJS+XDg5IvN4WGtpfr4UMLyfuPaASayZohOfw8fySsJ?=
 =?us-ascii?Q?c5dibHpqyyUI555t7lHmcAJkyX7Ahws9r+4QheMtEIQJzn+CEp0r4F9Plz/q?=
 =?us-ascii?Q?YVg/KlvuSZ/uNAGWyHl7LFCfLVWsn+kNPRnXNOXKE575EYzG9iQK69z/IULj?=
 =?us-ascii?Q?g79wic6AHbLlPID1U04CPzCEEM6uYyAR7PzO7amuXuiJBu4wzWs9mfte9RT4?=
 =?us-ascii?Q?h0ZZi0n6zCN8DK3vr+rm4m59oTd7uA0pxoHZ70yISYcpla4wtPWqEU9++vpj?=
 =?us-ascii?Q?LfhOwXTGIMDhzVEU8bNecvPolq9S2OjFJlu7j6sYs9OG1esNX+6ILl/pUcY5?=
 =?us-ascii?Q?sWN+33ruivIQdGvt8A1v98Ior/TekJbEGryK5/IbDPcY26R9FFn6HOB/1Fbr?=
 =?us-ascii?Q?V8s2g642AStBG1IqBHXQjWeSnjylOAxLwztIDdWheeNttP+5jtR9DXj+0XBq?=
 =?us-ascii?Q?z+8SaLyPWPDZ6rNWBp8b6yvvyfJutvFZ1gllzpEGpnKR3UFslmUkCopHP6W+?=
 =?us-ascii?Q?1mUEvXBhUHc83bh+hvtnAF3Bbq0hHP4ZPYAkgOPL5ZfWrO0GvADSKKmI0soK?=
 =?us-ascii?Q?UHbILKH5G6TNtVAL2hkX3fGvNRSZRnvJn/Wv9bvfV/VVz346pmYqBcfwJ1X7?=
 =?us-ascii?Q?FVX5NONPyG3iREV6jEMd9Jor1mYN1r2jWPOhj6zSPhKQaDyE93sjHHIA+6D/?=
 =?us-ascii?Q?XiNgV5YBpa0no+cGbLkBzNEOffhTfgjhm/6DmTO6w2RtJI/zQb1jQHeQskJT?=
 =?us-ascii?Q?EPkUgk7IM7BppHRm2Q4L+ySF6uYedMVd+v/DN+gkkiMao9suqgLllIoyGt1K?=
 =?us-ascii?Q?Uy2pM750CF1huSOg8qoLF9Rk4jjn/tOHagjzyA6VuQPgfDf9dOyS7sOP3k6i?=
 =?us-ascii?Q?8M+Xt1wGzDd8xnX39Whdi8sKizmgsl/up7YfZ0lYLh2FzPU56vOBUVM6iWsl?=
 =?us-ascii?Q?BaaFBhsNa6PR0gzyvMer25FseleNV9e3tjib6wuQ+OsO4ktj53+hjt1KybGk?=
 =?us-ascii?Q?07vuo8vvMwbSQoag+Qdb9Ua/0tFFsMf7+y5Pnnn1Nwhp8WqFfyPOv7V9zc3H?=
 =?us-ascii?Q?k5z+g1P/xxHYDe9y3NQkxOOra7rz1qODjkh1hqYxXVKZvjGvCZo+SU79Uvxp?=
 =?us-ascii?Q?AFWiOQxhnbpLuVxAytrObEHpmhWftJk+TwXV1B4AfMEazGkr/fGNCj1gA5pS?=
 =?us-ascii?Q?46ws/5n22pf8nC7b2lAzq0W/bWE7c7cZ7BnsXLvpvnuGYmWIB1Bdd7ePOUq+?=
 =?us-ascii?Q?CgvdbxfiqMhoPnM877Y0Z18Ex/9XZFwcu4cX+YXpVwKTi0sqUVm62pijXA+a?=
 =?us-ascii?Q?UGyryHPGkgwW6nijJ9NtICkMhqczn0rnIlmS8MWjvDe2JaBi5GumW1TAhAff?=
 =?us-ascii?Q?OBQBIMf5tIjquTOIkIbTIK/Ythhg/1Ey47HjgjBQ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a599ee1-0a5c-49a0-9084-08dd9a15582c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2025 16:17:42.6497
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hAmZaprghggj6mo4bowuJGqm5ocA67++BtrFc8Yuur0EgvWInstMo+xZ2fUo2BgKQg7yjVfyaV9vCrBD2s+BRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6966

Remove reg property for arm pmu to align binding doc and move it under root
node to fix below CHECK_DTB warning:

arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-dtu.dtb: pmu@40089000 (arm,cortex-a5-pmu): 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/vf/vf500.dtsi | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/vf/vf500.dtsi b/arch/arm/boot/dts/nxp/vf/vf500.dtsi
index 0c0dd442300a3..71ccdaa6f269a 100644
--- a/arch/arm/boot/dts/nxp/vf/vf500.dtsi
+++ b/arch/arm/boot/dts/nxp/vf/vf500.dtsi
@@ -43,15 +43,13 @@ global_timer: timer@40002200 {
 			};
 		};
 
-		bus@40080000 {
-			pmu@40089000 {
-				compatible = "arm,cortex-a5-pmu";
-				interrupts = <7 IRQ_TYPE_LEVEL_HIGH>;
-				interrupt-affinity = <&a5_cpu>;
-				reg = <0x40089000 0x1000>;
-			};
-		};
+	};
 
+	pmu {
+		compatible = "arm,cortex-a5-pmu";
+		interrupts = <7 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&a5_cpu>;
+		interrupt-parent = <&mscm_ir>;
 	};
 };
 
-- 
2.34.1

