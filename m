Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2082.outbound.protection.outlook.com [40.107.237.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C2A237704
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 16:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746808139; cv=fail; b=SjvNS4esqDGUt4JXBfiaf5Z+UJ5l0fN3Wc9mzFX0tqFeFXlfC9/IoxLpcE9/oHXYoTd6o6NeaEbj2wcw61rne2ibyjvnNabkc2TzEAyFlREkg7HH2EgU/QM/hkmtfDkJhmChY45aSwZgJpeaIfqQpgD0ugD9J9MXqVHG5M6M4sA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746808139; c=relaxed/simple;
	bh=3t++Ft/BcUxG0KUCxHtxPOeE7qQ5Xcscg/OPIpU1wkw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gCTA43J/EOw5LWuwgDQLA6ZnaqHIRkJvEvQTZgECQVkE0Ab3hnQ88dh+v92ypEARKzsFCDWw9RU0Qf8vOC/k3qbTj0fKLgagumlATQOW2SZrkx2MLk3tiGe+nmwwYKh+dtL/AChxXf6dOHHUsBpaXO2AYgkS6ei1WHRn/gKa/04=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=qvAr1h3Y; arc=fail smtp.client-ip=40.107.237.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="qvAr1h3Y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pTmVDorjVPdw2bT5ngAlfTd/3LL2MkllHm2MX6bOSYqTCHxzPfOJYK3f98rVjseY6V7GGt+y8SOmUb1h6yX1bhXgp1ri5anScJcdZCyiswQ/DBXVuqqL0Evyx/X2k8AnGY+FXKEM7mFdJltizEco6UAjlk4lJkSQ0yUAhtz1jxJNw3Hi3RjJEkvB5Hw0tSm40+USYJBOGLWAFjnOZuer2iVjGFZs4R2kDR/+7ol4vULLYwnIdhoAsNAT7BcbfBDx/EJnRctcgbreME7X0MchJ3jhoxA7/Cif1LigOs6vd/jfbQknAzC7/k/WiLyXVMbHp9rVLlHoSeq75BKQPnVx0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U4EPDzqvITkQU6HQkH+B26p7c2PAnFHwKIhDpQ8OVik=;
 b=xGjeVLqwlu2G3uCx9eA4fmdQkCtAMXRH0AGEQ3ijKSrLWOk58sCg5gUYgkd3dEIugU+Jo1KU1rqime4X019N1rZtVICMc349fcYrcsHzvDUxR2/ZWo/npDbtIie/3PWiDzifjSczLf5u9v5B4At3ldqUGRuRcSnqhBPubH7pIa+AdKHmCwCRXoXe9tTLNoNnhVTAKoQyWXil6aFHakigdYHxueN/HzmkeBWhk1OXS224Yf3W6F/fo7wKMhtXYVbAYCZmVoU8YHgD2iJzg5i2C2FfWHq5t0Z+SXcw09/hVxOVoho9wnUWi9SnrUHoOy2XGJmt8ESidEkvkrDBJxzffQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 165.204.84.17) smtp.rcpttodomain=linutronix.de smtp.mailfrom=amd.com;
 dmarc=temperror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U4EPDzqvITkQU6HQkH+B26p7c2PAnFHwKIhDpQ8OVik=;
 b=qvAr1h3YDyKk7UsVVVpfrQR97w72veXjnD1tXIR4jhpc+VfCeB0ISMzb0wbOko+efZ6zlIBTVY6WTHUjS4StGjE8D/CzxcaItQe4ltqad/YGiFI7X8WBVhhcfdOQUK1pvo0HAJRDhLR0B47eFKC0GzD+fTqJliBe1e0Goy6T8wc=
Received: from MN0PR04CA0008.namprd04.prod.outlook.com (2603:10b6:208:52d::22)
 by CH3PR12MB8354.namprd12.prod.outlook.com (2603:10b6:610:12f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.23; Fri, 9 May
 2025 16:28:54 +0000
Received: from BN3PEPF0000B072.namprd04.prod.outlook.com
 (2603:10b6:208:52d:cafe::11) by MN0PR04CA0008.outlook.office365.com
 (2603:10b6:208:52d::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.20 via Frontend Transport; Fri,
 9 May 2025 16:28:54 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=amd.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of amd.com: DNS Timeout)
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B072.mail.protection.outlook.com (10.167.243.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Fri, 9 May 2025 16:28:53 +0000
Received: from tiny.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 9 May
 2025 11:28:52 -0500
From: David Kaplan <david.kaplan@amd.com>
To: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Ingo Molnar
	<mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	<x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>
CC: <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 06/20] x86/bugs: Add attack vector controls for TAA
Date: Fri, 9 May 2025 11:28:25 -0500
Message-ID: <20250509162839.3057217-7-david.kaplan@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B072:EE_|CH3PR12MB8354:EE_
X-MS-Office365-Filtering-Correlation-Id: 5efa7740-52c2-4ee3-a43a-08dd8f16969f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|7416014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?p+VnyJfVqeX/67oKZY3kfuFJHuh9+umlWcXyNLlugU+CoJadU4MQPP9ynp3d?=
 =?us-ascii?Q?hszqEYqn3qrxx9TXpYwk02W9ar0X0i0eNIi8LUhxnxt/iUwz2lIG5wJoF0vp?=
 =?us-ascii?Q?8yDErMIibHpAt0rT6WOm+jH2dVi2oJhC/GNf0ghWpiSzg0Zb3ocXrooXaJ3t?=
 =?us-ascii?Q?EZOpT8yMuCzm89Ho8MMxUxxDz0WuQruqssIwnGAYvLqDeSbzwY44bx9QFuF/?=
 =?us-ascii?Q?rFy1G7fEW/aeXtaj6qqje4PlqD72/P8MI8XooUfKKXWuuB4I4FIOYyFPt2II?=
 =?us-ascii?Q?Cvwa3tm6hGmhZyX2NloGxnMBfRBc3bMutsmlB1inVcz/D14WJLqXT6ijgrpl?=
 =?us-ascii?Q?RL8jdJrZ5a8SfC/zFZqEgj4WnAjmKfx1CDMsL9Ufy8Rh1dSXXLcHmPYGUV8u?=
 =?us-ascii?Q?bjYwcax+UGRFSrEe9Fi22dDzE2/1FjPmKCQ+THFNV+xOWQqfApR7Q7x/QDk9?=
 =?us-ascii?Q?pWQfBQDD2vuRqhHNcX88EoiietGFrY612T20LeW4XOPFyTZBpiW/FNUevfko?=
 =?us-ascii?Q?tGlUgfwRRFvC/q4ddkQxHhSm+kOTD1URtdS1rSaW9rV7CE4K1UIhblfJpCtm?=
 =?us-ascii?Q?9qVI63np5ao4mFVWw77LaiLpV7DcQs3XNXL8oPRn/1UmL6hAee/+gabHJzwN?=
 =?us-ascii?Q?yy95CgoJR7ioyj9Bn0hNR2Vb1vq169Qw8PK3wnjHcap4qpOFr0pB1R/g58Qp?=
 =?us-ascii?Q?//crfDBqJ5O/gWKh78aIrsfe+NyHL+SOB7KbdZ7184+BPzGj6w31Sr+TIZ4z?=
 =?us-ascii?Q?HaCFJR2dtgO2AlnCm/iwVVdvWmOLshGn8wSNUoJYbeihTvMz7q37ECkDCPBT?=
 =?us-ascii?Q?iTEox6zU8JWrTnhSvjtAe5SXIHiYRzKqDnnb6TyJvtDzvFdHQV51U17LeKIy?=
 =?us-ascii?Q?FctXVuTZ0GfR8HVqhGYl1+pKbaiRFoXmMmpeCbPaGOgtb08zrQpOMVb1eOMM?=
 =?us-ascii?Q?ZBJEyZf0jv6WbbAblNldazP/uios6q33RMy+2KaKeMSpUZ59mPoytkbUgb+z?=
 =?us-ascii?Q?QrJwcFrsKc0qUEA/WGny+yPZgwGS7PvIjsIpmv6gQptq+ec6Sf2HFxupMgII?=
 =?us-ascii?Q?qzVubtHjWiwV/AfGEgplzdDq6pW4ryjHIkQBp6+IKsrQtMO+dGLaBcUNB1uE?=
 =?us-ascii?Q?5vbte97tiazfY2oHF7AFJ7nZt+VsWbBAfoWjwtW+zXw1xhIDKU1UEy59dFt/?=
 =?us-ascii?Q?SdnErQMAcUra7pvv+Ta1DOQSOKBlZIL5OqkR5o80I8Ujn5z5S0PUF9vrzAE3?=
 =?us-ascii?Q?4QBXm85T2ipWUqdAnIBuIJ2WA1jUx3QM2eEEHOIv1oWwz99GkqZY7JySzw21?=
 =?us-ascii?Q?pwFtXIQUSo40ApT2/m2zsJVf5l5Z6aq5yoona2PvOwi/FJewDwNz4z6IHVxu?=
 =?us-ascii?Q?wNMdCQmVm+YYIBHcL6F+v05ssU6Lfuu9qPaKA1zHtc9Mr7g4I2AAv+QvdUlI?=
 =?us-ascii?Q?GxF2wuZiLvZfs+S6ufU+3OuzpFPwMj+YNJ54rCamCi2KjY987kVq2EOxYgPV?=
 =?us-ascii?Q?emZf+LJiRfRkKixIn821LVBmLsPMZhSRI3Nk?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(7416014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 16:28:53.5157
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5efa7740-52c2-4ee3-a43a-08dd8f16969f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B072.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8354

Use attack vector controls to determine if TAA mitigation is required.

Signed-off-by: David Kaplan <david.kaplan@amd.com>
---
 arch/x86/kernel/cpu/bugs.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index 97d152c33e9e..d57132cdbc21 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -516,12 +516,13 @@ static void __init taa_select_mitigation(void)
 		return;
 	}
 
-	if (cpu_mitigations_off())
-		taa_mitigation = TAA_MITIGATION_OFF;
-
 	/* Microcode will be checked in taa_update_mitigation(). */
-	if (taa_mitigation == TAA_MITIGATION_AUTO)
-		taa_mitigation = TAA_MITIGATION_VERW;
+	if (taa_mitigation == TAA_MITIGATION_AUTO) {
+		if (should_mitigate_vuln(X86_BUG_TAA))
+			taa_mitigation = TAA_MITIGATION_VERW;
+		else
+			taa_mitigation = TAA_MITIGATION_OFF;
+	}
 
 	if (taa_mitigation != TAA_MITIGATION_OFF)
 		verw_clear_cpu_buf_mitigation_selected = true;
@@ -529,7 +530,7 @@ static void __init taa_select_mitigation(void)
 
 static void __init taa_update_mitigation(void)
 {
-	if (!taa_vulnerable() || cpu_mitigations_off())
+	if (!taa_vulnerable())
 		return;
 
 	if (verw_clear_cpu_buf_mitigation_selected)
@@ -570,7 +571,7 @@ static void __init taa_apply_mitigation(void)
 		 */
 		setup_force_cpu_cap(X86_FEATURE_CLEAR_CPU_BUF);
 
-		if (taa_nosmt || cpu_mitigations_auto_nosmt())
+		if (taa_nosmt || smt_mitigations == SMT_MITIGATIONS_ON)
 			cpu_smt_disable(false);
 	}
 }
-- 
2.34.1

