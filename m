Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A661E9B1A
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 06:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750833629; cv=fail; b=hFteAdujPf4JBf/Pie5lDi5wD8cAcY020aWErW937Y3p/pyuq0uEfroTRqr1RNiYUvTzCzD358dVYY66fjQX11cVvVy0XsvuLFRhRGsf+gNwiOHhy8J5ZgwR8zfhOaA5wqlSso5ox4VjDIHygpIiu0fiX2z3jmOt5B2AcXtolTU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750833629; c=relaxed/simple;
	bh=59F2h5Zeq0+d9H//yCSX9i5j1NGSYHjTbeTO1QVMxJ4=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=abAee19kfmqbc6YBhNAjbG8fLCJAsR54N1gGgTwQ3Yhi1h5u5sPuDBHBBFQknLklJAxulmZYOguH4X/jLPzCAIg/mjOM3VbTuWNM+5TB99xqYxc0oVlMxkChDzNgGiw3LgDLpPJTYV65q4A1lto7Ojt8xkxO+Tw4y71S7/HCSDM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HKtgNLww; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HKtgNLww"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750833628; x=1782369628;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=59F2h5Zeq0+d9H//yCSX9i5j1NGSYHjTbeTO1QVMxJ4=;
  b=HKtgNLwwKsmGyxniLr12ww1aj3pXzjEuz/c6vzvlyI8GVlqXiU/WKugS
   D2w9W4RtadaQjx4ro2c/Z3vOcOITVxnVWvRKHO0M+QGFnlgfmaJ7w6wn8
   gGgUIdNU4eogV4CHvR7COGdDRFMX2brIE0YbDyDSlC7mqtWSvY2egida9
   xm93gODlUboBmZN93jvWTNEoIQrocUSXvo1XsFgXC8cPE171s525nkD+l
   2hPfNp9YI/rU4HIEWKMD+vYCiG8ajE1NsTWzdsqeVM3N/of9JilpvZ5KF
   vqTwPRPebCCTaL2pSYMvGotK2/jgqL0MzX9R1vvOWJbQCvauQedhPthUY
   w==;
X-CSE-ConnectionGUID: CGyQFtU0RxGDkQWEM0XYCw==
X-CSE-MsgGUID: 1iSp1KLESBebuKyPxZjnpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="70520557"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="70520557"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 23:40:21 -0700
X-CSE-ConnectionGUID: kG7ZiLqrTmKN5RnfCzYkMg==
X-CSE-MsgGUID: zHnqVVnzQROjFZmmiNRbYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="152616889"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 23:40:20 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 23:40:20 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 24 Jun 2025 23:40:20 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.70)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 23:40:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i9eIBQUZfO30ngU1G8m7aRJskTVCLw6BZvaVI3Ks634gWJ22WgvZuemXgI0A0MwKzfVW1c7xpF81Q3gKMkEn395M28RBmilsigfi2c8kUU9ZZcnxtBOPlbdPJjjbn8wJFVywjKaPMgwWlbqVx6pKFwIrD8v1Jh95elXOwoGiqrQDfP9CbU88S6P5oRugtaqHzxGGDk0nw2tx8RgUIcDjschgybm1dQLugCFKwoJr2bBKhGErg4lCUjHWnQsC03A68NE6ZP2XVgGYdcy5RmuHz+tuDFcu8zKaDcHl0AYiejeMbJlC28Ei55QvEf7SRpkx72vLSvRgPlFuZ2RLTJVmgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VADHpBwxeCVmTFOXrvVp3dxqhMDz6fXvdltAlD7LAu4=;
 b=hPU5pvLS4QQKBMk5RnmFOL94ejETWscsoCQFKZzX90/Hq8Cn8PfSX5cjTrdgHe8UbP5dt7tSfaDj1hLYfCijS742dKaayMG9CG0HeMMI3k8/9z8rIRjV+RJ56csP5S2D8eQz/BPWVoJILs2oQpfyf84CuRTMAlr2DMIh6wtdT85ZPkOvdwDg7xKpaVxb8vSM+iygiSG8TPHgTB+sek0Oz9fAncqR7n4JEZTxf1JiS/7/bdfOFZThMu/99Jjq0jUDpQoK2XwDAo1Ke3aYmW1k9+b5PvwrVHCG5jMHISBndCUisCdq3sec7GuapqlY0q6DUzHbvnz+OWrpx+YkrRhBww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by CH3PR11MB8155.namprd11.prod.outlook.com (2603:10b6:610:164::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Wed, 25 Jun
 2025 06:40:17 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%3]) with mapi id 15.20.8857.025; Wed, 25 Jun 2025
 06:40:17 +0000
Date: Wed, 25 Jun 2025 14:40:07 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Khalid Ali <khaliidcaliy@gmail.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	<tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <x86@kernel.org>, <hpa@zytor.com>, Khalid Ali
	<khaliidcaliy@gmail.com>, <oliver.sang@intel.com>
Subject: Re: [PATCH v4] x86/boot: Don't return encryption mask from
 __startup_64()
Message-ID: <202506251439.913b4c32-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250619073652.719-1-khaliidcaliy@gmail.com>
X-ClientProxiedBy: SG2P153CA0027.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::14)
 To LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|CH3PR11MB8155:EE_
X-MS-Office365-Filtering-Correlation-Id: 35c5b8a1-31fd-48ba-1787-08ddb3b32610
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ONRCL8vmcnjfiPV0zO+KAmAFYiOzZ+5Je4HpgqoppJnoF4D3NjQpY6f5VQwr?=
 =?us-ascii?Q?N9CehUDPsQVaZXNsgg5bOuZpJkHa9CvXcYk5Ap3k79isAb5nLqKkSzzA+Scf?=
 =?us-ascii?Q?+rPQ1iv/VcGomH4Fp7q20bw8pXrnxQnpuwVCiWVJzHG7WrP2RHA5eTTNrarr?=
 =?us-ascii?Q?DTMhpokOGYPy2qHcVaIoV9HpHo0JyUwI1Eeev+Y/Rf6Xdmh3udemiPnXmHJZ?=
 =?us-ascii?Q?FxYS/hQ1QZwqUxpizYCMXCwAE7A1ctJrLJQ4oJa1P5MYNn2twsZSmJK6JSYO?=
 =?us-ascii?Q?tMHVBCgaNPMusDjwFPsbh5DZvfLtiZWPORj2/wxYsQyPI3dSfDwfhEwz9BUQ?=
 =?us-ascii?Q?Su5+gJU1vGqyjjWCI6cYKK0KRXWOcHV5zEb1rvwJDcQy9km+48M29FbSbTdf?=
 =?us-ascii?Q?Q21qxctT0SB0HRoZ2wc/jqvIfITlXs63FwmEO7tNa3ZQP0V/WZHxua9SWZEB?=
 =?us-ascii?Q?8FKinnA6byAvJ6SPMqmCIBXsmQe7wJV5W+ilHoL1sJovJH/b/extrjovGLKn?=
 =?us-ascii?Q?R2xT4+G9+/4E0A0qn2smNaeq0Sjw//7VxwuEplis16KYXQaxKHmdXkr2ufm7?=
 =?us-ascii?Q?4hrssNReMczHBGobXtW2/wkKICfAAFHiZ0TgellHUQdfkRxPwRbNiDVng6D2?=
 =?us-ascii?Q?o+GsCUxn/RSGGZZ9vWEEi7NXkP5YhBsKosWGyjlj/wY0qPqTgUj2SrJo/mvy?=
 =?us-ascii?Q?P/Pemnu3GsgGcRVa/b0/kOBzS4buKxJZBsPkuDgETf/nDACS9KVTCVItycqE?=
 =?us-ascii?Q?Zpvu4WJFyiGZ3QerMmz2Wg5Fu1SHUz41RXDhKvvyUurbvCa9nPtbyIVUFfm2?=
 =?us-ascii?Q?x8psletdn+W2nK2qQsB2/0F3HOM7srBAogOLQTSq40F0GjhLTpFDDpXPaHE1?=
 =?us-ascii?Q?z7kmi568S4Ofx3m2ou0tCm5wEaWNZLpBayFQm389wJy/t823tMqeQgV5c3aj?=
 =?us-ascii?Q?f96Y8ChEiHownJN7EEQunGJmXDq7AJCHJLml1Kx0jGKS/LE+lVw5Qx5Cvcv6?=
 =?us-ascii?Q?6Xf+6XBDmS2QVsOW9+7S+QeBBn38PdgcUkBgIL6cZUVDjFZeXGTz3IB/xv+5?=
 =?us-ascii?Q?x3FwLGRXehp7ICkY32XwPw/qE63JqSleeUS25X8qrIkGZLh05NJUVQNB/6mu?=
 =?us-ascii?Q?NXdiZenp8xIqJ+u7/HBN3v48V132O0c9mYtgV6uUhYuVDuybxJvaZhDD6d/6?=
 =?us-ascii?Q?n9jfgLv4tpa4glUeXL7lHHIjJ4coJ0wyPwZ1vMZSr5R57gzAV5kzarOB8uZ7?=
 =?us-ascii?Q?BpPJiDdsG6Xcw6yUX058AEcNidlZyT9T5DpI3xAg8+ky671X1fXswxoYqi42?=
 =?us-ascii?Q?+gHh/qzOj5JxQDkBcEJA0nO8ur0MGJ4MzYt3bj/3jX6+d0U+CbH9ICscPOX1?=
 =?us-ascii?Q?nS4gsB4tZu1xeSsmikcmek3El4lq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aLWAwIPbF7vnfEuVWvAWmxNFKe4ps0xArX4bOMIlS5hlHMqwr1pXcO1NN2tJ?=
 =?us-ascii?Q?3IhGWXjBABvsAFVGbnko3g5yz+8leIzpeSh+w1R+VmWUj7Yd+uXBXY+AFDtI?=
 =?us-ascii?Q?lVZRaiO42dtlAxonLOfiq/ix0FXnz9kL1e8pvXxvaq3iJKAikkpb/rUIgnHG?=
 =?us-ascii?Q?BLWc9Ll7ixK2ofYbEdynM0zdrxf5vwlWBvjqMo0vGs3POmkWjSU5TbYHQIfm?=
 =?us-ascii?Q?q4BL0wSsRVyHvHuu8HZeR7wE2wsRsfyYHR3Net/mpcqPRCIdVGDoqa4/S81X?=
 =?us-ascii?Q?G594OVJIxOb7Llx2vSAICBXC7wlHOJ0h8h9Af/6TYoZbiFgzoQ7iwouhzMY/?=
 =?us-ascii?Q?gQ7UEesHZFZzTiN1MBYTzehj2Y5PCBM0ARHFfNF/CQmKsBz9XaZ/t9Hxhfmj?=
 =?us-ascii?Q?Xf6UaY9tUK73V7blBmzNoCZYGGvgo320QvGtScnTZIQCQLB3fcLOh3nSTrAw?=
 =?us-ascii?Q?lKC53EqzkqlJT3khugQ3ZvovKiQSk+lC1LLc2m/sc93znuBn21B5XSUO8qTz?=
 =?us-ascii?Q?x9HuywFpEQaPFedVw4M/u+dNLgiW74Hx3+W4DyVpmGjD1UZs0XedHd1oyjJS?=
 =?us-ascii?Q?pJwDoJGxjJwLwrP9Hn1MWHngrUsqKdG3isBk0YQSTFshTPvKcq56IxlZ23y7?=
 =?us-ascii?Q?NObnE+C+oZaL0Bg0lT3F1SUZ7U1tanEKDYzGj/mwrqka+GfOCCiEQ4DtDX/m?=
 =?us-ascii?Q?YlnjfC2BEZ0M0QUcXNd63QGsL5vXRrU8X0j8boENAKJvUCvH1VdxHmzYIV+1?=
 =?us-ascii?Q?nlOYsjrDGL7fMvlida/QwkW3mlf4vNrpR0ehHd94YCP9YvWMSjlduXmzYuNt?=
 =?us-ascii?Q?m7rbTE4VljmoONppZGEzMPfTkNsVtJEGlR2caJv1nZQO52P+d6sdira6H4Du?=
 =?us-ascii?Q?YIfR65/JLoJAcQhKCgfWL4y/R6hbdHrs8DCA16QEGZy2QYn0X1kIO/fQXTHR?=
 =?us-ascii?Q?s/YQmubYdonyPpkA9PHD1mLXzJU+2FJBxKoa9+52DKUc+GrcwKiFYaHkJTTW?=
 =?us-ascii?Q?Z8GMe14g1A25Z311/zwsNpPkesM3usVYakLIS5iRGqvU2a6Vpr2g1G6uxVz2?=
 =?us-ascii?Q?KUDyO+Sc9CcGk2arUOl5uZAz0K/9iLa337vZ+S8PcEdNiwzeYXRq1EVafrUv?=
 =?us-ascii?Q?f4O7GpkW02wMOiQ9MeCDbnMzpdiAJ/faeQjBdzBwSAc5Pjfj+DprPe7GlL0Q?=
 =?us-ascii?Q?YBWMmqf9PD/1+Uw8pNUclYWvd9pFKs3+2PE8jcOntnUgIjd0LhBPCxn6Mdhx?=
 =?us-ascii?Q?1xZNUTnQGy2dE2/AH8BvOIIO9GiUBytVIog4q/3dWWrzy7K2eNz8y9gDQIb4?=
 =?us-ascii?Q?Bx0R0lWRNJaofmH+ylnfwLuZ5PtU71EOdrf2DRcFtxiMSC5gydb2GetvOkJM?=
 =?us-ascii?Q?8oKsF+BQeA6RJ09TtzLi1208dRbiZY32S/7ULG8aplWCHGbnq6Ebnky3ALnf?=
 =?us-ascii?Q?HcvdlITVdxLDp4/933RmYc6oXsEMz152Tj+TNxoKrDl+Iw6RwMic08TW/bZX?=
 =?us-ascii?Q?QfSZhkPCedRwf3jU/mGb9kfXMdYe0KkjEYdhBH753Sv4j53c/ogEW6cKhV/p?=
 =?us-ascii?Q?YkY+En/iAWUpY9z+puMUBgPR92ZEoDZhYuFO02BZs/nsbwiOGw4ZnfskI0sY?=
 =?us-ascii?Q?oA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 35c5b8a1-31fd-48ba-1787-08ddb3b32610
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 06:40:17.7489
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mRuFHcH/YiNEkyNf2SwvWEDW2oro3l2YXyU3OYACGw1H3lMCd2jg7pJZAoRUKRJvHFv3fVmNPYwze5CCfuOLFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8155
X-OriginatorOrg: intel.com


Hello,

kernel test robot noticed "BUG:kernel_failed_in_early-boot_stage,last_print=
k:Booting_the_kernel(entry_offset:#)" on:

commit: ceefc6a6846712aaeee61b8dfa97d5c33313d063 ("[PATCH v4] x86/boot: Don=
't return encryption mask from __startup_64()")
url: https://github.com/intel-lab-lkp/linux/commits/Khalid-Ali/x86-boot-Don=
-t-return-encryption-mask-from-__startup_64/20250619-153838
base: https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git 6a7c3c260610=
5a41dde81002c0037420bc1ddf00
patch link: https://lore.kernel.org/all/20250619073652.719-1-khaliidcaliy@g=
mail.com/
patch subject: [PATCH v4] x86/boot: Don't return encryption mask from __sta=
rtup_64()

in testcase: boot

config: x86_64-kexec
compiler: clang-20
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+--------------------------------------------------------------------------=
------------+------------+------------+
|                                                                          =
            | 6a7c3c2606 | ceefc6a684 |
+--------------------------------------------------------------------------=
------------+------------+------------+
| boot_successes                                                           =
            | 6          | 0          |
| boot_failures                                                            =
            | 0          | 6          |
| BUG:kernel_failed_in_early-boot_stage,last_printk:Booting_the_kernel(entr=
y_offset:#) | 0          | 6          |
+--------------------------------------------------------------------------=
------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202506251439.913b4c32-lkp@intel.co=
m


trampoline_32bit: 0x0000000000000000

Decompressing Linux... Parsing ELF... done.
Booting the kernel (entry_offset: 0x0000000001161e30).
convert early boot stage from reboot-without-warning to failed
BUG: kernel failed in early-boot stage, last printk: Booting the kernel (en=
try_offset: 0x0000000001161e30).
Linux version 6.15.0-rc7-00359-gceefc6a68467 #1
Command line: ip=3D::::vm-meta-270::dhcp root=3D/dev/ram0 RESULT_ROOT=3D/re=
sult/boot/1/vm-snb/debian-11.1-i386-20220923.cgz/x86_64-kexec/clang-20/ceef=
c6a6846712aaeee61b8dfa97d5c33313d063/0 BOOT_IMAGE=3D/pkg/linux/x86_64-kexec=
/clang-20/ceefc6a6846712aaeee61b8dfa97d5c33313d063/vmlinuz-6.15.0-rc7-00359=
-gceefc6a68467 branch=3Dlinux-devel/devel-hourly-20250619-233935 job=3D/lkp=
/jobs/scheduled/vm-meta-270/boot-1-debian-11.1-i386-20220923.cgz-ceefc6a684=
67-20250621-121357-1bgjd25-0.yaml user=3Dlkp ARCH=3Dx86_64 kconfig=3Dx86_64=
-kexec commit=3Dceefc6a6846712aaeee61b8dfa97d5c33313d063 intremap=3Dposted_=
msi vmalloc=3D256M initramfs_async=3D0 page_owner=3Don carrier_timeout=3D60=
 rcupdate.rcu_self_test=3D0 max_uptime=3D600 LKP_SERVER=3Dinternal-lkp-serv=
er selinux=3D0 debug apic=3Ddebug sysrq_always_enabled rcupdate.rcu_cpu_sta=
ll_timeout=3D100 net.ifnames=3D0 printk.devkmsg=3Don panic=3D-1 softlockup_=
panic=3D1 nmi_watchdog=3Dpanic oops=3Dpanic load_ramdisk=3D2 prompt_ramdisk=
=3D0 drbd.minor_count=3D8 systemd.log_level=3Derr ignore_loglevel console=
=3Dtty0 earlyprintk=3DttyS0,115200 console=3DttyS0,115200 vga=3Dnormal rw r=
cuperf.shutdown=3D0 rcuscale.shutdown=3D0 refscale.shutdown=3D0 watchdog_th=
resh=3D240 audit=3D0 kunit.enable=3D0 ia32_emulation=3Don riscv_isa_fallbac=
k=3D1

Kboot worker: lkp-worker51
Elapsed time: 60


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250625/202506251439.913b4c32-lkp@=
intel.com



--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

