Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA09F14A0BC
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 02:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747190049; cv=fail; b=bdDgFOTSgpvsvVQ4Sr6A0khtpexuj/iXGP3COZEBEWDyczGjjzTUC5F6QrGHIy/UCMLvn+Tnn3hW+TbDpWsfBFGmoggJU2wCzO2rB+oWtlJl3pHHSD2f43H0Clw8X/kPVUK7BJb/vfg3snbYjLFzPuopxwpFY+vje7307Xt0JX8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747190049; c=relaxed/simple;
	bh=SffvJgcYjeFcDWergAT/lN1xdx8TN6/iuu130nrnso0=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=oMelWRObysg0070PdnzikZAow/PRJUfLHLCOCFqC+vRKuLSFFNO2p06Eb7v3GjOYXT2X/8utn+aZb+VaOLc6ZErvfOMMRri1RghxlQy7ncLewDF50+AUwlM6SzadFEGFxqyKrs1ZZpvzbJ9Fd9IAgz34tftSl4lPHPub5Okz2wY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WmaHocAu; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WmaHocAu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747190047; x=1778726047;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=SffvJgcYjeFcDWergAT/lN1xdx8TN6/iuu130nrnso0=;
  b=WmaHocAuEt74QQD5Z8AUmnrT9KmtbY2pl3FXbFSMh+g94NHBylcKtkIb
   SA2og8rJ6Je/AxRjf2gimwtET7gE700Gxw8bS3QqIA0ce7kB8VqGEe8xG
   Xa8xEi7f0/9929FG3uZNsK3WtqQt/JL873MiTAg0XNIZT7RrFQsw71t5x
   WHl7pUQxEu8qcIvWi13dIL5lgs/Zg83xd2l0571cqy4uOAFfST2Zi0fKm
   sRcvT4/Zx2VyL1CGsoCbLjSSn25jhLBAQHfecnIQ1KiDlfP3gNo5NZ7qV
   HvuEKsJFT3ownhmxNxvIhCF//1Rm6bEMuXkVQ0NsUvjg7FBVl+tBvGMLC
   g==;
X-CSE-ConnectionGUID: dLv/cSyURCWh9WM6MzwDHQ==
X-CSE-MsgGUID: XOTvf97RRrykun/ibHLLjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="49183030"
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="49183030"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 19:34:06 -0700
X-CSE-ConnectionGUID: vhH0Y57oQt2dFsinVtXwXA==
X-CSE-MsgGUID: 1dGlNqoXQeSUj9JinJytuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="142838062"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 19:34:00 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 13 May 2025 19:33:55 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 13 May 2025 19:33:55 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 13 May 2025 19:33:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CuluZpcPjhvKXTZWYDdpHWYeQHviE2r+/o2z1UhE1Viz4ASEw0r5oGh7NspuzPgyc5r4y5/3LxarmPQ6QoFJdXe9wGyHmFrPdiK03XW4ZvuPjr4clKieo4f7yp7049ltq+zsHkczrX9UH4XXLtTprjDEJViMBV5MH0o2CSMGZYCRwiFQ41yjfXhQo8OtuQGVdLVWruLPJ6chJsiI31CWZeC//+Lg0XC3AaWoomqWdQhTPQc3UKP+W7d+HNWy7/cpmXjur98IvbVMcKu0ho7zs0Kvl+XhxmaygHwjN49eLNtv8MYzQzcGFhDA7vUWL60KbhBmXlxPrthPqjPCcNFp7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AMo0CcGyFdJHb9NfaGqwnxLfCwTXBsG1pYzhuPIjtD8=;
 b=r/7EDdddLmmV2Xm6TJyXK973w8ErO5V1POVkKb2AMyXhCysbGn9Pji2EdUII+eM83k6pkDmDMZCuFes/W44nZf6knlTTGTZFqS5OA7VfGRPkJFdaRNuiP1Y4NWFKtT86tuKvXw5RsvfsM6wYo2pY97NsVqC3XyEHVasUf9cTEFGD2QG3Bo9Wu0lQkur3qlZ/Dh7vHE35ym8i3crvwYDA5N32STgAKJ4TwEPyqsv6EB/S8V69lUds+miOdqyO2sof5zS6AEcHPLZLiLmQBOMP9A0Ckes084zJRK1lvYNpdb5hKE5buSfdaakYqQibNo6OI7NLmCFPwxnbQgPnE5Gfcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by DM4PR11MB5295.namprd11.prod.outlook.com (2603:10b6:5:392::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Wed, 14 May
 2025 02:33:53 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 02:33:53 +0000
Date: Wed, 14 May 2025 10:33:43 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	<x86@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
	<linux-mm@kvack.org>, <oliver.sang@intel.com>
Subject: [tip:locking/futex] [futex]  bd54df5ea7:
 will-it-scale.per_thread_ops 33.9% improvement
Message-ID: <202505131609.20984254-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR06CA0231.apcprd06.prod.outlook.com
 (2603:1096:4:ac::15) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|DM4PR11MB5295:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d8927ab-bb1b-401a-4482-08dd928fc47e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?SpEdR0RdAAurtUWQIla2jrqJyXDk8WECpTwlOBsXTdWm/6sRoc4FdKZXqi?=
 =?iso-8859-1?Q?ezODBt4PvRDxlcG6wIUFrZMgujAa9Zi6STa8dQ5M5xZDAxEszSYClK4mzB?=
 =?iso-8859-1?Q?rfg/LgmxEnc9egrB12GU8rYrXIQZsUJ/4Exwdr8iAHA+Gl7druhoJ8OGw6?=
 =?iso-8859-1?Q?wwGocQZUYRBJSUH/GIkaCo3jfJsFdJ6Wf2ui9PC9qtVb4ElkjQhwGAN4iI?=
 =?iso-8859-1?Q?y/e8+j0oyX9feoLr+CRgJc/xQRibz3SPzpxPrnvQY5w9FVZYRg/x35Af8m?=
 =?iso-8859-1?Q?Q3f0TmWfh0zU5zeu0djtnc0e07+o+unh5HK2oQHgksR/64Y7gAmSOiOy4d?=
 =?iso-8859-1?Q?NdAkXOblRSTgRucZvKlO9L4PBuCCl33E8xNk7sYot+MuDREFFZzhMz4SK2?=
 =?iso-8859-1?Q?TZtXOPTzFvM06gYYI0ucJt4QNbBKXyWAXtl7ARQ2a3XKQOfCj1soSTiAN2?=
 =?iso-8859-1?Q?Ctpyc6dN8kBLeDSIPIUOqCPs+tNeaYpglkanruE6WU4otqC1JYonL6OAKN?=
 =?iso-8859-1?Q?OXMS3Kk7GIO0yKnIbSyHEv0pGCu2Sk3FhgRFbwl3PTznZJYE5oxIUIMyV7?=
 =?iso-8859-1?Q?6KC9cBZXRcj/tjQUMXrBM7d4qRO6VQ03H/QKa4FQ3H6S1CyM/L9Ji/nxbK?=
 =?iso-8859-1?Q?s9tzX1Rs/kFDfUg+4b4++YnZGeZVZq4QUSJpDV2/HLR6+ghHUh7M03Vvm6?=
 =?iso-8859-1?Q?zfLNaQ0WHLfBt1/4QwonkS2y2t79yRf6+l+dsC1Imf/1p/0Rx9rnlZLmjI?=
 =?iso-8859-1?Q?5rldKCpMkly9K1aXKWn2iSlAHmKHb5cXDOTp6DSuwf/EH3bckfcTwwgejJ?=
 =?iso-8859-1?Q?4IsjjBD9uIE0MUv7h7rNN4zwaZYDRp5nQyuI0E+rTp10jbr9wQPzXtkKmq?=
 =?iso-8859-1?Q?+rWq/pYYzNyJ1AbEglweNFsPqjqYRzYbGES6s+44W5xqZm7B6r1sNuo4h+?=
 =?iso-8859-1?Q?YOFqiInQBqxrpYvlpPNl3B4n3eE5YIUUewvM+kV+S4pzHG88y9xKqnvVmg?=
 =?iso-8859-1?Q?cACBRk19/Mq7K/ULHyAnz34E6u9/GtNBxR141CCrm+OHlM8JpMfadx999Y?=
 =?iso-8859-1?Q?RBiRMgT7CFg3i8+T/VoD01eNw9Hcy+cZK5J49JqqxarC55/sahwv/IrDDz?=
 =?iso-8859-1?Q?qz2sIAKHn4Wj2AdpMhGSXnh31jKa1D+AZLp4R32lVTVTg1Pcq/AOnNroY8?=
 =?iso-8859-1?Q?5CFnOHviVE4ApVeLIU2Yf/4VFneZkE0XSYWX7fh8M86Np2keK52dW3MVw9?=
 =?iso-8859-1?Q?a/ZBwhHhMEEud30eED6OYTEmnk03g7kvuP3Uj+zIJvlmQP9syLv9U4pgp0?=
 =?iso-8859-1?Q?c/r1JpxVovOyB8vbh5TKs0ZUNmSXW1K+2bOUlhIqfTpULuIdk8TBZfADMj?=
 =?iso-8859-1?Q?032w2vTiTG+0BvONQamw7xWiPj1oxNDOJfw+rmSosOigBk4b3Gj4Vp6M26?=
 =?iso-8859-1?Q?qEAnzW6ijE0mn15R?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?tyZzKuFofZmM6gkj+WdZr0mIyEpz4C2TmbbtejK6VRf5pIupGJ7QF6lXiL?=
 =?iso-8859-1?Q?S7Zp7G98TneQIc3qd7xIe1xINTZddHdKdCEjEPfoIsd4qsxd6a+ObCWQhs?=
 =?iso-8859-1?Q?Z0ZQ0x6AINwRfV/2jTh+iZne9JihGYvtDaNl3fBWJnlhA3E5hi0Sm4Ww1F?=
 =?iso-8859-1?Q?zlove9g0/R1POkGHIzj9f4HtZLSPNzZ7JBi+fPzzYocnLhq0VRUfVhkz3E?=
 =?iso-8859-1?Q?Ft5w1xenPgU+mW1//Hlci2OIfb9c0k7azyKZRyJiaP0zfPfNyUZlcuyp4J?=
 =?iso-8859-1?Q?vhYXp4hYcsObWv9VWqLxWIf5+fOuegI45k2AZIk5j2MxyRx2Gi20BFAwU4?=
 =?iso-8859-1?Q?6QoN8GTywDGRmpVgH0xbOU5m/Hx2IQf53vw/nzeXbhTdqLFz+1N1R0rxCn?=
 =?iso-8859-1?Q?4+ca+lf+QeBqv7J+vq1dd7d4BZX348/S3mSbgtyr9Pr/8v91ULgGd9GnMq?=
 =?iso-8859-1?Q?5zmcBpmUAUnlIf0AHmRl1xZoU/8zH+tCKGCaEYNuZ0A6knmdGwY8rlkras?=
 =?iso-8859-1?Q?e0zsYecHnbS/tyXIks1YSuIMsrC0l88/bM13zm27uUNBFJg/kdQ4IyDQH+?=
 =?iso-8859-1?Q?Gbscvr/6DboCN1B1/1MSSNiX3XUrvyF+73803GPi4udKD5vjfoSqmmS7ga?=
 =?iso-8859-1?Q?1hm6QDetjUg4DO4/kalpfzOHiX/u0MQw91YdoMuKTiNf9flEBtq1UPkTqo?=
 =?iso-8859-1?Q?pQpfvDi0Kh6AKL1NvoJtRIOo9Mls/HWoo0X3TzFrJZCDeIo46bny9xPwu1?=
 =?iso-8859-1?Q?GaIYX9LkEC6MEdIjPg0wKfVoIiQ7bccXzJWDvU2zLMMW37W9eyRAM90svO?=
 =?iso-8859-1?Q?617fZds2ti16lgeMqvAqNoeI4PXZfN3t1dm56gmHIyjlqm9nGHcRiaaVP0?=
 =?iso-8859-1?Q?DuSuGYWPQovaqNdv+jZJwtVVsRPl3huzLnaVAf3lB7uLvDRqLLvdDBSleL?=
 =?iso-8859-1?Q?B4mOfHxXQYKLjVTgX40hGx16PVcBK6V5F/4abTtfREAw4bH4ezr+hKSb3W?=
 =?iso-8859-1?Q?JGDYIcmjHA6TfGiQQ0ZKvZS26VE2DGqvoWDocKsZVszhYSYsm80qmYrt3f?=
 =?iso-8859-1?Q?wghAbSneWp56n9AGOoBdjg8yy5fY7h97VzXFfOMurrriHVtbf4N0mNRNFJ?=
 =?iso-8859-1?Q?W3eJt8ZBV8ggICQyJ2GQStQsIET/LNza6FuHs3FJoAA2O40ojqruJkED8q?=
 =?iso-8859-1?Q?gBliUt16ahlQctIkAN75BN8NWxvcuMrsviZXZyj4dhkgoa5EctBl+Boh/H?=
 =?iso-8859-1?Q?xkY55325MDaQEyO3BDxHDq6GClatqc4pN7EPTKBOdaryOG5hj+PWBpozUH?=
 =?iso-8859-1?Q?+7e2MVkzSuK2B+Xgw52fL3XX++sE8O4uCH0uH6dvLzurAxTFhlaYTKXIEX?=
 =?iso-8859-1?Q?NUI+Px5zZGIm1BcEDyBWrXeVrPJq5lRw+gMFhlOarZzA4g9HtkToxPT3SI?=
 =?iso-8859-1?Q?mbzTdv3FBSuGCloiWFVJpVKONuMZW/pEsIjUjCxSJZwd1dH6OukfZNOFGW?=
 =?iso-8859-1?Q?jnHByoOAXKRxZgmUuiojQAGgkFaBo1VbhPXtbVmJkhP2cWxe4fl7b3/8wT?=
 =?iso-8859-1?Q?RQOzMTDyKJH8OEJzcfX3JSpdh5hZdcMt5bX43PB6Q+jMiQjmbuRCsrsN+X?=
 =?iso-8859-1?Q?+nvuKcRwI6lUeNGj4qpF9Pi0YTJEVTRQPboDA1mNfNWjq/JrZXhltlmg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d8927ab-bb1b-401a-4482-08dd928fc47e
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 02:33:53.2273
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wh/J6c//WqLY9m3U/Ugt1vTi8hHt/N8AU9BvdYyLv54QdLw1o/jSYX9qhKfvh9R5fXd7jkrGoVpWTMDKlTzfRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5295
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 33.9% improvement of will-it-scale.per_thread_ops on:


commit: bd54df5ea7cadac520e346d5f0fe5d58e635b6ba ("futex: Allow to resize the private local hash")
https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git locking/futex


testcase: will-it-scale
config: x86_64-rhel-9.4
compiler: gcc-12
test machine: 256 threads 2 sockets Intel(R) Xeon(R) 6767P  CPU @ 2.4GHz (Granite Rapids) with 256G memory
parameters:

	nr_task: 100%
	mode: thread
	test: pthread_mutex5
	cpufreq_governor: performance



Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250513/202505131609.20984254-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-9.4/thread/100%/debian-12-x86_64-20240206.cgz/lkp-gnr-2sp3/pthread_mutex5/will-it-scale

commit: 
  7c4f75a21f ("futex: Allow automatic allocation of process wide futex hash")
  bd54df5ea7 ("futex: Allow to resize the private local hash")

7c4f75a21f636486 bd54df5ea7cadac520e346d5f0f 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
  23570282           -32.6%   15883630 ±  2%  cpuidle..usage
   1862635            -9.3%    1689404        meminfo.Shmem
      2110           +19.0%       2512 ±  3%  perf-c2c.DRAM.local
      0.16 ±  4%      -0.1        0.08 ±  4%  mpstat.cpu.all.soft%
      0.63            -0.2        0.46 ±  3%  mpstat.cpu.all.usr%
   1264859 ±  2%     -47.5%     664434 ± 62%  numa-vmstat.node1.nr_file_pages
     38897 ± 10%     -47.8%      20323 ± 48%  numa-vmstat.node1.nr_mapped
    206687           -33.5%     137401 ±  2%  vmstat.system.cs
    427708            -8.0%     393532        vmstat.system.in
   5060133 ±  2%     -47.5%    2658326 ± 62%  numa-meminfo.node1.FilePages
    158778 ± 10%     -48.5%      81837 ± 46%  numa-meminfo.node1.Mapped
   6620342 ±  2%     -38.3%    4086741 ± 37%  numa-meminfo.node1.MemUsed
   9566224           +33.9%   12810946        will-it-scale.256.threads
      0.18           -11.1%       0.16        will-it-scale.256.threads_idle
     37367           +33.9%      50042        will-it-scale.per_thread_ops
   9566224           +33.9%   12810946        will-it-scale.workload
      0.00 ± 15%     +29.7%       0.00 ± 15%  sched_debug.cpu.next_balance.stddev
    124704           -33.5%      82964 ±  2%  sched_debug.cpu.nr_switches.avg
    230832 ± 52%     -38.2%     142628 ±  5%  sched_debug.cpu.nr_switches.max
     98911 ±  4%     -33.7%      65543 ±  3%  sched_debug.cpu.nr_switches.min
     17307 ± 60%     -47.4%       9105 ± 20%  sched_debug.cpu.nr_switches.stddev
    672002            -6.5%     628169        proc-vmstat.nr_active_anon
   1345624            -3.2%    1302363        proc-vmstat.nr_file_pages
     41725 ±  7%     -16.3%      34939 ± 12%  proc-vmstat.nr_mapped
    465688            -9.3%     422425        proc-vmstat.nr_shmem
    672002            -6.5%     628169        proc-vmstat.nr_zone_active_anon
   1956811            -2.5%    1908264        proc-vmstat.numa_hit
   1692181            -2.8%    1644262        proc-vmstat.numa_local
      0.20            +4.3%       0.21        perf-stat.i.MPKI
      0.05            -0.0        0.05        perf-stat.i.branch-miss-rate%
   9101814           -10.3%    8161953        perf-stat.i.branch-misses
  14404131            +3.7%   14939924        perf-stat.i.cache-misses
    207911           -33.5%     138184 ±  2%  perf-stat.i.context-switches
     65204            -4.0%      62625        perf-stat.i.cycles-between-cache-misses
      0.01           -95.2%       0.00 ±223%  perf-stat.i.metric.K/sec
      0.20            +4.2%       0.21        perf-stat.overall.MPKI
      0.05            -0.0        0.05        perf-stat.overall.branch-miss-rate%
     63438            -3.5%      61223        perf-stat.overall.cycles-between-cache-misses
   2250086           -25.7%    1671327        perf-stat.overall.path-length
   9086343           -10.4%    8139691        perf-stat.ps.branch-misses
  14400345            +3.6%   14922252        perf-stat.ps.cache-misses
    207422           -33.5%     137839 ±  2%  perf-stat.ps.context-switches
      0.16           +99.2%       0.32 ± 95%  perf-sched.sch_delay.avg.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      1.66 ± 12%     +17.5%       1.95 ±  3%  perf-sched.sch_delay.avg.ms.__cond_resched.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
      0.08 ±  8%     +37.8%       0.12 ± 20%  perf-sched.sch_delay.avg.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.01 ± 12%     +47.5%       0.01 ±  5%  perf-sched.sch_delay.avg.ms.futex_do_wait.__futex_wait.futex_wait.do_futex
      0.09 ±166%   +1763.7%       1.74 ± 65%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
      0.09           +16.3%       0.11 ±  3%  perf-sched.sch_delay.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      2.98 ± 14%     +28.2%       3.83 ±  4%  perf-sched.sch_delay.max.ms.__cond_resched.shmem_inode_acct_blocks.shmem_alloc_and_add_folio.shmem_get_folio_gfp.shmem_write_begin
      0.18 ±  5%    +248.1%       0.61 ± 63%  perf-sched.sch_delay.max.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.15 ±186%   +1714.0%       2.76 ± 49%  perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
      0.01 ± 12%     +45.3%       0.02 ±  5%  perf-sched.total_sch_delay.average.ms
      2.91 ±  2%     +61.4%       4.69 ±  4%  perf-sched.total_wait_and_delay.average.ms
    556081 ±  2%     -37.0%     350186 ±  2%  perf-sched.total_wait_and_delay.count.ms
      2.89 ±  2%     +61.5%       4.67 ±  4%  perf-sched.total_wait_time.average.ms
      0.01 ±  6%     +35.6%       0.02 ±  3%  perf-sched.wait_and_delay.avg.ms.futex_do_wait.__futex_wait.futex_wait.do_futex
     18.90 ±  3%     -15.5%      15.98        perf-sched.wait_and_delay.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
    541651 ±  2%     -37.0%     341352 ±  2%  perf-sched.wait_and_delay.count.futex_do_wait.__futex_wait.futex_wait.do_futex
     11.50 ± 18%     -84.1%       1.83 ±223%  perf-sched.wait_and_delay.count.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
    253.67 ±  3%     +17.1%     297.00        perf-sched.wait_and_delay.count.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      0.09 ±166%   +1763.7%       1.74 ± 65%  perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
     18.79 ±  3%     -15.6%      15.85        perf-sched.wait_time.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      0.15 ±186%   +1714.0%       2.76 ± 49%  perf-sched.wait_time.max.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
     43.55            -1.5       42.06        perf-profile.calltrace.cycles-pp._raw_spin_lock.futex_wait_setup.__futex_wait.futex_wait.do_futex
     43.54            -1.5       42.04        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.futex_wait_setup.__futex_wait.futex_wait
     43.83            -1.3       42.54        perf-profile.calltrace.cycles-pp.__futex_wait.futex_wait.do_futex.__x64_sys_futex.do_syscall_64
     43.83            -1.3       42.54        perf-profile.calltrace.cycles-pp.futex_wait.do_futex.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe
     43.76            -1.3       42.48        perf-profile.calltrace.cycles-pp.futex_wait_setup.__futex_wait.futex_wait.do_futex.__x64_sys_futex
     99.06            +0.2       99.25        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe
     99.05            +0.2       99.24        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
     99.03            +0.2       99.22        perf-profile.calltrace.cycles-pp.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe
     99.02            +0.2       99.22        perf-profile.calltrace.cycles-pp.do_futex.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe
     54.99            +1.1       56.14        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.futex_wake.do_futex.__x64_sys_futex
     55.02            +1.2       56.21        perf-profile.calltrace.cycles-pp._raw_spin_lock.futex_wake.do_futex.__x64_sys_futex.do_syscall_64
     55.19            +1.5       56.68        perf-profile.calltrace.cycles-pp.futex_wake.do_futex.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe
     43.83            -1.3       42.54        perf-profile.children.cycles-pp.__futex_wait
     43.83            -1.3       42.54        perf-profile.children.cycles-pp.futex_wait
     43.76            -1.3       42.48        perf-profile.children.cycles-pp.futex_wait_setup
     98.55            -0.3       98.21        perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
     98.59            -0.3       98.28        perf-profile.children.cycles-pp._raw_spin_lock
      0.37            -0.1        0.26        perf-profile.children.cycles-pp.pthread_mutex_lock
      0.60 ±  3%      -0.1        0.49 ±  3%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      0.58 ±  3%      -0.1        0.47 ±  3%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      0.20 ±  5%      -0.1        0.10 ±  9%  perf-profile.children.cycles-pp.handle_softirqs
      0.18 ±  5%      -0.1        0.09 ±  6%  perf-profile.children.cycles-pp.sched_balance_domains
      0.21 ±  4%      -0.1        0.12 ±  4%  perf-profile.children.cycles-pp.__irq_exit_rcu
      0.17 ±  2%      -0.1        0.11 ±  3%  perf-profile.children.cycles-pp.common_startup_64
      0.17 ±  2%      -0.1        0.11 ±  3%  perf-profile.children.cycles-pp.cpu_startup_entry
      0.17 ±  2%      -0.1        0.11 ±  3%  perf-profile.children.cycles-pp.do_idle
      0.17 ±  2%      -0.1        0.11 ±  3%  perf-profile.children.cycles-pp.start_secondary
      0.11 ±  4%      -0.0        0.07 ±  5%  perf-profile.children.cycles-pp.acpi_idle_do_entry
      0.11 ±  4%      -0.0        0.07 ±  5%  perf-profile.children.cycles-pp.acpi_idle_enter
      0.11 ±  4%      -0.0        0.07 ±  5%  perf-profile.children.cycles-pp.acpi_safe_halt
      0.11 ±  4%      -0.0        0.07 ±  5%  perf-profile.children.cycles-pp.pv_native_safe_halt
      0.11 ±  4%      -0.0        0.08        perf-profile.children.cycles-pp.asm_sysvec_call_function_single
      0.10            -0.0        0.07 ±  5%  perf-profile.children.cycles-pp.__schedule
      0.11            -0.0        0.08 ±  4%  perf-profile.children.cycles-pp.cpuidle_enter
      0.06 ±  7%      -0.0        0.03 ± 70%  perf-profile.children.cycles-pp.futex_do_wait
      0.11 ±  3%      -0.0        0.08 ±  4%  perf-profile.children.cycles-pp.cpuidle_enter_state
      0.11            -0.0        0.08        perf-profile.children.cycles-pp.cpuidle_idle_call
      0.08            -0.0        0.05 ±  7%  perf-profile.children.cycles-pp.sysvec_call_function_single
      0.00            +0.1        0.05        perf-profile.children.cycles-pp.futex_q_unlock
      0.07            +0.1        0.12 ±  3%  perf-profile.children.cycles-pp.futex_q_lock
      0.00            +0.2        0.17        perf-profile.children.cycles-pp.futex_hash_put
     99.22            +0.2       99.40        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     99.22            +0.2       99.40        perf-profile.children.cycles-pp.do_syscall_64
     99.03            +0.2       99.22        perf-profile.children.cycles-pp.__x64_sys_futex
     99.02            +0.2       99.22        perf-profile.children.cycles-pp.do_futex
      0.00            +0.3        0.33        perf-profile.children.cycles-pp.futex_hash
     55.19            +1.5       56.68        perf-profile.children.cycles-pp.futex_wake
     97.95            -0.2       97.71        perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
      0.37            -0.1        0.26        perf-profile.self.cycles-pp.pthread_mutex_lock
      0.18 ±  4%      -0.1        0.09 ±  6%  perf-profile.self.cycles-pp.sched_balance_domains
      0.08            -0.0        0.06        perf-profile.self.cycles-pp.futex_wait_setup
      0.07            +0.0        0.12        perf-profile.self.cycles-pp.futex_q_lock
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.futex_q_unlock
      0.00            +0.1        0.08        perf-profile.self.cycles-pp._raw_spin_lock
      0.00            +0.2        0.17        perf-profile.self.cycles-pp.futex_hash_put
      0.00            +0.3        0.33        perf-profile.self.cycles-pp.futex_hash




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

