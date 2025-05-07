Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B647221708
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 08:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746606315; cv=fail; b=cM68emD0sB/fi9gWdwNiMGyrnti7GKvn/TFx7KtPhYuymuyS8U++GextZf1J2paQ+fjWkXxr6wQIp1hWokc1keARHX/e2CgvDIbAq+DFKy6aH2cQiYSqfrZeHgyqIq+mP1ZxcCaRAJCvuHi0whSfeeW1hotvanoRV4Aou4hQG0o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746606315; c=relaxed/simple;
	bh=0qzDsUm0OO3yc8EvkL65ACIUY2C1pCGQxhsy8u7VwAY=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=lLozFyQvjApL6W2hGFeMSMbm6FqSQN5jF4PaM8kQxWkgFOt5LXejorktV3T0Po9k/XfOzwQGocqRDafgEWKghxT3FAf4z7+50c+SuVww0gtjEWmIM8a040NWXf0HjqvQAV4owHXgKPgm4pwPEIwrG+RPYlEJTpIXnv9W5C1qx+4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mqJXBdwV; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mqJXBdwV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746606314; x=1778142314;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0qzDsUm0OO3yc8EvkL65ACIUY2C1pCGQxhsy8u7VwAY=;
  b=mqJXBdwV96oY96yRxAh+z8qPTGE7nsLrCzRS+dPW4AYMl+zgzVGYAEG7
   cttZcVLjFL48K4owFkCsgERWohNuwQr274/w1iUk3oqDufn7GeRq+Tpx/
   nLCtLCf7vadbyIZoXxwENURSlzzGuq3yQznYMWBfxcmyLcjNIxOtjGnJK
   Rr5Ua8PuS+MK399Ze7wlDCWTJI9FwCz9V9I+4Fz/giRNXS/cHhtAQRERw
   NLaL1j+mIPlGeUJK3HZkML9E/L5JVrzrNYjkcVZkXthKT3KQpDDJtAUwX
   f/Iv4DgLs34uCaakqAi/0RubyWbQWrG+o/+RP55a+IEVMQQ+14jPn3pVR
   w==;
X-CSE-ConnectionGUID: 7IS1chmTRj2+H0uahsZL4Q==
X-CSE-MsgGUID: BOWS8/TYSjCBCOlySAAG8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="48332772"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="48332772"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 01:25:13 -0700
X-CSE-ConnectionGUID: +mJb6peqStim5FhzSVOHcA==
X-CSE-MsgGUID: axU3rHPTR2SIHGN/0Zk20A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="141005595"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 01:25:13 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 7 May 2025 01:25:12 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 7 May 2025 01:25:12 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 7 May 2025 01:25:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TUHd0k4jCWfRLJHZ+TIWsdmIHE+9B8iPH/4azp8rcyc8/4tNktuFqKnzXfB80n6Zh82KFsQvp6pPlCUyDgDmZv2dXPWF8PCaNqbvo5pV0pZtvoe51dodkUDglr4iy86wUe8JiG8/UfBgrMkNixkV5f/5RirD2tAOIFS0OWC31bh70klvgQrntWBOJ52wDfrVvV8hylWrwCYj+F1Wo2LlPoRq5LSqfVKJT5nNpQ7zvRI0pRMPdLUY7kGKB6i9xkqSm1bZGzm08LlSnsnpNHHm51a6PgwmwkFVPcQnnhzpf+hx6fH6JwPeJMuBWaaN49u+qyOHmW94qQaMb4v0GfS29Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a4cYYt2Y3goUdTKxan6jafT6I+5V2OyjgaEER7dma/s=;
 b=WKAMsqMnpA1eNSAmx7iWNqX8zZDwfHzsXLfJuWGftmwZm2vE4JXSUzPyiq9cAayHi5qIYJmb2t9BNo9tnlkAphmT0uZxInPEeEQO7txX/QxrA4+cov5D/qPcYfIHwjUkfqhw/nu8TNY/c7ayDMPwd9mOJvUvmiXnkCvaGVIcvWZVVj0RYtizBa02ahdBms+bbpNAgi7MDUwRIkaOKnjgPjdh9p7d/DvB0s/PNloUuj4miiiDplaOgnNySlQt+CsvF9sxa+R9479g2AABG1n4nwUk0K1NIfRdf/xH71cLFfpUwnlhG8k8iZMd1w9UFtHrq9rHvveuCoFqgPUQcKuMHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by IA0PR11MB7862.namprd11.prod.outlook.com (2603:10b6:208:3dc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Wed, 7 May
 2025 08:24:34 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%4]) with mapi id 15.20.8699.026; Wed, 7 May 2025
 08:24:34 +0000
Date: Wed, 7 May 2025 16:24:24 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Uladzislau Rezki <urezki@gmail.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Andrew Morton
	<akpm@linux-foundation.org>, Baoquan He <bhe@redhat.com>, Adrian Huang
	<ahuang12@lenovo.com>, Christop Hellwig <hch@infradead.org>, Mateusz Guzik
	<mjguzik@gmail.com>, <linux-kernel@vger.kernel.org>, <oliver.sang@intel.com>
Subject: [linux-next:master] [lib/test_vmalloc.c]  7fc85b92db: Mem-Info
Message-ID: <202505071555.e757f1e0-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: KU3P306CA0010.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:15::15) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|IA0PR11MB7862:EE_
X-MS-Office365-Filtering-Correlation-Id: cad83136-d2b6-49a4-a1e1-08dd8d40989b
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kfSvl7FLy4Xdu9tUwqoOOXrgGTjfTir0rpYhs/4mk/hSk27s9khrTbklzbjh?=
 =?us-ascii?Q?6mgHs3mYbjFS4IQmKj+STMGCw35Yly6dhsE8pugIl3CCVAKYZSQsjnemuUFH?=
 =?us-ascii?Q?FPU8n+u64ZzuaqA+9iJoKEUphi0DnBkDmxjRy4d2G6xAOHHX35vBMdJ8d3SP?=
 =?us-ascii?Q?ohqkFg8H6cjAVM6f24YsHeS91qyRaxO9BN8+joioOCvVmTMPL39qXb725SM9?=
 =?us-ascii?Q?5X/mAjmKKqOwC3imoCiDIOp4YnI6Bm4ljvoakITAysV3FxqEgzmErXZY3vvQ?=
 =?us-ascii?Q?/aXzOfKDOp07YpF3GGZVcgVvSUzqmXytJ7Sxa7uMqfINSX9E50z9LrcbH2ai?=
 =?us-ascii?Q?EENGlFWakIiWNhdcjsiBfQ7X29oUOe6pEbxI1haxgt9R+y0ByfS4na3GbmVo?=
 =?us-ascii?Q?rleLTI+dPmaHssLjRR9WNSnAOtCcgaTCFY2rJTUQAD8MOHYVBq+EHELjAsSi?=
 =?us-ascii?Q?Fyd+s9K9oLIKfdJiiP5/vndBFDDqvU5lwzkuv006OzctHohlEJzXWve52ZzZ?=
 =?us-ascii?Q?InaIadI1qqCRCaWXn9029/UMASfymFc8WCsJ/dwUyhpSlivzo5JBXrs0AA1u?=
 =?us-ascii?Q?+VhrhPvlvsbAD+Evz491heu28INYWTOCFkCzDxJ7g9M47p2kVpygRYFe20BZ?=
 =?us-ascii?Q?ebuOQiqgm3bZUHHALG5mfcc1ZbIDlc8JgEsvy8d0zyYeI26EDeqZkGuu930H?=
 =?us-ascii?Q?0DvEoWWi9dmTbTEo3bzZAbjyV+6HF5EUpNjQkK9fs1/V0gMSCSJ25RgAH6Wl?=
 =?us-ascii?Q?IxS0+q+wz2SSw7V73xrDLzgO1XoR++CxjLxNcb+6A1F72xJzEdxmD6XFOXBa?=
 =?us-ascii?Q?GVfbIrsPsN4eyQWoDZk6oVokQ7Pgv+w3wHgxLj/nR/B3zOnnoRLPDMvChz4F?=
 =?us-ascii?Q?36kxyfbs9VNGeDas0j11UIlolEM7kHyePU9bJTLs3MMX/fp59ajyh3fWoxEv?=
 =?us-ascii?Q?t5Q+uMUjB5tkd1o4iyFGA1TNEA+7dwdEGsPVvMVSOz56xxcylQVlDhAmm+OA?=
 =?us-ascii?Q?tXgq9EjdkyMR+ISdPmJW6lgMFHUkFqCUgEFB2t4VZJnwrpiaqtO9Yutkgrpu?=
 =?us-ascii?Q?9MaNWNb1p+VaQvl09+2PlE6sjLAisuBVl96UbDetc+cyiw1uoKNCHwcaP3Z2?=
 =?us-ascii?Q?yVhre9ndU7HvZ20VCZJryMfbhef4e+JoWWdPYSnbRs199g+wWVN+rHKBnGTW?=
 =?us-ascii?Q?7En4JK9HipBNDfEnVWeDjWCC0gupXa5t+1QMFRRdS/Tp14IZUvsHNE5abf3C?=
 =?us-ascii?Q?+kYRXafrS9mWZEg61EpGn0WxqnLFhc1rBLhy4UD/lmbW/moxttV5kaTOOoV0?=
 =?us-ascii?Q?zUrdke9IUOwZMwZ2IhO5l3Kt3XpSMSFhKoiinSbxd2phVBK6mAribX5s6nP6?=
 =?us-ascii?Q?428e2cHNih6RV0b67+R2ufk4jP4R?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9t4RacPxiPHLrsrZIdMrACMNxEz+EL7FU9haR9XalEUFSGIxSIXFfD57U5bm?=
 =?us-ascii?Q?eiXzdYLmNCYlKLYmuijp3uw/06BGfW3g1/XHeGYi3geigYqoB73wcMH1OzYr?=
 =?us-ascii?Q?CFDfcD754K7xp3WeI6dNoCf4Fw0Nt7KsXOy+iH747akVyMDA2vEXp8rLTdfj?=
 =?us-ascii?Q?svfWhygJRMwTeBAgB7tStjqsnPydOmsKUbWEh4F9cZxObmfq6yPNAGyYS8KF?=
 =?us-ascii?Q?YdEDW1/fR746B1beIlmS/ePY6QhiizcZft5BwDzWAaiOV1x7AyYtv/tf/xgg?=
 =?us-ascii?Q?oc5MDbKgkODDRJ0/XI8Dahp8TCsSbfFeXhH25YyGHg+IgnQgkCLl2qYX/r0H?=
 =?us-ascii?Q?XfRH9oqmDk+kOTK3Bx6cZp0UbIEhP1hd2hG2orXm4jv4WiA4vfrXM+apmiH4?=
 =?us-ascii?Q?RRvv0eJXj3mjU34utfE/B0tC7mC2GVo+0R+hsEjuTLAx2yuFDy5Kwy5ifx1h?=
 =?us-ascii?Q?T6U8sf05ufOKo8knFxOhswbI1DZlakhuLKmyfGjFfEau+WzNGejCU0pftzp7?=
 =?us-ascii?Q?+NfOgn5zuZ071ir9r/Pwv0YLgR0FdDU5VYGdy5nkH2+ZW9cicM1ZpBYcauDS?=
 =?us-ascii?Q?gpZQiwkpO/8KOjwAeAq9T6DJxsUrPOun4sBIt6oC+PgFICj4MUHlvndbbVIC?=
 =?us-ascii?Q?Rg2/FMNrR4z1gU0I0rZVY+xcpiHZr8g77jYKpd/EyeM2n5QyyTTjIzxnqYvd?=
 =?us-ascii?Q?JauwB72zLrlhs04Ep32U+b96S8IHBcWZwxVDkyRHaKA1l9GYDIYT2XZORlGn?=
 =?us-ascii?Q?o4aE8TTmzjpXLpIHPsmBEnc/03+wIbpJ0r+IH3wGIJc8h8coIkmccG56ebgP?=
 =?us-ascii?Q?a3qY06ILRNNuXeMLz70u0CUbX0mtp2n6GkPKWG3UEdhvvtWwA9agikRrJGTf?=
 =?us-ascii?Q?468Xk3Rxz5SqsrHG5cJlbcmq2ffsO18rEyDaZBw0WWbUMKwrw6oH9wz125kv?=
 =?us-ascii?Q?PaSwPomZc+XmwNjq8hMvOTtg6WrWj01MNGga+YU5Nla8BfkCi8kfTfI0wap/?=
 =?us-ascii?Q?WO/5E9mihRAXQkO8UM0n0UmQ+pW6tzKBC8Jjhih9j0H/vwjeMv6i6AxjlI6f?=
 =?us-ascii?Q?9Yr9CHfZVEF4nAQjA7L/cEB8mS5D76+HyvWm3ZiNu7UeE8nQITWlJtCq1VSz?=
 =?us-ascii?Q?y4IZaoapkUTGRSzWcg2H7XjxLb83/JCvPpF6Q0GdoN0ZiHOJq84zn6ao9uIG?=
 =?us-ascii?Q?2h8ZK0FNVta1Qbt+0QPWiVUejfdidNL05f5CBTbF6n/8kRTh11mkB5froovn?=
 =?us-ascii?Q?Ymhxw5sNcGcloiJzLiIP8ePXEoZLvExbjgXmm4keWY8ytJNIIMwNAADSVfAH?=
 =?us-ascii?Q?96knp891Tf0wuXrC3K23NXhB7ey9EZIbvHFDo2T5lBw5wNv/f5McUVzOBhoE?=
 =?us-ascii?Q?PquGdgi2ke9CSvq+OE26biShscAxdHDbMMw7D3Q3y+N0grW8RuCPWEIJ2XmL?=
 =?us-ascii?Q?+jxBDcEakw4dAMF7WS6tZ2nl56n/cKSgyYIt8vXM+UMLf/jW1SiURKBCnqRB?=
 =?us-ascii?Q?pQOCL9sUk/7cdnXDbL4aEmSuXJf54LupZKd+hfjgNZ06MurFV9kkFdug5BmO?=
 =?us-ascii?Q?glsT1CUTNrwT8R9eVUfHAFiOrP/R4mwdq05PtsmU1PNH4rae0dpbpkZ25j/B?=
 =?us-ascii?Q?JQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cad83136-d2b6-49a4-a1e1-08dd8d40989b
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 08:24:33.5951
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hm3EIq4lPxKOJfnNZdi44TV1veogUGy6t0o1deWYK4EuXnu4C+/4RzdM6rI9SRYkjljQjj7qOoX21vqCdRjPrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7862
X-OriginatorOrg: intel.com



Hello,


by this commit, we notice the config diff:

--- /pkg/linux/i386-randconfig-053-20250503/gcc-12/ceec7f2554e7af6f6a11acee3dcba414b9ecdccd/.config     2025-05-07 06:57:33.691929038 +0800
+++ /pkg/linux/i386-randconfig-053-20250503/gcc-12/7fc85b92db96fd88f86f8e977e7e142c233680b4/.config     2025-05-07 01:22:43.415543806 +0800
@@ -6760,7 +6760,7 @@ CONFIG_TEST_IDA=m
 CONFIG_TEST_MISC_MINOR=m
 # CONFIG_TEST_LKM is not set
 CONFIG_TEST_BITOPS=m
-CONFIG_TEST_VMALLOC=m
+CONFIG_TEST_VMALLOC=y
 # CONFIG_TEST_BPF is not set
 CONFIG_FIND_BIT_BENCHMARK=m
 CONFIG_TEST_FIRMWARE=m


then we find a i386 config boot test always fail as "kernel_hang_in_boot_stage"
in one of tests, we captured some information about Mem-Info.

=========================================================================================
tbox_group/testcase/rootfs/kconfig/compiler/sleep:
  vm-snb-i386/boot/debian-11.1-i386-20220923.cgz/i386-randconfig-053-20250503/gcc-12/1

ceec7f2554e7af6f 7fc85b92db96fd88f86f8e977e7
---------------- ---------------------------
       fail:runs  %reproduction    fail:runs
           |             |             |
           :6          100%           6:6     last_state.booting
           :6          100%           6:6     last_state.is_incomplete_run
           :6          100%           6:6     dmesg.BUG:kernel_hang_in_boot_stage
           :6           17%           1:6     dmesg.Mem-Info

BTW, seems x86_64 config tests are ok.

below details just FYI.


kernel test robot noticed "Mem-Info" on:

commit: 7fc85b92db96fd88f86f8e977e7e142c233680b4 ("lib/test_vmalloc.c: allow built-in execution")
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

[test failed on linux-next/master 0a00723f4c2d0b273edd0737f236f103164a08eb]

in testcase: boot

config: i386-randconfig-053-20250503
compiler: gcc-12
test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m 4G

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202505071555.e757f1e0-lkp@intel.com



[ 568.859422][ T77] ? kthread_is_per_cpu (kbuild/obj/consumer/i386-randconfig-053-20250503/kernel/kthread.c:413) 
[ 568.859422][ T77] ret_from_fork (kbuild/obj/consumer/i386-randconfig-053-20250503/arch/x86/kernel/process.c:159) 
[ 568.859422][ T77] ? kthread_is_per_cpu (kbuild/obj/consumer/i386-randconfig-053-20250503/kernel/kthread.c:413) 
[ 568.859422][ T77] ret_from_fork_asm (kbuild/obj/consumer/i386-randconfig-053-20250503/arch/x86/entry/entry_32.S:737) 
[ 568.859422][ T77] entry_INT80_32 (kbuild/obj/consumer/i386-randconfig-053-20250503/arch/x86/entry/entry_32.S:942) 
[  568.892507][   T77] Mem-Info:
[  568.893062][   T77] active_anon:0 inactive_anon:0 isolated_anon:0
[  568.893062][   T77]  active_file:0 inactive_file:0 isolated_file:0
[  568.893062][   T77]  unevictable:81237 dirty:0 writeback:0
[  568.893062][   T77]  slab_reclaimable:4892 slab_unreclaimable:990
[  568.893062][   T77]  mapped:0 shmem:0 pagetables:37
[  568.893062][   T77]  sec_pagetables:0 bounce:0
[  568.893062][   T77]  kernel_misc_reclaimable:0
[  568.893062][   T77]  free:642768 free_pcp:7866 free_cma:0
[  568.907502][   T77] Node 0 active_anon:0kB inactive_anon:0kB active_file:0kB inactive_file:0kB unevictable:324948kB isolated(anon):0kB isolated(file):0kB mapped:0kB dirty:0kB writeback:0kB shmem:0kB writeback_tmp:0kB kernel_stack:344kB pagetables:148kB sec_pagetables:0kB all_unreclaimable? no Balloon:0kB
[  568.913478][   T77] DMA free:15360kB boost:0kB min:76kB low:92kB high:108kB reserved_highatomic:0KB free_highatomic:0KB active_anon:0kB inactive_anon:0kB active_file:0kB inactive_file:0kB unevictable:0kB writepending:0kB present:15992kB managed:15360kB mlocked:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:0kB
[  568.919639][   T77] lowmem_reserve[]: 0 664 2988 2988
[  568.922660][   T77] Normal free:562624kB boost:0kB min:3016kB low:3768kB high:4520kB reserved_highatomic:0KB free_highatomic:0KB active_anon:0kB inactive_anon:0kB active_file:0kB inactive_file:0kB unevictable:7336kB writepending:0kB present:749560kB managed:680084kB mlocked:0kB bounce:0kB free_pcp:31472kB local_pcp:31472kB free_cma:0kB
[  568.928669][   T77] lowmem_reserve[]: 0 0 18591 18591
[  568.930481][   T77] DMA: 0*4kB 0*8kB 0*16kB 0*32kB 0*64kB 0*128kB 0*256kB 0*512kB 1*1024kB (U) 1*2048kB (U) 3*4096kB (M) = 15360kB
[  568.935634][   T77] Normal: 2*4kB (ME) 1*8kB (M) 3*16kB (UME) 4*32kB (UME) 2*64kB (ME) 1*128kB (M) 28*256kB (UME) 52*512kB (UM) 2*1024kB (M) 1*2048kB (U) 128*4096kB (M) = 562624kB
[  568.942674][   T77] Node 0 hugepages_total=0 hugepages_free=0 hugepages_surp=0 hugepages_size=4096kB
[  568.944646][   T77] 81256 total pagecache pages
[  568.945136][   T77] 0 pages in swap cache
[  568.947632][   T77] Free swap  = 0kB
[  568.948086][   T77] Total swap = 0kB
[  568.949615][   T77] 786302 pages RAM
[  568.950027][   T77] 594914 pages HighMem/MovableOnly
[  568.952655][   T77] 17527 pages reserved
[  568.953101][   T77] 0 pages cma reserved
BUG: kernel hang in boot stage


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250507/202505071555.e757f1e0-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

