Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2057.outbound.protection.outlook.com [40.107.101.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4981025B1C2;
	Fri,  2 May 2025 15:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746200811; cv=fail; b=Q1GPT67W+awJxZaNBkR2znSvLIFPXOgRq3GyLntnOmTfygM/iG5V5TvSd68f+m7RwrezpvfpL77aFqc/3gx56Z2m+VW/7ftanx/7Y0qg/98QrDBN7paDan3KvUG5gmGgj0xd2fVeJlH+AO0K0t2U4rJg8fU4VJuhFZmNEZ1rYEk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746200811; c=relaxed/simple;
	bh=XM71ozjRm7ikfMPIl0UgjqqW+4PPHozEhcLcO5ImUHM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dbyWmqGGNbJNSt0WxW9uRtFKKPA4i5JOjVkSoxH4knVTjXYCzJWqqppI8jPTHNSkG427A5Mh5RLrgbmMTWtx5WZix0ti8BWbtcEqZqWup33wE2Cc3AesPXOYcNypsyvJENTnyVWjWHzAW7nzWZ3ZkHlyRljPRxBBJ1z5IDUUrMY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=3f1xft2C; arc=fail smtp.client-ip=40.107.101.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="3f1xft2C"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o3OFyJWYRFI+j3zsMWSFtnu7YKbggbqeDbKdz+DA+bhd8z7TlLJzQcla+h89R/I3b4bZLis0TiPqSQVmWdQUbhAO//G43RpETQ9sQrJGp8KOqnpEv7IZoKmxmsAsXtLIa9uXG+aHw/GcNu1iv2I2g84lug/MGmbnwxzNhMswb/zOm7RkEhQtaONSdBXslIaqfNpYSVOX+UeZaFZIM57yDDFE81p5TIS3QsK1wCMyV+7nbXdoEYz6HvEMn/1UxUvUNQsBRt1UkYZ9ES9KDlGiddIPBU8lCYslvId9Dapt7bceijgkx4ulPxhR9Qr1dFKdKTXoQpXtjqYE3uYcG+Uaig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9258H++4leLWMXII4GSKyMcW5SvSx6VEQ4DR4j+G5zA=;
 b=sD+DU5+E8vad7Jytk7iwKIiDMc682gE94DgFra3UiGBVwL7Ra+YIOggPjmvwoaTcOAg0TP6YA3KDeXuSsmcl4/VTThBPPZIi+66me2QLIiQStU/HuLxxlgTUsKsVgd3BWp9QmzsaEXwH4yQL44Q22SQbllnv8K50n4oLTRnnUuxE+w6jeR6DTrZrAFGW2xWed+m+SxhYNhI3+NP30k82ynq0jZLpAd51t5j740Kd8NyAgWOa1alFdPVQjGmlgLd9v1sKXkD69ar+mZ/Kg7zszRjUDDuE4MkQYqt/P0F5obh7i0QUt9SasiuT9mMs+/lEGFx9HSirC/O1v9sDlXtC5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9258H++4leLWMXII4GSKyMcW5SvSx6VEQ4DR4j+G5zA=;
 b=3f1xft2C0A+vWjncM5NtaUkiZ0gfBCbFnVeKSsBruryfPRm8n+q+pvJLp0XVoX9k1Nt5saTOFNgaUi1YkoQuaZffCH38CiHF7kVhW8jNybf7KRsXq7bAdG48LxuXXFIHAgDYdrry8I/x/ZgXnVo+IPu0bFBV21dw55uzIrSOA5o=
Received: from MW4PR03CA0186.namprd03.prod.outlook.com (2603:10b6:303:b8::11)
 by PH7PR12MB5856.namprd12.prod.outlook.com (2603:10b6:510:1d7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.21; Fri, 2 May
 2025 15:46:48 +0000
Received: from SJ1PEPF00001CE0.namprd05.prod.outlook.com
 (2603:10b6:303:b8:cafe::42) by MW4PR03CA0186.outlook.office365.com
 (2603:10b6:303:b8::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.42 via Frontend Transport; Fri,
 2 May 2025 15:46:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE0.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Fri, 2 May 2025 15:46:47 +0000
Received: from vijendar-linux.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 2 May
 2025 10:46:41 -0500
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
	<mario.limonciello@amd.com>
Subject: [PATCH 9/9] ASoC: SOF: amd: add build support for soundwire
Date: Fri, 2 May 2025 21:12:48 +0530
Message-ID: <20250502154445.3008598-10-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE0:EE_|PH7PR12MB5856:EE_
X-MS-Office365-Filtering-Correlation-Id: 29c79c06-c7bf-4b9a-f79b-08dd89908c21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VYmjbiIvT7lCs4vhLwSNHNlb+nZaiY0YPp9RRG/UhipcfbMhJomW8LTWVJaD?=
 =?us-ascii?Q?tgGrSyQynRQJ+kuqmJAnz0U43dJGab8S8CWoUuEv+F9Na1KPRnMh0PruRH6R?=
 =?us-ascii?Q?vGKjPFmdWD2UbRYX2VG32bZsyn49jV2MqreJabWygoxXsTWl9Hnh3866GbqD?=
 =?us-ascii?Q?wpAWVfpqCMlRGx/ISISgyRXKtrfMrZfVUOfspdeqJUTFjCrcAsdfT+DXU7kY?=
 =?us-ascii?Q?BbqMHtOhtwz44dS+tADIORMd7eUifFQ9OoiSakasjS7MgnPQqv0kwWXLBr9A?=
 =?us-ascii?Q?c5yx66wJKJTLYQeacUowbd6nn71M985UH9RhIfLfLZo03OZzWZVXr0YQhl69?=
 =?us-ascii?Q?Je40A8c3YjSXgpDBa2WCnzK1Ggfiu2PFUHXxbL3TyMrx92QU1mL6RYhhrRAT?=
 =?us-ascii?Q?9Ugng2zuKzoNy6BRP3XyNxY0m5+ctD/8grbsccL92xQI7OJIFtQRrwnw2IGZ?=
 =?us-ascii?Q?AZg7vax5e2oBT7BnU/dJXz/+73TFqUCgyfQtYcqwdcd5nlT1ozYkZQjpGgGA?=
 =?us-ascii?Q?Ce6AhVPIaTb31E6R4GRm7L9FvwXQ8d1O+8XiWmbN3GVJ5jCHpjf4IMVR/cJt?=
 =?us-ascii?Q?zrnlFDDyWvHeVAGlD+HJOlChZBGNbE1Z45KJLZfgik+IngymeCaiPdVO2fQi?=
 =?us-ascii?Q?TMKLfgwhDjjceqck/h99pc6TeUwc95XHA6437RSEtoKq6axAAeKggGyqAIme?=
 =?us-ascii?Q?OqANDH405wm1ZotWGn+eOrPbaPHQMizEV64B/UvccKAGqomFjd8ewBpETY1T?=
 =?us-ascii?Q?xtnsYRSdO+/63/LrMG9S7Mv7O+iVF8kCzaN7P7rAxAKYt535WScaBI7j6nJS?=
 =?us-ascii?Q?rrtq/HSeOuUCiXbSRMV5FNs59PJ4cbm6EwpWmxlYf1ZC9MCAhCEDN991UIOF?=
 =?us-ascii?Q?ztrTufhqqCWwEBgpRODzQZMBgsfXJX6BOLeB4FIXONdHI97kgPa44nJyQb+i?=
 =?us-ascii?Q?ptsp3S8q4dIDKpvr6FMaz6sqmgAuW/o1Z1P7gd3nE/Nrl6bfj9lWxOo572yN?=
 =?us-ascii?Q?C7+KZlZBwyg0Gy1v384KY/FCY19+4gk2vH5w7r5GMl/Nrhs84t0ib2B+Z++d?=
 =?us-ascii?Q?0l0mMestjn0ou8iqCWVAXHmUDhPwJKF2Rnz689MUg+dZntzmE8MtX57MeZiu?=
 =?us-ascii?Q?NedkGs1yTVNSCOD09EdCCj+nXuHY0z5XN+1N6ZE4CdpIlocyNhh36vQPmK8Z?=
 =?us-ascii?Q?gqsTDsRDVSLGhC6BIaG0NDJCNIiZRqs41GybHMWuuOQGxMga0BxJn8RPrg/a?=
 =?us-ascii?Q?caCBwGWazoKXc2/6J+INseSlKeUfxQDrGGr4tQRsNZ4c2G/TAUeOw9jK7nV5?=
 =?us-ascii?Q?xnSXRadDCSoFhBmtcPrt3XBRLUQxk4nj/tIUHIZcqWtkSxMKZ991F0pcrZVZ?=
 =?us-ascii?Q?Oa33SwoRB4GuBI9CyRSispAq2vKD2BQkA77CO+dsev3TrSxwIzbCnR5Dl8/W?=
 =?us-ascii?Q?CUFzzLufvTEmELGDpx5mIuBbLza9EYVAk0RiQ0foBvHyv3Ie+LeAYUwlIu8T?=
 =?us-ascii?Q?dJ95ee0m5KUosFTxceavbzyUQR2n41f1WBrY?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 15:46:47.4471
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29c79c06-c7bf-4b9a-f79b-08dd89908c21
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5856

Add build support for SoundWire for ACP7.0/ACP7.1 platforms.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/amd/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sof/amd/Kconfig b/sound/soc/sof/amd/Kconfig
index 984132f32a21..05faf1c6d6fc 100644
--- a/sound/soc/sof/amd/Kconfig
+++ b/sound/soc/sof/amd/Kconfig
@@ -98,6 +98,7 @@ config SND_SOC_SOF_AMD_ACP70
 	depends on SND_SOC_SOF_PCI
 	depends on AMD_NODE
 	select SND_SOC_SOF_AMD_COMMON
+	select SND_SOC_SOF_AMD_SOUNDWIRE_LINK_BASELINE
 	help
 	  Select this option for SOF support on
 	  AMD ACP7.0/ACP7.1 version based platforms.
-- 
2.45.2

