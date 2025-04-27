Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011045.outbound.protection.outlook.com [52.101.70.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1292459FB;
	Sun, 27 Apr 2025 08:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745742109; cv=fail; b=dcA74uEY6Cu2+wEWGWNgSwayxD0hQSkIfbgTLYas5kNTLBPDDie82gL2sFIpTybQeNhD4yiim7UuN7/3YqIim8x4UXJ2ZZppPytXg1F8YQ07Qw3Kx3ccuEQI4ocUWdWrjO03Jzi1EuB5G4M6FsUjd2BVZau8XcWMoSQzN98E1Sw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745742109; c=relaxed/simple;
	bh=xdy33f+wvVfh8uILDTuHQ49dS9/alBQqAogYoYYkEW4=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=L+PSU3NXijNc7ONe2RlKk29vFO+4eFxaG7DpUurUnZ30aHK4B0tQ2zhdoe3GF0OYKnT4Z8KyuqT+ERYDjavQqyZFELHaogiIcUI3moPAR1FINDT7Kwd+1ayvKPkxclhZ73pEXOKzU+OFMBYIx32kiTJyxGFP2SQyWdXk2ZnJ2zo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=XlO6u0cG; arc=fail smtp.client-ip=52.101.70.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="XlO6u0cG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QvI9OW6pdxmvXmp5/X8MEZYkP1JZ9UbHXBPAY8izHmHrs1baugXYfx1OCJPpisg+N8ZJa71y6SWTG6Q8RtCsHOOiK7H0dJ7SIhkW3vGs2itUxlYNjClhfN8bDllwpa7sS951rz3HrDBGbA7VINchxFj0hV2NrfErbG7krCLCPf7U/6j60oImRK5ejN3Vk6TBvPSwS1DL1PD/ye5LNfFjPtm9gq+MjINmQ1uXILvuhdeTQzXc1syEbjyVC6gt2m2QZtGE2iLSj/V1wqdGGGsWa58jovuZokLo8h3Sw4SWcgC/fNRYByONFDG/8MkJNgVQivJfU3pc6Z5zxxrymy+QYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oycBP6yqW27uZT51VlHXLLBBxUPx5auAcswmU0U4OWk=;
 b=lbZHmkAd4GTYb3RT2ErLk/NHHjJIXpsCkA84zNV6rOzV+GE8TsDNbopOJs5fFhGqc9cJzW9EryoMIdZLzZFHGqjz3HPFel5KJ0lYkZq5Wx3hRYFnjbkoSHXr124OM7BZ6wgHM8mKXqw6r2NKrA1dy7oGzn/uda2itsTRk08+dhIzXoLLClLy/RqTfDNqVeaa601V1hLDTLtvSwKPJzGm0vipO8VZI6/smbegQCNR2QRy/WmHGjHum4osuLK9k0Oip3XSQjRbMfP632FxTewrdMc3hqpAvFhOUUmKPXwVKH16X1FCHnPxqrsxjnw6gq1utCqCslqn50aO6iB6D4nnVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oycBP6yqW27uZT51VlHXLLBBxUPx5auAcswmU0U4OWk=;
 b=XlO6u0cGWffo+2bwwqBtx8ZXBAB88R35xyXYSh+j/kAQ8OwOWcVfFgo+JUS9xupSWO6+Y1V+1/gqF4cNwufhxVILPDJxncYT6vlocf8IedmhQP0Mll+5rENFkAU5B7+7JnkIrjv4w4FrLRAOGfcP9fGTKZP7BWbWKyUcfGX97WSni6SLcFuy3JBNgOAkrrnRiVgt3ZCxtsPND+RJ+ZMuVRctwsfNHuSFMFfMl6K5QNgOrP2cjTwCg7+zeiO6410CXGNicflfR0YmKne+2GO/bNuwCtIzeGYBt8vA6rYBsIAVjhyfvsE+CQD4LWgSHQfvc0t6zMW//RYJXi/njIr0KQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14) by PAXPR04MB8474.eurprd04.prod.outlook.com
 (2603:10a6:102:1dd::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.29; Sun, 27 Apr
 2025 08:21:44 +0000
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687]) by VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687%7]) with mapi id 15.20.8678.028; Sun, 27 Apr 2025
 08:21:42 +0000
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
Subject: [PATCH V4 0/3] support different number of clocks for svc i3c controller
Date: Sun, 27 Apr 2025 16:32:27 +0800
Message-Id: <20250427083230.3325700-1-carlos.song@nxp.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-Office365-Filtering-Correlation-Id: 85e70c97-5df3-4d16-2d50-08dd85648a47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|7416014|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iMVl0vgOLfLXPsjjwKYX4+N9vyrXmz8bi0LOj2eR4HWxLuF5/9Ux7JyoN9rK?=
 =?us-ascii?Q?7k101cBFphw3ZUQP4ZptYPrI9MaeWv5jpi14bHnII+5l4VIUXWuN59To6ecO?=
 =?us-ascii?Q?Y5onagAX3SSW0BXBjT8Zpn70IEWVoUCP3VJk3CZ+QWrglSGR6oQ+9cp1m86/?=
 =?us-ascii?Q?2b+PDhUW6Khbj9ub5tww2u2rQdsXKCBzOBOt40a3T4VMmuWh7f8cfMOAU3ms?=
 =?us-ascii?Q?k9JoAX+umGTZausp+WkiU2/t9WuAiDmwy9ifSHWHdxhiuroVE+xmgyNdZ3f/?=
 =?us-ascii?Q?DjoWw2vBGPViafEPAjIKb9aosAgUg0vYGeNl73PEhYd+jvZ4SJ6711Qz812S?=
 =?us-ascii?Q?TfLaND4HE2aKJJOGfyaYQwgb1l512urePONfyr/2NnH9PgN7iUUbDYoxUuRs?=
 =?us-ascii?Q?FNs5ghkEgRNwAa4FT4BXQ5q0DhOq5ZbiqmaYS8tfCkdOpU+A/fgPBqDegq68?=
 =?us-ascii?Q?qT2SUD5uRP79Cjd5OikNwtqXeWZtimvOQCqwfmhZTCzHIVyLcrphdr5Wf0TS?=
 =?us-ascii?Q?uCXBDtP6a2X9cjxRP7pAFF350uAzBekH3TkiFBuaLvWFxhsVgSKaylvFLVhw?=
 =?us-ascii?Q?cJNNDBVK+NEbOgUUjlj0sKzcRFmj7R+ndVvg8o6cueaCnM94sByOtuOE3X6r?=
 =?us-ascii?Q?Itsz62Zb48Ap8lp1LOpF+dp/IPtntxSSvxReG+Tf0Dhpc/CwHpunxTxlhG4f?=
 =?us-ascii?Q?2e3PWxb/DFbXsz3ECNmptQJcn7u+fo26DYpJ1Av+DfIxYcWb93syPizEzF1W?=
 =?us-ascii?Q?j40pN41VRIr9mSjscJ5b0p0JJr21bLDSDMwxCLXWxRMnDeG17GXy9DKe7Opw?=
 =?us-ascii?Q?eOSWbLIZefRfUlHOL7X+t6Omu70T80QttGaQPwF5Iq2SJPcQxYQoqtbQpqCm?=
 =?us-ascii?Q?w3TSXgBEbBZTjO2wpqZXLxCov0vCVl2eRy9u/nQtYIeRQEkn+taVBfzh7YFD?=
 =?us-ascii?Q?elyq0Ut5FRrwGHHWvzgOLcLcYSz8JMlwWUs/gwP5MO80qYs1CFyPBOOXPhTC?=
 =?us-ascii?Q?t0Lsg8zDzXsA7uB0naaKCMVxF9pmEnUHbBStLLY2Wkc129ycyE2k3lWfLDoH?=
 =?us-ascii?Q?bgxsGJS0GsI2YHMrzwr5MRBNbKVymp4F26WL7m0sscQlBtRyV46vxKSDSWHG?=
 =?us-ascii?Q?wGqkXoCoc0x+2yLntCnAiV2nIvF8aF2/cUMuNtXrwv5R2r22pGLudzkWQE1D?=
 =?us-ascii?Q?ni/BMHDGbZBN315II6qj/VY3Lr8JKWYg0MS4Z8VFwelQKtX5BYUynwIgxQPr?=
 =?us-ascii?Q?Aw8UHvfvsnuDNW6UBh94Rfq46jq2rBLpps//rgAMnGM3aBgWciT3A2F9KjKo?=
 =?us-ascii?Q?dLE9XkUMhFUFE2ye00+t5EEurlQUD4kzp+SkDpn/qQQNSStOigM5evl4CdXW?=
 =?us-ascii?Q?iH2IotU1SCcsK4a1h6EW4Smn2TsOUuG2tnX0WQzo4oy6Git+XZC1wLLrIlLK?=
 =?us-ascii?Q?6qikgnhz+gGDLFcUPn+13Fcf9ImKaQxb+0wWZ6xwFvzZu9/OQ1koR1Nrp7UF?=
 =?us-ascii?Q?S6OssNg99ombsww=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2PR04MB11147.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(7416014)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TDA9ksrUjipjdSaQD7AuO9/nvIMMOkOOgSevINbNB2H22xdGkgb4L/734Dan?=
 =?us-ascii?Q?9gdiYgwReAEGAN6MSt2pPtp+YX0hb0skeSmbZnw4BfDNlu0Tb1K8Oc+F/m8f?=
 =?us-ascii?Q?qsxmZROViDspFAHnqZac5bR3gd4lk/BFGu3fgFHkJFibOehI3FDwIXQi6KFg?=
 =?us-ascii?Q?/kEIOdPyOIxin/brduF6NsaU7vqcYFjQO/dO0U1VsdmmSs8ncgdxV2fFXtim?=
 =?us-ascii?Q?FuOZBZCj9PA9W7ew/K/vJ1+jfYKKDtLcAvDyhC84k0sEbrIUb4KGqUgKDxbx?=
 =?us-ascii?Q?Cgqbl8DG2w3iZRMC0e2oVN3UYWDZ0CiMYYGtz9bcoxAVvHNEvYmwtfPJQrch?=
 =?us-ascii?Q?mjB4MQ33v6bNsmnyVc6p53ZpL4zzovFDF2HMbuN+M7cCRgyOpm9mew0HJ6ea?=
 =?us-ascii?Q?58mS6lSE81PafRRGfSSz+o6I5+099f2fEX5cZKn1VI0ug8we7pK/u9EOTE9O?=
 =?us-ascii?Q?NEvzBD2JG6G/fJDURCcE10XkryZ1IiL8rMCyTav+O0i9L7pciWPtwtJlKm05?=
 =?us-ascii?Q?Jz4y4E/C9dZCmTcfuxMCxNsBBJzQae3J1O/L2phK+uLVOslhcIh67BRGwtPe?=
 =?us-ascii?Q?0T6mXNigHA2ookexaMJF3/H/bi534VEcn1tmb/bUI1TvDv8/VWg+jY0aE1fu?=
 =?us-ascii?Q?7azoxMV8fMrJelTiW9ZwKFPmz0KdkgXWOf3Msfg+glAwR8/Lcx1/iYHV4M6v?=
 =?us-ascii?Q?7McJKJC1SYEIWSRPGQ5cG8UYPN0uI1qNHL3PBHeOLUPkkojoxMrpEcs5ipqe?=
 =?us-ascii?Q?Z45e9yhQHZe2LKwRy7mtdliELU2g2KJUGbKVpwtDxRFQbyTpZ/XsTpyMSA7P?=
 =?us-ascii?Q?Fk4EPMUu1DkOezSHRZM186aPT5cRdQ8SvX8jgo6xkDnvsT+gcZURstLK2J3o?=
 =?us-ascii?Q?48YRXq7tWMcg70KqYRsSrfGsxDgwS4I7Gx6frUhK4/VGLDFn5O5r1fDhyLnZ?=
 =?us-ascii?Q?qkxFwDXURO1aniCg0fmNOcodnFFfdwQ/KWZ9F7rr9wn2e8aGrfsByp6KBxBS?=
 =?us-ascii?Q?qdNm+B81aY7i+X4kCCkpc3JKqWpZcKDaJUJvkNLXr0VEl/KIgn5BEBMC6S5e?=
 =?us-ascii?Q?Uvv/Ys41Gyb1QH8Q5gvjsLXlDM2LjmbiIIdozv8T8opp2SHnAHNOECj36ScE?=
 =?us-ascii?Q?NN2x+hP/fmNi0NKus4WdDOC+Oz/Rsq611Cx2tpuVOVStslNeRhZ+c2E0ILoB?=
 =?us-ascii?Q?3U0QPBgFAubO1IgZldLVFujsSeldGzti/XuOyAlIn5C2JsbFQsy2BXwQFGJ5?=
 =?us-ascii?Q?4PlS+3rkC3egNDodl1DEdxMlYPoYEiI6C8bqxnG/vylX1ZzvRw/C4a9hQJ9j?=
 =?us-ascii?Q?Z+8GeSmPbhInfpjebBK+wGvBvJ6/XudkoKkAJDCgGtirifaegckosrHuvwuo?=
 =?us-ascii?Q?PSgUj7nFochPoCBJPcW/rAW4RP6CwUBh5XqGMToLy40hUHRuNtb/9i3vossa?=
 =?us-ascii?Q?M/0YqrKVTigsMTtpkoHbf4KnV3UbXn8eaL1okH8B1yWa0KuJ8KPF8HFFL8KG?=
 =?us-ascii?Q?SfJDBR8BMthsP890kGmruJOBzHy87TGrZiyZbdSQMbZjdqgYpV6KeWD8o7xN?=
 =?us-ascii?Q?Ys/By3HFodBUYJG7JV4J7rXvheSN/YrqvJ1QIPGu?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85e70c97-5df3-4d16-2d50-08dd85648a47
X-MS-Exchange-CrossTenant-AuthSource: VI2PR04MB11147.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2025 08:21:42.3570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BOOESAF/yAfxTgozrHuRKFmyV6Nu6SvN14ShaOmVUPfk3LFw+9jtDsL9CJFMK8ASvnaE6pXwLOGF0ExC1y50kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8474

From: Carlos Song <carlos.song@nxp.com>

I.MX94 and I.MX95 I3C only need two clocks and legacy I3C needs three
clocks. So add restrictions for clock and clock-names properties for
different Socs. In driver, use the clk_bulk API to handle clocks to
support different numbers of clocks more easily. Make the code cleaner
and more flexible.

---
Change for V4:
- Drop comment in yaml and add nuvoton compatible.
Change for V3:
- Remove unrelated fix in imx95.dtsi.
Change for V2:
- Fix bot found errors running 'make dt_binding_check'
- Fix warning from bot test. Use -EINVA instead of uninitialized ret in
  dev_err_probe
- Use master->fclk = master->clks[i].clk instead of devm_clk_get
  (dev, "fast_clk");

Carlos Song (3):
  dt-bindings: i3c: silvaco,i3c-master: add i.MX94 and i.MX95 I3C
  i3c: master: svc: switch to bulk clk API for flexible clock support
  arm64: dts: imx95: correct i3c node in imx95

 .../bindings/i3c/silvaco,i3c-master.yaml      | 45 +++++++++--
 arch/arm64/boot/dts/freescale/imx95.dtsi      | 10 +--
 drivers/i3c/master/svc-i3c-master.c           | 76 +++++++------------
 3 files changed, 69 insertions(+), 62 deletions(-)

-- 
2.34.1

