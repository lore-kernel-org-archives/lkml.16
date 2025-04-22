Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010047.outbound.protection.outlook.com [52.101.69.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDFEA2367B5;
	Tue, 22 Apr 2025 06:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745305066; cv=fail; b=TtTsWyA1BWwNz6l/3X72K4iR8qGuNm8KUMiQtzjy8x0+K6WCByylI69mfAbo+FoMGTRgKulkL3QhmFWUHKB1OCKisaAqWZhFZ2gEH11cJ+9dfNeR3k44E/2wlyS5BvtAaYyWjv/JvnwJj2YNb6f8oL3dhovN1l6Ioyzx/5k9cxs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745305066; c=relaxed/simple;
	bh=aS/HDYtYqDxPjRUXDfXdrfX3S9HdUolf0xr9Mtcfio4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uOTQGlAxE/rkekCGufhrLgJqwhSPlMRTQocm16SnLkwQFL0RvqKmzT4H2utnUbB3wPUI7Cm6YQ2e3pnSCFKyc+4x/TMrerLJRc8NGWS6/O882SE98JOxRlBqsqrY2fubhoz/tm725d394tDFSQrJAvVTt3uokcdNulL73tIZDMc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=JlO6ksP1; arc=fail smtp.client-ip=52.101.69.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="JlO6ksP1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bh0LVU6Utf8dJeFSZUBaQa8j+ZQnhhtZVXgayoYLHpDOPJotrLLbpCch9uXUvC2GFmIlkX2LiqQYhdKEQQ+4P5K9SxqUxcE7/4Q32zq1JHoJhEczpDCnxJEEJo5aZToELYG0aukHlH6eVXSEaATYGGs31G257gv8RxYgh97UucHasyCj4oqpswvliU0YnNWRxMAPRonVk7YdWoLM3tWtCEzKjJD/15ZJ19dSoXBygZFpirnB7/yO/9NuW5bbPCE2i+QJzbFYOMi9UJeKD08CnkhQCZ2rN1p14j9rOx0Q8xsZ6tT+7UIGKZRY0SCoRCRJSECtf19bQgTr4SfQG0lAyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gk74jEeWwFKCivRzu/axBuc+nzb6+AbfevBBvTe8U6c=;
 b=cdl36+qTGrjShClpeMCu81bX2gudAM8EDD9WeekbNeKX3OdMKUtIYrQXLgKejJOU+/ItbohIGg6ZxeY4XOSPAXtjbMHCWh4Wi7fhAHeWETMU+uOM6CqvI1Na8zs6dN0auMvpAuvdwoPIMB/eTD4rltUwxQYEW6x4ni/GjyvsKOUb6Tm4lJpFAPjEHEiXwRsIBa4V3VAlI24BcRWIhV3+vQg9WhdJt9fvtaRSEWU4NHHAtUstpnPTWttvupKnNsykIFCRkpIx93YxoH1S7tNfM3qvsv/nGDgHJd/u/ajxkki+tYPre1t4qS62xQ+Pn4bKOQkN15mnF5onfE13btEP9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gk74jEeWwFKCivRzu/axBuc+nzb6+AbfevBBvTe8U6c=;
 b=JlO6ksP1CxR/zs/A5moDVfCHD7isSToL4/er48NHZEd1RpmSuC31QDcQTA4IqotkfoadHIl602a6B0A0/5QYektwjWucy+Ww/2MDKzi/UDh0plhhMYZ64lAfhrL6fQxM6vQt0V3NHtcyx8bdSo2QtHlaKJOHGAak+FZBIfUYeIzkQepDU5r6TWGash0lCQq3oeHo19fkdNtBZfBrK7xKbs2mydx7vp4fweHrSKyvfzXFbYJ4nvP7VfGALxMPJMJ2Zq/Ig6Bl0G3LeYy7hKfG1RkaV9VTPpg229zc1yA5t/ERlwFwgMu98sio6X3Nn1UOGRzMwp6QfwqLkhe/Wz5jJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14) by DB9PR04MB9937.eurprd04.prod.outlook.com
 (2603:10a6:10:4ec::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Tue, 22 Apr
 2025 06:57:41 +0000
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687]) by VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687%7]) with mapi id 15.20.8655.031; Tue, 22 Apr 2025
 06:57:41 +0000
From: carlos.song@nxp.com
To: miquel.raynal@bootlin.com,
	Frank.Li@nxp.com,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	conor.culhane@silvaco.com
Cc: linux-i3c@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH V3 2/3] i3c: master: svc: switch to bulk clk API for flexible clock support
Date: Tue, 22 Apr 2025 15:08:52 +0800
Message-Id: <20250422070853.2758573-3-carlos.song@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250422070853.2758573-1-carlos.song@nxp.com>
References: <20250422070853.2758573-1-carlos.song@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P192CA0028.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e1::13) To VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI2PR04MB11147:EE_|DB9PR04MB9937:EE_
X-MS-Office365-Filtering-Correlation-Id: 76d0e819-2311-4b34-c008-08dd816af984
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|1800799024|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WU7Q4059REFcrJ9aKn4JZbWojIZ5MoJBO31X2q1o7IjWcz1APaKAQRkPJYD6?=
 =?us-ascii?Q?a+47guQ/5Qfx+fST1iY6SPsEQnVncpyVVp6YnzFKiyR4azdmBADGpnmTKdM6?=
 =?us-ascii?Q?9uspWEnpsSz0i72tdFF5s4SPlCl/NofrdziAw3L9fa8a6kpA1QJ1N0NaalL3?=
 =?us-ascii?Q?wt7MfHbCB3yoGMajL6Kg8DKNMMJzXhXWoRJjhUZjsG4RKWebmXSCX4ZbGJLp?=
 =?us-ascii?Q?D5yh82d1/jesPEiW9mZ0bnkscBHZUU82+EoXOm3+xfJxoY3G3WTK1D9p8Vwp?=
 =?us-ascii?Q?GNImt01xcB80/BhEvzX4DN13KB3uNuV4ils4YOrzXb41aEDD5xZnZn+BQ7Q/?=
 =?us-ascii?Q?CVOKPRqoskjhBPpk+q8oEjx2v0v3KkDle10fz2bVp9KeW8zyCXnsVT4PAsVY?=
 =?us-ascii?Q?wdE3CSBBjVOPoUts3joJgWW84GlGEet8Y+Y725z07vuP1rOt6Bt4aBGIZB80?=
 =?us-ascii?Q?osrcECFnDq55B75jS+LJQhz7xdWTRUKg/5oPt8KpeE3OMhBGHfu3F5oj6RCs?=
 =?us-ascii?Q?c9a/FLDzg9oZPnmuQIyIWsdAUJYcWn6aU8XJEKtfTv80x4EX7uuRCvkbrDOn?=
 =?us-ascii?Q?TFGCO4w/sLUGIrGEwT+n8b2+rvGfxy87lNly7toL0QNS5gKis4oIfA8doVGk?=
 =?us-ascii?Q?I7g+U5BclSzuX5k8RkDAR39Vdq3Blr9HDY1P/sxDqIe9n90UIFTZEFTp8m8F?=
 =?us-ascii?Q?oPVKH1/SfbkiNabMdurcnmoTtwFid/Ft1Smp8+mUqh71l2c2pfZFPS6pFkEy?=
 =?us-ascii?Q?DYXlu5JXo+sMu06zDGtVdUnAPxG75qd24N/0A5yQzPQZ7uY3pQkdCbaVBo41?=
 =?us-ascii?Q?ENm4TGyXdoYx03BQ4xoYNum9v/JNG0eQ/joinQPFvN0V+dCM7AIpPd1CeUyV?=
 =?us-ascii?Q?3J48Qjgkg9VW9H+/SHXZtjORrAn8RRjaTLwamMGlOwofsttZVI7LcCnaJLeL?=
 =?us-ascii?Q?sWY4yAnSNbKM454ShFMJf37nYcyNJHIt6OdYQCx9Fm+noOi7c2XMN6Gl/QbZ?=
 =?us-ascii?Q?SjIj5u8obF0MBu2OISrdUoQ0lSMs46moq92wv9muWFNCnBn5LFbDqVwK07ZQ?=
 =?us-ascii?Q?+WeTGF8CTDeBfRE/FTwN/ynx1iFhW+fMMpAIVQfKjZAkDtWkm50yKSyVGDcJ?=
 =?us-ascii?Q?lSmHi2VpDqMCUuJN17UCPUiWGj1sbwZgniqNBl7LVRYs250u1BI1wM2o/tHC?=
 =?us-ascii?Q?I6EYY7fcrdsLYhDJCbfJ/N1YqpcPfjc1NnQ1uWtWy5RXZ9z4p2QcOEiNl4E2?=
 =?us-ascii?Q?4S0RZWfLky6wqo2SQzlWIv1rzDvyTj8M3hc8Y6EsRMbgvoMi8ifhZZItOiAS?=
 =?us-ascii?Q?vCI8QJO1kuECW6dYQCRUGahktED+jT2uYkewXLzR3jcDoAdMCFYd1BRtFbU5?=
 =?us-ascii?Q?DYrBLWKUPj7Ov/NUOjsTQrXQWOuddXnm+I2/VrBaRYJXoaweoAj+pPqvjHsq?=
 =?us-ascii?Q?rAzc+BiBUBpDO7pCJ4IEJlReJHDJ4stQlL2N/HJTLJDRWk5FoQR5z3DO01To?=
 =?us-ascii?Q?8CHYHclcLY0wCWs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2PR04MB11147.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(1800799024)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jZiC/QbwPYnrfxfVzwYQ7VQZ/mwMTDERO9kXkFK8PiDkXPW1G98t94G0Tfg6?=
 =?us-ascii?Q?UPY8yohhjZZOE8EY2IjprLASfzKqRsUeLlCqW2HwbRvnGblwHoZgoZdNsLfm?=
 =?us-ascii?Q?wHJqB9vY6xaolFRMcFCyWumgj2/B871bLKIvlv5dAMAG66TIZHEnRXcCfWnP?=
 =?us-ascii?Q?feZQPiGvs3yqI/9DArKY6boIrCJd5QozClpS0CnpNoTjGrTmx0QQCITzN89s?=
 =?us-ascii?Q?rmntl6yFAIm1lphMGn1C4j2L4Psov3gRmxPbEKmCJd0ChIvsTNWmZLJCLQNQ?=
 =?us-ascii?Q?16fEAPN7DMxWPLqL/8BBOP7NUAjoTGO/w/eGkcbNH/HcUYoB6S59tOEc6933?=
 =?us-ascii?Q?3wTZNKeJCJUahQCb5p1HFDyhFN6+m8S+zK2lxaq3i3VqvJn3RYMVpSVJRM+1?=
 =?us-ascii?Q?oXqsMZyY33lLS3sv1R33nHla32ONP2QAHwHhdHwPCBcPFP8B4HU+WG7Tg6eI?=
 =?us-ascii?Q?iuebjM2cPca/ZsoU6S+1lQ+yXNNqyGiD+5P9dWpSxNqD0IiuWO9/lrJiZlBS?=
 =?us-ascii?Q?UjjmEBeqrHw81BTQHYvyYlKh1gLjIjPzyDCvap5AXzEh9KQyfWflvTr3OUke?=
 =?us-ascii?Q?SqKxsnd8+hBCR0L8rHb0yiebOtDKGucOeSy1Tb7FmqkDVDBZmzcIHtPT9L1P?=
 =?us-ascii?Q?b+RpWSNU+oG8XoYl7OidWV/vGivr+WrvMdFGLahhkI0gbXD4E+j1NxsDFWAj?=
 =?us-ascii?Q?kema8xD3Dp2OC0jn0Ds1PiTlKPjyxPjthCyaUUzfWSapXITYrFo/ylIm15/W?=
 =?us-ascii?Q?ABjG+YSHXI+0tHHFAUA8uwb5XJDKGpbgndUh2fvJfCWcJYF7kKTLSUpPmIAf?=
 =?us-ascii?Q?5dgcN4Xr/zNxZeivljkrQIz9Pgu/kYXSgf/yPNC5OFAZHSmY2rotvdkZvqig?=
 =?us-ascii?Q?QJCm1M4Vz/+mG/qdOw8JycoF632j2Cre63pbzMn/txeqi+jce522F4anbl7N?=
 =?us-ascii?Q?tmJUHoBwfYbxhoU3FtqzqCKhyDXKoSIZIGPOqcE4rdDLJeFkbRQKRAaIorzV?=
 =?us-ascii?Q?mfb+vwU7glp3OIBv/KN9Si7MGe9PUvBl9cvQJoTPx3rfJJkIK7T+B1Rr64r0?=
 =?us-ascii?Q?81rGas5I5LhiqQQ8wET1Wxqm/te7d06JP2+P/RsQIUUDzLBCxtkDEMMvp77O?=
 =?us-ascii?Q?d+qq9gQkxXCEi5NwOlkgu+DCbIkOuR3BPyHZRroUjgc9lwrlKZT/wTjgSGWP?=
 =?us-ascii?Q?K4Nt6lPRK7KOMCwdWJRXlNFsZyU8OSMDaOw/3nbs9ZlNEgC2aQ45rG8zEzJw?=
 =?us-ascii?Q?z3UUk0xXmgy5KoIoaJSqSej6DrPyNv8HB2fl+8USKCLA4pMnroTPf47fhulo?=
 =?us-ascii?Q?Rum3bSjYi2V+AZiS1AamBXrHOPaglzqCDg6Q00NWcgr54CMKZRUgWM7tjByS?=
 =?us-ascii?Q?HoeeaYCHI7Q+7LBUGEYBwg4xep2zOr9HQedEWYzJrCK1gF/gjGiv+Mhsqb+l?=
 =?us-ascii?Q?j84nGsLaiQBTYT6oIed9SSxCYQ/Pljb2nqVTCeUa2ng0xWhCF1lxWja31yxN?=
 =?us-ascii?Q?L8GOdHTq52umzaddENUPPRK0JKr/Cf1I7MXrkOatYABf+neRvVHjBkTCd3tA?=
 =?us-ascii?Q?TXuveRCLW36AC4IN32s1zy6RYYU9QmNc8h+52JTs?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76d0e819-2311-4b34-c008-08dd816af984
X-MS-Exchange-CrossTenant-AuthSource: VI2PR04MB11147.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 06:57:41.4135
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nLItvcjB8HkyuixHLfLwYW8YN50BFCM24iUFg4vRGRXKdyJ+FwL6BoaFKLO214FKSPTviecHkQAkGxzopzdYDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9937

From: Carlos Song <carlos.song@nxp.com>

Use the clk_bulk API to handle clocks, so the code can support different
numbers of clocks more easily. Make the code cleaner and more flexible.

No change in functionality.

Signed-off-by: Carlos Song <carlos.song@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
Change for V3:
- No change
Change for V2:
- fix warning from bot test. Use -EINVA instead of uninitialized ret in
  dev_err_probe
- use master->fclk = master->clks[i].clk instead of devm_clk_get
  (dev, "fast_clk");
---
 drivers/i3c/master/svc-i3c-master.c | 76 ++++++++++-------------------
 1 file changed, 26 insertions(+), 50 deletions(-)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index 85e16de208d3..d8cb0b9a2597 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -203,9 +203,9 @@ struct svc_i3c_drvdata {
  * @hj_work: Hot-join work
  * @ibi_work: IBI work
  * @irq: Main interrupt
- * @pclk: System clock
+ * @num_clks: I3C clock number
  * @fclk: Fast clock (bus)
- * @sclk: Slow clock (other events)
+ * @clks: I3C clock array
  * @xferqueue: Transfer queue structure
  * @xferqueue.list: List member
  * @xferqueue.cur: Current ongoing transfer
@@ -231,9 +231,9 @@ struct svc_i3c_master {
 	struct work_struct hj_work;
 	struct work_struct ibi_work;
 	int irq;
-	struct clk *pclk;
+	int num_clks;
 	struct clk *fclk;
-	struct clk *sclk;
+	struct clk_bulk_data *clks;
 	struct {
 		struct list_head list;
 		struct svc_i3c_xfer *cur;
@@ -1875,42 +1875,11 @@ static const struct i3c_master_controller_ops svc_i3c_master_ops = {
 	.set_speed = svc_i3c_master_set_speed,
 };
 
-static int svc_i3c_master_prepare_clks(struct svc_i3c_master *master)
-{
-	int ret = 0;
-
-	ret = clk_prepare_enable(master->pclk);
-	if (ret)
-		return ret;
-
-	ret = clk_prepare_enable(master->fclk);
-	if (ret) {
-		clk_disable_unprepare(master->pclk);
-		return ret;
-	}
-
-	ret = clk_prepare_enable(master->sclk);
-	if (ret) {
-		clk_disable_unprepare(master->pclk);
-		clk_disable_unprepare(master->fclk);
-		return ret;
-	}
-
-	return 0;
-}
-
-static void svc_i3c_master_unprepare_clks(struct svc_i3c_master *master)
-{
-	clk_disable_unprepare(master->pclk);
-	clk_disable_unprepare(master->fclk);
-	clk_disable_unprepare(master->sclk);
-}
-
 static int svc_i3c_master_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct svc_i3c_master *master;
-	int ret;
+	int ret, i;
 
 	master = devm_kzalloc(dev, sizeof(*master), GFP_KERNEL);
 	if (!master)
@@ -1924,27 +1893,31 @@ static int svc_i3c_master_probe(struct platform_device *pdev)
 	if (IS_ERR(master->regs))
 		return PTR_ERR(master->regs);
 
-	master->pclk = devm_clk_get(dev, "pclk");
-	if (IS_ERR(master->pclk))
-		return PTR_ERR(master->pclk);
+	master->num_clks = devm_clk_bulk_get_all(dev, &master->clks);
+	if (master->num_clks < 0)
+		return dev_err_probe(dev, -EINVAL, "can't get I3C clocks\n");
+
+	for (i = 0; i < master->num_clks; i++) {
+		if (!strcmp(master->clks[i].id, "fast_clk"))
+			break;
+	}
+
+	if (i == master->num_clks)
+		return dev_err_probe(dev, -EINVAL,
+				     "can't get I3C peripheral clock\n");
 
-	master->fclk = devm_clk_get(dev, "fast_clk");
+	master->fclk = master->clks[i].clk;
 	if (IS_ERR(master->fclk))
 		return PTR_ERR(master->fclk);
 
-	master->sclk = devm_clk_get(dev, "slow_clk");
-	if (IS_ERR(master->sclk))
-		return PTR_ERR(master->sclk);
-
 	master->irq = platform_get_irq(pdev, 0);
 	if (master->irq < 0)
 		return master->irq;
 
 	master->dev = dev;
-
-	ret = svc_i3c_master_prepare_clks(master);
+	ret = clk_bulk_prepare_enable(master->num_clks, master->clks);
 	if (ret)
-		return ret;
+		return dev_err_probe(dev, ret, "can't enable I3C clocks\n");
 
 	INIT_WORK(&master->hj_work, svc_i3c_master_hj_work);
 	INIT_WORK(&master->ibi_work, svc_i3c_master_ibi_work);
@@ -1998,7 +1971,7 @@ static int svc_i3c_master_probe(struct platform_device *pdev)
 	pm_runtime_set_suspended(&pdev->dev);
 
 err_disable_clks:
-	svc_i3c_master_unprepare_clks(master);
+	clk_bulk_disable_unprepare(master->num_clks, master->clks);
 
 	return ret;
 }
@@ -2036,7 +2009,7 @@ static int __maybe_unused svc_i3c_runtime_suspend(struct device *dev)
 	struct svc_i3c_master *master = dev_get_drvdata(dev);
 
 	svc_i3c_save_regs(master);
-	svc_i3c_master_unprepare_clks(master);
+	clk_bulk_disable_unprepare(master->num_clks, master->clks);
 	pinctrl_pm_select_sleep_state(dev);
 
 	return 0;
@@ -2045,9 +2018,12 @@ static int __maybe_unused svc_i3c_runtime_suspend(struct device *dev)
 static int __maybe_unused svc_i3c_runtime_resume(struct device *dev)
 {
 	struct svc_i3c_master *master = dev_get_drvdata(dev);
+	int ret;
 
 	pinctrl_pm_select_default_state(dev);
-	svc_i3c_master_prepare_clks(master);
+	ret = clk_bulk_prepare_enable(master->num_clks, master->clks);
+	if (ret)
+		return ret;
 
 	svc_i3c_restore_regs(master);
 
-- 
2.34.1

