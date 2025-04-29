Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2057.outbound.protection.outlook.com [40.107.21.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A1A23370C
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 05:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745905382; cv=fail; b=kjMdgZEmu55MsEQqUyC66P++wKCmIAYwGhmOW6CmdyPky+hbXHq75Qt60n55/9isJHcXilZqK9DyGRogw5lTrvqJjIq5bnNmWfDHP2dN/AhDGnaqueot6WxklkLUOANNkIddSGIh93JxNIJDrLO8eov0nzESuzezHnUxhS1GiHc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745905382; c=relaxed/simple;
	bh=d6JImn4RhzHBg6isYVvrUdlqSiNQLiyUw3nBHJBmSwQ=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=jfMm/sWIu0+iOjc4PQd4yUnVUwAfWhEjNiApUikpMoeLDeY80cwDa8FWXT5gd5a/Zdeoct/o+VG+XdOTIo1YYTfC7wYPvrpu3VsFo/LCkCsSb1UBjns7s0I12JEsyZ2ok0j1NEOKlaxTNCNmD2PTtQTJjPGcf+sUMI00Z4LpFUg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=hMyHlbH8; arc=fail smtp.client-ip=40.107.21.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="hMyHlbH8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DuJRXuVlLvau4IGmerTH87j7eIN8PIlpII4Stm4P5j+Rcz/0wDbJBjLu2EG04BHcKZz0m4knU9bpnFGYER4gS2dC7lOnR77zG+2XMu7neOmukn/dZ6fW1304iZzeaRmwJVja2UyEDnp8H0iN4LKH5/V1ufJQLUZwuS3+i6IEiwWdctDfbqFsLwRlGa1VmgyyBeAsQeF6it6g15cogCXMD644LU9FlccvyzhhklsMP7A68P0BKeUWbxqiNK7/AsBLSBlTAVgHDa7A8a4RPW62ZeHv1stwUXBjbl06SdbT2E5BokDUxWMVTU9FKBD8hJz4H9pPDpfUdszcOciPXSUiNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s0GMoWtH01qkuAr8hbkxTGLYawJ+5aby8JPRnyKLEzM=;
 b=hV4g4c+hEsu84FuCkTb3CQdkGenWAP7D19aXuLxFPiaLM4NrK1tQo7OIhZ6HEgvxynLS7AV34xT6TXNisAOD0l5IqquNS7HG0Aht4gfcTZqeMFw1ksiMGriTjldWPrcbLiIwxUo7szAB7+nowuquHaqXFrzNa17v/nZblymv+ZmFVhOT+U/o6SKO7d7mpTKrjOhsmyb0BH6DBG9dy1iSPsCFOlQG5xQ2Yyy0DCcLdn8BzUbidoTS8tlzqmAxbXiHs22ybAM3wm5FsekdeH7R+FqsWoa9Mf0Orxo/ECkrH1GkZZpJmWr/OZMFpStt7XfTzp87+d5XHyFf7Fc1D7/M3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s0GMoWtH01qkuAr8hbkxTGLYawJ+5aby8JPRnyKLEzM=;
 b=hMyHlbH8YW1Om+VRWfEDYyUKpL4qJIUKdTknFYXTzZ3YefJWiFine69vBOo/7JUWnA/Jm7Xq+x3Yq4XjzS1VYE3V8dVeiirhjS+BKb49biwiVnQwAubfdyOvzBzeGjz8gw1yPN4kbUhMa5+DWkj0h3g/ZDs6XS9NIH9zPvvFcRckoMqBpl6d839VklHVh6kivE9PrZiGajMieem2K0HcyP2WDytbBCxu8WYZE2Rdjh6KemGaCV1uYg4IMoNoL62M5Y4fGCY7SVPXdFkS0Zd54/LyCSMaPFXX7eh2DCtpYbhVK17kXcFQeEfNlfirnvIidX2AUXMCUkzjfiHNcaP8Wg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM9PR04MB8424.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Tue, 29 Apr
 2025 05:42:57 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 05:42:57 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org (moderated list:SILVACO I3C DUAL-ROLE MASTER),
	imx@lists.linux.dev (open list:SILVACO I3C DUAL-ROLE MASTER),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH v2 1/1] i3c: master: svc: skip address resend on repeat START
Date: Tue, 29 Apr 2025 01:42:34 -0400
Message-Id: <20250429054234.4013929-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8PR05CA0011.namprd05.prod.outlook.com
 (2603:10b6:510:2cc::28) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM9PR04MB8424:EE_
X-MS-Office365-Filtering-Correlation-Id: b16be04e-c887-45cb-7cc2-08dd86e0b102
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?D6Y9nVgKWUsJEh7VaHAeV0IWe3VqvTFdXymT3Spsc/Kpuw/zZILO/FLr5Ytd?=
 =?us-ascii?Q?O3vgeiSyNKT7+eVnc3qftRH4xnBCS+ps7XyIKIVlPJIrscrHg38vWFvwG9mp?=
 =?us-ascii?Q?Vi7fOLs4vQXePj0ZaJpV5OfhK3WX2ffqYf75GrYSFB/vptmWF58aIgDuytda?=
 =?us-ascii?Q?X0gVkfp63/NN1cOPVuD9ds0HqtabYt0qxsJkch5+TcXl9iekGEz8OJsgmilN?=
 =?us-ascii?Q?OGFLduOfi0bcbEbb4PFXLyAHlxY44vo67fkAjhdirjDtiaPhRbD7+H9bJp3f?=
 =?us-ascii?Q?dJQFh3E1ucZt/cfxCx9NHfmyr6HJ8jxYexhRO+3Z8DB49GBeaZ/hhJ4kbDdo?=
 =?us-ascii?Q?OmB5UbPPTbfadUmNLGJZDHzPZ6C8tFB6JLzKa9DiXgacFhtJl9chjERS1MXo?=
 =?us-ascii?Q?qbnxZIt96V6tU40skUbdbplOyQgPmKVMTZu9SNr0XyGWNGKPfazlF3ptGrge?=
 =?us-ascii?Q?ZpY8VwFGVvkkKS/fbtr8U84hgDwvoWDuyydc9jE++wluGwr2fOy0hAXZH3zy?=
 =?us-ascii?Q?KWiC/6EErkjz021BgE7C4zMiX+mxWma9PTnevgUojpzY6uGkjBLp1PA+4O0V?=
 =?us-ascii?Q?UW9GbmMbw19PVzqqUGPoduH5Mc8ZYOQthPTbSaGyVx0WlxxSn7PcGdrWyJmZ?=
 =?us-ascii?Q?yiWcIasOxPSQVDhLwXN1JGhmGTveqNZtM2SddZKkdORng41kp+8kCpR+SSOH?=
 =?us-ascii?Q?4nmbBR14xBGMjMVdh+DK4B4SOATuYSS73LAKnLyG8O11/dIA8t5zEAbFDlAv?=
 =?us-ascii?Q?6u+0h8bzGVFFnIaATWBIXgyqWVPV9luQoVWs3J0hxDTvyy5zaW54y4X9RJ2+?=
 =?us-ascii?Q?PyLyfqGIKTeGaxccJ622CdHgSxXohuXgEkFj0/zJ40dt3BOrMsTQPjXQhMTt?=
 =?us-ascii?Q?slimmM6bKjwdD+O2soRLYDwdpm/9ymkz3mFEmNf3uYlIxY/DksDC27HbQRue?=
 =?us-ascii?Q?4wph/meBzAefyEFPIh+POJC5Kf32bnkuniCJVhNUFkv1xffV45vBjxgaFUhZ?=
 =?us-ascii?Q?knqu+WvmYdjPe47k4XtwZ8nMoU3d7+VOQYPooY3jMH6c+WZcv8yIYmqOebgD?=
 =?us-ascii?Q?E9VY9d1xd2Ha+t7Z7yTlujybDDUgJFJ5imrunMypFyglgsXTqTEvmId+MChP?=
 =?us-ascii?Q?4esQlJQMCx31eumXN3F/J8BDrOcRQFjyLDI/CvyGweqAk/iRE4KRxrwHIrJE?=
 =?us-ascii?Q?vqOqWekYnjltIyLhb/vIXfhZ888JmLtoU7cK2uVJXJRnv1pIRDhwxTyYShVL?=
 =?us-ascii?Q?Y2/GJiEQKCWT0gXMcCE9Fjo60X96mmc7ore/UOI6DtQoU+E2vyRAoYeD9EuI?=
 =?us-ascii?Q?Y6fRxuYxgUs4TWzho2WTBQ/CO97EWPn0aWdA03lD1G53V978Zyjqx2xQ8hnS?=
 =?us-ascii?Q?ZPFO+CohdgL9AYQDReIKy/9rXbULnVmy3PClcIOvbkCaoUviQ7iSNPV/S95Y?=
 =?us-ascii?Q?7CUAd5SySKcYQIwkYSEL8+rFovjvizOxx/5ZVWbU3jNpG+43g50zfA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?G1sXpZVZfgZO2WI0JehE4Ep5RqzS1hleIqf/jmTD5see5ueeOCoy8dfsYTon?=
 =?us-ascii?Q?cL7sX7MlwPn6H4q8aP1bW2T5n8RIAID0pXQyT1J30IZm/ON7rhDJ4QvJCGVk?=
 =?us-ascii?Q?mOIIO4IlZot5LjcxMuzMlHTe3Pen0/JDw5xMdVmLHm3JyHixdk3yBjcs+pQc?=
 =?us-ascii?Q?O4O4NauG2WR0oTfjusaYgLO1HNkqlIquyA0Ur3nAYnZy7Rt4ndVePwauaQIi?=
 =?us-ascii?Q?pWKRw3lQSFd34stL5hgoJSgdixjFq4z5NSkZmw8RpgsAYlj5ue9U7K6O7DMt?=
 =?us-ascii?Q?f4YnlrgxRk1uqAtyXTgn1akoQ1yG1BMCBsj4wKCJk0fFXhuEe6lbBCvA0E79?=
 =?us-ascii?Q?7PUPoDGh+pcvzMbuDv+ifyxiZmAUp6YdmWuKN1x/RjfvvsS/BWBIh+AEborc?=
 =?us-ascii?Q?uhvMNLMI906XKMIa6rOWJmozAKYPh32UFaDnSqIvTrq5/dK9ThJzpmYEo0QL?=
 =?us-ascii?Q?0JtJkVOfQcwESJvtjl70zX5PL5Yx2q61yNLQbuC4B6rQ29p3VE/GivjFt+61?=
 =?us-ascii?Q?WS4gxLCXMxhAlwUJfR1u4Lko7MF7cUiJfjBH6Za2iao5XrsIKmL1+hVWeWpZ?=
 =?us-ascii?Q?Rdr0JgA+t+9iZ5mxJkJ+53Jg1aSsNSEI1pxOH5jk0IdeDFrIp8VIJzw+Fjbc?=
 =?us-ascii?Q?LTdk6RIVT/Vyr9pTD7LzyxcYoyWrP2IC7WbsbkrGTiU93zI3E77EVcHH7M0f?=
 =?us-ascii?Q?8XfDnK7HTzq3/DeDZcvPn1Ji3JGO3tDDWkX5jVTC9oUeS8VP7vhmF3kqylhi?=
 =?us-ascii?Q?eJHMIZT1xsARNo8EfGjAMpTOL8NBlVqKPXYNOFvhzcpvKc5vqCHCV4ZbB8W3?=
 =?us-ascii?Q?1blLZoWPiNtOB2c2Nynwo8tCz0OpYa9WZWwrDBxHdzGc7glZKy5qwGacv6rT?=
 =?us-ascii?Q?jLThqNQuqTtkT/mC3D+sY6g++EANxRC83vqnEMe9Jo9zgQErfjXsawjKKTM/?=
 =?us-ascii?Q?72nsnuzROnRGbXmXlPyIrqXPefm0uMfxDeW1Z/4Iuys+lowGsAcf9ei3I35X?=
 =?us-ascii?Q?utQFixxprQFIfbOaQA0wMMBgXMkSwujInI2QpHMEkgzxwRz2uKR0/C9arBy7?=
 =?us-ascii?Q?NeJjvXrw20tFko4wvcivhKtXa6mbysLaUapO7DymRcOBnUfEVPLBALAfH+j5?=
 =?us-ascii?Q?+7LWOqLc6NB+g3XGiWnW1EstRhZodn5Mx6QA75XFdrGs2z5wt6nwG4rmja5/?=
 =?us-ascii?Q?Pv6dOIdBjy0KMGC8BpbIUjowbNLyMUTxIwqHDRGdYHSwH6ds50W2mUxfSNM5?=
 =?us-ascii?Q?n0AlS1is5ZZNmEeU9MiiG97vcODW4MeU8wat9a6vvlTsIyxTPml/5O3uBUPh?=
 =?us-ascii?Q?ue6hNayLS1QDxAPnayy9eGYH8gq1cIedszfDpUkROf1vUc0UcFdXVNauAfPA?=
 =?us-ascii?Q?qU1HFDB+HsBVIBEb/HmFwK5b5RT46bUaLUt96C649KoXb7ICbCt2ox16jHK/?=
 =?us-ascii?Q?ke54BKaMD2b7ak3orq13/Y02e1wiJkrH2CinWd7G9bbvmTSQqjmxc3n2VJYp?=
 =?us-ascii?Q?D7dQcLcvfELzEwGks7vJbC8esBKEPx8y2Afza7eNg/2hFmkycqD8ORm9l1lr?=
 =?us-ascii?Q?DxgJfyztvw8YSqzQnaQ=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b16be04e-c887-45cb-7cc2-08dd86e0b102
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 05:42:56.9913
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v2gpeqCMv2KUcauf7jvQ26Am2rTeM4sWcmrRDDh/gawZ5alBVim2KuUsCBMGzcFlcz/87MZ9+hxxr4qbscYuwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8424

According to the I3C specification, address arbitration only happens during
the START. Repeated START do not initiate arbitration, and In-Band
Interrupts (IBIs) cannot occur at this stage.

Resending the address upon a NACK in a repeat START is therefore redundant
and unnecessary. Avoid redundant retries, improving efficiency and ensuring
protocol compliance.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change from v1 to v2
- change !!i  to i > 0
---
 drivers/i3c/master/svc-i3c-master.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index 85e16de208d3b..c5e4f7c0f47e2 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -1281,9 +1281,9 @@ static int svc_i3c_master_write(struct svc_i3c_master *master,
 static int svc_i3c_master_xfer(struct svc_i3c_master *master,
 			       bool rnw, unsigned int xfer_type, u8 addr,
 			       u8 *in, const u8 *out, unsigned int xfer_len,
-			       unsigned int *actual_len, bool continued)
+			       unsigned int *actual_len, bool continued, bool repeat_start)
 {
-	int retry = 2;
+	int retry = repeat_start ? 1 : 2;
 	u32 reg;
 	int ret;
 
@@ -1468,7 +1468,7 @@ static void svc_i3c_master_start_xfer_locked(struct svc_i3c_master *master)
 		ret = svc_i3c_master_xfer(master, cmd->rnw, xfer->type,
 					  cmd->addr, cmd->in, cmd->out,
 					  cmd->len, &cmd->actual_len,
-					  cmd->continued);
+					  cmd->continued, i > 0);
 		/* cmd->xfer is NULL if I2C or CCC transfer */
 		if (cmd->xfer)
 			cmd->xfer->actual_len = cmd->actual_len;
-- 
2.34.1

