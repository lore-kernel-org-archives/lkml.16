Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2079.outbound.protection.outlook.com [40.107.94.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9815B1B87C9
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 20:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747169354; cv=fail; b=Zq+NHPMGthEAy5LhrZ+4dBOb5xwDEVaW4K0MkgFa++6Zmns6+JTuo4VtKnM4CdAJBlLa3ML2j4BrXSnU/qdUUI+Kxv4jys4eM9xWG6h85d9ZDYcicUNHVk0lZYhDtL7NeQI2CTLVIgCL+zwl4DbwZH6gpvs/C57/zJinpD0wDJg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747169354; c=relaxed/simple;
	bh=YTa6NetG+Q04SMpjgdB2AWN+VlhzrPs90Nduv918jXk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JGIdwJp7q46ayXamHbc4GsMrj4gZW8gjJyIyWJRDQZ4DGLREJeABdvOFg/mQ0NvI7igQcxh+y0+0mhxWcyRr4QMl8zdzcTC3C2tOd1JFY4TqX/qXbmGW5YVr0dW9i6IfOxUHXRWcwHvTyFDv1G33j87sguUiGJyGK/R6rORdRV4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=RRVfAiem; arc=fail smtp.client-ip=40.107.94.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="RRVfAiem"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xms8V6YgprQ5IGc3iJvyOh8JtsxKiRySRz9i4Cvz89aS0y6I9optr14qUDZLNBW3omXsUSI9zAQoyLaRGz5O7e3qKgEEMa8LBPe2uT94Qq7ONTHLJpntnING6CqYOiIUibDW0taCc47eSdJanAJT3HZtf/UR0Cl3YI2ENgwX2ndL6uUafQ1rzGR9z8V+j33zMCXiSPCGdUEg2AY+qiZYZPJFAT3YzLYaaSS3sW5AgRiMrathH770NqAT0F1PRp0fvHqNqEXgoz9UaMMgWBesWQwUW0HkpnpoO78ELb1jYXNh5ey2zpDnzbK0PPIxpBP9uhdeJou3vqZ+not/iYW3aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lOzb2JbpOB9e6KcIQPgXRafI4NipghslQItW5CVaL4s=;
 b=rP9JfxLOffJQjh6XQnLIZHv6dA0AOPTqL5nhFCLwx3hF8OSOQ0JGW+jk44E19+IJrCOUt3N0oWLpcfTc/MAPfOgFxDdfGDiIdT/RzOJnlStDKEmb2XAvSCecy6Svx0enYvcbxRK5OeNh/BJyO43r5ibYiT/IY6jgGLSDsUd9dKtYZ9KUgWEiaAaiwEJZHtaHUlNpzXJHuTy7j4UNXBYPq2fU+y2IZZbTn1ddggNydZo6du2Onmf50LPC95XvSBKpySwRH5iut2yDnw1CGebm0crQ9jD4mxdx5ZQZqFAwkw0rrJFexJ8EKvs2cc0v3m45UEDEFBwqp0P1rr2nMXCuyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lOzb2JbpOB9e6KcIQPgXRafI4NipghslQItW5CVaL4s=;
 b=RRVfAiemPczyoGT96hMFoU/eXLCaBO+VnLRAv4I5FSM/nW5cn5SngFgWLTDCQVMDXVUHzYQeOae8R205IjQ0IRjSbaQLN68ZrQIC5jpyNa6wFd5BZYTeHjSc4M4nK2PF5hO2PVDQ2vJ6V9G6dB7dHP7DXTJ3z6/bO/Tk3p0mO+4=
Received: from SJ0PR13CA0055.namprd13.prod.outlook.com (2603:10b6:a03:2c2::30)
 by DM4PR12MB5940.namprd12.prod.outlook.com (2603:10b6:8:6b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Tue, 13 May
 2025 20:49:09 +0000
Received: from CO1PEPF000044F8.namprd21.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::fa) by SJ0PR13CA0055.outlook.office365.com
 (2603:10b6:a03:2c2::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.18 via Frontend Transport; Tue,
 13 May 2025 20:49:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F8.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.1 via Frontend Transport; Tue, 13 May 2025 20:49:08 +0000
Received: from purico-9eb2host.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 13 May
 2025 15:49:07 -0500
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: <x86@kernel.org>
CC: <linux-kernel@vger.kernel.org>, Yazen Ghannam <yazen.ghannam@amd.com>
Subject: [PATCH] x86/CPU/AMD: Add X86_FEATURE_ZEN6
Date: Tue, 13 May 2025 20:48:57 +0000
Message-ID: <20250513204857.3376577-1-yazen.ghannam@amd.com>
X-Mailer: git-send-email 2.49.0
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F8:EE_|DM4PR12MB5940:EE_
X-MS-Office365-Filtering-Correlation-Id: 03676f94-a100-4ac8-131d-08dd925f9b8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zk1CJ/7TQdPbCgJnsHySOOsdAsZgLUzplATXVIZdsRIlBRCc6t6/xCr3wz5U?=
 =?us-ascii?Q?tXGGlE7VElpfqcH+CIUOKQznk/ir9xdZ/q/TlbPj71aguekkDIZNChnpVULR?=
 =?us-ascii?Q?iMbx1GOQjOZqrzcgidAJqSPLo7DJqPEoTo2VNMDYebqw1nbl/GMZu152WFpi?=
 =?us-ascii?Q?Y1bazBhiVgQ2En+xL+G2Gi95saA0pwlAj3fz38tM9dr8E3oR3zxld2NJT4dy?=
 =?us-ascii?Q?ao0E5S8ZFbiKqcoMQldedqQC1D9RHvm44qatx/2JNZMS61H4tmf17oHMZGx2?=
 =?us-ascii?Q?5+FhcbOF669ZBttFc6RYQGGgNut3grCbRwjLzyt5IdL+j7GqYTWJUMQaIlhu?=
 =?us-ascii?Q?8XRQzXzI/RCizfKpfqR9fDVbCyCRCo65d/Z9cheCkISd4U9J36WvXa5Ut7LB?=
 =?us-ascii?Q?d42ScXjbcGZsIL9F9+smtpGTLnFPgcwB+87stdw1Ida4vvHH+1EzNfsgqffV?=
 =?us-ascii?Q?wAPjYCNUV1x6cUlou3h83neXL+GaxFUMSsxda67R2S7CpbudXLRWEL5PneDv?=
 =?us-ascii?Q?pfM1a1b/T3D5TrDNfIm2L08gyRnWeVknMtnc7cOPOw/IzWjJbFa0MCUxzbFq?=
 =?us-ascii?Q?wzPI6oNd419L/k5lRsSRhnhxWPyaR2K0cyrP8fuItEt3NCTZFx53Ams4dg9X?=
 =?us-ascii?Q?KEoTfenQ01SdEBzRlgg4+sCzpYmgaTWl1JTarklwdGv77hKsoHydLZ3NQnnP?=
 =?us-ascii?Q?BCS89V+iv+Vqs5UYCAiiymsExVHtoZwZi9kxFV+4W6whDboMP4fUkktZJFax?=
 =?us-ascii?Q?0ksL635NjkQBAidpCx8RymU2jw4A1/BJz6IxA47nIWysZEZzel2I0lUgnh3u?=
 =?us-ascii?Q?0riVV4xHsyR6AuiHcmRJHw8O+eqy3K21TNyUC4KUz1TXtzdjvVZHh0Ip+9HH?=
 =?us-ascii?Q?3VQB7i2rsRaxVp/VjyMw+5UTUno+slppE9gQgtw6MvQ0R40VGcOoX7F4bg4z?=
 =?us-ascii?Q?VZEZYgon0UBExPlHRTNKEZAvgjyXO5cjH9xdlGoOwYEtfNw5Ee4GwX2hbRCy?=
 =?us-ascii?Q?pGYOayqimQUCL+Q6D5kxmmOj93JteggoN963wqRT9wCEaGu64dl9+Duunxy7?=
 =?us-ascii?Q?CyKjmLY9kVRYuwta9IEhPnj6eFnx/9N7rHNgk09XdWuKcb8dtu2oBWhviRsD?=
 =?us-ascii?Q?N7ssqWkHg57S7aAvl7ra7bGu1AYpFtTjHJkw/lSxTTIbC6O1RRg0Df9g10CO?=
 =?us-ascii?Q?t6vVXR2Z5fsZLNdq9HVywPsLvPqyts6BeCxYn0+bkURnHo7OA2WKWxzHir7J?=
 =?us-ascii?Q?pSleb0XQL7J3QzSv7tB0TiRoarosMgO2UsbYb1cNCMGuIHBOTss9rRYEvkfP?=
 =?us-ascii?Q?LUBME3c37nYSwAEd0dtpguhjYi3IvbnzZ1Lbo4VBotpt/g7QQm89Q2SxZa39?=
 =?us-ascii?Q?OjM+eonYNsuvKCA4oKf33OiADD12GZZf4zavyrESTW6l5Uub2KktEOigAkxe?=
 =?us-ascii?Q?asU430nn7f67BeDhB9wNF0uroUSDdVPnZwrkz8R3LN2vWKoRSbrHfVHrOpOY?=
 =?us-ascii?Q?kaGstI8gmlUPngP1kE+wxIZOryftZyrKdgm5?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 20:49:08.4037
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03676f94-a100-4ac8-131d-08dd925f9b8a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F8.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5940

Add a synthetic feature flag for Zen6.

Signed-off-by: Yazen Ghannam <yazen.ghannam@amd.com>
---
 arch/x86/include/asm/cpufeatures.h | 1 +
 arch/x86/kernel/cpu/amd.c          | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/cpufeatures.h
index f67a93fc9391..920e7d0d1976 100644
--- a/arch/x86/include/asm/cpufeatures.h
+++ b/arch/x86/include/asm/cpufeatures.h
@@ -483,6 +483,7 @@
 #define X86_FEATURE_PREFER_YMM		(21*32+ 8) /* Avoid ZMM registers due to downclocking */
 #define X86_FEATURE_APX			(21*32+ 9) /* Advanced Performance Extensions */
 #define X86_FEATURE_INDIRECT_THUNK_ITS	(21*32+10) /* Use thunk for indirect branches in lower half of cacheline */
+#define X86_FEATURE_ZEN6		(21*32+11) /* CPU based on Zen6 microarchitecture */
 
 /*
  * BUG word(s)
diff --git a/arch/x86/kernel/cpu/amd.c b/arch/x86/kernel/cpu/amd.c
index 13a48ec28f32..93da466dfe2c 100644
--- a/arch/x86/kernel/cpu/amd.c
+++ b/arch/x86/kernel/cpu/amd.c
@@ -474,6 +474,11 @@ static void bsp_init_amd(struct cpuinfo_x86 *c)
 		case 0x60 ... 0x7f:
 			setup_force_cpu_cap(X86_FEATURE_ZEN5);
 			break;
+		case 0x50 ... 0x5f:
+		case 0x90 ... 0xaf:
+		case 0xc0 ... 0xcf:
+			setup_force_cpu_cap(X86_FEATURE_ZEN6);
+			break;
 		default:
 			goto warn;
 		}
-- 
2.49.0

