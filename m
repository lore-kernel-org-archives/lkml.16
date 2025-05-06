Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2054.outbound.protection.outlook.com [40.107.92.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2961827F188;
	Tue,  6 May 2025 12:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746533334; cv=fail; b=Oj7Ul92FWcH7AbYIzt30K69Ft4z4yNPNJDuOUO1IB+5wvmxjFt8xZQm1QwGw5dTq5TZ0CFHmMJtysVfTzneK+vNJ4ge5GLkq8uOxG8zYmuNdU8nftOiRPm2mw+CKdlACQMQJXissLL6ARBs7WGVuu7wMynRdvPnMARQHViu8GZ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746533334; c=relaxed/simple;
	bh=NllLLE5h9OdVXdAYGNJ1eiDR2YAg/8OkwS5uDwlDtUE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PeqrFLuyrkWP49qUU+A9ypOxpDvUPYSMLn+VJ8vJsU16Dw1UetLA83M9l9TclL3tnNN4jqkASqpxNHeovf966IGyVHkFQoo4KVb1NlFhd8nE5Q0NouTCTtNGXYVXt1uDVfuD0WVD9f5WLBPeFRdX2v9S+xuNazO0ynVbCmQS+Ts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=nDm76nL8; arc=fail smtp.client-ip=40.107.92.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="nDm76nL8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EeC48WOPwJXON2dySpd/9SzCJX8XPNTOLkpLIn6dIfNHDHJFF9K4IsRT9TBhZLB6+C1kxYfFoO8P4wf/qIn1kN8rDRhKxxRCscvSg1TszFTX5Z5mBbA8uvOfNPWSRxrpM/LMKEy9MfIYv5Lo2giHE/WfYO+Qk1vqYJbetkMq2KvMmiMll1nlqFavcvDLXa/smppiSDBPCng0+WsO/Pf7M+fc2Me+d/XK+AFPYoijUHR2m2cDxUoNt2zHdKUJx+nX5cjmwHrjuGZsmbHIOW2ZwALQqIOOxwCfhhULeUzOi7YFCP7ArNEuaoA+qR5Co6N5Q4Sf1eo/f01hOEDYifNO4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9aqYST0AuQlIRnbeZVWJy8P60wjrX02LDLf5YB79KP4=;
 b=K1KV8vH+f+zVdGIaNYAsFY4Ny00/CVtiktEI2ToFE+mHGO/hTLP9zR+blJea4X+GOobxUyASBsaV3t8DRXSiG9XQZQ/WBRsvK64Indk3ASv/Kljk9i+Cb+9obo7fynfJdgjmqKOqp1AaEEtUDPMkOSacLj6u6EokkM86V8VJDeCDrtL4aPWeVJl7sjSg9zkTW/1ugVBTwZHvZZf/looNuSLExklvuvAny31mkr1pRSwjtGD3CoIAaviWwGk9rZ53bHVVCw2RDAMWsL9dRmq8I95gfvZNmemY3XP9ieWDC+BtoqeXcjxhWYOYIEOMAaRkPGQdBd+R83oQqkWmHhPseQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9aqYST0AuQlIRnbeZVWJy8P60wjrX02LDLf5YB79KP4=;
 b=nDm76nL88E3D4spQBhDwXjOmGIpuyeCCSu+Y0h97xEYp9TQY/wD7nqfb54d3Wjar0Yiwu6u7W3VTe5NYeD+lQvrQptTTdiKSDtS2ue8tjDk9N+Fsq2ILkkCD6IQ8uk4qNc/Qdqy1rNdTMng+/Prp71YbfHKWGrGtczVE2bFDg6Y=
Received: from SJ0PR05CA0096.namprd05.prod.outlook.com (2603:10b6:a03:334::11)
 by DS7PR12MB6069.namprd12.prod.outlook.com (2603:10b6:8:9f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Tue, 6 May
 2025 12:08:49 +0000
Received: from CO1PEPF000075F3.namprd03.prod.outlook.com
 (2603:10b6:a03:334:cafe::68) by SJ0PR05CA0096.outlook.office365.com
 (2603:10b6:a03:334::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.24 via Frontend Transport; Tue,
 6 May 2025 12:08:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000075F3.mail.protection.outlook.com (10.167.249.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Tue, 6 May 2025 12:08:48 +0000
Received: from vijendar-linux.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 6 May
 2025 07:08:43 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <yung-chuan.liao@linux.intel.com>,
	<ranjani.sridharan@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Mario.Limonciello@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH 3/3] ASoC: amd: sof_amd_sdw: add logic to get cpu_pin_id for ACP7.0/ACP7.1 platforms
Date: Tue, 6 May 2025 17:37:24 +0530
Message-ID: <20250506120823.3621604-3-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250506120823.3621604-1-Vijendar.Mukunda@amd.com>
References: <20250506120823.3621604-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F3:EE_|DS7PR12MB6069:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b9ba34d-1b22-4120-c668-08dd8c96c266
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|7416014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BitL0ZTsa19HfTICjjV+p+4gqqaiviErOj2nHmz7Rp6xitr3AN4TZxUomiuj?=
 =?us-ascii?Q?OK+s9pANLHHG4Z+e512cSeGQHhl1H/PEo1PKzpT2CZkojZJioCjmbwdZGyLs?=
 =?us-ascii?Q?K/8GnwNZcwMy3zE/9WYLrn/iffO/MWZcgnppHjw4uvkJEPTqIjqlFeiCv54l?=
 =?us-ascii?Q?l4ZVokXSFrF5mJO0gc/rLtgw9HWwKOWpYLrjrURG0tNahr9Jbe9jPvIJoZjz?=
 =?us-ascii?Q?NnbzvjGRu3xxDcNXyjqeWUV+U0Wj5YJUx3cA7Ews/ZdsGbGpuwlaTMLIdVrr?=
 =?us-ascii?Q?L5zH3vpEQ7AfMIIlD9CG79TH+XkEexzGe1PBA/215csk3lhrlJnY36czPFJ0?=
 =?us-ascii?Q?ZOS5bASrEtU4amZMiOW0wqJaA+d+I6K3brXLgVPETHIoEPfKgMVx9gKaE8TN?=
 =?us-ascii?Q?XhN3q65bX/EHayD18yPt5nGxAW3Gd/biEUD7hEYxQLZUUrpqQ6mOCjJgeVxK?=
 =?us-ascii?Q?j7Zg193kCI415CoCEmzCaeSKYy62dFcpXS5Kf79uqg0vGMiMc9uPstVkKt0z?=
 =?us-ascii?Q?OiwCMEKmcEHaNfpkAnh6TpdZRpZ+DkL9omcTfQDd/I++0cL4Jx8pz71lXVu3?=
 =?us-ascii?Q?xU2v3jPck8/lSMrNyJy2QNWErWHX0II/1oYuhH3FLYoIUwTUytUXn1Ix8J7R?=
 =?us-ascii?Q?YytrYzcywIsZztmoKi9HAaacm9VB1r/VD39rSqbYj7xLCyQaYOcA60ew/Z30?=
 =?us-ascii?Q?zhycU0utUmDBH4xs9BichTmqpSH0bBdA5RJHnGFaALGLgOjpT/mwMIDcUNKj?=
 =?us-ascii?Q?Yw8B9qiunpe2Q1iVlopoEVen+wtE11GpNHL9AdVAfTtOvhpvHhuD5jP39deA?=
 =?us-ascii?Q?19sEIfL2Y1WW2c6rqIVVd29ryYNwfHKfsmMhSBITIwK0Kh2mw9NW1duTdGxX?=
 =?us-ascii?Q?t2oDqVG2pnMWgtSR+Fx13oASwE6H3SD+I9QOe3ydg8hzarqV7tPpRwI0Mn3E?=
 =?us-ascii?Q?UFrlcEh7dMbR20mkB590zzix3+mh3j0LKpyu4jmNQU4MAxr5QmXIwSkgYzXp?=
 =?us-ascii?Q?zI289deKNtwq1YtrNHMIHlgP4gECEuMU3nxw4KCXBuDJuQfeFPtsAT3V8mV/?=
 =?us-ascii?Q?XzXLkULeQ9zPJ57+GqMgoQrpQi8f0MbVWAyG1mVYoKbtBB9QM4ab8MDIR3my?=
 =?us-ascii?Q?7iRNzC+PN37vpRxjgaOHpvUKRi/o9o7srqnM/k5QC/+HsJ+g5gry8W0NPP7h?=
 =?us-ascii?Q?2uRcYLlvZNSydve4HzciUbaC956pTSqfYGZPLit/nuXv6yZ8Nw52r6Vi4Mzl?=
 =?us-ascii?Q?+WcZJco+P0R/qv8zCu1GTBJTMi9NTzWcZvzFwfeBC7XEffYLDjb3mdr6PQAj?=
 =?us-ascii?Q?oei/CfjeAFDQkJXwY4Q29aMuTPUxD+r7FsGnBPnhXS46KnjDv6af7WNi9Id/?=
 =?us-ascii?Q?zkYmtnlUu5d/r7U1FsVUj5ZwL8/8VlNvEQEwty2auepnUmVoyUPqGIqr2wLc?=
 =?us-ascii?Q?c1n/S/tCdg9eBGbMTyozmNUrtA1QikxofOvgHva3bL46vVC6H/+uowcRSIqH?=
 =?us-ascii?Q?Ki5CRuTGjVDOYYtclzRtfxo7BFFzF+7suCux?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(7416014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 12:08:48.9533
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b9ba34d-1b22-4120-c668-08dd8c96c266
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075F3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6069

Add logic to get cpu_pin_id for creating SoundWire dai link for
ACP7.0/ACP7.1 platforms.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp/acp-sdw-sof-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/acp/acp-sdw-sof-mach.c b/sound/soc/amd/acp/acp-sdw-sof-mach.c
index 75bdd843ca36..9e4a36d703ab 100644
--- a/sound/soc/amd/acp/acp-sdw-sof-mach.c
+++ b/sound/soc/amd/acp/acp-sdw-sof-mach.c
@@ -128,6 +128,13 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 			if (ret)
 				return ret;
 			break;
+		case ACP70_PCI_REV:
+		case ACP71_PCI_REV:
+			ret = get_acp70_cpu_pin_id(ffs(sof_end->link_mask - 1),
+						   *be_id, &cpu_pin_id, dev);
+			if (ret)
+				return ret;
+			break;
 		default:
 			return -EINVAL;
 		}
-- 
2.45.2

