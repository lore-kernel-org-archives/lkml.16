Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C9279D2
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 00:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748566793; cv=fail; b=GKma17VfvUmm348yzkDNXPJXHxrOf3G0W9Q41kZ0jNX3HZ8QVnYRBsGKi7pSx2tH4G5xs7YtwiIFuaRJs8/DrpAUupA8kQV9Jmilz+ASbrkWZAqYIoFMMIyN1bSCV1f0FmoQqL+yQND1TpB0kFfvRv5k6RUVhzwP1HSNUpsqHiw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748566793; c=relaxed/simple;
	bh=PauSNJzdlYeDYtXFyl2EsiuRn+dahBk2sxoXK5x+fA4=;
	h=From:Date:To:CC:Message-ID:Subject:Content-Type:MIME-Version; b=Z6NVDO5GUSccHfP5kjM3molyWcgOjh994qMTcE1ulcVJWpzMQqMbDFPGx5I2rIbT8BGc53AGDHZl82POA1PGQ6BRRjnpGJgHVySh/eUUb9fn0E1dWVSOMyCuMzCf53Ae1HqIY2CDd0wlEwuPe/DB2KHMTByB25EtLApAMorunvE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T4JII26q; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T4JII26q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748566791; x=1780102791;
  h=from:date:to:cc:message-id:subject:
   content-transfer-encoding:mime-version;
  bh=PauSNJzdlYeDYtXFyl2EsiuRn+dahBk2sxoXK5x+fA4=;
  b=T4JII26qw/tlDlQc5qZWv3An/FzsYt+J+HZ+EsbyK9j/NPsSFm4aapoL
   quEuiIkX+1YoNE+EIM22YkgZd6k2h5Ey0GABXclZwHlfhMToc1BE22h2Y
   dxuSz4EVPK9F0H6M3l/CVISyxluKy0vsJmjphbj0oaAh4epDMHBxLCDVI
   hcAUk4/C+XcU3w3NFTGZyqEYvfYDQoo/zh6TnkCEQpXYQ2zvT5hqMGxM+
   XAj0QsRV9W/2MG/egnafzQXobwMvjv2/vKk7IiKxE5Ydp79m0oBARTvTr
   2Yo1UQMr1VtzoXCiwHGgHsIVpxV2T5/dZ4mKJPuiApnabZBqvl8lBwq5n
   Q==;
X-CSE-ConnectionGUID: M/ZDaVI1SL2yQxXSmLufdQ==
X-CSE-MsgGUID: /2pel1e+TguRaTy7Ejqwvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="73182858"
X-IronPort-AV: E=Sophos;i="6.16,194,1744095600"; 
   d="scan'208";a="73182858"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 17:59:46 -0700
X-CSE-ConnectionGUID: 6F77aXEZS0+C2qypo2GCWQ==
X-CSE-MsgGUID: LpLKO8PBT62OZIMOUFq+PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,194,1744095600"; 
   d="scan'208";a="149001746"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 17:59:47 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 29 May 2025 17:59:45 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 29 May 2025 17:59:45 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.40)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 29 May 2025 17:59:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=praSWpLttT+3XnWkJeZzUELcn2TGHGFeuHclPNPTyRo/IxtzwwgpOcPp0MmvkUMLTkX4wyQsNoG4HnymJ8SypBNw9L8cBRVGAtfLTJF5bOCz/PccSHpPJyT3E2AJ/SHQF/sya4Fe8M6Ty1YFzCfLqLv0rgBlAAJIXBiAZ+VYCeLX2+v6Rz/rPpgZtKua081acVBxseZbPY7uQf7FgMXQIipSI7mDkGuAR7NXw0IE3N4Vh/48Kskk+lfU8rlCKykM6YFZaFLL0DhPlNvRphCCmdpFLPYauIN72ydcDzcGQu/4nPomLgh6DBUpqOxh09tmtFf2BjlMHZSLEI44P7nzbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rVKZoCuxv0T9HnLe+EtU/ADuxm49M1n1smoIiF0WYtY=;
 b=FEJtG9IX3yK8QKjtlMjEvt6OFPvbEgsq+sylgu0r/U8U5vuCTbq77hJzrKf/FTtj6WXXgjMdcUHSAVUBfMC9bvaATltL8ADbMWDTpxXHeHniks43U0yaXeBVFwqmpAdtCaFqO5tCc4bTtqUgaLFRNPJEHwzYzPuyJLtN/71tyuMhlmRd7Y/30RApeEZELmY2W1Q6T2hGyLLPAccLq1to5VW4Tn2/iE5fGLmGzOthY65qGfVk1Vncq/+jQCdwXttudUNDtPvZDZWE6QWFuD5CqCJ1cH6kQvClov6O0NJRZsiGqTara0m7nfZgaQg+YXuy3gByTsgTnIcFgB5cdKIzBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by PH0PR11MB5175.namprd11.prod.outlook.com (2603:10b6:510:3d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.30; Fri, 30 May
 2025 00:59:16 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%3]) with mapi id 15.20.8769.025; Fri, 30 May 2025
 00:59:16 +0000
From: <dan.j.williams@intel.com>
Date: Thu, 29 May 2025 17:59:14 -0700
To: Linus Torvalds <torvalds@linux-foundation.org>
CC: <linux-coco@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Message-ID: <683902e2e98df_218f10017@dwillia2-mobl4.notmuch>
Subject: [GIT PULL] Trusted Security Manager (TSM) updates for 6.16
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0039.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::14) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|PH0PR11MB5175:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a1b1c20-832b-4601-b2a2-08dd9f15337c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c1NldHJPNkVMVFVTZkQ5UlZPUVg2N2FadDBZSUwwcWVlalpFU1I0Y3V3bEVp?=
 =?utf-8?B?dUpIVEFkaDNLSHZCRFF5bWxMSU9OT0N3WVZoZDlDTVc5ZDZ0STVlNXZBTUtN?=
 =?utf-8?B?MmcrN3VDUzlnTjAwMWsvV3d5NUNwWUxTZDYvTEhkK3dYMm9JR3BJVCtUZTBX?=
 =?utf-8?B?OHVMU3ZWalEvTmJXUHdQVXo5bzZrZ2hwSXhsZG1OVXUzUFZqNzlPT3k3WW5v?=
 =?utf-8?B?cmo5L2d4cm9VTTdtdVViTWtaa1M1amdYc0hiNEZXUTZ2SXpOV2dIVllNdVlN?=
 =?utf-8?B?dzd6cTlxMmI3cTlEUzF3Sll1Ti9oZzRFeXVGR1hLRmFRRXd1SE5pVVhMSWln?=
 =?utf-8?B?djUxeG1FTmFkM0NzT002dzFzQlROZnlkSTY2cWdGQnZsOTZLWWVhV2hubGIy?=
 =?utf-8?B?TjNSYmpRSnhmODhtTzhxVnlVUDZqc2xLTjl6TS8vVVg2dFp1YmRORlIrM1Jn?=
 =?utf-8?B?Q01BZmxzOEtKZDR3RW90ZjIvcXZFY3c1OXlhcjNaQ3R6ZWlmWjdsTXNaa1Mx?=
 =?utf-8?B?TjZsTTZlV0tLWEpKMjFDck1qZDFuWHcrSzFUd3dHRkNsKzk2SyttaTI1b1A2?=
 =?utf-8?B?Ukl0MjI5UjFHN092QVBwNWUzZ2VTWUViM0lvK1R1d2N1Sm5KMTVKWUEzK3Vo?=
 =?utf-8?B?VEp3c2NmMUhSSkYvVmh1NVRWOHlOTkpOTHN3LzR4b1lkZUowWGt0VWF1WDMv?=
 =?utf-8?B?Ymp1WFdZMlgrSHJJSCs4UWlUbFo3N0JybStVR1JQeEhyVzViRDJIVEZMMk5v?=
 =?utf-8?B?clRsU3k3SGFSVDNvRVI3amprcUgrUFBkWnZmTXZXTm9JSVl2dkNvb09JeTNZ?=
 =?utf-8?B?dXducWpZL3UzaTBCVkJEWkJYU1VTSUR1REJ2TEhBYzBSNWNIVm1aenJCcWw0?=
 =?utf-8?B?U09YWUttVUNOZHJNZHZVTWFySi81eDRMZExZMitYbkNONS9MVFJtRnlnaENj?=
 =?utf-8?B?dEFSNE1RdU9SOThROSt5QkRIRXFRQmdWekNraXArZmpqTVlBTFlqTlZqRndy?=
 =?utf-8?B?OENOcExMOGxUZlFFMWh1bC9yV25KeWE2Skt0ZXBrUm9VZWhsUEpUQXNmQW4v?=
 =?utf-8?B?Zk54NFk3VHU1TlpXTFNYVElySU5peUdvWTdwaWkxSzdkK1V4V3N0OWZiVGhr?=
 =?utf-8?B?OUswSm9FL2xxeENsSkY3TkpRcngyV2puSTFDY1RJbGlWSkcwdTJsRkxkamRE?=
 =?utf-8?B?VUM1TnZiQ2dKYUd3S25DN3YyZzZYajBsV3hXMWhGQlJZamgvY3RiS1M2SVFs?=
 =?utf-8?B?YlMySDhNcVhGOE50dDdhR0NSY1puY2M2K3RlMy9oeW12N2xGRFRUaDdJNFll?=
 =?utf-8?B?ck5DNHZVSGF3cWpUQm1ta0pFd2Uzdnd1bGVxK3E3c28vYmlwOTZiMGp1UzRo?=
 =?utf-8?B?Rll6RGZjSXZYQXpFSFZqNTBCbENpYlpySjZWZVdpOTlOTU9LTHVHb1hCbGQ1?=
 =?utf-8?B?ZU5kZHJWLzFKR1NEQWNmb2ZxNFJ3OU1ja2tpaTJlenhYWlpRenBnOVdUSHZz?=
 =?utf-8?B?ZXFFYkxLYXdmeVhXMVR6WUdvcjVyWTQ2OUx4dkRTdXE2NXc1NFlZbXhWWTY3?=
 =?utf-8?B?NE0zS3IwaGM5REpEWDVZNXVuSUtNZjE5dFBaUVJQN2ZWbmRFMVprQzdhdVRn?=
 =?utf-8?B?b0hvQ3QvQWVMSmVaTnNWdHEvdzhhQTlrbXhOYS9jZklBTy95ODVWVWVNSlN2?=
 =?utf-8?B?bHlDdllMZmhiWEZoMzBaOHdnNENXYlhFdnRNS0VlZjVkLzM1YVFUbE90cjBx?=
 =?utf-8?B?WjFLbExGSTg0YTk0S1RNdUtmKzgxRml4WHFsREh3VlIvU0RzbVUwZ2dUazhV?=
 =?utf-8?B?ZVRGaHNuVXBsUmJ3V3RxWEg3ck9wSzBqazI4S2huYWRhSFhzNnVyUFFJRUlV?=
 =?utf-8?B?ZzlUY1lWUkh4eXdrdk5sTE01ZXZUaHBaREhBM3BEMVYxVWxhNWRPejhHb0hT?=
 =?utf-8?Q?kTp9GhUmS5Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YVhJQjN5cENWMDBjR0NqVGhUVG5wdjVwakh4endrTGxNNFdNUE1QZXduR2Vp?=
 =?utf-8?B?RlV5emV6d3IyZEE5b1h5aEY0Y1ZKQjlDU01lem5SVzVDM1l2M2RWVVJ0N2R0?=
 =?utf-8?B?aTB2Z0lJaVdvaXhvQ2h3Z0hYalB6WEJvbkRTOXYyYlh3eEJmNUo3R0FURlFK?=
 =?utf-8?B?b0hCSGpRTmxpUkRrYytOV3VmcjJDaWNHTmZvYU44RDdzTXNTdjBPOVpqUUx1?=
 =?utf-8?B?NFRuWWY2UE1QNmVCZ21PcklXRk5ZT0Q4SWtUMWlXaDI4RGx4c0MraHF5R0Q0?=
 =?utf-8?B?VHVnVURLOHJUS0RibzYxTzhjeGNqSmM2VkJEUW9SWXFMcC83YXlYd1p3THl3?=
 =?utf-8?B?Vis3RzFiaVpDNjNLWWpGcEdWOUxNNXRTMTlCYWE0UE8rdmFCSzd2aTBFM3Jh?=
 =?utf-8?B?RnhMeGFwa2JQOXpiWUJhOHBZWFI2bjBoVW5oY0gxMmREZWVoS24yYXhEOWFo?=
 =?utf-8?B?VU1MMW85ekxHL2FyQW5SQkp4MkZQZEVESFkvWjYvTVI1M0VHaTZ2VGZnR25I?=
 =?utf-8?B?bGxmbVBlR2VwRzJsME4wckdPZHQrMzhQTk1mOC96cHp0UWw1dzFZYnMxZVJ3?=
 =?utf-8?B?K3FhWFpYa1puSG1EeTNVUExBeU1Nc1lCYUZFTm00VUFDNmpVc3pkVmZ6VjZK?=
 =?utf-8?B?TzRvSjFCUHM0WWNzS3k5SzAva0hWOXF3VlQxaFZOUTEzMDFQTytUS3FtVk5o?=
 =?utf-8?B?YnFuK3E5Wi9oZjlvNXZmYVJBeHpFczU4QmcvTmJibzkrRHVDOTh2dFdNWlBG?=
 =?utf-8?B?N0RGSHpKQzVTMmxJSktBZ3RrWS9oRkVudTV4YmpCZXZDQTZhbFYzMk1pSGV4?=
 =?utf-8?B?czljaWxxQ2VKVEdTbjVWSDdCN2VqbW42eVdGenl6UkdlMzhqaGVLL1graXpo?=
 =?utf-8?B?aVVnYW1DQmhYcnRUK0VNNG1CVzM1MG5CL1V0SXhKNDhmV2tTdWJlV3lUZ3pV?=
 =?utf-8?B?L0ZKNXZybm9yM2MzUlFhVzVXbENxdzNjZ0dpczFXT2Z3MGRQQWxUbE9jWCt0?=
 =?utf-8?B?bWNmc2haVDN2U2lpVnBYbTJST2poQjhFS3pEQmEyQkhhWmFwM2tMMjBrUDBF?=
 =?utf-8?B?ak84UUlSZHJYTzZlUFVaTElkb3BHaFdUNksvc0l6NGpUMS9FVmtPdHpBTDRl?=
 =?utf-8?B?K0FQbHJGcGJwbHpWVFU2Sm1GVURMSDd3cDhSNlc1MlFiWFVuVG02cm1FQ3ZQ?=
 =?utf-8?B?dEFna1JZS1MzWFhFYWZBSTh4czA2eU9RZDl0MWNZWEdGWXBjWVI5NldJYThE?=
 =?utf-8?B?KzNNdjJZN0ZBbXg4UmNyZjF3bnNRRkhYd1MyZU9vQnAyMWcybk5iNUFIUXA4?=
 =?utf-8?B?ZDYrLytudHNtSU05NGtHelc0VVluN2N3NkpFNE5ENGJ6MHlnMk91M2YzVlJn?=
 =?utf-8?B?QmpJbVFvWTNxVTdrSUpZZkZESkNFYzNnZUdXdzRHcWxmckdMTnpzWlJaMVBa?=
 =?utf-8?B?ZWhFcW12MkR6ZGxIdWoxK3Vha3NLOVh4V2tubnluL1hZNGVSOGVvV3BocUE4?=
 =?utf-8?B?Y3haVHZKZzZURkJSZ21mTkExRm9pdU9XMW9DQlRFVUdiajBzbUUxSi9rSWI0?=
 =?utf-8?B?VVRSWm8zQXNSN2Fwc0FxV2E1SVUrS1BBdUhDdTI3ZjJsbHY1aU1JZXlPdmxW?=
 =?utf-8?B?NWdNd2ZMSEU0U0xMZDlObTNiQzl3WWZldGhodHNKZlFha3Z5NEtTdTRYRmVk?=
 =?utf-8?B?bUdFZWFOOCtCYzRIQnJUeG44V2YyTlhiQlZpeWZtOHlENUVLR05SWlR0WkNY?=
 =?utf-8?B?ZzNhQmVYazRXK2tPVmJzZ2xmS3o3dHFFTjFXaDc1VUNWVkxLbHJ3OFh1SUk1?=
 =?utf-8?B?UVJZaytPMncxZG9ZQXNIMTBTMG4xelRtTC9wcXdCbEJtTndROEZ2RisybjNW?=
 =?utf-8?B?dzFvWFdrRTZtaXI4Vkx2ZGdMY0FtbVg4RXBtLytHcDhyMDE1c3A0dysrbVhK?=
 =?utf-8?B?WkdQR0ZtY1dNNWVvYy9rdjRRalU1ekJmam5EUWlya2MxQk9FUFBWM3pYTmxJ?=
 =?utf-8?B?M2VBd0xzWmYzOGg0cGVOQWR0N05ydE85a3FRMFBLQnpXVDVOTEpMTDlQTUhL?=
 =?utf-8?B?QkRVRW1nQ0ZYOWFYOHA0Zit1NUppd1AwOVlUVnNqNHlyK29tL204Wk9lclhZ?=
 =?utf-8?B?QnFGZUFvT3NXTkNhRE9KaEtjM1BtdTZDL05naWNvOXBaaGJnUTdiVmlqUVYy?=
 =?utf-8?B?OGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a1b1c20-832b-4601-b2a2-08dd9f15337c
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 00:59:16.5800
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qKWNepaxy4eroQAk2Z6OKbc6/4DgHi5r7X14Ipsb7dxE5zUZe/8jJ3GjTXp/+LpAY+M9YYDfIgkLIR8KZqpAY3KrV+i0H2KnvkABRg6U4DU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5175
X-OriginatorOrg: intel.com

Hi Linus, please pull from:

  git://git.kernel.org/pub/scm/linux/kernel/git/devsec/tsm tags/tsm-for-6.16

...to receive shared infrastructure updates for confidential computing.
The last time you pulled from tsm.git was back in v6.7 for the
configfs-tsm-report mechanism (5e2cb28dd7e1 ("Merge tag
'tsm-for-6.7'...")). The tree has now moved to a shared devsec/tsm.git
repo. Going forward additional shared infrastructure is anticipated for
the assignment of PCI devices to confidential guests, "PCI Device
Security (devsec)".

This has all appeared in linux-next for a couple weeks and identified
some issues in my merge commit over the rename. All resolved now, with
no new reports to my knowledge.

---

The following changes since commit 92a09c47464d040866cf2b4cd052bc60555185fb:

  Linux 6.15-rc5 (2025-05-04 13:55:04 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/devsec/tsm tags/tsm-for-6.16

for you to fetch changes up to 9d948b8804096d940022b1a3c483a5beb8b46574:

  Merge branch 'for-6.16/tsm-mr' into tsm-next (2025-05-13 11:28:25 -0700)

----------------------------------------------------------------
tsm for 6.16

- Add a general sysfs scheme for publishing "Measurement" values
  provided by the architecture's TEE Security Manager. Use it to publish
  TDX "Runtime Measurement Registers" ("RTMRs") that either maintain a
  hash of stored values (similar to a TPM PCR) or provide statically
  provisioned data.  These measurements are validated by a relying party.

- Reorganize the drivers/virt/coco/ directory for "host" and "guest"
  shared infrastructure.

- Fix a configfs-tsm-report unregister bug

- With CONFIG_TSM_MEASUREMENTS joining CONFIG_TSM_REPORTS and in
  anticipation of more shared "TSM" infrastructure arriving, rename the
  maintainer entry to "TRUSTED SECURITY MODULE (TSM) INFRASTRUCTURE".

----------------------------------------------------------------
Cedric Xing (9):
      tsm-mr: Add TVM Measurement Register support
      tsm-mr: Add tsm-mr sample code
      x86/tdx: Add tdx_mcall_extend_rtmr() interface
      x86/tdx: tdx_mcall_get_report0: Return -EBUSY on TDCALL_OPERAND_BUSY error
      virt: tdx-guest: Expose TDX MRs as sysfs attributes
      virt: tdx-guest: Refactor and streamline TDREPORT generation
      virt: tdx-guest: Transition to scoped_cond_guard for mutex operations
      sample/tsm-mr: Fix missing static for sample_report
      tsm-mr: Fix init breakage after bin_attrs constification by scoping non-const pointers to init phase

Dan Williams (6):
      configfs-tsm: Namespace TSM report symbols
      coco/guest: Move shared guest CC infrastructure to drivers/virt/coco/guest/
      configfs-tsm-report: Fix NULL dereference of tsm_ops
      Merge branch 'for-6.16/tsm' into tsm-next
      Merge branch 'for-6.16/tsm-mr' into tsm-next
      Merge branch 'for-6.16/tsm-mr' into tsm-next

 .../testing/{configfs-tsm => configfs-tsm-report}  |   0
 .../testing/sysfs-devices-virtual-misc-tdx_guest   |  63 +++++
 Documentation/driver-api/coco/index.rst            |  12 +
 .../driver-api/coco/measurement-registers.rst      |  12 +
 Documentation/driver-api/index.rst                 |   1 +
 MAINTAINERS                                        |  11 +-
 arch/x86/coco/tdx/tdx.c                            |  50 +++-
 arch/x86/include/asm/shared/tdx.h                  |   1 +
 arch/x86/include/asm/tdx.h                         |   2 +
 drivers/virt/coco/Kconfig                          |   6 +-
 drivers/virt/coco/Makefile                         |   2 +-
 drivers/virt/coco/arm-cca-guest/arm-cca-guest.c    |   8 +-
 drivers/virt/coco/guest/Kconfig                    |  17 ++
 drivers/virt/coco/guest/Makefile                   |   4 +
 drivers/virt/coco/{tsm.c => guest/report.c}        |  63 +++--
 drivers/virt/coco/guest/tsm-mr.c                   | 251 ++++++++++++++++++++
 drivers/virt/coco/sev-guest/sev-guest.c            |  12 +-
 drivers/virt/coco/tdx-guest/Kconfig                |   1 +
 drivers/virt/coco/tdx-guest/tdx-guest.c            | 259 ++++++++++++++-------
 include/linux/tsm-mr.h                             |  89 +++++++
 include/linux/tsm.h                                |  22 +-
 include/trace/events/tsm_mr.h                      |  80 +++++++
 samples/Kconfig                                    |  11 +
 samples/Makefile                                   |   1 +
 samples/tsm-mr/Makefile                            |   2 +
 samples/tsm-mr/tsm_mr_sample.c                     | 131 +++++++++++
 26 files changed, 974 insertions(+), 137 deletions(-)
 rename Documentation/ABI/testing/{configfs-tsm => configfs-tsm-report} (100%)
 create mode 100644 Documentation/ABI/testing/sysfs-devices-virtual-misc-tdx_guest
 create mode 100644 Documentation/driver-api/coco/index.rst
 create mode 100644 Documentation/driver-api/coco/measurement-registers.rst
 create mode 100644 drivers/virt/coco/guest/Kconfig
 create mode 100644 drivers/virt/coco/guest/Makefile
 rename drivers/virt/coco/{tsm.c => guest/report.c} (89%)
 create mode 100644 drivers/virt/coco/guest/tsm-mr.c
 create mode 100644 include/linux/tsm-mr.h
 create mode 100644 include/trace/events/tsm_mr.h
 create mode 100644 samples/tsm-mr/Makefile
 create mode 100644 samples/tsm-mr/tsm_mr_sample.c
