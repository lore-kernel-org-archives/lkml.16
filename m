Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2083.outbound.protection.outlook.com [40.107.223.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5336163B9;
	Fri, 30 May 2025 05:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748583913; cv=fail; b=Ehf3DkD2PfCLpQxNztJB1ypM3HTOWsNrOCsoZe5zr7q7RrWyALzENMnvvyqE/7Z5L+vP4e6CbDPHMN3mpQc3/T4hfxydUqFlXdGZC4PPCbvRaxJuQJ2kwt3UWkvUsneZrIJwEv8EohkycgSuyETtohSDc5rKRra+S8q/BX0oW+s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748583913; c=relaxed/simple;
	bh=9kEwJastSr9UiSczctBOmEwgO/SMiwBcZ2keawHcJlQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XgmK3Sz2hQZj9yXnxdg59nBEgTBo9Wm+HsFNyC35M/qHiNatwJN997mazZh2snPZE0+pcV3sDWxZwCDYv6GhxTIDcDQ6HT3beGXrTuyS2dRLVePPss+ahcGjO34ZR/VJB028rnxiVK+AZXUksN1GFlsSRYaH+U05qLebL6VgHvI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=LLZYplyE; arc=fail smtp.client-ip=40.107.223.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="LLZYplyE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X7k8d2+CPElD1KOYFEz4hkIX8PJXfzI4kzeeqAke4v3+A4FyjBCwCfzmNBQ0gVn9x16OPvFyquLja85VIqFkVHZex3nTgLr3+HktnZn8iVpEIkmi4ucT9JNKNwIjZiXOni1dvK4V+EjkiiO+QpPyWM0jKQaVUunixKJGSvZ4H+8IEn8ubyqNb1gS761Y2aeUYLQ1/+t9Sd65NX1WMSPgNR4T1WJu5gbyY2lzGf6cVCcctGivbL5CJihcp/nrMMgb7CJmGBTCvLFrWGGCUGrpMFEAJDhAP1m4TSP5JtEVRf62U+nqRiddFpRClMokOGUftxgX5UXucRusdin8dgOYrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rupLOagtRgGGyYPdunw8RmSTkmuUjjM7q7k3OolFVXc=;
 b=IeRig+MmFp2NVZprm2J+AmHFFImGxRzTdDFcLzY450g1uyjH5CVsNRxr/ego2FPKT9JWKDLIio320Gz8SQ7UJyxD4u5im5hzUSvyvwLDtzDfDD/zfAYCCbM2BZeH9UrW33M8xGjzKRXiYG5o2FnYuKp5Yh7DuFhW1cj0HZGIhwb8kfU1tsbcFy8RP/R1bYaGOG6qNrQuuHR0ufKTrQH/83dTm/z/oC47qf3eZpGmRP3l75Geb/EmAYuN9lTDdaOaXb3Le5bMbPpBlYBNCh5RnYYWJpeITWV5PYiMunUhHw/O7KZ+/vRRLab/lBGSslMjbObC9OxmQEt059xfimfMTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rupLOagtRgGGyYPdunw8RmSTkmuUjjM7q7k3OolFVXc=;
 b=LLZYplyEumuSGhEs2bklDtsxvthZpVlEW2bH4uJk0+Cn5QjQBKe/kMlZCcJ2OvDNRz1ri5sswKnyHn1Vbgn3shqTCE0CGl7vV6xemaPAd7Ry2nNXegE69kFTqvi9hpitHp41Fjk0kbKBcUsbqkFfHfTakid7mtUbtS/pzpEe2nQ=
Received: from BYAPR11CA0037.namprd11.prod.outlook.com (2603:10b6:a03:80::14)
 by SN7PR12MB8769.namprd12.prod.outlook.com (2603:10b6:806:34b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Fri, 30 May
 2025 05:45:08 +0000
Received: from MWH0EPF000989E8.namprd02.prod.outlook.com
 (2603:10b6:a03:80:cafe::6e) by BYAPR11CA0037.outlook.office365.com
 (2603:10b6:a03:80::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.32 via Frontend Transport; Fri,
 30 May 2025 05:45:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989E8.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Fri, 30 May 2025 05:45:08 +0000
Received: from vijendar-linux.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 30 May
 2025 00:45:03 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<sanyog.r.kale@intel.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH 1/3] soundwire: amd: fix for handling slave alerts after link is down
Date: Fri, 30 May 2025 11:13:39 +0530
Message-ID: <20250530054447.1645807-2-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250530054447.1645807-1-Vijendar.Mukunda@amd.com>
References: <20250530054447.1645807-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E8:EE_|SN7PR12MB8769:EE_
X-MS-Office365-Filtering-Correlation-Id: a297c352-8972-425a-327b-08dd9f3d22ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3DBrFpS7+idDg9HuMLRv1Bjh03hO94C1+IyvYw3V3lYmiv/iQbvDAMrQriJY?=
 =?us-ascii?Q?n4tZx4mIYlNMAgZNrpg00HcX+opDkDAH0AmXfbnq5O4cCIVhGwDsMUZhNNVQ?=
 =?us-ascii?Q?SzT8Mqc8ycrCTmZQZJLLUsv/3RhB6HYzpz62oZ+fD8/XAdxpUtsjwSkEbEIs?=
 =?us-ascii?Q?+podwfopGG82HHgkJ8WGhhmHDbAOBn1tkw6rcmv0ONP7yOqBYHqTL5Bo84Eq?=
 =?us-ascii?Q?fwUoKTjnBeAZFXHvoWpnKnnL2QQy6AjOLlLi3S/dpjyfw5Lp/hodZ76oFPDz?=
 =?us-ascii?Q?8gQh/h/bg9j3zpkyFpBZ1kc3XsGpWSuZ16qOcWOynfPIIlizL+0K30H/pfqQ?=
 =?us-ascii?Q?bfrUh2PkaM6e5QtmnYserRKcNMqwPwD0ilOCZR1jMaILDX6Z4juluOH/fdh9?=
 =?us-ascii?Q?P/hLskIXsmXwjLOJAc5yWk6Bfr4upOQ6AcqHb/AEQ+HU2YeZY78RoM5JCl8a?=
 =?us-ascii?Q?3YHezFh6twzm05a/lx6v5HZN95ENAvukJacTN3CeIUaEYnBTjvxWodfcpwsw?=
 =?us-ascii?Q?1dvJJ2oKbE08RZarGyw6OxrRCCXnOlpGkaJpPR+OEWvAtbH7jmwamqg/Vuiw?=
 =?us-ascii?Q?21N9tQUw5VrSMv3QKThYPH1n7uxA/Z4LVoEHE1ZPpSCoA2xWPuqBHEBtufBJ?=
 =?us-ascii?Q?ceG0PluO/9zYxneCGDUZCsHJhwUUg0S7FiDcOpviE5lnoq4bMLkaI6ZYxVuR?=
 =?us-ascii?Q?4f47DAoO2AZYt/Cbvy5OIAF8dy5Fe2M3PStJIC9Cl2go32Qw4uJiQY3s5nAY?=
 =?us-ascii?Q?4CQpdikvi6GgF7gzyAcvpUC/HBkAo3fanMsLurbvCDaK/K22UgQCovkItvBv?=
 =?us-ascii?Q?Xf7DEf0EK0HgJnJN9m//EwinwFMMTy0s/Y4Ja55M6NFsfEzB3zr/b525ED81?=
 =?us-ascii?Q?nfrWGIJbnsdLLKw9F/vB2USJ9BK5CfysVAHvuSlpj7G9ExSWhRsSR7x97ndR?=
 =?us-ascii?Q?j+PfDmHz7Ko8JLUok5aTRNXwpbkncOx4rM3y2hB3cGu6+Qp3TFueTdQQyIcX?=
 =?us-ascii?Q?GcltWcWQ+b2ru/H5mv+vXzIXI4YIO9xOt5HjbXFZkN9aVK2q6xMNCiR6z46K?=
 =?us-ascii?Q?VlG933UNu2tffUzhjV6dx45liILDL4MZhtcdX1A4TO7mxmTOIHVarhL8r2eK?=
 =?us-ascii?Q?/LrWXcybF5XvO3IzaAv66CD6ss+20+oqfjJT1hTjl6xiDEWzjvAGW0tUcflJ?=
 =?us-ascii?Q?WZJDZhtyCkkYVb7WiwvdeFxgI2t3TeDjHQdvB28BXQx64TT5aUpa3dDVa0lH?=
 =?us-ascii?Q?Ex3SEDtJOtYiASUAOKHh24l652mEhCrst6x4VW+ialHZ48NHeWCXhXtemM0Y?=
 =?us-ascii?Q?L32SerWhanOJbHF9ujD6sz3AOrEtrgR+hV3gw5jQw9cJ+msO7Ne63Zqqsnp8?=
 =?us-ascii?Q?6SD5taVSphrK6Kex96QI3YAwOMvss1hgELc4IZ5vYLxehPO8Cafs8psveTfu?=
 =?us-ascii?Q?ZcTw4I40lckzclUlYCWxtW9HclZOahJGfcSZr92LRfAud+S7Oa+lA7DQu8od?=
 =?us-ascii?Q?FNBmTdZdOyp35CceiYP38UOmFz3LsWtp3UhX?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 05:45:08.2738
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a297c352-8972-425a-327b-08dd9f3d22ec
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989E8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8769

Sometimes, its observed that during system level suspend callback
execution, after link is down, handling pending slave status workqueue
results in mipi register access failures as shown below.

soundwire sdw-master-0-0: trf on Slave 1 failed:-110 read addr 0 count 1
rt722-sdca sdw:0:0:025d:0722:01: SDW_DP0_INT recheck read failed:-110
rt722-sdca sdw:0:0:025d:0722:01: Slave 1 alert handling failed: -110
amd_sdw_manager amd_sdw_manager.0: SDW0 cmd response timeout occurred
amd_sdw_manager amd_sdw_manager.0: command timeout for Slave 1
soundwire sdw-master-0-0: trf on Slave 1 failed:-110 write addr 5c count 1
amd_sdw_manager amd_sdw_manager.0: SDW0 previous cmd status clear failed
amd_sdw_manager amd_sdw_manager.0: command timeout for Slave 1
soundwire sdw-master-0-0: trf on Slave 1 failed:-110 write addr 5d count 1
amd_sdw_manager amd_sdw_manager.0: SDW0 previous cmd status clear failed
amd_sdw_manager amd_sdw_manager.0: command timeout for Slave 1

Cancel the pending slave status workqueue prior to initiating clock stop
sequence during suspend callback execution for both the power modes.

Fixes: 9cf1efc5ed2d ("soundwire: amd: add pm_prepare callback and pm ops support")

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index a12c68b93b1c..a9a57cb6257c 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -1209,6 +1209,7 @@ static int __maybe_unused amd_suspend(struct device *dev)
 	}
 
 	if (amd_manager->power_mode_mask & AMD_SDW_CLK_STOP_MODE) {
+		cancel_work_sync(&amd_manager->amd_sdw_work);
 		amd_sdw_wake_enable(amd_manager, false);
 		if (amd_manager->acp_rev >= ACP70_PCI_REV_ID) {
 			ret = amd_sdw_host_wake_enable(amd_manager, false);
@@ -1219,6 +1220,7 @@ static int __maybe_unused amd_suspend(struct device *dev)
 		if (ret)
 			return ret;
 	} else if (amd_manager->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
+		cancel_work_sync(&amd_manager->amd_sdw_work);
 		amd_sdw_wake_enable(amd_manager, false);
 		if (amd_manager->acp_rev >= ACP70_PCI_REV_ID) {
 			ret = amd_sdw_host_wake_enable(amd_manager, false);
-- 
2.45.2

