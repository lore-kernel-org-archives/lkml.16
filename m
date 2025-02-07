Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2063.outbound.protection.outlook.com [40.107.212.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B76198A29;
	Fri,  7 Feb 2025 06:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738909754; cv=fail; b=FmaTf3TqGGl2FcwUmllFJdbRqA2EuRpPn11YGYsZR6BhuaPwaMgib96wKvBNhKA8rihW4zEIiHgH7SFbG1zXhvnHu5JO9ZZ9RHnGH20yv3Qn8kIhzq3GmeWLXrnHvo205YUmLZbNkP8bGnwTbsovxEYqw3hueVkowQuiQXde7Pg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738909754; c=relaxed/simple;
	bh=bLm2nzMcBRusshRXnixjmcHoTovXmabnCNUfJpvh2/s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h+wdvl3jsJ5MKQe9X3oH1NXq3WcQn/fCmJK5JVCOyAQo1eI6rRjBhyIUnrG1iTgsdWF5QUQPtRBH6R4XngTSaqJpg7hMkLVNQP1UkuhUOTV4rYJSuqKJF9jX4mu3I4sS2bAcA0MiJhtIPsZJwc8CiN7GABpBr+eOXP0N73xAapk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=iTmHBC2T; arc=fail smtp.client-ip=40.107.212.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="iTmHBC2T"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WmDQ/eTDta3/+m4Yai0kjCvqgV9P7Wl2m5AiI1aGUTiUwx2S0g2s2gU8XjI5tt7U1XY+HBTDb0WjHDsG5GCWat0uGzTGOWvZrXIjQdrkIAaFLRQSB2YqkccWOaE8D7c3YxoSKwwpzrjUgvAYAQNJLGf3Ms02hDPxirYd40y+MMH6LnhRC20hKw+/297pQuzTxuJjsuIu2ttFdEQHu8D+NnW65agR/dRK3wH9jxBcICed+YSpZL8Eq/sbiuioBsRL1AtNqQ1X/KAMeMndBGZXR6CFaE2G5RfcEOmvW/AZiM7qreN3Nhlf1Ahf3rDNnWcutXYEsk8kkE4muSE5ZQtzjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kEXai2j6rE+VXmKAlMAmGdR+0AA2qGgBxwJDX6OWCkc=;
 b=mVZSVK1eU3m2ytDlu4YqlNGjNuNnV89CtsPQ8JhwectSqQOc0dYWmu3eKHO/4hYgIXVDA697/5n7+SHEFEP2ol9mRBlXl1HRGFnhdx7/Qupmpuq//24+0ICl3AblLIo/8/secPjA1we09cMdqCY1r7Nvn0TOEATgBI7Bveu6sg0ieQ9Hj4H+WG/Xsb6GFHUCzO1lCDSKXwuKEwTKcBWq2omu9aZZGMeAAg99gU3zrayeBHII1MvFWulUTLF7p8BYVHjktGTXPEo5wPyvtj4rGx7BqqIBp1roEDMFnwZfnw8E02s5OTe9KnhSJ1wkt+w0zORZSzpy2VcIMRjV++6YSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kEXai2j6rE+VXmKAlMAmGdR+0AA2qGgBxwJDX6OWCkc=;
 b=iTmHBC2TiARH1coyb69edQOQUoN3lga6L5+vmenUb094tzFdwwc0Emn0Spssx6wnBDecU6XuxMxVpmsJhwrPtYR5h1lS11CwYAVS6YpuA5pmxaBuduYXzijncgszsya9IoMFMOwm9+DNLkuIarq3WReJjC0zyIePVhTwE/PlbKA=
Received: from MN2PR19CA0019.namprd19.prod.outlook.com (2603:10b6:208:178::32)
 by MW6PR12MB8663.namprd12.prod.outlook.com (2603:10b6:303:240::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.26; Fri, 7 Feb
 2025 06:29:09 +0000
Received: from BN3PEPF0000B075.namprd04.prod.outlook.com
 (2603:10b6:208:178:cafe::30) by MN2PR19CA0019.outlook.office365.com
 (2603:10b6:208:178::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.24 via Frontend Transport; Fri,
 7 Feb 2025 06:29:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B075.mail.protection.outlook.com (10.167.243.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Fri, 7 Feb 2025 06:29:09 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Feb 2025 00:29:03 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <venkataprasad.potturu@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <linux-kernel@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH V3 08/25] ASoC: amd: ps: store acp revision id in SoundWire dma driver private data
Date: Fri, 7 Feb 2025 11:58:02 +0530
Message-ID: <20250207062819.1527184-9-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250207062819.1527184-1-Vijendar.Mukunda@amd.com>
References: <20250207062819.1527184-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B075:EE_|MW6PR12MB8663:EE_
X-MS-Office365-Filtering-Correlation-Id: db9cb580-882a-48e0-2f5a-08dd4740baac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wm5LrFR0djG2dwNXhcJfZlNorLllgg+tIQCalwvBzz0lW1Z/UneRXwKxgnJ8?=
 =?us-ascii?Q?h0pyZp1GUMLQQVzy4Ew7kj2lIBQpH4GDygRoMI0K+qyG2wwGU8xc40tUYo+3?=
 =?us-ascii?Q?AcU4Au/IgLuMwO7BaJZnyrcgTrIRWbbI0E8TU6plr74WyjxgB1RRx0/OF0DS?=
 =?us-ascii?Q?a96IQcX9oKcOyLfim8oGTCOi/Li5MoQ/R+/ObmpyffFrAnWXmDZBDe08T79H?=
 =?us-ascii?Q?RdSL8uaw7l2BalupwmB3ZCw/jlqqgHJvUgr7XOzRb7VnuUwto8Urqhnl5lpp?=
 =?us-ascii?Q?qYGCH0GeIfAqvDKa6LKCKcR83bejP6dGphNN80aR0BQGRRCT083R+8Y/es7J?=
 =?us-ascii?Q?ITtLqpmOo+hkFKAxWfuOzKemUvBAk7TjCyD3Fw9mObqwbzRhb7/L2KjDro0U?=
 =?us-ascii?Q?FtIkcl8cET4IHOUEqE+whDkeq3fdXTlYReIzzofbz/a8X156oTwsQtSdHFc2?=
 =?us-ascii?Q?gk3QTA6bg4EoEEydeaxcBE4C97dghvDtGovnEWeTBEUt7guthvqdtDNaod5/?=
 =?us-ascii?Q?6Nh8vywIOq1XSG/BaTcWdGu3QlOWJpk49azl5u82bn1wwQZi/8LKl5yJ/f0Z?=
 =?us-ascii?Q?y6/V4RjbpMb0LqoThfrt42xbT4yestKJMkvEtaokZ69Pe/1+xh52lo12p49v?=
 =?us-ascii?Q?GcRj1+/SukKhrEcbq42cJjscywt1ZbzVfGv+W5u5/6ukR03jiP5AFJWxJCVD?=
 =?us-ascii?Q?I0pRv9ChTrtLZ+i7uTNsOpPiLD3BZUuZVPEKw0E/htUGzCV0PNLPWNR2uC0q?=
 =?us-ascii?Q?GPX0MIVpO+1W3CnuvU3OZeFUlgtks+OHGNI8oDeGa6wOpGZswSGq9fUfJ3/r?=
 =?us-ascii?Q?4sJRFbdqPUzlnw1rrVQsLS0onV4O4C9t8CFx/IPSfIBrAOVRVLqftANJNUVg?=
 =?us-ascii?Q?OEKB8X7BRz2cnr0/w1JS1T2lPO1nzaNoRx63zCM9yVZlPdrfIjSFHA2ML0Hm?=
 =?us-ascii?Q?O9aqvXSxcJezwBH/mInBbEg0qNYhBXbheke1/9IcbqQwcfAvCWOav7h11iK7?=
 =?us-ascii?Q?ZajECspDOmS3usz7WT9Y0xxxBoNbItwK7qG829xjFqscHQr7TtmuT4YGcgSO?=
 =?us-ascii?Q?r04SoWJMMxDAvgy8DwK5dyyGQBertk50gx0XEiS55O0+05sWCfZ6P5jWhW8S?=
 =?us-ascii?Q?zfVWCSqVzSTaItUy4Poy1j9kLXLCLLTDZfC7r9yHT7ye/x72Qyiz/iMJ4hdw?=
 =?us-ascii?Q?JV9nSqPE4yUHKDyR/31GjBBG9hQ5WFlF1wyQmMjP5+htWWJaXsMVQKCjGTPr?=
 =?us-ascii?Q?F1UX2JpT4QWWXznKERvWjZqiF6PXIVKXFDQjoKBhFvP4czVM/8bH8fbvJnod?=
 =?us-ascii?Q?BSrlRcJRIkPeybuep5xI2QheUT50btPjgMg9wbcyrXawbydQ97F5PvGv7c4E?=
 =?us-ascii?Q?Zb2MbLl+J0s/w5oSH3EOFJP0fcq+KxSSk/rn2dz6nYwOAYyHpu8II2+DOrIQ?=
 =?us-ascii?Q?OE7+bBCfil9pcZ7o01CzOcbQP/hRGVs6U4dj4IWr9K4FBDYaSJRaQFxnjgIg?=
 =?us-ascii?Q?ETMOyw7FPpbKfcA=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 06:29:09.1178
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db9cb580-882a-48e0-2f5a-08dd4740baac
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B075.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8663

Store acp pci revision id in SoundWire dma driver private data structure.
It will be used to distinguish platform specific code.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/ps/acp63.h      | 1 +
 sound/soc/amd/ps/ps-sdw-dma.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/sound/soc/amd/ps/acp63.h b/sound/soc/amd/ps/acp63.h
index 9a20846d30ff..098597d92bf9 100644
--- a/sound/soc/amd/ps/acp63.h
+++ b/sound/soc/amd/ps/acp63.h
@@ -183,6 +183,7 @@ struct pdm_dev_data {
 struct sdw_dma_dev_data {
 	void __iomem *acp_base;
 	struct mutex *acp_lock; /* used to protect acp common register access */
+	u32 acp_rev;
 	struct snd_pcm_substream *acp63_sdw0_dma_stream[ACP63_SDW0_DMA_MAX_STREAMS];
 	struct snd_pcm_substream *acp63_sdw1_dma_stream[ACP63_SDW1_DMA_MAX_STREAMS];
 };
diff --git a/sound/soc/amd/ps/ps-sdw-dma.c b/sound/soc/amd/ps/ps-sdw-dma.c
index 878683619a05..b3c716371d15 100644
--- a/sound/soc/amd/ps/ps-sdw-dma.c
+++ b/sound/soc/amd/ps/ps-sdw-dma.c
@@ -474,6 +474,7 @@ static int acp63_sdw_platform_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	sdw_data->acp_lock = &acp_data->acp_lock;
+	sdw_data->acp_rev = acp_data->acp_rev;
 	dev_set_drvdata(&pdev->dev, sdw_data);
 	status = devm_snd_soc_register_component(&pdev->dev,
 						 &acp63_sdw_component,
-- 
2.34.1

