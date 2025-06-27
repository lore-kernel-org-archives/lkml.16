Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022114.outbound.protection.outlook.com [52.101.66.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470681C5496
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 19:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751052992; cv=fail; b=YwSJXPvbIYR7jGE/OCmAp0W8StHXZY54aKqMZrmVm4q/UEjEqRPmtUJESVF3kKp5GwqqBbeh2JE/2y4QXggis9ywb5jGyG1mZPQSTyLrxwsfjcd76K0O+4s4eFd4m2D7EgHu9DtzR4C5IibWS/oGpfahJz3Vwpjjwi13SOCIicU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751052992; c=relaxed/simple;
	bh=HvWVHXXjN1F64+YacFwfHg3KwRc/Zd8qXpNxqwKGzzk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=b8SeEQKyGIBlL9qGqX6G+QCDKbhxcB4+HFNQXHJIAdLpa9Vr9Ra1NKaJC09YwhnQ8vlgL1/iZ6Ecrg6hU0NETdkGbfkZJ3eorewiTIgktzeUqDYOFE/N+Tmf+WYOwDskxoftX3+BYn5y3b1rWizZM9iR8aamyHTxFGvuVekz4Ag=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sesame.org.jo; spf=pass smtp.mailfrom=sesame.org.jo; dkim=pass (1024-bit key) header.d=sesame.org.jo header.i=@sesame.org.jo header.b=SxtqOLJ5; arc=fail smtp.client-ip=52.101.66.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sesame.org.jo
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sesame.org.jo
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sesame.org.jo header.i=@sesame.org.jo header.b="SxtqOLJ5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l7TcD7Ark9IqHCEFHDfDvvJbzlg3d+6WqrDgGvk0xuQrXiPwemiQ35CS8S1PAMomsnssEmB+A4GBwuXbtqfvmaZ4w8I2jpRUNu4r0MaSAMxziGN6m4TIPPHy8u4nyW6YFBezWy86anfOon4mA4jOOucOgVmh2RU/nVUkcLOydWqzQ5Qvl6McwGmwB9fzVN416pE6NWv/ShyVaOc4KO8I0I7fSmhs2hOk9SfUa+jRSuCYpuJC2pwqT+MjJ0vk5JRhcaCj9sUH+BP+JerQ6u1zIEg2HORfJct9R2vviPwumPLSCNa1bYbayhmLrhNdwzRhalXXRypGpTqHNgkDtGoSgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tgZAwqWDakGrornFTk6XKwUteN61VEw6SWRRvSD+XwU=;
 b=JlYUL+HRoIsQl7IuenrrFZEtHC52t3LHROEC0Hml7qZqTsiYW84d2tq9PJFHuPthQH5P95Pd5WU00WfqmzhXNv8G0WR43W8D5LIPlOgU/+sM+qke7k6VsDr/qMCVyM5F/wGAoqAYtqLSyu9a2D3/o5n+zvjz9893xzZ8NxJ2a0Y+lww9pco714M2wEFjDFPRaUi9tfiFhjkg7mIMChlXyHiel2H3QZz1/zw7qInz7EtkgMw449JihyoL3F44JItSoT7oN5dyasfMMzKWaC7YPG/lsx1yQxjAhsz6M2fUHk9XyGmqpf6gzwRnhxvzwEfPASM0voaEUdaDU/lkpvkB1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 80.90.171.68) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=sesame.org.jo;
 dmarc=bestguesspass action=none header.from=sesame.org.jo; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sesame.org.jo;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tgZAwqWDakGrornFTk6XKwUteN61VEw6SWRRvSD+XwU=;
 b=SxtqOLJ59RLMaAdCL+7n32wYfm3JNvvRXHwBt6LT/wBX/c7fxzRFMYxj5PKwfop9F8TfuWug0Q5dqwZbcNkFbY0h7SIVT4OZ/y5gJAqU/WA2inEBbJUhGeQJ5Lu/k1wq/+38p3DI9HtFsUp2RQYmT+A33AGQ3aLXy+4ZZYPTPxo=
Received: from PAZP264CA0158.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f9::18)
 by AS2PR08MB8903.eurprd08.prod.outlook.com (2603:10a6:20b:5f7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.24; Fri, 27 Jun
 2025 19:36:27 +0000
Received: from AMS0EPF0000019D.eurprd05.prod.outlook.com
 (2603:10a6:102:1f9:cafe::80) by PAZP264CA0158.outlook.office365.com
 (2603:10a6:102:1f9::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.23 via Frontend Transport; Fri,
 27 Jun 2025 19:36:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 80.90.171.68)
 smtp.mailfrom=sesame.org.jo; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=sesame.org.jo;
Received-SPF: Pass (protection.outlook.com: domain of sesame.org.jo designates
 80.90.171.68 as permitted sender) receiver=protection.outlook.com;
 client-ip=80.90.171.68; helo=SESAME-SMTP.SESAME.LOCAL; pr=C
Received: from SESAME-SMTP.SESAME.LOCAL (80.90.171.68) by
 AMS0EPF0000019D.mail.protection.outlook.com (10.167.16.249) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.14 via Frontend Transport; Fri, 27 Jun 2025 19:36:26 +0000
Received: from mail.sesame.org.jo ([10.1.100.13]) by SESAME-SMTP.SESAME.LOCAL with Microsoft SMTPSVC(10.0.14393.4169);
	 Fri, 27 Jun 2025 22:36:42 +0300
From: Abdalla Al-Dalleh <abdalla.ahmad@sesame.org.jo>
To: Dave Penkler <dpenkler@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Rubin <matchstick@neverthere.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	=?UTF-8?q?Paul=20Retourn=C3=A9?= <paul.retourne@orange.fr>,
	Abdalla Al-Dalleh <abdalla.ahmad@sesame.org.jo>,
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drivers: staging: gpib: minor fixes for some C macros.
Date: Fri, 27 Jun 2025 22:36:13 +0300
Message-ID: <20250627193613.552193-1-abdalla.ahmad@sesame.org.jo>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 27 Jun 2025 19:36:42.0037 (UTC) FILETIME=[CEEFE650:01DBE79A]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF0000019D:EE_|AS2PR08MB8903:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: fe959d39-cdbc-4a13-bd31-08ddb5b1e87e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013|41320700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7Px2HBr5pMe67RxOy38tWNOwlGDQBtDLFQGtsNgW6qw5O37f6nYH46ecaD/a?=
 =?us-ascii?Q?7ttobxgfH0m4Kpns4Q75tceEx4on7UbnWdxO7H+lBqLjJAGAikus5jBxBHet?=
 =?us-ascii?Q?+kjKX/ebHt7znQMeCO0edoIpjQBuzkAx6fOd4/lhXY87ZzjtBHIBfSM4aVEv?=
 =?us-ascii?Q?nHR2QBLxVfn/V2vpZNU5gqWES9e7I26pZWKv4fGt4n4CtbWyqC5GoVYmw0WS?=
 =?us-ascii?Q?QNAow9/CMD/dqJSPFdTynbbtu/BA6HXK4xvFis8ZqHp03qgc9+sN6pBWEpM6?=
 =?us-ascii?Q?FpHKWOZI1LsvtBMa0PfY0geHuyVQIOOJ9ODcbNLoF6iN76HaFEdO7Zh/I9MO?=
 =?us-ascii?Q?NofFgarjmjlTO6jqEO9ndEnazToZqcNIabU7ifEpY9j6GTyOxnjM57fDcQgc?=
 =?us-ascii?Q?ZCoLOc50g/PcpA/mkL/vKupJVAl2uut7Bka/IqXfxsg1ehfAnRKbGkvw+CCw?=
 =?us-ascii?Q?1l2KZKxlGzkiStcWimRl/ag8N6dcLPiOJNosdHjtszzIL/KyRT4HEY9W76AM?=
 =?us-ascii?Q?N2tr0/TFv+6CbfPfbD/YdrCOCjjcg3NCk8ZDzbhePNGyW5+WYXf4ZP+kGbmp?=
 =?us-ascii?Q?NNNGcf0cyOMMjfCAaLpmwmD+WP0oOtgRN1vYE/g83jAdvQYAiCG6oAI10w5K?=
 =?us-ascii?Q?QR/JEPHD0K56IHYMZuVQI8vLChBv+xQ8P1Cx0TNoJPsatgBOUDy3jRlhFGAf?=
 =?us-ascii?Q?2cqmKaZVsFFAlekc43PuMcotEy5iOptviOMuoP5UoRftjOna1Y9hDy6AnA6v?=
 =?us-ascii?Q?hpAaDLWavr+Blcp/57uhC0eNA7D7GffsnFJuUz5fMfZazu5GccxRp2Gwo2KM?=
 =?us-ascii?Q?iypkVnoz7Q7S032Dy+hvWZ+BVFNuCiod/rW29Vi3LdRI0EIaGavnW63krF6e?=
 =?us-ascii?Q?ub1rsPJATerdzK6aM255sn9PHXEizQ/QgnuzGLCFBuTPT15Jy/2wX+zP7DDZ?=
 =?us-ascii?Q?FQGiS5sYzKj2S7GUVk57gaQEaHUqMNwk22mKxAcxp4pTV+jqWkwG7wKcFqp3?=
 =?us-ascii?Q?KQ+x3QbxfqwFAbcrYNk4tAAoILm28HM04pHkHW4vMxN3fDf2SOkSQrRjz0rG?=
 =?us-ascii?Q?3J4UgsGeMzLJDG2pHn6v4QghZZ+MMOMbByX0n6Rd7afWLqT04kVi5eoc7W7j?=
 =?us-ascii?Q?cUgiUHAtlkTYIjQOxiE6WPt8sRdBF1sntuTBLrKxjPHZe/n/sU+JrltLsAuT?=
 =?us-ascii?Q?wmAkBBBN5cz156BofvUzG7BDlcgk0fQN1Mvq2nSsdlzOpXTHYUz+XVQEoD4s?=
 =?us-ascii?Q?T55qC7muimmQteSdejlh1y4VVTApSPsvNlkN8v6mr+cZNzTBlqQwOuGUvVdq?=
 =?us-ascii?Q?i6jfvPAnY/5A+j1zMY5dgNb5dwqdhouehyPEjSzA77PuxxKbWkrnR1LNJAbl?=
 =?us-ascii?Q?NIT9kVLK7j6nXKVgSDu2jHy/+aNM/ahxQXr/TsCjhCqDRNM114+mK9iDiwsf?=
 =?us-ascii?Q?5b81NwNcRHfpjfn4SiKEbMlTN6cEmwUHsN3OaxDEiAPc9ytKfa588TTt3jq2?=
 =?us-ascii?Q?kLOHIvKBB97CkAOKBUfFHYTJg7LKR+nXapIE?=
X-Forefront-Antispam-Report:
	CIP:80.90.171.68;CTRY:JO;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SESAME-SMTP.SESAME.LOCAL;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013)(41320700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: sesame.org.jo
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 19:36:26.6380
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe959d39-cdbc-4a13-bd31-08ddb5b1e87e
X-MS-Exchange-CrossTenant-Id: 0788906c-6e04-423a-b37e-862cc7808738
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0788906c-6e04-423a-b37e-862cc7808738;Ip=[80.90.171.68];Helo=[SESAME-SMTP.SESAME.LOCAL]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF0000019D.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8903

Ran checkpatch.pl on drivers/staging/gpib/, found the following:
 - gpio: gpib_bitbang.c: wrapped LINVAL macro w/ parenthesis.
 - hp_82341: hp_82341.c: Used comments instead of "#if 0"
 - tnt4882: tnt4882_gpib.c: Used comments instead of "#if 0"

Signed-off-by: Abdalla Al-Dalleh <abdalla.ahmad@sesame.org.jo>
---
 drivers/staging/gpib/gpio/gpib_bitbang.c    |  4 ++--
 drivers/staging/gpib/hp_82341/hp_82341.c    | 14 +++++++-------
 drivers/staging/gpib/tnt4882/tnt4882_gpib.c | 14 +++++++-------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/gpib/gpio/gpib_bitbang.c b/drivers/staging/gpib/gpio/gpib_bitbang.c
index 625fef24a0bf..45cf4571c58d 100644
--- a/drivers/staging/gpib/gpio/gpib_bitbang.c
+++ b/drivers/staging/gpib/gpio/gpib_bitbang.c
@@ -47,10 +47,10 @@
 			dev_dbg(board->gpib_dev, frm, ## __VA_ARGS__); } \
 	while (0)
 
-#define LINVAL gpiod_get_value(DAV),		\
+#define LINVAL (gpiod_get_value(DAV),		\
 		gpiod_get_value(NRFD),		\
 		gpiod_get_value(NDAC),		\
-		gpiod_get_value(SRQ)
+		gpiod_get_value(SRQ))
 #define LINFMT "DAV: %d	 NRFD:%d  NDAC: %d SRQ: %d"
 
 #include "gpibP.h"
diff --git a/drivers/staging/gpib/hp_82341/hp_82341.c b/drivers/staging/gpib/hp_82341/hp_82341.c
index 1b0822b2a3b8..f641613e128b 100644
--- a/drivers/staging/gpib/hp_82341/hp_82341.c
+++ b/drivers/staging/gpib/hp_82341/hp_82341.c
@@ -805,14 +805,14 @@ static void hp_82341_detach(struct gpib_board *board)
 	hp_82341_free_private(board);
 }
 
-#if 0
 /* unused, will be needed when the driver is turned into a pnp_driver */
-static const struct pnp_device_id hp_82341_pnp_table[] = {
-	{.id = "HWP1411"},
-	{.id = ""}
-};
-MODULE_DEVICE_TABLE(pnp, hp_82341_pnp_table);
-#endif
+/*
+ * static const struct pnp_device_id hp_82341_pnp_table[] = {
+ *	{.id = "HWP1411"},
+ *	{.id = ""}
+ * };
+ * MODULE_DEVICE_TABLE(pnp, hp_82341_pnp_table);
+ */
 
 static int __init hp_82341_init_module(void)
 {
diff --git a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c b/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
index a17b69e34986..7d679604488e 100644
--- a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
+++ b/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
@@ -1369,14 +1369,14 @@ static struct pci_driver tnt4882_pci_driver = {
 	.probe = &tnt4882_pci_probe
 };
 
-#if 0
 /* unused, will be needed when the driver is turned into a pnp_driver */
-static const struct pnp_device_id tnt4882_pnp_table[] = {
-	{.id = "NICC601"},
-	{.id = ""}
-};
-MODULE_DEVICE_TABLE(pnp, tnt4882_pnp_table);
-#endif
+/*
+ * static const struct pnp_device_id tnt4882_pnp_table[] = {
+ *	{.id = "NICC601"},
+ *	{.id = ""}
+ * };
+ * MODULE_DEVICE_TABLE(pnp, tnt4882_pnp_table);
+ */
 
 #ifdef CONFIG_GPIB_PCMCIA
 static struct gpib_interface ni_pcmcia_interface;
-- 
2.43.0

