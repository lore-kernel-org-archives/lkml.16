Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C741D23A6
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 02:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750040535; cv=fail; b=jkW8pfPHDr+AU4hUohcPn6eEgyXwJ7t/c9shp3Cquyz8JpXVc3/47JF6oSllxv9rVG7wrecYTl2ww40CVV3v881Q7dbnrv58vtPjoHFGNF/JZjCQ1aSi0sy2GZRYAXhE6D2LEyKMImaEbIb+8aIICg9cjEP6ZEGdurQ3gvggToY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750040535; c=relaxed/simple;
	bh=k2rBoB8e5YiXj7GjJlkpo7QlrOSrdc5OCZdAYoFIkJI=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=aPwa62NDKUOJXbQzdQETyjy2zFTSC+Kp2wLVbEmOmqFPZbaWH2CPxTOPONLRSTneiOXfWOfng10qfh2llduhzuEudjKmgcz7MEIuruYBb1HTnUnx67ZQV9D3BNHZsgCrOg2ChhmmSWxWbOfNKGwyFcu9VEw4ng51wxAIJcx05NQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dA6muz4D; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dA6muz4D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750040533; x=1781576533;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k2rBoB8e5YiXj7GjJlkpo7QlrOSrdc5OCZdAYoFIkJI=;
  b=dA6muz4DZyBu7VK25XdkXbQQD7/TpspfrirDeXCUCH3Yazj+6Boggh0/
   TiPtlhcNTDqyVXfi5t59pJsNoRujU3dcMm+ZBItdZrAR4h+ULq7EXzz6Z
   Tn1emiy36EQwe+ktSvBy830/Y5rCTxK9DyRungCdBfY6/Op8PtgtDgMt9
   T4U/2x4C1PdMZG9SDMOuNi1zbMcR1NbsFmSBAo/E2skcYPTvIHxqrlv6u
   psMJTe083OwMbs/J+3FlBBLaMis+j5Ua2FKA6O2clWHNuhb4NRlgsAbVM
   v2Smz7AhFqSHS1yQMSmYEYXurXlgz3Lzg8Na8HhPb9NWW6BUu7j74CLc0
   Q==;
X-CSE-ConnectionGUID: IyyVj6nWTqO5glKr2QgkyA==
X-CSE-MsgGUID: fvbz8JfsSYihnhFz9AoyOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="74705688"
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; 
   d="scan'208";a="74705688"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2025 19:22:12 -0700
X-CSE-ConnectionGUID: 2OEkTKstSSa5Hu2qoUvkXA==
X-CSE-MsgGUID: exDNwzauQgaNhKltfRCA6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; 
   d="scan'208";a="148239848"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2025 19:22:11 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 15 Jun 2025 19:22:11 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Sun, 15 Jun 2025 19:22:11 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.75)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 15 Jun 2025 19:22:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RbFcRqLWn3QISIuFwM6F+yMfVBGz0V5oibDsDsMRrubPcHD4iWcwSqTFxjxIyhAjlpy0mFFkZklBI53YckUjEc+dEPySbx0qlWtJYk5UO5yElhtvbtwIlYmfScDfk+HzmPFPMZjXGgiS5JCM0yIbH6yIwwxRy0RE0N8MhmbAGjyi+l8Uxjrd2u7J5tIVqFaZ2JnlvbMScir3XUdyJRhzK4H/bODNHF7St7mvxcyVbvvb4Wh20lscbJda5NJnx2wlN78sKDU3vfec8GMTu/ZTo44mP3Z1GxC2FsrgynZcytyM9M4lRgS+EwYRgTJuWw1KD9d6GSuurtB4qkIzxTfWBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N45WHetLGzMwz1vwVdCtII5cQFCLH5wcZzBXswzSxh0=;
 b=chTdIKx4FXAPiddxb8RxJVRkalTOX1kfZcdTdUkA6lafFmUninxXKlAS3/jeSE0WS4+lTvCnIz9eHFL3kGD8ipkyuupCrJkZblnQk3ngVMimNEJ3oO0rthnzc6RrFPGZaXv6nV0buuxHpyWxps7QC94xyeK4K73582gKb5/LCtK2G3vu3XBD7FtG9bixadYcPM9JGvZmny0GQb/RqoIYujY6jMe2gmqGaXr76iloPtoUB1elut6oyRynOwdjfaSCovNXb8jf4XM1MoZ9BRl+xhvpcqVSs3IMwypIyCttS3kpwNDSqj8Sm9KaV33Arkhu3l61Xt7vi9OQ9wD38HPy8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SJ2PR11MB7618.namprd11.prod.outlook.com (2603:10b6:a03:4cc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Mon, 16 Jun
 2025 02:22:07 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%3]) with mapi id 15.20.8792.034; Mon, 16 Jun 2025
 02:22:07 +0000
Date: Mon, 16 Jun 2025 10:21:58 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Casey Chen <cachen@purestorage.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>, Yuanyuan Zhong
	<yzhong@purestorage.com>, Suren Baghdasaryan <surenb@google.com>,
	<linux-mm@kvack.org>, <oliver.sang@intel.com>
Subject: [linus:master] [alloc_tag]  780138b123:
 Oops:general_protection_fault,probably_for_non-canonical_address#:#[##]SMP_KASAN
Message-ID: <202506131711.5b41931c-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: MA1P287CA0019.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::35) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SJ2PR11MB7618:EE_
X-MS-Office365-Filtering-Correlation-Id: 11291d18-9b0f-4c34-46b2-08ddac7c9793
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lRiwtKUCUrwmZzlanWNYheTX4F1SuViyr0z+nZPSYMWuySXYmKQtackDR5oi?=
 =?us-ascii?Q?BlVYVS6NVpOPcpQG8uAVbhG4E43S9soPVnM3D7278ifCP/gAyC5HymswAOHQ?=
 =?us-ascii?Q?tAjpXrDvLiA2NTHC3yGuTOCcz5PATnm1u3ScgpbRcJN91uCciVe8182WJmDM?=
 =?us-ascii?Q?Dy27COeKsNBBlt8VUfIPgy4JFNWKiaeDYZovNuoYe4c9IlpmmX/UoK2cBYjZ?=
 =?us-ascii?Q?OZ2DR3wKtvxviyVv9xpTVEPj2uYQAtDcz/j8K7Yx8RWouaFVu5hrDq0sYAnD?=
 =?us-ascii?Q?JiWy1S2+fOEQs6iPKAuWOFiP9E7QhQE/+ASmYjoqVSQx8GuIufcCdfmiGDR9?=
 =?us-ascii?Q?1mZbTAyvnj21XQGYpRJFLBTv9DKT7U6pmnnOUoxSaVoJrOAzEsvkRqeyQHyy?=
 =?us-ascii?Q?WZYKsqaVwsykrFnrJb3lwFupQPsW/rCZyqpc4tj/KOK/PrId7WPqAAOmHZmL?=
 =?us-ascii?Q?IlwCPIKQ33WAaFo0p6sSGL0IM3mSv/ZKTO9zaG83Be01AqOF8BG+R/dkdWpK?=
 =?us-ascii?Q?QkikdXkOCOemeMHpms0HvmQ8znoCwOLkner0IhrPuoPegoM9d+1/dXaH5Ita?=
 =?us-ascii?Q?ypwm7CNK0l4KyjulJnuLmZDeOjm6cYMAb9rTrglc8u1lGPW4nW4AcPGWxu04?=
 =?us-ascii?Q?L7BAmbeAExb7/A37/tti78M2yPrb6NLrW8+qxRVaIbxDftZbe4n21+MrEi8i?=
 =?us-ascii?Q?1QP5XPSUmdBzp9MIYEMZJMugsIuXfRhrYiPpkWlxuzc+wDERHVEIZhi5ea2Y?=
 =?us-ascii?Q?XIpcMpY6TtBtQSSxWe6odvVodrFZlNTxBVO0f3WaIg0vG4qwPBr4XJLQAj/u?=
 =?us-ascii?Q?GtSHR6J5eY8nxTtZal77kG1RJmNNK0b4sNeGKLTpQ3t7aSFri9nvqua+8u5V?=
 =?us-ascii?Q?kN65GvI/lC5UbvrEKOPyg8NmyR6MePZIvMxHn/2JXfZ1NjN2s9AT2Op+D2eW?=
 =?us-ascii?Q?EWTRBm9yjvArzn8yh2Xnva+yMt1OnymithhJT2t3xuqX59Mj4xnjtyvudnN5?=
 =?us-ascii?Q?xfu2vVF0rX3jelW7DR7aynJjGq/PO7/i4a9fwPv1SL/q7x/v4wi35CG+C18B?=
 =?us-ascii?Q?b3hWs6PYZDu9+MvYQEvV8+epz0rKRnbqZG5Ph0Bu0hHydTewyw79giRM9v25?=
 =?us-ascii?Q?ivdpKyNtSgAZNfWmiTAvlPLrhzEot1611y9DC0zBCzl+LF4m6ZRsn5QsQ6jT?=
 =?us-ascii?Q?dJ0K6u/GyVcJoDZ6CfHTQkfbIxvRv2o43ssZBKMLB6YH4gIFQ8CzRduRuuUk?=
 =?us-ascii?Q?p1Yv5Au8t2nlbRh/KAcx8mzK86koU/sc0uNKYdehfGSyP+FmFFbv9ggtVQ7D?=
 =?us-ascii?Q?BRsRCiyvCxSO3v/quBzD92VZWPkfT9kmdvjkgG1we13iFIzGO4rZrAxH2B9z?=
 =?us-ascii?Q?2JQRDC/xe2fz5HNZev5/092TE3+k?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MzNGpAy4Sp6zMHdRfFa/XR8wrdLEBmj9xr3jRS/X5QdI6mZFJto7h1ikT4+D?=
 =?us-ascii?Q?CxFkUQ8KtsOz5dDVPaGHSld/uXVSI6R9r7palvjtejWrN2tgq+bwPRcHs01t?=
 =?us-ascii?Q?1HJgiflHXqlSUWwgJ6IcQmrxIESPfVyf7ZFEbBHQnpcIWU/xE5lNxMu6zYFo?=
 =?us-ascii?Q?IndeaG2yCKKA8lvb0655rQBAuC2ICTvZ7eMZlgRyySCW1LZychGZUH8U+NDB?=
 =?us-ascii?Q?6y/8n81g5mTtCjxFuWagroopYn/7yLdu6wQ8oktnYOquZYppLPGtFD/ur0Pm?=
 =?us-ascii?Q?e2AwfG28kcEyTnIoB0GQlbusWSCXC434UZ2gJxNOyNKnLqzSu/8LXGAWcT6x?=
 =?us-ascii?Q?AZFV3o9pGp731pQlQRfoTvcHKd7vx/1N1YiGgj0qXeREJ1KaMT/lek86Mq6H?=
 =?us-ascii?Q?8MlXxvdR5FJKA4LuczxlBxZey9Ohxw2w97O+PQt5CCe5uwXqs5P+UPgWdjH/?=
 =?us-ascii?Q?Lsgu++MsGT+vFDje4e9JGM5MvHJnhp22Ep8KTiTsmIdYH9XeZO417hyZHYem?=
 =?us-ascii?Q?/gYPPPdHBJ+oXwel0Gr5svlBkyGsoMHyB+TKzu5XSSAhvFB/mst9Mp4saw4g?=
 =?us-ascii?Q?dg8lN/AUI6cZ214jgz86rvrx3/nUyOI2+0XEN+/Qm8uTRWJdJQ4qjRqPN1It?=
 =?us-ascii?Q?Pk+H/IVBTEloVySTmElS9OkKKeRle6LuptAXqaoqzMJhrpKop6NlwRWCYuMg?=
 =?us-ascii?Q?7n+rQyB44sVjubZpkpK33lWT4k2MYfq7574RP/6GV3AhgEronSsaRgyFoepi?=
 =?us-ascii?Q?lm8D1hboGWm6XTDPBg4fNEUtDroozfuFxWliWPBJP//vcgQA2GKllZQxYpz+?=
 =?us-ascii?Q?xCqmpLbKANJOjB8iyOFYJ2cfbveJ8/QZ+3bKuNgUv8aD18i4/UQLuvoC5zxL?=
 =?us-ascii?Q?ijUv/HLvXZP05/EzCmJ7m+f60bt2dZtBi+S/pl+H5+3zHJiWR4W/LxfV8O/O?=
 =?us-ascii?Q?MsIuch/+w+qUbkRxBYLMBngQLT/f4h34e2FOJ/wrnMvzrhSnEzsfNLO8thHy?=
 =?us-ascii?Q?8Ts41kcaxnSiTA0uOfjRWLHIwDwMTy8C3343apTHNIwNIR0SiQ8vU5vQyMGA?=
 =?us-ascii?Q?D1pffujiufS+EnWMTmJUQbII69G5xBauUftqPTEjO/CqgLRblryhWWSwxfd0?=
 =?us-ascii?Q?rfbuuxhcFQ05Q4CxDfTKiOFw5TN8zivHanDTUZFpG5NVoYU9USE/hs2wFkc0?=
 =?us-ascii?Q?c+f1LY9DPTZcXJkwudHMI+GODPWuXL58ROj6TkSWMHSGv6qJ/jXGMpVWaY1Q?=
 =?us-ascii?Q?ojfnIairQfErz9+cUE3xy1FyYBJAwG/eTGBNNd+E0G3fOnGfGNMNUA+2edrn?=
 =?us-ascii?Q?NUcX6z9pnmvqcd17LcfN8lpDgSqj+KwhRbZoxBalvKqShBQgOW3LEhDTZyWU?=
 =?us-ascii?Q?EJqFpluBaDzAG3Nd2iuQLhMYSYLk5pDfMKtpl+tvsGxr2kY4VqIvvF7W6EOs?=
 =?us-ascii?Q?zVl3vXE6TiH2COP+pxJx/Y0hdnXBX3SJZr1zFsqgakXP1HHRLaO4LFHuIzYN?=
 =?us-ascii?Q?e2y8013VQrDLEerkKNJxkIYwDcuPJlXhG8NaOgb8jzKxWIfR1Bh1Vsz3Bl21?=
 =?us-ascii?Q?TSFdI8o76vCWoCTIgNxBpFompMtE/aj4tujmFrCN?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 11291d18-9b0f-4c34-46b2-08ddac7c9793
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 02:22:07.7382
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qorAZw7pWThNzb8kKKTJ83pO7zea0naw+UeW6esO9Wvt/98sQ9LvKV/HV/pBFjCMXgdxZKBg9pXhz97povlsXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7618
X-OriginatorOrg: intel.com



Hello,


we don't have enough knowledge if this is a real issue, or the changes in this
commit expose the real issue in a clear way. we just report what we observed
in our tests FYI.

in this trinity test, both 780138b123 and parent have oom (1) randomly. after
oom, parent seems be able to 'recover', but 780138b123 has a big chance to crash
as (2)


6a4b3551ba1079e8 780138b123816d717dbc0771d4c
---------------- ---------------------------
       fail:runs  %reproduction    fail:runs
           |             |             |
           :1000         9%          94:1000  dmesg.KASAN:null-ptr-deref_in_range[#-#]    <---- (2)
           :1000         8%          83:1000  dmesg.Kernel_panic-not_syncing:Fatal_exception    <---- (2)
           :1000         9%          94:1000  dmesg.Oops:general_protection_fault,probably_for_non-canonical_address#:#[##]SMP_KASAN    <---- (2)
           :1000         9%          94:1000  dmesg.RIP:__down_read_trylock    <---- (2)
         94:1000         1%         103:1000  dmesg.invoked_oom-killer:gfp_mask=0x   <---- (1)


below is full report FYI.


kernel test robot noticed "Oops:general_protection_fault,probably_for_non-canonical_address#:#[##]SMP_KASAN" on:

commit: 780138b123816d717dbc0771d4c87e9a8a01963d ("alloc_tag: check mem_profiling_support in alloc_tag_init")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

[test failed on linus/master      f09079bd04a924c72d555cd97942d5f8d7eca98c]
[test failed on linux-next/master b27cc623e01be9de1580eaa913508b237a7a9673]

in testcase: trinity
version: trinity-i386-abe9de86-1_20230429
with following parameters:

	runtime: 300s
	group: group-01
	nr_groups: 5


config: x86_64-randconfig-007-20250609
compiler: gcc-12
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202506131711.5b41931c-lkp@intel.com



[  421.716359][  T464] run invoked oom-killer: gfp_mask=0x440dc0(GFP_KERNEL_ACCOUNT|__GFP_ZERO|__GFP_COMP), order=0, oom_score_adj=0
[  421.719641][  T464] CPU: 1 UID: 0 PID: 464 Comm: run Not tainted 6.15.0-rc6-00281-g780138b12381 #1 PREEMPT(full)  073bc317d8128d8c347152ffd5b02618a013b6bc
[  421.719660][  T464] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[  421.719668][  T464] Call Trace:
[  421.719673][  T464]  <TASK>
[  421.719681][  T464]  dump_stack_lvl+0x8c/0xd1
[  421.719726][  T464]  dump_stack+0x14/0x16
[  421.719736][  T464]  dump_header+0x10a/0x364
[  421.719756][  T464]  oom_kill_process+0x9c/0x256
[  421.719770][  T464]  out_of_memory+0x585/0x5cd
[  421.719781][  T464]  ? oom_killer_disable+0x1d4/0x1d4
[  421.719801][  T464]  __alloc_pages_slowpath+0xd0c/0xfad
[  421.719835][  T464]  ? warn_alloc+0x24d/0x24d
[  421.719875][  T464]  __alloc_frozen_pages_noprof+0x22a/0x2b0
[  421.719892][  T464]  ? __alloc_pages_slowpath+0xfad/0xfad
[  421.719901][  T464]  ? look_up_lock_class+0xb3/0x10d
[  421.719920][  T464]  ? validate_chain+0x40/0x2a9
[  421.719949][  T464]  alloc_pages_mpol+0xf3/0x246
[  421.719963][  T464]  ? policy_nodemask+0x2bb/0x2bb
[  421.719974][  T464]  ? preempt_count_sub+0x10/0x1c
[  421.719995][  T464]  alloc_frozen_pages_noprof+0x54/0x58
[  421.720007][  T464]  alloc_pages_noprof+0xe/0x25
[  421.720018][  T464]  pmd_alloc_one_noprof+0x2b/0xe1
[  421.720031][  T464]  __pmd_alloc+0xbb/0x148
[  421.720045][  T464]  pmd_alloc+0x72/0x7f
[  421.720064][  T464]  copy_p4d_range+0x199/0x28c
[  421.720073][  T464]  ? __lock_release+0x4f/0x10d
[  421.720087][  T464]  ? p4d_offset+0xc5/0xc5
[  421.720109][  T464]  copy_page_range+0x45c/0x504
[  421.720128][  T464]  ? copy_p4d_range+0x28c/0x28c
[  421.720137][  T464]  ? preempt_latency_stop+0x50/0x53
[  421.720152][  T464]  ? __up_write+0x3f6/0x415
[  421.720172][  T464]  dup_mmap+0xa07/0xcae
[  421.720192][  T464]  ? mmap_read_lock_maybe_expand+0x9d/0x9d
[  421.720209][  T464]  ? preempt_count_sub+0x10/0x1c
[  421.720234][  T464]  ? preempt_latency_stop+0x50/0x53
[  421.720251][  T464]  dup_mm+0x13b/0x383
[  421.720268][  T464]  copy_process+0x1a5d/0x3d47
[  421.720297][  T464]  ? pidfd_prepare+0x76/0x76
[  421.720327][  T464]  kernel_clone+0x18e/0x56b
[  421.720341][  T464]  ? create_io_thread+0xd8/0xd8
[  421.720365][  T464]  ? validate_chain+0x40/0x2a9
[  421.720384][  T464]  __do_compat_sys_ia32_clone+0xd3/0xf8
[  421.720399][  T464]  ? __x64_compat_sys_ia32_mmap+0x37/0x37
[  421.720437][  T464]  ? __might_fault+0x11c/0x148
[  421.720452][  T464]  __ia32_compat_sys_ia32_clone+0xd3/0xde
[  421.720470][  T464]  ia32_sys_call+0x1ab1/0x269e
[  421.720483][  T464]  __do_fast_syscall_32+0xb5/0xda
[  421.720496][  T464]  do_fast_syscall_32+0x37/0x6d
[  421.720509][  T464]  do_SYSENTER_32+0x23/0x25
[  421.720520][  T464]  entry_SYSENTER_compat_after_hwframe+0x58/0x5f
[  421.720529][  T464] RIP: 0023:0xf7fb5579
[  421.720540][  T464] Code: b8 01 10 06 03 74 b4 01 10 07 03 74 b0 01 10 08 03 74 d8 01 00 00 00 00 00 00 00 00 00 00 00 00 00 51 52 55 89 e5 0f 34 cd 80 <5d> 5a 59 c3 90 90 90 90 8d b4 26 00 00 00 00 8d b4 26 00 00 00 00
[  421.720549][  T464] RSP: 002b:00000000ffa76d30 EFLAGS: 00000282 ORIG_RAX: 0000000000000078
[  421.720560][  T464] RAX: ffffffffffffffda RBX: 0000000001200011 RCX: 0000000000000000
[  421.720567][  T464] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 00000000f7fae2a8
[  421.720574][  T464] RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
[  421.720579][  T464] R10: 0000000000000000 R11: 0000000000000296 R12: 0000000000000000
[  421.720585][  T464] R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
[  421.720613][  T464]  </TASK>
[  421.999417][  T464] Mem-Info:
[  422.020799][  T464] active_anon:76021 inactive_anon:3069011 isolated_anon:0
[  422.020799][  T464]  active_file:0 inactive_file:0 isolated_file:0
[  422.020799][  T464]  unevictable:90809 dirty:0 writeback:0
[  422.020799][  T464]  slab_reclaimable:50729 slab_unreclaimable:99515
[  422.020799][  T464]  mapped:11568 shmem:3108857 pagetables:874
[  422.020799][  T464]  sec_pagetables:0 bounce:0
[  422.020799][  T464]  kernel_misc_reclaimable:0
[  422.020799][  T464]  free:30837 free_pcp:3770 free_cma:0
[  422.056111][  T464] Node 0 active_anon:304084kB inactive_anon:12276044kB active_file:0kB inactive_file:0kB unevictable:363236kB isolated(anon):0kB isolated(file):0kB mapped:46272kB dirty:0kB writeback:0kB shmem:12435428kB writeback_tmp:0kB kernel_stack:4800kB pagetables:3496kB sec_pagetables:0kB all_unreclaimable? yes Balloon:0kB
[  422.075920][  T464] Node 0 DMA free:15360kB boost:0kB min:16kB low:28kB high:40kB reserved_highatomic:0KB free_highatomic:0KB active_anon:0kB inactive_anon:0kB active_file:0kB inactive_file:0kB unevictable:0kB writepending:0kB present:15992kB managed:15360kB mlocked:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:0kB
[  422.096281][  T464] lowmem_reserve[]: 0 2831 13776 13776 13776
[  422.103436][  T464] Node 0 DMA32 free:44776kB boost:0kB min:2988kB low:5784kB high:8580kB reserved_highatomic:0KB free_highatomic:0KB active_anon:56688kB inactive_anon:2781944kB active_file:0kB inactive_file:0kB unevictable:328kB writepending:0kB present:3129216kB managed:2899740kB mlocked:328kB bounce:0kB free_pcp:13272kB local_pcp:10204kB free_cma:0kB
[  422.129935][  T464] lowmem_reserve[]: 0 0 10945 10945 10945
[  422.137659][  T464] Node 0 Normal free:63212kB boost:51564kB min:63532kB low:74736kB high:85940kB reserved_highatomic:0KB free_highatomic:0KB active_anon:247396kB inactive_anon:9494100kB active_file:0kB inactive_file:0kB unevictable:362908kB writepending:0kB present:13631488kB managed:11207880kB mlocked:2196kB bounce:0kB free_pcp:1808kB local_pcp:1188kB free_cma:0kB
[  422.165589][  T464] lowmem_reserve[]: 0 0 0 0 0
[  422.173663][  T464] Node 0 DMA: 0*4kB 0*8kB 0*16kB 0*32kB 0*64kB 0*128kB 0*256kB 0*512kB 1*1024kB (U) 1*2048kB (U) 3*4096kB (M) = 15360kB
[  422.184662][  T464] Node 0 DMA32: 2*4kB (UM) 2*8kB (U) 1*16kB (U) 2*32kB (UE) 4*64kB (UME) 3*128kB (UE) 2*256kB (UM) 1*512kB (E) 2*1024kB (UM) 2*2048kB (UM) 9*4096kB (M) = 44776kB
[  422.209110][  T464] Node 0 Normal: 1*4kB (M) 1*8kB (U) 2*16kB (UM) 0*32kB 327*64kB (UM) 226*128kB (UM) 36*256kB (UM) 2*512kB (UM) 3*1024kB (UM) 0*2048kB 0*4096kB = 63212kB
[  422.240115][  T464] 3197807 total pagecache pages
[  422.254115][  T464] 0 pages in swap cache
[  422.269109][  T464] Free swap  = 0kB
[  422.285107][  T464] Total swap = 0kB
[  422.300451][  T464] 4194174 pages RAM
[  422.319431][  T464] 0 pages HighMem/MovableOnly
[  422.334296][  T464] 663429 pages reserved
[  422.350111][  T464] 0 pages cma reserved
[  422.368307][  T464] 0 pages hwpoisoned
[  422.383136][  T464] Oops: general protection fault, probably for non-canonical address 0xdffffc000000001b: 0000 [#1] SMP KASAN
[  422.389566][  T464] KASAN: null-ptr-deref in range [0x00000000000000d8-0x00000000000000df]
[  422.395815][  T464] CPU: 1 UID: 0 PID: 464 Comm: run Not tainted 6.15.0-rc6-00281-g780138b12381 #1 PREEMPT(full)  073bc317d8128d8c347152ffd5b02618a013b6bc
[  422.402827][  T464] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[  422.409018][  T464] RIP: 0010:__down_read_trylock+0x9f/0x296
[  422.414237][  T464] Code: 10 07 39 8a e8 87 df 46 00 83 3d f6 ab f4 08 00 0f 85 38 01 00 00 4c 8d 73 68 b8 ff ff 37 00 4c 89 f2 48 c1 e0 2a 48 c1 ea 03 <80> 3c 02 00 74 08 4c 89 f7 e8 72 df 46 00 48 39 5b 68 0f 84 0c 01
[  422.426591][  T464] RSP: 0018:ffffc900046cf0a8 EFLAGS: 00010206
[  422.432304][  T464] RAX: dffffc0000000000 RBX: 0000000000000070 RCX: 1ffffffff14720e2
[  422.438489][  T464] RDX: 000000000000001b RSI: 000000000000000a RDI: 0000000000000070
[  422.448792][  T464] RBP: ffffc900046cf120 R08: 0000000000000008 R09: 0000000000000000
[  422.454953][  T464] R10: fffffbfff1471e8b R11: ffffffff815ab3fc R12: ffffc900046cf0f8
[  422.461083][  T464] R13: 1ffff920008d9e17 R14: 00000000000000d8 R15: 0000000000000000
[  422.467325][  T464] FS:  0000000000000000(0000) GS:ffff8884242eb000(0063) knlGS:00000000f7fae240
[  422.473750][  T464] CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
[  422.479566][  T464] CR2: 00000000f7fc4574 CR3: 000000014cf1b000 CR4: 00000000000406f0
[  422.485894][  T464] Call Trace:
[  422.491525][  T464]  <TASK>
[  422.496855][  T464]  ? preempt_latency_stop+0x50/0x53
[  422.505046][  T464]  ? rwsem_spin_on_owner+0x1d1/0x1d1
[  422.510801][  T464]  ? __wake_up_klogd+0x59/0x6c
[  422.516272][  T464]  ? wake_up_klogd+0x12/0x14
[  422.521817][  T464]  down_read_trylock+0x12/0x45
[  422.527154][  T464]  codetag_trylock_module_list+0x11/0x18
[  422.532601][  T464]  alloc_tag_top_users+0x8c/0x211
[  422.537895][  T464]  ? vprintk+0xd/0xf
[  422.542734][  T464]  ? _printk+0x95/0xaf
[  422.547382][  T464]  ? reserve_module_tags+0x32a/0x32a
[  422.552072][  T464]  __show_mem+0x1af/0x544
[  422.556529][  T464]  ? preempt_count_sub+0x10/0x1c
[  422.561143][  T464]  ? preempt_count_sub+0x10/0x1c
[  422.565745][  T464]  ? mark_lock+0x72/0x179
[  422.570155][  T464]  ? si_meminfo_node+0x187/0x187
[  422.574638][  T464]  ? mark_held_locks+0x4f/0x63
[  422.578901][  T464]  ? trace_hardirqs_on+0x4e/0x50
[  422.583004][  T464]  ? irqentry_exit+0x6b/0x79
[  422.587046][  T464]  ? sysvec_apic_timer_interrupt+0x7a/0x7f
[  422.591381][  T464]  ? asm_sysvec_apic_timer_interrupt+0x1f/0x30
[  422.595734][  T464]  ? trace_irq_enable+0xad/0xe7
[  422.599476][  T464]  ? dump_stack_lvl+0x96/0xd1
[  422.602966][  T464]  dump_header+0x19c/0x364
[  422.606238][  T464]  ? dump_header+0x19c/0x364
[  422.609775][  T464]  oom_kill_process+0x9c/0x256
[  422.613161][  T464]  out_of_memory+0x585/0x5cd
[  422.616633][  T464]  ? oom_killer_disable+0x1d4/0x1d4
[  422.620325][  T464]  __alloc_pages_slowpath+0xd0c/0xfad
[  422.623957][  T464]  ? warn_alloc+0x24d/0x24d
[  422.627581][  T464]  __alloc_frozen_pages_noprof+0x22a/0x2b0
[  422.630990][  T464]  ? __alloc_pages_slowpath+0xfad/0xfad
[  422.634869][  T464]  ? look_up_lock_class+0xb3/0x10d
[  422.638425][  T464]  ? validate_chain+0x40/0x2a9
[  422.641898][  T464]  alloc_pages_mpol+0xf3/0x246
[  422.644831][  T464]  ? policy_nodemask+0x2bb/0x2bb
[  422.648013][  T464]  ? preempt_count_sub+0x10/0x1c
[  422.651906][  T464]  alloc_frozen_pages_noprof+0x54/0x58
[  422.655256][  T464]  alloc_pages_noprof+0xe/0x25
[  422.660066][  T464]  pmd_alloc_one_noprof+0x2b/0xe1
[  422.663449][  T464]  __pmd_alloc+0xbb/0x148
[  422.665896][  T464]  pmd_alloc+0x72/0x7f
[  422.668415][  T464]  copy_p4d_range+0x199/0x28c
[  422.670979][  T464]  ? __lock_release+0x4f/0x10d
[  422.673552][  T464]  ? p4d_offset+0xc5/0xc5
[  422.676110][  T464]  copy_page_range+0x45c/0x504
[  422.678693][  T464]  ? copy_p4d_range+0x28c/0x28c
[  422.680871][  T464]  ? preempt_latency_stop+0x50/0x53
[  422.683176][  T464]  ? __up_write+0x3f6/0x415
[  422.685384][  T464]  dup_mmap+0xa07/0xcae
[  422.687632][  T464]  ? mmap_read_lock_maybe_expand+0x9d/0x9d
[  422.690199][  T464]  ? preempt_count_sub+0x10/0x1c
[  422.692456][  T464]  ? preempt_latency_stop+0x50/0x53
[  422.697259][  T464]  dup_mm+0x13b/0x383
[  422.700011][  T464]  copy_process+0x1a5d/0x3d47
[  422.702466][  T464]  ? pidfd_prepare+0x76/0x76
[  422.705025][  T464]  kernel_clone+0x18e/0x56b
[  422.707377][  T464]  ? create_io_thread+0xd8/0xd8
[  422.709734][  T464]  ? validate_chain+0x40/0x2a9
[  422.712105][  T464]  __do_compat_sys_ia32_clone+0xd3/0xf8
[  422.714980][  T464]  ? __x64_compat_sys_ia32_mmap+0x37/0x37
[  422.717597][  T464]  ? __might_fault+0x11c/0x148
[  422.720096][  T464]  __ia32_compat_sys_ia32_clone+0xd3/0xde
[  422.722769][  T464]  ia32_sys_call+0x1ab1/0x269e
[  422.726198][  T464]  __do_fast_syscall_32+0xb5/0xda
[  422.738822][  T464]  do_fast_syscall_32+0x37/0x6d
[  422.741915][  T464]  do_SYSENTER_32+0x23/0x25
[  422.744659][  T464]  entry_SYSENTER_compat_after_hwframe+0x58/0x5f
[  422.758647][  T464] RIP: 0023:0xf7fb5579
[  422.761024][  T464] Code: b8 01 10 06 03 74 b4 01 10 07 03 74 b0 01 10 08 03 74 d8 01 00 00 00 00 00 00 00 00 00 00 00 00 00 51 52 55 89 e5 0f 34 cd 80 <5d> 5a 59 c3 90 90 90 90 8d b4 26 00 00 00 00 8d b4 26 00 00 00 00
[  422.776069][  T464] RSP: 002b:00000000ffa76d30 EFLAGS: 00000282 ORIG_RAX: 0000000000000078
[  422.790522][  T464] RAX: ffffffffffffffda RBX: 0000000001200011 RCX: 0000000000000000
[  422.794043][  T464] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 00000000f7fae2a8
[  422.798714][  T464] RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
[  422.802140][  T464] R10: 0000000000000000 R11: 0000000000000296 R12: 0000000000000000
[  422.805348][  T464] R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
[  422.818930][  T464]  </TASK>
[  422.821404][  T464] Modules linked in:
[  422.832840][  T464] ---[ end trace 0000000000000000 ]---
[  422.993084][  T464] RIP: 0010:__down_read_trylock+0x9f/0x296
[  422.998254][  T464] Code: 10 07 39 8a e8 87 df 46 00 83 3d f6 ab f4 08 00 0f 85 38 01 00 00 4c 8d 73 68 b8 ff ff 37 00 4c 89 f2 48 c1 e0 2a 48 c1 ea 03 <80> 3c 02 00 74 08 4c 89 f7 e8 72 df 46 00 48 39 5b 68 0f 84 0c 01
[  423.013857][  T464] RSP: 0018:ffffc900046cf0a8 EFLAGS: 00010206
[  423.020790][  T464] RAX: dffffc0000000000 RBX: 0000000000000070 RCX: 1ffffffff14720e2
[  423.028498][  T464] RDX: 000000000000001b RSI: 000000000000000a RDI: 0000000000000070
[  423.036152][  T464] RBP: ffffc900046cf120 R08: 0000000000000008 R09: 0000000000000000
[  423.046415][  T464] R10: fffffbfff1471e8b R11: ffffffff815ab3fc R12: ffffc900046cf0f8
[  423.054932][  T464] R13: 1ffff920008d9e17 R14: 00000000000000d8 R15: 0000000000000000
[  423.063816][  T464] FS:  0000000000000000(0000) GS:ffff8884242eb000(0063) knlGS:00000000f7fae240
[  423.076027][  T464] CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
[  423.087121][  T464] CR2: 00000000f7fc4574 CR3: 000000014cf1b000 CR4: 00000000000406f0
[  423.096316][  T464] Kernel panic - not syncing: Fatal exception
[  423.102733][  T464] Kernel Offset: disabled


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250613/202506131711.5b41931c-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

