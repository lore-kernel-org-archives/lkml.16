Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD8FB660
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 02:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747190885; cv=fail; b=Y3ehW7CsP/ubVAYkflgr4ElxBCDkbEbq5ssIoZgdZ+WakGV+bfJP6UEHdh8Fjxx2CEEoLsCtnr9f0k6K9o1Yo95cFJlq9cYs3BWMtjG2vPLTdjAwEMkoYQHRiQpKwDYvIlDBadzrEACR77e9Wn92FIc2Ce3rfvraIUcYiuy6slY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747190885; c=relaxed/simple;
	bh=G+50XwE7wXCeR4RC8fzir/fgkyypy/w7mO+zUxkD53Q=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=XRvHq6TB3q78lTDfOBcLOcLNB6PHe8jHee8IaMzWHhPv/mXX6w2JO/rxTqNyDeK2xd3Yl2C0cKaO6jAmFSOELgx0nUTDZ3yMWoA0LaO5kIfvKXB+LoMKQFM7uDuU8onrwhYb3xgMWedWUIUTxeo0/oNiWGdkCudyZYH1kmGZspg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OlNk2/7n; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OlNk2/7n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747190882; x=1778726882;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G+50XwE7wXCeR4RC8fzir/fgkyypy/w7mO+zUxkD53Q=;
  b=OlNk2/7nUINABm1bUfz4kmKxpyjZ4rp6DJvRiHbZswDrUkVtJCTGmSrT
   uCmzC298LDtf1DgQ5uXsLxvFTc59FIkTtWdigyk9DHmsfyy0T6VGnCMXX
   4ZnCrPX89msk6ic+1En/yqgeQpAdgZwEV2xc+JhIV/ucEiQ9ZZziqlZj3
   TbEl8fim34hdtBurqA9pfEMcF0zEedwaIknMRxsap6XSJnVAA0SvxKTOu
   SjLrmX+Py4y020DCsk7emJ+8FvBCvV1b9iutu2j0rNBKPqrvWeni3D4QS
   x1A7Lq0ToOTqWQnYsP0LN9/S9pxPB++kVogj/TmtTaUwDX1h9Ugzpk8HS
   Q==;
X-CSE-ConnectionGUID: +o4Z9/BNTNu1lFpqEvnFyA==
X-CSE-MsgGUID: 2MKP7wYARxSxAmFZXdn6Bw==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="52874458"
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="52874458"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 19:48:01 -0700
X-CSE-ConnectionGUID: vVmuyEngRXqc/Pkb8JiC3A==
X-CSE-MsgGUID: 0ZN6zPNzSnGZjOy4MbWjHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="138324268"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 19:48:01 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 13 May 2025 19:48:00 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 13 May 2025 19:48:00 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 13 May 2025 19:48:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TXOPF389ZMURw82x2jD5krVd5NO3/8QRqxurR8IC1PnkP0qUhsuxCuAD2uRuSSg29sLiB+nIt7wWwjQvGD6q+RtI5eSFF04XgnZPN7mDZ0PizS2ZsJnedzb0JuCwJLI/JUOE6iL+EUaiXD0FU1S6k14z9gJsLrvzhewx7ep3NO+FFyrpebKtMJYuEY13KFoVjH7INhYnwR8zdN/h+Zoc0Jhy+bDwcKx1hUhyVlZbYAAkNhCK65DtPhiu0dmClDRUcosmBe/MkAX1RwriKECXt12HtBYUHhETEj4QE46s8a0SGnC2FGnjlT0nSBjIe1rzP3cMA6AhUGk+kRoc2UBwIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w2ir4auRZbjTzuD/ndcoOOVAbV5IU1trs02FDTZMmHI=;
 b=Im8HzUZAiC/Vl1mzHwtS1Sw47InH1EhK+3MQbD2WPlm9otYFD3ZXG2yBTHVQTHBRHzsup9+1Eo1pEFIGdpicjSdhEqsdTwLckUibWVbuH6LGtrdCyOaa8Z22RbMda2LsPHjC4Ii72HP2qqwhtCF1hKAzlkohJwjnTju3ohkDZtvRoNdIif8bmtceJWSdwfIjuwdzeriOa+nrCKI7dRN8mzjrjvLgYG/zx0Sf7l68ARKRKfJEJY1w2Q6jjwaPzoKQ8VNxXPi+4yJVHMfuqvLpEUjoIBpHKyC4jmdJb0wgMsdghcYkEnhrMN73x0nnJd5FAbtdhdTwjQu6zG+MBpMpqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by MN0PR11MB6110.namprd11.prod.outlook.com (2603:10b6:208:3ce::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Wed, 14 May
 2025 02:47:39 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 02:47:39 +0000
Date: Wed, 14 May 2025 10:47:30 +0800
From: kernel test robot <oliver.sang@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Joel Fernandes
	<joelagnelf@nvidia.com>, <linux-kernel@vger.kernel.org>,
	<oliver.sang@intel.com>
Subject: [linux-next:master] [rcutorture]  c27d0d38f2:
 WARNING:at_kernel/rcu/rcutorture.c:#rcutorture_one_extend_check[rcutorture]
Message-ID: <202505140917.8ee62cc6-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR02CA0053.apcprd02.prod.outlook.com
 (2603:1096:4:196::16) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|MN0PR11MB6110:EE_
X-MS-Office365-Filtering-Correlation-Id: f05ccc4e-880c-4be7-cf91-08dd9291b0c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RKskyfgJMoyK/Ishlzs4Rs8bFtjpwd1dl/FSL/imRGbZv61gHZQCI6+ZrHjh?=
 =?us-ascii?Q?H4pnbrj7GAnXncX9Us2N5V14hfpy/am0bYCWAXbavu1d/vJIAWj0y7mcViq5?=
 =?us-ascii?Q?3KyQJNydiKC7rm22ldjZjw9FOo8DPokcR8gK1m1o/X8ngp0afe35mHNqTuLl?=
 =?us-ascii?Q?SxgyxeW/RJ9ph2I5GGpQgpJuc/mVwevjlCGDyMeqRArOzXqo2sTEcR7LEwgs?=
 =?us-ascii?Q?xqbTapq/+UQrfPgzt214x16GMHXJzBTOgpqLLECLt+SRQK8AAwoT1ixxhEPx?=
 =?us-ascii?Q?beJEwQ4U31R1fr/fWUOPYKGiTfGWZSpkCXHFCuRFO70MpqlukcxOM6IRyrqY?=
 =?us-ascii?Q?jHH+6YeiRMWowRN7Eh7MsfF5GRfw5POsG+LwkmuPFI//KMS3Bl+IHpUf7256?=
 =?us-ascii?Q?DxF1GJjul3Sk9zWb6LTM/w1BSRXJAlfOTpghc7SpwpwDKoCEVqiaX6sg6Mo+?=
 =?us-ascii?Q?6mRt8oN1/ETwT/M4r9pQ2Uq5tMxKgwm4jeJOz1D4xhZJQhmRCWkwsBr377iX?=
 =?us-ascii?Q?u1//Khj9N/439t85X72LhMTFZzoplC8eV6lgvEp2gUNdPxBwMe42xT51fOBo?=
 =?us-ascii?Q?kI7F26kjUeLxJg5WKD14LVBBmb4nO1VaFIZfJGAwX3/1XFbmba7W4yBGP71i?=
 =?us-ascii?Q?4pOEKWiUZo5nfdeSh7fM4me8ouTC648+ub5/LUEw4BmkoUdTRbdDUeIhvdjc?=
 =?us-ascii?Q?D+t4LRwcbc85RZ/AfFylGsO58z9g2uxel8ahRH+6xRaOZVCCWYfzVve2XCNW?=
 =?us-ascii?Q?/b0ZI6g31voZUWcsFvcjjeOGHFwqQx/NOz80A47eMlqsRVeSJT5PJJkSwUiF?=
 =?us-ascii?Q?7Z5Gk4RET0yPbtWgbKalUVfLpHpqk9Ms0UU3tQltbZ4LbqGCQVuX4pisob06?=
 =?us-ascii?Q?JsakjREjSPJYfoYL0ovqaEmHHDI7n82EVu178E358hY/FE2IjOEUjujZIyoR?=
 =?us-ascii?Q?HsB4DDBYDj7A8cs39cqQkqHmXGkJwntQu4RDbYC2KwuiINf/0KTzDW1ILWp0?=
 =?us-ascii?Q?bwLtAvcdcGgrtrCewxxIe59FMrKFDJ4eNC0NfE/v0zPA+INEigc9y3c+klDQ?=
 =?us-ascii?Q?BGBcJyd8ckCMbnJweqSECaAw9OqTKp1RFbYw1IrP281BhPwnkvGVLmHFjI+Q?=
 =?us-ascii?Q?Q1OjtKyz3EtfnWtdHL/vu7e0oT+2OKrKlCrHkYRgdPxGK97r+2RqUMfQJLCj?=
 =?us-ascii?Q?6j6nNyh4rGU10fm8yc2XmXOL2IOQWaxpZX1afSUmpMLMgXsXYnJQbgArmPm1?=
 =?us-ascii?Q?H762zeO+dA+UGhFVK3FV+zbxhAUlHrrqv3Yrw3d9Wa/2sPyfsXil/bpuKrnT?=
 =?us-ascii?Q?5q4tR63X1yMKI9GM7Ch2AxE8qgFRqu21gDHQDdouH1HT4zffAg/yDmd4IdES?=
 =?us-ascii?Q?4PrKfsrZ/p5c4YItgW5qfhpy6j4a?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NPSrG0qar1CO4Z/03IOwzd4lM1/HrqLL8jJLVBp0SN2BAGZpx5xw8JLRrUY+?=
 =?us-ascii?Q?bi/g7FylXVKijehyzmQZyB3TFXwVgk0YPk58Jxo42r9CQ8hqC6YUXJVGqkI4?=
 =?us-ascii?Q?TgFSjyRj7YuSPhbRDsH8IstwRtBet9XYz3clBXdLcGhCGJw5Gi5uZoEa9Udh?=
 =?us-ascii?Q?zlERcntHKRLV5fshwpcBgZvXWxQF+sOSvwGueirHSORpxHusVi9rV9NbHOOE?=
 =?us-ascii?Q?Ro1D47HC36EyvdmfRjs/oXa229bX5RDU2EG+j6eeV8rhwiN0pNZSXgCl/6LO?=
 =?us-ascii?Q?5wgCHWRcR12EI54Ryu/BS7NTMwU0QUesRiysSJ5s+a/YMc/rpBMmVb9O+qlZ?=
 =?us-ascii?Q?49G7CMzAVtsU4vGUwYkE0dmmWZBFGp8l3qY65Lv3AxOF1ybrBJ8BpwbCG3Zr?=
 =?us-ascii?Q?lRmuagAgGOoG4rGEAuEb15LfHMh+n+i/HUL1pOOxBF2xb/XJvZzYbm33MI29?=
 =?us-ascii?Q?SovVVV3vEqK3uIf3Ep3L7jpmOvKzcU0QKjyPMGpwjDCK4YjhtSwaqwggauHM?=
 =?us-ascii?Q?BRsShwQzdmBzZJ6gy4oXb7kxGU9KLFbmLHsdbx6dIbmwpijDgpzdXBpF+ytp?=
 =?us-ascii?Q?iXgwQzSlZn8iTl2e0vk6zdlGqR3Sw74QjpJwvILbwx0QGbeRgwWCyvSPp2s4?=
 =?us-ascii?Q?4Zzl7aHjVkaBg8gsaiRG6vAKKBRaGr43SvAYsm+EaHCPa4W3uR1tE1Nw7r8r?=
 =?us-ascii?Q?JZGZIeXGDPezCjFs1h/FdMZlbTAepYSMfZVhtdX8I/ClyVpiadJRReF+toHB?=
 =?us-ascii?Q?/zVMUKRbCI/yde2i4aiCHXtczDO4v7gJGrmiipgIb7VTHJwmI4YYlI6Iu9mN?=
 =?us-ascii?Q?lXpX84GC3kP6nuH6qFTa9aAIIHLIudU/umNLmcjMr7ep9WNJjUnfGM0Ps1tF?=
 =?us-ascii?Q?VfIBkS49E9jvWYwedeaeSmKGXqbbALdOLTd+8sYRLzAObSot0lMyQmCatgjL?=
 =?us-ascii?Q?Q6pXe37pwL2xZlHeSF7WSXIAxInqiB6jcC1kcWgZoFHJrvy2G7WmVKVtw1ro?=
 =?us-ascii?Q?c2VTrfcb8xnhuX6xuddRyGnEx5k0ykT9fqh0nQUvzfHs8I0wmvDn2l3+K21B?=
 =?us-ascii?Q?NGpfoOTMFuRMTlFfcW7Y1mvrFWsorNeW9VXebH3i9iUAYNjvQIRu1NzUM6Aw?=
 =?us-ascii?Q?PBWd955WXVeOJHqyM1AHPW5cCrS7mfGauABmNt9NGJd9M10RTUpGyhwFr6te?=
 =?us-ascii?Q?AuvtPE/9nft6U2IiB47PeLwo5TBQhglI/2v+KtyomJdofsDj6wIniUMfuLlW?=
 =?us-ascii?Q?4twCjqFv2gpf1HEF6YPsbRG2aL2KN5QIuLv4fw3w/dPCflixloQNp2jlzSYK?=
 =?us-ascii?Q?fSZzvjfNF5Xr9t6bgeom0EzKnBEsMpn8ZgEnojGOPNwq49JfHj4/qhBl4amU?=
 =?us-ascii?Q?FTcH6ZU/fbPWKRgF/c13YhM6IakVTUG4Mo3hC6bKBFScYVOr7rdifPc0xjyG?=
 =?us-ascii?Q?sXRGefLLhogvm/eNWvve35LdRiNudSizriag23Gw6PHfp0z9SSJ8p6FazlBw?=
 =?us-ascii?Q?qnBjXLCzn8laNOAXtOyqUCZx6VO4c3cqs0iM6k8QFB5V66u43wsI0DfiQRTE?=
 =?us-ascii?Q?eH5AhOerip0g2KK+tzIn87B7zOuOGTGf0lQXlzHOAtQPT1kfvFe4ZpUNC9HK?=
 =?us-ascii?Q?QA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f05ccc4e-880c-4be7-cf91-08dd9291b0c3
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 02:47:39.1609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NTRAATz6ebSg/2phUJcZ4BVLrcn4Vnd8WmQdEC0/B3VJxx9xTBxfMPLwd07pE1xNsZwNqQdaO2/ysPBuSah6rA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6110
X-OriginatorOrg: intel.com


hi, Paul,

for this commit we tested before, now we found it causes issues in linux-next
master branch.

=========================================================================================
tbox_group/testcase/rootfs/kconfig/compiler/runtime/test/torture_type:
  vm-snb/rcutorture/debian-11.1-i386-20220923.cgz/i386-randconfig-141-20250508/clang-20/300s/cpuhotplug/srcud

c795676b5c0a4ab7 c27d0d38f2cafb70a68ca42c410
---------------- ---------------------------
       fail:runs  %reproduction    fail:runs
           |             |             |
           :50           2%           1:50    dmesg.EIP:__kernel_text_address
           :50           4%           2:50    dmesg.EIP:__srcu_check_read_flavor
           :50           2%           1:50    dmesg.EIP:_raw_spin_unlock_irq
           :50          14%           7:50    dmesg.EIP:_raw_spin_unlock_irqrestore
           :50          30%          15:50    dmesg.EIP:console_flush_all
           :50           4%           2:50    dmesg.EIP:console_trylock_spinning
           :50           2%           1:50    dmesg.EIP:delay_tsc
           :50           2%           1:50    dmesg.EIP:finish_lock_switch
           :50           2%           1:50    dmesg.EIP:kernel_text_address
           :50           2%           1:50    dmesg.EIP:lock_acquire
           :50          36%          18:50    dmesg.EIP:pv_native_safe_halt
          1:50          -2%            :50    dmesg.EIP:rcu_torture_fwd_prog_cr
          7:50         -14%            :50    dmesg.EIP:rcu_torture_writer
           :50         100%          50:50    dmesg.EIP:rcutorture_one_extend_check
         48:50           0%          48:50    dmesg.INFO:task_blocked_for_more_than#seconds
         48:50           0%          48:50    dmesg.Kernel_panic-not_syncing:hung_task:blocked_tasks
         50:50           0%          50:50    dmesg.UBSAN:negation-overflow_in_lib/sort.c
          1:50          -2%            :50    dmesg.WARNING:at_kernel/rcu/rcutorture.c:#rcu_torture_fwd_prog_cr[rcutorture]
          7:50         -14%            :50    dmesg.WARNING:at_kernel/rcu/rcutorture.c:#rcu_torture_writer[rcutorture]
           :50         100%          50:50    dmesg.WARNING:at_kernel/rcu/rcutorture.c:#rcutorture_one_extend_check[rcutorture]   <--- (1)
          7:50         -14%            :50    dmesg.calltrace:__do_softirq
          1:50          -2%            :50    dmesg.calltrace:rcu_torture_pipe_update

though both c27d0d38f2/parent have various issues, it seems (1) is persistent
on c27d0d38f2 and clean on parent.


Hello,

kernel test robot noticed "WARNING:at_kernel/rcu/rcutorture.c:#rcutorture_one_extend_check[rcutorture]" on:

commit: c27d0d38f2cafb70a68ca42c4105e170862aaf77 ("rcutorture: Complain if an ->up_read() is delayed more than 10 seconds")
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

[test failed on linux-next/master f48887a98b78880b7711aca311fbbbcaad6c4e3b]

in testcase: rcutorture
version: 
with following parameters:

	runtime: 300s
	test: cpuhotplug
	torture_type: srcud



config: i386-randconfig-141-20250508
compiler: clang-20
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202505140917.8ee62cc6-lkp@intel.com


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250514/202505140917.8ee62cc6-lkp@intel.com


[   76.027193][    C1] ------------[ cut here ]------------
[   76.027652][  T661] srcud-torture: rcu_torture_stats task started
[   76.027754][    C1] rcutorture_one_extend_check before change: Current 0x80  To add 0x0  To remove 0x80  preempt_count() 0x10001
[   76.029893][    C1] WARNING: CPU: 1 PID: 2 at kernel/rcu/rcutorture.c:1976 rcutorture_one_extend_check+0x5b/0x300 [rcutorture]
[   76.031093][    C1] Modules linked in: rcutorture(+) torture
[   76.031736][    C1] CPU: 1 UID: 0 PID: 2 Comm: kthreadd Tainted: G                T   6.15.0-rc1-00008-gc27d0d38f2ca #1 PREEMPT(full)  4c3e2c742772c0895467dcaa42b0aab115cc2926
[   76.033194][    C1] Tainted: [T]=RANDSTRUCT
[   76.033728][    C1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   76.034602][    C1] EIP: rcutorture_one_extend_check+0x5b/0x300 [rcutorture]
[   76.035319][    C1] Code: 05 68 e2 69 f0 01 64 a1 0c f0 b4 c3 25 ff ff ff 7f 50 ff 75 0c 57 53 56 68 e3 c9 6a f0 68 19 b5 6a f0 e8 b8 c8 96 d0 83 c4 1c <0f> 0b f6 c3 09 75 1d eb 35 9c 8f 45 ec f7 45 ec 00 02 00 00 74 09
[   76.037024][    C1] EAX: 0000006c EBX: 00000080 ECX: 00000027 EDX: 00000000
[   76.037760][    C1] ESI: f06ad951 EDI: 00000000 EBP: c7f19da0 ESP: c7f19d8c
[   76.038490][    C1] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010082
[   76.039252][    C1] CR0: 80050033 CR2: b7e17eb0 CR3: 08be7000 CR4: 00040690
[   76.039989][    C1] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
[   76.040713][    C1] DR6: fffe0ff0 DR7: 00000400
[   76.041313][    C1] Call Trace:
[   76.041825][    C1]  rcutorture_one_extend+0x54/0x4b0 [rcutorture 4a4a34e515cdd0c53b2c18de8a71945278e82895]
[   76.042705][    C1]  ? lock_acquire+0xa8/0x1c0
[   76.043299][    C1]  rcu_torture_one_read_end+0x1b7/0x350 [rcutorture 4a4a34e515cdd0c53b2c18de8a71945278e82895]
[   76.044196][    C1]  ? local_bh_enable+0x20/0x20 [rcutorture 4a4a34e515cdd0c53b2c18de8a71945278e82895]
[   76.045049][    C1]  rcu_torture_updown_hrt+0x18/0x30 [rcutorture 4a4a34e515cdd0c53b2c18de8a71945278e82895]
[   76.045935][    C1]  __hrtimer_run_queues+0x18a/0x3b0
[   76.046555][    C1]  ? ktime_get_update_offsets_now+0x52/0x200
[   76.047309][    C1]  hrtimer_run_queues+0xf7/0x130
[   76.048063][    C1]  update_process_times+0x25/0xb0
[   76.048680][    C1]  tick_periodic+0xc4/0xe0
[   76.049272][    C1]  tick_handle_periodic+0x23/0x70
[   76.049875][    C1]  __sysvec_apic_timer_interrupt+0x73/0x190
[   76.050528][    C1]  ? sysvec_call_function_single+0x30/0x30
[   76.051175][    C1]  sysvec_apic_timer_interrupt+0x1a/0x34
[   76.051812][    C1]  handle_exception+0x150/0x150
[   76.052405][    C1] EIP: lock_acquire+0xda/0x1c0
[   76.052998][    C1] Code: 64 0f c1 05 8c 0e b5 c3 83 f8 01 0f 85 a5 00 00 00 9c 8f 45 d4 f7 45 d4 00 02 00 00 0f 85 a6 00 00 00 85 f6 74 01 fb 83 c4 20 <5e> 5f 5b 5d 2e e9 30 3d 3c 01 89 ce 89 55 f0 8b 55 f0 ff 75 14 ff
[   76.054753][    C1] EAX: 00000001 EBX: c345d894 ECX: b4a771ac EDX: 00000000
[   76.055499][    C1] ESI: 00000001 EDI: 00000000 EBP: c7f19f50 ESP: c7f19f44
[   76.056248][    C1] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00000286
[   76.057032][    C1]  ? try_to_wake_up+0x248/0x850
[   76.057690][    C1]  ? sysvec_call_function_single+0x30/0x30
[   76.058377][    C1]  ? try_to_wake_up+0x248/0x850
[   76.059009][    C1]  ? sysvec_call_function_single+0x30/0x30
[   76.059693][    C1]  ? lock_acquire+0xda/0x1c0
[   76.060312][    C1]  _raw_spin_lock+0x2a/0x3c
[   76.060927][    C1]  ? kthreadd+0xda/0x160
[   76.061549][    C1]  kthreadd+0xda/0x160
[   76.062126][    C1]  ? schedule_tail+0xd4/0x120
[   76.062729][    C1]  ? kthread_stop_put+0x30/0x30
[   76.063335][    C1]  ? kthread_stop_put+0x30/0x30
[   76.063933][    C1]  ret_from_fork+0x35/0x40
[   76.064505][    C1]  ret_from_fork_asm+0x12/0x1c
[   76.065091][    C1]  entry_INT80_32+0x10d/0x10d
[   76.065693][    C1] irq event stamp: 4386
[   76.066236][    C1] hardirqs last  enabled at (4385): [<c10f858d>] finish_lock_switch+0x9d/0xe0
[   76.067037][    C1] hardirqs last disabled at (4386): [<c24e7ab0>] sysvec_apic_timer_interrupt+0xc/0x34
[   76.067873][    C1] softirqs last  enabled at (2260): [<c10bb5d2>] handle_softirqs+0x372/0x3b0
[   76.068659][    C1] softirqs last disabled at (2255): [<c24f627f>] __do_softirq+0xf/0x16
[   76.069635][    C1] ---[ end trace 0000000000000000 ]---
[   76.099825][  T636] srcud-torture: Creating torture_stutter task
[   76.099831][  T667] srcud-torture: torture_shuffle task started
[   76.101418][  T636] srcud-torture: Creating torture_onoff task


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

