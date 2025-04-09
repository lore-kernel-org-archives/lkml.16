Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2071.outbound.protection.outlook.com [40.107.102.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63DDE19004A
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 21:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744232427; cv=fail; b=uhA64h1OxxV0Nj/msGONu9dP03syroRbqkdcfe4IoWa23prr4ma5b0GP+vrKcVt3f+FOlZebj8BnZ4TAkQDnVpQ6jr01t4wSKDu30ptPfdw3smNpCOWM5bzQMULWECKvyT74jycz2wH+xTMfq/1Js/laPbOUjsdab5oxvkcnYLU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744232427; c=relaxed/simple;
	bh=yndc+g29gjw7zFzx1BaYr4xtXblZKq0XzWWmraap1t0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=K/O0gCbCgholhgs9FVbi1xPl+PCl2sBzCPEB9n0uJePG8OVXnd0WfiAvVm1qhHifR2W+sljSp3kCRI2TsApG2K05eeer/Yz73YrwBPI8H88fbGTrlXOiF+XSLEP92kh0oqRssTRKVZDBGRpHM5og1m62s7WUmMj41t3tmbmzmFY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=aDLdO/Gv; arc=fail smtp.client-ip=40.107.102.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="aDLdO/Gv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qGRp6y7xqz4hvs9AJXtgWBgBA4+weFM6LyGH2eNqW1Y0yefaI+AfrygVBeKz2+lVMVhSGsQRqHJPkLfjLGgBftAsMQUox5H6OG4pvATMV9TH3Thj702+szg5jxOjk6GF1cclcgjagZe5jbBbJbKJGbuiR8hjQCrDhAa1I9k8zDrF9jAHx+GIrYbZtQc3fABs+z2FlJxkxGjl9Fb6I88jYnG3rn60z66zgWmkT+gR1REZ2ua7lGpB5C2qcXNuk9nZgFXjARYjgw4Tfu8ZsHCsGsSBHM/wodoH4vssbFD5v4d5dbNdQZzx+ZjGgRhce23yzduy/7tZ59pLH5wX/ijSpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HHP/P/sNgMDgvJr5FNXDqJsni4bK0t2qkl/hH8u+XRA=;
 b=U1WNulkQBMYqAqTHVc6Vz/m93DYwjH/mIM3Rc+Li/zRipbBm8Dr82E0PtbtYVoF0XK3EDv5cYwRso86CsrE9XxhpWf9kROv4AGPvTYqJdL1OfqBa81ZTFzZRu1fHIVPGfl7L3uvKjtDKs3ze9VOMI0SubEI9tlEeiS21g5ok1i7o9yh/G+d+UV11VLbS6jmn7gG/8VM9lifazkhgy5k5eWda6AN1AVfofvwysS8xW1Xb1ZlgzfC9JlfMRIygaMou27qrkJYlZbVr2RbUFgzJRWlHkADVPdVZv4jGVBOULXov+nHh/ObitVIwYrwrNHZkQVMJWQ/xu14JZ1S57daZEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HHP/P/sNgMDgvJr5FNXDqJsni4bK0t2qkl/hH8u+XRA=;
 b=aDLdO/Gv+jQTmAsVdeRSQxcyFFZ+eLjW6qlIMDZxC4Wy1tOPhVt287yJkTd4uidIqwRMtfdYcUTYjwBSeXjDPBXjqNuiewSfclXXTL15g/YfxXriANWSs2lOXdXDoMwTxPPJB7eLfCCVIcdlF9NXeDzf2QRR0MAwDU64Y0wejxA=
Received: from SJ0PR05CA0168.namprd05.prod.outlook.com (2603:10b6:a03:339::23)
 by SA3PR12MB8803.namprd12.prod.outlook.com (2603:10b6:806:317::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Wed, 9 Apr
 2025 21:00:22 +0000
Received: from SJ1PEPF00001CDD.namprd05.prod.outlook.com
 (2603:10b6:a03:339:cafe::a5) by SJ0PR05CA0168.outlook.office365.com
 (2603:10b6:a03:339::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.19 via Frontend Transport; Wed,
 9 Apr 2025 21:00:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CDD.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8632.13 via Frontend Transport; Wed, 9 Apr 2025 21:00:22 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Apr
 2025 16:00:20 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Apr
 2025 16:00:19 -0500
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 9 Apr 2025 16:00:16 -0500
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
	<dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
	<min.ma@amd.com>, <max.zhen@amd.com>, <sonal.santan@amd.com>,
	<king.tam@amd.com>
Subject: [PATCH V1] accel/amdxdna: Fix incorrect size of ERT_START_NPU commands
Date: Wed, 9 Apr 2025 14:00:13 -0700
Message-ID: <20250409210013.10854-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDD:EE_|SA3PR12MB8803:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f220efb-b32f-48a4-e944-08dd77a98b35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BByRKIs56m6ayqRpADG4hIFdDoPGPGUq/MsmRYenu9vT2qFImSDcDtpV7oDJ?=
 =?us-ascii?Q?HR8FPvB4ENNsgXGbAHNtzWJ4nzw8/bEvqf2mcozgJe0VcE5cdTc8JeRL+7C3?=
 =?us-ascii?Q?j8tR3bK08XJJx35ohSM81R4UUCAB27iqyHvNOXnZmMKwZbh3E0B/M0Nd0Qa3?=
 =?us-ascii?Q?l/+TPUAujn+E38OR6M8kSVxxUVK3BLAisXZ+FfRn50+sN1aHkyjIWzSLQTgH?=
 =?us-ascii?Q?dBCOVyhNqUtgAaawsa3ixpgA+qIPSO+6ARjo6eb/nHGqs4curPq1GSY58Cfd?=
 =?us-ascii?Q?QTnxrQlJNY83j5iMNFX7AnisgyQjP81STTy27rWRNlD50znbOmyaTAVRX1Hg?=
 =?us-ascii?Q?E7nMgEbCUY8IEofERiVu5wFHqf+tl3Z5liq22RkD/C4ZbjFgx5gZUO3DcNz2?=
 =?us-ascii?Q?fsgifxxn1CGusjQL1/pt5/MmZaP/aWHpPUD5HVtslP9DTnfqi1BDph1Dmo0e?=
 =?us-ascii?Q?/I7iTf8loaJmIoOOKeNKud4Tju+dUqv2MP7bVHOo+Pd8u67EX2OzoWNG1zyj?=
 =?us-ascii?Q?gRv2eWLmzOc76RCUPgwfM+aM5+AIuCcyq11fqVepkidLvpH32U6l9ib3RsN8?=
 =?us-ascii?Q?hrG0Ix/oiP66DnlHvFHP8IYWSY0eNZqj3K7BY+t+lNB1XP9gQbfNnvNnaCe6?=
 =?us-ascii?Q?B8xjmsshSnUlFVf/xwTJQZIsExMFTjLQdAALuG7ai0fTtvW/P64gzErhyRwn?=
 =?us-ascii?Q?V3UPklgBriIgcj/wMtTcjR8Wi4wFsQEgPFv6Sn/E3boBu8pk9EJHVVNWHh7e?=
 =?us-ascii?Q?epEepf/6w42OE9qDJQuoI5RYpXL9g5o1daW3uWPzZYeuVHKQHbzSmVzi975j?=
 =?us-ascii?Q?84znxKPAnHStBztiox35r4B+N9oS/UQPPWhsB2fXGmZaD9ANOSRMZZMbkbmC?=
 =?us-ascii?Q?aOcxbGnvU39ExFZmwhmnnSV6fO+EVpOt5lYv1Xx+2FFkzJaNuKru0QY9G6Ut?=
 =?us-ascii?Q?ymMs9UPPlZqW+M0716bplmYt8dl3btAx4PwevsXqJR8JwC5nMler3giIsL13?=
 =?us-ascii?Q?twYNKseov0LbhR80mtBbwE0xmBXBrt5HxQF6c9A+1GLAgsqdjZmQNj6f/s0o?=
 =?us-ascii?Q?zP0vh0K5rDnjHXj2ratOA4rGCe2ztpVsI0C7g33Ktw0FP7tFJMLe6A9MpLG3?=
 =?us-ascii?Q?w/fKxNE8iGPWvSf+a9VcgoLs+NfsWYCfxjrB3FVMqOhYzUPzWaEuz3nPd+Df?=
 =?us-ascii?Q?b512Kx/LneDJTWlPkWiOVo6TyMl5zcxUYw5CfyrTU4DWKSlXbN39f00CIMy/?=
 =?us-ascii?Q?uMcpUtRZDZu5VTOTctnltb0EDI5z+mBCyjdNeHJP9Qbys8qpBB1XqYT/K74b?=
 =?us-ascii?Q?IZb2FWNOrZNH5xTyXgd5dxMjTaTx1124DfBsabWeNB63LVJxt2q2CbNnJAyy?=
 =?us-ascii?Q?DrtGTGQ3/Q87hTlTHnqaAO1rZM0bKNvnrsD+Mbcgzf74v3lZ2mP+RswIpJoD?=
 =?us-ascii?Q?Fed6VNpbo0w7Zsdh6K8jNyqv+hNP1ZU0i51Q1QidlcZLaVe3paZTp5xUWS/X?=
 =?us-ascii?Q?xtrUcYPi+JCHmxR2LdwzEaQuzpc7yXomAwTI?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 21:00:22.3816
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f220efb-b32f-48a4-e944-08dd77a98b35
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CDD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8803

When multiple ERT_START_NPU commands are combined in one buffer, the
buffer size calculation is incorrect. Also, the condition to make sure
the buffer size is not beyond 4K is also fixed.

Fixes: aac243092b70 ("accel/amdxdna: Add command execution")
Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/aie2_message.c  |  6 +++---
 drivers/accel/amdxdna/aie2_msg_priv.h | 10 ++++------
 2 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/amdxdna/aie2_message.c
index bf4219e32cc1..82412eec9a4b 100644
--- a/drivers/accel/amdxdna/aie2_message.c
+++ b/drivers/accel/amdxdna/aie2_message.c
@@ -525,7 +525,7 @@ aie2_cmdlist_fill_one_slot_cf(void *cmd_buf, u32 offset,
 	if (!payload)
 		return -EINVAL;
 
-	if (!slot_cf_has_space(offset, payload_len))
+	if (!slot_has_space(*buf, offset, payload_len))
 		return -ENOSPC;
 
 	buf->cu_idx = cu_idx;
@@ -558,7 +558,7 @@ aie2_cmdlist_fill_one_slot_dpu(void *cmd_buf, u32 offset,
 	if (payload_len < sizeof(*sn) || arg_sz > MAX_DPU_ARGS_SIZE)
 		return -EINVAL;
 
-	if (!slot_dpu_has_space(offset, arg_sz))
+	if (!slot_has_space(*buf, offset, arg_sz))
 		return -ENOSPC;
 
 	buf->inst_buf_addr = sn->buffer;
@@ -569,7 +569,7 @@ aie2_cmdlist_fill_one_slot_dpu(void *cmd_buf, u32 offset,
 	memcpy(buf->args, sn->prop_args, arg_sz);
 
 	/* Accurate buf size to hint firmware to do necessary copy */
-	*size += sizeof(*buf) + arg_sz;
+	*size = sizeof(*buf) + arg_sz;
 	return 0;
 }
 
diff --git a/drivers/accel/amdxdna/aie2_msg_priv.h b/drivers/accel/amdxdna/aie2_msg_priv.h
index 4e02e744b470..6df9065b13f6 100644
--- a/drivers/accel/amdxdna/aie2_msg_priv.h
+++ b/drivers/accel/amdxdna/aie2_msg_priv.h
@@ -319,18 +319,16 @@ struct async_event_msg_resp {
 } __packed;
 
 #define MAX_CHAIN_CMDBUF_SIZE SZ_4K
-#define slot_cf_has_space(offset, payload_size) \
-	(MAX_CHAIN_CMDBUF_SIZE - ((offset) + (payload_size)) > \
-	 offsetof(struct cmd_chain_slot_execbuf_cf, args[0]))
+#define slot_has_space(slot, offset, payload_size)		\
+	(MAX_CHAIN_CMDBUF_SIZE >= (offset) + (payload_size) +	\
+	 sizeof(typeof(slot)))
+
 struct cmd_chain_slot_execbuf_cf {
 	__u32 cu_idx;
 	__u32 arg_cnt;
 	__u32 args[] __counted_by(arg_cnt);
 };
 
-#define slot_dpu_has_space(offset, payload_size) \
-	(MAX_CHAIN_CMDBUF_SIZE - ((offset) + (payload_size)) > \
-	 offsetof(struct cmd_chain_slot_dpu, args[0]))
 struct cmd_chain_slot_dpu {
 	__u64 inst_buf_addr;
 	__u32 inst_size;
-- 
2.34.1

