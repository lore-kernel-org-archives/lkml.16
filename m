Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A35190477
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 06:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750227955; cv=fail; b=Nn0bV5kEJN3mNrGtNoXIpNUjWXRbZr0VgkfSDwueyMC+X16L1HiRbnaJkJ8WzdBGMl0QhsyrAX2fHHIuzC+f6Je7Qv0fZXEoltgj1mxWiC5H23odeBauWGjNltIAb1LIEL+jN6zCy9GB0bp5hm50L6YcQlFryMbYtgTqGt/gZEQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750227955; c=relaxed/simple;
	bh=rERTv1Bp8e/KMHdTtwaSqMEdLwvs+7iO3/V5U5OnM8Q=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Eg/mLSAqSg2R7lcB2VEoc61VfBAHbMhIqMrPUCyRa5KeJoKBSOZb5+24UE5opuD9J/gZNGnJ6SvwMlRI4BUhmuZhEpr2Z3xlIElAvW3NLzmbB7R1NXdYXLjg0nepwZ1r606dd7A98JqhIVgl3XbeXNRNrEsJLsbA2DQjOKXsb6U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nXbOb9OT; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nXbOb9OT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750227953; x=1781763953;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rERTv1Bp8e/KMHdTtwaSqMEdLwvs+7iO3/V5U5OnM8Q=;
  b=nXbOb9OTS8FRdiYmRQWPxbdYtMdCBvkcWrNjLmmL2KZvz7HCZOlpUs+g
   bLam4D5uTt2EU4pbJXVqZwgKJ3I+eM9/0Z9PodDaavPJgAogUxBoyT0RG
   IPK+JyEaO78eGdB0sgUX2XB1ax4KDQg+rNOwpCUuVsH3TyqewTt79frKE
   fuIwqE47TEW4XS0lNe/nTM8U2xQl9xAb0OrJdSbLnLbTLTLq3UB6wijan
   DlLi9p6jniG+VfrB8bnTzwKcdgnfNWCVwp+tGNzJ0GTbDrLUWI924pvVS
   EuUaxfg28pq0i95W6a/DffwXxKda3QBCTsMPvK/IAXzbbyqCp8cmWJXgr
   A==;
X-CSE-ConnectionGUID: XUnpriNoT3S5ibMDcP29nA==
X-CSE-MsgGUID: 3a55b2rTTpWuIQEMQw2u0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="56244562"
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="56244562"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 23:25:52 -0700
X-CSE-ConnectionGUID: bwrT/r12Te6Hg0sh3GLfNw==
X-CSE-MsgGUID: Dnq5UafGQGCfD+9LowNElw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="186550729"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 23:25:53 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 23:25:51 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 17 Jun 2025 23:25:51 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.85)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 23:25:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s5xtqOFxZKIF7MvZEaJ7Twcx9M9ny69egunyxwCjXfuRa/71AKG5HIyuo880n5xgjOdOgvWjzzE8DDW4jVl9bjsmua/vpqbxUNY0QbuTLRo0nIQxXXnneQxt7S5IdPzufuoxnaxH4Iy1wAJqPwhbg61CiRfJ2zCL2FXi5DLdLmGdL9yI7SQNQ2eHDau6ZKJPqmzyd49vpmjwbUbbSTWG7EKJBDQm+QDB5djMIXK8HfEjYKoqBCytF6F7heWKZbrDwfsR4YxLU4Jpvn/nIqGIWR16f4SPrpKLo4lWZejc1gNA39IIxx85NFvxMexpp4j55LQSjS8TfOljhdBzmw1ErA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e4ZTjuCztIpwzwx71lRBBBvGB6U8qjt21HDNMLod4OE=;
 b=Ie1vSJj9X3okTZ9Gtg/aX7andEAQ+bfYe5z0+FfSpfgIyasu6J0Iqtm+/M027oOPfkr24vT+K6HI6lM+8X14rfF32q7jq1Jt1TfaYG/O+DZsIPnCyiA6++aqLFtnqmsngrf2+nOQD6dMdeRtDgaTW6Rq/QF7QQIs6bjaeUBTzhn4QTiIeyjrKR9pmfe1Z3TH4vvg9G1Yw7S2l5N0Fa3s3nQlg5M9n+eq4ltusWIKJ/8x47/pY4XH3U07ea5StfMhRGrsODii1qW+nJ8GFaRStGH8fmNczcGKozq9XXwSxVkupMwW4B0+pbCdHcJ5H/upuqplD4gM/IhngZomr4RKzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by DM3PR11MB8681.namprd11.prod.outlook.com (2603:10b6:0:49::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.28; Wed, 18 Jun 2025 06:25:47 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%3]) with mapi id 15.20.8792.034; Wed, 18 Jun 2025
 06:25:47 +0000
Date: Wed, 18 Jun 2025 14:25:37 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Uladzislau Rezki <urezki@gmail.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>, Baoquan He <bhe@redhat.com>,
	Adrian Huang <ahuang12@lenovo.com>, Christop Hellwig <hch@infradead.org>,
	Mateusz Guzik <mjguzik@gmail.com>, <linux-mm@kvack.org>,
	<oliver.sang@intel.com>
Subject: [linus:master] [lib/test_vmalloc.c]  2d76e79315:
 Kernel_panic-not_syncing:Fatal_exception
Message-ID: <202506181351.bba867dd-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR02CA0136.apcprd02.prod.outlook.com
 (2603:1096:4:188::16) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|DM3PR11MB8681:EE_
X-MS-Office365-Filtering-Correlation-Id: fe48ed0f-4b56-4e8c-0786-08ddae30f667
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jiWOiWDUFS+9Ci94l+wyMrrAyuMHcliaLF25AnGI1L/gLVt6SlODUzWArgVJ?=
 =?us-ascii?Q?ZHPSrTUbNUodBFGJzD6pDq0Yd1TNOnRAkB5fGKkrRkFGvIMblzzQWIZwLWiH?=
 =?us-ascii?Q?sOAqpkhr1l8NAt2E6tx4UjapDlJsjFzsFCqCQU4dn7iMwhP8t3x71lOV5NGm?=
 =?us-ascii?Q?OnisJBdQpU4MEJW60Cue5RRqS1jMdGJeLmwPc+6IIZYEDnQj6w0bAwsCMdSb?=
 =?us-ascii?Q?AuDFVwo9mjxaQ6kFEsyF7UUZKMFWky1yqJ1GyOxIVmNhiowkylickSKAloqs?=
 =?us-ascii?Q?EMUu+9F5D0nlJUgZtHa4TlGNUFkrjCv8H61Eristegz8cRsStTtmBMmn2Xyp?=
 =?us-ascii?Q?1Sb1OE0NTYCIACj9A/2HqrEMwesSFWdbVzHliKra2AiWrJOomYP8LVxu0fu2?=
 =?us-ascii?Q?/liCbb7yHZtEFYbwLdgNnmf1VNPn7Wx8Jd6NKXPXvwAO2NPy6RyIdrZ68VgI?=
 =?us-ascii?Q?pM+Uh/FFHcZI16UvO5IxvCQsLr0teR9WCgeBOZn9gdDYAk8nGL0ep0rQmeis?=
 =?us-ascii?Q?4VRtJo/bRKyLj22dPmzf3nQISJx/i6FbbLTt+rtThM+FnSxSuWb+nmEOhg8K?=
 =?us-ascii?Q?DTMUuhCiPxTJTZy4mEDH9Ljcnx9owAzQKXE9ei9YR8L8zXGDryULcvJysh52?=
 =?us-ascii?Q?brZpk9eup17S9hC9Ep2IBacuMJ4t2P/r9EQZWlYHB4RksmfK6UABlZl+/NjH?=
 =?us-ascii?Q?FJJFkPMsL9euBSlrOtPmI6nz7y3oHK6/ZPm3727/8zUTAhWlNuRqTpiO1xDa?=
 =?us-ascii?Q?CKf0teeKD4y6JbEgx3Ja76eTGl8l1b/Grd/STjGrx9JHfTI1nVqWBxxSEzgW?=
 =?us-ascii?Q?3GaapNBh4OD//X1lPw19rB6y3OFKNTJUS2wAQSf7xHVJ+/zIjAwvB7QjhJN3?=
 =?us-ascii?Q?l3mJ5j9VeI3xhAxFYhx6q8mzqQoXtD3hCxU86S65PgfIMDjDYG9oeyqNH6fn?=
 =?us-ascii?Q?a/tqpsf+sJi+DZaLh9bngS+NRVuZSeX1G9y7JTWmrNyDbrzLNFKWTNhXwEQa?=
 =?us-ascii?Q?5kc9er/CXCNt5XoYmubE8vi81QzkQ06ZgPzQXQ9un0TyqLsx02jhvNIrdEZp?=
 =?us-ascii?Q?1DixZmxy8xArOkMIRDAFbpGsa5bMBtMxxQhmZa0MY0YZZmOCO7lp2aEgiyuJ?=
 =?us-ascii?Q?xdxljQd6e4MDp5RZy+IHieCAU1zbvilC9zRL0Cg2nR2kDrUUY0t9iqKdsA06?=
 =?us-ascii?Q?8bezkt4LHHjyGh9nSkEQwqnCLjOG7tA0kgZx5Z6EKzcm/UYe8zijCLaJXf1H?=
 =?us-ascii?Q?3GGSTr0xJYsRMxg238OID+ZTxDxh/AC+cItA6JXH2X+zT88rhfX4TO+j4dso?=
 =?us-ascii?Q?zH1wnHNhCXbCU0EBQfgE7ziIvHUO5IJEsgvMvWr3CyeLwNUT3ClsabTkEHOx?=
 =?us-ascii?Q?qMGwgv5PxpBzb+2RqiZu2XPdlyYW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MCUrPdCziLQd0NzZHloqvSzDIFFNuIUCTOGUP5+ECC6H+xZTqzhiGbuHM+uM?=
 =?us-ascii?Q?j7L4k72OXpxAaGDRHAzapzyJV0wtJas+5my/sT8/m/W131uAjcUww4Ht0Myr?=
 =?us-ascii?Q?/bG3b8yrpatrbRBxvlLwHcBUaHw0HqxlNV/yZfyRIoHzAKjWN+0vSTf8/Buz?=
 =?us-ascii?Q?vHmDcu4pY0+Vd0ISc20PtUkBELupo550eYLuCbJB/NPfGQFAQllpVK2ajPLV?=
 =?us-ascii?Q?cSGfZWKagB5NZGF8MfVEakTCr3XJGX31CwzoeIrLL+f72G8ucQGZjewJWQg9?=
 =?us-ascii?Q?/tmn5MeY6TttQmDWjt5lxPtuimIrZFlrsZT8m/l0ue/Ixzy9NaQAfF3ne78o?=
 =?us-ascii?Q?UXEqGf8fTqfq9T5SA6c0MT1wGieapqBvZ9bECtCTTIUiJNWApVkUvE9U7YXe?=
 =?us-ascii?Q?K6tDt0wV/Wltad28UFh2gK2PerGTWai7+cijVBFEUMy0Wy7J9R4QzSKX4TOb?=
 =?us-ascii?Q?rFiaHgKYsErTVyahFX7uaagVBSn0iZK/LBWWc9xRap1okpSQ2cDo1Q0KporS?=
 =?us-ascii?Q?Or9mhILVcsdBmnEMLayUxM++a71SNgaqzNHOQCtWl6wjOQRfdlVuuk4sMMNi?=
 =?us-ascii?Q?oyvuSkDQ9Nt8MrQCLB1ZIJ/yWHV9P8ff9T6qbF1DJ5dnad7cLqf/S7YAr1fh?=
 =?us-ascii?Q?fKCXIRrsluSTr3uXxG8Vot0kK7GCUGOWvr3okWa4NaH1u5zWKF54EBDCTCFm?=
 =?us-ascii?Q?6YQ9R/j0eUVfqd5ne3Pfr3zifgYK5VYDOs8/TVjhcWybfBpctjT9v518hEjM?=
 =?us-ascii?Q?1qbLWxXQbJU/cKj9g9UfYtIFnnJWmr+QHmCkO6l5dhZau/U36dUFUNfihOAV?=
 =?us-ascii?Q?9hD0mLa/0VNGd1RtGvy+nWoQfCMB46VtIZ5+rnAPHEb9BH2t4rDR7yc/nbIh?=
 =?us-ascii?Q?VQ6poWOA/nkSXgTJE2JLjB0zHukejVM/ayE1qXBvwasK0n8B7zNo+6OjmX2t?=
 =?us-ascii?Q?89I6Nvs0PKuei4es2gg44TOQAMFByooNhMmRUN/09NfCkv6ZHwM0afbPhbRf?=
 =?us-ascii?Q?t4lawY5aItLehlunojH1/M+5x+Senn3WzJKH3q1Kex+y6bi9gfTFBnrgnsoQ?=
 =?us-ascii?Q?mMBFu7+wSsfVf/SkXU1PKx94ghyaRIU7LmeSuFZG7X6tCFsZ4On7YO167p69?=
 =?us-ascii?Q?Lr+6sS4xI5JZPVefzD7+sIlvrlDQQ5A8vOnn0O34QAxCsQg5VuRpEKrA3kHM?=
 =?us-ascii?Q?yF16x8QL3T8MipSpFhWdnrPC/p/JYCeU3NIE8UkNAj7Rja1Uvq2WAUlDuUQG?=
 =?us-ascii?Q?XeJUQWT2TnFRRyp4AQHqw6tqXOIj+m24qaDUuhCwcItB/51GWEFB0vc1EWUN?=
 =?us-ascii?Q?+1e3MLgr9AJclNDuyem+VNVFJWNivkp3TFYiWHCG4XO0hewp9V7VFGexFtQ5?=
 =?us-ascii?Q?AFTC1+AHx7VzoOrz/5gCsyDYIZgt9eNkWH6p1T0KblRciz8vwEaWQfcexaVZ?=
 =?us-ascii?Q?lNVpIDo1kH85Kf0/grcBBjuIE0882BIGmcU94xWc9B7QpkdtPd4pDo7CcE5z?=
 =?us-ascii?Q?a96UG/FHjWCt6Ehu6b9wezRIh0l7vHVkmENy+knyw9dhHuBMuGdrtSlOQ4Fl?=
 =?us-ascii?Q?cteCCzHABy4SiV1m1k11m/jTSIUeWtZ0TFW13g9Z3ITEsaRp0f5C8V0bQTFT?=
 =?us-ascii?Q?Nw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fe48ed0f-4b56-4e8c-0786-08ddae30f667
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 06:25:47.3287
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: seFGE7/GkWwHsZh3Zw4BqlSMyHfkCLUQtfkvzc+GUePwNzq4RhfSWJG88mXUbDPd5wkOXXLaGbMCt7o9vVNixA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8681
X-OriginatorOrg: intel.com


Hello,

for this change, we reported
"[linux-next:master] [lib/test_vmalloc.c]  7fc85b92db: Mem-Info"
in
https://lore.kernel.org/all/202505071555.e757f1e0-lkp@intel.com/

at that time, we made some tests with x86_64 config which runs well.

now we noticed the commit is in mainline now.

the config still has expected diff with parent:

--- /pkg/linux/x86_64-randconfig-161-20250614/gcc-12/7a73348e5d4715b5565a53f21c01ea7b54e46cbd/.config   2025-06-17 14:40:29.481052101 +0800
+++ /pkg/linux/x86_64-randconfig-161-20250614/gcc-12/2d76e79315e403aab595d4c8830b7a46c19f0f3b/.config   2025-06-17 14:41:18.448543738 +0800
@@ -7551,7 +7551,7 @@ CONFIG_TEST_IDA=m
 CONFIG_TEST_MISC_MINOR=m
 # CONFIG_TEST_LKM is not set
 CONFIG_TEST_BITOPS=m
-CONFIG_TEST_VMALLOC=m
+CONFIG_TEST_VMALLOC=y
 # CONFIG_TEST_BPF is not set
 CONFIG_FIND_BIT_BENCHMARK=m
 # CONFIG_TEST_FIRMWARE is not set


then we noticed similar random issue with x86_64 randconfig this time.

7a73348e5d4715b5 2d76e79315e403aab595d4c8830
---------------- ---------------------------
       fail:runs  %reproduction    fail:runs
           |             |             |
           :199         34%          67:200   dmesg.KASAN:null-ptr-deref_in_range[#-#]
           :199         34%          67:200   dmesg.Kernel_panic-not_syncing:Fatal_exception
           :199         34%          67:200   dmesg.Mem-Info
           :199         34%          67:200   dmesg.Oops:general_protection_fault,probably_for_non-canonical_address#:#[##]SMP_KASAN
           :199         34%          67:200   dmesg.RIP:down_read_trylock

we don't have enough knowledge to understand the relationship between code
change and the random issues. just report what we obsverved in our tests FYI.

below is full report.



kernel test robot noticed "Kernel_panic-not_syncing:Fatal_exception" on:

commit: 2d76e79315e403aab595d4c8830b7a46c19f0f3b ("lib/test_vmalloc.c: allow built-in execution")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

[test failed on linus/master      e04c78d86a9699d136910cfc0bdcf01087e3267e]
[test failed on linux-next/master 050f8ad7b58d9079455af171ac279c4b9b828c11]

in testcase: boot

config: x86_64-randconfig-161-20250614
compiler: gcc-12
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202506181351.bba867dd-lkp@intel.com


[   36.902716][   T60] vmalloc_node_range for size 8192 failed: Address range restricted to 0xffffc90000000000 - 0xffffe8ffffffffff
[   36.903981][   T60] vmalloc_test/0: vmalloc error: size 4096, vm_struct allocation failed, mode:0xdc0(GFP_KERNEL|__GFP_ZERO), nodemask=(null)
[   36.905195][   T60] CPU: 1 UID: 0 PID: 60 Comm: vmalloc_test/0 Not tainted 6.15.0-rc6-00142-g2d76e79315e4 #1 VOLUNTARY 
[   36.905201][   T60] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   36.905203][   T60] Call Trace:
[   36.905206][   T60]  <TASK>
[   36.905209][   T60]  dump_stack_lvl+0x87/0xd6
[   36.905223][   T60]  warn_alloc+0x15e/0x291
[   36.905230][   T60]  ? has_managed_dma+0x37/0x37
[   36.905237][   T60]  ? __get_vm_area_node+0x33a/0x3c0
[   36.905244][   T60]  ? __get_vm_area_node+0x33a/0x3c0
[   36.905250][   T60]  __vmalloc_node_range_noprof+0x170/0x306
[   36.905255][   T60]  ? __vmalloc_area_node+0x460/0x460
[   36.905260][   T60]  ? test_func+0x2ae/0x469
[   36.905264][   T60]  __vmalloc_node_noprof+0xb8/0xd9
[   36.905267][   T60]  ? test_func+0x2ae/0x469
[   36.905272][   T60]  align_shift_alloc_test+0xa8/0x165
[   36.905277][   T60]  test_func+0x2ae/0x469
[   36.905281][   T60]  ? pcpu_alloc_test+0x31b/0x31b
[   36.905286][   T60]  ? __kthread_parkme+0xcb/0x1a3
[   36.905293][   T60]  ? pcpu_alloc_test+0x31b/0x31b
[   36.905297][   T60]  kthread+0x452/0x464
[   36.905301][   T60]  ? kthread_is_per_cpu+0x51/0x51
[   36.905304][   T60]  ? _raw_spin_unlock_irq+0x23/0x35
[   36.905308][   T60]  ? kthread_is_per_cpu+0x51/0x51
[ 36.905311][ T60] ? kthread_is_per_cpu (kbuild/obj/consumer/x86_64-randconfig-161-20250614/kernel/kthread.c:413) 
[ 36.905314][ T60] ret_from_fork (kbuild/obj/consumer/x86_64-randconfig-161-20250614/arch/x86/kernel/process.c:153) 
[ 36.905318][ T60] ? kthread_is_per_cpu (kbuild/obj/consumer/x86_64-randconfig-161-20250614/kernel/kthread.c:413) 
[ 36.905321][ T60] ret_from_fork_asm (kbuild/obj/consumer/x86_64-randconfig-161-20250614/arch/x86/entry/entry_64.S:255) 
[   36.905330][   T60]  </TASK>
[   36.905332][   T60] Mem-Info:
[   36.919941][   T60] active_anon:0 inactive_anon:0 isolated_anon:0
[   36.919941][   T60]  active_file:0 inactive_file:0 isolated_file:0
[   36.919941][   T60]  unevictable:41612 dirty:0 writeback:0
[   36.919941][   T60]  slab_reclaimable:7429 slab_unreclaimable:145259
[   36.919941][   T60]  mapped:0 shmem:0 pagetables:145
[   36.919941][   T60]  sec_pagetables:0 bounce:0
[   36.919941][   T60]  kernel_misc_reclaimable:0
[   36.919941][   T60]  free:3233392 free_pcp:1185 free_cma:0
[   36.923830][   T60] Node 0 active_anon:0kB inactive_anon:0kB active_file:0kB inactive_file:0kB unevictable:166448kB isolated(anon):0kB isolated(file):0kB mapped:0kB dirty:0kB writeback:0kB shmem:0kB writeback_tmp:0kB kernel_stack:1952kB pagetables:580kB sec_pagetables:0kB all_unreclaimable? no Balloon:0kB
[   36.926265][   T60] DMA free:15360kB boost:0kB min:16kB low:28kB high:40kB reserved_highatomic:0KB free_highatomic:0KB active_anon:0kB inactive_anon:0kB active_file:0kB inactive_file:0kB unevictable:0kB writepending:0kB present:15992kB managed:15360kB mlocked:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:0kB
[   36.928855][   T60] lowmem_reserve[]: 0 2991 13741 13741
[   36.929411][   T60] DMA32 free:3060560kB boost:0kB min:3224kB low:6244kB high:9264kB reserved_highatomic:0KB free_highatomic:0KB active_anon:0kB inactive_anon:0kB active_file:0kB inactive_file:0kB unevictable:0kB writepending:0kB present:3129216kB managed:3063680kB mlocked:0kB bounce:0kB free_pcp:3120kB local_pcp:3120kB free_cma:0kB
[   36.932080][   T60] lowmem_reserve[]: 0 0 10749 10749
[   36.932604][   T60] Normal free:9857648kB boost:0kB min:11744kB low:22748kB high:33752kB reserved_highatomic:0KB free_highatomic:0KB active_anon:0kB inactive_anon:0kB active_file:0kB inactive_file:0kB unevictable:166448kB writepending:0kB present:13631488kB managed:11007884kB mlocked:0kB bounce:0kB free_pcp:1620kB local_pcp:740kB free_cma:0kB
[   36.935336][   T60] lowmem_reserve[]: 0 0 0 0
[   36.935802][   T60] DMA: 0*4kB 0*8kB 0*16kB 0*32kB 0*64kB 0*128kB 0*256kB 0*512kB 1*1024kB (U) 1*2048kB (U) 3*4096kB (M) = 15360kB
[   36.936931][   T60] DMA32: 0*4kB 0*8kB 1*16kB (M) 2*32kB (M) 2*64kB (M) 1*128kB (M) 2*256kB (M) 2*512kB (M) 1*1024kB (M) 1*2048kB (M) 746*4096kB (M) = 3060560kB
[   36.938318][   T60] Normal: 6*4kB (ME) 2*8kB (ME) 7*16kB (UME) 5*32kB (M) 3*64kB (ME) 4*128kB (M) 6*256kB (UME) 2*512kB (M) 1*1024kB (M) 3*2048kB (UME) 2404*4096kB (M) = 9857528kB
[   36.939849][   T60] 41618 total pagecache pages
[   36.940324][   T60] 4194174 pages RAM
[   36.940721][   T60] 0 pages HighMem/MovableOnly
[   36.941188][   T60] 672443 pages reserved
[   36.941626][   T60] Oops: general protection fault, probably for non-canonical address 0xdffffc000000001b: 0000 [#1] SMP KASAN
[   36.942185][   T60] KASAN: null-ptr-deref in range [0x00000000000000d8-0x00000000000000df]
[   36.942185][   T60] CPU: 1 UID: 0 PID: 60 Comm: vmalloc_test/0 Not tainted 6.15.0-rc6-00142-g2d76e79315e4 #1 VOLUNTARY 
[   36.942185][   T60] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   36.942185][   T60] RIP: 0010:down_read_trylock+0xa7/0x2b9
[   36.942185][   T60] Code: b0 ef 25 91 e8 57 16 40 00 83 3d 9c e6 a7 09 00 0f 85 2c 01 00 00 48 8d 6b 68 b8 ff ff 37 00 48 89 ea 48 c1 e0 2a 48 c1 ea 03 <80> 3c 02 00 74 08 48 89 ef e8 3c 16 40 00 48 3b 5b 68 0f 84 00 01
[   36.942185][   T60] RSP: 0000:ffff88814657f848 EFLAGS: 00010206
[   36.942185][   T60] RAX: dffffc0000000000 RBX: 0000000000000070 RCX: 1ffffffff224bdf6
[   36.942185][   T60] RDX: 000000000000001b RSI: 000000000000000a RDI: 0000000000000070
[   36.942185][   T60] RBP: 00000000000000d8 R08: 0000000000000000 R09: 0000000000000000
[   36.942185][   T60] R10: 0000000000000000 R11: 0000000000000000 R12: 1ffff11028caff0a
[   36.942185][   T60] R13: ffff88814657fa30 R14: dffffc0000000000 R15: 0000000000000000
[   36.942185][   T60] FS:  0000000000000000(0000) GS:ffff88841c1f0000(0000) knlGS:0000000000000000
[   36.942185][   T60] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   36.942185][   T60] CR2: 0000000000000000 CR3: 00000001636e0000 CR4: 00000000000406b0
[   36.942185][   T60] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[   36.942185][   T60] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[   36.942185][   T60] Call Trace:
[   36.942185][   T60]  <TASK>
[   36.942185][   T60]  ? clear_nonspinnable+0x32/0x32
[   36.942185][   T60]  ? vprintk_emit+0x165/0x194
[   36.942185][   T60]  codetag_trylock_module_list+0xd/0x19
[   36.942185][   T60]  alloc_tag_top_users+0x95/0x216
[   36.942185][   T60]  ? _printk+0xad/0xdf
[   36.942185][   T60]  ? reserve_module_tags+0x308/0x308
[   36.942185][   T60]  __show_mem+0x167/0x54b
[   36.942185][   T60]  ? _printk+0xad/0xdf
[   36.942185][   T60]  ? printk_get_console_flush_type+0x272/0x272
[   36.942185][   T60]  ? show_free_areas+0x115d/0x115d
[   36.942185][   T60]  ? tracer_hardirqs_on+0x1b/0x28d
[   36.942185][   T60]  ? dump_stack_lvl+0x91/0xd6
[   36.942185][   T60]  ? warn_alloc+0x251/0x291
[   36.942185][   T60]  warn_alloc+0x251/0x291
[   36.942185][   T60]  ? has_managed_dma+0x37/0x37
[   36.942185][   T60]  ? __get_vm_area_node+0x33a/0x3c0
[   36.942185][   T60]  __vmalloc_node_range_noprof+0x170/0x306
[   36.942185][   T60]  ? __vmalloc_area_node+0x460/0x460
[   36.942185][   T60]  ? test_func+0x2ae/0x469
[   36.942185][   T60]  __vmalloc_node_noprof+0xb8/0xd9
[   36.942185][   T60]  ? test_func+0x2ae/0x469
[   36.942185][   T60]  align_shift_alloc_test+0xa8/0x165
[   36.942185][   T60]  test_func+0x2ae/0x469
[   36.942185][   T60]  ? pcpu_alloc_test+0x31b/0x31b
[   36.942185][   T60]  ? __kthread_parkme+0xcb/0x1a3
[   36.942185][   T60]  ? pcpu_alloc_test+0x31b/0x31b
[   36.942185][   T60]  kthread+0x452/0x464
[   36.942185][   T60]  ? kthread_is_per_cpu+0x51/0x51
[   36.942185][   T60]  ? _raw_spin_unlock_irq+0x23/0x35
[   36.942185][   T60]  ? kthread_is_per_cpu+0x51/0x51
[   36.942185][   T60]  ret_from_fork+0x20/0x54
[   36.942185][   T60]  ? kthread_is_per_cpu+0x51/0x51
[   36.942185][   T60]  ret_from_fork_asm+0x11/0x20
[   36.942185][   T60]  </TASK>
[   36.942185][   T60] Modules linked in:
[   37.000652][   T60] ---[ end trace 0000000000000000 ]---
[   37.001188][   T60] RIP: 0010:down_read_trylock+0xa7/0x2b9
[   37.001731][   T60] Code: b0 ef 25 91 e8 57 16 40 00 83 3d 9c e6 a7 09 00 0f 85 2c 01 00 00 48 8d 6b 68 b8 ff ff 37 00 48 89 ea 48 c1 e0 2a 48 c1 ea 03 <80> 3c 02 00 74 08 48 89 ef e8 3c 16 40 00 48 3b 5b 68 0f 84 00 01
[   37.003488][   T60] RSP: 0000:ffff88814657f848 EFLAGS: 00010206
[   37.004072][   T60] RAX: dffffc0000000000 RBX: 0000000000000070 RCX: 1ffffffff224bdf6
[   37.004848][   T60] RDX: 000000000000001b RSI: 000000000000000a RDI: 0000000000000070
[   37.005610][   T60] RBP: 00000000000000d8 R08: 0000000000000000 R09: 0000000000000000
[   37.006381][   T60] R10: 0000000000000000 R11: 0000000000000000 R12: 1ffff11028caff0a
[   37.007178][   T60] R13: ffff88814657fa30 R14: dffffc0000000000 R15: 0000000000000000
[   37.007940][   T60] FS:  0000000000000000(0000) GS:ffff88841c1f0000(0000) knlGS:0000000000000000
[   37.008792][   T60] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   37.009411][   T60] CR2: 0000000000000000 CR3: 00000001636e0000 CR4: 00000000000406b0
[   37.010175][   T60] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[   37.010950][   T60] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[   37.011716][   T60] Kernel panic - not syncing: Fatal exception
[   37.012397][   T60] Kernel Offset: 0x6200000 from 0xffffffff81000000 (relocation range: 0xffffffff80000000-0xffffffffbfffffff)


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250618/202506181351.bba867dd-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

