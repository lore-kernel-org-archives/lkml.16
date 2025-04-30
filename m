Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2060.outbound.protection.outlook.com [40.107.237.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7207913FEE
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 05:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745989967; cv=fail; b=BSPhlm8aJC02bc/VtILwMtWXV4q+872Iio7WcasLDAnFU8akG9bZUMZKJuUg0zLT3N59Jd4nTHeZKKbtN3ON9nKLQxByNQfirO78Hi/S72Xp2Gglpag0aPLHZb912nW60AyOcvJvp82RSpc6I6XA0dYKRNbe6lB5uFVd5/dKJ8Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745989967; c=relaxed/simple;
	bh=/tLegfx3CPlcTxZMvDuyscQ+KBgOuaWu7JLF8+8I0go=;
	h=Message-ID:Date:To:From:Subject:Content-Type:MIME-Version; b=fn/Mb76dRTd4rX8nNm709f5RLhxiDBtOGj+wacDtMfwgfS88NyfZdpaRIQp2D3YW5na3VGZcggCice594HA0h0QU6jT1OkjyOV6NpAhDbzrAxiA/Uv4h6IRB0PBhvQfDNMMpCHdKg64h48/JWmxymKADHIdRv9iv9YhvnnHsbo4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=XNJ55wSt; arc=fail smtp.client-ip=40.107.237.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="XNJ55wSt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QbiO1nep6dyYX7X90WPZ2G1iTqMnmPBuMRzYRwFzD0tUahtBPUDNpMRS6csIC4BjiNImSHcVfliKZaDepyxEk+6DOr/UcpxuDfs1eWIXJm6zuW3+tMjHu+lRCjOOcuqFJNaNKpE3bKaMpcwWlntJLpiEN2rbyk1EBFJN/3OkR+lNffNX604L4WLOt9BN25dSJSoySX8EpDXDYxBBzez9TR8P7Sp6lmwYb3ZVOtN8JzNPqtwvAi5EF5UbQprE8bzxuHlcLPcnp3nybJ+njejwof0H4Pfn8T5OGVQSIPC1kVV4OnJ1zu0XOLX/b5ugjUApkJYu6waI+OBojb0HNzQpRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=erAzbGpPf25YNWLNEvO6KOHgKLP2VQohVGb/fe/uS/8=;
 b=k/1ocz5Vzx3fyUvkblvRTevJj1vp8RYoz4ZPZJJam7X8/305b6d61KUV2dm7miLIeKP4itPwAVKMmTBrlx9ae/6DsLOz98jYPRpYG+Bb3z5B25SjpAA4qbCUSUJAB+cDzumpfLPMOoQUq2JAChvQWUhSzLm+kviODrxgvspLWfB24fQqu41Lh0wOwesOCEGm7HiTbZrOwQqUOpvVm0Kf26eAJ7OPtKIVEPVJv2UfJoTpgHrcI/bfHO4zXbmr0+0ulT2e0cnFRP0TWq4wyoPkFYftneCMaYBho0K7il9gjR4HK7HlDWbHq/HitRhLaTm2UaQny6WMlL+m8G4u1V4heQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=erAzbGpPf25YNWLNEvO6KOHgKLP2VQohVGb/fe/uS/8=;
 b=XNJ55wStc5tbkLUaS149XLRc91k7dpIFLeU9RnCUMZP1FMIMCzATFepV62PG8q2LIxyLsJQeDK0k7GX8uuFeTZPnKsPZ1CD44WpfTMsgFI1YeVuabFCG4McFo/XoJ9yfHFkYXBD2eoQXaSgIpXOnwis0JaNfMWmx8QMqPR9PpAY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4262.namprd12.prod.outlook.com (2603:10b6:610:af::8)
 by SA1PR12MB6799.namprd12.prod.outlook.com (2603:10b6:806:25b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Wed, 30 Apr
 2025 05:12:39 +0000
Received: from CH2PR12MB4262.namprd12.prod.outlook.com
 ([fe80::3bdb:bf3d:8bde:7870]) by CH2PR12MB4262.namprd12.prod.outlook.com
 ([fe80::3bdb:bf3d:8bde:7870%7]) with mapi id 15.20.8699.012; Wed, 30 Apr 2025
 05:12:39 +0000
Message-ID: <82a096ae-0be2-4f7e-842f-95cfe8df3ba5@amd.com>
Date: Wed, 30 Apr 2025 10:42:34 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-kernel@vger.kernel.org,
 syzbot <syzbot+8bb6fd945af4e0ad9299@syzkaller.appspotmail.com>
From: Shivank Garg <shivankg@amd.com>
Subject: Syz Test if issue still reproduce
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2P287CA0007.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:21b::7) To CH2PR12MB4262.namprd12.prod.outlook.com
 (2603:10b6:610:af::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB4262:EE_|SA1PR12MB6799:EE_
X-MS-Office365-Filtering-Correlation-Id: 04e13ddf-fb53-4e0d-8cea-08dd87a5a054
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c0lwR3ZiM201MXhvN3JnaGhFRC96VTVteGh1cmUwTE1KK1J0UHBCNEs5Y2Rk?=
 =?utf-8?B?aSs1U1gyVy9UNktIdGZ6RUhXcmFxa2lOWjhmZDFyTndaT05kY1lRakpOR0xI?=
 =?utf-8?B?aTZkYlBCR0txMWI5Sm5aL0VsWXFGL1dKczFVQXowQytVYjNxTmFWcSs2VDJ5?=
 =?utf-8?B?ZEdrU1hIVkNzRVNqT1hIZFRFbTRYajB6cEJvUVc5Zlo2aVpJZFYxS3hEQWFL?=
 =?utf-8?B?ZzRjZ2J2ZU9GcWRzTHBMOUU2UEJiMHVTSFhQMkFKQiswNmJZS1kvNkdpZFhE?=
 =?utf-8?B?Z1RFUmQrZWhnTllmVHEwb2FqUE0zUzladHhBNCtHVUQ2b1NNMGx2M3k4d1BD?=
 =?utf-8?B?OG4zN3VESWZreWdRWnJnVVNsOWRwUXFTUmYyUWc2RkFGbnpRdFNJU1lqOFRz?=
 =?utf-8?B?RGY3QXdheHlhY0R6dmlDQllwV3ZRa2FJL2FoRmhKdDFpR0t2bTJPTnpNdUlT?=
 =?utf-8?B?Znd2M1N6RmN3MXNsSXVQT0pMRzdXM3IyZVNZVXFDTm8xMFU0bjQyQVRad0tl?=
 =?utf-8?B?OGxxMXJGUW1xVXJMQXZmSmwrQVNFejdTMklkNEhhbXE3dUI3ZG9HbEwxRDRY?=
 =?utf-8?B?TTZSQmx6WXBSQ0pENmRGN1g1UkpKb3ZJWEdHRDdmeUVoL0FSMWxJYVcvTjF5?=
 =?utf-8?B?Zm5YTjREcjBsdGhUenEzaXFpL1RHaHVNa2FDcG1ESyt1TFVkTzJuRHVrdW4z?=
 =?utf-8?B?QW5tNmc4bVNVaEoxak1DNDlvZjBtNFlOSlFZUWpJY0hrcXpsQ1FCdytHVXh3?=
 =?utf-8?B?bTN1RCtLd0l5ZzZNRzR3VCtKQlE3YzlhREZJWTJHUm1yYk5tZTZ6SC9VZzlF?=
 =?utf-8?B?dHdrdVVPaFhHTUh1bTJvQ21TNG41S1prNVlPM2ExcHMvN2VFY1VjbGRILzhY?=
 =?utf-8?B?T283UzV6STRhREl2TFQrUTNkUmwvb3BxRzBITXJhN1hRU2E3RGhKdUlmbEd5?=
 =?utf-8?B?WDFrN2kyaUh6L0UvellBYktoUmN5Mjd5dndZUW1sWkhYR0lqU014bUFDNmh6?=
 =?utf-8?B?RDlsUFhTclp0SGJoVVp5V1lMN0NyQUJtODV5YU8wYTlZVjI0Sys3UFZkRkF3?=
 =?utf-8?B?dVM3NUFQTUY2WUc0UWtCd3QrR2ZzcHpTTk8ra0NxbFJZOGxlOHhnZVNvcEZF?=
 =?utf-8?B?Ry9CWkk5dnV3ZWFNalNZeUFLQUtRNHRqL2FhaXhiUktJeG95MkZNK2pjMXhT?=
 =?utf-8?B?OVRoSUoxUFI4OVc4Skwzb1ZZU3BjMUE5WmQ3R3VsL0NWdVF2TUlQdVBiVlIx?=
 =?utf-8?B?S3AvRDJTTERoZnFIVXBsaTgvbGlScjlSZjlzS1hkSUh4eTVERVNIdzVUNWRB?=
 =?utf-8?B?ZFVodTJBeUpVVGsxdE5vZXkzUEdKRWNIc1A2V09QQnNDM0FkOEZOamNLUjJD?=
 =?utf-8?B?Y2pzYVdVVStOZURjYlJ3V29rY2FpaGM5cWNnY0U5MjJ2NUp3aUJ4UTRyU2t4?=
 =?utf-8?B?Q21aYU5MTTdXdzZrRUJtanFyellSSkZ4eW9QZllIZlNwUkx0UDVRbnBiTXFr?=
 =?utf-8?B?L1haZ0JHSVl0L1FGZ01RRzRaQlNPZnFoMmFTbG5NNE1XUHZaQ20rd2Fjdy92?=
 =?utf-8?B?S3F1K1RJUHpFR3U5U29ad2tXQlJZMlJqSkZmeCttZzNoWEhZOUw0UzVHMS9t?=
 =?utf-8?B?Y3EyVG4xT211bkpnRXNvWGF2UEVybGdxOERLd3ZXcERxS2Q0YkVRRjJLeXRp?=
 =?utf-8?B?NnFMM1RUSUNLVC9uazYzUkdCVmFQalhLUkQya2l0OTRybTdNZWlvTEIxMWZO?=
 =?utf-8?B?S25hLzAwRVhIVDcyYm5iaC9RNmtZRlBndGxxT1hPa3dTbHdYVXBJMHllNFZE?=
 =?utf-8?Q?RCnMdBM++V5r3fuT4IqsZ4w4cLfZrkRmKrJU4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB4262.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z1NvOGhrSElzSjZuMEt5OEdlenVJc2hUQUpVdy9RUTFXeE1EVkx6S3FxWUNC?=
 =?utf-8?B?QjF3SWtDUGYxRWtoa2dTcFRCMEdac3ZlSTBGS3VhMFBIdUovMVFHWFdDdUpU?=
 =?utf-8?B?anF3SFRzNitYRmE3bkpFOFAxNmFyRnNDSS9ESTg4ZjY3ZFdhcitnS1NHM3V2?=
 =?utf-8?B?ZFl1Uml5a1lweWVodkhTbFZNbk51RHROc0YzSzIyMjA3d3hrN2hkSHpsUG0x?=
 =?utf-8?B?bnYvdW1jcXFBNGRyRDBReGZaTjJMVkZpc1VGR3dORktaYVZBMGNYYjEzOEhN?=
 =?utf-8?B?R29Kc2cyQ0htMnpHOFRmSFh1NXpKZHlSa2ZITnpld0dVYjg1NlRkMGdFcVMz?=
 =?utf-8?B?cTNtcWI0cW5yRHFOaytNL3lWTytwSEowS0lkWHBsRlQ4YitBNTY1bjBYelhH?=
 =?utf-8?B?WWVmZG1zY2V3dzJyTXpRcklFMzFKV0RJWnBuUWNrYUIyMjM1NDlnV1JSSTFQ?=
 =?utf-8?B?NkZyS3JsMllObVJvRWh0YkJtcU1OeTNVMmNMaUhZRDAxQk9PV0p3aW9CamMw?=
 =?utf-8?B?VXlDdXVTZTNNRW9vNWJlYjZhTndnY1R2QlNRaVFYTEVsRDI4cDRoYXdaT1py?=
 =?utf-8?B?dm85NDBpdmFPMEQ0NWZtSW14YjFERmhINVBOSUt3UWRtdit5UUZreU9DTXBq?=
 =?utf-8?B?YTlUZllFNEpCNktpdkc4TFUwZmZyY1ZMVnRMUE83Z3h1eUtRNmducmJxbW05?=
 =?utf-8?B?dzl1eWRyNWZNOUQ3K242RDUySmlkYlJEMzRBUEE5ZG43dUdiZXMrb1FzS3pY?=
 =?utf-8?B?Vjd4SzhpZ285TFhESUUxZDUwcGszck5HWkNJKzhUVTZSNDFseXM4ZDdnYUMr?=
 =?utf-8?B?Rzl6Q0NieEFkR3ZEakNIM1BlVjdFeXQxT0VnUGFibi9GTVN1RFlHNUJYajY3?=
 =?utf-8?B?c0RYRDBaMXJiSUMybGo1VFpTTHBzeTNjUUlLT1RNQWlHWFRRTzlkSkdlVjRR?=
 =?utf-8?B?YjhneXVmQnRxd0VSR25ubTNEQk9nZi9iVFNGdFVUdmtldUI4STBLVDd4czll?=
 =?utf-8?B?NVNQbHlOSFZMM0ZZaFovaTdvVWhoaU5EYVRoTmwwQU5ERzA4dHFGY0J4OUpv?=
 =?utf-8?B?N0Y4bW1YZnRVZC9tTkFIZVNEZUxyY2Z0aXcvK1lXb2thWERUWUhTSjJIMWtZ?=
 =?utf-8?B?ZmYyOVR0bm9VTy90K3c2TllQL1pQTU41Z2hBcVVIRlU5NEI3MWRPeHBrenU3?=
 =?utf-8?B?czFldzIxSHNVWXNPWVIwRTJVVDdxaHUwdDJCc2hBTENQWEtRbVFUU2c0OUd4?=
 =?utf-8?B?dk1ibEcwbjVScWZQSEZIeWpqWU1jM21CN2ZYRzJwN2VNbDVsSHUvT0YrcTc4?=
 =?utf-8?B?UURZNVFJQkpBSjVPd25BM2thdEphRmlLMS9idG02dDRqeExOTE91RFg4Tzl4?=
 =?utf-8?B?a2xzRnY0THhTOVNnWnNGYnJ6cURaNW5GWFlNb0pFbGJySUdSbnBwVDFONGw4?=
 =?utf-8?B?eXA3VTdvNEhWL0k1WElveFRFb3JKTFBURllCYlZudUpkNldMR29uUlRqTnFt?=
 =?utf-8?B?TG5HM1N3NEl6YUFYaE9GNDZhbExSaGtvYnFvS1FjS0RYSFNDeXpUMURBNE9D?=
 =?utf-8?B?aitkWDBOR2QxVmpZWWtzaEFEVVZreDNEb3Y5eXdCTUhMWVZEZnhhRWUrTzdh?=
 =?utf-8?B?OTNka05GU2pnTFc2MG1teXlUVEUrc3FId1cyMU5wNlpkU3ZENmRPZ2pMRzVn?=
 =?utf-8?B?VVFBV3RzSUFkdTVoa1EzTk5uL3MzeDMzb1RqaWhlQVQ4ckYrSUdIWmV5MlJt?=
 =?utf-8?B?RFEwd3Bia1lpNit0R2pURlc4WlU3WmY2eTV0clArbTJtd2wzcGlPV2ZaS0NR?=
 =?utf-8?B?NW5PL0djWFg0YnZuVVl4bFpRN1FKWHd0TGdUcU13eG9CTkZmYzhRMUE4Q3Bl?=
 =?utf-8?B?WnNod3oxcW14Y3VRTFBMMko4bjlSK01yeVc1aXpOYVZ5QlQ5MWQxWmFhU3Bo?=
 =?utf-8?B?ZU8zMkVTeno1ZkhPSGRieXBRdkJVeDFUNy9kb2R5bEN1ZHBwMEd1NTJHNkk5?=
 =?utf-8?B?bFZ3K1pOR1JkQVI4S3FRNkw1K1dDNW1aK3JRR2ExSHFwZmpFZWd5YTFGTlpZ?=
 =?utf-8?B?MFpxLzZkSWx6WjJ6cXM3aTlkaUJKaFd0T2ZIeW5RMmpTZG9MTGUvOVMvNWdz?=
 =?utf-8?Q?SSGIpTd/DnF3t6eyX28+95H5R?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04e13ddf-fb53-4e0d-8cea-08dd87a5a054
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4262.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 05:12:38.9261
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I+dDi8m92xP5nih9RUCJx1BOQHBM4mkNoSeCBSC45CElsJcX8BD9MgvOuZw0Fbksb/meRn8PkrZaaAqyNA9gUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6799

Hi,

Testing if this issue https://syzkaller.appspot.com/bug?extid=8bb6fd945af4e0ad9299
still reproduces


#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git 33035b665

diff --git a/fs/jfs/jfs_metapage.c b/fs/jfs/jfs_metapage.c
index df575a873ec6..f863ba521533 100644
--- a/fs/jfs/jfs_metapage.c
+++ b/fs/jfs/jfs_metapage.c
@@ -15,6 +15,7 @@
 #include <linux/mempool.h>
 #include <linux/seq_file.h>
 #include <linux/writeback.h>
+#include <linux/migrate.h>
 #include "jfs_incore.h"
 #include "jfs_superblock.h"
 #include "jfs_filsys.h"
@@ -151,6 +152,54 @@ static inline void dec_io(struct folio *folio, blk_status_t status,
 		handler(folio, anchor->status);
 }
 
+static int __metapage_migrate_folio(struct address_space *mapping, struct folio *dst,
+				    struct folio *src, enum migrate_mode mode)
+{
+	struct meta_anchor *src_anchor = src->private;
+	struct metapage *mps[MPS_PER_PAGE] = {0};
+	struct metapage *mp;
+	int i, rc;
+
+	for (i = 0; i < MPS_PER_PAGE; i++) {
+		mp = src_anchor->mp[i];
+		if (mp && metapage_locked(mp))
+			return -EAGAIN;
+	}
+
+	rc = filemap_migrate_folio(mapping, dst, src, mode);
+	if (rc != MIGRATEPAGE_SUCCESS)
+		return rc;
+
+	for (i = 0; i < MPS_PER_PAGE; i++) {
+		mp = src_anchor->mp[i];
+		if (!mp)
+			continue;
+		if (unlikely(insert_metapage(dst, mp))) {
+			/* If error, roll-back previosly inserted pages */
+			for (int j = 0 ; j < i; j++) {
+				if (mps[j])
+					remove_metapage(dst, mps[j]);
+			}
+			return -EAGAIN;
+		}
+		mps[i] = mp;
+	}
+
+	/* Update the metapage and remove it from src */
+	for (i = 0; i < MPS_PER_PAGE; i++) {
+		mp = mps[i];
+		if (mp) {
+			int page_offset = mp->data - folio_address(src);
+
+			mp->data = folio_address(dst) + page_offset;
+			mp->folio = dst;
+			remove_metapage(src, mp);
+		}
+	}
+
+	return MIGRATEPAGE_SUCCESS;
+}
+
 #else
 static inline struct metapage *folio_to_mp(struct folio *folio, int offset)
 {
@@ -175,6 +224,32 @@ static inline void remove_metapage(struct folio *folio, struct metapage *mp)
 #define inc_io(folio) do {} while(0)
 #define dec_io(folio, status, handler) handler(folio, status)
 
+static int __metapage_migrate_folio(struct address_space *mapping, struct folio *dst,
+				    struct folio *src, enum migrate_mode mode)
+{
+	struct metapage *mp;
+	int page_offset;
+	int rc;
+
+	mp = folio_to_mp(src, 0);
+	if (mp && metapage_locked(mp))
+		return -EAGAIN;
+
+	rc = filemap_migrate_folio(mapping, dst, src, mode);
+	if (rc != MIGRATEPAGE_SUCCESS)
+		return rc;
+
+	if (unlikely(insert_metapage(dst, mp)))
+		return -EAGAIN;
+
+	page_offset = mp->data - folio_address(src);
+	mp->data = folio_address(dst) + page_offset;
+	mp->folio = dst;
+	remove_metapage(src, mp);
+
+	return MIGRATEPAGE_SUCCESS;
+}
+
 #endif
 
 static inline struct metapage *alloc_metapage(gfp_t gfp_mask)
@@ -554,6 +629,24 @@ static bool metapage_release_folio(struct folio *folio, gfp_t gfp_mask)
 	return ret;
 }
 
+/**
+ * metapage_migrate_folio - Migration function for JFS metapages
+ */
+static int metapage_migrate_folio(struct address_space *mapping, struct folio *dst,
+				  struct folio *src, enum migrate_mode mode)
+{
+	int expected_count;
+
+	if (!src->private)
+		return filemap_migrate_folio(mapping, dst, src, mode);
+
+	/* Check whether page does not have extra refs before we do more work */
+	expected_count = folio_expected_ref_count(src) + 1;
+	if (folio_ref_count(src) != expected_count)
+		return -EAGAIN;
+	return __metapage_migrate_folio(mapping, dst, src, mode);
+}
+
 static void metapage_invalidate_folio(struct folio *folio, size_t offset,
 				    size_t length)
 {
@@ -570,6 +663,7 @@ const struct address_space_operations jfs_metapage_aops = {
 	.release_folio	= metapage_release_folio,
 	.invalidate_folio = metapage_invalidate_folio,
 	.dirty_folio	= filemap_dirty_folio,
+	.migrate_folio	= metapage_migrate_folio,
 };
 
 struct metapage *__get_metapage(struct inode *inode, unsigned long lblock,
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 68d3dd14b323..1db540bb9381 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2115,6 +2115,61 @@ static inline bool folio_maybe_mapped_shared(struct folio *folio)
 	return folio_test_large_maybe_mapped_shared(folio);
 }
 
+/**
+ * folio_expected_ref_count - calculate the expected folio refcount
+ * @folio: the folio
+ *
+ * Calculate the expected folio refcount, taking references from the pagecache,
+ * swapcache, PG_private and page table mappings into account. Useful in
+ * combination with folio_ref_count() to detect unexpected references (e.g.,
+ * GUP or other temporary references).
+ *
+ * Does currently not consider references from the LRU cache. If the folio
+ * was isolated from the LRU (which is the case during migration or split),
+ * the LRU cache does not apply.
+ *
+ * Calling this function on an unmapped folio -- !folio_mapped() -- that is
+ * locked will return a stable result.
+ *
+ * Calling this function on a mapped folio will not result in a stable result,
+ * because nothing stops additional page table mappings from coming (e.g.,
+ * fork()) or going (e.g., munmap()).
+ *
+ * Calling this function without the folio lock will also not result in a
+ * stable result: for example, the folio might get dropped from the swapcache
+ * concurrently.
+ *
+ * However, even when called without the folio lock or on a mapped folio,
+ * this function can be used to detect unexpected references early (for example,
+ * if it makes sense to even lock the folio and unmap it).
+ *
+ * The caller must add any reference (e.g., from folio_try_get()) it might be
+ * holding itself to the result.
+ *
+ * Returns the expected folio refcount.
+ */
+static inline int folio_expected_ref_count(const struct folio *folio)
+{
+	const int order = folio_order(folio);
+	int ref_count = 0;
+
+	if (WARN_ON_ONCE(folio_test_slab(folio)))
+		return 0;
+
+	if (folio_test_anon(folio)) {
+		/* One reference per page from the swapcache. */
+		ref_count += folio_test_swapcache(folio) << order;
+	} else if (!((unsigned long)folio->mapping & PAGE_MAPPING_FLAGS)) {
+		/* One reference per page from the pagecache. */
+		ref_count += !!folio->mapping << order;
+		/* One reference from PG_private. */
+		ref_count += folio_test_private(folio);
+	}
+
+	/* One reference per page table mapping. */
+	return ref_count + folio_mapcount(folio);
+}
+
 #ifndef HAVE_ARCH_MAKE_FOLIO_ACCESSIBLE
 static inline int arch_make_folio_accessible(struct folio *folio)
 {
diff --git a/mm/migrate.c b/mm/migrate.c
index c80591514e66..67f2bf1eb51e 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -445,20 +445,6 @@ void pmd_migration_entry_wait(struct mm_struct *mm, pmd_t *pmd)
 }
 #endif
 
-static int folio_expected_refs(struct address_space *mapping,
-		struct folio *folio)
-{
-	int refs = 1;
-	if (!mapping)
-		return refs;
-
-	refs += folio_nr_pages(folio);
-	if (folio_test_private(folio))
-		refs++;
-
-	return refs;
-}
-
 /*
  * Replace the folio in the mapping.
  *
@@ -601,7 +587,7 @@ static int __folio_migrate_mapping(struct address_space *mapping,
 int folio_migrate_mapping(struct address_space *mapping,
 		struct folio *newfolio, struct folio *folio, int extra_count)
 {
-	int expected_count = folio_expected_refs(mapping, folio) + extra_count;
+	int expected_count = folio_expected_ref_count(folio) + extra_count + 1;
 
 	if (folio_ref_count(folio) != expected_count)
 		return -EAGAIN;
@@ -618,7 +604,7 @@ int migrate_huge_page_move_mapping(struct address_space *mapping,
 				   struct folio *dst, struct folio *src)
 {
 	XA_STATE(xas, &mapping->i_pages, folio_index(src));
-	int rc, expected_count = folio_expected_refs(mapping, src);
+	int rc, expected_count = folio_expected_ref_count(src) + 1;
 
 	if (folio_ref_count(src) != expected_count)
 		return -EAGAIN;
@@ -749,7 +735,7 @@ static int __migrate_folio(struct address_space *mapping, struct folio *dst,
 			   struct folio *src, void *src_private,
 			   enum migrate_mode mode)
 {
-	int rc, expected_count = folio_expected_refs(mapping, src);
+	int rc, expected_count = folio_expected_ref_count(src) + 1;
 
 	/* Check whether src does not have extra refs before we do more work */
 	if (folio_ref_count(src) != expected_count)
@@ -837,7 +823,7 @@ static int __buffer_migrate_folio(struct address_space *mapping,
 		return migrate_folio(mapping, dst, src, mode);
 
 	/* Check whether page does not have extra refs before we do more work */
-	expected_count = folio_expected_refs(mapping, src);
+	expected_count = folio_expected_ref_count(src) + 1;
 	if (folio_ref_count(src) != expected_count)
 		return -EAGAIN;
 

