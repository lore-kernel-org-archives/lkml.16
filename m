Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2041.outbound.protection.outlook.com [40.107.20.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051738F6F
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 01:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745545870; cv=fail; b=FFyNyqeHSjFxL8tE1mlAHWi2n2AI36X1QIZL8J2B9q6hTF0UOt4c198khlbiYeDuPjy+eSYpQEEo7F9zuiDhWAkK6o+xe7d9dyqR8zsKb3DPTMMSezhRk+ed2Qi/mcpg39vaEvy2Bjd1vklCb1ipNTxHf0rz01w8mXwaJE4oNPk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745545870; c=relaxed/simple;
	bh=N2QnDrRfoigTZcuVwbiXrb+pRpMnXk6gYLB2siBSt00=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=kslcC/68s0CkkjNdmXY9vF1/ZSr4SK2lZCvnfv/MwdIXWw+Te2qfnoqDChQlMDT7mxX5yCaAbXuV4kWxbTOoZxMngnTZ38FAkMBQgCF+Gne+b5C0GFFIW/y9D4c9ZC9G0VL1PY9wWEW74ry9AIVcnhfAK57ZvGWHYQJyOVnnQTg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=NgfhVnf4; arc=fail smtp.client-ip=40.107.20.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="NgfhVnf4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=quVDO/pCUtAmOMFvyv2hmBLo+dqnGmzsJ5vncyivF/cvh2ldwkkSSr9UUtatR8AcjU2ADDRAO5wFrDfnxTVBIGWHxpcO7/SwQCN80E93E97hjI3Tn6YVid2kzgiYtKoHEb0Trk4YH74t8MvK7CUPtZjMz6bV9XH6Ig2GuUdXRwXtqFyT44+4c2MCK7YjXElUatdPhNBV2GWqnsrhfJXJVr1ZNRvacHYUitmho4PtP3oOTQ0wK++rarc/MPZC7OesnA0XMXhQXqr4J+0q1HZkXOJU0sbzXISn9vX+E7jhM3aLz2O5MjEMgSb9fZn3nx267eN9HcUmKEsyeleZi2E/fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NZJWJxeu/nknRnArSfUS3yjjN+iwAEno+xph5iAXMec=;
 b=hgz3Lj+FDJR0vwSFOL6tpZCiGkSwy9w9AHILxx5MZYzPwbheUk/UofkkWNU9x50M1RuzuY7slDAQedELUfYCVlMnIS9wfe25QlO6IeyS6LLlLx6YAgtPkKhIO/pmzUBW/rs552ZlbofhmBVVtSsLXk5QfdNPhoxrBw7uS/6Str2Rxh3bQkAQmXhuq621sc0dHebMqmnGElZnQR7KH1Dao1GVq6nj9O+6LroOpqpsewIT5McJzZBD6uio3hQyHMwivTmy4deedQS7S1DQ3xRuwSFkeolP7vj8KGdiWL+ugCG5xy6LFycd3ewizZa+pSM7agT9jrXYVqzllm67madddQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NZJWJxeu/nknRnArSfUS3yjjN+iwAEno+xph5iAXMec=;
 b=NgfhVnf4x195y/K9KjNYKSsIFBgDuyNOYnOTa0nOdv9N9xGj7fQGRZ3q/DjBPFiU0U1PyBmkj0R9YUTGLCU3g+tPLEaD93oU2euSoDcLdrxsAoXul2xzoQH92OiaPeXRgi4uKAsOOACZKZSwmFwT6Ho9gBes+abxHObq+RlwrHyYx5V8SZVWCdjc6rPBvJRD+U+QLwowap6TSCPmJCw+DodJtkL7GHVHND44F4mlK4iarx/NSfrxnntwvyIELyug8+PbcOrNP+i7RT7nGsdrcyIODOnYGnqwlGDpOzSviV5TZqEdOQjK4bnPjb+Le8AAC/LV2E31pZb17vjnJfprBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB9112.eurprd04.prod.outlook.com (2603:10a6:20b:44b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Fri, 25 Apr
 2025 01:51:04 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8678.025; Fri, 25 Apr 2025
 01:51:04 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: jassisinghbrar@gmail.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	mailbox@lists.linux.dev,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH] mailbox: imx: Fix TXDB_V2 sending
Date: Fri, 25 Apr 2025 09:49:37 +0800
Message-Id: <20250425014937.3812976-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0074.apcprd02.prod.outlook.com
 (2603:1096:4:90::14) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS8PR04MB9112:EE_
X-MS-Office365-Filtering-Correlation-Id: 4abfb45b-9c94-437e-1e39-08dd839ba311
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pRQwqTuaKotAPMCV2wLQsyxy2ShvcLjZFViCeryJ1dC03paykqDECNgcDYnG?=
 =?us-ascii?Q?iXiedQn8eO6RyTbDK0ZThujf2aebsp3ZZLdaV6v9JoqYHvdBX4p64AXUMNZY?=
 =?us-ascii?Q?cVggZO2ZhT4Mk/wk/cRO3t3uQVSqwvS/Pbg1jWAkqd5L24FXWAc2aCaXHp9M?=
 =?us-ascii?Q?wV5YSNSGdlCNSJcXS3ogEFBRv5zUpnl9G7tFTU8Nb02s1RajpkdQGU1AoXJ9?=
 =?us-ascii?Q?vx+M7cYqFZ2esOP66ONcEzFHX+5cA1JQWVxMIWr2Ce1nbLgcwr9Og53nXsCo?=
 =?us-ascii?Q?CUtd9t8mNhtuqarvgowos19x2m0uERYN8fdJTSCUZrBP2CbS00Oa1BAp74QO?=
 =?us-ascii?Q?rGLhvzPVjpZcfh5vQaKRk+bUirZXMVccYWLd3mjw8qNrITyowojxRarwgb5C?=
 =?us-ascii?Q?tvZNOuZrY2PkcqmYyuuDSR7171W7UlpBYDnaTklNp5heQJ2QVjF9XsFo5D7e?=
 =?us-ascii?Q?gaW7Go2kNziEkSi9QzvVZvf3q1cLSpRC93MkzN1hQwsLOkIxUBj2ZMj7DSve?=
 =?us-ascii?Q?YGDwQCg6PDBBE5RI5Vh/BtVNHE6q9T4ft1670tW9blaVMS8O03iEgBk2IYtA?=
 =?us-ascii?Q?QFdmsGXSW2xrCpytqZ0W32T9e06G7A6uI6Y2lZ0HCWtbiduf5LEEHNLPLXKS?=
 =?us-ascii?Q?7PuFW6ZmUWvdYyKTnUbYBodB70Q0u0t9b/UbHiOdKPV7Ho5x+Sp6paWYoOXS?=
 =?us-ascii?Q?SkVUvfWwe/h0BS4ixK9B2NFXSA210KjpPSbuiOcKOJOonJYCa7HPm3aNMBzJ?=
 =?us-ascii?Q?hRFHW/Aw8wVXM5SIjWGOQXHCwHxvDWUPTKfq6br7STWPsRUnizTudqdcoWX0?=
 =?us-ascii?Q?P0WbdKAt/D6f/WvnNorLsgRZ/HnHBxe3Fp4ipLLt4HylRxVqEjSaRxr4C6SD?=
 =?us-ascii?Q?0J6tjuhBbFZAly4AAktigGd+b93+ccLzNO9aEuaSJxX4YL4+V7ly4DmET1J5?=
 =?us-ascii?Q?drGYzwWS43nIQGRJ1dV5gioHF7oejGPWj139DfEKzV+k8XtF/wi0RwdS8g79?=
 =?us-ascii?Q?/vlat0GfSGotZMi3maATRTvLbBcXyMRT8eKUipE0/JeAKT4CIyVFSDm9hAuH?=
 =?us-ascii?Q?pkhUXNWCi1cuJR1F/Qud/U0BWtnmgzUWy6iK/jBPej7/cqZzQq1+EY9rhtC8?=
 =?us-ascii?Q?aDRfdCcaur/gljAgJkn27wAzDVY3jwoTY8cKPVY2IVwCL7wryTSq2OPUCLa8?=
 =?us-ascii?Q?S+t3W8CslobDIAbmegFEKxh2gFn35oubn8umQwpIlyuCFJlDrwduAded/xpz?=
 =?us-ascii?Q?QWxOwSqEAYt09OS6UFEnDGmLRT8v5UOWy+Zod2Hj9NgD4OA6mUFvQclNI2Yc?=
 =?us-ascii?Q?H1e2iMNTa7KrZJ244MCuEKISKQ0/7a+p95Urlt8S/a8v1kUWqQ7d1Ylurxi0?=
 =?us-ascii?Q?+bPuIR9I1fF+gUrLGghc3AAy8SoafmR7lpN//P1meUpqUE0HRFdruSZ0XQUh?=
 =?us-ascii?Q?9R/RI1XppBHTpgrXZ+oZCcEyNMUFg6+Yqk6U1s2sBAFyzda4VUU/fWJa60AJ?=
 =?us-ascii?Q?KSk1H6DOVKfVhu4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Fqrl9sxVV4PbkGekn1MNiJIS12Ek+Xy6JmPk3363QniKo7BA6Z6ZJnpbp3WH?=
 =?us-ascii?Q?tWqJDKEhZgZoziv1LnAl4Maxxrl6Vk4IIPENahK3gT9qecEzSVmml4Z32JWi?=
 =?us-ascii?Q?QMSLthdkxEbm25Tgi2RjlNE08O9hIFky7vR2E9kKYLjGwXnRcPAZQp1ZvpiA?=
 =?us-ascii?Q?5NuzlyVjADj377CAa4GqBPf1lw1M57n1ceUUcgwIz06kEuKiTpCTna2fndFw?=
 =?us-ascii?Q?2hPuhYWWfj5jmlqAhb+eNrly0TYOkvOiGoSXtPATVAPGfvMnLWQazNLMSH5N?=
 =?us-ascii?Q?3g89p8LEHANSXG7TC38ubFlU7K9nfS+lrTN83Yjdxb2Bt4WyJ5o9cznES7az?=
 =?us-ascii?Q?BMuZ8z3QKRfmoWVVkNUODiTFcRKw0aGZ8oa4vRlJzFzSpDL98QVioEpoLSl+?=
 =?us-ascii?Q?mxsn2ra6ER4Gxwdy7DmjX8NR16luB2XXr6jhW+K0no0KS1Y754PL52dqSZLV?=
 =?us-ascii?Q?eP4OyLD8jr/paNaOWyD/DQ1x2tHUkTTcBWCp8IQn6U0OmA5/XPxK+Lheiz++?=
 =?us-ascii?Q?7V0f8fBft7Ep4YFeSchIQdMspF8NeIbh4FP+121GPciqgnDQ8+4H62Tmqbve?=
 =?us-ascii?Q?h+dlLla0g9TppMvtw30x0Yo2UlFj5XXKBHLSpkQL3AZESBywTqLagqNnk4kX?=
 =?us-ascii?Q?opyIT1P6rg1uym9hsje0FyMx3za9ptkPsEhYSiSrBzkLKm1X89dVHdnekors?=
 =?us-ascii?Q?2j/hBCiV5zr64czodItpggzIbmE9WGEO8K2a2Zp06JuX0FjpqbsCoW4keRKU?=
 =?us-ascii?Q?uxB9EimsQ6I/y4CQoyZYkH80i+RyWia79Y/vW+POhjwAV43XOu1Rs6r2sLe1?=
 =?us-ascii?Q?D9wMYJHDl4s+YqIkIceNZDNVv6YrTz6D8akn45ZIggyshZSerqNcPGk68zQK?=
 =?us-ascii?Q?7cQNZmJJONXvDIv+bKVTo4zKtEIhRepZiSr3a4q9fQUQKVwT+lhM2gKunmIe?=
 =?us-ascii?Q?6lZI8YsFoCaLpcENkezVcLzLhv1LrEuXwUFINva4UNN2tDk9sk0k7RyMOSzq?=
 =?us-ascii?Q?5VwTyvsJvNj9rHi2yRF4/umS1Qf+9snqjpMAJliny+EeX0vvpcjOJlwqPeX0?=
 =?us-ascii?Q?mIaPJ/Yx2cFglwoTlyV0kni5lgRk+iwcWGhy/fawDAFYP0riazPATv50l8dM?=
 =?us-ascii?Q?PXuoaWGyh/4oRuSSaI9J0L9tRVeTZBUTcc4KbY5uBcRkFseK/mt6PI38rSh4?=
 =?us-ascii?Q?IBu2Xvq7DxS9EEHM7eSDb41DsaVePoUqlLdmvwAQPNYqul36OdJkNvI/TYGq?=
 =?us-ascii?Q?KBWVBU3smp3xcn8t9Xp5K/05Ah40p279dmas9/jddUdZ8rUmJ5vuyNwfdQdu?=
 =?us-ascii?Q?j17mKRgE6iYlY9vsemcNmG+HxFCM6Gd3PDsK2kV2903GAMQUbwWCChUMUjCW?=
 =?us-ascii?Q?92j9N/xZgiZoN/MI+BF24GruGGOeUv6LxLAbkYJCrNtJKjjEaUmma3kTXESP?=
 =?us-ascii?Q?kO4Me49PBXW6leg0kePeI+jaAPkXkAePBsDSRqdwbJHUywCAcEhPzJ88tA6J?=
 =?us-ascii?Q?5FVMNQAj5IR0r4vtFPJEDCssDcnk/YqiyETiYqZh47WIYe6UqcKw9WUMPc3u?=
 =?us-ascii?Q?OVsm1yrXEj4+faOIXCgGAVOfsjIydPfMjv4jyDxq?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4abfb45b-9c94-437e-1e39-08dd839ba311
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2025 01:51:04.0171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BmF7EmPfllesczqlKiaixDakDBqI28vYZcRgY5yNu7i5iDLsDKGjaKzw0bT2hWA1d5b/xH1N0jFX5VFb2yOcHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9112

From: Peng Fan <peng.fan@nxp.com>

i.MX95 features several processing domains, Cortex-M7, Cortex-A55
secure, Cortex-A55 non-secure. Each domain could communicate with
SCMI firmware with a dedicated MU. But the current NXP SCMI firmware
is not a RTOS, all processing logic codes are in interrupt context.
So if high priority Cortex-M7 is communicating with SCMI firmware and
requires a bit more time to handle the SCMI call, Linux MU TXDB_V2
will be timeout with high possiblity in 1000us(the current value in
imx-mailbox.c). Per NXP SCMI firmware design, if timeout, there is
no recover logic, so SCMI agents should never timeout and always
wait until the check condition met.

Based on the upper reason, enlarge the timeout value to 10ms which
is less chance to timeout, and retry if timeout really happends.

Fixes: 5bfe4067d350 ("mailbox: imx: support channel type tx doorbell v2")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/mailbox/imx-mailbox.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
index 6ef8338add0d..aef8d572a27c 100644
--- a/drivers/mailbox/imx-mailbox.c
+++ b/drivers/mailbox/imx-mailbox.c
@@ -226,7 +226,7 @@ static int imx_mu_generic_tx(struct imx_mu_priv *priv,
 {
 	u32 *arg = data;
 	u32 val;
-	int ret;
+	int ret, count;
 
 	switch (cp->type) {
 	case IMX_MU_TYPE_TX:
@@ -240,11 +240,20 @@ static int imx_mu_generic_tx(struct imx_mu_priv *priv,
 	case IMX_MU_TYPE_TXDB_V2:
 		imx_mu_write(priv, IMX_MU_xCR_GIRn(priv->dcfg->type, cp->idx),
 			     priv->dcfg->xCR[IMX_MU_GCR]);
-		ret = readl_poll_timeout(priv->base + priv->dcfg->xCR[IMX_MU_GCR], val,
-					 !(val & IMX_MU_xCR_GIRn(priv->dcfg->type, cp->idx)),
-					 0, 1000);
-		if (ret)
-			dev_warn_ratelimited(priv->dev, "channel type: %d failure\n", cp->type);
+		ret = -ETIMEDOUT;
+		count = 0;
+		while (ret) {
+			ret =
+			readl_poll_timeout(priv->base + priv->dcfg->xCR[IMX_MU_GCR], val,
+					   !(val & IMX_MU_xCR_GIRn(priv->dcfg->type, cp->idx)),
+					   0, 10000);
+
+			if (ret) {
+				dev_warn_ratelimited(priv->dev,
+						     "channel type: %d timeout, %d times, retry\n",
+						     cp->type, ++count);
+			}
+		}
 		break;
 	default:
 		dev_warn_ratelimited(priv->dev, "Send data on wrong channel type: %d\n", cp->type);
-- 
2.37.1

