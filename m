Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2041.outbound.protection.outlook.com [40.107.237.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C102580DE;
	Fri,  2 May 2025 15:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746200718; cv=fail; b=UWKcZ0R2nQ+IMjJOO2Nfq1FdYJF8AWigRzQTITJSfUlpPeJjkRy1AGtCVslgF9A7bk1TwchQVI/biHX4Du2yR9VHAqCmGfbv6n3e+4Wda9TRnqh2IwWI1OXZTydXSeji8sX/ElMfzwULJdbMe2qI5uqgknjWVExG5Cw+YQ7Pbj8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746200718; c=relaxed/simple;
	bh=QwHuy22vIZSakbMAk5E3ESilBII6H4MNTRru4Zp5LBA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YTH9yG10WpPQRLVmEoAhdM7Yqtq37Yd9RavCHE76TWKGcQtRIq99+C2qvRe1DyxYDLjKL5xWSdhJrn+Bixj3lbzE7gWt6x/MTcns+fFzehu7Liflovksa6OLNvMf715BqQOwL+GArIEZx8sADSS1JCMizQf91/u8ZiQQbdJJHJo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=0YUE3VUK; arc=fail smtp.client-ip=40.107.237.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="0YUE3VUK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aHWisJcbMloLSlLph3t5jd2rrEVG0+O+zEU/W4ohoJRytm4Qwf6f4YWmeR35N8BQScanMMdgyqoVSzoyz61Q4iIPHNxNaZJDAn6aMipSQLHKucbLTIMRohn/x3VuCSH3rix09L5FNlEP4V7SLqM2JxoF76hypNrrIAhJQHiFgmPUhz1QV6iPosIFPn6uBjGIhEglp0H4o8go9hrYRc5YC3+a7IcckvL1QytzaTChtF9HjrKojjKBhPUKERY6wvESxK6ch4yQAYMT7Bwq/cb7/Rd4KXWyW4ha20aKxUbwIYiEY4ba2ATi7Ady88q2uxq9ATpP+IFufa7XWP9dzKWcFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YF6WHYO/WRJ7yUnjexPzqv7A1CiaFpy7TCAx3u7Qv1k=;
 b=iiT9QU9HswH/HvksRBGHjmN656VbCTnNjGZ2QCn/K4ue3vnPKaHXGww/0xWTMvhPjDkSjfGWoiqzcf0CALwExtO/NyPFKAjUjcE2gnjeCbbEgErkeqH7Rpj1Fl06khhfgEXBk1xU3LewYrSZ/2BhBrXEVa3ARYbKo/JAoInrO2tJF4Okg1tHRtEmosBhx41zE7BpoUpyWiT3Nr27wXw1UHXsYx/SFR5KO/r+bomb5SwCnBaO3KYrACBnLZuf/puZmEwzAJj6nVg1RElXf/H9V6j2NW06ZLITNNQ6c2VgxqmdTNEzvfh0yqhx53tzziAGWGaKSBQ7rz/blEhoEYIJvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YF6WHYO/WRJ7yUnjexPzqv7A1CiaFpy7TCAx3u7Qv1k=;
 b=0YUE3VUK3Scn21W0nSUdSTbWxNbpVIsZWq3iS8CpCjOd9BeyUv50MCH9oFBgzI/uPS9VmHsCeb9qFAo7npQNmNNLRhav4DzuaETbYUTwTHNtWheYgE8wojJ5psshWpegBzIKBQ+waxst6SB6Y2XBivNiB+EQ+0Y5qsTJWiOMRSw=
Received: from DS7PR06CA0009.namprd06.prod.outlook.com (2603:10b6:8:2a::28) by
 SA0PR12MB4413.namprd12.prod.outlook.com (2603:10b6:806:9e::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.21; Fri, 2 May 2025 15:45:12 +0000
Received: from CY4PEPF0000EDD5.namprd03.prod.outlook.com
 (2603:10b6:8:2a:cafe::fd) by DS7PR06CA0009.outlook.office365.com
 (2603:10b6:8:2a::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.42 via Frontend Transport; Fri,
 2 May 2025 15:45:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD5.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Fri, 2 May 2025 15:45:11 +0000
Received: from vijendar-linux.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 2 May
 2025 10:45:04 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Mario.Limonciello@amd.com>, <venkataprasad.potturu@amd.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<linux-kernel@vger.kernel.org>, <linux-sound@vger.kernel.org>,
	<sound-open-firmware@alsa-project.org>, Vijendar Mukunda
	<Vijendar.Mukunda@amd.com>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
	"Peter Ujfalusi" <peter.ujfalusi@linux.intel.com>, Daniel Baluta
	<daniel.baluta@nxp.com>, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Mario Limonciello
	<mario.limonciello@amd.com>, Cristian Ciocaltea
	<cristian.ciocaltea@collabora.com>, Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH 1/9] ASoC: SOF: amd: remove else condition in resume sequence
Date: Fri, 2 May 2025 21:12:40 +0530
Message-ID: <20250502154445.3008598-2-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250502154445.3008598-1-Vijendar.Mukunda@amd.com>
References: <20250502154445.3008598-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD5:EE_|SA0PR12MB4413:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e78ecc6-3f69-4b8e-8202-08dd89905330
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5mhswbv1PFSyTUOYWhdU/ASVaSUtZ/Xi7I8XAkaMpocVdp9e/r2nWO+jhgEL?=
 =?us-ascii?Q?wLYvFXzOys+y7U7AwMAY5xPJj6uDoTyKHrFQ+3YX+ju7GKSZOTu5hSt6LTfb?=
 =?us-ascii?Q?bTudI2HPVUwtnI+qZH+4yrH6r5infxwTCGQV4sUyfnoINms+zH3sl3J9xBnJ?=
 =?us-ascii?Q?BSCgxSZJyoI3TPSgzru77hfd+G5ggTAQ6QERryR66VUmrUsMYybS1ImBPPFF?=
 =?us-ascii?Q?oaqpXFVph5+0+MZ9QFxGZ0w7s9hriFfS/cuFQS0TMk9JFelLY0YcnAPao1q6?=
 =?us-ascii?Q?kvEaFC/E3V2TzB1EUcgnUs5qUl/H+e8kqzSWcGFBwF5j/e/66ANa9Ztfy7fj?=
 =?us-ascii?Q?E/7HnfovZhkId5ZkrO2OTcH/9now2MeS2FCZaR56J63ElWAkHDQZpWp9rJAi?=
 =?us-ascii?Q?TFJPwRS/ypfjvmqivduj9GmVA7dAy+RSpmldyfrjN+2LSjE8P6qvmI65ao6q?=
 =?us-ascii?Q?37nP3zN/R5hbtaBRoDt51/x4+V3MgzTNDCeAJZ6P7vtAtpWjCc+fZjyE2RmE?=
 =?us-ascii?Q?x7W22dJXQdmckRiBqFhYcUAdZfIlD3+mhtN1jAY0fscqmKz8W5CncDdtcf6l?=
 =?us-ascii?Q?WdXL/B8EELjcTChL07thK3VF9SWdD29j1cv3xY1lZnOeQ3ZzoM0Yg18t4uh+?=
 =?us-ascii?Q?hZSzAIzsC3FU7R61lEOX/GA61+YFGI2krAgF8sL6/beGhSIReMfmVlPrDEaF?=
 =?us-ascii?Q?2eWgzu0mo8bNtHFBlwnoYjSrSS1Y5xaijHtm2kwCFQp+C/s1UOSsGxhT3Ny2?=
 =?us-ascii?Q?6TihVYQAn9KXOYtt2FUe8d1XdAetoP8CRa5B2a6gerrMg+CgdPeSH4IFIqEd?=
 =?us-ascii?Q?M8TQgOsWlfG+LV+Oa+za+8eNXpEV/scU7gNMCxmr6wzSmYxvMv/gCvedbTTT?=
 =?us-ascii?Q?073gZWblZBfDNs/QYlgBzfdMeU7mQ+LiQC+0jsTPcKdIb+by3eP2Y32rSl3u?=
 =?us-ascii?Q?ckw+5CY1Meq2XgaJr9rzyevAo785B/iTB4gnB5VDQ+ndQ9hz8LQVQyTmPiT1?=
 =?us-ascii?Q?psCKVBokOykg/akiXDEPFOy0CdOau934Xii4nrfWRRPqPCJ4v+RfCDZpfjsL?=
 =?us-ascii?Q?aouMJ1yx5wR45fWL+LqL+wK0fVQNo/sQ5e3gJmjWoZU9QbGMLR1lcXIyqdph?=
 =?us-ascii?Q?hl78POVHjICtXgjsVmgrQoj69mZv5GFLjVLJYgf4XolZCdC0wMJB8CbuX9X4?=
 =?us-ascii?Q?2WXJbekdHC/WgkjzfJuiwV46UwRZSAzj+Y4CRKwsA9EEyI40dqSsxkAE6aPY?=
 =?us-ascii?Q?R8Z+gUk5ORJjPrkkU4/7sdZvxpH5HxFyf2qDYcBm7HKyJkgB5OyGihgE+eIo?=
 =?us-ascii?Q?H/NVYymWLIjyYFYM1rht39t+PJD9D5ucVMhOlYBXDAyet1Zbo77fgFGdOHsU?=
 =?us-ascii?Q?XFgBWUdLhzDnaoDHTwTo56KtOLAsRr9JMZHntHvy9VsUiKyRRPExHQDSKkqg?=
 =?us-ascii?Q?qL923LrMYOQkE8qWLYq5jdav35ELXAVy8mRF+/DOq2a+BmX1P8C0ibPNaKek?=
 =?us-ascii?Q?diyuMnr0PB9jqz7Pw7Kc05gqAWc5AvLPhNjo?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 15:45:11.9502
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e78ecc6-3f69-4b8e-8202-08dd89905330
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4413

Else condition is not required after break/return statement.
Remove else condition in resume callback.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/amd/acp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/amd/acp.c b/sound/soc/sof/amd/acp.c
index 7c6d647fa253..30c03a221513 100644
--- a/sound/soc/sof/amd/acp.c
+++ b/sound/soc/sof/amd/acp.c
@@ -637,9 +637,9 @@ int amd_sof_acp_resume(struct snd_sof_dev *sdev)
 			return ret;
 		}
 		return acp_memory_init(sdev);
-	} else {
-		return acp_dsp_reset(sdev);
 	}
+
+	return acp_dsp_reset(sdev);
 }
 EXPORT_SYMBOL_NS(amd_sof_acp_resume, "SND_SOC_SOF_AMD_COMMON");
 
-- 
2.45.2

