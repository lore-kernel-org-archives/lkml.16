Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC43F1F460E
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 08:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744706168; cv=fail; b=XjSYJDRrpKXt9uZT97xI3iBLi32FKsol7TWRXs74tVAV/XHfurE6yQcjuLR0qfcJIaltt7hDI4rUnHtIA1BHmD61eTAhGbb1jaP0AKMBIS0WPGmPhkjFLgqnzZDkDxcmvPw94C3Oef6GC3VFZ8s1IIg3eS9Oaf+n16I+vg/cJ6s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744706168; c=relaxed/simple;
	bh=vx9OJ3H9DZzDPF/i+YLe11tsrfCZD1EKDOg5Z+GIgPo=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=RVty1uGLZraJUhA/QkzLPToHS4tymtUO5WqBHWvte2ErWxHVx2juDBJGKJGa5U2RIIaSS+cG7p7XSG+QhuVjzZGZSDI0TDO2lBg2P0vMxNUxQH+oawfS06wMg3MDQanW9H6AZea1U1uArjnFq5mfzAQaoWWtSpKX05zjoxD9sXk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XBPjsNcE; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XBPjsNcE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744706166; x=1776242166;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vx9OJ3H9DZzDPF/i+YLe11tsrfCZD1EKDOg5Z+GIgPo=;
  b=XBPjsNcE3NKieLZyG6AKceblS9rA0iknu1wPkQiB1dP70r02GEMbkWi0
   jN79E1DVcmf1KHvdT122bZ73u3GoFz2gt4pMyXI0DnLbHM0UR00iVbN+9
   M1TCgHeCAJ1vg1zWwkI4fk3weSfrV4PD5BCLIKwYFA3qjNqnK8wftlfBn
   5xUL6vbXBd6OKVqy7IJV7ej9qeBmL1xqE1ih554SXIe5cN8JL86hq3QJb
   y2wTPk4Et51+D1GzE2ZQY+RMeDiHpfqTiwsdP4IT2MJt0zoaPdoAShL3Z
   u2WMfqowALGlg5vbjKteEM3R/hH2p9Io3HzpsbPiVRYWnoq2zxFve8NXQ
   A==;
X-CSE-ConnectionGUID: O8TvYHecRUyYg7n1PysjKQ==
X-CSE-MsgGUID: vuZjX5f0S56PIVwzwvDlhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="46118786"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="46118786"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 01:36:05 -0700
X-CSE-ConnectionGUID: qqlfIuyPQRWyVXV3uFbbQg==
X-CSE-MsgGUID: iM1lkxnhS4G1vYQLeFH7BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="130060192"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 01:36:04 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 15 Apr 2025 01:36:04 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 15 Apr 2025 01:36:04 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 15 Apr 2025 01:36:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I9ReBjTFDmTjfGjousf+JXvF/12E6iJ1EHiA8km09p4uNu6ePJNCavxdE524G5KSg0X8+j7E63EHJhG/AXW/GpEwpHNea8nBbG0kDWoxrE6Sg1e0tTuFjlfjyb5BH+4QZ8kDWThdPzatxzdBvbINBLadgZLz4SDxtuRV1Y3UY9WYwQuwkH0DUR7zl3fIv3Uk5SRLRjV6+VfP43gK5TKAmeKrixYBV/K4YxXY7YkSiJc2wkWaf4H5UVw17vTAaj5NUijPQ14xJHsn2+Gl7Xk1LOhbZ8EXX8bVapErYlLKHAv1uyJG5N3vu+61l00SzmoCYSUCCqC1Nj2OksyiQ+Yrhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FinFai4JJ4xa7qCDYk5wXi9OJjeLPLSN2cWz6HjLoR0=;
 b=pDTdySg5LDhueK3jbFKCQKnesrwEdEyM1qUebBbSwTd2uxRYBTWz3ZCUXeDl/QKFowTExhYt3hZ68qzUTrle0RTKA1dUt8eJMfWxtw9HLAzzP/AkKO2D/h2HgLsHAdLcgGC3AmqnO55Fpwqo5wFFOA0mo2MCc5AebARX9o/puiNS5b26GR/AViIBQ3+g9Jt3AFPKJORlRfD4lZjZlC7EOANaB0tj7Ar4QcOkGb4CZGTxwWVFOCkD0+jR71tIEloFxQXO8QmmFYyVTvesMc9JLaEK/L370UjHm1Q85pHkoj6+MkVr9OSUYKvEn0Yue3nwG7V9XpIvjkCZHmQXJ9quvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SJ0PR11MB8294.namprd11.prod.outlook.com (2603:10b6:a03:478::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.29; Tue, 15 Apr
 2025 08:36:00 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%4]) with mapi id 15.20.8632.035; Tue, 15 Apr 2025
 08:36:00 +0000
Date: Tue, 15 Apr 2025 16:35:47 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Suren Baghdasaryan <surenb@google.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>, Shakeel Butt
	<shakeel.butt@linux.dev>, David Wang <00107082@163.com>, Kent Overstreet
	<kent.overstreet@linux.dev>, Minchan Kim <minchan@google.com>, Pasha Tatashin
	<pasha.tatashin@soleen.com>, Peter Zijlstra <peterz@infradead.org>, "Sourav
 Panda" <souravpanda@google.com>, Steven Rostedt <rostedt@goodmis.org>,
	Vlastimil Babka <vbabka@suse.cz>, Yu Zhao <yuzhao@google.com>, Zhenhua Huang
	<quic_zhenhuah@quicinc.com>, <linux-mm@kvack.org>, <oliver.sang@intel.com>
Subject: [linus:master] [alloc_tag]  93d5440ece:
 WARNING:at_include/linux/alloc_tag.h:#__pgalloc_tag_sub
Message-ID: <202504151659.9b09c785-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR01CA0175.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::31) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SJ0PR11MB8294:EE_
X-MS-Office365-Filtering-Correlation-Id: 09430f43-bf8b-4047-6545-08dd7bf88cbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Kvcja6A0vtg2kjYYbA5Swd62CvzSDS7NE6ewxdxKhfKW8k3ZXjwgg+6HAEUQ?=
 =?us-ascii?Q?ZRUZaREazkcFeeKZgegAi0OCtyPOHNg2GuK6Bamr8ncKTAXT+MplGfsCadIw?=
 =?us-ascii?Q?6gCoaJNCdda/qCZTrvcwIdeusJyl+krfOcGgx4Y80sUEI+bj0zxIPFy1VKKB?=
 =?us-ascii?Q?NMBO+WdUZUlCFdAC/uHZNsK5MME88av+qAuJF0LIIESXBUYZTg0ELU8dSvUe?=
 =?us-ascii?Q?c2z4gQutNak3f/9TBDLTLHqdGRmfBwSj1dMtTBNHt1EpoToiyyDjIt9T43hn?=
 =?us-ascii?Q?QLXTzp7vss2a1G66fx9i08Sure8ZX3F/rzTrlwZcsNt72aix3srZmUHXxsRa?=
 =?us-ascii?Q?8B4bLu3gRUvGnuzo7o8dyjDnLA3i0t6XzoRIrYVnn3RW2KapE2oMzwmOHrgK?=
 =?us-ascii?Q?REPi1ULz1qlbd+eIbMtz4/RoDjwDDuXZzdBopdPA3m9wYMvw3JsapMjFD2R5?=
 =?us-ascii?Q?IRd38QI7bYrUHnCvL4jwb/XWquCeuqEvlQeyXFnCgkNjBi8KO8Lv9kWkyiEk?=
 =?us-ascii?Q?ano/YoXZY9aq17ILU2TQdHIN06MpHA9B4oaADc5E7GjAVHON6ovgHFLvGUHQ?=
 =?us-ascii?Q?3xo8bMXahEL/s7kyfiDKpK4yMYhbTu/VfHJnrepLBTXArsb8Razz1uVmy+aG?=
 =?us-ascii?Q?nGysJGGSBOM4r3snZ5TjlzpRHGud2gkcjehjv/IQKGjlGzO5tQ6BYnOQiqxq?=
 =?us-ascii?Q?lo+9U1UGsMqdKpTVz4k0ya6kVXEQAbwZJPsCx9oWnZIaBfQbz6KiXEs5RBCv?=
 =?us-ascii?Q?V08obZX5DXT/YD9RKjfAip3T63Ww6cgireVyhLOOMlgrPxOh1P0eCnkmz24i?=
 =?us-ascii?Q?Ma0g+QxeGA1og0CPAe5Zp+2bFFD7mh47rk73zpBZ5sVBgyY2zhBgrzVeyxBz?=
 =?us-ascii?Q?TBRptkse/5WgWSWUIz0zkvf8o7YLVvuzE/LPvu+5woMqdffEnqNFeE9ZlZz8?=
 =?us-ascii?Q?AKU98CCKzO3WAhTO9L68KR2yIpNnlJKMexMaFAAEW+swN3EQi3I3BmNArrLj?=
 =?us-ascii?Q?09655y4qQJCwWr2ZKhBfWlsS5wYCRGV4zv3PP0syJIaT7wSrFU6+UbhRUxWA?=
 =?us-ascii?Q?NiagidP9/S7V5xvgwU8MS4p85BNJRDS4+aAYZx132p7kpZD2vfxVJKyiV0W7?=
 =?us-ascii?Q?YExUivnvVlkuYh6NJH5TRU8eqILrev++SL03uKqO1/oEovQjXwa2FTbwGp5h?=
 =?us-ascii?Q?RHfHMTtVZSLDa8RZDI6lD2BUjSOqrhZ2g+WJCVvoUmE0nMix8Chaip2+FnVQ?=
 =?us-ascii?Q?Ge09FeDR+Gc+FtSGjMFHTj3A8CJCjAoaGz5thEpD09ycdc0yK76Rd+y70gbk?=
 =?us-ascii?Q?6ydN9niuNIAkFpkWdb/7mCm2nIi5dS5cTY4moKHsG1eUQjpxPereCb/0GToB?=
 =?us-ascii?Q?iaz+c0BWrRAx8yOTwj+BNZb1rFJu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Q13uYRHZuy1nIE7ir6tACjVJufoF8gibMHU1VW5SYCnhfEJtSOeBRjH0erpa?=
 =?us-ascii?Q?tD+ZYfnSywaH1iRyaNEDdoPZYU8S0PaRgwGTLUDHLeUqFBconOqo/jziSlhr?=
 =?us-ascii?Q?FK54HeuCJ+pfRjw+cdkv7bYN+Zps2lHtwHztyTW9V9/ykzBGqda7huf6tcex?=
 =?us-ascii?Q?CcCpqWllUf2LCpfr1G1YdWR7RBd5FWnALIf1Yy/HB44gvWVOdkbV32mwI4uD?=
 =?us-ascii?Q?wTVGgMr2gXc8m0msAIAZ4Q7w5HJF05/+UGgjDD/1UVx4s61yS/cPSD+/uh7S?=
 =?us-ascii?Q?+9w17C3JcHMqBrD0eeA9eTAwUybh3S3pkXyXyY4imVpM/64d4qrRaOxL8wuk?=
 =?us-ascii?Q?EUL+ZyKIgVWNaAxvzLcylzCyvS+itIbKHrDSvnj0BL46ORLkRA1T7qxle9mf?=
 =?us-ascii?Q?0oGZfgmswpK+1u8oRQEM1IMIv6TlDf3ClBL2oNIpwIpYJ3Re2illcN0/YJnl?=
 =?us-ascii?Q?G8RIGN9CVbmPEkFbC1Lv2PHxM4QVLa+vjMh9Rff4QjqBDwWg0K26BDVwK8SM?=
 =?us-ascii?Q?Mdhxh5iiBjgbGyBZvVuqFAcGOMea9fR/yxxAel00KpCPmYVkSoJ+PcOsunfx?=
 =?us-ascii?Q?6/hBh/Gf1XCU4GKy5mkN+hmFzy+twRCT42OaGAx6xEc53vfCrf81LT6opseF?=
 =?us-ascii?Q?YJw3uYnsYrhXvSHphDvc+XzAa+khMdwrs0PcKSa64stsvglcsdXVZvS0CGDC?=
 =?us-ascii?Q?O5V7pa4iCYbUqqMdo+uc7nbAljacrfLETIV54RWSpSxKOMIEBxKGpa/5DG+m?=
 =?us-ascii?Q?0ZBt6XhZI+PfGhK+DuFRpfdryeyh/+ABMSCuZl5flatMmmjue0fxS5f19r9r?=
 =?us-ascii?Q?OzoV3bjj2iHtEaC+K1jCNgz4J+3bmpag4bubwqXWWpBdFYAYFomwe5OGQs/7?=
 =?us-ascii?Q?79kOIkS8BgZzgjjCN3FUAAFL0asQedbAX6EvkxZ8vYqmrKFZWV0DRs8cGexr?=
 =?us-ascii?Q?edII6nUpYtwxuJQs6rRTjor6BRVBm8zIwEPh7zLU/QPpHTEVpnR5x5uHNDQ2?=
 =?us-ascii?Q?C2vB+ikJm9Wm2FVWBqwAJkZWSO6zndxmlA3G8WZ54azDA2r6HjHbM1ilq0Ya?=
 =?us-ascii?Q?3S82/fdgyAzGVlD3aYn6GhBxN+kIyIzwjVbsee9vgGxdJGd86wMOtUw2dOGA?=
 =?us-ascii?Q?0LU1azpccmSxtDJz2uDNNVt3vhxzizxINvs3CuB9A1AWOnHrz8pLhSH5IiCP?=
 =?us-ascii?Q?/qcY2HFXY6qa+HpOk/Rh/AEvpNrR/j6m7UgOoxqmOjxVeU42zz3VMDvBXJEh?=
 =?us-ascii?Q?pgBcYgAKgfxdv6QhtO2Lo+rX0QH7aBlerOAlFlltcyJ+9+5Z5aqK3tDebGBe?=
 =?us-ascii?Q?NmO0i4SzKrD4YFiXkg5Zz5ksdPMY+GH2IIBQqmvV+nbYQhI/kt6801lqMrPK?=
 =?us-ascii?Q?pUXKk/EaMLf5L5mmeOsmDxapNE3FFP2oz7uZXaq9VJjzXboW7ms+EqhIY5ie?=
 =?us-ascii?Q?9QUR7PmR3qweYuNSnDT5zwEgmRWpf0JoAGVZSfCzQ7fmuNpO1VZl/qXGaGzt?=
 =?us-ascii?Q?QyWD6eju3tj/YM9qN8zZut03RVuZ0jBLxEASQrrQnyLw1nPIo1Tu5qX7xNYv?=
 =?us-ascii?Q?iuDaYhoNP4rcbrJ7J7Px92aPn1NUDw8PwjQBNzu6Wj6EcRft/q2JpigWsR/X?=
 =?us-ascii?Q?6w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 09430f43-bf8b-4047-6545-08dd7bf88cbb
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 08:36:00.3078
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Ze/bcTzTalavaqymXpoZ0SBOEd9KBr44Fu7BwYCUitQVsIgWMmteS/Mba3rYNJ1F4VleKUN+NDi8XLZQXqwqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB8294
X-OriginatorOrg: intel.com



Hello,


seems one random WARN just changes the stat due to this commit.

a642b27b991fd663 93d5440ece3c0aa341fb02e3a44
---------------- ---------------------------
       fail:runs  %reproduction    fail:runs
           |             |             |
           :24          12%           3:24    dmesg.WARNING:at_include/linux/alloc_tag.h:#__pgalloc_tag_sub
          5:24         -21%            :24    dmesg.WARNING:at_include/linux/alloc_tag.h:#pgalloc_tag_sub


below report is just FYI what we observed in our tests.


kernel test robot noticed "WARNING:at_include/linux/alloc_tag.h:#__pgalloc_tag_sub" on:

commit: 93d5440ece3c0aa341fb02e3a44a1b7ab44304c8 ("alloc_tag: uninline code gated by mem_alloc_profiling_key in page allocator")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

[test failed on linus/master      900241a5cc15e6e0709a012051cc72d224cd6a6e]
[test failed on linux-next/master 01c6df60d5d4ae00cd5c1648818744838bba7763]

in testcase: trinity
version: trinity-x86_64-ba2360ed-1_20241228
with following parameters:

	runtime: 300s
	group: group-00
	nr_groups: 5



config: x86_64-randconfig-161-20250410
compiler: gcc-11
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202504151659.9b09c785-lkp@intel.com


[  147.337988][ T2016] ------------[ cut here ]------------
[  147.338915][ T2016] alloc_tag was not set
[ 147.339502][ T2016] WARNING: CPU: 0 PID: 2016 at include/linux/alloc_tag.h:152 __pgalloc_tag_sub (include/linux/alloc_tag.h:152 include/linux/alloc_tag.h:195 mm/page_alloc.c:1089) 
[  147.341127][ T2016] Modules linked in:
[  147.341672][ T2016] CPU: 0 UID: 0 PID: 2016 Comm: grep Tainted: G                T  6.14.0-rc6-00062-g93d5440ece3c #1 c08622b3723459177a60d595773689e527750d0d
[  147.343295][ T2016] Tainted: [T]=RANDSTRUCT
[  147.343867][ T2016] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[ 147.345236][ T2016] RIP: 0010:__pgalloc_tag_sub (include/linux/alloc_tag.h:152 include/linux/alloc_tag.h:195 mm/page_alloc.c:1089) 
[ 147.345982][ T2016] Code: 41 5e 41 5f 5d c3 49 c7 47 e0 00 00 00 00 80 3d 25 ef 66 0a 00 75 a9 48 c7 c7 e0 91 39 8e c6 05 15 ef 66 0a 01 e8 3f bb ad ff <0f> 0b eb 92 48 c7 c0 20 2b e6 90 48 ba 00 00 00 00 00 fc ff df 48
All code
========
   0:	41 5e                	pop    %r14
   2:	41 5f                	pop    %r15
   4:	5d                   	pop    %rbp
   5:	c3                   	ret
   6:	49 c7 47 e0 00 00 00 	movq   $0x0,-0x20(%r15)
   d:	00 
   e:	80 3d 25 ef 66 0a 00 	cmpb   $0x0,0xa66ef25(%rip)        # 0xa66ef3a
  15:	75 a9                	jne    0xffffffffffffffc0
  17:	48 c7 c7 e0 91 39 8e 	mov    $0xffffffff8e3991e0,%rdi
  1e:	c6 05 15 ef 66 0a 01 	movb   $0x1,0xa66ef15(%rip)        # 0xa66ef3a
  25:	e8 3f bb ad ff       	call   0xffffffffffadbb69
  2a:*	0f 0b                	ud2		<-- trapping instruction
  2c:	eb 92                	jmp    0xffffffffffffffc0
  2e:	48 c7 c0 20 2b e6 90 	mov    $0xffffffff90e62b20,%rax
  35:	48 ba 00 00 00 00 00 	movabs $0xdffffc0000000000,%rdx
  3c:	fc ff df 
  3f:	48                   	rex.W

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2
   2:	eb 92                	jmp    0xffffffffffffff96
   4:	48 c7 c0 20 2b e6 90 	mov    $0xffffffff90e62b20,%rax
   b:	48 ba 00 00 00 00 00 	movabs $0xdffffc0000000000,%rdx
  12:	fc ff df 
  15:	48                   	rex.W
[  147.348298][ T2016] RSP: 0018:ffffc90001def730 EFLAGS: 00010282
[  147.349063][ T2016] RAX: dffffc0000000000 RBX: 1ffff920003bdee7 RCX: 0000000000000001
[  147.350021][ T2016] RDX: 0000000000000027 RSI: 0000000000000004 RDI: ffffffff9059d5a8
[  147.354294][ T2016] RBP: ffffc90001def7a0 R08: ffffffff87fd99d0 R09: fffffbfff20b3ab5
[  147.355329][ T2016] R10: ffffffff9059d5ab R11: 0000000000000001 R12: ffff888106402c58
[  147.356345][ T2016] R13: 0000000000000000 R14: 0000000000000001 R15: ffffc90001def778
[  147.357317][ T2016] FS:  0000000000000000(0000) GS:ffffffff904be000(0000) knlGS:0000000000000000
[  147.358402][ T2016] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  147.359199][ T2016] CR2: 00007fedda922200 CR3: 0000000155129000 CR4: 00000000000406f0
[  147.360209][ T2016] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[  147.361208][ T2016] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[  147.362220][ T2016] Call Trace:
[  147.362713][ T2016]  <TASK>
[ 147.363178][ T2016] ? show_regs (arch/x86/kernel/dumpstack.c:479) 
[ 147.363763][ T2016] ? __warn (kernel/panic.c:748) 
[ 147.364366][ T2016] ? __wake_up_klogd (arch/x86/include/asm/preempt.h:94 kernel/printk/printk.c:4525) 
[ 147.365015][ T2016] ? __pgalloc_tag_sub (include/linux/alloc_tag.h:152 include/linux/alloc_tag.h:195 mm/page_alloc.c:1089) 
[ 147.365689][ T2016] ? report_bug (lib/bug.c:201 lib/bug.c:219) 
[ 147.366349][ T2016] ? page_ext_get (include/linux/rcupdate.h:337 include/linux/rcupdate.h:849 mm/page_ext.c:525) 
[ 147.366988][ T2016] ? handle_bug (arch/x86/kernel/traps.c:285) 
[ 147.367583][ T2016] ? exc_invalid_op (arch/x86/kernel/traps.c:309 (discriminator 1)) 
[ 147.368249][ T2016] ? asm_exc_invalid_op (arch/x86/include/asm/idtentry.h:574) 
[ 147.368921][ T2016] ? irq_work_queue (arch/x86/include/asm/atomic.h:23 arch/x86/include/asm/atomic.h:145 include/linux/atomic/atomic-arch-fallback.h:1690 include/linux/atomic/atomic-instrumented.h:954 kernel/irq_work.c:61 kernel/irq_work.c:119) 
[ 147.369562][ T2016] ? __pgalloc_tag_sub (include/linux/alloc_tag.h:152 include/linux/alloc_tag.h:195 mm/page_alloc.c:1089) 
[ 147.370244][ T2016] ? __alloc_contig_migrate_range (mm/page_alloc.c:1084) 
[ 147.371016][ T2016] free_frozen_pages (mm/page_alloc.c:1211 mm/page_alloc.c:2738) 
[ 147.371700][ T2016] __free_slab (mm/slub.c:2669) 
[ 147.372331][ T2016] free_slab (mm/slub.c:2692) 
[ 147.372900][ T2016] free_to_partial_list (mm/slub.c:4414) 
[ 147.373569][ T2016] ? qlist_free_all (mm/kasan/quarantine.c:163 mm/kasan/quarantine.c:179) 
[ 147.374213][ T2016] __slab_free (mm/slub.c:4534) 
[ 147.374819][ T2016] ? __kasan_check_read (mm/kasan/shadow.c:32) 
[ 147.375470][ T2016] ? mark_lock (arch/x86/include/asm/bitops.h:227 (discriminator 3) arch/x86/include/asm/bitops.h:239 (discriminator 3) include/asm-generic/bitops/instrumented-non-atomic.h:142 (discriminator 3) kernel/locking/lockdep.c:230 (discriminator 3) kernel/locking/lockdep.c:4729 (discriminator 3)) 
[ 147.376062][ T2016] ? mark_held_locks (kernel/locking/lockdep.c:4323) 
[ 147.376701][ T2016] ___cache_free (mm/slub.c:4681) 
[ 147.377248][ T2016] qlist_free_all (mm/kasan/quarantine.c:174) 
[ 147.377795][ T2016] kasan_quarantine_reduce (include/linux/srcu.h:357 mm/kasan/quarantine.c:287) 
[ 147.378470][ T2016] __kasan_slab_alloc (mm/kasan/common.c:329) 
[ 147.379088][ T2016] kmem_cache_alloc_noprof (include/linux/kasan.h:250 mm/slub.c:4128 mm/slub.c:4177 mm/slub.c:4184) 
[ 147.379784][ T2016] getname_flags (include/linux/sched.h:2248 fs/namei.c:139) 
[ 147.380436][ T2016] getname (fs/namei.c:224) 
[ 147.380969][ T2016] do_sys_openat2 (fs/open.c:1422) 
[ 147.381587][ T2016] ? build_open_flags (fs/open.c:1414) 
[ 147.382258][ T2016] __x64_sys_openat (fs/open.c:1454) 
[ 147.382899][ T2016] ? __ia32_compat_sys_open (fs/open.c:1454) 
[ 147.383611][ T2016] x64_sys_call (arch/x86/entry/syscall_64.c:36) 
[ 147.384281][ T2016] do_syscall_64 (arch/x86/entry/common.c:52 arch/x86/entry/common.c:83) 
[ 147.384977][ T2016] entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:130) 
[  147.385724][ T2016] RIP: 0033:0x7fedda9e895d
[ 147.386333][ T2016] Code: 48 89 54 24 e0 41 83 e2 40 75 32 89 f0 25 00 00 41 00 3d 00 00 41 00 74 24 89 f2 b8 01 01 00 00 48 89 fe bf 9c ff ff ff 0f 05 <48> 3d 00 f0 ff ff 77 33 c3 66 2e 0f 1f 84 00 00 00 00 00 48 8d 44
All code
========
   0:	48 89 54 24 e0       	mov    %rdx,-0x20(%rsp)
   5:	41 83 e2 40          	and    $0x40,%r10d
   9:	75 32                	jne    0x3d
   b:	89 f0                	mov    %esi,%eax
   d:	25 00 00 41 00       	and    $0x410000,%eax
  12:	3d 00 00 41 00       	cmp    $0x410000,%eax
  17:	74 24                	je     0x3d
  19:	89 f2                	mov    %esi,%edx
  1b:	b8 01 01 00 00       	mov    $0x101,%eax
  20:	48 89 fe             	mov    %rdi,%rsi
  23:	bf 9c ff ff ff       	mov    $0xffffff9c,%edi
  28:	0f 05                	syscall
  2a:*	48 3d 00 f0 ff ff    	cmp    $0xfffffffffffff000,%rax		<-- trapping instruction
  30:	77 33                	ja     0x65
  32:	c3                   	ret
  33:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  3a:	00 00 00 
  3d:	48                   	rex.W
  3e:	8d                   	.byte 0x8d
  3f:	44                   	rex.R

Code starting with the faulting instruction
===========================================
   0:	48 3d 00 f0 ff ff    	cmp    $0xfffffffffffff000,%rax
   6:	77 33                	ja     0x3b
   8:	c3                   	ret
   9:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  10:	00 00 00 
  13:	48                   	rex.W
  14:	8d                   	.byte 0x8d
  15:	44                   	rex.R


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250415/202504151659.9b09c785-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

