Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2064.outbound.protection.outlook.com [40.107.94.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78CC9199E88;
	Fri,  7 Feb 2025 06:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738909766; cv=fail; b=EinI0jUhQ2mNnf5SPWbIvolMhABGeHOrPxDS9pMjS8o9eHX+a5CGx0KNHu0oz3UgWYnFHYcgosZuWVGzAJCJYrt+0XCh4Uugb3GXfCv0nkArOBtWyE6Tu6u4xC+RIjK+kzxod0N00E4xsqXjUIiDE/XqAmWyRSM51X7Ep0JDYkE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738909766; c=relaxed/simple;
	bh=1Xddzs6W1ZUcaQJzdNb/rdp6PGZpSYAw6rKAZ/t25bw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DjEGNlDCJvLgyG1qHYH6v1v9kEK04fkrDnoPKz/wrDo1eqR0QJ5xY4WtiAeVhN+QOq5JeVxHgloRtsTHkI4Fx1Jenq75Lv1QNeDJ+rOFeb8714yA3S4ro0KI65R4KTfJCehugRRAMqtWKo3saWcFxZv6O2L87k0OlDMXivL8axY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Htrlp62S; arc=fail smtp.client-ip=40.107.94.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Htrlp62S"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uPL+Lq1Id94cZ3A97HbO51gtPjbeDLaCG3NHQPFZ3CvEV5uey0bBOtfFo5jRimQim4AJBPfaAKwFvKt/GH7Ub3Z4+unxW1sAzxPdZDdgDMJyN8psev66IwOI2FNpNuw5aj9yvAASlEyCpG6pgldsyRXUR+RayrDC642C3CZdKFeSRZtM0yWBd0RTmxBvB2wzPd7/yPEZZZcNaCCT+hSwC7ibLBbdqGTOUPyz3YsWjhhkwKubhgDBJaytHCx1wGNl2bV8buI0mD07WjipQklT/70Lze6CVvY7nQiyPpqANpXeobzc9HOzUaV1dGNeLoo8ZY7AdxIatq4pgokN3L61WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VuK/hXtqxSGfxj0cES1kGPR3w7ngS1JQ3IMBJ2s6/ws=;
 b=B66xE0UvZ0iCSkli2XJsByG+D8GNINQvek5XefcVaS3mwdZ94XD/cJ91KdvPCbC0flwFuAl1DjCXnXO9iNfUUw7wJGWVui/QL0R8TWmTCRg9HvOdsfbHHO7gPEUk1zJLTay8autuUo9ROAvnYpkDPa4NtLCWlQI859abx//O+hueElnpNuX3vIYndl9jQ/S4yS0RiM0cSgnvhYPe9M5uQWbx+k6klxgqweSguMndej4WryCxNLi7wbnUFGpCmeGgg5ohJW+8xt4snpwTDosXtzP735Z/rb0835/Gz7hQSySnEsZUc0xhQgmwwDxNOidBdHAX6L/tM9Qqw/tdx9E0zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VuK/hXtqxSGfxj0cES1kGPR3w7ngS1JQ3IMBJ2s6/ws=;
 b=Htrlp62SfVZs2C2pf/aqQaZN7aSX3C7z0i09puYb6c8uOr3jgjP3oP2AKvfTh9SlGnpCRvzKafN2FNa+uGWylZgsmLXYA+6rGDk/BZ3QYlL9lGIbNZfKORd2UU3Dvd4tG1LS0tluD+0RJtkptHAamLVylNNsFW/78PoxM5sSJ1o=
Received: from BYAPR06CA0059.namprd06.prod.outlook.com (2603:10b6:a03:14b::36)
 by DS0PR12MB7630.namprd12.prod.outlook.com (2603:10b6:8:11d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Fri, 7 Feb
 2025 06:29:21 +0000
Received: from SJ1PEPF000023DA.namprd21.prod.outlook.com
 (2603:10b6:a03:14b:cafe::14) by BYAPR06CA0059.outlook.office365.com
 (2603:10b6:a03:14b::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.30 via Frontend Transport; Fri,
 7 Feb 2025 06:29:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023DA.mail.protection.outlook.com (10.167.244.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8445.2 via Frontend Transport; Fri, 7 Feb 2025 06:29:20 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Feb 2025 00:29:14 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <venkataprasad.potturu@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <linux-kernel@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH V3 11/25] ASoC: amd: ps: rename acp_restore_sdw_dma_config() function
Date: Fri, 7 Feb 2025 11:58:05 +0530
Message-ID: <20250207062819.1527184-12-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023DA:EE_|DS0PR12MB7630:EE_
X-MS-Office365-Filtering-Correlation-Id: d6dce464-7c42-4195-2af8-08dd4740c1c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hLl7eJI77GjOTPV+zS9IDjtrorOMaoWJkLfKC7JAA1xk8JR2xSOWuRXxy9BL?=
 =?us-ascii?Q?9ZpFJperXJ2fyC1wmQKEbJn2kUhL3uwc78BgFGHCLanCiRq84ShY3NMu4+Ig?=
 =?us-ascii?Q?N/HSyLFdPtcxxk06NkpHfs7Ef1DLAEsfOZMM+4WCw/OfyW/ivaFc+rhaDXCs?=
 =?us-ascii?Q?B7rObsujo8Nv85iGHDLYG3pbve2GXQ0Em2N7xr0MhbLOOgXGEAjk4UCwrSq+?=
 =?us-ascii?Q?O2kWXTcYdrJ/6PIDiguJiSpbmC9clw9wXto8yx/btwQ2QaTfo/a31vq6wl++?=
 =?us-ascii?Q?ANX+37Ual17af3LK95nJrmprrOTPbDDEqXZb/JO/hrFp0sJq9BBN03x0rmLH?=
 =?us-ascii?Q?6035Lcw1RkseuW7Jz0O1nDcUBp9v6uN3Zyj6n2f9Knc5BgdXpyqgG0BW0Yg6?=
 =?us-ascii?Q?9O6TIc/hUXaXOGGyxvKDTrH5to8B+PikIlkL3YgnJnXkuK2wZREq9MerGaWf?=
 =?us-ascii?Q?tDguPMTjdz7LB69WospEo4MkxGT/Zm0gYM60g5zef21KFYjfkFYNfF8G4hMe?=
 =?us-ascii?Q?kQMGg6MbeS7feEZS+1FVBtPvSVfWTBiwQXqGF7Pn0SHpbjRNDrFsnGneGg4C?=
 =?us-ascii?Q?to2NAInAiWAbQW+8YTpDQ3L/jZrSEIxg3Exdi/xnjh3tvYI/Zj09HqhccjsP?=
 =?us-ascii?Q?FJLpiUzJ5FxU0Duj6soTMrgLWqED0tfAkSHZMxH7CLtMgDerkVqFohjrisSx?=
 =?us-ascii?Q?Lv1Yu8rMIUWhiMQAtwEZPdeiOlkpnnsKJ1cCMhZ0AcF0DoAA93z18yVM7Vvx?=
 =?us-ascii?Q?1c/SZdWk9PL/t6FzqaaATbiUyEprgjC/4rAkCLAUvjTQ/eW44JXrlCKvAn6A?=
 =?us-ascii?Q?HmWmgNguz74tPs8ZN6e1veWuxIy5STjDKVdLM7JPGKIgQCcWuhCkgH1kEcdh?=
 =?us-ascii?Q?Oza37v50NO4B1JG6H8oXIKcgMGvDE3gadPYoCrOPQdP9jlNlPO3mHL5Qa8gm?=
 =?us-ascii?Q?tolZ7ZcO8imDcmcP65JpQCsUP+hPTeywYRGhbRjgthqD9eglnnSruw0UfpWl?=
 =?us-ascii?Q?0iSmwY5JEaUm+jgZJFbCvbv3bWpRuVt21I+SSqQzQR6rI7wqgRF1TjQxaMv9?=
 =?us-ascii?Q?gPZDZPliy6R2DiQ6jAiCg/z5YXLnp58xsSTKqO0tQFxXf3pUNq89ZsjA8ILl?=
 =?us-ascii?Q?fAdx9HuGNaSklGjpcltm81sc6wXErI+14/M1EkVBszwCDpAD2qbI3IBphPIL?=
 =?us-ascii?Q?VWfA5xRDFMwj6wf6hxVQzumOpil4b6kH0FFTiV/YOcs2EeMu9vk2MEOStFg0?=
 =?us-ascii?Q?k/EZTrC+in3XQ1mc6h8PL6VOhmd90fNozuyV+VHHyPAGExVsI3YoCR2Pm8M9?=
 =?us-ascii?Q?BHXpT07iriKgQPLK+kYdGbsUHFXogjBfiyb27pB/1QaqpFvif6bYBlbmcJAa?=
 =?us-ascii?Q?1gAn95MugLvGOdDtAy3390MhsCyqKf6GuJjoJ/HFS4j4mHrHLhuRqEeoCKHv?=
 =?us-ascii?Q?+8Dvg02FVev3VBEnbElGlFrGT2ykJGbM68D2YS7xiP5gDR8J/puANQie3iL6?=
 =?us-ascii?Q?dgtKCdVPb+NS1dY=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 06:29:20.9425
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6dce464-7c42-4195-2af8-08dd4740c1c9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023DA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7630

Rename acp_restore_sdw_dma_config() as acp63_restore_sdw_dma_config()
which is specific to ACP6.3 platform.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/ps/ps-sdw-dma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/amd/ps/ps-sdw-dma.c b/sound/soc/amd/ps/ps-sdw-dma.c
index 674203a20338..7cd153a4edc9 100644
--- a/sound/soc/amd/ps/ps-sdw-dma.c
+++ b/sound/soc/amd/ps/ps-sdw-dma.c
@@ -526,7 +526,7 @@ static void acp63_sdw_platform_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
-static int acp_restore_sdw_dma_config(struct sdw_dma_dev_data *sdw_data)
+static int acp63_restore_sdw_dma_config(struct sdw_dma_dev_data *sdw_data)
 {
 	struct acp_sdw_dma_stream *stream;
 	struct snd_pcm_substream *substream;
@@ -576,7 +576,7 @@ static int __maybe_unused acp63_sdw_pcm_resume(struct device *dev)
 	struct sdw_dma_dev_data *sdw_data;
 
 	sdw_data = dev_get_drvdata(dev);
-	return acp_restore_sdw_dma_config(sdw_data);
+	return acp63_restore_sdw_dma_config(sdw_data);
 }
 
 static const struct dev_pm_ops acp63_pm_ops = {
-- 
2.34.1

