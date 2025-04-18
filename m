Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2081.outbound.protection.outlook.com [40.107.101.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED2421505C
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 16:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744993062; cv=fail; b=WDoXQm3UZzTuM5i+TANk+xfbNvKxagTYCeiAtf+EdlpEhO5Y9QRcOtX5+NIjzqVyxtO/fT7rFMEw2/PGcRess49078xXYb6StmwmMHy7XK01wxV2V+SQtqFH91NNgGDLZGLQj+AoMjVjyzjb2qn4M/bljJ2D6t01U+KA9O4o8Po=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744993062; c=relaxed/simple;
	bh=Mnu9Iq6eQQFrMrO5EVyy7BmqLuo7WL1tZoYv2B3fuu0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oHJ8Po9ZnVYFyKOULaEws/mXBXf57aPkz9TuA9SIfN37mi1bs7e8SxKmjqvYFcFdTxL7JcPK4XfvHKVC/VRcOjwKNIMNpRCX8G4uGW6bEsN/ULf/VG9skmYaMendHWpK9/C4Efny1JjnSz9ZirV+5gVvpAZiLn7qBJ8Pi0ClNCs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=gh/eR5ai; arc=fail smtp.client-ip=40.107.101.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="gh/eR5ai"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HgpHIN+bSFf9+wVyvt/KHy1ByamCdKzSRXgipRAchspeYERaC1NxQZSa5NPYSf1TgPQnt0muhCPHHHeufU1CKyldR/wFAaI1Y84oEuKSLg/AVTa40xLQwOSsfEnwgbDJuEEeEiEjs99w9FVpECmm0STTr7/0TUJ/kA0l6MTOg1F6MXE7D48y9Q8CzYTRzuLmUW/eBoRZQuSSoiV3ymB1PXhZ5hatWoi5a/CZrRezq+gdW/QDjt5NYneqPxTiWR7cJAsph3FrQ9F3qhc5uusOMZhIRKRzzOmMo3Xr6q1TJ5dmQT488OckF1CKgKWZ1547v4QC9ZMf48A1TXjzr6Tmrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pr36jq03MUShKn7hVZsyDAKLKe6VLEw8nzHibQyUXuc=;
 b=yzEZLrFqDthM8ARLfHnoTzkGP5jjegssUOUOmdIdiR53yVrxQsFcy0pm3aBRbP+Y60KxOch7tCxx64L9zawMZV7ukDZjMC7YftX8ZBSZw2WGlAGWEjb4d/LAQnkZD1Gwtsy25WnUlIHmNhtMW2Ht3RDRMAHkCfvY0TpzkbTCJZYRn+PgMgWpsqhSQ63BFST958jPPM1Iaupuq1/jY/cXn6FmGTioneC4hvkaQriI9xb438BoJtHYmi1CB3Sqy8lnv7A7LzUUu0RN7ycJXMz8Zkw3eb9d0gxfZwW7Uh/lue/IsfYKTMJoM0XWCBqX2AiSoThBsxfebA8cusvCvQqXIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linutronix.de smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pr36jq03MUShKn7hVZsyDAKLKe6VLEw8nzHibQyUXuc=;
 b=gh/eR5ai5SApDqk/+2amJgIvY5PTEBQgmVCVNEn2XA4vV7bcOwx/eFstno96eluVuFCBoIU2wNDVV1MxkHPowWdoUJuAqQfTCvCIUDxmOC5MZ5Z9DuJnhLUmkmr5VOrNrP6wldkV56sfIVSa9DLmDSgtYaoDaiLZnf2rkOD7ldw=
Received: from CH0P220CA0025.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:ef::20)
 by SJ0PR12MB7084.namprd12.prod.outlook.com (2603:10b6:a03:4ae::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.26; Fri, 18 Apr
 2025 16:17:36 +0000
Received: from DS2PEPF0000343E.namprd02.prod.outlook.com
 (2603:10b6:610:ef:cafe::b2) by CH0P220CA0025.outlook.office365.com
 (2603:10b6:610:ef::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.23 via Frontend Transport; Fri,
 18 Apr 2025 16:17:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343E.mail.protection.outlook.com (10.167.18.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Fri, 18 Apr 2025 16:17:36 +0000
Received: from tiny.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 18 Apr
 2025 11:17:34 -0500
From: David Kaplan <david.kaplan@amd.com>
To: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Ingo Molnar
	<mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	<x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>
CC: <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 06/16] x86/bugs: Restructure SRBDS mitigation
Date: Fri, 18 Apr 2025 11:17:11 -0500
Message-ID: <20250418161721.1855190-7-david.kaplan@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250418161721.1855190-1-david.kaplan@amd.com>
References: <20250418161721.1855190-1-david.kaplan@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343E:EE_|SJ0PR12MB7084:EE_
X-MS-Office365-Filtering-Correlation-Id: 449ce6ef-0a56-4912-6fdf-08dd7e948835
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9Syq7azsnUHwmiBMpIgur0jqmyAzKrR9tQ03pm9nLOyG2l2S+log1PE9jYSK?=
 =?us-ascii?Q?FGwAK31vUn+Lj1kxbw9QiDOt7btHYX62yERQQK81ij3V2lVZNzmDRcFdK3dI?=
 =?us-ascii?Q?7cHg8UhevYGnARfXFRKYzjvKjFPtt0Z7ukaNtXb/tXH+1my7YVg9GaL6UAOJ?=
 =?us-ascii?Q?oTq/Nqp72sf74U0xLoRet66LUZpnmkFflndijq3CMSI6juwgLIwAVIzrHtsL?=
 =?us-ascii?Q?WHme3fVLAeyN5biojMUW+UKSkRM+pf5Zs76qsaybyN9GdlL2Yac75dI8iyZT?=
 =?us-ascii?Q?PPnovr81jzeOTXtbp+cxozqMAhpblED3uR68kb3hBxSe5YLpQ/BFLFBobxMw?=
 =?us-ascii?Q?ntZuSVpGxIVSrtI9cZ4OdJnNcp6qwoUFTr29WlacGTnZIB85RaN5n2H3f7Oj?=
 =?us-ascii?Q?cNfjh0LgmwRXUKguXbiiHU9eNJfzhNHcrk2f5UgPeCNzlV36Bfp7PbiBvo8G?=
 =?us-ascii?Q?YkqEMS28KNxk7fKVzCbo+Y+uSEjGLhMNqAFNaALSHxHR36byUzdax0swd5Vf?=
 =?us-ascii?Q?3WBpBD0wnhlitaENUEILDzTqIqte2EQnLoXz+6D4qPGELyfyr7xpZEkA3OiS?=
 =?us-ascii?Q?F5fyygoLDcK8DEpacvb0MoHbUWRa8s3uVwyVw+9ZKfZ5/Pn7rgjyk5nPOHiC?=
 =?us-ascii?Q?vmh1/R1wmB7H5gZ5yzaNm2yuq8xxBtbLzPDoeqzxjq+WdfEB102o1wt3CX4Y?=
 =?us-ascii?Q?9Ciilrlir/2R6bN/aVUBRqOw00TJrbEpUne14hnLPTLSRHnRk4elr4eVhgrl?=
 =?us-ascii?Q?4BoWm1eBKeuXNvfaSLADk3tdWasWxM9lpjmsDFYW1XHD5cxI+DG9tdrDAo49?=
 =?us-ascii?Q?pRKiUx4sSW8WbwS49iBwTExNEHWKO+BIlZjwLakaKKjc865tQSa4dUgtSMkd?=
 =?us-ascii?Q?3824xggrHED3KjgVwnUU2xw4AetEvkSeED5Abs1BhuCC1kDIW7CXMqX0sqrL?=
 =?us-ascii?Q?EMuAm0v72bP6AB/QdbrCAxi+YJyQofDl5fXZU/nuYRKLZO1gVAGVDfdTTa7q?=
 =?us-ascii?Q?fhzmpTgdz07hba1bTzKPXM5OnCTLOuElPlHkIHXAjlUvlxXSgMMLkwd9VBhJ?=
 =?us-ascii?Q?wDrS3QD6Oir3DWn+mBPk5PxF7EDkXgg+MYcqfbER4FKzwww3eaO+2dIqfmey?=
 =?us-ascii?Q?OgfwY60U8+3BfYSp+5mEngrKvvDu2YXU7MLI5bjCjliTP/9ID3gnG1XpuPYk?=
 =?us-ascii?Q?GrPQT1X075rskzfKNSd/lqe34WAZjMbz47So+N+DAkXRLXBcc6LF+XiMdfu1?=
 =?us-ascii?Q?S6D9T1cxWuOkGElGTJGwWCPRlDURBzebCQf9tWBx00efBExu9qVgYrvTfGNd?=
 =?us-ascii?Q?I+wjYviiYe38YNV/eYygZLXHffJyrZn55Y8JHs7nJqitC+IEDkZsT8742r2A?=
 =?us-ascii?Q?k7inROlWHncwlLSR4YmWSX44Gt1TEsVEuxAIGNliXqCwILjs65FX3tta8z7m?=
 =?us-ascii?Q?6iB4xiDL3WrZK6Vku0r7H+oQt95BI2ZKgPxDPWfUhstbUB1O3xrMz48umQkP?=
 =?us-ascii?Q?j8qryREOuQ5ceHh3uaxkxQkLmTebYXzmIrC9?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 16:17:36.1101
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 449ce6ef-0a56-4912-6fdf-08dd7e948835
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7084

Restructure SRBDS to use select/apply functions to create consistent
vulnerability handling.

Define new AUTO mitigation for SRBDS.

Signed-off-by: David Kaplan <david.kaplan@amd.com>
---
 arch/x86/kernel/cpu/bugs.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index ae6619416ce1..942db170eb4e 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -72,6 +72,7 @@ static void __init rfds_select_mitigation(void);
 static void __init rfds_update_mitigation(void);
 static void __init rfds_apply_mitigation(void);
 static void __init srbds_select_mitigation(void);
+static void __init srbds_apply_mitigation(void);
 static void __init l1d_flush_select_mitigation(void);
 static void __init srso_select_mitigation(void);
 static void __init gds_select_mitigation(void);
@@ -225,6 +226,7 @@ void __init cpu_select_mitigations(void)
 	taa_apply_mitigation();
 	mmio_apply_mitigation();
 	rfds_apply_mitigation();
+	srbds_apply_mitigation();
 }
 
 /*
@@ -689,6 +691,7 @@ early_param("reg_file_data_sampling", rfds_parse_cmdline);
 
 enum srbds_mitigations {
 	SRBDS_MITIGATION_OFF,
+	SRBDS_MITIGATION_AUTO,
 	SRBDS_MITIGATION_UCODE_NEEDED,
 	SRBDS_MITIGATION_FULL,
 	SRBDS_MITIGATION_TSX_OFF,
@@ -696,7 +699,7 @@ enum srbds_mitigations {
 };
 
 static enum srbds_mitigations srbds_mitigation __ro_after_init =
-	IS_ENABLED(CONFIG_MITIGATION_SRBDS) ? SRBDS_MITIGATION_FULL : SRBDS_MITIGATION_OFF;
+	IS_ENABLED(CONFIG_MITIGATION_SRBDS) ? SRBDS_MITIGATION_AUTO : SRBDS_MITIGATION_OFF;
 
 static const char * const srbds_strings[] = {
 	[SRBDS_MITIGATION_OFF]		= "Vulnerable",
@@ -747,8 +750,13 @@ void update_srbds_msr(void)
 
 static void __init srbds_select_mitigation(void)
 {
-	if (!boot_cpu_has_bug(X86_BUG_SRBDS))
+	if (!boot_cpu_has_bug(X86_BUG_SRBDS) || cpu_mitigations_off()) {
+		srbds_mitigation = SRBDS_MITIGATION_OFF;
 		return;
+	}
+
+	if (srbds_mitigation == SRBDS_MITIGATION_AUTO)
+		srbds_mitigation = SRBDS_MITIGATION_FULL;
 
 	/*
 	 * Check to see if this is one of the MDS_NO systems supporting TSX that
@@ -762,13 +770,17 @@ static void __init srbds_select_mitigation(void)
 		srbds_mitigation = SRBDS_MITIGATION_HYPERVISOR;
 	else if (!boot_cpu_has(X86_FEATURE_SRBDS_CTRL))
 		srbds_mitigation = SRBDS_MITIGATION_UCODE_NEEDED;
-	else if (cpu_mitigations_off() || srbds_off)
+	else if (srbds_off)
 		srbds_mitigation = SRBDS_MITIGATION_OFF;
 
-	update_srbds_msr();
 	pr_info("%s\n", srbds_strings[srbds_mitigation]);
 }
 
+static void __init srbds_apply_mitigation(void)
+{
+	update_srbds_msr();
+}
+
 static int __init srbds_parse_cmdline(char *str)
 {
 	if (!str)
-- 
2.34.1

