Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2061.outbound.protection.outlook.com [40.107.243.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E37A22DA1A
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 16:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746808148; cv=fail; b=LhOggso8/P280dnQuAL2fRHH2TQxntNO+KyQz48OwC+g0CeiaALe4IWP78tG4AXELuSfv9MTQM+wDVXdICCxuoy4I08ARuo8oo0bsBetW8F9sWS6MqJCztsKeoISkbhEA/uhdBlprK08AMgB8s3rY1QPZrvJ8BhDJuLRUeVVUIQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746808148; c=relaxed/simple;
	bh=AnJXAq9P6kM8i9u6iFMnedZ+BFxBd0nqR4NB3zporMY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eeRNGCy1uiJMtg9Ay+BVHcSCLAbScTgt2ULDMPxVU5j0xzPfgDEoXQJS6VhxkBamQDZIl1jFrClYiUBAuklfTghLdMzqOV3qK1wDDhR0KZubcFYREmznqhJQ6ijyNKkRwnDj9nlsS5Vl99GkXh4A6kf4oW/1hgBrKNKI8pQST7U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=vt8+Rgg8; arc=fail smtp.client-ip=40.107.243.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="vt8+Rgg8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I19JfmMef9kkfXqomd7G5l0+PnFKBkIzK8y5ETJ0Ei25uZE7Usl4mdXubsC+MpgoiWXQ3lu8zXjH7CdJZsfZkkMz7mUUCHHrj57FQYiY+aau4T1HPNJfXfKZNW+OImUKO8g4ctBeYLfx/k3kXM88P6QeWkY/C598lroox+4gCHPbcaAWE/zh+uEZQZp54sQtbCaeBQgck5uV6vtjJ+H1r/1v8nJcNhyhc+fGYJaz/wCXYOaC4K2aRliAv5DDArCMS8JZdZ0FCT3J+8oLJW4z+ALMXbhktOLEhcCySKHj4kEuUm5AsprvUitJWRYhhDFgLi5TODmnf/22f1V1oTs/cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wou7asFIe0VOjM1zM9rLsm+/8/HkGmEZFxSnVqocGg0=;
 b=RjS45S4+dRQ9c84YWpm7NGboaq8HjAOhAu0urfLet7cvo7P/Urd4DArBI5Blll9+P9b6P8Rk43QUDW+jmH6u69Aa1+qLC6Sx+7lP+uN3CZUfWPAdzBeR/oxN5savU+xqMSZd6RCH9JjTmGOnmH/QBG1PCAUTniOcUQhc8jKgUpvYfB9kn2ugv4xj/oI7kaYSNv0BGL6jo1NuDMURGLNc+5PjUxDSwJ79oyqtEAV09gY4oNflF2OOTToe16E3yogXuPIP1Rx4EDAKJg5QSx3EJUw7cZfpgp4Ag/k0xX6UcTyVBcviRbyG8woep8mPeSE16AqYnTe5LXfKwKiqYXNfBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linutronix.de smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wou7asFIe0VOjM1zM9rLsm+/8/HkGmEZFxSnVqocGg0=;
 b=vt8+Rgg8bhfYmVXOeYxp+dWT0UmbAKKihM6K9dXyJSkeELKFmSiQMGQ24IZ828F9AvlhThCm3bLfqb+UXYm8Ww0mMex0OamgvjMOAv95QRVSfxzGEsRRrOF/G5IIT9gGkaKn8j+CWpwcDXIGUbSlYaeWo+mSOzCsDU63FzDyFV4=
Received: from BL1PR13CA0113.namprd13.prod.outlook.com (2603:10b6:208:2b9::28)
 by CY5PR12MB6479.namprd12.prod.outlook.com (2603:10b6:930:34::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.22; Fri, 9 May
 2025 16:29:03 +0000
Received: from BN3PEPF0000B074.namprd04.prod.outlook.com
 (2603:10b6:208:2b9:cafe::c5) by BL1PR13CA0113.outlook.office365.com
 (2603:10b6:208:2b9::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.19 via Frontend Transport; Fri,
 9 May 2025 16:29:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B074.mail.protection.outlook.com (10.167.243.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Fri, 9 May 2025 16:29:02 +0000
Received: from tiny.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 9 May
 2025 11:28:59 -0500
From: David Kaplan <david.kaplan@amd.com>
To: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Ingo Molnar
	<mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	<x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>
CC: <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 14/20] x86/bugs: Add attack vector controls for BHI
Date: Fri, 9 May 2025 11:28:33 -0500
Message-ID: <20250509162839.3057217-15-david.kaplan@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B074:EE_|CY5PR12MB6479:EE_
X-MS-Office365-Filtering-Correlation-Id: d2661487-ee37-4b06-ceba-08dd8f169c23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zu43s5tgKLlgQPxFVsgpNcMrCeSVY7P7AYR6aFk7anS6Y2DiTauCIJK5nsBG?=
 =?us-ascii?Q?97mu5InltsvTsYTT2CRTBqOmAi0jrNS4g/htRa5zw0sib92aMNa+n2fWwlLo?=
 =?us-ascii?Q?9K5DGxGpeup/vxgjYPVg10RlsSMm92QngMDS1Og1BKXAPJKbTzgy0DjOmDg7?=
 =?us-ascii?Q?eswmi4oCsXcBpNM6MFJuqSZsh/NahZ86dVJhfLzwCdX+0yROjOa2wWOXlTZo?=
 =?us-ascii?Q?fVAB/21/QdPjIyu9rYuB8eGDQYTMcL+cyuUICMEvleDpfgk6833H1gE6+Na7?=
 =?us-ascii?Q?i0+BXiOyRpkw4lj/YDti1rzAGH8wjyRs56DoAn/9GuRT2+niwdGhiompmInj?=
 =?us-ascii?Q?vqPx6CWoDFIHo4vWnmk9u4P7PzRYy38FUDqN+Ff+wU1SBjYBpaDebmqz8013?=
 =?us-ascii?Q?lSno/TfKcBjoLnD5HiRP/rMj67W6m0IG5/y2T5cUWK8nXDvlVcWVQ7slK50s?=
 =?us-ascii?Q?QA0WS+aFSKhaixVs2GpqWdertIzYO8fIBayPhnKPIEMCX3+NDvmbSxlnXhcR?=
 =?us-ascii?Q?3wZbqO+psUcFm7o/sfIxpl9JYFQWplEIUPRigXC+CNGFju3g3zDD7NRqmV5i?=
 =?us-ascii?Q?ReqPtPZOaNM7zf1YigW6Q9qd9/QXrru6b2h53jqPbAnGEPu3F7MHP7d2Q7Rs?=
 =?us-ascii?Q?pZise0iJogY1pAQlxqLJ9ylYe2MOLS6N79RXVgla58DSwLyCfHD57RD+qWJ5?=
 =?us-ascii?Q?LHVUXd0aGeI3Ppw9BFzK+ZmhJJUgv+9ic95+w+3SUapqN1A6sH+P50jT7zDM?=
 =?us-ascii?Q?uzqOSbwhjOKBZuUtjzmL9GEzgEshN5qZhMtC07ALI2KsdLkQDOLlcW/dn5s+?=
 =?us-ascii?Q?EkPJObTWxlLQidYVjfOvQKwD/S5TeECLGU2X/Edqudox6Hs3BjukKCDKFMYQ?=
 =?us-ascii?Q?vUZ5pDBD5LANXkoiNBvFFg1tl3kdlzEgFuXjMF94JvGwUuD47mC2Hf0BoH7O?=
 =?us-ascii?Q?Q+GNEdoTAfObqtSBSVpP8Ya3YDNgENb/LMbK/zQTg2cgDxUBkG6ed5+zHiK1?=
 =?us-ascii?Q?ObEWGpPjvIw+sDAxdX323O7SFP2gwlS1AyUmCvfrOhYaNaBoUdCBQeGu8Xmx?=
 =?us-ascii?Q?B7RjFCXyVgKBo7hs3+xpSWtEWY4MF6dwms9677Fcv1SLljsBhxPpEMZWIacc?=
 =?us-ascii?Q?EjMgCCkUs7iGB+S/1nMzMhltd4bmKWTSMi/ZH6cT4wPk9xDC+RxkdZX0KsEx?=
 =?us-ascii?Q?NSOlF/hAGrnUMnjDdU+GpyJ8hQrxt1sa+Fmv2YqA/IC2hEeOHmetXJmskcTq?=
 =?us-ascii?Q?maGxMZKO6sE+p5VjH7WL4+zAz0xlwVspe+xPk40E1FGB526qkBnp+B+298mU?=
 =?us-ascii?Q?jiPUtbOwRmgcIc5nbyZKDuwMZcOFymvcjc5lnr6qAJnCImHj5MCg8skr/cw6?=
 =?us-ascii?Q?RKqWJbkbluxPaavaRLEm6xTXBSbFnEb4Xj9zSJFON1enH610HulRTFIqSAVm?=
 =?us-ascii?Q?doY+gKYxEpqJgCoJUX9fGVtbczYHPlEGA+x0y6okHTSyhC9o7Kqh+WXcSgSc?=
 =?us-ascii?Q?jytZtDA+neTCN/mK3pkHfjM1NJfCBXhldTDD?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 16:29:02.7698
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2661487-ee37-4b06-ceba-08dd8f169c23
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B074.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6479

There are two BHI mitigations, one for SYSCALL and one for VMEXIT.
Split these up so they can be selected individually based on attack
vector.

Signed-off-by: David Kaplan <david.kaplan@amd.com>
---
 arch/x86/kernel/cpu/bugs.c | 38 +++++++++++++++++++++++++++-----------
 1 file changed, 27 insertions(+), 11 deletions(-)

diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index 305a11fa9521..667385808400 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -1905,8 +1905,9 @@ static bool __init spec_ctrl_bhi_dis(void)
 enum bhi_mitigations {
 	BHI_MITIGATION_OFF,
 	BHI_MITIGATION_AUTO,
-	BHI_MITIGATION_ON,
+	BHI_MITIGATION_FULL,
 	BHI_MITIGATION_VMEXIT_ONLY,
+	BHI_MITIGATION_SYSCALL_ONLY
 };
 
 static enum bhi_mitigations bhi_mitigation __ro_after_init =
@@ -1920,7 +1921,7 @@ static int __init spectre_bhi_parse_cmdline(char *str)
 	if (!strcmp(str, "off"))
 		bhi_mitigation = BHI_MITIGATION_OFF;
 	else if (!strcmp(str, "on"))
-		bhi_mitigation = BHI_MITIGATION_ON;
+		bhi_mitigation = BHI_MITIGATION_FULL;
 	else if (!strcmp(str, "vmexit"))
 		bhi_mitigation = BHI_MITIGATION_VMEXIT_ONLY;
 	else
@@ -1932,11 +1933,22 @@ early_param("spectre_bhi", spectre_bhi_parse_cmdline);
 
 static void __init bhi_select_mitigation(void)
 {
-	if (!boot_cpu_has(X86_BUG_BHI) || cpu_mitigations_off())
+	if (!boot_cpu_has(X86_BUG_BHI))
 		bhi_mitigation = BHI_MITIGATION_OFF;
 
-	if (bhi_mitigation == BHI_MITIGATION_AUTO)
-		bhi_mitigation = BHI_MITIGATION_ON;
+	if (bhi_mitigation != BHI_MITIGATION_AUTO)
+		return;
+
+	if (cpu_attack_vector_mitigated(CPU_MITIGATE_USER_KERNEL)) {
+		if (cpu_attack_vector_mitigated(CPU_MITIGATE_GUEST_HOST))
+			bhi_mitigation = BHI_MITIGATION_FULL;
+		else
+			bhi_mitigation = BHI_MITIGATION_SYSCALL_ONLY;
+	} else if (cpu_attack_vector_mitigated(CPU_MITIGATE_GUEST_HOST)) {
+		bhi_mitigation = BHI_MITIGATION_VMEXIT_ONLY;
+	} else {
+		bhi_mitigation = BHI_MITIGATION_OFF;
+	}
 }
 
 static void __init bhi_update_mitigation(void)
@@ -1969,15 +1981,19 @@ static void __init bhi_apply_mitigation(void)
 	if (!IS_ENABLED(CONFIG_X86_64))
 		return;
 
-	if (bhi_mitigation == BHI_MITIGATION_VMEXIT_ONLY) {
-		pr_info("Spectre BHI mitigation: SW BHB clearing on VM exit only\n");
+	/* Mitigate KVM if guest->host protection is desired */
+	if (bhi_mitigation == BHI_MITIGATION_FULL ||
+	    bhi_mitigation == BHI_MITIGATION_VMEXIT_ONLY) {
 		setup_force_cpu_cap(X86_FEATURE_CLEAR_BHB_VMEXIT);
-		return;
+		pr_info("Spectre BHI mitigation: SW BHB clearing on VM exit\n");
 	}
 
-	pr_info("Spectre BHI mitigation: SW BHB clearing on syscall and VM exit\n");
-	setup_force_cpu_cap(X86_FEATURE_CLEAR_BHB_LOOP);
-	setup_force_cpu_cap(X86_FEATURE_CLEAR_BHB_VMEXIT);
+	/* Mitigate syscalls if user->kernel protection is desired */
+	if (bhi_mitigation == BHI_MITIGATION_FULL ||
+	    bhi_mitigation == BHI_MITIGATION_SYSCALL_ONLY) {
+		setup_force_cpu_cap(X86_FEATURE_CLEAR_BHB_LOOP);
+		pr_info("Spectre BHI mitigation: SW BHB clearing on syscall\n");
+	}
 }
 
 static void __init spectre_v2_select_mitigation(void)
-- 
2.34.1

