Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013045.outbound.protection.outlook.com [40.107.162.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B769820C47B;
	Mon, 21 Apr 2025 11:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745233425; cv=fail; b=WF9XydwE9BaQ8WwZQgOR39lV7R1P2rpjqh+CAF+MzcGoXiyRfQ5I53rkeM2Ox4JuVS1w+9v+9GrqT0j7RxaOD8UGQCV0v6Vkkn9wbWnXQM712a0gwoyVfW0jsAS1SO8gcAYhAQiC0MbfF+14xPhx6HqM3GA3CZu2c7/R8S5HW5o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745233425; c=relaxed/simple;
	bh=aO/BR/4vU7t+V1R+cTY2+pdWhu8SqgFtOiUFPjr0slc=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=YPe+dgCmOlDY4nOu2Ln9c5Cw36XWtt1u8IfOLz7uEA55RZGXKJR3dDDm5x6M6mBupFtTVzdrNKR1a8qX3CuQzW/Ol/Nwr1KhCB9/jW942iq4nwtjIaP37gGO/U1PPUbvKQu/LZ6H5yRZidEGrVd9OJkZBkDwMj1Gj1T3TIVRQFs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=DuT/9EMi; arc=fail smtp.client-ip=40.107.162.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="DuT/9EMi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JbS87oJofHGrgA0VfgOMIeAlKgoDJqODEMCbHEfAMAYumhA3jX4u3L1S+PCnusfPewsIdti1ojapWNGUlFQfLeihkWwANTuXP4vPWIdMCC5NhPxz41HPjwdza/GBnC70epZYido8x1oYB7zX2ONTfxdQ+o+pVp7tkjDE+0xgJinunzjzZTwcFOGPUEuGzy6EX31Md5RI2+L2q/XPlQW/TyhfWD5wh4gWTUCKsNgsDLNYf4BbmPwnni/GE3lTc8tt4XpBcRc7uHV/+L1iEkR7z5wHcN7mvpGJ126Y10Qe7Zj61a6VG7QAB+BFIA4j8ezYlIfVH0oCkfPOeC6bGw+Z1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aen6jFqkrHjeuWWTRJhjTwAnUIYq+BpyCEGbfppZQGs=;
 b=PHkYABgtRru358Nf9zqXO5aF7UgNKCcvcJqH4vxV+Te75RBge2XmjCpNDHFoB+xvb2/6apyeIwMl1OKZz+77U36EQk9qsTbJ9sbFqftyOjiCAPoyjufvVYKtihEgxHAjYS1zlzCvpeB0mVugSh2V4kU4j35q2adefBI+KOqZW9JZjm7dT6U0whifAPmtB0RTWZmFv2+DfKC+LRAflNSmjPVS/Ai4dN3qvs/mDHRdY3Cu6xg4jwcNzHSvAu5y3N8jQ3w/WgLc+Npjn2+f5AUkpm+PrZjdH9KF+fjAgzaCiXGDclroPtKNsYTV51TG1m36F+fbu2m4MUaK73MMZmOYcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Aen6jFqkrHjeuWWTRJhjTwAnUIYq+BpyCEGbfppZQGs=;
 b=DuT/9EMivcOBupyVChv6FnQ/EZg6wAXqcXAoqOR7cmgvzZvsCu1diG7Owwq6uUQZGyqz2Ji0bmkiC8mJm6ypodoWdw8KBnDtbJpPUv7V4J/ADX5hmMCLsm9rAZM/v/twm0sb8pMbsUkde44CL3//g1oubqGrjpOvRqPlXsZebd3CxFiRixPFQU/w64sg8Q7AzPlb14YQkbSqeVsP15Yh6Cc4kaqlS398+Fd/+5XE/1a/hS8sJY1nhSSeDpB0e3+aAFoVGG9BsYaElvZ7pvVhKatLLJIsT94t2VgH1rKJ8FckSyV+2VgbXAmjSRr4uVHeFdtHOOs9yxk7fOXtygG+Jg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14) by PA4PR04MB7854.eurprd04.prod.outlook.com
 (2603:10a6:102:c2::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Mon, 21 Apr
 2025 11:03:41 +0000
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687]) by VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687%7]) with mapi id 15.20.8655.031; Mon, 21 Apr 2025
 11:03:41 +0000
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
Subject: [PATCH V2 0/3] support different number of clocks for svc i3c controller
Date: Mon, 21 Apr 2025 19:15:10 +0800
Message-Id: <20250421111513.2651797-1-carlos.song@nxp.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-Office365-Filtering-Correlation-Id: 9fd5df66-5079-4ea7-5417-08dd80c42c9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RqJQbFJmxwZOVdBkMw0YpCCRwyRrKXebYktmtQCv2vGKlh0H9I/cxTiTKX0o?=
 =?us-ascii?Q?t0q6WXoeCl+EvjilAGb5naW8kIGwVF14wpde6HJff/qjeGZfqi3CoyT0PcCF?=
 =?us-ascii?Q?xpHY7DA7rx4OKSs5Ara82TVi7CNyTY1QuVpOXHQZVUTs9pJQTrT0E+6q8Uae?=
 =?us-ascii?Q?w7JFGXvRql2Hp1IR7Myd5gxAOrU0SZrhXeGaUxwzHnx8FHgVb8zs2F95VQy/?=
 =?us-ascii?Q?4r6y9OvoiVgZ89fxMpo1UOinwOuJghmRXfItC4DjFnCk8blGC2Ev0JzbuQF+?=
 =?us-ascii?Q?WaU/Y9r0ScoqLrqgYTNvWGn/JNBm0GpNhMEK4caPKvJhtWVd9A770GEs1bnO?=
 =?us-ascii?Q?dNxTRHHYvrK7qxvTtpTcxOF2fKOojSlRuV6yo2uyF5ZlWtKHW0uWAacjt4jp?=
 =?us-ascii?Q?2noK9hv8hd7P6OL8R2K7BAFU0n2U9STV1adwoXun/jMPuBw8TFmLNZRjxp0H?=
 =?us-ascii?Q?N5u9wQDQf/atq+JUfXe0IDfQ/eUzEJBI48YklAdxaVavX1L1LThqwbJ2sS1G?=
 =?us-ascii?Q?fC6AyhrNun0wS3q0PtVqbcRY8Ubc8McfOa2J9VULyTDhVCbBytCEyFgNrQut?=
 =?us-ascii?Q?xolbBQk/NDbzMzYWUmmLTh9qEQha4O8TP/2VWs/J6GWHn8oE/l8Tc4osRTaN?=
 =?us-ascii?Q?PDNGLsvNz1nbLJwnAYRYiFzZEMQKVSgYJlVW6sX2i/vaGVH7r/EchBiIG1dh?=
 =?us-ascii?Q?6tSyK/6SxWZxt253KqG7AoxXF0iU7Oy4xoQT8ptQ7U/smRXbN3UHGvRVs18s?=
 =?us-ascii?Q?u6jdYzYZG0zfoURiRSFXR5bnFoR+zsP0FXv5F3pgLiubG+fTVhfHeD5hP2XY?=
 =?us-ascii?Q?C8bGYYS6XR/h89N3CP+NIDS+yb+hNKlD0ZFbqLBCMeCqHP6d+tBFupX9I1zd?=
 =?us-ascii?Q?gGVfE8uxSg6pwxCfJkxFgZzOhD8kK6D0V1YxMEwTFvCPuOln06FH6EsWg3Fb?=
 =?us-ascii?Q?AAsJswW5ZILNBTaI/TeH1yDJIVG4fYrKa7Cq2SmyFi6SDIUJQa4eWpHdkRlU?=
 =?us-ascii?Q?0U7TGYmpINPuXfLk2kvBmfJjmEqyDGtzgEsZkhKgzthukZqa0Avdb/Ru0kVE?=
 =?us-ascii?Q?OCqpGd8cYPEovK98o4VtY2DjFBjCqsFxWZXkvmzno4p2YkQa/k49Kr92hiGn?=
 =?us-ascii?Q?GFw+gXncDiYGGSd91Ez71v+5iMx+dYLFaRN1GLBc3lL6pY8xv7726M9/rzN7?=
 =?us-ascii?Q?cpEv3zWJc3j/8d17pp1mr31EB1ydaGQZWgYWrb7lkbi7q+Znc/OfVVU9tQgI?=
 =?us-ascii?Q?jqnVA5G5w1kqjopPrbnSpX5ru0L+TdvVqQOS3GubCuwxmV3aXJMnzr3IBxf/?=
 =?us-ascii?Q?DXUIjOAtgjAnj8A9dyGrgWDtiy5kcZHziqrjJWzP/lNLvk1k+5RWPdQ4TUtN?=
 =?us-ascii?Q?kXu0vFHXgjkKvR53Cpyl/QmYIftdYgcxThDY+avO4ajLKHmNObGotnLmPh9C?=
 =?us-ascii?Q?1+S9BzB1pzFAlcB3U/9LDP9Yry0ZnX9tKCCfyXvuaGEatdS6i/fQ+KBlWSlK?=
 =?us-ascii?Q?iv6iQ76rZQY03Gc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2PR04MB11147.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PY9ydxkXM/UdpQUEg6sVvo92xA2hY+yCWVi09uL4t0f9Z/NjJToBK8KHVeq2?=
 =?us-ascii?Q?ujVfisRsqOq4Nb9xcYHNQLG93CUOCQYTqpAXSD1Pmncp9HK30ubv78ARu9vs?=
 =?us-ascii?Q?6L+twXHteAgbag8be1OVV7nKAeZ1KxrLC/jKkOvDNbOVH04Z7oDX51urRpDE?=
 =?us-ascii?Q?txfKAkYlP9bLlonqQg6Ab7gzDX10wQlbKAcX1gc8sFRD2k5iOxVD0tm7ar49?=
 =?us-ascii?Q?ZPHn62Kl5t9vVGxQsC0bWQA69sCPxEeRzQCSmCQcIpaf1dwIGLa4Ak4+zYS5?=
 =?us-ascii?Q?A00UoOSJEveKTy0t7OMIAfdV9osnJvlVqR632HJusGs3oPYiGIrN4f/1Frdh?=
 =?us-ascii?Q?FXTfx0qcroFdVGyQZ3uu19IuHMezBSxjqrqGHsX49NmpG3KPzsXL1zRWRinj?=
 =?us-ascii?Q?5sOAc63I1O4XtB8yIU/PXnO2s8uiPVMIfooyfwzeD92Ye2iA8Bdt6HQDFsqO?=
 =?us-ascii?Q?/9b33Olj43K2FtfJFSWUR3PnzTtf5ZKuFwBjEQoyKjglXWpfM1G9mMUGY8ZP?=
 =?us-ascii?Q?+6BMxnhkkQBembgWDICEY09GsKxJ5+qXJYjET9jZ21xu4+kinkQA/EtDIuXv?=
 =?us-ascii?Q?a41rSDxpgWkmKTVTdgTNg93scUx0es/Kze9GC17Ysl5e3QxpTwODQ1T37uf2?=
 =?us-ascii?Q?bGW/4I0zF7GDVGHi3hY7IeCSQEafudPe0wdxyjxVjafSZfN/aWYL0Qa7O1Xb?=
 =?us-ascii?Q?nLooNFMA5i+MCdqZPwzGG30Mjc7GOF01g0lwDkSBiSdIGdIFJTk+wlWLI2B0?=
 =?us-ascii?Q?EuKKAmqJQ03AELBnsrhxdDMwl0EnSfoLCQV1kXd/qo1U5dNeLlb96MghGjmb?=
 =?us-ascii?Q?93oNZE0KHCADRW3p3bZ9uM5E3YvLJQrsBD4nxqrPYwM7mty1j4FuU7V2FIIx?=
 =?us-ascii?Q?ARBFC82oSItt3E/kuVgTPXpvVbhkK8eIds8P8yUPPq5duxlQi6Ym1ZRuLglS?=
 =?us-ascii?Q?a1hGdcyjGcmh5KvcvkR73huTjwyZT4NClS+gZj/nqTAyCQIpL3FvoE9QScYm?=
 =?us-ascii?Q?0lB+aAlPmhMeIulMF05lc0HGCB3Tlsis3zVRSa8sknTguo4Dr3JkPsj3heau?=
 =?us-ascii?Q?gfk4lQlB5az5oQIhS66V5+NQWtl8La5uIGxMz122fcBSLHMApCVzxD3VBNeY?=
 =?us-ascii?Q?e2rhdkhOuckqZLVLwgy7E7JrlXMOASRtLocam6bfDBdMmtgixseWWtOZd0Yu?=
 =?us-ascii?Q?JoPJ4K1eBexflsRpP7JdqNx9agp3QjqDbN/F7DRaRd7DSYgrc79JwqVRd1ck?=
 =?us-ascii?Q?TaGSqRVxHNTO6S53ph/8r3ZN2VxfJiJJhIr2KPTZ5aiaDDhd7iWdSvW50x+8?=
 =?us-ascii?Q?9Lz1ilo2dULV9p5Iu1fyjR35A44u/7YKj+0XQGiLyHxi2WoN4wFBCfKOYjRZ?=
 =?us-ascii?Q?o1OGsc5LJYp4qMQqKeTRtdqpYztWLNNRuJl4bEHFf9HmBxyHpPHycKemfGYk?=
 =?us-ascii?Q?/Bzs6o67CNQvS+cRAG3Bew4qUkb4uvQ3PedeqjVYUz6XStnqP45vKwfNiBQG?=
 =?us-ascii?Q?+pmfFBbqpMD13W7Zs4dM8ZAO1kQWbbg9PlhIjRHVOFY2+UcnfaIW+Gu5dTBS?=
 =?us-ascii?Q?/iMT8dTcMAz2t796/7SOCwRNZP6Z7/rZK9eVECol?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fd5df66-5079-4ea7-5417-08dd80c42c9b
X-MS-Exchange-CrossTenant-AuthSource: VI2PR04MB11147.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 11:03:41.0186
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qYEiP959EcvGbyaj+VOWv9iaKXPAIuBG/ktfKPzWANItbazXBmHOB8JBgsk57INzBdttql0H57SYXYSgii3LSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7854

From: Carlos Song <carlos.song@nxp.com>

I.MX94 and I.MX95 I3C only need two clocks and legacy I3C needs three
clocks. So add restrictions for clock and clock-names properties for
different Socs. In driver, use the clk_bulk API to handle clocks to
support different numbers of clocks more easily. Make the code cleaner
and more flexible.

---
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
 arch/arm64/boot/dts/freescale/imx95.dtsi      | 12 ++-
 drivers/i3c/master/svc-i3c-master.c           | 76 +++++++------------
 3 files changed, 70 insertions(+), 63 deletions(-)

-- 
2.34.1

