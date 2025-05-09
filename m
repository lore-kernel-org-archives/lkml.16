Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2041.outbound.protection.outlook.com [40.107.237.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B796C23BCE2
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 16:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746808144; cv=fail; b=J3jhfRjIX+X/oDNFKbnU1oAa8dOI7NIk06aP88ykk41eC1ad2619pQiWRwU/bbaspFMP6sad+y8JXYMRezG8wR4Y+FYCb2C1KUkHTipcJhG9oVBcbmvHt15xxwY6lcD3lp0l3QGjaOwMiEjMgPToxhnNJ0rEgZj3igdeCrmrpak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746808144; c=relaxed/simple;
	bh=0sii+TXCMUqOoBkEcKsunQWNFbjrTK4fd5fhQuh5IEQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tulE22UXlEeC3wJ3ATNYGW2Pn5/u9jY8ZUIZ4lfh41pl68qOjYB9bYDbceSYS3yoaQrf3HlQPMY7/ur8zuDo853ZPU4PfcyQBVMJ5apBOWt/+c4RhiybtfsNmWVhkoA/u5X88XXrAVSszJQIdS6SVEUorLWaJYZZNsIGibFrQSk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=iFgL8UlI; arc=fail smtp.client-ip=40.107.237.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="iFgL8UlI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Se1IJ1Iy1i1GkNLva2qT5zBuNDNSSquLh0caiVJfKkVoMllWvhyPMHA7cQ7Flmj0HGBVhi229cDIth1dl/8Zdgarv+BNwDPTPu9R+vt8Hm2YgVRf+pBGiizw6UlGZXj4aZNqU6srH1ZRSrGS4oUURpKGg3M3qunwxwhGgJ/LtrZYcCDmp7zJPVqnSIr+vMPN97n8uD8ydzCL+3rKR5nFZe7S8Nc42yY/sKfHj2j1VGyO39sXtVge2HAFX/bsd3jKYqzXuVmeZ1lYbnLl5HXA0GXP7dNI5hnyOFgKE4Rlc+ePG2Upv/DPvpQZ+Ro+emmZngQjjWrbpwOu8wtCHA/QbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G/LZBs0NujhNhY7Gxc2mi9tUaLuLbCjcPlDSsxe2zLs=;
 b=XCF4Cyqqnc1LmlzU8ovwTyG4jTE9tGYWffMEBzC/1rW+XHTz7KPFjSKCoIPGv87v1e4wMy96lkLNEjn/uCZKME8Jj77voBJ7fnbKioU5cl2O1u2j+KfB3pPOLcnEfN/5Vk+ZckC3XsG6yOFAhyWo/ff8muFRVDtYBGlaGBcfp3aDo9ChuiuUCcPCyvWih3n5+VmHLeBR8K+LxHbM5EEPB72pA80i1u1yA0MhbSIeFicgo2HRxltoOAhMoocJC5wU1YF37KwSQHXPbDmN4k0WIrc8duAvK21RV65eLmP7P7P++aJxH69Clx3U4qN1PsEXKBlu4QRVnaoEl48vT7UfyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linutronix.de smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G/LZBs0NujhNhY7Gxc2mi9tUaLuLbCjcPlDSsxe2zLs=;
 b=iFgL8UlIjH/NPrL3Owtwibr+3VNGNAAGW+FrMaFgPvyGv1v4u8dUXVtGbtJBQNfFFbno5E0DWRLgEHs/7getujYu1ti2eywSdVuXYs9PsYK/SS/HPlMT4qM2bJ1pQt7UMWokG05PXaroutYuY90JSgcFeZGbQDrAJoGya1e6hi4=
Received: from BL1PR13CA0101.namprd13.prod.outlook.com (2603:10b6:208:2b9::16)
 by DS7PR12MB5984.namprd12.prod.outlook.com (2603:10b6:8:7f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Fri, 9 May
 2025 16:28:51 +0000
Received: from BN3PEPF0000B074.namprd04.prod.outlook.com
 (2603:10b6:208:2b9:cafe::5b) by BL1PR13CA0101.outlook.office365.com
 (2603:10b6:208:2b9::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.19 via Frontend Transport; Fri,
 9 May 2025 16:28:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B074.mail.protection.outlook.com (10.167.243.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Fri, 9 May 2025 16:28:51 +0000
Received: from tiny.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 9 May
 2025 11:28:50 -0500
From: David Kaplan <david.kaplan@amd.com>
To: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Ingo Molnar
	<mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	<x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>
CC: <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 02/20] cpu: Define attack vectors
Date: Fri, 9 May 2025 11:28:21 -0500
Message-ID: <20250509162839.3057217-3-david.kaplan@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250509162839.3057217-1-david.kaplan@amd.com>
References: <20250509162839.3057217-1-david.kaplan@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B074:EE_|DS7PR12MB5984:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d9f71d5-7768-4f3a-0ce4-08dd8f169585
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IX1+b11+b6Sz+L7yuCH+eE97ULmD0TxpVA6Dq7kQ7sZjYw3HpN4twmfk/tu/?=
 =?us-ascii?Q?tmsMtNvLw8ZaPFJtlJq+lmuQgW3bUU+bXcLTwv8Xlere49pYCHAK3IzrT+4o?=
 =?us-ascii?Q?B9RbT4StbRE0YOTevGZou40HFeYsZsExVm+lDlEvFzRiKiizAVj46sT1yLmy?=
 =?us-ascii?Q?UfdNrCk5uTVYYox/n/u+viA0dOT1o7OZocg+wE6glE5osEQWcMBB7U3VxzcQ?=
 =?us-ascii?Q?REjC8WOFAMyxv46lRLgGyRpMkihBqNW4N4Y/ds1QSc3cX1/nHLBpcpahIaa3?=
 =?us-ascii?Q?rCPv9ev1nyC3hZnjUuLUPVX93esjFLWd6QlyYChOcX8L6E7NHO5rAnzW5VDU?=
 =?us-ascii?Q?ApjiNyq/3q/JQuE9BNZEVOI6xyeqk4UPLeBbVHMUTuLHCz5ACqcINHb3Yrl5?=
 =?us-ascii?Q?gjj+jZtBb1RANv5FQJVQHe7LcDnvF3L7uVqqcydgr7aXXSCNAuyildKoYOso?=
 =?us-ascii?Q?Wli0GKIreSmbxmyM+3+h3dR2XbPj46GYstRUwiKMPv22ALpZCde619OQkNAM?=
 =?us-ascii?Q?CMcL5GfLcLi9EHBl/7AaqBukeKeK5EGJMKaHk+YMoEEmCR77ImixNDVUnHQJ?=
 =?us-ascii?Q?4aJcxMMBkRJKsddVXFDijgqCanMOoDDEMM5Qpach/TuZd8KrJRMK5UdiGorh?=
 =?us-ascii?Q?goSloG9kt9geI1RD1qyfHFguRokeSmWuielyKx8Ow7Clvh8oBlPD2acsYSz8?=
 =?us-ascii?Q?t15KAkx0W4xvv8BkV+x/pOJtXSMNIoM3ezfHsdxO1Ts+AsGw8vJoYJLd2H0M?=
 =?us-ascii?Q?ACKxgD5pjlPEtWfN8+WqiTvKyob8dMi6kMy7o7RX6TwjUXN2iOoGmnyJvw+J?=
 =?us-ascii?Q?DmaarW9kRRkQo6+hAIDJeFrQT0LqwvKhjFGZiDKO1FRTir3kM/skDPy4JDkb?=
 =?us-ascii?Q?Asi2VRJdK+46DRjrNIIqwU/bfO0aljloCucZcqdL1LiIMBaTE/hCkP1mmWre?=
 =?us-ascii?Q?E724I/vH+EYtM6RNvXxklOXOK7FJJnUil2D1GVTQ2tUJARcYF0XmSTR3W94b?=
 =?us-ascii?Q?DHLCSdB5D+NvPJ8bMKtowJsE1hJOUO8KtyeecikwJbA+6i3A0LLhVvf9BrQG?=
 =?us-ascii?Q?wpYwgiPW0OHPeG4RhCnppwEuhyN3geFb3WMbF8PVBKnJO9iSFeBT0xtdNGxf?=
 =?us-ascii?Q?mRckFmoL7uag18qVyhz/7z/VN2gw1hLQCiS9wAvsc20py/LrB8aG5qCX0Urq?=
 =?us-ascii?Q?ItX5WKGnwOTeEc6CP0HVJ+lc+u13U63/7vFvkU2stfeKhNRn6fJel53KKsJO?=
 =?us-ascii?Q?Mmzj+Mn+wm+uiGIXeejVJsLd6YDWc4aaZBDSqJxsraVBemZ+xXKK9fdNlFTn?=
 =?us-ascii?Q?dV0oo5khiDAF7c7D66o1C9AZXBmt0kbtH0N5GSfYusIrqzs09auOjxkbDSbE?=
 =?us-ascii?Q?Y+Yk1Y9KEJx16vHpB8QSpJyzMH2knC9P3g7VvnE5OYYhRqPhmRCa69hN6FKe?=
 =?us-ascii?Q?01QVvR/zDjv0WW58tNjpSsO248klA8Ch1MhTamq9l+RYJTjrJfQE/WEtrbSS?=
 =?us-ascii?Q?ErzlK2Pn0w7dk+MMBU9FeTas7gvMZJhsBku8?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 16:28:51.6628
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d9f71d5-7768-4f3a-0ce4-08dd8f169585
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B074.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5984

Define 4 new attack vectors that are used for controlling CPU speculation
mitigations.  These may be individually disabled as part of the
mitigations= command line.  Attack vector controls are combined with global
options like 'auto' or 'auto,nosmt' like 'mitigations=auto;no_user_kernel'.

Cross-thread mitigations can either remain enabled fully, including
potentially disabling SMT ('auto,nosmt'), remain enabled except for
disabling SMT ('auto'), or entirely disabled through the new
'no_cross_thread' attack vector option.

The default settings for these attack vectors are consistent with existing
kernel defaults, other than the automatic disabling of VM-based attack
vectors if KVM support is not present.

Signed-off-by: David Kaplan <david.kaplan@amd.com>
---
 include/linux/cpu.h |  21 +++++++
 kernel/cpu.c        | 130 ++++++++++++++++++++++++++++++++++++++++----
 2 files changed, 140 insertions(+), 11 deletions(-)

diff --git a/include/linux/cpu.h b/include/linux/cpu.h
index 1f5cfc4cc04f..ce98c66a7fc0 100644
--- a/include/linux/cpu.h
+++ b/include/linux/cpu.h
@@ -192,9 +192,25 @@ void cpuhp_report_idle_dead(void);
 static inline void cpuhp_report_idle_dead(void) { }
 #endif /* #ifdef CONFIG_HOTPLUG_CPU */
 
+enum cpu_attack_vectors {
+	CPU_MITIGATE_USER_KERNEL,
+	CPU_MITIGATE_USER_USER,
+	CPU_MITIGATE_GUEST_HOST,
+	CPU_MITIGATE_GUEST_GUEST,
+	NR_CPU_ATTACK_VECTORS,
+};
+
+enum smt_mitigations {
+	SMT_MITIGATIONS_OFF,
+	SMT_MITIGATIONS_AUTO,
+	SMT_MITIGATIONS_ON,
+};
+
 #ifdef CONFIG_CPU_MITIGATIONS
 extern bool cpu_mitigations_off(void);
 extern bool cpu_mitigations_auto_nosmt(void);
+extern bool cpu_attack_vector_mitigated(enum cpu_attack_vectors v);
+extern enum smt_mitigations smt_mitigations;
 #else
 static inline bool cpu_mitigations_off(void)
 {
@@ -204,6 +220,11 @@ static inline bool cpu_mitigations_auto_nosmt(void)
 {
 	return false;
 }
+static inline bool cpu_attack_vector_mitigated(enum cpu_attack_vectors v)
+{
+	return false;
+}
+#define smt_mitigations SMT_MITIGATIONS_OFF
 #endif
 
 #endif /* _LINUX_CPU_H_ */
diff --git a/kernel/cpu.c b/kernel/cpu.c
index a59e009e0be4..be25543567c0 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -37,6 +37,7 @@
 #include <linux/cpuset.h>
 #include <linux/random.h>
 #include <linux/cc_platform.h>
+#include <linux/parser.h>
 
 #include <trace/events/power.h>
 #define CREATE_TRACE_POINTS
@@ -3174,8 +3175,38 @@ void __init boot_cpu_hotplug_init(void)
 
 #ifdef CONFIG_CPU_MITIGATIONS
 /*
- * These are used for a global "mitigations=" cmdline option for toggling
- * optional CPU mitigations.
+ * All except the cross-thread attack vector are mitigated by default.
+ * Cross-thread mitigation often requires disabling SMT which is expensive
+ * so cross-thread mitigations are only partially enabled by default.
+ *
+ * Guest-to-Host and Guest-to-Guest vectors are only needed if KVM support is
+ * present.
+ */
+static bool attack_vectors[NR_CPU_ATTACK_VECTORS] __ro_after_init = {
+	[CPU_MITIGATE_USER_KERNEL] = true,
+	[CPU_MITIGATE_USER_USER] = true,
+	[CPU_MITIGATE_GUEST_HOST] = IS_ENABLED(CONFIG_KVM),
+	[CPU_MITIGATE_GUEST_GUEST] = IS_ENABLED(CONFIG_KVM),
+};
+
+bool cpu_attack_vector_mitigated(enum cpu_attack_vectors v)
+{
+	if (v < NR_CPU_ATTACK_VECTORS)
+		return attack_vectors[v];
+
+	WARN_ONCE(1, "Invalid attack vector %d\n", v);
+	return false;
+}
+
+/*
+ * There are 3 global options, 'off', 'auto', 'auto,nosmt'.
+ * These may optionally be combined with attack-vector disables after a ';'.
+ *
+ * Examples:
+ *   mitigations=auto;no_user_kernel,no_user_user,no_cross_thread
+ *   mitigations=auto,nosmt;no_guest_host,no_guest_guest
+ *
+ * mitigations=off is equivalent to disabling all attack vectors.
  */
 enum cpu_mitigations {
 	CPU_MITIGATIONS_OFF,
@@ -3183,19 +3214,96 @@ enum cpu_mitigations {
 	CPU_MITIGATIONS_AUTO_NOSMT,
 };
 
+enum {
+	NO_USER_KERNEL,
+	NO_USER_USER,
+	NO_GUEST_HOST,
+	NO_GUEST_GUEST,
+	NO_CROSS_THREAD,
+	NR_VECTOR_PARAMS,
+};
+
+enum smt_mitigations smt_mitigations __ro_after_init = SMT_MITIGATIONS_AUTO;
 static enum cpu_mitigations cpu_mitigations __ro_after_init = CPU_MITIGATIONS_AUTO;
 
+static const match_table_t global_mitigations = {
+	{ CPU_MITIGATIONS_AUTO_NOSMT,	"auto,nosmt"},
+	{ CPU_MITIGATIONS_AUTO,		"auto"},
+	{ CPU_MITIGATIONS_OFF,		"off"},
+};
+
+static const match_table_t vector_mitigations = {
+	{ NO_USER_KERNEL,	"no_user_kernel"},
+	{ NO_USER_USER,		"no_user_user"},
+	{ NO_GUEST_HOST,	"no_guest_host"},
+	{ NO_GUEST_GUEST,	"no_guest_guest"},
+	{ NO_CROSS_THREAD,	"no_cross_thread"},
+	{ NR_VECTOR_PARAMS,	NULL},
+};
+
+static int __init mitigations_parse_global_opt(char *arg)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(global_mitigations); i++) {
+		const char *pattern = global_mitigations[i].pattern;
+
+		if (!strncmp(arg, pattern, strlen(pattern))) {
+			cpu_mitigations = global_mitigations[i].token;
+			return strlen(pattern);
+		}
+	}
+
+	return 0;
+}
+
 static int __init mitigations_parse_cmdline(char *arg)
 {
-	if (!strcmp(arg, "off"))
-		cpu_mitigations = CPU_MITIGATIONS_OFF;
-	else if (!strcmp(arg, "auto"))
-		cpu_mitigations = CPU_MITIGATIONS_AUTO;
-	else if (!strcmp(arg, "auto,nosmt"))
-		cpu_mitigations = CPU_MITIGATIONS_AUTO_NOSMT;
-	else
-		pr_crit("Unsupported mitigations=%s, system may still be vulnerable\n",
-			arg);
+	char *s, *p;
+	int len;
+
+	len = mitigations_parse_global_opt(arg);
+
+	if (cpu_mitigations_off()) {
+		memset(attack_vectors, 0, sizeof(attack_vectors));
+		smt_mitigations = SMT_MITIGATIONS_OFF;
+	} else if (cpu_mitigations_auto_nosmt()) {
+		smt_mitigations = SMT_MITIGATIONS_ON;
+	}
+
+	p = arg + len;
+
+	if (!*p)
+		return 0;
+
+	/* Attack vector controls may come after a ';' */
+	if (*p++ != ';' || !IS_ENABLED(CONFIG_ARCH_HAS_CPU_ATTACK_VECTORS)) {
+		pr_crit("Unsupported mitigations=%s, system may still be vulnerable\n",	arg);
+		return 0;
+	}
+
+	while ((s = strsep(&p, ",")) != NULL) {
+		switch (match_token(s, vector_mitigations, NULL)) {
+		case NO_USER_KERNEL:
+			attack_vectors[CPU_MITIGATE_USER_KERNEL] = false;
+			break;
+		case NO_USER_USER:
+			attack_vectors[CPU_MITIGATE_USER_USER] = false;
+			break;
+		case NO_GUEST_HOST:
+			attack_vectors[CPU_MITIGATE_GUEST_HOST] = false;
+			break;
+		case NO_GUEST_GUEST:
+			attack_vectors[CPU_MITIGATE_GUEST_GUEST] = false;
+			break;
+		case NO_CROSS_THREAD:
+			smt_mitigations = SMT_MITIGATIONS_OFF;
+			break;
+		default:
+			pr_crit("Unsupported mitigations options %s\n",	s);
+			return 0;
+		}
+	}
 
 	return 0;
 }
-- 
2.34.1

