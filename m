Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB01223DC5
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 06:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747377417; cv=fail; b=XpXM1U4Bz+w0t8tzIfMEHjcv+vzZdgkbsqEfieHPBRq0PQFzmKRAUefyvLLu8jL/s6UOslKNbp3wAvrlJEtYlLrXncihm64E+OrlFUIUFY3ZOkEnqFcE8JXcjLywt0PADJeOJ+ik+U3XDsIhR/8CBfxA1Vd/L5DsAW8SZmeQiJ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747377417; c=relaxed/simple;
	bh=NNs69ZA92mk9RtuI2QHSMCU4xrfXzznT77Kp7AUzPuQ=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=KFE29ShBC/RkX34BJZHQZqshKj+Nv/8cTraY23z4lTy0wwMGl9uB8GUlu+cbkQwAalA95rOIcKlzBJhkeR0rVFL3IQC7xcRgYAzZsO5mfGeQ5Wx0ordihXrbSGSu2j5VqHSUaDRnn0lcHAIhDnwCDQGl7Ac7tI6vFOatKG9/UfQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NhvgWAeL; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NhvgWAeL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747377416; x=1778913416;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NNs69ZA92mk9RtuI2QHSMCU4xrfXzznT77Kp7AUzPuQ=;
  b=NhvgWAeLp80dqhVojGK5q3731D2L5PjhscPGjapLqLtNcDZ0NmnlQwjM
   GHu2rGQ0hUluN4osx5KJklorSxYsc2FEXW9yaOm3FSXqTQFwduBlf38K9
   QFE0qsVbOYFSIWp9/HgJ6MVbILQMBsQPcezGh+NO0K6UN6sP1a7KMI/Y3
   xmarnlHL9VU+D1ZQGp04esqVB1hjmuOfAKSdmTEDeAeLFQEcgFJBtK463
   BTY53aNiKL7n2LFxh9Lm+iRrM9GyhuOk6KxDmWMPZh/W9TuHu9kvp5XHO
   9sxCE7GlGoGj5LTZTaMo6XgCJU2/Bf3jxAJI3W1JnPUtheyMBmSiHBep3
   w==;
X-CSE-ConnectionGUID: fR3eF5qZSqSzjdoI7rnyIw==
X-CSE-MsgGUID: UCX/2K1STO+MniIDNF9gDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="66742925"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="66742925"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 23:36:55 -0700
X-CSE-ConnectionGUID: qPvl3Z3ERXmuEQZaQ12fmg==
X-CSE-MsgGUID: ZATTKidGSIamqsrY4qVjOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="139606520"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 23:36:54 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 15 May 2025 23:36:53 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 15 May 2025 23:36:53 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 15 May 2025 23:36:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wtjfQyTwm2roI0O2hkFLmVGvV/VbSfgR1dnHAv/G6n953BZfzUy+cMR2ohKvAr+oHQDRE75Fl2+1teKWrMSGIwHoCKwI8jwt2PnaeH1wCQtPVayZAoaYu5IN2giPu6zWgY4FgOy+rcuDehYTx9yaxzfvxQLjH7wXDwwUjVvjkMXNL0LcB54TWEXCYiPsaFdJMd4b4DS5OVtei9JRT4TeKpnmAxYILVNSXHMYlkrvJP7nYmHIfwShj/3wRtM1Q53gv7k/BKgJ5/uC7hASJAvz541YX+oHfX7x+GralVGxaMRBUBc103keMFw15pgkKdW0Lo0/o5UevTiwnSGslhq/RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=REFA0rx99AEH7951qXLhYbEPeTMflhz2u8snhcKiQhU=;
 b=adgYHKcO7Myg2WWPACP70uX5wLwVDQyQ42AQ6PpfeZIHCUD4OT7nL7vVFo/NsG/nqeYO16Rq3VxRs7h5QkZeJJrOFUeNediDYHWstOuPZzfkUcOianiPGs13G0WmlaRARXC/hvt/fAgb1cZ8xS8kEx2vMwiXC3uM5pDuniI0se/Oyp2GLePyzEL7Y/IQOs6JzSTS2yl+Wy1pukdLD4G9tss9C4eeqRFQbrYZ+7sbl1egGqy4LTvGipHaIzznUY7a3m4wEPi5wQFpLDrSScaNQot5FPCjQ5f3++6UOhJRhK6akrhlnLATSlCjVu53Fkw07L5eS1MGfiSpZeeSZaky1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by IA1PR11MB6540.namprd11.prod.outlook.com (2603:10b6:208:3a0::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Fri, 16 May
 2025 06:36:51 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.8722.027; Fri, 16 May 2025
 06:36:51 +0000
Date: Fri, 16 May 2025 14:36:39 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Kairui Song <kasong@tencent.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>, Baolin Wang
	<baolin.wang@linux.alibaba.com>, Baoquan He <bhe@redhat.com>, Barry Song
	<v-songbaohua@oppo.com>, Chris Li <chrisl@kernel.org>, "Huang, Ying"
	<ying.huang@linux.alibaba.com>, Hugh Dickins <hughd@google.com>, "Johannes
 Weiner" <hannes@cmpxchg.org>, Kalesh Singh <kaleshsingh@google.com>, "Matthew
 Wilcow" <willy@infradead.org>, Nhat Pham <nphamcs@gmail.com>, Yosry Ahmed
	<yosryahmed@google.com>, <linux-mm@kvack.org>, <oliver.sang@intel.com>
Subject: [linus:master] [mm, swap]  b487a2da35:
 BUG:soft_lockup-CPU##stuck_for#s![stress-ng-swap:#]
Message-ID: <202505161438.9009cf47-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2P153CA0037.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::6)
 To LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|IA1PR11MB6540:EE_
X-MS-Office365-Filtering-Correlation-Id: 58b99233-4329-467c-c094-08dd94440a78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/CUJw4zIzJsC68VGn7vmc8r2eCHOtC9qkWxIguYrWntAndQIc+egE3+rkpfR?=
 =?us-ascii?Q?+k49ftx1IL9Hr+pcD3eGYQj+7y2b4fKIsabSzD6k6xtDv5U146kIU4Ld4K5E?=
 =?us-ascii?Q?2G8g4AE+95+mSCAup5OK1dMGB1mzJQ/fwVp23W/VSXjhVwKQzThyq7efd93V?=
 =?us-ascii?Q?R2o9L1dffmrAgNMS8RcITXst7SOgKHtJHbW88BtXdG6Qx1Rd1sfYupkGYRyS?=
 =?us-ascii?Q?5k1orRqbX6nuvhGVowx5A4vOk9a6yB+SEcWQwdm+HVghN0zxE01a0iT9JaRt?=
 =?us-ascii?Q?1iNtuBWtOWUH/ctRWuv6n5ahdqsYQjUlCYxDFiHW5y+bUtzklOv8SMuYWT+U?=
 =?us-ascii?Q?LrMqYcA628EZ2H2JioAAC6vdm8Lr4QxGgQJErxFrXNxpuvwCMIOiVBpLXmNh?=
 =?us-ascii?Q?AHM3rI9fAe9iEEGvNrNyUfCuUNaMEtdariEiGsth+53FeABSns2XJw1b38sA?=
 =?us-ascii?Q?ZARhOjig3MSQNfPzSc1JpmqgUzCvhgESev4a8wE3nCl08JYTu1lslIX7uAbT?=
 =?us-ascii?Q?H1+pI7YrwKRGiOlCKPafMF2iE0VYmpDr4A9HrhAe5SHre3bRVP3cy1YE86N2?=
 =?us-ascii?Q?w3B/TexFc3jleDj9HsNGTHENuaqnx2mLKC9Z1+/y+UH0YQS2g8f5tNtIkozk?=
 =?us-ascii?Q?DPZ5DmIP3QQMV0Vl2fmYbWoqVfwxL1+JRCTKUtNoEclZ0102klHVPpFg3gKm?=
 =?us-ascii?Q?5h7/IcgnZoVPCCy8ziMcmU+wr2l6ZEIq80eheiXrZUddEEvNISHqnQkY7N9L?=
 =?us-ascii?Q?ETcR2kOm7LK2pu0zgnpWdBUeMCaHCfqfhpBtdRYn+L5kMkk20Gox2KePeid/?=
 =?us-ascii?Q?sCA9BtO4Jm17ciO1ZF2B3KlAl+ekmpvBHIWT7cozd/heavNys98Tyu2+6XLj?=
 =?us-ascii?Q?Njqa7kLIZIjuLqZCmjP0cmf+BKBuIY9sz19DYJcpkskVjO3V/PEA/HsfpUqL?=
 =?us-ascii?Q?gj8PVQB46R6E+zfNsI1w5+syeVKLx2sP35RDCLq3zPaHUD8hkfQuXwwctPrd?=
 =?us-ascii?Q?YZy2wq66f093FJNzS3CQyff/qP27maDkfn2Q55ta/es971GVuE+hhnOk9Yly?=
 =?us-ascii?Q?VputH6F79/ncw8erMLU15k7kdMsSJharE7Lm6kpm8C/mgKVlZiaEldQnnYEn?=
 =?us-ascii?Q?JasxeevyEsBjgauXIfJtUkZ/JmAzOsX/tLCu1BYigPhkigGbCqNY3zDOESn/?=
 =?us-ascii?Q?6cwF3vDCXwl7tYhFXGBJ3DJ0ILbVzBFdxerIVcCBhCu1m11WQOyST0StsvEy?=
 =?us-ascii?Q?fBoRFfdof8Sd2a+ezjy+W0BhbvVxAmXiK8RIVKQgf9PX1nOVvA5/rNIX7oVY?=
 =?us-ascii?Q?qziXMT78SMHUHqmj6xaToK2TazWNob1kbhi63p/yUqgybbM7716V+hKdJ+YC?=
 =?us-ascii?Q?QTWgabJB+1ZqLB35wvDdxp/xz4Ss?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fNfXYf4p1mOr+2R8buDig+2NfoBMmEmHBriNTZX7/ET1T2CfXUtGOYGlESzG?=
 =?us-ascii?Q?TLR9StEEQTZ1pKGnlQPhRZDFAD2GCKt7co+M2lXTtUlvY39KjYFhY2LtuIwJ?=
 =?us-ascii?Q?hyHJzswErdw+Hhbr24z6JQ3h1hioSB+MJKxZDh9QWxb2TyeCfcFVQFuciTv6?=
 =?us-ascii?Q?Bdnzodnf4FpuGLb9zWxHb6qeM6y2wo+UXJWh6xwZ3hxAd8DwmlnYP0gTsLc1?=
 =?us-ascii?Q?SGyjkmyn0Fm0uWhHx9/YFQDF7FtpLBCKWngrKE/gVe+/JKmFYNWL5ZUOcJRY?=
 =?us-ascii?Q?r1zRfexKX8L3Zxi7dfZdcmzLiZcQqPQStSW68Iv08zMEUcc1tNVnyoOh7dxr?=
 =?us-ascii?Q?hT+zBBVdbTJKs154KGUSzxw9Itgz3+2808R7SuKDNwYB6hh0zSiKNkYuEQ9h?=
 =?us-ascii?Q?p/tazgvtu32y30CpBgG1sUxDvzo8RFIPuRyb8ZlU97v/UWgZdr15nnYwws4R?=
 =?us-ascii?Q?kHWdq+vap2ajBjl3e8o1lIi0vLl26rf3HbhgMCYOT8wzEYKBEg3GrYJg77Sb?=
 =?us-ascii?Q?5qe5tmKM2A9mSIr1mkq10Jfu6nWfdHhGMHMAOA/yIXoJorhuDdE78QEVaaP3?=
 =?us-ascii?Q?hX4zjJ+Qm67GF8HPERucqsdwOOyEdRmpVYbV0TvaBIIHKfX0aVsN9Xu0lI2o?=
 =?us-ascii?Q?ROa6nfO/P85U9v6sIUbMUR3ahOE7dfISM9fg/QoNj1mF7hOKxM1n1JoFwrH5?=
 =?us-ascii?Q?uJq1jaxY9o6mpTsOsE5sVWQmzHHw1/GiJMVj63+3GpgxU+yA0YvX65vvzLJo?=
 =?us-ascii?Q?4UUTgef1G4RU5e4brqpVHnZDnxtWv+awtd5oNpbgqttMH0n/F/t05igmzyxn?=
 =?us-ascii?Q?89AsCjBhIdbFqM8XM4Wus/DbD/n+HtiR0T4dQVkHW+aEyZJqr6hapUvtluJE?=
 =?us-ascii?Q?f20FenS3sVYmFHag4QoIAV2N0xzOUguoHD2zIyXOvW6xJl4qEwYcR0LhMTsX?=
 =?us-ascii?Q?+6P11LNfJ7ljoZHguTFryaNJ1agfnSRIC4NPZj1Q3ipmB+fZL6msAB1NuzbG?=
 =?us-ascii?Q?6c+WU41NR5znap8L1T74QedqQ0nG20/L4F18X/m93gUkvpCgtl3VN2OhSztR?=
 =?us-ascii?Q?pM2XKZTnLLEu/HHujiSpjlslX8gv9/Guk+M4NMJ4PiZ8bjVcs0K2R46GZLMK?=
 =?us-ascii?Q?vHSdlzMZHii2VNiEWY/RZARp2/yoBAn28SFwa7z2C2Nmve4YdHriVrUZkZF8?=
 =?us-ascii?Q?IqZaM7fksX7XpL3T4yu6C3GbdplDM90IRhtnaIUEKo8zO1RzGa19JBf3T3TA?=
 =?us-ascii?Q?nJX80NKRuuklb1eRUHSZUmbPOxobjacGmxyQeTICUshwosS/hCmY9CADtYOB?=
 =?us-ascii?Q?53m1GDntfdY3zpU6s2irNiMKKsp+5MA062/LcJUg11WzkThh63a7BSC/QyZw?=
 =?us-ascii?Q?C2ukqPKZyGTcp6DBzUFaQCLuLV+0hKRO1OTwZR25djZ7eJK/si4Na1BHglu5?=
 =?us-ascii?Q?iFRUO1ZfV/mOcl4vM7AKJLX9frfW0UlPRWqu4/P8cCnh1Wy32EDgXHTbS/rG?=
 =?us-ascii?Q?4D0ttxadCmwe2sggDNxEtZHVKEks0yxe8ScZJPRcKJ8vaOZ92r5rGYSN6DFQ?=
 =?us-ascii?Q?dX2vLkhjrgqVs1j8CNqj8k3pGKrJyTCwzM+my3Wmb44cggxttq7CyISVRGEg?=
 =?us-ascii?Q?ZA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 58b99233-4329-467c-c094-08dd94440a78
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 06:36:51.2083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 17pcdpj5mcyBMK9T+yoo3598Q1MqnWwTSHHZxnKLLpsLHyQyFEUFc7LdPPlEdiMBx3q5QXql6DrqUde+Yb/GGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6540
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "BUG:soft_lockup-CPU##stuck_for#s![stress-ng-swap:#]" on:

commit: b487a2da3575b6cdfb6d6559311830c8fea70bb9 ("mm, swap: simplify folio swap allocation")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

[test failed on linus/master      fee3e843b309444f48157e2188efa6818bae85cf]
[test failed on linux-next/master 484803582c77061b470ac64a634f25f89715be3f]

in testcase: stress-ng
version: stress-ng-x86_64-f76f86ffb-1_20250412
with following parameters:

	nr_threads: 100%
	disk: 1HDD
	testtime: 60s
	fs: xfs
	test: swap
	cpufreq_governor: performance



config: x86_64-rhel-9.4
compiler: gcc-12
test machine: 64 threads 2 sockets Intel(R) Xeon(R) Gold 6346 CPU @ 3.10GHz (Ice Lake) with 256G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202505161438.9009cf47-lkp@intel.com


[   76.825919][   C17] watchdog: BUG: soft lockup - CPU#17 stuck for 26s! [stress-ng-swap:3017]
[   76.825921][   C17] Modules linked in: xfs ipmi_ssif intel_rapl_msr intel_rapl_common intel_uncore_frequency intel_uncore_frequency_common i10nm_edac skx_edac_common nfit libnvdimm x86_pkg_temp_thermal coretemp kvm_intel btrfs kvm sd_mod sg snd_pcm blake2b_generic ghash_clmulni_intel xor dax_hmem ast raid6_pq snd_timer rapl cxl_acpi drm_client_lib ahci intel_cstate cxl_port drm_shmem_helper snd libahci cxl_core intel_th_gth nvme acpi_power_meter isst_if_mbox_pci isst_if_mmio soundcore intel_th_pci mei_me intel_uncore ioatdma i2c_i801 megaraid_sas ipmi_si einj acpi_ipmi pcspkr libata drm_kms_helper nvme_core mei isst_if_common intel_th intel_pch_thermal i2c_smbus intel_vsec dca wmi ipmi_devintf ipmi_msghandler joydev binfmt_misc drm fuse dm_mod loop ip_tables
[   76.825949][   C17] CPU: 17 UID: 0 PID: 3017 Comm: stress-ng-swap Not tainted 6.14.0-rc6-00228-gb487a2da3575 #1
[   76.825951][   C17] Hardware name: Inspur NF5180M6/NF5180M6, BIOS 06.00.04 04/12/2022
[ 76.825952][ C17] RIP: 0010:shmem_unuse (include/linux/list.h:119 include/linux/list.h:215 include/linux/list.h:287 mm/shmem.c:1497) 
[ 76.825959][ C17] Code: 30 48 8d 6b 30 4c 8d 60 d0 48 81 fd 20 e3 26 83 0f 84 8a 00 00 00 48 83 7b 18 00 75 89 48 8b 43 38 48 8b 53 30 48 39 28 75 6c <48> 39 6a 08 75 66 48 89 42 08 48 89 10 48 89 6b 30 48 89 6b 38 4c
All code
========
   0:	30 48 8d             	xor    %cl,-0x73(%rax)
   3:	6b 30 4c             	imul   $0x4c,(%rax),%esi
   6:	8d 60 d0             	lea    -0x30(%rax),%esp
   9:	48 81 fd 20 e3 26 83 	cmp    $0xffffffff8326e320,%rbp
  10:	0f 84 8a 00 00 00    	je     0xa0
  16:	48 83 7b 18 00       	cmpq   $0x0,0x18(%rbx)
  1b:	75 89                	jne    0xffffffffffffffa6
  1d:	48 8b 43 38          	mov    0x38(%rbx),%rax
  21:	48 8b 53 30          	mov    0x30(%rbx),%rdx
  25:	48 39 28             	cmp    %rbp,(%rax)
  28:	75 6c                	jne    0x96
  2a:*	48 39 6a 08          	cmp    %rbp,0x8(%rdx)		<-- trapping instruction
  2e:	75 66                	jne    0x96
  30:	48 89 42 08          	mov    %rax,0x8(%rdx)
  34:	48 89 10             	mov    %rdx,(%rax)
  37:	48 89 6b 30          	mov    %rbp,0x30(%rbx)
  3b:	48 89 6b 38          	mov    %rbp,0x38(%rbx)
  3f:	4c                   	rex.WR

Code starting with the faulting instruction
===========================================
   0:	48 39 6a 08          	cmp    %rbp,0x8(%rdx)
   4:	75 66                	jne    0x6c
   6:	48 89 42 08          	mov    %rax,0x8(%rdx)
   a:	48 89 10             	mov    %rdx,(%rax)
   d:	48 89 6b 30          	mov    %rbp,0x30(%rbx)
  11:	48 89 6b 38          	mov    %rbp,0x38(%rbx)
  15:	4c                   	rex.WR
[   76.825961][   C17] RSP: 0018:ffa00000232ffce0 EFLAGS: 00000246
[   76.825964][   C17] RAX: ff110020c063bde0 RBX: ff110020c063bdb0 RCX: 0000000000000006
[   76.825965][   C17] RDX: ff110020c063bde0 RSI: 0000000000000000 RDI: ff110020c063be2c
[   76.825966][   C17] RBP: ff110020c063bde0 R08: ffffffffffffffc0 R09: 0000000000000000
[   76.825967][   C17] R10: 000000000000ffff R11: ffa000000cafa000 R12: ff110020c063bdb0
[   76.825968][   C17] R13: ff110020c063be2c R14: 0000000000000014 R15: ff110020c063bdb0
[   76.825969][   C17] FS:  00007fcb691d2580(0000) GS:ff11003fbac80000(0000) knlGS:0000000000000000
[   76.825970][   C17] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   76.825971][   C17] CR2: 00007fcb6490f000 CR3: 00000001897e4006 CR4: 0000000000773ef0
[   76.825972][   C17] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[   76.825973][   C17] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[   76.825973][   C17] PKRU: 55555554
[   76.825974][   C17] Call Trace:
[   76.825975][   C17]  <IRQ>
[ 76.825976][ C17] ? watchdog_timer_fn (kernel/watchdog.c:770) 
[ 76.825980][ C17] ? __pfx_watchdog_timer_fn (kernel/watchdog.c:685) 
[ 76.825981][ C17] ? __hrtimer_run_queues (kernel/time/hrtimer.c:1801 kernel/time/hrtimer.c:1865) 
[ 76.825985][ C17] ? hrtimer_interrupt (kernel/time/hrtimer.c:1930) 
[ 76.825986][ C17] ? __sysvec_apic_timer_interrupt (arch/x86/kernel/apic/apic.c:1038 arch/x86/kernel/apic/apic.c:1055) 
[ 76.825989][ C17] ? sysvec_apic_timer_interrupt (arch/x86/kernel/apic/apic.c:1049 arch/x86/kernel/apic/apic.c:1049) 
[   76.825992][   C17]  </IRQ>
[   76.825992][   C17]  <TASK>
[ 76.825993][ C17] ? asm_sysvec_apic_timer_interrupt (arch/x86/include/asm/idtentry.h:702) 
[ 76.825997][ C17] ? shmem_unuse (include/linux/list.h:119 include/linux/list.h:215 include/linux/list.h:287 mm/shmem.c:1497) 
[ 76.825999][ C17] try_to_unuse (mm/swapfile.c:2295) 
[ 76.826003][ C17] __do_sys_swapoff (mm/swapfile.c:2736) 
[ 76.826005][ C17] do_syscall_64 (arch/x86/entry/common.c:52 arch/x86/entry/common.c:83) 
[ 76.826008][ C17] ? __rseq_handle_notify_resume (kernel/rseq.c:420) 
[ 76.826012][ C17] ? syscall_exit_to_user_mode (include/linux/rseq.h:38 include/linux/resume_user_mode.h:62 kernel/entry/common.c:114 include/linux/entry-common.h:329 kernel/entry/common.c:207 kernel/entry/common.c:218) 
[ 76.826013][ C17] ? do_syscall_64 (arch/x86/entry/common.c:102) 
[ 76.826015][ C17] ? __perf_sw_event (kernel/events/internal.h:229 kernel/events/core.c:10210 kernel/events/core.c:10235) 
[ 76.826016][ C17] ? handle_mm_fault (include/linux/perf_event.h:1503 mm/memory.c:6106 mm/memory.c:6233) 
[ 76.826020][ C17] ? do_user_addr_fault (arch/x86/mm/fault.c:1338) 
[ 76.826022][ C17] ? clear_bhb_loop (arch/x86/entry/entry_64.S:1538) 
[ 76.826024][ C17] ? clear_bhb_loop (arch/x86/entry/entry_64.S:1538) 
[ 76.826026][ C17] ? clear_bhb_loop (arch/x86/entry/entry_64.S:1538) 
[ 76.826028][ C17] entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:130) 
[   76.826030][   C17] RIP: 0033:0x7fcb69976fc7
[ 76.826031][ C17] Code: 73 01 c3 48 8b 0d 39 2e 0d 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 b8 a8 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 09 2e 0d 00 f7 d8 64 89 01 48
All code
========
   0:	73 01                	jae    0x3
   2:	c3                   	ret
   3:	48 8b 0d 39 2e 0d 00 	mov    0xd2e39(%rip),%rcx        # 0xd2e43
   a:	f7 d8                	neg    %eax
   c:	64 89 01             	mov    %eax,%fs:(%rcx)
   f:	48 83 c8 ff          	or     $0xffffffffffffffff,%rax
  13:	c3                   	ret
  14:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  1b:	00 00 00 
  1e:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  23:	b8 a8 00 00 00       	mov    $0xa8,%eax
  28:	0f 05                	syscall
  2a:*	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax		<-- trapping instruction
  30:	73 01                	jae    0x33
  32:	c3                   	ret
  33:	48 8b 0d 09 2e 0d 00 	mov    0xd2e09(%rip),%rcx        # 0xd2e43
  3a:	f7 d8                	neg    %eax
  3c:	64 89 01             	mov    %eax,%fs:(%rcx)
  3f:	48                   	rex.W

Code starting with the faulting instruction
===========================================
   0:	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax
   6:	73 01                	jae    0x9
   8:	c3                   	ret
   9:	48 8b 0d 09 2e 0d 00 	mov    0xd2e09(%rip),%rcx        # 0xd2e19
  10:	f7 d8                	neg    %eax
  12:	64 89 01             	mov    %eax,%fs:(%rcx)
  15:	48                   	rex.W
[   76.826032][   C17] RSP: 002b:00007ffd6d92dbd8 EFLAGS: 00000206 ORIG_RAX: 00000000000000a8
[   76.826033][   C17] RAX: ffffffffffffffda RBX: 0000000000000019 RCX: 00007fcb69976fc7
[   76.826034][   C17] RDX: fffffffffffffccc RSI: 000000000003d000 RDI: 00007ffd6d92e690
[   76.826035][   C17] RBP: 00007fcb64910000 R08: 0000000000000007 R09: 0000559500e1f530
[   76.826036][   C17] R10: c7c9ff097bf742d3 R11: 0000000000000206 R12: 00007fcb691d2180
[   76.826036][   C17] R13: 00007ffd6d92e690 R14: 0000000000000001 R15: 0000000000000000
[   76.826037][   C17]  </TASK>
[   76.826038][   C17] Kernel panic - not syncing: softlockup: hung tasks
[   77.239533][   C17] CPU: 17 UID: 0 PID: 3017 Comm: stress-ng-swap Tainted: G             L     6.14.0-rc6-00228-gb487a2da3575 #1
[   77.251353][   C17] Tainted: [L]=SOFTLOCKUP
[   77.255672][   C17] Hardware name: Inspur NF5180M6/NF5180M6, BIOS 06.00.04 04/12/2022
[   77.263635][   C17] Call Trace:
[   77.266915][   C17]  <IRQ>
[ 77.269756][ C17] panic (kernel/panic.c:354) 
[ 77.273643][ C17] watchdog_timer_fn (kernel/watchdog.c:735) 
[ 77.278568][ C17] ? __pfx_watchdog_timer_fn (kernel/watchdog.c:685) 
[ 77.284015][ C17] __hrtimer_run_queues (kernel/time/hrtimer.c:1801 kernel/time/hrtimer.c:1865) 
[ 77.289201][ C17] hrtimer_interrupt (kernel/time/hrtimer.c:1930) 
[ 77.294040][ C17] __sysvec_apic_timer_interrupt (arch/x86/kernel/apic/apic.c:1038 arch/x86/kernel/apic/apic.c:1055) 
[ 77.299835][ C17] sysvec_apic_timer_interrupt (arch/x86/kernel/apic/apic.c:1049 arch/x86/kernel/apic/apic.c:1049) 
[   77.305454][   C17]  </IRQ>
[   77.308382][   C17]  <TASK>
[ 77.311313][ C17] asm_sysvec_apic_timer_interrupt (arch/x86/include/asm/idtentry.h:702) 
[ 77.317275][ C17] RIP: 0010:shmem_unuse (include/linux/list.h:119 include/linux/list.h:215 include/linux/list.h:287 mm/shmem.c:1497) 
[ 77.322373][ C17] Code: 30 48 8d 6b 30 4c 8d 60 d0 48 81 fd 20 e3 26 83 0f 84 8a 00 00 00 48 83 7b 18 00 75 89 48 8b 43 38 48 8b 53 30 48 39 28 75 6c <48> 39 6a 08 75 66 48 89 42 08 48 89 10 48 89 6b 30 48 89 6b 38 4c
All code
========
   0:	30 48 8d             	xor    %cl,-0x73(%rax)
   3:	6b 30 4c             	imul   $0x4c,(%rax),%esi
   6:	8d 60 d0             	lea    -0x30(%rax),%esp
   9:	48 81 fd 20 e3 26 83 	cmp    $0xffffffff8326e320,%rbp
  10:	0f 84 8a 00 00 00    	je     0xa0
  16:	48 83 7b 18 00       	cmpq   $0x0,0x18(%rbx)
  1b:	75 89                	jne    0xffffffffffffffa6
  1d:	48 8b 43 38          	mov    0x38(%rbx),%rax
  21:	48 8b 53 30          	mov    0x30(%rbx),%rdx
  25:	48 39 28             	cmp    %rbp,(%rax)
  28:	75 6c                	jne    0x96
  2a:*	48 39 6a 08          	cmp    %rbp,0x8(%rdx)		<-- trapping instruction
  2e:	75 66                	jne    0x96
  30:	48 89 42 08          	mov    %rax,0x8(%rdx)
  34:	48 89 10             	mov    %rdx,(%rax)
  37:	48 89 6b 30          	mov    %rbp,0x30(%rbx)
  3b:	48 89 6b 38          	mov    %rbp,0x38(%rbx)
  3f:	4c                   	rex.WR


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250516/202505161438.9009cf47-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

