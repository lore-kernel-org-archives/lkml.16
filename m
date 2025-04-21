Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010041.outbound.protection.outlook.com [52.101.69.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F19262815;
	Mon, 21 Apr 2025 11:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745233439; cv=fail; b=B2UeaXNLopRbUAo4FXw0LzshnESwQPEJafffzwpLNK2ZB+AdgXXoJFDVm2frWij/FNyPp11l5oUdF12kuZ36S7b3PYPFP8V2CjxNhUEqdn6jlLahZ6+6MN9gsU7owrFZ92KfpEmhudN1FrObUdmcdCNtuoxQp7Y2PWJup4E7m6M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745233439; c=relaxed/simple;
	bh=Fo9lqzAeS6sAzfNshhBSR8W96I3CqbBNbWjKevaEDvw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TQ9eXSeNIcxyxe4F68JS3a+0y81XOY5c6qkxuPSGT6+83DgsXZ4YyBv71TPuUMlLqXpU7XjwZFb8BAviOyLyCij8ZdMJ17akGo0G+c42sMYpwE7RY+EYwiDdmrEBmBJXKree5NR7+PI9iwqy7GM9dCGBP1BHlHGYKhZdDAgxuYY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=SJbZnOZX; arc=fail smtp.client-ip=52.101.69.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="SJbZnOZX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y0uTxqUEkcdrnPMB2Ei17XYd7HaVSjLepTrC+Ii4Sc08zuF6qNOJ2wF7PoCCTY4oeSbc9YPS2g4ocIqlYgqMHWU+GVv1gxh71r/liPJIKYAY01ocN0qrMxGNUYlprJGVeakI+sE+KJT0hK3L1xTPAaMJROvSaudfhflHu32INKx50bjT3Z/+Sp3tlmgFliwphgLRzAAQqrFxhzPC2gSP30nnV/DL79ju2WpEjYBl1IuLjnRV2212qGEDLHOLHqdRWpfUGsRcbLezXk/TaIu0XihYagbk6st9HxreS8wprk7bWyR+USXP0eDVLw2Bt+hUQirPHbv7R8fhpD0PHkeYVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CvY2LIULEBpaCk+ZjyH1qISPrwzNSx1j6TwsMxWJFnE=;
 b=D5c2V0hJkO98lG49pfm0SNp5OTNJLqdyBs0u5OjS0HLlE/VFQqB8D4OC86WK8zovzRCD1PK0WUMXxHkqKz/LROyspjVUVC0+1tPl337wlEjmTkIzBXyyKgfveA5wrJXjgL+M58ApJQsr0cWY16MpCjT138VVuGWcXP5YAQLgwuf1EHqLO/fkgImjZwvEb3t9T7dC5WvMOJodpAabfvppqMIjul/mHo8zUBfxR6v+1No9dCUeCgz3zQ6h8dHCoQg+UjaP1COZurZ7U023Wk3PY8DxH6VycV/3wLetR/a5CsRKGQun95DLVzpG+qh9EHcle1HZmOx9Zxxw5rYagiseWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CvY2LIULEBpaCk+ZjyH1qISPrwzNSx1j6TwsMxWJFnE=;
 b=SJbZnOZXhqa9ghQr9lbQk1tWwDrXpmOG/ru2nIe94tdh2EmWmr/creWDW+sXm/GhaBnkSOI8f0JKsR8uFs7k+0YoofIMgERU+KVQVY79MsPN840ukWaGDrgwbA1BsQGRN/Sbs8F1yyed05x3Nt/BXj5IZKE2z9cd/Fm6KghyGdmCiD7is82/fUeCZvk2bAqkQQKxjUgjDNfjGECdY+4ogCmZ3vPE4Sr5AjYeSFVh5zu4bsh/Fc8WwO71fbDGKSokbrLYJDPpTI6IDlzGujPbZoxZ0+uAvLSwzLa8aazd34W59yOM3TJG0mMd344BoTyRWgf4pJBXc3jYuciPKdZ1cg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14) by PA4PR04MB7854.eurprd04.prod.outlook.com
 (2603:10a6:102:c2::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Mon, 21 Apr
 2025 11:03:54 +0000
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687]) by VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687%7]) with mapi id 15.20.8655.031; Mon, 21 Apr 2025
 11:03:54 +0000
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
Subject: [PATCH V2 2/3] i3c: master: svc: switch to bulk clk API for flexible clock support
Date: Mon, 21 Apr 2025 19:15:12 +0800
Message-Id: <20250421111513.2651797-3-carlos.song@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250421111513.2651797-1-carlos.song@nxp.com>
References: <20250421111513.2651797-1-carlos.song@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0035.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::14) To VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI2PR04MB11147:EE_|PA4PR04MB7854:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a48ea4f-1941-423b-3c73-08dd80c434d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YXSt6AM3FZaxsSAfwzfv2ESqAmzM3ajR7iVT9yGNTTNEO6wjfCEhd/DqQJPg?=
 =?us-ascii?Q?1cNOnMMzHiSelQrom9YGG1NflbF8Vd+6lrI3gaS0+BmNgMP62KtTzRkJ7pcq?=
 =?us-ascii?Q?fr0C8klUB2f+U/f77ID3thCl1lolNueWJFHUfZaS97L5Vat8NHaqCESjm7iS?=
 =?us-ascii?Q?3pLLb9tpMeORKLyXUTBaI72+6+QDx8UDA8t3Fm0leKkUv26KcaP6K5D5ejDV?=
 =?us-ascii?Q?/euunx/IZPHW90nEhJjQya+qZr9Aw2sMBQJW3enS1iv/zdVqTpWNheR5TJAi?=
 =?us-ascii?Q?TQi5KSKB8M79dd8LWUJk06M03K2szi8xZ5cgMyOzzw+XeIm2zfTGvjjxD44q?=
 =?us-ascii?Q?Z7A6Lj0xPMh6Y6Axk+sn6OVdMCYSXuMAMhJNHCcfFUREKe4YvceSG8lS/T4a?=
 =?us-ascii?Q?PS/en86/oaM8C3INyc1ieWpQjM+xGsvuD9FTiER13BfF41LzEVUw8Gn+Hq9u?=
 =?us-ascii?Q?pENGjQ81TURTVgRxHJtGF3neflcv5mNMDmrNC/pYlV+2qlkEXOml/1GY2iFI?=
 =?us-ascii?Q?17bcc/HQwjDCRrKLiu2wEGWurv1LZ5LFnKq6TQPV0QKh9j3tMl/FRtL1a7rT?=
 =?us-ascii?Q?x1jHzQhG1Y4EGOpHCuF5661wSBOlBaI9Eu4kGhZap9F8lYcGRzWjphA+Remz?=
 =?us-ascii?Q?WycYB2nK4dGlj7cYjF/y5rI6I79GPWnf2ihuwOK7EV040WDh4Ap7llI6PxGN?=
 =?us-ascii?Q?CmmB8YzIIhFhs5lH6q6Im72jqUlOy3nGBU3vaOZXGwOsJm8WFnOWc17Q7V65?=
 =?us-ascii?Q?gJC0GUcfqIHE3KxdhQVvgjK+HHtBueUdexROXURsxhVVcDcFeyF89NyT8ZBK?=
 =?us-ascii?Q?vG8UzP+vXtx+++/aqsVrc2LrfLfcUXQl68P0bHmFkqN4bWwu6PGxb1kS3C4t?=
 =?us-ascii?Q?360o0X5voTelevRubGbflsbEc9eN2siuIZpKD1AHdCI+X60bLJjY8jZkPS+i?=
 =?us-ascii?Q?4TAAo38sY05HY3/YdB+Hi29TBIB09Qn4FFEUicRnDDHRBJaQ6L/2fvk5eD7O?=
 =?us-ascii?Q?7hAwuzf5K76lKgdQn+t20uos0rhFFKCV235+0wgp2qavGs2ZePSPo6Pl9ZTO?=
 =?us-ascii?Q?eUKaqDAZ5a/3KoNEeC37nl76f0DZcsl+2Om61Kasf1JGtrLjfMs75XHVjgGm?=
 =?us-ascii?Q?aFhh++PKoJO86+lO7f3+DnqXXyIsalwAQA/KOUihIOi19U6Y0WL/0A4FSDuJ?=
 =?us-ascii?Q?Pf79KjK00My2hEnpCYol2MLb6LW8eRHYHACinqQdoE5v5kHVsfQNCLGF+fVl?=
 =?us-ascii?Q?n1ZV6gXRevPQ3tEJJ0csJ2uUtsA0P6PkUmZfykaw1TMA+RCBipJir+u52giA?=
 =?us-ascii?Q?INLRNZVZhU5sD+oDxhc49ozwhhRK8cBGUYWpf9QZTu6O2K+DYA58Z42lS1vS?=
 =?us-ascii?Q?nLQtBb4I5ZsGiPl7wB5jtf+H3fsFYpuDpAJVnxetHYmvRQU6ZI+Ry7i/KVp1?=
 =?us-ascii?Q?JmDv8bxNHTbjdfqKw2d3GjS1660uhBThkCfuNJH1K4kwzqjk4ujzJlVn7IB4?=
 =?us-ascii?Q?tpd8Cv3oBRc96Gw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2PR04MB11147.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aXOnrDhJDoH3NUcODDcU0xrT5FblBqLAq0Vjr97b89Su+v3Vo/J/9XKrW7WQ?=
 =?us-ascii?Q?vyKLfMAkxr0AFCdSr7PB3R69XNVzRCDuL2WEXQpbDpr1jTgpbFyl6q3vHyf1?=
 =?us-ascii?Q?X6xvr/wh2hXuYIIc3TTIF+KxLgxScUVVlwZ/SAicfWPrUzoiVN8HI8XcOWmu?=
 =?us-ascii?Q?k+noWOmstQ9C23+TIKnAwKn4g6xHn0TvX0Ox31rLj8h5vEIwve4iNpTmtt/M?=
 =?us-ascii?Q?2haO0qIr+beDn9laaUh/U6r7R/A0afksD5amro3MRFMEu4URlkXYok/+FL6/?=
 =?us-ascii?Q?z1diEYXVC1zu+n/yhYSO4y+8mnh9YID7BxAuCYvKojXBCz/XPaC3AYtT/f4L?=
 =?us-ascii?Q?qpK3H4D6N+NOyVU8C5ZU/BB46QMsqx6CBzImxMdPTUziDjH5Ry3Z+v6wFVI+?=
 =?us-ascii?Q?I4Jb0BfIO20UrWUsNQrdvhpllF3c38NOzZpT1qPPdh5Atl22DLs80N1yZar/?=
 =?us-ascii?Q?lyoZ/xVThRFlsIcs2C4VtH0y2pXOuOQZMC1X8mkhJz8LSI0dgdaqsY88P976?=
 =?us-ascii?Q?ojqsTz7gCMz1KCxpWfLkLXLLEVEQ+a3ka7x1ul9gpudnKAer5uKp8BDwLXK+?=
 =?us-ascii?Q?S9HZmXTPDTs4nUSgKjolOhRo8qx9qjUH3mErKfCta6cEN4DEmGh5uAtQFFz8?=
 =?us-ascii?Q?u5yOx67LiwOVyWWfdd95pZZ7PuGQXVbmpWnfGpg7+0OJwsekFkBohnJr1kVW?=
 =?us-ascii?Q?zgiW+tfPShVo38uePBUlxY5R70bnU1XS70v9K++MxVVrt41eqhY3pELGOpVn?=
 =?us-ascii?Q?V+w57n1+jimgQADKQuBF5hZs5a2v0+F9mt1dFDPqGgXfROd1LBs1Bh5GnjMg?=
 =?us-ascii?Q?ctX08ov4SmZB9Ri05cSM1eXbNsWjy2ThtJPvJ/yEY+X6UqbCZEqreRAq3qEo?=
 =?us-ascii?Q?3sUwV0Ia9x/2TFE0+y4NmaBGOWtVasSwoZ8a1n781zMMZ0/c34ao1+aj+lwP?=
 =?us-ascii?Q?nFuhUTYoVwHsJaFuhl2ejDIu9uvKg7Sn5NegoVZkC4tx1yfiIiWgD9gDC5du?=
 =?us-ascii?Q?lLplZ6F6wcdUuEqcmlAbIdnESXqNA/hX3LUNLwhYNf1RqOBXS5cEUtWyDbnh?=
 =?us-ascii?Q?YIdhAyRZY6L/emMVJsJyZXKPnr7lRjC5wp17II9pq5AcfqIOSlDse5UHd6PE?=
 =?us-ascii?Q?MCkNKHhD8gqRICStc3iJtr91+2jdH8pivchHzf0BEVCpC3P/PBBwv1uLi9Ce?=
 =?us-ascii?Q?ComU1RP0MjyCeOM++DeE16NgiesqppXgi1H6L0hy5WJv6XkPuS9xcVC+/mPJ?=
 =?us-ascii?Q?t46SSz7UGEGqJ5ic0kFPB9OWHk8ymVt6BFaBMl1CAJ/WEDwgkUy+T87zvOfz?=
 =?us-ascii?Q?fWsUl0Lg7RLMgjuqDWaV3RxL70+Nh/ZIf31PzxTOuH+f6G62pWgVb6EZm6mD?=
 =?us-ascii?Q?WdopHmjwbknUDrHnxkQsURHxvyD9vmrfId6TJ9s44XPyQ5tUIC872y38PoxX?=
 =?us-ascii?Q?H/9DqnH6vVBTpcJxUBkCGv+TxC2Azj4ZTUhAm9TrEw/syUdY5iy9QDSq0Doh?=
 =?us-ascii?Q?KinXbuYqIz/RM9pb0t46hW6gvhw5hlbCNRPenXaAvTp/W1/MEyX99q3oH2sA?=
 =?us-ascii?Q?oo5Tfee1NS7FpBPwvFR1fr7kLWCTEiq5uysSWOJL?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a48ea4f-1941-423b-3c73-08dd80c434d7
X-MS-Exchange-CrossTenant-AuthSource: VI2PR04MB11147.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 11:03:54.7290
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JsydOpr07IAc1n2pE3aY6ZDjcaioheOudxx4bP9B9onXJX39xAAhWuwyMQYtBPIfpsY3xi4GtspJv3B6Hg+T7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7854

From: Carlos Song <carlos.song@nxp.com>

Use the clk_bulk API to handle clocks, so the code can support different
numbers of clocks more easily. Make the code cleaner and more flexible.

No change in functionality.

Signed-off-by: Carlos Song <carlos.song@nxp.com>
---
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

