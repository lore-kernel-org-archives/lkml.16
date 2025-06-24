Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11012070.outbound.protection.outlook.com [52.101.126.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39DA21DE8B2
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 03:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750735420; cv=fail; b=TbrMIsiJDK8NpZ8JNn+3klygVLX0o5kLZlKgztfb7fL5SQ8c8ZjM/ba2EeZES7cBTKPxysRqr7hmLhvlWIu5tUrlfy6I3R01T6m3/G2Jjjs+RKlTbJXvHVj7gLh1tqDUBzZTutdQV9uQNka/XUAErgZKHD1owYXJEYX6Fi3ehm8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750735420; c=relaxed/simple;
	bh=qzhKCziwVvgffCPJn8e53WyLnMJPu1K5681Pf5/zdUA=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=CZrInqoQef49scx2irgjllmVOMUNSyxVES3LSNrjjljR83pGWLl8pQl83NQAl8DkzWCf1FgLa+HZTXQ3DZDhk8/Y1D35/8mqjX3WEGndfoZsUVD642mi55tFp97rNJxkYOIol/rDCX1JizTuUPqqtSzoP2XQpYncTfcGav4Ymww=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=H78LrDXz; arc=fail smtp.client-ip=52.101.126.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="H78LrDXz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eMfu793mEqxrBOegURlL8EYA/WDdlNebAVZfush8uxlcGA4h5w+ki0mDxqSDeKFwz90YenSqZWgc/b/8umdhn4DU+37LAa77vw2ICroqL23hipTLfrF/3P35fEm0KN137QtZfQXFvT2sOxF0TGulhSIOPqRsvS0fmtv3gfP8ppXJiANIuxk7oZ9hDrOy+ZnBnFLU8Ffzg8jQKrLz+eLiTpBsixy1xIjtmttma3sKBCn1KfEr5JmuRhz93PCosiiRvF19B83LuNLX6pmzRh2DIjYp6cU14fXLTv7obbpob5L0SkiYrSnpVxduXxi9qT9ux7HdMWPf/Qnid2rokoK0sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O620oYQNBksCom8vNjMM6BZvsqvdF7Ae9NgLAZJvHr0=;
 b=amrYY/q59faIH43m6utsxOzrWE0G6N5by1zlhSJ3u2auFn8XcFndeQ+8r753WPR65L1EFa4ixivXlyjJQ3YYDf8Ef0TSCyVZrlwOAqpYuOum+KlIuFzRGgzZJQW9Y1cYxxWC/UZWDsfjMTlOZ3R7gorm9+T5VGus/qjNa6iAjZz5cOKURNOmZ1eh+/wJlhI4lpEAJA0xsGQWjVzD1MPs5LeuU4rWeknLM27ipj/Qriv4GBZ1+nyBDkJDWigvC2ixTl1SUj4qNoADlfmz4rb8ytH08MDtkCFmamttY4lc9TB2axQ4ORe7LgHpSJmlbqtrZlREWwEN6lhV7SNxt5ChMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O620oYQNBksCom8vNjMM6BZvsqvdF7Ae9NgLAZJvHr0=;
 b=H78LrDXzXg3FgsDj9lSPfyWbnC+wVJgR7Fwk9Aa2A069mPWTjF0UynszA67MOvgoYMlzIYzqWSKGA1OYlslDp+g+0iX0Gsudx7Q4igOAdn3NHO8G9TMQL5eEalNQNsKmbOw9/Fk4aeWg1yaEFadaVEvUXLP02GzcGd6+G5qwvLzflb1dtELoYdYzTayRT7JHH5qZCbB4cMVsA4tWJzdYuC5GpDgLNiMn+QrqmtynwOaGISNY65wzeSPYuUG/dcd+f0VA/DDlYOBkYm5xotRmEIbg7LmKdj8KPPSVmn4eMhPRTuIJ/Nr3w/1JiIkHhTVB/qql2PiqditDoaZRnZLvWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from KL1PR06MB6273.apcprd06.prod.outlook.com (2603:1096:820:ec::10)
 by TYZPR06MB6699.apcprd06.prod.outlook.com (2603:1096:400:45b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Tue, 24 Jun
 2025 03:23:29 +0000
Received: from KL1PR06MB6273.apcprd06.prod.outlook.com
 ([fe80::1f06:daf8:cbb3:a0be]) by KL1PR06MB6273.apcprd06.prod.outlook.com
 ([fe80::1f06:daf8:cbb3:a0be%3]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 03:23:29 +0000
From: Huan Tang <tanghuan@vivo.com>
To: srini@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Huan Tang <tanghuan@vivo.com>
Subject: [PATCH] nvmem: imx-ocotp: Use helper function devm_clk_get_enabled()
Date: Tue, 24 Jun 2025 11:23:18 +0800
Message-Id: <20250624032318.246-1-tanghuan@vivo.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0010.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::18) To KL1PR06MB6273.apcprd06.prod.outlook.com
 (2603:1096:820:ec::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR06MB6273:EE_|TYZPR06MB6699:EE_
X-MS-Office365-Filtering-Correlation-Id: 81f26b3a-e77d-4419-68ed-08ddb2ce7d2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WYPiCx+k+mjd/9aSiJwZwlI00i082+N5XrqeABNbxqdDsYRYuLrsGZa7dAUj?=
 =?us-ascii?Q?tXz1LGmJTahpnMPGod4M2rC4RxCK5bzvfcXkTcSga0cOb7+vwLMsD+0YFiQH?=
 =?us-ascii?Q?FyuT6eEK7AYt/ANZXJA0g6kPT2x+FC1cJp/EQ9Vpcs3urRHBrvwAxi4s5K6u?=
 =?us-ascii?Q?2hANGgurq4/iurecin3FHEU11cBGg+jtSIBGtZhqrt9BaIuHqrr1eix29zLy?=
 =?us-ascii?Q?VNYevLUj/PaWjdwdxJQeGYEN8QXn6nJUSGsz5yy6pXjyMxvtEw1b3F6OJUMs?=
 =?us-ascii?Q?IWRjgiZ/DbfpcSbcJYg/ULizUhl1hBLTJjsM+e2+6Apg44O8MvJEoVdgkWn4?=
 =?us-ascii?Q?JYMFYdDeQZ6dcd0twNIsD5bQtS2x89/EJ48ld7R3eL70Znb4PnTj/ySlgg7X?=
 =?us-ascii?Q?9JQJPJWZwOuRFtXJWpQ3weCoZcIPfGGo6xKp1vxQA4gW8SQrT67AnARoxfF/?=
 =?us-ascii?Q?zQogxDmUWvRiuN+Eo2SKvNyQe3cIseG2dXyD96Y6/BnzMPUx8cT5/CFpHZJI?=
 =?us-ascii?Q?j6rXsDwanUrF+7ba/3B/WHpF6ok+OKZN2v0WezBa1tnyJAmLoCfO92nHrxsK?=
 =?us-ascii?Q?E9Efpr/Pemk3Hh59etZRNpluA49xK7tZ+Slg7Lbr3iXOutoKhVmr8h64PYGf?=
 =?us-ascii?Q?hMDsfmWKQevDPYkRzCFRhyGrjuLy39yrg+9kUV9xwn1LJYCqUjZdeKHoNN1J?=
 =?us-ascii?Q?sFMNT8LNYEj4RNIZ7jGBOTYfRUHoDUh4jG6a1wbzv8X+tgdgwjESCbTRMmzo?=
 =?us-ascii?Q?9GshIorB/hE0lKzigmXavUIiGPaD4Xlzfd75OSTxDw7JUYgQSaZgQC/22y/2?=
 =?us-ascii?Q?ArOtKEWJGJkyNKiTo3CnMXmike4WEJBi3VjJJK1YBGHaW32qyLSm+GlY0fFS?=
 =?us-ascii?Q?G96WugFA2qxnpY4TZFPOmEa2xml/KGFcaWh8SsE6ToRaFYjQS+YSj3KqiDkf?=
 =?us-ascii?Q?1aIH6IRqKSxDKe4LVPcAgKcTNoV5fP86aygZ+WnDlNKexZ6K/8vxidW/+GC+?=
 =?us-ascii?Q?G/r1+8az147tg8y1Ie79ky7d5PnDx92tpIgxpY20jtzuVDU65xhi9Eyoudpx?=
 =?us-ascii?Q?YreYCDWtevIgOS+lPmgzekMeVIfmE91DNI0ZLqE5va4WWC45UQorqL5sCAC7?=
 =?us-ascii?Q?wu/fYHcqm8RZ7PWvFOOb59IK/pdgc8AhdfjzZXjRB3QUvt2ODN8hk47m093s?=
 =?us-ascii?Q?qx3fzxYySv2Rql81TaiGJHLMFiOI6StqKNcQBzYM2u1ZbsEDckPvKk4rDees?=
 =?us-ascii?Q?ZPteBXjPi5YoXYJEad3IFXdTurpVtsC2z69PYZgOsQejq13EJV5lfdrUFBpc?=
 =?us-ascii?Q?uIFlX+POyn/EVlrVv5p1NMheMK78FH6bSa4DDZSWJCnWARJvVPLrLgTCLDUz?=
 =?us-ascii?Q?k4vqj0DoPxUzLUgR+IgEwup3bVuPtiiNUzcZpvAEnyGM7pp9yDskrAF+lyAR?=
 =?us-ascii?Q?SvfiydW9GSlJM+McGHy4SNikPL6682EOpzKB5hcmIxHREFDQZG+89Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR06MB6273.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?t4Qs96wcbZha0ESnZyTynO2ArKfLtHTct7YbGHnNA72IsWuAwRki86PawFxN?=
 =?us-ascii?Q?8QKn2QEgPr3eM+W3XbsRyNMoDkNBTbUYgscS94AJoLDAGt/bYkCB9mzi5GDP?=
 =?us-ascii?Q?L7m4yx5hGJpzVB4ECM0Qry9DkJQ+gumHsMgHPRQXyuvUv4Lwb9rbCc3iFX1F?=
 =?us-ascii?Q?zIe1rCpCwBk+YmPobwC6PAJhyHNefayI46MFNyhFlEkNbHefN78B6CuRkr6u?=
 =?us-ascii?Q?swZD7JfQEB09orhsRMUBFokaTOqZOCSy2FqPksvGm7QslL3t9wfIEcINlXAH?=
 =?us-ascii?Q?SrNfPMgZttuFjfePUFSO4vPOoiSXhPE3Q/TwWkr1dE5IrDJxscz9qQCCIPhF?=
 =?us-ascii?Q?FnzMjcXVq0xFsNcWwtrP8M8BzymR0SaVVFVXYOT2PahD+hdc8c+P4GwvfBR6?=
 =?us-ascii?Q?qe3P/DstdJhYYX3ok4t7P2Bhkr2bRILlDmo6UmENvy4LrYGjVjY0UTAFwz93?=
 =?us-ascii?Q?GUbJueGt7hATM714LlXxet4MrGwELin4mnBHcv+RqbvHfcSeo/xixqViwaND?=
 =?us-ascii?Q?XoY5RvTr62PHeiiElHrxyEcVAkQxagDlExg7nksAnGSQwBrJpaKH8MHNbWyb?=
 =?us-ascii?Q?Q1OpelR3sCkjIuhEf55updm7tm5JecfZNkIWa84eL4BIt6GYp01TVqfiNXjk?=
 =?us-ascii?Q?nF8pwAN1hkIUoNjkGhraGIC6IGIzhy/hte05yruDyO/ea8NAhboN94Z4vrll?=
 =?us-ascii?Q?ZJXN0olGi8pHGWF7V8tvjJwtyVkNsTTprLSPNEJvaMwFFibR0skbgwHjdRyx?=
 =?us-ascii?Q?COmCmmY3dmapAgOpfz89BkzJx3jiQGbKP+cdJji72+JIDK5Lh4Rd7C/Dz2u1?=
 =?us-ascii?Q?zAn8qa7+opjOvyX6o2I0cDw3awTuzFywLNle8PA/uKr5V974egBDdg8MUq+e?=
 =?us-ascii?Q?6yzNoqXWgt75JX7JaLC6gGcKhiiNfnPH7AkG/vu4KkDiwb+99YT8YDBYCyNI?=
 =?us-ascii?Q?g1k79ROVgNjeXa9iVKCwWrx4GMKOEKwnEJSftG+OR8FQeP08wSs1dsDRux9d?=
 =?us-ascii?Q?OCLRFh/HbbmXId8baqH34ln0QhPU58J2PdhAlN4TtoSaPjdeO9ithrMYTIX+?=
 =?us-ascii?Q?lC0jVbzpmNdvmYohU8FT7O76VBWIQRAfdI7EGWxZyOzpK8EIpR/BNGYdZmeu?=
 =?us-ascii?Q?1MvkH6+DZMEMS7gkedCtX9lNOhgBu40us5JDZrYTrJQvtjesOpoScDZenPAD?=
 =?us-ascii?Q?c9mjH4qqpqMQxomUYuygYFMeeXZkGw82I7xumsmMaKFnrqPhO2oPEGPiP+MV?=
 =?us-ascii?Q?V+aQmn3cF//aLk/LdW7LJqvAOfpHCJXoxXr4YBe7KmPvviTuRJnoA7LJFA7D?=
 =?us-ascii?Q?opfL9PtEnEYBxT8pOxqkRsq+JCajEKWFNCC7oxNI814dG8Obf9s++XnfepwN?=
 =?us-ascii?Q?lw4ipxr3hV2dzLMSr7r1C/iJJAmiQVX8XmNUoB+RKliJtJaa2CM/eOYbS0a1?=
 =?us-ascii?Q?B25D6iv4OGJwoHIclz0gNdGPg80SBViYYE+H8VstPg4Mvjd1RbCE0qDHpK/4?=
 =?us-ascii?Q?gpI6dxz9qu3YoUkQNFDIZHoOwQIlhHGw3xMvrjiZgMRueZIZMQZCNP/0qU7M?=
 =?us-ascii?Q?nQUqSn0+4+OvgIm6paA9jvVddbmVo2BdC6+oDnk9?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81f26b3a-e77d-4419-68ed-08ddb2ce7d2a
X-MS-Exchange-CrossTenant-AuthSource: KL1PR06MB6273.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 03:23:29.3090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lSAZex+s3tS1F+Pl5GOvS8xgZk4KLzzsJwk77+7ZMYlOcDin1ff0plOV53Lix05ZrRIHKcUlKz8HO0n1tN7CuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6699

Use devm_clk_get_enabled() helper to simplify code.

Signed-off-by: Huan Tang <tanghuan@vivo.com>
---
 drivers/nvmem/imx-ocotp.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/nvmem/imx-ocotp.c b/drivers/nvmem/imx-ocotp.c
index 79dd4fda0329..ce5970ba4033 100644
--- a/drivers/nvmem/imx-ocotp.c
+++ b/drivers/nvmem/imx-ocotp.c
@@ -605,7 +605,7 @@ static int imx_ocotp_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->base))
 		return PTR_ERR(priv->base);
 
-	priv->clk = devm_clk_get(dev, NULL);
+	priv->clk = devm_clk_get_enabled(dev, NULL);
 	if (IS_ERR(priv->clk))
 		return PTR_ERR(priv->clk);
 
@@ -618,7 +618,6 @@ static int imx_ocotp_probe(struct platform_device *pdev)
 
 	priv->config = &imx_ocotp_nvmem_config;
 
-	clk_prepare_enable(priv->clk);
 	imx_ocotp_clr_err_if_set(priv);
 	clk_disable_unprepare(priv->clk);
 
-- 
2.48.1

