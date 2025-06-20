Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2072.outbound.protection.outlook.com [40.107.94.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB635266561;
	Fri, 20 Jun 2025 10:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750415196; cv=fail; b=pHSpW990t7OaMrAcI0vSDnmqXocGjcKKk5lWkJ2KbiwTfUpK54d31P7pxg9moxvNsT604UvaZViolMNLPlfS/Z3Fk38uECGXwngZgTzas5a7dHM0jG66Oz9bXzAwwFrFGxcdz+TMIyUxyTSIN3rxPjWEQcOVNuYz6clmVR05MOc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750415196; c=relaxed/simple;
	bh=QFPRkf3QMHvwaT3cTb8V40kPnKIa2cu2G/cHkLpGQuY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QnKZSPHxxrDj21e71N95jrUQZVSLjmYVRWo8Et6Cz4IG7heL1E4IfOCUIzr8mFgCLUHR6NSVsHyXZBVkaUmSYAMsSbSg0qTqe3tz2DQMFYG0K3/OTQHff/EDv5JmuCubqCya0lxTSeuIV6Pn+C1N25Jt4DZo/rJ6pEuxBABFrJU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=RFYaPgAD; arc=fail smtp.client-ip=40.107.94.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="RFYaPgAD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sfgYEiGOHeuBfO2eE1ZqqQm9eQP0ijXaZFibj5KhfohISgzC2ppw6WqZ0UTP+FGVTaGH/hgRKYynNU/IR7fWYLpvvp13KTEmVz41/4tfSBKmm7bDueoNlwoV5+6KYl9N1GoREckAj4wmFAGIzSS50/H5u3OabOsuxiiGvMiY47/eKIotIbR+5egLrjKjT2evlktWj/7PZ8VfRLU33fzCVUFhZ9b0FRRBQhSwNws9iUt4mOn9NpIcuKmqImfYrHE8gh8jnfKJAA8XSlA5NYf0YAMOHi5uVoFiXnWSkkqYSEIqIz7/9HL02ydOScO1elO22LIPQpZckr/ELcv9kfI55A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+I5KH+8OS/VXJRBmXXDsg7F7I4IK5gLEbc4y8NSsHQU=;
 b=xg0JFDwBX1SQc/4uSiQRy84mnngJR94bHYHKwVcQTs6WWjMTPFlY2s4egZFLR1uG30tItjTpfK3bThbdQp6mnUbnVklEG7Ed6sQYBz162pzMiysjqlVv7yhio5c0qqVT9NRf4jh9/JqjfYn2FxkwzC0luO59qmajAf6LXL4V+gWkHU2A6mYNrlwf0iUdf0S1HBuEuG9RA2YnQ1f702Hx0ckG/1unaje8CEdhHR3eU61bCHwyg8EWW7wWbv2Oys54vfo+7E38qCo7H7Ojcbatefjv7tJqunWkrKBtPx7MT7VewaJXjyANDKNqQ6pOhu98Fq5PaxEf0MEh7RgrElL7KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+I5KH+8OS/VXJRBmXXDsg7F7I4IK5gLEbc4y8NSsHQU=;
 b=RFYaPgADDB2V/XXuqUK53AHaYJHBUcxWmmCETt5GK+OC5t//I+L2c2L5KJfYzn0AfYPNphIJanhDbrY5NKP+6tyvByw7HglqQ3iesDvfhi02R2YlBCZWWrqzckiMeoUbzoaoZ/C3KPr6fF8BCCksCYmIdQDGUHWChX+fke34/H8=
Received: from CH5P220CA0017.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1ef::8)
 by LV3PR12MB9411.namprd12.prod.outlook.com (2603:10b6:408:215::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Fri, 20 Jun
 2025 10:26:32 +0000
Received: from CH3PEPF00000012.namprd21.prod.outlook.com
 (2603:10b6:610:1ef:cafe::c4) by CH5P220CA0017.outlook.office365.com
 (2603:10b6:610:1ef::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.26 via Frontend Transport; Fri,
 20 Jun 2025 10:26:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000012.mail.protection.outlook.com (10.167.244.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.0 via Frontend Transport; Fri, 20 Jun 2025 10:26:31 +0000
Received: from vijendar-linux.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 20 Jun
 2025 05:26:28 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH 1/2] soundwire: amd: fix for clearing command status register
Date: Fri, 20 Jun 2025 15:55:19 +0530
Message-ID: <20250620102617.73437-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.45.2
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000012:EE_|LV3PR12MB9411:EE_
X-MS-Office365-Filtering-Correlation-Id: 84ba77c1-851e-4071-ef91-08ddafe4ecfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Sw8diuSM/6uS028MOdjP46Y3grGr5Pi+r8C38YZw8BG5G42CBy/k2BAgiQOe?=
 =?us-ascii?Q?3qAbpFNDXduHdu+nkJvno7Sd40ZKa5v5B1mWUw7fIkHzu1KwzakAM9OLI7CI?=
 =?us-ascii?Q?NOPy7D5yQP/mQw7mk3SLHxDU9zH9mg3WneWgHntnIusXBWiT/RHscc2VQrRM?=
 =?us-ascii?Q?+b1Uz4LkZmAwgYxOte/SAWQGPVqpPTayrcTa9nwcNdkoFxkGs67B8Uc2hwbV?=
 =?us-ascii?Q?qCbg0JuKgEwSzMGRp2XRQyyzEpLpoXrgV/1SVbGXx5dCzVBDjDoXi9jFCLe6?=
 =?us-ascii?Q?ZDNk7zPO75h17JuFUewqc+E7uTBHwI9BNSUm1SMYpoPXu61/J0gKcuKY5v1g?=
 =?us-ascii?Q?nmDy5R51UaoPMhc1uv3lgqUG8FWTsYPUVydtB5/Eg08XJUB3QUpGJ7Uo2VuK?=
 =?us-ascii?Q?RGZLusSLj35LeZD1HpzdtGlsXqDBAtQd+2D/5L0M0PHoAUIL3qM9PNiUrbbW?=
 =?us-ascii?Q?yJoQGisxe+QyjhYnUdfLoSqNF/s/6OKiutkIL+36v5U3gpzaamtbenUrQml0?=
 =?us-ascii?Q?s0l4Ad+nLlKhvlBTQoHTzTUyr8NrgP3YfFYvQttya4ygNXhr6/jI6tC9cONg?=
 =?us-ascii?Q?yl8Ae8/Z86A3ikvbGSatV8HSeb7c9eSk+wPZ3QhBwrNw7hmXrWLY7SpTlFad?=
 =?us-ascii?Q?ooPYEvtvWJ5Ym8DRjfnfBxwGD9jtQS4IYh+7HhzCPSU2VhAXeP3DMGDvTGTG?=
 =?us-ascii?Q?CS4qJetTfpH/4aTltXW/wykx4HjdrmN5g8KtrG1zjj3xoA2rYVQNy79C8nyf?=
 =?us-ascii?Q?cxw3GamIjgmwD3wF1QeSIoEdv8kKbYiFVqSfOsNNF+Fk+oWu6ZSzm4jlx/Uf?=
 =?us-ascii?Q?jUM+4L8d+xYhnyuCLucoBPMr3sbSHELve8ypO40q74GmBcIi/5P6G9FQRV4y?=
 =?us-ascii?Q?ziMT28UvnQS59m/3mUOp9HZcqU2bE0u9/MoSRfx2HaZ3EXFSYrfB1x1deMVC?=
 =?us-ascii?Q?cBkxEfEXdygAZC2CVajZDRe6dqkGr5U6JejGZCdHNstgb/D9lfn/kCbj/T1w?=
 =?us-ascii?Q?v2o6C91WgKhpBl1rO0tSegf/8i5o+V/0Q7z6UjMITLOK1d4XyZePBARW8ZID?=
 =?us-ascii?Q?WSK5KbxDKxVnTvlUHL1DA8d0hC/AIoih13ZQB14pBzc/0vZoZm/9udntK5/r?=
 =?us-ascii?Q?CM8hipWSqq9yYfsFfXK0C/hGJkHFuQseUuWgIhoUOuNvcyeI4gS632souycw?=
 =?us-ascii?Q?MDT3dpL8ctmCJNkvZllJ5k+Ty0HRysmnztzIMSWWqAeRUQL4F+hyBON/rOOf?=
 =?us-ascii?Q?v9nov4FYeSRQL/NRFqbTqHOOjJVboBv7mXyffrmlWpu6tfMGggJeE/MwqEau?=
 =?us-ascii?Q?aXszNMJSxbWTZ0orSwasWikGVz+JRDpVnLf7KxUQQpHBFVUJQJwpZkGzxDBj?=
 =?us-ascii?Q?YyHxVHzQrxC5Mx15C1dXtUcrmnyT28eMk9sZprZgmSFADaCjxm1nFgoKCDFY?=
 =?us-ascii?Q?g9wDGGbHB8aHhVCdTGCGa1YXFpCz229WFfOsJ/JqVYSxKlTbcbjZ31nALFsl?=
 =?us-ascii?Q?BIRzs4+5Y04Lweh/6/bIQZc1/c+XZg+Ru5oQ?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 10:26:31.9272
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84ba77c1-851e-4071-ef91-08ddafe4ecfc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000012.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9411

To clear the valid result status, 1 should be written to
ACP_SDW_IMM_CMD_STS register. Update the ACP_SW_IMM_CMD_STS register value
as 1.

Fixes: d8f48fbdfd9a ("soundwire: amd: Add support for AMD Manager driver")
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 9a767704b603..732c3e9cdd9c 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -238,7 +238,7 @@ static u64 amd_sdw_send_cmd_get_resp(struct amd_sdw_manager *amd_manager, u32 lo
 
 	if (sts & AMD_SDW_IMM_RES_VALID) {
 		dev_err(amd_manager->dev, "SDW%x manager is in bad state\n", amd_manager->instance);
-		writel(0x00, amd_manager->mmio + ACP_SW_IMM_CMD_STS);
+		writel(AMD_SDW_IMM_RES_VALID, amd_manager->mmio + ACP_SW_IMM_CMD_STS);
 	}
 	writel(upper_data, amd_manager->mmio + ACP_SW_IMM_CMD_UPPER_WORD);
 	writel(lower_data, amd_manager->mmio + ACP_SW_IMM_CMD_LOWER_QWORD);
-- 
2.45.2

