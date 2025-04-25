Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2059.outbound.protection.outlook.com [40.107.236.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01722144304;
	Fri, 25 Apr 2025 06:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745560916; cv=fail; b=jDdXeajmpAdv2nu2gMjc+v2LuShFKLyFvTvQyQaNqZJyaxALwxv3gJSE9JINYxHvIffpEDz75MM/NJHkC9ztDM7NF83pRTAFQlSN+Ee6CmUMNqLbUX+Z0yBkeg0tFoFkdE5SH1JWuEHnCcniTZoKpwoIL+mJJyQKj85gJ8SMLzQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745560916; c=relaxed/simple;
	bh=Ews3cQFlrtJvxHrfxxVtseCIQ3LMb6+xGVTvdemZa5Y=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lSQW8h4vdR/uG1siA5CaNzd4dbA5ULepIu1NDDAgb2HO+QoGe08tdKiAXi/73YBKmlMDl4Tz5k2k3FTOuIneyp1IDGyiRWsLuOdUVmCVB9OrwPDvGB6SI8HJpRTyy29bCSorJzYcAtqLjnUXtNdtD/dzx6IeDgVKkvwAheOiq5U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ZmYCScX2; arc=fail smtp.client-ip=40.107.236.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ZmYCScX2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qXOE13hAWRbcdQx8IuQu1c65+P7dftejQLWL5VBEw/r5Med+Nfh0m0fAoA8cv44iaFBcoRuYPoVxg1HddY2evkWwVdb//WoEXwVR2y8rM/lujw+V81Be5jbB7Y/T+9ZrYb0T+qii6sH/Ng3gTVSuAePKGOFyt5wE45vez+pa53uuIJ2JqFMid5Pl8GW+ciWkpDzBjOatysRvdQat6A1cv7XSIsGYXuz9NDi6oifsteLUPn/7NAI3FoFwF5W+XMQW6lMoAZIbmdcpzMqc/djdIDo2EXuBUADpVJ5HnpThp8OtXI7PVpfkjnVtRY/vVDkuj4dwIZuy/Uj0vQAjTUxiiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z4Tm9luy850jL8k6M6TwcPYBy6zJVmfWn2fVvo7Fiy4=;
 b=iNL6Jv7/0nFtVIZAlU0gaYuLg32CdADDCRS+hixM8ntSrbWT7koaiul23hfWSo/Fk8M6CLovibB0YRosj2EOXPfNkYxI2L2T0zDdpOwl+nZRUA9g8gu5wwzE2Z1rqmBlGqWrY3bi802djlWvdU63ebD/Uht1NamXXIV7OBZFLLLekOjae7Awpz2/IVc7wSgpMGZK3uWafcnR/CDeI7y1xRmYHyVpOigTS1YStsZE6mPTWFRdYSiNkRhyBmclZRfpcM5uCwX2dAnC7AzHAoTgjYsqOSn9FwTxvIlCGuxT77eNkfsOdnp7LvIvpsqzZpfYFB7U6wp4NpjBOQajIPszNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z4Tm9luy850jL8k6M6TwcPYBy6zJVmfWn2fVvo7Fiy4=;
 b=ZmYCScX2KzT95erjPdj8CmbAbumXMV133ZTDSw894v6cjyxFDAdCW/nEtakUJggWbKQiOaQAVLGODX6Qq2elO/D3X11KrvPuUujid0HM610QZVpN6EHKFTIiPzFLfCvQ7aXfQOZD+bl0rVLLoLk+DJT2G074Bggs9GHha3i7UHQ=
Received: from CH0PR03CA0250.namprd03.prod.outlook.com (2603:10b6:610:e5::15)
 by IA1PR12MB9029.namprd12.prod.outlook.com (2603:10b6:208:3f0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Fri, 25 Apr
 2025 06:01:51 +0000
Received: from CH1PEPF0000A347.namprd04.prod.outlook.com
 (2603:10b6:610:e5:cafe::c7) by CH0PR03CA0250.outlook.office365.com
 (2603:10b6:610:e5::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Fri,
 25 Apr 2025 06:01:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A347.mail.protection.outlook.com (10.167.244.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Fri, 25 Apr 2025 06:01:50 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Apr
 2025 01:01:49 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Apr
 2025 01:01:49 -0500
Received: from prasad-lnx-mach.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 25 Apr 2025 01:01:45 -0500
From: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Vijendar.Mukunda@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <syed.sabakareem@amd.com>,
	<mario.limonciello@amd.com>, Venkata Prasad Potturu
	<venkataprasad.potturu@amd.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, Greg KH
	<gregkh@linuxfoundation.org>, Peter Zijlstra <peterz@infradead.org>, "open
 list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
	<linux-sound@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/3] ASoC: amd: acp: Fix NULL pointer deref on acp resume path
Date: Fri, 25 Apr 2025 11:31:39 +0530
Message-ID: <20250425060144.1773265-1-venkataprasad.potturu@amd.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: venkataprasad.potturu@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A347:EE_|IA1PR12MB9029:EE_
X-MS-Office365-Filtering-Correlation-Id: d552958a-ed76-4d3d-8733-08dd83beab93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|7416014|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hARX+oLmQzyTRKC7fGp3ipD/QvGNLQuN8fLf1ZoqmGkKu21HRHhMyg0UUfbF?=
 =?us-ascii?Q?DQaSkm3BfSz6qO2OX2V31DwsbGVtWlElcpCtl9/wo7UOg7omRAFhl3Gpcrls?=
 =?us-ascii?Q?5q8AHClVAeu96Yn066upgjIx1Jh5YIxKLBCZEY/+1qFkXTwRVDEy5SQIejIv?=
 =?us-ascii?Q?RE5UTByLXuL087PcXhnITaoWpy6QXHmY3GDOQObcK6BWgJoggqeds1mJ1z1m?=
 =?us-ascii?Q?DyRJSsRW9i+Zxmqoj/Hce2INricgNXmApaAAsx+E1lL0wNw4h5PSJpeEA/7w?=
 =?us-ascii?Q?vaed+W9KWgW5KkWrEg41luM3YAFyeFXIICgTHSGDAG/8w5s2lcIVJ3Xmc5mB?=
 =?us-ascii?Q?Zx8aMI/kF0UJvSYXjhv3xdnMiorLMfec1UCuH9Vb7VUwu+IEaG08jT0Y6DiN?=
 =?us-ascii?Q?X+g0n9DYpz7fmlD95ItR5ZiJ+A9c0K6gJwLVACAZj2+dIHjYHoS5tb5Djr7C?=
 =?us-ascii?Q?5SwiS6V/QqaLtp37wkiPWUV3eCeN8173mu7Q1bQoKEPGcDdSmaWoYjORhwXa?=
 =?us-ascii?Q?j9Y73UNV+bg0f0h/QbmyhIIZHQQ5KWOOAqyNiH4QJztU13r8+DKmIjdtbDjt?=
 =?us-ascii?Q?ODiRyqssF9HOr1tzRHx/MhlO63DH7xJ2zizkBge3ev2lGa1xCE++3XHZ0Gnc?=
 =?us-ascii?Q?jNi9St6A+LC8HFAJXcycZx1zCMg2ixSy7A3WesdMCYiwlgcOj28AyIIyVJ5m?=
 =?us-ascii?Q?HjxM2AuFuKM2LQuQKFgCSfFuZw15y/U9GlgiOnZFjHYJ3M/H2gGAd3Yr6wgY?=
 =?us-ascii?Q?P3RQ/Yorl+Q1gHatpdW9HIJwYgHDEJ2q8DcVFuERlULtrHasj8OT600SzGiU?=
 =?us-ascii?Q?YMG4FDFhxzoJ/by1JY7HBPOkeewBzpwd/VXo39pfNZokkIv9eZfhJIESd48R?=
 =?us-ascii?Q?XwrAgXrPHH7DxUdv56qCNIT9h95Q0N1c0mf2BtyvKrKeqYAZXIWNsXlu4+fv?=
 =?us-ascii?Q?qc2wHu/IyoweNp0YiRxqoUJIYTfTGmRDjUpD46ezyZhOIt+Iv9vE9ABI7W8n?=
 =?us-ascii?Q?xe85pUU6ZsY6h7/vU3Ve677zaWIVROdgCY1l1+9GTgt1qni2VggFL86GDqVB?=
 =?us-ascii?Q?6zu+SdCj/rvbNaIhm9whNb+Gog8q6HkOBIw0MJReMosecTtuFyPRfN6EGLMx?=
 =?us-ascii?Q?T6OyOgiF8sNA6clpJXB5oIPdLLeVzi98RXYSTJQucJHJ2JnUWLya35i2/TfF?=
 =?us-ascii?Q?mazGKtkdkJNGMxgwlJ4GVF6JQaPoiB8T5mwFqjxHFemyfPByYXVLbU0RxXn+?=
 =?us-ascii?Q?9JlkRCjvIvw51wRcd+qLw7uV/dNe+joKQtSP92W8i4xidMz4sx5VfjczfAsb?=
 =?us-ascii?Q?Vs5TwO/zsGQ45ZtHJw8+3UoN0NoOXCWXajqubhh1S+hqy1ZnqLYZhSpycgXI?=
 =?us-ascii?Q?APer3mfAYtgGXihH7vi+51Hr/DdBZkfQfFYBC1rsHolwfN0BwJ8L0ZhK9O5f?=
 =?us-ascii?Q?hYVuB4qecMAe+j8v3SSMVYmWqd/Q4XCII5gZSh9VqbvHek+PEQIyiG96aBXj?=
 =?us-ascii?Q?4arLz1amQJnIpr24YsAcip3ucmZgLgRoVWs5?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2025 06:01:50.1450
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d552958a-ed76-4d3d-8733-08dd83beab93
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A347.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9029

update chip data using dev_get_drvdata(dev->parent) instead of
dev_get_platdata(dev).

BUG: kernel NULL pointer dereference, address: 0000000000000010
Call Trace:
 <TASK>
 ? __pfx_platform_pm_resume+0x10/0x10
 platform_pm_resume+0x28/0x60
 dpm_run_callback+0x51/0x1a0
 device_resume+0x1a6/0x2b0
 dpm_resume+0x168/0x230

Fixes: e3933683b25e ("ASoC: amd: acp: Remove redundant acp_dev_data structure")

Signed-off-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
---
 sound/soc/amd/acp/acp-rembrandt.c | 2 +-
 sound/soc/amd/acp/acp-renoir.c    | 2 +-
 sound/soc/amd/acp/acp63.c         | 2 +-
 sound/soc/amd/acp/acp70.c         | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/amd/acp/acp-rembrandt.c b/sound/soc/amd/acp/acp-rembrandt.c
index 746b6ed72029..cccdd10c345e 100644
--- a/sound/soc/amd/acp/acp-rembrandt.c
+++ b/sound/soc/amd/acp/acp-rembrandt.c
@@ -199,7 +199,7 @@ static void rembrandt_audio_remove(struct platform_device *pdev)
 
 static int rmb_pcm_resume(struct device *dev)
 {
-	struct acp_chip_info *chip = dev_get_platdata(dev);
+	struct acp_chip_info *chip = dev_get_drvdata(dev->parent);
 	struct acp_stream *stream;
 	struct snd_pcm_substream *substream;
 	snd_pcm_uframes_t buf_in_frames;
diff --git a/sound/soc/amd/acp/acp-renoir.c b/sound/soc/amd/acp/acp-renoir.c
index ebf0106fc737..04f6d70b6a92 100644
--- a/sound/soc/amd/acp/acp-renoir.c
+++ b/sound/soc/amd/acp/acp-renoir.c
@@ -146,7 +146,7 @@ static void renoir_audio_remove(struct platform_device *pdev)
 
 static int rn_pcm_resume(struct device *dev)
 {
-	struct acp_chip_info *chip = dev_get_platdata(dev);
+	struct acp_chip_info *chip = dev_get_drvdata(dev->parent);
 	struct acp_stream *stream;
 	struct snd_pcm_substream *substream;
 	snd_pcm_uframes_t buf_in_frames;
diff --git a/sound/soc/amd/acp/acp63.c b/sound/soc/amd/acp/acp63.c
index 52d895e624c7..1f15c96a9b94 100644
--- a/sound/soc/amd/acp/acp63.c
+++ b/sound/soc/amd/acp/acp63.c
@@ -250,7 +250,7 @@ static void acp63_audio_remove(struct platform_device *pdev)
 
 static int acp63_pcm_resume(struct device *dev)
 {
-	struct acp_chip_info *chip = dev_get_platdata(dev);
+	struct acp_chip_info *chip = dev_get_drvdata(dev->parent);
 	struct acp_stream *stream;
 	struct snd_pcm_substream *substream;
 	snd_pcm_uframes_t buf_in_frames;
diff --git a/sound/soc/amd/acp/acp70.c b/sound/soc/amd/acp/acp70.c
index 6d5f5ade075c..217b717e9beb 100644
--- a/sound/soc/amd/acp/acp70.c
+++ b/sound/soc/amd/acp/acp70.c
@@ -182,7 +182,7 @@ static void acp_acp70_audio_remove(struct platform_device *pdev)
 
 static int acp70_pcm_resume(struct device *dev)
 {
-	struct acp_chip_info *chip = dev_get_platdata(dev);
+	struct acp_chip_info *chip = dev_get_drvdata(dev->parent);
 	struct acp_stream *stream;
 	struct snd_pcm_substream *substream;
 	snd_pcm_uframes_t buf_in_frames;
-- 
2.43.0

