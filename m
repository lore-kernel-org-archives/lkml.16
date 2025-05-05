Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2075.outbound.protection.outlook.com [40.107.243.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A5E1E1DE5
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 14:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746454428; cv=fail; b=HKn3lAAYRu6XLDI+OxAtyHAeaAm/ItMFFeV4yuL/YkQ+IoiDpJJqvZ/2C5rYMpK9ePJpdeLsMD5/+UaOpRDDO0pS08YYb493oMXaQeNiRSvOarKKSvXctXdexycF4AUtK+JodhV96adiKMjkeiOCJyvMix4Zf0NeffP4nv8ggpU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746454428; c=relaxed/simple;
	bh=eMuNUjl/TKQFSJm+FvahZ44PgaAF2t7j5cZDjRjbDks=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GwWDSQlEof7QdtOKFpRTPL7bjhM1xZSwYFBK3IEeDcMfoZUL3FE5tBMiE4OU6NS7JFOyaIuaOAPxtGdxwpiqQDCoP+WUiM06bKZXD95aS1iG6a6FwRuYRhvWpw3ZmPs4Hg0lyt4OXjgdJy55Zz70gTzXIYsAQ37ID4fd89H4R1k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=UUq3YQbE; arc=fail smtp.client-ip=40.107.243.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="UUq3YQbE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KqpGeknJYlHW7LiWDMmny7wd/GQL0L5RKHAohQ7qZUq+e45j+3Gn88rc3ec7mw+zcsk7NzLxcGQijsvcYG6185b3ga2SqH+Uh52f2C9dsrvUb2iLFb3il9wWt27SjjbLQ0rEg6PIA89lBN/xRsBRuNJsvsez46RXesK0xOtWsLgBwNtadr6QaexNkhJ9ia8p9pxZm9HrvSwP0iBtBiDJxgbLGqHC1iB7KsSNtk1VIDlJ3sP1k9I0AvXE+qg+qdtOOl5XI0wlBnzzfCM6SdwFsQCe/CQ/6ibm8Imzq8Nc9MAi1qrczrL/xDi2yx0OVb0drPMeA01FtZOsHLyRzEiSRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A6M89bglZ/pD9ejtJcGiJ0R0Y5XT2vX+sCFaTkqh/lM=;
 b=Mid4NwJ0bKM2QKbnmxitspdcqA94Wz1XI5i1rZR0elOMmXsRLvoO+72OotqyzQ2ZTUoIC3zXYo9rUN2I0zCNLXbELS0UHnNOgpkQppMIvNhuAc6q1waGZy3bhigc0fXIxsgaRwVgqrwkKQqpvXx0mehNcSH37t699SG4EP3ZvgMYkNiJMrToulMv2lbtZo0PFgP27i8WLAuehgIUj57vSmLfyW/x9U4H1dqKE5hPlS1Wqe5AkiYOqJz+4YSZY35u0dqXyMxe/I4xLPbFDaYbHTG6sppPQ6iX+EDNmbbRLDJTKscdYEmSTc3dbjN6F72A/Ek5G/j+N/bn6OLKCBHDpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A6M89bglZ/pD9ejtJcGiJ0R0Y5XT2vX+sCFaTkqh/lM=;
 b=UUq3YQbENMbWWPEXy+j2E+Qu0iiVrEOiDc91XUw5d2YPJXlbf76zobOcIv5VG8QGs8NQTEcx6QY8K1FBBH/klFHjcyTlNF17/3vQNEtC2A9G9D7e8OeTCy5/ANbvpld6wau1cA+cFvjNFl2Sot9nDCClw8E1Z1cLYqxF/RZbnSg=
Received: from BYAPR02CA0025.namprd02.prod.outlook.com (2603:10b6:a02:ee::38)
 by SJ0PR12MB6736.namprd12.prod.outlook.com (2603:10b6:a03:47a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Mon, 5 May
 2025 14:13:41 +0000
Received: from CY4PEPF0000EE3E.namprd03.prod.outlook.com
 (2603:10b6:a02:ee:cafe::88) by BYAPR02CA0025.outlook.office365.com
 (2603:10b6:a02:ee::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.28 via Frontend Transport; Mon,
 5 May 2025 14:13:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE3E.mail.protection.outlook.com (10.167.242.16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Mon, 5 May 2025 14:13:40 +0000
Received: from aiemdee.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 5 May
 2025 09:13:35 -0500
From: Alexey Kardashevskiy <aik@amd.com>
To: <x86@kernel.org>
CC: <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	"Ingo Molnar" <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Tom Lendacky
	<thomas.lendacky@amd.com>, Nikunj A Dadhania <nikunj@amd.com>, Ard Biesheuvel
	<ardb@kernel.org>, Brijesh Singh <brijesh.singh@amd.com>, Ashish Kalra
	<ashish.kalra@amd.com>, Paolo Bonzini <pbonzini@redhat.com>, Michael Roth
	<michael.roth@amd.com>, Kuppuswamy Sathyanarayanan
	<sathyanarayanan.kuppuswamy@linux.intel.com>, Liam Merwick
	<liam.merwick@oracle.com>, Alexey Kardashevskiy <aik@amd.com>
Subject: [PATCH 2/4] x86/sev: Allocate request in TSC_INFO_REQ on stack
Date: Tue, 6 May 2025 00:12:36 +1000
Message-ID: <20250505141238.4179623-3-aik@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250505141238.4179623-1-aik@amd.com>
References: <20250505141238.4179623-1-aik@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3E:EE_|SJ0PR12MB6736:EE_
X-MS-Office365-Filtering-Correlation-Id: c9125b91-cb26-4a85-7360-08dd8bdf0989
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|7416014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mBJYRxr9dt1LVHlpFt9FJa9RXR2xLTQv/mosoRj6RtuaiibqWYgZam1GpMJp?=
 =?us-ascii?Q?h719IN/uu0IpzG8W2TFPvubpAOReth5wWvTFuFlSwBkK3gex0L5Y1TGYKmPk?=
 =?us-ascii?Q?/1vHEK+lrxnAYWD2rQRxz2g2+SM3kYmw1ytiiH3AQnUMUIh0DibBUQjm8nvz?=
 =?us-ascii?Q?YgzFd+pmLjRGkdmQgFOJUO1zM21cXNRNSJBCIfpvU+fRPnYdOjYVhYRSxhtV?=
 =?us-ascii?Q?Q4DE4fOg3AeoleiyAuCEO6BftaCcVC2hOK6udajD4QdgJB76X8YBxkEBfvWN?=
 =?us-ascii?Q?YEfk8yfK68d+p78ryLMptm5ArgbP2UYYCFP8OaniLhfiZxyNdTYrMXTJQqNf?=
 =?us-ascii?Q?L5mf6wsHu5Zo98XsKMoUVPF+QSepOL2/AIL3jSSFzNg6jNcf6AO524KfvO12?=
 =?us-ascii?Q?jKDXdDlXCOlWY8zyqbfYeq1ow4VxaKITQ38+Ps3EbcyZQRHUL1HcCE8NtZ/6?=
 =?us-ascii?Q?4b3kjWW2OWDKnEkAF0bhePbyzsi4DqetLkMtOo09hmFRgHvqW02j7Vwg7wYI?=
 =?us-ascii?Q?CGgH6aZp3eovM3dQaV/RF3M6EdKB6f/o8eFQZoes4WRd8EZ51Zx4Z0p/9NEI?=
 =?us-ascii?Q?c31DnxkbDRlwgnfeJK7NA4MI4kU/hsBLe631x/am2O+sLyYkQHnxeRTuDYM1?=
 =?us-ascii?Q?v724ytPkBtkfuayY5h7qHGUTbgRxFsD0YuRuLwIJa2huA3425bsef+PW3X4W?=
 =?us-ascii?Q?II3dpwve30zx92js1K6pyKG0mNF51G9q9EDNdZAQ6XW+nlWLtExEKNh1voo5?=
 =?us-ascii?Q?S/l/usKKROj98p839vltjI4DFZYPn56GRdp8Jqbl3lB92CSt1A9pP1yNFSgj?=
 =?us-ascii?Q?dTPbx87/3xMs92UgJUTGrk0L0A8AP3N0EoRETe6jBF7aTfBUbf+/L9iAOTR/?=
 =?us-ascii?Q?VxJ6ZgFGUkyCDUWk5r/4B2wTI0lBok/E93jHz2v8fhmkaME2zOA2+ekehhws?=
 =?us-ascii?Q?jO6avwFNEPBGwQYGgGAo0w/NkAn4nb2gOqfD/nEOhboXkayFOCEX3yKBm3Qy?=
 =?us-ascii?Q?lokkdsrOuLwtDhmnjerR4CnIXQae/3FyrUUy/wKQVz5Liq2QcR2T1cRTXAz1?=
 =?us-ascii?Q?9qu50IcOuOhudGDRjRbk4qPCgxjsoscyEWVIdjP+n/iak1pKZd6Yul6lAWsP?=
 =?us-ascii?Q?Bos5Zq0KzOzaPaDOfrKDULRdHg6nSJLW6uP2lKNgcsJJtMpwFSskigRSH8a3?=
 =?us-ascii?Q?Sc+vEKCdh6dA4hfUt5L6r+eWrJZYKNBO5k5BzSD7y6rEsuLzMKxgEAJrbzCe?=
 =?us-ascii?Q?8JohXNI2BLSDjLczCp//ruA8Hvqhhf4f1aWxJ1XwPukkGzcYiyv/svNCwkiU?=
 =?us-ascii?Q?tIES+iuA+q2dH35pmgh7yjNUVh+vZOB6xaGOGVtot+BAICVbLukfSmcA7/Na?=
 =?us-ascii?Q?13rlfBmf7aKASixaeL5pSgl4KizFYLtWn+4SOdyEhkgBYCTE/pXgkIEYipTP?=
 =?us-ascii?Q?jbbVR9Z0eUVNRB3x4JRknifDyg0dg0bl8hLHVsbmBYiqPshH3BsEE24wNgU2?=
 =?us-ascii?Q?868lyrocH3m3v2dBCKZTzzEF4SihCIbkfEUz?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(7416014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 14:13:40.8992
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9125b91-cb26-4a85-7360-08dd8bdf0989
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6736

Allocate a 88 byte request structure on stack and skip needless
kzalloc/kfree.

While at this, correct indent.

No functional change intended.

Signed-off-by: Alexey Kardashevskiy <aik@amd.com>
---
Changes:
v4:
* keep initialization of @req in one place as before
---
 arch/x86/coco/sev/core.c | 30 ++++++++------------
 1 file changed, 12 insertions(+), 18 deletions(-)

diff --git a/arch/x86/coco/sev/core.c b/arch/x86/coco/sev/core.c
index 7a49c896feb4..818ae7b1694b 100644
--- a/arch/x86/coco/sev/core.c
+++ b/arch/x86/coco/sev/core.c
@@ -2002,7 +2002,7 @@ static int __init snp_get_tsc_info(void)
 	struct snp_tsc_info_resp *tsc_resp;
 	struct snp_tsc_info_req *tsc_req;
 	struct snp_msg_desc *mdesc;
-	struct snp_guest_req *req;
+	struct snp_guest_req req = {};
 	int rc = -ENOMEM;
 
 	tsc_req = kzalloc(sizeof(*tsc_req), GFP_KERNEL);
@@ -2018,28 +2018,24 @@ static int __init snp_get_tsc_info(void)
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
 
@@ -2060,9 +2056,7 @@ static int __init snp_get_tsc_info(void)
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

