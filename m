Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2046.outbound.protection.outlook.com [40.107.223.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FFE635962
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 04:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749614963; cv=fail; b=Vl6s+kn2e2Ky4b8pnP4rymAd/6ohXMXaMSE+jR4AHXnjw4KJLaV7JsEs4sW8jgfoWjzC4jAPx00giPEPDBnOQakX55VL+zYkYdAu7fDKzpiCjIHwuk4UN83D6D0A792pYEvp/0Y4ThkUJxjWZ5TX5P2MYP8s3kIJKm528eyTcf0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749614963; c=relaxed/simple;
	bh=1EuR2v9IHE4rIKXEkaQQGrHkMzRyT1lqiH4hE/3wEUE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XdTIDyVG/lhYumcvE9yCKTnAffLnquEJCQCLC+GYFBpXNsNzHU05GB70kucWMjHPf+AU6mahvjlF7v7x4TYVYktUvs82A397Rw4PY205ZNXs90Mo4bcXf1OgvKBCXi3iH9pVNg3LKW5NUCoyeZxGleBKKyKmBlO2exbj79wwrOI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=B9zp0bLu; arc=fail smtp.client-ip=40.107.223.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="B9zp0bLu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SxUz/38vsj6TCV6oB2s848FMlC+hW5QpysCUuWw069a0uAnLoNlZgDonDTiwt4qtos5aXPQ3sPplUYHPaqN7atHmjtCe8fRRgw39o3MzD388B5U+BbrTsJ02wQjx2N4swil3XsUlcXZmSdh9TwviIE1yS2azhxLDH1BKQrwS/QZXKnJMbS7gInskCo7tINFkGG48kyXa2S26F6CfxDH/3oY240ChSPMeoayuQOlh6eg2zqIJ0rkcpcWWrvzMqzsDzezCba/Gen0CaZwtAeUgWN3K0nKuSl16+KSWmFPckg7NYFqPT9JVRwJB9Pt7eznb3KAyVMLyGPjn7MOe6tMKUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EeWRXrH9ElZrG0T28y6CuOEt8+O7ZJvbQPVa0JiMfRA=;
 b=HALCNdlZ5/828NiBgV3GZXkz5+3VvyzLp2CZwIx5mo2pJ1dmYTQc279AZU76xUHTnvAGROt5r+OyO433vi4ZXFKL1lDbypsNVBq7yU94bz8eZiciao2+sg6FNjlnun5xsrwnTSV5RJowh077luo3kTOqYshkSp3y3/YpQOO3SNSYy5TRYJnLunADGoxrCDn9MzsAbFzcT5Mkpf2nTQOA24k2o7k2DK49S71J7Lkd4XS134tZFsBniXtHfqnY5BIfU1Pm8Jys2JlJz95x/isyqunr7PIVL+5yBaM4//KgmUqun7JHtu+p1J2Z6N/N4lPlP+QYB2bGew/Qa4QA2JjLTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EeWRXrH9ElZrG0T28y6CuOEt8+O7ZJvbQPVa0JiMfRA=;
 b=B9zp0bLu4TbQ6y/usWLpPqvDIUk4t+b/UidsE0iz4Q3DkKDXDki/MN4DILgAZFh+k/eiI5HYdXD8tbjEzDuOeqc+2obH8ogSw4wnW9AJNOOV4F5rTBFQ4CDiKltf6y2L+cguKXtK2ooMBfq9F9rcJsPOitJcabFdH/kq/iNR3zw=
Received: from DM6PR11CA0069.namprd11.prod.outlook.com (2603:10b6:5:14c::46)
 by CYYPR12MB8962.namprd12.prod.outlook.com (2603:10b6:930:c4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Wed, 11 Jun
 2025 04:09:17 +0000
Received: from CH3PEPF00000015.namprd21.prod.outlook.com
 (2603:10b6:5:14c:cafe::92) by DM6PR11CA0069.outlook.office365.com
 (2603:10b6:5:14c::46) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.31 via Frontend Transport; Wed,
 11 Jun 2025 04:09:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000015.mail.protection.outlook.com (10.167.244.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.2 via Frontend Transport; Wed, 11 Jun 2025 04:09:17 +0000
Received: from aiemdee.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 23:09:13 -0500
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
Subject: [PATCH v2 1/4] virt: sev-guest: Contain snp_guest_request_ioctl in sev-guest
Date: Wed, 11 Jun 2025 14:08:39 +1000
Message-ID: <20250611040842.2667262-2-aik@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000015:EE_|CYYPR12MB8962:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d20ddbd-d002-4e39-72f8-08dda89dbc23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2b7PaelpvN4ddwT5Hrv/EBekWeb6k8cr51CaTL4v9Ce4ADa7Ayb2r9AlRIts?=
 =?us-ascii?Q?cixeDwg2ZzDd/fgL+U1T+/8+uH1qgNeg2I0TUr6ZLGQAAM2ZZddwIl/7QLC5?=
 =?us-ascii?Q?AKfiqc9nN7H3QYkbJqXFv3uNt2z5Hx2Sp3PxFWP/XkL9iG2AGsbqbtAQ30u1?=
 =?us-ascii?Q?MybburCvBNRW67S908IEqJPqnktnmRyQKO5x8MT4aLivIWNYZ1B+0tqvIyAZ?=
 =?us-ascii?Q?KfiVIwpQkrwYRa94h1DKkMRbX7mD5AdSQElxekq8X5qhYyzDfjB1ch8k0eBy?=
 =?us-ascii?Q?gZRUoLHb2ba2MUrwNATYa3J7RY4tiM6rKssOmeWhoO9LhVvlRckb4ZFLGZ9O?=
 =?us-ascii?Q?v2dgp9wi7i4cWMnB6fclg1nT4BZD5AeBQfVDdHCGK7IZB78URO5yfsQOICxq?=
 =?us-ascii?Q?+7adAcbjGoc/fAbjlee1SvGDKVlgHfXa5ORJrKeqpKp+7/eIggo4DDeziBND?=
 =?us-ascii?Q?/s9El0yRtDDDo9RA5yVR2CVq8wfh+gv21qmWUda2gDl64uwELgLXpJ4489uL?=
 =?us-ascii?Q?e2G6s3Vw8fGdzOQGACqfX+Dkm55Sacs21Ieaq0G6WgQEbNFB+daLJ3LwRXtu?=
 =?us-ascii?Q?Ye4xqcoqCf+tYJMArq0vNqphDjRAkwTtyk/LgZCoaPyNmQ0tLZWEdFM1RIKN?=
 =?us-ascii?Q?bWURfkIhxg7wBb7yqxosc1JNmxerc1kGiNeRGCwyQPBTafZ71QWN+lqXiLAu?=
 =?us-ascii?Q?mUqaiFQw0Xa6/9vHymv3Oy4U51svzmyA3zTICufIzMtFrd/8NHQ+W/2UdoQj?=
 =?us-ascii?Q?D0hFXuE60WInJJ16dd6OlY1UdyPpQQ/D5ILvvIeKDTViutEMl/pqrgQJXz2W?=
 =?us-ascii?Q?ZI+YKOoOk37X0u66fi1GDiEtN9UgxYQD1cxEFP5o94DmxhnvI2vT6Ow/t/2L?=
 =?us-ascii?Q?Atki5yQj8IUpI3BBthVhZIkPA86S8nPikqsfsoR0e/269Gzf8wJxgFuEDEb6?=
 =?us-ascii?Q?5cay1VNwaBg0e+evy8ak8QmYT5sLzOprjRmDtefLIyQiBsnUUGeoTThB6WAz?=
 =?us-ascii?Q?7cVYkq0C7V9++STFYSZHJ20ivJH1cfl4nMDurT8LFKQA73RM/F41ZI9ihAke?=
 =?us-ascii?Q?KyIplp5A1eaftVCF7iH3H3UaWDgr5493hHKiB6QZE7oODdmqEEWQafxX8TTf?=
 =?us-ascii?Q?kCHT6e1EqaqJzbM6uG1XCvDM3VmqmTMon1FFM+63eNuKHUUyeBRzd94w2X9T?=
 =?us-ascii?Q?dI7TQggjZEz6mXivxZZDU5O3dRkMyKQGzLISfCVGxWbpgiQfntis8ueSSUSg?=
 =?us-ascii?Q?Vl7rCUPvEkGGkRhCU72ojeZ9BLKUhuRcToh7hJOM5F5dphm0+FfykjFzO9c1?=
 =?us-ascii?Q?KTE05G5rabp5tOTSi69Qv8MXThr4OzC8iRmCSvHzwq8qmZXNOSHn4H0gqfI1?=
 =?us-ascii?Q?3iuCChJOCsywxnQH3wOjm3KMnY9RkeudsQ9UQ7Hb6tuTxQx8HiXTa8fEmqnm?=
 =?us-ascii?Q?Owuipn+3IxHpKcnQJQGmYqGDWeCWktn2hWghINYvFQCxzK6iEqmAZ/YnWyMJ?=
 =?us-ascii?Q?u5ywcPwOE+b2CvpowI+mbx6Bu8rLXLmn3tkR?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 04:09:17.5701
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d20ddbd-d002-4e39-72f8-08dda89dbc23
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000015.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8962

SNP Guest Request only uses exitinfo2 which is a return value from GHCB,
has meaning beyond ioctl and therefore belongs to snp_guest_req.

Move exitinfo2 to snp_guest_req, remove snp_guest_request_ioctl from
the SEV platform code.

No functional change intended.

Reviewed-by: Tom Lendacky <thomas.lendacky@amd.com>
Reviewed-by: Dionna Glaze <dionnaglaze@google.com>
Signed-off-by: Alexey Kardashevskiy <aik@amd.com>
---

Not passing exitinfo2 as a parameter as it's been mentioned on v2:

===
having a struct request which collects all fields you need to pass down or return to callers is the RightThing(tm) to do.
===
---
 arch/x86/include/asm/sev.h              | 10 +++---
 arch/x86/coco/sev/core.c                | 36 +++++++-------------
 drivers/virt/coco/sev-guest/sev-guest.c |  9 +++--
 3 files changed, 23 insertions(+), 32 deletions(-)

diff --git a/arch/x86/include/asm/sev.h b/arch/x86/include/asm/sev.h
index 58e028d42e41..fbb616fcbfb8 100644
--- a/arch/x86/include/asm/sev.h
+++ b/arch/x86/include/asm/sev.h
@@ -231,6 +231,7 @@ struct snp_guest_req {
 	size_t resp_sz;
 
 	u64 exit_code;
+	u64 exitinfo2;
 	unsigned int vmpck_id;
 	u8 msg_version;
 	u8 msg_type;
@@ -486,8 +487,6 @@ static inline int pvalidate(unsigned long vaddr, bool rmp_psize, bool validate)
 	return rc;
 }
 
-struct snp_guest_request_ioctl;
-
 void setup_ghcb(void);
 void early_snp_set_memory_private(unsigned long vaddr, unsigned long paddr,
 				  unsigned long npages);
@@ -513,8 +512,7 @@ void snp_kexec_begin(void);
 int snp_msg_init(struct snp_msg_desc *mdesc, int vmpck_id);
 struct snp_msg_desc *snp_msg_alloc(void);
 void snp_msg_free(struct snp_msg_desc *mdesc);
-int snp_send_guest_request(struct snp_msg_desc *mdesc, struct snp_guest_req *req,
-			   struct snp_guest_request_ioctl *rio);
+int snp_send_guest_request(struct snp_msg_desc *mdesc, struct snp_guest_req *req);
 
 int snp_svsm_vtpm_send_command(u8 *buffer);
 
@@ -587,8 +585,8 @@ static inline void snp_kexec_begin(void) { }
 static inline int snp_msg_init(struct snp_msg_desc *mdesc, int vmpck_id) { return -1; }
 static inline struct snp_msg_desc *snp_msg_alloc(void) { return NULL; }
 static inline void snp_msg_free(struct snp_msg_desc *mdesc) { }
-static inline int snp_send_guest_request(struct snp_msg_desc *mdesc, struct snp_guest_req *req,
-					 struct snp_guest_request_ioctl *rio) { return -ENODEV; }
+static inline int snp_send_guest_request(struct snp_msg_desc *mdesc,
+					 struct snp_guest_req *req) { return -ENODEV; }
 static inline int snp_svsm_vtpm_send_command(u8 *buffer) { return -ENODEV; }
 static inline void __init snp_secure_tsc_prepare(void) { }
 static inline void __init snp_secure_tsc_init(void) { }
diff --git a/arch/x86/coco/sev/core.c b/arch/x86/coco/sev/core.c
index b6db4e0b936b..cf91cb4e2c47 100644
--- a/arch/x86/coco/sev/core.c
+++ b/arch/x86/coco/sev/core.c
@@ -1389,8 +1389,7 @@ int snp_issue_svsm_attest_req(u64 call_id, struct svsm_call *call,
 }
 EXPORT_SYMBOL_GPL(snp_issue_svsm_attest_req);
 
-static int snp_issue_guest_request(struct snp_guest_req *req, struct snp_req_data *input,
-				   struct snp_guest_request_ioctl *rio)
+static int snp_issue_guest_request(struct snp_guest_req *req, struct snp_req_data *input)
 {
 	struct ghcb_state state;
 	struct es_em_ctxt ctxt;
@@ -1398,7 +1397,7 @@ static int snp_issue_guest_request(struct snp_guest_req *req, struct snp_req_dat
 	struct ghcb *ghcb;
 	int ret;
 
-	rio->exitinfo2 = SEV_RET_NO_FW_CALL;
+	req->exitinfo2 = SEV_RET_NO_FW_CALL;
 
 	/*
 	 * __sev_get_ghcb() needs to run with IRQs disabled because it is using
@@ -1423,8 +1422,8 @@ static int snp_issue_guest_request(struct snp_guest_req *req, struct snp_req_dat
 	if (ret)
 		goto e_put;
 
-	rio->exitinfo2 = ghcb->save.sw_exit_info_2;
-	switch (rio->exitinfo2) {
+	req->exitinfo2 = ghcb->save.sw_exit_info_2;
+	switch (req->exitinfo2) {
 	case 0:
 		break;
 
@@ -1919,8 +1918,7 @@ static int enc_payload(struct snp_msg_desc *mdesc, u64 seqno, struct snp_guest_r
 	return 0;
 }
 
-static int __handle_guest_request(struct snp_msg_desc *mdesc, struct snp_guest_req *req,
-				  struct snp_guest_request_ioctl *rio)
+static int __handle_guest_request(struct snp_msg_desc *mdesc, struct snp_guest_req *req)
 {
 	unsigned long req_start = jiffies;
 	unsigned int override_npages = 0;
@@ -1934,7 +1932,7 @@ static int __handle_guest_request(struct snp_msg_desc *mdesc, struct snp_guest_r
 	 * sequence number must be incremented or the VMPCK must be deleted to
 	 * prevent reuse of the IV.
 	 */
-	rc = snp_issue_guest_request(req, &req->input, rio);
+	rc = snp_issue_guest_request(req, &req->input);
 	switch (rc) {
 	case -ENOSPC:
 		/*
@@ -1987,7 +1985,7 @@ static int __handle_guest_request(struct snp_msg_desc *mdesc, struct snp_guest_r
 	snp_inc_msg_seqno(mdesc);
 
 	if (override_err) {
-		rio->exitinfo2 = override_err;
+		req->exitinfo2 = override_err;
 
 		/*
 		 * If an extended guest request was issued and the supplied certificate
@@ -2005,8 +2003,7 @@ static int __handle_guest_request(struct snp_msg_desc *mdesc, struct snp_guest_r
 	return rc;
 }
 
-int snp_send_guest_request(struct snp_msg_desc *mdesc, struct snp_guest_req *req,
-			   struct snp_guest_request_ioctl *rio)
+int snp_send_guest_request(struct snp_msg_desc *mdesc, struct snp_guest_req *req)
 {
 	u64 seqno;
 	int rc;
@@ -2043,14 +2040,14 @@ int snp_send_guest_request(struct snp_msg_desc *mdesc, struct snp_guest_req *req
 	req->input.resp_gpa = __pa(mdesc->response);
 	req->input.data_gpa = req->certs_data ? __pa(req->certs_data) : 0;
 
-	rc = __handle_guest_request(mdesc, req, rio);
+	rc = __handle_guest_request(mdesc, req);
 	if (rc) {
 		if (rc == -EIO &&
-		    rio->exitinfo2 == SNP_GUEST_VMM_ERR(SNP_GUEST_VMM_ERR_INVALID_LEN))
+		    req->exitinfo2 == SNP_GUEST_VMM_ERR(SNP_GUEST_VMM_ERR_INVALID_LEN))
 			return rc;
 
 		pr_alert("Detected error from ASP request. rc: %d, exitinfo2: 0x%llx\n",
-			 rc, rio->exitinfo2);
+			 rc, req->exitinfo2);
 
 		snp_disable_vmpck(mdesc);
 		return rc;
@@ -2069,7 +2066,6 @@ EXPORT_SYMBOL_GPL(snp_send_guest_request);
 
 static int __init snp_get_tsc_info(void)
 {
-	struct snp_guest_request_ioctl *rio;
 	struct snp_tsc_info_resp *tsc_resp;
 	struct snp_tsc_info_req *tsc_req;
 	struct snp_msg_desc *mdesc;
@@ -2093,13 +2089,9 @@ static int __init snp_get_tsc_info(void)
 	if (!req)
 		goto e_free_tsc_resp;
 
-	rio = kzalloc(sizeof(*rio), GFP_KERNEL);
-	if (!rio)
-		goto e_free_req;
-
 	mdesc = snp_msg_alloc();
 	if (IS_ERR_OR_NULL(mdesc))
-		goto e_free_rio;
+		goto e_free_req;
 
 	rc = snp_msg_init(mdesc, snp_vmpl);
 	if (rc)
@@ -2114,7 +2106,7 @@ static int __init snp_get_tsc_info(void)
 	req->resp_sz = sizeof(*tsc_resp) + AUTHTAG_LEN;
 	req->exit_code = SVM_VMGEXIT_GUEST_REQUEST;
 
-	rc = snp_send_guest_request(mdesc, req, rio);
+	rc = snp_send_guest_request(mdesc, req);
 	if (rc)
 		goto e_request;
 
@@ -2135,8 +2127,6 @@ static int __init snp_get_tsc_info(void)
 	memzero_explicit(tsc_resp, sizeof(*tsc_resp) + AUTHTAG_LEN);
 e_free_mdesc:
 	snp_msg_free(mdesc);
-e_free_rio:
-	kfree(rio);
 e_free_req:
 	kfree(req);
  e_free_tsc_resp:
diff --git a/drivers/virt/coco/sev-guest/sev-guest.c b/drivers/virt/coco/sev-guest/sev-guest.c
index 7a4e2188f109..d2b3ae7113ab 100644
--- a/drivers/virt/coco/sev-guest/sev-guest.c
+++ b/drivers/virt/coco/sev-guest/sev-guest.c
@@ -101,7 +101,8 @@ static int get_report(struct snp_guest_dev *snp_dev, struct snp_guest_request_io
 	req.resp_sz = resp_len;
 	req.exit_code = SVM_VMGEXIT_GUEST_REQUEST;
 
-	rc = snp_send_guest_request(mdesc, &req, arg);
+	rc = snp_send_guest_request(mdesc, &req);
+	arg->exitinfo2 = req.exitinfo2;
 	if (rc)
 		goto e_free;
 
@@ -152,7 +153,8 @@ static int get_derived_key(struct snp_guest_dev *snp_dev, struct snp_guest_reque
 	req.resp_sz = resp_len;
 	req.exit_code = SVM_VMGEXIT_GUEST_REQUEST;
 
-	rc = snp_send_guest_request(mdesc, &req, arg);
+	rc = snp_send_guest_request(mdesc, &req);
+	arg->exitinfo2 = req.exitinfo2;
 	if (rc)
 		return rc;
 
@@ -249,7 +251,8 @@ static int get_ext_report(struct snp_guest_dev *snp_dev, struct snp_guest_reques
 	req.resp_sz = resp_len;
 	req.exit_code = SVM_VMGEXIT_EXT_GUEST_REQUEST;
 
-	ret = snp_send_guest_request(mdesc, &req, arg);
+	ret = snp_send_guest_request(mdesc, &req);
+	arg->exitinfo2 = req.exitinfo2;
 
 	/* If certs length is invalid then copy the returned length */
 	if (arg->vmm_error == SNP_GUEST_VMM_ERR_INVALID_LEN) {
-- 
2.49.0

