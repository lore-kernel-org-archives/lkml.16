Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012012.outbound.protection.outlook.com [52.101.66.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E77248866;
	Sun, 27 Apr 2025 08:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745742122; cv=fail; b=UEF9dnHwP0HwA4/pWAt68dUIlbzzxOephTb/eI4bRXp875aZuEehqMQf/sERIV2MB08tDboOzrHcBaG/ZKpoFenVsJsGsSMTJ/rNpanB+bihpxqtjoC9o5dj/kUa6gYparDrQuIw49Cd6kMwtbGenVWw58uOSEag62qBsKBSbZ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745742122; c=relaxed/simple;
	bh=Cj6GRly8kwmutA8XU3um0Mi1nsHR+60GsGsV/rFaYFA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=q82AdaQaykiBV38dDdzHjtjn2XvZVjc4FXHSO/WTLbKa2In2lQx35RKX+GElV6Xyt0dcXWOPxAwXVCZo9+5WH3kmdXnt4O8ERxYB03wGMek7od0KpDUGeIPcd0XVl3jArV5+OmcXgXwKUii6c6EeEEkNo13AuEvfRcQ/zOsXOIA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=E24RSAKl; arc=fail smtp.client-ip=52.101.66.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="E24RSAKl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zNmodNZxsrKaJqspuWenF7dEmbK+19oGSkmkxtU5avTARHwUo1ucZEszk8YWM8LPSSuvK1joEp1ck96klwm9Ag2p+0tDNGOeLR9Fz6HDlT2YSmzwWMmGyBmeVR1fONzgt+dxkN/oXXceX+GAU9hCTnemX3TMQO4Ql4C7k0i+1crn1/UhX6WK6TdZNjr1/+Vih5wmXdh1qc5jyU9J+lXHYsqZvIyAMkPzw/o7q9PRMRuIZ1s5phNgfDVaROf0Jdob5wihuIL1OQquO7mNt71hks1ngxnnS7+7criU5x9K1zu0oTehvglXLNK92eUD/jWEdaWg4Rd8Qg0QFsqiQlhvrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3zg6kITyXuQHtDwKMQdaaSPW4U7omhGgKYQ/b5Z551c=;
 b=dk4dKe25vdggXkSbthR1ZpFwLGno6DTPWmfAr1O4colf0xrJK5cWf5F+OWElY3RI8qQjZARgFngI5DLjvMnSWu1WkyZt1vR2JK8dnuMA1lkEapjcNZybXDkK8J1k31U5XqkuXSI4UNTGHnwqp33DZk9upaa+2Nw93uEIz6AObJp56SHvBwnsjSvKMSDs/mngDZkXWQsg+FsgI9HK6SMzzWzmteE7ToRiLRu20t/N7U14nWIZLypu987FRq82tjaehQA1Ng/WtBG7+xC5D3tO+tt7zJxhylMmVW3jSHfRRJZRLqROKYzsl7SSgXbMRthvHLSBBkC/bAtsebSm8ZTotg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3zg6kITyXuQHtDwKMQdaaSPW4U7omhGgKYQ/b5Z551c=;
 b=E24RSAKlq3VlDxZ3hUnTUUnw4DsZ/jV2cilEudm9l94uDxhjCsf418ga+oJ2vn4iOTi7/T+SpRT9UZrkqJ4ZXgUC2vHMuZ2UZ29y05ociDvvnUuoymGiONkiVg2/PhnowM5at90jYda73v9CaltC6lVF8chP/SUqwXAQxTT196Fl9b2gEw0S6UTD+4WIWsm2CWtlsPtM2Nq5DXLQLb4vOSh2cJ4w90LbVEEbdJcloWRIT8VuZbbyNgcxpT9TD8if+fKIKfuwFzTjSwgpDqSkXM/DiEa0BMc2VCjAxDujsx+X4L6lFF8dMuGfs0M9Fvh2wE91aaZpF4npVQ49MagVxQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14) by PAXPR04MB8474.eurprd04.prod.outlook.com
 (2603:10a6:102:1dd::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.29; Sun, 27 Apr
 2025 08:21:58 +0000
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687]) by VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687%7]) with mapi id 15.20.8678.028; Sun, 27 Apr 2025
 08:21:58 +0000
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
Subject: [PATCH V4 2/3] i3c: master: svc: switch to bulk clk API for flexible clock support
Date: Sun, 27 Apr 2025 16:32:29 +0800
Message-Id: <20250427083230.3325700-3-carlos.song@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250427083230.3325700-1-carlos.song@nxp.com>
References: <20250427083230.3325700-1-carlos.song@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0009.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::10) To VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI2PR04MB11147:EE_|PAXPR04MB8474:EE_
X-MS-Office365-Filtering-Correlation-Id: e76d2466-312f-4877-ee76-08dd856493cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|7416014|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9JmxNQU8i2XBnlHEhLlSBGtdPHwFhCA7GIVGGNbja6DY7dlJsc2JBRp2aGHm?=
 =?us-ascii?Q?R3sFTeEgNXYTMhBJg+h0QEVNq755Wwsn2GjemZw0CArezbd4eCaUid82GEta?=
 =?us-ascii?Q?Ac6ymgQkYAew8HxGowdeDmBTfUafD2dh4qclFt2zj1x1JfMsLFsblNFev20+?=
 =?us-ascii?Q?OnUEUNaBYMHahxiS9DUkmHRmOODE8Z5J9aVH5iH+AD/UR9KOR5j/wDBJkDaD?=
 =?us-ascii?Q?XfLAEX0sLI0Cks/fd8hiVtsrNXMEnsXcpx78/mXxGmdf5vZr+NxPY47yCDsx?=
 =?us-ascii?Q?ypdgfip+rYvNNZgOpizLiCLCXMLIycB0YSbDkMSBgJk7Z0w+IJvBQsq678O7?=
 =?us-ascii?Q?5/k7tE7+zTTVGm/ctMoiwa9afderwHG58ZoAwCABhFj4fD8bfzwvcbwhdvd0?=
 =?us-ascii?Q?zsmSOJTfDsbESOTVhmyPdhUeMSikG755dqLv3frik3waD0hcYNOOTiliiv+s?=
 =?us-ascii?Q?8LSNKeeSfIyTCXd3SJBC1ZKwJqyACKOGLjESZnloPQGKO2d0jK2wO1edLE1x?=
 =?us-ascii?Q?oWTOI0xuonJQdSR8oU9SeqmsWXqIdf4GgsY74fiP6u6P6nUEW1Yrapx0Mp0a?=
 =?us-ascii?Q?vDR0FI9AijUuqerMcXFfk5J7YNzJ8/UkXTH+yvzN0jeJ47Q2Hj+xSpC0ONG7?=
 =?us-ascii?Q?dikV0h2hKpnWOgeTvvDXbKMoyRHw5Jt5gHAe1Tes58J44UTKLZL8//m2lOnS?=
 =?us-ascii?Q?WpTw1kLV0BTgFSBnBOOqytwoGjB618BdTr9roVyOYkzVILFjrZoqxlnp6MuG?=
 =?us-ascii?Q?0pIjLQb3HubuXveQT+APkquI8oSZAJmTVAMlED5VGETzuXs5sIWSkQ2MUInn?=
 =?us-ascii?Q?Lm58fBnNDLUlE4qvhrTlE7loqrnoU+uSfgYM+zUc3w6SjS3I8Xsfuprg7HeO?=
 =?us-ascii?Q?Qcn5L66yURDX9pfqQVJuOtvycnQVbo2gMTDUpDBplaQPImhrH/CZO3axFEGI?=
 =?us-ascii?Q?QJZjf0xdOYqO2yF7okWAaresIxDaNFYqx056pUSR18k04wqcnPZlgVySWHB8?=
 =?us-ascii?Q?r419SBSn/XzXyqvNi2ACdyJV6VDaY1HooztK75AMYg7gHo2tY2gA9Ydog0ix?=
 =?us-ascii?Q?Vl9TnJbgBH7XFg8yHCk8cHYtg5IeTWjwfeJR3+jBBtS3alvGsv1tzMESc5+S?=
 =?us-ascii?Q?WZl+0gnRwPOTTRPswu9jdGhrGZe0CNj97B9SRzCYA+tHY9wlbYnJ/aO4tbGx?=
 =?us-ascii?Q?IPASAKP3DgnxJRQIbL9uz2SZ5VOxj70tYYOqY7AcSxoVn5KqWS5/n2Q821c7?=
 =?us-ascii?Q?pmTZEbPabqtrrF9miRbVKYcP9BIB2pRjJqsiShmSSMOosSgesNDnMgTMn39h?=
 =?us-ascii?Q?CaGVbMGIFQLPGI6RDWEUFd2lLi0d/0aj3la2wv/5izAsrB+CpVUWXbyyDeXS?=
 =?us-ascii?Q?k723xwwspPH6mnOWYPHnDRIcmyaEQbbQZUdXpFAiWYAzBnuFMptdTrnMHATn?=
 =?us-ascii?Q?DxTHZUjJZ2cuZX8lXw+oK1wiMJ8F/QFqiic1cfWy8qFgBuvVjbjfD++rLIr/?=
 =?us-ascii?Q?jNVM2XwwuCc5xT4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2PR04MB11147.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(7416014)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?M8j86Far8gy5dXOh/79dp7kbqpng58YBDieU1++zi7cBlthoz0iWM95QjQ9m?=
 =?us-ascii?Q?mbPGFnc/wmJHUJkeJKpSmSK5GlUArzJkZrEFQ0UvFOGBF/uzbHBveqGwZZ4F?=
 =?us-ascii?Q?yFBljYhvWql9lXuteqAhDrF6fW8NRQ5liUrCXqfZFwEdt8QQWV2t0Gn+FfVO?=
 =?us-ascii?Q?5t0V36ig311bbXHvrAhx3mfxmFtfEWFSs4rCEmXzvnwcwBWKAsR60rB+O1T2?=
 =?us-ascii?Q?E7e9wfOb3FeeAEhsDNQn3bg+qzwIdVhrGzH7Ye2Z0HQByYawpS6GrePwqW/B?=
 =?us-ascii?Q?evL++q+cB3REc1muTVcYfs4K+cZq6ITtRcnPNtzBuAg1o2D1lRNYmVKX7gnH?=
 =?us-ascii?Q?0wpPDq/o6cvDO+nXmJgX+n7jgpwYr8/cLLtAwi5kREFd/poX+Dm5jQJQWqcY?=
 =?us-ascii?Q?fIeh3DDQxGK3rhG0yEnZlrS/atUWqJRAISOvGpXzYE3CejFdyyW5MvhNnWYH?=
 =?us-ascii?Q?ttCzftxWBLD2AISs24j4xGnkXwzTxsTZl869zJM1qlfq2A8cOUJPg7vZQmit?=
 =?us-ascii?Q?2q/KRxuT9j3ycO85fbfgWenCd7XMW3dXNTpbbVuMBwKecDznzbZCYtWcAu6Z?=
 =?us-ascii?Q?A85b54Hcx8vfjRUb/qgEFlAdIhb/jYXGKBBezk0T7+UIJ+5WN2wZVU5aIn7j?=
 =?us-ascii?Q?HBmwSwMLQ7oRhpyz8gF9Pqf+8iq8q6Hu2g8SPk4IGGBVazdwEvDXTst15jZO?=
 =?us-ascii?Q?IeA09xQSdhHmJ1vpS4gSsleX38JMbnz1F6fbDY0Gq9+GdaMhfWksQI6ZVN+5?=
 =?us-ascii?Q?tGhmmpgXO8kWrIqa61q0LYccBg6Muu10Z6yDsW6qM5+i5klIwh2trlK47Wn6?=
 =?us-ascii?Q?DpKUpuCHUQyvSLbA+lkltcEcwIZ02kDZIkwXOGwilJ0OgWLfyqwRSUPWgGAE?=
 =?us-ascii?Q?LIyMycEzRgG846cFIySZCKF7vuLkELIvYyi2EwWf87AsajFsIDmemZ/S++id?=
 =?us-ascii?Q?LzUMsf5/j5mGERp6Kb1gnjpyTg++pcv1FNbDUik9wPe9nVp+jOJ8Wjt/N245?=
 =?us-ascii?Q?FnREG5LHLUdYkxgvp6l1AAAvWvFngKMQps6tbrBnTwRK0lS3Cc8oR081NFEI?=
 =?us-ascii?Q?WzADc808vOab+TEudlKR1LF4mbk7PmT/zyyPg1iG40doV15uyA2/i5RRaTyg?=
 =?us-ascii?Q?VVM9RzeaZGKegUblYCNmBErP87s3HzPYCdUo/+LCj1wWAComjFPFUEOAKrjo?=
 =?us-ascii?Q?ekakkjXguODZNJ5ccllQIwljzaKr34Gsd0POPv4hXzam1T7j9Q0HSPctc6hC?=
 =?us-ascii?Q?tlJwCAQNNn3zmMQzloygEfQkRi7A1Y16Z7ncxV85ix19fFifNjpvFP/uYhNO?=
 =?us-ascii?Q?rIk9HbaqpcqP3F1b5qCwMWfWHpTJ86NPtMc7K3g03Cqt0IaIqhCEGZuxLf0p?=
 =?us-ascii?Q?7zcihcBapvTM4B1d87wI0k/mxlj0SwxHhHtxLvGlCilsfzs3+q/r+8dEOiHE?=
 =?us-ascii?Q?vuovWfyATF2QaX1B78Gf1WrBK/GhVMkVE0qf+OfvBS+HbrMsRPq+c/lw9Gnz?=
 =?us-ascii?Q?weUY2tWRxQtl0+jYjU9wcKay2o9OYosBys+j/Z6YhdGEJj7KPOwd9geUDsQZ?=
 =?us-ascii?Q?DQGDVSuVc4+tKJ4n9EwsUVTg8altgx6gsmW5vzEF?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e76d2466-312f-4877-ee76-08dd856493cd
X-MS-Exchange-CrossTenant-AuthSource: VI2PR04MB11147.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2025 08:21:58.2070
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KQBB4B25FhC+2Q3j+D+jrbSPlKqgyiqIM1eL+2IEtfBJn36aYDw5e2Lq0L6BTRPhQGcOJV1ZFZBqk6kK4N1P9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8474

From: Carlos Song <carlos.song@nxp.com>

Use the clk_bulk API to handle clocks, so the code can support different
numbers of clocks more easily. Make the code cleaner and more flexible.

No change in functionality.

Signed-off-by: Carlos Song <carlos.song@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
Change for V4:
- No change
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

