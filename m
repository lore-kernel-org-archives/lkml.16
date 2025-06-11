Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2048.outbound.protection.outlook.com [40.107.220.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C9C1D89FD
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 04:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749615021; cv=fail; b=IKSjj3m4u/JYNwpYl+AhMdtwQ/wXfbDRjGRsTdMFgl2HjKikNikLyfu0la3XcKIfQXbAWo9zOcxmPBaLt2jYcM9guVny+b/itJUkbad9VyZ7lDvBWc6jmoaiwoJ7FvVuqgYbqIjO524Eqy6f1jQNcBJ9kCX7fFDPydR3x9r56T0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749615021; c=relaxed/simple;
	bh=tclR56x6kY0b8PnnmNCmTH8gp19JU4k4mqJdI9LCjz0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OWISRA7KrUwIITnjLhZeruQwnafmipBZxlHn+/IVslWt5v4wDCnLfs2iY/VbUBG98wXs2Z4AaRgw1Ay5imN3MmSpHzoGeQGrLNxxfCgpop9IaapZ3VaKonXsn0thdaxihstjOngPVEzRankcPC/+ChhBm9ugnuCarCyEjD6jRe8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=aEeNY74c; arc=fail smtp.client-ip=40.107.220.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="aEeNY74c"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aBXU0wdqjXCs4LoK9VTE92EptuMNhEklActSzTLl4LsRnxOz6tBeHzyumB0pMl2M7OHuONnwy5D42BJazNFcGOxGyeJceisReMXNw+Qk8JrFqXK9X8mjB7JCJ630Hu87+dunMJGWZexhwVXq9mIN4JQku2R1piAIO4mFuveNH3VL+S78zPZF366ME2VGJUnAnpI7hOTCN8cI3vUT04J+bVwKAyyvkPc+FuBGVrIhqHA4twIJoBgIJ/iLj49nI6RfDDDCNWqDvrO1KnWCCVSfMIqZs36sRTJQ2az0j+uGxNytWrJcMxgrUNyPvZqRrmdk38E23N8LTQaUOCGCBo/InA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lvyl5VAHi3Jcqt0QxwvetKOI+F3mHG/1LUEoXtAS2aw=;
 b=JRT0x8pMtYrLuuGfY4g+MP0t6j7En43HxgUDvQuAxPPqo4LOaTNyEl3k7iqJyATHwXVvDIAhmZev8tYoFD6l6b0sEShiNvebMEGnAa4cGpnF8cuCGlfKlEvd2ZSTMZ8Sy6KwWNaJ4Kng7aIegXgfC0Q8jFt1nMicdhFvc6dNHaM4ODqi+8xV5R0cf+etnxUerJPttKCbW2SMeQS8l1M+FYa50RVrS0Ygwto40ofxZamXMVmToa05b+A5VpKOwmmv+0lm6oJij9P1NiCcnJgZNx6OI5+kUKJkaNAcOnPdl8TTZG1KpZTl6SosIvK9P0vDDfKGRWhdNnAz2W8ZAtidVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lvyl5VAHi3Jcqt0QxwvetKOI+F3mHG/1LUEoXtAS2aw=;
 b=aEeNY74c30Qcen+jlHVrw+UWPnZ/OcCwSYvohsB0XYOdOwJN0fU6TV/hhk5R+8794QD5Pgnomy5wx0xOkwLBIQaaWorW/2nDcGX8qwSYbay43aHon+BwrufkTgvulXm1dFPGtdJAFhNr2M4h4XEAT+ZXdIeyLJjaCDcMPtNmto8=
Received: from DM6PR14CA0061.namprd14.prod.outlook.com (2603:10b6:5:18f::38)
 by CH3PR12MB9217.namprd12.prod.outlook.com (2603:10b6:610:195::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Wed, 11 Jun
 2025 04:10:11 +0000
Received: from CH3PEPF00000013.namprd21.prod.outlook.com
 (2603:10b6:5:18f:cafe::65) by DM6PR14CA0061.outlook.office365.com
 (2603:10b6:5:18f::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Wed,
 11 Jun 2025 04:10:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000013.mail.protection.outlook.com (10.167.244.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.2 via Frontend Transport; Wed, 11 Jun 2025 04:10:10 +0000
Received: from aiemdee.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 23:10:02 -0500
From: Alexey Kardashevskiy <aik@amd.com>
To: <x86@kernel.org>
CC: <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	"Ingo Molnar" <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Tom Lendacky
	<thomas.lendacky@amd.com>, Nikunj A Dadhania <nikunj@amd.com>, Ard Biesheuvel
	<ardb@kernel.org>, Ashish Kalra <ashish.kalra@amd.com>, Dionna Glaze
	<dionnaglaze@google.com>, Michael Roth <michael.roth@amd.com>, "Kuppuswamy
 Sathyanarayanan" <sathyanarayanan.kuppuswamy@linux.intel.com>, "Alexey
 Kardashevskiy" <aik@amd.com>
Subject: [PATCH v2 4/4] x86/sev: Drop unnecessary parameter in snp_issue_guest_request
Date: Wed, 11 Jun 2025 14:08:42 +1000
Message-ID: <20250611040842.2667262-5-aik@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611040842.2667262-1-aik@amd.com>
References: <20250611040842.2667262-1-aik@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000013:EE_|CH3PR12MB9217:EE_
X-MS-Office365-Filtering-Correlation-Id: 189e41c1-6071-43d6-1aeb-08dda89ddbe5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VESDv62WfnGvR5wmPzL8Au8IwknvbrFAuhIc2+3IpB5nGmrR51GxkOAGcEb4?=
 =?us-ascii?Q?FDOjrAnkiSumH2IOgI1Ub/L7OijeBScPyWJgUYT3OpePO9HvRvwzT3GQFVR8?=
 =?us-ascii?Q?ERLlyB6I69ybIBJJYLHYbdVSlaa3t1gaBnnYDMqd/mpYc2JHM5or7JBEa9S8?=
 =?us-ascii?Q?uqiswKMhLvXkZH4oe+Nef2pWF+x9JVZZvBGxovCjnCxng5E/D6KZzwlEdFYI?=
 =?us-ascii?Q?+TnyH8iGI1cgIK6k151uVOA5wRp81jAfaYkSCWmOnLzBHjlewpgdxWk54jN2?=
 =?us-ascii?Q?TQyZa+rD6ZLUrj1aY2AYn8wSd6zWAvti0GPc/Hop1y8rLapLlkz+kxPccktr?=
 =?us-ascii?Q?KhwTNUncvNzFdNDtoGqQN68SsQWeZtU2jRBjRvnmYwdvAiLjV+qAPxkxjD3L?=
 =?us-ascii?Q?JwwNTb/HZI+IzljgOAlaaTl6UmurfckjXRPhWmgagZ9u5t1XbW3KPeuMukoG?=
 =?us-ascii?Q?Mq9Rbn3R/3AaeFpacSmpl9BxSmVIua1TmtrEzYOMZ/TFPPrVNlrWVMYVkRzw?=
 =?us-ascii?Q?AtUi2qS6fx6KrZEghZadZ8kaZPrX2wU7/ldHXc342bdEbWu+xMxBDJTijjom?=
 =?us-ascii?Q?q6WPqRH1UXz3zbqnEpoOCami6AnwCDtjqLQ4f4pYRrOcxWMEQ5NQPb+gu5IQ?=
 =?us-ascii?Q?YvSz9wQvH+LfbBkRk7XrluzOcn/6hK8tRb8Zg/UTVMwTU8VvZ4m3wbnT7pEU?=
 =?us-ascii?Q?8fOP80I4p1E7vc3jRfxSw5TC/NtqK3XtSnlTsYxauNacZUW8pYAKfcPuVt9/?=
 =?us-ascii?Q?FtE06n1N7p4r3Qu2URFin3I2zNuSWQuRWI4IPE/TlgKv8XKoYUpHdSohq7d6?=
 =?us-ascii?Q?+ylGiKCozbGFdd9NQsRh8Y/k/cZ2Tgex/r0DCMeiWO2IcA1jynQXzwwvvpeH?=
 =?us-ascii?Q?mJFtH44KQaXaL4C1yHeLNcoDEPZNJwqA4X21/G4LS0S5DfLsnKE4a8OMh7gF?=
 =?us-ascii?Q?2YKgMG/uXQOc+zP/m5TRUp9uUsS26AtKU6v22l9zlCK1jgot/50G4v+y25Rh?=
 =?us-ascii?Q?dnIxQylgtLEXR4W0Bbe07U4YSHrwqy385uWuzEUqiGq+6lhtYuXvq51EfiqT?=
 =?us-ascii?Q?i1b26YaW7l+yUW/J4tFyqi0KoNw+tvNEOoiAzCAflqoyHJnFXj1ixEqyCzcD?=
 =?us-ascii?Q?Qdp+PIqY7xuWuEn1ZsBugooBEReTbUWRfQYL+0TbE49I294AqvJii77Pwv/P?=
 =?us-ascii?Q?sTS3fmvWjOfoVezZswaKcwSjwGraESFLtz236I9jFvWu+RDduA55sEvF5qE3?=
 =?us-ascii?Q?/yq4EARg+LkBUufALLaqF49RmztXn2PwHqM1ZraBpDxixeBNRdhim43nj1HB?=
 =?us-ascii?Q?I1U9Is6kbm3tpe3FS54TEyxhZiuPUcfC2wBVsj+zKglEarjC2GiQVjP248Eo?=
 =?us-ascii?Q?RUNzvCLec57JIOYVRzZM9ISCCkJA+LVYdzi1zLB8P92v7D7VZ8NSwqJofbOg?=
 =?us-ascii?Q?onXolSMw0thot7DfEEjubYG7R3ea1QG2LagE3ksCJmw24gOk5a5bOnwCAmEl?=
 =?us-ascii?Q?SiPFyuU/1DXx/WYUQmDqvNdQZk0MgMHf+AD7?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 04:10:10.8496
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 189e41c1-6071-43d6-1aeb-08dda89ddbe5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000013.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9217

Commit 3e385c0d6ce8 ("virt: sev-guest: Move SNP Guest Request data
pages handling under snp_cmd_mutex")

moved @input from snp_msg_desc to snp_guest_req which is passed to
snp_issue_guest_request().

Drop the extra parameter.

No functional change intended.

Reviewed-by: Tom Lendacky <thomas.lendacky@amd.com>
Reviewed-by: Dionna Glaze <dionnaglaze@google.com>
Signed-off-by: Alexey Kardashevskiy <aik@amd.com>
---
 arch/x86/coco/sev/core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/x86/coco/sev/core.c b/arch/x86/coco/sev/core.c
index b0d423a353ab..8375ca7fbd8a 100644
--- a/arch/x86/coco/sev/core.c
+++ b/arch/x86/coco/sev/core.c
@@ -1389,8 +1389,9 @@ int snp_issue_svsm_attest_req(u64 call_id, struct svsm_call *call,
 }
 EXPORT_SYMBOL_GPL(snp_issue_svsm_attest_req);
 
-static int snp_issue_guest_request(struct snp_guest_req *req, struct snp_req_data *input)
+static int snp_issue_guest_request(struct snp_guest_req *req)
 {
+	struct snp_req_data *input = &req->input;
 	struct ghcb_state state;
 	struct es_em_ctxt ctxt;
 	unsigned long flags;
@@ -1932,7 +1933,7 @@ static int __handle_guest_request(struct snp_msg_desc *mdesc, struct snp_guest_r
 	 * sequence number must be incremented or the VMPCK must be deleted to
 	 * prevent reuse of the IV.
 	 */
-	rc = snp_issue_guest_request(req, &req->input);
+	rc = snp_issue_guest_request(req);
 	switch (rc) {
 	case -ENOSPC:
 		/*
-- 
2.49.0

