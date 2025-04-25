Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2045.outbound.protection.outlook.com [40.107.244.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5409922D4D7;
	Fri, 25 Apr 2025 06:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745560921; cv=fail; b=UFIIHi2SDfy+9EygTC+VPoz3qoZ4wOq0lJE/JE4K/lJhc8kcVt7ZXMFqF0h5B4ulm3DJ70LGut8Lh1MWi1IqxuI8HxErUL+SUF367Df6ayavcgR1yr6KLfgLodYqAeP+uqdYIjhBfQB0C2VK35hLKrccTJG6kggLVJw1h5bC/y4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745560921; c=relaxed/simple;
	bh=FJgfMAWsh102rVm25Gzw173WTvgmZ34ZUSyWD/Me7Xs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uaTTYCnvYQYpxB+tkMZ7ed627QpHN+EyJgzuVNJ+N9mJLQemuiXGRPWqkxg5TDWwlg50zuQZdxKu2c9Qz/TWD1kbHopnv2FcvW3s0DCK/Dpgd9JsNOt6OOA3NWsp73snl0MM7zWhMUt2FvNwKnQmLmzye8FbXrvaovvNaouJ5xc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=xOr4/upp; arc=fail smtp.client-ip=40.107.244.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="xOr4/upp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ROiNTjV+p3ZB4Ph+I4Mp6IH1kr6AWqg60wOWQwt/7PvDiJZCWozp4iP86sHdx7+R2GhPgBFGFt0XgPtb4jSBmN1MNef7b8K00chD/Hn1l39sYwxTe2XVIWLFJFJplN05SKb3A+7XdhTw70kNnOJv24sNpShtvCfgFhou78RpYE+MRMkLJbQ8UvYEqM/m4GjCR2wrGFk1cEpwV87XC3KYFzbiHvS91Omm76ghvehEs0ZaSYA9mhjGQ4cHlw4+VGZSfp/nwpeWbfClhzUu6mbrXqZGPTgf3w8gO3JqsoTV536h8BQcJqlNmxYC2BTc0S0R5TcvlAL5IUm5OyMSJMnWVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SNSpZ9EHrv9/CDymeO1FQMglYsDBBEdvQWGuh+z4lLg=;
 b=eOFW9DKxEZIIoXBIqNyKOw5VUSJZEaQdtM5+GV/96IMJVK5eA53vSVGacsc9uo1KDz4CatMzeGW144u1IfzHzhR7HG/VBo57VRLHuuu0XAmybvjBWZa7RpJQ2buPK6sokdWuuQKJ3E6QhdhVBOHWpU9+uKN8LzO0gad4EXDCtdTDu26bm5ukRmnDAIkav3BMbJfOsMDBHPcA3dK0KEf3V4lelnoJL5ZNFW2icwUiiYW6PMJ2kHL+sapgqrrCMxujHy6KaPi7yLMTVQjX0dSa75GGRk1hi5t+EBd/ss7cjHDYwzpI3bbizqvZgW/6dijkGKckQ33E5oJ2R4Gtp82btA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SNSpZ9EHrv9/CDymeO1FQMglYsDBBEdvQWGuh+z4lLg=;
 b=xOr4/upphbFM92BhzFLarVr52a/fC9Ol7w+JBEF4XMmex/YmVXAzMzXIMZhNioZwNUgE6zrvWJpdzpKW3jAbt732KudKjgNCMp9YjDZKxuQyo8x8Ug6tJA30xG80uCqIIBeL9yp/6Ndls6uDW8FLNY068faNB/vE47nOSKRL+Zs=
Received: from CH0PR03CA0397.namprd03.prod.outlook.com (2603:10b6:610:11b::30)
 by IA0PR12MB7531.namprd12.prod.outlook.com (2603:10b6:208:43f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Fri, 25 Apr
 2025 06:01:56 +0000
Received: from CH1PEPF0000A348.namprd04.prod.outlook.com
 (2603:10b6:610:11b:cafe::ca) by CH0PR03CA0397.outlook.office365.com
 (2603:10b6:610:11b::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.37 via Frontend Transport; Fri,
 25 Apr 2025 06:01:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A348.mail.protection.outlook.com (10.167.244.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Fri, 25 Apr 2025 06:01:55 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Apr
 2025 01:01:55 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Apr
 2025 01:01:54 -0500
Received: from prasad-lnx-mach.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 25 Apr 2025 01:01:50 -0500
From: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Vijendar.Mukunda@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <syed.sabakareem@amd.com>,
	<mario.limonciello@amd.com>, Venkata Prasad Potturu
	<venkataprasad.potturu@amd.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Greg KH <gregkh@linuxfoundation.org>, Jeff
 Johnson <quic_jjohnson@quicinc.com>, Daniel Baluta <daniel.baluta@nxp.com>,
	Peter Zijlstra <peterz@infradead.org>, "open list:SOUND - SOC LAYER / DYNAMIC
 AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 2/3] ASoC: amd: acp: Fix NULL pointer deref in acp_i2s_set_tdm_slot
Date: Fri, 25 Apr 2025 11:31:40 +0530
Message-ID: <20250425060144.1773265-2-venkataprasad.potturu@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250425060144.1773265-1-venkataprasad.potturu@amd.com>
References: <20250425060144.1773265-1-venkataprasad.potturu@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A348:EE_|IA0PR12MB7531:EE_
X-MS-Office365-Filtering-Correlation-Id: a0fb6c1a-9cb5-41d7-71d1-08dd83beaf07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|7416014|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GU+OfrxHTVnNX2KeqHnHQpjhc74QEXk5sxMsAUhvPcuO+gTNTyCAWzDYIq9t?=
 =?us-ascii?Q?YzL3UBtSWC2o9E3cy9zUdIXknGnYdTzdGXhr3dMJxzOQSrEochdekqet/gSK?=
 =?us-ascii?Q?JShvMuBIsGPcl8s5gl3FuoPOtRBDj1UrG/PFxmg6AQks7PQzw2Sb43OiAidV?=
 =?us-ascii?Q?DyCOiO0D7CbBqnSkwPM8K+GQUKb8RZmYQ1QKWl29sE5gppoAb88KjgPEuJSa?=
 =?us-ascii?Q?fYLqlCTVhUW8dv08wuzAiyS2iMGaQinOwEPqLYmpx//Tzbe8AUq5zfYiBw4C?=
 =?us-ascii?Q?D4nXGr/29cPKvt7BmzlD+dKm9tbzpE8Llr+5xFuC8L6FRVRf+BUX8FAG8RKV?=
 =?us-ascii?Q?blxCIP1FJjgG1rsgaiTSOHaFoWnTjy9ImAzHRt/XXCfZervGmDIYYstFnDpR?=
 =?us-ascii?Q?u6qh5JHfTXNSRjBhEr16fBJaBHS7o+VdewDMQmkYONbrA9zNHd8k6KYxYaYf?=
 =?us-ascii?Q?+eABBI03Z8MhoKLk/wFXVFh8B60qOITRWXmSQQX8S8vxEnZqVrumFq6WCJbc?=
 =?us-ascii?Q?1fdmAxDUIdt4bsVKHaOY3NtSHRQr4wFnNeDbt2Sb+UIOxsAG1zFYyuA+OWi0?=
 =?us-ascii?Q?/0ODbMwBXN/7s2d6gfVa97kqSCAlYfmJlBq6947S/3fn82i9fdWcbuBS+6Mv?=
 =?us-ascii?Q?vxPb79r6QI+BviYEIEDltrlYYtQaGGoqXntKX2dxnAG126oXU/KSqjMZaOBB?=
 =?us-ascii?Q?MDRqxMnr2nFLH2lIjxeQ4LHgE7dz45ztMj3+wfMuRiTrJ8PJm+1i2tWByhVO?=
 =?us-ascii?Q?uKlupar9xDKmCjOoPSdU+AxR+fwn6lcoI2VfRGsTmbyWc62G1yA7bAalmsoN?=
 =?us-ascii?Q?bSBU6v9cm/3l+dOfKiA3GeE16QzeyTqj7KC/r8IGqytGl2pctpyUcUmS4XJV?=
 =?us-ascii?Q?K7Jbj75Nrb9FK5F+mzeOGTtW1io3LrjJjKBnLChr6akZwMJuQByIPe8+n5WU?=
 =?us-ascii?Q?QKWSOt9xg8U6KLJaOryyUa6k4QHgSd5VydDwZiYQpC2ADnK7HpuQ7iBu0hQW?=
 =?us-ascii?Q?r+T8XBnZFULukmR9fKLWSUh9RGkA5N1kxulbdjlFC5JBgDoyr7jsCBYcf8/m?=
 =?us-ascii?Q?5ae/ZhovDMRMKSR0hQLuNXo56PAu1jMkz5D66wiMjO21zp4ZPUUavS7YH5/7?=
 =?us-ascii?Q?d0DNWY08TciUpVg7HqEe9gRtdrUgNsYd7LXwX5hOIIJQ9ARvWLmauuoevxnP?=
 =?us-ascii?Q?tY/b8NMSb5WctM9c8SaodkXSqF1/RGE2YlI5H/J+4h74h+b+L8bF4Yf53cp4?=
 =?us-ascii?Q?HaUUu5bMs1UJnsCaUwApgwhzDU9AiOi73L+J9V7D8vxXhUKGWsCWF/eE/Qr0?=
 =?us-ascii?Q?o2ocn8TWwFckCWZWP3/ISsDmfVyzGYmkr+zCv9u0uFmLIB5roIiSMzzqyB2J?=
 =?us-ascii?Q?Lyvj5QvbAW0kmPpM1pQ5wH1sXJuQBor5G88hYdoxMirChhmF+jlkKD3zGV4H?=
 =?us-ascii?Q?eXI9+KQXtuYq8mlkYHNV003weRkZYXMC2Fs249bq9/u+gmtU/ro7ixcsDiLP?=
 =?us-ascii?Q?1MITolJAVEDaMf/vyzPnME79b9cx6NtMEJWH?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2025 06:01:55.9379
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0fb6c1a-9cb5-41d7-71d1-08dd83beaf07
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A348.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7531

Update chip data using dev_get_drvdata(dev->parent) to fix
NULL pointer deref in acp_i2s_set_tdm_slot.

Fixes: cd60dec8994c ("ASoC: amd: acp: Refactor TDM slots selction based on acp revision id")

Signed-off-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
---
 sound/soc/amd/acp/acp-i2s.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/acp/acp-i2s.c b/sound/soc/amd/acp/acp-i2s.c
index a38409dd1d34..70fa54d568ef 100644
--- a/sound/soc/amd/acp/acp-i2s.c
+++ b/sound/soc/amd/acp/acp-i2s.c
@@ -97,7 +97,7 @@ static int acp_i2s_set_tdm_slot(struct snd_soc_dai *dai, u32 tx_mask, u32 rx_mas
 	struct acp_stream *stream;
 	int slot_len, no_of_slots;
 
-	chip = dev_get_platdata(dev);
+	chip = dev_get_drvdata(dev->parent);
 	switch (slot_width) {
 	case SLOT_WIDTH_8:
 		slot_len = 8;
-- 
2.43.0

