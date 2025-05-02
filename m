Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2075.outbound.protection.outlook.com [40.107.220.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA96D258CEC;
	Fri,  2 May 2025 15:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746200712; cv=fail; b=gxoH8YnOtR+taIa+3dCJcXUjdqCqiQ2Ya2DGW022fcla3adCr124oxWiJVqcbq3uirkCGEnwkDxA0eFwNe+HYT6Nc/oadhh//pVPVlwGmeQtUCyPGr61cJMmL7nUMsWUYA7H79f2lepvZk7JnJKl6bZ29NWoMHQt6AzsViZJQZg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746200712; c=relaxed/simple;
	bh=cwvLbR+Dqb67AaMCoOKPYVDMhLkkO5Wy/lWzfAglKg0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kbVVRt7fJFo3DOadgHKzfu8x06kKrWaozQQMcFLeGcQTTTctdWKGIi2TQfJLGUSWzWiiS3yUpssp8uZXh6+fZyTdYcS8THJWGpBsPdQ2ZGkyl0TM59pWBYVShpCoPLsbMxiLPWIptyRhkr21nDPW58orlkFQEhLsVMak+GKwwG0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=D8XbzZci; arc=fail smtp.client-ip=40.107.220.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="D8XbzZci"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PPUFgKib5j4+804/edamt3ObeJWYZfxLHGLMxHS4kbS1J7P3xOjFBsi8PLEdrXmhCmyq/DDCwrvCHzhr0xpUw6HVZvwaZoFPGXxAc4fNRvjxlPTnyMFsSV9zj4bBtmbMUMtNbrGbwFmWeN/YREm2EBt3bFcFR8Eve5RCRiArlzQCNnBFZaBCyxuY5emdEFhuc48U3TpYcbUeDOv9Dhg6ZIku8Hy/VWpB2dYsRyEqqCp0e5dCI9uctL6DC2fvjv5+WR1s7v4HfnLgL8zsN8gsT0ToRb7BiW5zPFkTS0PoHZx0lcYR8Yxs/d9GWArxBDfX2fQPV/EccmIOoUDz15GFtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UTJauIwlc/6/4OlZbsV3/1KsTa3In7csFTBrx95DS7s=;
 b=SAIpJa0lBoOtRieoMj/r0chvLXqpNC4IyzIPLcc4E/Jwp8tZvF12jrAdh21x3JARw6VdXQvCyA6fMLLr0rGXuNRYNHMC4jnORigbdoaeWPh6YlWdw41uFnDCi+btmn5E/M3tXLV5OrMqaYrLK2jC4ZiMUAWHFe7eIf/ykoF3maLqFmSDF2s0F5T5/XaIN/vkkYkdCwyYGaMDaWyjjp0BvcogIrNmp8PHcs+CeBbG3v7vkPbkFaSZ7OEVhlTPclKUq8b36gzd6E79Jt5I02noYdKe5R4luAVMt5WlcGBwbabEmSsvJwtg/No30csa35QUyLrigJISXKq1Zk6Q7YulhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UTJauIwlc/6/4OlZbsV3/1KsTa3In7csFTBrx95DS7s=;
 b=D8XbzZciOjVW/16IlLsTryhMchvJ8zz6cYTDxuFcs4zDgo0/sLMDH9oStNl/Gh8d4QN2FCWsXQmufAVJgPCjJ4ITB3fgkLJOs513qBV0O8C14bssna9UdJAa/oNLjwNyebNoznBtnnVx5eDkJ/eZbJH6xnlEo3Bdun1ksQql8jY=
Received: from PH8PR05CA0001.namprd05.prod.outlook.com (2603:10b6:510:2cc::22)
 by DM6PR12MB4201.namprd12.prod.outlook.com (2603:10b6:5:216::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Fri, 2 May
 2025 15:45:05 +0000
Received: from CY4PEPF0000EDD2.namprd03.prod.outlook.com
 (2603:10b6:510:2cc:cafe::c1) by PH8PR05CA0001.outlook.office365.com
 (2603:10b6:510:2cc::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.18 via Frontend Transport; Fri,
 2 May 2025 15:45:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD2.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Fri, 2 May 2025 15:45:04 +0000
Received: from vijendar-linux.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 2 May
 2025 10:44:57 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Mario.Limonciello@amd.com>, <venkataprasad.potturu@amd.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<linux-kernel@vger.kernel.org>, <linux-sound@vger.kernel.org>,
	<sound-open-firmware@alsa-project.org>, Vijendar Mukunda
	<Vijendar.Mukunda@amd.com>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>
Subject: [PATCH 0/9] ASoC: SOF: amd: add soundwire IO support for ACP7.0 & ACP7.1 platforms
Date: Fri, 2 May 2025 21:12:39 +0530
Message-ID: <20250502154445.3008598-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.45.2
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD2:EE_|DM6PR12MB4201:EE_
X-MS-Office365-Filtering-Correlation-Id: 62470b90-ce63-4ef5-9601-08dd89904ecc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0XTw/xXWH7FR8a0tZoIlpUfKqhFDn/oyqddOU5uFvTPLCMKkQjoyuwvuFzvh?=
 =?us-ascii?Q?vkH5aZk37j/JjHXV4/SIvwQj1J0YR2sd4oKrOcNhOF6qI9vCj8DvRdX60dt/?=
 =?us-ascii?Q?JAo4NrWjbwleH1HY8wkA8bJn2boRtVTmZzqbi40KC5/mDxxnXhHaQBhHhB0L?=
 =?us-ascii?Q?0aCdw5bpjezL9+xduZ6h67lZtCcoHzAfHFdPngkqdzRUnEMaHXvBUd9DQsNC?=
 =?us-ascii?Q?+iNHRe1Dp6mU1aTyD0i8kjKHWwBFPKoS3jfhIQOEBt32vpiiXQBYdEgJYnH5?=
 =?us-ascii?Q?k0Ajw7X+9qxc9fU+g/Ooy5XTpGl7RbrOQbAXEv8c6d8ln3kaqKken+7Fshvr?=
 =?us-ascii?Q?dkrBOn4XzRVBb2Fh5skVDpnJ16AoB02kV1R0s8D2RhZES9S/gF2IsGA1UmWm?=
 =?us-ascii?Q?iQ8w+sgMLEUWCo39XJhi/n9fWmbrst3U8ZP7FBMpgLMfptrLuIj9fxj8uo4+?=
 =?us-ascii?Q?7TkUNw+TRVmfo3bARiU9/asKeSfsZS6Gu5s43nCGOyGrdDYbeUZc0xKdt8nZ?=
 =?us-ascii?Q?alPdiA20yTwHlYAYaiBdFkQhPAoLPHnacMkJm6qUF8x+m+z/bNz/yZOKc3eC?=
 =?us-ascii?Q?egWdAEzYW8Vb3Hf+n0m2Mn5J0t5SjxVX3kj1qlU6ctj4u794UzzHeNtMtZQT?=
 =?us-ascii?Q?KNMaKAhJ7gpQmb0yB34DB6HjIstY69U3GSMtD7fgJWxWewGh/5H3eRZuTyY5?=
 =?us-ascii?Q?UVrIJO23X8iBldNEQmpPRz6H4l3kd7qtFt9aBscupAzfqtU1VnLbs9nuYAZC?=
 =?us-ascii?Q?1Wz6BdQns8ew5VtL55i35lY9a+xI+CdKScgw4C24IaPxGmPE5JaFpoVtUzed?=
 =?us-ascii?Q?upJFe+xO1z86HoPqd6sJlsER/Fvb06S9Fg6KUrVf53FtZFDC7GZHc0O8APzq?=
 =?us-ascii?Q?wV/55LexOWW9VrJy2GNMkdTBkABjpcwFsd1p+Xva9H93lbG28XAL2ouMKPDW?=
 =?us-ascii?Q?k+RvcUDC74Te0DVjqtf5/6r2aowLCLRK8Aw7CwlKw8nNaYHQvyLXG1FQvrKG?=
 =?us-ascii?Q?+0siN2ftqIFFI8GgipBywmU06YVbhh7HFZLDteo6TFH5N+ShzZsTu2UYHpnX?=
 =?us-ascii?Q?NpJf4rIhvVv0H99ZuJJLSGHimsjLUMaGfaCETZkyaOgy3SMoH8vTRqhhhPlJ?=
 =?us-ascii?Q?w2Y3YPHcD8lidwM0lbn0h1BtWvLgXzuzVg5fgVYYtl6Ed25Dk0G9Mj/awGwD?=
 =?us-ascii?Q?Z/rlvS7u/9+yIjnrF+5uGVgABvpw9ng4M6JK9sM2TdyTDbkaPOzH/nCRgjWJ?=
 =?us-ascii?Q?rf9DG1zFK1hgNoQp6dP4G8M/j8mLVlQowBlU5T62tU9XDr6ISDK9eV3+SOsn?=
 =?us-ascii?Q?j7RacMe1iTrBfFD4b9TPTtQfjbgSxCM+ue2NWMvM8b9Ujbi4uYYAJBn2Awv/?=
 =?us-ascii?Q?ZDV52SOEnmKS6wgJbUx3m0zdvLYJMjA5L2XO2t6f99XIFReqFTXd7yHE1fWZ?=
 =?us-ascii?Q?4XqOe4U+i0UpVnvSQf3jzkiZbQ1fPZO/D4G6GthcxfLsLZXGbnIg1p3UOneE?=
 =?us-ascii?Q?OwiI53aV/P9/ZNp8hjSJBSvaLSeO3KLBZBEPpa21gPpT8k4GsgkO1eL+fQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 15:45:04.5253
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62470b90-ce63-4ef5-9601-08dd89904ecc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4201

This patch series contains
- ACP sof stack improvements
- Add support for ACP7.1 platform.
- Soundwire IO support for ACP7.0 & ACP7.1 platforms

Link: https://github.com/thesofproject/linux/pull/5392
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>

Vijendar Mukunda (9):
  ASoC: SOF: amd: remove else condition in resume sequence
  ASoC: SOF: amd: add missing acp descriptor field
  ASoC: SOF: amd: add ACP7.1 platform support
  ASoC: SOF: amd: update soundwire specific acp descriptor fields
  ASoC: SOF: amd: enable ACP_PME_EN register for ACP7.0 & ACP7.1
    platforms
  ASoC: SOF: amd: refactor acp reset sequence
  ASoC: SOF: amd: enable soundwire host wake irq mask
  ASoC: SOF: amd: add soundwire wake irq handling
  ASoC: SOF: amd: add build support for soundwire

 sound/soc/sof/amd/Kconfig          |   7 +-
 sound/soc/sof/amd/acp-dsp-offset.h |  10 +++
 sound/soc/sof/amd/acp.c            | 133 +++++++++++++++++++++++++----
 sound/soc/sof/amd/acp.h            |   7 ++
 sound/soc/sof/amd/pci-acp70.c      |  10 ++-
 5 files changed, 148 insertions(+), 19 deletions(-)

-- 
2.45.2

