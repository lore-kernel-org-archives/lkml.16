Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2049.outbound.protection.outlook.com [40.107.220.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE89523F431
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 16:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746808149; cv=fail; b=kYGalzJKmxavBs58+6IhAenM2omTG2/QWdcVTcGLZb7vTMS87xcrLZuiDQJ2XpDMzAXV3IgnbvcrfasEuUu2dQT0hK1mIWh+vuLQ2gOIjKRbsdUl2DdFSmpjACXzVKmuhK0iTNJuAk+GcaUEc1s6MdREQdcYdpKk1aOf8nmJ6Ro=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746808149; c=relaxed/simple;
	bh=X0lZQbZlLcBDa76zyjd0xCHm/kiniscJV0bgrv0PIn0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pf1jLqG6KnYj+v9XiuPJmAlAvhIJpw5sYfeQgk+r9qQX4UfIKmjk8SE6lASFljpFJS7IYmjbiN9sXFcgjbW8wj/6BzacgYkPscIQC4BfB6xuMmCdh68eu9hyA44pBZD1IY/CEEGizkBO/4AQfAvnPpvpM9xcpKLQFhzYb9+KPq8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Lmn6eAg/; arc=fail smtp.client-ip=40.107.220.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Lmn6eAg/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gMorzxpbmnEuGDeS/uq2OM28oDCz8eo2wtTGFlIboZCy1ksNaN3qgNXo48lMnEf5znW3zfXbZKTsQProlJEbQymkxuOaBukFZiHBdK4q7ySLJfct0ij8j9wI3p6fgsXextVW1sjDUuUhd/VBCIMUhZD3D5x/sPVJiFXLzIRNdMoMirMqINWmrI+STPSfA3xlFxTfQ3ypT9M7an1HhdRmGLJDKqKk3n1WbhzRq0oNdnkUDLJgeMAa+Inbzk1uScFpTn4TM0hvEXg8FUL/uxz0iNWSMqVmXv++98TcAzA3K6d9sODwfdp/HqlL+hw6AxtyhT8+ZOuNOM5zCSnPzbzRDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OTpwY6RhLSVr3r6VL7+jlKk3UVp9abgKbOLE8x3WOmw=;
 b=xSVlulPtn74xfjYZ3RA5cZELzqgdHqia3tAsAS4wUhnUpLELLpKnAkDy840IrzTA+Jqtwe2jfsWZQX/8Do/MYgAbjdVYolhKwSDS8La6BiDB4Lek4LG7y5Oh2MMO6TMZXgy93874i9spqYKXHNOMJh5iZ96KvVVKraZGaG/JbBf7qH+I1wFwVkxNqFYiS5zFeY2D0GYnk5N/2pMGywcbSQff4J0wJ+XD1z5TbWem/W0EpC//YZ8lecKuNFN3dwCYkEbeWgAUKGa9kI5tj+aU1RFa246Rn9yn7jfHUxBHH5OzTD3Mfr1oadryyyIldCsEvMJBJt14pg2foU8xDaUIlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linutronix.de smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OTpwY6RhLSVr3r6VL7+jlKk3UVp9abgKbOLE8x3WOmw=;
 b=Lmn6eAg/qo1RKQ16+iDJojpn0xbcu0fDExGxLVxWxEYKyRl64+5k0UyLsFUTV/amzMUDtE1d4WOLQfEsLbXx7mIYPHSID06vqc2H+615HUllgBhnlHKP0s4TYAUsSLcT7Ol6XewAhI5BKsurI0E1HW/NHmFkUv5z5nuY1ZMWi9s=
Received: from BL1PR13CA0099.namprd13.prod.outlook.com (2603:10b6:208:2b9::14)
 by IA0PR12MB9047.namprd12.prod.outlook.com (2603:10b6:208:402::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.26; Fri, 9 May
 2025 16:29:04 +0000
Received: from BN3PEPF0000B074.namprd04.prod.outlook.com
 (2603:10b6:208:2b9:cafe::9a) by BL1PR13CA0099.outlook.office365.com
 (2603:10b6:208:2b9::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.18 via Frontend Transport; Fri,
 9 May 2025 16:29:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B074.mail.protection.outlook.com (10.167.243.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Fri, 9 May 2025 16:29:04 +0000
Received: from tiny.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 9 May
 2025 11:29:02 -0500
From: David Kaplan <david.kaplan@amd.com>
To: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Ingo Molnar
	<mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	<x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>
CC: <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 18/20] x86/pti: Add attack vector controls for PTI
Date: Fri, 9 May 2025 11:28:37 -0500
Message-ID: <20250509162839.3057217-19-david.kaplan@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B074:EE_|IA0PR12MB9047:EE_
X-MS-Office365-Filtering-Correlation-Id: 8203ac53-f711-41eb-74a5-08dd8f169d67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kIAM1X/Y8Tv+5QCmcPG9zrQMe9SdSOAhBDzXsYhTyn4elndZR1w+YJZKMC2u?=
 =?us-ascii?Q?6P6TMiaZaYROL3R62I/UFGZ6JidiYYRryGyyDuxO8M6518Ek4T6lCmYFs9aM?=
 =?us-ascii?Q?XlVPEIiz7NZ59Pl9fAEjjOFl/Ms5iZSm22rNBWFPgvP0eV3vr/KDcP7EEEkX?=
 =?us-ascii?Q?OVeOlYHk0NxdtjjCf3fbOMGAXjyT7drVldc6I4LsY0WxN465XNSGE1VYMh9D?=
 =?us-ascii?Q?PaAwuRzEQ6qBqxYoDboCbsbOhwYvuN4shoN3fl6GOQM5vjME32SfixC0N6h5?=
 =?us-ascii?Q?MoOH1dYh+trkuzbHjK0x4jdNKhDkTk5tKql5+LA/+VEQwfZZkBy5gSi0KfqP?=
 =?us-ascii?Q?GD2+3fv3qoGeukGz9fIVSkG5rBhjTXEw6S0AR32R7kM0McK7uANccm/0XEgW?=
 =?us-ascii?Q?cLAIeqO7G6R8HHlsbXzVzqMDm2AP6fGM4z31g+6yjXupr2zIoRH25+NrxcIw?=
 =?us-ascii?Q?MJJH/Ml/4JZL2+YsL1J7/h2JxP4GCY1YK2RVQuteS8JEbmNs4ZYie95B8ztE?=
 =?us-ascii?Q?h0/Rx/JSoyyGKU4IkKl4LnVBt5oFrw8QhRC1leXxudz5U30dTVn4gzQQHFlZ?=
 =?us-ascii?Q?vnYpRn0+LilS+2rFChEnnsvDzowCKTjvLam93GwMuLH5kYwnLf3iWZqsU2hl?=
 =?us-ascii?Q?Z3fH3bpkBgEL99omfLZWH4bxHI8jw979aHw9hyMOAy/kBwHLVfFy0LZShPy2?=
 =?us-ascii?Q?JMN9KDbufaMJS5WT8B2sM6ly/+uj0OjSlNUPaoRVZA0L5zXjcz+SiGugPVQK?=
 =?us-ascii?Q?vIg7N/Y3Et0bzg05ym7/1q/EAIi9+hP01YGdw58QrBq7VV+6cW+gk4uzBiVG?=
 =?us-ascii?Q?J/NmNsyfaje/ijqUO33oxwJVQGFDXX1WGWi/Jn3m1rKDMBnELJSImPwq3sxQ?=
 =?us-ascii?Q?wkXN8DY+/2qkYI7qSVJtLY8P3sVG8ik+TOowIc7udGkJxbwSD3nbPQKDHKg0?=
 =?us-ascii?Q?Dr4wCdvhnML4v6V2Jee7Boa4kR3Zpc7np8dLtNSSZseVpJfJfNVfc2t0mN6z?=
 =?us-ascii?Q?0AjCeqkx5OpDtcBYndEI9ocT7FqhJvXR17velnpozhRXo8MjrjV0g5q7C0DQ?=
 =?us-ascii?Q?cBYTOmTE+t/3HYQBidk5ZWek1/fEnDAw5rvGTtzp/T++Sq7JOnz2py5UeKvN?=
 =?us-ascii?Q?E7n2Q1sMlcSHGQ0cNTzbF+hejzeqk+eejqLX48WOdG1YrI2jsm2W1N/hXY2p?=
 =?us-ascii?Q?GF4UjLcTGMDOHqKGJ6DsQFgNknmDsmNeFjT874/PdOqQEZpxjgZPBJ9HLBt8?=
 =?us-ascii?Q?jR10J20xeHuDpY1nZ0e93G1rKmH/dxddloSA12yrA9ACBYA1H4PVPt6iQqkl?=
 =?us-ascii?Q?HMkF/NeG6K6+UBxO5bBsAbn9H+wu1CXUDpYMyPlVxSZ6rlabLqWJKZ0woU5h?=
 =?us-ascii?Q?jhqxeZXm93CsseG1ynxxaL4XbUZh5KC9djX3hBC1rm8X8hYa/lEXm6iE4xR1?=
 =?us-ascii?Q?vcb+smDtF0K5iaO41rmc24lCF/Aa7jWf3Xw32X9NkxodP7MHgTOYLpgiRgAN?=
 =?us-ascii?Q?kJaBgABbf+Ob2hOrn55+o7EqCcSqTQ+92VoH?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 16:29:04.8905
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8203ac53-f711-41eb-74a5-08dd8f169d67
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B074.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB9047

Disable PTI mitigation if user->kernel attack vector mitigations are
disabled.

Signed-off-by: David Kaplan <david.kaplan@amd.com>
---
 arch/x86/mm/pti.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/x86/mm/pti.c b/arch/x86/mm/pti.c
index 190299834011..6dba18f8c715 100644
--- a/arch/x86/mm/pti.c
+++ b/arch/x86/mm/pti.c
@@ -38,6 +38,7 @@
 #include <asm/desc.h>
 #include <asm/sections.h>
 #include <asm/set_memory.h>
+#include <asm/bugs.h>
 
 #undef pr_fmt
 #define pr_fmt(fmt)     "Kernel/User page tables isolation: " fmt
@@ -84,7 +85,8 @@ void __init pti_check_boottime_disable(void)
 		return;
 	}
 
-	if (cpu_mitigations_off())
+	if (pti_mode == PTI_AUTO &&
+	    !cpu_attack_vector_mitigated(CPU_MITIGATE_USER_KERNEL))
 		pti_mode = PTI_FORCE_OFF;
 	if (pti_mode == PTI_FORCE_OFF) {
 		pti_print_if_insecure("disabled on command line.");
-- 
2.34.1

