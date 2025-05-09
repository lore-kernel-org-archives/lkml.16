Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2057.outbound.protection.outlook.com [40.107.94.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC9A238152
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 16:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746808139; cv=fail; b=FL+dssPRPwFOfr+ktrMs02jw0862MZmUM0L6YdJ2enaMiDZkj73PQ2Ab88ctK4lEnwekKKai54HmU2XUy6+kll3tTo1FyIPqKv9nngKp2wNms1iNfomacXxpbYGAKHI0ZloKCwEv18FPAeb4HicplEIYRa7zOGkd2arTBTMIx/A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746808139; c=relaxed/simple;
	bh=S1D1l0UiwerTgMEBHf14O6V4bw0iJG2UixT9WGtn6qc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RXAdfUwnFu07bWdJ4Zh/OGpgWXMT+mCkTAPTM7t12SE12lJz08tfsgMjrcs7yHESnERR4r58EoaNU95oPqDSfMT5/GU9svuEd//CMuAEWNGGo8fBsOPtVk7Gfa/OhMvnkoyY86U/A4iBzH3qLIZpN85nCLOR/vVMsElaHNO83xU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=2ia6fDGh; arc=fail smtp.client-ip=40.107.94.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="2ia6fDGh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R5zjcQ5NoQ25QGTWqLERDTLdfADosSZQZmNgf8Zk0qPIUciqY3uL6DKUBb2XBS7H22v/bnr3beTd4816ya9z0Ti4fkiMfuY2t8cabMwTJp4l0gZ5I2l+RVgp5Vq4dkGxpbEUzz3LmPojGb/v+njHG9n/MgkE24E+m6RkjRa3CxVerjrgcRNCP3W+QPL4X0SS+HAvKdKcLGnxmTGQxS5kJ2tQcHmv1HecWjDDxpp+WsA49xhqDDZp785XaJG2N28ckn8Uv4oG7PD7tiXJcgPsNvfG14A8oLLeF2OCMMBAHK3ztiozV15LmjPdFXlR2aXqPem50ljcgohydIqLxUohnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V6yzC3yr2F/Z3dMmzDV8zsCv8tDIa048ORXJ+Xn4hGo=;
 b=oxou7WfR7cqPDyvzC/9F+Nc4KE54GVdGD1DfgeqJ/s2yvbyzqqsyN4lht0u8EfClwyoyvKy/Q25UzmFZ5VMDIa6EEIUz2rW033Bbn3ffbyeVDdpJ+7t9tv5uIVkqBumCTKpTAuEFgpJpNlU5YbMHizbTf1YI6EGBZyWdVGLahX0gToDwo2i5pTzEIPQkvUEzdekkYiTINiVJjPdTSbX26nYIM6YoglY6BqrXIVxWOzR8vdJxxCJcabKCTaWTX3xdHryXBX6h5pZo+O/B0cMStgdo6WHzqhuOrGW5BXA0HSolixChpXy+EMI/b8DHkriyADs8dMdO7tufSX2LERADxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linutronix.de smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V6yzC3yr2F/Z3dMmzDV8zsCv8tDIa048ORXJ+Xn4hGo=;
 b=2ia6fDGhKvWEZ4R9C31Ubwguqns/MEIr3UcOfQj7244sQ3C0smRATJ56jOM5nYHPqDL9TKYgR5s3ZXflxXbymAYbtELR1DDVF0Tm8FL5Jn0g0VLPvfA0cyMeON2V3ziTuV0N6Eny/xt5Mlnb+xUxV4L48l6gY/9EYS5bM0LKIXI=
Received: from BL1PR13CA0120.namprd13.prod.outlook.com (2603:10b6:208:2b9::35)
 by CH3PR12MB7499.namprd12.prod.outlook.com (2603:10b6:610:142::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.23; Fri, 9 May
 2025 16:28:52 +0000
Received: from BN3PEPF0000B074.namprd04.prod.outlook.com
 (2603:10b6:208:2b9:cafe::3) by BL1PR13CA0120.outlook.office365.com
 (2603:10b6:208:2b9::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.19 via Frontend Transport; Fri,
 9 May 2025 16:28:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B074.mail.protection.outlook.com (10.167.243.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Fri, 9 May 2025 16:28:52 +0000
Received: from tiny.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 9 May
 2025 11:28:51 -0500
From: David Kaplan <david.kaplan@amd.com>
To: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Ingo Molnar
	<mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	<x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>
CC: <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 04/20] x86/bugs: Define attack vectors relevant for each bug
Date: Fri, 9 May 2025 11:28:23 -0500
Message-ID: <20250509162839.3057217-5-david.kaplan@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B074:EE_|CH3PR12MB7499:EE_
X-MS-Office365-Filtering-Correlation-Id: 962ca314-723c-42cd-236b-08dd8f169622
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TVeGUgKKs1zBaS+yqiSc9ZzJMrgOj6wiJwO/MVt+LQFXnLqz3E37Lvvgossq?=
 =?us-ascii?Q?8IOAmO7OnKVlBy2xnTkl2zhBOGyysKNYMH2Ipa/orKxEy1VkxVhHaBeTVOlK?=
 =?us-ascii?Q?x0Gi1V+hYl/6L3Te45VhKnqP/cfGf5fvVuE0aREt/OpAIA1y0kxij2dAYikL?=
 =?us-ascii?Q?xacBB85RCVjaH2Y7UtYYR/7h5thS/EvZcfwor/IqcdJeCbtexoUvn1kkz4WS?=
 =?us-ascii?Q?mQJCAcmC1NB6plYcHZ3pu2yHW0krY8Ivs8Xgi4p6N5eo0zeM/9pa2S7vkWG/?=
 =?us-ascii?Q?kao+30uyxtJGpCVKPqftpz83bihVPWYDS0lt9Mn4agG/dNuJt2xUNljvaXc7?=
 =?us-ascii?Q?TJRAGQhAOoGyPo4U+WUM81cmvl8rujCWHuDLApPAaENCCv+7/mJxXzgnHzvz?=
 =?us-ascii?Q?YDB+Q8XrxxGjIR3YADuNDuDcD89I9ZbEMHQhpwg4h+cj7+wQK1u1HCMx9FHR?=
 =?us-ascii?Q?q4Lji1K5s6kGLUiEVF9LNbMvIAwyh59XiVuyByPbBHN8XRRc+r3K9JYiQXIt?=
 =?us-ascii?Q?vW5vufP6DndG5x3Se0BFEX3pBX1QTfkoHYSMu/GMK93TcXX2W9xgv34VZTpP?=
 =?us-ascii?Q?BPsM7dTfru6w/zBPdg7kzg/rdJ0dK9M4lXcL68s/dlgelwTAmwKvHTy1qJg9?=
 =?us-ascii?Q?nPGG/Q+Io+YaIGGy0giM+24ThjGooD+dHJmPZc5wb0hzmivXiUMHFAm5HgnN?=
 =?us-ascii?Q?ZkogvnPdzRFO7QAIjxKdAZgFyDvBy07FrloeWY5CunO1E/puvOklTEB2Ugkg?=
 =?us-ascii?Q?OnQh7fn1ONn4LuTkmTT8CgjLOJlb0x2IF7v32EqsbBkkhjW1pfzohrHh+xJW?=
 =?us-ascii?Q?XWV+1dtaR69L2O5DV8Ra6dgHKjXA3Br7nTe58ByLOTUL6L/z5N2ZGJJI9YOr?=
 =?us-ascii?Q?kg/wLgNT8DCh/29yrMLMxaLIbEi01oaBKQ4PfYpNrpfAGvWjYrQy/WSA5C5i?=
 =?us-ascii?Q?gAYTCkFOJ3N+e08aaIobSFQ1WeXdNwSGYIcuEfCszty9dzKH1McffiOSeMtL?=
 =?us-ascii?Q?tZWtZEWCkVSImlBrYhRDTd6ei10rc93zGJ0oxv9wAvHXAwOAfedFuZ8mvAF8?=
 =?us-ascii?Q?/erW5DjX+aRcSxx5UGtcsmryGtnPaqfolgpq7JXbs+aIW/qdw4s3MDcgi6WT?=
 =?us-ascii?Q?KRTkyWdIBYZibH0vkN/hVnjhmWGTJXJwBFTr7A7Vqea5QrMoryrOVrwJCgKO?=
 =?us-ascii?Q?5yqiAzlBLaTRzCnATxL8yJihC54QR4JFjv7HsIvbaMdLLKK1I111kxlQdnMc?=
 =?us-ascii?Q?48gAZi5/Nu9Ofn1MkcIDgIb8PXmIP2HSfN0cc8KbrABWXIaOp8liHFnS/VLa?=
 =?us-ascii?Q?zaRtwg21BIN1seuNrOLEKXFDM79VOdFbQgFQ2D0SlOmlyuqeJxiWHbqvFLA2?=
 =?us-ascii?Q?qKPeMP7RTiaELUJE4PsJR1cK+Rxwxs4eywiLqed4n3S8AJzYjRzXyLp35NKH?=
 =?us-ascii?Q?kEqPoUFgyfort8y4X47supXKGsizWyZtn/UGElo0FFwLFoH/TiQr4oYCWwSO?=
 =?us-ascii?Q?r5QnJgZqL0qtHtKVRdv28C8mdu7rY2QLXdUu?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 16:28:52.6920
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 962ca314-723c-42cd-236b-08dd8f169622
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B074.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7499

Add a function which defines which vulnerabilities should be mitigated
based on the selected attack vector controls.  The selections here are
based on the individual characteristics of each vulnerability.

Signed-off-by: David Kaplan <david.kaplan@amd.com>
---
 arch/x86/kernel/cpu/bugs.c | 55 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index a938fb4add65..3dce7c3126ea 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -311,6 +311,61 @@ static void x86_amd_ssb_disable(void)
 #undef pr_fmt
 #define pr_fmt(fmt)	"MDS: " fmt
 
+/*
+ * Returns true if vulnerability should be mitigated based on the
+ * selected attack vector controls.
+ *
+ * See Documentation/admin-guide/hw-vuln/attack_vector_controls.rst
+ */
+static bool __init should_mitigate_vuln(unsigned int bug)
+{
+	switch (bug) {
+	/*
+	 * The only runtime-selected spectre_v1 mitigations in the kernel are
+	 * related to SWAPGS protection on kernel entry.  Therefore, protection
+	 * is only required for the user->kernel attack vector.
+	 */
+	case X86_BUG_SPECTRE_V1:
+		return cpu_attack_vector_mitigated(CPU_MITIGATE_USER_KERNEL);
+
+	case X86_BUG_SPECTRE_V2:
+	case X86_BUG_RETBLEED:
+	case X86_BUG_SRSO:
+	case X86_BUG_L1TF:
+		return cpu_attack_vector_mitigated(CPU_MITIGATE_USER_KERNEL) ||
+		       cpu_attack_vector_mitigated(CPU_MITIGATE_GUEST_HOST);
+
+	case X86_BUG_SPECTRE_V2_USER:
+		return cpu_attack_vector_mitigated(CPU_MITIGATE_USER_USER) ||
+		       cpu_attack_vector_mitigated(CPU_MITIGATE_GUEST_GUEST);
+
+	/*
+	 * All the vulnerabilities below allow potentially leaking data
+	 * across address spaces.  Therefore, mitigation is required for
+	 * any of these 4 attack vectors.
+	 */
+	case X86_BUG_MDS:
+	case X86_BUG_TAA:
+	case X86_BUG_MMIO_STALE_DATA:
+	case X86_BUG_RFDS:
+	case X86_BUG_SRBDS:
+		return cpu_attack_vector_mitigated(CPU_MITIGATE_USER_KERNEL) ||
+		       cpu_attack_vector_mitigated(CPU_MITIGATE_GUEST_HOST) ||
+		       cpu_attack_vector_mitigated(CPU_MITIGATE_USER_USER) ||
+		       cpu_attack_vector_mitigated(CPU_MITIGATE_GUEST_GUEST);
+
+	case X86_BUG_GDS:
+		return cpu_attack_vector_mitigated(CPU_MITIGATE_USER_KERNEL) ||
+		       cpu_attack_vector_mitigated(CPU_MITIGATE_GUEST_HOST) ||
+		       cpu_attack_vector_mitigated(CPU_MITIGATE_USER_USER) ||
+		       cpu_attack_vector_mitigated(CPU_MITIGATE_GUEST_GUEST) ||
+		       (smt_mitigations != SMT_MITIGATIONS_OFF);
+	default:
+		WARN(1, "Unknown bug %x\n", bug);
+		return false;
+	}
+}
+
 /* Default mitigation for MDS-affected CPUs */
 static enum mds_mitigations mds_mitigation __ro_after_init =
 	IS_ENABLED(CONFIG_MITIGATION_MDS) ? MDS_MITIGATION_AUTO : MDS_MITIGATION_OFF;
-- 
2.34.1

