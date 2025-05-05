Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2062.outbound.protection.outlook.com [40.107.100.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA41A17736
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 14:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746454412; cv=fail; b=De2VU0SN3w9HHA2KTua+R9TyE7VuMU+igopXHL7Q4ke0FVyqGVlYURXDQv8k5AXtFytRZScVwRVTOUzf3phSwssMZhLeUnjHSoS/Ps89gSHb4gi0JxHSbTXN5DoBxpgHFgw5CFatVNMGl6LhQMEk5b+JI8iVYtwCud1JIDpd7QY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746454412; c=relaxed/simple;
	bh=hLFwRTr3jnzyx70bUHR2cqwyr8szEPZKC83afOxxkjw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lU71RMk8y/KnG7NbFdfZ7XqGJ6lOa0G/7alKCv5Wv0fQnT/fkDM1kMdSW/GXFthJREvAvIUX7nZIhtLALfaiviudJPYnWvmXD7Jy5XoUECWSf7qwl/BWLjh1STJsTKjQYAlPx+TNHr0iHbcAGfaKs9HWrKVdSfpp7HUTKQFjDZ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=GzbTnlVA; arc=fail smtp.client-ip=40.107.100.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="GzbTnlVA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bq3guA/i+yMFzRNEGg7PbKlOXglyIZu43T5VS2ZEGI1mAjfntYJdLOGoa79COsfePijGrn3dJ8atGn0oMq991Hcfu3y7ozhAOTbATQ/NArTLkvTqsO3Pa4/X6l/6iy3GrIqdtE0yFCBMYJTLbAcyZVDmUyhbpuuVduWjLSU3mR7KhHPR3GG9NgVTSyOTa7+QKItbJpNx6wDpWa+IwH2nBVrvwy4RzBCiJIjyiPAR6mqpAiJEnNIVHMVALl6dsQDYAnIYx8/4Ij8wB7ef71EcFs/UUAog2M2U9eZDXuEpZT49OGc9Ad5iEum2H1qeOceCGmPwQusPlWCELGPNUz93rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JvgKNHXNGh7C/yM4n+UrUcugOlw73TIvF35hcEN2+xU=;
 b=Yox4BrFSAeZrTiYZCRBj7kIkOQ5xEkUve9AY19vPwjtBNJpQAtXRmUKDrRiqUlU/NiIK9czpNPompVG7XK2/0UJHiYij2SM63XQ06fZ9LSYpo4cVKadhNuMR2WoLzRqAouRjYxKPis67QpNQhqPK6HeAPUVsjnEtnvHvzpakQvs8E85oY9PS5kVbwdmMxyKfsXhsd50VQdizvSvmeiaBFuXcu1Gu5GbdOjCyNodIxA4GM7zmTFtfob52YPpn6JqpzNaNUnqUoUzvMF+7ipVLbuUe1q8VSIJkXXsjSB/bzcf+0akNeiG6SKHr6akKYjki1GXwr+mAT5qxGecajhlvMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JvgKNHXNGh7C/yM4n+UrUcugOlw73TIvF35hcEN2+xU=;
 b=GzbTnlVAUEL9VNOqv3UXp7Lax1IsKwLa5krVTtfupSLNxANl1YU/nFezL7qmKNrdLr95Q/Tdn3suIf75FRXcYgCm7pMsSAkHlTgzgiSAnlXmqvXn0pz5k4r498+FiZtYAru5FPFf5nM9MuLM6TUSAZQd9+uf4dTXKI9zHco6CKg=
Received: from DS7PR05CA0059.namprd05.prod.outlook.com (2603:10b6:8:2f::32) by
 PH8PR12MB6746.namprd12.prod.outlook.com (2603:10b6:510:1c1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Mon, 5 May
 2025 14:13:24 +0000
Received: from CY4PEPF0000EE39.namprd03.prod.outlook.com
 (2603:10b6:8:2f:cafe::51) by DS7PR05CA0059.outlook.office365.com
 (2603:10b6:8:2f::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.17 via Frontend Transport; Mon,
 5 May 2025 14:13:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE39.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Mon, 5 May 2025 14:13:23 +0000
Received: from aiemdee.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 5 May
 2025 09:13:18 -0500
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
Subject: [PATCH 1/4] virt: sev-guest: Contain snp_guest_request_ioctl in sev-guest
Date: Tue, 6 May 2025 00:12:35 +1000
Message-ID: <20250505141238.4179623-2-aik@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE39:EE_|PH8PR12MB6746:EE_
X-MS-Office365-Filtering-Correlation-Id: a784f367-1437-4a33-015b-08dd8bdeff46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EtCchHvb6ghn6cgu2WyMeasmXZT+cfXp3/aaBs4XmWxzLCHKN9uZAskFLtvV?=
 =?us-ascii?Q?TIHoB7FEtcchw461g1vmjfOLrJLnESuA3crmVmaQ9bXI5XEeqpyGENqOYhEV?=
 =?us-ascii?Q?bGL2DfBSEkfEgiSHJ8hBHeyBUgv/Qib7Q2Ef24gINkmx7iXc5tmkHHRHF0/o?=
 =?us-ascii?Q?W1g0apMdD0IEHJIz0PclMchQRIdx3xV3rNm6Ndwt+NZG14lSsQm4yMpXFf3m?=
 =?us-ascii?Q?Y8arZr3tGEYrtBL7FTX8QwszvQ8GsfC0j6sjGtxKkpxxs83emjEeetwIDpEM?=
 =?us-ascii?Q?wwo6rCp3kDJZDrXa1CDG/LJRPVDNfzmVz8i33CJFe+EiFnd4ZUEF+PcjTt1X?=
 =?us-ascii?Q?pC0oPrupvZXi2hrSGcZXMt7FkWArP33DanOdy6k2SlIuGDObcL4Ot1AqT7h+?=
 =?us-ascii?Q?XNyWTusq6zBKZdWsPgMLlYjLCUO9cyrIF+Lc6vAVwO8plfvWhfhljvB4nqnR?=
 =?us-ascii?Q?KLxU2G5p1Q/d8bvAp+iMfG8K4+NkuEVX6tiq5O2yLVVK6uEFPGLV+ecGGLFi?=
 =?us-ascii?Q?LrPF5H24n+CWOtHOZKABp/pzTQgZvgfCcTlB6cV4aD2IepgEH4IvI7CT/rQg?=
 =?us-ascii?Q?HIAzfcOW7tj0zJvcdisw1TivFWglpYqsn5Sl05LjJ+4XF+NlysPcVk2P++Yx?=
 =?us-ascii?Q?ERUAlZsL3j5t8W7caZ39qysTb+pj+gfCDYkN5qKlOCyZrksMFxEXVsryQHK4?=
 =?us-ascii?Q?ZnmJAiNgXT8FJQlfbmp58YXTqc3YyrzSWwx7OODkrbHr8jLmzsgBUHAv3Hmj?=
 =?us-ascii?Q?OxvlWb1U/lrkDfsOg5zlP/nFXc2Q2+lrpaTibtHhQuKYgMJ1RDkptJ7ghNRS?=
 =?us-ascii?Q?5hsvACdhBkK7rSARDYtK1B6XFnMhl2xcquv73ik2bmwBn2F1NPEIEEiLXRvA?=
 =?us-ascii?Q?cElrHA07Mt9T2XurvyNcr9h5c9R9RPLMoezn3td02q7JiF4sDaX77LZB1hqs?=
 =?us-ascii?Q?EhTh88CdKHj3Zr8fjsdQWzCm09XgTmQ3NZuPQn9XsqmO2B5h1cW1OCYSjsB6?=
 =?us-ascii?Q?ODHSIsw4Vyb+tjsksFsgqjMIkxmdhU+Yfgw8f2b7Ea9SvH2v8l/OhySww0fw?=
 =?us-ascii?Q?vIDxlywxr6v+nBqGbICceBdb7u2OccPF7seiOMPstqwhM0TCJobjNcP2kK6G?=
 =?us-ascii?Q?8RljtK+6eIixwTz/eiS9usS58b9hY7Rg6MIkU5yvZgJSVaBxX+Zb5XBTc5it?=
 =?us-ascii?Q?FtK9DgTi4Sft/+dSHmseaQl5OaGa/YbmxC04hJcFUTgWzWIZUXSlWFZxcPbz?=
 =?us-ascii?Q?Z4OT/h+iwQuaetrNYMpd/+T2Hot8z4/O1Wlfv3OuXjXxmy8OJwoPWM09uj9+?=
 =?us-ascii?Q?5vT6tUdG8vFNYL0ijOdfkGl9TrWAq54FdxE4MJF94wYL/s+oI71ag1GLPw6/?=
 =?us-ascii?Q?DEtO0CBbZ78UXU7Ch4efJyFrKxE0o8uNWhdUcUSxjUOzb/+IIUI6PhxhrDyd?=
 =?us-ascii?Q?5dotWIUGakf2QNAFBwBwIUa65R4mvIMRHyUa9cRzHL4bJzV6buT01cnnC9Rv?=
 =?us-ascii?Q?/SvJk8fb50MpNKQy/D/T1+p1NxNTe9INzMWN?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 14:13:23.6795
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a784f367-1437-4a33-015b-08dd8bdeff46
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE39.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6746

SNP Guest Request only uses exitinfo2 which is a return value from GHCB,
has meaning beyond ioctl and therefore belongs to snp_guest_req.

Move exitinfo2 to snp_guest_req, remove snp_guest_request_ioctl from
the SEV platform code.

No functional change intended.

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
index 13a88a4b52a0..db233a03f472 100644
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
 
@@ -565,8 +563,8 @@ static inline void snp_kexec_begin(void) { }
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
index 5b145446e991..7a49c896feb4 100644
--- a/arch/x86/coco/sev/core.c
+++ b/arch/x86/coco/sev/core.c
@@ -1322,8 +1322,7 @@ int snp_issue_svsm_attest_req(u64 call_id, struct svsm_call *call,
 }
 EXPORT_SYMBOL_GPL(snp_issue_svsm_attest_req);
 
-static int snp_issue_guest_request(struct snp_guest_req *req, struct snp_req_data *input,
-				   struct snp_guest_request_ioctl *rio)
+static int snp_issue_guest_request(struct snp_guest_req *req, struct snp_req_data *input)
 {
 	struct ghcb_state state;
 	struct es_em_ctxt ctxt;
@@ -1331,7 +1330,7 @@ static int snp_issue_guest_request(struct snp_guest_req *req, struct snp_req_dat
 	struct ghcb *ghcb;
 	int ret;
 
-	rio->exitinfo2 = SEV_RET_NO_FW_CALL;
+	req->exitinfo2 = SEV_RET_NO_FW_CALL;
 
 	/*
 	 * __sev_get_ghcb() needs to run with IRQs disabled because it is using
@@ -1356,8 +1355,8 @@ static int snp_issue_guest_request(struct snp_guest_req *req, struct snp_req_dat
 	if (ret)
 		goto e_put;
 
-	rio->exitinfo2 = ghcb->save.sw_exit_info_2;
-	switch (rio->exitinfo2) {
+	req->exitinfo2 = ghcb->save.sw_exit_info_2;
+	switch (req->exitinfo2) {
 	case 0:
 		break;
 
@@ -1852,8 +1851,7 @@ static int enc_payload(struct snp_msg_desc *mdesc, u64 seqno, struct snp_guest_r
 	return 0;
 }
 
-static int __handle_guest_request(struct snp_msg_desc *mdesc, struct snp_guest_req *req,
-				  struct snp_guest_request_ioctl *rio)
+static int __handle_guest_request(struct snp_msg_desc *mdesc, struct snp_guest_req *req)
 {
 	unsigned long req_start = jiffies;
 	unsigned int override_npages = 0;
@@ -1867,7 +1865,7 @@ static int __handle_guest_request(struct snp_msg_desc *mdesc, struct snp_guest_r
 	 * sequence number must be incremented or the VMPCK must be deleted to
 	 * prevent reuse of the IV.
 	 */
-	rc = snp_issue_guest_request(req, &req->input, rio);
+	rc = snp_issue_guest_request(req, &req->input);
 	switch (rc) {
 	case -ENOSPC:
 		/*
@@ -1920,7 +1918,7 @@ static int __handle_guest_request(struct snp_msg_desc *mdesc, struct snp_guest_r
 	snp_inc_msg_seqno(mdesc);
 
 	if (override_err) {
-		rio->exitinfo2 = override_err;
+		req->exitinfo2 = override_err;
 
 		/*
 		 * If an extended guest request was issued and the supplied certificate
@@ -1938,8 +1936,7 @@ static int __handle_guest_request(struct snp_msg_desc *mdesc, struct snp_guest_r
 	return rc;
 }
 
-int snp_send_guest_request(struct snp_msg_desc *mdesc, struct snp_guest_req *req,
-			   struct snp_guest_request_ioctl *rio)
+int snp_send_guest_request(struct snp_msg_desc *mdesc, struct snp_guest_req *req)
 {
 	u64 seqno;
 	int rc;
@@ -1976,14 +1973,14 @@ int snp_send_guest_request(struct snp_msg_desc *mdesc, struct snp_guest_req *req
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
@@ -2002,7 +1999,6 @@ EXPORT_SYMBOL_GPL(snp_send_guest_request);
 
 static int __init snp_get_tsc_info(void)
 {
-	struct snp_guest_request_ioctl *rio;
 	struct snp_tsc_info_resp *tsc_resp;
 	struct snp_tsc_info_req *tsc_req;
 	struct snp_msg_desc *mdesc;
@@ -2026,13 +2022,9 @@ static int __init snp_get_tsc_info(void)
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
@@ -2047,7 +2039,7 @@ static int __init snp_get_tsc_info(void)
 	req->resp_sz = sizeof(*tsc_resp) + AUTHTAG_LEN;
 	req->exit_code = SVM_VMGEXIT_GUEST_REQUEST;
 
-	rc = snp_send_guest_request(mdesc, req, rio);
+	rc = snp_send_guest_request(mdesc, req);
 	if (rc)
 		goto e_request;
 
@@ -2068,8 +2060,6 @@ static int __init snp_get_tsc_info(void)
 	memzero_explicit(tsc_resp, sizeof(*tsc_resp) + AUTHTAG_LEN);
 e_free_mdesc:
 	snp_msg_free(mdesc);
-e_free_rio:
-	kfree(rio);
 e_free_req:
 	kfree(req);
  e_free_tsc_resp:
diff --git a/drivers/virt/coco/sev-guest/sev-guest.c b/drivers/virt/coco/sev-guest/sev-guest.c
index cf3fb61f4d5b..b18504398619 100644
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

