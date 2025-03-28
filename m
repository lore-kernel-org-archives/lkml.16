Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57AE15746E
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 01:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743125099; cv=fail; b=RD7BlaRTS3rWyn6vyj+SMjoFwkzkS9SQ1ATf+OvL/OJEvtCJS+6AxRrHIqJgNsGlkE8sSRNEcg6XokL5VdRKCBGAPSnWDGZpg1RD7kelCmp/5E/a1gU9GLsz4ETvhSKtHWQg4kwSrmoqdtiCcnpFi89n45Bt4Ua4pGyo7USO6R8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743125099; c=relaxed/simple;
	bh=33iGc+/VPpHAzmZ1IrCp2rVOHUQPZrK3k7kk007AIsc=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=IG6WF/9ej5knLItoBH1e1p8GUFtZrwIUZZknn8GRLCRINGyJoCyxW5xgyjrMOpA/mJlLX4rhj0uKQUVNDsQEOKqY9cFo1BD26iMw5rGZuGv7Pz+q70OYeLALFBrmlKD8X7JGinyhvNuo1CnrO/tPRtTKCOnADydRBFObDfA4ZZA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kAdd38GQ; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kAdd38GQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743125098; x=1774661098;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=33iGc+/VPpHAzmZ1IrCp2rVOHUQPZrK3k7kk007AIsc=;
  b=kAdd38GQdkvMVSKAKYoyyTm25vwXbwG29uAHEzL5oP5KwNrNyRzaNczm
   UNUsJq1iMSm7gzCBn6L9ZZU6tiW5cFWpqAfEsVde0jCPhAKMgq74JTZTV
   wk2MIdYRmyL5PuAQKKVDMw9wy8VIyat0l9FMcV84pbSSsg5OgB9vvI2rV
   mBppnBB98+CcLbe4sAlkd7Ko32Bt5d6sBch4ezKsHVYvitvDx3zEwu82B
   7eHEzsda9G521QjB8sjAY2xN4dpi64NUVoRjmi9SAefGJDGrHKBj3kREb
   0TJbUUFcNJl6rJRbdpS0araxoqYuyw5fifn3DrHRt6/jFi14cq5FD2DWT
   A==;
X-CSE-ConnectionGUID: T3qey88sSyuKkXs4g3Lobw==
X-CSE-MsgGUID: 6rhktUDDTT6HHyZypk4+dQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44360794"
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; 
   d="scan'208";a="44360794"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 18:24:57 -0700
X-CSE-ConnectionGUID: wxiSjr/hQ++4DBYYEUn52A==
X-CSE-MsgGUID: jF+ZNJKqTcumY+fx2Vqf0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; 
   d="scan'208";a="130511776"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 27 Mar 2025 18:24:57 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 27 Mar 2025 18:24:56 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 27 Mar 2025 18:24:56 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 27 Mar 2025 18:24:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nq1mprmT5OrK03cDGdlEbg7IRqCC225yeSaymnD7XaZeZld2xiylYOTNTGocT6WpE4Cp/5lrViU+oMhbovKDubHRTvgX8kvBGeoIJxMXYU14e6ASqeGUrEnanKIX+MWzEahl3b2XnokqT8fnnbZ6HK1UFsWukHWhOu5W5VbqKaubn0OgliTz/fNmldMmn5sMXC5M2vlM4bukx7OMfatCqIS9IaCvZZoSJHvKyAI8m7KpWb9UYfVl5ltEBaJMqV1rj26PuXLSQAkdt6Zk84GnVnAiwK4aAYw2rcvUi5mwFmv6cqvRDuVC2elD6rsn9SOVprj11PoIOvAMtYdjhC/fpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mHCFzRX+m29HSvEj1FHVYxJ9ydcY2Q0F29BwuqIZsQk=;
 b=j0c97KZ3YqYRegdaeckIbPKIMGplL+o5Ng+KUoMjIpbv2VbktbiAt37JM0AXLblpEEFR7SEsrLURTm5MYAV3IjueVNYde+y94u+CpCRS12w+qj1isJbreIktW1/i6iYbP02CnoMqdESnUPoyVyrQn+5y9njxcGWdd03d87EJqM6ZK7jSsKphRpy3Pi5o5mxV9IhjIssIxjew/TzekR7tkGSWlesBCssJl3UkZKKa3mz7sLELtseAV+E+enzTBQPpnfS3ZJg3pJGQzNdrp1hd+pzFI7iUavHDwgHSH2Aaa7HCxgKGhVeyB7s+J2hml7I/CPoVf4jq40uI96ueHdYgXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by PH0PR11MB7586.namprd11.prod.outlook.com (2603:10b6:510:26e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 01:24:13 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%4]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 01:24:13 +0000
Date: Fri, 28 Mar 2025 09:24:05 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	<oliver.sang@intel.com>
Subject: [peterz-queue:sched/hrtick] [entry,hrtimer,x86] c07c4e0c01:
 BUG:soft_lockup-CPU##stuck_for#s![schbench:#]
Message-ID: <202503280925.27fefb28-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SGAP274CA0021.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::33)
 To LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|PH0PR11MB7586:EE_
X-MS-Office365-Filtering-Correlation-Id: 7876284e-1066-4f64-b633-08dd6d973fae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UIj2WWOZ2GX4J8EvHz1+aTTBj3k4tM+ycYG9+shAW1koI2LNxLdH/BpLMQtZ?=
 =?us-ascii?Q?oZjGYpq2Nm5TKs5+erpiFUmUQWZvWXPHdTm9eIWjs370fngsNqNvpS5te3ZU?=
 =?us-ascii?Q?OT4OSBnHGGjOC3keGoNh3yU6KdLLb1sEjD7jm6k7cNiMx9B0kbbB2DQqjrqs?=
 =?us-ascii?Q?0DUvZOC+U7RpCyoHKlZDNlcp5tiHpzRJFykN4zk3P77cG5aYJU+vrBAmcqoa?=
 =?us-ascii?Q?N8tozNrllC8kkcEWO8sA4yW5F/1dN5F6y7om6oX630NaSNWB2sz3qa33M/qx?=
 =?us-ascii?Q?XzreBygkQaYWKXGdqfSSBeL/a4nc9qk0JLNZDdlpXZxKr0/8eunFDadNi+d5?=
 =?us-ascii?Q?Z/fApUNxwNyYzZCGusPkKG0sycko59yuDsD4nMZK2ts9uyvlKn4sAaNOHLEs?=
 =?us-ascii?Q?zJqcgYMWyJhCnFWL3axVK0+kxPH6YFl0dfK4Y/QOjlLRcZI/o29rvh38MLuR?=
 =?us-ascii?Q?+11aKb7T85ei+TK/UTS9BH13D/g+9g41WlaVB6/BTDmrSsoJHM5VWyNDYR69?=
 =?us-ascii?Q?MxzzA+i0AgGsAWt1P2/Q/IW1oHKkmNt8LzY84Mh2hd2Z+0tibVUXWmddGGpF?=
 =?us-ascii?Q?BPrfgFU3W1GUzM5+SQzYSkVUPNNEPyhttE+nz1WLIN7pswLKCEeCQg5+v1Kl?=
 =?us-ascii?Q?CZQyKD2qgDn7LNCyTjhiQDwRzm9ZTEty4JJAPUqTN5wBJm6yzbwImCTWav6L?=
 =?us-ascii?Q?pppQD0FekGpEbFhQ0RxFn1Zj1Mr2exsWmfzpSV/pvb7jkqIJzqT/OavCk8bF?=
 =?us-ascii?Q?NnSMm2OMH9tg8QJS/4Jh7HtMQaVdtaxvq94zQSjztVSehaOGBypnjExBKq9X?=
 =?us-ascii?Q?hl4g9z2n7UJpjjwLgm7c8zDs9atwUWUwB28RhwC5YVaU4DwEEOZh1/RcohdD?=
 =?us-ascii?Q?VqAHOCZ7kWCwdBDD6mN9Juz5v79sMQL75KIKI+NzFp2zd0erGSOQA4mq4Hil?=
 =?us-ascii?Q?pXFYRJB885H9ywg1bSxAQ4RLLfFk6+damcXBvbhQ8MSTyXUjMmDIC1JTXfOr?=
 =?us-ascii?Q?i5+bsoarjrp84c7jQbFxW3afx9oFXdTAzPJpO6lv+VeVhN9AabMFxxI1Rw6q?=
 =?us-ascii?Q?GRPmTX7ieNZc06eg21eABUbnKJ/EfnVR2CtPFxUXc4il2yXAz5HkvivxGWuS?=
 =?us-ascii?Q?NhXMUzkfP9ONM+vO5CphmV8jKYeHrUuen760LMS1AZiAwj7p4d9JxudUbmAU?=
 =?us-ascii?Q?c3v5+OMJqWKFuD2IYDGl44c4f+oQiEk86yjmiIoEoby10sOvEdkM+XE91GKw?=
 =?us-ascii?Q?UY40ZBBOeJW6hI6Flm2h7Uo6odx+qyvR9fGhCcvODLFzBHWDDrjALmARo5iU?=
 =?us-ascii?Q?AADJjciDsF9VTMB1OFL+TrcAin89XOOTTENMdIqRzrKmPg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kyeHkohmYdfWXPV5zvTezdbJqYB0bBEF8kUBL3m1dPI1uKoTPLHn/t4LPr5t?=
 =?us-ascii?Q?tafPN9/QJy3Yu1yxIqZJVybCWDdAnub2TJaOsKT4QBDRnfIAa3CoUujqaiTB?=
 =?us-ascii?Q?syM+sL8t/SUgeB9c2sJG7OvgoiD5siNJNJX+RrBM0DWqatlhEwrQ9EvSqYIk?=
 =?us-ascii?Q?xRxCkkkTMpk9VU06kLKO+XFiRE6WCKP40xCe+vpNaT11J6EI2Df2KTgeQm+3?=
 =?us-ascii?Q?JSKPcNoR6pjLana8wL5ynDoETFI/ngmJHY6bzqg96Soc2pTZLNX0HNRJV7Vl?=
 =?us-ascii?Q?YDCd/z28uPEUf+x2wlTYR7gu+ExX50jJDT/Fh1eyvXkpG3Q/jilZ67/UipuF?=
 =?us-ascii?Q?9SBT+zafuDUWaqrBB0eT5/wq77clbrNKfHAdpdLiOf8n4q21iTaHRqeLW1VH?=
 =?us-ascii?Q?6e8nX+mDrA4xsAlmxnKrTA5wi6seiVlvu4lU3TgwaRIh0Kp8d+ccJw5Vo/o8?=
 =?us-ascii?Q?M+VFrVuRq8doXmsGtUisdE1/XBKmUybwsijlGPUqW8ngXil8BJbswyxpLHsd?=
 =?us-ascii?Q?H5eC2+/3A4xiM71reY1udERPUctqMvMRdYhiBd/V8VfDvu0+0PXGsZVWBfXY?=
 =?us-ascii?Q?MUuF5ggTelcSD9O4axdOcKLRAeEUAmCdL5NqmWESFJ9iH27U3pIdf00q+vj0?=
 =?us-ascii?Q?huJ2Cn9Q7Om0mKGHFqyeNpJwPfXamlX6+I3/rkLCvqwfM4YSaXbL30wMfaB5?=
 =?us-ascii?Q?MgETgKR6wAlJKgtGcKp4WZ5EmjA0lCHvjQyS2TmH19FJYbdRyuBXkKWLKqrq?=
 =?us-ascii?Q?G3o+vIGIWQFH+a/zlvL3XQdoNSRbzs9mTqfMK+QBW/zn5EepzfToELnKMgxf?=
 =?us-ascii?Q?vSlI5TTl1tr7rDK+bR95LPwrzR6OmSr4O2O7R01GJ3z8nyVBRu92vqvmEN49?=
 =?us-ascii?Q?ROscfsqX5MP1N5hi50lA8yLKNPR/pDZTEYH3GP21SM9MTh6QEg/uNU0yhuOx?=
 =?us-ascii?Q?jaXRxyPBeeKK7igegTISvgSDUZqZCN7uhuMjgGHRvlDfk7GIAft14jtxkhqz?=
 =?us-ascii?Q?Kka7Q9DJB2dPR7yhopziesPY2KCjKB/pWe13eU9pxV1Hm+AhyuiiOfdE8Bns?=
 =?us-ascii?Q?KL+A4OKezFcz+CFFt+ayn/CgQW14AkRjU319mZBkuL5ZdhJsk9gTNznPCxwU?=
 =?us-ascii?Q?+f7WNqZBhKZnwnQgzh+Tepak9BGdxV3PEVvV2aaSFUi0l2lCEGyhNrJq8T4Q?=
 =?us-ascii?Q?9S4z+z1bIPnOtUvCj4Rs1E1WxSgucW1SMIHhDUHm2+En6I7WRydmNPcZBGte?=
 =?us-ascii?Q?D0EmE4XxqhW0u04pbwEj7SPPkV+UYnvwgvMNIn9EkDeDzpJHnY7eJ0sysDD2?=
 =?us-ascii?Q?NB/J5VDVL4tsU68mJDNH6/sh/rl0VJ3Hg26EO4NQcRWi0SQYSJIPNN6ZdNjT?=
 =?us-ascii?Q?HJqLYbwN/lCCRjAO4qJyIAaTnOlso5Hj4dvsHmf0VqO186jkWVN7CpjTXOqi?=
 =?us-ascii?Q?gxao8wn1igFZcKV/mtV4mhiY90T6xeUWKScj9Ry4auwpSxzfj4cYMz3a+qgV?=
 =?us-ascii?Q?ThmeKaFNizzwtgl2QjxC7nYLBhoZILPfWMbkUIhT5mDAdQodVf3uCM/aFIg1?=
 =?us-ascii?Q?QVqmlQYaCcCkPNQ+CzM6y83womiz0/EsAPc9sS5L4PhjJDW0NXyBcM2R1Sz9?=
 =?us-ascii?Q?cA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7876284e-1066-4f64-b633-08dd6d973fae
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 01:24:13.5560
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zqzhA1cbsJxkmFkxCmO8pq9GOnxg6ihXe0kQYi11BaYxwrJ2Kq7gtiNhaMou7XW+wKDq2+FYgV0VIA8uY+Hekw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7586
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "BUG:soft_lockup-CPU##stuck_for#s![schbench:#]" on:

commit: c07c4e0c013dc11dd466fa63a4af12ef8282b27b ("entry,hrtimer,x86: Push reprogramming timers into the interrupt return path")
https://git.kernel.org/cgit/linux/kernel/git/peterz/queue.git sched/hrtick

in testcase: schbench
version: schbench-x86_64-48aed1d-1_20241103
with following parameters:

	iterations: 3x
	message_threads: 10%
	worker_threads: 128
	runtime: 300s
	cpufreq_governor: performance



config: x86_64-rhel-9.4
compiler: gcc-12
test machine: 128 threads 2 sockets Intel(R) Xeon(R) Platinum 8358 CPU @ 2.60GHz (Ice Lake) with 128G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202503280925.27fefb28-lkp@intel.com


[  120.056174][   C17] watchdog: BUG: soft lockup - CPU#17 stuck for 22s! [schbench:4939]
[  120.056179][   C17] Modules linked in: kmem intel_rapl_msr intel_rapl_common intel_uncore_frequency intel_uncore_frequency_common device_dax nd_pmem nd_btt dax_pmem i10nm_edac skx_edac_common x86_pkg_temp_thermal intel_powerclamp coretemp btrfs blake2b_generic xor raid6_pq sd_mod kvm_intel sg kvm snd_pcm ast snd_timer dax_hmem ghash_clmulni_intel rapl drm_client_lib ahci cxl_acpi snd ipmi_ssif drm_shmem_helper intel_cstate isst_if_mmio isst_if_mbox_pci acpi_power_meter cxl_port libahci binfmt_misc intel_th_gth cxl_core mei_me soundcore ipmi_si ioatdma i2c_i801 intel_th_pci intel_uncore einj acpi_ipmi pcspkr libata mei isst_if_common drm_kms_helper i2c_smbus intel_pch_thermal intel_vsec intel_th dca wmi nfit ipmi_devintf libnvdimm ipmi_msghandler acpi_pad joydev drm fuse dm_mod loop ip_tables
[  120.056218][   C17] CPU: 17 UID: 0 PID: 4939 Comm: schbench Tainted: G S                 6.14.0-01502-gc07c4e0c013d #1 VOLUNTARY
[  120.056221][   C17] Tainted: [S]=CPU_OUT_OF_SPEC
[  120.056222][   C17] Hardware name: Intel Corporation M50CYP2SB1U/M50CYP2SB1U, BIOS SE5C620.86B.01.01.0003.2104260124 04/26/2021
[ 120.056223][ C17] RIP: 0010:native_queued_spin_lock_slowpath (kernel/locking/qspinlock.c:474) 
[ 120.056234][ C17] Code: c1 e9 12 83 e0 03 83 e9 01 48 c1 e0 05 48 63 c9 48 05 80 2b e5 83 48 03 04 cd e0 cc bc 82 48 89 10 8b 42 08 85 c0 75 09 f3 90 <8b> 42 08 85 c0 74 f7 48 8b 0a 48 85 c9 74 90 0f 0d 09 eb 91 8b 03
All code
========
   0:	c1 e9 12             	shr    $0x12,%ecx
   3:	83 e0 03             	and    $0x3,%eax
   6:	83 e9 01             	sub    $0x1,%ecx
   9:	48 c1 e0 05          	shl    $0x5,%rax
   d:	48 63 c9             	movslq %ecx,%rcx
  10:	48 05 80 2b e5 83    	add    $0xffffffff83e52b80,%rax
  16:	48 03 04 cd e0 cc bc 	add    -0x7d433320(,%rcx,8),%rax
  1d:	82 
  1e:	48 89 10             	mov    %rdx,(%rax)
  21:	8b 42 08             	mov    0x8(%rdx),%eax
  24:	85 c0                	test   %eax,%eax
  26:	75 09                	jne    0x31
  28:	f3 90                	pause
  2a:*	8b 42 08             	mov    0x8(%rdx),%eax		<-- trapping instruction
  2d:	85 c0                	test   %eax,%eax
  2f:	74 f7                	je     0x28
  31:	48 8b 0a             	mov    (%rdx),%rcx
  34:	48 85 c9             	test   %rcx,%rcx
  37:	74 90                	je     0xffffffffffffffc9
  39:	0f 0d 09             	prefetchw (%rcx)
  3c:	eb 91                	jmp    0xffffffffffffffcf
  3e:	8b 03                	mov    (%rbx),%eax

Code starting with the faulting instruction
===========================================
   0:	8b 42 08             	mov    0x8(%rdx),%eax
   3:	85 c0                	test   %eax,%eax
   5:	74 f7                	je     0xfffffffffffffffe
   7:	48 8b 0a             	mov    (%rdx),%rcx
   a:	48 85 c9             	test   %rcx,%rcx
   d:	74 90                	je     0xffffffffffffff9f
   f:	0f 0d 09             	prefetchw (%rcx)
  12:	eb 91                	jmp    0xffffffffffffffa5
  14:	8b 03                	mov    (%rbx),%eax
[  120.056236][   C17] RSP: 0000:ffa00000222dfd68 EFLAGS: 00000246
[  120.056238][   C17] RAX: 0000000000000000 RBX: ffd40000055f6568 RCX: 000000000000002a
[  120.056239][   C17] RDX: ff1100103f671b80 RSI: 0000000000ac0101 RDI: ffd40000055f6568
[  120.056241][   C17] RBP: ff1100103f671b80 R08: 0000000000000000 R09: 0000000000000000
[  120.056242][   C17] R10: 0000000055555554 R11: ff11000240ff850c R12: 0000000000480000
[  120.056242][   C17] R13: 0000000000480000 R14: 0200000000000000 R15: 0000000000000000
[  120.056243][   C17] FS:  00007f75844266c0(0000) GS:ff110010bb81f000(0000) knlGS:0000000000000000
[  120.056245][   C17] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  120.056246][   C17] CR2: 00007f76e0415c70 CR3: 00000001f83fc002 CR4: 0000000000773ef0
[  120.056247][   C17] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[  120.056247][   C17] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[  120.056248][   C17] PKRU: 55555554
[  120.056249][   C17] Call Trace:
[  120.056250][   C17]  <TASK>
[ 120.056252][ C17] _raw_spin_lock (arch/x86/include/asm/paravirt.h:572 arch/x86/include/asm/qspinlock.h:51 include/asm-generic/qspinlock.h:114 include/linux/spinlock.h:187 include/linux/spinlock_api_smp.h:134 kernel/locking/spinlock.c:154) 
[ 120.056254][ C17] do_huge_pmd_numa_page (mm/huge_memory.c:1976) 
[ 120.056259][ C17] __handle_mm_fault (mm/memory.c:6014) 
[ 120.056264][ C17] handle_mm_fault (mm/memory.c:6197) 
[ 120.056266][ C17] do_user_addr_fault (arch/x86/mm/fault.c:1338) 
[ 120.056272][ C17] exc_page_fault (arch/x86/include/asm/irqflags.h:37 arch/x86/include/asm/irqflags.h:92 arch/x86/mm/fault.c:1488 arch/x86/mm/fault.c:1538) 
[ 120.056275][ C17] asm_exc_page_fault (arch/x86/include/asm/idtentry.h:623) 
[  120.056278][   C17] RIP: 0033:0x55f6cc692d8b
[ 120.056280][ C17] Code: e3 ff ff 8b 05 86 82 00 00 85 c0 0f 84 f7 02 00 00 48 8b 15 b7 33 00 00 31 db 48 85 d2 0f 84 30 01 00 00 4c 8b 15 55 82 00 00 <4d> 8b b7 70 98 10 00 4d 89 d5 4e 8d 1c d5 00 00 00 00 4d 0f af ea
All code
========
   0:	e3 ff                	jrcxz  0x1
   2:	ff 8b 05 86 82 00    	decl   0x828605(%rbx)
   8:	00 85 c0 0f 84 f7    	add    %al,-0x87bf040(%rbp)
   e:	02 00                	add    (%rax),%al
  10:	00 48 8b             	add    %cl,-0x75(%rax)
  13:	15 b7 33 00 00       	adc    $0x33b7,%eax
  18:	31 db                	xor    %ebx,%ebx
  1a:	48 85 d2             	test   %rdx,%rdx
  1d:	0f 84 30 01 00 00    	je     0x153
  23:	4c 8b 15 55 82 00 00 	mov    0x8255(%rip),%r10        # 0x827f
  2a:*	4d 8b b7 70 98 10 00 	mov    0x109870(%r15),%r14		<-- trapping instruction
  31:	4d 89 d5             	mov    %r10,%r13
  34:	4e 8d 1c d5 00 00 00 	lea    0x0(,%r10,8),%r11
  3b:	00 
  3c:	4d 0f af ea          	imul   %r10,%r13

Code starting with the faulting instruction
===========================================
   0:	4d 8b b7 70 98 10 00 	mov    0x109870(%r15),%r14
   7:	4d 89 d5             	mov    %r10,%r13
   a:	4e 8d 1c d5 00 00 00 	lea    0x0(,%r10,8),%r11
  11:	00 
  12:	4d 0f af ea          	imul   %r10,%r13
[  120.056281][   C17] RSP: 002b:00007f7584425df0 EFLAGS: 00010206
[  120.056282][   C17] RAX: 0000000000000000 RBX: 000055f6e61615d0 RCX: 0000000000000000
[  120.056283][   C17] RDX: 0000000000000005 RSI: 0000000000000000 RDI: 000055f6e61615d0
[  120.056284][   C17] RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
[  120.056284][   C17] R10: 0000000000000068 R11: 0000000000000293 R12: 00007f76e0315c70
[  120.056285][   C17] R13: 0000000000000011 R14: 00007f76e030c420 R15: 00007f76e030c400
[  120.056287][   C17]  </TASK>
[  120.056288][   C17] Kernel panic - not syncing: softlockup: hung tasks
[  120.410327][   C17] CPU: 17 UID: 0 PID: 4939 Comm: schbench Tainted: G S           L     6.14.0-01502-gc07c4e0c013d #1 VOLUNTARY
[  120.422640][   C17] Tainted: [S]=CPU_OUT_OF_SPEC, [L]=SOFTLOCKUP
[  120.428974][   C17] Hardware name: Intel Corporation M50CYP2SB1U/M50CYP2SB1U, BIOS SE5C620.86B.01.01.0003.2104260124 04/26/2021
[  120.441111][   C17] Call Trace:
[  120.444577][   C17]  <IRQ>
[ 120.447593][ C17] panic (kernel/panic.c:354) 
[ 120.451654][ C17] watchdog_timer_fn (kernel/watchdog.c:733) 
[ 120.456739][ C17] ? __pfx_watchdog_timer_fn (kernel/watchdog.c:683) 
[ 120.462344][ C17] __hrtimer_run_queues (kernel/time/hrtimer.c:1799 kernel/time/hrtimer.c:1863) 
[ 120.467684][ C17] hrtimer_interrupt (kernel/time/hrtimer.c:1960) 
[ 120.472753][ C17] __sysvec_apic_timer_interrupt (arch/x86/kernel/apic/apic.c:1038 arch/x86/kernel/apic/apic.c:1055) 
[ 120.478688][ C17] sysvec_apic_timer_interrupt (arch/x86/kernel/apic/apic.c:1049 arch/x86/kernel/apic/apic.c:1049) 
[  120.484437][   C17]  </IRQ>
[  120.487494][   C17]  <TASK>
[ 120.490535][ C17] asm_sysvec_apic_timer_interrupt (arch/x86/include/asm/idtentry.h:702) 
[ 120.496622][ C17] RIP: 0010:native_queued_spin_lock_slowpath (kernel/locking/qspinlock.c:474) 
[ 120.503754][ C17] Code: c1 e9 12 83 e0 03 83 e9 01 48 c1 e0 05 48 63 c9 48 05 80 2b e5 83 48 03 04 cd e0 cc bc 82 48 89 10 8b 42 08 85 c0 75 09 f3 90 <8b> 42 08 85 c0 74 f7 48 8b 0a 48 85 c9 74 90 0f 0d 09 eb 91 8b 03
All code
========
   0:	c1 e9 12             	shr    $0x12,%ecx
   3:	83 e0 03             	and    $0x3,%eax
   6:	83 e9 01             	sub    $0x1,%ecx
   9:	48 c1 e0 05          	shl    $0x5,%rax
   d:	48 63 c9             	movslq %ecx,%rcx
  10:	48 05 80 2b e5 83    	add    $0xffffffff83e52b80,%rax
  16:	48 03 04 cd e0 cc bc 	add    -0x7d433320(,%rcx,8),%rax
  1d:	82 
  1e:	48 89 10             	mov    %rdx,(%rax)
  21:	8b 42 08             	mov    0x8(%rdx),%eax
  24:	85 c0                	test   %eax,%eax
  26:	75 09                	jne    0x31
  28:	f3 90                	pause
  2a:*	8b 42 08             	mov    0x8(%rdx),%eax		<-- trapping instruction
  2d:	85 c0                	test   %eax,%eax
  2f:	74 f7                	je     0x28
  31:	48 8b 0a             	mov    (%rdx),%rcx
  34:	48 85 c9             	test   %rcx,%rcx
  37:	74 90                	je     0xffffffffffffffc9
  39:	0f 0d 09             	prefetchw (%rcx)
  3c:	eb 91                	jmp    0xffffffffffffffcf
  3e:	8b 03                	mov    (%rbx),%eax

Code starting with the faulting instruction
===========================================
   0:	8b 42 08             	mov    0x8(%rdx),%eax
   3:	85 c0                	test   %eax,%eax
   5:	74 f7                	je     0xfffffffffffffffe
   7:	48 8b 0a             	mov    (%rdx),%rcx
   a:	48 85 c9             	test   %rcx,%rcx
   d:	74 90                	je     0xffffffffffffff9f
   f:	0f 0d 09             	prefetchw (%rcx)
  12:	eb 91                	jmp    0xffffffffffffffa5
  14:	8b 03                	mov    (%rbx),%eax


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250328/202503280925.27fefb28-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

