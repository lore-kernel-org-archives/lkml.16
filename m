Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2125.outbound.protection.outlook.com [40.107.223.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D6479C0
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 02:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.125
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748659587; cv=fail; b=J23Paw3p8QVAUo/M6OgEC9n0BHaIoHqf36SB+yMibKzOx/+IAWXt3w45EUq3Wz7PuiZWoG+VdNGOzpFj+y0ixRHIpgC8hyYSnSkcP4VW88TfVw4kJMZrP2z7tu4ZQkBeK5awxNEzu+LUtP0B7aM0LkeGS2ClxMdYxC4s3LHBlKA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748659587; c=relaxed/simple;
	bh=nQllG4IPM4BgS1EqoluuWJ56xCRCrnysFJk0uygzYBE=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Mi2aS5ZaC+5cfyuiJsZ85WNGXTfZ/Ipb7PgKaL/3Vb9Sta8PXNO7jhaDvBnzQC/BLHrzS3km1rJfPLdAsZFOCnZYTSXXCvHRhOwv5tDoRAgBOK++pFyCxIthNMqSduOu0doBiwPm2RS0bcdLwWqHcgZgM9DIH6DpPa7Khw5e92s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com; spf=pass smtp.mailfrom=os.amperecomputing.com; dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b=qZnnuqVo; arc=fail smtp.client-ip=40.107.223.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b="qZnnuqVo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yhkbm8RE/vvPSrPK7crdeKfdGfpc9cwMZG04aruj2n/EueGH+0SAc6LfZhULqiOLYSsD1ZTvIHrtq3ul4KlPHI3yDcy/t3SgXYp8oFlFdvXd3EvI2H2m89g+p0B219TgyU15HoQF9roett4KhTAAoOrf9mUiQbzwCtGG5pH2gojGv5JrHTtpjBwkI68TmxZf1Be016P99SHq9Xwc19gy1hdHGBWxjyre9x9nEP28VDQPVXKEVN8KzVEYHDGtsTS1q34/DaGrmgPMpwmsY2Ph8zvUbPOMIHu/tQ5jIJl8/R9LtqRgDuiLRbXF6TnioZ9MIFDUURD+TbwV6Wf1JAiI7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5kkuEW0wcdrikdE6p7xdPMfZEcGcJwTvLZqD7EnVXhw=;
 b=BeARbwIEbuDDfM9eNGyXR2I5ws8N6hOnErvlJPDr2oI0Vha39BKeSf6cDEbnfeWPzYcskP9H43ZkXXn4Y0pOpKfL2i9lZcGAUtCcS2ykYgxmnJUw6+CVnpZ378kEcCKndoPbOcWKMmA7MnXnYjQoSmMrMyiJP//ye3bt+QHCkldYaP3jzVwdXnEprAOzl0T8UJjGdXSAMoYeOLVdJrV9Na3Ygvvji1vdgxTzEzSQOFGdzbaVf+l+5o8TmWEfVNVOUySdZJ829cpqn9m7YoKrr0cO8F04nrTOTMWNiXBNk2ue6Rv+FD2AyDOEYXjrZ7nDHrYLF17HdSxpKsAe2K1Cgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5kkuEW0wcdrikdE6p7xdPMfZEcGcJwTvLZqD7EnVXhw=;
 b=qZnnuqVoM2akPNTQi02oBllGkpQvQ4fwAEopaKbRQZlHXHEkNM6BTeV2AORBgJthgn35XZTCFHowAt1Pb6LC4/8XCrkV39FdVPUaoc1SZx/J3JDEa79Q03AfzLa+qk7iuRfBpleUvPX9lA0h5O8Y4PiVrx/9gBa2HqJ6HoyEets=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 LV2PR01MB7551.prod.exchangelabs.com (2603:10b6:408:17d::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.26; Sat, 31 May 2025 02:46:20 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460%6]) with mapi id 15.20.8769.029; Sat, 31 May 2025
 02:46:20 +0000
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
Subject: [v4 PATCH 0/4] arm64: support FEAT_BBM level 2 and large block mapping when rodata=full
Date: Fri, 30 May 2025 19:41:50 -0700
Message-ID: <20250531024545.1101304-1-yang@os.amperecomputing.com>
X-Mailer: git-send-email 2.48.1
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
X-MS-Office365-Filtering-Correlation-Id: 6a82a66d-9100-462a-bf9e-08dd9fed52c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4Av0NN5JWR74RLiXqDBLoHY3dUgfjADOk5upvl0e7R8ghA94hjSKC0f5e03c?=
 =?us-ascii?Q?vamXI5hHwRDKcf4gebDizyTfzUHq7vBf0AZGjxEmZOvUVMfMCN6wL+Es8/Z4?=
 =?us-ascii?Q?87BM/wYDYTbILc7ALx7anFGtmVjEON1A0T3fHqjMFyKL+AZCdTPeL0lx9lcW?=
 =?us-ascii?Q?uxGvA7dmU+UeBlNs6seqGbJlbA5gC5bassPTOTXq1bxEiVUYm4sYQQogFsnc?=
 =?us-ascii?Q?ZWwglW3j862Iwn0txDvdQaIOHKDFKzsZxTg1e4wy3YjWlxcSx+rogW1yx5Ze?=
 =?us-ascii?Q?0getp2H+kYpTR7kCqpnLLiQHsQ21rCgBAODLPirUhL5th5cNjkMrHxeuSi+H?=
 =?us-ascii?Q?yqlHxUnOya3rbpeqK0DRDr1eM+6RFbn2uIasbv/mt5oJyOGUfuddp7zcWTjs?=
 =?us-ascii?Q?FWhSvB7klaxZKOW7LJbd7qtIuqx2ScMrWZKzN9n7UFv41jGHDj5bRx/23P/J?=
 =?us-ascii?Q?m2GoEz8vJ+rkaHvIN/f+8uAnKkWBOCygZgec/ygxpIV/wd9W4F4OyKJjRc/c?=
 =?us-ascii?Q?PcU4cbykwSjSmcZfVUHfXA2S1KwdVhwP13usqj54IWoRQaM7X0+8HvS8+lnn?=
 =?us-ascii?Q?vdlrJiw1663V5OGLei3CAE9S6k7PdL3h/QMeIuGxUYUfllPLhHbueCA6Ic30?=
 =?us-ascii?Q?jxCVdC9iqeQnwplWjyaDzefyJ7rxTuEEtqhLc+z1yo2yIyawjxAEzDDKt+vz?=
 =?us-ascii?Q?B51jhhwDQG83UmmmTjQk+5Yf5uyxNKWm0qIpXPXe762zOTD4lxbkFRP6ULc2?=
 =?us-ascii?Q?wJDOjPHV7pz2+3gbdo34Xa+f8nh+T0oI2BAQ6UuBVsoWDwriwFxF62Ft7N6J?=
 =?us-ascii?Q?NUfPSki/FF1BOQ387WoRqcpapAYguo9T47FNHsssSZfhb3yRx7PPLqmiNeXf?=
 =?us-ascii?Q?oifA4bd5wbvHWDTuJboqMj1D7J8lc4HQvtQCKeOXROn4wtWkpTvZWPgKWTKl?=
 =?us-ascii?Q?AA+XeLpr7qaneBZEQDhkRz0D1UlMRJSmcKPo3902DFzSkRUNxmLcoG3rPfsc?=
 =?us-ascii?Q?h1XXQM3qF8SPjuyjg9yV6+Cha8h7UL9xxrsvCr1lFNG1fr7q4fluU9TM8Rrh?=
 =?us-ascii?Q?b5GKNJWsR6ilNQvP7fA4l+ZLETVnY0FMM9HZz/EyE5qe+Kvi9zz14AuUJ9uQ?=
 =?us-ascii?Q?quYoUyLS1ZY+jOpaomuBPRuRB7prOQcGyiTP0sthslaJ/nV0JKTQ9Dh4V5H8?=
 =?us-ascii?Q?CZNf1H12jPFMP3BqNAMBAKTOgRKcH1/GOxTGCqLt04BaMaw/YMlXCTCJnK8k?=
 =?us-ascii?Q?dQBrmPXXK6kwgAPAuoTtLsCLrJsGBBp/Cw3J+8aCgDaRwd6SyZJ4YJXNM/Kx?=
 =?us-ascii?Q?nCO+8G4M7xdVIVbhkJyvmYe9E3O4W1sLHQLTf4OqdFbHrmVnLDAOW4j6CleC?=
 =?us-ascii?Q?qiGX8DWvUJCMe3IB/iBS9X1KuhSLP9RbTN+UJq3V41+QXsI6W77vDj/FITl0?=
 =?us-ascii?Q?T6Lhvo9v9mfb1WWJQHHr1sllKaOJHacXX5vRlJfvT+bghECjd7D0Yn2hkXCL?=
 =?us-ascii?Q?7l/Ici1vXeSZUX0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(13003099007)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1/vxugQnfd7fDKNYJPrmGf88gg/pYsjCKpZ7pOEeVWXC0fUFFCbBYXE3FM3l?=
 =?us-ascii?Q?EmxvjdY6wboQ1c6lXdNxZeCyScZZK4Zx1mE+vZSxXFh3qfMNilZ8LQOrlnND?=
 =?us-ascii?Q?mUBsxo+k4evxckBQhjO4iEJNt5ILYTUep1sLE+a5Jfs/WeBdC7fy49JzcKPn?=
 =?us-ascii?Q?EiU6QXH4SA/sdMBw9mSFPsZ/utr4srzodaitCVuuCUCdgwx6Ul7/cEWeGodH?=
 =?us-ascii?Q?biHSbtDB+VjdJH2axqN3/ln0qDn7dCOgaAVxYbXiH0ZRpjKVaWK/s4LOOFOB?=
 =?us-ascii?Q?oqBsnpB4X1+6hzt9I7St5cShnP/PJiztw5JXYr01BVrqd+jbPtPWPsvNYbBf?=
 =?us-ascii?Q?kvq1FEypeBMH/5sqvku9tbFkeLkIdTl7AGsbfaU528iYPvuKdaRi8Zer3DBm?=
 =?us-ascii?Q?wE2hz520s6mLdMAlk+pr52xmD8gvx9z7NYJ82j9MAkOtfbv4J7c8EldBR3Cx?=
 =?us-ascii?Q?WkxCUBN5VN/SiPA6HmXtfbsZ+pEjjVq4rQcPQGyUTWuysp/n/iU02UI8rY13?=
 =?us-ascii?Q?vD/b05xpdMVNESVreWch3xjziZdBgzFov2m+OLII1QxvAhbbpkSgc3iP8jh0?=
 =?us-ascii?Q?PXob9vyUCl8bK7AmGDhf/NsqqkX9lYZsCDhLn2XVWQ7quRExiZbO6K2eOMQh?=
 =?us-ascii?Q?BcGyYh6kvfnmI2UMbtvSsoYcwHN6az0/W/jn13IWjRGAuJ42iCMpg5PlOsRd?=
 =?us-ascii?Q?J3JZdScB6zdJBJy8haejywVwvBWOLlQz6/WhoYBHaQUBh27nLmPpQ4TG4qmH?=
 =?us-ascii?Q?P2U7zEQDlRAzKOSAA9bsLVr5cdq2fI53l5zoUaZs8S4BbUvioUAnaWd16tTr?=
 =?us-ascii?Q?LyoKXvimBPj2m00zztc0TOHtGlebYdXTCuVu6fvASg6Tcnd1urN/s0zzJe0T?=
 =?us-ascii?Q?ksN6mNSFx7Q7WQ8AdTtgdj55t7mq/dnVhpQqS5eAJBHfrCYvUbKJTZ/BnOkV?=
 =?us-ascii?Q?6VTGeaqouI89DrUZkADZv4hf3anu6jVSDcsQHPfQ5FWGP01FU46rNnlGHK1S?=
 =?us-ascii?Q?HY7GQpGATuRXb39bXh4nomgNway5Fhz7ca4f+rjiVJt8hAHEXxRoEQoMIeUx?=
 =?us-ascii?Q?RFpar2olJ0SAHwkD6x3IH7x8bp5r1OUkZE9JrlA+LcnlEz4zrisFynJvBdsG?=
 =?us-ascii?Q?o7FpmUg1ElmQTnpK5uGS0q6ddHLaZi7u721UrfAb7RrimBSMQL7LpkYg/hnG?=
 =?us-ascii?Q?YVfJXMLu+9ye+c3zyTiGvc6Z9tct9X3X+Hwk1DEkVYOJ42y+QG1oSOljfReW?=
 =?us-ascii?Q?obk/5WJCQV0efGLw5rvJjMTELlFR64L4PGIahJMz7Z9PyOl1kuyH7HHVvHuB?=
 =?us-ascii?Q?aHk3OSaDsWazyEiydW8Tb/uSWilupaMbZg7zQOctgI8BLOo2phdkajjL3PiQ?=
 =?us-ascii?Q?0yBRCYbPg018uzD+apIfMMheZ10EI7BUXeM6sDKzrKMhgfcECJfBZV50Xak5?=
 =?us-ascii?Q?kf93/JytVeGVVv3NZOUrynExamHWeGm4KFZZuWJN073yM+ZgXoT6xfkxOV9x?=
 =?us-ascii?Q?i1M9HTVFmlnuIzMtkyYn2u3BKyWsDbK0DKEgXBISnXgoaVSgghDonIUT9aEb?=
 =?us-ascii?Q?ygUkhZCx1J2xzue5NXvxvRSA2PmXiG6exVcQkMZhN5sBF1rE+HqiAJX3qs/e?=
 =?us-ascii?Q?KDAuIIfHh2CGtT9WHxv50oo=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a82a66d-9100-462a-bf9e-08dd9fed52c3
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2025 02:46:20.2563
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r/qhNT0483hMNE0kPnF9INewUzyEkhhcpGeS4hctaswJRYSH9B9Uk6JTnNrDXQFk/LRX7V6S5PxlVcPowfKkkmUL294YhdkekUu7di4WPBQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR01MB7551


Changelog
=========
v4:
  * Rebased to v6.15-rc4.
  * Based on Miko's latest BBML2 cpufeature patch (https://lore.kernel.org/linux-arm-kernel/20250428153514.55772-4-miko.lenczewski@arm.com/).
  * Keep block mappings rather than splitting to PTEs if it is fully contained
    per Ryan.
  * Return -EINVAL if page table allocation failed instead of BUG_ON per Ryan.
  * When page table allocation failed, return -1 instead of 0 per Ryan.
  * Allocate page table with GFP_ATOMIC for repainting per Ryan.
  * Use idmap to wait for repainting is done per Ryan.
  * Some minor fixes per the discussion for v3.
  * Some clean up to reduce redundant code.

v3:
  * Rebased to v6.14-rc4.
  * Based on Miko's BBML2 cpufeature patch (https://lore.kernel.org/linux-arm-kernel/20250228182403.6269-3-miko.lenczewski@arm.com/).
    Also included in this series in order to have the complete patchset.
  * Enhanced __create_pgd_mapping() to handle split as well per Ryan.
  * Supported CONT mappings per Ryan.
  * Supported asymmetric system by splitting kernel linear mapping if such
    system is detected per Ryan. I don't have such system to test, so the
    testing is done by hacking kernel to call linear mapping repainting
    unconditionally. The linear mapping doesn't have any block and cont
    mappings after booting.

RFC v2:
  * Used allowlist to advertise BBM lv2 on the CPUs which can handle TLB
    conflict gracefully per Will Deacon
  * Rebased onto v6.13-rc5
  * https://lore.kernel.org/linux-arm-kernel/20250103011822.1257189-1-yang@os.amperecomputing.com/

v3: https://lore.kernel.org/linux-arm-kernel/20250304222018.615808-1-yang@os.amperecomputing.com/
RFC v2: https://lore.kernel.org/linux-arm-kernel/20250103011822.1257189-1-yang@os.amperecomputing.com/
RFC v1: https://lore.kernel.org/lkml/20241118181711.962576-1-yang@os.amperecomputing.com/

Description
===========
When rodata=full kernel linear mapping is mapped by PTE due to arm's
break-before-make rule.

A number of performance issues arise when the kernel linear map is using
PTE entries due to arm's break-before-make rule:
  - performance degradation
  - more TLB pressure
  - memory waste for kernel page table

These issues can be avoided by specifying rodata=on the kernel command
line but this disables the alias checks on page table permissions and
therefore compromises security somewhat.

With FEAT_BBM level 2 support it is no longer necessary to invalidate the
page table entry when changing page sizes.  This allows the kernel to
split large mappings after boot is complete.

This patch adds support for splitting large mappings when FEAT_BBM level 2
is available and rodata=full is used. This functionality will be used
when modifying page permissions for individual page frames.

Without FEAT_BBM level 2 we will keep the kernel linear map using PTEs
only.

If the system is asymmetric, the kernel linear mapping may be repainted once
the BBML2 capability is finalized on all CPUs.  See patch #4 for more details.

We saw significant performance increases in some benchmarks with
rodata=full without compromising the security features of the kernel.

Testing
=======
The test was done on AmpereOne machine (192 cores, 1P) with 256GB memory and
4K page size + 48 bit VA.

Function test (4K/16K/64K page size)
  - Kernel boot.  Kernel needs change kernel linear mapping permission at
    boot stage, if the patch didn't work, kernel typically didn't boot.
  - Module stress from stress-ng. Kernel module load change permission for
    linear mapping.
  - A test kernel module which allocates 80% of total memory via vmalloc(),
    then change the vmalloc area permission to RO, this also change linear
    mapping permission to RO, then change it back before vfree(). Then launch
    a VM which consumes almost all physical memory.
  - VM with the patchset applied in guest kernel too.
  - Kernel build in VM with guest kernel which has this series applied.
  - rodata=on. Make sure other rodata mode is not broken.
  - Boot on the machine which doesn't support BBML2.

Performance
===========
Memory consumption
Before:
MemTotal:       258988984 kB
MemFree:        254821700 kB

After:
MemTotal:       259505132 kB
MemFree:        255410264 kB

Around 500MB more memory are free to use.  The larger the machine, the
more memory saved.

Performance benchmarking
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
encryption (by dm-crypt with no read/write workqueue).
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


Yang Shi (4):
      arm64: cpufeature: add AmpereOne to BBML2 allow list
      arm64: mm: make __create_pgd_mapping() and helpers non-void
      arm64: mm: support large block mapping when rodata=full
      arm64: mm: split linear mapping if BBML2 is not supported on secondary CPUs

 arch/arm64/include/asm/cpufeature.h |  26 +++++++
 arch/arm64/include/asm/mmu.h        |   4 +
 arch/arm64/include/asm/pgtable.h    |  12 ++-
 arch/arm64/kernel/cpufeature.c      |  30 ++++++--
 arch/arm64/mm/mmu.c                 | 505 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++---------------
 arch/arm64/mm/pageattr.c            |  37 +++++++--
 arch/arm64/mm/proc.S                |  41 ++++++++++
 7 files changed, 585 insertions(+), 70 deletions(-)

