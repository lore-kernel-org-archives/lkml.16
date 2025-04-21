Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E4220E6E2
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 07:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745221234; cv=fail; b=TU/uZuGNq3bzmlisCX7qkzNcKMa4VU8yKnS6hCj6KygoNZpDMRka5Ld71p+/KGH8CfWupKamx/IZBJKhRJO3+5EwPtRGipBZf68nsAr0caDKscqHDQWMeuc1fVdeiJ/28/vmNmJ2DMmR4xbpCko0I/Ws05KMeRj1stvT+bB8JLQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745221234; c=relaxed/simple;
	bh=AX3H6gryjUjn5UdAhSKZAffPHQQohdfYlIRDGVor6fQ=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=B0ZbneXacCXBQAQVNNz8qaVlzcv39fJLYrBv3idmvCQ73XunuipRyImUNyfWdXGWarzDIXrveD7uk4ZuQ60CZltSwvFEaxpCK+Wk6YkgF5gBGg1JGBR/waDT9AqqkJJ6sz7WLlZBIJOiRCuDFhsXZRPU2T+BYob46erPSA408OE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q1iKUbsk; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q1iKUbsk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745221233; x=1776757233;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AX3H6gryjUjn5UdAhSKZAffPHQQohdfYlIRDGVor6fQ=;
  b=Q1iKUbskOhrwvAoszS5iaPxEMTX1iOc193fFAdovEUgRLpzgSpDe02MX
   EeyAXkNGrunPcG/yYbGnzJqbzjt7gB2+wzvtrHMGlPxGS2H9PwbFtMdFa
   Fh9xor4bHCS9Frz2qGN/tuq4Kj4mCW9RgVY5e9asiaSihDJVjG001MZxt
   CNebKqxZx6LUc2ATJ/0hMElsczloZ91aENXrJoOYck+gFPtXLASHy3F94
   ZKiHKURzhJKZz8I2s7EbBynZmDmmckUVghhbMdRDiTGAGJcKuvF9koOz5
   QXw80m0Mu42GdPYx2WaNd9LKRbU9uuu6ZcXGpQFl5p7vW4us7RUVpOyeJ
   w==;
X-CSE-ConnectionGUID: BhZr4wDeRi2Cv0pcgO/8BA==
X-CSE-MsgGUID: OSU2s6/KREG6h+rsmeOfhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11409"; a="57397271"
X-IronPort-AV: E=Sophos;i="6.15,227,1739865600"; 
   d="scan'208";a="57397271"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2025 00:40:32 -0700
X-CSE-ConnectionGUID: m89+8rPqSvSLObKdMnagEQ==
X-CSE-MsgGUID: XGFG7zuVRuGtkoo7HiZkUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,227,1739865600"; 
   d="scan'208";a="132174175"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2025 00:40:32 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 21 Apr 2025 00:40:31 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 21 Apr 2025 00:40:31 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 21 Apr 2025 00:40:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZNrJ+J2gw4DigMoJqcaq+iL7dHCKod9JWZ6Rdz8sPKfr5hwKMSfyLGyoF9QSnTVdoe191EgYy7N91nPaLO0ZHsrEMEG+jI72k+fJciAZkbci+SKH8cpBbNcOeohFXFby9cRL86UsHj/Q1jSpbmShgZE26q2Ep56ppf0Yn+Cx4uKdNrj85dt1cIjjg228v42XPNRdlSI8JsvuE7qN1Hq0CeXVObRNjjnXzXQKVV9BksFXVUz60TYsZW90sVvbvU3RypAKMysfLc3NgtfOtA3xsi7BMEPoSRktcAgydomFbhR0w6C2DwP65D9tOh56khnzc0nGxRIYYtrIBIiAbNTk8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fgcdSZp8igdZLsVZ0f7rA0n0XV7qDcSccKX/d4llrsM=;
 b=xwW0dGrKy6hD3FkweVzFIzWdJ348Kz+btPYDEp9sV4mUs6JyKVHjMUgS08QLnHjNZNhuFMOgNCCwOKNBCGRaobtUtNwhZKKwlgiEaNRkBa7IfzfvaojKMD0d5i4/VbBfH5TjFEAUv0B4VbkZyAl+cKgQJYHkIyJnomkuu7kuhp08bYglRaQaVbtkxvBi+KHVqjLsB9V/cJuFJ57ZI9INl+5EAwRB+Q/6Z3fusElCOL1xXqqdidwK5VPilyWKTAywpr0cWuz3UfiLth+CxSiEzuRUdjQlP/MFyjxUr4ltGC3xJyshcItfyQ5Y3uP3V378ICeELmsbnULjfR4isFUBWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8587.namprd11.prod.outlook.com (2603:10b6:a03:568::21)
 by SA1PR11MB6845.namprd11.prod.outlook.com (2603:10b6:806:29f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.31; Mon, 21 Apr
 2025 07:39:48 +0000
Received: from SJ2PR11MB8587.namprd11.prod.outlook.com
 ([fe80::4050:8bc7:b7c9:c125]) by SJ2PR11MB8587.namprd11.prod.outlook.com
 ([fe80::4050:8bc7:b7c9:c125%6]) with mapi id 15.20.8655.033; Mon, 21 Apr 2025
 07:39:48 +0000
Date: Mon, 21 Apr 2025 15:39:41 +0800
From: kernel test robot <oliver.sang@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Joel Fernandes
	<joelagnelf@nvidia.com>, <linux-kernel@vger.kernel.org>,
	<oliver.sang@intel.com>
Subject: [linux-next:master] [rcutorture]  ddd062f753:
 WARNING:at_kernel/rcu/rcutorture.c:#rcu_torture_updown[rcutorture]
Message-ID: <202504211513.23f21a0-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR01CA0017.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::19) To SJ2PR11MB8587.namprd11.prod.outlook.com
 (2603:10b6:a03:568::21)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8587:EE_|SA1PR11MB6845:EE_
X-MS-Office365-Filtering-Correlation-Id: efebadb0-6a35-423d-9bb2-08dd80a7b19e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5de6vPIRZWMjeG1J3OJwn4A5bYPznZaUg6w9Ry80gJKRttIsSNWmgybQCjq7?=
 =?us-ascii?Q?QyQS2eBn6odQY9nJ1ymC4yG0EytUWNU4CBdZv3MJ+7HUlxWYXhyRg387yH/Y?=
 =?us-ascii?Q?wQma1e1Xv3yMXRrsku3d9DtxzQ9dGRSr0cQQjCUfwblmJzs/I6PiA92v8jGJ?=
 =?us-ascii?Q?pB7wojkory83qyvhRRKIxN/lphemAa1G9ay9PeXES7/7WAm3MzhQSwFOoIUI?=
 =?us-ascii?Q?Y2bMSU+qmgVh9C+bzSAjqJII7Ui5OCn83ElUHGpvVoNsbwxqCHGeLRT/+9bl?=
 =?us-ascii?Q?XNb1d3RSz+4rEVOGJGy0F1TQCUZtqcAabZWdtPCtmvxi1gi/gpAjow/k3Qvy?=
 =?us-ascii?Q?CHJibWjqe8hojSjsS3A1GcRJnilW661LIhRr0ueZCAm0+bFFQXKV9ty9az93?=
 =?us-ascii?Q?uY6yusKsSmPLKP0tuNQcZaT/YzAUVLcvCh6jWl7Uq6WAHm5rASA1VcIy5t20?=
 =?us-ascii?Q?qdtRRlb5dlhs8W66Unvq40dYf4gIwFz4qiSr8xpTt/WLe1y1ccOv6fc8gU5q?=
 =?us-ascii?Q?dHwpaGq3hCQHQSiBF+InHICU7VTmCzz6emRKM9DxP3Q2mec8Wc76Hi2Ij6Mi?=
 =?us-ascii?Q?iS8i0VFqv6eFFVnYY3SEWbKMLyjfeUI0EFrR4/aflGCGYPnXyLJCnnzR1LOQ?=
 =?us-ascii?Q?MtwqCozvEruxewoHWop/sIM+7rZ5vslMXnjpGMnjukjUmZi97XBWvBBJBM/D?=
 =?us-ascii?Q?ITAxe5mwq3b3MTz67GJwlDDTY96x26Xhwf1KlprPSgJwBPlMKZ4T2byMHeUx?=
 =?us-ascii?Q?N57upnCeKILV2XOmqvWRhgMNwxaf2zZCx+qMn/FElPlqe+KV7J1e6+K+zsAN?=
 =?us-ascii?Q?YoTCUkYoCaDPGYxUyNIrxk796oadxmJj1JupGTtH2wSgU5aMZciFziKjxwqE?=
 =?us-ascii?Q?gor6sI7fHQZQDBYFsmw4REtFbkJ9btREorRHVbKJfw753RNHSorLQ+LMRlcR?=
 =?us-ascii?Q?VaVZItb9cRzJXVFdfy9XE8gb+v74e+YP6grfvSJoE7UfpEVOagWIrB7G+eIS?=
 =?us-ascii?Q?8LT5fzVF0rdv8sQ+ryW7yDRtgaNw0DP1QH/kwavGtGIhe90BbMVhyYn3EdO7?=
 =?us-ascii?Q?WqQR+uI0B/88O2TDnxvE5FWaBaOXYjYP9G3rEjb9zhWVunoe1e+bxlqQi83k?=
 =?us-ascii?Q?WJ6Vvjx298UAoKt+84at9JXYQrclBRCQnCQ5CgtoEzj0pkWbx1TIMHKlzdex?=
 =?us-ascii?Q?t+HFdKlf2xET4Ke6yZfneNnxOlvOF/YHmyaXjvpXj8q1BG0y1QO6+Wn2dSJ1?=
 =?us-ascii?Q?FDUEUnG4sq6gZTjFgMrLE/3wK0swwI/fGtnFbhuJB+VKIthaQAQe2fKM5tOm?=
 =?us-ascii?Q?i20wz7FKpbCd50wEWgJMvqhQPCBC6YZdLySlBeE9XWPBznxIrxT4Jf6yrxjZ?=
 =?us-ascii?Q?fyTuZlL5vApJtZ2g3X+ctai7quUw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8587.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PyO4oKfdeZAQvxqhsvaf6gDlPAyufoPLX1nD+me+qkV0B4h1GYlDebNLNr+1?=
 =?us-ascii?Q?+Qivp4yBIceh+hmbXCzz7V/Sdg3CwYELBmA8gJ8IqlYrs12qZc7mk0htNzSN?=
 =?us-ascii?Q?pktMOHiUEgOA3mNh9HX2HMjWoGt1L7n6TweKOEYx5Yg/mJ2X2wXZLAkFQQNi?=
 =?us-ascii?Q?tt8bvt+b7DOXSkV6dH9SGQvRi/EVZlOvx87WasBx7ojwz8LjlDTRzgzL0QX/?=
 =?us-ascii?Q?qcLaIcpDqB0UrTWruHOTxED1DC56tkCvrPSKDKfowPgsFEry/B+S5KVi1165?=
 =?us-ascii?Q?G3UPAxVWNY9MpakdUNCc5JS8jswjK9gka51vei9rLU+3WAsXMlZmASkU38A6?=
 =?us-ascii?Q?7Si+2irF9N8h4Spz0N9D/BQiINU9p9y7uiL3uRojI7VSW2vhp+MzBkng6WIp?=
 =?us-ascii?Q?hUQpGnBcX8EEaZU99RM2qhSk86dCiEP5AcZiC10O7GPzlO6qb26/LgMs30Pu?=
 =?us-ascii?Q?CP44g6juRVSX6ltk8670bmSaA9x8ZnDiCgxmIIUxQtdU333zcTqf4ZMhMNek?=
 =?us-ascii?Q?bvQVkeePZZRYqbB5RIlYoyh1weaCjsr1QowjpugIT7hGoA2bvKenhgSkxhK+?=
 =?us-ascii?Q?GQFSyfgfhHDc9D+7eFQvmRDWvPzyUKcpJzeouikJhIdBbV2ub+wZ+L0xKIq3?=
 =?us-ascii?Q?JmF1FfsZABWMJc1+FBv5tGRV5qQf3+LGw2/idF8QJFf2XjyXlf79R0NaDoVk?=
 =?us-ascii?Q?EcQEATrVTMkJzekZlpy3Z6Rzr/FcFCRFOuxwyVZJJP07mA5LF8HZY+qUmjcX?=
 =?us-ascii?Q?GJaCLieNSWwstudN0/Twp0jC9kn9sqtmNwZyinZr8EtwbuGRa9XpP+Jv/Lcj?=
 =?us-ascii?Q?Vrl8+6atJmriUGAJR1fnPLioWuP0CvFuMTGMHW0Bw5XbmDib+bey6EQSs6Bp?=
 =?us-ascii?Q?mejgWu+cQ1eOyjwQVKJrFBKgqOtlRu4g3m86qH9avV7ZmxPeKdqkMaHu0thu?=
 =?us-ascii?Q?PqvI2o8KWTIUGzUPsgmGYia9yFYN780KGuZsr+lOpQQOm6Tha85CM/SIxQZr?=
 =?us-ascii?Q?4yiqXulDLxnRTcCmMBfdVJ+g54IUVg3BzJvVUjYx//VCqFN63lIaZIvoSLh9?=
 =?us-ascii?Q?2Xj3DD8zpPUY493DdaFMPy1GENm7s8veuq6//yG+0yVB8xrEQbntNjHmiIFh?=
 =?us-ascii?Q?gAE/Wj6O7OQzqfWvSwnEWn2Lb52gLkbqAfUMvG9lAPszpK3SvZfqCzBsDoxQ?=
 =?us-ascii?Q?AV4WsvboKbtHCTEs6p4fPTWiLLnWQeumtQ9ekCUs39Z7zNDNxCXtL8FQPvox?=
 =?us-ascii?Q?zOTYJQZilckbfUJYG2G4Y4Swmsmpvw8jwvEW+WBSxgRqMYnY2EwB3FiUuZZI?=
 =?us-ascii?Q?Tg2lLU5CBkyDdT0JW3YbM/4QSWHEIoOIcUCq07eQrJmYLB1VmFjWVyG5WsNY?=
 =?us-ascii?Q?XlGTOfNLXTLp1k7d4GdR8beoBYareo6cFriOVNLA2bNdKGd0f22470Ir4GHc?=
 =?us-ascii?Q?Uwh2JOYtPPss+B8tK2iUImUnsXIq9FqaHK0VGLiiCBtV4bhpSjcxGSuJzca2?=
 =?us-ascii?Q?yEx34/QB3DK+pLs9skKaWaj0+BkfwrZMwe3cufaGZ1c6Ri47GIKO6Kzd8DOe?=
 =?us-ascii?Q?62V84LmMGmHKrh8gU7c43duIyNiequt5hi6kmV/Al63fsRkiyg/PtyOFnWYb?=
 =?us-ascii?Q?KQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: efebadb0-6a35-423d-9bb2-08dd80a7b19e
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8587.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 07:39:48.5389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bKbYX2fU964hK+73RS7Le3GpsP6pP5TZWHl5U0C9nM7fnmuJF+fpw84QYl58WIMpZu6NvYDeGDMpJW5Anvk+BA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6845
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "WARNING:at_kernel/rcu/rcutorture.c:#rcu_torture_updown[rcutorture]" on:

commit: ddd062f7536cc09fe7ff1a66816601984bc68af8 ("rcutorture: Complain if an ->up_read() is delayed more than 10 seconds")
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

[test failed on linux-next/master f660850bc246fef15ba78c81f686860324396628]

in testcase: rcutorture
version: 
with following parameters:

	runtime: 300s
	test: cpuhotplug
	torture_type: srcud



config: x86_64-randconfig-123-20250415
compiler: clang-20
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+-------------------------------------------------------------------------+------------+------------+
|                                                                         | 1b983c34d5 | ddd062f753 |
+-------------------------------------------------------------------------+------------+------------+
| WARNING:at_kernel/rcu/rcutorture.c:#rcu_torture_updown[rcutorture]      | 0          | 24         |
| RIP:rcu_torture_updown[rcutorture]                                      | 0          | 24         |
+-------------------------------------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202504211513.23f21a0-lkp@intel.com


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250421/202504211513.23f21a0-lkp@intel.com


[  147.544571][  T727] ------------[ cut here ]------------
[  147.545372][  T727] WARNING: CPU: 0 PID: 727 at kernel/rcu/rcutorture.c:2549 rcu_torture_updown+0xe0/0x430 [rcutorture]
[  147.546643][  T727] Modules linked in: rcutorture torture
[  147.547462][  T727] CPU: 0 UID: 0 PID: 727 Comm: rcu_torture_upd Not tainted 6.15.0-rc1-00008-gddd062f7536c #1 NONE  0a926b04a3771ed2623ec5d12c96d338a637f034
[  147.549036][  T727] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[  147.550241][  T727] RIP: 0010:rcu_torture_updown+0xe0/0x430 [rcutorture]
[  147.551128][  T727] Code: 00 00 48 01 c3 48 8b 44 24 10 42 80 3c 20 00 74 0c 48 c7 c7 00 12 41 87 e8 fd 1b 49 e1 48 3b 1d a6 58 e0 e6 0f 89 84 01 00 00 <0f> 0b e9 7d 01 00 00 4c 89 7c 24 08 4f 8d 3c 2e 49 83 c7 60 4b 8d
[  147.553366][  T727] RSP: 0000:ffff888150ebfe60 EFLAGS: 00210297
[  147.554154][  T727] RAX: 1ffffffff0e82240 RBX: 00000000ffffc39e RCX: 0000000000000000
[  147.555179][  T727] RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffff888150eb3450
[  147.572489][  T727] RBP: ffff888150eb6bd8 R08: 0000000000000000 R09: 0000000000000000
[  147.573518][  T727] R10: 0000000000000000 R11: 0000000000000000 R12: dffffc0000000000
[  147.574582][  T727] R13: ffff888150eb0000 R14: 0000000000003408 R15: ffff888150eb3448
[  147.577955][  T727] FS:  0000000000000000(0000) GS:ffff888424c90000(0000) knlGS:0000000000000000
[  147.579066][  T727] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  147.579850][  T727] CR2: 00000000f729a000 CR3: 000000014d67f000 CR4: 00000000000406f0
[  147.580851][  T727] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[  147.581887][  T727] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[  147.582799][  T727] Call Trace:
[  147.583264][  T727]  <TASK>
[  147.583703][  T727]  kthread+0x4b7/0x5e0
[  147.584257][  T727]  ? rcu_torture_updown_hrt+0x60/0x60 [rcutorture 02ecf78e8bf32d7a769b787a1e354f19e873c8f2]
[  147.591263][  T727]  ? kthread_unuse_mm+0x150/0x150
[  147.591978][  T727]  ret_from_fork+0x3c/0x70
[  147.592545][  T727]  ? kthread_unuse_mm+0x150/0x150
[  147.593167][  T727]  ret_from_fork_asm+0x11/0x20
[  147.593805][  T727]  </TASK>
[  147.594276][  T727] irq event stamp: 340637
[  147.597624][  T727] hardirqs last  enabled at (340653): [<ffffffff815a4e82>] __console_unlock+0x72/0x80
[  147.598763][  T727] hardirqs last disabled at (340662): [<ffffffff815a4e67>] __console_unlock+0x57/0x80
[  147.599920][  T727] softirqs last  enabled at (340578): [<ffffffff8148ecce>] handle_softirqs+0x5de/0x6e0
[  147.601075][  T727] softirqs last disabled at (340569): [<ffffffff8148ef41>] __irq_exit_rcu+0x61/0xc0
[  147.602178][  T727] ---[ end trace 0000000000000000 ]---


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

