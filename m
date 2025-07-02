Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010029.outbound.protection.outlook.com [52.101.69.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1143218DB24;
	Wed,  2 Jul 2025 03:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751425218; cv=fail; b=fmiAwsaYznMbiPvC+oQIJhoRrNCh3ImEZGzD0YMbAoUttnXRXRfyVX8JB66P8UD8QcUuKZoiflpP8ymet2vlys4YY8dlkmAdeanuSi55LL2c/WyVBPzbjQhi+dMhIBs/S0yFtWHBYAHIEomC+97mLJbgv4To/TxuFhrdXQ0Uy1g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751425218; c=relaxed/simple;
	bh=8RbDVyDiEz6x9JxDsQXND8fdiYQMV8PEp+ejaMy7+Nc=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=RhvYE6IS6r8MgktW1aLUNO0QVd7Y9BQSy4pAW5n/5aSe6ioCUIkLBJctjRJKVCSMNr8BRMPDz1y8ZeY2L5dxN+ckQgDb5KsawrxMlZaiwb4juGUZ65LGAdb7QzhkcexUjBM3LIf+kzZBWrMlgcQNqqwD6EkyCG2/ZWfA6lYEvco=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jU2n/BTj; arc=fail smtp.client-ip=52.101.69.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jU2n/BTj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SniPjtevHoXNqpT4KIhZ/bowU/DuWW4th8HkaD6RJ1bhHhrf8fdXH5F7DqLl3x/77yfi+4U84MYpLa5aaTX71KhC3QX3rlVNCq1ZPTlwdEg1+UeY7vR3uvlrFrEyViU6fZeY2f+IyPlG+WLJhh9mCsYtpMyt3zXH7PFpa3bWlUaGMGuD3upAuMYsVIN+imD5us9ZjpZK/Xlcvvw4gAPjxEy42OrISnbmU2v0U9DFbzAq3HcD05jWPWRdn+3Kan3KvDbjzr3VohCKMGf1ewETGEBn0wrGGIBNXLfviFKaHzQwsEgx0lPrQ4lfrXWCzCXxy0htHKA+dQCIh9OB1Cx6hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a7RqwNYjLGYm7bejtsihVObJLnkCE4/1x+44/Bwt470=;
 b=u4foKGNPSWjxt74qYCIsxXhRlmuN+jYHWuc+iEyHauTO71za37X37Bs0ssgxgJdI+/f/a0q4QNoYYYZgYTEUC40sLVnCtwlapG1Q/RYM9R1olsIfK0qpCsEMBN0BMrPFM2/f41pzmUkBGGywnepuD1VhX+T0b9Al8Z0BKrLW8Wj6ZAhKhiKppeipNawCGfpGhQNaGULmBdbZT7WRXNvO6LOaqtrb3Y0LS+kapFABeqjM7Uh17pPGmZRxI9bGqurRQKUXOD8/2QsXHYf4u30lxCcf9QQLBYixSO/fMJfRez/CbpKlWYwir7g40z6qb4XRDvFS4TnAwLTUQU2/vmTkUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a7RqwNYjLGYm7bejtsihVObJLnkCE4/1x+44/Bwt470=;
 b=jU2n/BTjhba1lT1ta33gDduWDIt6bXsLCTyXacHLN6UmlknnOp/2XGeOX7YKKeHUNG65mIXmeJ0f3ZKFfAQ0V0WRysPslsZ2WniTMG/8BmOPbi0W9TsQC81Zqa99ssCNGSIPu7ux08g6odws5+XkoRuCD5uef7xwGCFn/LQ46XB/7Vuuc13sHryHVcFrH6gsZuYUNcARnn8iIQAA2sZdk6PpLRzGkJJDMcl7EtiT4h94qB6DyRPdbjW5Txb8WyyqWICggCviVEfsnp6Sl8ocRDFO/G4f7uPJLSVmGgmaD7AIQmv3VW/TpmqN70L9HPVbAR8x/osir4VUnsp0R/ejGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB8429.eurprd04.prod.outlook.com (2603:10a6:10:242::19)
 by PR3PR04MB7482.eurprd04.prod.outlook.com (2603:10a6:102:8f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.31; Wed, 2 Jul
 2025 03:00:12 +0000
Received: from DB9PR04MB8429.eurprd04.prod.outlook.com
 ([fe80::2edf:edc4:794f:4e37]) by DB9PR04MB8429.eurprd04.prod.outlook.com
 ([fe80::2edf:edc4:794f:4e37%3]) with mapi id 15.20.8880.024; Wed, 2 Jul 2025
 03:00:12 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	Frank.Li@nxp.com,
	ping.bai@nxp.com,
	haibo.chen@nxp.com
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH] arm64: dts: imx94: add missing clock related properties to flexcan1
Date: Wed,  2 Jul 2025 10:59:11 +0800
Message-Id: <20250702025911.2457322-1-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA0PR01CA0071.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::11) To DB9PR04MB8429.eurprd04.prod.outlook.com
 (2603:10a6:10:242::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8429:EE_|PR3PR04MB7482:EE_
X-MS-Office365-Filtering-Correlation-Id: 5211ce26-906b-4512-9e02-08ddb9148f70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Tv2OWVUVsk5XQXFJXTe2UzTp9MUdXGKz/FakdOGhsei06jXG9erduFI434CH?=
 =?us-ascii?Q?O5xRouTO1rYTJbhbq+OZzHfpPzXDLRJ0FCTlope3c05bFFjPiOJlZ8BBJweV?=
 =?us-ascii?Q?EVAT7o1/I8gc9sJ/6GdqhtUYo4IPzhtfjtX+6m1aUbQH71cfbByV3NrJl7Gf?=
 =?us-ascii?Q?J+AUhRu330TZvW5c1rWcMdyqe1o5aPaK9L5EFL8yz0eLsnQZo/YBosE67fXM?=
 =?us-ascii?Q?FmDBAhRgXOncjqCOgQhgxYKSS7wlENmu2I+5PuV30ZProtzDM+3oSXX25UX8?=
 =?us-ascii?Q?4BfkfIChsPdAIC5iI5XFJ8yYCHlIZiW1QxFQn2A/FO201hZH7fVccGdiVBoM?=
 =?us-ascii?Q?x4frJlQcmz0vhknCWT91NijT3lKzgv58TnrwWLVJ6lH3ZbAx2rj+0ibIAxkC?=
 =?us-ascii?Q?4JVvCSZMLl2RKEHd5VahBkkwDbh6DSkBiFKgv6bT1Io2kCwz+ch0yQuYKL4q?=
 =?us-ascii?Q?4k8YDTD5XGqRTLn9SP5TFYs+dbQvk7G83sDgAx7zDMwY73prNETuO12dMDj6?=
 =?us-ascii?Q?eVmeSYPLGsUn8e/umeaPU03uQ2Hf3FDhUXLpdGIzr+edI5iWEQ+jovO+fmuC?=
 =?us-ascii?Q?qAJPsQne6jNk0B+dMIdnv4FArclHSfjuU6kgYctuzq/fngDp1hc08xt74zdB?=
 =?us-ascii?Q?o8JVRNNH7sZg/DqZtoH2GxJ2U9QB8xSLzvqY7fomi7nGviaZfh4iK11MV1em?=
 =?us-ascii?Q?tt54BOixWx2/0OcJNqdMjqibMr0voRduu+NH1aCWengjjyTeOzjpWY7kvXXz?=
 =?us-ascii?Q?IoSCjQ7v4hRhWvUXKS5bVLXbFRnN1t2lX8ZqlImGwewjGLYWwE0sGH4b3k6A?=
 =?us-ascii?Q?DOneqGLRxSCjHzKoP1ZX+cssQIHABm7Vq8RECcdqWCtCkEUGjIGXCxOEkxEc?=
 =?us-ascii?Q?xGc4sB8y0/S3b55UCTJ0NGQLbmWhP8YJ3wfwmpZOwHG3J1T6fCh76LNh76Ud?=
 =?us-ascii?Q?TAyjFvzCqVrazJUkmpuAh0pUGtfxJJwi3PsNi8sHHVxhxTEcvHJxCKNaoRgl?=
 =?us-ascii?Q?+N0AD4wkCQuywnDC/lz67A2kpQRxBLSu0E4Hmnyja1JdpebHyHD3/CaMbulU?=
 =?us-ascii?Q?f9tBr+9ciTKEc/UCTPpehvxwJ+ZuzzY2LjH0onSZPrkgeA9ou1KaXZOTjTfA?=
 =?us-ascii?Q?K36sIj8NQaYW7xQi8oZYeyY0krrF2egg6V0cLIf96tKrgxtY84KH6ZF/4lbF?=
 =?us-ascii?Q?QmSiKKKTI41mKJuQNAc0F8j9VbluFBlniKiR/n1Xm5WK78PD5VM1/ooPLTvF?=
 =?us-ascii?Q?5OeyBkg8V9ajK0bZm8xfWJdqvn9qr8jU2CQSRM+00ha9zPYgkV2uRi4hH+f8?=
 =?us-ascii?Q?kww/ey8jCCTbNFNC9VHuercRBb0BYrHjJr6qbEjZTI5qg2P3Lv/vwlRb00+R?=
 =?us-ascii?Q?yEWRjH4avyD0vaH5oEwM5jGf3A2md3MV2Ru+07oo/crvM9XWJGbl2ckpXNWg?=
 =?us-ascii?Q?oDpKTH9heSoVoukNV/12lC6JjCgEi4YXseRdho65q3vzbdsF2dWZYw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8429.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(19092799006)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CCf9ZnTKuPZFbx28SODmwxBfZRfmis907DCXLP8N+Fol8Sn1n7dBZ+bPeb5Q?=
 =?us-ascii?Q?utBDlMmJ5VKcf7OgArkFaDipVra+ctP9sWys/Gh89iAqkzKIeZDizRr6ztE6?=
 =?us-ascii?Q?Sgf5oKJu69maYSlvD0nkoSw+fcJFCPWlTEyIzM2b3ZkrOCJVY7Bes1JCGmYR?=
 =?us-ascii?Q?4cuaAnxmsM5oknBlG5X0h6JN0+AT6x8H+s5G4U+OqOeuLREmqagbP+PH+Kzj?=
 =?us-ascii?Q?SkcZQOdXAHCStn4iuhScLRmzAHF1ptTnRN+s1wmZnZ1Fc+bTVK6wcXoXJOEN?=
 =?us-ascii?Q?6+Z+O6HbibU43D8+R/qN7KaHGV4HAlI93Sv/ywllvek8efOUr9EvOnMHbEiO?=
 =?us-ascii?Q?eBELTYNU/4rc6a9xtErffcJM9EFbHChntX9byTe7vS+cnwRwGuaQfawA/STW?=
 =?us-ascii?Q?lnAu5VsN+waFsBu4WvfE49VcJQqDfjkvdjrzkRum8BKxBr7OsD0In2wLL/2c?=
 =?us-ascii?Q?CaUar3oiRCsRgh1zzaQuqkCfdQXMP9Dd9oSJqtTNHp34uqiHO2YY4v4uMSip?=
 =?us-ascii?Q?UfztiMpq3xAX6BX7/1REyVLI4fDC09e75hBrbvaK0u4cmu63Y1MnMVmxnu6D?=
 =?us-ascii?Q?FvAcu9dry0mEJqDWQeBfojrlZNUFcGf6moGW4sDk6pmt5DaeM1NEF7ywxDWO?=
 =?us-ascii?Q?xJMU5Ja+8Ld4EQ3hGtgV2qiuAFcwizdGo7j1yqGh0oDwLPqkpFm67OeZQbUS?=
 =?us-ascii?Q?+vNknOY6f1659mqZQ3094RTuGQAYZSZHa3l7c/+ircoJ7zhOaokuBmcjiVAn?=
 =?us-ascii?Q?f0+hZZOJFkN14ai2abn4glqdFDGin6iIyyAvRNgoXcO2Ks4ss+s5NtNj+B9O?=
 =?us-ascii?Q?EDTY167I6RohKBJyTcO2M3QkKRNIamm39JCbb5nBUYhMsqaHvt4bpVbZ/F+f?=
 =?us-ascii?Q?gjtWWWBNqzNeJp0Ggrq6PlKf9LEOFpqExmtuJSPqESjbeylmwLoIClSFyi3Y?=
 =?us-ascii?Q?WukKG6sTq7OTlWjtyk0BpGs+7jzwlceZlzJH0A3DqXEa0ORdJehbi4IjWqUm?=
 =?us-ascii?Q?IXNWPMUKdXOxvcvY72X4vAVfrPR33iAb2NMn3wBLuPlEBNf8ifZV7fzHbMNQ?=
 =?us-ascii?Q?RY4xYw1Z3xvRrS3st3zcjZJIvTsFnssQUXqdn4Qhi2FVC5ZeQpcqK6rhH46z?=
 =?us-ascii?Q?c1X1geKYIE1+ksWG2NSkKGE4OocIKK6EvQxXb/n8PioGkB694GK+0/ExWpme?=
 =?us-ascii?Q?b2MwgdLy4KDq6PI8Sm/Au6JCf3aeD5S2lpE99+XrtcD9bwdxYHrvJYtV0gWS?=
 =?us-ascii?Q?at8FMK/dDz1HbfQlBGhjbrRg8nHVTfQridM082ooDawNqNY6DAC5sdH7RjfM?=
 =?us-ascii?Q?WNscCfGwC2GMlizz3Lr9uzV7d043gQ9aTMiPJR43LfteKa9M/sAycDIzqemf?=
 =?us-ascii?Q?uQFK7SqcrVmz/7IhownH6RqXBK8yz39BCLcUPWNhpLgUO+Rv/ZF0Yfrg8ofZ?=
 =?us-ascii?Q?ZhUpAy+CClhvePYaH097+9fQUavJzS5ADjwY4vIDaSR/AjK7/ZQtoxA0iQwO?=
 =?us-ascii?Q?YBViNf7b4YjLwKMYwDBEIUoUSMkc5tSJuZFgJ2YjjD1qnS8F1ElvZ/TaN7Ds?=
 =?us-ascii?Q?qkzxmZwxYPv2DzK+K45A6CycUX6/7CnG27p+kSxZ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5211ce26-906b-4512-9e02-08ddb9148f70
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8429.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 03:00:12.0621
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dB4eUwMyItoYPH69E7xOasJ2vDAdvLQQ8zuB0lJhs1xuKd0sO2BxCVyNw49NkMF+DhekX8/Gb5SarhALb30oGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7482

Somehow the flexcan1 clock related properties were missing in
imx94.dtsi, add them here to keep align with other flexcan instances.

Fixes: b0d011d4841b ("arm64: dts: freescale: Add basic dtsi for imx943")
Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx94.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx94.dtsi b/arch/arm64/boot/dts/freescale/imx94.dtsi
index b8ffc428e95b..bd3437146746 100644
--- a/arch/arm64/boot/dts/freescale/imx94.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx94.dtsi
@@ -1035,6 +1035,13 @@ flexcan1: can@443a0000 {
 				compatible = "fsl,imx94-flexcan", "fsl,imx95-flexcan";
 				reg = <0x443a0000 0x10000>;
 				interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&scmi_clk IMX94_CLK_BUSAON>,
+					 <&scmi_clk IMX94_CLK_CAN1>;
+				clock-names = "ipg", "per";
+				assigned-clocks = <&scmi_clk IMX94_CLK_CAN1>;
+				assigned-clock-parents = <&scmi_clk IMX94_CLK_SYSPLL1_PFD1_DIV2>;
+				assigned-clock-rates = <80000000>;
+				fsl,clk-source = /bits/ 8 <0>;
 				status = "disabled";
 			};
 
-- 
2.34.1

