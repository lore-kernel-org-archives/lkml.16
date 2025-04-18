Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2081.outbound.protection.outlook.com [40.107.93.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6441F214818
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 16:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744993061; cv=fail; b=ATKhXUuJQCrUEG+Or3ytnqnn4zZxCIUgNas+ZumMgZNIyewNRCc9i9cev/2DWxeNwxf9gYJEdzXOxrzYjVtjV32QUlvXrH/8frtrB3IMZkjsBkAAdXC39zYBjrXJ88oE6u3IaZKJcY54sXA+sPbfByQXEnl3ot1eURaSydrDgGI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744993061; c=relaxed/simple;
	bh=XNvtrobeV3fa/Oa6fqr8paCOsEQYv/zDChNpq0Wzbi8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uzaNwXnRTRRkXVDUBa3ipP/niNrZj6BfgVBjP8rumzgJm+ocel/k8kol49boGGJ57nS624uQPIdwhk+cyselHk2vMIBJTGH8BAH5nuHfJxzY1jSVkYrRQaiNpcrcATkVN4z53eeBxMNw610cJELFjgjHKSooSB/ASfde+6sPKL0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=pIHdKeGH; arc=fail smtp.client-ip=40.107.93.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="pIHdKeGH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CBPfRFA9qUtGyO/TZRHV3xGmXnh/IQWzMuh43crKVephMDmHENEnuTG1yqdOr34DNAwYMxocpYRNE/mhl7zBIejb06qHdvO4g8YU+u6QngVxu5bDqT6AlR6kUmzHDH+VQ+3ce6boiUJabAL0lMp2bZIrEDF9Vj9fFqQOa8+tGNMzS4C7QvyFeEoX5Z/2TAcqaHHW3eC23nuN9YcK+W+Bh18SIIgt73wj/eagRO0RNK4z3Dvt7eReKgQAGeLdpQwBBIx//paJqLBHBhBQ+6pI5xbvWAMhGxNjZJHWp/PFJSQSzhHj/D/F8H2XlRHQDEKGcwqYRQ7wKTkLsOaR6vdKVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3UC8iUNiZI3An+6Fp0SxQRycBHPiFb4heK3UoIlMlLA=;
 b=Rrs7bgyBWdtxRSEK7byVsf4FuJYZbASVj1umdSY5iEhPciWdPWSS21MuIutUf8PAGwlm1PI4FKwWbvRiaVBc1IT4470m+WyD1S85PFJ6Tq9vTkMH+3NKT3dPGpjs2hY9QEJbM08rYvLudTlBSAnNr7ViPPzTTiFS1WgFHNtBK7D1/BfR2MAnqrKIAUsF+iTEpZDPy2We479bESSnNwcsUBaQV1QzsTIrbMbjgRzbazhGrhJ/HNIo+RBo5foGetXsH8CZe42Fhky1iQh/CUMdrwtEQYhDlHcdnjhvAT0UJkJMWP1aCvYu4sAlkajg7MT30il9DbZKa3+s/mOP3SdBZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linutronix.de smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3UC8iUNiZI3An+6Fp0SxQRycBHPiFb4heK3UoIlMlLA=;
 b=pIHdKeGHQ+FwGfURJN5eN35KVLvdQtfj667X20cPHqdiAy87Iqufb3aK9HCZ4USKZErhlszKMTKSMkhS3JFbM2mNsttFAD74PmsYqMNGto52+u5oQ+3RUz0mtwnlR83l3KcnjTHPzoYhYmqrkZVjlCs5+NcH2W0/1QLfKLSgV+4=
Received: from CH0P220CA0007.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:ef::15)
 by DS7PR12MB5720.namprd12.prod.outlook.com (2603:10b6:8:73::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Fri, 18 Apr
 2025 16:17:35 +0000
Received: from DS2PEPF0000343E.namprd02.prod.outlook.com
 (2603:10b6:610:ef:cafe::fa) by CH0P220CA0007.outlook.office365.com
 (2603:10b6:610:ef::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.23 via Frontend Transport; Fri,
 18 Apr 2025 16:17:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343E.mail.protection.outlook.com (10.167.18.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Fri, 18 Apr 2025 16:17:34 +0000
Received: from tiny.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 18 Apr
 2025 11:17:33 -0500
From: David Kaplan <david.kaplan@amd.com>
To: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Ingo Molnar
	<mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	<x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>
CC: <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 04/16] x86/bugs: Restructure RFDS mitigation
Date: Fri, 18 Apr 2025 11:17:09 -0500
Message-ID: <20250418161721.1855190-5-david.kaplan@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343E:EE_|DS7PR12MB5720:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bee3714-7c43-4c4c-869d-08dd7e948777
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?f1rAbZb5Npj/3F2tt6knztyPP+9q6QgVIVnSxImDwUZ+qVgOnL3oQwdCi0v1?=
 =?us-ascii?Q?RijszOaIIxaoqEa5G1UqeZZoGEj3ftOfxlfs1o1cjvmW3rsRLNkdETPkPRl1?=
 =?us-ascii?Q?gsqiqdYaN98UBYWSgUZGxspw1f98vAgnTrOvFlSdZCl82lMjExP4J1R33Vvy?=
 =?us-ascii?Q?4nREUbE4aQ4pksUcRgw+d8ryyCQdmWPzOyPTiGXQPSCEWOVSv6JREUJd6rd5?=
 =?us-ascii?Q?6zwxYjSbPKyhm1VX3KHw1TnsMYS83vVk2ROS3bbYupXJERjL/B3I9xc3v4wd?=
 =?us-ascii?Q?2YJX3EVbiM6J4tFEED+nfrfXdAg6T6tXntoMq8BDUgxEngszqTkFgEET9hrX?=
 =?us-ascii?Q?Mjoxji/uY33hfOJyYj8Pc9ew3tWn5VakEpQR9RWyt1e4R2q1ztZ/HT6XJLZZ?=
 =?us-ascii?Q?GGKHd98ngQoTG6hhRLCHUFyavPDkdJBj/cnp/AspHSMBsWocwbor/LB5buW4?=
 =?us-ascii?Q?+Q+EYIbiBki1S4BaDf5r1S7G9Wseqa+AikdrSm4SN4wEFaqVR89PxGFdBZAX?=
 =?us-ascii?Q?9CmpvYdEY67vTVaAFZ/wihEFSFswpbJLntsTDIbFmpFSql6RcTMi6EhOVjS2?=
 =?us-ascii?Q?+GAf/DFCiB/l1IW2eEfuNMqySXpB4pHQiE0M8NpiB/6aqm1jEe4qjblReY6P?=
 =?us-ascii?Q?qx+yR5kcmV2SQIwXRic6jUK0i6dpfEP2C2+B1bW2/j7USt+UDUO0JEkbREYV?=
 =?us-ascii?Q?7rNj+vt0jDzgPDHNxfJq6QycejPh8Dy0UNfdwxs6WXl9UikyTjwifIezh+wz?=
 =?us-ascii?Q?x0BEl0EbHT9pCvescTD2OEIEHS1AReItpWPr38BmcPsXlfmSwcFUSouSv4YD?=
 =?us-ascii?Q?l8HCPlYkPr3mO3M3Qh5wnK3fLAVGaEFRWOBrQJ2rxgvloZDOGJPtuDWw6U7z?=
 =?us-ascii?Q?jiedwpydRzZCNCGUlHZwRjq0rfbGxWxwDuH/O4EPagaGuG6SRJwTuzdCD+eT?=
 =?us-ascii?Q?Kcnm5hv4mtaVgVLM3fMmAPkluMkeMwXO7Uz+oiUJla/+uRnDAkzPPkU0zPvx?=
 =?us-ascii?Q?5MiCAtcXXA10OhiJIzCPL/u0ES/f29XhIqwqZ5PAPVVs1MmV/mj3unlXTbGX?=
 =?us-ascii?Q?w93/ZNBwrdMapnQ8RJ+/alvSQ+VklXkEXObxju5LacOZAxM/Sj//vtM+y+xH?=
 =?us-ascii?Q?9dGQ1Dklg+UxD9LfwjS/4Wrpy9bBpTTINlWrbnj2eql/ZdvYoptdI194ihQE?=
 =?us-ascii?Q?6aT1WjkGwVs0Gbb+PWXasr121LLAHxhvv1yhCDaUscfncZm5XFOGGQ+JWniU?=
 =?us-ascii?Q?eoxZ66p5HXGrKayxa9ly6wG/eQNFeXJwiC1eMHWyYnJDJTlO1Bk6HJlAvocx?=
 =?us-ascii?Q?QWcif8DnOVYNxsWGjzaLQ5PHK8oigSOKd3WsxdVfYRVKeuFbAQj7rgZvtRHL?=
 =?us-ascii?Q?gp4qjq2EicI55rxoVDz7lf/1EzGtXBu+JMNLY30EXuYqJC5TmrFPlH9XeaH3?=
 =?us-ascii?Q?W6G/D6etDkOe8TjsQhxxrX2CRlV2kZVoocC//LYpiUJ8WK/QyCLUtwYV/lvo?=
 =?us-ascii?Q?pT1wKDkP3ts5G9z6zIBFh66Mcswfda0aBatG?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 16:17:34.8656
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bee3714-7c43-4c4c-869d-08dd7e948777
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5720

Restructure RFDS mitigation to use select/update/apply functions to
create consistent vulnerability handling.

Signed-off-by: David Kaplan <david.kaplan@amd.com>
---
 arch/x86/kernel/cpu/bugs.c | 41 +++++++++++++++++++++++++++++++++-----
 1 file changed, 36 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index 28b55a7457bc..303718689aac 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -70,6 +70,9 @@ static void __init taa_apply_mitigation(void);
 static void __init mmio_select_mitigation(void);
 static void __init mmio_update_mitigation(void);
 static void __init mmio_apply_mitigation(void);
+static void __init rfds_select_mitigation(void);
+static void __init rfds_update_mitigation(void);
+static void __init rfds_apply_mitigation(void);
 static void __init srbds_select_mitigation(void);
 static void __init l1d_flush_select_mitigation(void);
 static void __init srso_select_mitigation(void);
@@ -200,6 +203,7 @@ void __init cpu_select_mitigations(void)
 	mds_select_mitigation();
 	taa_select_mitigation();
 	mmio_select_mitigation();
+	rfds_select_mitigation();
 	md_clear_select_mitigation();
 	srbds_select_mitigation();
 	l1d_flush_select_mitigation();
@@ -218,10 +222,12 @@ void __init cpu_select_mitigations(void)
 	mds_update_mitigation();
 	taa_update_mitigation();
 	mmio_update_mitigation();
+	rfds_update_mitigation();
 
 	mds_apply_mitigation();
 	taa_apply_mitigation();
 	mmio_apply_mitigation();
+	rfds_apply_mitigation();
 }
 
 /*
@@ -620,22 +626,48 @@ static const char * const rfds_strings[] = {
 	[RFDS_MITIGATION_UCODE_NEEDED]		= "Vulnerable: No microcode",
 };
 
+static bool __init rfds_has_ucode(void)
+{
+	return (x86_arch_cap_msr & ARCH_CAP_RFDS_CLEAR);
+}
+
 static void __init rfds_select_mitigation(void)
 {
 	if (!boot_cpu_has_bug(X86_BUG_RFDS) || cpu_mitigations_off()) {
 		rfds_mitigation = RFDS_MITIGATION_OFF;
 		return;
 	}
+
+	if (rfds_mitigation == RFDS_MITIGATION_AUTO)
+		rfds_mitigation = RFDS_MITIGATION_VERW;
+
 	if (rfds_mitigation == RFDS_MITIGATION_OFF)
 		return;
 
-	if (rfds_mitigation == RFDS_MITIGATION_AUTO)
+	if (rfds_has_ucode())
+		verw_mitigation_selected = true;
+}
+
+static void __init rfds_update_mitigation(void)
+{
+	if (!boot_cpu_has_bug(X86_BUG_RFDS) || cpu_mitigations_off())
+		return;
+
+	if (verw_mitigation_selected)
 		rfds_mitigation = RFDS_MITIGATION_VERW;
 
-	if (x86_arch_cap_msr & ARCH_CAP_RFDS_CLEAR)
+	if (rfds_mitigation == RFDS_MITIGATION_VERW) {
+		if (!rfds_has_ucode())
+			rfds_mitigation = RFDS_MITIGATION_UCODE_NEEDED;
+	}
+
+	pr_info("%s\n", rfds_strings[rfds_mitigation]);
+}
+
+static void __init rfds_apply_mitigation(void)
+{
+	if (rfds_mitigation == RFDS_MITIGATION_VERW)
 		setup_force_cpu_cap(X86_FEATURE_CLEAR_CPU_BUF);
-	else
-		rfds_mitigation = RFDS_MITIGATION_UCODE_NEEDED;
 }
 
 static __init int rfds_parse_cmdline(char *str)
@@ -706,7 +738,6 @@ static void __init md_clear_update_mitigation(void)
 
 static void __init md_clear_select_mitigation(void)
 {
-	rfds_select_mitigation();
 
 	/*
 	 * As these mitigations are inter-related and rely on VERW instruction
-- 
2.34.1

