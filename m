Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010019.outbound.protection.outlook.com [52.101.69.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC5B2594BE;
	Mon, 21 Apr 2025 06:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745215487; cv=fail; b=DRYatviQvIlP8ssmmIVl9OhpaZmheKvDM2koHOwHitBSegMwpDoK0/TIbxKZxjGV5h+K2xl8G3qkPHTHkTnIEH+AJLV3Zr+tNlR3jY4AibG7DMR5kCR3bAABOkFiO/hkqhKRpBIptMPxAVw6hHUyX6M/ZJ88z53wFcTVez/boM4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745215487; c=relaxed/simple;
	bh=mB3L+pa7GQqlO0uL/f7FxTkD1rBNW9UNBgpcv11dFiA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Pbv5JE9uVxI50ZyLV2pBA6anQqZUHyBt/Q6FG7VheZ/RKe7i1xDD+vafVHnADyjKyaglLxDR9phjZKImUZ/PXIa21KrNjzQVhJh1ZXHozvDy05b4M1ZG4e/GpnveP1jbd1YFXWwVv6CQpPWwS9ubpw4Y0CBaS+HdjeQmt59VVkc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GY26I6x+; arc=fail smtp.client-ip=52.101.69.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GY26I6x+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yxhIHd0C3DYAw6P73EtL1CH4+rqC9sQunE9xoqh5FE9qIVLbLpM0wn+tGxP21cw1lxME//8vKh/RfQswwahVa00c+4N9rC7tH2Obhr3kzaoKbSermtcIirCA1Ow0O/PJnROdpke5tguzBLPJ3Wc07C8bbGbu/8sndcvyPe1ia2Hm+B4kbBoM3aKBDft6CGxtOwh1xnhQQAiVDYzKRcw/xRxGRUJJbEdxKADVpDnbW3xnCWDFo4WnGqDCIwAAVBpdNWSSmBZhUrdqAuz00mq2QdeAW0HOje2tKsw9fMsSLzP6bccgen+Zoqnn0QEKlr3W/uzPMoHSAmihjKkzSHaBPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pNix5Z3TsWH81mds03ZacywtycmA+p8EAUsjLA/aMtg=;
 b=yEXJjgHXfnEyvOFk5b10p3i0dJcGGI+P0d9axOBtHow0PBJ2nF/8ItclRjnKg0C0jFt8/Y309n74ZxXuhfGhXeHeg9LksfvS0Bhd55Qrz69FkwHY71NkYCHoyCM68gsXTkDefe8TFhQ7Ud4BRvFEA/9ht5u/rVF39HG5y3EZfUWoD+vaO/VdYRSJ9Ge5UbrfEAJZc9bWd5uN0h0oG2h9NBHLqHABlQIfjaRtdLXp8hZoxNCaBm8Md4OU3QKz48BV1RAIvKtmP5WykodhDdR6b7UVwjOhc2jlgwvKL0TOI997plX/V/IVzFOyw38CgQi9nSDtBYC8co9pUUtjTVZMFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pNix5Z3TsWH81mds03ZacywtycmA+p8EAUsjLA/aMtg=;
 b=GY26I6x+0rfE9yPniel9OPXEJgI8UGj9PY4GobNqnWgbwEz5MZq6Z2vlOnlod0OrZ+Gy4hdV7IaFKk6Z79r8LZMWGgFbF98IloutYFs0E19CQCFkIuk86xzNflaIGI2EPckAg0UK65OWMoB0J8ymoYDFRRb6+De8Bki3Mi3YVWI8CFB+0RH+BWD1a8PyJFZKqTF5OSOiavUXzjlLNlftgCnfr/oKttutJ2CM87EN6wdlvDUhiPWLjszElIQ0d/6krkE3ZWnXc1rDNdH5MocXeckK8S7VH79YgxSqvFEAJSW/fC349Fm17vWvm2URigWkU/sgnZpv1TurI+Vs+DgHTA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14) by PA4PR04MB7646.eurprd04.prod.outlook.com
 (2603:10a6:102:f3::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Mon, 21 Apr
 2025 06:04:41 +0000
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687]) by VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687%7]) with mapi id 15.20.8655.031; Mon, 21 Apr 2025
 06:04:41 +0000
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
Subject: [PATCH 2/3] i3c: master: svc: switch to bulk clk API for flexible clock support
Date: Mon, 21 Apr 2025 14:15:43 +0800
Message-Id: <20250421061544.2471379-3-carlos.song@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250421061544.2471379-1-carlos.song@nxp.com>
References: <20250421061544.2471379-1-carlos.song@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0165.apcprd04.prod.outlook.com (2603:1096:4::27)
 To VI2PR04MB11147.eurprd04.prod.outlook.com (2603:10a6:800:293::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI2PR04MB11147:EE_|PA4PR04MB7646:EE_
X-MS-Office365-Filtering-Correlation-Id: e2bc8b05-6818-4643-87d7-08dd809a6816
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8hvCXDlUKhjJ9FwahP7kI0Ad81Ku76DICHL5uFoTArNqawzLOQE6MOZBm7uL?=
 =?us-ascii?Q?ROBliyJLAdPW4oS/KoSE95te7iryhp/5EcBh5dzCHAcG9WKsESA10kRraXlS?=
 =?us-ascii?Q?f+h8OuGe19dOzwDK5qiXmSVo4eFEINYSe4YJKH3P9hvJnx5d4fO8w9mQfJiS?=
 =?us-ascii?Q?igZY89/LkWn4JaEkkkzeWL7AsAXZRpSa27x8gWAOCWPw1iKdNCfOK9EI1GTm?=
 =?us-ascii?Q?Bev6vh/5a6AhMBI5fGlIw0fGWzNTT1dvgx3CzMWVzmESwnpgcJfAMXZgSsRs?=
 =?us-ascii?Q?nApPd3ZQIjLcBezzHlz6ooNAbdjHZO7b93E9gwtayG2FE8QMJdWsD5x5WZ/D?=
 =?us-ascii?Q?jwsre/Nu27YH/m+KKOEXI+31OGB6uYmuzfHdoeo9MpvvLHmpwIk+/YJlmc5X?=
 =?us-ascii?Q?KlB3fBWL+waq+Xo5myCU5p6jM+bbEZ18y9gXZGnQm71f0F+JMtlfContseZX?=
 =?us-ascii?Q?hvXI4InQM5Fm5NvaF+54slzpwDFfeZd4i8rsGWzT0+NjZAGQqpiCvKSKIZC3?=
 =?us-ascii?Q?fcAYrWiEG9mL6bkis9RLA/uwGJ+UVDYKF/TCbbXiKGc264aG44NJnd5Ee4ex?=
 =?us-ascii?Q?HcCKCFuNBmDEfGwdSqQEPg5LotGJ8aBPxBei0Z5f2O/8ufOXFzVQe+q5IpqS?=
 =?us-ascii?Q?+UaZ1uSDmqDhot3RBzt5YAfpKjeRF+lfqh5nfY+qABlPp38bUK+cKxg2D536?=
 =?us-ascii?Q?HfjpBgYb4J9nB46v7xpWiC4JawsmCuf7Qr8iUot8wDEJa/mhjBKOedxqnj0Y?=
 =?us-ascii?Q?QaiFJEeLR4GU1nc4c5bhZRkyfmCThmAZGeUjdN07Hie6f61TfVCHgp1rlPBo?=
 =?us-ascii?Q?sVgM9ttxysZtRIhkzgbgDC4p9fxy66tncNm8KoFuhOErORd47+sW20vN4sCu?=
 =?us-ascii?Q?pCh6sD00HrlfMYQPItM53pyOXDpQBM+TI86uSipCUgi1p3LMgJbMAUOSutKh?=
 =?us-ascii?Q?hhkRcwxwfggr6kdPqykkIzpx0Snm+RrD/Sibm8NpOPHBBg5oP68IAkXn6rF+?=
 =?us-ascii?Q?Jy/UP/TXxse7dr0v5HY5IJ4AEt4fcgzQek2vucsKsybulH+CA1tzLahvUi+y?=
 =?us-ascii?Q?VlgtJF4hFInVvIH9VyfgQ2jdchZnOamzbHKKU5OubUjMUnJR4+sTJqS3ywZh?=
 =?us-ascii?Q?8lHP9I3UxZYBmewDySQxFAjlOY7EEvtNwANhfKUlGbmgqPmNKZCHZeCAOkxz?=
 =?us-ascii?Q?nlQbw8sVIcjnp3R7Sll2mhCL2CUWBj0PPRt39pDaUMWh60FLmTFB8dloLS9C?=
 =?us-ascii?Q?ch1IXfiOdJh30JjZnEEDj7JGAaiburavpSjqgUq7DW+tSMj796jhWbuYA3ym?=
 =?us-ascii?Q?fi2L2KSAswu6EQTmq0i5qcgJD9W/1aJDufHh9I5wOlgU9uDgFF/ZogqwAI9e?=
 =?us-ascii?Q?HIiyKPnMjW3CFRHFJFOcpSLP+8aKwmd+W6hLn7NCqCuGWlMnlOZnI3Rsnq33?=
 =?us-ascii?Q?KWXQzZtwyWIcMst9MscNZ2GZT0GBT6qXdLJxtdN2R0zSqqlhFgzqCynNcd6s?=
 =?us-ascii?Q?mCEhUIfVhdTqpzo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2PR04MB11147.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hb6POLx9e8n90nopS2SsJ5sQlAMhN6/YXqemgSr5/yW7yswZMkelmBa+cqjN?=
 =?us-ascii?Q?XG14vgtIzl711qYxHkKj2SmGoUSYjtQWJ/R3tbcvsOmyeyeSfMEooxCdc/MS?=
 =?us-ascii?Q?QP8IFAp07vSuNOxDvb84z7/6mkfCu25PYFz2iY6EBflK8VOyNtC237hM6Z/d?=
 =?us-ascii?Q?xDpxvisWIAV53+a6HoRXFRmZTGcdTLoYgp0QvVK4vHkK4poxEaF3OFwncGlU?=
 =?us-ascii?Q?Rws4eyu/EB5IrKzctzHL/2pPunZycIbyi1yvSV1Qwb5VQni/enpaELRkllAD?=
 =?us-ascii?Q?rAlJME8pg63V+Do+nJkuTp+84IErmnbLqBbfQbwY7GWxkQmgYWHpXaILmtrd?=
 =?us-ascii?Q?OaoJlX1XpIPahewc+CUxnVrqFl4n6IzECZgoMdCUzyoTxYd+KoGDN4bECnyG?=
 =?us-ascii?Q?LbnWrsgTIYzPFLeFbIIt3hHVDrUqV0R8PgmgJ42EjKdotPTiYmEHsC8BYIjN?=
 =?us-ascii?Q?9a34OwArcSUvmwinriwj076JTc1q4fMi580WOuWrK8i+EcVxxDfOxwpXXa1S?=
 =?us-ascii?Q?DPrDvfdGDaRMPhtiMnDWOCArwQtdUtjeozf63NpfYxuZ9q4VaxUzoK0W8RVm?=
 =?us-ascii?Q?FnTC4y5CCTUTJ+EeuMLjWajdpdui0hFbRTVewv30BHNZK9Lmnu36hV4kSVO0?=
 =?us-ascii?Q?yNxbG53LIlJYxgSCAC72pS97d4HYNDm/D7jM8sa7m02fdqdpl52zlQf+7tLi?=
 =?us-ascii?Q?temtg3ctPCFD8r1Sgoo0xxHPoEkvyDuzl217Krva0lFe+aiJqHD9knRB0SG8?=
 =?us-ascii?Q?jcl9lvgLsmpTA9u49pC4SaaTak/icWTcB0ipJpRsEm04EO/HNTAPGbBCl9K5?=
 =?us-ascii?Q?hIOjZvNgcobJ8Smf2Mr5tY4D2oZYkDZjskRw0Oen3ESakxpTHYMb2j16TfLl?=
 =?us-ascii?Q?6YH6O8En43wIXLd2V98gsxB1MDv/PrVIQB6y5zLR58D39zqtXHVr+lmtJUml?=
 =?us-ascii?Q?vG3tmlh2MJ29UWd+iRcaiHtVWNZPqBtpZ30H1A9ycHE02Pa0eeugDq0M3r1t?=
 =?us-ascii?Q?TXnxh/5WqFQPD14/ge9Jf5/P89P84Ft3e7Kk7camcTCs3uKGGlPu/PeMWXPv?=
 =?us-ascii?Q?GNIeyAVagTiBPb+j09l2WnQslNoctVRWuHm2wC7/mgW448ldC/b1WkVH3Vaf?=
 =?us-ascii?Q?vLSm8mMOCLi5gfM54/O6aXdF0s17g0zPB3bIJq1I4Cw8WbG7Cb9xS2A3bNtG?=
 =?us-ascii?Q?ZpdzRWOXdbTG+be3XyLzPESwedaPS0lxJf+jOpNA82DwSSskRPxDHEH+RENS?=
 =?us-ascii?Q?xA47EGgioQsoTVmpxDetMtlxtuwYFat2WdqJKcQ2JDBOiKTIjGDFl+ipJcdG?=
 =?us-ascii?Q?amju0/OGRRfozmojVsIGyDUTZz7H/EZz9AKv/9LaTy2W6CZWdCQooebg8XjD?=
 =?us-ascii?Q?I/6LIVwJ0yAjWhF8FGGoWx1RVa3bgHXVImhPo7UG87rctOKu6u4sjONo8/4B?=
 =?us-ascii?Q?b9VCkkDiydPJbWJjYTM45I+1O2wKme24+YmhIBxIjMxVVoBb14UiLXbJv5on?=
 =?us-ascii?Q?AnZCYy7v8uiE4R3uPG18wJN6XLb8GRM+t+FaTlp+iYOQaSZlqCHK0kszAwY3?=
 =?us-ascii?Q?URiEw4NSEG0njAhiu96zKRO6kb9RNce40oA2Yxws?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2bc8b05-6818-4643-87d7-08dd809a6816
X-MS-Exchange-CrossTenant-AuthSource: VI2PR04MB11147.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 06:04:41.8566
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4UzouaHA5r9qpCAqYabdvr5La3wHSrpO3wkoBnRJdyivxN8WWZsRx6ctacCS6GIEo6xyTcVk+dWR4d+jVPdM2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7646

From: Carlos Song <carlos.song@nxp.com>

Use the clk_bulk API to handle clocks, so the code can support different
numbers of clocks more easily. Make the code cleaner and more flexible.

No change in functionality.

Signed-off-by: Carlos Song <carlos.song@nxp.com>
---
 drivers/i3c/master/svc-i3c-master.c | 74 ++++++++++-------------------
 1 file changed, 25 insertions(+), 49 deletions(-)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index 85e16de208d3..47031aa54f11 100644
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
+		return dev_err_probe(dev, ret, "can't get I3C clocks\n");
+
+	for (i = 0; i < master->num_clks; i++) {
+		if (!strcmp(master->clks[i].id, "fast_clk"))
+			break;
+	}
+
+	if (i == master->num_clks)
+		return dev_err_probe(dev, -EINVAL,
+				     "can't get I3C peripheral clock\n");
 
 	master->fclk = devm_clk_get(dev, "fast_clk");
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

