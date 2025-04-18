Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2089.outbound.protection.outlook.com [40.107.247.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0C41C5485;
	Fri, 18 Apr 2025 05:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744954432; cv=fail; b=JcYIC5kGjuMDdSG8DKdbIc7FxuwtrGfh2DKsqjFQF5SKsIkcvDkmtBLu6O/clRNFQ+NqNCxELFYdryAAgNhfCsTGzqCFwYTUCEFWvhSS5KAP6aMvBDyqer7KthFm42fU2TZZ0U9L7acQ15x6ZtsVZA8WmAmiuSE0PGjkegsHSTE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744954432; c=relaxed/simple;
	bh=4RK69Y8TukRmgD7C0eWsUallvVvch97Eg3RVO4q7jNE=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=KkETObT07PUMwGRn+L4jQepyUJLwWYgIDCLLpKugGdch8HKwSDpFHxNEFlVLsReD5d7YGF1RZGWYn4uLsba382OUuzuRpKLijGgKMfEIzFa9470i5lemL1nbBFY3+W1vv147fNxdwQRwi2MZMxGIOOMppXXcnCJEQJQNwZBPvAU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=HAH6ycx4; arc=fail smtp.client-ip=40.107.247.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="HAH6ycx4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EYB5XEu57UDjrpAEyCpyHGyaGmPnupNtso++dzYdoZQnAl/TZ+0LAJ+jX95K6FQ1U1sFCsPfPe62eFq8v6PUw4B33Mg8Y+B85pe5o4e38Fqa6gvtUwOWIDagXa6NBiRaulMRXzv8CM4qu1QjcOh6rlkUse1UhzyAW3nJorrUZltuoEkoB8kvKmCycake0EeXiReKl6h47RioLPqKo5UPj6g5VKJlew6ajMLWhaSv4LEB8eMTB3F87abMjXGt8Oe5/KDyotC69vDqXAACB78SqGBGhSe9QL++3QxoPyFhF0Sh9V+f8QcpSY2oUR1Z+YEI061UcwQH/nVjLuUgCIKUSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=npVF+B73RbtB1tJnZ+f90jC+9tIqzcQb1jBBPhCAOaw=;
 b=DtmnDR9mXgv5irSUJZEEpmb+iGuU9c7QiqB70oEvBWTASwbS4mDanq0mxQEL7qklgHFF6IPawGMdfsDA5YI+6AS3IvJo7CvapvTC/A77V/qlU8zCz8yIDuxjDoZfq2c6wocAyzW5X9E5xLTGt2p3gL2jiXoA7yFSk7SwQBD/7Sx8lsVnj8HUbvcGSSbP/64MnQRgY217rbs7OkV/7n8Tx4RHXN063XuFTdWnmQph6/yAKUfM1LF0SPpEXuijhEX/6tLQqtMVitdwWHk1MY5RykfJwrRANxJwrPEGeGMIpH4L6ykBSzPVX5GBwDpm9+9+FgxFWEZG07Y+hV7jCN9orw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=npVF+B73RbtB1tJnZ+f90jC+9tIqzcQb1jBBPhCAOaw=;
 b=HAH6ycx4LPP3/lsppnOwa60iOuBTdC1O0LoHrYQjd/uz5/5c9SJxHSngMcUMkdljKkrRHk7flEJaygbRuElZz8OJu+TySWCZV2OvN+WX49fGf+4AhFyzA8LPAfvdP3MD2cDmtGIXWkeG+0cZ8oJET76G7w6RXXCQ8H4idZkkzsviiqH7lrXIXaLfn99PObtr9hT3Sd5Tv5qmHCCeUSUZJ2v3lxEZnpaS+0MrG1C/oKY17inT/miIX0Faj0CMwRWoG8gilzDT0prrsBSSW6tLDelR+3pkn75QLIpaW3BHNOdtab4yTJYl3aF3VqOIrmXdiwl/s6S0IdBZR6odNyLv/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by PAXPR04MB8989.eurprd04.prod.outlook.com (2603:10a6:102:20c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Fri, 18 Apr
 2025 05:33:47 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%4]) with mapi id 15.20.8655.022; Fri, 18 Apr 2025
 05:33:47 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: dt-bindings: fsl,mqs: Document audio graph port
Date: Fri, 18 Apr 2025 13:30:50 +0800
Message-Id: <20250418053050.2755249-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0214.apcprd04.prod.outlook.com
 (2603:1096:4:187::17) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|PAXPR04MB8989:EE_
X-MS-Office365-Filtering-Correlation-Id: 50ac7626-7eaa-4e59-5244-08dd7e3a976d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iFMo8yIzGQ8DCO/TLtAkazCgIEv7nZpE4m5FzR1u/8koTbY3AYbjOm+2P+UW?=
 =?us-ascii?Q?PvP83nW8vtjhT5Rb9YJDDsgRNQGeHiEUriJ1JG6IFcJsBYHMzk/eP5mZykig?=
 =?us-ascii?Q?o827N+ZLqwv1FOEXpIgkjxBsyKLT8g6mp4kvLclrr/tm05G7yxQlgWkTPKQa?=
 =?us-ascii?Q?2ShLqKNLqEPtFvZCqkbt4A0rH1quCnVpLHFSBM3M5PwqAKDdVm8JWhL71RNM?=
 =?us-ascii?Q?H8TJhzPe5+hwmUuOEiyUkjx6GYj1gHmaMWlnhzGKpGewH21N6Snmcqx8usDn?=
 =?us-ascii?Q?6pfQCTASFZzNIGZaqvctq9OX9MHjR+ZUFvSuhI9183GZg461rUwZmJeXFrKr?=
 =?us-ascii?Q?oQESaYM+ITGJXredvb7fKy0JYa8tYNp+zTV9ygj/zpYunI8y1WY3hIMc3Le3?=
 =?us-ascii?Q?n6WdvCV8ub6Ryv45YqLXiJ/83nmK0b52CwrhBkoC5AXiUi/oHGH8u9QqflKw?=
 =?us-ascii?Q?lJr8Lt7b7QLiA4h7lHWIQXefhWNsQ51mRikNXRBUO+CTrN7oDphKah6x+cIi?=
 =?us-ascii?Q?WzTspIN+NmUy8kzu1nUtps//AO7AVQft8X265Tmwt4ZTBHz/Sr2aKAgk2QPQ?=
 =?us-ascii?Q?htW2jniJdOjfzUoOZ6jTIXmM5NEapUhb7JpX97o4FT6Kvxti+PiqwHuDj0YY?=
 =?us-ascii?Q?NV4q2nrVCKKtqi5/XnVrJwHGgJaM9LTY2I8TXZ9Q+LJyG7Nx2QXbXwS+ofr1?=
 =?us-ascii?Q?Jl5XK5Bxh1tYtcfEVc8nvdTG9BjQbCwXVnjZgiagzCXh7NbNaCuPs1rFqEys?=
 =?us-ascii?Q?d4UTCReDNcSKocWS6F66T0Qpo2Po3U69tTM4buE+zMB8JPcRmCEPo5BDzawe?=
 =?us-ascii?Q?wzEyHA94CND+F9eBXITMBVWTEJUcbvEnOxWtvObbp9Y/CtXnMNYbpSQ41mFX?=
 =?us-ascii?Q?48No5SSD2NfG7kGjBNZoxPoKAHudGJE7OJzX4t+6bTSbzaD4yp+DvuMTdxy+?=
 =?us-ascii?Q?E/PpHsu5isIwUR6DVH+W3vYiqYZUmAyCJrZpV4vcs5Xi90mdoZpW1t8/yyYM?=
 =?us-ascii?Q?VGJWEYPzKhy8vveUvrFyTg2dsLa1JcuS14FQBiBYsdQ/KV9ecT5TqMrt673Y?=
 =?us-ascii?Q?54bwzMPIH8QZDbVgCnZX0o63kphlEIOzXkbWDXrrcruuoHghbD+/m/xPb8qq?=
 =?us-ascii?Q?YT9zoRlIfVezEBQmgPtxHKhPApnUVkfZlZeQZHFNt7ZuuSxFmbs5dB7QwpRz?=
 =?us-ascii?Q?Rywhd2v30N3ykhgK1viF9F57+bZHU/Rf07M3hyy7LSFuymSF6hUAwcvS/A+t?=
 =?us-ascii?Q?Bv1nZQe0AFsVEuVT7ntktToytx0A11M/g6/cN4EsF9AOJcRIhJUVXq9k4oxl?=
 =?us-ascii?Q?WziHZwzKSnsCdwcIBucGh147TZpvkbicy7DsHzTTPgStiSSLBiRX1uu65Flq?=
 =?us-ascii?Q?Sbcjp2Jj9RQjKY6TaiUZoOy0rXYtYBauJr1r+IlHm9YjhGk8VGVAvB/Omiu7?=
 =?us-ascii?Q?ZSL2YY3sCkaqG3Qw9fQRiNyOkQR+dkGGApdsaED0aAS9gqWQxq/Ibw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?x+r7e802HjbH6n8GLl91SE+cgcvPqQB4IpxTMuQWVpSjLz2dm+fg7uRm7YN2?=
 =?us-ascii?Q?z2CQzI1FrKc5ZQA++Hus/DL7cYeag0D+2WdjhuP6POlFSw7zaKTZRr0rsb4y?=
 =?us-ascii?Q?P27XSJVredC+IRhWr2gn1Wmd2C9I+fYi/wPBE4kfGQ1uH9XIGdQmPwQj3jjQ?=
 =?us-ascii?Q?lJd/bj23Fo4IIIZZ0P7oO6KapaeYqDaJYLURZBLoDkZKPFeuB4lDpNqcjiED?=
 =?us-ascii?Q?NxCFssQmzwdmDLEklOl4krw6iF7lHlGRQAr9FJyUuSbfflBE1ufi1+Osj4GJ?=
 =?us-ascii?Q?+JVSb09SN21bAZagV654bJTxIjhK/i+T9u5h9mObtQSoJOXtqpZ9Uw4vZL4J?=
 =?us-ascii?Q?A3TM2Yr+fHDKkmyV3W2LNBIOfmoGdEPGIk2sPj3OpDDl/ZBQGaPjJvUj7NNf?=
 =?us-ascii?Q?AIWVyDZFRe+qkpzupSuMLVdXLdW527A6aPSLWAQ7NHogsM/QuKZmGYnUHhgV?=
 =?us-ascii?Q?BkCOPl2EJgZs1fJRl0XPyAHTj0ZgmQZfpmhZXCwzcRTZRgIYwd2jmnAqFirB?=
 =?us-ascii?Q?6mz0MbV3Sxf5Uqjvra+ps38ujjOFcyZwg6vTqQqdC7zPvLfQ0G6m+afustbP?=
 =?us-ascii?Q?PeJvpzOxNj/IApRLzWwJo9oYMNDmxToiZUJoGxmymjmmdojUK1TIoCLBLY6N?=
 =?us-ascii?Q?zZpr5qP4RSC0IKdZKuENrHb696Bq/5sfEQDPri+XlAjksU29qmBUAXqlzmSh?=
 =?us-ascii?Q?WYIadEjphTQIzbxpAch//AboKcncRM74gOs0zhfTkhDjK+2JcN/XoiX5Wh8Q?=
 =?us-ascii?Q?cRMZZikn0dsp+2FQrgw6hZiilvGPA2YuU7YRcTAH/wk3ypO4HhzkWmFTnSKq?=
 =?us-ascii?Q?V5Lpg7kl9sYvMzQntQzfcUHvgOw4vdJKWyg0zill5CKn6w/R2Li2S+VtyeXJ?=
 =?us-ascii?Q?QzexcjUgtSxLtMdQ/sSX7Bt/q+mlggpSsmQ52Q0u5hN2DPpAEVWTbWkdfTtW?=
 =?us-ascii?Q?jL5E3U7E6oKVqvnNVyZ6Jd8jbUbRJ1PhLpkYWN9VbdKBmetOzxjtk5i3i6/7?=
 =?us-ascii?Q?22ibfcVhOt/AYQpus+Z9mN0rn47x5b9MIPO1AlOhB452YbDcRJF0WgXKdY+t?=
 =?us-ascii?Q?FZ07Yzxp8vtQ1FgBiSWipWETpP45EYCJPTVM+iUUlxR5AU5dQv3CPrLnRZjV?=
 =?us-ascii?Q?OeUMDWKlZ0+ql3C+oTv/Ud9KpHFjwhNdCEYPATBU0LC5rDeoFcxLU4ZdGg0c?=
 =?us-ascii?Q?xjer2Rn0NK3OB4Gs/5Sn/PY/EPY91y2E36NT9/NOOqFp8LspiqLzkZqJ/9xh?=
 =?us-ascii?Q?un1fcMLW4xlGmo7QUumqGnpf3p1CSYcXhpjda4Tc7ZeoU0e40ZzGV1Vpy9vU?=
 =?us-ascii?Q?S62nrfKukuZhfA9VSdDjFnHFBVYTjEW2qkuSeuv7vhWevwEpLiNMSeJGHnrC?=
 =?us-ascii?Q?viJNQVmWO961bkkhRIG+n4NUfL5n9O2AHywND00UdnTT38ul3n1tCiLssB+l?=
 =?us-ascii?Q?ymnEpQ4Nu7yzD5gaqbV8pMuu8uXKBHGyin2jWi8MkZnoabDt4VeAAx1fIOpp?=
 =?us-ascii?Q?J+2uH92vjYB/FGm3V1EN23yHZjNnVbVCJCbPVW6RQ052N/wVru6H6nF7ybtb?=
 =?us-ascii?Q?L6keXCwS1FAomKYu0QjH5ltXHekdk5eQO6VsDnEk?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50ac7626-7eaa-4e59-5244-08dd7e3a976d
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 05:33:47.3378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8CESkJmKMhaml56zIdA1qm79BVti8vs/FblShUr5vZzbYmjENIZuw27Va5sumtdawGHKvxsPKdmZlch6L9Gb4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8989

This device can be used in conjunction with audio-graph-card to provide
an endpoint for binding with the other side of the audio link.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 Documentation/devicetree/bindings/sound/fsl,mqs.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/fsl,mqs.yaml b/Documentation/devicetree/bindings/sound/fsl,mqs.yaml
index d1ac84e518a0..1415247c92c8 100644
--- a/Documentation/devicetree/bindings/sound/fsl,mqs.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,mqs.yaml
@@ -52,6 +52,10 @@ properties:
   resets:
     maxItems: 1
 
+  port:
+    $ref: audio-graph-port.yaml#
+    unevaluatedProperties: false
+
 required:
   - compatible
   - clocks
-- 
2.34.1

