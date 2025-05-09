Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2050.outbound.protection.outlook.com [40.107.244.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65EFC238178
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 16:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746808140; cv=fail; b=A3vQT/GRAqmcrBB/foI4Lds0LACTICdNpgcsRAKzARLfMLxZfVxV+jR/WVoSifkv9oW4xRDhJpdxRFcajd96ZQ8oIN/IY02HFlVK6lAHSPjIiOXsYEk+57KJYkj2RJWyCNRt3p40Xi6I4DgN2UABRanHDsTgEeuN0zZV/LKcOds=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746808140; c=relaxed/simple;
	bh=g1v5Wi4+A6Pfus8qQQk+PxxoAMd5MY5IZsgOmB+O41Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p7KkhxYJuYs43p+A4ZpCfEEj3TtD1IqXqkjPrNSbLNMSDYYUmGOd05dGkCxxwzlHyFWvtzAARkzeIcsXuJcrR974diDN1QoiMy2unykHhk5lOWlgIrW7BUvULtzhu225rg/+kNn+DNoLHtkBpnzgw3fUQTpg6sFHGBKnQV6nubU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=SAnWdsaB; arc=fail smtp.client-ip=40.107.244.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="SAnWdsaB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rBby5XGz7kiQoqT/q8Sn53rMRDiz2CJy1142F2KMCLJoerxnWDsdfKsYGpnJ2QAYq/Zzoj7VncxHvJRBSyK3y5OAfaxDU0hAd6iiWmW8MSMsg++JCsXjNaT6+DIXafy5DC0l8jh97FUSaSOCek34Mh9OOlOzi3NP0X+/jWUjntTBN9nHneSX9tYuyyBSDKhLcjM+lWfvYEgo2l0pk9wvmEL4kgPLgzaJ/1kP3wn0p/xxMqXGlXc7nq1eS1wr9+45K6btiiaGVhPFAk7lLpKi2C/H56QRQwDgosDiEhb5+k4Cn9QX+c9v9qhf3J0nbdwMj4uF/9bAwv0afwIMbCkDqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I1b912mjErWDaQWLui831BBpxiTUPYHTIyu3PXIdcgw=;
 b=cBfml/5RJCOEB6sW1n9nvSIzLttpQlk5e3k2Ay0M+DXuNIh4qaoKfh5Le/NUTa8W7QO3iFZShAhixmw+Iu+qK18Djt60PIxMgZ+vNVOpisinrtSo4AqqXDgciCx9ZrYu5Wxd+L6isKyKqzX+Q19h81QbAb0gLA04jsScSgTiBLWBkIYhsMIsmn5h8eWKDybAM6Pr7bZEvUZ32B9WlwjKLvX0UzWcDyaEswRlIbKVXMQWctf4VvSHopWKFKfs/0PlyXZYS29L+8DVHEyy+8U+Flke4nFVbLreWcD9aOqzhiyxb4OZSQcgvHbi5Q/mxbbrUT3lxmOxo5gIhlecrEmKzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linutronix.de smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I1b912mjErWDaQWLui831BBpxiTUPYHTIyu3PXIdcgw=;
 b=SAnWdsaBT7UnIe+5+jDLXAXfwN25fHqaO1FCabpRHjOCEeJ7TRSrwbxkL2GazDmr/IdQ87UFTMpO2c05cJxsjbnT9MsOLpUh87uCEHMsnU4T194GPzj3FZwJkVHhZcMYbFdeqOMWsgfFt8ZN73oc9iBy0B5sK2lGTJyfTEgPE54=
Received: from MN0PR04CA0005.namprd04.prod.outlook.com (2603:10b6:208:52d::9)
 by BL1PR12MB5850.namprd12.prod.outlook.com (2603:10b6:208:395::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Fri, 9 May
 2025 16:28:55 +0000
Received: from BN3PEPF0000B072.namprd04.prod.outlook.com
 (2603:10b6:208:52d:cafe::90) by MN0PR04CA0005.outlook.office365.com
 (2603:10b6:208:52d::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.23 via Frontend Transport; Fri,
 9 May 2025 16:28:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B072.mail.protection.outlook.com (10.167.243.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Fri, 9 May 2025 16:28:54 +0000
Received: from tiny.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 9 May
 2025 11:28:53 -0500
From: David Kaplan <david.kaplan@amd.com>
To: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Ingo Molnar
	<mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	<x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>
CC: <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 07/20] x86/bugs: Add attack vector controls for MMIO
Date: Fri, 9 May 2025 11:28:26 -0500
Message-ID: <20250509162839.3057217-8-david.kaplan@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B072:EE_|BL1PR12MB5850:EE_
X-MS-Office365-Filtering-Correlation-Id: 772b04ee-bd47-42c9-3995-08dd8f169770
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZX1b2dZ95SXkzzQ/P7I3dx6i9/GpOuGMThg4cfUghgmW81hJGvUqTtUrqN2z?=
 =?us-ascii?Q?DSwms1rTscl0rPdbcphN/n33/yo6Ea6Vzd1rEvFNUu1BnPlrHSRJZ1wg/GpD?=
 =?us-ascii?Q?TWTjO8p0J2q8YQtazyGpZ/awFDB/ZlyBizS7csBu3E1Qker7ZdcrnuftW052?=
 =?us-ascii?Q?mUUJOhnPX9n83kx9RSPWbXaBs6/rIc4YFSKWp/9uGjyM6virlZzAnJ4wTcME?=
 =?us-ascii?Q?OnA6bJJJmNhjI2CGZtAuOjT1AKQkQEb0+uPQCMTVeaO75xBQclpjyG7phJfn?=
 =?us-ascii?Q?yVUVIFIKyby8G5JfBGK+NUGuqxk7toTOH+YGTqR0G0+E0zeKO0squVez9gBE?=
 =?us-ascii?Q?VmdYY0C3xSOhoGhmR9kfcf4g/rX//AeMDjddyZCj49fhTMjiyYjEvYdkGfyf?=
 =?us-ascii?Q?jaEIYqKeci2qAYSW5yXDsjGrP/XnVB1VHhMUCZEYMHEe9UlyhvlyRM4bn5IV?=
 =?us-ascii?Q?/ICX4CCIzO6wVPGGm6t9PgVZLh3m5XdM7RQl02FgPq14JSPGLboFcpD6+fLY?=
 =?us-ascii?Q?41kqTfKkiDroOPaT3fKijo1vJYkQOPs8rj32IBBg/gnIBlmeTkzvidMTb4SM?=
 =?us-ascii?Q?Mnl6IWKlOeCRWzJf9hTbCVV9AL7eDT6PSe6gJ6xe17fNGTYU4K1czYqVnpVi?=
 =?us-ascii?Q?w7u41xM4iHAUUwT4lleyQNAKcmqrhHp6StcosITY7nR31fDtkUNDfTpxWO8t?=
 =?us-ascii?Q?wFXj4giQxXWjSCssXtYhwrFVhZ2+kosxPe8My94eeyReeWeyXWP6xP/R1Bu/?=
 =?us-ascii?Q?exII3C3zABa04w5dUxnVAOUoEqocnlTUreZlGFcFfEFgDRYRlDTcHpC2Aw/R?=
 =?us-ascii?Q?/6xFXT0mnABxh6nbe1/SyglSstYF8lhM/T+PMcTv1L64wr9CZkodP7U6H+C/?=
 =?us-ascii?Q?SIfQxo0Sc1Vx6bwEtZIPRghlyTWePSErVc2Q0VstX3Ctf9BJ6gR1k/cHHNcu?=
 =?us-ascii?Q?43BuHvFk98UZB3rhoPWY2SGmygvUwi2aqPPCYLvuZsCDiQ4mRwS5liPSlKNx?=
 =?us-ascii?Q?tHp2pW6BsL+rb3n+a3ovwolHMshw4rrnMUW6RcsGuScTKKBaUD+TQfrG8jBJ?=
 =?us-ascii?Q?bGARjwaOw81ioLWdXcXlbssu7ej5SroRBH9tkNa3iYI4uSS+4C+lKSNyV4an?=
 =?us-ascii?Q?SjnbDxiXxtX58vZT9hTkVOzAxDwHTupD/FKcDyTvLIAuNouoFfXu5tPJYkrn?=
 =?us-ascii?Q?ldVTUxbnnowRYIK+IqijLC6tHYdmDkde5FRGGdeWpXTEgVzQslg/Jh8s1VQe?=
 =?us-ascii?Q?lRDheL/2Ar5upRlIPmIgkFfGoeJyB+VtMXSkK9VrHXlOSix2z9R/wRqx0ykv?=
 =?us-ascii?Q?tO1GhsdbXeUoj7suNJktbbyfeGWDqp6qPUmG3OWR6yqPEOTBQ0ZtDVwnasov?=
 =?us-ascii?Q?sGRjLIb6pS96HOoacBDhzDtui32zbWK0JwWu0UYz8IajmP2ddDEbeKRN/g0g?=
 =?us-ascii?Q?4lj3bfDiM1Hx1GL96JsDyXY+Q3spftiR4GvJuG7bV0lnCCPCvyEGNLGudxMq?=
 =?us-ascii?Q?GbysbSuq28sl2hvac8Fr8/pCAoQBOKKO9i6L?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 16:28:54.8811
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 772b04ee-bd47-42c9-3995-08dd8f169770
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B072.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5850

Use attack vectors controls to determine if MMIO mitigation is required.

Signed-off-by: David Kaplan <david.kaplan@amd.com>
---
 arch/x86/kernel/cpu/bugs.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index d57132cdbc21..bb5d58abaab6 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -617,8 +617,12 @@ static void __init mmio_select_mitigation(void)
 	}
 
 	/* Microcode will be checked in mmio_update_mitigation(). */
-	if (mmio_mitigation == MMIO_MITIGATION_AUTO)
-		mmio_mitigation = MMIO_MITIGATION_VERW;
+	if (mmio_mitigation == MMIO_MITIGATION_AUTO) {
+		if (should_mitigate_vuln(X86_BUG_MMIO_STALE_DATA))
+			mmio_mitigation = MMIO_MITIGATION_VERW;
+		else
+			mmio_mitigation = MMIO_MITIGATION_OFF;
+	}
 
 	if (mmio_mitigation == MMIO_MITIGATION_OFF)
 		return;
@@ -633,7 +637,7 @@ static void __init mmio_select_mitigation(void)
 
 static void __init mmio_update_mitigation(void)
 {
-	if (!boot_cpu_has_bug(X86_BUG_MMIO_STALE_DATA) || cpu_mitigations_off())
+	if (!boot_cpu_has_bug(X86_BUG_MMIO_STALE_DATA))
 		return;
 
 	if (verw_clear_cpu_buf_mitigation_selected)
@@ -681,7 +685,7 @@ static void __init mmio_apply_mitigation(void)
 	if (!(x86_arch_cap_msr & ARCH_CAP_FBSDP_NO))
 		static_branch_enable(&mds_idle_clear);
 
-	if (mmio_nosmt || cpu_mitigations_auto_nosmt())
+	if (mmio_nosmt || smt_mitigations == SMT_MITIGATIONS_ON)
 		cpu_smt_disable(false);
 }
 
-- 
2.34.1

