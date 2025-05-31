Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2125.outbound.protection.outlook.com [40.107.223.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E64149E13
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 02:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.125
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748659592; cv=fail; b=X9mvb28J0ZC1inv4EY030P29jH/BtQR5pdo7Z46n85Ds8gjbN81cL0fQ6IdN6G/QuFbAPTSvnBVEJVTNGQPWNyg7HFETdRX73E6N9+HwRDIKnLlRGp3+H/1TW+10OzoVwKHIZGXI8NXgaP0dUBkANBZCe1pfPE4iTXULApi4DIM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748659592; c=relaxed/simple;
	bh=GtvEoCr1F7n64w/1oLGWgvENVSoOl92GrxtJJD2zofQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=stBYtZGV2OzWOGSMn5IYM87qc5+bHRYvKQWfOvEHC/sEMd70UZDYJ+DNjN2WQVTIxBVlFimlX04UqCEeGqUr+Kf/vHNcW2vOIDVnpfoRz5Cw9omlZluBBaXRvmEGNmiVkJCN/vP7Aow1YiUGC2O3Ey+34jdBwgr+GB6Gei/mUno=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com; spf=pass smtp.mailfrom=os.amperecomputing.com; dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b=sHOxMZYL; arc=fail smtp.client-ip=40.107.223.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b="sHOxMZYL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=csHDjY/WGMcfhms7tZNFKsEeHABDOOx191SwQ49SngGklU3qytJUEg50R1PDuGOzmfyGFCCeJNykVHFnaxILplZ3mXPCWaU6slpXWitr4ptpD/ZaxVj0yzilVTirn4dKeiTIzwd7/YRBaZDT0KJAm7hGG7296CoB1Y7lDUc1SN0MiDuyDf8vZ5XvDCK2Q0su7ALkQEMn74RoaNWupvejXKYnuNG7RmvuIWUNTI1x2ndWxygV3sXn+PFDFPmxU87q1FDEFydtDB5A6aTRooecoPK/ChxLI/YLCAcbgBp+/ZP5cbVWAci3Aubdq7FKqWTEsA03q2mT8Md7OlSoOLoiEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JCvwe2kD5x8NGvCLpvQJMVYq++qUWCiwYy9RkEaD1zY=;
 b=PC9ej7MgqRnmSAFzoKoHC6uyJ95Awtnd2pAax1sRNu/sH5sgdiXVsyZHY9r0INBSdWYTAoCViFFE2T8gGdKPT+t53Cag9NbxWNVYensa0c/jrA1HDv0y02NBYLCbsSHqYJnPAuEQ6lYKg0fM8UPcJ3mkXVZeCEYZeJaF65lGcwGbClZOsENBiyDcUL7onBChONofYW24mu+CbKkdQvW6ba9B4ZQg5mQFd179SZI1SWwtfy2Q4dGgEQWHkWcpnS+1NV9gDKVvdoqSGDbiEW1Qu5N6jJcChqYZRnc4/b+fC/Fa6BHWzSltGAsaZqhDmH2CIcjTHphUpLeivgdgS6hJBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JCvwe2kD5x8NGvCLpvQJMVYq++qUWCiwYy9RkEaD1zY=;
 b=sHOxMZYLM7ueQMHKr7r46FJ8Zu4Ts2PZQ3H13KxTRQ3Kc0SYRZaK3I30e0YpRvwIqSrAZJkJend7Y9fFBE5hTyKivt80/GbrCi7dbDu08KEZFqu6QwVSM9EwYO84huIBuJrW8We3TMUb2jIAAk6dKvxcIsaopbv8kITK8SW7UHA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 LV2PR01MB7551.prod.exchangelabs.com (2603:10b6:408:17d::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.26; Sat, 31 May 2025 02:46:23 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460%6]) with mapi id 15.20.8769.029; Sat, 31 May 2025
 02:46:23 +0000
From: Yang Shi <yang@os.amperecomputing.com>
To: ryan.roberts@arm.com,
	will@kernel.org,
	catalin.marinas@arm.com,
	Miko.Lenczewski@arm.com,
	dev.jain@arm.com,
	scott@os.amperecomputing.com,
	cl@gentwo.org
Cc: yang@os.amperecomputing.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] arm64: mm: support large block mapping when rodata=full
Date: Fri, 30 May 2025 19:41:53 -0700
Message-ID: <20250531024545.1101304-4-yang@os.amperecomputing.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250531024545.1101304-1-yang@os.amperecomputing.com>
References: <20250531024545.1101304-1-yang@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CY5PR22CA0079.namprd22.prod.outlook.com
 (2603:10b6:930:80::26) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|LV2PR01MB7551:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c2d0aae-5ad5-4dbc-de30-08dd9fed548f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hNt4nIa3Nkb/9Wev7nMmNIs3c/qxkZDUX7dVDuUBHCPHt8G97jdKaWjBy7f6?=
 =?us-ascii?Q?ggOosGNwqzwlEC+RUebE9N4ZFWcB0QMK+j0c0R7NtA/VwcO7zo9lJWWkKvpS?=
 =?us-ascii?Q?S+DPvIO8Z8b80XCOuPDVm5StMBk5SNPyCrFL8QudvhmPx4KKzvs9nc0BQb+V?=
 =?us-ascii?Q?euEbSP3MN2tdmyH1vjaUFt59MOfAkOLU8pEYEKQ6KFrq81NjsJwyCsNHM6Up?=
 =?us-ascii?Q?6OKbgy/6uPr92FI2XXz4Wjo8jrm9t7aE+hgcIxYhs+ASZrmqnE6+EHaqlZCU?=
 =?us-ascii?Q?HgcB81DajY1cZqLTVdLgHY9dzhkB4IPQEnsrNIUodpZQL+OS5Ayd9C+U8fCo?=
 =?us-ascii?Q?kezLmVWShJBxakx7bOPEtjJP6imLq/Yk2ND4YZ9CZ3SXF/0SIK72JBHUaU4l?=
 =?us-ascii?Q?EobNdA8qLyi5ZXlCXvzTnegYYThEAO2rqNmAHtcCgj4M35rIR3p6UBtCIUtS?=
 =?us-ascii?Q?zQ9cHXhCZ69nap/6GSeyutFLqMlI94ZaX8qPe3EMcTFwzkgDjWIj9U847Aez?=
 =?us-ascii?Q?k8xTPrQa6jj5u4oLHZxS8Dw5Azb+HoakhodokwIQUJmRwRZxNDB981EJUNFG?=
 =?us-ascii?Q?4Et/dybrQrQPzfWcWrtevvrU7W8RzsqRRVBHedaT+GfNFcN8TZxQYHbwNi25?=
 =?us-ascii?Q?powiGDr6Rw0RU9F3slggbwqYbd91SXk1Jv/vppImWsc9zYl7uN+yWW+v+gRB?=
 =?us-ascii?Q?pGjnkEz1Oq75M9bJgwrZlgxww7No7hGS3bs7fi5o70orE9BTD8IHucvehq1Z?=
 =?us-ascii?Q?925fSoXH/h1LRDH04T6d/x90sMwX6zro1BeZr3ZAFPPuOjmwE4825nBCRj6F?=
 =?us-ascii?Q?kCEHxAe68+KmiS8x01WcPmB+mUmtmD49V3eZuGCgbwBBznCfmrBqtUwpBnG/?=
 =?us-ascii?Q?//LBw3eXgxIDG8a+DaGASizmovCl4UGWJ5Vva05FuPDodejyP8RSYwoRo6iZ?=
 =?us-ascii?Q?/YGGEfI0tV4WtRnE4e3/p6lvrKX1sY5TaI9QNaz9KYe0ehRPQYKplnqzcA2/?=
 =?us-ascii?Q?y0E5nHc+OXDFah/7ObmsAwWX20kq/B6nfvJvAvoKmf1PpLOJIZbRxJW0jiYM?=
 =?us-ascii?Q?LXB7oInqwtLORvAKh8blr7jjJnijgBl7I9ZDgLtz5IH8MTlJ8GbSLryAsyCj?=
 =?us-ascii?Q?RMAA4LdoQZJinrbRBxtGJtIaXR4ZXz10608ScqjdORqVCUuK+6XOrJWjy4yB?=
 =?us-ascii?Q?4CwRRZUEaTKftf1odF2z6I/OB6eY0YqWVgPjxCIasQ6H/mVlBpqWvh6KQluu?=
 =?us-ascii?Q?Lh9n+VnuWDfnNByoSeDItnvXolg11UrTuUji31fsfx3dgwwsNzX4QW1RU8YS?=
 =?us-ascii?Q?lneNIr3olLfYruNLUK8qSSSaHDyKSaNAsl2A8aCCvFBPhDOnCLiHMGXyCmsN?=
 =?us-ascii?Q?o1Ukp2RiKBJfjSKNJJK74xTM/IIThx/9722BNJdC2zfqDzBalUy08NpgV7Al?=
 =?us-ascii?Q?c7u+bNJ4AY+eXYuUvgoj73OTNNk+mbMTAb4mtEW8yECD7WkG4JRexA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?G/7MH3NBAm8fRCiNEIY0svWZtR6CPrt4SDguwJWEE6mB3mx674eiDnJLV/VQ?=
 =?us-ascii?Q?fkQHFzL7gFmoSgghweFSkqrsgS9yF68UbjC6CJvrJi2GtL2DR8zA5f8sP1YF?=
 =?us-ascii?Q?7Uu2JlbSvmgKzHhYxZ7TYvNzQ/i85Rs1biR6Vc1gUw2P9jNJm1JlUd6Pfdrg?=
 =?us-ascii?Q?7on7Ic5oMUBQhfSzR7yoZwWKDTJalZ2F2ou8aDOgL93EZKwA8Y1IobdTlVgr?=
 =?us-ascii?Q?CV3xzCN36HYLS8HSayw9TzMGlRqReHGaTTmDgdsuLNxKBVWMMrdzRnO8PcwL?=
 =?us-ascii?Q?EUEieXIbeKWpfov/If+Bn3zpURDWJg31+yHaLCOIMRwsLYLCIUsFSrQiqen5?=
 =?us-ascii?Q?C4ddedOU+FqPb16KMS1LPpfsFZJm1Jz/nJC2hznpnHcA9GU5NQJ9ZFbYHrYG?=
 =?us-ascii?Q?PojEv1zgZr7ezRBn8LI/vurpuDjJwXuNbM0NV3TBezoqxDwvi6E/lJb5VJuz?=
 =?us-ascii?Q?3OtDexyHDZ7qPJhxqURoBpOXZyV8ffJrbHQ0IibYwOw9s0BxYghno88xqBaa?=
 =?us-ascii?Q?p2bow/tojHb4nGTfxvl1NiXS3FdSmTGgbDrddkIY9GoZD6fptiCfPnkq4HOP?=
 =?us-ascii?Q?RsEY5RPXF2JHy4oHhOlyd8mJzwXXYCpEbCrqEbC5e+Y23Wahr3IvkrOnPWQl?=
 =?us-ascii?Q?mXQPlJzRcu3q8ZbZ+5rClO7Oguye1ntaPrRC8VzVpyjhQI0mRRI37yw3UBqB?=
 =?us-ascii?Q?+RmgcLA5lE9+ISSYSCsTvXkFcrBW9EY61jflyvcoTS1oWQbhS60Rbq2Z6Oyx?=
 =?us-ascii?Q?5qP4L7o2ij/ALayZMaW2Kpk6iNJ560rPTPUp5KZTiwtpZKRNgzxtJKqV7LQd?=
 =?us-ascii?Q?GIRGpX0gFED8Cy9MNBC6QhDXxmBuzQmR17l3PpadklU+vX04u2DG3pMG2BU6?=
 =?us-ascii?Q?wKPVlW1hkiMoTIWJCYCTMKmUc4F2GBQpNn2KG2yfOh5iyj2X/BPluh/C/B9f?=
 =?us-ascii?Q?MKQWCH1464XDpSJRb+G290GjNHvNlObWGfZ7p4UUzV8uxCWn/M/FAiressJR?=
 =?us-ascii?Q?qT1xXauSqXyVbRH+M7w2ZWCIQNF9vcGAvWRyQO0pA5mw0VnFnWf1Tw6ehpfu?=
 =?us-ascii?Q?Y1QVviV/OwneDFjqtb4aMyaXepDWpfmksi7kcAY4tvpATyL1IPRkV+27Rkan?=
 =?us-ascii?Q?+3R87jwnqq9YzwrPJtHp5QINw1UEX7h3M0TUNIXRKY17Ltjqy3HELHRpRyw9?=
 =?us-ascii?Q?9l8YP/uPCU0VB5ywVL3t9NlBTVE7IBPEmHA+HXtUWMT8LswjSSRUCijYckVR?=
 =?us-ascii?Q?aAl0O0iBEEl9zfLj8S7Q/SM+1u8+UuthNz280d2hQH1Saii6jqiHfhFmZOrU?=
 =?us-ascii?Q?8s8LqdCFBaJBwXtCI9vVFtiOcO2vkfdkTJyAZDszhKbvwQvOKOP0DUpVg+JQ?=
 =?us-ascii?Q?6pa6+fia3c3Z98lgAPGZgmqjiTp+xfUlrjyJcRRNgTJhpdad9u8S+qjmtdSv?=
 =?us-ascii?Q?1vIw0D3scVLBUhTG2H75aqfAEDvN6mFNTAgQ4oOUZgfbBmJun9J0QOo9F4sO?=
 =?us-ascii?Q?OdkbTWoXmjArvEF99LttAOttf5ST7UrkTKGcEAGdOHmrop1dRTKd67mUoSDM?=
 =?us-ascii?Q?fJk83GSYMNTQ20b50f4XRhwQvcV25WOJoD0reynidF/MFKry/kzcDTblgDBA?=
 =?us-ascii?Q?7P7ZWnQls3p6Nwi65SFuAw4=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c2d0aae-5ad5-4dbc-de30-08dd9fed548f
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2025 02:46:23.2932
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wQZqdeK37tDPR3LP0HeBr7gRqHv8q24a4OrOMjUZ+vo7qsee3wvAcalYD4fx34E9LPhmNw45ujZSkOFrZXbMQxAOJzTeY+weg8zbuB0HOU8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR01MB7551

When rodata=full is specified, kernel linear mapping has to be mapped at
PTE level since large page table can't be split due to break-before-make
rule on ARM64.

This resulted in a couple of problems:
  - performance degradation
  - more TLB pressure
  - memory waste for kernel page table

With FEAT_BBM level 2 support, splitting large block page table to
smaller ones doesn't need to make the page table entry invalid anymore.
This allows kernel split large block mapping on the fly.

Add kernel page table split support and use large block mapping by
default when FEAT_BBM level 2 is supported for rodata=full.  When
changing permissions for kernel linear mapping, the page table will be
split to smaller size.

The machine without FEAT_BBM level 2 will fallback to have kernel linear
mapping PTE-mapped when rodata=full.

With this we saw significant performance boost with some benchmarks and
much less memory consumption on my AmpereOne machine (192 cores, 1P) with
256GB memory.

* Memory use after boot
Before:
MemTotal:       258988984 kB
MemFree:        254821700 kB

After:
MemTotal:       259505132 kB
MemFree:        255410264 kB

Around 500MB more memory are free to use.  The larger the machine, the
more memory saved.

* Memcached
We saw performance degradation when running Memcached benchmark with
rodata=full vs rodata=on.  Our profiling pointed to kernel TLB pressure.
With this patchset we saw ops/sec is increased by around 3.5%, P99
latency is reduced by around 9.6%.
The gain mainly came from reduced kernel TLB misses.  The kernel TLB
MPKI is reduced by 28.5%.

The benchmark data is now on par with rodata=on too.

* Disk encryption (dm-crypt) benchmark
Ran fio benchmark with the below command on a 128G ramdisk (ext4) with disk
encryption (by dm-crypt).
fio --directory=/data --random_generator=lfsr --norandommap --randrepeat 1 \
    --status-interval=999 --rw=write --bs=4k --loops=1 --ioengine=sync \
    --iodepth=1 --numjobs=1 --fsync_on_close=1 --group_reporting --thread \
    --name=iops-test-job --eta-newline=1 --size 100G

The IOPS is increased by 90% - 150% (the variance is high, but the worst
number of good case is around 90% more than the best number of bad case).
The bandwidth is increased and the avg clat is reduced proportionally.

* Sequential file read
Read 100G file sequentially on XFS (xfs_io read with page cache populated).
The bandwidth is increased by 150%.

Signed-off-by: Yang Shi <yang@os.amperecomputing.com>
---
 arch/arm64/include/asm/cpufeature.h |  26 +++
 arch/arm64/include/asm/mmu.h        |   1 +
 arch/arm64/include/asm/pgtable.h    |  12 +-
 arch/arm64/kernel/cpufeature.c      |   2 +-
 arch/arm64/mm/mmu.c                 | 269 +++++++++++++++++++++++++---
 arch/arm64/mm/pageattr.c            |  37 +++-
 6 files changed, 319 insertions(+), 28 deletions(-)

diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
index 8f36ffa16b73..a95806980298 100644
--- a/arch/arm64/include/asm/cpufeature.h
+++ b/arch/arm64/include/asm/cpufeature.h
@@ -1053,6 +1053,32 @@ static inline bool cpu_has_lpa2(void)
 #endif
 }
 
+bool cpu_has_bbml2_noabort(unsigned int cpu_midr);
+
+static inline bool has_nobbml2_override(void)
+{
+	u64 mmfr2;
+	unsigned int bbm;
+
+	mmfr2 = read_sysreg_s(SYS_ID_AA64MMFR2_EL1);
+	mmfr2 &= ~id_aa64mmfr2_override.mask;
+	mmfr2 |= id_aa64mmfr2_override.val;
+	bbm = cpuid_feature_extract_unsigned_field(mmfr2,
+						   ID_AA64MMFR2_EL1_BBM_SHIFT);
+	return bbm == 0;
+}
+
+/*
+ * Called at early boot stage on boot CPU before cpu info and cpu feature
+ * are ready.
+ */
+static inline bool bbml2_noabort_available(void)
+{
+	return IS_ENABLED(CONFIG_ARM64_BBML2_NOABORT) &&
+	       cpu_has_bbml2_noabort(read_cpuid_id()) &&
+	       !has_nobbml2_override();
+}
+
 #endif /* __ASSEMBLY__ */
 
 #endif
diff --git a/arch/arm64/include/asm/mmu.h b/arch/arm64/include/asm/mmu.h
index 6e8aa8e72601..2693d63bf837 100644
--- a/arch/arm64/include/asm/mmu.h
+++ b/arch/arm64/include/asm/mmu.h
@@ -71,6 +71,7 @@ extern void create_pgd_mapping(struct mm_struct *mm, phys_addr_t phys,
 			       pgprot_t prot, bool page_mappings_only);
 extern void *fixmap_remap_fdt(phys_addr_t dt_phys, int *size, pgprot_t prot);
 extern void mark_linear_text_alias_ro(void);
+extern int split_linear_mapping(unsigned long start, unsigned long end);
 
 /*
  * This check is triggered during the early boot before the cpufeature
diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index d3b538be1500..bf3cef31d243 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -293,6 +293,11 @@ static inline pmd_t pmd_mkcont(pmd_t pmd)
 	return __pmd(pmd_val(pmd) | PMD_SECT_CONT);
 }
 
+static inline pmd_t pmd_mknoncont(pmd_t pmd)
+{
+	return __pmd(pmd_val(pmd) & ~PMD_SECT_CONT);
+}
+
 static inline pte_t pte_mkdevmap(pte_t pte)
 {
 	return set_pte_bit(pte, __pgprot(PTE_DEVMAP | PTE_SPECIAL));
@@ -769,7 +774,7 @@ static inline bool in_swapper_pgdir(void *addr)
 	        ((unsigned long)swapper_pg_dir & PAGE_MASK);
 }
 
-static inline void set_pmd(pmd_t *pmdp, pmd_t pmd)
+static inline void __set_pmd_nosync(pmd_t *pmdp, pmd_t pmd)
 {
 #ifdef __PAGETABLE_PMD_FOLDED
 	if (in_swapper_pgdir(pmdp)) {
@@ -779,6 +784,11 @@ static inline void set_pmd(pmd_t *pmdp, pmd_t pmd)
 #endif /* __PAGETABLE_PMD_FOLDED */
 
 	WRITE_ONCE(*pmdp, pmd);
+}
+
+static inline void set_pmd(pmd_t *pmdp, pmd_t pmd)
+{
+	__set_pmd_nosync(pmdp, pmd);
 
 	if (pmd_valid(pmd)) {
 		dsb(ishst);
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index e879bfcf853b..5fc2a4a804de 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -2209,7 +2209,7 @@ static bool hvhe_possible(const struct arm64_cpu_capabilities *entry,
 	return arm64_test_sw_feature_override(ARM64_SW_FEATURE_OVERRIDE_HVHE);
 }
 
-static bool cpu_has_bbml2_noabort(unsigned int cpu_midr)
+bool cpu_has_bbml2_noabort(unsigned int cpu_midr)
 {
 	/*
 	 * We want to allow usage of bbml2 in as wide a range of kernel contexts
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 775c0536b194..4c5d3aa35d62 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -45,6 +45,7 @@
 #define NO_BLOCK_MAPPINGS	BIT(0)
 #define NO_CONT_MAPPINGS	BIT(1)
 #define NO_EXEC_MAPPINGS	BIT(2)	/* assumes FEAT_HPDS is not used */
+#define SPLIT_MAPPINGS		BIT(3)
 
 u64 kimage_voffset __ro_after_init;
 EXPORT_SYMBOL(kimage_voffset);
@@ -166,12 +167,91 @@ static void init_clear_pgtable(void *table)
 	dsb(ishst);
 }
 
+static void split_cont_pte(pte_t *ptep)
+{
+	pte_t *_ptep = PTR_ALIGN_DOWN(ptep, sizeof(*ptep) * CONT_PTES);
+	pte_t _pte;
+
+	for (int i = 0; i < CONT_PTES; i++, _ptep++) {
+		_pte = READ_ONCE(*_ptep);
+		_pte = pte_mknoncont(_pte);
+		__set_pte_nosync(_ptep, _pte);
+	}
+
+	dsb(ishst);
+	isb();
+}
+
+static void split_cont_pmd(pmd_t *pmdp)
+{
+	pmd_t *_pmdp = PTR_ALIGN_DOWN(pmdp, sizeof(*pmdp) * CONT_PMDS);
+	pmd_t _pmd;
+
+	for (int i = 0; i < CONT_PMDS; i++, _pmdp++) {
+		_pmd = READ_ONCE(*_pmdp);
+		_pmd = pmd_mknoncont(_pmd);
+		set_pmd(_pmdp, _pmd);
+	}
+}
+
+static void split_pmd(pmd_t pmd, phys_addr_t pte_phys, int flags)
+{
+	pte_t *ptep;
+	unsigned long pfn;
+	pgprot_t prot;
+
+	pfn = pmd_pfn(pmd);
+	prot = pmd_pgprot(pmd);
+	prot = __pgprot((pgprot_val(prot) & ~PMD_TYPE_MASK) | PTE_TYPE_PAGE);
+
+	ptep = (pte_t *)phys_to_virt(pte_phys);
+
+	/* It must be naturally aligned if PMD is leaf */
+	if ((flags & NO_CONT_MAPPINGS) == 0)
+		prot = __pgprot(pgprot_val(prot) | PTE_CONT);
+
+	for (int i = 0; i < PTRS_PER_PTE; i++, ptep++, pfn++)
+		__set_pte_nosync(ptep, pfn_pte(pfn, prot));
+
+	dsb(ishst);
+}
+
+static void split_pud(pud_t pud, phys_addr_t pmd_phys, int flags)
+{
+	pmd_t *pmdp;
+	unsigned long pfn;
+	pgprot_t prot;
+	unsigned int step = PMD_SIZE >> PAGE_SHIFT;
+
+	pfn = pud_pfn(pud);
+	prot = pud_pgprot(pud);
+	pmdp = (pmd_t *)phys_to_virt(pmd_phys);
+
+	/* It must be naturally aligned if PUD is leaf */
+	if ((flags & NO_CONT_MAPPINGS) == 0)
+		prot = __pgprot(pgprot_val(prot) | PTE_CONT);
+
+	for (int i = 0; i < PTRS_PER_PMD; i++, pmdp++) {
+		__set_pmd_nosync(pmdp, pfn_pmd(pfn, prot));
+		pfn += step;
+	}
+
+	dsb(ishst);
+}
+
 static void init_pte(pte_t *ptep, unsigned long addr, unsigned long end,
-		     phys_addr_t phys, pgprot_t prot)
+		     phys_addr_t phys, pgprot_t prot, int flags)
 {
 	do {
 		pte_t old_pte = __ptep_get(ptep);
 
+		if (flags & SPLIT_MAPPINGS) {
+			if (pte_cont(old_pte))
+				split_cont_pte(ptep);
+
+			continue;
+		}
+
 		/*
 		 * Required barriers to make this visible to the table walker
 		 * are deferred to the end of alloc_init_cont_pte().
@@ -199,11 +279,20 @@ static int alloc_init_cont_pte(pmd_t *pmdp, unsigned long addr,
 	pmd_t pmd = READ_ONCE(*pmdp);
 	pte_t *ptep;
 	int ret = 0;
+	bool split = flags & SPLIT_MAPPINGS;
+	pmdval_t pmdval;
+	phys_addr_t pte_phys;
 
-	BUG_ON(pmd_sect(pmd));
-	if (pmd_none(pmd)) {
-		pmdval_t pmdval = PMD_TYPE_TABLE | PMD_TABLE_UXN | PMD_TABLE_AF;
-		phys_addr_t pte_phys;
+	if (!split)
+		BUG_ON(pmd_sect(pmd));
+
+	if (pmd_none(pmd) && split) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	if (pmd_none(pmd) || (split && pmd_leaf(pmd))) {
+		pmdval = PMD_TYPE_TABLE | PMD_TABLE_UXN | PMD_TABLE_AF;
 
 		if (flags & NO_EXEC_MAPPINGS)
 			pmdval |= PMD_TABLE_PXN;
@@ -213,6 +302,18 @@ static int alloc_init_cont_pte(pmd_t *pmdp, unsigned long addr,
 			ret = -ENOMEM;
 			goto out;
 		}
+	}
+
+	if (split) {
+		if (pmd_leaf(pmd)) {
+			split_pmd(pmd, pte_phys, flags);
+			__pmd_populate(pmdp, pte_phys, pmdval);
+		}
+		ptep = pte_offset_kernel(pmdp, addr);
+		goto split_pgtable;
+	}
+
+	if (pmd_none(pmd)) {
 		ptep = pte_set_fixmap(pte_phys);
 		init_clear_pgtable(ptep);
 		ptep += pte_index(addr);
@@ -222,17 +323,28 @@ static int alloc_init_cont_pte(pmd_t *pmdp, unsigned long addr,
 		ptep = pte_set_fixmap_offset(pmdp, addr);
 	}
 
+split_pgtable:
 	do {
 		pgprot_t __prot = prot;
 
 		next = pte_cont_addr_end(addr, end);
 
+		if (split) {
+			pte_t pteval = READ_ONCE(*ptep);
+			bool cont = pte_cont(pteval);
+
+			if (cont &&
+			    ((addr | next) & ~CONT_PTE_MASK) == 0 &&
+			    (flags & NO_CONT_MAPPINGS) == 0)
+				continue;
+		}
+
 		/* use a contiguous mapping if the range is suitably aligned */
 		if ((((addr | next | phys) & ~CONT_PTE_MASK) == 0) &&
 		    (flags & NO_CONT_MAPPINGS) == 0)
 			__prot = __pgprot(pgprot_val(prot) | PTE_CONT);
 
-		init_pte(ptep, addr, next, phys, __prot);
+		init_pte(ptep, addr, next, phys, __prot, flags);
 
 		ptep += pte_index(next) - pte_index(addr);
 		phys += next - addr;
@@ -243,7 +355,8 @@ static int alloc_init_cont_pte(pmd_t *pmdp, unsigned long addr,
 	 * ensure that all previous pgtable writes are visible to the table
 	 * walker.
 	 */
-	pte_clear_fixmap();
+	if (!split)
+		pte_clear_fixmap();
 
 out:
 	return ret;
@@ -255,15 +368,29 @@ static int init_pmd(pmd_t *pmdp, unsigned long addr, unsigned long end,
 {
 	unsigned long next;
 	int ret = 0;
+	bool split = flags & SPLIT_MAPPINGS;
+	bool cont;
 
 	do {
 		pmd_t old_pmd = READ_ONCE(*pmdp);
 
 		next = pmd_addr_end(addr, end);
 
+		if (split && pmd_leaf(old_pmd)) {
+			cont = pgprot_val(pmd_pgprot(old_pmd)) & PTE_CONT;
+			if (cont)
+				split_cont_pmd(pmdp);
+
+			/* The PMD is fully contained in the range */
+			if (((addr | next) & ~PMD_MASK) == 0 &&
+			    (flags & NO_BLOCK_MAPPINGS) == 0)
+				continue;
+		}
+
 		/* try section mapping first */
 		if (((addr | next | phys) & ~PMD_MASK) == 0 &&
-		    (flags & NO_BLOCK_MAPPINGS) == 0) {
+		    (flags & NO_BLOCK_MAPPINGS) == 0 &&
+		    (flags & SPLIT_MAPPINGS) == 0) {
 			pmd_set_huge(pmdp, phys, prot);
 
 			/*
@@ -278,7 +405,7 @@ static int init_pmd(pmd_t *pmdp, unsigned long addr, unsigned long end,
 			if (ret)
 				break;
 
-			BUG_ON(pmd_val(old_pmd) != 0 &&
+			BUG_ON(!split && pmd_val(old_pmd) != 0 &&
 			       pmd_val(old_pmd) != READ_ONCE(pmd_val(*pmdp)));
 		}
 		phys += next - addr;
@@ -296,14 +423,23 @@ static int alloc_init_cont_pmd(pud_t *pudp, unsigned long addr,
 	int ret = 0;
 	pud_t pud = READ_ONCE(*pudp);
 	pmd_t *pmdp;
+	bool split = flags & SPLIT_MAPPINGS;
+	pudval_t pudval;
+	phys_addr_t pmd_phys;
 
 	/*
 	 * Check for initial section mappings in the pgd/pud.
 	 */
-	BUG_ON(pud_sect(pud));
-	if (pud_none(pud)) {
-		pudval_t pudval = PUD_TYPE_TABLE | PUD_TABLE_UXN | PUD_TABLE_AF;
-		phys_addr_t pmd_phys;
+	if (!split)
+		BUG_ON(pud_sect(pud));
+
+	if (pud_none(pud) && split) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	if (pud_none(pud) || (split && pud_leaf(pud))) {
+		pudval = PUD_TYPE_TABLE | PUD_TABLE_UXN | PUD_TABLE_AF;
 
 		if (flags & NO_EXEC_MAPPINGS)
 			pudval |= PUD_TABLE_PXN;
@@ -313,6 +449,18 @@ static int alloc_init_cont_pmd(pud_t *pudp, unsigned long addr,
 			ret = -ENOMEM;
 			goto out;
 		}
+	}
+
+	if (split) {
+		if (pud_leaf(pud)) {
+			split_pud(pud, pmd_phys, flags);
+			__pud_populate(pudp, pmd_phys, pudval);
+		}
+		pmdp = pmd_offset(pudp, addr);
+		goto split_pgtable;
+	}
+
+	if (pud_none(pud)) {
 		pmdp = pmd_set_fixmap(pmd_phys);
 		init_clear_pgtable(pmdp);
 		pmdp += pmd_index(addr);
@@ -322,11 +470,22 @@ static int alloc_init_cont_pmd(pud_t *pudp, unsigned long addr,
 		pmdp = pmd_set_fixmap_offset(pudp, addr);
 	}
 
+split_pgtable:
 	do {
 		pgprot_t __prot = prot;
 
 		next = pmd_cont_addr_end(addr, end);
 
+		if (split) {
+			pmd_t pmdval = READ_ONCE(*pmdp);
+			bool cont = pgprot_val(pmd_pgprot(pmdval)) & PTE_CONT;
+
+			if (cont &&
+			    ((addr | next) & ~CONT_PMD_MASK) == 0 &&
+			    (flags & NO_CONT_MAPPINGS) == 0)
+				continue;
+		}
+
 		/* use a contiguous mapping if the range is suitably aligned */
 		if ((((addr | next | phys) & ~CONT_PMD_MASK) == 0) &&
 		    (flags & NO_CONT_MAPPINGS) == 0)
@@ -340,7 +499,8 @@ static int alloc_init_cont_pmd(pud_t *pudp, unsigned long addr,
 		phys += next - addr;
 	} while (addr = next, addr != end);
 
-	pmd_clear_fixmap();
+	if (!split)
+		pmd_clear_fixmap();
 
 out:
 	return ret;
@@ -355,6 +515,16 @@ static int alloc_init_pud(p4d_t *p4dp, unsigned long addr, unsigned long end,
 	int ret = 0;
 	p4d_t p4d = READ_ONCE(*p4dp);
 	pud_t *pudp;
+	bool split = flags & SPLIT_MAPPINGS;
+
+	if (split) {
+		if (p4d_none(p4d)) {
+			ret= -EINVAL;
+			goto out;
+		}
+		pudp = pud_offset(p4dp, addr);
+		goto split_pgtable;
+	}
 
 	if (p4d_none(p4d)) {
 		p4dval_t p4dval = P4D_TYPE_TABLE | P4D_TABLE_UXN | P4D_TABLE_AF;
@@ -377,17 +547,26 @@ static int alloc_init_pud(p4d_t *p4dp, unsigned long addr, unsigned long end,
 		pudp = pud_set_fixmap_offset(p4dp, addr);
 	}
 
+split_pgtable:
 	do {
 		pud_t old_pud = READ_ONCE(*pudp);
 
 		next = pud_addr_end(addr, end);
 
+		if (split && pud_leaf(old_pud)) {
+			/* The PUD is fully contained in the range */
+			if (((addr | next) & ~PUD_MASK) == 0 &&
+			    (flags & NO_BLOCK_MAPPINGS) == 0)
+				continue;
+		}
+
 		/*
 		 * For 4K granule only, attempt to put down a 1GB block
 		 */
 		if (pud_sect_supported() &&
 		   ((addr | next | phys) & ~PUD_MASK) == 0 &&
-		    (flags & NO_BLOCK_MAPPINGS) == 0) {
+		    (flags & NO_BLOCK_MAPPINGS) == 0 &&
+		    (flags & SPLIT_MAPPINGS) == 0) {
 			pud_set_huge(pudp, phys, prot);
 
 			/*
@@ -402,13 +581,14 @@ static int alloc_init_pud(p4d_t *p4dp, unsigned long addr, unsigned long end,
 			if (ret)
 				break;
 
-			BUG_ON(pud_val(old_pud) != 0 &&
+			BUG_ON(!split && pud_val(old_pud) != 0 &&
 			       pud_val(old_pud) != READ_ONCE(pud_val(*pudp)));
 		}
 		phys += next - addr;
 	} while (pudp++, addr = next, addr != end);
 
-	pud_clear_fixmap();
+	if (!split)
+		pud_clear_fixmap();
 
 out:
 	return ret;
@@ -423,6 +603,16 @@ static int alloc_init_p4d(pgd_t *pgdp, unsigned long addr, unsigned long end,
 	int ret = 0;
 	pgd_t pgd = READ_ONCE(*pgdp);
 	p4d_t *p4dp;
+	bool split = flags & SPLIT_MAPPINGS;
+
+	if (split) {
+		if (pgd_none(pgd)) {
+			ret = -EINVAL;
+			goto out;
+		}
+		p4dp = p4d_offset(pgdp, addr);
+		goto split_pgtable;
+	}
 
 	if (pgd_none(pgd)) {
 		pgdval_t pgdval = PGD_TYPE_TABLE | PGD_TABLE_UXN | PGD_TABLE_AF;
@@ -445,6 +635,7 @@ static int alloc_init_p4d(pgd_t *pgdp, unsigned long addr, unsigned long end,
 		p4dp = p4d_set_fixmap_offset(pgdp, addr);
 	}
 
+split_pgtable:
 	do {
 		p4d_t old_p4d = READ_ONCE(*p4dp);
 
@@ -461,7 +652,8 @@ static int alloc_init_p4d(pgd_t *pgdp, unsigned long addr, unsigned long end,
 		phys += next - addr;
 	} while (p4dp++, addr = next, addr != end);
 
-	p4d_clear_fixmap();
+	if (!split)
+		p4d_clear_fixmap();
 
 out:
 	return ret;
@@ -557,6 +749,25 @@ static phys_addr_t pgd_pgtable_alloc(int shift)
 	return pa;
 }
 
+int split_linear_mapping(unsigned long start, unsigned long end)
+{
+	int ret = 0;
+
+	if (!system_supports_bbml2_noabort())
+		return 0;
+
+	mmap_write_lock(&init_mm);
+	/* NO_EXEC_MAPPINGS is needed when splitting linear map */
+	ret = __create_pgd_mapping_locked(init_mm.pgd, virt_to_phys((void *)start),
+					  start, (end - start), __pgprot(0),
+					  __pgd_pgtable_alloc,
+					  NO_EXEC_MAPPINGS | SPLIT_MAPPINGS);
+	mmap_write_unlock(&init_mm);
+	flush_tlb_kernel_range(start, end);
+
+	return ret;
+}
+
 /*
  * This function can only be used to modify existing table entries,
  * without allocating new levels of table. Note that this permits the
@@ -676,6 +887,24 @@ static inline void arm64_kfence_map_pool(phys_addr_t kfence_pool, pgd_t *pgdp) {
 
 #endif /* CONFIG_KFENCE */
 
+static inline bool force_pte_mapping(void)
+{
+	/*
+	 * Can't use cpufeature API to determine whether BBML2 supported
+	 * or not since cpufeature have not been finalized yet.
+	 *
+	 * Checking the boot CPU only for now.  If the boot CPU has
+	 * BBML2, paint linear mapping with block mapping.  If it turns
+	 * out the secondary CPUs don't support BBML2 once cpufeature is
+	 * fininalized, the linear mapping will be repainted with PTE
+	 * mapping.
+	 */
+	return (rodata_full && !bbml2_noabort_available()) ||
+		debug_pagealloc_enabled() ||
+		arm64_kfence_can_set_direct_map() ||
+		is_realm_world();
+}
+
 static void __init map_mem(pgd_t *pgdp)
 {
 	static const u64 direct_map_end = _PAGE_END(VA_BITS_MIN);
@@ -701,7 +930,7 @@ static void __init map_mem(pgd_t *pgdp)
 
 	early_kfence_pool = arm64_kfence_alloc_pool();
 
-	if (can_set_direct_map())
+	if (force_pte_mapping())
 		flags |= NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;
 
 	/*
@@ -1402,7 +1631,7 @@ int arch_add_memory(int nid, u64 start, u64 size,
 
 	VM_BUG_ON(!mhp_range_allowed(start, size, true));
 
-	if (can_set_direct_map())
+	if (force_pte_mapping())
 		flags |= NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;
 
 	__create_pgd_mapping(swapper_pg_dir, start, __phys_to_virt(start),
diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
index 39fd1f7ff02a..25c068712cb5 100644
--- a/arch/arm64/mm/pageattr.c
+++ b/arch/arm64/mm/pageattr.c
@@ -10,6 +10,7 @@
 #include <linux/vmalloc.h>
 
 #include <asm/cacheflush.h>
+#include <asm/mmu.h>
 #include <asm/pgtable-prot.h>
 #include <asm/set_memory.h>
 #include <asm/tlbflush.h>
@@ -42,6 +43,8 @@ static int change_page_range(pte_t *ptep, unsigned long addr, void *data)
 	struct page_change_data *cdata = data;
 	pte_t pte = __ptep_get(ptep);
 
+	BUG_ON(pte_cont(pte));
+
 	pte = clear_pte_bit(pte, cdata->clear_mask);
 	pte = set_pte_bit(pte, cdata->set_mask);
 
@@ -80,8 +83,9 @@ static int change_memory_common(unsigned long addr, int numpages,
 	unsigned long start = addr;
 	unsigned long size = PAGE_SIZE * numpages;
 	unsigned long end = start + size;
+	unsigned long l_start;
 	struct vm_struct *area;
-	int i;
+	int i, ret;
 
 	if (!PAGE_ALIGNED(addr)) {
 		start &= PAGE_MASK;
@@ -118,7 +122,12 @@ static int change_memory_common(unsigned long addr, int numpages,
 	if (rodata_full && (pgprot_val(set_mask) == PTE_RDONLY ||
 			    pgprot_val(clear_mask) == PTE_RDONLY)) {
 		for (i = 0; i < area->nr_pages; i++) {
-			__change_memory_common((u64)page_address(area->pages[i]),
+			l_start = (u64)page_address(area->pages[i]);
+			ret = split_linear_mapping(l_start, l_start + PAGE_SIZE);
+			if (WARN_ON_ONCE(ret))
+				return ret;
+
+			__change_memory_common(l_start,
 					       PAGE_SIZE, set_mask, clear_mask);
 		}
 	}
@@ -174,6 +183,9 @@ int set_memory_valid(unsigned long addr, int numpages, int enable)
 
 int set_direct_map_invalid_noflush(struct page *page)
 {
+	unsigned long l_start;
+	int ret;
+
 	struct page_change_data data = {
 		.set_mask = __pgprot(0),
 		.clear_mask = __pgprot(PTE_VALID),
@@ -182,13 +194,21 @@ int set_direct_map_invalid_noflush(struct page *page)
 	if (!can_set_direct_map())
 		return 0;
 
+	l_start = (unsigned long)page_address(page);
+	ret = split_linear_mapping(l_start, l_start + PAGE_SIZE);
+	if (WARN_ON_ONCE(ret))
+		return ret;
+
 	return apply_to_page_range(&init_mm,
-				   (unsigned long)page_address(page),
-				   PAGE_SIZE, change_page_range, &data);
+				   l_start, PAGE_SIZE, change_page_range,
+				   &data);
 }
 
 int set_direct_map_default_noflush(struct page *page)
 {
+	unsigned long l_start;
+	int ret;
+
 	struct page_change_data data = {
 		.set_mask = __pgprot(PTE_VALID | PTE_WRITE),
 		.clear_mask = __pgprot(PTE_RDONLY),
@@ -197,9 +217,14 @@ int set_direct_map_default_noflush(struct page *page)
 	if (!can_set_direct_map())
 		return 0;
 
+	l_start = (unsigned long)page_address(page);
+	ret = split_linear_mapping(l_start, l_start + PAGE_SIZE);
+	if (WARN_ON_ONCE(ret))
+		return ret;
+
 	return apply_to_page_range(&init_mm,
-				   (unsigned long)page_address(page),
-				   PAGE_SIZE, change_page_range, &data);
+				   l_start, PAGE_SIZE, change_page_range,
+				   &data);
 }
 
 static int __set_memory_enc_dec(unsigned long addr,
-- 
2.48.1

