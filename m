Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29DB1213E99
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 02:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747361607; cv=fail; b=egz/XvV6PmVmRe90wVLprSx12iXGFk/MHwyZha56t5nybSyR7CKa7Ls7EW+1LxS0g8rtFC2ChdCeXhWRS6rXsP0T7GcZOu3lh2rMBfkynO8BkAa2YjikICqQnSK2Q0oud7PXVoK5FiOIZC3Nkd00JWhsMuuYMC2I/m3OXhcfp8s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747361607; c=relaxed/simple;
	bh=JwJ7L+AiJH/kTxlO4QqVF89KnySgIKlxxLo48u9AHSs=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=uTI0qT/CFnowzeBy3l7fGwS/HL1itKPpAp6UJNs5jBT/ZBVlG41MAPJmr8kR1H2lIaVZwx0vyGhs2PrDj3wf225PHLOvETOG5RLZYT26wnvvVBPYiNkfSd0aPkYQzCWywm9YeXYHo8fxDt1+57PwexelzRDtBpVdbmrLW6RzvlM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BVgcN7vI; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BVgcN7vI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747361605; x=1778897605;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=JwJ7L+AiJH/kTxlO4QqVF89KnySgIKlxxLo48u9AHSs=;
  b=BVgcN7vIxFn3vv614/DqI/l7CsfwfSfm1EO8FOKbtRgaeCrS3Zo7HRQ9
   lhSqCRztDoOxMI8OP9N9L/Fp2OeJEVeULn7xGxBMsrm0d1pASmQbHnieZ
   FLopi0Ww7M01N4RGGvAe6j6q8lFyMdORvQT2gUX6D9cDIQBMeL/AQG2iD
   Dcp4/oXQE2R6fIR0BNga4D4DkapsxxFl3WI3VIME75+DjxDjmUyJRunTJ
   Pw5lsNs/tROCJfr+QrZ9r5KQL+6NDIlEVb/qJf0KhDiguPg488JUqaRQ8
   q8mBOZCHIuiFASkmZRwKQ4/Hr+igmuxQiD/4eRXiJPU5LMbi4ofO4rI87
   A==;
X-CSE-ConnectionGUID: n/j/WqmXTKa9obC9mO7ABQ==
X-CSE-MsgGUID: +q58w0mOT2Ci26QHnVdl9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="60662661"
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; 
   d="scan'208";a="60662661"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 19:13:24 -0700
X-CSE-ConnectionGUID: qKaQoGRrQdyCSCCBxwcNmg==
X-CSE-MsgGUID: n4UZJuBYS6Cza+RHUPYmfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; 
   d="scan'208";a="175680725"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 19:13:24 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 15 May 2025 19:13:23 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 15 May 2025 19:13:23 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 15 May 2025 19:13:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VclRDyr7inJ0LNnVP0ktRHT0iaebPJAT1agvflg7tBFV7RJsnf97azifUpqhe4qOVnjYnBf8CxAuW8dn2CMCySIUbFgqf51bX0C6WbIiv5YdzNWDIqvmMvLjJZ0cgpmbpsYffLDnyhrdLotUcGZ5IRfP8Gu/wWg8f1wQBWwA2kVwxpcxK57RJfkmoTL4q/7CQ1OkKh9iVfKF9zDZK9LK76u0n5MBt5+3ACQHPZrILCdiygkIt3yGo7yKMtnUF628kja1WHGIKWowccB0R7b/I7YY25Mb8nikQ1v1Y6Ed9ztcMS137tmjs9K77QG2SiWk+DZMFW8u1IUUo26wgtajpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pUSj+6MOO60DoM9mCQOarn/2WMp5/0aItcoWi8PBLV8=;
 b=uNG4hyp70bqsWPXt/dp8Bv/2V+EsM1e1eHnut7Cu/cB8PSLmHS0faLNcUpDd8+DaIQ8gfaMYSyIIiPVPfxf8EbK62clxO+7LYUS49Oac16ZoQK2g4+CMbU3ALLa9Y08Xt+h0XOzG/r2aTzA8XPKvXI/1ZXJT0FaAUteaMFzUOaRcTS7IyDTWxn6q4VNvUinw85QHtFscFVMW6lKM/Nh7bFNBEp3vN7cjzpIvEyE4u1M2Iu0b/P/ohJ46UcXB6QJ6o0/ue1H1DSi9ZshZBKPnD5Rb4sACohEkTMuoyBuCgJ18aPdU9AN9OEbUVmBCZdMN+xLdcEQLgm2hL5wkso9SsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by IA1PR11MB7677.namprd11.prod.outlook.com (2603:10b6:208:3fd::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Fri, 16 May
 2025 02:13:21 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.8722.027; Fri, 16 May 2025
 02:13:21 +0000
Date: Fri, 16 May 2025 10:13:11 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	<x86@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	<oliver.sang@intel.com>
Subject: [tip:locking/futex] [futex]  cec199c5e3:
 will-it-scale.per_thread_ops 3.2% regression
Message-ID: <202505160923.2556b729-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR04CA0018.apcprd04.prod.outlook.com
 (2603:1096:4:197::9) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|IA1PR11MB7677:EE_
X-MS-Office365-Filtering-Correlation-Id: e4d18535-6029-4383-0ad1-08dd941f3aac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?TgP5UqWFUWoNHNuCzGDj5s/MOLxckxIqCR5DaPSGoI28t8YcHE1aVja1Pi?=
 =?iso-8859-1?Q?r8GkcdMtVo2SMYzmYi+si5kczxotA/yHLYgJWPvJO6rxE3pJ8Jg3BNhAZO?=
 =?iso-8859-1?Q?KzWCBm85LeOYe6upn1rkycqw99/G31r9n1JfDy9tK2SiAkAMLk9TSK1lxx?=
 =?iso-8859-1?Q?Tm8YJUlp9ZLQQZQR4QA/QKuX7ghfCJ+UVAM+AtjzGNJtAxmYjScMU9Dzkh?=
 =?iso-8859-1?Q?1l7ykHAUutEN4Yh3uDWQc4JIgvLuefZ5dKg9T92Q2NihGvQVHSL74zK8Gy?=
 =?iso-8859-1?Q?IlIiwGxYY4gnBtYE139BJuEZEfv9gojwTgeRvTNQN3kBT3FN5sNAx6conW?=
 =?iso-8859-1?Q?Qnm2Xq7CezHPuzlNbFfpFBbUTkaoXfZPXomz37cBLjI1G5x3VpjUeuQqYU?=
 =?iso-8859-1?Q?2n1CYSHTR6WGYSEO0AssPX2fdNWZKOsLwTaUU78P7rCpcbB396PlNcuQp2?=
 =?iso-8859-1?Q?LTvjmaIyG9tUcTOOXWBVczqfFIXRcfTDV+yTziRUYZJzrBycc7uHcpGaU1?=
 =?iso-8859-1?Q?CVMuLWhhpg8WNTaCG+zMtX+6XdYnDtdV5nl32yYc2wozf36Qvjw/4xzf7Z?=
 =?iso-8859-1?Q?Ccpd2QQ9nQiXxNHVrNrxoDIXvEwVWnEXCWe4AAmG3e5veFwyzBFQ1PNpIl?=
 =?iso-8859-1?Q?PgxaIoVUXAvH22IfmS0t5kifyqVODnv6wFqFtiE1bAeWmbk5e5nc+0vyw8?=
 =?iso-8859-1?Q?K2q1qOo9nYZVRp1/s8UJ3hS1zVW0zLm2jTMMa4uuqeOoql/jCXIHMSImvG?=
 =?iso-8859-1?Q?eOZQCJfj6jhrJ8LVKkPSO3Aelsy8IKyQup0wr73auh08mQbMoXMnlnOHsw?=
 =?iso-8859-1?Q?/6cG00vfmwg39H1bAvW8Erc7dfW9zIwummmPBebbuy5feod/YyOvz3pvvT?=
 =?iso-8859-1?Q?qtAkqR1gbLZ4Wu5uhXJGPaJNew9bUnsUnsTj3XBRXSYRsdO0JdhvcHJcsp?=
 =?iso-8859-1?Q?nf/1KNjw66FWkv3f2so5RlKpsZZ5MHOLc0sVzlUz+gOpUtVZN/SfrZZYiY?=
 =?iso-8859-1?Q?CtfohYTH/X2KONpfzyFPEJV3rY1kteJ/0oRxHDynj6n0TTnhC9GF+8UdYF?=
 =?iso-8859-1?Q?9cIbiPdT5P9y6J1mQIYKZgei41RObROSyJ/qf43MDWdfpnITM392rMMpK0?=
 =?iso-8859-1?Q?Cx8TLYYJUrqvfYVHf2qsA6kMECaKFTpCaNpsb9YJ1hDOf9Guzypnci7JER?=
 =?iso-8859-1?Q?iEF/jDuMTBCyvzy0ksPo/mzIx37Xk0SNGY2DILgwkl+hCPv4VIoaLJaRko?=
 =?iso-8859-1?Q?+GrZXMAqMYBZl4nY8fMhlVffxzXd/v7vke/XqD5oB5lasmk+NVwD6yqcfb?=
 =?iso-8859-1?Q?IB9WzlytWhmzxQx7JP1acod0pLvduwDmwx1CP0MtkmdB7lgMlewO+P5uuU?=
 =?iso-8859-1?Q?sDA3f2ji6JxrXSsIhF8a1ZFU6OGgmRqP6rkKJL6CMRrgWEli60kG91PQ99?=
 =?iso-8859-1?Q?1lQfHdJzGSpQHpct?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?v93ICgavZiuwRengYdZZUdZepuBPi43YnUMRvO96kDtgeyUO9SYsI2cCf2?=
 =?iso-8859-1?Q?koAhtUcRNLCTToqiHwxgrnoGypZSz4Dl85s4Y5IPF3i97xxPF6InyYxRIQ?=
 =?iso-8859-1?Q?5nW0lzIxnwfY2nlkFoHa9bplq+SAyw0wQ7Rc4NnwS3rvgq/3VwfkNMYAoY?=
 =?iso-8859-1?Q?aos00DgXkHP2/JhirUvnX8TdutQZoTgMPXOB4Yrtk3Lkdl4Ceo8KDukfh+?=
 =?iso-8859-1?Q?gTgR2QsrpV5THFHG+EZYQdGzmNiElVkPfkTWKd59H/3Ly7kZR4AVoCxr9B?=
 =?iso-8859-1?Q?6NfWdiblAGg1Saxtig/AfmwAqVsqwYNhjh1d5o5fKBhQjflfMNdQ40XTLw?=
 =?iso-8859-1?Q?RQqCAA9cjrqx8/9aC8OZ4Vp/Inlh/5YGyqBDEFpOmc2IG6KW5U23Zo9Zo5?=
 =?iso-8859-1?Q?e3p9q0PVBsKxL172IqUzUxRsgCy7w6kdr253h73l20IK+FvApJbltpfP17?=
 =?iso-8859-1?Q?1EPSwmmGar4R4yu2Efk0P4qU3IMtuBww1FmNNGecYxwMOuB/JP1WmvaJmK?=
 =?iso-8859-1?Q?vZKcQDTREtKJ6aHYj+2yHFk/dW64Iu0QKi5GcfzAiGA3xh6FmoWHOkQLIq?=
 =?iso-8859-1?Q?CfHnurxkxiHVdqPrwIawbit3OjT/sL1MQGC+vOSEbBLy7bAWpOuVmPJrVq?=
 =?iso-8859-1?Q?ZMpKZeMY7iNbfRYGXSsSiaJUIUyhg1rCI0HNbQB1ObUEvgUQL93EqxdnT+?=
 =?iso-8859-1?Q?ECWdB6XxptCrCJVRBppW3bvHfuWwqc0R9xiIvVM7FWdjNQB9YSec1jz+RR?=
 =?iso-8859-1?Q?NQ2ItHqdtSoMIwdcW2nGLZq6TN4iwBx6tpFMwZMDAZ0+S2XHj7afJQvyMg?=
 =?iso-8859-1?Q?+66j+w16pfkz0wu2rbr0azpVuq3csZRVb5uKd1zItgxK7aLRIZqfcOdqwf?=
 =?iso-8859-1?Q?a3op4a7JBTPDyldbjpkoBJjAyvWpMNX/h5LtiKG/ml/3UjzMa8WgXvIm/g?=
 =?iso-8859-1?Q?tYKXrLJ96IxSZr0Heepbs5ZGa+VE357K5DGMsUT6rR1uWOJ3aak9GffCnT?=
 =?iso-8859-1?Q?bF9p+ucYCYyk8RTKDOlpvUOE8j76WDPD4JXouGyQRhDIRRhiHcn8wCtmDB?=
 =?iso-8859-1?Q?ietXwqLnMFAnlIeQmEOHoIwG/fgVo8pQLZZ0z/74vZz3z2Sf3mz/Vt7OW5?=
 =?iso-8859-1?Q?nVyRXHPsbJFvxRDW4cyz3C6HHk60jXJcVFFCEqlcbXJsGeCaQG6Bbsow41?=
 =?iso-8859-1?Q?QXibO9rtu6PVzFSMYa2fh5V4ozwvWJzt9MEt2O+0DkmUeuS7Nf9Qex4AWu?=
 =?iso-8859-1?Q?Hjsbx0j1AwZQ6thq3xxiCrwzcs56dNZ7Ul9OzEOkxAfbl/vtf515RWVjiU?=
 =?iso-8859-1?Q?ENyv+20/c9lzpG+4oO42Torzo/lYi/GMfnUbNfFjQ9uutdXsVj+pdkEi1b?=
 =?iso-8859-1?Q?Nv8mRFV21ViEj99xt57r1bwHFg8+Ht7kTBTqmC0NExlERuyeIqDAeLrAnW?=
 =?iso-8859-1?Q?APtOmskSJcU8ttfLcN/K8RqorT9poZgNHgUVEzL1Nz+8j6gtcrqZni5tJA?=
 =?iso-8859-1?Q?iam5KoW9k9SEK3GJnfiY03hlhZN5GxFk960lGcqECLf4CBFAC8N+RK9dKh?=
 =?iso-8859-1?Q?ffcpIg/3Bk7HEj6qL/IKmFLckMDrYcKBocCMMpTG+iZ2lhkT7LC+tGtCfO?=
 =?iso-8859-1?Q?U8go+KGFGGqv+oZMkGSS0IO1GNI/NzFI9uavXjBYCnlopK17U7C0k4Pg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e4d18535-6029-4383-0ad1-08dd941f3aac
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 02:13:20.9217
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GUjP0XzELvNa1n5AQti1/0OfJOrJQ6apkY2g5h3jRjbcEKvoDtu34NFnZJk9sZcZrwdx6w9wgpsUuq4bGfypgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7677
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 3.2% regression of will-it-scale.per_thread_ops on:


commit: cec199c5e39bde7191a08087cc3d002ccfab31ff ("futex: Implement FUTEX2_NUMA")
https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git locking/futex

[test failed on linux-next/master bdd609656ff5573db9ba1d26496a528bdd297cf2]

testcase: will-it-scale
config: x86_64-rhel-9.4
compiler: gcc-12
test machine: 256 threads 2 sockets GENUINE INTEL(R) XEON(R) (Sierra Forest) with 128G memory
parameters:

	nr_task: 100%
	mode: thread
	test: futex1
	cpufreq_governor: performance


In addition to that, the commit also has significant impact on the following tests:

+------------------+---------------------------------------------------------------------------------+
| testcase: change | will-it-scale: will-it-scale.per_process_ops  4.6% regression                   |
| test machine     | 384 threads 2 sockets Intel(R) Xeon(R) 6972P (Granite Rapids) with 128G memory  |
| test parameters  | cpufreq_governor=performance                                                    |
|                  | mode=process                                                                    |
|                  | nr_task=100%                                                                    |
|                  | test=futex4                                                                     |
+------------------+---------------------------------------------------------------------------------+
| testcase: change | will-it-scale: will-it-scale.per_thread_ops  3.4% regression                    |
| test machine     | 256 threads 2 sockets GENUINE INTEL(R) XEON(R) (Sierra Forest) with 128G memory |
| test parameters  | cpufreq_governor=performance                                                    |
|                  | mode=thread                                                                     |
|                  | nr_task=100%                                                                    |
|                  | test=futex2                                                                     |
+------------------+---------------------------------------------------------------------------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202505160923.2556b729-lkp@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250516/202505160923.2556b729-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-9.4/thread/100%/debian-12-x86_64-20240206.cgz/lkp-srf-2sp1/futex1/will-it-scale

commit: 
  63e8595c06 ("futex: Allow to make the private hash immutable")
  cec199c5e3 ("futex: Implement FUTEX2_NUMA")

63e8595c060a1fef cec199c5e39bde7191a08087cc3 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
 1.079e+09 ± 58%     -45.0%  5.934e+08 ±  3%  cpuidle..time
      1.38 ± 53%      -0.7        0.64 ±  6%  mpstat.cpu.all.idle%
   4521392 ± 27%     -41.0%    2666361 ± 55%  numa-meminfo.node0.MemUsed
   3133949 ± 39%     +59.9%    5010749 ± 29%  numa-meminfo.node1.MemUsed
 1.224e+09            -3.2%  1.185e+09        will-it-scale.256.threads
   4780060            -3.2%    4627197        will-it-scale.per_thread_ops
 1.224e+09            -3.2%  1.185e+09        will-it-scale.workload
      0.04 ± 24%     -29.3%       0.03 ± 37%  perf-stat.i.major-faults
      3964 ±  2%      -3.6%       3821        perf-stat.i.minor-faults
      3964 ±  2%      -3.6%       3821        perf-stat.i.page-faults
    322627            +3.7%     334580        perf-stat.overall.path-length
      0.04 ± 24%     -30.0%       0.03 ± 36%  perf-stat.ps.major-faults
      3934 ±  2%      -3.8%       3785        perf-stat.ps.minor-faults
      3934 ±  2%      -3.8%       3785        perf-stat.ps.page-faults
      0.07 ± 26%     -39.6%       0.04 ± 36%  perf-sched.sch_delay.avg.ms.anon_pipe_read.vfs_read.ksys_read.do_syscall_64
      0.11 ± 16%     +38.2%       0.15 ± 25%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
     66.89 ±  7%     -30.1%      46.79 ± 27%  perf-sched.wait_and_delay.avg.ms.anon_pipe_read.vfs_read.ksys_read.do_syscall_64
     11.66 ± 90%    +124.7%      26.19 ± 27%  perf-sched.wait_and_delay.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.x64_sys_call
      0.22 ± 16%     +38.5%       0.30 ± 25%  perf-sched.wait_and_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
    414.50 ±  7%     +59.5%     661.00 ± 40%  perf-sched.wait_and_delay.count.anon_pipe_read.vfs_read.ksys_read.do_syscall_64
     66.83 ±  7%     -30.0%      46.75 ± 27%  perf-sched.wait_time.avg.ms.anon_pipe_read.vfs_read.ksys_read.do_syscall_64
     11.66 ± 90%    +124.7%      26.19 ± 27%  perf-sched.wait_time.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.x64_sys_call
      0.11 ± 16%     +38.2%       0.15 ± 25%  perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
     28.45            -3.5       24.98        perf-profile.calltrace.cycles-pp.get_user_pages_fast.get_futex_key.futex_wake.do_futex.__x64_sys_futex
     27.02            -3.3       23.74        perf-profile.calltrace.cycles-pp.gup_fast_fallback.get_user_pages_fast.get_futex_key.futex_wake.do_futex
     24.86            -2.4       22.46        perf-profile.calltrace.cycles-pp.gup_fast.gup_fast_fallback.get_user_pages_fast.get_futex_key.futex_wake
     22.10            -1.9       20.22        perf-profile.calltrace.cycles-pp.gup_fast_pgd_range.gup_fast.gup_fast_fallback.get_user_pages_fast.get_futex_key
     30.86            -1.0       29.84        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64.syscall
     15.86            -0.3       15.57        perf-profile.calltrace.cycles-pp.gup_fast_pte_range.gup_fast_pgd_range.gup_fast.gup_fast_fallback.get_user_pages_fast
      7.01            -0.2        6.79        perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
      3.97            -0.1        3.83        perf-profile.calltrace.cycles-pp.entry_SYSRETQ_unsafe_stack.syscall
      4.28            -0.1        4.14        perf-profile.calltrace.cycles-pp.try_get_folio.gup_fast_pte_range.gup_fast_pgd_range.gup_fast.gup_fast_fallback
      0.75            -0.1        0.62        perf-profile.calltrace.cycles-pp.is_valid_gup_args.get_user_pages_fast.get_futex_key.futex_wake.do_futex
      1.18            -0.1        1.08        perf-profile.calltrace.cycles-pp.___pte_offset_map.gup_fast_pte_range.gup_fast_pgd_range.gup_fast.gup_fast_fallback
      3.04            -0.1        2.95        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_safe_stack.syscall
      2.53            -0.0        2.50        perf-profile.calltrace.cycles-pp.testcase
      0.60            -0.0        0.58        perf-profile.calltrace.cycles-pp.syscall_return_via_sysret.syscall
      0.65            -0.0        0.63        perf-profile.calltrace.cycles-pp.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
     55.34            +1.5       56.83        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.syscall
     53.05            +1.6       54.61        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
     43.57            +1.9       45.44        perf-profile.calltrace.cycles-pp.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
     42.42            +1.9       44.33        perf-profile.calltrace.cycles-pp.do_futex.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
     41.62            +1.9       43.54        perf-profile.calltrace.cycles-pp.futex_wake.do_futex.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.05            +2.1        4.17 ±  8%  perf-profile.calltrace.cycles-pp.futex_hash.futex_wake.do_futex.__x64_sys_futex.do_syscall_64
      0.00            +3.6        3.63 ±  9%  perf-profile.calltrace.cycles-pp.__futex_hash.futex_hash.futex_wake.do_futex.__x64_sys_futex
     28.77            -3.7       25.06        perf-profile.children.cycles-pp.get_user_pages_fast
     27.11            -3.3       23.82        perf-profile.children.cycles-pp.gup_fast_fallback
     24.95            -2.4       22.56        perf-profile.children.cycles-pp.gup_fast
     22.15            -1.9       20.25        perf-profile.children.cycles-pp.gup_fast_pgd_range
     20.83            -0.7       20.14        perf-profile.children.cycles-pp.entry_SYSCALL_64
     16.00            -0.6       15.44        perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
     15.99            -0.3       15.68        perf-profile.children.cycles-pp.gup_fast_pte_range
      7.06            -0.2        6.84        perf-profile.children.cycles-pp.syscall_exit_to_user_mode
      0.77            -0.2        0.62        perf-profile.children.cycles-pp.is_valid_gup_args
      4.33            -0.1        4.18        perf-profile.children.cycles-pp.try_get_folio
      1.20            -0.1        1.10        perf-profile.children.cycles-pp.___pte_offset_map
      2.70            -0.1        2.62        perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
      2.03            -0.0        2.00        perf-profile.children.cycles-pp.testcase
      0.65            -0.0        0.63        perf-profile.children.cycles-pp.x64_sys_call
      0.65            -0.0        0.63        perf-profile.children.cycles-pp.syscall_return_via_sysret
      0.10            +0.0        0.11        perf-profile.children.cycles-pp.sysvec_thermal
      0.09            +0.0        0.10        perf-profile.children.cycles-pp.intel_thermal_interrupt
      0.10 ±  4%      +0.0        0.12 ±  4%  perf-profile.children.cycles-pp.asm_sysvec_thermal
     98.25            +0.0       98.30        perf-profile.children.cycles-pp.syscall
     55.48            +1.5       56.95        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     53.22            +1.5       54.76        perf-profile.children.cycles-pp.do_syscall_64
     43.57            +1.9       45.44        perf-profile.children.cycles-pp.__x64_sys_futex
     42.46            +1.9       44.36        perf-profile.children.cycles-pp.do_futex
     41.72            +1.9       43.64        perf-profile.children.cycles-pp.futex_wake
      2.09            +2.1        4.22 ±  8%  perf-profile.children.cycles-pp.futex_hash
      0.00            +3.7        3.67 ±  9%  perf-profile.children.cycles-pp.__futex_hash
      6.11            -1.6        4.52        perf-profile.self.cycles-pp.gup_fast_pgd_range
      2.04            -1.5        0.50 ±  5%  perf-profile.self.cycles-pp.futex_hash
      1.96            -0.7        1.29        perf-profile.self.cycles-pp.gup_fast_fallback
     15.96            -0.6       15.40        perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      1.10            -0.5        0.62        perf-profile.self.cycles-pp.get_user_pages_fast
      2.71            -0.5        2.24        perf-profile.self.cycles-pp.gup_fast
     14.25            -0.5       13.78        perf-profile.self.cycles-pp.syscall
     10.14            -0.3        9.81        perf-profile.self.cycles-pp.entry_SYSCALL_64
      6.69            -0.2        6.48        perf-profile.self.cycles-pp.syscall_exit_to_user_mode
      4.85            -0.2        4.68        perf-profile.self.cycles-pp.futex_wake
      0.72            -0.1        0.58        perf-profile.self.cycles-pp.is_valid_gup_args
      4.31            -0.1        4.17        perf-profile.self.cycles-pp.try_get_folio
      1.98            -0.1        1.91        perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      1.12            -0.1        1.05        perf-profile.self.cycles-pp.___pte_offset_map
      2.06            -0.1        1.99        perf-profile.self.cycles-pp.entry_SYSCALL_64_safe_stack
      1.75            -0.1        1.70        perf-profile.self.cycles-pp.do_syscall_64
      1.10            -0.0        1.07        perf-profile.self.cycles-pp.__x64_sys_futex
      0.78            -0.0        0.75        perf-profile.self.cycles-pp.do_futex
      0.65            -0.0        0.63        perf-profile.self.cycles-pp.syscall_return_via_sysret
      0.60            -0.0        0.58        perf-profile.self.cycles-pp.x64_sys_call
      0.19            -0.0        0.18        perf-profile.self.cycles-pp.futex_hash_put
      0.05            +0.0        0.06        perf-profile.self.cycles-pp.intel_thermal_interrupt
      0.00            +3.7        3.65 ±  9%  perf-profile.self.cycles-pp.__futex_hash
      5.84            +3.7        9.49        perf-profile.self.cycles-pp.get_futex_key


***************************************************************************************************
lkp-gnr-2ap2: 384 threads 2 sockets Intel(R) Xeon(R) 6972P (Granite Rapids) with 128G memory
=========================================================================================
compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-9.4/process/100%/debian-12-x86_64-20240206.cgz/lkp-gnr-2ap2/futex4/will-it-scale

commit: 
  63e8595c06 ("futex: Allow to make the private hash immutable")
  cec199c5e3 ("futex: Implement FUTEX2_NUMA")

63e8595c060a1fef cec199c5e39bde7191a08087cc3 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
      0.72 ±  4%      +0.1        0.82 ±  6%  mpstat.cpu.all.irq%
   2699383           -13.4%    2337183 ±  6%  numa-meminfo.node1.Shmem
    123578 ±102%    +116.6%     267679 ± 25%  numa-numastat.node1.other_node
    123578 ±102%    +116.6%     267679 ± 25%  numa-vmstat.node1.numa_other
 2.323e+09            -4.6%  2.216e+09        will-it-scale.384.processes
   6049881            -4.6%    5771879        will-it-scale.per_process_ops
 2.323e+09            -4.6%  2.216e+09        will-it-scale.workload
      2.14 ± 53%     -69.0%       0.66 ±149%  perf-sched.sch_delay.avg.ms.schedule_timeout.khugepaged_wait_work.khugepaged.kthread
      2.14 ± 53%     -69.0%       0.66 ±149%  perf-sched.sch_delay.max.ms.schedule_timeout.khugepaged_wait_work.khugepaged.kthread
    351.13 ±130%    +836.1%       3286 ± 49%  perf-sched.wait_and_delay.max.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      2.14 ± 53%     -68.9%       0.67 ±148%  perf-sched.wait_time.avg.ms.schedule_timeout.khugepaged_wait_work.khugepaged.kthread
      2.14 ± 53%     -68.9%       0.67 ±148%  perf-sched.wait_time.max.ms.schedule_timeout.khugepaged_wait_work.khugepaged.kthread
    342.14 ±135%    +860.6%       3286 ± 49%  perf-sched.wait_time.max.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
 2.319e+11            +1.8%  2.361e+11        perf-stat.i.branch-instructions
      0.92 ±  4%      -4.3%       0.88        perf-stat.i.cpi
 1.473e+12            +2.2%  1.506e+12        perf-stat.i.instructions
      1.11            +2.2%       1.14        perf-stat.i.ipc
      0.89            -1.6%       0.88        perf-stat.overall.cpi
      1.12            +1.6%       1.14        perf-stat.overall.ipc
    193483            +6.3%     205704        perf-stat.overall.path-length
  2.31e+11            +1.8%  2.353e+11        perf-stat.ps.branch-instructions
 1.468e+12            +2.3%  1.501e+12        perf-stat.ps.instructions
 4.495e+14            +1.4%  4.559e+14        perf-stat.total.instructions
      3.43 ±  2%      -0.6        2.82 ±  2%  perf-profile.calltrace.cycles-pp.futex_q_unlock.futex_wait_setup.__futex_wait.futex_wait.do_futex
     28.24            -0.6       27.62        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64.syscall
      9.46            -0.5        8.95        perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
      3.36            -0.3        3.10        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_safe_stack.syscall
      1.76            -0.1        1.68 ±  2%  perf-profile.calltrace.cycles-pp.syscall_return_via_sysret.syscall
      1.31            -0.1        1.23        perf-profile.calltrace.cycles-pp.testcase
      1.13            -0.1        1.06        perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
      2.09            -0.0        2.04        perf-profile.calltrace.cycles-pp.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
      1.64            -0.0        1.61        perf-profile.calltrace.cycles-pp.futex_hash_put.futex_wait_setup.__futex_wait.futex_wait.do_futex
      0.72            -0.0        0.70        perf-profile.calltrace.cycles-pp.entry_SYSRETQ_unsafe_stack.syscall
      2.16            +0.5        2.63        perf-profile.calltrace.cycles-pp.get_futex_key.futex_wait_setup.__futex_wait.futex_wait.do_futex
      2.92            +0.8        3.74        perf-profile.calltrace.cycles-pp.futex_q_lock.futex_wait_setup.__futex_wait.futex_wait.do_futex
     68.21            +1.1       69.32        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.syscall
     65.61            +1.1       66.75        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
     49.34            +1.8       51.14        perf-profile.calltrace.cycles-pp.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
     45.75            +2.0       47.78        perf-profile.calltrace.cycles-pp.do_futex.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
     43.36            +2.1       45.44        perf-profile.calltrace.cycles-pp.futex_wait.do_futex.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe
      3.80 ±  2%      +2.1        5.94 ±  2%  perf-profile.calltrace.cycles-pp.futex_hash.futex_wait_setup.__futex_wait.futex_wait.do_futex
     38.92            +2.3       41.20        perf-profile.calltrace.cycles-pp.__futex_wait.futex_wait.do_futex.__x64_sys_futex.do_syscall_64
     29.49            +2.6       32.08        perf-profile.calltrace.cycles-pp.futex_wait_setup.__futex_wait.futex_wait.do_futex.__x64_sys_futex
      0.00            +4.5        4.50        perf-profile.calltrace.cycles-pp.__futex_hash.futex_hash.futex_wait_setup.__futex_wait.futex_wait
      3.59 ±  2%      -0.6        2.99        perf-profile.children.cycles-pp.futex_q_unlock
     10.00            -0.6        9.43        perf-profile.children.cycles-pp.syscall_exit_to_user_mode
     16.65            -0.5       16.17        perf-profile.children.cycles-pp.entry_SYSCALL_64
      6.34            -0.3        6.08        perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      2.41            -0.2        2.23        perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
      1.44            -0.1        1.33        perf-profile.children.cycles-pp.syscall_exit_to_user_mode_prepare
      1.98            -0.1        1.89        perf-profile.children.cycles-pp.syscall_return_via_sysret
      1.51            -0.1        1.43        perf-profile.children.cycles-pp.testcase
      1.41            -0.1        1.36        perf-profile.children.cycles-pp.futex_hash_put
      2.34            -0.1        2.28        perf-profile.children.cycles-pp.x64_sys_call
      0.79            -0.0        0.74        perf-profile.children.cycles-pp.futex_setup_timer
      0.10 ±  3%      +0.0        0.12 ±  4%  perf-profile.children.cycles-pp.ktime_get_update_offsets_now
      0.16 ±  3%      +0.0        0.17 ±  2%  perf-profile.children.cycles-pp.sched_tick
      0.14 ±  9%      +0.1        0.20 ± 16%  perf-profile.children.cycles-pp.ktime_get
      0.14 ± 11%      +0.1        0.20 ± 14%  perf-profile.children.cycles-pp.clockevents_program_event
      0.34 ±  9%      +0.1        0.42 ± 12%  perf-profile.children.cycles-pp.update_process_times
      0.42 ±  8%      +0.1        0.52 ± 12%  perf-profile.children.cycles-pp.__hrtimer_run_queues
      0.42 ±  9%      +0.1        0.51 ± 13%  perf-profile.children.cycles-pp.tick_nohz_handler
      0.70 ±  7%      +0.2        0.86 ± 10%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      0.74 ±  6%      +0.2        0.90 ± 10%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      0.68 ±  7%      +0.2        0.84 ± 10%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      0.68 ±  7%      +0.2        0.84 ± 10%  perf-profile.children.cycles-pp.hrtimer_interrupt
      2.34            +0.4        2.78        perf-profile.children.cycles-pp.get_futex_key
      3.07            +0.8        3.91        perf-profile.children.cycles-pp.futex_q_lock
     66.52            +1.1       67.64        perf-profile.children.cycles-pp.do_syscall_64
     68.64            +1.1       69.76        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     49.87            +1.8       51.64        perf-profile.children.cycles-pp.__x64_sys_futex
     46.54            +2.0       48.55        perf-profile.children.cycles-pp.do_futex
     43.64            +2.1       45.70        perf-profile.children.cycles-pp.futex_wait
     39.38            +2.3       41.65        perf-profile.children.cycles-pp.__futex_wait
      3.95 ±  2%      +2.4        6.32 ±  2%  perf-profile.children.cycles-pp.futex_hash
     31.16            +2.6       33.80        perf-profile.children.cycles-pp.futex_wait_setup
      0.00            +4.7        4.74        perf-profile.children.cycles-pp.__futex_hash
      3.76 ±  2%      -2.2        1.56 ±  9%  perf-profile.self.cycles-pp.futex_hash
      3.36 ±  2%      -0.6        2.80 ±  2%  perf-profile.self.cycles-pp.futex_q_unlock
      8.55            -0.5        8.08        perf-profile.self.cycles-pp.syscall_exit_to_user_mode
      8.11            -0.4        7.75        perf-profile.self.cycles-pp.__futex_wait
     15.92            -0.4       15.56        perf-profile.self.cycles-pp.syscall
     14.12            -0.3       13.79        perf-profile.self.cycles-pp.futex_wait_setup
      4.08            -0.3        3.80        perf-profile.self.cycles-pp.entry_SYSCALL_64
      6.12            -0.2        5.88        perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      3.32            -0.2        3.09        perf-profile.self.cycles-pp.__x64_sys_futex
      3.46            -0.2        3.29        perf-profile.self.cycles-pp.futex_wait
      4.49            -0.1        4.38        perf-profile.self.cycles-pp.do_syscall_64
      1.98            -0.1        1.89        perf-profile.self.cycles-pp.syscall_return_via_sysret
      1.42            -0.1        1.33        perf-profile.self.cycles-pp.entry_SYSCALL_64_safe_stack
      1.31            -0.1        1.23        perf-profile.self.cycles-pp.testcase
      1.14            -0.1        1.07        perf-profile.self.cycles-pp.syscall_exit_to_user_mode_prepare
      3.15            -0.1        3.08        perf-profile.self.cycles-pp.do_futex
      2.07            -0.1        2.02        perf-profile.self.cycles-pp.x64_sys_call
      0.81            -0.0        0.76        perf-profile.self.cycles-pp.futex_hash_put
      0.53            -0.0        0.50        perf-profile.self.cycles-pp.futex_setup_timer
      0.10            +0.0        0.12 ±  4%  perf-profile.self.cycles-pp.ktime_get_update_offsets_now
      0.14 ± 10%      +0.1        0.19 ± 16%  perf-profile.self.cycles-pp.ktime_get
      3.69            +0.1        3.74        perf-profile.self.cycles-pp._raw_spin_lock
      2.16            +0.4        2.60        perf-profile.self.cycles-pp.get_futex_key
      2.72            +0.7        3.42        perf-profile.self.cycles-pp.futex_q_lock
      0.00            +4.5        4.52        perf-profile.self.cycles-pp.__futex_hash



***************************************************************************************************
lkp-srf-2sp1: 256 threads 2 sockets GENUINE INTEL(R) XEON(R) (Sierra Forest) with 128G memory
=========================================================================================
compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-9.4/thread/100%/debian-12-x86_64-20240206.cgz/lkp-srf-2sp1/futex2/will-it-scale

commit: 
  63e8595c06 ("futex: Allow to make the private hash immutable")
  cec199c5e3 ("futex: Implement FUTEX2_NUMA")

63e8595c060a1fef cec199c5e39bde7191a08087cc3 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
     41.17 ±  8%     -21.1%      32.50 ± 15%  perf-sched.wait_and_delay.count.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
     22531 ±  3%     +13.6%      25603 ± 18%  proc-vmstat.numa_pages_migrated
     95467 ± 22%     +48.6%     141903 ± 19%  proc-vmstat.numa_pte_updates
     22531 ±  3%     +13.6%      25603 ± 18%  proc-vmstat.pgmigrate_success
 9.212e+08            -3.4%  8.901e+08        will-it-scale.256.threads
   3598280            -3.4%    3477060        will-it-scale.per_thread_ops
 9.212e+08            -3.4%  8.901e+08        will-it-scale.workload
   7870684 ± 34%    +203.6%   23897639 ± 30%  perf-stat.i.branch-misses
     41.81 ± 55%     -20.4       21.40 ± 90%  perf-stat.i.cache-miss-rate%
      0.00 ± 34%      +0.0        0.01 ± 30%  perf-stat.overall.branch-miss-rate%
     33.72 ± 44%     -15.4       18.36 ± 69%  perf-stat.overall.cache-miss-rate%
    364549            +3.4%     376857        perf-stat.overall.path-length
   7813564 ± 34%    +204.1%   23764749 ± 30%  perf-stat.ps.branch-misses
     21.56            -2.4       19.17        perf-profile.calltrace.cycles-pp.get_user_pages_fast.get_futex_key.futex_wait_setup.__futex_wait.futex_wait
     20.55            -2.3       18.23        perf-profile.calltrace.cycles-pp.gup_fast_fallback.get_user_pages_fast.get_futex_key.futex_wait_setup.__futex_wait
     18.89            -1.6       17.27        perf-profile.calltrace.cycles-pp.gup_fast.gup_fast_fallback.get_user_pages_fast.get_futex_key.futex_wait_setup
     16.79            -1.2       15.55        perf-profile.calltrace.cycles-pp.gup_fast_pgd_range.gup_fast.gup_fast_fallback.get_user_pages_fast.get_futex_key
     23.20            -0.8       22.41        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64.syscall
     12.14            -0.6       11.58        perf-profile.calltrace.cycles-pp.gup_fast_pte_range.gup_fast_pgd_range.gup_fast.gup_fast_fallback.get_user_pages_fast
      2.72 ±  2%      -0.2        2.56        perf-profile.calltrace.cycles-pp.futex_q_unlock.futex_wait_setup.__futex_wait.futex_wait.do_futex
      4.52            -0.1        4.37        perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
      2.91 ±  2%      -0.1        2.76 ±  2%  perf-profile.calltrace.cycles-pp._raw_spin_lock.futex_wait_setup.__futex_wait.futex_wait.do_futex
      3.20            -0.1        3.10        perf-profile.calltrace.cycles-pp.try_get_folio.gup_fast_pte_range.gup_fast_pgd_range.gup_fast.gup_fast_fallback
      0.88            -0.1        0.78        perf-profile.calltrace.cycles-pp.___pte_offset_map.gup_fast_pte_range.gup_fast_pgd_range.gup_fast.gup_fast_fallback
      2.98            -0.1        2.88        perf-profile.calltrace.cycles-pp.entry_SYSRETQ_unsafe_stack.syscall
      2.58            -0.1        2.50        perf-profile.calltrace.cycles-pp.futex_q_lock.futex_wait_setup.__futex_wait.futex_wait.do_futex
      1.80            -0.1        1.74        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_safe_stack.syscall
     26.00            +0.4       26.36        perf-profile.calltrace.cycles-pp.get_futex_key.futex_wait_setup.__futex_wait.futex_wait.do_futex
     65.92            +1.1       67.00        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.syscall
     64.16            +1.1       65.30        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
     57.75            +1.4       59.10        perf-profile.calltrace.cycles-pp.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
     56.92            +1.4       58.29        perf-profile.calltrace.cycles-pp.do_futex.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
     56.20            +1.4       57.60        perf-profile.calltrace.cycles-pp.futex_wait.do_futex.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe
     54.70            +1.5       56.16        perf-profile.calltrace.cycles-pp.__futex_wait.futex_wait.do_futex.__x64_sys_futex.do_syscall_64
     46.65            +1.6       48.28        perf-profile.calltrace.cycles-pp.futex_wait_setup.__futex_wait.futex_wait.do_futex.__x64_sys_futex
      1.72 ±  7%      +1.8        3.55 ±  3%  perf-profile.calltrace.cycles-pp.futex_hash.futex_wait_setup.__futex_wait.futex_wait.do_futex
      0.00            +3.0        3.01        perf-profile.calltrace.cycles-pp.__futex_hash.futex_hash.futex_wait_setup.__futex_wait.futex_wait
     21.79            -2.6       19.24        perf-profile.children.cycles-pp.get_user_pages_fast
     20.62            -2.3       18.30        perf-profile.children.cycles-pp.gup_fast_fallback
     18.96            -1.6       17.34        perf-profile.children.cycles-pp.gup_fast
     16.82            -1.2       15.58        perf-profile.children.cycles-pp.gup_fast_pgd_range
     12.21            -0.5       11.66        perf-profile.children.cycles-pp.gup_fast_pte_range
     15.66            -0.5       15.13        perf-profile.children.cycles-pp.entry_SYSCALL_64
     12.01            -0.4       11.62        perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      2.76 ±  2%      -0.2        2.60        perf-profile.children.cycles-pp.futex_q_unlock
      4.59            -0.2        4.43        perf-profile.children.cycles-pp.syscall_exit_to_user_mode
      2.95 ±  2%      -0.1        2.80 ±  2%  perf-profile.children.cycles-pp._raw_spin_lock
      0.59            -0.1        0.47        perf-profile.children.cycles-pp.is_valid_gup_args
      0.91            -0.1        0.80        perf-profile.children.cycles-pp.___pte_offset_map
      3.24            -0.1        3.13        perf-profile.children.cycles-pp.try_get_folio
      2.62            -0.1        2.53        perf-profile.children.cycles-pp.futex_q_lock
      2.03            -0.1        1.96        perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
      0.41            -0.0        0.39        perf-profile.children.cycles-pp.try_grab_folio_fast
      0.50            -0.0        0.49        perf-profile.children.cycles-pp.testcase
      0.49            -0.0        0.47        perf-profile.children.cycles-pp.x64_sys_call
      0.49            -0.0        0.47        perf-profile.children.cycles-pp.syscall_return_via_sysret
      0.15            -0.0        0.14        perf-profile.children.cycles-pp.futex_setup_timer
      0.09            +0.0        0.10 ±  3%  perf-profile.children.cycles-pp.__sysvec_thermal
      0.09            +0.0        0.10 ±  3%  perf-profile.children.cycles-pp.intel_thermal_interrupt
     26.06            +0.4       26.43        perf-profile.children.cycles-pp.get_futex_key
     66.09            +1.1       67.16        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     64.36            +1.1       65.48        perf-profile.children.cycles-pp.do_syscall_64
     57.75            +1.4       59.10        perf-profile.children.cycles-pp.__x64_sys_futex
     56.92            +1.4       58.29        perf-profile.children.cycles-pp.do_futex
     56.22            +1.4       57.62        perf-profile.children.cycles-pp.futex_wait
     55.22            +1.4       56.67        perf-profile.children.cycles-pp.__futex_wait
     46.26            +1.7       48.00        perf-profile.children.cycles-pp.futex_wait_setup
      1.75 ±  7%      +1.8        3.57 ±  3%  perf-profile.children.cycles-pp.futex_hash
      0.00            +3.0        3.04        perf-profile.children.cycles-pp.__futex_hash
      1.71 ±  7%      -1.2        0.50 ± 23%  perf-profile.self.cycles-pp.futex_hash
      4.58            -0.7        3.88 ±  2%  perf-profile.self.cycles-pp.gup_fast_pgd_range
      1.49            -0.5        0.98 ±  2%  perf-profile.self.cycles-pp.gup_fast_fallback
     11.97            -0.4       11.59        perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      2.07            -0.4        1.69        perf-profile.self.cycles-pp.gup_fast
     11.78            -0.3       11.46        perf-profile.self.cycles-pp.syscall
      9.43            -0.3        9.12        perf-profile.self.cycles-pp.__futex_wait
      0.76            -0.3        0.47        perf-profile.self.cycles-pp.get_user_pages_fast
      7.34            -0.3        7.08        perf-profile.self.cycles-pp.gup_fast_pte_range
      7.64            -0.3        7.38        perf-profile.self.cycles-pp.entry_SYSCALL_64
      2.72 ±  2%      -0.2        2.56        perf-profile.self.cycles-pp.futex_q_unlock
      0.58            -0.1        0.44        perf-profile.self.cycles-pp.is_valid_gup_args
      4.20            -0.1        4.06        perf-profile.self.cycles-pp.syscall_exit_to_user_mode
      0.88            -0.1        0.76        perf-profile.self.cycles-pp.___pte_offset_map
      3.23            -0.1        3.11        perf-profile.self.cycles-pp.try_get_folio
      2.61            -0.1        2.52        perf-profile.self.cycles-pp.futex_q_lock
      1.53            -0.1        1.48        perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      1.54            -0.1        1.49        perf-profile.self.cycles-pp.entry_SYSCALL_64_safe_stack
      1.39            -0.0        1.35        perf-profile.self.cycles-pp.do_syscall_64
      0.41            -0.0        0.37        perf-profile.self.cycles-pp.try_grab_folio_fast
      0.86            -0.0        0.83        perf-profile.self.cycles-pp.futex_wait
      0.83            -0.0        0.80        perf-profile.self.cycles-pp.__x64_sys_futex
      0.70            -0.0        0.67        perf-profile.self.cycles-pp.do_futex
      0.45            -0.0        0.44        perf-profile.self.cycles-pp.x64_sys_call
      0.47            -0.0        0.45        perf-profile.self.cycles-pp.testcase
      0.45            -0.0        0.44        perf-profile.self.cycles-pp.syscall_return_via_sysret
      4.24            +2.9        7.17        perf-profile.self.cycles-pp.get_futex_key
      0.00            +3.0        3.03        perf-profile.self.cycles-pp.__futex_hash





Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

