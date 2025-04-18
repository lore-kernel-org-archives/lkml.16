Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2069.outbound.protection.outlook.com [40.107.93.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5872215073
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 16:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744993062; cv=fail; b=WJZgeHxPntPpwMImtddp9dYiPhNPVvxLcELFQDsyowO7l9SDiMsE81z83TAWBgIsvkbRvor1gfWBwt4Gdm8KlR7ZDHPcoolIZbr2odcvgfShfMO2p29xS0mo3eSvAwxsWRtiCFWyQMgxVwvrl65fBBlL6UW+VkUyvfPRvdyHEw4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744993062; c=relaxed/simple;
	bh=v5J4l4BVlnrKPdHdDyBmtt6miEMTCo3njbOIixDLVzk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RGiHUVEvV73aCQFJIRumakKMf9bdLiHvm/SzZ20Kh+yTan7yBsqV3YUXE1j7deLqZbJ0SIc3IY9COqqWuTTRopQeRxQ0np+r/iVys8FmvPyU5fyn5y8kT+P5e70B8JXAkRVZUSF1/q8TLycPNiIBzEEofA3VVnPRbj1UHmiMwKw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=YHgTnPeX; arc=fail smtp.client-ip=40.107.93.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="YHgTnPeX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k3hTRsQe4Ejga1aRmf4j04EYPSRtLmAsYWIhgd3VKAsuaa6tpW0o5jN1/OWGOoNXH5OB/im43k68lWKjRBZPBYkRWeQfcog0TU17YmUa0ZJ0h2Qp85yfHYYcFX0DenH3tYrq8c8/qjL01121kcapijDN9aTn8xth/n3jn7hKtD5ylNhPRlq2ANmQWhIlKTfkX6ey23JyS3eWwpsNMQy/S5V487VlG9hr+4yH2zqiCkS4sH5q/QkiyYsvyMn+whG3PpXS7RT8Kg9uUxS8ccyAKqSTyFZ/rZE/r6YwD7qo2xrUg6MgRLfZLPFmm1yqdA5WlWiKm8UWFQkuDrndCNrIBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r5t7R5QYyfT7agBVTJJKs7rpUkPD7DCRt2KKotjseSE=;
 b=zBpusfZHReosFcRfqx8Neml8aG7oG0dzAZtsONfnGQrC+LqLzKvB6pnIBob/H0fmn7/x6QAdv5wqs/afbTsMfJphIOLDaBOFqd/8R8OAHphOZv/7Pz4hk37lvl9dzxAgHmrf0T4L68uxsJ3OZWK4ACkaRkhmBmFZt+vgf1kouU9QBvrB6xu3r/rS02oriIUuYQoBi3nZaZ8+Qw/IZ34RTrcsrp/js5L8PPGXScDnyKh9vuJrNzKF5YQtrNQbOY+ri3d2W7/MI7dasR3yYf/8GyEeGeXnOkCWjDgcQ/0sNUbsRFwFNKKY5JBvGvrK/EUHe1IthoyDubHJKRk8eSOgDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linutronix.de smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r5t7R5QYyfT7agBVTJJKs7rpUkPD7DCRt2KKotjseSE=;
 b=YHgTnPeXPKxjQQtIZxMnNU0qtPvY3jXYD2AkwxnnqESPvFiqf4Ww1nbOF6IVULQFIfFc9pnnAPGH1fYmtTvcsDHCqPcINrL4/d2OmOhSODbnC6kd15BJDStufAvaQ1lP+Qk1Om4eAsZocmy5kVRnNth8U4ISswhvV/PFunUOAT8=
Received: from CH0P220CA0017.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:ef::34)
 by DS0PR12MB8443.namprd12.prod.outlook.com (2603:10b6:8:126::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Fri, 18 Apr
 2025 16:17:37 +0000
Received: from DS2PEPF0000343E.namprd02.prod.outlook.com
 (2603:10b6:610:ef:cafe::a4) by CH0P220CA0017.outlook.office365.com
 (2603:10b6:610:ef::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.23 via Frontend Transport; Fri,
 18 Apr 2025 16:17:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343E.mail.protection.outlook.com (10.167.18.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Fri, 18 Apr 2025 16:17:37 +0000
Received: from tiny.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 18 Apr
 2025 11:17:35 -0500
From: David Kaplan <david.kaplan@amd.com>
To: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Ingo Molnar
	<mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	<x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>
CC: <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 07/16] x86/bugs: Restructure GDS mitigation
Date: Fri, 18 Apr 2025 11:17:12 -0500
Message-ID: <20250418161721.1855190-8-david.kaplan@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343E:EE_|DS0PR12MB8443:EE_
X-MS-Office365-Filtering-Correlation-Id: bbab3d03-f270-42ba-6af5-08dd7e9488d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jas4Qdi8XSbr4eDAx83nqRgOLLkKYjokX1deOzD0VULYHEopfGXPw2WwrR3x?=
 =?us-ascii?Q?oiT/i7SnXcGRgWmMm0FRxL19Kc8RZ1h6Z9rVI/IOZIHAq/7/7rxeZ0oojQdc?=
 =?us-ascii?Q?w7B4Eq9ydqokxhoQoCy1qTrlWVXOf2j29dHuqZwZd50OBJImjvly3fhc584E?=
 =?us-ascii?Q?rxn9I+/wD7NKPcdDjpfD4g2x3NbUeAjDvZ1VK/85jNrJp/4XAeGGQg+HKJ0l?=
 =?us-ascii?Q?qCSvIlbqKjXau0fxw5b9oggjc35AEGcEzetYKtLHLSyw/mSfnCCP/4TZD5zd?=
 =?us-ascii?Q?DLQBGeHM3FE5UHg0cL7eTWCo74f7HlvI/CLssQq+QIarQzyROBFxHeKsG4gy?=
 =?us-ascii?Q?nUyqdaaeulu367I2znw4iukR0cIW5QK2gYJq82ZqEKR+ILOCE8h2B74YSfts?=
 =?us-ascii?Q?WH7DRXmWjNB1gAFX+i0lIVQN6ARIhrawVJeOBJVY4eRTDmgBYym6evdPGgql?=
 =?us-ascii?Q?geuXzAv/Cw7wdRWdQsp4+IuTio/YNYXOE3RZkuiRnj5biHgCxgKqrGr0N5ya?=
 =?us-ascii?Q?8xd0/hKUzvPM0DhrpIBXL4gusZNNlZy278j3yrd1OkUJVBsWTt0e97o93+fR?=
 =?us-ascii?Q?8Qy83iQ1QS+utraEAWJuF7I9vlX6OaFTcWaLtjuhstQs3WetEoQUVemdJyen?=
 =?us-ascii?Q?GmKgUkhW7uOofjmgMl5qA8KaTRTxETVRhRmthn/RQPF/dNLlgAjVrr4rEldy?=
 =?us-ascii?Q?8tx487H6PGZv+qjFk75nysfj74MsHN3FLZRTvyVvT5Swhtpd7RibeT3Xizhu?=
 =?us-ascii?Q?P2JoIetHpLdOObXfKNwjOfBGbeD9gOt36s1zz9eLd3UNPkJQ+iNh4oe/J37m?=
 =?us-ascii?Q?wRaQL9WwHW4arZ1o39xH7LkIt5JcSNXlPNwkmoSkjV7Hzn6jtlu02CUbzGAX?=
 =?us-ascii?Q?OnsCrAMaZkuVrdy3NIC1UAYwXF8i7CLoBFMq7G7O958M6OurswgO21CRqFFU?=
 =?us-ascii?Q?Bwkpgj6FxjgTpdJm7GMON3/CvWPBJ5wyvIuW1dsY2kcrck8peZ1AAcJT3nXY?=
 =?us-ascii?Q?UBx1uSauK+41nb2pBLWM6qNdyT/aQmsa98+NY1bAJf+UFweDBVB1Lcctd4bq?=
 =?us-ascii?Q?XQvOjuuQeBKIMLAo0tAKUdX9Mi9wJ3EurC1AaRfvPQPSApEP0WUhsa0M5BEG?=
 =?us-ascii?Q?Y4036BCORE6ShdI77r/uWtx2T6KJeZQotL97xHuZYsfyou8wuXRxvzwBhF09?=
 =?us-ascii?Q?QTDL/6R7VpNk8iURG7KJW87viqjhHrfyB4su6CzRjU/6w6NG0mCT1YkEOFDX?=
 =?us-ascii?Q?ATtWGXML09N5uL86ko67t3sswumDWOcltTg/ewHLeFhy6Zw/PDPxXwxzZPMo?=
 =?us-ascii?Q?5OXdAgvsBXasKby/FK+4+/KD5HOePWbn6GIZhqQsZwqO6Y6mwdImqzohTBWk?=
 =?us-ascii?Q?2T4ZrGDRF7yIlr/woM78qFvWI/+8T95x86QiN+AIbMsiwrSZ5rVoJI9XCAzX?=
 =?us-ascii?Q?dhI8CZRsYgTmvvOWxXrlU88x48p6uSbzSiKhEEsTho7uWqy8rXdKFAYv61a7?=
 =?us-ascii?Q?20CEaUVPm+XfjjN7Ql0fgIL+4+u9hN6bGN7z?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 16:17:37.1652
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bbab3d03-f270-42ba-6af5-08dd7e9488d6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8443

Restructure GDS mitigation to use select/apply functions to create
consistent vulnerability handling.

Define new AUTO mitigation for GDS.

Signed-off-by: David Kaplan <david.kaplan@amd.com>
---
 arch/x86/kernel/cpu/bugs.c | 43 +++++++++++++++++++++++++-------------
 1 file changed, 29 insertions(+), 14 deletions(-)

diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index 942db170eb4e..57f9ebf90472 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -76,6 +76,7 @@ static void __init srbds_apply_mitigation(void);
 static void __init l1d_flush_select_mitigation(void);
 static void __init srso_select_mitigation(void);
 static void __init gds_select_mitigation(void);
+static void __init gds_apply_mitigation(void);
 
 /* The base value of the SPEC_CTRL MSR without task-specific bits set */
 u64 x86_spec_ctrl_base;
@@ -227,6 +228,7 @@ void __init cpu_select_mitigations(void)
 	mmio_apply_mitigation();
 	rfds_apply_mitigation();
 	srbds_apply_mitigation();
+	gds_apply_mitigation();
 }
 
 /*
@@ -827,6 +829,7 @@ early_param("l1d_flush", l1d_flush_parse_cmdline);
 
 enum gds_mitigations {
 	GDS_MITIGATION_OFF,
+	GDS_MITIGATION_AUTO,
 	GDS_MITIGATION_UCODE_NEEDED,
 	GDS_MITIGATION_FORCE,
 	GDS_MITIGATION_FULL,
@@ -835,7 +838,7 @@ enum gds_mitigations {
 };
 
 static enum gds_mitigations gds_mitigation __ro_after_init =
-	IS_ENABLED(CONFIG_MITIGATION_GDS) ? GDS_MITIGATION_FULL : GDS_MITIGATION_OFF;
+	IS_ENABLED(CONFIG_MITIGATION_GDS) ? GDS_MITIGATION_AUTO : GDS_MITIGATION_OFF;
 
 static const char * const gds_strings[] = {
 	[GDS_MITIGATION_OFF]		= "Vulnerable",
@@ -876,6 +879,7 @@ void update_gds_msr(void)
 	case GDS_MITIGATION_FORCE:
 	case GDS_MITIGATION_UCODE_NEEDED:
 	case GDS_MITIGATION_HYPERVISOR:
+	case GDS_MITIGATION_AUTO:
 		return;
 	}
 
@@ -899,26 +903,21 @@ static void __init gds_select_mitigation(void)
 
 	if (boot_cpu_has(X86_FEATURE_HYPERVISOR)) {
 		gds_mitigation = GDS_MITIGATION_HYPERVISOR;
-		goto out;
+		return;
 	}
 
 	if (cpu_mitigations_off())
 		gds_mitigation = GDS_MITIGATION_OFF;
 	/* Will verify below that mitigation _can_ be disabled */
 
+	if (gds_mitigation == GDS_MITIGATION_AUTO)
+		gds_mitigation = GDS_MITIGATION_FULL;
+
 	/* No microcode */
 	if (!(x86_arch_cap_msr & ARCH_CAP_GDS_CTRL)) {
-		if (gds_mitigation == GDS_MITIGATION_FORCE) {
-			/*
-			 * This only needs to be done on the boot CPU so do it
-			 * here rather than in update_gds_msr()
-			 */
-			setup_clear_cpu_cap(X86_FEATURE_AVX);
-			pr_warn("Microcode update needed! Disabling AVX as mitigation.\n");
-		} else {
+		if (gds_mitigation != GDS_MITIGATION_FORCE)
 			gds_mitigation = GDS_MITIGATION_UCODE_NEEDED;
-		}
-		goto out;
+		return;
 	}
 
 	/* Microcode has mitigation, use it */
@@ -939,9 +938,25 @@ static void __init gds_select_mitigation(void)
 		 */
 		gds_mitigation = GDS_MITIGATION_FULL_LOCKED;
 	}
+}
+
+static void __init gds_apply_mitigation(void)
+{
+	if (!boot_cpu_has_bug(X86_BUG_GDS))
+		return;
+
+	/* Microcode is present */
+	if (x86_arch_cap_msr & ARCH_CAP_GDS_CTRL)
+		update_gds_msr();
+	else if (gds_mitigation == GDS_MITIGATION_FORCE) {
+		/*
+		 * This only needs to be done on the boot CPU so do it
+		 * here rather than in update_gds_msr()
+		 */
+		setup_clear_cpu_cap(X86_FEATURE_AVX);
+		pr_warn("Microcode update needed! Disabling AVX as mitigation.\n");
+	}
 
-	update_gds_msr();
-out:
 	pr_info("%s\n", gds_strings[gds_mitigation]);
 }
 
-- 
2.34.1

