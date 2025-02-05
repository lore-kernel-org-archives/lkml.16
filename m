Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F412147E6
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 08:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738742794; cv=fail; b=Ug4+wx7MVz6/RT6Tg39wPViGU3YZMGzEXxOJLk7LysGB/LdRwm/Ly8Mn6lRX3zLCu/ELPRReec3vvTeQdgTp3FxfCphsmWpIoZxWYBhnDwVP8zi/RDC29QQnQBTmPKlWyb2z4BZ+2dynZZ8cVGSz7a6JXhw8moT3VsHErNNwhnI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738742794; c=relaxed/simple;
	bh=aC1Rsli6GeJzEo4NzPjEQ0HCxi8xxCBdtfDiDWPJUF0=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Kw0YP1ySyxBB+xHCZHh0NW8Bl7zrn2xcrFwwk2u47BjW1BbwvyDxKtiHvThNcvNArji7zpoumg5vEQOioFj4/wGmFNOLpD6bYrjnwqG47diJjtbXYXOty+qfiAlo8S8b5TWoHclZ/Bl6aPEIuR/HIKq44RPB0tGgvpg8vpIGBQU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hlczXxdR; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hlczXxdR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738742783; x=1770278783;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=aC1Rsli6GeJzEo4NzPjEQ0HCxi8xxCBdtfDiDWPJUF0=;
  b=hlczXxdR/TNFHVj//Vdw03A9/ljXlCsXxUfCCDCNxKxOXYGPU4o3gtHz
   fflB4cvPR6uS/WYple4uiIXi5jOJcj63hOrX49fD6vdjYsQxdxc3lLbwl
   5nEc0SwJRXi6UwQJHU/Saj8rtNlExdiMlhhlUzQt6C413SB8SAboCgiB4
   4NS1ZwjqmD+ftLiNfuDIhb0q9h9OBLk8VNz8pOVSnbIAEvZ4/s5I4u/0C
   JZgd8poo5YSpYjJiUK/6ARr59lV38iwmlxiw9I1UlTjbE/cKzUoVrB4bn
   G2or3bq1jNWTuwSBDvh764SdZW5uCCc3jSeFHidzM6nQDryazi0oBjuc5
   Q==;
X-CSE-ConnectionGUID: R+rTMEgGTSC/JhoHXyqpzA==
X-CSE-MsgGUID: lDeMY6amRsiKGCb3zUyeUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39197061"
X-IronPort-AV: E=Sophos;i="6.13,260,1732608000"; 
   d="scan'208";a="39197061"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 00:06:21 -0800
X-CSE-ConnectionGUID: JERkqe7hQySaLqyGHYzf/Q==
X-CSE-MsgGUID: c7PGoHiOS8e3mvUSBfL2nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="115804194"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 05 Feb 2025 00:06:21 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 5 Feb 2025 00:06:20 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 5 Feb 2025 00:06:20 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 5 Feb 2025 00:06:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vjEq/GUPUWlktf0Y2y+5+ETzY4Ls7kCw9elQ1SVM4v4LDmr/VlmwpFMz43TJTjsfO+FMMT1Oo3LJTD+6uIq6JJv+Klax/tMbONE5XCHj5HrcTKCYFnGj14qY4mWIahYG3kpxw+9OUueJvIerH9KhN36Tr4uLDagFW9Sho0MTLcDUxETzLDjCh7TbEUeMHm/NG+AE0B6LX7J9pXNdC9P0PlI2bpMxVHHnAy+S8/KB//U3WbDldujZ7usbDn6/Q3KvCshrhIAxq41VH5m1DQQui9X0nVwrAR3I+D0JKdgdaY4bSBp3qNjVWww0zEp0dewupIZ5aKB9065IfO+xnA7H5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QH7WYeNQhS40+2aLT2LBYXx0U9kMYixdfymo7ANyUkI=;
 b=wRskoEmnCVYFWFOTOdtsAkMEyu3wZKSDrzh/BQ64tU7xveUKQRHzO5V5se8OyIoikZ/xOoBKWRUT1UzDlrhkW64QYgxs9B+mPMbss5aGwsDHg2b0kTlwK3+bPFZQ1zrnNh6CO1Bi1UWDfMnOniZN5OfsEu1+R93/ZBP4SRJoi/sMpSKwNevhVM6K6suSp5TN17u70ZsbOC0uXNN/Jrqg0TiV6GKwKaIpFtDnH8kfOA3AO86XiA7LR2dT7pv+ruRo9NurExMgLANkpWsxhWXwSwQtStmF/QL910bD+LUFlFS49oG9FrMxxapqgW6VCSJsNAO8gzPDmDv7fLMpLi3WVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SA3PR11MB7525.namprd11.prod.outlook.com (2603:10b6:806:31a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Wed, 5 Feb
 2025 08:05:33 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%3]) with mapi id 15.20.8398.025; Wed, 5 Feb 2025
 08:05:33 +0000
Date: Wed, 5 Feb 2025 16:05:21 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Rik van Riel <riel@surriel.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand
	<david@redhat.com>, Shakeel Butt <shakeel.butt@linux.dev>, Lorenzo Stoakes
	<lorenzo.stoakes@oracle.com>, Chris Li <chrisl@kernel.org>, Matthew Wilcox
	<willy@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
	<linux-mm@kvack.org>, <oliver.sang@intel.com>
Subject: [linus:master] [mm]  1aa43598c0:  stress-ng.urandom.ops_per_sec
 148.0% improvement
Message-ID: <202502051530.2c66071a-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SGXP274CA0017.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::29)
 To LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SA3PR11MB7525:EE_
X-MS-Office365-Filtering-Correlation-Id: cec74d29-8417-46cd-fa65-08dd45bbdd32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?1kW38DS4bGronXjFQykNZ07NTiEJ5H06RxMe9w2dwITJ5F6bimlwl2Hs0C?=
 =?iso-8859-1?Q?xv+z6fc9C3ogZNWIRfKllHe2C1rhiUy6j/IsA73+TORll59KXmuUm4k91O?=
 =?iso-8859-1?Q?rIb507kchZHAt7hY+1WDYDdNx0whFz5LkLDQaasbOUinCbp3Mlkh3j7lX5?=
 =?iso-8859-1?Q?MWc2NYA2VhT6Xd1k/eOLTuhzLlrDbwbtfs1xcpLVXZZIThFo2l09R2Na9w?=
 =?iso-8859-1?Q?g2+NEI6b4R/+O/b6LARbqHl1RaalpiZzRKNlrpNUM4GH/61MVIJ5fvfdW0?=
 =?iso-8859-1?Q?PvKR0e6+zpNUj6RtcIwP9cI87UCU7fXUu1/DN10PAxbCFKvj/Ci9FZTLhy?=
 =?iso-8859-1?Q?ZvmgM2MBbygV0W6B2ggmMd1KyyyUQjrOpp8dzRQ9qp1Cbp5BU7m6bii5x5?=
 =?iso-8859-1?Q?SSJ3DJ4VJNOI6o0HTS5WnOdCbT+2H1RK2Iz0IK5DDMPHAdWvWTHB5EEI+A?=
 =?iso-8859-1?Q?Y39sriwO38zOp6sWvwOJqhig+qQ+ccJQ+LNAfcUtWCGO7Hcm05RqG9TDX/?=
 =?iso-8859-1?Q?RHsRDxvMa+LH+nlxQeOdJLWiRVhzqxQRZiXNzQHkvddT6dqFenML3GCyyB?=
 =?iso-8859-1?Q?Wl3/RH4SKzob28JPMJtjGN+NgJRJl29URVmFFkPm/5y/r8jBCpMZyr8ir1?=
 =?iso-8859-1?Q?BbnvdDeGwgKtmlCrMMkKFohvnlfxqMTLnrNZ1HaZGJR8Itb+Y36OQGtlME?=
 =?iso-8859-1?Q?cFfNQqosUO1hbqNGxK1d/R0LI240ebgSJtw6UobAcJdUp83qzNy+2r/Akd?=
 =?iso-8859-1?Q?RcF/MbQJqt6+O55RzTX/KOl9a9nJc7nljr4dzQfyg9dpmyPqZpAeEWzF9H?=
 =?iso-8859-1?Q?JU+vwObPy1q8GDLIbYLAEf4dfjf4pniKM1yGHfZ2yEQj/xAfCDKi+JXZ4i?=
 =?iso-8859-1?Q?IzPcMMjiWgmNvGxcbWKSlA7LAO8npryrHHQil012MTLqvwzzefDuio8YoL?=
 =?iso-8859-1?Q?DhTRuJxKDgVsholWZU8wT1vE7cU+jB9siUBB77B+86vAs5ErJuLJLeOBHk?=
 =?iso-8859-1?Q?plxmOq+TbGtGTbGiS1g8Z3NH0iasPaa3W5yrKFdeeKfbu0J7PUF6LfHxBx?=
 =?iso-8859-1?Q?ruoA2vg2+XJ3gEbVhqekkNLQ9DuEMyWSId1VKjaePJyRFLr9LvBbSqgJEF?=
 =?iso-8859-1?Q?9iZRqm3JFxeOM7xaRThi/j7AY6TPM8/WmiqW/iJ3yCmDXllyOqxVBkoEiF?=
 =?iso-8859-1?Q?mUR8YvGxluulsR7HQjK6CUCHmbCW3eWrKk6qgPd7xRxIVAjTueFhGq610/?=
 =?iso-8859-1?Q?ePEeS9TiNtJbstej5GCf/jssaZm/gV4+36N7/zZpT6jCiAmoO/AFLjSrYy?=
 =?iso-8859-1?Q?4/EZCaRQJwE4sQFaG0ClE1f6vBz251+X3s8544F1WiR/PipEUYeykQ1epg?=
 =?iso-8859-1?Q?xqxC4DtP/KCCXWL1Z88fdPCCDBBD9OiA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?dN+1luj1ySFurucMOEiRyLSezAZPc+YHUHHSTYc++/bbS5jxO3ukzhokfR?=
 =?iso-8859-1?Q?xVD+T8wjUiV/jW1q8Q8x9y2DWmbmywI1sfvOB8W6LPxcFe6m+MbbJ5xnqj?=
 =?iso-8859-1?Q?orE4sXojgSwDkWDXhaQk2eLoGDrD1dyfadHPRaq2TFL6Z/ykh0/6Ozi3AU?=
 =?iso-8859-1?Q?JOzcwFCMwI8d09rdZwXa4sPRdgKkzJfWkE6X/ZHvHyq9vsHn4xVPnPazqx?=
 =?iso-8859-1?Q?TgQePqc4hnvyEUBMDTVBs1ZQIeoIO8fgD2hjcaMvQMrSHU+hQ0EbAl4knr?=
 =?iso-8859-1?Q?Mm+cVFzVFJuTiPpFvz6XQM1s/TrSCdKcwhVfi3ocZqePnAKpg9lzhG/P9j?=
 =?iso-8859-1?Q?Irxc7s9s+pvbzLgKxKw+lnSLQBQAfQTOI+9U5gA2iBpguhO43GH62cPdZ0?=
 =?iso-8859-1?Q?/WuD7nwn1004SlhF8yyGmc+as4eZcO0LRtiKa7tz7TGksgLMwsPM2Diykm?=
 =?iso-8859-1?Q?8p7cJTp770mJc3FjpuxO23ylhFyM5+kqc0FVvINboufTo/QRvQWDVCZkaP?=
 =?iso-8859-1?Q?gQWHZU5faR2d2QruhyK0Y6slO8veqFWgY1Trx6xIUEDPEype2exVKO8z8A?=
 =?iso-8859-1?Q?9J7GIdk+X6QtmaeiVmJHDaZHpc2lcm+r+eu2Nu6U4gryXtGDy8Ns6KqIFk?=
 =?iso-8859-1?Q?si4ltggQfNcXrqdtQswEyObITg7YpfGOJBpbEnMoQpMR1JrLa0oTRLTowd?=
 =?iso-8859-1?Q?2EXgz9FkiLQMpsq6Vy9ZPwmzmgL2VLz96j90qvhROwQaGwUs6n3Dr20RGK?=
 =?iso-8859-1?Q?e1E8TgbNxAnSHQrGMRPJ99B0CTBNOUiJN7COho2q4J6fJzzTfQV0IhAOfp?=
 =?iso-8859-1?Q?B0Vh2khJbnUoryTzISmX/E924CtYoi8KwwDKr8GOsF494I5ttBp0ud4Ecj?=
 =?iso-8859-1?Q?kkQ3IeRNnWB7hgfOIoqzS9o2gOmjuhBAmeIkBxTI/9ngiswqq9lCvbxiSx?=
 =?iso-8859-1?Q?KanwgWen83b3lgMMqJO2oHT+/aFsnd1KbVF24FnJ5I5cfWPIyONLh8sL+V?=
 =?iso-8859-1?Q?SrRbasFS4BWFtbm8Bfq2KL8mSInMj4tbdwvedjG2wr+BmVkVQE8o4E1hI+?=
 =?iso-8859-1?Q?7XWnagsh1a1CjtlnlBjy245ZoFNTNIXQ+mJH1t7vBGVmXred9PJaaXlOgS?=
 =?iso-8859-1?Q?lKNa7BTDWVnvpfpJ2B4TRqgZl6KEl4eDdwu9bLrDABwXRpNUKOoMg2tDBG?=
 =?iso-8859-1?Q?czTD42VRkAt3yEeVVESNuHp7mlHjXGHSpex5XScR9YtpF3QTHPfIM3J5c6?=
 =?iso-8859-1?Q?w7JabdKjJehieV3d0WsxOFuNtZGb+A3c7A0cIZLixgkBZWKKIst7O4qjXs?=
 =?iso-8859-1?Q?MjsHX/cnkkyYlDQuFewZtQeDDUkF/KTyGbupEsaehQ+0D5ZiwVmyD5q+yV?=
 =?iso-8859-1?Q?XSSxwcfULqOmzCBGtFnuuSnylkCyVHJfm3yovby9EZGa4lkwDk/ObIC9t8?=
 =?iso-8859-1?Q?IuoSRYONTXorAd8fc2yfnlLUNs7MsowQpcYjDi9gvLFzVVIgnI8lDiRMmg?=
 =?iso-8859-1?Q?4OyG8kJeRrxI9R9A8nh41NKGJNritNoLnJR4lWTk36ccrIAjDHppGEiu65?=
 =?iso-8859-1?Q?LD2GW7oNY5XCESeiXMKfXJj/vrnnTbFnwiSmLCruXE5lhliqpDtMfrIzLc?=
 =?iso-8859-1?Q?UAhn4dzdCnj573n/qLRO8o0LLk+kvAfag+Vv03okqwqZ4wiJUJ0tcX7g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cec74d29-8417-46cd-fa65-08dd45bbdd32
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 08:05:33.6801
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1+1yFsEKu9cHLhvf79+AYyeeC2cFk3him8aiPG7ofTHgDygOH/rstslwB8FqbsLiiXa6N7TVidk7FLglaNj1BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7525
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 148.0% improvement of stress-ng.urandom.ops_per_sec on:


commit: 1aa43598c03b71d945f8b12d6d579f0ad836f8f8 ("mm: remove unnecessary calls to lru_add_drain")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master


testcase: stress-ng
config: x86_64-rhel-9.4
compiler: gcc-12
test machine: 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with 512G memory
parameters:

	nr_threads: 100%
	testtime: 60s
	test: urandom
	cpufreq_governor: performance


In addition to that, the commit also has significant impact on the following tests:

+------------------+---------------------------------------------------------------------------------------------+
| testcase: change | stress-ng: stress-ng.tmpfs.ops_per_sec 71.8% improvement                                    |
| test machine     | 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with 512G memory |
| test parameters  | cpufreq_governor=performance                                                                |
|                  | nr_threads=100%                                                                             |
|                  | test=tmpfs                                                                                  |
|                  | testtime=60s                                                                                |
+------------------+---------------------------------------------------------------------------------------------+
| testcase: change | stress-ng: stress-ng.mmapmany.ops_per_sec 35.0% improvement                                 |
| test machine     | 64 threads 2 sockets Intel(R) Xeon(R) Gold 6346 CPU @ 3.10GHz (Ice Lake) with 256G memory   |
| test parameters  | cpufreq_governor=performance                                                                |
|                  | nr_threads=100%                                                                             |
|                  | test=mmapmany                                                                               |
|                  | testtime=60s                                                                                |
+------------------+---------------------------------------------------------------------------------------------+




Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250205/202502051530.2c66071a-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-12/performance/x86_64-rhel-9.4/100%/debian-12-x86_64-20240206.cgz/lkp-spr-2sp4/urandom/stress-ng/60s

commit: 
  44d46b76c3 ("mm: add build-time option for hotplug memory default online type")
  1aa43598c0 ("mm: remove unnecessary calls to lru_add_drain")

44d46b76c3a4b514 1aa43598c03b71d945f8b12d6d5 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
      4237 ±  2%     +64.4%       6967        vmstat.system.cs
      0.23 ±  2%      +0.5        0.74 ±  3%  mpstat.cpu.all.irq%
      1.57            +5.5        7.04        mpstat.cpu.all.soft%
      1.32            +1.2        2.54        mpstat.cpu.all.usr%
  70740275          +152.4%  1.786e+08        numa-numastat.node0.local_node
  70868901          +152.1%  1.787e+08        numa-numastat.node0.numa_hit
  72087735          +143.7%  1.757e+08        numa-numastat.node1.local_node
  72202963          +143.5%  1.758e+08        numa-numastat.node1.numa_hit
  70813705          +152.7%   1.79e+08        numa-vmstat.node0.numa_hit
  70685079          +153.0%  1.788e+08        numa-vmstat.node0.numa_local
  72153360          +144.1%  1.761e+08        numa-vmstat.node1.numa_hit
  72038132          +144.3%   1.76e+08        numa-vmstat.node1.numa_local
    891.17 ± 14%     -65.5%     307.33 ±141%  perf-c2c.DRAM.remote
     11318 ±  6%     -90.4%       1084 ±141%  perf-c2c.HITM.local
    604.17 ± 16%     -88.0%      72.50 ±151%  perf-c2c.HITM.remote
     11922 ±  6%     -90.3%       1157 ±141%  perf-c2c.HITM.total
     72004 ± 12%     +48.8%     107177 ± 14%  proc-vmstat.numa_hint_faults
     36460 ± 22%     +90.5%      69468 ± 12%  proc-vmstat.numa_hint_faults_local
 1.431e+08          +147.9%  3.546e+08        proc-vmstat.numa_hit
 1.428e+08          +148.1%  3.544e+08        proc-vmstat.numa_local
 1.637e+08          +149.8%  4.089e+08        proc-vmstat.pgalloc_normal
 1.301e+08          +146.7%   3.21e+08        proc-vmstat.pgfault
 1.627e+08          +150.4%  4.076e+08        proc-vmstat.pgfree
    107696 ±  4%     +61.4%     173820        stress-ng.time.involuntary_context_switches
 1.293e+08          +147.9%  3.206e+08        stress-ng.time.minor_page_faults
     21754            -6.6%      20324        stress-ng.time.percent_of_cpu_this_job_got
     12993            -7.9%      11968        stress-ng.time.system_time
    105.19          +155.6%     268.82        stress-ng.time.user_time
      2415           -18.6%       1966        stress-ng.urandom.million_random_bits_per_sec
     37822          +148.0%      93783        stress-ng.urandom.million_random_bits_read
 1.293e+08          +148.0%  3.205e+08        stress-ng.urandom.ops
   2154307          +148.0%    5341681        stress-ng.urandom.ops_per_sec
   6881430 ± 43%    +238.2%   23275703 ±  2%  sched_debug.cfs_rq:/.avg_vruntime.avg
  21177367 ± 40%    +105.3%   43483310 ±  7%  sched_debug.cfs_rq:/.avg_vruntime.max
   4036669 ± 45%    +163.5%   10635631 ± 12%  sched_debug.cfs_rq:/.avg_vruntime.min
   2107360 ± 39%    +151.2%    5294675        sched_debug.cfs_rq:/.avg_vruntime.stddev
    381.50 ±223%    +500.6%       2291        sched_debug.cfs_rq:/.load.min
      0.25 ±223%   +1066.7%       2.92 ± 50%  sched_debug.cfs_rq:/.load_avg.min
   6881431 ± 43%    +238.2%   23275714 ±  2%  sched_debug.cfs_rq:/.min_vruntime.avg
  21177367 ± 40%    +105.3%   43483310 ±  7%  sched_debug.cfs_rq:/.min_vruntime.max
   4036669 ± 45%    +163.5%   10635631 ± 12%  sched_debug.cfs_rq:/.min_vruntime.min
   2107363 ± 39%    +151.2%    5294676        sched_debug.cfs_rq:/.min_vruntime.stddev
     34.33 ±223%    +871.6%     333.58 ± 32%  sched_debug.cfs_rq:/.util_avg.min
    290.71 ± 43%     +59.6%     464.07 ±  3%  sched_debug.cfs_rq:/.util_est.avg
    188458 ±  3%     +10.2%     207646 ±  5%  sched_debug.cpu.avg_idle.stddev
     18.01 ± 17%     +66.0%      29.89 ± 19%  sched_debug.cpu.clock.stddev
      1249 ± 16%     +37.3%       1715        sched_debug.cpu.nr_switches.avg
    382.83 ± 24%    +112.3%     812.75        sched_debug.cpu.nr_switches.min
 3.719e+10           +93.6%    7.2e+10        perf-stat.i.branch-instructions
      0.24            -0.1        0.19        perf-stat.i.branch-miss-rate%
  83525203           +50.5%  1.257e+08        perf-stat.i.branch-misses
     32.57           +27.6       60.20        perf-stat.i.cache-miss-rate%
  88796157          +138.0%  2.113e+08        perf-stat.i.cache-misses
  2.74e+08           +27.8%  3.503e+08        perf-stat.i.cache-references
      4057 ±  3%     +68.8%       6849        perf-stat.i.context-switches
      1.20           -57.1%       0.51        perf-stat.i.cpi
    346.30           +30.4%     451.72        perf-stat.i.cpu-migrations
      7185           -58.2%       3000        perf-stat.i.cycles-between-cache-misses
  5.34e+11          +132.7%  1.243e+12        perf-stat.i.instructions
      0.84          +132.6%       1.95        perf-stat.i.ipc
     28.52          +147.6%      70.60        perf-stat.i.metric.K/sec
   2134296          +147.3%    5277683        perf-stat.i.minor-faults
   4256760          +147.7%   10543513        perf-stat.i.page-faults
      0.17            +2.5%       0.17        perf-stat.overall.MPKI
      0.22            -0.0        0.17        perf-stat.overall.branch-miss-rate%
     32.37           +28.0       60.36        perf-stat.overall.cache-miss-rate%
      1.20           -57.1%       0.51        perf-stat.overall.cpi
      7210           -58.2%       3015        perf-stat.overall.cycles-between-cache-misses
      0.83          +133.2%       1.95        perf-stat.overall.ipc
 3.653e+10           +93.7%  7.075e+10        perf-stat.ps.branch-instructions
  80893729           +52.0%  1.229e+08        perf-stat.ps.branch-misses
  87146237          +138.6%  2.079e+08        perf-stat.ps.cache-misses
 2.692e+08           +27.9%  3.445e+08        perf-stat.ps.cache-references
      3955 ±  3%     +69.7%       6710        perf-stat.ps.context-switches
    337.00           +31.2%     442.25        perf-stat.ps.cpu-migrations
 5.245e+11          +132.8%  1.221e+12        perf-stat.ps.instructions
   2096252          +147.3%    5184387        perf-stat.ps.minor-faults
   4181199          +147.7%   10357136        perf-stat.ps.page-faults
 3.218e+13          +131.8%  7.461e+13        perf-stat.total.instructions
      0.54 ± 76%    +683.4%       4.22 ± 13%  perf-sched.sch_delay.avg.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_mpol_noprof.vma_alloc_folio_noprof
      0.79 ± 23%    +392.9%       3.91 ± 10%  perf-sched.sch_delay.avg.ms.__cond_resched.__anon_vma_prepare.__vmf_anon_prepare.do_anonymous_page.__handle_mm_fault
      0.90 ±164%    +412.2%       4.61 ± 43%  perf-sched.sch_delay.avg.ms.__cond_resched.__kmalloc_node_noprof.alloc_slab_obj_exts.allocate_slab.___slab_alloc
      0.54 ±136%    +639.8%       4.03 ± 38%  perf-sched.sch_delay.avg.ms.__cond_resched.__put_anon_vma.unlink_anon_vmas.free_pgtables.vms_clear_ptes
      0.77 ± 14%    +405.5%       3.88 ±  9%  perf-sched.sch_delay.avg.ms.__cond_resched.__tlb_batch_free_encoded_pages.tlb_finish_mmu.vms_clear_ptes.part
      0.63 ±100%    +534.2%       4.01 ± 25%  perf-sched.sch_delay.avg.ms.__cond_resched.change_pmd_range.isra.0.change_pud_range
      0.90 ± 48%    +345.1%       3.99 ± 20%  perf-sched.sch_delay.avg.ms.__cond_resched.change_pud_range.isra.0.change_protection_range
      0.74 ± 64%    +482.0%       4.28 ± 11%  perf-sched.sch_delay.avg.ms.__cond_resched.do_select.core_sys_select.do_pselect.constprop
      0.93 ± 82%    +362.2%       4.30 ± 18%  perf-sched.sch_delay.avg.ms.__cond_resched.down_write.__anon_vma_prepare.__vmf_anon_prepare.do_anonymous_page
      1.02 ±139%    +350.3%       4.61 ± 36%  perf-sched.sch_delay.avg.ms.__cond_resched.down_write.__mmap_new_vma.__mmap_region.do_mmap
      0.83 ± 68%    +398.1%       4.13 ± 17%  perf-sched.sch_delay.avg.ms.__cond_resched.down_write.__split_vma.vms_gather_munmap_vmas.do_vmi_align_munmap
      0.64 ± 90%    +470.0%       3.66 ± 25%  perf-sched.sch_delay.avg.ms.__cond_resched.down_write.unlink_anon_vmas.free_pgtables.vms_clear_ptes
      1.02 ± 21%    +283.5%       3.89 ± 14%  perf-sched.sch_delay.avg.ms.__cond_resched.down_write.vma_merge_existing_range.vma_modify.constprop
      1.05 ± 66%    +332.0%       4.52 ± 19%  perf-sched.sch_delay.avg.ms.__cond_resched.down_write.vms_gather_munmap_vmas.do_vmi_align_munmap.do_vmi_munmap
      0.66 ± 93%    +487.7%       3.85 ± 13%  perf-sched.sch_delay.avg.ms.__cond_resched.down_write_killable.__vm_munmap.__x64_sys_munmap.do_syscall_64
      0.02 ± 94%    +472.6%       0.13 ± 79%  perf-sched.sch_delay.avg.ms.__cond_resched.down_write_killable.exec_mmap.begin_new_exec.load_elf_binary
      1.32 ±102%    +255.3%       4.68 ± 24%  perf-sched.sch_delay.avg.ms.__cond_resched.down_write_killable.vm_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.41 ± 72%    +158.1%       3.64 ± 20%  perf-sched.sch_delay.avg.ms.__cond_resched.down_write_killable.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_64
      0.27 ±120%    +326.2%       1.14 ± 38%  perf-sched.sch_delay.avg.ms.__cond_resched.dput.__fput.__x64_sys_close.do_syscall_64
      0.79 ± 16%    +429.0%       4.17 ±  6%  perf-sched.sch_delay.avg.ms.__cond_resched.get_random_bytes_user.vfs_read.ksys_read.do_syscall_64
      1.01 ± 39%    +274.4%       3.79 ± 17%  perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc_noprof.__anon_vma_prepare.__vmf_anon_prepare.do_anonymous_page
      0.41 ± 84%    +841.7%       3.89 ± 10%  perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc_noprof.mas_alloc_nodes.mas_preallocate.__mmap_new_vma
      0.62 ±107%    +594.8%       4.32 ± 12%  perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc_noprof.mas_alloc_nodes.mas_preallocate.__split_vma
      0.91 ± 24%    +334.0%       3.96 ±  8%  perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc_noprof.vm_area_alloc.__mmap_new_vma.__mmap_region
      0.88 ± 56%    +427.2%       4.62 ± 20%  perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc_noprof.vm_area_dup.__split_vma.vms_gather_munmap_vmas
      0.76 ±123%    +409.7%       3.85 ± 10%  perf-sched.sch_delay.avg.ms.__cond_resched.remove_vma.vms_complete_munmap_vmas.do_vmi_align_munmap.do_vmi_munmap
      0.67 ±223%    +675.2%       5.16 ± 53%  perf-sched.sch_delay.avg.ms.__cond_resched.unmap_page_range.unmap_vmas.vms_clear_ptes.part
      0.72 ± 15%    +501.7%       4.35 ± 12%  perf-sched.sch_delay.avg.ms.__cond_resched.unmap_vmas.vms_clear_ptes.part.0
      0.49 ±128%    +766.2%       4.28 ± 14%  perf-sched.sch_delay.avg.ms.__cond_resched.zap_pmd_range.isra.0.unmap_page_range
      0.38 ± 89%   +1015.1%       4.28 ± 15%  perf-sched.sch_delay.avg.ms.__cond_resched.zap_pte_range.zap_pmd_range.isra.0
      0.62 ± 37%    +144.8%       1.52 ± 29%  perf-sched.sch_delay.avg.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      0.40 ±102%    +288.4%       1.56 ± 22%  perf-sched.sch_delay.avg.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      0.05 ± 26%    +304.5%       0.19 ± 32%  perf-sched.sch_delay.avg.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.01 ±  8%    +513.9%       0.07 ±143%  perf-sched.sch_delay.avg.ms.irq_thread.kthread.ret_from_fork.ret_from_fork_asm
      1.08 ± 42%    +274.1%       4.06 ± 16%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
      0.16 ± 32%     +60.5%       0.25 ± 26%  perf-sched.sch_delay.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      0.01 ±  6%   +1331.8%       0.10 ± 57%  perf-sched.sch_delay.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      0.02 ± 29%     +76.3%       0.03 ± 28%  perf-sched.sch_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      1.05 ± 23%    +249.0%       3.66 ±  9%  perf-sched.sch_delay.avg.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      0.50 ± 30%    +144.0%       1.22 ± 28%  perf-sched.sch_delay.avg.ms.wait_for_partner.fifo_open.do_dentry_open.vfs_open
      0.22 ± 37%    +147.0%       0.55 ± 15%  perf-sched.sch_delay.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      2.25 ± 65%    +691.5%      17.82 ± 36%  perf-sched.sch_delay.max.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_mpol_noprof.vma_alloc_folio_noprof
      4.36 ± 10%    +332.5%      18.85 ±  7%  perf-sched.sch_delay.max.ms.__cond_resched.__anon_vma_prepare.__vmf_anon_prepare.do_anonymous_page.__handle_mm_fault
      1.34 ±140%    +913.3%      13.61 ± 34%  perf-sched.sch_delay.max.ms.__cond_resched.__kmalloc_node_noprof.alloc_slab_obj_exts.allocate_slab.___slab_alloc
      1.24 ±131%    +950.0%      12.97 ± 26%  perf-sched.sch_delay.max.ms.__cond_resched.__put_anon_vma.unlink_anon_vmas.free_pgtables.vms_clear_ptes
      1.84 ±101%    +650.5%      13.82 ± 24%  perf-sched.sch_delay.max.ms.__cond_resched.change_pmd_range.isra.0.change_pud_range
      3.34 ± 44%    +387.0%      16.29 ± 12%  perf-sched.sch_delay.max.ms.__cond_resched.change_pud_range.isra.0.change_protection_range
      3.99 ± 14%    +347.3%      17.84 ±  6%  perf-sched.sch_delay.max.ms.__cond_resched.do_select.core_sys_select.do_pselect.constprop
      2.54 ± 69%    +529.0%      15.96 ± 17%  perf-sched.sch_delay.max.ms.__cond_resched.down_write.__anon_vma_prepare.__vmf_anon_prepare.do_anonymous_page
      1.85 ±100%    +635.1%      13.58 ± 19%  perf-sched.sch_delay.max.ms.__cond_resched.down_write.__mmap_new_vma.__mmap_region.do_mmap
      3.52 ± 50%    +396.3%      17.45 ± 10%  perf-sched.sch_delay.max.ms.__cond_resched.down_write.__split_vma.vms_gather_munmap_vmas.do_vmi_align_munmap
      2.04 ± 95%    +505.0%      12.36 ± 29%  perf-sched.sch_delay.max.ms.__cond_resched.down_write.unlink_anon_vmas.free_pgtables.vms_clear_ptes
      4.51 ± 16%    +293.6%      17.73 ±  3%  perf-sched.sch_delay.max.ms.__cond_resched.down_write.vma_merge_existing_range.vma_modify.constprop
      3.36 ± 43%    +411.0%      17.19 ±  9%  perf-sched.sch_delay.max.ms.__cond_resched.down_write.vms_gather_munmap_vmas.do_vmi_align_munmap.do_vmi_munmap
      1.90 ± 95%    +685.3%      14.90 ±  8%  perf-sched.sch_delay.max.ms.__cond_resched.down_write_killable.__vm_munmap.__x64_sys_munmap.do_syscall_64
      3.20 ± 43%    +344.9%      14.24 ± 17%  perf-sched.sch_delay.max.ms.__cond_resched.down_write_killable.do_mprotect_pkey.__x64_sys_mprotect.do_syscall_64
      0.06 ±169%   +4016.6%       2.64 ±142%  perf-sched.sch_delay.max.ms.__cond_resched.down_write_killable.exec_mmap.begin_new_exec.load_elf_binary
      1.72 ± 95%    +781.2%      15.19 ± 11%  perf-sched.sch_delay.max.ms.__cond_resched.down_write_killable.vm_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe
      3.81 ± 84%    +293.2%      14.98 ± 14%  perf-sched.sch_delay.max.ms.__cond_resched.down_write_killable.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_64
      0.57 ±119%    +486.4%       3.34 ± 15%  perf-sched.sch_delay.max.ms.__cond_resched.dput.__fput.__x64_sys_close.do_syscall_64
      9.87 ± 45%    +173.2%      26.96 ± 25%  perf-sched.sch_delay.max.ms.__cond_resched.get_random_bytes_user.vfs_read.ksys_read.do_syscall_64
      4.17 ±  8%    +334.7%      18.11 ±  6%  perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc_noprof.__anon_vma_prepare.__vmf_anon_prepare.do_anonymous_page
      2.69 ± 69%    +549.1%      17.45 ±  6%  perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc_noprof.mas_alloc_nodes.mas_preallocate.__mmap_new_vma
      2.53 ± 62%    +623.6%      18.31 ±  8%  perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc_noprof.mas_alloc_nodes.mas_preallocate.__split_vma
      4.95 ± 15%    +263.6%      18.01 ±  4%  perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc_noprof.vm_area_alloc.__mmap_new_vma.__mmap_region
      4.01          +349.5%      18.01 ±  5%  perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc_noprof.vm_area_dup.__split_vma.vms_gather_munmap_vmas
      2.05 ± 94%    +623.6%      14.86 ± 10%  perf-sched.sch_delay.max.ms.__cond_resched.remove_vma.vms_complete_munmap_vmas.do_vmi_align_munmap.do_vmi_munmap
      0.32 ±205%    +761.8%       2.77 ±109%  perf-sched.sch_delay.max.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.67 ±223%   +1572.4%      11.14 ± 37%  perf-sched.sch_delay.max.ms.__cond_resched.unmap_page_range.unmap_vmas.vms_clear_ptes.part
      9.27 ± 50%    +144.1%      22.62 ± 22%  perf-sched.sch_delay.max.ms.__cond_resched.unmap_vmas.vms_clear_ptes.part.0
      1.58 ±100%    +175.9%       4.35 ± 29%  perf-sched.sch_delay.max.ms.__cond_resched.ww_mutex_lock.drm_gem_vunmap_unlocked.drm_gem_fb_vunmap.drm_atomic_helper_commit_planes
      1.37 ±135%   +1172.5%      17.45 ±  6%  perf-sched.sch_delay.max.ms.__cond_resched.zap_pmd_range.isra.0.unmap_page_range
      2.27 ± 76%    +673.2%      17.56 ±  5%  perf-sched.sch_delay.max.ms.__cond_resched.zap_pte_range.zap_pmd_range.isra.0
      8.41 ± 58%    +151.2%      21.12 ± 48%  perf-sched.sch_delay.max.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      1.34 ± 72%    +248.5%       4.67 ± 21%  perf-sched.sch_delay.max.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      1.14 ± 39%    +257.2%       4.06 ± 24%  perf-sched.sch_delay.max.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
      4.92 ± 51%    +251.2%      17.28 ± 12%  perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
      9.68 ± 64%    +136.9%      22.92 ± 48%  perf-sched.sch_delay.max.ms.schedule_hrtimeout_range.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
      0.65 ± 54%   +1191.2%       8.36 ± 49%  perf-sched.sch_delay.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
     14.49 ± 40%    +114.1%      31.03 ± 25%  perf-sched.sch_delay.max.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      4.01 ± 11%    +370.9%      18.90 ± 66%  perf-sched.sch_delay.max.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      0.47 ±  9%    +315.2%       1.97 ±  6%  perf-sched.total_sch_delay.average.ms
    176.28 ±  3%     -43.2%     100.20 ±  4%  perf-sched.total_wait_and_delay.average.ms
     15115 ±  6%    +111.0%      31901 ±  4%  perf-sched.total_wait_and_delay.count.ms
    175.81 ±  3%     -44.1%      98.24 ±  4%  perf-sched.total_wait_time.average.ms
      1.54 ± 14%    +405.4%       7.76 ±  9%  perf-sched.wait_and_delay.avg.ms.__cond_resched.__tlb_batch_free_encoded_pages.tlb_finish_mmu.vms_clear_ptes.part
      1.58 ± 16%    +429.0%       8.35 ±  6%  perf-sched.wait_and_delay.avg.ms.__cond_resched.get_random_bytes_user.vfs_read.ksys_read.do_syscall_64
    614.77 ± 37%     -79.6%     125.15 ±  9%  perf-sched.wait_and_delay.avg.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.49 ± 20%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
      1.45 ± 15%    +501.7%       8.70 ± 12%  perf-sched.wait_and_delay.avg.ms.__cond_resched.unmap_vmas.vms_clear_ptes.part.0
    584.05 ± 31%     -86.1%      81.02 ±100%  perf-sched.wait_and_delay.avg.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      1.40 ±  8%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
    198.21 ± 29%     -71.0%      57.58 ± 14%  perf-sched.wait_and_delay.avg.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
      2.12 ± 12%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
    570.79 ±  5%     -64.5%     202.55 ±  3%  perf-sched.wait_and_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      3.66 ± 53%    +131.2%       8.47 ±  8%  perf-sched.wait_and_delay.avg.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      2647 ±  3%     -89.8%     268.83 ±  5%  perf-sched.wait_and_delay.count.__cond_resched.__tlb_batch_free_encoded_pages.tlb_finish_mmu.vms_clear_ptes.part
      1189 ±  8%     +10.3%       1312 ±  5%  perf-sched.wait_and_delay.count.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
    699.67 ±  3%    +581.9%       4771 ±  4%  perf-sched.wait_and_delay.count.__cond_resched.get_random_bytes_user.vfs_read.ksys_read.do_syscall_64
     11.00 ± 19%   +1022.7%     123.50 ± 11%  perf-sched.wait_and_delay.count.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
    118.83 ±  4%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
      2668 ±  4%     -84.6%     411.33 ±  4%  perf-sched.wait_and_delay.count.__cond_resched.unmap_vmas.vms_clear_ptes.part.0
    124.00          -100.0%       0.00        perf-sched.wait_and_delay.count.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.x64_sys_call
    113.17 ±  2%    -100.0%       0.00        perf-sched.wait_and_delay.count.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
     95.67 ±141%    +356.6%     436.83 ± 34%  perf-sched.wait_and_delay.count.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
    375.83 ± 22%    +236.4%       1264 ± 15%  perf-sched.wait_and_delay.count.pipe_read.vfs_read.ksys_read.do_syscall_64
     86.83          -100.0%       0.00        perf-sched.wait_and_delay.count.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      2820 ± 10%    +252.8%       9950 ±  3%  perf-sched.wait_and_delay.count.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      1085 ± 13%    +618.5%       7796 ±  7%  perf-sched.wait_and_delay.count.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
     19.74 ± 45%    +173.2%      53.92 ± 25%  perf-sched.wait_and_delay.max.ms.__cond_resched.get_random_bytes_user.vfs_read.ksys_read.do_syscall_64
      1736 ± 28%     -62.5%     651.98 ± 71%  perf-sched.wait_and_delay.max.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      4.30 ± 25%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
     18.53 ± 50%    +144.1%      45.23 ± 22%  perf-sched.wait_and_delay.max.ms.__cond_resched.unmap_vmas.vms_clear_ptes.part.0
      5.77 ± 14%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
      8.58 ±  8%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      4073 ± 14%     -67.4%       1326 ± 22%  perf-sched.wait_and_delay.max.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.54 ± 76%    +681.9%       4.22 ± 14%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_mpol_noprof.vma_alloc_folio_noprof
      0.79 ± 23%    +392.9%       3.91 ± 10%  perf-sched.wait_time.avg.ms.__cond_resched.__anon_vma_prepare.__vmf_anon_prepare.do_anonymous_page.__handle_mm_fault
      0.90 ±164%   +1570.5%      15.03 ±154%  perf-sched.wait_time.avg.ms.__cond_resched.__kmalloc_node_noprof.alloc_slab_obj_exts.allocate_slab.___slab_alloc
      0.54 ±136%    +639.8%       4.03 ± 38%  perf-sched.wait_time.avg.ms.__cond_resched.__put_anon_vma.unlink_anon_vmas.free_pgtables.vms_clear_ptes
      0.77 ± 14%    +405.5%       3.88 ±  9%  perf-sched.wait_time.avg.ms.__cond_resched.__tlb_batch_free_encoded_pages.tlb_finish_mmu.vms_clear_ptes.part
      0.63 ±100%    +534.2%       4.01 ± 25%  perf-sched.wait_time.avg.ms.__cond_resched.change_pmd_range.isra.0.change_pud_range
      0.90 ± 48%    +345.1%       3.99 ± 20%  perf-sched.wait_time.avg.ms.__cond_resched.change_pud_range.isra.0.change_protection_range
      0.74 ± 64%    +482.0%       4.28 ± 11%  perf-sched.wait_time.avg.ms.__cond_resched.do_select.core_sys_select.do_pselect.constprop
      0.93 ± 82%    +362.2%       4.30 ± 18%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.__anon_vma_prepare.__vmf_anon_prepare.do_anonymous_page
      1.02 ±139%    +350.3%       4.61 ± 36%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.__mmap_new_vma.__mmap_region.do_mmap
      0.83 ± 68%    +398.1%       4.13 ± 17%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.__split_vma.vms_gather_munmap_vmas.do_vmi_align_munmap
      0.64 ± 90%    +470.0%       3.66 ± 25%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.unlink_anon_vmas.free_pgtables.vms_clear_ptes
      1.02 ± 21%    +283.5%       3.89 ± 14%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.vma_merge_existing_range.vma_modify.constprop
      1.05 ± 66%    +332.0%       4.52 ± 19%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.vms_gather_munmap_vmas.do_vmi_align_munmap.do_vmi_munmap
      0.66 ± 93%    +487.7%       3.85 ± 13%  perf-sched.wait_time.avg.ms.__cond_resched.down_write_killable.__vm_munmap.__x64_sys_munmap.do_syscall_64
      1.32 ±102%    +255.3%       4.68 ± 24%  perf-sched.wait_time.avg.ms.__cond_resched.down_write_killable.vm_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.41 ± 72%    +158.1%       3.64 ± 20%  perf-sched.wait_time.avg.ms.__cond_resched.down_write_killable.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_64
      0.27 ±120%    +326.2%       1.14 ± 38%  perf-sched.wait_time.avg.ms.__cond_resched.dput.__fput.__x64_sys_close.do_syscall_64
      0.79 ± 16%    +429.0%       4.17 ±  6%  perf-sched.wait_time.avg.ms.__cond_resched.get_random_bytes_user.vfs_read.ksys_read.do_syscall_64
      1.01 ± 39%    +274.4%       3.79 ± 17%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc_noprof.__anon_vma_prepare.__vmf_anon_prepare.do_anonymous_page
      0.41 ± 84%    +841.7%       3.89 ± 10%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc_noprof.mas_alloc_nodes.mas_preallocate.__mmap_new_vma
      0.62 ±107%    +594.8%       4.32 ± 12%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc_noprof.mas_alloc_nodes.mas_preallocate.__split_vma
      0.91 ± 24%    +334.0%       3.96 ±  8%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc_noprof.vm_area_alloc.__mmap_new_vma.__mmap_region
      0.88 ± 56%    +427.2%       4.62 ± 20%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc_noprof.vm_area_dup.__split_vma.vms_gather_munmap_vmas
      0.76 ±123%    +409.7%       3.85 ± 10%  perf-sched.wait_time.avg.ms.__cond_resched.remove_vma.vms_complete_munmap_vmas.do_vmi_align_munmap.do_vmi_munmap
    614.74 ± 37%     -79.6%     125.10 ±  9%  perf-sched.wait_time.avg.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.67 ±223%    +675.2%       5.16 ± 53%  perf-sched.wait_time.avg.ms.__cond_resched.unmap_page_range.unmap_vmas.vms_clear_ptes.part
      0.72 ± 15%    +501.7%       4.35 ± 12%  perf-sched.wait_time.avg.ms.__cond_resched.unmap_vmas.vms_clear_ptes.part.0
      0.49 ±128%    +766.2%       4.28 ± 14%  perf-sched.wait_time.avg.ms.__cond_resched.zap_pmd_range.isra.0.unmap_page_range
      0.38 ± 89%   +1012.1%       4.27 ± 15%  perf-sched.wait_time.avg.ms.__cond_resched.zap_pte_range.zap_pmd_range.isra.0
    583.65 ± 31%     -86.1%      80.90 ± 98%  perf-sched.wait_time.avg.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      1.08 ± 42%    +274.0%       4.06 ± 16%  perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
    198.14 ± 29%     -71.0%      57.54 ± 14%  perf-sched.wait_time.avg.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
    150.47 ±141%     -80.4%      29.44 ± 34%  perf-sched.wait_time.avg.ms.schedule_hrtimeout_range.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
      1.96 ± 11%     +47.1%       2.89 ± 10%  perf-sched.wait_time.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
    570.77 ±  5%     -64.5%     202.51 ±  3%  perf-sched.wait_time.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.50 ± 31%     +67.4%       0.83 ± 31%  perf-sched.wait_time.avg.ms.wait_for_partner.fifo_open.do_dentry_open.vfs_open
      2.25 ± 65%    +691.5%      17.82 ± 36%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_mpol_noprof.vma_alloc_folio_noprof
      4.36 ± 10%    +332.5%      18.85 ±  7%  perf-sched.wait_time.max.ms.__cond_resched.__anon_vma_prepare.__vmf_anon_prepare.do_anonymous_page.__handle_mm_fault
      1.34 ±140%  +13127.3%     177.71 ±207%  perf-sched.wait_time.max.ms.__cond_resched.__kmalloc_node_noprof.alloc_slab_obj_exts.allocate_slab.___slab_alloc
      1.24 ±131%    +950.0%      12.97 ± 26%  perf-sched.wait_time.max.ms.__cond_resched.__put_anon_vma.unlink_anon_vmas.free_pgtables.vms_clear_ptes
      1.84 ±101%    +650.5%      13.82 ± 24%  perf-sched.wait_time.max.ms.__cond_resched.change_pmd_range.isra.0.change_pud_range
      3.34 ± 44%    +387.0%      16.29 ± 12%  perf-sched.wait_time.max.ms.__cond_resched.change_pud_range.isra.0.change_protection_range
      3.99 ± 14%    +347.3%      17.84 ±  6%  perf-sched.wait_time.max.ms.__cond_resched.do_select.core_sys_select.do_pselect.constprop
      2.54 ± 69%    +529.0%      15.96 ± 17%  perf-sched.wait_time.max.ms.__cond_resched.down_write.__anon_vma_prepare.__vmf_anon_prepare.do_anonymous_page
      1.85 ±100%    +635.1%      13.58 ± 19%  perf-sched.wait_time.max.ms.__cond_resched.down_write.__mmap_new_vma.__mmap_region.do_mmap
      3.52 ± 50%    +396.3%      17.45 ± 10%  perf-sched.wait_time.max.ms.__cond_resched.down_write.__split_vma.vms_gather_munmap_vmas.do_vmi_align_munmap
      2.04 ± 95%    +505.0%      12.36 ± 29%  perf-sched.wait_time.max.ms.__cond_resched.down_write.unlink_anon_vmas.free_pgtables.vms_clear_ptes
      4.51 ± 16%    +293.6%      17.73 ±  3%  perf-sched.wait_time.max.ms.__cond_resched.down_write.vma_merge_existing_range.vma_modify.constprop
      3.36 ± 43%    +411.0%      17.19 ±  9%  perf-sched.wait_time.max.ms.__cond_resched.down_write.vms_gather_munmap_vmas.do_vmi_align_munmap.do_vmi_munmap
      1.90 ± 95%    +685.3%      14.90 ±  8%  perf-sched.wait_time.max.ms.__cond_resched.down_write_killable.__vm_munmap.__x64_sys_munmap.do_syscall_64
      3.20 ± 43%    +344.9%      14.24 ± 17%  perf-sched.wait_time.max.ms.__cond_resched.down_write_killable.do_mprotect_pkey.__x64_sys_mprotect.do_syscall_64
      0.06 ±172%   +3125.8%       2.04 ±196%  perf-sched.wait_time.max.ms.__cond_resched.down_write_killable.exec_mmap.begin_new_exec.load_elf_binary
      1.72 ± 95%    +781.2%      15.19 ± 11%  perf-sched.wait_time.max.ms.__cond_resched.down_write_killable.vm_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe
      3.81 ± 84%    +293.2%      14.98 ± 14%  perf-sched.wait_time.max.ms.__cond_resched.down_write_killable.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_64
      0.57 ±119%    +486.4%       3.34 ± 15%  perf-sched.wait_time.max.ms.__cond_resched.dput.__fput.__x64_sys_close.do_syscall_64
      9.87 ± 45%    +173.2%      26.96 ± 25%  perf-sched.wait_time.max.ms.__cond_resched.get_random_bytes_user.vfs_read.ksys_read.do_syscall_64
      4.17 ±  8%    +334.7%      18.11 ±  6%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc_noprof.__anon_vma_prepare.__vmf_anon_prepare.do_anonymous_page
      2.69 ± 69%    +549.1%      17.45 ±  6%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc_noprof.mas_alloc_nodes.mas_preallocate.__mmap_new_vma
      2.53 ± 62%    +623.6%      18.31 ±  8%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc_noprof.mas_alloc_nodes.mas_preallocate.__split_vma
      4.95 ± 15%    +263.6%      18.01 ±  4%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc_noprof.vm_area_alloc.__mmap_new_vma.__mmap_region
      4.01          +349.5%      18.01 ±  5%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc_noprof.vm_area_dup.__split_vma.vms_gather_munmap_vmas
      2.05 ± 94%    +623.6%      14.86 ± 10%  perf-sched.wait_time.max.ms.__cond_resched.remove_vma.vms_complete_munmap_vmas.do_vmi_align_munmap.do_vmi_munmap
      1736 ± 28%     -62.5%     651.96 ± 71%  perf-sched.wait_time.max.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.67 ±223%   +1572.4%      11.14 ± 37%  perf-sched.wait_time.max.ms.__cond_resched.unmap_page_range.unmap_vmas.vms_clear_ptes.part
      9.27 ± 50%    +144.1%      22.62 ± 22%  perf-sched.wait_time.max.ms.__cond_resched.unmap_vmas.vms_clear_ptes.part.0
      1.37 ±135%   +1172.5%      17.45 ±  6%  perf-sched.wait_time.max.ms.__cond_resched.zap_pmd_range.isra.0.unmap_page_range
      2.27 ± 76%    +673.2%      17.56 ±  5%  perf-sched.wait_time.max.ms.__cond_resched.zap_pte_range.zap_pmd_range.isra.0
    834.21 ± 44%     -99.6%       3.40 ±  8%  perf-sched.wait_time.max.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      5.53 ± 18%    +152.5%      13.95 ± 20%  perf-sched.wait_time.max.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
      4.92 ± 51%    +251.2%      17.28 ± 12%  perf-sched.wait_time.max.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
      8.16 ±  7%    +106.5%      16.85 ± 29%  perf-sched.wait_time.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      4073 ± 14%     -67.4%       1326 ± 22%  perf-sched.wait_time.max.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
     68.41           -65.4        3.02        perf-profile.calltrace.cycles-pp.vms_clear_ptes.vms_complete_munmap_vmas.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap
     68.53           -65.2        3.38        perf-profile.calltrace.cycles-pp.vms_complete_munmap_vmas.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap.__x64_sys_munmap
     69.98           -61.6        8.34        perf-profile.calltrace.cycles-pp.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap.__x64_sys_munmap.do_syscall_64
     70.02           -61.5        8.48        perf-profile.calltrace.cycles-pp.do_vmi_munmap.__vm_munmap.__x64_sys_munmap.do_syscall_64.entry_SYSCALL_64_after_hwframe
     70.06           -61.5        8.58        perf-profile.calltrace.cycles-pp.__vm_munmap.__x64_sys_munmap.do_syscall_64.entry_SYSCALL_64_after_hwframe.__munmap
     70.06           -61.5        8.58        perf-profile.calltrace.cycles-pp.__x64_sys_munmap.do_syscall_64.entry_SYSCALL_64_after_hwframe.__munmap
     70.10           -61.4        8.67        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__munmap
     70.11           -61.4        8.68        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__munmap
     70.17           -61.3        8.84        perf-profile.calltrace.cycles-pp.__munmap
     34.18           -34.2        0.00        perf-profile.calltrace.cycles-pp.lru_add_drain.vms_clear_ptes.vms_complete_munmap_vmas.do_vmi_align_munmap.do_vmi_munmap
     34.18           -34.2        0.00        perf-profile.calltrace.cycles-pp.lru_add_drain_cpu.lru_add_drain.vms_clear_ptes.vms_complete_munmap_vmas.do_vmi_align_munmap
     34.16           -34.2        0.00        perf-profile.calltrace.cycles-pp.folio_batch_move_lru.lru_add_drain_cpu.lru_add_drain.vms_clear_ptes.vms_complete_munmap_vmas
     33.19           -33.2        0.00        perf-profile.calltrace.cycles-pp.folio_lruvec_lock_irqsave.folio_batch_move_lru.lru_add_drain_cpu.lru_add_drain.vms_clear_ptes
     33.18           -33.2        0.00        perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.folio_lruvec_lock_irqsave.folio_batch_move_lru.lru_add_drain_cpu.lru_add_drain
     33.05           -33.0        0.00        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.folio_lruvec_lock_irqsave.folio_batch_move_lru.lru_add_drain_cpu
     33.61           -32.8        0.79 ±  5%  perf-profile.calltrace.cycles-pp.free_pages_and_swap_cache.__tlb_batch_free_encoded_pages.tlb_finish_mmu.vms_clear_ptes.vms_complete_munmap_vmas
     33.62           -32.8        0.82 ±  5%  perf-profile.calltrace.cycles-pp.__tlb_batch_free_encoded_pages.tlb_finish_mmu.vms_clear_ptes.vms_complete_munmap_vmas.do_vmi_align_munmap
     33.54           -32.8        0.76 ±  5%  perf-profile.calltrace.cycles-pp.folios_put_refs.free_pages_and_swap_cache.__tlb_batch_free_encoded_pages.tlb_finish_mmu.vms_clear_ptes
     33.78           -32.4        1.37 ±  3%  perf-profile.calltrace.cycles-pp.tlb_finish_mmu.vms_clear_ptes.vms_complete_munmap_vmas.do_vmi_align_munmap.do_vmi_munmap
     32.60           -32.0        0.59 ±  7%  perf-profile.calltrace.cycles-pp.__page_cache_release.folios_put_refs.free_pages_and_swap_cache.__tlb_batch_free_encoded_pages.tlb_finish_mmu
     32.39           -31.8        0.56 ±  7%  perf-profile.calltrace.cycles-pp.folio_lruvec_lock_irqsave.__page_cache_release.folios_put_refs.free_pages_and_swap_cache.__tlb_batch_free_encoded_pages
     32.38           -31.8        0.56 ±  7%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.folio_lruvec_lock_irqsave.__page_cache_release.folios_put_refs.free_pages_and_swap_cache
     32.28           -31.2        1.09 ± 22%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.folio_lruvec_lock_irqsave.__page_cache_release.folios_put_refs
      0.92 ± 45%      +0.4        1.28 ±  2%  perf-profile.calltrace.cycles-pp.rcu_core.handle_softirqs.__irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
      0.92 ± 45%      +0.4        1.28 ±  2%  perf-profile.calltrace.cycles-pp.rcu_do_batch.rcu_core.handle_softirqs.__irq_exit_rcu.sysvec_apic_timer_interrupt
      0.00            +0.5        0.50        perf-profile.calltrace.cycles-pp.perf_event_mmap.mprotect_fixup.do_mprotect_pkey.__x64_sys_mprotect.do_syscall_64
      0.00            +0.5        0.52        perf-profile.calltrace.cycles-pp.perf_event_mmap_event.perf_event_mmap.__mmap_region.do_mmap.vm_mmap_pgoff
      0.00            +0.5        0.53        perf-profile.calltrace.cycles-pp.alloc_pages_mpol.folio_alloc_mpol_noprof.vma_alloc_folio_noprof.alloc_anon_folio.do_anonymous_page
      0.00            +0.5        0.54 ±  2%  perf-profile.calltrace.cycles-pp.folio_alloc_mpol_noprof.vma_alloc_folio_noprof.alloc_anon_folio.do_anonymous_page.__handle_mm_fault
      0.00            +0.5        0.54        perf-profile.calltrace.cycles-pp.mas_store_gfp.vms_gather_munmap_vmas.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap
      0.00            +0.6        0.55 ±  2%  perf-profile.calltrace.cycles-pp.vm_area_free_rcu_cb.rcu_do_batch.rcu_core.handle_softirqs.run_ksoftirqd
      0.00            +0.6        0.57        perf-profile.calltrace.cycles-pp.vma_alloc_folio_noprof.alloc_anon_folio.do_anonymous_page.__handle_mm_fault.handle_mm_fault
      0.00            +0.6        0.57        perf-profile.calltrace.cycles-pp.perf_event_mmap.__mmap_region.do_mmap.vm_mmap_pgoff.do_syscall_64
      0.00            +0.6        0.58        perf-profile.calltrace.cycles-pp.zap_pmd_range.unmap_page_range.unmap_vmas.vms_clear_ptes.vms_complete_munmap_vmas
      0.00            +0.6        0.58        perf-profile.calltrace.cycles-pp.mas_store_prealloc.vma_complete.__split_vma.vms_gather_munmap_vmas.do_vmi_align_munmap
      0.00            +0.6        0.59        perf-profile.calltrace.cycles-pp.do_pselect.__x64_sys_pselect6.do_syscall_64.entry_SYSCALL_64_after_hwframe.__select
      0.00            +0.6        0.61        perf-profile.calltrace.cycles-pp.vma_complete.__split_vma.vms_gather_munmap_vmas.do_vmi_align_munmap.do_vmi_munmap
      0.00            +0.6        0.61        perf-profile.calltrace.cycles-pp.__x64_sys_pselect6.do_syscall_64.entry_SYSCALL_64_after_hwframe.__select
      0.00            +0.6        0.63 ±  7%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.folio_lruvec_lock_irqsave.__page_cache_release.folios_put_refs.folio_batch_move_lru
      0.00            +0.6        0.63 ±  7%  perf-profile.calltrace.cycles-pp.folio_lruvec_lock_irqsave.__page_cache_release.folios_put_refs.folio_batch_move_lru.__folio_batch_add_and_move
      0.00            +0.6        0.65        perf-profile.calltrace.cycles-pp.free_pgtables.vms_clear_ptes.vms_complete_munmap_vmas.do_vmi_align_munmap.do_vmi_munmap
      0.00            +0.7        0.65        perf-profile.calltrace.cycles-pp.__mmap_prepare.__mmap_region.do_mmap.vm_mmap_pgoff.do_syscall_64
      0.00            +0.7        0.69        perf-profile.calltrace.cycles-pp.kmem_cache_alloc_noprof.vm_area_alloc.__mmap_new_vma.__mmap_region.do_mmap
      0.00            +0.7        0.69        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__select
      0.00            +0.7        0.70        perf-profile.calltrace.cycles-pp.vma_merge_existing_range.vma_modify.vma_modify_flags.mprotect_fixup.do_mprotect_pkey
      0.00            +0.7        0.71        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__select
      0.00            +0.7        0.72        perf-profile.calltrace.cycles-pp.vma_modify.vma_modify_flags.mprotect_fixup.do_mprotect_pkey.__x64_sys_mprotect
      0.00            +0.7        0.74        perf-profile.calltrace.cycles-pp.unmap_page_range.unmap_vmas.vms_clear_ptes.vms_complete_munmap_vmas.do_vmi_align_munmap
      0.00            +0.7        0.74        perf-profile.calltrace.cycles-pp.vma_modify_flags.mprotect_fixup.do_mprotect_pkey.__x64_sys_mprotect.do_syscall_64
      0.00            +0.8        0.75        perf-profile.calltrace.cycles-pp.kmem_cache_alloc_noprof.vm_area_dup.__split_vma.vms_gather_munmap_vmas.do_vmi_align_munmap
      0.00            +0.8        0.77 ±  6%  perf-profile.calltrace.cycles-pp.__page_cache_release.folios_put_refs.folio_batch_move_lru.__folio_batch_add_and_move.do_anonymous_page
      0.00            +0.8        0.77        perf-profile.calltrace.cycles-pp.arch_get_unmapped_area_topdown.__get_unmapped_area.do_mmap.vm_mmap_pgoff.do_syscall_64
      0.00            +0.8        0.78 ±  2%  perf-profile.calltrace.cycles-pp.alloc_anon_folio.do_anonymous_page.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
      0.00            +0.8        0.81        perf-profile.calltrace.cycles-pp.vm_area_alloc.__mmap_new_vma.__mmap_region.do_mmap.vm_mmap_pgoff
      0.00            +0.8        0.82        perf-profile.calltrace.cycles-pp.__get_unmapped_area.do_mmap.vm_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +0.9        0.86        perf-profile.calltrace.cycles-pp.arch_get_unmapped_area_topdown.__get_unmapped_area.do_mmap.vm_mmap_pgoff.ksys_mmap_pgoff
      0.00            +0.9        0.88        perf-profile.calltrace.cycles-pp.unmap_vmas.vms_clear_ptes.vms_complete_munmap_vmas.do_vmi_align_munmap.do_vmi_munmap
      0.00            +0.9        0.88        perf-profile.calltrace.cycles-pp.vm_area_dup.__split_vma.vms_gather_munmap_vmas.do_vmi_align_munmap.do_vmi_munmap
      0.00            +0.9        0.90        perf-profile.calltrace.cycles-pp.__select
      0.00            +0.9        0.91        perf-profile.calltrace.cycles-pp.__get_unmapped_area.do_mmap.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_64
      0.54            +0.9        1.48        perf-profile.calltrace.cycles-pp.chacha_block_generic.crng_fast_key_erasure.crng_make_state.get_random_bytes_user.vfs_read
      0.00            +0.9        0.94        perf-profile.calltrace.cycles-pp.kmem_cache_free.rcu_do_batch.rcu_core.handle_softirqs.__irq_exit_rcu
      0.00            +1.0        0.95        perf-profile.calltrace.cycles-pp.__anon_vma_prepare.__vmf_anon_prepare.do_anonymous_page.__handle_mm_fault.handle_mm_fault
      0.00            +1.0        0.97        perf-profile.calltrace.cycles-pp.mas_store_gfp.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap.__x64_sys_munmap
      0.00            +1.0        0.98        perf-profile.calltrace.cycles-pp.__vmf_anon_prepare.do_anonymous_page.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
      0.00            +1.0        1.00        perf-profile.calltrace.cycles-pp.do_mmap.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +1.0        1.00 ±  5%  perf-profile.calltrace.cycles-pp.folios_put_refs.folio_batch_move_lru.__folio_batch_add_and_move.do_anonymous_page.__handle_mm_fault
      0.59            +1.0        1.62        perf-profile.calltrace.cycles-pp.crng_fast_key_erasure.crng_make_state.get_random_bytes_user.vfs_read.ksys_read
      0.61            +1.0        1.65        perf-profile.calltrace.cycles-pp.mprotect_fixup.do_mprotect_pkey.__x64_sys_mprotect.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.55            +1.1        1.66        perf-profile.calltrace.cycles-pp.__mmap_new_vma.__mmap_region.do_mmap.vm_mmap_pgoff.do_syscall_64
      0.00            +1.1        1.12 ±  2%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.__put_partials.kmem_cache_free.rcu_do_batch
      0.00            +1.1        1.13 ±  3%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.__put_partials.kmem_cache_free.rcu_do_batch.rcu_core
      0.64            +1.1        1.77        perf-profile.calltrace.cycles-pp.crng_make_state.get_random_bytes_user.vfs_read.ksys_read.do_syscall_64
      0.00            +1.2        1.17        perf-profile.calltrace.cycles-pp.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe.__mmap
      0.00            +1.3        1.29 ±  2%  perf-profile.calltrace.cycles-pp.__irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.chacha_permute.chacha_block_generic
      0.00            +1.3        1.29 ±  2%  perf-profile.calltrace.cycles-pp.handle_softirqs.__irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.chacha_permute
      0.00            +1.3        1.30 ±  2%  perf-profile.calltrace.cycles-pp.__put_partials.kmem_cache_free.rcu_do_batch.rcu_core.handle_softirqs
      0.00            +1.3        1.30        perf-profile.calltrace.cycles-pp.ksys_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe.__mmap
      0.00            +1.3        1.33        perf-profile.calltrace.cycles-pp.chacha_permute.chacha_block_generic.crng_fast_key_erasure.crng_make_state.get_random_bytes_user
      0.00            +1.5        1.47        perf-profile.calltrace.cycles-pp.unmapped_area_topdown.vm_unmapped_area.arch_get_unmapped_area_topdown.__get_unmapped_area.do_mmap
      0.87            +1.5        2.34        perf-profile.calltrace.cycles-pp.do_mprotect_pkey.__x64_sys_mprotect.do_syscall_64.entry_SYSCALL_64_after_hwframe.__mprotect
      0.00            +1.5        1.49        perf-profile.calltrace.cycles-pp.vm_unmapped_area.arch_get_unmapped_area_topdown.__get_unmapped_area.do_mmap.vm_mmap_pgoff
      0.87            +1.5        2.37        perf-profile.calltrace.cycles-pp.__x64_sys_mprotect.do_syscall_64.entry_SYSCALL_64_after_hwframe.__mprotect
      0.90            +1.5        2.45        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__mprotect
      0.91            +1.6        2.46        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__mprotect
      0.00            +1.7        1.65        perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.chacha_permute.chacha_block_generic.get_random_bytes_user
      0.97            +1.7        2.63        perf-profile.calltrace.cycles-pp.__mprotect
      0.00            +1.7        1.66        perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.chacha_permute.chacha_block_generic.get_random_bytes_user.vfs_read
      0.68            +1.7        2.36        perf-profile.calltrace.cycles-pp.__split_vma.vms_gather_munmap_vmas.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap
      0.00            +1.9        1.86 ±  5%  perf-profile.calltrace.cycles-pp.folio_batch_move_lru.__folio_batch_add_and_move.do_anonymous_page.__handle_mm_fault.handle_mm_fault
      0.00            +1.9        1.89 ±  5%  perf-profile.calltrace.cycles-pp.__folio_batch_add_and_move.do_anonymous_page.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
      1.10            +2.0        3.14        perf-profile.calltrace.cycles-pp.__mmap_region.do_mmap.vm_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +2.2        2.20 ±  3%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.__slab_free.kmem_cache_free.rcu_do_batch
      0.00            +2.2        2.24 ±  3%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.__slab_free.kmem_cache_free.rcu_do_batch.rcu_core
      1.42            +2.6        4.04        perf-profile.calltrace.cycles-pp.do_mmap.vm_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe.__mmap
      1.10            +2.7        3.76        perf-profile.calltrace.cycles-pp.vms_gather_munmap_vmas.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap.__x64_sys_munmap
      1.46            +2.7        4.17        perf-profile.calltrace.cycles-pp.vm_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe.__mmap
      0.00            +2.7        2.72 ±  3%  perf-profile.calltrace.cycles-pp.__slab_free.kmem_cache_free.rcu_do_batch.rcu_core.handle_softirqs
      0.71            +3.4        4.10 ±  2%  perf-profile.calltrace.cycles-pp.do_anonymous_page.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.exc_page_fault
      0.78            +3.5        4.28 ±  2%  perf-profile.calltrace.cycles-pp.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      0.84            +3.6        4.45 ±  2%  perf-profile.calltrace.cycles-pp.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc_page_fault._copy_to_iter
      1.99            +3.7        5.65        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__mmap
      2.01            +3.7        5.68        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__mmap
      2.15            +3.9        6.04        perf-profile.calltrace.cycles-pp.__mmap
      1.09            +4.1        5.19 ±  2%  perf-profile.calltrace.cycles-pp.do_user_addr_fault.exc_page_fault.asm_exc_page_fault._copy_to_iter.get_random_bytes_user
      0.00            +4.3        4.31 ±  2%  perf-profile.calltrace.cycles-pp.kmem_cache_free.rcu_do_batch.rcu_core.handle_softirqs.run_ksoftirqd
      1.20            +4.3        5.52        perf-profile.calltrace.cycles-pp.exc_page_fault.asm_exc_page_fault._copy_to_iter.get_random_bytes_user.vfs_read
      0.00            +5.4        5.41 ±  2%  perf-profile.calltrace.cycles-pp.rcu_do_batch.rcu_core.handle_softirqs.run_ksoftirqd.smpboot_thread_fn
      0.00            +5.4        5.42 ±  2%  perf-profile.calltrace.cycles-pp.handle_softirqs.run_ksoftirqd.smpboot_thread_fn.kthread.ret_from_fork
      0.00            +5.4        5.42 ±  2%  perf-profile.calltrace.cycles-pp.rcu_core.handle_softirqs.run_ksoftirqd.smpboot_thread_fn.kthread
      0.00            +5.4        5.42 ±  2%  perf-profile.calltrace.cycles-pp.run_ksoftirqd.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.00            +5.4        5.43 ±  2%  perf-profile.calltrace.cycles-pp.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.00            +5.4        5.45 ±  2%  perf-profile.calltrace.cycles-pp.kthread.ret_from_fork.ret_from_fork_asm
      0.00            +5.4        5.45 ±  2%  perf-profile.calltrace.cycles-pp.ret_from_fork.ret_from_fork_asm
      0.00            +5.4        5.45 ±  2%  perf-profile.calltrace.cycles-pp.ret_from_fork_asm
      2.84            +6.8        9.67        perf-profile.calltrace.cycles-pp.asm_exc_page_fault._copy_to_iter.get_random_bytes_user.vfs_read.ksys_read
      4.14           +10.0       14.09        perf-profile.calltrace.cycles-pp._copy_to_iter.get_random_bytes_user.vfs_read.ksys_read.do_syscall_64
     17.08           +32.1       49.17        perf-profile.calltrace.cycles-pp.chacha_permute.chacha_block_generic.get_random_bytes_user.vfs_read.ksys_read
     19.02           +35.6       54.62        perf-profile.calltrace.cycles-pp.chacha_block_generic.get_random_bytes_user.vfs_read.ksys_read.do_syscall_64
     24.82           +47.6       72.45        perf-profile.calltrace.cycles-pp.get_random_bytes_user.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
     25.10           +48.1       73.20        perf-profile.calltrace.cycles-pp.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
     25.16           +48.2       73.34        perf-profile.calltrace.cycles-pp.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
     25.27           +48.4       73.66        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
     25.29           +48.4       73.70        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.read
     25.48           +48.7       74.19        perf-profile.calltrace.cycles-pp.read
     68.41           -65.4        3.02        perf-profile.children.cycles-pp.vms_clear_ptes
     68.54           -65.1        3.41        perf-profile.children.cycles-pp.vms_complete_munmap_vmas
     65.60           -63.9        1.72 ±  7%  perf-profile.children.cycles-pp.folio_lruvec_lock_irqsave
     69.98           -61.6        8.35        perf-profile.children.cycles-pp.do_vmi_align_munmap
     70.03           -61.5        8.48        perf-profile.children.cycles-pp.do_vmi_munmap
     70.06           -61.5        8.58        perf-profile.children.cycles-pp.__vm_munmap
     70.06           -61.5        8.59        perf-profile.children.cycles-pp.__x64_sys_munmap
     70.20           -61.3        8.92        perf-profile.children.cycles-pp.__munmap
     66.28           -59.6        6.66 ±  2%  perf-profile.children.cycles-pp._raw_spin_lock_irqsave
     66.03           -59.5        6.52 ±  2%  perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
     34.19           -34.2        0.00        perf-profile.children.cycles-pp.lru_add_drain
     34.18           -34.2        0.00        perf-profile.children.cycles-pp.lru_add_drain_cpu
     33.61           -32.8        0.80 ±  5%  perf-profile.children.cycles-pp.free_pages_and_swap_cache
     33.62           -32.8        0.83 ±  5%  perf-profile.children.cycles-pp.__tlb_batch_free_encoded_pages
     33.79           -32.4        1.41 ±  3%  perf-profile.children.cycles-pp.tlb_finish_mmu
     34.19           -32.3        1.86 ±  5%  perf-profile.children.cycles-pp.folio_batch_move_lru
     33.65           -31.9        1.76 ±  5%  perf-profile.children.cycles-pp.folios_put_refs
     32.61           -31.2        1.36 ±  6%  perf-profile.children.cycles-pp.__page_cache_release
     98.82            -7.0       91.82        perf-profile.children.cycles-pp.do_syscall_64
     98.86            -6.9       91.94        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.26 ±  2%      -0.2        0.08 ±  4%  perf-profile.children.cycles-pp.uncharge_batch
      0.26 ±  3%      -0.2        0.08 ±  5%  perf-profile.children.cycles-pp.page_counter_uncharge
      0.28            -0.2        0.11 ±  5%  perf-profile.children.cycles-pp.__mem_cgroup_uncharge_folios
      0.24 ±  3%      -0.2        0.08 ±  6%  perf-profile.children.cycles-pp.page_counter_cancel
      0.26            -0.0        0.24 ±  2%  perf-profile.children.cycles-pp.lru_add
      0.18            -0.0        0.15 ±  2%  perf-profile.children.cycles-pp.lru_gen_add_folio
      0.03 ± 70%      +0.0        0.08 ±  6%  perf-profile.children.cycles-pp.perf_mmap__read_head
      0.00            +0.1        0.05        perf-profile.children.cycles-pp.__task_pid_nr_ns
      0.00            +0.1        0.05        perf-profile.children.cycles-pp.access_error
      0.00            +0.1        0.05        perf-profile.children.cycles-pp.can_vma_merge_right
      0.00            +0.1        0.05        perf-profile.children.cycles-pp.down_read_trylock
      0.00            +0.1        0.05        perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
      0.00            +0.1        0.05        perf-profile.children.cycles-pp.handle_pte_fault
      0.00            +0.1        0.05        perf-profile.children.cycles-pp.mas_next_range
      0.00            +0.1        0.05        perf-profile.children.cycles-pp.mas_put_in_tree
      0.00            +0.1        0.06 ±  8%  perf-profile.children.cycles-pp.kfree
      0.00            +0.1        0.06        perf-profile.children.cycles-pp.__mod_node_page_state
      0.00            +0.1        0.06        perf-profile.children.cycles-pp.cgroup_rstat_updated
      0.00            +0.1        0.06        perf-profile.children.cycles-pp.init_multi_vma_prep
      0.00            +0.1        0.06        perf-profile.children.cycles-pp.mas_destroy
      0.00            +0.1        0.06        perf-profile.children.cycles-pp.native_sched_clock
      0.00            +0.1        0.06        perf-profile.children.cycles-pp.random_ioctl
      0.00            +0.1        0.06 ±  6%  perf-profile.children.cycles-pp.__memset
      0.00            +0.1        0.06 ±  7%  perf-profile.children.cycles-pp.__thp_vma_allowable_orders
      0.00            +0.1        0.06 ±  7%  perf-profile.children.cycles-pp.ktime_get_update_offsets_now
      0.02 ± 99%      +0.1        0.09        perf-profile.children.cycles-pp.security_vm_enough_memory_mm
      0.05            +0.1        0.12 ±  4%  perf-profile.children.cycles-pp.fdget_pos
      0.00            +0.1        0.07 ±  7%  perf-profile.children.cycles-pp.__fsnotify_parent
      0.00            +0.1        0.07 ±  5%  perf-profile.children.cycles-pp.fget
      0.05            +0.1        0.12        perf-profile.children.cycles-pp._copy_from_user
      0.00            +0.1        0.07        perf-profile.children.cycles-pp.get_timespec64
      0.00            +0.1        0.07        perf-profile.children.cycles-pp.local_clock_noinstr
      0.00            +0.1        0.07        perf-profile.children.cycles-pp.vma_set_page_prot
      0.00            +0.1        0.07 ±  5%  perf-profile.children.cycles-pp.ring_buffer_read_head
      0.01 ±223%      +0.1        0.08 ±  4%  perf-profile.children.cycles-pp.rw_verify_area
      0.00            +0.1        0.08 ±  6%  perf-profile.children.cycles-pp.fdget
      0.06 ±  8%      +0.1        0.13 ±  2%  perf-profile.children.cycles-pp.x64_sys_call
      0.05            +0.1        0.13 ±  2%  perf-profile.children.cycles-pp.perf_output_begin
      0.00            +0.1        0.08 ±  4%  perf-profile.children.cycles-pp.sized_strscpy
      0.00            +0.1        0.08        perf-profile.children.cycles-pp.fault_in_iov_iter_readable
      0.00            +0.1        0.08        perf-profile.children.cycles-pp.fault_in_readable
      0.00            +0.1        0.08        perf-profile.children.cycles-pp.free_unref_folios
      0.00            +0.1        0.08        perf-profile.children.cycles-pp.local_clock
      0.00            +0.1        0.08        perf-profile.children.cycles-pp.percpu_counter_add_batch
      0.00            +0.1        0.08        perf-profile.children.cycles-pp.security_mmap_file
      0.00            +0.1        0.08        perf-profile.children.cycles-pp.syscall_exit_to_user_mode_prepare
      0.00            +0.1        0.08        perf-profile.children.cycles-pp.tlb_gather_mmu
      0.00            +0.1        0.08        perf-profile.children.cycles-pp.up_read
      0.06 ±  9%      +0.1        0.14        perf-profile.children.cycles-pp.syscall_return_via_sysret
      0.00            +0.1        0.08 ±  4%  perf-profile.children.cycles-pp.rmqueue_bulk
      0.00            +0.1        0.08 ±  5%  perf-profile.children.cycles-pp.task_tick_fair
      0.00            +0.1        0.08 ± 13%  perf-profile.children.cycles-pp.get_mem_cgroup_from_mm
      0.00            +0.1        0.09 ±  5%  perf-profile.children.cycles-pp.call_rcu
      0.00            +0.1        0.09 ±  5%  perf-profile.children.cycles-pp.try_charge_memcg
      0.00            +0.1        0.09 ±  7%  perf-profile.children.cycles-pp.clock_gettime
      0.00            +0.1        0.09 ±  7%  perf-profile.children.cycles-pp.get_partial_node
      0.00            +0.1        0.09        perf-profile.children.cycles-pp.___pte_offset_map
      0.00            +0.1        0.09        perf-profile.children.cycles-pp.charge_memcg
      0.00            +0.1        0.09        perf-profile.children.cycles-pp.cmp_ex_search
      0.00            +0.1        0.09        perf-profile.children.cycles-pp.error_entry
      0.02 ± 99%      +0.1        0.12 ±  4%  perf-profile.children.cycles-pp.khugepaged_enter_vma
      0.00            +0.1        0.09 ±  9%  perf-profile.children.cycles-pp.__init_rwsem
      0.00            +0.1        0.09 ±  4%  perf-profile.children.cycles-pp.stress_time_now
      0.07 ±  7%      +0.1        0.16 ±  5%  perf-profile.children.cycles-pp.sched_tick
      0.06 ±  9%      +0.1        0.15        perf-profile.children.cycles-pp.__x64_sys_ioctl
      0.00            +0.1        0.10 ±  3%  perf-profile.children.cycles-pp.copy_page_from_iter_atomic
      0.05            +0.1        0.15        perf-profile.children.cycles-pp.bsearch
      0.06            +0.1        0.16        perf-profile.children.cycles-pp.___perf_sw_event
      0.06            +0.1        0.16        perf-profile.children.cycles-pp.mas_prev
      0.06            +0.1        0.16        perf-profile.children.cycles-pp.mas_update_gap
      0.06            +0.1        0.16        perf-profile.children.cycles-pp.search_exception_tables
      0.00            +0.1        0.10        perf-profile.children.cycles-pp.mas_leaf_max_gap
      0.00            +0.1        0.10        perf-profile.children.cycles-pp.mas_prev_setup
      0.06            +0.1        0.16 ±  2%  perf-profile.children.cycles-pp.change_pmd_range
      0.05            +0.1        0.15 ±  3%  perf-profile.children.cycles-pp.search_extable
      0.07 ±  7%      +0.1        0.17        perf-profile.children.cycles-pp.__perf_event_header__init_id
      0.06            +0.1        0.17 ±  2%  perf-profile.children.cycles-pp.mas_wr_store_entry
      0.00            +0.1        0.11 ±  3%  perf-profile.children.cycles-pp.stress_time_now_timespec
      0.00            +0.1        0.11        perf-profile.children.cycles-pp.change_pte_range
      0.00            +0.1        0.11 ±  4%  perf-profile.children.cycles-pp.__mt_destroy
      0.02 ± 99%      +0.1        0.14 ±  2%  perf-profile.children.cycles-pp._raw_spin_lock
      0.00            +0.1        0.12        perf-profile.children.cycles-pp.refill_obj_stock
      0.07            +0.1        0.19        perf-profile.children.cycles-pp.__perf_sw_event
      0.00            +0.1        0.12 ±  5%  perf-profile.children.cycles-pp.clear_page_erms
      0.09 ±  5%      +0.1        0.22 ±  2%  perf-profile.children.cycles-pp.stress_urandom
      0.06            +0.1        0.18 ±  2%  perf-profile.children.cycles-pp.__put_anon_vma
      0.07 ±  7%      +0.1        0.19        perf-profile.children.cycles-pp.fixup_exception
      0.06 ±  6%      +0.1        0.19 ±  2%  perf-profile.children.cycles-pp.mas_pop_node
      0.08            +0.1        0.21        perf-profile.children.cycles-pp.do_select
      0.03 ± 70%      +0.1        0.16 ±  5%  perf-profile.children.cycles-pp.mas_prev_range
      0.07            +0.1        0.20        perf-profile.children.cycles-pp.kernelmode_fixup_or_oops
      0.06 ± 19%      +0.1        0.19 ±  6%  perf-profile.children.cycles-pp.__mem_cgroup_charge
      0.00            +0.1        0.13 ±  6%  perf-profile.children.cycles-pp.get_jiffies_update
      0.00            +0.1        0.13 ±  5%  perf-profile.children.cycles-pp.tmigr_requires_handle_remote
      0.06            +0.1        0.20 ±  2%  perf-profile.children.cycles-pp.down_write_killable
      0.08            +0.1        0.22        perf-profile.children.cycles-pp.change_pud_range
      0.08            +0.1        0.22        perf-profile.children.cycles-pp.obj_cgroup_charge
      0.10 ±  7%      +0.1        0.24        perf-profile.children.cycles-pp.generic_perform_write
      0.08 ±  5%      +0.1        0.23        perf-profile.children.cycles-pp.mas_data_end
      0.10 ± 10%      +0.2        0.26        perf-profile.children.cycles-pp.shmem_file_write_iter
      0.10            +0.2        0.25        perf-profile.children.cycles-pp.mas_wr_store_type
      0.07 ±  6%      +0.2        0.22 ±  4%  perf-profile.children.cycles-pp.__folio_mod_stat
      0.09            +0.2        0.24        perf-profile.children.cycles-pp.__memcpy
      0.00            +0.2        0.16 ±  2%  perf-profile.children.cycles-pp.folio_remove_rmap_ptes
      0.09            +0.2        0.25        perf-profile.children.cycles-pp.rcu_all_qs
      0.09 ±  4%      +0.2        0.26        perf-profile.children.cycles-pp.mas_next_node
      0.11 ± 14%      +0.2        0.28        perf-profile.children.cycles-pp.vfs_write
      0.11            +0.2        0.28        perf-profile.children.cycles-pp.up_write
      0.00            +0.2        0.17 ±  2%  perf-profile.children.cycles-pp.__rmqueue_pcplist
      0.13 ± 11%      +0.2        0.31        perf-profile.children.cycles-pp.writen
      0.12 ± 13%      +0.2        0.30        perf-profile.children.cycles-pp.ksys_write
      0.09            +0.2        0.27        perf-profile.children.cycles-pp.bad_area_access_error
      0.08 ±  5%      +0.2        0.26 ±  3%  perf-profile.children.cycles-pp.folio_add_new_anon_rmap
      0.11 ±  3%      +0.2        0.29        perf-profile.children.cycles-pp.change_protection_range
      0.13 ± 10%      +0.2        0.31        perf-profile.children.cycles-pp.record__pushfn
      0.10            +0.2        0.28        perf-profile.children.cycles-pp.mt_find
      0.06            +0.2        0.25        perf-profile.children.cycles-pp.zap_present_ptes
      0.14 ± 12%      +0.2        0.32        perf-profile.children.cycles-pp.write
      0.07 ±  5%      +0.2        0.26        perf-profile.children.cycles-pp.__pte_offset_map_lock
      0.05            +0.2        0.24        perf-profile.children.cycles-pp.rmqueue
      0.15 ±  3%      +0.2        0.34        perf-profile.children.cycles-pp.commit_merge
      0.09 ±  5%      +0.2        0.28        perf-profile.children.cycles-pp.native_flush_tlb_one_user
      0.22 ± 14%      +0.2        0.42        perf-profile.children.cycles-pp.record__mmap_read_evlist
      0.22 ± 14%      +0.2        0.42        perf-profile.children.cycles-pp.cmd_record
      0.22 ± 14%      +0.2        0.42        perf-profile.children.cycles-pp.handle_internal_command
      0.22 ± 14%      +0.2        0.42        perf-profile.children.cycles-pp.main
      0.22 ± 14%      +0.2        0.42        perf-profile.children.cycles-pp.run_builtin
      0.11            +0.2        0.31        perf-profile.children.cycles-pp.find_vma
      0.21 ± 14%      +0.2        0.41        perf-profile.children.cycles-pp.perf_mmap__push
      0.09 ±  4%      +0.2        0.31 ±  4%  perf-profile.children.cycles-pp.__mod_memcg_lruvec_state
      0.14 ±  2%      +0.2        0.36        perf-profile.children.cycles-pp.llseek
      0.10 ±  4%      +0.2        0.32        perf-profile.children.cycles-pp.flush_tlb_func
      0.29 ± 10%      +0.2        0.52 ±  3%  perf-profile.children.cycles-pp.free_pcppages_bulk
      0.13 ±  3%      +0.2        0.36        perf-profile.children.cycles-pp.find_mergeable_anon_vma
      0.01 ±223%      +0.2        0.25        perf-profile.children.cycles-pp.setup_object
      0.10 ±  4%      +0.2        0.35 ±  4%  perf-profile.children.cycles-pp.__lruvec_stat_mod_folio
      0.00            +0.2        0.25 ±  6%  perf-profile.children.cycles-pp.ktime_get
      0.00            +0.2        0.25 ±  5%  perf-profile.children.cycles-pp.clockevents_program_event
      0.30 ± 10%      +0.2        0.55 ±  2%  perf-profile.children.cycles-pp.free_frozen_pages
      0.14            +0.3        0.39        perf-profile.children.cycles-pp.lock_mm_and_find_vma
      0.17 ±  2%      +0.3        0.42        perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.30 ± 11%      +0.3        0.56 ±  2%  perf-profile.children.cycles-pp.free_frozen_page_commit
      0.09            +0.3        0.36 ±  5%  perf-profile.children.cycles-pp.update_process_times
      0.10            +0.3        0.38        perf-profile.children.cycles-pp.rcu_segcblist_enqueue
      0.13 ±  2%      +0.3        0.42 ±  2%  perf-profile.children.cycles-pp.down_write
      0.18            +0.3        0.47        perf-profile.children.cycles-pp.core_sys_select
      0.16 ±  2%      +0.3        0.46        perf-profile.children.cycles-pp.perf_event_mmap_output
      0.18            +0.3        0.48        perf-profile.children.cycles-pp.ioctl
      0.10            +0.3        0.40 ±  4%  perf-profile.children.cycles-pp.tick_nohz_handler
      0.10 ±  4%      +0.3        0.41 ±  4%  perf-profile.children.cycles-pp.__hrtimer_run_queues
      0.20 ±  2%      +0.3        0.50        perf-profile.children.cycles-pp.syscall_exit_to_user_mode
      0.16            +0.3        0.47        perf-profile.children.cycles-pp.__cond_resched
      0.18 ±  2%      +0.3        0.49        perf-profile.children.cycles-pp.mas_ascend
      0.16            +0.3        0.50        perf-profile.children.cycles-pp.unlink_anon_vmas
      0.22 ±  4%      +0.3        0.57 ±  3%  perf-profile.children.cycles-pp.mod_objcg_state
      0.17            +0.3        0.52        perf-profile.children.cycles-pp.mas_walk
      0.00            +0.4        0.35 ± 19%  perf-profile.children.cycles-pp.ordered_events__queue
      0.00            +0.4        0.35 ± 19%  perf-profile.children.cycles-pp.queue_event
      0.14 ±  2%      +0.4        0.49        perf-profile.children.cycles-pp.flush_tlb_mm_range
      0.00            +0.4        0.36 ± 19%  perf-profile.children.cycles-pp.process_simple
      0.00            +0.4        0.36 ± 19%  perf-profile.children.cycles-pp.reader__read_event
      0.21            +0.4        0.57        perf-profile.children.cycles-pp.mas_prev_node
      0.00            +0.4        0.36 ± 19%  perf-profile.children.cycles-pp.perf_session__process_events
      0.00            +0.4        0.36 ± 19%  perf-profile.children.cycles-pp.record__finish_output
      0.23 ±  2%      +0.4        0.60        perf-profile.children.cycles-pp.do_pselect
      0.13 ±  2%      +0.4        0.50        perf-profile.children.cycles-pp.zap_pte_range
      0.24            +0.4        0.62        perf-profile.children.cycles-pp.__x64_sys_pselect6
      0.26            +0.4        0.67        perf-profile.children.cycles-pp.__mmap_prepare
      0.11            +0.4        0.52 ±  2%  perf-profile.children.cycles-pp.get_page_from_freelist
      0.13            +0.4        0.54        perf-profile.children.cycles-pp.folio_alloc_mpol_noprof
      0.24            +0.4        0.66        perf-profile.children.cycles-pp.mas_rev_awalk
      0.25 ±  3%      +0.4        0.68        perf-profile.children.cycles-pp.__memcg_slab_free_hook
      0.20            +0.4        0.63        perf-profile.children.cycles-pp.vma_complete
      0.30            +0.4        0.73        perf-profile.children.cycles-pp.vma_modify
      0.29            +0.4        0.72        perf-profile.children.cycles-pp.vma_merge_existing_range
      0.14            +0.4        0.58        perf-profile.children.cycles-pp.vma_alloc_folio_noprof
      0.15            +0.4        0.58        perf-profile.children.cycles-pp.zap_pmd_range
      0.22            +0.4        0.66        perf-profile.children.cycles-pp.perf_iterate_sb
      0.30            +0.4        0.74        perf-profile.children.cycles-pp.vma_modify_flags
      0.19 ±  2%      +0.4        0.63        perf-profile.children.cycles-pp.__call_rcu_common
      0.13 ±  2%      +0.5        0.59        perf-profile.children.cycles-pp.__alloc_frozen_pages_noprof
      0.20 ±  2%      +0.5        0.66        perf-profile.children.cycles-pp.free_pgtables
      0.15            +0.5        0.62        perf-profile.children.cycles-pp.alloc_pages_mpol
      0.24 ±  2%      +0.5        0.74        perf-profile.children.cycles-pp.mas_next_slot
      0.33            +0.5        0.83        perf-profile.children.cycles-pp.entry_SYSCALL_64
      0.24            +0.5        0.75        perf-profile.children.cycles-pp.mas_preallocate
      0.24            +0.5        0.76 ±  2%  perf-profile.children.cycles-pp.native_irq_return_iret
      0.19 ±  2%      +0.6        0.74        perf-profile.children.cycles-pp.unmap_page_range
      0.22 ± 14%      +0.6        0.78 ±  9%  perf-profile.children.cycles-pp.__cmd_record
      0.26            +0.6        0.82        perf-profile.children.cycles-pp.vm_area_alloc
      0.17 ±  4%      +0.6        0.73 ±  4%  perf-profile.children.cycles-pp.hrtimer_interrupt
      0.17 ±  4%      +0.6        0.74 ±  4%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      0.33            +0.6        0.91        perf-profile.children.cycles-pp.mas_empty_area_rev
      0.20 ±  3%      +0.6        0.79        perf-profile.children.cycles-pp.alloc_anon_folio
      0.22            +0.6        0.80 ±  2%  perf-profile.children.cycles-pp.rcu_cblist_dequeue
      0.37            +0.6        0.97        perf-profile.children.cycles-pp.__select
      0.35            +0.6        0.94        perf-profile.children.cycles-pp.__memcg_slab_post_alloc_hook
      0.36            +0.6        0.98        perf-profile.children.cycles-pp.mas_prev_slot
      0.29 ±  3%      +0.6        0.91        perf-profile.children.cycles-pp.vm_area_free_rcu_cb
      0.35            +0.6        0.97        perf-profile.children.cycles-pp.__anon_vma_prepare
      0.13 ±  2%      +0.6        0.75        perf-profile.children.cycles-pp.shuffle_freelist
      0.35            +0.6        0.98        perf-profile.children.cycles-pp.__vmf_anon_prepare
      0.25            +0.6        0.89        perf-profile.children.cycles-pp.vm_area_dup
      0.23            +0.7        0.89        perf-profile.children.cycles-pp.unmap_vmas
      0.34            +0.7        1.00        perf-profile.children.cycles-pp.perf_event_mmap_event
      0.16 ±  2%      +0.7        0.86        perf-profile.children.cycles-pp.allocate_slab
      0.37            +0.7        1.08        perf-profile.children.cycles-pp.perf_event_mmap
      0.38            +0.8        1.14        perf-profile.children.cycles-pp.mas_store_prealloc
      0.24            +0.8        1.03        perf-profile.children.cycles-pp.mas_alloc_nodes
      0.40            +0.8        1.24        perf-profile.children.cycles-pp.mas_find
      0.47            +0.8        1.30        perf-profile.children.cycles-pp.ksys_mmap_pgoff
      0.43            +0.9        1.36        perf-profile.children.cycles-pp.mas_wr_node_store
      0.54            +0.9        1.48        perf-profile.children.cycles-pp.unmapped_area_topdown
      0.55            +1.0        1.50        perf-profile.children.cycles-pp.vm_unmapped_area
      0.23            +1.0        1.21        perf-profile.children.cycles-pp.___slab_alloc
      0.60            +1.0        1.64        perf-profile.children.cycles-pp.arch_get_unmapped_area_topdown
      0.60            +1.0        1.64        perf-profile.children.cycles-pp.crng_fast_key_erasure
      0.62            +1.0        1.67        perf-profile.children.cycles-pp.mprotect_fixup
      0.63            +1.1        1.74        perf-profile.children.cycles-pp.__get_unmapped_area
      0.43            +1.1        1.54        perf-profile.children.cycles-pp.mas_store_gfp
      1.47 ±  5%      +1.1        2.58 ±  2%  perf-profile.children.cycles-pp.__irq_exit_rcu
      0.56            +1.1        1.68        perf-profile.children.cycles-pp.__mmap_new_vma
      0.64            +1.1        1.78        perf-profile.children.cycles-pp.crng_make_state
      0.87            +1.5        2.36        perf-profile.children.cycles-pp.do_mprotect_pkey
      0.88            +1.5        2.37        perf-profile.children.cycles-pp.__x64_sys_mprotect
      0.43 ±  6%      +1.6        2.03        perf-profile.children.cycles-pp.__put_partials
      1.68 ±  5%      +1.7        3.35        perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      1.64 ±  5%      +1.7        3.32        perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      0.69            +1.7        2.38        perf-profile.children.cycles-pp.__split_vma
      1.00            +1.7        2.70        perf-profile.children.cycles-pp.__mprotect
      0.00            +1.9        1.89 ±  5%  perf-profile.children.cycles-pp.__folio_batch_add_and_move
      1.10            +2.0        3.15        perf-profile.children.cycles-pp.__mmap_region
      0.82            +2.0        2.87        perf-profile.children.cycles-pp.kmem_cache_alloc_noprof
      1.11            +2.7        3.80        perf-profile.children.cycles-pp.vms_gather_munmap_vmas
      1.80            +3.2        5.05        perf-profile.children.cycles-pp.do_mmap
      0.72            +3.4        4.11 ±  2%  perf-profile.children.cycles-pp.do_anonymous_page
      1.90            +3.5        5.36        perf-profile.children.cycles-pp.vm_mmap_pgoff
      0.78            +3.5        4.29 ±  2%  perf-profile.children.cycles-pp.__handle_mm_fault
      0.59            +3.5        4.10        perf-profile.children.cycles-pp.__slab_free
      0.84            +3.6        4.46 ±  2%  perf-profile.children.cycles-pp.handle_mm_fault
      2.20            +4.0        6.18        perf-profile.children.cycles-pp.__mmap
      1.10            +4.1        5.21 ±  2%  perf-profile.children.cycles-pp.do_user_addr_fault
      1.22            +4.3        5.53        perf-profile.children.cycles-pp.exc_page_fault
      0.18 ± 69%      +5.2        5.42 ±  2%  perf-profile.children.cycles-pp.run_ksoftirqd
      0.18 ± 68%      +5.2        5.43 ±  2%  perf-profile.children.cycles-pp.smpboot_thread_fn
      0.19 ± 67%      +5.3        5.45 ±  2%  perf-profile.children.cycles-pp.kthread
      0.19 ± 67%      +5.3        5.45 ±  2%  perf-profile.children.cycles-pp.ret_from_fork
      0.19 ± 67%      +5.3        5.45 ±  2%  perf-profile.children.cycles-pp.ret_from_fork_asm
      2.05            +5.6        7.66        perf-profile.children.cycles-pp.asm_exc_page_fault
      1.46 ±  2%      +5.8        7.30        perf-profile.children.cycles-pp.kmem_cache_free
      1.65 ±  2%      +6.3        7.99        perf-profile.children.cycles-pp.rcu_do_batch
      1.65 ±  2%      +6.3        7.99        perf-profile.children.cycles-pp.rcu_core
      1.65 ±  2%      +6.4        8.00        perf-profile.children.cycles-pp.handle_softirqs
      4.96           +10.5       15.47        perf-profile.children.cycles-pp._copy_to_iter
     17.62           +33.0       50.65        perf-profile.children.cycles-pp.chacha_permute
     19.68           +36.8       56.44        perf-profile.children.cycles-pp.chacha_block_generic
     24.93           +47.8       72.75        perf-profile.children.cycles-pp.get_random_bytes_user
     25.11           +48.1       73.21        perf-profile.children.cycles-pp.vfs_read
     25.17           +48.2       73.36        perf-profile.children.cycles-pp.ksys_read
     25.56           +48.8       74.40        perf-profile.children.cycles-pp.read
     66.03           -59.5        6.52 ±  2%  perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
      0.23 ±  3%      -0.2        0.07 ±  5%  perf-profile.self.cycles-pp.page_counter_cancel
      0.25            -0.1        0.14        perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      0.16            -0.1        0.11 ±  3%  perf-profile.self.cycles-pp.lru_gen_add_folio
      0.12            -0.0        0.09 ±  4%  perf-profile.self.cycles-pp.lru_gen_del_folio
      0.12 ±  3%      +0.0        0.13 ±  3%  perf-profile.self.cycles-pp.folios_put_refs
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.__get_unmapped_area
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.__memset
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.__mmap_prepare
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.__mod_node_page_state
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.__vm_munmap
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.cgroup_rstat_updated
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.commit_merge
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.down_read_trylock
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.entry_SYSCALL_64_safe_stack
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.native_sched_clock
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.rcu_do_batch
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.vms_complete_munmap_vmas
      0.00            +0.1        0.05 ±  7%  perf-profile.self.cycles-pp.rw_verify_area
      0.00            +0.1        0.05 ±  7%  perf-profile.self.cycles-pp.setup_object
      0.00            +0.1        0.05 ±  8%  perf-profile.self.cycles-pp.__alloc_frozen_pages_noprof
      0.00            +0.1        0.06 ±  9%  perf-profile.self.cycles-pp.mprotect_fixup
      0.00            +0.1        0.06 ±  8%  perf-profile.self.cycles-pp.stress_time_now
      0.00            +0.1        0.06 ±  6%  perf-profile.self.cycles-pp.folio_batch_move_lru
      0.00            +0.1        0.06 ±  6%  perf-profile.self.cycles-pp.try_charge_memcg
      0.05            +0.1        0.11        perf-profile.self.cycles-pp._copy_from_user
      0.00            +0.1        0.06        perf-profile.self.cycles-pp.__fsnotify_parent
      0.00            +0.1        0.06        perf-profile.self.cycles-pp.__perf_event_header__init_id
      0.00            +0.1        0.06        perf-profile.self.cycles-pp.__thp_vma_allowable_orders
      0.00            +0.1        0.06        perf-profile.self.cycles-pp.asm_exc_page_fault
      0.00            +0.1        0.06        perf-profile.self.cycles-pp.clock_gettime
      0.00            +0.1        0.06        perf-profile.self.cycles-pp.cmp_ex_search
      0.00            +0.1        0.06        perf-profile.self.cycles-pp.fget
      0.00            +0.1        0.06        perf-profile.self.cycles-pp.init_multi_vma_prep
      0.00            +0.1        0.06        perf-profile.self.cycles-pp.mas_update_gap
      0.00            +0.1        0.06        perf-profile.self.cycles-pp.vms_clear_ptes
      0.00            +0.1        0.06        perf-profile.self.cycles-pp.zap_pmd_range
      0.00            +0.1        0.06 ±  7%  perf-profile.self.cycles-pp.ksys_read
      0.00            +0.1        0.06 ±  7%  perf-profile.self.cycles-pp.ktime_get_update_offsets_now
      0.00            +0.1        0.06 ±  7%  perf-profile.self.cycles-pp.fdget
      0.00            +0.1        0.06 ±  7%  perf-profile.self.cycles-pp.syscall_exit_to_user_mode_prepare
      0.00            +0.1        0.07 ±  5%  perf-profile.self.cycles-pp.do_vmi_align_munmap
      0.00            +0.1        0.07        perf-profile.self.cycles-pp.change_protection_range
      0.00            +0.1        0.07        perf-profile.self.cycles-pp.do_anonymous_page
      0.00            +0.1        0.07        perf-profile.self.cycles-pp.handle_mm_fault
      0.00            +0.1        0.07        perf-profile.self.cycles-pp.mas_prev_setup
      0.00            +0.1        0.07        perf-profile.self.cycles-pp.percpu_counter_add_batch
      0.00            +0.1        0.07        perf-profile.self.cycles-pp.ring_buffer_read_head
      0.00            +0.1        0.07        perf-profile.self.cycles-pp.sized_strscpy
      0.00            +0.1        0.07        perf-profile.self.cycles-pp.tlb_gather_mmu
      0.00            +0.1        0.07        perf-profile.self.cycles-pp.up_read
      0.00            +0.1        0.07        perf-profile.self.cycles-pp.zap_present_ptes
      0.00            +0.1        0.07 ±  5%  perf-profile.self.cycles-pp.llseek
      0.00            +0.1        0.07 ±  5%  perf-profile.self.cycles-pp.vma_merge_existing_range
      0.00            +0.1        0.08 ±  6%  perf-profile.self.cycles-pp.crng_make_state
      0.04 ± 44%      +0.1        0.12        perf-profile.self.cycles-pp.crng_fast_key_erasure
      0.00            +0.1        0.08        perf-profile.self.cycles-pp.___pte_offset_map
      0.00            +0.1        0.08        perf-profile.self.cycles-pp.__mmap_new_vma
      0.00            +0.1        0.08        perf-profile.self.cycles-pp.__mprotect
      0.00            +0.1        0.08        perf-profile.self.cycles-pp.__munmap
      0.00            +0.1        0.08        perf-profile.self.cycles-pp.__pte_offset_map_lock
      0.00            +0.1        0.08        perf-profile.self.cycles-pp.error_entry
      0.00            +0.1        0.08        perf-profile.self.cycles-pp.fault_in_readable
      0.00            +0.1        0.08 ± 14%  perf-profile.self.cycles-pp.get_mem_cgroup_from_mm
      0.00            +0.1        0.08        perf-profile.self.cycles-pp.mas_alloc_nodes
      0.00            +0.1        0.08        perf-profile.self.cycles-pp.perf_event_mmap
      0.00            +0.1        0.08        perf-profile.self.cycles-pp.stress_time_now_timespec
      0.00            +0.1        0.08        perf-profile.self.cycles-pp.tlb_finish_mmu
      0.00            +0.1        0.08        perf-profile.self.cycles-pp.unlink_anon_vmas
      0.00            +0.1        0.08        perf-profile.self.cycles-pp.vm_mmap_pgoff
      0.06            +0.1        0.14 ±  5%  perf-profile.self.cycles-pp.__lruvec_stat_mod_folio
      0.05 ±  7%      +0.1        0.13 ±  2%  perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.00            +0.1        0.08 ±  4%  perf-profile.self.cycles-pp.bsearch
      0.06 ±  6%      +0.1        0.14        perf-profile.self.cycles-pp.syscall_return_via_sysret
      0.03 ± 70%      +0.1        0.12 ±  4%  perf-profile.self.cycles-pp.x64_sys_call
      0.06 ±  8%      +0.1        0.14        perf-profile.self.cycles-pp.mas_preallocate
      0.00            +0.1        0.09 ±  8%  perf-profile.self.cycles-pp.__rmqueue_pcplist
      0.06 ±  6%      +0.1        0.14 ±  3%  perf-profile.self.cycles-pp.do_select
      0.06            +0.1        0.15 ±  3%  perf-profile.self.cycles-pp.entry_SYSCALL_64
      0.00            +0.1        0.09 ±  7%  perf-profile.self.cycles-pp.__init_rwsem
      0.00            +0.1        0.09        perf-profile.self.cycles-pp.ioctl
      0.00            +0.1        0.09        perf-profile.self.cycles-pp.mas_leaf_max_gap
      0.00            +0.1        0.09 ±  4%  perf-profile.self.cycles-pp.do_user_addr_fault
      0.07 ±  6%      +0.1        0.17 ±  2%  perf-profile.self.cycles-pp.stress_urandom
      0.00            +0.1        0.09 ±  5%  perf-profile.self.cycles-pp.copy_page_from_iter_atomic
      0.01 ±223%      +0.1        0.10 ±  3%  perf-profile.self.cycles-pp.fdget_pos
      0.00            +0.1        0.10 ±  5%  perf-profile.self.cycles-pp.mas_prev
      0.06            +0.1        0.16 ±  3%  perf-profile.self.cycles-pp.__mmap_region
      0.05            +0.1        0.15        perf-profile.self.cycles-pp.mas_empty_area_rev
      0.05            +0.1        0.15        perf-profile.self.cycles-pp.perf_event_mmap_event
      0.00            +0.1        0.10        perf-profile.self.cycles-pp.__handle_mm_fault
      0.05            +0.1        0.15 ±  2%  perf-profile.self.cycles-pp.unmapped_area_topdown
      0.00            +0.1        0.10 ±  3%  perf-profile.self.cycles-pp.mas_wr_store_entry
      0.02 ±141%      +0.1        0.12        perf-profile.self.cycles-pp.do_mmap
      0.02 ±141%      +0.1        0.12        perf-profile.self.cycles-pp.mas_next_node
      0.05 ±  7%      +0.1        0.16 ±  3%  perf-profile.self.cycles-pp.rcu_all_qs
      0.00            +0.1        0.10 ±  4%  perf-profile.self.cycles-pp.__split_vma
      0.00            +0.1        0.10 ±  4%  perf-profile.self.cycles-pp.do_mprotect_pkey
      0.07 ±  7%      +0.1        0.17 ±  2%  perf-profile.self.cycles-pp.obj_cgroup_charge
      0.00            +0.1        0.11 ±  4%  perf-profile.self.cycles-pp.zap_pte_range
      0.08 ±  6%      +0.1        0.18 ±  2%  perf-profile.self.cycles-pp.__mmap
      0.00            +0.1        0.11 ±  3%  perf-profile.self.cycles-pp.flush_tlb_mm_range
      0.00            +0.1        0.11        perf-profile.self.cycles-pp.___perf_sw_event
      0.00            +0.1        0.11        perf-profile.self.cycles-pp.__select
      0.00            +0.1        0.11        perf-profile.self.cycles-pp.arch_get_unmapped_area_topdown
      0.00            +0.1        0.11        perf-profile.self.cycles-pp.core_sys_select
      0.00            +0.1        0.11        perf-profile.self.cycles-pp.perf_output_begin
      0.00            +0.1        0.11        perf-profile.self.cycles-pp.refill_obj_stock
      0.00            +0.1        0.11        perf-profile.self.cycles-pp.vms_gather_munmap_vmas
      0.06            +0.1        0.17 ±  2%  perf-profile.self.cycles-pp.mas_pop_node
      0.00            +0.1        0.12 ±  6%  perf-profile.self.cycles-pp.clear_page_erms
      0.00            +0.1        0.12 ±  3%  perf-profile.self.cycles-pp.get_page_from_freelist
      0.06            +0.1        0.18 ±  2%  perf-profile.self.cycles-pp.mas_store_gfp
      0.00            +0.1        0.12 ±  5%  perf-profile.self.cycles-pp.vm_area_dup
      0.07            +0.1        0.19 ±  2%  perf-profile.self.cycles-pp.mas_data_end
      0.08            +0.1        0.20 ±  2%  perf-profile.self.cycles-pp.mas_prev_node
      0.00            +0.1        0.13 ±  3%  perf-profile.self.cycles-pp._raw_spin_lock
      0.07 ±  5%      +0.1        0.20        perf-profile.self.cycles-pp.mas_store_prealloc
      0.00            +0.1        0.13 ±  4%  perf-profile.self.cycles-pp.mas_prev_range
      0.00            +0.1        0.13 ±  6%  perf-profile.self.cycles-pp.get_jiffies_update
      0.00            +0.1        0.13 ±  3%  perf-profile.self.cycles-pp.unmap_page_range
      0.08            +0.1        0.21 ±  2%  perf-profile.self.cycles-pp.__memcpy
      0.09 ±  5%      +0.1        0.23        perf-profile.self.cycles-pp.mas_wr_store_type
      0.06            +0.1        0.20 ±  5%  perf-profile.self.cycles-pp.vm_area_free_rcu_cb
      0.00            +0.1        0.14        perf-profile.self.cycles-pp.down_write_killable
      0.00            +0.1        0.14        perf-profile.self.cycles-pp.perf_event_mmap_output
      0.07            +0.1        0.21        perf-profile.self.cycles-pp.mas_find
      0.08 ±  5%      +0.1        0.23        perf-profile.self.cycles-pp.__call_rcu_common
      0.10            +0.1        0.25        perf-profile.self.cycles-pp.up_write
      0.06            +0.1        0.21 ±  3%  perf-profile.self.cycles-pp.perf_iterate_sb
      0.09 ±  4%      +0.2        0.24        perf-profile.self.cycles-pp.read
      0.10 ±  6%      +0.2        0.26 ±  2%  perf-profile.self.cycles-pp.vfs_read
      0.09            +0.2        0.25        perf-profile.self.cycles-pp.do_syscall_64
      0.09 ±  5%      +0.2        0.25        perf-profile.self.cycles-pp.__cond_resched
      0.10            +0.2        0.27        perf-profile.self.cycles-pp.mt_find
      0.10 ±  8%      +0.2        0.28 ±  2%  perf-profile.self.cycles-pp.__memcg_slab_free_hook
      0.05            +0.2        0.23 ±  2%  perf-profile.self.cycles-pp.___slab_alloc
      0.07 ±  5%      +0.2        0.26 ±  4%  perf-profile.self.cycles-pp.__mod_memcg_lruvec_state
      0.08 ±  5%      +0.2        0.28        perf-profile.self.cycles-pp.native_flush_tlb_one_user
      0.09 ±  4%      +0.2        0.30 ±  2%  perf-profile.self.cycles-pp.down_write
      0.10            +0.2        0.32        perf-profile.self.cycles-pp.mas_wr_node_store
      0.00            +0.2        0.24 ±  6%  perf-profile.self.cycles-pp.ktime_get
      0.15            +0.2        0.39        perf-profile.self.cycles-pp.syscall_exit_to_user_mode
      0.15 ±  2%      +0.2        0.40        perf-profile.self.cycles-pp.mas_prev_slot
      0.14 ±  3%      +0.2        0.40        perf-profile.self.cycles-pp.__memcg_slab_post_alloc_hook
      0.16 ±  2%      +0.3        0.41        perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.18 ±  4%      +0.3        0.45 ±  2%  perf-profile.self.cycles-pp.mod_objcg_state
      0.15 ±  2%      +0.3        0.42        perf-profile.self.cycles-pp.kmem_cache_free
      0.10 ±  3%      +0.3        0.37        perf-profile.self.cycles-pp.rcu_segcblist_enqueue
      0.17            +0.3        0.46        perf-profile.self.cycles-pp.mas_ascend
      0.14 ±  3%      +0.3        0.45        perf-profile.self.cycles-pp.mas_next_slot
      0.16 ±  2%      +0.3        0.49        perf-profile.self.cycles-pp.mas_walk
      0.20            +0.3        0.53        perf-profile.self.cycles-pp.mas_rev_awalk
      0.00            +0.3        0.35 ± 20%  perf-profile.self.cycles-pp.queue_event
      0.21            +0.4        0.58        perf-profile.self.cycles-pp.kmem_cache_alloc_noprof
      0.24            +0.5        0.76 ±  2%  perf-profile.self.cycles-pp.native_irq_return_iret
      0.30            +0.5        0.82        perf-profile.self.cycles-pp.get_random_bytes_user
      0.11            +0.6        0.67        perf-profile.self.cycles-pp.shuffle_freelist
      0.22 ±  2%      +0.6        0.79 ±  2%  perf-profile.self.cycles-pp.rcu_cblist_dequeue
      0.34            +0.8        1.19        perf-profile.self.cycles-pp.__slab_free
      2.05            +3.6        5.69        perf-profile.self.cycles-pp.chacha_block_generic
      3.36            +5.2        8.56        perf-profile.self.cycles-pp._copy_to_iter
     17.31           +31.5       48.79        perf-profile.self.cycles-pp.chacha_permute


***************************************************************************************************
lkp-spr-2sp4: 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with 512G memory
=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-12/performance/x86_64-rhel-9.4/100%/debian-12-x86_64-20240206.cgz/lkp-spr-2sp4/tmpfs/stress-ng/60s

commit: 
  44d46b76c3 ("mm: add build-time option for hotplug memory default online type")
  1aa43598c0 ("mm: remove unnecessary calls to lru_add_drain")

44d46b76c3a4b514 1aa43598c03b71d945f8b12d6d5 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
 1.113e+09 ±  5%     +16.0%  1.291e+09 ±  5%  cpuidle..time
     22656 ±  7%     -55.5%      10081 ± 11%  numa-vmstat.node0.nr_mlock
     22890 ±  4%     -58.8%       9439 ±  8%  numa-vmstat.node1.nr_mlock
     88641 ±  4%     -52.2%      42367 ± 11%  numa-meminfo.node0.Mlocked
    392224 ±  4%     +11.3%     436660 ±  4%  numa-meminfo.node0.SUnreclaim
     90308 ±  4%     -58.8%      37198 ± 13%  numa-meminfo.node1.Mlocked
     20.39 ±  4%     +68.6%      34.36 ±  3%  vmstat.cpu.id
    183.74 ±  2%     -16.5%     153.39 ±  4%  vmstat.procs.r
     14074           +15.1%      16195        vmstat.system.cs
    208908            -8.7%     190705 ±  2%  vmstat.system.in
     29211 ±  5%     -23.2%      22420 ±  2%  meminfo.AnonHugePages
   5126373           -11.7%    4526998        meminfo.Committed_AS
    708866           -36.0%     453842 ±  2%  meminfo.Mapped
    182052 ±  2%     -56.0%      80121 ±  4%  meminfo.Mlocked
     44782 ±  3%     -12.5%      39196 ±  7%  meminfo.PageTables
    793228           -23.6%     606234        meminfo.Shmem
     15.56 ±  6%     +12.1       27.66 ±  5%  mpstat.cpu.all.idle%
      0.23 ±  2%      +0.1        0.28 ±  3%  mpstat.cpu.all.irq%
      3.67 ±  2%      +3.6        7.23 ±  2%  mpstat.cpu.all.soft%
     77.58           -17.1       60.45 ±  2%  mpstat.cpu.all.sys%
      2.97            +1.4        4.37 ±  2%  mpstat.cpu.all.usr%
      6.00           -27.8%       4.33 ± 10%  mpstat.max_utilization.seconds
     28.72           -38.7%      17.62        stress-ng.time.elapsed_time
     28.72           -38.7%      17.62        stress-ng.time.elapsed_time.max
    125580 ±  2%     -47.6%      65837        stress-ng.time.involuntary_context_switches
     18797           -16.6%      15681        stress-ng.time.percent_of_cpu_this_job_got
      5237           -50.5%       2593        stress-ng.time.system_time
    160.87            +5.1%     169.02        stress-ng.time.user_time
      5943           +71.8%      10213        stress-ng.tmpfs.ops_per_sec
    337138            -8.1%     309953        proc-vmstat.nr_active_anon
    184567            -2.2%     180591        proc-vmstat.nr_anon_pages
   1079237            -4.3%    1032306        proc-vmstat.nr_file_pages
     44697            -1.5%      44042        proc-vmstat.nr_kernel_stack
    176126           -35.8%     113065        proc-vmstat.nr_mapped
     44500 ±  3%     -54.8%      20130 ±  2%  proc-vmstat.nr_mlock
     11137 ±  4%     -12.4%       9757 ±  7%  proc-vmstat.nr_page_table_pages
    197815           -23.7%     150886        proc-vmstat.nr_shmem
     37375            -3.2%      36177        proc-vmstat.nr_slab_reclaimable
    189653 ±  2%      +5.8%     200674        proc-vmstat.nr_slab_unreclaimable
    926562            -2.6%     902163        proc-vmstat.nr_unevictable
    337138            -8.1%     309953        proc-vmstat.nr_zone_active_anon
    926562            -2.6%     902163        proc-vmstat.nr_zone_unevictable
     36354 ± 18%     -52.4%      17296 ± 38%  proc-vmstat.numa_hint_faults
     13512 ± 28%     -90.5%       1277 ± 48%  proc-vmstat.numa_hint_faults_local
    236150 ± 20%     -70.9%      68765 ± 53%  proc-vmstat.numa_pte_updates
  35367192            -2.7%   34419525        proc-vmstat.pgalloc_normal
  34816712            -2.4%   33976654        proc-vmstat.pgfree
     29390 ±  4%     -14.1%      25247 ±  2%  proc-vmstat.pgreuse
      2.48           +19.6%       2.97        perf-stat.i.MPKI
 3.359e+10           +34.1%  4.504e+10 ±  2%  perf-stat.i.branch-instructions
      1.20            +0.2        1.37 ±  2%  perf-stat.i.branch-miss-rate%
 3.938e+08           +49.9%  5.904e+08 ±  2%  perf-stat.i.branch-misses
     54.42            +3.5       57.92        perf-stat.i.cache-miss-rate%
 4.149e+08           +68.5%  6.991e+08 ±  2%  perf-stat.i.cache-misses
 7.567e+08           +55.5%  1.176e+09 ±  2%  perf-stat.i.cache-references
     14329 ±  2%     +20.7%      17302 ±  2%  perf-stat.i.context-switches
      3.45           -38.3%       2.13        perf-stat.i.cpi
 5.727e+11           -12.1%  5.034e+11        perf-stat.i.cpu-cycles
      1374           +45.0%       1992 ±  3%  perf-stat.i.cpu-migrations
      1399           -47.0%     741.82 ±  6%  perf-stat.i.cycles-between-cache-misses
  1.66e+11           +38.8%  2.303e+11 ±  2%  perf-stat.i.instructions
      0.30           +61.5%       0.48 ±  3%  perf-stat.i.ipc
     43.64           +60.7%      70.14 ±  2%  perf-stat.i.metric.K/sec
   4892264           +60.8%    7864979 ±  2%  perf-stat.i.minor-faults
   4892264           +60.8%    7864980 ±  2%  perf-stat.i.page-faults
      2.50           +21.5%       3.04        perf-stat.overall.MPKI
      1.17            +0.1        1.31        perf-stat.overall.branch-miss-rate%
     54.83            +4.6       59.44        perf-stat.overall.cache-miss-rate%
      3.45           -36.7%       2.19        perf-stat.overall.cpi
      1381           -47.9%     720.51        perf-stat.overall.cycles-between-cache-misses
      0.29           +57.9%       0.46        perf-stat.overall.ipc
 3.241e+10           +31.6%  4.264e+10 ±  2%  perf-stat.ps.branch-instructions
 3.796e+08           +47.1%  5.583e+08 ±  2%  perf-stat.ps.branch-misses
 4.003e+08           +65.4%  6.621e+08 ±  2%  perf-stat.ps.cache-misses
   7.3e+08           +52.6%  1.114e+09 ±  2%  perf-stat.ps.cache-references
     13776           +18.4%      16310        perf-stat.ps.context-switches
    216318            -1.9%     212103        perf-stat.ps.cpu-clock
 5.531e+11           -13.8%  4.769e+11        perf-stat.ps.cpu-cycles
      1324           +42.2%       1883 ±  3%  perf-stat.ps.cpu-migrations
 1.601e+11           +36.2%   2.18e+11 ±  2%  perf-stat.ps.instructions
   4721099           +57.8%    7449693 ±  2%  perf-stat.ps.minor-faults
   4721099           +57.8%    7449693 ±  2%  perf-stat.ps.page-faults
    216318            -1.9%     212103        perf-stat.ps.task-clock
 4.765e+12           -13.0%  4.146e+12        perf-stat.total.instructions
     13.21 ± 13%     -13.2        0.00        perf-profile.calltrace.cycles-pp.__cmd_record
     13.21 ± 13%     -13.2        0.00        perf-profile.calltrace.cycles-pp.perf_session__process_events.record__finish_output.__cmd_record
     13.21 ± 13%     -13.2        0.00        perf-profile.calltrace.cycles-pp.reader__read_event.perf_session__process_events.record__finish_output.__cmd_record
     13.21 ± 13%     -13.2        0.00        perf-profile.calltrace.cycles-pp.record__finish_output.__cmd_record
     13.16 ± 12%     -13.2        0.00        perf-profile.calltrace.cycles-pp.ordered_events__queue.process_simple.reader__read_event.perf_session__process_events.record__finish_output
     13.16 ± 12%     -13.2        0.00        perf-profile.calltrace.cycles-pp.process_simple.reader__read_event.perf_session__process_events.record__finish_output.__cmd_record
     13.06 ± 12%     -13.1        0.00        perf-profile.calltrace.cycles-pp.queue_event.ordered_events__queue.process_simple.reader__read_event.perf_session__process_events
      9.74 ± 65%      -9.3        0.46 ±151%  perf-profile.calltrace.cycles-pp.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      9.44 ± 67%      -9.3        0.16 ±223%  perf-profile.calltrace.cycles-pp.process_one_work.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      9.26 ± 71%      -9.3        0.00        perf-profile.calltrace.cycles-pp.ast_mode_config_helper_atomic_commit_tail.commit_tail.drm_atomic_helper_commit.drm_atomic_commit.drm_atomic_helper_dirtyfb
      9.26 ± 71%      -9.3        0.00        perf-profile.calltrace.cycles-pp.commit_tail.drm_atomic_helper_commit.drm_atomic_commit.drm_atomic_helper_dirtyfb.drm_fbdev_shmem_helper_fb_dirty
      9.26 ± 71%      -9.3        0.00        perf-profile.calltrace.cycles-pp.drm_atomic_commit.drm_atomic_helper_dirtyfb.drm_fbdev_shmem_helper_fb_dirty.drm_fb_helper_damage_work.process_one_work
      9.26 ± 71%      -9.3        0.00        perf-profile.calltrace.cycles-pp.drm_atomic_helper_commit.drm_atomic_commit.drm_atomic_helper_dirtyfb.drm_fbdev_shmem_helper_fb_dirty.drm_fb_helper_damage_work
      9.26 ± 71%      -9.3        0.00        perf-profile.calltrace.cycles-pp.drm_atomic_helper_commit_tail.ast_mode_config_helper_atomic_commit_tail.commit_tail.drm_atomic_helper_commit.drm_atomic_commit
      9.26 ± 71%      -9.3        0.00        perf-profile.calltrace.cycles-pp.drm_atomic_helper_dirtyfb.drm_fbdev_shmem_helper_fb_dirty.drm_fb_helper_damage_work.process_one_work.worker_thread
      9.26 ± 71%      -9.3        0.00        perf-profile.calltrace.cycles-pp.drm_fb_helper_damage_work.process_one_work.worker_thread.kthread.ret_from_fork
      9.26 ± 71%      -9.3        0.00        perf-profile.calltrace.cycles-pp.drm_fbdev_shmem_helper_fb_dirty.drm_fb_helper_damage_work.process_one_work.worker_thread.kthread
      7.07 ±100%      -7.1        0.00        perf-profile.calltrace.cycles-pp.drm_atomic_helper_commit_planes.drm_atomic_helper_commit_tail.ast_mode_config_helper_atomic_commit_tail.commit_tail.drm_atomic_helper_commit
      7.02 ±100%      -7.0        0.00        perf-profile.calltrace.cycles-pp.ast_primary_plane_helper_atomic_update.drm_atomic_helper_commit_planes.drm_atomic_helper_commit_tail.ast_mode_config_helper_atomic_commit_tail.commit_tail
      7.02 ±100%      -7.0        0.00        perf-profile.calltrace.cycles-pp.drm_fb_memcpy.ast_primary_plane_helper_atomic_update.drm_atomic_helper_commit_planes.drm_atomic_helper_commit_tail.ast_mode_config_helper_atomic_commit_tail
      6.97 ±100%      -7.0        0.00        perf-profile.calltrace.cycles-pp.memcpy_toio.drm_fb_memcpy.ast_primary_plane_helper_atomic_update.drm_atomic_helper_commit_planes.drm_atomic_helper_commit_tail
      0.18 ±223%      +1.3        1.52 ± 48%  perf-profile.calltrace.cycles-pp.__do_fault.do_read_fault.do_pte_missing.__handle_mm_fault.handle_mm_fault
      0.38 ±107%      +1.4        1.81 ± 41%  perf-profile.calltrace.cycles-pp.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.ring_buffer_read_head.perf_mmap__read_head
      0.38 ±107%      +1.4        1.81 ± 41%  perf-profile.calltrace.cycles-pp.exc_page_fault.asm_exc_page_fault.ring_buffer_read_head.perf_mmap__read_head.perf_mmap__push
      0.27 ±150%      +1.5        1.81 ± 41%  perf-profile.calltrace.cycles-pp.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.ring_buffer_read_head
      0.38 ±107%      +1.6        1.95 ± 48%  perf-profile.calltrace.cycles-pp.asm_exc_page_fault.ring_buffer_read_head.perf_mmap__read_head.perf_mmap__push.record__mmap_read_evlist
      1.94 ± 20%      +1.7        3.64 ± 20%  perf-profile.calltrace.cycles-pp.perf_mmap__push.record__mmap_read_evlist.__cmd_record.cmd_record.run_builtin
      1.94 ± 20%      +1.7        3.64 ± 20%  perf-profile.calltrace.cycles-pp.record__mmap_read_evlist.__cmd_record.cmd_record.run_builtin.handle_internal_command
      0.46 ±121%      +1.9        2.35 ± 41%  perf-profile.calltrace.cycles-pp.perf_mmap__read_head.perf_mmap__push.record__mmap_read_evlist.__cmd_record.cmd_record
      0.99 ± 74%      +2.0        2.96 ± 35%  perf-profile.calltrace.cycles-pp.do_read_fault.do_pte_missing.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
      0.46 ±121%      +2.1        2.59 ± 47%  perf-profile.calltrace.cycles-pp.ring_buffer_read_head.perf_mmap__read_head.perf_mmap__push.record__mmap_read_evlist.__cmd_record
      2.32 ± 33%      +2.3        4.64 ± 25%  perf-profile.calltrace.cycles-pp.__cmd_record.cmd_record.run_builtin.handle_internal_command.main
      2.32 ± 33%      +2.3        4.64 ± 25%  perf-profile.calltrace.cycles-pp.cmd_record.run_builtin.handle_internal_command.main
      0.99 ± 74%      +2.6        3.56 ± 45%  perf-profile.calltrace.cycles-pp.do_pte_missing.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.exc_page_fault
      0.96 ± 73%      +3.8        4.81 ± 52%  perf-profile.calltrace.cycles-pp.swevent_hlist_put_cpu.sw_perf_event_destroy._free_event.perf_event_release_kernel.perf_release
      4.11 ± 77%     +12.5       16.57 ± 40%  perf-profile.calltrace.cycles-pp.handle_internal_command.main
      4.11 ± 77%     +12.5       16.57 ± 40%  perf-profile.calltrace.cycles-pp.main
      4.11 ± 77%     +12.5       16.57 ± 40%  perf-profile.calltrace.cycles-pp.run_builtin.handle_internal_command.main
     13.21 ± 13%     -13.2        0.00        perf-profile.children.cycles-pp.perf_session__process_events
     13.21 ± 13%     -13.2        0.00        perf-profile.children.cycles-pp.reader__read_event
     13.21 ± 13%     -13.2        0.00        perf-profile.children.cycles-pp.record__finish_output
     13.16 ± 12%     -13.2        0.00        perf-profile.children.cycles-pp.ordered_events__queue
     13.16 ± 12%     -13.2        0.00        perf-profile.children.cycles-pp.process_simple
     13.16 ± 12%     -13.2        0.00        perf-profile.children.cycles-pp.queue_event
      9.74 ± 65%      -9.3        0.46 ±151%  perf-profile.children.cycles-pp.worker_thread
      9.44 ± 67%      -9.3        0.16 ±223%  perf-profile.children.cycles-pp.process_one_work
      9.26 ± 71%      -9.3        0.00        perf-profile.children.cycles-pp.ast_mode_config_helper_atomic_commit_tail
      9.26 ± 71%      -9.3        0.00        perf-profile.children.cycles-pp.commit_tail
      9.26 ± 71%      -9.3        0.00        perf-profile.children.cycles-pp.drm_atomic_commit
      9.26 ± 71%      -9.3        0.00        perf-profile.children.cycles-pp.drm_atomic_helper_commit
      9.26 ± 71%      -9.3        0.00        perf-profile.children.cycles-pp.drm_atomic_helper_commit_tail
      9.26 ± 71%      -9.3        0.00        perf-profile.children.cycles-pp.drm_atomic_helper_dirtyfb
      9.26 ± 71%      -9.3        0.00        perf-profile.children.cycles-pp.drm_fb_helper_damage_work
      9.26 ± 71%      -9.3        0.00        perf-profile.children.cycles-pp.drm_fbdev_shmem_helper_fb_dirty
      9.21 ± 71%      -9.2        0.00        perf-profile.children.cycles-pp.ast_primary_plane_helper_atomic_update
      9.21 ± 71%      -9.2        0.00        perf-profile.children.cycles-pp.drm_fb_memcpy
      9.21 ± 71%      -9.2        0.00        perf-profile.children.cycles-pp.memcpy_toio
      7.07 ±100%      -7.1        0.00        perf-profile.children.cycles-pp.drm_atomic_helper_commit_planes
      0.18 ±223%      +1.6        1.77 ± 71%  perf-profile.children.cycles-pp.__do_fault
      1.09 ± 70%      +1.7        2.78 ± 30%  perf-profile.children.cycles-pp.do_read_fault
      0.57 ±112%      +1.8        2.35 ± 41%  perf-profile.children.cycles-pp.ring_buffer_read_head
      0.46 ±121%      +1.9        2.35 ± 41%  perf-profile.children.cycles-pp.perf_mmap__read_head
      1.09 ± 70%      +2.5        3.56 ± 45%  perf-profile.children.cycles-pp.do_pte_missing
      1.06 ± 64%      +3.5        4.56 ± 60%  perf-profile.children.cycles-pp.swevent_hlist_put_cpu
      3.92 ± 35%      +6.7       10.58 ± 28%  perf-profile.children.cycles-pp.asm_exc_page_fault
      3.73 ± 78%     +11.1       14.85 ± 48%  perf-profile.children.cycles-pp.perf_mmap__push
      3.73 ± 78%     +11.1       14.85 ± 48%  perf-profile.children.cycles-pp.record__mmap_read_evlist
      4.11 ± 77%     +12.5       16.57 ± 40%  perf-profile.children.cycles-pp.cmd_record
      4.11 ± 77%     +12.5       16.57 ± 40%  perf-profile.children.cycles-pp.handle_internal_command
      4.11 ± 77%     +12.5       16.57 ± 40%  perf-profile.children.cycles-pp.main
      4.11 ± 77%     +12.5       16.57 ± 40%  perf-profile.children.cycles-pp.run_builtin
     61.60 ± 24%     +16.6       78.18 ±  5%  perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     61.51 ± 24%     +16.7       78.18 ±  5%  perf-profile.children.cycles-pp.do_syscall_64
     13.06 ± 12%     -13.1        0.00        perf-profile.self.cycles-pp.queue_event
      9.12 ± 71%      -9.1        0.00        perf-profile.self.cycles-pp.memcpy_toio
      0.97           +34.0%       1.30 ± 10%  perf-sched.sch_delay.avg.ms.__cond_resched.__tlb_batch_free_encoded_pages.tlb_flush_mmu.zap_pte_range.zap_pmd_range
      0.14 ±  3%     -15.1%       0.12 ±  7%  perf-sched.sch_delay.avg.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      0.98 ± 23%     +62.7%       1.59 ± 21%  perf-sched.sch_delay.avg.ms.__cond_resched.down_write.__split_vma.vma_modify.constprop
      0.02 ±169%     -98.4%       0.00 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.down_write_killable.exec_mmap.begin_new_exec.load_elf_binary
      1.74 ± 81%     -82.3%       0.31 ±117%  perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc_bulk_noprof.mas_alloc_nodes.mas_preallocate.__split_vma
      0.01 ±  4%     +15.1%       0.01 ±  3%  perf-sched.sch_delay.avg.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.14 ± 23%     -76.7%       0.03 ±105%  perf-sched.sch_delay.avg.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.83 ± 17%     +37.4%       1.14 ± 11%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
      0.47 ± 38%     -94.5%       0.03 ± 14%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range.do_poll.constprop.0.do_sys_poll
      0.19 ± 20%     -66.1%       0.06 ± 36%  perf-sched.sch_delay.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      0.04 ± 12%     +96.8%       0.08 ± 19%  perf-sched.sch_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.53 ± 29%    +112.9%       1.13 ± 19%  perf-sched.sch_delay.avg.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      0.01 ± 47%     +96.1%       0.02 ± 18%  perf-sched.sch_delay.avg.ms.wait_for_partner.fifo_open.do_dentry_open.vfs_open
     27.80 ± 19%     -68.5%       8.76 ±  8%  perf-sched.sch_delay.max.ms.__cond_resched.__tlb_batch_free_encoded_pages.tlb_flush_mmu.zap_pte_range.zap_pmd_range
      5.88 ± 11%     +43.7%       8.46 ± 23%  perf-sched.sch_delay.max.ms.__cond_resched.down_write.__mmap_new_vma.__mmap_region.mmap_region
      4.69 ± 24%     +78.6%       8.38 ± 25%  perf-sched.sch_delay.max.ms.__cond_resched.down_write.__split_vma.vma_modify.constprop
      5.07 ±  8%     +45.7%       7.39 ± 16%  perf-sched.sch_delay.max.ms.__cond_resched.down_write.__split_vma.vms_gather_munmap_vmas.do_vmi_align_munmap
      0.07 ±202%     -99.5%       0.00 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.down_write_killable.exec_mmap.begin_new_exec.load_elf_binary
      7.69 ± 13%    +190.8%      22.37 ± 59%  perf-sched.sch_delay.max.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
     52.53 ±  2%     +58.4%      83.18 ±  5%  perf-sched.total_wait_and_delay.average.ms
     63493           -56.7%      27486 ±  6%  perf-sched.total_wait_and_delay.count.ms
      4934           -15.6%       4162 ±  9%  perf-sched.total_wait_and_delay.max.ms
     51.94 ±  2%     +59.1%      82.65 ±  5%  perf-sched.total_wait_time.average.ms
      4934           -15.6%       4162 ±  9%  perf-sched.total_wait_time.max.ms
      6.94           -40.3%       4.14 ± 42%  perf-sched.wait_and_delay.avg.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      5.20 ±  4%     +23.9%       6.45 ±  6%  perf-sched.wait_and_delay.avg.ms.__cond_resched.shmem_get_folio_gfp.shmem_fault.__do_fault.do_shared_fault
      6.46 ±  3%     +25.1%       8.08 ±  4%  perf-sched.wait_and_delay.avg.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      3.89 ± 15%     +63.1%       6.34 ±  6%  perf-sched.wait_and_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
    501.14           -97.4%      13.01 ± 10%  perf-sched.wait_and_delay.avg.ms.schedule_hrtimeout_range.do_poll.constprop.0.do_sys_poll
    419.17 ±  6%     -27.9%     302.37 ±  9%  perf-sched.wait_and_delay.avg.ms.schedule_hrtimeout_range.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
      3.63 ±  2%     +35.3%       4.91 ±  6%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
    100.05 ±  3%     +85.6%     185.71 ±  7%  perf-sched.wait_and_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
    748.31           -23.4%     572.89 ±  5%  perf-sched.wait_and_delay.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
    531.33 ±  9%     -45.9%     287.67 ± 13%  perf-sched.wait_and_delay.count.__cond_resched.__get_user_pages.populate_vma_page_range.__mm_populate.vm_mmap_pgoff
     13020 ±  3%     -99.4%      82.50 ±101%  perf-sched.wait_and_delay.count.__cond_resched.__tlb_batch_free_encoded_pages.tlb_flush_mmu.zap_pte_range.zap_pmd_range
    597.83 ±  3%     -42.6%     343.17 ± 13%  perf-sched.wait_and_delay.count.__cond_resched.shmem_get_folio_gfp.shmem_fault.__do_fault.do_shared_fault
      2105 ±  3%     -44.5%       1168 ± 11%  perf-sched.wait_and_delay.count.__cond_resched.shrink_folio_list.reclaim_folio_list.reclaim_pages.madvise_cold_or_pageout_pte_range
    397.67 ±  7%     -34.9%     259.00 ± 26%  perf-sched.wait_and_delay.count.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      5033 ±  2%     -91.2%     445.00 ± 12%  perf-sched.wait_and_delay.count.__cond_resched.unmap_vmas.vms_clear_ptes.part.0
     11888 ±  3%     -45.8%       6443 ±  8%  perf-sched.wait_and_delay.count.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
    958.83 ± 12%     -55.3%     428.50 ± 10%  perf-sched.wait_and_delay.count.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
     24.00         +5286.8%       1292        perf-sched.wait_and_delay.count.schedule_hrtimeout_range.do_poll.constprop.0.do_sys_poll
     17.33 ± 19%     +40.4%      24.33 ±  9%  perf-sched.wait_and_delay.count.schedule_hrtimeout_range.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
      1379 ±  2%     -38.1%     853.83 ± 10%  perf-sched.wait_and_delay.count.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
     20679 ±  3%     -63.3%       7586 ±  6%  perf-sched.wait_and_delay.count.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      1098 ± 24%    +129.8%       2524 ± 11%  perf-sched.wait_and_delay.count.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
     49.20 ± 28%     -78.6%      10.52 ±100%  perf-sched.wait_and_delay.max.ms.__cond_resched.__tlb_batch_free_encoded_pages.tlb_flush_mmu.zap_pte_range.zap_pmd_range
      4934           -46.3%       2650 ± 63%  perf-sched.wait_and_delay.max.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
     18.78 ± 53%   +2328.1%     455.89 ±  9%  perf-sched.wait_and_delay.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      2445 ± 59%     -65.7%     839.36 ± 42%  perf-sched.wait_and_delay.max.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      2229 ± 29%     +40.2%       3125 ± 11%  perf-sched.wait_and_delay.max.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      3.86 ± 16%     +60.8%       6.21 ± 15%  perf-sched.wait_time.avg.ms.__cond_resched.__get_user_pages.faultin_page_range.do_madvise.part
      0.29 ±217%   +2888.3%       8.65 ±114%  perf-sched.wait_time.avg.ms.__cond_resched.__tlb_batch_free_encoded_pages.tlb_finish_mmu.exit_mmap.__mmput
      3.28 ±  2%     +54.9%       5.07 ±  6%  perf-sched.wait_time.avg.ms.__cond_resched.__tlb_batch_free_encoded_pages.tlb_flush_mmu.zap_pte_range.zap_pmd_range
      6.79           -40.8%       4.02 ± 43%  perf-sched.wait_time.avg.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      3.11 ± 20%     +43.0%       4.44 ±  8%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.__mmap_new_vma.__mmap_region.mmap_region
      4.91 ±  8%     +13.7%       5.58 ±  6%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.__split_vma.vms_gather_munmap_vmas.do_vmi_align_munmap
      3.24 ±  8%     +50.0%       4.86 ±  8%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.madvise_vma_behavior.do_madvise.part
      3.36 ±  8%     +33.0%       4.46 ±  7%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.vma_link_file.__mmap_new_vma.__mmap_region
      3.17 ± 16%     +37.9%       4.37 ± 14%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.vms_gather_munmap_vmas.do_vmi_align_munmap.do_vmi_munmap
      2.90 ± 13%     +48.9%       4.32 ± 13%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc_noprof.mas_alloc_nodes.mas_preallocate.__mmap_new_vma
      4.16 ± 10%     +28.8%       5.36 ±  8%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc_noprof.mas_alloc_nodes.mas_preallocate.__split_vma
      3.12 ±  4%     +45.5%       4.54 ± 10%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc_noprof.vm_area_alloc.__mmap_new_vma.__mmap_region
      3.65 ±  6%     +32.9%       4.85 ±  5%  perf-sched.wait_time.avg.ms.__cond_resched.madvise_cold_or_pageout_pte_range.walk_pmd_range.isra.0
      3.21 ± 67%    +148.8%       8.00 ± 20%  perf-sched.wait_time.avg.ms.__cond_resched.rmap_walk_file.try_to_unmap.shrink_folio_list.reclaim_folio_list
      4.15 ±  4%     +27.3%       5.28 ±  6%  perf-sched.wait_time.avg.ms.__cond_resched.shmem_get_folio_gfp.shmem_fault.__do_fault.do_shared_fault
      3.00 ± 55%    +193.2%       8.79 ± 11%  perf-sched.wait_time.avg.ms.__cond_resched.stop_one_cpu.migrate_task_to.task_numa_migrate.isra
      1.72 ± 67%    +268.6%       6.34 ± 45%  perf-sched.wait_time.avg.ms.__cond_resched.zap_pmd_range.isra.0.unmap_page_range
      3.19 ± 14%    +165.4%       8.46 ±100%  perf-sched.wait_time.avg.ms.__cond_resched.zap_pte_range.zap_pmd_range.isra.0
      5.52 ±  3%     +30.3%       7.20        perf-sched.wait_time.avg.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
     33.42           -83.0%       5.67 ± 11%  perf-sched.wait_time.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.x64_sys_call
      0.63 ±  6%   +1085.4%       7.44 ± 53%  perf-sched.wait_time.avg.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
      3.91 ±  5%     +26.1%       4.92 ± 10%  perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown]
      3.06 ± 14%     +70.1%       5.20 ±  6%  perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
    500.68           -97.4%      12.99 ± 10%  perf-sched.wait_time.avg.ms.schedule_hrtimeout_range.do_poll.constprop.0.do_sys_poll
    418.84 ±  6%     -27.8%     302.20 ±  9%  perf-sched.wait_time.avg.ms.schedule_hrtimeout_range.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
      3.59 ±  2%     +35.2%       4.86 ±  6%  perf-sched.wait_time.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
    100.01 ±  3%     +85.6%     185.63 ±  7%  perf-sched.wait_time.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
    748.14           -23.4%     572.76 ±  5%  perf-sched.wait_time.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      0.70 ±210%   +3691.7%      26.56 ±156%  perf-sched.wait_time.max.ms.__cond_resched.__tlb_batch_free_encoded_pages.tlb_finish_mmu.exit_mmap.__mmput
     26.32 ± 19%     -43.6%      14.86 ±  6%  perf-sched.wait_time.max.ms.__cond_resched.__tlb_batch_free_encoded_pages.tlb_flush_mmu.zap_pte_range.zap_pmd_range
      4934           -46.3%       2650 ± 63%  perf-sched.wait_time.max.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
     11.35 ±  5%     +67.5%      19.02 ± 26%  perf-sched.wait_time.max.ms.__cond_resched.madvise_cold_or_pageout_pte_range.walk_pmd_range.isra.0
      5.00 ± 31%  +16590.1%     833.75 ± 72%  perf-sched.wait_time.max.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
     12.13 ± 57%   +3658.0%     455.78 ±  9%  perf-sched.wait_time.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      2445 ± 59%     -65.8%     837.17 ± 43%  perf-sched.wait_time.max.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      0.11 ±125%     -95.7%       0.00 ±109%  perf-sched.wait_time.max.ms.wait_for_partner.fifo_open.do_dentry_open.vfs_open
      2229 ± 29%     +40.2%       3125 ± 11%  perf-sched.wait_time.max.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm



***************************************************************************************************
lkp-icl-2sp7: 64 threads 2 sockets Intel(R) Xeon(R) Gold 6346 CPU @ 3.10GHz (Ice Lake) with 256G memory
=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-12/performance/x86_64-rhel-9.4/100%/debian-12-x86_64-20240206.cgz/lkp-icl-2sp7/mmapmany/stress-ng/60s

commit: 
  44d46b76c3 ("mm: add build-time option for hotplug memory default online type")
  1aa43598c0 ("mm: remove unnecessary calls to lru_add_drain")

44d46b76c3a4b514 1aa43598c03b71d945f8b12d6d5 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
     37343 ± 12%     -30.5%      25971 ± 13%  perf-c2c.HITM.local
 4.493e+08 ±  7%     +26.1%  5.664e+08 ±  5%  cpuidle..time
    208650 ±  5%     +29.5%     270176 ±  2%  cpuidle..usage
   9157756 ±  3%      +8.8%    9964584 ±  4%  numa-meminfo.node0.AnonPages
  13441948 ± 10%     +14.5%   15389194 ± 11%  numa-meminfo.node0.MemUsed
      3682 ±  2%      +8.1%       3978        vmstat.system.cs
    154546            -2.6%     150493        vmstat.system.in
     10.51 ±  6%      +3.0       13.52 ±  6%  mpstat.cpu.all.idle%
      0.24 ±  2%      +0.1        0.30 ±  2%  mpstat.cpu.all.irq%
      5.27 ±  3%      +1.6        6.90        mpstat.cpu.all.soft%
      4.10            +0.5        4.57 ±  2%  mpstat.cpu.all.usr%
  47736023 ±  2%     +33.6%   63763964        numa-numastat.node0.local_node
  47771035 ±  2%     +33.6%   63842828        numa-numastat.node0.numa_hit
  47417232           +33.3%   63214227 ±  3%  numa-numastat.node1.local_node
  47453468           +33.3%   63254445 ±  3%  numa-numastat.node1.numa_hit
   2289819 ±  3%      +8.6%    2486209 ±  4%  numa-vmstat.node0.nr_anon_pages
  47773736 ±  2%     +33.6%   63842873        numa-vmstat.node0.numa_hit
  47738723 ±  2%     +33.6%   63764009        numa-vmstat.node0.numa_local
      8755 ±  7%      +9.4%       9575 ±  4%  numa-vmstat.node1.nr_page_table_pages
  47452883           +33.3%   63254125 ±  3%  numa-vmstat.node1.numa_hit
  47416648           +33.3%   63213907 ±  3%  numa-vmstat.node1.numa_local
  45615669 ±  2%     +34.8%   61477067        stress-ng.mmapmany.ops
    741329           +35.0%    1000902        stress-ng.mmapmany.ops_per_sec
     74630            +5.5%      78748        stress-ng.time.involuntary_context_switches
  94424186           +33.2%  1.257e+08        stress-ng.time.minor_page_faults
      5213            -5.9%       4906        stress-ng.time.percent_of_cpu_this_job_got
      3217            -6.5%       3009        stress-ng.time.system_time
     43.72 ±  2%     +38.8%      60.70        stress-ng.time.user_time
  28270862 ±  4%     +65.0%   46641446 ±  3%  sched_debug.cfs_rq:/.avg_vruntime.avg
  53764347 ±  7%     +49.2%   80200673 ±  6%  sched_debug.cfs_rq:/.avg_vruntime.max
   9581175 ± 12%    +135.7%   22580348 ± 17%  sched_debug.cfs_rq:/.avg_vruntime.min
   9920885 ± 16%     +41.1%   14001795 ± 14%  sched_debug.cfs_rq:/.avg_vruntime.stddev
  28270864 ±  4%     +65.0%   46641446 ±  3%  sched_debug.cfs_rq:/.min_vruntime.avg
  53764347 ±  7%     +49.2%   80200673 ±  6%  sched_debug.cfs_rq:/.min_vruntime.max
   9581175 ± 12%    +135.7%   22580348 ± 17%  sched_debug.cfs_rq:/.min_vruntime.min
   9920885 ± 16%     +41.1%   14001796 ± 14%  sched_debug.cfs_rq:/.min_vruntime.stddev
      1373 ±  7%     +21.4%       1666 ±  6%  sched_debug.cpu.nr_switches.min
   4716868            +4.8%    4942112        proc-vmstat.nr_active_anon
   4616226            +4.9%    4840863        proc-vmstat.nr_anon_pages
     18226            +4.9%      19115        proc-vmstat.nr_page_table_pages
    337964            +5.9%     358063        proc-vmstat.nr_slab_unreclaimable
   4716870            +4.8%    4942111        proc-vmstat.nr_zone_active_anon
  95226225           +33.5%  1.271e+08        proc-vmstat.numa_hit
  95154978           +33.4%   1.27e+08        proc-vmstat.numa_local
  95476558           +33.2%  1.272e+08        proc-vmstat.pgalloc_normal
  94995185           +33.0%  1.263e+08        proc-vmstat.pgfault
  94995299           +33.5%  1.268e+08        proc-vmstat.pgfree
      3.09            +3.7%       3.21        perf-stat.i.MPKI
 1.338e+10           +23.8%  1.657e+10        perf-stat.i.branch-instructions
      0.60 ±  2%      -0.0        0.57 ±  2%  perf-stat.i.branch-miss-rate%
  78698913 ±  2%     +18.4%   93154163 ±  2%  perf-stat.i.branch-misses
     75.05            +3.9       78.94        perf-stat.i.cache-miss-rate%
 1.993e+08           +32.2%  2.634e+08        perf-stat.i.cache-misses
 2.703e+08           +24.3%  3.361e+08        perf-stat.i.cache-references
      3614 ±  2%      +7.9%       3900        perf-stat.i.context-switches
      2.85           -20.4%       2.27        perf-stat.i.cpi
 1.797e+11            -2.7%  1.748e+11        perf-stat.i.cpu-cycles
    248.56           +37.3%     341.20        perf-stat.i.cpu-migrations
    976.48           -22.0%     761.88 ±  3%  perf-stat.i.cycles-between-cache-misses
 6.475e+10           +25.1%    8.1e+10        perf-stat.i.instructions
      0.37           +28.3%       0.48        perf-stat.i.ipc
     47.64           +33.5%      63.61 ±  2%  perf-stat.i.metric.K/sec
   1525873           +33.5%    2036644 ±  2%  perf-stat.i.minor-faults
   1525873           +33.5%    2036644 ±  2%  perf-stat.i.page-faults
      3.20 ± 49%     -44.9%       1.77 ± 32%  perf-sched.sch_delay.avg.ms.__cond_resched.down_write.unlink_anon_vmas.free_pgtables.vms_clear_ptes
      4.69 ± 96%     -65.1%       1.64 ± 46%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
    153.35 ±  6%     -14.1%     131.67        perf-sched.wait_and_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
     83.33 ± 13%     +84.8%     154.00 ± 17%  perf-sched.wait_and_delay.count.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_mpol_noprof.vma_alloc_folio_noprof
     12.67 ±223%    +782.9%     111.83 ± 10%  perf-sched.wait_and_delay.count.__cond_resched.down_write.__split_vma.vms_gather_munmap_vmas.do_vmi_align_munmap
     98.33 ± 11%     +64.2%     161.50 ± 11%  perf-sched.wait_and_delay.count.__cond_resched.down_write.anon_vma_clone.__split_vma.vms_gather_munmap_vmas
     80.00 ±  6%     +85.2%     148.17 ± 11%  perf-sched.wait_and_delay.count.__cond_resched.kmem_cache_alloc_noprof.mas_alloc_nodes.mas_preallocate.__split_vma
    179.50 ±  7%     +71.8%     308.33 ±  8%  perf-sched.wait_and_delay.count.__cond_resched.kmem_cache_alloc_noprof.vm_area_dup.__split_vma.vms_gather_munmap_vmas
      1450 ±  5%     -36.2%     925.83 ±  5%  perf-sched.wait_and_delay.count.__cond_resched.unmap_vmas.vms_clear_ptes.part.0
    550.00 ± 18%     +38.0%     759.17 ±  4%  perf-sched.wait_and_delay.count.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
    310.50 ± 10%    +111.2%     655.83 ± 10%  perf-sched.wait_and_delay.count.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown].[unknown]
      3865 ±  5%     +18.6%       4585        perf-sched.wait_and_delay.count.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
     16.68 ±223%    +443.6%      90.66 ± 64%  perf-sched.wait_and_delay.max.ms.__cond_resched.down_write.__split_vma.vms_gather_munmap_vmas.do_vmi_align_munmap
      3.20 ± 49%     -44.9%       1.77 ± 32%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.unlink_anon_vmas.free_pgtables.vms_clear_ptes
      4.46 ± 27%     -48.8%       2.28 ± 19%  perf-sched.wait_time.avg.ms.__cond_resched.down_write_killable.__vm_munmap.__x64_sys_munmap.do_syscall_64
      0.29 ± 72%     -72.5%       0.08 ± 59%  perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown].[unknown]
      4.51 ± 99%     -59.3%       1.84 ± 10%  perf-sched.wait_time.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
    153.25 ±  6%     -14.1%     131.57        perf-sched.wait_time.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
     37.73 ±117%     -90.5%       3.60 ± 54%  perf-sched.wait_time.max.ms.__cond_resched.change_pud_range.isra.0.change_protection_range
     44.25 ± 89%     +83.3%      81.14 ± 33%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc_noprof.mas_alloc_nodes.mas_preallocate.__split_vma
     20.69 ±  2%     -20.7        0.00        perf-profile.calltrace.cycles-pp.lru_add_drain.vms_clear_ptes.vms_complete_munmap_vmas.do_vmi_align_munmap.do_vmi_munmap
     20.69 ±  2%     -20.7        0.00        perf-profile.calltrace.cycles-pp.lru_add_drain_cpu.lru_add_drain.vms_clear_ptes.vms_complete_munmap_vmas.do_vmi_align_munmap
     20.65 ±  2%     -20.7        0.00        perf-profile.calltrace.cycles-pp.folio_batch_move_lru.lru_add_drain_cpu.lru_add_drain.vms_clear_ptes.vms_complete_munmap_vmas
     18.66 ±  2%     -18.7        0.00        perf-profile.calltrace.cycles-pp.folio_lruvec_lock_irqsave.folio_batch_move_lru.lru_add_drain_cpu.lru_add_drain.vms_clear_ptes
     18.64 ±  2%     -18.6        0.00        perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.folio_lruvec_lock_irqsave.folio_batch_move_lru.lru_add_drain_cpu.lru_add_drain
     18.32 ±  2%     -18.3        0.00        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.folio_lruvec_lock_irqsave.folio_batch_move_lru.lru_add_drain_cpu
     64.22           -17.8       46.43 ±  3%  perf-profile.calltrace.cycles-pp.vms_clear_ptes.vms_complete_munmap_vmas.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap
     64.64           -17.6       47.05 ±  3%  perf-profile.calltrace.cycles-pp.vms_complete_munmap_vmas.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap.__x64_sys_munmap
     80.26           -10.3       69.98        perf-profile.calltrace.cycles-pp.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap.__x64_sys_munmap.do_syscall_64
     80.77           -10.0       70.75        perf-profile.calltrace.cycles-pp.do_vmi_munmap.__vm_munmap.__x64_sys_munmap.do_syscall_64.entry_SYSCALL_64_after_hwframe
     80.98            -9.9       71.07        perf-profile.calltrace.cycles-pp.__vm_munmap.__x64_sys_munmap.do_syscall_64.entry_SYSCALL_64_after_hwframe.__munmap
     80.99            -9.9       71.09        perf-profile.calltrace.cycles-pp.__x64_sys_munmap.do_syscall_64.entry_SYSCALL_64_after_hwframe.__munmap
     81.23            -9.7       71.52        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__munmap
     81.26            -9.7       71.56        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__munmap
     81.78            -9.5       72.30        perf-profile.calltrace.cycles-pp.__munmap
      2.33 ±  2%      -0.3        2.00 ±  4%  perf-profile.calltrace.cycles-pp.rcu_core.handle_softirqs.__irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
      2.32 ±  2%      -0.3        1.99 ±  4%  perf-profile.calltrace.cycles-pp.rcu_do_batch.rcu_core.handle_softirqs.__irq_exit_rcu.sysvec_apic_timer_interrupt
      0.67 ±  2%      +0.1        0.74 ±  3%  perf-profile.calltrace.cycles-pp.zap_pmd_range.unmap_page_range.unmap_vmas.vms_clear_ptes.vms_complete_munmap_vmas
      0.79            +0.1        0.92 ±  3%  perf-profile.calltrace.cycles-pp.unmap_page_range.unmap_vmas.vms_clear_ptes.vms_complete_munmap_vmas.do_vmi_align_munmap
      0.69 ± 18%      +0.2        0.87 ±  6%  perf-profile.calltrace.cycles-pp.__rmqueue_pcplist.rmqueue.get_page_from_freelist.__alloc_frozen_pages_noprof.alloc_pages_mpol
      0.88            +0.2        1.06 ±  3%  perf-profile.calltrace.cycles-pp.unmap_vmas.vms_clear_ptes.vms_complete_munmap_vmas.do_vmi_align_munmap.do_vmi_munmap
      0.57 ±  4%      +0.2        0.78 ±  3%  perf-profile.calltrace.cycles-pp.vma_merge_new_range.__mmap_region.do_mmap.vm_mmap_pgoff.do_syscall_64
      0.74 ± 17%      +0.2        0.95 ±  5%  perf-profile.calltrace.cycles-pp.rmqueue.get_page_from_freelist.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_mpol_noprof
      0.86 ±  3%      +0.2        1.08 ±  4%  perf-profile.calltrace.cycles-pp.kmem_cache_free.rcu_do_batch.rcu_core.handle_softirqs.__irq_exit_rcu
      0.58 ±  5%      +0.2        0.80 ±  5%  perf-profile.calltrace.cycles-pp.___slab_alloc.kmem_cache_alloc_noprof.vm_area_dup.__split_vma.vms_gather_munmap_vmas
      0.54 ±  2%      +0.2        0.78 ±  3%  perf-profile.calltrace.cycles-pp.kmem_cache_alloc_noprof.anon_vma_clone.__split_vma.vms_gather_munmap_vmas.do_vmi_align_munmap
      0.53 ±  2%      +0.2        0.77 ±  3%  perf-profile.calltrace.cycles-pp.mas_push_data.mas_split.mas_wr_bnode.mas_store_prealloc.vma_complete
      0.61 ±  3%      +0.3        0.87 ±  3%  perf-profile.calltrace.cycles-pp.mas_rev_awalk.mas_empty_area_rev.unmapped_area_topdown.vm_unmapped_area.arch_get_unmapped_area_topdown
      0.44 ± 44%      +0.3        0.70 ±  3%  perf-profile.calltrace.cycles-pp.vma_expand.vma_merge_new_range.__mmap_region.do_mmap.vm_mmap_pgoff
      0.56 ±  6%      +0.3        0.82 ±  4%  perf-profile.calltrace.cycles-pp.walk_page_vma.show_smap.seq_read_iter.seq_read.vfs_read
      0.58 ±  7%      +0.3        0.85 ±  5%  perf-profile.calltrace.cycles-pp.vsnprintf.seq_printf.show_smap.seq_read_iter.seq_read
      0.58 ±  5%      +0.3        0.86 ±  5%  perf-profile.calltrace.cycles-pp.vm_area_free_rcu_cb.rcu_do_batch.rcu_core.handle_softirqs.run_ksoftirqd
      0.62 ±  3%      +0.3        0.91 ±  3%  perf-profile.calltrace.cycles-pp.mab_mas_cp.mas_spanning_rebalance.mas_wr_spanning_store.mas_store_gfp.do_vmi_align_munmap
      0.69 ±  7%      +0.3        1.02 ±  4%  perf-profile.calltrace.cycles-pp.seq_printf.show_smap.seq_read_iter.seq_read.vfs_read
      0.45 ± 45%      +0.3        0.78 ±  4%  perf-profile.calltrace.cycles-pp.__walk_page_range.walk_page_vma.show_smap.seq_read_iter.seq_read
      0.78 ±  3%      +0.3        1.12 ±  3%  perf-profile.calltrace.cycles-pp.mas_empty_area_rev.unmapped_area_topdown.vm_unmapped_area.arch_get_unmapped_area_topdown.__get_unmapped_area
      0.48 ± 44%      +0.4        0.82 ±  4%  perf-profile.calltrace.cycles-pp.m_next.seq_read_iter.seq_read.vfs_read.ksys_read
      0.67 ±  2%      +0.4        1.03 ±  3%  perf-profile.calltrace.cycles-pp.unlink_anon_vmas.free_pgtables.vms_clear_ptes.vms_complete_munmap_vmas.do_vmi_align_munmap
      0.88            +0.4        1.25 ±  2%  perf-profile.calltrace.cycles-pp.__memcg_slab_post_alloc_hook.kmem_cache_alloc_noprof.vm_area_dup.__split_vma.vms_gather_munmap_vmas
      0.88 ±  3%      +0.4        1.26 ±  3%  perf-profile.calltrace.cycles-pp.unmapped_area_topdown.vm_unmapped_area.arch_get_unmapped_area_topdown.__get_unmapped_area.do_mmap
      0.78 ±  6%      +0.4        1.16 ±  6%  perf-profile.calltrace.cycles-pp.try_charge_memcg.charge_memcg.__mem_cgroup_charge.alloc_anon_folio.do_anonymous_page
      0.88 ±  3%      +0.4        1.27 ±  3%  perf-profile.calltrace.cycles-pp.vm_unmapped_area.arch_get_unmapped_area_topdown.__get_unmapped_area.do_mmap.vm_mmap_pgoff
      0.81 ±  6%      +0.4        1.21 ±  6%  perf-profile.calltrace.cycles-pp.charge_memcg.__mem_cgroup_charge.alloc_anon_folio.do_anonymous_page.__handle_mm_fault
      0.90 ±  3%      +0.4        1.29 ±  2%  perf-profile.calltrace.cycles-pp.__kmem_cache_alloc_bulk.kmem_cache_alloc_bulk_noprof.mas_alloc_nodes.mas_preallocate.__split_vma
      0.92 ±  3%      +0.4        1.32 ±  3%  perf-profile.calltrace.cycles-pp.arch_get_unmapped_area_topdown.__get_unmapped_area.do_mmap.vm_mmap_pgoff.do_syscall_64
      0.92 ±  3%      +0.4        1.32 ±  2%  perf-profile.calltrace.cycles-pp.kmem_cache_alloc_bulk_noprof.mas_alloc_nodes.mas_preallocate.__split_vma.vms_gather_munmap_vmas
      0.95 ±  3%      +0.4        1.36 ±  3%  perf-profile.calltrace.cycles-pp.__get_unmapped_area.do_mmap.vm_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.81            +0.4        1.23 ±  3%  perf-profile.calltrace.cycles-pp.free_pgtables.vms_clear_ptes.vms_complete_munmap_vmas.do_vmi_align_munmap.do_vmi_munmap
      0.96 ±  7%      +0.4        1.40 ±  5%  perf-profile.calltrace.cycles-pp.seq_put_decimal_ull_width.__show_smap.show_smap.seq_read_iter.seq_read
      1.57 ±  4%      +0.4        2.01 ±  4%  perf-profile.calltrace.cycles-pp.__irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.folios_put_refs.free_pages_and_swap_cache
      1.56 ±  4%      +0.4        2.01 ±  4%  perf-profile.calltrace.cycles-pp.handle_softirqs.__irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.folios_put_refs
      0.98 ±  2%      +0.4        1.43 ±  3%  perf-profile.calltrace.cycles-pp.mas_split.mas_wr_bnode.mas_store_prealloc.vma_complete.__split_vma
      1.00 ±  7%      +0.5        1.46 ±  5%  perf-profile.calltrace.cycles-pp.__show_smap.show_smap.seq_read_iter.seq_read.vfs_read
      1.63 ±  4%      +0.5        2.09 ±  4%  perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.folios_put_refs.free_pages_and_swap_cache.__tlb_batch_free_encoded_pages
      1.64 ±  4%      +0.5        2.10 ±  4%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.folios_put_refs.free_pages_and_swap_cache.__tlb_batch_free_encoded_pages.tlb_finish_mmu
      1.02 ±  2%      +0.5        1.48 ±  3%  perf-profile.calltrace.cycles-pp.mas_wr_node_store.mas_store_prealloc.vma_complete.__split_vma.vms_gather_munmap_vmas
      0.95 ±  2%      +0.5        1.42 ±  3%  perf-profile.calltrace.cycles-pp.mas_spanning_rebalance.mas_rebalance.mas_wr_bnode.mas_store_gfp.do_vmi_align_munmap
      0.25 ±100%      +0.5        0.73 ±  3%  perf-profile.calltrace.cycles-pp.anon_vma_interval_tree_insert.anon_vma_clone.__split_vma.vms_gather_munmap_vmas.do_vmi_align_munmap
      1.00 ±  2%      +0.5        1.48        perf-profile.calltrace.cycles-pp.lru_gen_del_folio.__page_cache_release.folios_put_refs.free_pages_and_swap_cache.__tlb_batch_free_encoded_pages
      1.20 ±  3%      +0.5        1.69 ±  3%  perf-profile.calltrace.cycles-pp.__mmap_region.do_mmap.vm_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.09 ±  2%      +0.5        1.59 ±  3%  perf-profile.calltrace.cycles-pp.mas_wr_bnode.mas_store_prealloc.vma_complete.__split_vma.vms_gather_munmap_vmas
      1.14 ±  3%      +0.5        1.64 ±  2%  perf-profile.calltrace.cycles-pp.mas_alloc_nodes.mas_preallocate.__split_vma.vms_gather_munmap_vmas.do_vmi_align_munmap
      1.01 ±  2%      +0.5        1.51 ±  3%  perf-profile.calltrace.cycles-pp.mas_rebalance.mas_wr_bnode.mas_store_gfp.do_vmi_align_munmap.do_vmi_munmap
      1.04 ±  2%      +0.5        1.56 ±  3%  perf-profile.calltrace.cycles-pp.mas_wr_bnode.mas_store_gfp.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap
      0.08 ±223%      +0.5        0.60 ±  4%  perf-profile.calltrace.cycles-pp.vm_area_free_rcu_cb.rcu_do_batch.rcu_core.handle_softirqs.__irq_exit_rcu
      0.00            +0.5        0.53 ±  3%  perf-profile.calltrace.cycles-pp.kmem_cache_free.unlink_anon_vmas.free_pgtables.vms_clear_ptes.vms_complete_munmap_vmas
      0.00            +0.5        0.54 ±  5%  perf-profile.calltrace.cycles-pp.mas_topiary_replace.mas_spanning_rebalance.mas_wr_spanning_store.mas_store_gfp.do_vmi_align_munmap
      0.00            +0.5        0.54 ±  2%  perf-profile.calltrace.cycles-pp.___slab_alloc.__kmem_cache_alloc_bulk.kmem_cache_alloc_bulk_noprof.mas_alloc_nodes.mas_store_gfp
      0.17 ±141%      +0.5        0.71 ±  4%  perf-profile.calltrace.cycles-pp.walk_pgd_range.__walk_page_range.walk_page_vma.show_smap.seq_read_iter
      0.08 ±223%      +0.6        0.63 ±  2%  perf-profile.calltrace.cycles-pp.commit_merge.vma_expand.vma_merge_new_range.__mmap_region.do_mmap
      1.34 ±  4%      +0.6        1.92 ±  4%  perf-profile.calltrace.cycles-pp.__mem_cgroup_charge.alloc_anon_folio.do_anonymous_page.__handle_mm_fault.handle_mm_fault
      1.42 ±  2%      +0.6        2.02        perf-profile.calltrace.cycles-pp.__slab_free.kmem_cache_free.rcu_do_batch.rcu_core.handle_softirqs
      0.08 ±223%      +0.6        0.68 ±  4%  perf-profile.calltrace.cycles-pp.walk_p4d_range.walk_pgd_range.__walk_page_range.walk_page_vma.show_smap
      0.00            +0.6        0.60 ±  4%  perf-profile.calltrace.cycles-pp.smaps_pte_range.walk_pmd_range.walk_pud_range.walk_p4d_range.walk_pgd_range
      1.30 ±  2%      +0.6        1.91 ±  3%  perf-profile.calltrace.cycles-pp.anon_vma_clone.__split_vma.vms_gather_munmap_vmas.do_vmi_align_munmap.do_vmi_munmap
      0.00            +0.6        0.62 ±  3%  perf-profile.calltrace.cycles-pp.mas_walk.mas_find.do_vmi_munmap.__vm_munmap.__x64_sys_munmap
      0.00            +0.6        0.63 ±  4%  perf-profile.calltrace.cycles-pp.walk_pmd_range.walk_pud_range.walk_p4d_range.walk_pgd_range.__walk_page_range
      0.00            +0.6        0.65 ±  4%  perf-profile.calltrace.cycles-pp.flush_tlb_mm_range.tlb_finish_mmu.vms_clear_ptes.vms_complete_munmap_vmas.do_vmi_align_munmap
      0.00            +0.7        0.65 ±  5%  perf-profile.calltrace.cycles-pp.kmem_cache_free.vm_area_free_rcu_cb.rcu_do_batch.rcu_core.handle_softirqs
      0.00            +0.7        0.66 ±  4%  perf-profile.calltrace.cycles-pp.walk_pud_range.walk_p4d_range.walk_pgd_range.__walk_page_range.walk_page_vma
      1.34            +0.7        2.02 ±  3%  perf-profile.calltrace.cycles-pp.__kmem_cache_alloc_bulk.kmem_cache_alloc_bulk_noprof.mas_alloc_nodes.mas_store_gfp.do_vmi_align_munmap
      0.00            +0.7        0.68 ±  2%  perf-profile.calltrace.cycles-pp.mas_find.do_vmi_munmap.__vm_munmap.__x64_sys_munmap.do_syscall_64
      1.36            +0.7        2.04 ±  3%  perf-profile.calltrace.cycles-pp.kmem_cache_alloc_bulk_noprof.mas_alloc_nodes.mas_store_gfp.do_vmi_align_munmap.do_vmi_munmap
      1.71 ±  2%      +0.7        2.39 ±  2%  perf-profile.calltrace.cycles-pp.clear_page_erms.get_page_from_freelist.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_mpol_noprof
      0.00            +0.7        0.72 ±  4%  perf-profile.calltrace.cycles-pp.mas_wr_node_store.mas_store_gfp.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap
      1.49            +0.7        2.22 ±  3%  perf-profile.calltrace.cycles-pp.mas_alloc_nodes.mas_store_gfp.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap
      1.80 ±  2%      +0.7        2.53 ±  3%  perf-profile.calltrace.cycles-pp.kmem_cache_alloc_noprof.vm_area_dup.__split_vma.vms_gather_munmap_vmas.do_vmi_align_munmap
      1.68            +0.8        2.47 ±  3%  perf-profile.calltrace.cycles-pp.mas_preallocate.__split_vma.vms_gather_munmap_vmas.do_vmi_align_munmap.do_vmi_munmap
      1.76 ±  2%      +0.9        2.64 ±  4%  perf-profile.calltrace.cycles-pp.mas_spanning_rebalance.mas_wr_spanning_store.mas_store_gfp.do_vmi_align_munmap.do_vmi_munmap
      2.20 ±  3%      +0.9        3.12 ±  3%  perf-profile.calltrace.cycles-pp.do_mmap.vm_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe.__mmap
      2.21 ±  2%      +0.9        3.14 ±  3%  perf-profile.calltrace.cycles-pp.vm_area_dup.__split_vma.vms_gather_munmap_vmas.do_vmi_align_munmap.do_vmi_munmap
      2.58 ±  6%      +0.9        3.52        perf-profile.calltrace.cycles-pp.get_page_from_freelist.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_mpol_noprof.vma_alloc_folio_noprof
      2.28 ±  3%      +1.0        3.23 ±  3%  perf-profile.calltrace.cycles-pp.vm_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe.__mmap
      1.96 ±  2%      +1.0        2.93 ±  4%  perf-profile.calltrace.cycles-pp.mas_wr_spanning_store.mas_store_gfp.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap
      2.66 ±  6%      +1.0        3.64        perf-profile.calltrace.cycles-pp.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_mpol_noprof.vma_alloc_folio_noprof.alloc_anon_folio
      2.34 ±  3%      +1.0        3.34 ±  3%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__mmap
      2.34 ±  3%      +1.0        3.36 ±  3%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__mmap
      1.35 ±  2%      +1.0        2.38 ±  5%  perf-profile.calltrace.cycles-pp.page_counter_uncharge.uncharge_batch.__mem_cgroup_uncharge_folios.folios_put_refs.free_pages_and_swap_cache
      1.30 ±  3%      +1.0        2.33 ±  5%  perf-profile.calltrace.cycles-pp.page_counter_cancel.page_counter_uncharge.uncharge_batch.__mem_cgroup_uncharge_folios.folios_put_refs
      2.74 ±  6%      +1.0        3.78        perf-profile.calltrace.cycles-pp.alloc_pages_mpol.folio_alloc_mpol_noprof.vma_alloc_folio_noprof.alloc_anon_folio.do_anonymous_page
      1.38 ±  2%      +1.0        2.42 ±  5%  perf-profile.calltrace.cycles-pp.uncharge_batch.__mem_cgroup_uncharge_folios.folios_put_refs.free_pages_and_swap_cache.__tlb_batch_free_encoded_pages
      2.76 ±  6%      +1.1        3.81        perf-profile.calltrace.cycles-pp.folio_alloc_mpol_noprof.vma_alloc_folio_noprof.alloc_anon_folio.do_anonymous_page.__handle_mm_fault
      1.42 ±  2%      +1.1        2.50 ±  4%  perf-profile.calltrace.cycles-pp.__mem_cgroup_uncharge_folios.folios_put_refs.free_pages_and_swap_cache.__tlb_batch_free_encoded_pages.tlb_finish_mmu
      2.50 ±  2%      +1.1        3.62 ±  2%  perf-profile.calltrace.cycles-pp.mas_store_prealloc.vma_complete.__split_vma.vms_gather_munmap_vmas.do_vmi_align_munmap
      2.89 ±  6%      +1.1        4.04        perf-profile.calltrace.cycles-pp.vma_alloc_folio_noprof.alloc_anon_folio.do_anonymous_page.__handle_mm_fault.handle_mm_fault
      0.00            +1.1        1.14 ±  4%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.folio_lruvec_lock_irqsave.folio_batch_move_lru.__folio_batch_add_and_move
      0.00            +1.2        1.18 ±  4%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.folio_lruvec_lock_irqsave.folio_batch_move_lru.__folio_batch_add_and_move.do_anonymous_page
      0.00            +1.2        1.18 ±  4%  perf-profile.calltrace.cycles-pp.folio_lruvec_lock_irqsave.folio_batch_move_lru.__folio_batch_add_and_move.do_anonymous_page.__handle_mm_fault
      2.80 ±  3%      +1.2        3.99 ±  3%  perf-profile.calltrace.cycles-pp.__mmap
      2.89 ±  2%      +1.3        4.19 ±  2%  perf-profile.calltrace.cycles-pp.vma_complete.__split_vma.vms_gather_munmap_vmas.do_vmi_align_munmap.do_vmi_munmap
      2.92 ±  7%      +1.4        4.30 ±  4%  perf-profile.calltrace.cycles-pp.show_smap.seq_read_iter.seq_read.vfs_read.ksys_read
      0.00            +1.8        1.76 ±  2%  perf-profile.calltrace.cycles-pp.folio_batch_move_lru.__folio_batch_add_and_move.do_anonymous_page.__handle_mm_fault.handle_mm_fault
      4.41 ±  5%      +1.8        6.20 ±  2%  perf-profile.calltrace.cycles-pp.alloc_anon_folio.do_anonymous_page.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
      0.00            +1.8        1.80 ±  2%  perf-profile.calltrace.cycles-pp.__folio_batch_add_and_move.do_anonymous_page.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
      3.96 ±  6%      +1.9        5.82 ±  4%  perf-profile.calltrace.cycles-pp.seq_read_iter.seq_read.vfs_read.ksys_read.do_syscall_64
      3.96 ±  6%      +1.9        5.83 ±  4%  perf-profile.calltrace.cycles-pp.seq_read.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
      3.98 ±  6%      +1.9        5.84 ±  4%  perf-profile.calltrace.cycles-pp.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
      3.98 ±  6%      +1.9        5.86 ±  4%  perf-profile.calltrace.cycles-pp.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
      3.99 ±  6%      +1.9        5.89 ±  4%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.read
      3.99 ±  6%      +1.9        5.89 ±  4%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
      4.02 ±  6%      +1.9        5.92 ±  4%  perf-profile.calltrace.cycles-pp.read
      5.66 ±  2%      +2.8        8.44 ±  3%  perf-profile.calltrace.cycles-pp.mas_store_gfp.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap.__x64_sys_munmap
      8.89            +4.0       12.89 ±  3%  perf-profile.calltrace.cycles-pp.__split_vma.vms_gather_munmap_vmas.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap
      5.76 ±  5%      +4.2        9.97 ±  2%  perf-profile.calltrace.cycles-pp.do_anonymous_page.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.exc_page_fault
      5.99 ±  5%      +4.4       10.34 ±  2%  perf-profile.calltrace.cycles-pp.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      6.15 ±  5%      +4.4       10.57 ±  2%  perf-profile.calltrace.cycles-pp.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.stress_mmapmany_child
      9.81            +4.4       14.26 ±  3%  perf-profile.calltrace.cycles-pp.vms_gather_munmap_vmas.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap.__x64_sys_munmap
      6.56 ±  5%      +4.6       11.20 ±  2%  perf-profile.calltrace.cycles-pp.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.stress_mmapmany_child
      6.58 ±  5%      +4.6       11.23 ±  2%  perf-profile.calltrace.cycles-pp.exc_page_fault.asm_exc_page_fault.stress_mmapmany_child
      7.25 ±  5%      +4.9       12.18 ±  2%  perf-profile.calltrace.cycles-pp.asm_exc_page_fault.stress_mmapmany_child
      7.86 ±  4%      +5.2       13.09 ±  2%  perf-profile.calltrace.cycles-pp.stress_mmapmany_child
     20.76 ±  2%     -20.8        0.00        perf-profile.children.cycles-pp.lru_add_drain
     20.71 ±  2%     -20.7        0.00        perf-profile.children.cycles-pp.lru_add_drain_cpu
     20.68 ±  2%     -18.9        1.78 ±  2%  perf-profile.children.cycles-pp.folio_batch_move_lru
     55.58           -17.8       37.77 ±  5%  perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
     64.24           -17.8       46.44 ±  3%  perf-profile.children.cycles-pp.vms_clear_ptes
     55.09 ±  2%     -17.8       37.34 ±  5%  perf-profile.children.cycles-pp.folio_lruvec_lock_irqsave
     56.63           -17.7       38.92 ±  5%  perf-profile.children.cycles-pp._raw_spin_lock_irqsave
     64.66           -17.6       47.08 ±  3%  perf-profile.children.cycles-pp.vms_complete_munmap_vmas
     80.27           -10.3       70.00        perf-profile.children.cycles-pp.do_vmi_align_munmap
     80.78           -10.0       70.76        perf-profile.children.cycles-pp.do_vmi_munmap
     80.99            -9.9       71.08        perf-profile.children.cycles-pp.__vm_munmap
     81.00            -9.9       71.10        perf-profile.children.cycles-pp.__x64_sys_munmap
     81.88            -9.4       72.45        perf-profile.children.cycles-pp.__munmap
     87.76            -6.8       80.91        perf-profile.children.cycles-pp.do_syscall_64
     87.83            -6.8       81.02        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.88 ±  3%      -0.5        0.34 ±  2%  perf-profile.children.cycles-pp.lru_add
      0.65 ±  3%      -0.4        0.24 ±  3%  perf-profile.children.cycles-pp.lru_gen_add_folio
      0.41 ±  2%      -0.1        0.34 ±  3%  perf-profile.children.cycles-pp.zap_present_ptes
      0.12 ± 19%      -0.0        0.08 ± 13%  perf-profile.children.cycles-pp.writen
      0.12 ± 18%      -0.0        0.09 ± 10%  perf-profile.children.cycles-pp.ksys_write
      0.12 ± 14%      -0.0        0.09 ± 10%  perf-profile.children.cycles-pp.vfs_write
      0.05            +0.0        0.07 ±  5%  perf-profile.children.cycles-pp.__perf_event_header__init_id
      0.05            +0.0        0.07 ±  5%  perf-profile.children.cycles-pp.mas_prev_range
      0.06 ±  6%      +0.0        0.08        perf-profile.children.cycles-pp.task_tick_fair
      0.06            +0.0        0.08 ±  4%  perf-profile.children.cycles-pp.cgroup_rstat_updated
      0.05            +0.0        0.08 ±  6%  perf-profile.children.cycles-pp.downgrade_write
      0.05 ±  8%      +0.0        0.08 ±  4%  perf-profile.children.cycles-pp.number
      0.06            +0.0        0.08 ±  5%  perf-profile.children.cycles-pp.mast_split_data
      0.07            +0.0        0.10 ±  5%  perf-profile.children.cycles-pp.put_cpu_partial
      0.10 ±  3%      +0.0        0.13 ±  2%  perf-profile.children.cycles-pp.sched_tick
      0.06            +0.0        0.09 ±  8%  perf-profile.children.cycles-pp._raw_spin_trylock
      0.06            +0.0        0.09 ±  5%  perf-profile.children.cycles-pp.mas_prev
      0.08 ±  4%      +0.0        0.11        perf-profile.children.cycles-pp.mas_wr_store_entry
      0.08 ±  6%      +0.0        0.11 ±  6%  perf-profile.children.cycles-pp.__rb_insert_augmented
      0.05            +0.0        0.08 ±  5%  perf-profile.children.cycles-pp.tlb_gather_mmu
      0.07 ±  7%      +0.0        0.10 ±  5%  perf-profile.children.cycles-pp._find_next_bit
      0.07 ±  6%      +0.0        0.11 ±  4%  perf-profile.children.cycles-pp.init_multi_vma_prep
      0.09            +0.0        0.12 ±  6%  perf-profile.children.cycles-pp.refill_obj_stock
      0.04 ± 44%      +0.0        0.08 ±  6%  perf-profile.children.cycles-pp.__mpol_put
      0.07            +0.0        0.10 ±  4%  perf-profile.children.cycles-pp.up_read
      0.06 ±  9%      +0.0        0.09 ±  4%  perf-profile.children.cycles-pp.m_stop
      0.02 ± 99%      +0.0        0.06 ±  7%  perf-profile.children.cycles-pp.security_vm_enough_memory_mm
      0.10 ±  5%      +0.0        0.14 ±  7%  perf-profile.children.cycles-pp.mas_data_end
      0.07 ±  8%      +0.0        0.11 ±  7%  perf-profile.children.cycles-pp.mtree_range_walk
      0.09 ±  5%      +0.0        0.14 ±  3%  perf-profile.children.cycles-pp.___perf_sw_event
      0.09 ±  7%      +0.0        0.14 ±  7%  perf-profile.children.cycles-pp.stress_munmap_retry_enomem
      0.17 ±  6%      +0.0        0.21 ±  5%  perf-profile.children.cycles-pp.__folio_throttle_swaprate
      0.04 ± 71%      +0.0        0.08 ±  8%  perf-profile.children.cycles-pp.hold_task_mempolicy
      0.61 ±  2%      +0.0        0.66 ±  3%  perf-profile.children.cycles-pp.zap_pte_range
      0.02 ±141%      +0.0        0.06 ±  6%  perf-profile.children.cycles-pp.string
      0.09 ±  7%      +0.0        0.14 ±  5%  perf-profile.children.cycles-pp.___pte_offset_map
      0.12 ±  4%      +0.0        0.16 ±  6%  perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.10 ±  4%      +0.0        0.15 ±  4%  perf-profile.children.cycles-pp.syscall_return_via_sysret
      0.11 ±  6%      +0.0        0.16 ±  3%  perf-profile.children.cycles-pp.__perf_sw_event
      0.05 ± 46%      +0.0        0.10 ± 14%  perf-profile.children.cycles-pp.kfree
      0.02 ±141%      +0.0        0.06 ±  7%  perf-profile.children.cycles-pp.seq_putc
      0.12 ±  5%      +0.0        0.17 ±  3%  perf-profile.children.cycles-pp.perf_event_mmap_output
      0.09 ±  5%      +0.1        0.14 ±  5%  perf-profile.children.cycles-pp.down_write_killable
      0.09 ±  9%      +0.1        0.14 ±  7%  perf-profile.children.cycles-pp.m_start
      0.00            +0.1        0.05        perf-profile.children.cycles-pp.__count_memcg_events
      0.15 ±  2%      +0.1        0.20 ±  6%  perf-profile.children.cycles-pp.folio_remove_rmap_ptes
      0.00            +0.1        0.05 ±  7%  perf-profile.children.cycles-pp.error_entry
      0.01 ±223%      +0.1        0.06        perf-profile.children.cycles-pp.handle_pte_fault
      0.04 ± 71%      +0.1        0.09 ± 17%  perf-profile.children.cycles-pp.irqentry_exit_to_user_mode
      0.10 ±  6%      +0.1        0.15 ±  4%  perf-profile.children.cycles-pp.__rb_erase_color
      0.10 ±  3%      +0.1        0.15 ±  4%  perf-profile.children.cycles-pp.percpu_counter_add_batch
      0.00            +0.1        0.06 ±  9%  perf-profile.children.cycles-pp.perf_output_begin
      0.16 ±  4%      +0.1        0.22 ±  4%  perf-profile.children.cycles-pp.update_process_times
      0.00            +0.1        0.06 ±  8%  perf-profile.children.cycles-pp.mas_prev_setup
      0.13 ±  2%      +0.1        0.19 ±  3%  perf-profile.children.cycles-pp.rcu_all_qs
      0.16 ±  3%      +0.1        0.22 ±  3%  perf-profile.children.cycles-pp.__anon_vma_interval_tree_remove
      0.00            +0.1        0.06        perf-profile.children.cycles-pp.__mod_lruvec_state
      0.00            +0.1        0.06 ±  9%  perf-profile.children.cycles-pp.remove_vma
      0.08 ±  4%      +0.1        0.14 ±  4%  perf-profile.children.cycles-pp.__mod_node_page_state
      0.12 ±  4%      +0.1        0.18 ±  5%  perf-profile.children.cycles-pp.get_vma_name
      0.14 ±  3%      +0.1        0.20 ±  6%  perf-profile.children.cycles-pp.mas_store_b_node
      0.00            +0.1        0.06 ±  6%  perf-profile.children.cycles-pp.mas_wr_walk_index
      0.00            +0.1        0.06 ± 11%  perf-profile.children.cycles-pp.mas_next_sibling
      0.00            +0.1        0.06 ±  7%  perf-profile.children.cycles-pp.mas_prev_node
      0.14 ±  3%      +0.1        0.21 ±  3%  perf-profile.children.cycles-pp.mast_fill_bnode
      0.00            +0.1        0.06 ±  7%  perf-profile.children.cycles-pp.page_counter_try_charge
      0.18 ±  5%      +0.1        0.24 ±  5%  perf-profile.children.cycles-pp.tick_nohz_handler
      0.12 ±  4%      +0.1        0.18 ±  5%  perf-profile.children.cycles-pp.mas_next_node
      0.16 ±  4%      +0.1        0.22 ±  4%  perf-profile.children.cycles-pp.entry_SYSCALL_64
      0.18 ±  6%      +0.1        0.26 ±  4%  perf-profile.children.cycles-pp.__hrtimer_run_queues
      0.00            +0.1        0.07        perf-profile.children.cycles-pp.x64_sys_call
      0.17 ±  2%      +0.1        0.25 ±  3%  perf-profile.children.cycles-pp.mas_split_final_node
      0.12 ±  7%      +0.1        0.20 ±  6%  perf-profile.children.cycles-pp.__folio_mod_stat
      0.24 ±  6%      +0.1        0.32 ±  4%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      0.12 ±  4%      +0.1        0.20 ±  6%  perf-profile.children.cycles-pp.get_vma_policy
      0.24 ±  6%      +0.1        0.32 ±  4%  perf-profile.children.cycles-pp.hrtimer_interrupt
      0.18 ±  4%      +0.1        0.25 ±  2%  perf-profile.children.cycles-pp.perf_iterate_sb
      0.68 ±  2%      +0.1        0.76 ±  3%  perf-profile.children.cycles-pp.zap_pmd_range
      0.18 ±  2%      +0.1        0.28 ±  4%  perf-profile.children.cycles-pp.build_detached_freelist
      0.20 ±  2%      +0.1        0.29 ±  4%  perf-profile.children.cycles-pp.__mod_memcg_lruvec_state
      0.17 ±  4%      +0.1        0.26 ±  4%  perf-profile.children.cycles-pp.folio_add_new_anon_rmap
      0.21 ±  2%      +0.1        0.30 ±  3%  perf-profile.children.cycles-pp.vma_prepare
      0.20 ±  4%      +0.1        0.30 ±  3%  perf-profile.children.cycles-pp.mas_prev_slot
      0.22 ±  6%      +0.1        0.32 ±  6%  perf-profile.children.cycles-pp.seq_put_hex_ll
      0.22 ±  2%      +0.1        0.32 ±  3%  perf-profile.children.cycles-pp.mas_leaf_max_gap
      0.22 ±  4%      +0.1        0.33 ±  4%  perf-profile.children.cycles-pp.lock_vma_under_rcu
      0.29 ±  4%      +0.1        0.39 ±  4%  perf-profile.children.cycles-pp.native_irq_return_iret
      0.22 ±  2%      +0.1        0.33 ±  3%  perf-profile.children.cycles-pp.mas_update_gap
      0.25 ±  5%      +0.1        0.36 ±  2%  perf-profile.children.cycles-pp.__mmap_prepare
      0.25 ±  3%      +0.1        0.36 ±  3%  perf-profile.children.cycles-pp.perf_event_mmap_event
      0.23 ±  7%      +0.1        0.34 ±  5%  perf-profile.children.cycles-pp.show_map
      0.05 ± 46%      +0.1        0.16 ± 36%  perf-profile.children.cycles-pp.task_numa_work
      0.25 ±  3%      +0.1        0.36 ±  5%  perf-profile.children.cycles-pp.native_flush_tlb_one_user
      0.06 ± 45%      +0.1        0.17 ± 34%  perf-profile.children.cycles-pp.task_work_run
      0.23 ±  7%      +0.1        0.35 ±  4%  perf-profile.children.cycles-pp.format_decode
      0.27 ±  4%      +0.1        0.40 ±  2%  perf-profile.children.cycles-pp.perf_event_mmap
      0.26 ±  4%      +0.1        0.39 ±  3%  perf-profile.children.cycles-pp.smaps_account
      0.32            +0.1        0.44 ±  2%  perf-profile.children.cycles-pp.mas_put_in_tree
      0.34 ±  3%      +0.1        0.47 ±  3%  perf-profile.children.cycles-pp.sync_regs
      0.31            +0.1        0.44 ±  4%  perf-profile.children.cycles-pp.clear_bhb_loop
      0.13 ±  6%      +0.1        0.26 ±  7%  perf-profile.children.cycles-pp.cpuidle_enter
      0.13 ±  6%      +0.1        0.26 ±  7%  perf-profile.children.cycles-pp.cpuidle_enter_state
      0.31 ±  6%      +0.1        0.44 ±  5%  perf-profile.children.cycles-pp.num_to_str
      0.34 ±  2%      +0.1        0.48 ±  2%  perf-profile.children.cycles-pp.obj_cgroup_charge
      0.14 ±  7%      +0.1        0.28 ±  7%  perf-profile.children.cycles-pp.start_secondary
      0.13 ±  8%      +0.1        0.27 ±  6%  perf-profile.children.cycles-pp.cpuidle_idle_call
      0.80            +0.1        0.94 ±  3%  perf-profile.children.cycles-pp.unmap_page_range
      0.29 ±  2%      +0.1        0.43 ±  5%  perf-profile.children.cycles-pp.flush_tlb_func
      0.20 ±  4%      +0.1        0.34 ±  5%  perf-profile.children.cycles-pp.__lruvec_stat_mod_folio
      0.32 ±  8%      +0.1        0.46 ±  4%  perf-profile.children.cycles-pp.seq_write
      0.28            +0.1        0.42 ±  4%  perf-profile.children.cycles-pp.mas_ascend
      0.30 ±  8%      +0.1        0.45 ±  5%  perf-profile.children.cycles-pp.show_vma_header_prefix
      0.14 ±  7%      +0.1        0.29 ±  7%  perf-profile.children.cycles-pp.common_startup_64
      0.14 ±  7%      +0.1        0.29 ±  7%  perf-profile.children.cycles-pp.cpu_startup_entry
      0.14 ±  7%      +0.1        0.29 ±  7%  perf-profile.children.cycles-pp.do_idle
      0.19 ±  7%      +0.1        0.34 ± 15%  perf-profile.children.cycles-pp.syscall_exit_to_user_mode
      0.31 ±  2%      +0.2        0.46 ±  3%  perf-profile.children.cycles-pp.__cond_resched
      0.32 ±  2%      +0.2        0.48 ±  4%  perf-profile.children.cycles-pp.mas_mab_cp
      0.25 ±  3%      +0.2        0.40 ±  6%  perf-profile.children.cycles-pp.rcu_segcblist_enqueue
      0.32            +0.2        0.48 ±  4%  perf-profile.children.cycles-pp.up_write
      0.48 ±  3%      +0.2        0.64 ±  3%  perf-profile.children.cycles-pp.commit_merge
      0.38 ±  3%      +0.2        0.55 ±  2%  perf-profile.children.cycles-pp.kmem_cache_free_bulk
      0.36 ±  6%      +0.2        0.53 ±  4%  perf-profile.children.cycles-pp.smaps_pte_entry
      0.38 ±  7%      +0.2        0.56 ±  4%  perf-profile.children.cycles-pp.strlen
      0.89            +0.2        1.08 ±  3%  perf-profile.children.cycles-pp.unmap_vmas
      0.52 ±  4%      +0.2        0.71 ±  3%  perf-profile.children.cycles-pp.vma_expand
      0.28 ±  9%      +0.2        0.48 ±  9%  perf-profile.children.cycles-pp._raw_spin_lock
      0.40 ±  3%      +0.2        0.59 ±  4%  perf-profile.children.cycles-pp.mas_wr_store_type
      0.42 ±  2%      +0.2        0.61 ±  3%  perf-profile.children.cycles-pp.mas_pop_node
      0.39 ±  2%      +0.2        0.59 ±  3%  perf-profile.children.cycles-pp.mas_next_slot
      0.41 ±  6%      +0.2        0.61 ±  4%  perf-profile.children.cycles-pp.smaps_pte_range
      0.43 ±  7%      +0.2        0.64 ±  5%  perf-profile.children.cycles-pp.__seq_puts
      0.43 ±  5%      +0.2        0.63 ±  4%  perf-profile.children.cycles-pp.walk_pmd_range
      0.57 ±  3%      +0.2        0.78 ±  3%  perf-profile.children.cycles-pp.vma_merge_new_range
      0.54 ±  3%      +0.2        0.75 ±  3%  perf-profile.children.cycles-pp.mod_objcg_state
      0.44            +0.2        0.66 ±  5%  perf-profile.children.cycles-pp.flush_tlb_mm_range
      0.44 ±  6%      +0.2        0.66 ±  4%  perf-profile.children.cycles-pp.walk_pud_range
      0.46 ±  6%      +0.2        0.69 ±  4%  perf-profile.children.cycles-pp.walk_p4d_range
      0.48 ±  7%      +0.2        0.70 ±  5%  perf-profile.children.cycles-pp.show_map_vma
      0.48 ±  6%      +0.2        0.72 ±  4%  perf-profile.children.cycles-pp.walk_pgd_range
      0.53 ±  2%      +0.2        0.77 ±  2%  perf-profile.children.cycles-pp.mas_push_data
      0.53 ±  6%      +0.3        0.79 ±  4%  perf-profile.children.cycles-pp.__walk_page_range
      0.58 ±  3%      +0.3        0.84 ±  3%  perf-profile.children.cycles-pp.mas_destroy
      0.63 ±  3%      +0.3        0.89 ±  3%  perf-profile.children.cycles-pp.mas_rev_awalk
      0.56 ±  6%      +0.3        0.83 ±  4%  perf-profile.children.cycles-pp.m_next
      0.56 ±  6%      +0.3        0.82 ±  4%  perf-profile.children.cycles-pp.walk_page_vma
      0.80 ±  4%      +0.3        1.08 ±  2%  perf-profile.children.cycles-pp.get_partial_node
      0.43 ±  8%      +0.3        0.72 ±  8%  perf-profile.children.cycles-pp.__pte_offset_map_lock
      0.57            +0.3        0.86 ±  3%  perf-profile.children.cycles-pp.down_write
      0.62 ±  6%      +0.3        0.90 ±  4%  perf-profile.children.cycles-pp.vsnprintf
      0.86            +0.3        1.19 ±  3%  perf-profile.children.cycles-pp.rcu_cblist_dequeue
      0.70 ±  7%      +0.3        1.03 ±  5%  perf-profile.children.cycles-pp.seq_printf
      0.68 ±  2%      +0.3        1.03 ±  3%  perf-profile.children.cycles-pp.mas_walk
      0.79 ±  3%      +0.3        1.14 ±  3%  perf-profile.children.cycles-pp.mas_empty_area_rev
      0.68 ±  2%      +0.4        1.04 ±  3%  perf-profile.children.cycles-pp.unlink_anon_vmas
      0.68 ±  2%      +0.4        1.05 ±  4%  perf-profile.children.cycles-pp.__call_rcu_common
      0.97            +0.4        1.36 ±  3%  perf-profile.children.cycles-pp.anon_vma_interval_tree_insert
      0.75            +0.4        1.14 ±  4%  perf-profile.children.cycles-pp.mas_topiary_replace
      0.88 ±  3%      +0.4        1.27 ±  3%  perf-profile.children.cycles-pp.unmapped_area_topdown
      0.88 ±  3%      +0.4        1.27 ±  3%  perf-profile.children.cycles-pp.vm_unmapped_area
      0.80 ±  6%      +0.4        1.19 ±  5%  perf-profile.children.cycles-pp.try_charge_memcg
      0.93 ±  3%      +0.4        1.33 ±  3%  perf-profile.children.cycles-pp.arch_get_unmapped_area_topdown
      0.95 ±  3%      +0.4        1.37 ±  3%  perf-profile.children.cycles-pp.__memcg_slab_free_hook
      0.95 ±  3%      +0.4        1.37 ±  3%  perf-profile.children.cycles-pp.__get_unmapped_area
      0.82            +0.4        1.25 ±  3%  perf-profile.children.cycles-pp.free_pgtables
      0.91 ±  7%      +0.4        1.36 ±  6%  perf-profile.children.cycles-pp.charge_memcg
      0.99 ±  2%      +0.5        1.44 ±  3%  perf-profile.children.cycles-pp.mas_split
      1.02 ±  7%      +0.5        1.49 ±  5%  perf-profile.children.cycles-pp.__show_smap
      1.00 ±  2%      +0.5        1.49        perf-profile.children.cycles-pp.lru_gen_del_folio
      1.21 ±  3%      +0.5        1.70 ±  3%  perf-profile.children.cycles-pp.__mmap_region
      1.01 ±  3%      +0.5        1.51 ±  3%  perf-profile.children.cycles-pp.mas_rebalance
      1.15 ±  2%      +0.5        1.65 ±  3%  perf-profile.children.cycles-pp.__memcpy
      1.12 ±  2%      +0.5        1.64 ±  3%  perf-profile.children.cycles-pp.mab_mas_cp
      1.28            +0.5        1.80 ±  2%  perf-profile.children.cycles-pp.__memcg_slab_post_alloc_hook
      1.42 ±  3%      +0.5        1.95 ±  2%  perf-profile.children.cycles-pp.___slab_alloc
      1.22 ±  7%      +0.6        1.78 ±  5%  perf-profile.children.cycles-pp.seq_put_decimal_ull_width
      1.11 ±  2%      +0.6        1.68 ±  3%  perf-profile.children.cycles-pp.mas_find
      1.36 ±  4%      +0.6        1.96 ±  4%  perf-profile.children.cycles-pp.__mem_cgroup_charge
      1.31            +0.6        1.92 ±  3%  perf-profile.children.cycles-pp.anon_vma_clone
      1.74 ±  2%      +0.7        2.43 ±  2%  perf-profile.children.cycles-pp.clear_page_erms
      1.59            +0.7        2.34 ±  3%  perf-profile.children.cycles-pp.mas_wr_node_store
      1.81 ±  2%      +0.7        2.56 ±  3%  perf-profile.children.cycles-pp.vm_area_free_rcu_cb
      1.74            +0.8        2.56 ±  3%  perf-profile.children.cycles-pp.mas_preallocate
      2.21 ±  3%      +0.9        3.12 ±  3%  perf-profile.children.cycles-pp.do_mmap
      2.22 ±  2%      +0.9        3.15 ±  3%  perf-profile.children.cycles-pp.vm_area_dup
      2.64 ±  7%      +0.9        3.58        perf-profile.children.cycles-pp.get_page_from_freelist
      2.28 ±  3%      +1.0        3.24 ±  3%  perf-profile.children.cycles-pp.vm_mmap_pgoff
      1.96 ±  2%      +1.0        2.93 ±  4%  perf-profile.children.cycles-pp.mas_wr_spanning_store
      2.73 ±  7%      +1.0        3.71        perf-profile.children.cycles-pp.__alloc_frozen_pages_noprof
      2.14            +1.0        3.15 ±  3%  perf-profile.children.cycles-pp.mas_wr_bnode
      1.30 ±  3%      +1.0        2.34 ±  5%  perf-profile.children.cycles-pp.page_counter_cancel
      1.38 ±  3%      +1.0        2.42 ±  4%  perf-profile.children.cycles-pp.page_counter_uncharge
      2.81 ±  7%      +1.0        3.86        perf-profile.children.cycles-pp.alloc_pages_mpol
      1.38 ±  2%      +1.1        2.44 ±  5%  perf-profile.children.cycles-pp.uncharge_batch
      2.77 ±  6%      +1.1        3.83        perf-profile.children.cycles-pp.folio_alloc_mpol_noprof
      2.24            +1.1        3.32 ±  2%  perf-profile.children.cycles-pp.__kmem_cache_alloc_bulk
      2.28            +1.1        3.36 ±  2%  perf-profile.children.cycles-pp.kmem_cache_alloc_bulk_noprof
      1.42 ±  2%      +1.1        2.50 ±  4%  perf-profile.children.cycles-pp.__mem_cgroup_uncharge_folios
      2.65            +1.1        3.74 ±  3%  perf-profile.children.cycles-pp.kmem_cache_alloc_noprof
      2.90 ±  6%      +1.1        4.04        perf-profile.children.cycles-pp.vma_alloc_folio_noprof
      2.61 ±  2%      +1.2        3.79 ±  2%  perf-profile.children.cycles-pp.mas_store_prealloc
      2.83 ±  4%      +1.2        4.02 ±  3%  perf-profile.children.cycles-pp.__mmap
      2.64            +1.2        3.86 ±  2%  perf-profile.children.cycles-pp.mas_alloc_nodes
      3.11 ±  2%      +1.4        4.46 ±  3%  perf-profile.children.cycles-pp.vma_complete
      2.73 ±  2%      +1.4        4.10 ±  4%  perf-profile.children.cycles-pp.mas_spanning_rebalance
      2.94 ±  7%      +1.4        4.32 ±  5%  perf-profile.children.cycles-pp.show_smap
      4.14 ±  2%      +1.5        5.60 ±  3%  perf-profile.children.cycles-pp.__irq_exit_rcu
      3.35            +1.5        4.83 ±  3%  perf-profile.children.cycles-pp.__slab_free
      4.38 ±  2%      +1.5        5.91 ±  3%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      4.41 ±  2%      +1.5        5.95 ±  3%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      0.02 ±141%      +1.8        1.82 ±  2%  perf-profile.children.cycles-pp.__folio_batch_add_and_move
      4.46 ±  5%      +1.8        6.27 ±  2%  perf-profile.children.cycles-pp.alloc_anon_folio
      3.96 ±  6%      +1.9        5.83 ±  4%  perf-profile.children.cycles-pp.seq_read_iter
      3.96 ±  6%      +1.9        5.83 ±  4%  perf-profile.children.cycles-pp.seq_read
      3.98 ±  6%      +1.9        5.85 ±  4%  perf-profile.children.cycles-pp.vfs_read
      3.98 ±  6%      +1.9        5.86 ±  4%  perf-profile.children.cycles-pp.ksys_read
      4.02 ±  6%      +1.9        5.93 ±  4%  perf-profile.children.cycles-pp.read
      5.86 ± 10%      +2.0        7.88 ±  4%  perf-profile.children.cycles-pp.kmem_cache_free
      6.78 ±  9%      +2.3        9.08 ±  4%  perf-profile.children.cycles-pp.rcu_do_batch
      6.79 ±  9%      +2.3        9.09 ±  4%  perf-profile.children.cycles-pp.rcu_core
      6.81 ±  9%      +2.3        9.12 ±  4%  perf-profile.children.cycles-pp.handle_softirqs
      5.82 ±  2%      +2.8        8.67 ±  3%  perf-profile.children.cycles-pp.mas_store_gfp
      8.92            +4.0       12.95 ±  3%  perf-profile.children.cycles-pp.__split_vma
      5.78 ±  5%      +4.2       10.00 ±  2%  perf-profile.children.cycles-pp.do_anonymous_page
      6.02 ±  5%      +4.4       10.36 ±  2%  perf-profile.children.cycles-pp.__handle_mm_fault
      6.18 ±  5%      +4.4       10.60 ±  2%  perf-profile.children.cycles-pp.handle_mm_fault
      9.84            +4.5       14.29 ±  3%  perf-profile.children.cycles-pp.vms_gather_munmap_vmas
      6.58 ±  5%      +4.6       11.23 ±  2%  perf-profile.children.cycles-pp.do_user_addr_fault
      6.61 ±  5%      +4.6       11.26 ±  2%  perf-profile.children.cycles-pp.exc_page_fault
      7.62 ±  5%      +5.0       12.67 ±  2%  perf-profile.children.cycles-pp.asm_exc_page_fault
      8.47 ±  4%      +5.5       13.93 ±  2%  perf-profile.children.cycles-pp.stress_mmapmany_child
     55.58           -17.8       37.76 ±  5%  perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
      0.59 ±  3%      -0.4        0.16 ±  4%  perf-profile.self.cycles-pp.lru_gen_add_folio
      0.22 ±  3%      -0.1        0.09 ±  4%  perf-profile.self.cycles-pp.lru_add
      0.23 ±  3%      -0.1        0.10 ±  4%  perf-profile.self.cycles-pp.zap_present_ptes
      0.32            -0.1        0.22 ±  2%  perf-profile.self.cycles-pp.folios_put_refs
      0.07 ±  5%      -0.0        0.04 ± 44%  perf-profile.self.cycles-pp.folio_remove_rmap_ptes
      0.07 ±  6%      +0.0        0.08 ±  5%  perf-profile.self.cycles-pp.page_counter_uncharge
      0.05            +0.0        0.06 ±  7%  perf-profile.self.cycles-pp.entry_SYSCALL_64
      0.05            +0.0        0.07 ±  8%  perf-profile.self.cycles-pp.mast_fill_bnode
      0.05            +0.0        0.07 ±  5%  perf-profile.self.cycles-pp.cgroup_rstat_updated
      0.05            +0.0        0.07 ±  5%  perf-profile.self.cycles-pp.mas_split
      0.07 ±  5%      +0.0        0.09        perf-profile.self.cycles-pp.mas_alloc_nodes
      0.06 ±  6%      +0.0        0.08        perf-profile.self.cycles-pp.rcu_do_batch
      0.05 ±  7%      +0.0        0.07 ±  6%  perf-profile.self.cycles-pp.number
      0.06            +0.0        0.08 ±  5%  perf-profile.self.cycles-pp.___perf_sw_event
      0.07 ±  5%      +0.0        0.09 ±  4%  perf-profile.self.cycles-pp.mas_wr_store_entry
      0.05 ±  7%      +0.0        0.08 ±  6%  perf-profile.self.cycles-pp.show_map_vma
      0.07 ±  5%      +0.0        0.09 ±  5%  perf-profile.self.cycles-pp.handle_mm_fault
      0.05 ±  8%      +0.0        0.08 ±  4%  perf-profile.self.cycles-pp.lock_vma_under_rcu
      0.06            +0.0        0.08 ±  8%  perf-profile.self.cycles-pp._find_next_bit
      0.07            +0.0        0.10 ±  5%  perf-profile.self.cycles-pp.init_multi_vma_prep
      0.06 ±  7%      +0.0        0.09 ±  6%  perf-profile.self.cycles-pp.stress_munmap_retry_enomem
      0.06            +0.0        0.08 ±  5%  perf-profile.self.cycles-pp.vma_complete
      0.05            +0.0        0.08 ±  9%  perf-profile.self.cycles-pp._raw_spin_trylock
      0.05 ±  8%      +0.0        0.08        perf-profile.self.cycles-pp.free_unref_folios
      0.05 ±  8%      +0.0        0.08        perf-profile.self.cycles-pp.perf_iterate_sb
      0.06 ±  7%      +0.0        0.09 ±  4%  perf-profile.self.cycles-pp.__rb_insert_augmented
      0.05 ±  7%      +0.0        0.08 ±  8%  perf-profile.self.cycles-pp.anon_vma_clone
      0.07 ±  7%      +0.0        0.09 ±  5%  perf-profile.self.cycles-pp.put_cpu_partial
      0.07            +0.0        0.10 ±  4%  perf-profile.self.cycles-pp.syscall_return_via_sysret
      0.07            +0.0        0.10 ±  4%  perf-profile.self.cycles-pp.unlink_anon_vmas
      0.04 ± 44%      +0.0        0.07 ±  5%  perf-profile.self.cycles-pp.__walk_page_range
      0.13 ±  5%      +0.0        0.16 ±  4%  perf-profile.self.cycles-pp.__folio_throttle_swaprate
      0.06            +0.0        0.09 ±  4%  perf-profile.self.cycles-pp.down_write_killable
      0.07 ±  5%      +0.0        0.10 ±  6%  perf-profile.self.cycles-pp.mas_update_gap
      0.08 ±  7%      +0.0        0.11 ±  5%  perf-profile.self.cycles-pp.__mmap_region
      0.08 ±  4%      +0.0        0.11 ±  3%  perf-profile.self.cycles-pp.kmem_cache_free_bulk
      0.06 ±  6%      +0.0        0.09 ±  4%  perf-profile.self.cycles-pp.___pte_offset_map
      0.06            +0.0        0.09        perf-profile.self.cycles-pp.__alloc_frozen_pages_noprof
      0.07 ±  7%      +0.0        0.10 ±  4%  perf-profile.self.cycles-pp.do_syscall_64
      0.07 ±  7%      +0.0        0.10 ±  4%  perf-profile.self.cycles-pp.vms_complete_munmap_vmas
      0.08 ±  5%      +0.0        0.12 ±  6%  perf-profile.self.cycles-pp.mas_data_end
      0.07 ± 11%      +0.0        0.10 ±  6%  perf-profile.self.cycles-pp.__seq_puts
      0.05 ±  8%      +0.0        0.08 ±  5%  perf-profile.self.cycles-pp.flush_tlb_mm_range
      0.07 ±  5%      +0.0        0.10 ±  6%  perf-profile.self.cycles-pp.mtree_range_walk
      0.06            +0.0        0.09 ±  5%  perf-profile.self.cycles-pp.up_read
      0.10 ±  9%      +0.0        0.14 ±  3%  perf-profile.self.cycles-pp.get_page_from_freelist
      0.08 ±  4%      +0.0        0.12 ±  6%  perf-profile.self.cycles-pp.alloc_anon_folio
      0.08            +0.0        0.12 ±  4%  perf-profile.self.cycles-pp.refill_obj_stock
      0.08 ±  6%      +0.0        0.11 ±  6%  perf-profile.self.cycles-pp.smaps_pte_entry
      0.06 ± 11%      +0.0        0.09 ±  7%  perf-profile.self.cycles-pp.__lruvec_stat_mod_folio
      0.08 ±  6%      +0.0        0.11 ±  4%  perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.12 ±  4%      +0.0        0.15 ±  4%  perf-profile.self.cycles-pp.__put_partials
      0.08 ±  6%      +0.0        0.12 ±  4%  perf-profile.self.cycles-pp.mas_empty_area_rev
      0.08 ±  6%      +0.0        0.12 ±  6%  perf-profile.self.cycles-pp.zap_pte_range
      0.02 ± 99%      +0.0        0.06 ±  7%  perf-profile.self.cycles-pp.do_user_addr_fault
      0.02 ± 99%      +0.0        0.06 ±  7%  perf-profile.self.cycles-pp.mas_destroy
      0.09 ±  4%      +0.0        0.13 ±  3%  perf-profile.self.cycles-pp.mas_wr_spanning_store
      0.10 ±  9%      +0.0        0.14 ±  6%  perf-profile.self.cycles-pp.seq_write
      0.11 ±  3%      +0.0        0.15 ±  6%  perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.10 ±  5%      +0.0        0.14 ±  5%  perf-profile.self.cycles-pp.rcu_all_qs
      0.09 ±  5%      +0.0        0.13 ±  4%  perf-profile.self.cycles-pp.__rb_erase_color
      0.08 ±  5%      +0.0        0.13 ±  7%  perf-profile.self.cycles-pp.seq_printf
      0.11 ±  6%      +0.0        0.16 ±  4%  perf-profile.self.cycles-pp.__handle_mm_fault
      0.02 ± 99%      +0.0        0.07 ±  5%  perf-profile.self.cycles-pp.__mpol_put
      0.09            +0.0        0.14 ±  6%  perf-profile.self.cycles-pp.percpu_counter_add_batch
      0.11 ±  5%      +0.0        0.16 ±  5%  perf-profile.self.cycles-pp.syscall_exit_to_user_mode
      0.10            +0.0        0.15 ±  2%  perf-profile.self.cycles-pp.unmap_page_range
      0.09 ±  6%      +0.1        0.14 ±  4%  perf-profile.self.cycles-pp.mas_next_node
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.arch_get_unmapped_area_topdown
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.perf_output_begin
      0.10            +0.1        0.15 ±  4%  perf-profile.self.cycles-pp.do_vmi_align_munmap
      0.00            +0.1        0.05 ±  7%  perf-profile.self.cycles-pp.free_frozen_page_commit
      0.00            +0.1        0.05 ±  7%  perf-profile.self.cycles-pp.mas_prev
      0.00            +0.1        0.05 ±  7%  perf-profile.self.cycles-pp.x64_sys_call
      0.08 ±  6%      +0.1        0.13 ±  3%  perf-profile.self.cycles-pp.__mod_node_page_state
      0.11 ±  4%      +0.1        0.16 ±  5%  perf-profile.self.cycles-pp.__munmap
      0.02 ±141%      +0.1        0.07 ±  5%  perf-profile.self.cycles-pp.zap_pmd_range
      0.06 ±  6%      +0.1        0.12 ±  8%  perf-profile.self.cycles-pp.alloc_pages_mpol
      0.11 ±  8%      +0.1        0.16 ±  5%  perf-profile.self.cycles-pp.get_vma_name
      0.00            +0.1        0.05 ±  8%  perf-profile.self.cycles-pp.irqentry_exit_to_user_mode
      0.00            +0.1        0.05 ±  8%  perf-profile.self.cycles-pp.unmapped_area_topdown
      0.14 ±  4%      +0.1        0.20 ±  3%  perf-profile.self.cycles-pp.__anon_vma_interval_tree_remove
      0.00            +0.1        0.06 ±  9%  perf-profile.self.cycles-pp.vms_clear_ptes
      0.10 ±  4%      +0.1        0.16 ±  3%  perf-profile.self.cycles-pp.__vm_munmap
      0.02 ±141%      +0.1        0.07 ±  6%  perf-profile.self.cycles-pp.tlb_gather_mmu
      0.00            +0.1        0.06 ±  6%  perf-profile.self.cycles-pp.mas_wr_walk_index
      0.00            +0.1        0.06 ±  6%  perf-profile.self.cycles-pp.show_vma_header_prefix
      0.01 ±223%      +0.1        0.07 ±  7%  perf-profile.self.cycles-pp.downgrade_write
      0.10 ±  7%      +0.1        0.16 ±  9%  perf-profile.self.cycles-pp.__pte_offset_map_lock
      0.00            +0.1        0.06 ±  9%  perf-profile.self.cycles-pp.flush_tlb_func
      0.00            +0.1        0.06        perf-profile.self.cycles-pp.folio_add_new_anon_rmap
      0.14 ±  4%      +0.1        0.20 ±  3%  perf-profile.self.cycles-pp.mas_store_prealloc
      0.00            +0.1        0.06 ±  6%  perf-profile.self.cycles-pp.do_vmi_munmap
      0.00            +0.1        0.06 ±  6%  perf-profile.self.cycles-pp.free_pgtables
      0.00            +0.1        0.06 ± 11%  perf-profile.self.cycles-pp.page_counter_try_charge
      0.15 ±  7%      +0.1        0.21 ±  9%  perf-profile.self.cycles-pp.__mem_cgroup_charge
      0.00            +0.1        0.06 ±  7%  perf-profile.self.cycles-pp.unmap_vmas
      0.12 ±  4%      +0.1        0.18 ±  5%  perf-profile.self.cycles-pp.tlb_finish_mmu
      0.15 ±  7%      +0.1        0.22 ±  6%  perf-profile.self.cycles-pp.show_smap
      0.13 ±  3%      +0.1        0.20 ±  3%  perf-profile.self.cycles-pp.__split_vma
      0.15 ±  2%      +0.1        0.22 ±  5%  perf-profile.self.cycles-pp.__mod_memcg_lruvec_state
      0.19 ±  3%      +0.1        0.26 ±  3%  perf-profile.self.cycles-pp.obj_cgroup_charge
      0.15 ±  3%      +0.1        0.22 ±  2%  perf-profile.self.cycles-pp.mas_prev_slot
      0.16 ±  2%      +0.1        0.23 ±  2%  perf-profile.self.cycles-pp.__cond_resched
      0.11 ±  6%      +0.1        0.18 ±  7%  perf-profile.self.cycles-pp.get_vma_policy
      0.18 ±  2%      +0.1        0.25 ±  4%  perf-profile.self.cycles-pp.build_detached_freelist
      0.20 ±  2%      +0.1        0.28        perf-profile.self.cycles-pp.mas_push_data
      0.19            +0.1        0.28 ±  3%  perf-profile.self.cycles-pp.mas_store_gfp
      0.17 ±  2%      +0.1        0.26 ±  3%  perf-profile.self.cycles-pp.mas_find
      0.20 ±  2%      +0.1        0.30 ±  3%  perf-profile.self.cycles-pp.mas_leaf_max_gap
      0.18 ±  2%      +0.1        0.28 ±  3%  perf-profile.self.cycles-pp.mas_mab_cp
      0.21 ±  7%      +0.1        0.31 ±  5%  perf-profile.self.cycles-pp.seq_put_hex_ll
      0.22 ± 11%      +0.1        0.32 ± 11%  perf-profile.self.cycles-pp.charge_memcg
      0.22 ±  9%      +0.1        0.32 ±  6%  perf-profile.self.cycles-pp.seq_put_decimal_ull_width
      0.21 ±  6%      +0.1        0.31 ±  4%  perf-profile.self.cycles-pp.format_decode
      0.29 ±  4%      +0.1        0.39 ±  4%  perf-profile.self.cycles-pp.native_irq_return_iret
      0.22 ±  7%      +0.1        0.33 ±  4%  perf-profile.self.cycles-pp.vsnprintf
      0.30            +0.1        0.41 ±  2%  perf-profile.self.cycles-pp.mas_put_in_tree
      0.25            +0.1        0.36 ±  4%  perf-profile.self.cycles-pp.native_flush_tlb_one_user
      0.26            +0.1        0.37 ±  3%  perf-profile.self.cycles-pp.mas_next_slot
      0.25 ±  2%      +0.1        0.38 ±  3%  perf-profile.self.cycles-pp.mas_ascend
      0.26 ±  5%      +0.1        0.38 ±  4%  perf-profile.self.cycles-pp.smaps_account
      0.29 ±  6%      +0.1        0.42 ±  5%  perf-profile.self.cycles-pp.num_to_str
      0.34 ±  3%      +0.1        0.47 ±  3%  perf-profile.self.cycles-pp.sync_regs
      0.31            +0.1        0.44 ±  4%  perf-profile.self.cycles-pp.clear_bhb_loop
      1.09            +0.1        1.23 ±  2%  perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      0.28 ±  2%      +0.1        0.42 ±  4%  perf-profile.self.cycles-pp.up_write
      0.40            +0.1        0.54 ±  3%  perf-profile.self.cycles-pp.vm_area_free_rcu_cb
      0.32 ±  4%      +0.1        0.46 ±  3%  perf-profile.self.cycles-pp.__rmqueue_pcplist
      0.21 ±  3%      +0.1        0.35 ±  5%  perf-profile.self.cycles-pp.rcu_segcblist_enqueue
      0.30 ±  4%      +0.1        0.45 ±  2%  perf-profile.self.cycles-pp.vms_gather_munmap_vmas
      0.34            +0.1        0.49 ±  2%  perf-profile.self.cycles-pp.mas_wr_node_store
      0.36 ±  2%      +0.2        0.52 ±  3%  perf-profile.self.cycles-pp.get_partial_node
      0.35 ±  6%      +0.2        0.52 ±  5%  perf-profile.self.cycles-pp.strlen
      0.32 ±  2%      +0.2        0.49 ±  4%  perf-profile.self.cycles-pp.mas_preallocate
      0.37 ±  2%      +0.2        0.54 ±  3%  perf-profile.self.cycles-pp.mas_wr_store_type
      0.38 ±  4%      +0.2        0.56 ±  3%  perf-profile.self.cycles-pp.vm_area_dup
      0.39 ±  2%      +0.2        0.56 ±  3%  perf-profile.self.cycles-pp.mas_pop_node
      0.42 ±  2%      +0.2        0.60 ±  3%  perf-profile.self.cycles-pp.__call_rcu_common
      0.46 ±  2%      +0.2        0.64 ±  2%  perf-profile.self.cycles-pp.mod_objcg_state
      0.40 ±  6%      +0.2        0.58 ±  5%  perf-profile.self.cycles-pp.m_next
      0.27 ±  8%      +0.2        0.44 ±  9%  perf-profile.self.cycles-pp._raw_spin_lock
      0.48            +0.2        0.68 ±  3%  perf-profile.self.cycles-pp.kmem_cache_free
      0.52 ±  4%      +0.2        0.74 ±  3%  perf-profile.self.cycles-pp.mas_rev_awalk
      0.45            +0.2        0.66 ±  3%  perf-profile.self.cycles-pp.down_write
      0.54 ±  2%      +0.2        0.77 ±  2%  perf-profile.self.cycles-pp.___slab_alloc
      0.56            +0.2        0.80 ±  4%  perf-profile.self.cycles-pp.kmem_cache_alloc_noprof
      0.52            +0.2        0.76 ±  4%  perf-profile.self.cycles-pp.mas_topiary_replace
      0.48 ±  3%      +0.3        0.74 ±  4%  perf-profile.self.cycles-pp.mas_spanning_rebalance
      0.73 ±  2%      +0.3        0.99 ±  2%  perf-profile.self.cycles-pp.__memcg_slab_post_alloc_hook
      0.71 ±  3%      +0.3        0.99 ±  3%  perf-profile.self.cycles-pp.do_anonymous_page
      0.62 ±  3%      +0.3        0.90 ±  4%  perf-profile.self.cycles-pp.__memcg_slab_free_hook
      0.62 ±  5%      +0.3        0.91 ±  5%  perf-profile.self.cycles-pp.try_charge_memcg
      0.64 ±  2%      +0.3        0.95 ±  3%  perf-profile.self.cycles-pp.mas_walk
      0.85            +0.3        1.17 ±  3%  perf-profile.self.cycles-pp.rcu_cblist_dequeue
      0.92            +0.3        1.26 ±  3%  perf-profile.self.cycles-pp.anon_vma_interval_tree_insert
      0.95 ±  2%      +0.4        1.36 ±  2%  perf-profile.self.cycles-pp.mab_mas_cp
      0.98 ±  2%      +0.4        1.39 ±  3%  perf-profile.self.cycles-pp.__memcpy
      0.95 ±  3%      +0.5        1.41        perf-profile.self.cycles-pp.lru_gen_del_folio
      1.11 ±  2%      +0.5        1.57 ±  3%  perf-profile.self.cycles-pp.stress_mmapmany_child
      1.66 ±  3%      +0.6        2.27        perf-profile.self.cycles-pp.clear_page_erms
      1.47            +0.8        2.22 ±  3%  perf-profile.self.cycles-pp.__kmem_cache_alloc_bulk
      1.21 ±  2%      +0.9        2.14 ±  5%  perf-profile.self.cycles-pp.page_counter_cancel
      3.32            +1.5        4.78 ±  3%  perf-profile.self.cycles-pp.__slab_free





Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

