Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2055.outbound.protection.outlook.com [40.107.92.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB19133993
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 16:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743613014; cv=fail; b=mv+FoReR1mgmRZBMe8fAhc6Er2UE0HXGr0CtAZOtqfiTscd2mfYNRezKuCIdIuM3Vid1g+eGEfGbII7kNbgGkjTdvj+4hV0VMxd3AlOqLFLYVZbk3oWJ2rcMIQRJ0pjNb41HedHvx5vvn+4z5KKtyTM2GZOcO8yBckdbPg6xwN0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743613014; c=relaxed/simple;
	bh=n8s5Y0yKyjylR80wN9BMWIJTPAfbfqnWbpOCetg4pb8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KyEqUgMFjVPQlMt9sPH2+foaRFhpTr4ket348u96FQXe7srVr0XjXe35xkuZft2VX2rMQQfTKw1Br0LQ5djaoJvl8Ewz8xptHJ6vEHLizTdzMd/nmBXQtYFNTqDEXCC4ZCIlNUEjgCSxKipPGphGKMIhCy9RAsLLFE5YI1x5tBg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=uBRwhuti; arc=fail smtp.client-ip=40.107.92.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="uBRwhuti"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=baC/5lhX5GkLX5IyCcaMSmxoGGju+Y1yUr67GQ0GLUm/5LEWQuInBB+jwlFN8gQrClPOiRg5ONY/a/dpwCaZWgtiJz/Pfu6UqcQhJnIx9ktU89gvHTN3G3PrbS6GYpyK34PdBKo/Y2yD+oRQfAN4g2bJmAPkEDd7LkWxh8QbvRpgZ876YW7zjDZ9Z/PRlCitHFnDBRNxGZzf9ARV86kyM6zOkpnkCeJI3Ax7e882oy0kPQo9AolkR6D/7ppsTHixiB4bnQbFBsQ6uCPKAfdFftNnF2wCEOXN1EF60R4VdnT1fDJrmlvvvZlNdhngsfReS+5/u/MMFYyfScQu8gcIMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/hm5HW6Rg4v1/UeIZ+29UL3IALg4C9Q78gaSPXtT64c=;
 b=NgBTU713YRoBj3YItU+W90GKGgXcMIPC9t9Zs/EFIaSajSzhDK+faj08gcXgbqnhwuJNsSauEZ8BvPpr0X2f9avIn03WuUW52res8KzPXeWX5t2ePE51q1upl36YFz1I9GdlQLlDki+sioFHEdUwTi7sCmhb+846xqu+88uAz3UBFhRZ8xpANjTUzDNEpvqo9T5pvNROiUyBSGOdZZJA65qYqTStPPTpwV1jnJNmL/+HlhOsXW42tAkTO3xOf9QEF1CADk1URrSAVo7tnym+4ctxcQGJExVmLwcYm0DGFD8sYY3JReDvfWBY0gZrG/UKxmjoJOy9/DyrEX5ArHfWIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/hm5HW6Rg4v1/UeIZ+29UL3IALg4C9Q78gaSPXtT64c=;
 b=uBRwhutiDkw01EdVzakLVfjcIoCSyvJpwwkM3HERH4wLWjR5reUQWnvMUo7FNkmmt+nsLTt7zY8av+jseawIisBwVo0TVLsF9Sn+CfiQcCIlO4bo1l8tSaFdPTscx+zMWPfAD7Qd58byIZe1sQZiXz1Fot8UjdnkaLcciRWsNzc=
Received: from PH8PR20CA0019.namprd20.prod.outlook.com (2603:10b6:510:23c::25)
 by CYXPR12MB9337.namprd12.prod.outlook.com (2603:10b6:930:d8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.45; Wed, 2 Apr
 2025 16:56:48 +0000
Received: from CY4PEPF0000FCC0.namprd03.prod.outlook.com
 (2603:10b6:510:23c:cafe::75) by PH8PR20CA0019.outlook.office365.com
 (2603:10b6:510:23c::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8583.41 via Frontend Transport; Wed,
 2 Apr 2025 16:56:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCC0.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Wed, 2 Apr 2025 16:56:47 +0000
Received: from driver-dev1.pensando.io (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Apr
 2025 11:56:46 -0500
From: Shannon Nelson <shannon.nelson@amd.com>
To: <jgg@nvidia.com>, <dave.jiang@intel.com>, <saeedm@nvidia.com>,
	<Jonathan.Cameron@huawei.com>, <leonro@nvidia.com>, <brett.creeley@amd.com>,
	<lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>
CC: Shannon Nelson <shannon.nelson@amd.com>
Subject: [PATCH fwctl] pds_fwctl: fix type and endian complaints
Date: Wed, 2 Apr 2025 09:56:30 -0700
Message-ID: <20250402165630.24288-1-shannon.nelson@amd.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC0:EE_|CYXPR12MB9337:EE_
X-MS-Office365-Filtering-Correlation-Id: cd0ea050-7ae0-437a-a0c5-08dd72075b39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ie1uaPE508E6lmfJDgRlJiFSkRKY3ZapSUITjDwA+oIJoh3BlxobObRwPq1t?=
 =?us-ascii?Q?46wUo6WYCq1jy6M0TfSnyeIlUQWcMVT0lz+cKhLDD2DLH07PLuQekU98CKrt?=
 =?us-ascii?Q?/BSIY3MpFfmqR3dozoT9adPp6Y/T96B82JZEHiARatuPlwbKt4kRvYcCIA2m?=
 =?us-ascii?Q?Tv2queBMG8oTrtNgZWUfnDbh+bRvrYd9GoLoGZp2wvvZsiMk9iyxUW0coUQK?=
 =?us-ascii?Q?SdjEXUhJVBY0UV/SNh/jraM0e3f9TwTpKbm2PDfvvqv+sPXpEGZXVVk1eRam?=
 =?us-ascii?Q?xZ0cD++7VdkhBo6xYNIzImWACR0RkimSTFamB1Zh0eL4dmTroI7y4ar7Lllb?=
 =?us-ascii?Q?/FC/FAo3A55qigt0RrhAR6YFcKlc+ULkoecF4bHZD/mc1QSI7Hvkp6AID3RV?=
 =?us-ascii?Q?YvcrX4DjnCX1WRkI/hHFGVscbZsyu60D0hdIs07nxhuJ1010zv7XiOIWmJQo?=
 =?us-ascii?Q?RM7BOifD5C5sZHRY6ClA/dE8DNR5zkOS1lu2gnbAn2Lbotwaj8xmlXWIUX8A?=
 =?us-ascii?Q?ZqjQOft8F0Qs+hlIbaHeCiMOB0RO15fLteKdqueSdEzKL3evf1kjdviZTimI?=
 =?us-ascii?Q?/CCxScRK+Gc1SaNGXstEYTQI6FA2SQ3jSfRIwFdQhrRMfAX+2d2F16GFfn55?=
 =?us-ascii?Q?wKXJH4ii48JPJpLpvag3H9l9Pnb5GSr03xy0pKhjKS3BvhCW7mqPwLqsGGl6?=
 =?us-ascii?Q?9iR407lxV40U9pGVqPUWyHlT0nJI7FcAxRoc2/lbhdAWGdLwIn7YpLE0VyAI?=
 =?us-ascii?Q?eZwK9S0ohxFPszwvPS/ANa2reGViYlHV1Cyx6/0pP+4m/1Tqf3FQY4QlZoTb?=
 =?us-ascii?Q?1vBQiZWchPPIlx0D6FLLRlv7R7ww4CNT75RUogAAEGF1wR3BKRGBwIIUA/ko?=
 =?us-ascii?Q?ADQUlZQ8cOaJstshOGN+orYkSoC2VLBvvsmyt4dfOfAyWd9IG7EVjVmaRiCY?=
 =?us-ascii?Q?PNSmHJZpD099/4ZvKIfTY5AShNF1jJlmST/dTY33Rtzb60btK9w9WYr5YBUp?=
 =?us-ascii?Q?mTKeR7/BRH/wMh07TzFKvRJdHwI2spyESRrAACasjlpERcC3gLp5o6UG34ma?=
 =?us-ascii?Q?J4vh7uNWNUhpb7MLGQh928GqO4jyWkX1eeQJjm6m0PrDbwElTuF0UcRq5IR/?=
 =?us-ascii?Q?pTH+ybFEE3ah/T5EO8Z0pBB6XBDsod7KiY92KgcEdagWBp0vk8iOH1bYF40d?=
 =?us-ascii?Q?G434rjqsO868u7nOVkMqZroFpPpYsXUDV83h3B1OPkSlVg1LCwVVc1qqS+df?=
 =?us-ascii?Q?j+mdyKADXDJEp9vLNRnKg7Z/9iMzr0WFfSuqAKoqtDieTRULyJeuHU6KjgD9?=
 =?us-ascii?Q?+Ss3LKpKKdBGW67NxDyVkhiEvlKuPvEYOHuCMj4NWaM0KhU/eGoTH3igeiqP?=
 =?us-ascii?Q?TU3rnjEYzW2I0ybciF9Iz9DmcWlpxzQ/OOkkfdcDuy2RxIQOufPFJZh+eRvo?=
 =?us-ascii?Q?eidQgrvswkaGieV20rW2uALXmQn9zXd65DO6vGz9VD+ORxmevQulImoRvBxE?=
 =?us-ascii?Q?/n53CHfyUyVcUZ0=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 16:56:47.5756
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd0ea050-7ae0-437a-a0c5-08dd72075b39
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9337

Fix a number of type and endian complaints from the sparse checker.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202504020246.Dfbhxoo9-lkp@intel.com/
Signed-off-by: Shannon Nelson <shannon.nelson@amd.com>
---
 drivers/fwctl/pds/main.c | 33 ++++++++++++++++++++-------------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/drivers/fwctl/pds/main.c b/drivers/fwctl/pds/main.c
index 284c4165fdd4..9b9d1f6b5556 100644
--- a/drivers/fwctl/pds/main.c
+++ b/drivers/fwctl/pds/main.c
@@ -105,12 +105,14 @@ static int pdsfc_identify(struct pdsfc_dev *pdsfc)
 static void pdsfc_free_endpoints(struct pdsfc_dev *pdsfc)
 {
 	struct device *dev = &pdsfc->fwctl.dev;
+	u32 num_endpoints;
 	int i;
 
 	if (!pdsfc->endpoints)
 		return;
 
-	for (i = 0; pdsfc->endpoint_info && i < pdsfc->endpoints->num_entries; i++)
+	num_endpoints = le32_to_cpu(pdsfc->endpoints->num_entries);
+	for (i = 0; pdsfc->endpoint_info && i < num_endpoints; i++)
 		mutex_destroy(&pdsfc->endpoint_info[i].lock);
 	vfree(pdsfc->endpoint_info);
 	pdsfc->endpoint_info = NULL;
@@ -199,7 +201,7 @@ static int pdsfc_init_endpoints(struct pdsfc_dev *pdsfc)
 	ep_entry = (struct pds_fwctl_query_data_endpoint *)pdsfc->endpoints->entries;
 	for (i = 0; i < num_endpoints; i++) {
 		mutex_init(&pdsfc->endpoint_info[i].lock);
-		pdsfc->endpoint_info[i].endpoint = ep_entry[i].id;
+		pdsfc->endpoint_info[i].endpoint = le32_to_cpu(ep_entry[i].id);
 	}
 
 	return 0;
@@ -214,6 +216,7 @@ static struct pds_fwctl_query_data *pdsfc_get_operations(struct pdsfc_dev *pdsfc
 	struct pds_fwctl_query_data *data;
 	union pds_core_adminq_cmd cmd;
 	dma_addr_t data_pa;
+	u32 num_entries;
 	int err;
 	int i;
 
@@ -246,8 +249,9 @@ static struct pds_fwctl_query_data *pdsfc_get_operations(struct pdsfc_dev *pdsfc
 	*pa = data_pa;
 
 	entries = (struct pds_fwctl_query_data_operation *)data->entries;
-	dev_dbg(dev, "num_entries %d\n", data->num_entries);
-	for (i = 0; i < data->num_entries; i++) {
+	num_entries = le32_to_cpu(data->num_entries);
+	dev_dbg(dev, "num_entries %d\n", num_entries);
+	for (i = 0; i < num_entries; i++) {
 
 		/* Translate FW command attribute to fwctl scope */
 		switch (entries[i].scope) {
@@ -267,7 +271,7 @@ static struct pds_fwctl_query_data *pdsfc_get_operations(struct pdsfc_dev *pdsfc
 			break;
 		}
 		dev_dbg(dev, "endpoint %d operation: id %x scope %d\n",
-			ep, entries[i].id, entries[i].scope);
+			ep, le32_to_cpu(entries[i].id), entries[i].scope);
 	}
 
 	return data;
@@ -280,24 +284,26 @@ static int pdsfc_validate_rpc(struct pdsfc_dev *pdsfc,
 	struct pds_fwctl_query_data_operation *op_entry;
 	struct pdsfc_rpc_endpoint_info *ep_info = NULL;
 	struct device *dev = &pdsfc->fwctl.dev;
+	u32 num_entries;
 	int i;
 
 	/* validate rpc in_len & out_len based
 	 * on ident.max_req_sz & max_resp_sz
 	 */
-	if (rpc->in.len > pdsfc->ident.max_req_sz) {
+	if (rpc->in.len > le32_to_cpu(pdsfc->ident.max_req_sz)) {
 		dev_dbg(dev, "Invalid request size %u, max %u\n",
-			rpc->in.len, pdsfc->ident.max_req_sz);
+			rpc->in.len, le32_to_cpu(pdsfc->ident.max_req_sz));
 		return -EINVAL;
 	}
 
-	if (rpc->out.len > pdsfc->ident.max_resp_sz) {
+	if (rpc->out.len > le32_to_cpu(pdsfc->ident.max_resp_sz)) {
 		dev_dbg(dev, "Invalid response size %u, max %u\n",
-			rpc->out.len, pdsfc->ident.max_resp_sz);
+			rpc->out.len, le32_to_cpu(pdsfc->ident.max_resp_sz));
 		return -EINVAL;
 	}
 
-	for (i = 0; i < pdsfc->endpoints->num_entries; i++) {
+	num_entries = le32_to_cpu(pdsfc->endpoints->num_entries);
+	for (i = 0; i < num_entries; i++) {
 		if (pdsfc->endpoint_info[i].endpoint == rpc->in.ep) {
 			ep_info = &pdsfc->endpoint_info[i];
 			break;
@@ -326,8 +332,9 @@ static int pdsfc_validate_rpc(struct pdsfc_dev *pdsfc,
 
 	/* reject unsupported and/or out of scope commands */
 	op_entry = (struct pds_fwctl_query_data_operation *)ep_info->operations->entries;
-	for (i = 0; i < ep_info->operations->num_entries; i++) {
-		if (PDS_FWCTL_RPC_OPCODE_CMP(rpc->in.op, op_entry[i].id)) {
+	num_entries = le32_to_cpu(ep_info->operations->num_entries);
+	for (i = 0; i < num_entries; i++) {
+		if (PDS_FWCTL_RPC_OPCODE_CMP(rpc->in.op, le32_to_cpu(op_entry[i].id))) {
 			if (scope < op_entry[i].scope)
 				return -EPERM;
 			return 0;
@@ -402,7 +409,7 @@ static void *pdsfc_fw_rpc(struct fwctl_uctx *uctx, enum fwctl_rpc_scope scope,
 	cmd = (union pds_core_adminq_cmd) {
 		.fwctl_rpc = {
 			.opcode = PDS_FWCTL_CMD_RPC,
-			.flags = PDS_FWCTL_RPC_IND_REQ | PDS_FWCTL_RPC_IND_RESP,
+			.flags = cpu_to_le16(PDS_FWCTL_RPC_IND_REQ | PDS_FWCTL_RPC_IND_RESP),
 			.ep = cpu_to_le32(rpc->in.ep),
 			.op = cpu_to_le32(rpc->in.op),
 			.req_pa = cpu_to_le64(in_payload_dma_addr),
-- 
2.17.1

