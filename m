Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2088.outbound.protection.outlook.com [40.107.92.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9CB11D89FD
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 04:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749614980; cv=fail; b=ixBbc0Bpeh+cEzI1ddLb/VcB5PRpW2h+SzvNYZRrRHnfKdr3oquq1SHbhuN7ny6eCyaFRIFsAq6toDRub6OokNDz80JTCo+Yk42mQMpJAHMf+WCuAYNx1T4KZLplVHMga0ZQZKhHqs3MR1q/lYnRglb6JOqzxsIfgQzPAJ/jGwM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749614980; c=relaxed/simple;
	bh=/FdsD9XS/55iPX8cZsEcYNXFufyWxiNoZbteyjhBRas=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RhH1+x+srfyJFIOPFjgG62dcqErQWmoDtbjzcNXFoQG0KXw1byQ8xoOAH4xVWQ/H3o43Nm5gVC0fSJWg2Q8pUH23J4vl79gTDNRWq40Vd4TOTRCYOqaYcDoVdpqbiufYc9F9eoq8N7LeV6WW8anacKhtne8yk3uMdDBK7fmZuaw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=DHZJA9po; arc=fail smtp.client-ip=40.107.92.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="DHZJA9po"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AAzz9ZkkK8uFCL56lb86IZac19uquSOqUmI4VGzhr+QtfMEnaGxjBOpfoA+CWuRvK1Lc6gLBbk+EbD1RgMcW+DN5MQufttWvN5GhDfgk9Wei8Lc3e8qglVfNYw4AS6hk9umOveMVbO0jsgFeNAKg8DjZHLyADGqv6xYT7kT60jOJS0mhGUt1yr4bivtIi0PSp0dV0aHJJKphzVRRwWE48kp/TUWZPwZUvcmbfh3uiLgMcd5x2yquaXzn4PSOKuuOwsGt4JtOhp/7UiTZTy6Y6/26xjO7hBeKkcjbtP7h9ga4wa6pWlPJR9XwQ4RhjYGj3TlQ6Y7DUIItGTlcnWIcTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eY6nf3eFrMXZiRmq/3cht4aBo0KYtRDaf9JqcdKUluo=;
 b=wmaICjUiVbiCOxI0dyppqR03upatY9lctlYDJQ1/PXYZ1URazIIBi0MDmTiCufx422FZB/9paXqzZ4N33rQ07WDl9TKRtBZgsooNZhuoW9sS10aBeGnOPlf20yqDiO83QKSKeQczmaW5xMcKMC9Opj7qBSsNB2fXdEHdqEM4wCNlO0vkPleMt07ql04LTsHhat1pEakkesCv17oUMNuu+mFOxB0VnvySIeCclC/ifBkWLuTq4D69EraFcnC2g1kv+SzOX67DSmBibTSG+O8YhmuTpuK/9aLoo1IDufkaOAknMmMLnXW1D1B0gIEBUVPVt94pztMuo6cxyFzl8x5GUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eY6nf3eFrMXZiRmq/3cht4aBo0KYtRDaf9JqcdKUluo=;
 b=DHZJA9poKSrxqTOlpBgybXil0F/X+R8Vd3wnVDgQ1gOrclqI+Dpn/hJHIrXDlrsNj2tBjzmB8h5DABgwhMc26RbSEEt19/E+s6e1KmnjPVqGXDXVG/3wXuG303sS1u/jYjh3misC020hhGij68+zz5RYgcuxkVe6tXMBAgr9dEE=
Received: from DS7PR03CA0081.namprd03.prod.outlook.com (2603:10b6:5:3bb::26)
 by DS4PR12MB9610.namprd12.prod.outlook.com (2603:10b6:8:277::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.38; Wed, 11 Jun
 2025 04:09:35 +0000
Received: from CH3PEPF00000011.namprd21.prod.outlook.com
 (2603:10b6:5:3bb:cafe::13) by DS7PR03CA0081.outlook.office365.com
 (2603:10b6:5:3bb::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.17 via Frontend Transport; Wed,
 11 Jun 2025 04:09:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000011.mail.protection.outlook.com (10.167.244.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.2 via Frontend Transport; Wed, 11 Jun 2025 04:09:33 +0000
Received: from aiemdee.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 23:09:29 -0500
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
Subject: [PATCH v2 2/4] x86/sev: Allocate request in TSC_INFO_REQ on stack
Date: Wed, 11 Jun 2025 14:08:40 +1000
Message-ID: <20250611040842.2667262-3-aik@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000011:EE_|DS4PR12MB9610:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cb38ba1-2f81-49d5-d836-08dda89dc5e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UbJ9MM+uug7rcDpM9ZDF7A6xXa7QzKBKSKI2DwBqndwwqMIbMusQ/OCfGJfm?=
 =?us-ascii?Q?3GYmtEkXN9M3A/VvESgtUwRB5+VPylNnWsqk0MbvQm7vkZyImTFL9O1ckfyz?=
 =?us-ascii?Q?x8Si7JIjwhJWEpSawIUo5S6KPQ5TRiKAz99alcwFTxsvAb1L2nleoaNhrhbR?=
 =?us-ascii?Q?e5IhkRJhen7Je8W8NnlhN3iizn16R3QCYWX310JHDIV2Gtogrw4RYwzVvBMD?=
 =?us-ascii?Q?k+vuNP4YfJ30ak2K7byeLcc+tLnc3tuZ6ayZf+jXNaiZeDhwlU8pc5h1nqZm?=
 =?us-ascii?Q?kyszhkU0ihdO6Gk1k8I9ynBgYKWGNkIXgJuEAv6+6OlhK+YP9mtmIvwkdejq?=
 =?us-ascii?Q?kUky5rq3y/L03WCUbwI8/SyaZtZ2mX82S6b9hVAa7Yl9TCK9JHVwVKETDHGk?=
 =?us-ascii?Q?FMNfUKOPCwwJ3S3kbjnnbPnu8VbwzDtzEJx+egN076LrgLcN8m5ZJJuSEzAP?=
 =?us-ascii?Q?YngihdNq2UUnbkhkzjjvhacQgJvdTHT6h1bYeZhJnpnsav5aQyWHtOb9/DSL?=
 =?us-ascii?Q?472iD9LENjTSTPoBO12c5c5qPDAoNFQeoWHSsfiq0Q8EnnN2fY23ZxExS6iY?=
 =?us-ascii?Q?1Ks7q32KfFCGRauD4+bTWoXKyYaA+R0PH92SVPcasKjafVYRhivpFdbYq05K?=
 =?us-ascii?Q?fQbWRdk0DeQQ+zfnqcfAL4dmsydmOGIMgrY1A6TqeH+TT84TqtDUNXfILzDl?=
 =?us-ascii?Q?kSO1Ves4A/9ytF4GWzJm3wS+7Yv+3zIbM7S0WLZFSXK5NuMw3fxlgnsOIRDd?=
 =?us-ascii?Q?IRUH3RQdnNGq3Ld2KggXViBWkBSTTrm+U7D4UENNAhkZWbGxtqOwEufkBxcV?=
 =?us-ascii?Q?OqvjgbYHcUNiqr4fG7ZsfZGNOhoWzgYJRo4X2KzSYQ6WhyAIL1EF2+fSbOPP?=
 =?us-ascii?Q?nZFtBgBHtOW8y6vu3Gl2t9n0lgGLQfPBIjYWVWf9VSOnyd3xWNr354WQ9W5w?=
 =?us-ascii?Q?dSXPwk2tU/xAQeBln7b/5PX5rQciH1Xlm9OROWh7c2J/eOuaEjjLTveR5S48?=
 =?us-ascii?Q?i90hbSIqrPQsiUlJVxGUId/fO7aw+EGj1/xJx4ybKJE8b/HgczcLV9nEdyCU?=
 =?us-ascii?Q?8JMvi+U7QzyFeUS3gj4nsOaXA/UstwKCyNSMyVmvXK3dg17D7Xip9ac2VJs7?=
 =?us-ascii?Q?ou9gQKJhordvqWby2S6tvI6sEDpQIq5e8rT50145QZkjPuw/1bqS8/WubljN?=
 =?us-ascii?Q?20luYOUgyF0OHGqZHDQNX9vp1BOoJLH6PpIxusF/uYj4HvOJY4uXkuVHE5Kp?=
 =?us-ascii?Q?Qbz9uTV4WUXekcT1GkWDTp1pCsF5bOKXQqdrjUzvOlSYSOapCvgcDxfS/kcH?=
 =?us-ascii?Q?75n1Q4KaHNMKKKLLjkZ/p44s/Ks52EVDEH/4GPNOQB37VwbJgasiTDXBDnHL?=
 =?us-ascii?Q?A3+qxKbt70NUAlHJHu3sR9TT+glJACE/wwbXeKWx4kc9MYHIzfRa3Menp3g8?=
 =?us-ascii?Q?Y63TSRijLLjSjuXQybpPFBxPBpI+JTIHaka0gM6LH5sqbs+DKH0trAeEK/nf?=
 =?us-ascii?Q?nHCTgkxttSW9XedzYUMMrG1atg5CGZSlevrv?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 04:09:33.9183
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cb38ba1-2f81-49d5-d836-08dda89dc5e1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000011.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9610

Allocate a 88 byte request structure on stack and skip needless
kzalloc/kfree.

While at this, correct indent.

No functional change intended.

Reviewed-by: Tom Lendacky <thomas.lendacky@amd.com>
Reviewed-by: Dionna Glaze <dionnaglaze@google.com>
Signed-off-by: Alexey Kardashevskiy <aik@amd.com>
---
 arch/x86/coco/sev/core.c | 30 ++++++++------------
 1 file changed, 12 insertions(+), 18 deletions(-)

diff --git a/arch/x86/coco/sev/core.c b/arch/x86/coco/sev/core.c
index cf91cb4e2c47..068653865bfb 100644
--- a/arch/x86/coco/sev/core.c
+++ b/arch/x86/coco/sev/core.c
@@ -2069,7 +2069,7 @@ static int __init snp_get_tsc_info(void)
 	struct snp_tsc_info_resp *tsc_resp;
 	struct snp_tsc_info_req *tsc_req;
 	struct snp_msg_desc *mdesc;
-	struct snp_guest_req *req;
+	struct snp_guest_req req = {};
 	int rc = -ENOMEM;
 
 	tsc_req = kzalloc(sizeof(*tsc_req), GFP_KERNEL);
@@ -2085,28 +2085,24 @@ static int __init snp_get_tsc_info(void)
 	if (!tsc_resp)
 		goto e_free_tsc_req;
 
-	req = kzalloc(sizeof(*req), GFP_KERNEL);
-	if (!req)
-		goto e_free_tsc_resp;
-
 	mdesc = snp_msg_alloc();
 	if (IS_ERR_OR_NULL(mdesc))
-		goto e_free_req;
+		goto e_free_tsc_resp;
 
 	rc = snp_msg_init(mdesc, snp_vmpl);
 	if (rc)
 		goto e_free_mdesc;
 
-	req->msg_version = MSG_HDR_VER;
-	req->msg_type = SNP_MSG_TSC_INFO_REQ;
-	req->vmpck_id = snp_vmpl;
-	req->req_buf = tsc_req;
-	req->req_sz = sizeof(*tsc_req);
-	req->resp_buf = (void *)tsc_resp;
-	req->resp_sz = sizeof(*tsc_resp) + AUTHTAG_LEN;
-	req->exit_code = SVM_VMGEXIT_GUEST_REQUEST;
+	req.msg_version = MSG_HDR_VER;
+	req.msg_type = SNP_MSG_TSC_INFO_REQ;
+	req.vmpck_id = snp_vmpl;
+	req.req_buf = tsc_req;
+	req.req_sz = sizeof(*tsc_req);
+	req.resp_buf = (void *)tsc_resp;
+	req.resp_sz = sizeof(*tsc_resp) + AUTHTAG_LEN;
+	req.exit_code = SVM_VMGEXIT_GUEST_REQUEST;
 
-	rc = snp_send_guest_request(mdesc, req);
+	rc = snp_send_guest_request(mdesc, &req);
 	if (rc)
 		goto e_request;
 
@@ -2127,9 +2123,7 @@ static int __init snp_get_tsc_info(void)
 	memzero_explicit(tsc_resp, sizeof(*tsc_resp) + AUTHTAG_LEN);
 e_free_mdesc:
 	snp_msg_free(mdesc);
-e_free_req:
-	kfree(req);
- e_free_tsc_resp:
+e_free_tsc_resp:
 	kfree(tsc_resp);
 e_free_tsc_req:
 	kfree(tsc_req);
-- 
2.49.0

