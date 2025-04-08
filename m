Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3B61C6B4
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 02:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744080795; cv=fail; b=j8oBhOz7qsQZGbkdXYNQu6MCr+58oYWTLm8/xitK1AWpLT084kQEzM+uPQmV816cFdU1qoKZdMmUjjI4FgAX6UggOAFoY/XMZgpaIObAV1JCJAwLymHK5t66kK7NJPQ48J4IFp8+ek6Lot1akkBU9KR4Df80JnpeZJPbR6EoGH8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744080795; c=relaxed/simple;
	bh=t8oyE9dFuL48em8e+W/MJPT/YpVzDnRgLO2Z72u5RpU=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=okP4YK85KJSy+ccmraKrnYE1YfcAWsP/SRo/3BgIMZl6R3yi+mpcwHieBUT3JGkEfv9qNi1CAnJKZg4wa6/rAjcZcLpfdtOABiZPITg/h918K3vrmVWxZHi3ggGg0MGfOStALSd6/EGzMpc03ssECv4e/2Xz8eJ12PgbiGwFA2Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FdfWvVh4; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FdfWvVh4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744080793; x=1775616793;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=t8oyE9dFuL48em8e+W/MJPT/YpVzDnRgLO2Z72u5RpU=;
  b=FdfWvVh4sKi8mKwGqQ3S+D7Gv6vT2ZfMp2CRM5B7WvEnQ+cW0raFp/Tl
   End6Wh15wB04p6AmcTgFcnyk3tyBmkH5GFHHt4OO8WKxswC3lnDe4KjTs
   rj6gzUjgusZCBREUf+0p3WuSfk4U948iXAQqriOiqTfuygTPLsvI6P9Op
   RJz39rxRqPUyqLqnnn2CbXu3CQn5cWitSy2Fpv6FWZIE1sMfrCJD2kaed
   YhKc67J9h3eXYHnZdDEiMZerxuYbyT8nzNfa5hIgKO8vJ4a+onKPHR+/W
   2GVQH+PobTob74odR4hOo4bDqMVd3axA1LdasK7ZLUsYC2OIQP7SODuwJ
   Q==;
X-CSE-ConnectionGUID: czSPVUBITFyNIdy2rQFIEQ==
X-CSE-MsgGUID: NEcIDH/XRZmL/IPNwbOeGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56475248"
X-IronPort-AV: E=Sophos;i="6.15,196,1739865600"; 
   d="scan'208";a="56475248"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 19:53:13 -0700
X-CSE-ConnectionGUID: Q4NfHczESjOqwQA6Cnsaeg==
X-CSE-MsgGUID: X1n5HdQcQUST+t2rTK6/Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,196,1739865600"; 
   d="scan'208";a="132853180"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 19:53:12 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 7 Apr 2025 19:53:11 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 7 Apr 2025 19:53:11 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 7 Apr 2025 19:53:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YHiijPhoUI1G6z2TckNjESnPBI4YNcLIyqitFp0Di/A2ksZ3qAwy+fZQyYjbNMO83bzVc1o8dHVypCm+CpgueU+Q52ea5ACzcZOsrdluWrW5rCv5SUDy8zjyrA8ykQvi8pW9ZLRf/Wz1sDyoOTAKdzDN4qwX/QJezNQkjHDTl3ZSNpuSVsaia4r1dI4X0dMONk0DwpPbyJADaKlrVH1F9xieuZmkfo5HX8QmiotxtZ5ZxlFknHXpLS/K2G4jOHpVUOZUmuqw2nJigYLSwGx5E+WWYeEt7KczN45jLrcYcqSEyAUYmlGCyP1vOMg422TDEQkVG1rzhihc1IrlsG993A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0iSzw3TReaTRUxENiwrnDOxW9FFbe6zZNj5pu9r9/zc=;
 b=NUCx+y6fdMmtRRC0SaLaPv5hZt+pElrJX0p6zXiG5XJ+Nf8deRulhkobaFiCTIC0pBCuEOIx7mU1ay5fNB1kmqMdeEtT+18MoVQJV32evGWch0IjNO7tbh7StB/6Egs/svqoULvdXObNv+9IA9So4tLOiRS5E9TauAQ53jiNckKbF215aqUsQjAQm/Zn24F3SCMuC2dzsAHx3WDrNvXlyF5JlM5Ojfhzc9Cn/YCWmyNW1z3KRHJJEqBCsoUPUCsP5NQW2T0yTnK0dqxHWEb1/AfHeXbi2eSh05XIsct8B6ZbHzcEaMaJ4vLQFQOjr/WxsbaXHV+4DR6GmUUbx8Inmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by MW3PR11MB4587.namprd11.prod.outlook.com (2603:10b6:303:58::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Tue, 8 Apr
 2025 02:53:07 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%4]) with mapi id 15.20.8606.028; Tue, 8 Apr 2025
 02:53:06 +0000
Date: Tue, 8 Apr 2025 10:52:57 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Brian Gerst <brgerst@gmail.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	Ingo Molnar <mingo@kernel.org>, Uros Bizjak <ubizjak@gmail.com>, "Linus
 Torvalds" <torvalds@linux-foundation.org>, Peter Zijlstra
	<peterz@infradead.org>, <oliver.sang@intel.com>
Subject: [linus:master] [x86/stackprotector]  f3856cd343:
 will-it-scale.per_thread_ops 1.9% regression
Message-ID: <202504081055.4c396e03-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR02CA0015.apcprd02.prod.outlook.com
 (2603:1096:4:194::16) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|MW3PR11MB4587:EE_
X-MS-Office365-Filtering-Correlation-Id: 50871f8e-76f3-47aa-6414-08dd76487cbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Jt7eBmZKvp1dMm7y3SgBtyLhP3b0MtfpuYAwhWzAztCNwC56ln3/qHeVj0?=
 =?iso-8859-1?Q?UCMufvNUayKCdAIUPh1Nlsra1auzwHm8wRmpsNk/wqaERw0yes8CXbGyh0?=
 =?iso-8859-1?Q?YAmj9L7r7nAYNbrw8l9118XsFs9+/GUlI73AVAlOTLtjVOF0krjwfzJW7x?=
 =?iso-8859-1?Q?QnUWdfxB3Uxg0QF666n/o7euPhe0WZ5cWLOKp1kKaZ+95j74VnrdMe3a/K?=
 =?iso-8859-1?Q?dI/18AGMJcxdPfWY9eqdhQssJ8iZzvY5ekQWE1BUP+rC1QIhRsifX8hJux?=
 =?iso-8859-1?Q?Cuf1vkRrpMikci6/bbdL1jb+OJE09ui3MHTt480j9TE0VA8xxtTf0t1K2Y?=
 =?iso-8859-1?Q?VLwPV9Ouq+HHuF3HjXpy37aL9U3V1Ihm0bjBXwrJtMPwk8GWJTkHNWF4yx?=
 =?iso-8859-1?Q?CiiwHclxAoRD4IiX1kX3tTzcISQC3APLOMuNv8gHsKCf9a5uaDs+NeulG6?=
 =?iso-8859-1?Q?v/U8+VVtJi7vGz9KiIxvI1EkmJrqL3j2uE67Fz7cockmGwGfYwI7RxWmYN?=
 =?iso-8859-1?Q?9laV7Fb3c3oy5zjP1NpBzrTDJu244tmdUmEWcI+JSawXm7DCGYSTBS7S1j?=
 =?iso-8859-1?Q?Eho1VXgJlQ6EzoZMzHdNTNON/UtAg7YkbpeWAWekIxPHNfDW3ImnID0A6s?=
 =?iso-8859-1?Q?gIXUXoGhFKFSjOHKiKbuXr3qUj6mjYpnnOHTCy+YRskLquwZ72E7V7Z6rh?=
 =?iso-8859-1?Q?hv9KBrA6lzuFJUMaBQ4i8a3ktHZKGgq9SJ0fZ8DzC3K31FkWsO8XHFWBud?=
 =?iso-8859-1?Q?Bu4yjSc+LwQLoW8QwXxJfB6Saz21UPOU7brssTp8G63T45f6Zl+i9cN87V?=
 =?iso-8859-1?Q?E1I1hsd33XQLrz/P+mh0SPSMCvqXIz0T5bFJJxo1wNdFtY3VdJvbl30IuH?=
 =?iso-8859-1?Q?/fTsBigdC5XHIx7+QAT6N5sNZvScTIQBr7qBhXUAsuCDssa8kRvXKgnRmo?=
 =?iso-8859-1?Q?L0k82Zb0Fbjvgn5ZVnTUv+nZVo9JDaZc4x6hDdOjJEvMhLKXc8aeAt6aMc?=
 =?iso-8859-1?Q?9BlOeiE6h3Kjc6ZmONN4icgssEVoJoaRuWf+Pa3oEJcGmR1VHB1M3X2V9L?=
 =?iso-8859-1?Q?YFhA5XyB6TWTDHR2nqBxUbY+IpoM8/wj+NEA2hlwBOMRiZu5jfaHHPWZb0?=
 =?iso-8859-1?Q?DnW0y/TQC5SZSsGEN3Os6FJu/pzr20CMlwIw0g59BGkVU6HjkDtP29nQUi?=
 =?iso-8859-1?Q?Xkct1JUjmA7gvveAVu9f8m6WQtZOABh+PS1GD0QZ/AS4xxDTy8l5UeBO9L?=
 =?iso-8859-1?Q?qmnnostbrepbEzGLBP0UVW3ysQ/8KEh/hSAyAS/cSD01m0YsV+rAuc/FZ/?=
 =?iso-8859-1?Q?b5b1D9hFo+tiRe2h0IIeU/wo7cMg1y/W+qZibc1gegn8ymeyZC5wTbdDKD?=
 =?iso-8859-1?Q?qpN47jJBQm+B5QHyKpSJIBWdB9ltZlVQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ytshMWTYYXkXbMeMFd/ImODBnsqVhBicVf+wFGiHur/20g3xq4nqz7d0eA?=
 =?iso-8859-1?Q?mp56KEuy5peazsuh5pLww6J+A4gkDjbbi4Tox3FalUjr5qVf9b10c/L16V?=
 =?iso-8859-1?Q?dLFriEWezAlriXU+qWSYzm+RCdgtTQ/hEJ2LZrfOPPCKe8KppScA211LR/?=
 =?iso-8859-1?Q?KbsVkoaxFUKZ835BZytGW3a5x0CdSQph0wkbsgbUDshQ4CEidYakdubH7L?=
 =?iso-8859-1?Q?oCyKCJqVdl7XJeFDzubCag/2+FfZNgl2eN2gd7sDKGojMFbE7qc84lu9lD?=
 =?iso-8859-1?Q?s6OvplPEMUsjyqm2dfAm8boI0Tk2L6mkdvHtmTgS01UcsoWM8zfcP5DE6q?=
 =?iso-8859-1?Q?80SQ4oiHI0AdTXZMaBf2j+H7RiZOhfh1pr7hlPhu4IQJv+L4ep2QZvBeAY?=
 =?iso-8859-1?Q?5ruw9MlcwiJW4i905yvgKApuDwQQUBMuF12c5GkVAg8B835Xk994wkPw8S?=
 =?iso-8859-1?Q?eYHYNiQjJ41urs0Xy8XskeQHZK/wuQdxTKrVVIuEV+5n9t2Q7ZHr+Qt/VT?=
 =?iso-8859-1?Q?LsA50tiC9SEFifDT/UK0lUOgDZt5lGqioLR4dqhQq4Fbk/1yWaQ4dGi6jD?=
 =?iso-8859-1?Q?7p0skl74WHiRhmEKPH6jtc/QTxY5Qpj3qjS8fjwuhDjwtQR+/iKgEn7b4+?=
 =?iso-8859-1?Q?Cw1mbQkA+jPogEZNZVmkb1i7UvviOeLYiZGLz4qX0ctjQmj51/HV+iPIzM?=
 =?iso-8859-1?Q?IX0Xh7WZt5lSGfPi+CGAgbPk+9MMmmZIR0/4TN9nQKZlc54NLDg7WwM4LI?=
 =?iso-8859-1?Q?RZA9qtllFE03ObKtW6dgQtF2MjIpi2w8ZW7zRg2/zcuQHKTHylYZfePv6b?=
 =?iso-8859-1?Q?pG/QKezbAK21sNy9iOvJHzczlP1jHNCwQymCwMk2wuliioo7UlQzO1E/xs?=
 =?iso-8859-1?Q?//tI/fVaXdulQjgWUBsWGM85AOOUME0YMDWbKWziCMhHuzCzBIfzHoHYU0?=
 =?iso-8859-1?Q?SuTMoiGeEYZgQ4j+BMqkv3uU6cymDKaxHDJOAnaLt2yD/GjKCCAwFb4/X5?=
 =?iso-8859-1?Q?ZfCbgAESamfT3HJExwnTqLR8LTVWO4mZOITcwcjV3J/RbvnzGWs6Ip+J2G?=
 =?iso-8859-1?Q?Qo2pO5LDU6pOBkbaJIn5BflFTGS39P7V2CJo1tNG/SEqCVAiI/elY/GTXJ?=
 =?iso-8859-1?Q?wAq5TpaJeNqtgO5cNZvVGg3bRsZ9LuuIymrpFDaL15ndf9Q0b8T79u1OKV?=
 =?iso-8859-1?Q?FurYncbHspicqjiWNw7CUL0DzLm5RmgZGOubEuQvHVRRC1+qTyB/9BVMM+?=
 =?iso-8859-1?Q?DQv8hmQUAxwFAKtnX6YIUyIQhIBWvNWR3mXz5oD+MYoMlpEQh34+lMJupe?=
 =?iso-8859-1?Q?N3jkTHKx8p1ZgzUNkrA96HZDWcc8+D8UGJi0CkTBGfHjfVF2aEcY6/mt+p?=
 =?iso-8859-1?Q?8Qil515dMQsD8hR2EoycVumYSrwRgQhmF6ClFdTyCbOp8TGNOxqZw0ARrz?=
 =?iso-8859-1?Q?Cu8ededL1oTPSDsaOu7Kv9VNm95Y+4AZCeHSxfbn8rGnImT6Yj5sw5NpHh?=
 =?iso-8859-1?Q?SJ+cS3F/He5Df4nI1trXFaKt4ADplh978TXKmlydRS6LqXvu4uEgGsTpT9?=
 =?iso-8859-1?Q?USpWDHeL2r+U0TAkU1WirqHEkOl7j/MY9DhrqbtvEdW0cwNCslZ9ceUil8?=
 =?iso-8859-1?Q?tjuMX63XONSNBAZFi6wg+fhWaWLOCBmd8H22dL+i264LhN7+EPFFmsEQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 50871f8e-76f3-47aa-6414-08dd76487cbb
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 02:53:05.9802
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Otgj0stY7QSDO8hSVJiy/WLsElh3oWsFFBcXpPda3/vS8cIIKSiuP2kjTGpXyYdNfFtTt1UCEyqmTZbhoK5wgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4587
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 1.9% regression of will-it-scale.per_thread_ops on:


commit: f3856cd343b6371530c9af3c97354cdc003f3203 ("x86/stackprotector: Move __stack_chk_guard to percpu hot section")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master


testcase: will-it-scale
config: x86_64-rhel-9.4
compiler: gcc-12
test machine: 384 threads 2 sockets Intel(R) Xeon(R) 6972P (Granite Rapids) with 128G memory
parameters:

	nr_task: 100%
	mode: thread
	test: futex4
	cpufreq_governor: performance




If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202504081055.4c396e03-lkp@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250408/202504081055.4c396e03-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-9.4/thread/100%/debian-12-x86_64-20240206.cgz/lkp-gnr-2ap2/futex4/will-it-scale

commit: 
  a1e4cc0155 ("x86/percpu: Move current_task to percpu hot section")
  f3856cd343 ("x86/stackprotector: Move __stack_chk_guard to percpu hot section")

a1e4cc0155ad577a f3856cd343b6371530c9af3c973 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
      0.84            +2.1%       0.86        perf-stat.overall.cpi
      1.19            -2.0%       1.17        perf-stat.overall.ipc
 4.785e+14            -1.9%  4.692e+14        perf-stat.total.instructions
 2.484e+09            -1.9%  2.435e+09        will-it-scale.384.threads
   6467627            -1.9%    6342224        will-it-scale.per_thread_ops
 2.484e+09            -1.9%  2.435e+09        will-it-scale.workload
     40.20            -1.3       38.94        perf-profile.calltrace.cycles-pp.futex_wait.do_futex.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe
     35.54            -1.3       34.29        perf-profile.calltrace.cycles-pp.__futex_wait.futex_wait.do_futex.__x64_sys_futex.do_syscall_64
     29.67            -1.2       28.44        perf-profile.calltrace.cycles-pp.futex_wait_setup.__futex_wait.futex_wait.do_futex.__x64_sys_futex
     42.56            -1.1       41.49        perf-profile.calltrace.cycles-pp.do_futex.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
     46.26            -1.0       45.31        perf-profile.calltrace.cycles-pp.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
     31.33            -0.8       30.52        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64.syscall
     65.81            -0.7       65.08        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.syscall
     62.78            -0.7       62.12        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
      4.94            -0.3        4.67        perf-profile.calltrace.cycles-pp.futex_q_unlock.futex_wait_setup.__futex_wait.futex_wait.do_futex
      2.62            -0.2        2.42        perf-profile.calltrace.cycles-pp.get_futex_key.futex_wait_setup.__futex_wait.futex_wait.do_futex
      3.62            -0.1        3.49        perf-profile.calltrace.cycles-pp.futex_hash.futex_q_lock.futex_wait_setup.__futex_wait.futex_wait
      1.69            -0.1        1.56        perf-profile.calltrace.cycles-pp.testcase
      1.06            -0.0        1.04        perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
      1.91            +0.1        1.99        perf-profile.calltrace.cycles-pp.syscall_return_via_sysret.syscall
      2.21            +0.1        2.34        perf-profile.calltrace.cycles-pp.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
     90.29            +0.2       90.49        perf-profile.calltrace.cycles-pp.syscall
      1.13            +2.6        3.68        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_safe_stack.syscall
     30.76            -1.3       29.47        perf-profile.children.cycles-pp.futex_wait_setup
     36.03            -1.3       34.77        perf-profile.children.cycles-pp.__futex_wait
     40.41            -1.3       39.16        perf-profile.children.cycles-pp.futex_wait
     43.41            -1.0       42.37        perf-profile.children.cycles-pp.do_futex
     46.83            -0.9       45.91        perf-profile.children.cycles-pp.__x64_sys_futex
     66.21            -0.7       65.55        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     63.79            -0.7       63.13        perf-profile.children.cycles-pp.do_syscall_64
      7.52            -0.3        7.20        perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      5.16            -0.3        4.90        perf-profile.children.cycles-pp.futex_q_unlock
      2.79            -0.2        2.58        perf-profile.children.cycles-pp.get_futex_key
      1.99            -0.1        1.84        perf-profile.children.cycles-pp.testcase
      3.78            -0.1        3.64        perf-profile.children.cycles-pp.futex_hash
      0.56            -0.0        0.51        perf-profile.children.cycles-pp.syscall@plt
      2.18            +0.1        2.25        perf-profile.children.cycles-pp.syscall_return_via_sysret
      2.49            +0.1        2.62        perf-profile.children.cycles-pp.x64_sys_call
     17.32            +0.6       17.89        perf-profile.children.cycles-pp.entry_SYSCALL_64
      1.16            +1.5        2.70        perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
     13.43            -0.7       12.74        perf-profile.self.cycles-pp.futex_wait_setup
     17.52            -0.4       17.13        perf-profile.self.cycles-pp.syscall
      7.25            -0.3        6.94        perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      4.87 ±  2%      -0.3        4.62        perf-profile.self.cycles-pp.futex_q_unlock
      2.51            -0.2        2.32        perf-profile.self.cycles-pp.get_futex_key
      3.55            -0.1        3.42        perf-profile.self.cycles-pp.futex_hash
      1.76            -0.1        1.64        perf-profile.self.cycles-pp.testcase
      0.25            -0.0        0.23        perf-profile.self.cycles-pp.syscall@plt
      2.61            +0.0        2.66        perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      2.18            +0.1        2.25        perf-profile.self.cycles-pp.syscall_return_via_sysret
      3.42            +0.1        3.53        perf-profile.self.cycles-pp.__x64_sys_futex
      2.81            +0.1        2.93        perf-profile.self.cycles-pp._raw_spin_lock
      2.20            +0.1        2.33        perf-profile.self.cycles-pp.x64_sys_call
      4.62            +0.2        4.77        perf-profile.self.cycles-pp.do_syscall_64
      3.27            +0.2        3.49        perf-profile.self.cycles-pp.do_futex
      1.14            +0.5        1.68        perf-profile.self.cycles-pp.entry_SYSCALL_64_safe_stack
      3.30            +0.9        4.24        perf-profile.self.cycles-pp.entry_SYSCALL_64




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

