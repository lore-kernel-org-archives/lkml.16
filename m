Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2075.outbound.protection.outlook.com [40.107.20.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425CB1EFF89
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 08:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748162950; cv=fail; b=dug8nNpScbtjBoDYRvd+aDyY/X0EC1d8zTzH9rsmexMDl3XNbPW8iTIu/vUhb1+jXzGq68o8Lys/4+QSVbO4i3jnHU1ZGnmkaaOBzcxAl5+SrJMIxU4RhRCIbyxXXo/kWN1c0XijkQsghL3AkKLUh9flPk3R8rkqsem75WRv7Fs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748162950; c=relaxed/simple;
	bh=pseT/JB1y7r5SkfZWQqb5PznROhzBKbo5mR2KXjAa6o=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=ejDtJpT1Z48e08vv1cHvw67/l/gRzLyzd2139XDQQyD5iyqeksWSk7EKfjRyBS/WrrI1RCqlv1MpPUaOvd0ZCgEFQkCRqWDJDc4yRCcrjGznU3UoI+kZG4s0AeIzaqByxbvnDZNwmFgoyrPXdgW9fsznDE/SbIz/Jo3UbsU44dY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=teOWEViB; arc=fail smtp.client-ip=40.107.20.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="teOWEViB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q4v6gLS3O2mCwctKF0bdFC4lGnFy/E/VUHcYH+f0SOC34g4+95DSC1TSKEL0DKlyfZwulX7eX3ZPWKSM8T3/GkBvbgJQvbRtrBknLoIzm/KVbjQRyoFTpsru9COBRJhKevXelfPy7Lv2/+NKfhxuk1KrK7nNDsYQtHvKdPM1E4xNXzvyv9P0lHN9GsxJib4KpuiBi/I+2riH9QYt3VePYJk9HgMor5myK+qRqiIR1IoXvK51WHuT4xeqvKSbkR/waVTP6S9mDjM3ZAqNqqjsyjKs7T7reopKoD448IJGNwGJuYpeLbzen3rtChuSglgFXZXsXZouvGg7IX56Y3vvrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Znk9AhtWFqYJ+O7sXPicNXY1yYkixh0JNW94WfBiIV0=;
 b=kKoqpgGPuk/zeDWy9+XEGvujpHvZqeCsVvYJoPStSffQTtnIkq1TTm/t+dy8WzLwLT3nI+32X1IfSM+RssZmDneS4AoiNwprq/W6dP/3AtZEADPDUysEGK+Nt6d6fsPiP7TZU7HI9XD9EVWCLqnBVmHxKYB29AIc3YiyDyRhH8xlJ0sqYxUTOhDTTjC1NKqnkg71vLKV0TxDZdNDSbhWEeR2Ots0tpadDdaJ4fdlnyBTKLVRzhA5AtSGHSs73mu0AojD6tKKlpGu/qWVGzrXEXUg8JdQ4KZBF3kgnLjA5ucxyQJ3u5P20xiy2HY97oU3BGC1tUAUmrtu2gul/d0HwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Znk9AhtWFqYJ+O7sXPicNXY1yYkixh0JNW94WfBiIV0=;
 b=teOWEViB8tETVxCbJkNb7nkmdbdSyCYKffphlIY88NifbopPy6+ARpo5fBiqlzsfMQnmde1ggf8IDcIxTqNnDvpEAVgSTlzrVKgYNC4MV3oQYrFHPB3YJpuJG0vZrDvcmIu385uZFt9DJl7VU53uXjM+prmcPBQFJCFxIhkHN6PFFgXaWfxD5mpcUKOszjoV9IjroYQPjfBz2kLGmyFG5vas4en7B7auyTVRBzKQJ1SCzlW26I1sRR/4F5veeb42XGwkhbv3doX3hxGv9uQbYP8wnzaHiNBCkF2/iqSfivpEwlPOAclAXbzpqA+iTZCxggibsICoOCUpv4V7urJG1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAXPR04MB9201.eurprd04.prod.outlook.com (2603:10a6:102:232::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Sun, 25 May
 2025 08:49:02 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.8769.022; Sun, 25 May 2025
 08:49:02 +0000
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
	daniel.baluta@nxp.com,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V2] mailbox: imx: Fix TXDB_V2 sending
Date: Sun, 25 May 2025 16:47:24 +0800
Message-Id: <20250525084724.3050883-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG3P274CA0017.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::29)
 To DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PAXPR04MB9201:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c7400b3-a208-420b-a4ed-08dd9b68ff7d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?i2PR53h3hShCJcm89JxUhfl8BAKBLKdgewFQRnKZbFRfzKMyuvMv73WfAy1R?=
 =?us-ascii?Q?aVTp4aT2SBII6L2GDUTObztykf4e/19IIsQ8DcQL7Mr/+vjJLMQ9rHBlcpAg?=
 =?us-ascii?Q?DbeheZCo0Mn3JOY8Sk3tEOVbRcuTNZbgmbKJxLWm/hJ5R6HkYvjWY0ftUR/8?=
 =?us-ascii?Q?bHecSE/COhwTwzLGtsmtsO9bFMEak5AbNf9wQTBKKwjQeQAxvgxhrYsmmJdB?=
 =?us-ascii?Q?emD3hhS6kQwimXKlCWMz6HzeLr4Qcs1VLsGhDua0hQI/YopIVQ3OVr0WvLg4?=
 =?us-ascii?Q?xaBu3YzDqM04jmA7B8qJcD7Lx9/NMlfI+GCl520guEDPKGgDSowh4PR5uIfJ?=
 =?us-ascii?Q?fcgzviZftAk7t+2Ug4tkeqG2aOhaQ9BC8NYwAK+odCiIEwhKfd9mJCmW+gaw?=
 =?us-ascii?Q?Uni0pvNFbV4PlU74l/ZKds8ObfXyqlxGyiOGX4yjurWsS/XiNnlLtFjg1opD?=
 =?us-ascii?Q?7fCdNNDXAzgHbR0v7M0hwRI8LZ8OkBKu+7NJv08FSfgF4fpE4l2EL44CPYho?=
 =?us-ascii?Q?nQCChCpYonU2GZRxD7xMKXqQHNu7lrfWq76F6/0Fmj6QGPDFjH7oMtvmrgxO?=
 =?us-ascii?Q?mZ/F0A4idd+cZCOLMMdc2LL2p3yQhBRuIqbYDhPe898FGUvJj1/sVjeSRB3J?=
 =?us-ascii?Q?9WZ0BDLMsdoPJcSL9/JDMGGI9zwtU//z1KK3aHczucEDfb1ldwQJYtQogGTG?=
 =?us-ascii?Q?VFb6UqjvHizza+SKYj36bcT7KCGoP7wGZ+IN40sbc6Ayj4sfiXTWvsphKgT3?=
 =?us-ascii?Q?FtBRhsXZXN9/hEJNNlvEWT2tk2iAYv0RAPr11qc1FTdbT0Mcu1NErXVmnBFd?=
 =?us-ascii?Q?581kyilz3aXnHzeUf7G54vWbv6Bgh9IM5sxvJNBv3XDJfeCKNA0GEgn+jRj0?=
 =?us-ascii?Q?oY45vVKiU6GwFrC7Tw9vt6v/lCmtJ1DCJSlCJuHc/50C81Qs9xhmfrcjstA1?=
 =?us-ascii?Q?O756z+MDs2ULZ/sKpsGI+t0zRcW1NSRFnP8oCLZeAFrseXOe8yl8Q1d5/tuo?=
 =?us-ascii?Q?4NJQtlPBgz2pglRZxAxNntiLm4v7tRxCKFLwHr7Ro1hWes4edy4S2k2vZPiJ?=
 =?us-ascii?Q?DqV2JPYGM3pGR3mbXPnCXyL7PSjSa48cJCP1qRpSC6803p5ImnHLZuwbRlKg?=
 =?us-ascii?Q?AcUU99US8WYfY3nzyvXHHTxNK+jVTynsC+OAA4EHgKXUzw1oFK7DbBwCGXC4?=
 =?us-ascii?Q?Imb2hzbqkI5CCfORp6zuTVl2OCd2EJMpRO2IFtY9kSq/LFF0e4aAjBM5CcAd?=
 =?us-ascii?Q?qnLseTkjAUPhwRK04L2NqHrIMH6aXqvyaDzKK69/uC9blDr/CMNlMuMXisJa?=
 =?us-ascii?Q?0rOkmxju4C3FzrbB2hvop0D2Q4ZoFZnhR6l8sJg+xMKfqfMND9z+6SDAZtCf?=
 =?us-ascii?Q?yuzZrXNgjA587RsNNosPPCgxJgkcoQwLLsLDhUw1vuFHq0howlsbBm8dGozS?=
 =?us-ascii?Q?8DhGuIufFouMZNwCjvczaX+5Zz3r0NYKbAMn3lpKd7CfHn0atc/obOLQqWnx?=
 =?us-ascii?Q?U4eZLWmAX+7ReSI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?u/sC0OqLYufpQ5nct0vUuh4XWzuCFTOjl8MtcumG9OoCRk7V8b40w1VyeJLV?=
 =?us-ascii?Q?9vCiT9B1y1T7UdwezBVd6/qFFrkGBoiDTBgM6vAoZ9RA9urH1nDG+rzXag3f?=
 =?us-ascii?Q?PK3qDvyM8fGZcmruW6S9/UC21rB17JyS1cA8lCKE+AGYLPYENQwB4rUyHVVJ?=
 =?us-ascii?Q?hS4amP4m/K3VRfeKDcnxdrM00Hy23wN7ilvJIk1+UUHAk4QUAlR286q23Fq2?=
 =?us-ascii?Q?SoS0QnaKLSglPoXhxRCxjojHrFAulhAJOl/g5TxnWlNqqCW3U7vQiKd5iSFn?=
 =?us-ascii?Q?32e8IeHvnFndUzWl1gSQ8MWccg15xhJkaDqAw1mQHGG5PnduZ+ne0l52tLMJ?=
 =?us-ascii?Q?a3tI2MewB9CUBHdHSi5PAoaO11n1belMzXaRF1eX/yVjjfTY298L3CRR8VhY?=
 =?us-ascii?Q?R2Y+R2KnTvsfFsxT9LKIkdtkz3xYGl5M6ApPJfMLPjJaYS5U5aC1/rHfv6k8?=
 =?us-ascii?Q?rJoR+AhA1tr2/rbxkPKMg3TkFRZ8MFyRiObBoEgLYaL2u1EuI+za6UmMrHV0?=
 =?us-ascii?Q?oW10QL9Yd/elYhIUCLzjVw1QxPqr8huz+hA4oYVoGgfciX2KSke48TaDtXbw?=
 =?us-ascii?Q?c2048hJ6YngunPsCk+A7A+d3qun3tFhe2eIM2TnpK38sCMcyJTRpZW9bYUSM?=
 =?us-ascii?Q?Vn9mWfF4Gj6qKXMm9MqjRzuLuwzWqbPvDC0OPDNaeZ7PHvYk4s5uSmCNc4q6?=
 =?us-ascii?Q?lDiWc7pJy76tXVzdLRMtoKV11YqWLrbosH+jUeaOwwHK8LjvXCt4bOepcgii?=
 =?us-ascii?Q?KyfhSu6d/HSMHYOmFjLE1Z0RlY5ZvOl4wTm77tRsqAKo52XtUwiaUyWKUInd?=
 =?us-ascii?Q?7Px7s6JJhWH6588IJsHoq/aFAvxJX9bONs3ZMPfqWJJrFtByuSLJ5CmejsXp?=
 =?us-ascii?Q?aAM2uFgSOH/xSDHE8nafBEdIYY92u+5JEEj8nGF7Xvazve3YlzdS/iKWt8s1?=
 =?us-ascii?Q?Egf2/6BM0qkvQXmDJKyDq/baPeHUc4Zry0T8oq8xXSYN4gTHU8/cNwH4oYe8?=
 =?us-ascii?Q?O8K2+xc6kaW9WGPDarQVWT5g4YdXb0g2X4oeYapnze/adUxetpC8HggX3EKz?=
 =?us-ascii?Q?2jddz/FJR8fQVqEnCXSy63qUY24dKQ9sJfFNQN5QDn05vUGZoP/kbfTo2ezS?=
 =?us-ascii?Q?hXWAeSIMJRf4Q7SFF+GGXbynqBt7TUXndyW1d/WB1BMwV/SqUlBD9LZLXTeo?=
 =?us-ascii?Q?UHBO3UNEECv0BFod/hzpvoVXq59t6KvYx+fbx/Zc6GxXBZz9Ki/giHdK59FT?=
 =?us-ascii?Q?SRqFVSQOHsdc2BRAOK1mJug7n04ZdsdgY9w4FXTiAwMK7VKBe8qtFqTnthoE?=
 =?us-ascii?Q?P9o3OSRkrGXF3u9zEFVtV2QT7hWd8KWrYMnp4KBLCHgoJ4vMHsI11P7WHdTk?=
 =?us-ascii?Q?I6LGmSm8tAChG484AhFLx28C03vbHV7iVtD5IdkL8LJekNYiFNRcLF8/Xujs?=
 =?us-ascii?Q?/NPZhD+O9wZWIJr8Kpi7R17utnGnqUCzJ9Upfo71Kf6GxYtdI0/Tj9xBobWc?=
 =?us-ascii?Q?8Q4A1g2rpMQdQx4EoNyyVxiszeN6W2SFLMk0sV7TTjnBVC7MbzOL0UQH+O0Q?=
 =?us-ascii?Q?mtoggDUEMrHafcYvcxQb6iRBqkKEap+NThi0YjCq?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c7400b3-a208-420b-a4ed-08dd9b68ff7d
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2025 08:49:02.7648
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L6B4wJ7qVXsWuc0VG4nB7zjA6J8IP0We+oCu1syGEexyWT/3pqbhfdtgfaf16NNigRz64BZnGcBiGsGDLRE8sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9201

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

V2:
 Add 'count < 10' to max wait 100ms.

 drivers/mailbox/imx-mailbox.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
index 6ef8338add0d..6778afc64a04 100644
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
+		while (ret && (count < 10)) {
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

