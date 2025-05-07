Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7C21DE2DF
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 05:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746595670; cv=fail; b=HYeYZRktsxpOJSEHF1XWwXLTg+6rquVQrbYhzqlgVEVo+tEiYLA91k/uLCH2LfyyeWvR//P0oIqdbt26BxRLduFQHoQzu0mu8/e2leZwlBAMSd+mEh8uqDN1tCwod0+Cqc0OKNRFh9s9ucfz+f+jGvNowuP05kapiQQ9oNJDJHM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746595670; c=relaxed/simple;
	bh=cXOSC2PEJSY2QhZn2WMGrrgKC4RaFLpA9k8ZJAHvAh8=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=HEf4J5JLLUIKBShHDXE7omLejjSiMsG8c62ThDfQ51Mg1IxH8MH7FkN4DaRO32p42qupbQ0xpjMNPkMB6rJZjNmYsZV7pxCmFX3ILJbVTLdF8QQFJwuAzYeg8mmax7ZfyBangBdUsmiGKjrz+9h+PBMja6lIXvhCuIa632tT098=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XPEUDloF; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XPEUDloF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746595668; x=1778131668;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cXOSC2PEJSY2QhZn2WMGrrgKC4RaFLpA9k8ZJAHvAh8=;
  b=XPEUDloFoxYAD5DYV6DFUlX8FA2sVMKGMaIqrsk6LNMC/Sexna6qpLWi
   S0H4gpIPV0tVFnz1sV6e2fK7psJTGyLiwDqm5uH3eBbmXV0vbZdypd9ui
   BpENTRawQrjyICplhqTP0ky8meNjVqiSRqlI0kmM1AqpyvIsrpPw+j4+z
   L6+8sLAt/iWrElmvrm2Dbh2YnRKJDnA/masBS8EdoNDHceGfLPtSFvH2k
   l9l2HYhPTJRYHoRLuLG9NnsJLsNeUdIW9Kq0rGxlZppgoUcG32se3oUqP
   YjJC9d+UKPfFqF4RQB+JNQqbOUno2q4Jyy3nrBF7hlQNa1MSRGs7pcQ6U
   Q==;
X-CSE-ConnectionGUID: w287lzfJTlCf9ZC+0vBU6g==
X-CSE-MsgGUID: y7sk15T8TtqZn20vL90Vww==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="48438883"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="48438883"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 22:27:48 -0700
X-CSE-ConnectionGUID: 6hUMmCqERPC1bxTcXtOmuQ==
X-CSE-MsgGUID: 3QtaXaIVTO2R8xX+eowXpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="140575961"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 22:27:47 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 6 May 2025 22:27:46 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 6 May 2025 22:27:46 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 6 May 2025 22:27:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V7eDWgfxpyjJKaMWA1tNRTp3PNQyrE8WUOO7JA+P03WT00kBsuMJ0vOzbdUEOR8P65/ZbUrIVXs/Qr1s5oQDE6WCCDdEiDdNrsLjT2dwExpbtddJhoizZwrF7QPTIFh7W/mjWK8T3EaSQFfpQzmT98h/vlDoREoUb9u6zk50fEaYsEuNC4NrYxBNWA0DLfMO1fLhfJXlB6wg111cQWCbJ4YellkjTHRUbvy0yxIkAJqv0NQamdt322y5/ccve+16RMeZNcQLC6nTMKpTDjyroJjP4cInd2AlG/NpA51NBOMH8m+TZ+SmVQ1V36rvGIMHpT6Uk68t4/X08LkhHYd5cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AysucdjUUkldU5CX/cmS3tKJjm9MhpWwmUNaI5BNwLg=;
 b=sFqV52TOZe2TuTNHym++wM3t0sbPH0P9D8ZxJo9Se4HPWPu2LeSWEUdI1CSG5c/wyhy+X4aY+Q0TuYNXhFgKJuI8nbLtvzD6wGa9DwoXGB93AA/TuBSTyscE66fbTSwQknPYhjixi4jy0DewFT5SRpuOnhV3B6EQdQqGPEbDW6Sx30WIjkY0vQiF+6JnJW4+D2Oke/fD3EQkPy1TFigWzuMV5ip4NkT4zzvdiXlpCr6KQbfI9YMBTh8k4njDyuZskR2qTqfVAVC8ECYrlCfpfIG91Y5xnz2WBb7NVG/DrYLeBBixhvJd5p3ZviQt82DdfcDeA3/w2ulwOzdhjP9BMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
 by DS7PR11MB7888.namprd11.prod.outlook.com (2603:10b6:8:e6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.25; Wed, 7 May
 2025 05:27:41 +0000
Received: from PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a]) by PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a%6]) with mapi id 15.20.8699.012; Wed, 7 May 2025
 05:27:41 +0000
Date: Wed, 7 May 2025 13:27:33 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Bee <knaerzche@gmail.com>
CC: <oe-kbuild-all@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Heiko
 Stuebner" <heiko@sntech.de>
Subject: arch/arm64/boot/dts/rockchip/rk3368-lba3368.dtb: /mbox@ff6b0000:
 failed to match any schema with compatible: ['rockchip,rk3368-mailbox']
Message-ID: <aBrvRd/FyXRnzOWH@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0171.apcprd04.prod.outlook.com (2603:1096:4::33)
 To PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5674:EE_|DS7PR11MB7888:EE_
X-MS-Office365-Filtering-Correlation-Id: 9501c537-4552-4fcd-8f79-08dd8d27e2ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|220923002;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XYPrkrUTJ/8pnq+MKQO1npu2+hxwckSXQ1AkVGe+rVejtJplf9zw8OQHaTUL?=
 =?us-ascii?Q?tldlKdTESxS/QUzzWR2KQLH+AFd3ygSftfQlQAZomTajv5I4o6kAhflpm03Z?=
 =?us-ascii?Q?U0zrSHOWG0G45Ar9KYfpYStXpnVaPtY9tKgv8aq1tMCzOvzK2U45QFyNPifP?=
 =?us-ascii?Q?IYp8hDqmChaILE4HlHCNfXAQ48LPYlUTMKksjYszyXvqJ18k63AL/5x3Ui/b?=
 =?us-ascii?Q?DpXl0KcFXQVjV3bQPf7WgT+aAOGkG8NVV1BlOh4afAyK+VSQJJOVOdcEmeOL?=
 =?us-ascii?Q?kMHYcc5+XirbJ6mb6ojjJwAYCgrkAA8kkx2VDiR2Mm3BBstCuYE4+Pa3mgm0?=
 =?us-ascii?Q?PDMCUgRvxooVIS9ynELweD8T3g8IyY9EkJ9qxmCQuqyhJ+DYl85PH+kgUilk?=
 =?us-ascii?Q?vf1w80j5B99/Cj9ksELoOdCCJoWPqKY4iPSuK6KlFsWmI46xit4ZJfC4/ojG?=
 =?us-ascii?Q?OEFOV2Rn2AjCRoifNf1ge5jkYw5evXilOjKsmbpxvsOli2XTfBUhZPEZGpUB?=
 =?us-ascii?Q?vQ70H7l7x6E2BETnpXqd0o6vz4N7xtLmCuNbPhckUxyOpvqFkSUfwbUJGzYQ?=
 =?us-ascii?Q?iGBOMI2XgJslcyCSs+yIlsOZBCHsiXf8XKkfSh6CJI4l0y7ai+Q1I9NCmk/p?=
 =?us-ascii?Q?lIBpNxOht7yGFUJIfFiFAoPAHmSPnz159wqIc1xovxGrM3I/JV3ADVXRbiJs?=
 =?us-ascii?Q?cUDnFVhmrqsYtK/TgZStXU1ktkX/oH5bZ7QH4Vf+NpGG1mi5HEpCLtdabhWC?=
 =?us-ascii?Q?7QLYoPxV4hh5oBE5p1crFraK/Wx16HSrfAGd+Npc/L29HGoldG3cH0Ebx6R3?=
 =?us-ascii?Q?zbjO2t3SRzYYFcOghFDAr5OvR3bM2OwMmsRa0lJaA5FC5khYUB6J5qvF+Bck?=
 =?us-ascii?Q?GmK53/1hX1rdbkIJYXxzA0wN+4KutR4lVfFBHW5GrGVq3itSYUhleSfA7Y1S?=
 =?us-ascii?Q?VqhVNLoqTBXzsEaSWcT+Fel8Sif3NYIhPtJ/QjWGViqL3ish3ZCAbhcbp5K4?=
 =?us-ascii?Q?jICJwEjY8PN4NoFd2lFlHpGxYxMybucnEw6L4EHBT9QkIG+W1z+OiNZ3ritN?=
 =?us-ascii?Q?VvkkRhnfQM74hSnqyUuXxbzYoLuSpycaN4/z2bY/JJc7EUUCJMjmwdz2sxtz?=
 =?us-ascii?Q?p4zQiB/fHyut8/NAHyhPL6kDnfK0g8qUR4X2ltVV79dunEroZA1alnqd1bRi?=
 =?us-ascii?Q?0uOGWG7GuD5TZcMcnnOI9w8w5b054GkCFbj+41ZRW0Bc6WOLRWqOhkor6rdD?=
 =?us-ascii?Q?YUkm1YbtSYcqIaSM/RgFhMRIlnhvfCsXfYaCaFJI+HFMkUT3Ab+Q3LjSHiua?=
 =?us-ascii?Q?KTW3dbr5BLKJ/S89rzGtX8c9j6arTk7cH00W5rKT6S+ZLxPh+S60MITqztxb?=
 =?us-ascii?Q?qlC6A+ct7JAVGggknsH3yb2WDVbqHEWWzbZhsi+t/SlR3ExBQ+Epvouuq76B?=
 =?us-ascii?Q?Vah1qfDi9aI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5674.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(220923002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?F2kaTm4Z0zHgPjTnfFPJQ4VvKyQhQ6x1k54jxnrKhvwl16dMD02UssCeGHwB?=
 =?us-ascii?Q?lTUMZqqujr49daijJm2/LgYIWKjbjRLSf7kldZpmMmc6z9y0rwRQEXbu48A8?=
 =?us-ascii?Q?JdXkcFNNzFl4040Q94aJPZDciOQhx7ShRIV9GUyVWh0fF+pVERYQFn84rXy9?=
 =?us-ascii?Q?VvKMih7SCF/sBBRntZe1HqQQwCqU2WP4nKsHw8G57DX6ha/A53dxUc6+s68i?=
 =?us-ascii?Q?EtH1O5vkBn7PBv2GjfN7+UV6DyQQg320wkZMmQ640tcrJ36pMu/PJeQ4Wt3g?=
 =?us-ascii?Q?sFsxbAM8kqgqB2doQV2pbZ8fbqnHbbq3Zh5be0iZGKrFr4zj3XSwiTC4Wnp7?=
 =?us-ascii?Q?n/aCXNgOQnphM8ttpxAoLHpRbUdGSZ0ThN1ZXFZiV8oKpD5vEx0KNtdjS26j?=
 =?us-ascii?Q?N6b4YYgSZbqNZ8pj1pIyu2eqRnnrSg00B1yTB4511je8y1dqFCV+9lC6XNXO?=
 =?us-ascii?Q?TuS267dUKVPi3+bVOBNlZnQlUkXm5WeSuBBKbrE7Tu1c7LDAKfbdgcE5W+2/?=
 =?us-ascii?Q?gbFgVr2kCl7sZ/cOe15dswBh4VYTz4sf6L3qOpRe7eQ8yMpBkOemN5uuCjT5?=
 =?us-ascii?Q?tVF9ydF+KkVNQlcCeF1EXe4tbe20bQHc549JQesVmry2xS7HOTEzzIY5YQIQ?=
 =?us-ascii?Q?2V4y3AFIb55UuwLLjF0nNyOtg5yToJ/K7TsXnxs7YtScwbeuiDWTbwqvqS6U?=
 =?us-ascii?Q?hvScPpHXyucQd+xEUgmP6gmPkuD49a20XuuGD3igJi3rZM5KMcF4+Yz4esCZ?=
 =?us-ascii?Q?GdZeIqfSQ/Tbeg7PgZ4d3fDKSpiFY70gQqDv5SBHdFeIhEYQkoAbJJ8uVg4W?=
 =?us-ascii?Q?4YicxzeZHP6RQBQaF3MDi95PQlycKB5n9Nxk12X6Ihsv5kUwI4WG+ysvjR/W?=
 =?us-ascii?Q?HuNXnYfHucYwKjeShglD0DDLDeVeGdP0YXr3vCfh7iMVGEC2jXG0H1VXRL0E?=
 =?us-ascii?Q?aznBk6j9lbfTLW4KA3459zoTvwESgEKZH6cBwGzIoVnWh+JDFuRU4yYjnkpf?=
 =?us-ascii?Q?uMW/xcOec7saQyAiAalV2se064QQZrG/RtqQjg11JxAmg577BMJsijzfuo3g?=
 =?us-ascii?Q?dvHM5MdFM0YOAaYTPU/28Amms2zowcf1UDcc+26kzkVxhU5AOqxJqneL1oNe?=
 =?us-ascii?Q?goFMPN/+xbl3eTCtS+Ba6xris3L0OegDZB6eme2OKY+e0KK/ko8j+BzQAM6I?=
 =?us-ascii?Q?ZUMcKumk9CkFMTNWkMlJ3g2EldULaOU+i/FjQbZonrhg4palP29JJ+YlHf9+?=
 =?us-ascii?Q?C9DzPdgZ2NQgoxQxpIoP/33F6GmoSbW6mJLZjQZvwGKwDShX0SwF7jNOhHvr?=
 =?us-ascii?Q?d5HmVYVY1WAVQXHlCcfyL77mFXrb4Zl/u5N8xZ0EGiaUlqbivM4piLISrNrw?=
 =?us-ascii?Q?H+2shxoVTTFtwrdaAdidKwjnZMdtfSsjBt11ZfGrfB05jTZMo+/T5Zhd5vu3?=
 =?us-ascii?Q?EuuyIgaSA9Q40CFZX9nwuRtlJi15cGfvzbtlzGIwIQwyzpV8ASs7RE6I2UT9?=
 =?us-ascii?Q?LUKQCUGFvgxfb1rrNmRc/LSizH5QLOUZDt0J+LIsGzMxu+ANJENSHT5GFxJA?=
 =?us-ascii?Q?iswWSid0teTDe2kswBx3+xGlkwU5v6Bqy7FCbedxSRpkuMN1hPI1OroMd1zY?=
 =?us-ascii?Q?Hg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9501c537-4552-4fcd-8f79-08dd8d27e2ed
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5674.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 05:27:40.9744
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pCF0K2nhIY1/jWkyzQNMCxBztSYNSnBJi+jvGlow8809B9tuoahFBhnKoDgkuevq6uCzlkpg6y0apblJGF4LCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7888
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0d8d44db295ccad20052d6301ef49ff01fb8ae2d
commit: 7b4a8097e58b608638d416bd57469f8a9ab70e7b arm64: dts: rockchip: Add Neardi LBA3368 board
date:   11 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 11 months ago
config: arm64-randconfig-2051-20250429 (https://download.01.org/0day-ci/archive/20250507/202505070534.Scrq5oHO-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505070534.Scrq5oHO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505070534.Scrq5oHO-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3368-lba3368.dtb: /i2c@ff660000/codec@1c: failed to match any schema with compatible: ['realtek,rt5640']
>> arch/arm64/boot/dts/rockchip/rk3368-lba3368.dtb: /mbox@ff6b0000: failed to match any schema with compatible: ['rockchip,rk3368-mailbox']
   arch/arm64/boot/dts/rockchip/rk3368-lba3368.dtb: i2s-8ch@ff898000 (rockchip,rk3368-i2s): '#sound-dai-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/rockchip-i2s.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

