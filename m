Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A22525F98E;
	Wed,  9 Apr 2025 12:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744203015; cv=fail; b=fOQmUyLay4o4NLvTFR7PaMHKPyjPkmdLm1issFi1Tl7Kt7RUV10GlSR+qLrzgY8RsV+2n78mQlAB2qrRZ6WM36Od76ovo2QzEqTo8DDHtKx6HddzcBp5bISn94M25BfKu/lqo0V3Os6hRH2GMvyAm4rmK11ctofXRmlfppN5fkI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744203015; c=relaxed/simple;
	bh=qqM33MnApRz9d03dO7TqXuyd+FyQb6EINR2fOwOOfKQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=tM931Xee8wN3FLrFATXpb1dfg7Py3HSB8pn2kQytj0sH1HmacwXBVIpZ7Y3gQO+FWi9k+gtGr3KYjbYRULUORjWDpd4Sedb8jnT+1CLq5PxM6kl4avhUdHPyGN4opOskiH+Ja1WbjIHCbO3+0YhmRt2SezrhqWAKb5tVVDWKBek=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=lcyiBgZz; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=yE7Fqb75; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="lcyiBgZz";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="yE7Fqb75"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539CmsG7028549;
	Wed, 9 Apr 2025 07:49:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=z0MCE9GmniyBRNDd
	ip3Wqv2sHkX/I0bgOA+5CDxw/RA=; b=lcyiBgZzAHsvz6nmfgg3aFLD7a7VATo2
	Xu1Wzb8toDOkda45Sfn1civOZ3jwyFeajf7UlOrb9k6OWFr0h07xGJZRBUY6hO+i
	LKkgZFTIl+qrqKUiGiDsTdOXFkxg/IPbiPVF2USS3bZs62PgbXO5KGyCzzbghD1d
	xOTKaNTlTqxZ+6XvH3c0ZygCFOAwFXF4DHKLqiTyA/1ooU8k9h8rP1ea6nXYlB/o
	ttaemrH1IO+LQbxlhOtrhlgd3roI9FnE19U0K9xE8Ec85T9rmEKJr8kY9c3/pToE
	uRZBMywuMrOXB/sI4BgpKnbj8S6Pv+GLrllAaPMa+1UUU7qKmWrLGA==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 45ws7tr015-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Apr 2025 07:49:49 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mnJJOz3z1KPMZTPVf9USZKWXuDJYPXsxW4zQJq3fUXJmFKYJGcgLn+mTjdXtzrvjNxSJVf5ySZqe/6nywiz5zXZQyFSc9/3y2kC68+zG6OR0xoruxtOabyyz6465XpWiNKrBQa/OcLPdgQyrNLenJETLTQniI8j1M/V4c/iMyvnRT+jsL+TsdcAfBwvd5IuplvqDtCeS9BVKy4QO0YqKXInncyO9Hn6gJgXxC2vVLDQFq6Pcz/8abIjQf6oR4Ov4trtIRwhw8sWALQQ8sE8BiAYws8m99uj1H+6ztmljH6+nhbUBsomWv2eYIi2xPMq2HKej1MVi9CjmwHkUDu8JQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z0MCE9GmniyBRNDdip3Wqv2sHkX/I0bgOA+5CDxw/RA=;
 b=Dj477soWOLVMyHkSIucIHi7lOsE/o5nVxOHnikAr7wKPPq86RVO09NOdWFMcYGgiuoULupZ1KxojiVmQdFVc9LkKq07QmSlbe0wLZ3AbzHvnxEJHy525aotix7tPN7eLxfcFd92tmMJ62O2rfgbODImsRHyN0ThnCnfvLGB6GX5etvpTBfuMKDgjJ9NaWGSA7nluvqFztPzQOwv8DChXbd9yeSaGgx6KDmlb2h//womsj+a445PNX7t26nSn3uHeql/0XOmKhlp5tFIkxWy49t76PpLzVA/GydWT9yNroaLwVVIESBLnB+bdHkoJEsCFxlwsAt/1iQ2WxlPenOEbYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com smtp.mailfrom=cirrus.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z0MCE9GmniyBRNDdip3Wqv2sHkX/I0bgOA+5CDxw/RA=;
 b=yE7Fqb75X2lvdFM/+CfQOZqQpDUMxeys8jQ7DmCoF1cnF5KAZgl5cqT7cqBp9W5fC5UKil/+nW5vFeMtzZM27V34hH5xK++CiDw918Am+sV+eohKnU9AauIR7yCow2mN0lnw8cU1V+m/Q28MVcO3dlRT4izLVoF2cubrg5Cl6ew=
Received: from MN2PR14CA0016.namprd14.prod.outlook.com (2603:10b6:208:23e::21)
 by IA1PR19MB6370.namprd19.prod.outlook.com (2603:10b6:208:3e6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Wed, 9 Apr
 2025 12:49:44 +0000
Received: from BN2PEPF00004FC0.namprd04.prod.outlook.com
 (2603:10b6:208:23e:cafe::53) by MN2PR14CA0016.outlook.office365.com
 (2603:10b6:208:23e::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.22 via Frontend Transport; Wed,
 9 Apr 2025 12:49:44 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of cirrus.com does not
 designate 84.19.233.75 as permitted sender) receiver=protection.outlook.com;
 client-ip=84.19.233.75; helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF00004FC0.mail.protection.outlook.com (10.167.243.186) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.13
 via Frontend Transport; Wed, 9 Apr 2025 12:49:43 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id A81A3406544;
	Wed,  9 Apr 2025 12:49:41 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 9E28F820259;
	Wed,  9 Apr 2025 12:49:41 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v3 0/3] Add DAPM/ASoC helpers to create SDCA drivers
Date: Wed,  9 Apr 2025 13:49:38 +0100
Message-Id: <20250409124941.1447265-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC0:EE_|IA1PR19MB6370:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f3c69cd1-aef8-483b-32e1-08dd77650005
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Pg/fGsWYZIeq6VI1hTLDaOsqRRjqIn1y+2yr0Z5xftPL3w8mfNiDyGZYu4Tb?=
 =?us-ascii?Q?udhuxIssb7+zHuNoKTNjq50Ic5hrqtRookZJZF4swo7Irfn8dHtpqpyOowDh?=
 =?us-ascii?Q?OVklAvrKLNUi4Ud0Ou8H01tjOkdS/gBSs3lWbX/ffRS/tX7cBgnAqFTIXcV1?=
 =?us-ascii?Q?Q4ialooFGm53S+nh9hzSsRvySO8t/QwX0auNH2HtPeMBEV09zKziErxOXmAd?=
 =?us-ascii?Q?gwvq3HdJKh6OPDSQE2c0ecJ5s+/quYicsjWi2by7ZSxSdgfCePw2FuTG8lkZ?=
 =?us-ascii?Q?GW5fJ/UKn6fW8Jzg0Yn00+d+XgnxzbK82K1p2RvLTeT5NSArG9g06aXm4ett?=
 =?us-ascii?Q?WPdx6LZHwwQmoqjUW3Q+jl/lQkVXaYFG/t2CKkFAvYlbsYIqE6ll3Lox2BvP?=
 =?us-ascii?Q?9AZ2pMAp1N4b3k9iBIbQnTkXWPxpB0Lvny9b/3TBnxBIizMLnaIegs28kQ0t?=
 =?us-ascii?Q?JsteoCWdgcbXklIaCw12jxpK6Y8Bn3t7EUVqXCVUbuCsN3vLnZdl5tMsUJnH?=
 =?us-ascii?Q?ya8WDpk2R5gpOU1/cU2+gP6iDiTCdLEofDww297P5wJraM3QSrpqvX985CkY?=
 =?us-ascii?Q?aI2TLz99Wj7pZ2IAAclTmixJXUxhmLW+01VL473UDXI9TUnjaZuQ7lt230ou?=
 =?us-ascii?Q?gph7+91JhLeXRx33I000mZDNoGDNeNR1BUvtpmvso1Ak+YWzS8+LiCvq4Ya9?=
 =?us-ascii?Q?GGLvK7MZSKVMKg+4tRwaRtJynH4P1Ddi7moxmBpE5mmqjb22KLLqZ6y6Uo0i?=
 =?us-ascii?Q?M5k9ryV/OexL672qiOmKP6IFrhkaAFEwW2EvTHugZwvtXF+zkH1P6fiy0CbM?=
 =?us-ascii?Q?qhQ51lH/Zqm8OchmkXcnk9GgnYL30IwcBbmozmEJYLYtQcfTmZM1AGJ4tiTx?=
 =?us-ascii?Q?1312jYE3F1zpoLR1ujzS8ZVZ5iFFf81LFuHtv5unC3hYH6S6iHJhKPypOFhS?=
 =?us-ascii?Q?salMeWkJRJwVP/VdkzmksR+I4Gp0mWRVexLfoSTwiEjBnUc9gZai4rw6UTc+?=
 =?us-ascii?Q?kK4UAUahF3H0cpvso3jC1eDWQLc18pR9LqSc5azfPLkS6W6UklszwM74giwe?=
 =?us-ascii?Q?jGr6v/NvTJL8ASMpPUcr5Tt62ic6EifyhSRHLOCWN3foFAeAHRydihrDyho+?=
 =?us-ascii?Q?HoJiTUsmlEFdnIKgtI/JU4u2Cq35Q1e6hzqe7MW/5RxKc37sacsG9LZUZ5Gz?=
 =?us-ascii?Q?E2kvuQOYwxo/divMBk6giY1zgdvdPZQbXrnyde/Ses9Q212dqKA+QPoxPaZk?=
 =?us-ascii?Q?J472WJr83XRl0q0GFQpSNt5Xw2mTq2k7Cf0SUPgC+6hbrcpa9wTXTsYdEXP6?=
 =?us-ascii?Q?thsdebCNJU7+1XL2iJa3jKVmGqaTE30FRgxHl9+Cuty4wzerxv8NMrsaaUP0?=
 =?us-ascii?Q?yckXFSwHgczM97UJKFXQKrZchnIplqD3Qiz3nLy1iVe/mvAQpJyxLsnYMM+C?=
 =?us-ascii?Q?Ac+3aELGMZBRB41tpklBCDQVuYHCRslUFvPCt8n+6ObvOUyZwZ0nYyWi6tC7?=
 =?us-ascii?Q?Yu4WJtHdB9TDViP3ASE9aBRH06JdWJqVNdL9?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(376014)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 12:49:43.0033
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3c69cd1-aef8-483b-32e1-08dd77650005
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FC0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR19MB6370
X-Authority-Analysis: v=2.4 cv=dauA3WXe c=1 sm=1 tr=0 ts=67f66ced cx=c_pps a=2bhcDDF4uZIgm5IDeBgkqw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=XR8D0OoHHMoA:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=hulU0MfjRZACQXYr7gAA:9 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-GUID: 5qgmmrX895jKd3iIbhMZ78IaEm7Z8d3w
X-Proofpoint-ORIG-GUID: 5qgmmrX895jKd3iIbhMZ78IaEm7Z8d3w
X-Proofpoint-Spam-Reason: safe

Add helper functions to add DAPM widgets, routes, ALSA controls,
and DAI drivers, these will be used to create SDCA function device
drivers.

This series should provide most of the core functionality needed to
get a device registered and have a working DAPM graph within the
device. There are some features that still need additional work, these
are marked with FIXMEs in the code. The two main things are SDCA
Clock Muxes (not used in our devices and needs some ASoC core work),
and better support for more complex SDCA volume control definitions
(our parts have fairly simple volumes, and SDCA has a large amount of
flexibility in how the volume control is specified).

The next steps in the process are to add helpers for the DAI ops
themselves, some IRQ handling, and firmware download. And finally we
should be able to actually add the SDCA class driver itself.

Thanks,
Charles

Changes since v2:
 - Add missing kerneldoc
 - Add missing set of soc_enum->values

Charles Keepax (3):
  ASoC: SDCA: Create DAPM widgets and routes from DisCo
  ASoC: SDCA: Create ALSA controls from DisCo
  ASoC: SDCA: Create DAI drivers from DisCo

 include/sound/sdca_asoc.h     |   42 ++
 include/sound/sdca_function.h |   69 ++
 sound/soc/sdca/Makefile       |    2 +-
 sound/soc/sdca/sdca_asoc.c    | 1266 +++++++++++++++++++++++++++++++++
 4 files changed, 1378 insertions(+), 1 deletion(-)
 create mode 100644 include/sound/sdca_asoc.h
 create mode 100644 sound/soc/sdca/sdca_asoc.c

-- 
2.39.5

