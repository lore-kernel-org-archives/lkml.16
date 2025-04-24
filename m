Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06E620102D
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 08:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745484010; cv=fail; b=ik6UORlVtUI1UdLr7FFhVxF1JOdW/D9zsiHLnEnR5BwV/vxg53tMQMI5s4E334yfZGUEuPQf8ZMFUs1xd5Ta7r6qrK94rHg6S3JyfEkOdP5nuFtvrqwS0KIW+SvGU3YxuocngXzGUoQbvDi55RpLUSWyWDR5i6P/kGKHuG1SCKo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745484010; c=relaxed/simple;
	bh=ENQiZQk79A38nr8ItmjaxLdMXluYIUJA/VmbA0YRCEw=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=C8is1sW8uG1TMZeunLAO5Bl0x0wpP22joyc3DFVpR+emCeivkSy/fOXc/FBE7AirWJLZLmhvBCOjS73l858WNPcXIpmmv+tDDg+7/bzVIZKZ31OtIveIXz7EN+FAMfCN+1cfQ1hkAzU+WeQx5kSQTD82212oHVHdSqx1ff7XD2k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PA3U4NOB; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PA3U4NOB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745484007; x=1777020007;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=ENQiZQk79A38nr8ItmjaxLdMXluYIUJA/VmbA0YRCEw=;
  b=PA3U4NOBMyD4ctB8CAPAtQe8kbqBcCydaDTnQeoiV2IjbjncNc0qrZwB
   so5QmqzUwx4NTggoCQtp9UruxvP2tjXrUvs34L4B8Cpgi+UdtuSegBhgP
   p+zKnLTOFJ7IVnUmqJq+yQBhMZKsn76DCzsL2RTbV4Cx27F8YXDLU3Iuo
   NQXfZv1aBQfOoeIbj8/x5RgeHqsha/OvLD0jgh/etsvoMdnFnnKJvT7NB
   FMEFHzCd3GWMycqgwbArZyjlcrSq7yYUvH3JtYu0qTUczzfiAcrduOQss
   v+hB8t4Bowqr4UxmnH6n+knEyP19XWUyf1K6JkzR2KJPQoi0qERlYy5x9
   g==;
X-CSE-ConnectionGUID: ifnWihozRAG+9mFkvx6oRg==
X-CSE-MsgGUID: 5Vd3ho7PSNSJMGvl3M4fEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="58476159"
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; 
   d="scan'208";a="58476159"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 01:40:03 -0700
X-CSE-ConnectionGUID: eQ2ESeX5SsmtEObLyu7e5Q==
X-CSE-MsgGUID: 40VMldNNTvSo1in1e/IABQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; 
   d="scan'208";a="163531772"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 01:40:01 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 24 Apr 2025 01:40:01 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 24 Apr 2025 01:40:01 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 24 Apr 2025 01:39:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v2Dhhds98WUB9Ymwt2GNkt2TBD6txAamTUmZr9anzKBsB3KHr0bKGr3nYnDGlcBl/HdUmqstxldD8j9G3tA0RJZ4m0fROwiE1s95WJaUik/IKXALNJv4uce1Ol3X5dDu+4pL1GpVn6U6jRndyfmMp8bs4nqfmpkgusPzhzE3dBFvsS1UQZxXJp3Oc6k4geG94akCJ45aRHExqGKegBQ7syExsopDjT4IjSzSkJx3mTTVu08IdQIKg3iazTQG8KxLIaNrWwqU5fqCh1x8csz+bhOKjm91X6Z0TBLGqH2gw7RQ940qmW6auYNj8O35bVlQRAJOODV7ftp63ByumJGgBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WqTi/SUlq+JjE2WSO4S2TNHe8kuCEszC65mbTxCocH0=;
 b=Gf1n5Q7/1VXXhMkx8djISHJRrWsmnZy74AV15e9dlDFnu0DlLnGY033Ikji3tNFJ5c1sryFu+Y4foEuk185dFllcTOTGMZlgkUfOnby6KW8rt5CEFnC8RcfRVKTbSKSgQ3jyKVElmVC+h3kDRV69gI2grbQAxiH8jO7PrQ/j8g7r45BEVc/n25WXCpP9yWzi2DxwuIyc6zF0+XX+/OOp6yGoc45IfsXy7k647w0Mk9sHkSPIDUzuO1TYFa0SqEkYb4fYRS/Wx4QOS05O4oAuUwqmaF5aB11LjYbiRc1GcVrxNshy6b5EEP8QhSYy4H9bmHRiQwQo9BJ9SgamjHHFuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by DM6PR11MB4594.namprd11.prod.outlook.com (2603:10b6:5:2a0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.22; Thu, 24 Apr
 2025 08:39:56 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%4]) with mapi id 15.20.8678.025; Thu, 24 Apr 2025
 08:39:55 +0000
Date: Thu, 24 Apr 2025 16:39:43 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Kairui Song <kasong@tencent.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>,
	"Huang, Ying" <ying.huang@linux.alibaba.com>, Baoquan He <bhe@redhat.com>,
	Barry Song <v-songbaohua@oppo.com>, Hugh Dickens <hughd@google.com>,
	"Johannes Weiner" <hannes@cmpxchg.org>, Kalesh Singh
	<kaleshsingh@google.com>, Nhat Pham <nphamcs@gmail.com>, Ryan Roberts
	<ryan.roberts@arm.com>, Yosry Ahmed <yosryahmed@google.com>,
	<linux-mm@kvack.org>, <oliver.sang@intel.com>
Subject: [linus:master] [mm, swap]  7277433096:  swapin.throughput 33.0%
 regression
Message-ID: <202504241621.f27743ec-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0032.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::12) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|DM6PR11MB4594:EE_
X-MS-Office365-Filtering-Correlation-Id: 330ec4c2-2294-4e2f-2cf2-08dd830b96d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?7X/deGGNaplAujv15pcgRyE0hxF3wRmV6tyufGLaPszoz87hx9pG2/O7si?=
 =?iso-8859-1?Q?Ao/rqJl5QKgng9xDhP+27PAluiS067voR/33HyBNxuSBQLbb6oHloq4qjd?=
 =?iso-8859-1?Q?+yorCbKVfo1gP8I0WDnWAJLJBZYoegXLDFigFCDGAFzLH9ZLQurVPTAd1F?=
 =?iso-8859-1?Q?SC+knE+hFHK1mttlyPxFWgXPy84MaIJgSPybiZ7EhmWHyjV/t2IvpVMlvB?=
 =?iso-8859-1?Q?IMUxwOwCdyAEz3o4ypqPT/KJXi4VdbivWw592pmFOy+z6frZgNgT30C7a0?=
 =?iso-8859-1?Q?Am6BaoIzmwEiEALhrX1pK9AjOCYhibesPnX3axz+MP+OmN6lIfiORXkPsf?=
 =?iso-8859-1?Q?VM0di+6PP1oM8m4l/SeuGjyDYCed07qfgcrWZc/qhgCOTyqnmarFZhIrHq?=
 =?iso-8859-1?Q?P6jcEzEK7d6f1DIcnyx21MFfE8zwtBeAYuOcPowX05Lxp2uFs/9mirJwQn?=
 =?iso-8859-1?Q?i8cl6QAnN7mLiV+bZ3YWXYZDPqZJPDgucCQzzo4Es+k6v9gMPbQlYv9lLA?=
 =?iso-8859-1?Q?0L9C5tA8vcweuig/bOGpSlStqPDuLqaYy/kplgnWEg/jwJep9NAwxZdgoF?=
 =?iso-8859-1?Q?QNQgQIPosdITH2PZpiYNL5eivVO3noUuk0VRuJnRuJ88TkuPuo94OYtiaJ?=
 =?iso-8859-1?Q?cJeAEoOt0nU/loe3mHfVBPi9/YMzPftdUjnD4npXz6dpXnaIXkVLTEw0yt?=
 =?iso-8859-1?Q?wdFNc1zy5PaQMaLFPoVAKyMBw6rGKCHcYsa8aPtfV8YO2D9SDCQJq6pnVi?=
 =?iso-8859-1?Q?EA5H7cU8E5RFRmK7m2C1jT7hIO2/1bz3P4wQB4/wbUMJtr1iOiNPK8daRq?=
 =?iso-8859-1?Q?omEsnWqkCXrXP2/KoorBGxDVv+47ZdB7cRYOL2EYsA/kE6XR36BoKdlO7F?=
 =?iso-8859-1?Q?OQnJHqZD1Fem/RodwkEhbrYW4bq8fg1paARgbMaXd5ISnTqQyTlWvK5Gdb?=
 =?iso-8859-1?Q?PqA5rup2pU3cTuyoMt08c81U7kJXSt0BrCddO1o6rYjL1FCPuSwGCq6Qwv?=
 =?iso-8859-1?Q?h/o9xZZsu/yf9Nvo5l1pbI3LmXOHhhkePoQJijGtF/aifrhc2DrweUqBYP?=
 =?iso-8859-1?Q?75IX1gbrGvk9IrSjnmtca1PPgOk8+TDSeYIZLVe0DpglccjpMehqOUa398?=
 =?iso-8859-1?Q?o6X2EIelWCWO/Cc9U4rGQvW/2Pf33tKYdi3fg9QIcEwD0eV/1/pROa6kGu?=
 =?iso-8859-1?Q?rBJBPDTCcKqOd7rGVM3C5/nGlFGkd+dkSxuEV3gSRC3H9jNSOk8EWeoFAB?=
 =?iso-8859-1?Q?6w4pSPXealWM2AzTn0WKBadHQiuddSiac+x2KqHrF+FjDlJ1xbAggHISsL?=
 =?iso-8859-1?Q?9fcSKwosYywYhdH+wW6nu7Z82c6wnk/grKNlXkL0gfSX97jyq7zTZB16F9?=
 =?iso-8859-1?Q?X6HARdbkS18msmLU/biAiBzPlcFVi4o8SN9QLbXD7GNy/ulFHoJr1vB2H+?=
 =?iso-8859-1?Q?/FPeZ8vfo6/DU0Ds?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?+m8WznKTzTqH8JnWAV/C5X332wwl8gRGuvXgJUh55te3iIlHXF2R3AqVJe?=
 =?iso-8859-1?Q?HUjo8EN277Kfj13PZHonUCjO1rvmWnss6XGrvJOTGWy5N+xnWeub7UQFVO?=
 =?iso-8859-1?Q?Sr+3QJAvSijDszFzcufIrfiuVrLVdjV9yuQA3iJ2NumQAvjJ7rGkQZhlPA?=
 =?iso-8859-1?Q?eTna3cGCxnApLMWypHd69KXkkOwBLQgnLsUIXiKs/gXN8rCB2/K+5oRcKb?=
 =?iso-8859-1?Q?uJzxSenuqRFkdqyfKSQtbdLpjcklVszW9QXysmx5ZHg3XNf+c7GnKhrhq1?=
 =?iso-8859-1?Q?s8OpV/4eiL/sb3xSy/uNLFTf4lr6ZhQ12D63sLGPGKoRdDQG2su39p7Xz4?=
 =?iso-8859-1?Q?tPdunx+MXhDVBLfcWwOko5CSafClYOYcYrrdk2aveAk/3fpYHj4glz2WRb?=
 =?iso-8859-1?Q?Wnz3n7PmfNcgT5/sSNZU+XsSWYvLH87Fsz8rCro7tx7lcbl48Fa6RPTSWm?=
 =?iso-8859-1?Q?Aahsx5SvcLzc0H7u0iTXrEyouvORjEqtY4dyDfMbE56ZdzmoMsK7YVVqmK?=
 =?iso-8859-1?Q?S9os59LCymQf2KzGUFkwDmTbehtixXWiyA3nJkbhBQ6+kNW1RBz/haSKbb?=
 =?iso-8859-1?Q?9eTwBrCogSKgDM2TxMtUx4iWmwQ7olEQ0qShNArIx8kevrulzY8SKPeAUd?=
 =?iso-8859-1?Q?gb1DLtQ6OC1L/5Osmr0YV5SHf8JszWuXuyQFHaGyc+lB7snJNYa5fX2rna?=
 =?iso-8859-1?Q?SRaXeSNY+qwScpm5/0DzDlpfWFrZIg5SR9cz7QV+CUGcAVwZgi1aaD+d6F?=
 =?iso-8859-1?Q?E8Ap+5VyXrZ3U4HYWH+lZAv8VsD0OfbjgkCabQpX6SxhSzpp8Hphr1Lzdt?=
 =?iso-8859-1?Q?mPA1j12YCmFtkcjrxRKIhw0biLNyRwa0mcs08WD5ntSQjC61cDPG+xCYaY?=
 =?iso-8859-1?Q?Bg8SzlvYiesQABneqO7JLP+VeXcm0unDb+Poenl1+5qZbde2G7XQg+vQ8/?=
 =?iso-8859-1?Q?O84FQgPyyZr+sS/CQKVxO0gGpO9ngzEJ9R17fjU6mYuPAOxofgYKI0zztm?=
 =?iso-8859-1?Q?vuy5gA/nzXY2+KVFVjo9OQU+fxJaW5z6C/E4kEEdN6rz5WQtZtFYTWL3IT?=
 =?iso-8859-1?Q?TdqIah6sLtwdVdIHrKnVaDksA48l6IGJapnjWkxYWgi03QvcQJi5izeg82?=
 =?iso-8859-1?Q?ChWumB78SUHmd2ID66utJJ0CEPjtSTTEDVIBa9XWhtPUJjLnmuPLwLgvUp?=
 =?iso-8859-1?Q?ushWJzScA+mUNwLNREfRx8/qzJupJJ+UrkXs8/B3PVXUKdM3ApF2sj5ElJ?=
 =?iso-8859-1?Q?OeNa/YfT2yTDxFJ6n9qQGx5COrLIWZVWt6Gig7by9rkH3YwnGs2ONe0Jj2?=
 =?iso-8859-1?Q?kAuAQoqPvSJgn0202IItN9luRjg36870BcASH9i9Vpqq7kmS0jka/rNMm6?=
 =?iso-8859-1?Q?7f6cR16Oow9gNZaS8MrFqBuTHN23hBDXX8STQEU0Tc2tJN1R4OGYiEYPUI?=
 =?iso-8859-1?Q?lCoMkB0oiTmd+mMGXli1br1PRRbkXH5T0z7Uvbbym5Q0cN+nPX3dvaCLbG?=
 =?iso-8859-1?Q?6oaDsoKWiUBmSM1ACUbRY0xWXS6F+nwm6mbEESTWP0T45ssUA+RY3SUSh2?=
 =?iso-8859-1?Q?Lx2lEY887wOY1dDpR34RrTbkjDJ952MkuWcJESpyeXd4AIbLMWDdo8VQqu?=
 =?iso-8859-1?Q?WYDRg4svwxGtvvjLR5LgIeNCh43WUOakIieFtzw+yFffXPD1TP1WA2Nw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 330ec4c2-2294-4e2f-2cf2-08dd830b96d7
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 08:39:55.9214
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +2wXpgUjQMHo7qFYeEbwfegKn68zkKieRTLh7jXusDvX8M9mGifvLkVgxIMpmy4bEhmAP4Faxhl8uzaNKvWwDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4594
X-OriginatorOrg: intel.com



Hello,


note:
from commit message, this regression should be expected. we still make out this
report FYI what's the possible impact of this change.

below details just FYI.


kernel test robot noticed a 33.0% regression of swapin.throughput on:


commit: 7277433096f6ce4a84a1620529ac4ba3e1041ee1 ("mm, swap: remove old allocation path for HDD")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

[still regression on linus/master      bc3372351d0c8b2726b7d4229b878342e3e6b0e8]
[still regression on linux-next/master 6ac908f24cd7ddae52c496bbc888e97ee7b033ac]

testcase: swapin
config: x86_64-rhel-9.4
compiler: gcc-12
test machine: 16 threads 1 sockets Intel(R) Xeon(R) E-2278G CPU @ 3.40GHz (Coffee Lake-E) with 32G memory
parameters:

	disk: 1HDD
	size: 8G
	nr_task: 8
	cpufreq_governor: performance


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202504241621.f27743ec-lkp@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250424/202504241621.f27743ec-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/disk/kconfig/nr_task/rootfs/size/tbox_group/testcase:
  gcc-12/performance/1HDD/x86_64-rhel-9.4/8/debian-12-x86_64-20240206.cgz/8G/lkp-cfl-e1/swapin

commit: 
  e027ec414f ("mm, swap: fold swap_info_get_cont in the only caller")
  7277433096 ("mm, swap: remove old allocation path for HDD")

e027ec414fe8f540 7277433096f6ce4a84a1620529a 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
 5.409e+09           +51.8%  8.212e+09 ±  5%  cpuidle..time
   1037299           +18.5%    1228926 ± 12%  cpuidle..usage
     68.75            +9.2%      75.07 ±  2%  iostat.cpu.idle
     30.53 ±  2%     -19.8%      24.47 ±  8%  iostat.cpu.iowait
    797.42 ±  4%     +22.0%     972.57 ±  7%  uptime.boot
      9703 ±  4%     +26.4%      12265 ±  8%  uptime.idle
     20243 ± 57%    +248.6%      70559 ± 30%  meminfo.Inactive
     20238 ± 57%    +248.6%      70559 ± 30%  meminfo.Inactive(anon)
     24668           +11.3%      27444        meminfo.Shmem
      0.01 ± 14%     +33.3%       0.02 ±  5%  perf-sched.sch_delay.avg.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      7023 ±  3%     -13.1%       6105 ±  8%  perf-sched.total_wait_and_delay.count.ms
      4615 ±  4%     -18.8%       3747 ± 12%  perf-sched.wait_and_delay.count.io_schedule.folio_wait_bit_common.__folio_lock_or_retry.do_swap_page
     68.63            +6.4       75.02 ±  2%  mpstat.cpu.all.idle%
     30.66 ±  2%      -6.1       24.54 ±  8%  mpstat.cpu.all.iowait%
      0.09            -0.0        0.06 ±  4%  mpstat.cpu.all.irq%
      0.05            -0.0        0.04 ±  3%  mpstat.cpu.all.soft%
      0.28            -0.1        0.20 ±  5%  mpstat.cpu.all.sys%
      0.29 ± 21%      -0.1        0.15 ±  4%  mpstat.cpu.all.usr%
      0.09 ± 12%      -8.7%       0.08        swapin.free_time
      3435 ±  2%     -33.7%       2277 ±  5%  swapin.median
     47.13 ±  6%      +8.4       55.50 ±  7%  swapin.stddev%
     26855 ±  2%     -33.0%      18001 ±  5%  swapin.throughput
    339.27           +51.6%     514.32 ±  5%  swapin.time.elapsed_time
    339.27           +51.6%     514.32 ±  5%  swapin.time.elapsed_time.max
     12785           +51.4%      19352 ±  5%  swapin.time.minor_page_faults
     68.81            +9.1%      75.06 ±  2%  vmstat.cpu.id
     30.57 ±  2%     -19.6%      24.56 ±  8%  vmstat.cpu.wa
     24857           -33.8%      16465 ±  5%  vmstat.io.bi
      1.30 ±  5%      -7.1%       1.21 ±  5%  vmstat.procs.r
     24857           -33.8%      16465 ±  5%  vmstat.swap.si
      7.12 ±  7%     -31.6%       4.87 ± 14%  vmstat.swap.so
      2401           -28.3%       1721 ±  3%  vmstat.system.cs
      2399           -24.5%       1811 ±  2%  vmstat.system.in
    936464            +6.4%     996818        proc-vmstat.nr_active_anon
    922127            +8.3%     998395        proc-vmstat.nr_anon_pages
    612143            -1.2%     605002        proc-vmstat.nr_dirty_background_threshold
   1225784            -1.2%    1211485        proc-vmstat.nr_dirty_threshold
   1803299            +3.7%    1869638        proc-vmstat.nr_file_pages
   6195937            -1.2%    6124422        proc-vmstat.nr_free_pages
      5059 ± 57%    +248.6%      17639 ± 30%  proc-vmstat.nr_inactive_anon
      5486            -1.4%       5410        proc-vmstat.nr_page_table_pages
      6172           +11.2%       6866        proc-vmstat.nr_shmem
     14607            +5.3%      15384        proc-vmstat.nr_slab_unreclaimable
    920671            +7.1%     986314 ±  2%  proc-vmstat.nr_swapcached
   4413040            +1.8%    4493858        proc-vmstat.nr_vmscan_write
    936464            +6.4%     996818        proc-vmstat.nr_zone_active_anon
      5059 ± 57%    +248.6%      17639 ± 30%  proc-vmstat.nr_zone_inactive_anon
   2535302            +5.8%    2682756        proc-vmstat.numa_hit
   2535395            +5.8%    2681644        proc-vmstat.numa_local
   2543613            +5.9%    2694193        proc-vmstat.pgalloc_normal
   2629484            +8.0%    2838539        proc-vmstat.pgfault
   2520197            +6.0%    2672439        proc-vmstat.pgfree
    293008            -6.8%     273047        proc-vmstat.pgmajfault
     25587 ±  2%     +41.3%      36143 ±  5%  proc-vmstat.pgreuse
    933820            +8.8%    1015820        proc-vmstat.swap_ra
    919094            +9.8%    1008935        proc-vmstat.swap_ra_hit
     16587            -4.3%      15880        proc-vmstat.workingset_nodes
   1088601            +7.4%    1169575        proc-vmstat.workingset_refault_anon
 2.328e+08 ± 24%     -43.2%  1.323e+08 ± 30%  sched_debug.cfs_rq:/.avg_vruntime.max
  62177217 ± 36%     -43.0%   35460373 ± 30%  sched_debug.cfs_rq:/.avg_vruntime.stddev
 2.328e+08 ± 24%     -43.2%  1.323e+08 ± 30%  sched_debug.cfs_rq:/.min_vruntime.max
  62177217 ± 36%     -43.0%   35460373 ± 30%  sched_debug.cfs_rq:/.min_vruntime.stddev
    210.52 ± 63%    +130.6%     485.44 ± 32%  sched_debug.cfs_rq:/.removed.load_avg.max
      4.68 ± 79%    +185.3%      13.36 ± 37%  sched_debug.cfs_rq:/.removed.runnable_avg.avg
     69.33 ± 72%    +195.8%     205.12 ± 38%  sched_debug.cfs_rq:/.removed.runnable_avg.max
     17.15 ± 74%    +192.5%      50.18 ± 38%  sched_debug.cfs_rq:/.removed.runnable_avg.stddev
      4.58 ± 84%    +188.0%      13.19 ± 37%  sched_debug.cfs_rq:/.removed.util_avg.avg
     67.72 ± 77%    +200.5%     203.49 ± 37%  sched_debug.cfs_rq:/.removed.util_avg.max
     16.76 ± 79%    +196.5%      49.70 ± 37%  sched_debug.cfs_rq:/.removed.util_avg.stddev
     35.31 ± 24%     -40.4%      21.03 ± 31%  sched_debug.cfs_rq:/.runnable_avg.min
    167.49 ±  2%     -23.7%     127.74 ± 12%  sched_debug.cfs_rq:/.util_avg.avg
    602113 ±  5%     +16.6%     702121 ±  8%  sched_debug.cpu.clock.avg
    602114 ±  5%     +16.6%     702121 ±  8%  sched_debug.cpu.clock.max
    602112 ±  5%     +16.6%     702120 ±  8%  sched_debug.cpu.clock.min
    601358 ±  5%     +16.6%     701428 ±  8%  sched_debug.cpu.clock_task.avg
    601962 ±  5%     +16.6%     701955 ±  8%  sched_debug.cpu.clock_task.max
    597107 ±  5%     +16.9%     698032 ±  8%  sched_debug.cpu.clock_task.min
      1227 ±  5%     -16.4%       1026 ± 10%  sched_debug.cpu.clock_task.stddev
      4030 ±  3%     +33.1%       5364 ±  2%  sched_debug.cpu.curr->pid.max
      1037 ±  5%     +28.9%       1336 ±  3%  sched_debug.cpu.curr->pid.stddev
     46279 ±  5%     -19.9%      37088 ±  2%  sched_debug.cpu.nr_switches.avg
    602113 ±  5%     +16.6%     702121 ±  8%  sched_debug.cpu_clk
    601390 ±  5%     +16.6%     701418 ±  8%  sched_debug.ktime
    602514 ±  5%     +16.6%     702513 ±  8%  sched_debug.sched_clk
     50.92 ±  3%     +13.3%      57.67 ±  2%  perf-stat.i.MPKI
  96852867 ± 12%     -41.7%   56470262 ±  4%  perf-stat.i.branch-instructions
      3.59 ±  2%      -0.2        3.39        perf-stat.i.branch-miss-rate%
   4517791 ± 19%     -46.8%    2401426 ±  4%  perf-stat.i.branch-misses
     45.08            +3.6       48.70        perf-stat.i.cache-miss-rate%
  11444503           -25.3%    8552014 ±  5%  perf-stat.i.cache-misses
  26646448           -30.4%   18535433 ±  3%  perf-stat.i.cache-references
      2380           -28.5%       1703 ±  3%  perf-stat.i.context-switches
      1.99 ±  2%      +4.4%       2.08        perf-stat.i.cpi
 6.453e+08 ±  7%     -36.1%  4.124e+08 ±  4%  perf-stat.i.cpu-cycles
     37.44 ±  3%     -29.0%      26.60 ±  3%  perf-stat.i.cpu-migrations
     74.34 ±  4%     -18.6%      60.51 ±  4%  perf-stat.i.cycles-between-cache-misses
 4.335e+08 ± 14%     -42.5%  2.493e+08 ±  4%  perf-stat.i.instructions
      0.56 ±  3%      -7.2%       0.52        perf-stat.i.ipc
    865.19           -38.4%     532.92 ±  5%  perf-stat.i.major-faults
      6605           -27.4%       4795 ±  3%  perf-stat.i.minor-faults
      7470           -28.7%       5328 ±  4%  perf-stat.i.page-faults
      4.62 ±  6%      -1.1        3.55 ± 44%  perf-stat.overall.branch-miss-rate%
     56.43 ±  6%     -28.5%      40.36 ± 44%  perf-stat.overall.cycles-between-cache-misses
      0.67 ±  6%     -24.7%       0.50 ± 44%  perf-stat.overall.ipc
  96637819 ± 12%     -51.6%   46743598 ± 45%  perf-stat.ps.branch-instructions
   4506778 ± 19%     -55.9%    1988844 ± 45%  perf-stat.ps.branch-misses
  11410417           -38.1%    7059671 ± 45%  perf-stat.ps.cache-misses
  26570647           -42.3%   15341807 ± 44%  perf-stat.ps.cache-references
      2373           -40.5%       1411 ± 44%  perf-stat.ps.context-switches
 6.442e+08 ±  7%     -47.0%  3.417e+08 ± 44%  perf-stat.ps.cpu-cycles
     37.34 ±  3%     -41.0%      22.03 ± 44%  perf-stat.ps.cpu-migrations
 4.326e+08 ± 14%     -52.3%  2.064e+08 ± 45%  perf-stat.ps.instructions
    862.62           -49.0%     440.19 ± 45%  perf-stat.ps.major-faults
      6586           -39.8%       3967 ± 44%  perf-stat.ps.minor-faults
      7449           -40.8%       4407 ± 44%  perf-stat.ps.page-faults
      6.51 ±  7%      -1.2        5.26 ±  5%  perf-profile.calltrace.cycles-pp.do_access
      5.54 ±  6%      -1.0        4.54 ±  5%  perf-profile.calltrace.cycles-pp.asm_exc_page_fault.do_access
      4.94 ±  5%      -0.9        4.03 ±  6%  perf-profile.calltrace.cycles-pp.exc_page_fault.asm_exc_page_fault.do_access
      4.90 ±  5%      -0.9        4.02 ±  6%  perf-profile.calltrace.cycles-pp.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.do_access
      4.62 ±  6%      -0.9        3.74 ±  7%  perf-profile.calltrace.cycles-pp.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.do_access
      4.46 ±  6%      -0.8        3.62 ±  7%  perf-profile.calltrace.cycles-pp.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      4.33 ±  7%      -0.8        3.54 ±  8%  perf-profile.calltrace.cycles-pp.do_swap_page.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.exc_page_fault
      2.25 ± 11%      -0.4        1.86 ± 10%  perf-profile.calltrace.cycles-pp.handle_edge_irq.__common_interrupt.common_interrupt.asm_common_interrupt.cpuidle_enter_state
      2.26 ± 11%      -0.4        1.87 ± 10%  perf-profile.calltrace.cycles-pp.__common_interrupt.common_interrupt.asm_common_interrupt.cpuidle_enter_state.cpuidle_enter
      2.20 ± 12%      -0.4        1.83 ± 10%  perf-profile.calltrace.cycles-pp.handle_irq_event.handle_edge_irq.__common_interrupt.common_interrupt.asm_common_interrupt
      0.82 ± 13%      -0.1        0.69 ±  7%  perf-profile.calltrace.cycles-pp.ahci_handle_port_intr.ahci_single_level_irq_intr.__handle_irq_event_percpu.handle_irq_event.handle_edge_irq
      4.14 ±  3%      +0.2        4.39        perf-profile.calltrace.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.rest_init.start_kernel
      4.22 ±  3%      +0.3        4.49        perf-profile.calltrace.cycles-pp.cpu_startup_entry.rest_init.start_kernel.x86_64_start_reservations.x86_64_start_kernel
      4.22 ±  3%      +0.3        4.49        perf-profile.calltrace.cycles-pp.rest_init.start_kernel.x86_64_start_reservations.x86_64_start_kernel.common_startup_64
      4.22 ±  3%      +0.3        4.49        perf-profile.calltrace.cycles-pp.start_kernel.x86_64_start_reservations.x86_64_start_kernel.common_startup_64
      4.22 ±  3%      +0.3        4.49        perf-profile.calltrace.cycles-pp.x86_64_start_kernel.common_startup_64
      4.22 ±  3%      +0.3        4.49        perf-profile.calltrace.cycles-pp.x86_64_start_reservations.x86_64_start_kernel.common_startup_64
      4.22 ±  3%      +0.3        4.49        perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.rest_init.start_kernel.x86_64_start_reservations
      3.73 ±  5%      +0.3        4.05 ±  2%  perf-profile.calltrace.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.rest_init
     83.48            +1.2       84.68        perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.common_startup_64
     83.50            +1.2       84.74        perf-profile.calltrace.cycles-pp.start_secondary.common_startup_64
     83.50            +1.2       84.74        perf-profile.calltrace.cycles-pp.cpu_startup_entry.start_secondary.common_startup_64
     87.73            +1.5       89.22        perf-profile.calltrace.cycles-pp.common_startup_64
      7.69 ±  7%      -1.4        6.28 ±  6%  perf-profile.children.cycles-pp.do_access
      6.07 ±  5%      -1.0        5.08 ±  3%  perf-profile.children.cycles-pp.asm_exc_page_fault
      5.40 ±  5%      -0.9        4.52 ±  3%  perf-profile.children.cycles-pp.exc_page_fault
      5.37 ±  5%      -0.9        4.50 ±  3%  perf-profile.children.cycles-pp.do_user_addr_fault
      4.44 ±  7%      -0.8        3.60 ±  7%  perf-profile.children.cycles-pp.do_swap_page
      5.05 ±  6%      -0.8        4.22 ±  4%  perf-profile.children.cycles-pp.handle_mm_fault
      4.88 ±  6%      -0.8        4.07 ±  5%  perf-profile.children.cycles-pp.__handle_mm_fault
      3.56 ±  6%      -0.6        2.95 ±  7%  perf-profile.children.cycles-pp.common_interrupt
      3.56 ±  6%      -0.6        2.96 ±  7%  perf-profile.children.cycles-pp.asm_common_interrupt
      2.48 ± 11%      -0.5        1.97 ± 10%  perf-profile.children.cycles-pp.handle_edge_irq
      2.49 ± 11%      -0.5        1.98 ± 10%  perf-profile.children.cycles-pp.__common_interrupt
      2.42 ± 11%      -0.5        1.93 ± 10%  perf-profile.children.cycles-pp.handle_irq_event
      2.39 ± 12%      -0.5        1.91 ±  9%  perf-profile.children.cycles-pp.__handle_irq_event_percpu
      2.37 ± 13%      -0.5        1.90 ±  9%  perf-profile.children.cycles-pp.ahci_single_level_irq_intr
      1.17 ± 12%      -0.3        0.90 ± 11%  perf-profile.children.cycles-pp.__schedule
      0.74 ±  8%      -0.2        0.49 ± 14%  perf-profile.children.cycles-pp.__folio_lock_or_retry
      0.78 ± 13%      -0.2        0.55 ± 12%  perf-profile.children.cycles-pp.schedule
      0.64 ±  9%      -0.2        0.43 ± 15%  perf-profile.children.cycles-pp.io_schedule
      0.68 ±  7%      -0.2        0.47 ± 15%  perf-profile.children.cycles-pp.folio_wait_bit_common
      0.93 ± 12%      -0.2        0.74 ±  5%  perf-profile.children.cycles-pp.ahci_handle_port_intr
      0.89 ±  9%      -0.2        0.74 ±  7%  perf-profile.children.cycles-pp.scsi_end_request
      0.89 ±  9%      -0.1        0.74 ±  8%  perf-profile.children.cycles-pp.scsi_io_completion
      0.44 ± 21%      -0.1        0.30 ± 13%  perf-profile.children.cycles-pp.blk_mq_dispatch_rq_list
      0.20 ± 20%      -0.1        0.09 ± 33%  perf-profile.children.cycles-pp.xas_load
      0.20 ± 24%      -0.1        0.10 ± 29%  perf-profile.children.cycles-pp.filemap_get_entry
      0.25 ± 14%      -0.1        0.16 ± 19%  perf-profile.children.cycles-pp.ahci_handle_port_interrupt
      0.24 ± 12%      -0.1        0.15 ± 17%  perf-profile.children.cycles-pp.sata_async_notification
      0.23 ± 12%      -0.1        0.14 ± 17%  perf-profile.children.cycles-pp.ahci_scr_read
      0.20 ± 21%      -0.1        0.11 ± 25%  perf-profile.children.cycles-pp.ata_scsi_queuecmd
      0.20 ± 24%      -0.1        0.12 ± 23%  perf-profile.children.cycles-pp.scsi_dispatch_cmd
      0.22 ± 22%      -0.1        0.14 ± 27%  perf-profile.children.cycles-pp.seq_read_iter
      0.21 ± 11%      +0.1        0.29 ± 19%  perf-profile.children.cycles-pp.__mmput
      0.17 ± 15%      +0.1        0.26 ± 15%  perf-profile.children.cycles-pp.do_pte_missing
      0.14 ± 20%      +0.1        0.23 ± 20%  perf-profile.children.cycles-pp.filemap_map_pages
      0.20 ± 13%      +0.1        0.29 ± 19%  perf-profile.children.cycles-pp.exit_mmap
      0.20 ± 18%      +0.1        0.29 ± 14%  perf-profile.children.cycles-pp.leave_mm
      0.15 ± 18%      +0.1        0.24 ± 23%  perf-profile.children.cycles-pp.do_read_fault
      0.24 ± 25%      +0.1        0.39 ± 19%  perf-profile.children.cycles-pp.rb_next
      0.40 ± 35%      +0.2        0.57 ± 22%  perf-profile.children.cycles-pp.ret_from_fork_asm
      0.63 ± 11%      +0.2        0.86 ± 12%  perf-profile.children.cycles-pp.__hrtimer_next_event_base
      4.22 ±  3%      +0.3        4.49        perf-profile.children.cycles-pp.rest_init
      4.22 ±  3%      +0.3        4.49        perf-profile.children.cycles-pp.start_kernel
      4.22 ±  3%      +0.3        4.49        perf-profile.children.cycles-pp.x86_64_start_kernel
      4.22 ±  3%      +0.3        4.49        perf-profile.children.cycles-pp.x86_64_start_reservations
     83.50            +1.2       84.74        perf-profile.children.cycles-pp.start_secondary
     85.97            +1.4       87.32        perf-profile.children.cycles-pp.cpuidle_idle_call
     87.73            +1.5       89.22        perf-profile.children.cycles-pp.common_startup_64
     87.73            +1.5       89.22        perf-profile.children.cycles-pp.cpu_startup_entry
     87.72            +1.5       89.22        perf-profile.children.cycles-pp.do_idle
      2.06 ±  6%      -0.3        1.71 ± 12%  perf-profile.self.cycles-pp.do_access
      0.23 ± 12%      -0.1        0.14 ± 17%  perf-profile.self.cycles-pp.ahci_scr_read
      0.12 ± 29%      -0.1        0.04 ±101%  perf-profile.self.cycles-pp.xas_load
      0.22 ± 17%      +0.1        0.28 ± 12%  perf-profile.self.cycles-pp.update_rq_clock_task
      0.24 ± 26%      +0.1        0.38 ± 19%  perf-profile.self.cycles-pp.rb_next




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

