Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597FF226CE7
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 07:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747638415; cv=fail; b=jd6QbKbtE5h9VL12t6c0al1x0AARgX+WKJ+8tAIGlL9a1npkFhW4lyx7RM29hXCKKjSpZktmq9BgVeN5bqcEWNoHXlMTV9biVhUlZZf9GUwxlJZ6cO7VkTizj48zi9ps2sZCsDKg9vk7JPjQcmJUhXjWCUMO9hQAFIvbUYT3qkk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747638415; c=relaxed/simple;
	bh=ye21VZdZN8a/mu21CFnLNY8fqi/ZBdsZzVYz2g8OObU=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=i57u6jRh4AKILI0x7brtJ8YS07o1IyQeecbkPnVoBGAU/xiCS3r5Edgu4qVkI2818F2MGF9ANrDOwUsegilFvRvkL9ymV0DZWKA73sPniT4CZLIHU+XraWeIhp1F+RaGIMA03Y+ahQS2Wxi/+vWzXkbOADKwyLCiF1RDAHDC7yg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LNXSooc8; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LNXSooc8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747638410; x=1779174410;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=ye21VZdZN8a/mu21CFnLNY8fqi/ZBdsZzVYz2g8OObU=;
  b=LNXSooc8byBN1pKKI7Q0UK4dohaa5DM8TbRwG/9pbuVl81akbZs1I4Bq
   NJwUAnMvlnfEpPeZRQfYz3OLmj9prrYH6BqFgiuPaXFqYWQm7SCxeEkZx
   xmLX3URrbkkwk6+NsqL3nBlZLJWlH0yhXRH0par9iW/98goKj+eyhEVRW
   Civd71a6Zppg3FfBp7UDJpYH26CLbNDH73/poayE27hlIXfXrPsGvC1pP
   JDrJmvRj7tBNptGqUHksTfm0SqMj6rnG85JMIoKmjQbQnyt5nXg8ywkAY
   ve6NlQ865Cm7KdRLB5NjgjsqXY01LRCbLYJlFWK5/nTDBR/7ZlK+TMDs1
   A==;
X-CSE-ConnectionGUID: KVKVpl2xTSK8ikgJQig8rg==
X-CSE-MsgGUID: +SbSheM3ShWBGsTufRA+oQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11437"; a="59752380"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="59752380"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 00:06:49 -0700
X-CSE-ConnectionGUID: F8VA6NU5SUeEIXEb5EbITQ==
X-CSE-MsgGUID: GDXC1LjgQCua9iq2QYrfXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="170320894"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 00:06:47 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 19 May 2025 00:06:47 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 19 May 2025 00:06:47 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 19 May 2025 00:06:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F1E5SzuPvQYrGS63NwqnDs2XEVkACwreKB9F3DcAIGDrs/J1Ps0a6B8bMy+Fc49nnx5UEI81vONkgVrB4KGIVm16cCZXog7FwQMxzk+j8puT0LiGRToF99dtpge/B+liQUNAlhSRpLaoBPIy1ZmckX6NSnnpsFD5pEowupL8m+JnpMFCi3IFRsdgbOd4Mo+EcWbjLvGd8jGq4o27BHJo+WUuYr3STTItJJ9oHSCfxQYnx5cFCMpbmtLGbdeG6YjOFYb/584HVElqGb+30CTZGmr8hX6YDoMK80cMMqF6S+lH0Q0LrqPsxWfna+RLTKqKLJtwy6OBbiM84ytglhsyvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dmyiuzLJjqTBbGDK65dn8YN+0AlxhNDZ1OhWJLLNz+k=;
 b=m9czKAil85LsSPzK67Hf+Xib8AY2fUFzz/vIhndZEkMl/D7VHDaiM5GcDH6qxuMIcvguBT4QZSUKKZDr9VOm8+tU2mBo4uOtvLhsIUFCe6TDiznM3Un60s5ezErJy+ZHflrtfCyBVqIHJcim9aKoBAAzXrwTA+74CpFsDdO3sWEry+bu3LyxWTYdiIhp/dg9iHznCa/f3iISUPlYqka3WlqAdujuSLA+s6OYfGVkgAPtjMlv/QTMSwtHgqPu2J9SGWukw6bOK1PpP15Xs7GRfc/ztB3wOgseNbg8KHE5zLxvOQPQfHTQ/9ys43nAMqj2oFe+72jgSQmxAlHoNyEYDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SN7PR11MB7706.namprd11.prod.outlook.com (2603:10b6:806:32c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Mon, 19 May
 2025 07:06:03 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 07:06:03 +0000
Date: Mon, 19 May 2025 15:05:53 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Johannes Weiner <hannes@cmpxchg.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>, Brendan Jackman
	<jackmanb@google.com>, kernel test robot <oliver.sang@intel.com>, Carlos Song
	<carlos.song@nxp.com>, Shivank Garg <shivankg@amd.com>, Zi Yan
	<ziy@nvidia.com>, Vlastimil Babka <vbabka@suse.cz>, <linux-mm@kvack.org>
Subject: [linus:master] [mm]  90abee6d78:  vm-scalability.throughput 208.7%
 improvement
Message-ID: <202505191442.830abdbd-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR06CA0004.apcprd06.prod.outlook.com
 (2603:1096:4:186::20) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SN7PR11MB7706:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bd4971b-7aa0-416f-dd6b-08dd96a39e02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?oE2cpmGHInEScwhcnfO2R5ApdX1cGgj7Lrwhf/pIGESJK3ARVaTwV1M36U?=
 =?iso-8859-1?Q?dkAWpmziVFakqBu3u9FbNS+8jn7nsEetSLOZU7G1LSIBu50ME+7R32u9H1?=
 =?iso-8859-1?Q?J4NGhLPwhb1kSNZuV25Idqf7tMIq3U/X1l04E7l6qtargj7CquHDnb8hn2?=
 =?iso-8859-1?Q?QXBjIVJr03gsaX/hNS6+ql7Qz7mLcON3U88FVMzzf9WZ2aU2OJPGhjtTYm?=
 =?iso-8859-1?Q?vnM4OJwzJcz13YuGEONYGhi/RdYc0HPaMfsGV8wSi+R2KRYSfKjls0bvvQ?=
 =?iso-8859-1?Q?SXCBbdimaxlSzXxZsBgFsQiJ642RfZ+QMf5j0fMiPqBjrY8lh1Am4pAAFm?=
 =?iso-8859-1?Q?xVjOCoaX9OcGxeTJwSQg05lYHS+zNU+vr0BvupxU2+9LtG66NR+P93o2Za?=
 =?iso-8859-1?Q?Vkx7t1Ee+dA2Yl7swtBCSkm1JI8iW8nOzrakFpUkuysVBefuArN4x7iuxn?=
 =?iso-8859-1?Q?G7PhbWmvosb4KO8DCprImr7nc0daGlENtUb+dZmX7RH8eK0z66yR3Rjy2s?=
 =?iso-8859-1?Q?KRZPU6Lj85QOrgFlZxXCcE9WgTHksBVKRL7ROqBCFPc9luUDrDPn/hj1SO?=
 =?iso-8859-1?Q?mhMlKAAe72zTf2gPWLOnwGD9W1PRemDbe/KfzJ7V5AF9iRd9N2I4TdHOs/?=
 =?iso-8859-1?Q?bCFC7cFbSHISw/9L+IlUlOW67yvVJD1jlOMWcKPj/A0K7JYrDhKR0eNN9R?=
 =?iso-8859-1?Q?xizLB0HD+eJ8dFmFTd9LdDgVAdQKcLOXewoxjPLCuAjmogDir/2KMZbzBl?=
 =?iso-8859-1?Q?LD6ldx1yjx1h3A2JQDq1JnagLrjpYeGniJ1hrQa/la4KuQg0lsKx4eLxl8?=
 =?iso-8859-1?Q?8iEAxehI23NNOW+ONAIn5K+AkN55Ln3tg+eZJE31WLS35ELsgh6HyLanmC?=
 =?iso-8859-1?Q?a4peDEWLjQJPG8M+IY2dviKMHrB9p2wac1KV1tZumXfYc4bJ2TmP8Jgs4c?=
 =?iso-8859-1?Q?6MhmxeifP6N0O6a7/JDGAR/BJaiup14Ns3b4uGvYxcW414ARMdBMbGLJMy?=
 =?iso-8859-1?Q?9XHQTr6pCJL9VOIph38+yKH1SWB39rFQCNytVrmcFPFQp4yDt9KLN9utps?=
 =?iso-8859-1?Q?CE4a12j2VEmoiMwg93CoA6GdRPFTswE06XgbtD6gmEUgrpS3J0+QcbqEAn?=
 =?iso-8859-1?Q?T8nJlJ/6ovi2dhJHn6AO/LGHzauPrBxegMw/7mw/+qXXZpkMBvpqS4aEeE?=
 =?iso-8859-1?Q?x2xJdEkh4bh+J4dxmG3ER8T4iRQbR3zo3R8ay6hI79v57UHpeUQdYNJ5FM?=
 =?iso-8859-1?Q?VwXWG0YxheX1fuaNuAKlhP/zAhWXDjRIDKNUefAvgkSZx/9jQ8EnKF0mUg?=
 =?iso-8859-1?Q?yaU37/5z5xIw22wp9wVdcRyL+xAUH3bLssTTVbgIuZATAM8IdM87Z/ulKU?=
 =?iso-8859-1?Q?7osxpVab68/7ijBUPiLzQorRB7RtYCsTlHCuhBB+aabS5244SJyX4Cq46m?=
 =?iso-8859-1?Q?wX/gKm7BIFtRJgzq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?pASnL0ztzuUAfgi3dkIDIH/BdVsuTAoovUIpaoAH5rWFO6EIhEKk2jgxzX?=
 =?iso-8859-1?Q?ck4hmzUSOjqkLdzCrkAYPlX4+wFN4KjBfQtianDV58ogo4BQ/iXtABxaSO?=
 =?iso-8859-1?Q?FV1LrlHEEGE6/Zv/ewn96gLjeq8WYHVgshk0+JG8QWYXAGdTfUFvh9R7Oo?=
 =?iso-8859-1?Q?a/UPu2uo1xPWyqEqkCiGPwW7TSZR6pF61qB/EDspk5iXzVaLU29latkPew?=
 =?iso-8859-1?Q?LXQcjziZ6Fb9K+OF2UnvT1A0DSLYRTVgQhdAIylrpSVXxomm3FEiZl3mch?=
 =?iso-8859-1?Q?47OMcvAw0zMHYy88LPapvez3ZQO51UVXf2p6tD5Tuu3DGpzXkVY27ZCh5S?=
 =?iso-8859-1?Q?yxXiF6y54r1LhQwnnA/UDlDiRrTNiQxECKZ/yHiNXqI0DzBzfjXE8JLW0b?=
 =?iso-8859-1?Q?ikeZdYRsbwX4I15VGuZ3fJqMLvtJEeUQm4o4HskO9evK+fnVzzwBxAmvcO?=
 =?iso-8859-1?Q?TsYZAnTdyYvCtVrCaT3aZs4DyyMAvAvJAQVPxQH7YoB8Kt01WS9qOUJOXk?=
 =?iso-8859-1?Q?O0cKcLZIF6k6rRFk34kIg1fNPHZ3O/gFkDVkMeBNVsooH9YwLIiW0/P1mo?=
 =?iso-8859-1?Q?lU9W/9LOT5KYSP5QVqdfvmSUfoeTmohFpVgVG47g4/yrqZMPr7VUJ4db4z?=
 =?iso-8859-1?Q?yaTTA7u9v/koFlOb+Go2qJDJI86n0vBASVrYNqWGaV3XDxI8odIxHhpsY8?=
 =?iso-8859-1?Q?HX4mjlXCaV39AJMzKJwzxUNLUvR9c/X/8SGrY+zFAOVPM/iF7WkA9xBiw+?=
 =?iso-8859-1?Q?/wIW4iTksqbEvj4ixPz7ySp9cu25pEPcRIPBi1N5K1ayifa+4UfMMGRM2n?=
 =?iso-8859-1?Q?HE4On57+1V7g/Anb//c/l6oKWGjhmWd/vPEXfPLiauGWf7ySNlCopHJPvK?=
 =?iso-8859-1?Q?MmXkeBBSarHt8v3FDSMtGPdOy/dU1IKFDYSS4Nn1hn1kklqj9lAXDZ2Gws?=
 =?iso-8859-1?Q?Os1kv41594ArpsShNpoLDpD0u4ypIFv7Z04LYRWhHKoHANDIQKgXs+ot/v?=
 =?iso-8859-1?Q?sbMxBNW/3N6PFkUKRJ7jEyLBuTt27JjAZt8TK4GSIlkodPOm6B12ONk7je?=
 =?iso-8859-1?Q?JJNql3NYPS6CaZrRANREZnkdHJ3Not1K9P2pc1M5+UxeAvyeYPCXFmxhGh?=
 =?iso-8859-1?Q?baPCz/xxoFc/Vr/V4i6q5aVsSFqf5zjWIuhwLiyrS+i+CAvaVlAuUsKjaQ?=
 =?iso-8859-1?Q?ALXJgYZ5SW3aOJuvTzxj+0Y3EobuNImZo+3n/ScmWsrTGA7yh6BGpG9K8u?=
 =?iso-8859-1?Q?NrGnKOCTXedHYRvHuMjGkQKTeZuqSjACH04UY7+9sXn/LfuEgixDbNrMc+?=
 =?iso-8859-1?Q?vikRv15zByNLNxbBdxOHueWiu9Kwh3axnBP2q//qeORrmwyc1mx87MLxS6?=
 =?iso-8859-1?Q?KMuzmelYp3qxvbeTAv/WJ4kfhpduYroxLD4ST0HeUoFo/MN5Ep7wosAkPg?=
 =?iso-8859-1?Q?U7kuwQmqzgiW/lgq6wSulbEc30eKWkvDcxqSZ2/N4xWNKGcE1nJqcZjMIS?=
 =?iso-8859-1?Q?INvd2TJhjq63mvk0ujlO3HDHkPX3iI2xpQvUko4a/mKK4tM4d+ppMUhHk8?=
 =?iso-8859-1?Q?FNsiT9q7LxG/bshgruEKxIJP8xddzou0rao8bt1yALt7oC+yj3dOVwE9O2?=
 =?iso-8859-1?Q?sCgPw2PIBuDYk1wsEWrAqSQgDP3gPIJgK32+kcDQMvyJzEe6oH5YqIig?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bd4971b-7aa0-416f-dd6b-08dd96a39e02
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 07:06:03.7556
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: agWDWt42TPvZTWF4N8weg9CVRK0PtOoM/NY3juF6/WhVuhhqnOq5Il0s/Xp/QYnN0Q6EJKWRNFN2nZzD7vCrYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7706
X-OriginatorOrg: intel.com



Hello,


we make out this report FYI that this change we tested before introduces
expected performance improvements after it merged into mainline.


kernel test robot noticed a 208.7% improvement of vm-scalability.throughput on:


commit: 90abee6d7895d5eef18c91d870d8168be4e76e9d ("mm: page_alloc: speed up fallbacks in rmqueue_bulk()")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master


testcase: vm-scalability
config: x86_64-rhel-9.4
compiler: gcc-12
test machine: 224 threads 4 sockets Intel(R) Xeon(R) Platinum 8380H CPU @ 2.90GHz (Cooper Lake) with 192G memory
parameters:

	runtime: 300s
	test: lru-file-mmap-read
	cpufreq_governor: performance


In addition to that, the commit also has significant impact on the following tests:

+------------------+----------------------------------------------------------------------------------------------------+
| testcase: change | vm-scalability: vm-scalability.throughput 14.4% improvement                                        |
| test machine     | 96 threads 2 sockets Intel(R) Xeon(R) Platinum 8260L CPU @ 2.40GHz (Cascade Lake) with 128G memory |
| test parameters  | cpufreq_governor=performance                                                                       |
|                  | runtime=300s                                                                                       |
|                  | test=lru-file-readonce                                                                             |
+------------------+----------------------------------------------------------------------------------------------------+




Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250519/202505191442.830abdbd-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/rootfs/runtime/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-9.4/debian-12-x86_64-20240206.cgz/300s/lkp-cpl-4sp2/lru-file-mmap-read/vm-scalability

commit: 
  61c4e6ca8c ("kunit: slub: add module description")
  90abee6d78 ("mm: page_alloc: speed up fallbacks in rmqueue_bulk()")

61c4e6ca8c9364e0 90abee6d7895d5eef18c91d870d 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
    376.96           -39.4%     228.49        uptime.boot
 7.547e+09 ±  2%     +10.8%  8.361e+09 ±  2%  cpuidle..time
   1817627 ± 11%    +112.3%    3859104 ±  3%  cpuidle..usage
     11.06 ±  4%     +90.0%      21.01 ±  2%  vmstat.cpu.id
    209.40           -12.7%     182.73        vmstat.procs.r
      3699 ±  2%     +27.2%       4705 ±  4%  vmstat.system.cs
    321760 ±  2%    +177.7%     893642        vmstat.system.in
     10.61 ±  4%      +9.5       20.12 ±  2%  mpstat.cpu.all.idle%
      0.29            +0.1        0.42        mpstat.cpu.all.irq%
      0.04 ±  3%      +0.0        0.06 ±  3%  mpstat.cpu.all.soft%
     87.26           -11.2       76.05        mpstat.cpu.all.sys%
      1.80            +1.6        3.35        mpstat.cpu.all.usr%
      2202 ± 11%     -99.9%       2.50 ± 68%  perf-c2c.DRAM.local
      9990 ± 24%     -99.8%      17.83 ± 15%  perf-c2c.DRAM.remote
      5663 ± 24%     -99.9%       4.83 ± 22%  perf-c2c.HITM.local
      3785 ± 36%     -99.8%       7.33 ± 47%  perf-c2c.HITM.remote
      9448 ± 29%     -99.9%      12.17 ± 25%  perf-c2c.HITM.total
    872871 ±  3%     -32.2%     591691 ±  2%  meminfo.Active(anon)
   1863158 ±  2%     -31.3%    1280201        meminfo.Committed_AS
    791782 ±  3%     -38.2%     489668 ±  3%  meminfo.Inactive(anon)
 1.626e+08           -10.6%  1.454e+08        meminfo.Mapped
  11311593           +68.3%   19036737 ±  2%  meminfo.MemFree
   2740333           +25.9%    3451181        meminfo.PageTables
    968031 ±  4%     -61.1%     376109 ±  3%  meminfo.Shmem
     47936          +203.8%     145624        vm-scalability.median
  10757194          +208.7%   33209235        vm-scalability.throughput
    330.82           -45.0%     181.84        vm-scalability.time.elapsed_time
    330.82           -45.0%     181.84        vm-scalability.time.elapsed_time.max
    454721 ±  5%     -21.3%     357854 ±  3%  vm-scalability.time.involuntary_context_switches
      6237 ± 11%     -16.3%       5220 ± 10%  vm-scalability.time.major_page_faults
  58820177           +61.7%   95111411        vm-scalability.time.minor_page_faults
     19695           -11.4%      17459        vm-scalability.time.percent_of_cpu_this_job_got
     63776           -52.3%      30424        vm-scalability.time.system_time
      1382            -4.1%       1325        vm-scalability.time.user_time
 3.233e+09           +49.5%  4.832e+09        vm-scalability.workload
  30747335 ±  3%     +75.1%   53845488 ±  2%  numa-numastat.node0.local_node
   9665181 ±  5%     +36.1%   13155944 ±  9%  numa-numastat.node0.numa_foreign
  30852096 ±  3%     +74.7%   53904683 ±  2%  numa-numastat.node0.numa_hit
  10061871 ±  4%     +27.9%   12871300 ±  8%  numa-numastat.node0.numa_miss
  10167157 ±  4%     +27.2%   12931541 ±  8%  numa-numastat.node0.other_node
  31424413 ±  2%     +71.8%   53995981 ±  2%  numa-numastat.node1.local_node
   9559411           +33.4%   12755075 ±  7%  numa-numastat.node1.numa_foreign
  31493619 ±  2%     +71.7%   54080493 ±  2%  numa-numastat.node1.numa_hit
   9818182 ±  4%     +35.6%   13315460 ±  8%  numa-numastat.node1.numa_miss
   9887206 ±  4%     +35.5%   13399943 ±  8%  numa-numastat.node1.other_node
  30716553 ±  2%     +74.3%   53540440        numa-numastat.node2.local_node
   9631891 ±  3%     +29.2%   12446132 ±  5%  numa-numastat.node2.numa_foreign
  30804344 ±  2%     +74.1%   53629581        numa-numastat.node2.numa_hit
   9480537 ±  5%     +38.3%   13113177 ±  6%  numa-numastat.node2.numa_miss
   9569011 ±  5%     +38.0%   13207329 ±  6%  numa-numastat.node2.other_node
  31251942 ±  2%     +73.9%   54343326 ±  2%  numa-numastat.node3.local_node
   9867139 ±  3%     +30.2%   12849966 ±  5%  numa-numastat.node3.numa_foreign
  31339300 ±  2%     +73.7%   54446941 ±  2%  numa-numastat.node3.numa_hit
   9361115 ±  3%     +27.2%   11905974 ±  6%  numa-numastat.node3.numa_miss
   9447257 ±  2%     +27.2%   12015492 ±  6%  numa-numastat.node3.other_node
    798984 ±  3%     +15.4%     921987 ±  3%  numa-meminfo.node0.KReclaimable
  39101457 ±  3%     -11.7%   34532127 ±  4%  numa-meminfo.node0.Mapped
   2971114 ±  3%     +54.6%    4594599 ±  6%  numa-meminfo.node0.MemFree
    682712           +26.4%     863081        numa-meminfo.node0.PageTables
    798984 ±  3%     +15.4%     921987 ±  3%  numa-meminfo.node0.SReclaimable
    996954 ±  2%     +12.3%    1119377 ±  3%  numa-meminfo.node0.Slab
  40216278 ±  3%      -9.5%   36397403 ±  3%  numa-meminfo.node1.Mapped
   2834174 ±  4%     +71.5%    4860595 ±  7%  numa-meminfo.node1.MemFree
    687158           +26.5%     869435        numa-meminfo.node1.PageTables
     94358 ± 48%     -64.7%      33284 ±103%  numa-meminfo.node1.Shmem
  13789564 ±  3%      -9.8%   12443234 ±  2%  numa-meminfo.node2.Active
  13665323 ±  3%      -9.8%   12330620        numa-meminfo.node2.Active(file)
  41257117 ±  2%     -10.7%   36843070 ±  2%  numa-meminfo.node2.Mapped
   2941652 ±  4%     +63.6%    4812532 ±  6%  numa-meminfo.node2.MemFree
    682032           +26.6%     863770 ±  2%  numa-meminfo.node2.PageTables
  13939898 ±  2%     -11.3%   12366453        numa-meminfo.node3.Active
    494357 ± 12%     -55.1%     222059 ± 38%  numa-meminfo.node3.Active(anon)
    458063 ± 14%     -60.8%     179724 ± 43%  numa-meminfo.node3.Inactive(anon)
  41127915            -9.6%   37190924        numa-meminfo.node3.Mapped
   2924142 ±  2%     +66.7%    4873101 ±  2%  numa-meminfo.node3.MemFree
    679611           +25.4%     852249        numa-meminfo.node3.PageTables
    724785 ±  5%     -68.1%     231466 ± 21%  numa-meminfo.node3.Shmem
      4.55 ±  2%     +19.1%       5.42 ±  3%  perf-stat.i.MPKI
 1.858e+10           +99.2%  3.701e+10        perf-stat.i.branch-instructions
      0.40            -0.1        0.29        perf-stat.i.branch-miss-rate%
  62199241           +20.4%   74867744        perf-stat.i.branch-misses
     70.87            -3.2       67.65        perf-stat.i.cache-miss-rate%
 2.774e+08          +127.1%  6.299e+08        perf-stat.i.cache-misses
 3.949e+08          +142.3%  9.571e+08        perf-stat.i.cache-references
      3752 ±  3%     +22.7%       4604 ±  4%  perf-stat.i.context-switches
     10.76           -57.2%       4.60        perf-stat.i.cpi
    228884            -1.8%     224827        perf-stat.i.cpu-clock
  7.27e+11            -7.8%  6.701e+11        perf-stat.i.cpu-cycles
    253.00           +26.5%     320.04        perf-stat.i.cpu-migrations
      2674           -64.2%     958.33        perf-stat.i.cycles-between-cache-misses
 6.628e+10           +97.1%  1.306e+11        perf-stat.i.instructions
      0.22 ±  2%     +40.4%       0.31        perf-stat.i.ipc
     19.93 ± 10%     +41.1%      28.13 ± 10%  perf-stat.i.major-faults
      0.53 ±  6%    +764.8%       4.60        perf-stat.i.metric.K/sec
    189252          +174.1%     518646        perf-stat.i.minor-faults
    189272          +174.0%     518674        perf-stat.i.page-faults
    228884            -1.8%     224827        perf-stat.i.task-clock
      4.13           +16.7%       4.82        perf-stat.overall.MPKI
      0.35            -0.1        0.20        perf-stat.overall.branch-miss-rate%
     69.89            -4.1       65.77        perf-stat.overall.cache-miss-rate%
     11.80           -56.3%       5.15        perf-stat.overall.cpi
      2859           -62.6%       1069        perf-stat.overall.cycles-between-cache-misses
      0.08          +129.0%       0.19        perf-stat.overall.ipc
      6652           -25.0%       4991        perf-stat.overall.path-length
 1.811e+10          +106.3%  3.738e+10        perf-stat.ps.branch-instructions
  62559887           +20.6%   75461016        perf-stat.ps.branch-misses
 2.673e+08          +137.6%  6.353e+08        perf-stat.ps.cache-misses
 3.826e+08          +152.5%   9.66e+08        perf-stat.ps.cache-references
      3624 ±  2%     +26.7%       4591 ±  4%  perf-stat.ps.context-switches
 7.643e+11           -11.1%  6.795e+11        perf-stat.ps.cpu-cycles
    237.26           +33.8%     317.50        perf-stat.ps.cpu-migrations
 6.479e+10          +103.6%  1.319e+11        perf-stat.ps.instructions
     18.80 ± 11%     +51.9%      28.55 ± 10%  perf-stat.ps.major-faults
    180343          +190.4%     523806        perf-stat.ps.minor-faults
    180362          +190.4%     523835        perf-stat.ps.page-faults
  2.15e+13           +12.2%  2.412e+13        perf-stat.total.instructions
  36071206           -50.9%   17694406 ± 13%  sched_debug.cfs_rq:/.avg_vruntime.avg
  37871667           -50.8%   18633189 ± 14%  sched_debug.cfs_rq:/.avg_vruntime.max
   4012130 ± 10%     -48.2%    2079120 ± 15%  sched_debug.cfs_rq:/.avg_vruntime.stddev
      0.86           -31.7%       0.59 ± 13%  sched_debug.cfs_rq:/.h_nr_queued.avg
      0.86           -31.7%       0.59 ± 13%  sched_debug.cfs_rq:/.h_nr_runnable.avg
      2.00 ±  8%     -18.1%       1.64 ± 10%  sched_debug.cfs_rq:/.h_nr_runnable.max
     24083 ±  8%     -27.8%      17392 ±  5%  sched_debug.cfs_rq:/.load.avg
    132826 ±  6%     -24.3%     100525 ±  3%  sched_debug.cfs_rq:/.load.stddev
     36.41 ± 46%     -28.8%      25.94 ±  5%  sched_debug.cfs_rq:/.load_avg.avg
  36071211           -50.9%   17694407 ± 13%  sched_debug.cfs_rq:/.min_vruntime.avg
  37871667           -50.8%   18633189 ± 14%  sched_debug.cfs_rq:/.min_vruntime.max
   4012130 ± 10%     -48.2%    2079120 ± 15%  sched_debug.cfs_rq:/.min_vruntime.stddev
      0.83           -31.4%       0.57 ± 13%  sched_debug.cfs_rq:/.nr_queued.avg
      3.23 ± 35%    +121.8%       7.16 ±  9%  sched_debug.cfs_rq:/.removed.load_avg.avg
     23.51 ± 17%     +87.6%      44.10 ±  7%  sched_debug.cfs_rq:/.removed.load_avg.stddev
      1.52 ± 37%    +113.5%       3.25 ± 18%  sched_debug.cfs_rq:/.removed.runnable_avg.avg
     11.38 ± 30%     +79.7%      20.44 ± 11%  sched_debug.cfs_rq:/.removed.runnable_avg.stddev
      1.49 ± 38%    +118.6%       3.25 ± 18%  sched_debug.cfs_rq:/.removed.util_avg.avg
     87.92 ± 26%     +67.8%     147.53 ± 13%  sched_debug.cfs_rq:/.removed.util_avg.max
     10.86 ± 27%     +88.3%      20.44 ± 11%  sched_debug.cfs_rq:/.removed.util_avg.stddev
    896.03           -30.6%     621.61 ± 13%  sched_debug.cfs_rq:/.runnable_avg.avg
    862.50           -30.1%     602.48 ± 13%  sched_debug.cfs_rq:/.util_avg.avg
    561.32 ± 10%     -27.0%     409.89 ± 13%  sched_debug.cfs_rq:/.util_est.avg
      1676 ±  6%     -17.6%       1382 ±  7%  sched_debug.cfs_rq:/.util_est.max
    295.07 ±  4%     -28.0%     212.34 ± 10%  sched_debug.cfs_rq:/.util_est.stddev
    195921           -35.7%     125893 ± 11%  sched_debug.cpu.clock.avg
    195985           -35.7%     125931 ± 11%  sched_debug.cpu.clock.max
    195853           -35.7%     125847 ± 11%  sched_debug.cpu.clock.min
     37.29 ±  9%     -41.1%      21.96 ± 20%  sched_debug.cpu.clock.stddev
    195458           -35.9%     125376 ± 11%  sched_debug.cpu.clock_task.avg
    195669           -35.8%     125707 ± 11%  sched_debug.cpu.clock_task.max
    183137           -38.2%     113173 ± 12%  sched_debug.cpu.clock_task.min
      4926 ±  2%     -32.0%       3349 ± 13%  sched_debug.cpu.curr->pid.avg
      9996 ±  2%     -19.1%       8084 ±  6%  sched_debug.cpu.curr->pid.max
      0.00 ± 15%     -59.1%       0.00 ± 16%  sched_debug.cpu.next_balance.stddev
      0.86 ±  2%     -31.7%       0.59 ± 13%  sched_debug.cpu.nr_running.avg
      3287           -23.2%       2524 ± 12%  sched_debug.cpu.nr_switches.avg
    923.61 ±  3%     -20.4%     734.90 ± 14%  sched_debug.cpu.nr_switches.min
      2506 ±  4%     -19.1%       2028 ± 12%  sched_debug.cpu.nr_switches.stddev
    195851           -35.7%     125854 ± 11%  sched_debug.cpu_clk
    195002           -35.9%     125005 ± 11%  sched_debug.ktime
    196611           -35.6%     126617 ± 11%  sched_debug.sched_clk
    779892 ±  4%     +51.2%    1178944 ±  7%  numa-vmstat.node0.nr_free_pages
    201338 ± 13%     +66.2%     334633 ± 18%  numa-vmstat.node0.nr_free_pages_blocks
   9705239 ±  3%     -11.6%    8580712 ±  4%  numa-vmstat.node0.nr_mapped
    169393           +26.7%     214703        numa-vmstat.node0.nr_page_table_pages
    199303 ±  3%     +15.6%     230446 ±  3%  numa-vmstat.node0.nr_slab_reclaimable
   9665181 ±  5%     +36.1%   13155944 ±  9%  numa-vmstat.node0.numa_foreign
  30851511 ±  3%     +74.7%   53904690 ±  2%  numa-vmstat.node0.numa_hit
  30746750 ±  3%     +75.1%   53845495 ±  2%  numa-vmstat.node0.numa_local
  10061871 ±  4%     +27.9%   12871300 ±  8%  numa-vmstat.node0.numa_miss
  10167157 ±  4%     +27.2%   12931541 ±  8%  numa-vmstat.node0.numa_other
    346702 ± 22%    +406.2%    1754989 ± 18%  numa-vmstat.node0.workingset_nodereclaim
    745424 ±  3%     +67.6%    1249153 ±  6%  numa-vmstat.node1.nr_free_pages
    214616 ±  6%     +72.3%     369850 ±  8%  numa-vmstat.node1.nr_free_pages_blocks
   9983771 ±  3%      -9.4%    9046557 ±  3%  numa-vmstat.node1.nr_mapped
    170524           +26.8%     216280        numa-vmstat.node1.nr_page_table_pages
     23621 ± 48%     -64.8%       8318 ±103%  numa-vmstat.node1.nr_shmem
   9559411           +33.4%   12755075 ±  7%  numa-vmstat.node1.numa_foreign
  31492499 ±  2%     +71.7%   54080035 ±  2%  numa-vmstat.node1.numa_hit
  31423293 ±  2%     +71.8%   53995523 ±  2%  numa-vmstat.node1.numa_local
   9818182 ±  4%     +35.6%   13315460 ±  8%  numa-vmstat.node1.numa_miss
   9887206 ±  4%     +35.5%   13399943 ±  8%  numa-vmstat.node1.numa_other
    290406 ± 36%    +289.1%    1129921 ± 22%  numa-vmstat.node1.workingset_nodereclaim
    774884 ±  5%     +59.4%    1235420 ±  5%  numa-vmstat.node2.nr_free_pages
    201210 ± 12%     +72.6%     347328 ± 13%  numa-vmstat.node2.nr_free_pages_blocks
  10239929 ±  2%     -10.5%    9160135 ±  2%  numa-vmstat.node2.nr_mapped
    169266           +27.0%     214929 ±  2%  numa-vmstat.node2.nr_page_table_pages
   9631891 ±  3%     +29.2%   12446132 ±  5%  numa-vmstat.node2.numa_foreign
  30803855 ±  2%     +74.1%   53628715        numa-vmstat.node2.numa_hit
  30716065 ±  2%     +74.3%   53539574        numa-vmstat.node2.numa_local
   9480537 ±  5%     +38.3%   13113177 ±  6%  numa-vmstat.node2.numa_miss
   9569011 ±  5%     +38.0%   13207329 ±  6%  numa-vmstat.node2.numa_other
    260472 ± 16%    +238.7%     882142 ± 11%  numa-vmstat.node2.workingset_nodereclaim
    124752 ± 12%     -55.6%      55421 ± 37%  numa-vmstat.node3.nr_active_anon
    770417           +62.5%    1251912 ±  2%  numa-vmstat.node3.nr_free_pages
    205929 ±  3%     +62.1%     333852 ± 14%  numa-vmstat.node3.nr_free_pages_blocks
    114398 ± 14%     -60.3%      45399 ± 44%  numa-vmstat.node3.nr_inactive_anon
  10208413            -9.5%    9242954        numa-vmstat.node3.nr_mapped
    168690           +25.7%     212087        numa-vmstat.node3.nr_page_table_pages
    182254 ±  5%     -68.0%      58243 ± 21%  numa-vmstat.node3.nr_shmem
    124768 ± 12%     -55.6%      55438 ± 37%  numa-vmstat.node3.nr_zone_active_anon
    114397 ± 14%     -60.3%      45395 ± 44%  numa-vmstat.node3.nr_zone_inactive_anon
   9867139 ±  3%     +30.2%   12849966 ±  5%  numa-vmstat.node3.numa_foreign
  31338195 ±  2%     +73.7%   54445455 ±  2%  numa-vmstat.node3.numa_hit
  31250838 ±  2%     +73.9%   54341840 ±  2%  numa-vmstat.node3.numa_local
   9361115 ±  3%     +27.2%   11905974 ±  6%  numa-vmstat.node3.numa_miss
   9447257 ±  2%     +27.2%   12015492 ±  6%  numa-vmstat.node3.numa_other
    293933 ± 18%    +211.8%     916434 ± 15%  numa-vmstat.node3.workingset_nodereclaim
   2922435           +59.1%    4650659        proc-vmstat.allocstall_movable
     53893 ±  2%     +19.5%      64426        proc-vmstat.allocstall_normal
  2.08e+08 ± 21%    +130.7%    4.8e+08 ± 10%  proc-vmstat.compact_daemon_free_scanned
  20200472 ± 14%     +59.9%   32306773 ± 20%  proc-vmstat.compact_daemon_migrate_scanned
   2.1e+08 ± 21%    +129.9%  4.827e+08 ± 10%  proc-vmstat.compact_free_scanned
  16068648 ± 15%     +71.5%   27559426 ± 14%  proc-vmstat.compact_isolated
     14242 ± 15%    +103.9%      29042 ± 55%  proc-vmstat.compact_stall
     12774 ± 12%     +82.7%      23338 ± 43%  proc-vmstat.compact_success
    209.33 ± 36%     +72.9%     361.83 ± 19%  proc-vmstat.kswapd_low_wmark_hit_quickly
    218257 ±  3%     -32.8%     146690 ±  2%  proc-vmstat.nr_active_anon
  13340408            -5.3%   12638022 ±  2%  proc-vmstat.nr_active_file
    174917            +1.2%     177071        proc-vmstat.nr_anon_pages
  44156679            -5.2%   41865101        proc-vmstat.nr_file_pages
   2840137           +69.5%    4813105        proc-vmstat.nr_free_pages
    758633 ±  3%     +79.1%    1358500 ±  9%  proc-vmstat.nr_free_pages_blocks
    198565 ±  3%     -37.7%     123741 ±  2%  proc-vmstat.nr_inactive_anon
  29665312            -4.8%   28228433        proc-vmstat.nr_inactive_file
     48.82 ± 65%    +216.7%     154.60 ± 11%  proc-vmstat.nr_isolated_file
     44004            -1.3%      43448        proc-vmstat.nr_kernel_stack
  40580068           -10.6%   36273496        proc-vmstat.nr_mapped
    684289           +25.9%     861294        proc-vmstat.nr_page_table_pages
    242699 ±  3%     -61.2%      94160 ±  3%  proc-vmstat.nr_shmem
    760816            +3.7%     789337        proc-vmstat.nr_slab_reclaimable
    218325 ±  3%     -32.8%     146765 ±  2%  proc-vmstat.nr_zone_active_anon
  13367457            -5.3%   12662368 ±  2%  proc-vmstat.nr_zone_active_file
    198561 ±  3%     -37.7%     123724 ±  2%  proc-vmstat.nr_zone_inactive_anon
  29638512            -4.8%   28204306        proc-vmstat.nr_zone_inactive_file
  38723623 ±  2%     +32.2%   51207119        proc-vmstat.numa_foreign
 1.245e+08 ±  2%     +73.6%  2.161e+08        proc-vmstat.numa_hit
 1.241e+08 ±  2%     +73.8%  2.157e+08        proc-vmstat.numa_local
  38721707 ±  2%     +32.2%   51205912        proc-vmstat.numa_miss
  39070631 ±  2%     +32.0%   51554306        proc-vmstat.numa_other
  69231984           +36.3%   94389528        proc-vmstat.pgactivate
   5370504 ±  2%     +62.0%    8699896 ±  4%  proc-vmstat.pgalloc_dma32
 6.733e+08           +58.9%   1.07e+09        proc-vmstat.pgalloc_normal
  59990512           +59.9%   95906948        proc-vmstat.pgfault
 6.863e+08           +59.2%  1.092e+09        proc-vmstat.pgfree
      6226 ± 11%     -16.3%       5210 ± 10%  proc-vmstat.pgmajfault
   8029470 ± 15%     +71.5%   13769295 ± 14%  proc-vmstat.pgmigrate_success
  10455112           +88.6%   19716830 ±  2%  proc-vmstat.pgrefill
     52446           -24.9%      39374        proc-vmstat.pgreuse
 8.419e+08           +56.0%  1.314e+09        proc-vmstat.pgscan_direct
 8.827e+08           +58.1%  1.396e+09        proc-vmstat.pgscan_file
     11325 ±  5%     -54.4%       5168 ±  7%  proc-vmstat.pgscan_khugepaged
  40769751 ±  4%    +101.6%   82180900 ±  2%  proc-vmstat.pgscan_kswapd
      6408 ±  3%     -11.3%       5683 ±  4%  proc-vmstat.pgskip_normal
 5.957e+08           +61.4%  9.616e+08        proc-vmstat.pgsteal_direct
 6.282e+08           +63.8%  1.029e+09        proc-vmstat.pgsteal_file
      8771 ±  9%     -51.8%       4227        proc-vmstat.pgsteal_khugepaged
  32470465 ±  5%    +106.9%   67177824 ±  2%  proc-vmstat.pgsteal_kswapd
   5675886 ±  6%    +237.4%   19150119 ±  8%  proc-vmstat.slabs_scanned
   1162274 ±  5%    +298.2%    4628654        proc-vmstat.workingset_nodereclaim
      4.06 ± 44%     -66.1%       1.38 ± 60%  perf-sched.sch_delay.avg.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.pte_alloc_one
      5.67 ± 18%     -60.9%       2.21 ±  7%  perf-sched.sch_delay.avg.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_noprof.page_cache_ra_order
      5.19 ± 18%     -63.8%       1.88 ± 33%  perf-sched.sch_delay.avg.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_noprof.page_cache_ra_unbounded
      5.09 ± 14%     -62.5%       1.91 ±  9%  perf-sched.sch_delay.avg.ms.__cond_resched.__alloc_pages_slowpath.constprop.0.__alloc_frozen_pages_noprof
      5.18 ± 40%     -83.4%       0.86 ±138%  perf-sched.sch_delay.avg.ms.__cond_resched.__anon_vma_prepare.__vmf_anon_prepare.do_anonymous_page.__handle_mm_fault
      2.94 ± 27%     -31.4%       2.02 ± 11%  perf-sched.sch_delay.avg.ms.__cond_resched.__rmap_walk_file.try_to_unmap.shrink_folio_list.evict_folios
      3.80 ± 36%     -68.3%       1.20 ± 49%  perf-sched.sch_delay.avg.ms.__cond_resched.__tlb_batch_free_encoded_pages.tlb_finish_mmu.exit_mmap.__mmput
      4.19 ± 35%     -86.5%       0.56 ± 26%  perf-sched.sch_delay.avg.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      7.71 ± 60%     -93.2%       0.52 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.change_pmd_range.isra.0.change_pud_range
      4.25 ± 20%     -47.6%       2.22 ± 18%  perf-sched.sch_delay.avg.ms.__cond_resched.down_read.page_cache_ra_order.filemap_fault.__do_fault
      5.71 ± 18%     -59.8%       2.30 ±  6%  perf-sched.sch_delay.avg.ms.__cond_resched.down_read.xfs_ilock_for_iomap.xfs_read_iomap_begin.iomap_iter
      3.36 ± 70%     -99.9%       0.00 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.down_write.unlink_anon_vmas.free_pgtables.exit_mmap
      0.38 ± 72%     -88.8%       0.04 ±182%  perf-sched.sch_delay.avg.ms.__cond_resched.down_write_killable.exec_mmap.begin_new_exec.load_elf_binary
      2.68 ± 78%     -93.0%       0.19 ±148%  perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc_noprof.alloc_pid.copy_process.kernel_clone
      1.78 ± 50%     -90.7%       0.16 ±142%  perf-sched.sch_delay.avg.ms.__cond_resched.mutex_lock_killable.pcpu_alloc_noprof.mm_init.alloc_bprm
     22.23 ±198%    -100.0%       0.00 ±141%  perf-sched.sch_delay.avg.ms.__cond_resched.mutex_lock_killable.pcpu_alloc_noprof.mm_init.dup_mm
      4.79 ± 13%     -58.3%       2.00 ±  7%  perf-sched.sch_delay.avg.ms.__cond_resched.shrink_folio_list.evict_folios.try_to_shrink_lruvec.shrink_one
      5.47 ± 30%     -78.1%       1.20 ±  8%  perf-sched.sch_delay.avg.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
      3.32 ±  8%     -52.4%       1.58 ± 13%  perf-sched.sch_delay.avg.ms.__cond_resched.try_to_shrink_lruvec.shrink_one.shrink_many.shrink_node
      3.04 ± 35%     -61.2%       1.18 ± 92%  perf-sched.sch_delay.avg.ms.__cond_resched.wp_page_copy.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
      3.09 ±108%     -89.7%       0.32 ± 23%  perf-sched.sch_delay.avg.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
      4.42 ± 80%     -94.5%       0.24 ± 50%  perf-sched.sch_delay.avg.ms.irq_thread.kthread.ret_from_fork.ret_from_fork_asm
      6.52 ± 22%     -65.2%       2.27 ±  6%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown]
      4.56 ± 15%     -41.6%       2.66 ±  2%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
      8.37 ±175%     -93.1%       0.58 ± 73%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
     12.12 ±144%     -87.9%       1.47 ± 26%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0.do_poll
      2.01 ± 32%     -75.3%       0.50 ± 72%  perf-sched.sch_delay.avg.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      1.79 ± 53%     -84.1%       0.28 ± 16%  perf-sched.sch_delay.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      3.35 ± 18%     -87.2%       0.43 ± 18%  perf-sched.sch_delay.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
     12.84 ± 65%     -79.5%       2.63 ± 81%  perf-sched.sch_delay.max.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.__pmd_alloc
     26.54 ±104%     -85.5%       3.86 ± 19%  perf-sched.sch_delay.max.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.pte_alloc_one
    647.33 ± 70%     -88.8%      72.25 ± 30%  perf-sched.sch_delay.max.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_noprof.page_cache_ra_order
     25.01 ± 31%     -76.9%       5.77 ± 22%  perf-sched.sch_delay.max.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_noprof.page_cache_ra_unbounded
    426.27 ± 64%     -82.7%      73.62 ± 86%  perf-sched.sch_delay.max.ms.__cond_resched.__alloc_pages_slowpath.constprop.0.__alloc_frozen_pages_noprof
      8.33 ± 35%     -87.6%       1.03 ±119%  perf-sched.sch_delay.max.ms.__cond_resched.__anon_vma_prepare.__vmf_anon_prepare.do_anonymous_page.__handle_mm_fault
     17.10 ± 31%     -48.4%       8.82 ± 25%  perf-sched.sch_delay.max.ms.__cond_resched.__rmap_walk_file.try_to_unmap.shrink_folio_list.evict_folios
     10.17 ± 25%     -69.3%       3.12 ± 44%  perf-sched.sch_delay.max.ms.__cond_resched.__tlb_batch_free_encoded_pages.tlb_finish_mmu.exit_mmap.__mmput
    652.05 ± 40%     -81.0%     123.74 ± 72%  perf-sched.sch_delay.max.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
     11.06 ± 55%     -95.3%       0.52 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.change_pmd_range.isra.0.change_pud_range
      5.64 ± 59%     -99.9%       0.00 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.down_write.unlink_anon_vmas.free_pgtables.exit_mmap
      6.55 ± 53%     -97.1%       0.19 ±148%  perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc_noprof.alloc_pid.copy_process.kernel_clone
      9.21 ± 41%     -98.2%       0.16 ±142%  perf-sched.sch_delay.max.ms.__cond_resched.mutex_lock_killable.pcpu_alloc_noprof.mm_init.alloc_bprm
    184.54 ±214%    -100.0%       0.00 ±141%  perf-sched.sch_delay.max.ms.__cond_resched.mutex_lock_killable.pcpu_alloc_noprof.mm_init.dup_mm
      0.04 ±223%    +910.3%       0.36 ± 72%  perf-sched.sch_delay.max.ms.__cond_resched.process_one_work.worker_thread.kthread.ret_from_fork
     16.88 ± 27%     -63.8%       6.11 ± 20%  perf-sched.sch_delay.max.ms.__cond_resched.shmem_inode_acct_blocks.shmem_alloc_and_add_folio.shmem_get_folio_gfp.shmem_write_begin
    705.19 ± 61%     -92.8%      51.02 ± 32%  perf-sched.sch_delay.max.ms.__cond_resched.shrink_folio_list.evict_folios.try_to_shrink_lruvec.shrink_one
     24.53 ± 27%     -67.7%       7.91 ± 71%  perf-sched.sch_delay.max.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
     62.20 ± 79%     -79.7%      12.61 ± 79%  perf-sched.sch_delay.max.ms.__cond_resched.try_to_shrink_lruvec.shrink_one.shrink_many.shrink_node
     10.33 ± 26%     -81.9%       1.87 ± 81%  perf-sched.sch_delay.max.ms.__cond_resched.wp_page_copy.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
    921.45 ± 80%     -62.2%     348.39 ±139%  perf-sched.sch_delay.max.ms.anon_pipe_read.fifo_pipe_read.vfs_read.ksys_read
    220.11 ±184%     -98.3%       3.66 ± 27%  perf-sched.sch_delay.max.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
     34.27 ±124%     -95.5%       1.54 ± 71%  perf-sched.sch_delay.max.ms.irq_thread.kthread.ret_from_fork.ret_from_fork_asm
    340.28 ± 53%     -93.3%      22.83 ± 60%  perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown]
     14.26 ± 43%     -77.5%       3.22 ± 16%  perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown].[unknown]
    200.62 ±180%     -95.5%       8.96 ± 66%  perf-sched.sch_delay.max.ms.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0.do_poll
     29.19 ± 97%     -80.4%       5.73 ± 20%  perf-sched.sch_delay.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
    268.17 ± 52%     -97.7%       6.17 ± 30%  perf-sched.sch_delay.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
    361.20 ±128%     -98.7%       4.54 ± 25%  perf-sched.sch_delay.max.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
    727.87 ± 54%     -92.5%      54.35 ± 36%  perf-sched.sch_delay.max.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      2.79 ± 19%     -54.6%       1.27 ± 11%  perf-sched.total_sch_delay.average.ms
      1429 ± 28%     -59.3%     582.08 ± 77%  perf-sched.total_sch_delay.max.ms
     21085 ±  9%     +31.9%      27821 ±  7%  perf-sched.total_wait_and_delay.count.ms
     11.34 ± 18%     -60.9%       4.43 ±  7%  perf-sched.wait_and_delay.avg.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_noprof.page_cache_ra_order
     11.44 ± 10%     -50.9%       5.62 ± 14%  perf-sched.wait_and_delay.avg.ms.__cond_resched.__alloc_pages_slowpath.constprop.0.__alloc_frozen_pages_noprof
     11.16 ± 22%     -63.3%       4.10 ±  7%  perf-sched.wait_and_delay.avg.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
     11.43 ± 18%     -59.8%       4.60 ±  6%  perf-sched.wait_and_delay.avg.ms.__cond_resched.down_read.xfs_ilock_for_iomap.xfs_read_iomap_begin.iomap_iter
     12.45 ±  8%     -55.7%       5.51 ±  6%  perf-sched.wait_and_delay.avg.ms.__cond_resched.shrink_folio_list.evict_folios.try_to_shrink_lruvec.shrink_one
    177.62 ± 65%    +246.5%     615.41 ±106%  perf-sched.wait_and_delay.avg.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
     13.98 ± 49%     -88.8%       1.57 ±102%  perf-sched.wait_and_delay.avg.ms.__cond_resched.try_to_shrink_lruvec.shrink_one.shrink_many.shrink_node
     20.20 ± 21%     -92.7%       1.48 ±148%  perf-sched.wait_and_delay.avg.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
     16.14 ±  8%     -71.9%       4.53 ±  6%  perf-sched.wait_and_delay.avg.ms.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown]
      9.19 ± 25%     -48.4%       4.74        perf-sched.wait_and_delay.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
    887.86 ±  8%     -36.9%     559.90 ±  6%  perf-sched.wait_and_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      3145 ± 11%     +77.2%       5574 ±  6%  perf-sched.wait_and_delay.count.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_noprof.page_cache_ra_order
    840.50 ±  8%     +46.8%       1233 ±  8%  perf-sched.wait_and_delay.count.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
    381.50 ± 20%     +64.4%     627.33 ± 11%  perf-sched.wait_and_delay.count.__cond_resched.down_read.xfs_ilock_for_iomap.xfs_read_iomap_begin.iomap_iter
      4.67 ± 31%     -92.9%       0.33 ±141%  perf-sched.wait_and_delay.count.__cond_resched.kmem_cache_alloc_noprof.alloc_pid.copy_process.kernel_clone
      2926 ± 13%     +57.6%       4612 ±  6%  perf-sched.wait_and_delay.count.__cond_resched.shrink_folio_list.evict_folios.try_to_shrink_lruvec.shrink_one
     43.67 ± 12%     -21.4%      34.33 ± 15%  perf-sched.wait_and_delay.count.schedule_timeout.kcompactd.kthread.ret_from_fork
      1231 ±  7%    +141.1%       2968 ±  9%  perf-sched.wait_and_delay.count.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      1294 ± 70%     -88.8%     144.50 ± 30%  perf-sched.wait_and_delay.max.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_noprof.page_cache_ra_order
      1410 ± 26%     -28.9%       1002        perf-sched.wait_and_delay.max.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      1031 ±  2%     -67.3%     336.69 ±141%  perf-sched.wait_and_delay.max.ms.__cond_resched.kmem_cache_alloc_noprof.alloc_pid.copy_process.kernel_clone
    720.83 ± 56%     -97.9%      15.36 ±154%  perf-sched.wait_and_delay.max.ms.__cond_resched.try_to_shrink_lruvec.shrink_one.shrink_many.shrink_node
      2637 ± 29%     -51.5%       1278 ± 10%  perf-sched.wait_and_delay.max.ms.anon_pipe_read.fifo_pipe_read.vfs_read.ksys_read
    335.59 ±106%     -92.1%      26.41 ±175%  perf-sched.wait_and_delay.max.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
    983.69 ±  9%     -95.4%      45.66 ± 60%  perf-sched.wait_and_delay.max.ms.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown]
    543.25 ± 52%     -97.1%      15.95 ± 18%  perf-sched.wait_and_delay.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
     98.95 ± 52%     -99.2%       0.82 ±108%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.__pmd_alloc
     19.84 ±114%     -93.3%       1.34 ± 63%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.pte_alloc_one
      5.67 ± 18%     -60.9%       2.21 ±  7%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_noprof.page_cache_ra_order
      5.19 ± 18%     -63.8%       1.88 ± 33%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_noprof.page_cache_ra_unbounded
      6.35 ± 16%     -41.6%       3.71 ± 24%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages_slowpath.constprop.0.__alloc_frozen_pages_noprof
      4.97 ± 44%     -84.1%       0.79 ±148%  perf-sched.wait_time.avg.ms.__cond_resched.__anon_vma_prepare.__vmf_anon_prepare.do_anonymous_page.__handle_mm_fault
      6.97 ± 16%     -49.3%       3.53 ±  6%  perf-sched.wait_time.avg.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      7.71 ± 60%     -93.2%       0.52 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.change_pmd_range.isra.0.change_pud_range
      4.25 ± 20%     -47.6%       2.22 ± 18%  perf-sched.wait_time.avg.ms.__cond_resched.down_read.page_cache_ra_order.filemap_fault.__do_fault
      5.71 ± 18%     -59.8%       2.30 ±  6%  perf-sched.wait_time.avg.ms.__cond_resched.down_read.xfs_ilock_for_iomap.xfs_read_iomap_begin.iomap_iter
    127.90 ±149%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.down_write.unlink_anon_vmas.free_pgtables.exit_mmap
      0.23 ± 70%     -83.9%       0.04 ±213%  perf-sched.wait_time.avg.ms.__cond_resched.down_write_killable.exec_mmap.begin_new_exec.load_elf_binary
      3.63 ±109%   +1085.0%      42.98 ±112%  perf-sched.wait_time.avg.ms.__cond_resched.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
      7.67 ±  9%     -54.1%       3.52 ± 11%  perf-sched.wait_time.avg.ms.__cond_resched.shrink_folio_list.evict_folios.try_to_shrink_lruvec.shrink_one
    177.39 ± 65%    +246.9%     615.28 ±106%  perf-sched.wait_time.avg.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      3.90 ± 36%     -81.6%       0.72 ± 12%  perf-sched.wait_time.avg.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
     10.66 ± 65%     -85.2%       1.58 ± 13%  perf-sched.wait_time.avg.ms.__cond_resched.try_to_shrink_lruvec.shrink_one.shrink_many.shrink_node
     17.11 ± 30%     -78.7%       3.64 ± 32%  perf-sched.wait_time.avg.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
      9.62 ± 12%     -76.4%       2.27 ±  6%  perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown]
      4.83 ±  9%     -44.8%       2.66 ±  2%  perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
     15.79 ± 26%     -61.8%       6.03 ± 28%  perf-sched.wait_time.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      7.40 ± 18%     -39.8%       4.46        perf-sched.wait_time.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
    886.75 ±  8%     -36.9%     559.67 ±  6%  perf-sched.wait_time.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      1030 ±  3%     -99.8%       2.38 ±100%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.__pmd_alloc
    358.49 ±129%     -98.9%       3.86 ± 19%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.pte_alloc_one
    647.33 ± 70%     -88.8%      72.25 ± 30%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_noprof.page_cache_ra_order
     25.01 ± 31%     -76.9%       5.77 ± 22%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_noprof.page_cache_ra_unbounded
      8.33 ± 35%     -87.6%       1.03 ±119%  perf-sched.wait_time.max.ms.__cond_resched.__anon_vma_prepare.__vmf_anon_prepare.do_anonymous_page.__handle_mm_fault
     11.06 ± 55%     -95.3%       0.52 ±223%  perf-sched.wait_time.max.ms.__cond_resched.change_pmd_range.isra.0.change_pud_range
    337.30 ±139%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.down_write.unlink_anon_vmas.free_pgtables.exit_mmap
      1028 ±  2%     -67.3%     336.50 ±141%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc_noprof.alloc_pid.copy_process.kernel_clone
    875.08 ± 44%     -61.9%     333.74 ±141%  perf-sched.wait_time.max.ms.__cond_resched.mutex_lock_killable.pcpu_alloc_noprof.mm_init.dup_mm
     23.68 ± 28%     -66.6%       7.91 ± 71%  perf-sched.wait_time.max.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
    695.23 ± 63%     -98.2%      12.61 ± 79%  perf-sched.wait_time.max.ms.__cond_resched.try_to_shrink_lruvec.shrink_one.shrink_many.shrink_node
    846.13 ± 44%     -80.1%     168.61 ±220%  perf-sched.wait_time.max.ms.__cond_resched.wp_page_copy.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
      2187 ± 11%     -41.6%       1278 ± 10%  perf-sched.wait_time.max.ms.anon_pipe_read.fifo_pipe_read.vfs_read.ksys_read
    144.86 ± 37%     -66.5%      48.48 ± 74%  perf-sched.wait_time.max.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
    819.42 ± 31%     -97.2%      22.83 ± 60%  perf-sched.wait_time.max.ms.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown]
    180.88 ±205%     -98.3%       3.11 ± 20%  perf-sched.wait_time.max.ms.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown].[unknown]
    218.87 ± 23%     -70.3%      65.07 ± 38%  perf-sched.wait_time.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
    346.95 ± 74%     -97.0%      10.44 ± 13%  perf-sched.wait_time.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
     85.09           -68.7       16.35 ± 31%  perf-profile.calltrace.cycles-pp.__alloc_pages_slowpath.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_noprof.page_cache_ra_order
     85.33           -62.7       22.67 ± 27%  perf-profile.calltrace.cycles-pp.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_noprof.page_cache_ra_order.filemap_fault
     85.33           -62.6       22.69 ± 27%  perf-profile.calltrace.cycles-pp.alloc_pages_mpol.folio_alloc_noprof.page_cache_ra_order.filemap_fault.__do_fault
     85.35           -62.5       22.86 ± 27%  perf-profile.calltrace.cycles-pp.folio_alloc_noprof.page_cache_ra_order.filemap_fault.__do_fault.do_read_fault
     96.41           -53.1       43.34 ± 29%  perf-profile.calltrace.cycles-pp.do_read_fault.do_pte_missing.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
     96.41           -53.1       43.34 ± 29%  perf-profile.calltrace.cycles-pp.do_pte_missing.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.exc_page_fault
     96.43           -53.0       43.40 ± 29%  perf-profile.calltrace.cycles-pp.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
     96.43           -53.0       43.45 ± 29%  perf-profile.calltrace.cycles-pp.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.do_access
     96.44           -52.9       43.59 ± 29%  perf-profile.calltrace.cycles-pp.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.do_access
     96.45           -52.9       43.60 ± 29%  perf-profile.calltrace.cycles-pp.exc_page_fault.asm_exc_page_fault.do_access
     96.50           -52.7       43.80 ± 29%  perf-profile.calltrace.cycles-pp.asm_exc_page_fault.do_access
     93.27           -50.9       42.36 ± 29%  perf-profile.calltrace.cycles-pp.filemap_fault.__do_fault.do_read_fault.do_pte_missing.__handle_mm_fault
     93.27           -50.9       42.37 ± 29%  perf-profile.calltrace.cycles-pp.__do_fault.do_read_fault.do_pte_missing.__handle_mm_fault.handle_mm_fault
     96.78           -49.4       47.42 ± 27%  perf-profile.calltrace.cycles-pp.do_access
     57.21           -46.0       11.25 ± 43%  perf-profile.calltrace.cycles-pp.try_to_shrink_lruvec.shrink_one.shrink_many.shrink_node.do_try_to_free_pages
     57.81           -45.6       12.24 ± 25%  perf-profile.calltrace.cycles-pp.shrink_folio_list.evict_folios.try_to_shrink_lruvec.shrink_one.shrink_many
     87.77           -45.4       42.32 ± 29%  perf-profile.calltrace.cycles-pp.page_cache_ra_order.filemap_fault.__do_fault.do_read_fault.do_pte_missing
     57.31           -44.0       13.32 ± 45%  perf-profile.calltrace.cycles-pp.shrink_one.shrink_many.shrink_node.do_try_to_free_pages.try_to_free_pages
     57.31           -44.0       13.34 ± 45%  perf-profile.calltrace.cycles-pp.shrink_many.shrink_node.do_try_to_free_pages.try_to_free_pages.__alloc_pages_slowpath
     57.32           -44.0       13.36 ± 45%  perf-profile.calltrace.cycles-pp.shrink_node.do_try_to_free_pages.try_to_free_pages.__alloc_pages_slowpath.__alloc_frozen_pages_noprof
     57.33           -44.0       13.36 ± 45%  perf-profile.calltrace.cycles-pp.do_try_to_free_pages.try_to_free_pages.__alloc_pages_slowpath.__alloc_frozen_pages_noprof.alloc_pages_mpol
     58.99           -43.2       15.77 ± 27%  perf-profile.calltrace.cycles-pp.evict_folios.try_to_shrink_lruvec.shrink_one.shrink_many.shrink_node
     56.68           -43.2       13.49 ± 45%  perf-profile.calltrace.cycles-pp.try_to_free_pages.__alloc_pages_slowpath.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_noprof
     34.53           -34.4        0.09 ±223%  perf-profile.calltrace.cycles-pp.rmqueue.get_page_from_freelist.__alloc_pages_slowpath.__alloc_frozen_pages_noprof.alloc_pages_mpol
     32.29           -32.0        0.30 ±101%  perf-profile.calltrace.cycles-pp.get_page_from_freelist.__alloc_pages_slowpath.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_noprof
     31.97 ±  2%     -32.0        0.00        perf-profile.calltrace.cycles-pp.__rmqueue_pcplist.rmqueue.get_page_from_freelist.__alloc_pages_slowpath.__alloc_frozen_pages_noprof
     31.95 ±  2%     -32.0        0.00        perf-profile.calltrace.cycles-pp.rmqueue_bulk.__rmqueue_pcplist.rmqueue.get_page_from_freelist.__alloc_pages_slowpath
     31.07 ±  2%     -27.6        3.49 ± 28%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.rmqueue_bulk.__rmqueue_pcplist.rmqueue
     31.07 ±  2%     -27.6        3.52 ± 28%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.rmqueue_bulk.__rmqueue_pcplist.rmqueue.get_page_from_freelist
     31.46 ±  2%     -27.5        3.92 ± 34%  perf-profile.calltrace.cycles-pp.free_unref_folios.shrink_folio_list.evict_folios.try_to_shrink_lruvec.shrink_one
     29.71 ±  2%     -26.9        2.83 ± 46%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.free_pcppages_bulk.free_frozen_page_commit.free_unref_folios
     29.72 ±  2%     -26.7        3.00 ± 41%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.free_pcppages_bulk.free_frozen_page_commit.free_unref_folios.shrink_folio_list
     29.82 ±  2%     -26.4        3.42 ± 36%  perf-profile.calltrace.cycles-pp.free_pcppages_bulk.free_frozen_page_commit.free_unref_folios.shrink_folio_list.evict_folios
     29.89 ±  2%     -26.3        3.56 ± 36%  perf-profile.calltrace.cycles-pp.free_frozen_page_commit.free_unref_folios.shrink_folio_list.evict_folios.try_to_shrink_lruvec
     23.42           -20.5        2.88 ± 26%  perf-profile.calltrace.cycles-pp.smp_call_function_many_cond.on_each_cpu_cond_mask.arch_tlbbatch_flush.try_to_unmap_flush.shrink_folio_list
     23.43           -20.5        2.88 ± 26%  perf-profile.calltrace.cycles-pp.arch_tlbbatch_flush.try_to_unmap_flush.shrink_folio_list.evict_folios.try_to_shrink_lruvec
     23.43           -20.5        2.88 ± 26%  perf-profile.calltrace.cycles-pp.on_each_cpu_cond_mask.arch_tlbbatch_flush.try_to_unmap_flush.shrink_folio_list.evict_folios
     23.43           -20.5        2.88 ± 26%  perf-profile.calltrace.cycles-pp.try_to_unmap_flush.shrink_folio_list.evict_folios.try_to_shrink_lruvec.shrink_one
      5.41 ± 12%      -5.4        0.00        perf-profile.calltrace.cycles-pp.page_cache_ra_unbounded.filemap_fault.__do_fault.do_read_fault.do_pte_missing
      5.39 ± 12%      -5.4        0.00        perf-profile.calltrace.cycles-pp.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_noprof.page_cache_ra_unbounded.filemap_fault
      5.39 ± 12%      -5.4        0.00        perf-profile.calltrace.cycles-pp.alloc_pages_mpol.folio_alloc_noprof.page_cache_ra_unbounded.filemap_fault.__do_fault
      5.39 ± 12%      -5.4        0.00        perf-profile.calltrace.cycles-pp.folio_alloc_noprof.page_cache_ra_unbounded.filemap_fault.__do_fault.do_read_fault
      5.38 ± 12%      -5.4        0.00        perf-profile.calltrace.cycles-pp.__alloc_pages_slowpath.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_noprof.page_cache_ra_unbounded
      0.00            +0.6        0.58 ± 10%  perf-profile.calltrace.cycles-pp.iomap_release_folio.shrink_folio_list.evict_folios.try_to_shrink_lruvec.shrink_one
      0.00            +0.6        0.65 ±  7%  perf-profile.calltrace.cycles-pp.scan_folios.isolate_folios.evict_folios.try_to_shrink_lruvec.shrink_one
      0.00            +0.7        0.66 ±  7%  perf-profile.calltrace.cycles-pp.isolate_folios.evict_folios.try_to_shrink_lruvec.shrink_one.shrink_many
      0.00            +0.7        0.70 ± 19%  perf-profile.calltrace.cycles-pp.xas_store.__filemap_remove_folio.__remove_mapping.shrink_folio_list.evict_folios
      0.00            +0.8        0.83 ± 18%  perf-profile.calltrace.cycles-pp.__filemap_remove_folio.__remove_mapping.shrink_folio_list.evict_folios.try_to_shrink_lruvec
      0.00            +0.8        0.84 ± 13%  perf-profile.calltrace.cycles-pp.folio_remove_rmap_ptes.zap_present_ptes.zap_pte_range.zap_pmd_range.unmap_page_range
      0.76 ±  2%      +1.0        1.72 ± 26%  perf-profile.calltrace.cycles-pp.__remove_mapping.shrink_folio_list.evict_folios.try_to_shrink_lruvec.shrink_one
      0.00            +1.3        1.28 ± 30%  perf-profile.calltrace.cycles-pp.update_process_times.tick_nohz_handler.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt
      0.00            +1.3        1.33 ± 28%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.rmqueue.get_page_from_freelist.__alloc_frozen_pages_noprof
      0.00            +1.3        1.34 ± 28%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.rmqueue.get_page_from_freelist.__alloc_frozen_pages_noprof.alloc_pages_mpol
      0.00            +1.5        1.51 ± 28%  perf-profile.calltrace.cycles-pp.tick_nohz_handler.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt
      0.00            +1.7        1.68 ± 54%  perf-profile.calltrace.cycles-pp.migrate_pages_batch.migrate_pages_sync.migrate_pages.compact_zone.kcompactd_do_work
      0.00            +1.7        1.68 ± 54%  perf-profile.calltrace.cycles-pp.migrate_pages_sync.migrate_pages.compact_zone.kcompactd_do_work.kcompactd
      0.00            +1.9        1.88 ± 69%  perf-profile.calltrace.cycles-pp.truncate_folio_batch_exceptionals.truncate_inode_pages_range.xfs_fs_evict_inode.evict.do_unlinkat
      0.00            +2.2        2.23 ± 44%  perf-profile.calltrace.cycles-pp.migrate_pages.compact_zone.kcompactd_do_work.kcompactd.kthread
      0.00            +2.4        2.38 ± 43%  perf-profile.calltrace.cycles-pp.compact_zone.kcompactd_do_work.kcompactd.kthread.ret_from_fork
      0.00            +2.4        2.41 ± 43%  perf-profile.calltrace.cycles-pp.kcompactd_do_work.kcompactd.kthread.ret_from_fork.ret_from_fork_asm
      0.00            +2.5        2.47 ± 14%  perf-profile.calltrace.cycles-pp.zap_present_ptes.zap_pte_range.zap_pmd_range.unmap_page_range.unmap_vmas
      0.00            +2.5        2.48 ± 35%  perf-profile.calltrace.cycles-pp.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
      0.00            +2.6        2.60 ± 70%  perf-profile.calltrace.cycles-pp.migrate_pages_batch.migrate_pages_sync.migrate_pages.compact_zone.compact_node
      0.00            +2.6        2.60 ± 70%  perf-profile.calltrace.cycles-pp.migrate_pages_sync.migrate_pages.compact_zone.compact_node.kcompactd
      1.80            +2.8        4.60 ± 13%  perf-profile.calltrace.cycles-pp.try_to_shrink_lruvec.shrink_one.shrink_many.shrink_node.balance_pgdat
      1.80            +2.8        4.60 ± 13%  perf-profile.calltrace.cycles-pp.shrink_many.shrink_node.balance_pgdat.kswapd.kthread
      1.80            +2.8        4.60 ± 13%  perf-profile.calltrace.cycles-pp.shrink_node.balance_pgdat.kswapd.kthread.ret_from_fork
      1.80            +2.8        4.60 ± 13%  perf-profile.calltrace.cycles-pp.shrink_one.shrink_many.shrink_node.balance_pgdat.kswapd
      1.80            +2.8        4.61 ± 13%  perf-profile.calltrace.cycles-pp.balance_pgdat.kswapd.kthread.ret_from_fork.ret_from_fork_asm
      1.80            +2.9        4.67 ± 13%  perf-profile.calltrace.cycles-pp.kswapd.kthread.ret_from_fork.ret_from_fork_asm
      0.00            +2.9        2.90 ± 39%  perf-profile.calltrace.cycles-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.pv_native_safe_halt
      0.00            +2.9        2.90 ± 39%  perf-profile.calltrace.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.pv_native_safe_halt.acpi_safe_halt
      0.00            +2.9        2.91 ± 14%  perf-profile.calltrace.cycles-pp.zap_pte_range.zap_pmd_range.unmap_page_range.unmap_vmas.vms_clear_ptes
      0.00            +2.9        2.92 ± 14%  perf-profile.calltrace.cycles-pp.unmap_page_range.unmap_vmas.vms_clear_ptes.vms_complete_munmap_vmas.do_vmi_align_munmap
      0.00            +2.9        2.92 ± 14%  perf-profile.calltrace.cycles-pp.unmap_vmas.vms_clear_ptes.vms_complete_munmap_vmas.do_vmi_align_munmap.do_vmi_munmap
      0.00            +2.9        2.92 ± 14%  perf-profile.calltrace.cycles-pp.zap_pmd_range.unmap_page_range.unmap_vmas.vms_clear_ptes.vms_complete_munmap_vmas
      0.00            +2.9        2.93 ± 14%  perf-profile.calltrace.cycles-pp.__munmap
      0.00            +2.9        2.93 ± 14%  perf-profile.calltrace.cycles-pp.__vm_munmap.__x64_sys_munmap.do_syscall_64.entry_SYSCALL_64_after_hwframe.__munmap
      0.00            +2.9        2.93 ± 14%  perf-profile.calltrace.cycles-pp.__x64_sys_munmap.do_syscall_64.entry_SYSCALL_64_after_hwframe.__munmap
      0.00            +2.9        2.93 ± 14%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__munmap
      0.00            +2.9        2.93 ± 14%  perf-profile.calltrace.cycles-pp.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap.__x64_sys_munmap.do_syscall_64
      0.00            +2.9        2.93 ± 14%  perf-profile.calltrace.cycles-pp.do_vmi_munmap.__vm_munmap.__x64_sys_munmap.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +2.9        2.93 ± 14%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__munmap
      0.00            +2.9        2.93 ± 14%  perf-profile.calltrace.cycles-pp.vms_clear_ptes.vms_complete_munmap_vmas.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap
      0.00            +2.9        2.93 ± 14%  perf-profile.calltrace.cycles-pp.vms_complete_munmap_vmas.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap.__x64_sys_munmap
      0.00            +3.5        3.50 ± 75%  perf-profile.calltrace.cycles-pp.migrate_pages.compact_zone.compact_node.kcompactd.kthread
      0.00            +3.7        3.74 ± 75%  perf-profile.calltrace.cycles-pp.compact_node.kcompactd.kthread.ret_from_fork.ret_from_fork_asm
      0.00            +3.7        3.74 ± 75%  perf-profile.calltrace.cycles-pp.compact_zone.compact_node.kcompactd.kthread.ret_from_fork
      0.00            +4.1        4.07 ± 26%  perf-profile.calltrace.cycles-pp.rmqueue_bulk.__rmqueue_pcplist.rmqueue.get_page_from_freelist.__alloc_frozen_pages_noprof
      0.54 ±  3%      +4.1        4.64 ± 14%  perf-profile.calltrace.cycles-pp.do_rw_once
      0.00            +4.1        4.12 ± 25%  perf-profile.calltrace.cycles-pp.__rmqueue_pcplist.rmqueue.get_page_from_freelist.__alloc_frozen_pages_noprof.alloc_pages_mpol
      0.00            +4.2        4.18 ± 66%  perf-profile.calltrace.cycles-pp.evict.do_unlinkat.__x64_sys_unlinkat.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +4.2        4.18 ± 66%  perf-profile.calltrace.cycles-pp.truncate_inode_pages_range.xfs_fs_evict_inode.evict.do_unlinkat.__x64_sys_unlinkat
      0.00            +4.2        4.18 ± 66%  perf-profile.calltrace.cycles-pp.xfs_fs_evict_inode.evict.do_unlinkat.__x64_sys_unlinkat.do_syscall_64
      0.00            +4.2        4.19 ± 66%  perf-profile.calltrace.cycles-pp.__x64_sys_unlinkat.do_syscall_64.entry_SYSCALL_64_after_hwframe.unlinkat
      0.00            +4.2        4.19 ± 66%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.unlinkat
      0.00            +4.2        4.19 ± 66%  perf-profile.calltrace.cycles-pp.do_unlinkat.__x64_sys_unlinkat.do_syscall_64.entry_SYSCALL_64_after_hwframe.unlinkat
      0.00            +4.2        4.19 ± 66%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.unlinkat
      0.00            +4.2        4.19 ± 66%  perf-profile.calltrace.cycles-pp.unlinkat
      0.00            +4.2        4.24 ± 49%  perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.pv_native_safe_halt.acpi_safe_halt.acpi_idle_do_entry
      0.00            +4.9        4.90 ± 51%  perf-profile.calltrace.cycles-pp.pv_native_safe_halt.acpi_safe_halt.acpi_idle_do_entry.acpi_idle_enter.cpuidle_enter_state
      0.00            +5.0        4.99 ± 18%  perf-profile.calltrace.cycles-pp.memset_orig.zero_user_segments.iomap_readpage_iter.iomap_readahead.read_pages
      0.00            +5.0        5.04 ± 18%  perf-profile.calltrace.cycles-pp.zero_user_segments.iomap_readpage_iter.iomap_readahead.read_pages.page_cache_ra_order
      0.00            +5.6        5.63 ± 26%  perf-profile.calltrace.cycles-pp.rmqueue.get_page_from_freelist.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_noprof
      0.00            +5.9        5.93 ± 19%  perf-profile.calltrace.cycles-pp.iomap_readpage_iter.iomap_readahead.read_pages.page_cache_ra_order.filemap_fault
      0.17 ±141%      +6.1        6.25 ± 20%  perf-profile.calltrace.cycles-pp.read_pages.page_cache_ra_order.filemap_fault.__do_fault.do_read_fault
      0.00            +6.1        6.15 ± 61%  perf-profile.calltrace.cycles-pp.kcompactd.kthread.ret_from_fork.ret_from_fork_asm
      0.08 ±223%      +6.2        6.24 ± 20%  perf-profile.calltrace.cycles-pp.iomap_readahead.read_pages.page_cache_ra_order.filemap_fault.__do_fault
      0.00            +6.3        6.27 ± 24%  perf-profile.calltrace.cycles-pp.get_page_from_freelist.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_noprof.page_cache_ra_order
      1.86 ±  3%     +10.3       12.11 ± 39%  perf-profile.calltrace.cycles-pp.kthread.ret_from_fork.ret_from_fork_asm
      1.86 ±  3%     +10.3       12.11 ± 39%  perf-profile.calltrace.cycles-pp.ret_from_fork.ret_from_fork_asm
      1.86 ±  3%     +10.3       12.11 ± 39%  perf-profile.calltrace.cycles-pp.ret_from_fork_asm
      0.10 ±223%     +26.9       27.02 ± 12%  perf-profile.calltrace.cycles-pp.acpi_safe_halt.acpi_idle_do_entry.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter
      0.10 ±223%     +26.9       27.03 ± 12%  perf-profile.calltrace.cycles-pp.acpi_idle_do_entry.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call
      0.10 ±223%     +27.0       27.06 ± 12%  perf-profile.calltrace.cycles-pp.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
      0.10 ±223%     +27.1       27.21 ± 13%  perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry
      0.10 ±223%     +27.1       27.24 ± 13%  perf-profile.calltrace.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary
      0.10 ±223%     +28.3       28.45 ± 19%  perf-profile.calltrace.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary.common_startup_64
      0.10 ±223%     +28.5       28.64 ± 20%  perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.common_startup_64
      0.10 ±223%     +28.5       28.65 ± 20%  perf-profile.calltrace.cycles-pp.cpu_startup_entry.start_secondary.common_startup_64
      0.10 ±223%     +28.5       28.65 ± 20%  perf-profile.calltrace.cycles-pp.start_secondary.common_startup_64
      0.10 ±223%     +28.7       28.79 ± 19%  perf-profile.calltrace.cycles-pp.common_startup_64
      0.19 ±223%     +46.2       46.39 ± 10%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.pv_native_safe_halt.acpi_safe_halt.acpi_idle_do_entry.acpi_idle_enter
     94.65           -78.3       16.35 ± 31%  perf-profile.children.cycles-pp.__alloc_pages_slowpath
     94.92           -71.9       23.02 ± 27%  perf-profile.children.cycles-pp.__alloc_frozen_pages_noprof
     94.90           -71.9       23.03 ± 27%  perf-profile.children.cycles-pp.alloc_pages_mpol
     90.82           -68.0       22.86 ± 27%  perf-profile.children.cycles-pp.folio_alloc_noprof
     96.62           -53.2       43.43 ± 29%  perf-profile.children.cycles-pp.__handle_mm_fault
     96.64           -53.2       43.48 ± 29%  perf-profile.children.cycles-pp.handle_mm_fault
     96.45           -53.1       43.36 ± 29%  perf-profile.children.cycles-pp.do_pte_missing
     96.42           -53.1       43.35 ± 29%  perf-profile.children.cycles-pp.do_read_fault
     96.58           -53.0       43.62 ± 29%  perf-profile.children.cycles-pp.do_user_addr_fault
     96.58           -52.9       43.63 ± 29%  perf-profile.children.cycles-pp.exc_page_fault
     96.64           -52.8       43.84 ± 29%  perf-profile.children.cycles-pp.asm_exc_page_fault
     93.28           -50.9       42.37 ± 29%  perf-profile.children.cycles-pp.__do_fault
     93.27           -50.9       42.36 ± 29%  perf-profile.children.cycles-pp.filemap_fault
     96.90           -50.3       46.56 ± 28%  perf-profile.children.cycles-pp.do_access
     69.20           -47.1       22.12 ± 28%  perf-profile.children.cycles-pp._raw_spin_lock_irqsave
     58.12           -45.9       12.24 ± 25%  perf-profile.children.cycles-pp.shrink_folio_list
     87.82           -45.5       42.32 ± 29%  perf-profile.children.cycles-pp.page_cache_ra_order
     71.50           -45.2       26.32 ± 33%  perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
     57.65           -44.3       13.36 ± 45%  perf-profile.children.cycles-pp.do_try_to_free_pages
     57.68           -44.2       13.49 ± 45%  perf-profile.children.cycles-pp.try_to_free_pages
     59.31           -43.5       15.78 ± 27%  perf-profile.children.cycles-pp.evict_folios
     59.32           -43.5       15.85 ± 27%  perf-profile.children.cycles-pp.try_to_shrink_lruvec
     59.42           -41.5       17.92 ± 30%  perf-profile.children.cycles-pp.shrink_one
     59.42           -41.5       17.94 ± 30%  perf-profile.children.cycles-pp.shrink_many
     59.44           -41.5       17.96 ± 30%  perf-profile.children.cycles-pp.shrink_node
     35.62           -29.3        6.34 ± 25%  perf-profile.children.cycles-pp.rmqueue
     36.06           -29.0        7.09 ± 23%  perf-profile.children.cycles-pp.get_page_from_freelist
     33.03 ±  2%     -28.4        4.62 ± 25%  perf-profile.children.cycles-pp.rmqueue_bulk
     33.04 ±  2%     -28.4        4.66 ± 24%  perf-profile.children.cycles-pp.__rmqueue_pcplist
     32.00 ±  2%     -27.6        4.38 ± 25%  perf-profile.children.cycles-pp.free_unref_folios
     30.44 ±  2%     -26.3        4.16 ± 25%  perf-profile.children.cycles-pp.free_frozen_page_commit
     30.61 ±  2%     -26.1        4.49 ± 24%  perf-profile.children.cycles-pp.free_pcppages_bulk
     23.89           -20.6        3.29 ± 18%  perf-profile.children.cycles-pp.on_each_cpu_cond_mask
     23.89           -20.6        3.29 ± 18%  perf-profile.children.cycles-pp.smp_call_function_many_cond
     23.87           -20.6        3.29 ± 18%  perf-profile.children.cycles-pp.arch_tlbbatch_flush
     23.87           -20.6        3.29 ± 18%  perf-profile.children.cycles-pp.try_to_unmap_flush
      5.44 ± 12%      -5.4        0.00        perf-profile.children.cycles-pp.page_cache_ra_unbounded
      3.28            -3.0        0.31 ± 38%  perf-profile.children.cycles-pp.alloc_pages_noprof
      3.10            -2.8        0.30 ± 37%  perf-profile.children.cycles-pp.pte_alloc_one
      1.58 ±  9%      -1.5        0.11 ± 49%  perf-profile.children.cycles-pp.free_one_page
      0.62 ±  4%      -0.6        0.03 ±102%  perf-profile.children.cycles-pp.kmem_cache_alloc_lru_noprof
      0.57 ±  3%      -0.5        0.03 ±102%  perf-profile.children.cycles-pp.xas_alloc
      0.65 ±  3%      -0.2        0.44 ± 26%  perf-profile.children.cycles-pp.___slab_alloc
      0.00            +0.1        0.06 ±  6%  perf-profile.children.cycles-pp.page_counter_uncharge
      0.00            +0.1        0.06 ±  9%  perf-profile.children.cycles-pp.uncharge_batch
      0.00            +0.1        0.06 ± 17%  perf-profile.children.cycles-pp.sync_regs
      0.00            +0.1        0.07 ± 14%  perf-profile.children.cycles-pp.xas_squash_marks
      0.00            +0.1        0.07 ± 27%  perf-profile.children.cycles-pp.cgroup_rstat_updated
      0.00            +0.1        0.07 ± 15%  perf-profile.children.cycles-pp.lock_vma_under_rcu
      0.00            +0.1        0.09 ± 20%  perf-profile.children.cycles-pp.delay_tsc
      0.00            +0.1        0.10 ± 23%  perf-profile.children.cycles-pp.task_tick_fair
      0.00            +0.1        0.10 ± 10%  perf-profile.children.cycles-pp.__mod_lruvec_state
      0.00            +0.1        0.10 ± 31%  perf-profile.children.cycles-pp.xas_start
      0.00            +0.1        0.10 ± 11%  perf-profile.children.cycles-pp.__mem_cgroup_uncharge_folios
      0.00            +0.1        0.10 ± 23%  perf-profile.children.cycles-pp._find_next_bit
      0.00            +0.1        0.10 ± 17%  perf-profile.children.cycles-pp._raw_spin_trylock
      0.00            +0.1        0.10 ± 26%  perf-profile.children.cycles-pp.charge_memcg
      0.00            +0.1        0.11 ± 57%  perf-profile.children.cycles-pp.rcu_cblist_dequeue
      0.00            +0.1        0.12 ± 14%  perf-profile.children.cycles-pp.__pte_offset_map_lock
      0.00            +0.1        0.12 ± 46%  perf-profile.children.cycles-pp.irqtime_account_irq
      0.00            +0.1        0.12 ± 53%  perf-profile.children.cycles-pp.__intel_pmu_enable_all
      0.00            +0.1        0.12 ± 67%  perf-profile.children.cycles-pp.update_sg_lb_stats
      0.00            +0.1        0.13 ± 41%  perf-profile.children.cycles-pp.mem_cgroup_from_slab_obj
      0.00            +0.1        0.14 ± 37%  perf-profile.children.cycles-pp.rest_init
      0.00            +0.1        0.14 ± 37%  perf-profile.children.cycles-pp.start_kernel
      0.00            +0.1        0.14 ± 37%  perf-profile.children.cycles-pp.x86_64_start_kernel
      0.00            +0.1        0.14 ± 37%  perf-profile.children.cycles-pp.x86_64_start_reservations
      0.00            +0.1        0.14 ± 12%  perf-profile.children.cycles-pp.filemap_unaccount_folio
      0.00            +0.1        0.14 ± 16%  perf-profile.children.cycles-pp.tlb_flush_mmu
      0.00            +0.1        0.15 ± 52%  perf-profile.children.cycles-pp.get_pfnblock_flags_mask
      0.00            +0.1        0.15 ± 24%  perf-profile.children.cycles-pp.lru_gen_eviction
      0.00            +0.1        0.15 ± 84%  perf-profile.children.cycles-pp.raw_spin_rq_lock_nested
      0.00            +0.2        0.15 ± 18%  perf-profile.children.cycles-pp.__tlb_batch_free_encoded_pages
      0.00            +0.2        0.15 ± 44%  perf-profile.children.cycles-pp.asm_sysvec_call_function_single
      0.00            +0.2        0.15 ± 18%  perf-profile.children.cycles-pp.free_pages_and_swap_cache
      0.00            +0.2        0.15 ± 29%  perf-profile.children.cycles-pp.arch_scale_freq_tick
      0.00            +0.2        0.16 ± 35%  perf-profile.children.cycles-pp.__mem_cgroup_charge
      0.00            +0.2        0.16 ± 73%  perf-profile.children.cycles-pp.ktime_get_update_offsets_now
      0.00            +0.2        0.17 ± 73%  perf-profile.children.cycles-pp.update_sd_lb_stats
      0.00            +0.2        0.18 ± 74%  perf-profile.children.cycles-pp.sched_balance_find_src_group
      0.00            +0.2        0.18 ± 49%  perf-profile.children.cycles-pp.rcu_pending
      0.00            +0.2        0.18 ± 15%  perf-profile.children.cycles-pp.tlb_remove_table_rcu
      0.03 ± 70%      +0.2        0.22 ± 33%  perf-profile.children.cycles-pp.__flush_smp_call_function_queue
      0.00            +0.2        0.19 ± 51%  perf-profile.children.cycles-pp.perf_rotate_context
      0.00            +0.2        0.20 ± 74%  perf-profile.children.cycles-pp.clockevents_program_event
      0.00            +0.2        0.20 ± 54%  perf-profile.children.cycles-pp.rcu_sched_clock_irq
      0.00            +0.2        0.21 ± 16%  perf-profile.children.cycles-pp.sort_folio
      0.00            +0.2        0.21 ± 18%  perf-profile.children.cycles-pp.next_uptodate_folio
      0.00            +0.2        0.21 ± 25%  perf-profile.children.cycles-pp.compact_lock_irqsave
      0.00            +0.2        0.22 ± 12%  perf-profile.children.cycles-pp.__mod_node_page_state
      0.00            +0.2        0.23 ± 32%  perf-profile.children.cycles-pp.get_partial_node
      0.00            +0.2        0.23 ± 59%  perf-profile.children.cycles-pp.xas_clear_mark
      0.00            +0.2        0.24 ± 50%  perf-profile.children.cycles-pp.__memcg_slab_free_hook
      0.00            +0.2        0.24 ± 69%  perf-profile.children.cycles-pp.sched_balance_rq
      0.00            +0.2        0.24 ± 31%  perf-profile.children.cycles-pp.__put_partials
      0.00            +0.2        0.24 ± 13%  perf-profile.children.cycles-pp.folio_unlock
      0.00            +0.2        0.25 ± 62%  perf-profile.children.cycles-pp.__page_cache_release
      0.00            +0.2        0.25 ± 13%  perf-profile.children.cycles-pp.__split_unmapped_folio
      0.00            +0.3        0.25 ± 62%  perf-profile.children.cycles-pp.truncate_cleanup_folio
      0.00            +0.3        0.26 ±  9%  perf-profile.children.cycles-pp.__mod_zone_page_state
      0.00            +0.3        0.26 ± 25%  perf-profile.children.cycles-pp.native_irq_return_iret
      0.00            +0.3        0.27 ± 33%  perf-profile.children.cycles-pp.__zone_watermark_ok
      0.62 ±  3%      +0.3        0.90 ± 18%  perf-profile.children.cycles-pp.xas_create
      0.00            +0.3        0.28 ± 29%  perf-profile.children.cycles-pp.iomap_set_range_uptodate
      0.00            +0.3        0.28 ± 26%  perf-profile.children.cycles-pp.folio_add_file_rmap_ptes
      0.00            +0.3        0.29 ± 46%  perf-profile.children.cycles-pp.list_lru_add_obj
      0.00            +0.3        0.30 ± 37%  perf-profile.children.cycles-pp.xas_load
      0.00            +0.3        0.30 ± 27%  perf-profile.children.cycles-pp.set_pte_range
      0.00            +0.3        0.32 ± 15%  perf-profile.children.cycles-pp.folio_mark_accessed
      0.00            +0.3        0.32 ± 71%  perf-profile.children.cycles-pp.xas_get_order
      0.00            +0.3        0.34 ± 68%  perf-profile.children.cycles-pp.list_lru_del
      0.00            +0.4        0.35 ± 61%  perf-profile.children.cycles-pp.__free_frozen_pages
      0.00            +0.4        0.41 ± 17%  perf-profile.children.cycles-pp.io_serial_in
      0.00            +0.4        0.42 ± 49%  perf-profile.children.cycles-pp.tmigr_requires_handle_remote
      0.00            +0.4        0.43 ± 20%  perf-profile.children.cycles-pp.ifs_free
      0.00            +0.5        0.46 ± 59%  perf-profile.children.cycles-pp.sched_balance_domains
      0.00            +0.5        0.47 ± 79%  perf-profile.children.cycles-pp.__folio_migrate_mapping
      0.01 ±223%      +0.5        0.48 ± 26%  perf-profile.children.cycles-pp.__kmalloc_noprof
      0.00            +0.5        0.48 ± 69%  perf-profile.children.cycles-pp.list_lru_del_obj
      0.00            +0.5        0.50 ± 16%  perf-profile.children.cycles-pp.wait_for_lsr
      0.13 ±  3%      +0.5        0.62 ± 15%  perf-profile.children.cycles-pp.write
      0.00            +0.5        0.50 ± 37%  perf-profile.children.cycles-pp.__slab_free
      0.12 ±  6%      +0.5        0.62 ± 15%  perf-profile.children.cycles-pp.ksys_write
      0.12 ±  6%      +0.5        0.62 ± 15%  perf-profile.children.cycles-pp.vfs_write
      0.00            +0.5        0.50 ± 56%  perf-profile.children.cycles-pp.run_ksoftirqd
      0.00            +0.5        0.52 ± 56%  perf-profile.children.cycles-pp.smpboot_thread_fn
      0.00            +0.5        0.53 ± 57%  perf-profile.children.cycles-pp.xas_find
      0.00            +0.5        0.55 ± 17%  perf-profile.children.cycles-pp.serial8250_console_write
      0.01 ±223%      +0.6        0.56 ± 26%  perf-profile.children.cycles-pp.ifs_alloc
      0.00            +0.6        0.57 ± 49%  perf-profile.children.cycles-pp.kmem_cache_free
      0.00            +0.6        0.60 ± 16%  perf-profile.children.cycles-pp.devkmsg_emit
      0.00            +0.6        0.60 ± 16%  perf-profile.children.cycles-pp.devkmsg_write
      0.07 ±  8%      +0.6        0.66 ± 20%  perf-profile.children.cycles-pp.lru_gen_add_folio
      0.00            +0.6        0.60 ± 17%  perf-profile.children.cycles-pp.console_flush_all
      0.00            +0.6        0.60 ± 17%  perf-profile.children.cycles-pp.console_unlock
      0.07            +0.6        0.67 ± 23%  perf-profile.children.cycles-pp.filemap_map_pages
      0.00            +0.6        0.60 ± 17%  perf-profile.children.cycles-pp.vprintk_emit
      0.00            +0.6        0.61 ± 13%  perf-profile.children.cycles-pp.kfree
      0.05            +0.6        0.69 ± 32%  perf-profile.children.cycles-pp.sched_tick
      0.02 ±142%      +0.7        0.68 ± 24%  perf-profile.children.cycles-pp.__folio_split
      0.02 ±142%      +0.7        0.70 ± 24%  perf-profile.children.cycles-pp.__mod_memcg_lruvec_state
      0.00            +0.7        0.71 ± 17%  perf-profile.children.cycles-pp.ast_mode_config_helper_atomic_commit_tail
      0.00            +0.7        0.71 ± 17%  perf-profile.children.cycles-pp.ast_primary_plane_helper_atomic_update
      0.00            +0.7        0.71 ± 17%  perf-profile.children.cycles-pp.commit_tail
      0.00            +0.7        0.71 ± 17%  perf-profile.children.cycles-pp.drm_atomic_commit
      0.00            +0.7        0.71 ± 17%  perf-profile.children.cycles-pp.drm_atomic_helper_commit
      0.00            +0.7        0.71 ± 17%  perf-profile.children.cycles-pp.drm_atomic_helper_commit_planes
      0.00            +0.7        0.71 ± 17%  perf-profile.children.cycles-pp.drm_atomic_helper_commit_tail
      0.00            +0.7        0.71 ± 17%  perf-profile.children.cycles-pp.drm_atomic_helper_dirtyfb
      0.00            +0.7        0.71 ± 17%  perf-profile.children.cycles-pp.drm_fb_helper_damage_work
      0.00            +0.7        0.71 ± 17%  perf-profile.children.cycles-pp.drm_fb_memcpy
      0.00            +0.7        0.71 ± 17%  perf-profile.children.cycles-pp.drm_fbdev_shmem_helper_fb_dirty
      0.00            +0.7        0.71 ± 17%  perf-profile.children.cycles-pp.memcpy_toio
      0.00            +0.7        0.74 ± 17%  perf-profile.children.cycles-pp.process_one_work
      0.00            +0.7        0.75 ± 17%  perf-profile.children.cycles-pp.worker_thread
      0.07            +0.8        0.83 ± 21%  perf-profile.children.cycles-pp.lru_gen_del_folio
      0.08 ±  5%      +0.8        0.86 ± 21%  perf-profile.children.cycles-pp.__free_one_page
      0.06 ±  7%      +0.8        0.84 ± 18%  perf-profile.children.cycles-pp.lru_add
      0.06 ±  9%      +0.8        0.83 ± 28%  perf-profile.children.cycles-pp.__lruvec_stat_mod_folio
      0.13 ±  3%      +0.8        0.91 ± 10%  perf-profile.children.cycles-pp.scan_folios
      0.13 ±  5%      +0.8        0.93 ± 11%  perf-profile.children.cycles-pp.isolate_folios
      0.07 ±  7%      +0.8        0.90 ±  9%  perf-profile.children.cycles-pp.iomap_release_folio
      0.00            +0.9        0.86 ± 35%  perf-profile.children.cycles-pp.workingset_update_node
      0.00            +0.9        0.89 ± 42%  perf-profile.children.cycles-pp.rcu_do_batch
      0.00            +0.9        0.89 ± 46%  perf-profile.children.cycles-pp.perf_mux_hrtimer_handler
      0.00            +0.9        0.90 ± 30%  perf-profile.children.cycles-pp.fast_isolate_freepages
      0.14 ±  4%      +0.9        1.06 ± 13%  perf-profile.children.cycles-pp.folio_remove_rmap_ptes
      0.00            +0.9        0.94 ±191%  perf-profile.children.cycles-pp.tick_nohz_next_event
      0.00            +1.0        0.97 ± 45%  perf-profile.children.cycles-pp.rcu_core
      0.00            +1.0        0.97 ± 33%  perf-profile.children.cycles-pp.isolate_freepages_block
      0.00            +1.0        1.00 ±184%  perf-profile.children.cycles-pp.tick_nohz_get_sleep_length
      0.00            +1.0        1.01 ± 45%  perf-profile.children.cycles-pp.folios_put_refs
      0.00            +1.0        1.02 ± 74%  perf-profile.children.cycles-pp.ktime_get
      0.10 ±  5%      +1.1        1.16 ± 22%  perf-profile.children.cycles-pp.__filemap_remove_folio
      0.00            +1.1        1.09 ± 66%  perf-profile.children.cycles-pp.find_lock_entries
      0.00            +1.1        1.12 ± 79%  perf-profile.children.cycles-pp.isolate_migratepages_block
      0.00            +1.1        1.13 ±169%  perf-profile.children.cycles-pp.menu_select
      0.00            +1.2        1.18 ± 54%  perf-profile.children.cycles-pp.__irq_exit_rcu
      0.08 ± 20%      +1.2        1.31 ± 41%  perf-profile.children.cycles-pp.asm_sysvec_call_function
      0.00            +1.4        1.37 ± 32%  perf-profile.children.cycles-pp.isolate_freepages
      0.00            +1.4        1.42 ± 34%  perf-profile.children.cycles-pp.compaction_alloc
      0.06 ±  7%      +1.4        1.52 ± 26%  perf-profile.children.cycles-pp.update_process_times
      0.00            +1.5        1.49 ± 35%  perf-profile.children.cycles-pp.migrate_folio_unmap
      0.00            +1.6        1.61 ± 55%  perf-profile.children.cycles-pp.handle_softirqs
      0.07 ±  6%      +1.7        1.76 ± 24%  perf-profile.children.cycles-pp.tick_nohz_handler
      0.00            +1.9        1.88 ± 69%  perf-profile.children.cycles-pp.truncate_folio_batch_exceptionals
      0.00            +1.9        1.92 ± 93%  perf-profile.children.cycles-pp.isolate_migratepages
      0.00            +2.2        2.24 ± 81%  perf-profile.children.cycles-pp.copy_mc_fragile
      0.00            +2.2        2.25 ± 81%  perf-profile.children.cycles-pp.folio_mc_copy
      0.04 ±142%      +2.4        2.41 ± 43%  perf-profile.children.cycles-pp.kcompactd_do_work
      0.67 ±  3%      +2.4        3.11 ± 35%  perf-profile.children.cycles-pp.xas_store
      0.00            +2.5        2.48 ± 14%  perf-profile.children.cycles-pp.zap_present_ptes
      0.09 ±  4%      +2.7        2.79 ± 31%  perf-profile.children.cycles-pp.__hrtimer_run_queues
      1.80            +2.8        4.61 ± 13%  perf-profile.children.cycles-pp.balance_pgdat
      0.00            +2.9        2.86 ± 82%  perf-profile.children.cycles-pp.__migrate_folio
      1.80            +2.9        4.67 ± 13%  perf-profile.children.cycles-pp.kswapd
      0.00            +2.9        2.92 ± 14%  perf-profile.children.cycles-pp.zap_pmd_range
      0.00            +2.9        2.92 ± 14%  perf-profile.children.cycles-pp.zap_pte_range
      0.00            +2.9        2.92 ± 14%  perf-profile.children.cycles-pp.unmap_page_range
      0.00            +2.9        2.93 ± 14%  perf-profile.children.cycles-pp.unmap_vmas
      0.00            +2.9        2.93 ± 81%  perf-profile.children.cycles-pp.move_to_new_folio
      0.00            +2.9        2.93 ± 14%  perf-profile.children.cycles-pp.__munmap
      0.00            +2.9        2.93 ± 14%  perf-profile.children.cycles-pp.__x64_sys_munmap
      0.00            +2.9        2.93 ± 14%  perf-profile.children.cycles-pp.vms_clear_ptes
      0.00            +2.9        2.93 ± 14%  perf-profile.children.cycles-pp.vms_complete_munmap_vmas
      0.00            +2.9        2.93 ± 14%  perf-profile.children.cycles-pp.__vm_munmap
      0.00            +2.9        2.93 ± 14%  perf-profile.children.cycles-pp.do_vmi_align_munmap
      0.00            +2.9        2.93 ± 14%  perf-profile.children.cycles-pp.do_vmi_munmap
      0.11 ±  4%      +3.1        3.24 ± 35%  perf-profile.children.cycles-pp.hrtimer_interrupt
      0.11 ±  4%      +3.1        3.25 ± 35%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      0.00            +3.7        3.74 ± 75%  perf-profile.children.cycles-pp.compact_node
      0.00            +4.2        4.18 ± 66%  perf-profile.children.cycles-pp.evict
      0.00            +4.2        4.18 ± 66%  perf-profile.children.cycles-pp.truncate_inode_pages_range
      0.00            +4.2        4.18 ± 66%  perf-profile.children.cycles-pp.xfs_fs_evict_inode
      0.00            +4.2        4.19 ± 66%  perf-profile.children.cycles-pp.__x64_sys_unlinkat
      0.00            +4.2        4.19 ± 66%  perf-profile.children.cycles-pp.do_unlinkat
      0.00            +4.2        4.19 ± 66%  perf-profile.children.cycles-pp.unlinkat
      0.04 ±142%      +4.3        4.36 ± 61%  perf-profile.children.cycles-pp.migrate_pages_sync
      0.40 ±  3%      +4.6        5.02 ± 18%  perf-profile.children.cycles-pp.memset_orig
      0.13 ±  3%      +4.6        4.77 ± 45%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      0.40 ±  3%      +4.6        5.04 ± 18%  perf-profile.children.cycles-pp.zero_user_segments
      0.64 ±  3%      +5.1        5.76 ± 14%  perf-profile.children.cycles-pp.do_rw_once
      0.46 ±  3%      +5.5        5.94 ± 19%  perf-profile.children.cycles-pp.iomap_readpage_iter
      0.49 ±  3%      +5.8        6.25 ± 20%  perf-profile.children.cycles-pp.iomap_readahead
      0.49 ±  3%      +5.8        6.25 ± 19%  perf-profile.children.cycles-pp.read_pages
      0.04 ±142%      +5.8        5.88 ± 60%  perf-profile.children.cycles-pp.migrate_pages_batch
      0.04 ±142%      +5.8        5.89 ± 60%  perf-profile.children.cycles-pp.migrate_pages
      0.04 ±142%      +6.1        6.15 ± 61%  perf-profile.children.cycles-pp.kcompactd
      0.40 ±  6%      +7.6        7.95 ± 38%  perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.40 ±  6%      +7.6        7.95 ± 38%  perf-profile.children.cycles-pp.do_syscall_64
      0.04 ±142%      +7.8        7.88 ± 66%  perf-profile.children.cycles-pp.compact_zone
      1.87 ±  3%     +10.2       12.11 ± 39%  perf-profile.children.cycles-pp.ret_from_fork_asm
      1.86 ±  3%     +10.2       12.11 ± 39%  perf-profile.children.cycles-pp.ret_from_fork
      1.86 ±  3%     +10.3       12.11 ± 39%  perf-profile.children.cycles-pp.kthread
      1.28 ±  5%     +11.4       12.71 ± 45%  perf-profile.children.cycles-pp.folio_add_lru
      0.38 ± 52%     +25.7       26.04 ± 13%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      0.26 ± 81%     +26.9       27.15 ± 12%  perf-profile.children.cycles-pp.pv_native_safe_halt
      0.26 ± 81%     +26.9       27.16 ± 12%  perf-profile.children.cycles-pp.acpi_safe_halt
      0.26 ± 81%     +26.9       27.16 ± 12%  perf-profile.children.cycles-pp.acpi_idle_do_entry
      0.26 ± 81%     +26.9       27.18 ± 12%  perf-profile.children.cycles-pp.acpi_idle_enter
      0.26 ± 81%     +27.1       27.34 ± 13%  perf-profile.children.cycles-pp.cpuidle_enter_state
      0.26 ± 81%     +27.1       27.37 ± 13%  perf-profile.children.cycles-pp.cpuidle_enter
      0.26 ± 81%     +28.3       28.59 ± 18%  perf-profile.children.cycles-pp.cpuidle_idle_call
      0.25 ± 84%     +28.4       28.65 ± 20%  perf-profile.children.cycles-pp.start_secondary
      0.26 ± 81%     +28.5       28.79 ± 19%  perf-profile.children.cycles-pp.common_startup_64
      0.26 ± 81%     +28.5       28.79 ± 19%  perf-profile.children.cycles-pp.cpu_startup_entry
      0.26 ± 81%     +28.5       28.79 ± 19%  perf-profile.children.cycles-pp.do_idle
     71.50           -45.2       26.31 ± 33%  perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
     23.78           -20.7        3.11 ± 17%  perf-profile.self.cycles-pp.smp_call_function_many_cond
      0.00            +0.1        0.06 ±  9%  perf-profile.self.cycles-pp.folio_add_lru
      0.00            +0.1        0.06 ± 17%  perf-profile.self.cycles-pp.sync_regs
      0.00            +0.1        0.08 ± 25%  perf-profile.self.cycles-pp.asm_sysvec_apic_timer_interrupt
      0.00            +0.1        0.08 ± 19%  perf-profile.self.cycles-pp.__remove_mapping
      0.00            +0.1        0.09 ± 38%  perf-profile.self.cycles-pp.__memcg_slab_free_hook
      0.00            +0.1        0.09 ± 20%  perf-profile.self.cycles-pp.delay_tsc
      0.00            +0.1        0.09 ± 37%  perf-profile.self.cycles-pp.xas_start
      0.00            +0.1        0.09 ± 22%  perf-profile.self.cycles-pp._find_next_bit
      0.00            +0.1        0.09 ± 26%  perf-profile.self.cycles-pp.workingset_update_node
      0.00            +0.1        0.10 ± 17%  perf-profile.self.cycles-pp._raw_spin_trylock
      0.00            +0.1        0.10 ± 17%  perf-profile.self.cycles-pp.free_pages_and_swap_cache
      0.00            +0.1        0.11 ± 20%  perf-profile.self.cycles-pp.iomap_release_folio
      0.00            +0.1        0.11 ± 34%  perf-profile.self.cycles-pp.kmem_cache_free
      0.00            +0.1        0.11 ± 57%  perf-profile.self.cycles-pp.rcu_cblist_dequeue
      0.00            +0.1        0.12 ± 53%  perf-profile.self.cycles-pp.__intel_pmu_enable_all
      0.00            +0.1        0.12 ± 46%  perf-profile.self.cycles-pp.fast_isolate_freepages
      0.00            +0.1        0.13 ± 22%  perf-profile.self.cycles-pp.next_uptodate_folio
      0.00            +0.1        0.13 ± 41%  perf-profile.self.cycles-pp.mem_cgroup_from_slab_obj
      0.00            +0.1        0.14 ± 50%  perf-profile.self.cycles-pp.get_pfnblock_flags_mask
      0.00            +0.1        0.14 ± 23%  perf-profile.self.cycles-pp.filemap_map_pages
      0.00            +0.1        0.14 ± 24%  perf-profile.self.cycles-pp.folio_add_file_rmap_ptes
      0.00            +0.1        0.15 ± 24%  perf-profile.self.cycles-pp.lru_gen_eviction
      0.00            +0.2        0.15 ± 73%  perf-profile.self.cycles-pp.ktime_get_update_offsets_now
      0.00            +0.2        0.15 ± 29%  perf-profile.self.cycles-pp.arch_scale_freq_tick
      0.00            +0.2        0.15 ± 32%  perf-profile.self.cycles-pp.get_partial_node
      0.00            +0.2        0.15 ± 27%  perf-profile.self.cycles-pp.rmqueue
      0.00            +0.2        0.17 ± 22%  perf-profile.self.cycles-pp.folio_alloc_noprof
      0.00            +0.2        0.17 ± 12%  perf-profile.self.cycles-pp.free_frozen_page_commit
      0.00            +0.2        0.18 ± 30%  perf-profile.self.cycles-pp.___slab_alloc
      0.00            +0.2        0.18 ± 42%  perf-profile.self.cycles-pp.tick_nohz_handler
      0.00            +0.2        0.18 ± 12%  perf-profile.self.cycles-pp.shrink_folio_list
      0.00            +0.2        0.19 ± 33%  perf-profile.self.cycles-pp.xas_load
      0.00            +0.2        0.20 ± 19%  perf-profile.self.cycles-pp.folio_batch_move_lru
      0.00            +0.2        0.20 ± 16%  perf-profile.self.cycles-pp.sort_folio
      0.00            +0.2        0.21 ± 21%  perf-profile.self.cycles-pp.lru_add
      0.00            +0.2        0.21 ± 13%  perf-profile.self.cycles-pp.__mod_node_page_state
      0.00            +0.2        0.22 ± 29%  perf-profile.self.cycles-pp.__lruvec_stat_mod_folio
      0.00            +0.2        0.22 ±  3%  perf-profile.self.cycles-pp.scan_folios
      0.00            +0.2        0.22 ± 59%  perf-profile.self.cycles-pp.xas_clear_mark
      0.00            +0.2        0.22 ± 20%  perf-profile.self.cycles-pp.zap_pte_range
      0.00            +0.2        0.23 ± 32%  perf-profile.self.cycles-pp.iomap_readahead
      0.00            +0.2        0.24 ± 13%  perf-profile.self.cycles-pp.folio_unlock
      0.00            +0.2        0.24 ± 37%  perf-profile.self.cycles-pp.free_pcppages_bulk
      0.00            +0.2        0.25 ± 34%  perf-profile.self.cycles-pp._raw_spin_lock_irq
      0.00            +0.3        0.26 ± 50%  perf-profile.self.cycles-pp.sched_balance_domains
      0.00            +0.3        0.26 ±  9%  perf-profile.self.cycles-pp.__mod_zone_page_state
      0.00            +0.3        0.26 ± 71%  perf-profile.self.cycles-pp.truncate_folio_batch_exceptionals
      0.00            +0.3        0.26 ± 25%  perf-profile.self.cycles-pp.native_irq_return_iret
      0.00            +0.3        0.27 ± 32%  perf-profile.self.cycles-pp.__zone_watermark_ok
      0.00            +0.3        0.30 ± 72%  perf-profile.self.cycles-pp.xas_get_order
      0.00            +0.3        0.31 ± 28%  perf-profile.self.cycles-pp.free_unref_folios
      0.00            +0.3        0.32 ± 14%  perf-profile.self.cycles-pp.folio_mark_accessed
      0.00            +0.3        0.33 ± 68%  perf-profile.self.cycles-pp.list_lru_del
      0.00            +0.3        0.34 ± 19%  perf-profile.self.cycles-pp.folios_put_refs
      0.00            +0.4        0.37 ± 58%  perf-profile.self.cycles-pp.find_lock_entries
      0.05            +0.4        0.46 ± 22%  perf-profile.self.cycles-pp.lru_gen_add_folio
      0.00            +0.4        0.41 ± 17%  perf-profile.self.cycles-pp.io_serial_in
      0.00            +0.4        0.42 ± 21%  perf-profile.self.cycles-pp.ifs_free
      0.00            +0.4        0.42 ± 63%  perf-profile.self.cycles-pp.xas_find
      0.00            +0.5        0.49 ± 38%  perf-profile.self.cycles-pp.__slab_free
      0.00            +0.5        0.52 ± 22%  perf-profile.self.cycles-pp._raw_spin_lock
      0.09 ±  5%      +0.6        0.64 ± 12%  perf-profile.self.cycles-pp.rmqueue_bulk
      0.02 ±141%      +0.6        0.62 ± 28%  perf-profile.self.cycles-pp.__mod_memcg_lruvec_state
      0.12 ±  4%      +0.6        0.74 ±  9%  perf-profile.self.cycles-pp.folio_remove_rmap_ptes
      0.01 ±223%      +0.6        0.65 ± 27%  perf-profile.self.cycles-pp.lru_gen_del_folio
      0.00            +0.7        0.71 ± 30%  perf-profile.self.cycles-pp.isolate_freepages_block
      0.07            +0.7        0.78 ± 22%  perf-profile.self.cycles-pp.__free_one_page
      0.00            +0.7        0.71 ± 17%  perf-profile.self.cycles-pp.memcpy_toio
      0.04 ± 44%      +0.8        0.81 ± 20%  perf-profile.self.cycles-pp.xas_create
      0.05            +0.8        0.85 ± 11%  perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      0.00            +0.9        0.85 ± 88%  perf-profile.self.cycles-pp.isolate_migratepages_block
      0.00            +0.9        0.89 ± 56%  perf-profile.self.cycles-pp.xas_store
      0.00            +1.0        0.96 ± 74%  perf-profile.self.cycles-pp.ktime_get
      0.00            +1.3        1.29 ± 14%  perf-profile.self.cycles-pp.zap_present_ptes
      0.29 ±  3%      +1.3        1.63 ± 16%  perf-profile.self.cycles-pp.do_access
      0.00            +2.2        2.22 ± 81%  perf-profile.self.cycles-pp.copy_mc_fragile
      0.40 ±  3%      +4.6        4.96 ± 18%  perf-profile.self.cycles-pp.memset_orig
      0.54 ±  3%      +5.0        5.56 ± 14%  perf-profile.self.cycles-pp.do_rw_once
      0.26 ± 81%     +22.3       22.58 ±  5%  perf-profile.self.cycles-pp.pv_native_safe_halt


***************************************************************************************************
lkp-csl-2sp3: 96 threads 2 sockets Intel(R) Xeon(R) Platinum 8260L CPU @ 2.40GHz (Cascade Lake) with 128G memory
=========================================================================================
compiler/cpufreq_governor/kconfig/rootfs/runtime/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-9.4/debian-12-x86_64-20240206.cgz/300s/lkp-csl-2sp3/lru-file-readonce/vm-scalability

commit: 
  61c4e6ca8c ("kunit: slub: add module description")
  90abee6d78 ("mm: page_alloc: speed up fallbacks in rmqueue_bulk()")

61c4e6ca8c9364e0 90abee6d7895d5eef18c91d870d 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
   1340966 ± 19%     -46.4%     718403 ± 16%  cpuidle..usage
    218.62 ±  3%      -9.6%     197.73        uptime.boot
     89479 ±  2%      -5.4%      84634        vmstat.system.in
   9114635 ±  6%     +11.3%   10141656 ±  3%  meminfo.MemFree
    177516 ±  6%     -10.2%     159372        meminfo.Shmem
   4556486 ±  5%     +12.4%    5121365 ±  6%  numa-meminfo.node1.MemFree
    123807 ± 34%     -21.7%      96971 ± 32%  numa-meminfo.node1.Shmem
  14768015 ±  5%     -10.9%   13159160 ±  3%  numa-numastat.node0.numa_foreign
  16286717 ±  4%     -13.2%   14137188 ±  4%  numa-numastat.node0.numa_miss
  16336367 ±  4%     -13.2%   14187687 ±  4%  numa-numastat.node0.other_node
  16289747 ±  4%     -13.2%   14138293 ±  4%  numa-numastat.node1.numa_foreign
  14768661 ±  5%     -10.9%   13159335 ±  3%  numa-numastat.node1.numa_miss
    308218 ±  6%     +16.3%     358515        vm-scalability.median
  29810428 ±  5%     +14.4%   34100980        vm-scalability.throughput
    170.08 ±  4%     -11.5%     150.49        vm-scalability.time.elapsed_time
    170.08 ±  4%     -11.5%     150.49        vm-scalability.time.elapsed_time.max
      7953            -1.6%       7824        vm-scalability.time.percent_of_cpu_this_job_got
     12724 ±  5%     -13.7%      10981        vm-scalability.time.system_time
  14768015 ±  5%     -10.9%   13159160 ±  3%  numa-vmstat.node0.numa_foreign
  16286717 ±  4%     -13.2%   14137188 ±  4%  numa-vmstat.node0.numa_miss
  16336367 ±  4%     -13.2%   14187687 ±  4%  numa-vmstat.node0.numa_other
   1124034 ±  5%     +14.1%    1282571 ±  6%  numa-vmstat.node1.nr_free_pages
     30962 ± 34%     -21.4%      24322 ± 32%  numa-vmstat.node1.nr_shmem
  16289747 ±  4%     -13.2%   14138293 ±  4%  numa-vmstat.node1.numa_foreign
  14768661 ±  5%     -10.9%   13159335 ±  3%  numa-vmstat.node1.numa_miss
      1810 ±  4%     -14.7%       1543 ±  9%  sched_debug.cfs_rq:/.runnable_avg.max
    668.33           -41.1%     393.50 ± 18%  sched_debug.cfs_rq:/.runnable_avg.min
    465.67 ± 10%     -42.0%     270.06 ± 18%  sched_debug.cfs_rq:/.util_avg.min
    154.89 ±  9%     +17.8%     182.39 ± 12%  sched_debug.cfs_rq:/.util_avg.stddev
     10.36 ± 12%     -28.3%       7.43 ± 14%  sched_debug.cpu.clock.stddev
    477.11           -40.0%     286.22 ± 29%  sched_debug.cpu.curr->pid.min
    675.25 ±  3%     +13.5%     766.33 ±  6%  sched_debug.cpu.curr->pid.stddev
      4.15 ±207%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.__pmd_alloc
      1.60 ± 42%     -74.9%       0.40 ±132%  perf-sched.sch_delay.avg.ms.__cond_resched.wp_page_copy.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
      0.32 ± 41%     -46.0%       0.18 ± 26%  perf-sched.sch_delay.avg.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.92 ± 50%     -50.8%       0.94 ± 11%  perf-sched.sch_delay.avg.ms.wait_for_partner.fifo_open.do_dentry_open.vfs_open
    170.24 ±221%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.__pmd_alloc
      3.22 ± 49%     -75.9%       0.78 ±136%  perf-sched.sch_delay.max.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.pte_alloc_one
     22.54 ± 38%     -57.8%       9.51 ± 14%  perf-sched.sch_delay.max.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_noprof.page_cache_ra_order
      2.17 ± 55%     -72.3%       0.60 ±129%  perf-sched.sch_delay.max.ms.__cond_resched.wp_page_copy.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
      6.32 ± 71%     -53.6%       2.93 ± 46%  perf-sched.sch_delay.max.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
     11.40 ± 56%     -37.6%       7.12 ± 13%  perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
      0.96 ± 80%    +195.3%       2.82 ± 48%  perf-sched.wait_and_delay.avg.ms.__cond_resched.shadow_lru_isolate.__list_lru_walk_one.list_lru_walk_one_irq.do_shrink_slab
     45.08 ± 38%     -57.8%      19.01 ± 14%  perf-sched.wait_and_delay.max.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_noprof.page_cache_ra_order
     22.81 ± 56%     -37.6%      14.23 ± 13%  perf-sched.wait_and_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
      7.44 ±  9%     -12.6%       6.50 ±  6%  perf-sched.wait_time.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      1.46 ± 71%     -66.5%       0.49 ± 16%  perf-sched.wait_time.avg.ms.wait_for_partner.fifo_open.do_dentry_open.vfs_open
    336.26 ±140%     -99.8%       0.74 ±147%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.pte_alloc_one
     22.54 ± 38%     -57.8%       9.51 ± 14%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_noprof.page_cache_ra_order
     11.40 ± 56%     -37.6%       7.12 ± 13%  perf-sched.wait_time.max.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
     11.02 ±  2%      +8.5%      11.96        perf-stat.i.MPKI
 1.027e+10            +2.1%  1.049e+10        perf-stat.i.branch-instructions
     64.97            +1.5       66.46        perf-stat.i.cache-miss-rate%
 5.379e+08 ±  3%     +11.7%  6.006e+08        perf-stat.i.cache-misses
 8.208e+08 ±  3%     +10.7%  9.086e+08        perf-stat.i.cache-references
      5.04 ±  2%      -6.0%       4.74        perf-stat.i.cpi
    462.35 ±  4%     -13.8%     398.77        perf-stat.i.cycles-between-cache-misses
 4.716e+10            +3.4%  4.878e+10        perf-stat.i.instructions
      0.25 ±  3%     +10.3%       0.28        perf-stat.i.ipc
     11.40 ±  2%      +8.0%      12.31        perf-stat.overall.MPKI
      5.40            -4.7%       5.14        perf-stat.overall.cpi
    473.68 ±  4%     -11.9%     417.49        perf-stat.overall.cycles-between-cache-misses
      0.19            +4.9%       0.19        perf-stat.overall.ipc
      1869 ±  3%      -8.4%       1712        perf-stat.overall.path-length
 1.022e+10            +2.0%  1.043e+10        perf-stat.ps.branch-instructions
 5.352e+08 ±  3%     +11.6%  5.972e+08        perf-stat.ps.cache-misses
 8.165e+08 ±  3%     +10.6%  9.034e+08        perf-stat.ps.cache-references
 2.532e+11            -1.5%  2.493e+11        perf-stat.ps.cpu-cycles
 4.692e+10            +3.4%   4.85e+10        perf-stat.ps.instructions
  8.03e+12 ±  3%      -8.4%  7.354e+12        perf-stat.total.instructions
      2984 ±  4%     +15.8%       3455 ±  3%  proc-vmstat.allocstall_normal
  22713936 ± 23%     +29.9%   29514610 ± 14%  proc-vmstat.compact_daemon_free_scanned
  22713936 ± 23%     +29.9%   29514610 ± 14%  proc-vmstat.compact_free_scanned
      6269 ± 14%     +45.4%       9116 ±  9%  proc-vmstat.compact_stall
      6216 ± 15%     +45.4%       9035 ±  8%  proc-vmstat.compact_success
    218990            -1.7%     215170        proc-vmstat.nr_active_anon
     44383 ±  5%     -10.1%      39890        proc-vmstat.nr_shmem
    154994            -2.5%     151190        proc-vmstat.nr_slab_unreclaimable
    218990            -1.7%     215170        proc-vmstat.nr_zone_active_anon
  31057762 ±  4%     -12.1%   27297453 ±  2%  proc-vmstat.numa_foreign
     2e+08 ±  4%      -6.8%  1.864e+08        proc-vmstat.numa_hit
 1.999e+08 ±  4%      -6.8%  1.863e+08        proc-vmstat.numa_local
  31055378 ±  4%     -12.1%   27296523 ±  2%  proc-vmstat.numa_miss
  31156648 ±  4%     -12.1%   27397432 ±  2%  proc-vmstat.numa_other
    673249 ±  4%      -6.6%     628714 ±  2%  proc-vmstat.pgfault
     30253 ±  2%      -7.1%      28106 ±  2%  proc-vmstat.pgreuse
 7.661e+08            +2.1%  7.821e+08        proc-vmstat.pgscan_direct
 2.778e+08 ±  2%      -5.8%  2.618e+08        proc-vmstat.pgscan_kswapd
 7.661e+08            +2.1%  7.821e+08        proc-vmstat.pgsteal_direct
 2.778e+08 ±  2%      -5.8%  2.618e+08        proc-vmstat.pgsteal_kswapd
     38.30 ± 76%     -38.3        0.00        perf-profile.calltrace.cycles-pp.xfs_file_read_iter.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
     38.20 ± 76%     -38.2        0.00        perf-profile.calltrace.cycles-pp.xfs_file_buffered_read.xfs_file_read_iter.vfs_read.ksys_read.do_syscall_64
     37.95 ± 76%     -38.0        0.00        perf-profile.calltrace.cycles-pp.filemap_read.xfs_file_buffered_read.xfs_file_read_iter.vfs_read.ksys_read
     36.29 ± 78%     -36.3        0.00        perf-profile.calltrace.cycles-pp.filemap_get_pages.filemap_read.xfs_file_buffered_read.xfs_file_read_iter.vfs_read
     35.78 ± 79%     -35.8        0.00        perf-profile.calltrace.cycles-pp.filemap_readahead.filemap_get_pages.filemap_read.xfs_file_buffered_read.xfs_file_read_iter
     35.69 ± 78%     -35.7        0.00        perf-profile.calltrace.cycles-pp.page_cache_ra_order.filemap_readahead.filemap_get_pages.filemap_read.xfs_file_buffered_read
     15.10 ± 93%     -15.1        0.00        perf-profile.calltrace.cycles-pp.folio_alloc_noprof.page_cache_ra_order.filemap_readahead.filemap_get_pages.filemap_read
     14.98 ± 94%     -15.0        0.00        perf-profile.calltrace.cycles-pp.alloc_pages_mpol.folio_alloc_noprof.page_cache_ra_order.filemap_readahead.filemap_get_pages
     14.96 ± 94%     -15.0        0.00        perf-profile.calltrace.cycles-pp.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_noprof.page_cache_ra_order.filemap_readahead
     14.29 ± 96%     -14.3        0.00        perf-profile.calltrace.cycles-pp.__alloc_pages_slowpath.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_noprof.page_cache_ra_order
     13.73 ± 84%     -13.7        0.00        perf-profile.calltrace.cycles-pp.filemap_add_folio.page_cache_ra_order.filemap_readahead.filemap_get_pages.filemap_read
     13.00 ± 86%     -13.0        0.00        perf-profile.calltrace.cycles-pp.folio_add_lru.filemap_add_folio.page_cache_ra_order.filemap_readahead.filemap_get_pages
     12.96 ± 86%     -13.0        0.00        perf-profile.calltrace.cycles-pp.folio_batch_move_lru.folio_add_lru.filemap_add_folio.page_cache_ra_order.filemap_readahead
     11.92 ± 89%     -11.9        0.00        perf-profile.calltrace.cycles-pp.folio_lruvec_lock_irqsave.folio_batch_move_lru.folio_add_lru.filemap_add_folio.page_cache_ra_order
     11.90 ± 89%     -11.9        0.00        perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.folio_lruvec_lock_irqsave.folio_batch_move_lru.folio_add_lru.filemap_add_folio
     11.72 ± 90%     -11.7        0.00        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.folio_lruvec_lock_irqsave.folio_batch_move_lru.folio_add_lru
      9.96 ± 80%     -10.0        0.00        perf-profile.calltrace.cycles-pp.evict_folios.try_to_shrink_lruvec.shrink_one.shrink_many.shrink_node
      8.55 ± 94%      -8.6        0.00        perf-profile.calltrace.cycles-pp.try_to_free_pages.__alloc_pages_slowpath.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_noprof
      8.45 ± 94%      -8.5        0.00        perf-profile.calltrace.cycles-pp.do_try_to_free_pages.try_to_free_pages.__alloc_pages_slowpath.__alloc_frozen_pages_noprof.alloc_pages_mpol
      8.45 ± 94%      -8.4        0.00        perf-profile.calltrace.cycles-pp.shrink_node.do_try_to_free_pages.try_to_free_pages.__alloc_pages_slowpath.__alloc_frozen_pages_noprof
      8.23 ± 94%      -8.2        0.00        perf-profile.calltrace.cycles-pp.shrink_many.shrink_node.do_try_to_free_pages.try_to_free_pages.__alloc_pages_slowpath
      8.22 ± 94%      -8.2        0.00        perf-profile.calltrace.cycles-pp.shrink_one.shrink_many.shrink_node.do_try_to_free_pages.try_to_free_pages
      7.27 ±100%      -7.3        0.00        perf-profile.calltrace.cycles-pp.try_to_shrink_lruvec.shrink_one.shrink_many.shrink_node.do_try_to_free_pages
      6.58 ± 54%      -6.6        0.00        perf-profile.calltrace.cycles-pp.read_pages.page_cache_ra_order.filemap_readahead.filemap_get_pages.filemap_read
      6.57 ± 54%      -6.6        0.00        perf-profile.calltrace.cycles-pp.iomap_readahead.read_pages.page_cache_ra_order.filemap_readahead.filemap_get_pages
      6.25 ± 54%      -6.3        0.00        perf-profile.calltrace.cycles-pp.iomap_readpage_iter.iomap_readahead.read_pages.page_cache_ra_order.filemap_readahead
      5.18 ±107%      -5.2        0.00        perf-profile.calltrace.cycles-pp.get_page_from_freelist.__alloc_pages_slowpath.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_noprof
      4.95 ± 76%      -5.0        0.00        perf-profile.calltrace.cycles-pp.shrink_folio_list.evict_folios.try_to_shrink_lruvec.shrink_one.shrink_many
      4.52 ± 53%      -4.5        0.00        perf-profile.calltrace.cycles-pp.zero_user_segments.iomap_readpage_iter.iomap_readahead.read_pages.page_cache_ra_order
      4.49 ± 53%      -4.5        0.00        perf-profile.calltrace.cycles-pp.memset_orig.zero_user_segments.iomap_readpage_iter.iomap_readahead.read_pages
      4.17 ±102%      -4.2        0.00        perf-profile.calltrace.cycles-pp._raw_spin_lock_irq.evict_folios.try_to_shrink_lruvec.shrink_one.shrink_many
      4.16 ±102%      -4.2        0.00        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irq.evict_folios.try_to_shrink_lruvec.shrink_one
     11.91 ±120%      -3.8        8.12 ±154%  perf-profile.calltrace.cycles-pp.xfs_fs_evict_inode.evict.do_unlinkat.__x64_sys_unlinkat.do_syscall_64
     11.90 ±120%      -3.8        8.12 ±154%  perf-profile.calltrace.cycles-pp.truncate_inode_pages_range.xfs_fs_evict_inode.evict.do_unlinkat.__x64_sys_unlinkat
     11.92 ±120%      -3.7        8.17 ±154%  perf-profile.calltrace.cycles-pp.unlinkat
     11.92 ±120%      -3.7        8.17 ±154%  perf-profile.calltrace.cycles-pp.__x64_sys_unlinkat.do_syscall_64.entry_SYSCALL_64_after_hwframe.unlinkat
     11.92 ±120%      -3.7        8.17 ±154%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.unlinkat
     11.92 ±120%      -3.7        8.17 ±154%  perf-profile.calltrace.cycles-pp.do_unlinkat.__x64_sys_unlinkat.do_syscall_64.entry_SYSCALL_64_after_hwframe.unlinkat
     11.92 ±120%      -3.7        8.17 ±154%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.unlinkat
     11.91 ±120%      -3.7        8.17 ±154%  perf-profile.calltrace.cycles-pp.evict.do_unlinkat.__x64_sys_unlinkat.do_syscall_64.entry_SYSCALL_64_after_hwframe
      4.01 ±115%      -1.5        2.50 ±143%  perf-profile.calltrace.cycles-pp.folios_put_refs.truncate_inode_pages_range.xfs_fs_evict_inode.evict.do_unlinkat
     38.30 ± 76%     -38.3        0.00        perf-profile.children.cycles-pp.xfs_file_read_iter
     38.21 ± 76%     -38.2        0.00        perf-profile.children.cycles-pp.xfs_file_buffered_read
     37.96 ± 76%     -38.0        0.00        perf-profile.children.cycles-pp.filemap_read
     36.29 ± 78%     -36.3        0.00        perf-profile.children.cycles-pp.filemap_get_pages
     35.78 ± 79%     -35.8        0.00        perf-profile.children.cycles-pp.filemap_readahead
     35.69 ± 78%     -35.7        0.00        perf-profile.children.cycles-pp.page_cache_ra_order
     21.19 ± 89%     -20.9        0.26 ±104%  perf-profile.children.cycles-pp._raw_spin_lock_irqsave
     15.58 ± 98%     -15.6        0.00        perf-profile.children.cycles-pp.__alloc_pages_slowpath
     15.20 ± 93%     -15.2        0.00        perf-profile.children.cycles-pp.folio_alloc_noprof
     13.79 ± 83%     -13.8        0.00        perf-profile.children.cycles-pp.filemap_add_folio
     13.22 ± 83%     -13.1        0.14 ±223%  perf-profile.children.cycles-pp.folio_add_lru
     12.37 ± 87%     -12.3        0.06 ±136%  perf-profile.children.cycles-pp.folio_lruvec_lock_irqsave
     11.38 ± 78%     -11.4        0.00        perf-profile.children.cycles-pp.shrink_node
     11.16 ± 77%     -11.2        0.00        perf-profile.children.cycles-pp.shrink_many
     11.15 ± 77%     -11.1        0.00        perf-profile.children.cycles-pp.shrink_one
     10.18 ± 80%     -10.2        0.00        perf-profile.children.cycles-pp.try_to_shrink_lruvec
     10.16 ± 80%     -10.2        0.00        perf-profile.children.cycles-pp.evict_folios
      8.77 ± 93%      -8.8        0.00        perf-profile.children.cycles-pp.try_to_free_pages
      8.66 ± 93%      -8.7        0.00        perf-profile.children.cycles-pp.do_try_to_free_pages
      6.75 ± 54%      -6.7        0.00        perf-profile.children.cycles-pp.read_pages
      6.74 ± 54%      -6.7        0.00        perf-profile.children.cycles-pp.iomap_readahead
      6.41 ± 54%      -6.4        0.00        perf-profile.children.cycles-pp.iomap_readpage_iter
      5.15 ± 77%      -5.2        0.00        perf-profile.children.cycles-pp.shrink_folio_list
      4.64 ± 52%      -4.5        0.14 ±223%  perf-profile.children.cycles-pp.zero_user_segments
      4.61 ± 52%      -4.5        0.14 ±223%  perf-profile.children.cycles-pp.memset_orig
     11.92 ±119%      -3.8        8.12 ±154%  perf-profile.children.cycles-pp.truncate_inode_pages_range
     11.92 ±119%      -3.8        8.12 ±154%  perf-profile.children.cycles-pp.xfs_fs_evict_inode
     11.94 ±119%      -3.8        8.17 ±154%  perf-profile.children.cycles-pp.unlinkat
     11.93 ±119%      -3.8        8.17 ±154%  perf-profile.children.cycles-pp.__x64_sys_unlinkat
     11.93 ±119%      -3.8        8.17 ±154%  perf-profile.children.cycles-pp.do_unlinkat
     11.93 ±119%      -3.8        8.17 ±154%  perf-profile.children.cycles-pp.evict
      0.03 ±111%      +0.8        0.82 ± 88%  perf-profile.children.cycles-pp.vm_mmap_pgoff
      0.03 ±108%      +0.8        0.82 ± 88%  perf-profile.children.cycles-pp.do_mmap
      0.70 ± 51%      +0.8        1.49 ± 52%  perf-profile.children.cycles-pp._raw_spin_lock
      0.01 ±223%      +0.8        0.82 ± 88%  perf-profile.children.cycles-pp.__mmap_region
      0.01 ±223%      +0.8        0.83 ± 97%  perf-profile.children.cycles-pp.ksys_mmap_pgoff
      0.01 ±223%      +0.9        0.88 ± 87%  perf-profile.children.cycles-pp.evlist_cpu_iterator__next
      0.01 ±223%      +1.1        1.11 ±100%  perf-profile.children.cycles-pp.walk_component
      0.09 ± 33%      +1.3        1.36 ± 94%  perf-profile.children.cycles-pp.__x64_sys_execve
      0.09 ± 33%      +1.3        1.36 ± 94%  perf-profile.children.cycles-pp.do_execveat_common
      0.09 ± 33%      +1.3        1.36 ± 94%  perf-profile.children.cycles-pp.execve
      0.10 ± 19%      +1.5        1.62 ±116%  perf-profile.children.cycles-pp.__handle_mm_fault
      0.02 ±146%      +1.7        1.70 ± 97%  perf-profile.children.cycles-pp.zap_pmd_range
      0.02 ±146%      +1.7        1.70 ± 97%  perf-profile.children.cycles-pp.zap_pte_range
      0.02 ±143%      +1.8        1.84 ± 95%  perf-profile.children.cycles-pp.unmap_page_range
      0.10 ± 22%      +1.8        1.94 ±132%  perf-profile.children.cycles-pp.handle_mm_fault
      0.09 ± 28%      +1.9        1.95 ±131%  perf-profile.children.cycles-pp.do_user_addr_fault
      0.09 ± 28%      +1.9        1.95 ±131%  perf-profile.children.cycles-pp.exc_page_fault
      0.09 ± 34%      +1.9        2.00 ±126%  perf-profile.children.cycles-pp.asm_exc_page_fault
      0.02 ±143%      +2.0        1.98 ± 95%  perf-profile.children.cycles-pp.unmap_vmas
      0.04 ±101%      +2.6        2.64 ± 96%  perf-profile.children.cycles-pp.path_openat
      0.04 ±101%      +2.6        2.66 ± 95%  perf-profile.children.cycles-pp.do_filp_open
      0.04 ±100%      +2.6        2.68 ± 94%  perf-profile.children.cycles-pp.__x64_sys_openat
      0.04 ±100%      +2.6        2.68 ± 94%  perf-profile.children.cycles-pp.do_sys_openat2
      0.05 ±114%      +2.7        2.74 ± 96%  perf-profile.children.cycles-pp.__x64_sys_exit_group
      0.14 ± 18%      +2.8        2.91 ± 89%  perf-profile.children.cycles-pp.x64_sys_call
      0.04 ±141%      +3.7        3.72 ± 92%  perf-profile.children.cycles-pp.exit_mm
      0.04 ±143%      +3.8        3.87 ± 93%  perf-profile.children.cycles-pp.exit_mmap
      0.04 ±142%      +3.8        3.89 ± 92%  perf-profile.children.cycles-pp.__mmput
      0.06 ±115%      +7.0        7.04 ± 91%  perf-profile.children.cycles-pp.do_exit
      0.06 ±115%      +7.0        7.04 ± 91%  perf-profile.children.cycles-pp.do_group_exit
      0.01 ±223%      +8.2        8.23 ±105%  perf-profile.children.cycles-pp.__cmd_record
      0.01 ±223%      +8.2        8.23 ±105%  perf-profile.children.cycles-pp.cmd_record
      0.03 ±148%      +8.3        8.33 ±103%  perf-profile.children.cycles-pp.handle_internal_command
      0.03 ±148%      +8.3        8.33 ±103%  perf-profile.children.cycles-pp.main
      0.03 ±148%      +8.3        8.33 ±103%  perf-profile.children.cycles-pp.run_builtin
      4.58 ± 52%      -4.4        0.14 ±223%  perf-profile.self.cycles-pp.memset_orig
      0.60 ± 20%      -0.4        0.21 ±107%  perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      0.31 ± 45%      +1.2        1.48 ± 53%  perf-profile.self.cycles-pp._raw_spin_lock





Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

