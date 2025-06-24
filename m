Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08AB1F5617;
	Tue, 24 Jun 2025 10:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750759493; cv=fail; b=isHUVgpThbReARXas3WE1RKaRAvlus9HJuTqA6bHGP/RqCOaCyGA1kA+4TQii3DCINEil0vGddk9MrCXamBTJWrMimBI0xZs+xk2JxrDV0Lx5QNOrEeNIyG+yVsZCjzILJVNJOcRvv9CogGUk+bha7iY9twv/B69D/UofHFVbhE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750759493; c=relaxed/simple;
	bh=l/R2PXq3P1lEg0stmQqlc91YEw16yKz3TWJkyvXdE84=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Type; b=VyU9jNF4gLVWu3oTghL7rvXYcCmdgV0uwgHctPBm27gbGmbHQjgZaddhthDDIe0DDvhq+eL05V5Wahxv6+CyIAa3c2Q8SzpVGfIBz3z42sjXx1KdCQSFfJPvnxcDLfESlrEtfFRWbnvwNC+XXmB5GAQq3UMBMJ1GcNvS3Hz7XL0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=M5ec7JMk; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=H0Rol4dY; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="M5ec7JMk";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="H0Rol4dY"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55O6gKL5006784;
	Tue, 24 Jun 2025 05:04:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=PWHm2iwXOBDidaAbWePL1XDEwIN2nT+C+plovYZykdU=; b=
	M5ec7JMkK18AJb8OiPRr2pCS4hJRAEijr6BCWXrjeVTerqVBfsg1yf71LCVhZT+j
	brtSnPd6iBAJDYRBCn0EdnIAcd8qxh+1TROA9dJoRHiaHfnxD/QMr25Gf4rdYEgt
	VdMz6c5bl69r6WDEYM+dRUf8KPx4WvnStNvR1IViBYYApAukT6kSAC/GpRgdgNgw
	5Fnf5ipXrhGyQQH7j7HuddbrciGlEUZ88A2WxJG7Ndqb1CcGs56RrXEKLn4U1msB
	/HZ5FtXMcKSHViaUooOUpSYDGhOnQ8SuZ15Fk2OfNxSN9l2jvJbE3e4lxC+DMgBE
	yfhfWS3l+Zv4Zc7Z5mUFVg==
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2114.outbound.protection.outlook.com [40.107.223.114])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 47enk9jgp6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Jun 2025 05:04:22 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NjD79W5n8NDGGVR1Yyj+uBSsFHjyAtgeMt/apDUPdH0BVS4v6kTrQbV9a4pS0WvxxFxzXG6Dvc3XVqS19zUMMHWi8RHNZNNWAPotrqYXbXXpnwoi3XvWGMVa5/GfiZGjXQxKfv+hn2Pd+Tx3h1FPQFEgnLBQF9aMzV0Vf2Mz/4OakbvHznJstQ9qmD4q9FEmDfykurFmrfy4A/v2dSa7Y1UqLyYZNNSninnsVsNB5qC78yPA8OCjwXiK+TSRLthuH4Uit6ihxm0xaJPTQFA/7yjXiTxvZtHajiMc0xrDKBB6A0nm2KU50THQT5R2RY2vpTQFyrJMJIV/gb8/UdTdeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PWHm2iwXOBDidaAbWePL1XDEwIN2nT+C+plovYZykdU=;
 b=hnGCDNTHfS0BtMbfuYj1bFQbohXiXuH0L3ea8yS45B3vBdX/EaEzGBxipVvYozkt1nubvipia77d05rW+KVTlXZrPa7llxe021bcaJhMi8Xr5IZGJCs0s+B63YSIrjnbXfK/FZiN0egi6kNWheuJHP3FV34KPeA8zmK57ax9LVyy5B1uWbOVj7IOE1aZu9JKE+wZBDlndLpN7+wfqjHCsRYYcBZCQFTQNpBrXQQdMAFfjBrgKGvAhARL771ic4EmLzJ7MT68ssMgKYEH2eRzezZNpHGpYrpXqQw7fRfAl/pmraMAM/c4GzpnHrxEgwX7DiOf557iQIsW+UPEnAlmpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PWHm2iwXOBDidaAbWePL1XDEwIN2nT+C+plovYZykdU=;
 b=H0Rol4dYVfDNq+bEW7i6uot1nlc6VpQuRxPvW+s8dPX46FMBJ2MPx3OirdrWHqUm3zP4acMoPrJTT6Ebr+uviMyjqVzOvdvwNOLa+PemV9EmwCZjVztiAOMIqOrz88g5RLiU6Pxdzlzp2OK2qFUrq5Gn/zk1SgSZYRH6cWHwTxo=
Received: from BN9PR03CA0537.namprd03.prod.outlook.com (2603:10b6:408:131::32)
 by CO6PR19MB5466.namprd19.prod.outlook.com (2603:10b6:303:14d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.16; Tue, 24 Jun
 2025 10:04:18 +0000
Received: from BL6PEPF0001AB75.namprd02.prod.outlook.com
 (2603:10b6:408:131:cafe::52) by BN9PR03CA0537.outlook.office365.com
 (2603:10b6:408:131::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.30 via Frontend Transport; Tue,
 24 Jun 2025 10:04:18 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF0001AB75.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.14
 via Frontend Transport; Tue, 24 Jun 2025 10:04:17 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id EFCA0406540;
	Tue, 24 Jun 2025 10:04:15 +0000 (UTC)
Received: from EDIN6ZZ2FY3 (EDIN6ZZ2FY3.ad.cirrus.com [198.90.188.28])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id A72E882024A;
	Tue, 24 Jun 2025 10:04:15 +0000 (UTC)
From: "Simon Trimmer" <simont@opensource.cirrus.com>
To: "'GalaxySnail'" <me@glxys.nl>, <lkp@intel.com>
Cc: <david.rhodes@cirrus.com>, <linux-kernel@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <oe-kbuild-all@lists.linux.dev>,
        <patches@opensource.cirrus.com>, <perex@perex.cz>,
        <rf@opensource.cirrus.com>, <tiwai@suse.com>
References: <202506241158.kxrazQoo-lkp@intel.com> <20250624043120.2119742-2-me@glxys.nl>
In-Reply-To: <20250624043120.2119742-2-me@glxys.nl>
Subject: RE: [PATCH v2] ALSA: hda: add MODULE_FIRMWARE for cs35l41/cs35l56
Date: Tue, 24 Jun 2025 11:04:15 +0100
Message-ID: <002901dbe4ef$57d0cce0$077266a0$@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGbyohrkg8T8PQ8WU8cJxEUI1lanAHBJJU5tIRAbtA=
Content-Language: en-gb
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB75:EE_|CO6PR19MB5466:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ebe3ba1-a27c-4ede-b0f2-08ddb3067b61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|61400799027|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Z71VsQVZLbaCfWHmuJPwx60GiwrYy69WhUswcrt2OywYYDf21bWV2XHxw8tH?=
 =?us-ascii?Q?uU0RKJ1WjHnfMwZjqO5s1/rJkKbOtWoTgQU616okZ7XpI7ygfx3fX2E35nxS?=
 =?us-ascii?Q?1tuaQ7f5K1wYWh30SLktcx95/4Wbs5TcZe8Cqua2BB6Fx/Bp5bfDRI6RoSJj?=
 =?us-ascii?Q?g4h1TDA6/TTjdTrQjdgJqnYCgw2pc70qygUSFt8e4up5/CWigro4OR0Hrj61?=
 =?us-ascii?Q?M0VeQ/o9ujwEHwBixtmnw7mdqaZgKoonBOGsx2qMFUCEI8hRujorkoewSTIP?=
 =?us-ascii?Q?pIKl10+X1zH6CINk17hpvWRGHHk1zSMaLQCP0C9ff4+QmK7UyM247So2WEF5?=
 =?us-ascii?Q?9MRCybzfsCHB0/jmIHqXppMxcBd1UWBw1YEEzHdxVZgsLOhGYEuvckmr//eK?=
 =?us-ascii?Q?NC7vLjzjMTVzm+hZB5vi6JbQVEs3/m/lYqyL0ujLEwfuEOQANERDTv6Mmx6/?=
 =?us-ascii?Q?ExSqp95O5TS7lqNPn+ymeuXth+oM6/njSaF+4/gjAFuMUV7y6RvSGR2scIZE?=
 =?us-ascii?Q?Yc6kKicpg4Hs8BzEGsfWnpP+q8NtIJyuWgTdEQAck6GBE5OiA/43GalRIXuk?=
 =?us-ascii?Q?RUIP4h1UuujdSx8STlbsuwnHHHoeHR2Qtl63GL3aqpUrhdhwWKOtWVQvEMKf?=
 =?us-ascii?Q?eJnROAnqlijONWRQxMgkUjusB/FicFJZyn2pSQ47HWQffui2t7yyuadhUGGg?=
 =?us-ascii?Q?EthhXpK7vv4k2LJE3MkDu1kgA5qlOSN0F0pqOeIvJdGJCSrE5uScM4hkI5AT?=
 =?us-ascii?Q?LXnHex2tCkdlgPeAW6VI00M0tf0qasl+H7koEtXu4dvFoIPlUD/4u1LRMCzG?=
 =?us-ascii?Q?dH0Q4sIIhtbBVXf/lEXky72/GHcD17nn/4t196uCZXGtwV+V28t6m26JfeZf?=
 =?us-ascii?Q?cPUtsWyzynpr1Dp9K/ezk/hiuyiM/4E6N81ZSovw2P2bWTH3vCJdWZUvsty9?=
 =?us-ascii?Q?df1tuAA9NYmXw83/PO1HwYF0aqe/8rhKHI0HLZV50rToy7F8rW3aWvhNBwHX?=
 =?us-ascii?Q?/yoLV/pZN29EazaKaOlQ7QT6BO6mh0BXG7Z/p8EM97BZGrKF1xc3XfkzBX8q?=
 =?us-ascii?Q?hkLBOiO1z8Wq8/mCecFXm7OoUseEhf8MmxjBE8l1lk8NtydXdA8oqWnaylvM?=
 =?us-ascii?Q?cw0kyr4rpOqtxRvqp8ZtPrxL754zmxLq683eBxpFymRMcAt2vC0aj2zK/0Fb?=
 =?us-ascii?Q?ZkwlIU6NZxazN787qTOPCWh/R7K/r2rwDWBuGp5FDC7sCWwBdz3mwujB4eaY?=
 =?us-ascii?Q?DeQNbbFdgBsj9OHRFyXoSnadvsg7VKOquWp8Q3w4bpjYGo72UdBgk1oCFxBC?=
 =?us-ascii?Q?CM4s/VphlZKCUkwjrr9CW+z7keUiYH5YFMPgaofPE+4oEcfjziIPWJall3re?=
 =?us-ascii?Q?vL48UacsjCaQHq9mFGPv9dYbLs1yqnF9hNqZiKOhwWZPlZmjhT64ELHJh0vv?=
 =?us-ascii?Q?fmGRkvpi3XxM/qFdmvl5I0XqLdQIyjhrJkCgPy0/2gmOs4MOpuqETXV8zbHP?=
 =?us-ascii?Q?Ts3hwXqxGFyjQr40LWlfuWMGjNs5jQPY8HQK?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(61400799027)(7053199007);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 10:04:17.5568
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ebe3ba1-a27c-4ede-b0f2-08ddb3067b61
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB75.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR19MB5466
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDA4NSBTYWx0ZWRfX2JDBBLvrW0Gp j/ITxWaHDMb5WyoeiMJqpMEjZaBLj3Eo5neTPUGAP7tWW53Yy/YZh+ei/nfCJTZxuQlmQ0BV6W+ lpX9ipj3wsy97oSGh+OxPrwgE51/pIgNS9d9sccJntlh1UYUy5M00v6LFcUxqVK9vIehcUVUzg2
 13+y7agxBjmNSYfrlP03Psman0AUcwCJulP8WM97DhylhZ4ppZf+/KpbprWeim4Yjx/vKVxQzqX Rtyy+403ObhwBBTFaNp03LPgmaONFaAmv48YqRapQ+okfPWVl67fWj4swmNso5DVCNyJcMsqy/a mOGv/xfO4NWSawfqqglZRyHmpQ/4sHx1saeu3ddkVlGxRH7bA/0M/DihMedsoMhjijPZeHBH9hv
 vaiPrAGZYC0Bqmtm4fwJEd8o9kmM+IjCTiaxMV8NcfMo/8I93MyLG+yRiXqOkeIjyvgXiq8e
X-Authority-Analysis: v=2.4 cv=da+A3WXe c=1 sm=1 tr=0 ts=685a7826 cx=c_pps a=lFGjc4TqP16raBj1c1EA/g==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=WQ8EOYzDAAAA:8 a=w1d2syhTAAAA:8 a=gBVBUVmDCbyOK9-laasA:9 a=CjuIK1q_8ugA:10 a=bEXPBjZyhGo07VioVuGW:22
X-Proofpoint-ORIG-GUID: DdNT4X68bqyfJ6b4cqFhIaYSfjQ9c5nv
X-Proofpoint-GUID: DdNT4X68bqyfJ6b4cqFhIaYSfjQ9c5nv
X-Proofpoint-Spam-Reason: safe

On Tue, Jun 24, 2025 at 05:31:21AM +0100, GalaxySnail wrote:
> add firmware information in the .modinfo section, so that userspace
> tools can find out firmware required by cs35l41/cs32l56 kernel module

Typo in part number cs32l56 -> cs35l56

> 
> Signed-off-by: GalaxySnail <me@glxys.nl>
> ---
> v1 -> v2: fixed missing ';' in the previous patch
> 
>  sound/pci/hda/cs35l41_hda.c | 2 ++
>  sound/pci/hda/cs35l56_hda.c | 4 ++++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
> index d5bc81099d0d..f71f6aca0601 100644
> --- a/sound/pci/hda/cs35l41_hda.c
> +++ b/sound/pci/hda/cs35l41_hda.c
> @@ -2085,3 +2085,5 @@ MODULE_IMPORT_NS("SND_SOC_CS_AMP_LIB");
>  MODULE_AUTHOR("Lucas Tanure, Cirrus Logic Inc,
> <tanureal@opensource.cirrus.com>");
>  MODULE_LICENSE("GPL");
>  MODULE_IMPORT_NS("FW_CS_DSP");
> +MODULE_FIRMWARE("cirrus/cs35l41-*.wmfw");
> +MODULE_FIRMWARE("cirrus/cs36l41-*.bin");

Typo in part number cs36l41 -> cs35l41

> diff --git a/sound/pci/hda/cs35l56_hda.c b/sound/pci/hda/cs35l56_hda.c
> index 3f2fd32f4ad9..eedd8fdd3b8b 100644
> --- a/sound/pci/hda/cs35l56_hda.c
> +++ b/sound/pci/hda/cs35l56_hda.c
> @@ -1122,3 +1122,7 @@ MODULE_IMPORT_NS("SND_SOC_CS_AMP_LIB");
>  MODULE_AUTHOR("Richard Fitzgerald <rf@opensource.cirrus.com>");
>  MODULE_AUTHOR("Simon Trimmer <simont@opensource.cirrus.com>");
>  MODULE_LICENSE("GPL");
> +MODULE_FIRMWARE("cirrus/cs35l54-*.wmfw");
> +MODULE_FIRMWARE("cirrus/cs35l54-*.bin");
> +MODULE_FIRMWARE("cirrus/cs35l56-*.wmfw");
> +MODULE_FIRMWARE("cirrus/cs35l56-*.bin");
> --
> 2.50.0


