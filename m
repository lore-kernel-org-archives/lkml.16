Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11013028.outbound.protection.outlook.com [40.107.44.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF872556E
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 12:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750251021; cv=fail; b=Kc7LpC31X1wFPoAdTtbOdlpNXGJcl06RINjc59+ZJx4dQTsoxPCf6myN/akfd7xCLwGZ473viEqUJsB21SKr7Vs5AJ240uf+mRlzU2JHwb4dTkfVjG2ewLLzd4yGlIPNy7fzID1JuaurzcFqVnangTLw4e6TzsW38s2nHs2v0ag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750251021; c=relaxed/simple;
	bh=Jm3iuwKIKYSkQaA5zjAutt9OzS7VpQpA7IEoy6TU968=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=sVlR+wK96O/mtQTQgGfhfX3gOF+N0FdPPiCcTeK2ZTb/yLTMIWNTbAnd1x7Y2oN7HtKUWHSblXpnj04WMhrMUCz2q1wXadA/IkhBVSEJKHr5WsqryeuDc976mInuyIWR66TNNk3b3ZA4P3LK7nccVVHmNVk99VTJ82AOj7HN1Rg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=afUsIYfT; arc=fail smtp.client-ip=40.107.44.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="afUsIYfT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lvfqPTRaYLRGwSHAcISPBiJZXVa+Ak4psNqQVJ+72ip0ny/Jv4D7HZr7nPtuXhSDHjMcrRFJqhzQScSezDdLm1A5NSLKzsI6TP5gBb+eukqVMhleKl2RLY4/MoOojO4tJECE8NUxlxC1WWlmkrkhCt1sxGOYNpN7bBWviauKft6+ObzwpNMWmhv2yUdLExjdIom+6Ch71UhNJQkFogD+eqyHPJ/GmxolNv1NM0bawaSvmfGTBENoeeSUmzdB3A1FTzL3Xo/2cBtpseP9OBmQghUlLXfjs4DKj2nUYq7DNQiiFvuHe/r91lDJDjQDeiBuUiI4cgkkaY3ept/fXZsFrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6gBonyWoUuqMSDbOGXlMcpkvjw+W9C7Xap6HW+qC+rY=;
 b=cJClwGjvXrDYW+H67HfpLYy8Y4ELaMAKtG39mhCJBUfWMK1b0zQZ/uiQdRI26G+hmNhAzit6bPe5dD/yMjIhBv/eEtPy/7MmfcAlBT5xQqGDDPTJbXoto8ih45mDyCOWfNudurdPFdWRGZHFMs62TCEVRlOvEm1mYvKGXnyqs+PTG94q4Jgl2hYklzLhQKYFskY5G1rf+Py6izSH66xuS3tuNQT1OLnxC1VV9FlLDpmxlrcErq6ZFpPwBbdq2NbZimxpYg+4uuh0Tme6AY9yKAKyOrkHSByzEV6ep/hoIi4nuaKXoW07BvcjZoTH2oksAGFW4uqUHKG94w3vZ+nUXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6gBonyWoUuqMSDbOGXlMcpkvjw+W9C7Xap6HW+qC+rY=;
 b=afUsIYfTDiLqD7Kt7sSFSvh3hoppdHSnx3ucKigj5rl/ps+3uMh6jKtaNXkxS2ojD10oWfveaUTd2A8P0iWSwpZ0P1FBOEPlChaGF14q6wlQYZnAh7i7jp1pUEyyDQBCJIcSPh8SiJ0kC7gwrwlDjnOwlZt7zOT99MphAc1mHqe+W9wgbKlgbW8vQd98jUbEwmgR/ZFCOu7vOZ9oqPV2AJrEIPuZ5SEgJLc0O4WK3C0os+nf7B6QjxEEoZDoFjUc+9+V0SvGAd7IIf3i/td6PERgP1UXZv/wj/20/q+TExzLNZe+JZx/UViMxesWixNSI9dE7rKSLSef+Q5Wq8dbUw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB5026.apcprd06.prod.outlook.com (2603:1096:400:1ca::9)
 by SEYPR06MB5891.apcprd06.prod.outlook.com (2603:1096:101:d4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Wed, 18 Jun
 2025 12:50:13 +0000
Received: from TYZPR06MB5026.apcprd06.prod.outlook.com
 ([fe80::9043:7fc:2b52:535d]) by TYZPR06MB5026.apcprd06.prod.outlook.com
 ([fe80::9043:7fc:2b52:535d%5]) with mapi id 15.20.8835.027; Wed, 18 Jun 2025
 12:50:13 +0000
From: Yuesong Li <liyuesong@vivo.com>
To: Brian Norris <computersforpeace@gmail.com>,
	Kamal Dasu <kamal.dasu@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Yuesong Li <liyuesong@vivo.com>
Subject: [PATCH v1] mtd: nand: brcmnand: replace manual string choices with standard helpers
Date: Wed, 18 Jun 2025 20:49:47 +0800
Message-Id: <20250618124948.2822345-1-liyuesong@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0124.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::28) To TYZPR06MB5026.apcprd06.prod.outlook.com
 (2603:1096:400:1ca::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB5026:EE_|SEYPR06MB5891:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b90c59c-6aff-4f05-5941-08ddae66aa8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dfsDgt4q7heBcVDkZcQtxI23hPhET8GY3tVpsAAJJkMWfZC3YyPn6jkoOnwm?=
 =?us-ascii?Q?N8Wtyh0vgCB6ou3YRnS6fbl4758bwgw/WycbP4KtLc+0XjldPzXl78aLEnp4?=
 =?us-ascii?Q?8aDq+NZvjsFYqLPWotMiGxhKs9zmT/eIUi8l/UxlRtmfLnkQMMwQYL1vM2HQ?=
 =?us-ascii?Q?U46ePxtLfoadPwqohkobvQ94oDxyo4azFo8w3ovtEEYuWcZb9uCriT5S/1Yw?=
 =?us-ascii?Q?YFyd9hVaq3YSqiP3iPT1h3Q0Qxfm1k8dS+d7ZN5kaI4Bwidjmekr6wJLvKf7?=
 =?us-ascii?Q?ReSZ6Z2T/se+BRzWmKI/h3AqztTtldAJgoZgtp6fRmoA/x2rbsCGYHhuUjt5?=
 =?us-ascii?Q?3Kb7mDeHPdD/W5vR4IESaZKzXirGGdTUilLDDUb1pghHtvXk8KYrul8lwLwc?=
 =?us-ascii?Q?N+gGYqV8mrbdsQBEPIYjzXFXqKYMPnp5jPSR2ukjAmZwmtqV1gfSXpsGECh+?=
 =?us-ascii?Q?VzPT+kRDs/4yx/6Oaw6V2cYrPO/wihlM0GDa2LAeZlUS3ClnktQ8vPJCENVn?=
 =?us-ascii?Q?uIlO2SSV5+QXgC+1IYbm/9XSexwT7Ou75E1BrSHkkfUAKCj7x313vY4RAoKi?=
 =?us-ascii?Q?FUrxtkpRVXynSwCPYGgQMcSa47WqAgcga1kg59m8rdjhtNbcm/CXr7el9IlO?=
 =?us-ascii?Q?TeAx4LYb1o7sdWAwDDopl4VzsU30OAnE8BxuY/IC93SCRqmhkClJmvCesbXd?=
 =?us-ascii?Q?n2/bQeptmOqgBGysWeAql+YgRLmCxqGFvSHWA+ILNjGO2bvi2yIxgUllM6O3?=
 =?us-ascii?Q?Adcr0KaYqVd7XdkJ0E0lEhyx+HtPGoH7dRLbuCAEvH9lXJWYJpGgVm4LDKQo?=
 =?us-ascii?Q?g2fzLbBsBhxN3Kv6pviK9Roi5uvbDRFpBXG/NNaLOPSj5QpFbN+bpkf3DPaA?=
 =?us-ascii?Q?h3ERnrMuzTV5j9gsWcdqvB+kphO9NMKm+k6VTfsiDTovCLcHssKhsdxNAYN/?=
 =?us-ascii?Q?rfH4B0tdmrMFcGTRXtjxG8539cFjMcPrt1j2gUjnmtkgBK66Vvp3Yh7f4wXA?=
 =?us-ascii?Q?mUBvLoURDFxDAAUyOmRHBkwGsYjaNcKVcr4cma3vFnWIlj7QxSEkHXVfVTFs?=
 =?us-ascii?Q?GMOQEgXjw0NBoSc5OKmW4j7eLMXVNynsKE/lqhiqFkZ1TefH6/KUjh5H5zpO?=
 =?us-ascii?Q?wfKGSUIRzAlPJ7+b5XMBpC8stnIUfz6dfYr6ngblDtd0d8dZkS00M7Q/eoF9?=
 =?us-ascii?Q?gnEdtDI052NuupJTIKe+WmKP2aMhF9li/MFsLXJULO+Y7gHGmt+KwHfBul0O?=
 =?us-ascii?Q?eP9wc2+NYbDpp0/ERldfQU5CUQRHb6aRQDepBSoojazzDEoyOhqsBGD7BFBV?=
 =?us-ascii?Q?GB/QQXUoq+1dXMVCKlMKzMbrUcNHZzN/36JbITBL3sybnntMZ52ujXxoqG3Q?=
 =?us-ascii?Q?nzFH5oMBZR9DMsIvKPD/me1qLLQr6m+qrZGY7ybB7BKJX3mJKxXxSoUNmIci?=
 =?us-ascii?Q?Jca5TTZsuMQuctPPzLrnmfw6kkA+ZAiZXThpo2aKzJwatghg5EDGsA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB5026.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Eq5dDZxDzuDQya9lGiaU0Zl0nZmSkUgrNefWtHCRLlPWg/ZqiCWrhBbiAMow?=
 =?us-ascii?Q?NikJp9l7yjxglm9Y/KgC+yVp4OZ4wIRdGtIfwZpDZk7O3h5kAvFjGTCRXXLA?=
 =?us-ascii?Q?CJGnaREUXORMl0vrb6t/rRdFCldyaasSAsjDR6IqcS7aXl2Xea3Ax54988of?=
 =?us-ascii?Q?FATlrnPPPNw9/93+Ks43OqUuCflnMePE4ZjAix/oki3Iy+5Jz1tY6QMJ8Fw1?=
 =?us-ascii?Q?1A5x56eo2HTFBxqMcHgxokmMlaxT8X0gDlL1wtqIPa4UXZJAtI+xMCOVHtOQ?=
 =?us-ascii?Q?brEYwI/WUcnLBNOXQ+TDuDammKAS5+kygl1E88gWaGBKypl/ns6bT78JCHt5?=
 =?us-ascii?Q?qy162xDl0m1PmkhtN7Mu+4L2npAIBbT0geVNq8iHGmX1t3ydT2BhXCCkj7Mt?=
 =?us-ascii?Q?dsSoCIPWaPFCETH2iW4o0PfJxHh369KNPymWYHAM1o3Nqhpcj5fYCip/Zbhy?=
 =?us-ascii?Q?Gq4YUiAf3o9ugBpj/x785SYp1NRKYO/48satkWMmK1SbGeKA28TgPUVr5Xsg?=
 =?us-ascii?Q?ChOjeYVNJI7Rgr7cOp82mZTm9I26W8xlErWcQTvLk9KdzdJ5W77l0PKz9FTy?=
 =?us-ascii?Q?Lrf4l3/CdZNXA/NS8cF0tmjYfWq/97a+JAYQGtltG+ST4SSoh0MkKgTQxU0/?=
 =?us-ascii?Q?kt7FXOJ0VBvNkPoHm4pywuolFNnjwWYcwuxU7s/0k8z6z9FVad5cHpGyXe3C?=
 =?us-ascii?Q?9qUqajq+Hwl3dYNtlfGceBdeVw0kntY0hsLhWfNZzmVVuE8Orank78fk4Vxy?=
 =?us-ascii?Q?X8crEkpULznXL+2CdHoPvkNMBt+sRvCcoIWqxUwncNqAdVJOckm4b7ad5vP7?=
 =?us-ascii?Q?gco8X46GhPjGRflsInFcyJgsEMmOKxp8g6VvEjm+m5AjReqbFS7IiSsqPfmD?=
 =?us-ascii?Q?DUUnrsgbfR6ItAg+oQK3Nj3UxhznxbeIwI2RjFqw4cXOP8miwf4CxfdpZzip?=
 =?us-ascii?Q?mQ5ecB4em4TpmSlIVbxKuKgicO6Jlx0hTpyl+OxEN8jmr8rBHYCs0wdoiB8C?=
 =?us-ascii?Q?miCh16TOLqa7dLs7BTH6bOwXD3hlreNkjCzkH6FH3FsTn4RrwrO1wEhaWQjE?=
 =?us-ascii?Q?3J+NKxqPkVvL9QNvSInt4q1DK6CEd062kl5tY9H/BOsw0rteCPpkXXiphYxu?=
 =?us-ascii?Q?it2UUKga0Ia8tO2qxFos5Oj5aWWSnjn3PaHYPGQmtvz2o9CiBq25sfSPVZG4?=
 =?us-ascii?Q?gsGcgF/TcIn8dpgRYmTEdLN4PLD4Wygr87ddkrLONUW764fjPl6DVZG1dbIt?=
 =?us-ascii?Q?sIASWT/i2l9Aa3CHfPURPFkkVDIYRi6JMmmIxBXEKtgts6Dc3vo1KhuKAWea?=
 =?us-ascii?Q?IW+u5mQF+FuYgwTrqY2DpFzEkklq8vEWSSjiFFqhyrvG5ZQ9utTtjXHSUbuc?=
 =?us-ascii?Q?FQeeeXB19GUCGbGymNMZh7mKsjvvHsPnAm2yi/5ltiH/mD459570+GKGFvQg?=
 =?us-ascii?Q?Wyxtl12q9aO7yvojlEdqnXwnxaaZIjvzixPxJEs61q+/HcXos2UlON8pZGdG?=
 =?us-ascii?Q?HIu92WmYmbHdqWMDFF6vVozuiKck5ghsg62xpuQ/zXBgdJH52A9wlfONOKuE?=
 =?us-ascii?Q?AC6l+sZVF0CFb0cHKsuhqz7XEmBa16/3daPP2l/V?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b90c59c-6aff-4f05-5941-08ddae66aa8c
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5026.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 12:50:12.9842
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fyslm2BJ2dQho6QxV2GnYS9KTV0pvpT7qMagxkodeAyvI7b5pZVACjtA/+4CEPMsO0xRuDzgVI14ip+vb5l3kQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5891

Use kernel provided standard helper function to replace hard-coded
strings

Signed-off-by: Yuesong Li <liyuesong@vivo.com>
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index 62bdda3be92f..dc836b141024 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -29,6 +29,7 @@
 #include <linux/static_key.h>
 #include <linux/list.h>
 #include <linux/log2.h>
+#include <linux/string_choices.h>
 
 #include "brcmnand.h"
 
@@ -1462,7 +1463,7 @@ static void brcmnand_wp(struct mtd_info *mtd, int wp)
 		int ret;
 
 		if (old_wp != wp) {
-			dev_dbg(ctrl->dev, "WP %s\n", wp ? "on" : "off");
+			dev_dbg(ctrl->dev, "WP %s\n", str_on_off(wp));
 			old_wp = wp;
 		}
 
@@ -1492,7 +1493,7 @@ static void brcmnand_wp(struct mtd_info *mtd, int wp)
 		if (ret)
 			dev_err_ratelimited(&host->pdev->dev,
 					    "nand #WP expected %s\n",
-					    wp ? "on" : "off");
+					    str_on_off(wp));
 	}
 }
 
@@ -1869,8 +1870,8 @@ static int brcmnand_edu_trans(struct brcmnand_host *host, u64 addr, u32 *buf,
 	unsigned int trans = len >> FC_SHIFT;
 	dma_addr_t pa;
 
-	dev_dbg(ctrl->dev, "EDU %s %p:%p\n", ((edu_cmd == EDU_CMD_READ) ?
-					      "read" : "write"), buf, oob);
+	dev_dbg(ctrl->dev, "EDU %s %p:%p\n",
+		str_read_write(edu_cmd == EDU_CMD_READ), buf, oob);
 
 	pa = dma_map_single(ctrl->dev, buf, len, dir);
 	if (dma_mapping_error(ctrl->dev, pa)) {
-- 
2.34.1

