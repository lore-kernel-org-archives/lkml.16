Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A9BB667
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 23:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748388986; cv=fail; b=cCBfkk8a4n3bnjvx/VvJYQGgXsXbwNdzhnlzYACySIfpmoPlvqrwUvhxR0vozSO9MjUolCUIEBq5+3mPlTTkoT1k7FMFRzUMAnqdiZXIv55Oxkc1o4w7IpzFuFGpLpxSyPHxWdnkUb/4qhk7sW8fpVoDBkBypJRA0TxuPzi7EAc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748388986; c=relaxed/simple;
	bh=0GICObKbsQVdx+jZDF2rdRCbw0EmC40zXtfrw9yNJ3Y=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pTURUn9HVms3hmr5ZUrle3SoD7p6CASnJcdfhw4mzBcpzB3jXfs2+ZALBFH03bZMAExxs4zBIIry3QiRjM90gcyr+bCYyOdmEFXxBtbevIzKZkFptGxa0RH+l1gdIbL/cGrriEj49MHeGevtOcDaSiTtjxAcv3JIWfPlZ8cx5mk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YfiC7hj7; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YfiC7hj7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748388984; x=1779924984;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=0GICObKbsQVdx+jZDF2rdRCbw0EmC40zXtfrw9yNJ3Y=;
  b=YfiC7hj7xtmrqDkRvV4MM1qcCypPwniVs3X1q6ClJ7SHtg62VeTU4XSD
   h/1f8hZZkokJa3T2agY0VV8wxJ6dTUTPv+PQO3b/ZryAZDhiekooqLO9k
   +bFAqmA0prXVh+1p4NkN51UQY6B37JviybLUk9WGsdgKwxHNnGTa9Mgm7
   DzUhTytnitsXpaCC67pLUaMPz6wOhFix1l/obFYrUSrDdzYUx3J1RTZtM
   dnV/9CpqotIkVqYzbTMz79gmz0ewWDzQu2WCivZLnluwGU/sR8eskxCsm
   Sr+Bbbsh05YU9cDSWuq97BDx+z22G5zaZ2l3WiEfY1M+Q+BlVJlEfLfZ9
   g==;
X-CSE-ConnectionGUID: t9JDs/o/S6e/tL44MwXfPw==
X-CSE-MsgGUID: rW2b5EepQTu69ZwOfLHZpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="50456687"
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="50456687"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 16:36:23 -0700
X-CSE-ConnectionGUID: FfATFBSgQ6O4X3udCUDkRg==
X-CSE-MsgGUID: 6pRdFps6RZC8DVaazPAHbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="148058118"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 16:36:22 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 27 May 2025 16:36:21 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 27 May 2025 16:36:21 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.69)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 27 May 2025 16:36:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OyxDYG/Mh2Yh35/iQngGF8iHEd0+EK81qT85iiVCO4Wzfjh2gMlh7sIhkVp/+cBjKYppku6TgqQ895bVGpybf6T6IY7U1QgsboePzM3fO8GPhuyMo0aWe6WxZ6A91jgKhrjdSmBLNwYm+uqXgJ0shdf4j80g7m9r2xorgjzVfiIdRe91cZ3rkZU8XFnRA+9UV46rSPAoVjyuyVP56pKPAL4tdpB0H2vETLQ/INn4SxeUgPPbNtyj8Xz91ndiSN4XrMiBV27DY98Smz7/3amZXcEYLUXjnW6adb+Ha2SWK6qI+JQEDq4Qx02SytmPiP0+Vv8DRIo3mwGUuTv3j5IRPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jmbl74Wsm73JqBRGLamK+BlqKUM2pWXcL2dYoOOBVAY=;
 b=LN/MtksML7m7r+Q+32yf0KRnqFTABNX2NQdSw6vS7bkWhF9J622pwCZ1+CeQczm7L2kTKdT2PPeBQWkZJzbj+LcKq/2CsfqUuo3q3yIORx2GCyiFA2avCow7DJbV3Db5DqqVmNTCDsyrFyNKyUUfDtwwUakuXZ8X/N0v6tVqrymVEnC6xj/cowvZt4IIA10UCaDUuPFiUW9j/t8ez0X29Uej533qcCPC/WFSvmv1wdPW8YGcizB6f1REAg52Ln79qxc07jVj6tSVafoMi3+l5DwLHVKW3gZFS+dEH5ih4+3o1/lBjLC1i7mDGVOMXtNpBZkKzVo/KRl6o3hI4HCJcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by PH8PR11MB7069.namprd11.prod.outlook.com (2603:10b6:510:217::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Tue, 27 May
 2025 23:36:18 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8769.021; Tue, 27 May 2025
 23:36:18 +0000
Message-ID: <c4382156-a51e-4d07-9ccb-e6db2ca9d719@intel.com>
Date: Tue, 27 May 2025 16:36:17 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/resctrl: Remove unnecessary references to cacheinfo
 in the resctrl subsystem.
To: Qinyun Tan <qinyuntan@linux.alibaba.com>, Tony Luck <tony.luck@intel.com>
CC: "H . Peter Anvin" <hpa@zytor.com>, <linux-kernel@vger.kernel.org>,
	<x86@kernel.org>
References: <20250526073744.62520-1-qinyuntan@linux.alibaba.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <20250526073744.62520-1-qinyuntan@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0231.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::26) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|PH8PR11MB7069:EE_
X-MS-Office365-Filtering-Correlation-Id: f4b03cab-b75b-4ba0-77cb-08dd9d7747b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UDFZQXB0RjA4Rk5uaG1PVmpIQ2VpVDlkb3hjazhTTU9rbDRzLzQ3N21aWXJu?=
 =?utf-8?B?ZHNxbzJ5eWVaY1dqaDYxbnlCeGx5U2EyS3BhNm1LcHVqUTRqNW1ZMWpBNEx4?=
 =?utf-8?B?dWpKZ01oSmZVb3d0M1Iya0o3NmtSWW9rRy9WRXN0dVJKTlRzOWxsNm9KMHJr?=
 =?utf-8?B?ekIxelB2UmZLZnZacGlXcm1RTFd5c25uaExqQXFwRHRQTCt2WnNKUDJWVi8w?=
 =?utf-8?B?TElHc2hCNWxrVDNTSXRQV1oxREJqTEtRSUtJWFR3RkdrYWRrWVBycFdEb3Z2?=
 =?utf-8?B?eTFLUGI1dnlOLzFPQnA5ZnQ3dUVLbC90UlBRSzI5eFAxVVYyYTYxV0N5dUlU?=
 =?utf-8?B?RXlUUU1nRS82eEpPczRXT0U5Z1JMWUNFQ0h0YVVENm04c05nOStGSjdSdzJS?=
 =?utf-8?B?Y1NYNEFIU0htTysxUVpzNnBlbGNlUHAwQ2ZScXdWVUY0T0p2SEVBOTRveEFw?=
 =?utf-8?B?VDNZbmFQcWRPSm1MV0pBelNaR0lSc2dhRy9ISit2N2MyRGwzMmoxY1E5TDFn?=
 =?utf-8?B?SGd6cTdVaGE1ZlRiSlFRMU05dHdZOEtPUEN3K2FPKzFZb05OaHhQeWNlTXNE?=
 =?utf-8?B?R2VhNDJwV3JETmZpcVJRNHMxT3YzWW9yY3ZOSjJzdFhjd25VZEVaK2JPSVMr?=
 =?utf-8?B?UGZMbnNieHY5UDE1V0xoOVdlWVVHZWJJdExSNklXOGRMUlJhZzl2dTJzQ3Nv?=
 =?utf-8?B?eUpGMjkyUmtlTUFTdWFnVHRpSThiSlhEYVh3MVVmbExvdkhNMWNrS1RsNnRu?=
 =?utf-8?B?T1laczdpaWhZVy81SEh4czdpM2Q4bi9KY0xyWWRJRjIzNy8rejdtb1RhNmYx?=
 =?utf-8?B?a1FBRU1MRk5LSGpUbEl2RkpqUnZ5N3Z0eVltNUs3dVpNNGJibGsvQit2bWxa?=
 =?utf-8?B?MEV6SFRiNFFwdk1kYzlXWk5MY05YaWQwNjlhNVNxMGVMSVdNeTRKa0tmNS9F?=
 =?utf-8?B?aW9McXRxVzN4KzAyVFNaTmxkbWdzYVBveUpWNElOSjFqOUIvc0tXSytVMjlT?=
 =?utf-8?B?ZGlwUTVBWGpXWXRwRmNxYVJEdnRBZGFBZjMzUHJQMXJ2ZWZYaGw3NnFnVEtr?=
 =?utf-8?B?UnJmWTJDM053aEt2M0lGTU9hc0t6QkwwWnhFZUY4WmwyOHJuR2dvSGVEaGpx?=
 =?utf-8?B?RDczZVd1aGhEbHNlWHF1RlVlYTBOOGwxZnBZR1RpMHI5V1FNRlYzWDE2dVJK?=
 =?utf-8?B?NmJCNFZzQmJCMm9CeWVYdjhIUUw3MEFaanV1V2p0Wk5EbjYyN3ZIMFJ6M1ln?=
 =?utf-8?B?V3AxSkZPcFoyV0JUS2N6aEIraEdwemNoRTZXcXFrb0lXT2QwVWttckFHTGQr?=
 =?utf-8?B?Vkd1cHFIMm1NMGgvbGxZL3o1SmtrTWhjTjE3QU5YTk5oOWt3V2dzNFNLM1Rp?=
 =?utf-8?B?eWhKbjNGRytoOG9Gb0pidGJoeVU3YW5Dek4rSmV5Z1p1eFNrK2Jtd0Z4alJh?=
 =?utf-8?B?bkNhNE5hWlFucmg2MWR4c3lEQW9aVUtZeXJjeUZ6c3NrcnNESHRDTTZTeHVF?=
 =?utf-8?B?Ly83TDBVM2VZQjNJdEdyRGFyQUlRSDB5Z2VjdzNtWjFxbTZqaVAyckRrb3h5?=
 =?utf-8?B?aGV3V29QOXRpUnVPNENHZklXUmNZczg3YWQ0Qy9rejhETGUxSjRNaHFRUHhN?=
 =?utf-8?B?UG5ISnJiRU5FczRnSzM2ZGs1VXZKaTVRaDJ1dU5lKzdWOW9vZHZvRkVWeFY0?=
 =?utf-8?B?RFZoZGpKcDd1V2xOUm9jSXUyb3N0b1RkT1prSFZXTXl6S3BTc2dPaGovekYx?=
 =?utf-8?B?dUkzL01yaUwwWlZvRkpBOVBGZ0pYZUd2aWRVdVJDQzhYMG5UWFdhNFFmQU1Y?=
 =?utf-8?B?M3RKblcrYW9La0ljdlRrOFJ0SU1Tbmo5Z3hSOCtsRlZXWjVITmZDenNpSk1p?=
 =?utf-8?B?WEJKN2NJVWFLbld2bWh6d1YwYUpTMm9mZlFRZmVjT2pRdWg3R2dmNHFsTlFu?=
 =?utf-8?Q?dngaBU1rtvM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHBtM2NCM1d2RDRGZEt2UjBJY1NPSU5zV2EzcGlrU3RadlBZRm00clMrYTh4?=
 =?utf-8?B?M2JEdFQ3a254R0tqYjBJeTA0d05PSmtNSzJlejhyeXFRRitTbW5walg5RTZE?=
 =?utf-8?B?YVhBM3NxZHRNM0F3a2FVRUpKblcrYlptQkhCSXFHMHZIWkRVbmVGakhMcXYy?=
 =?utf-8?B?RW10NWdGMUMwRERCZEU2OVArZmRXdzAyYVBvS3dnekVEekZjR1NuZis0Y1dq?=
 =?utf-8?B?TDVFVHArbStCOGxUZ3QwSGpwUzJabWE5d2duMCt4WkRVRFQ3RWVjUVNlSGNK?=
 =?utf-8?B?SGJ2MXNjUkhwUU1SaWI0V25NbzVQaFdHc1QwYkpRTXZPV1dxeWMyMXBkdWwy?=
 =?utf-8?B?Tk9QcldvWmlQNTBJNk15bnZXOTlIMlpmTFR2elRZVldYMStYNkV6bFhDZGJa?=
 =?utf-8?B?ZytLVkpOY2dLRVBHNVVYTGNmaGo3LzhpM2lEcncwc3lVOGJHeSs0bGY4RGhI?=
 =?utf-8?B?TXFRM280L1pxbzArZVhkWUYzTWRaV1hLK1dFdzUvb3Uyd1F6OUhVUVVseG40?=
 =?utf-8?B?bmo2eXp0V0JXcTdFM1BJOFFGdjNpQ25abW1ZcjMzSmh1S3l5RDh1a1ZDNkxi?=
 =?utf-8?B?RUpla1BuZ2R5eHZUMFNZaHgyZnBrSFNDMGJwOFpDTUtKQzBvZEpLak9rOFRn?=
 =?utf-8?B?ZkpQYlM3TGRmQXQ4VXJKVkgvRnNMYjBpSnUzTU5WSU9VRmQ1U1E3VW14NE45?=
 =?utf-8?B?M1RxekVFV3JmbGFjTlVtNzJ0YVdMTlUwVHJrWHJPTHdmdHIydmY4N0dCR2Y0?=
 =?utf-8?B?dXNON1FlOXNjUklINGQ4ZHJ1cG9Eandxemhwd25wZm1valhMRDcrejN2ZmVL?=
 =?utf-8?B?MDNlNVhUcSt4NUp0blg4a3I1QVNpU29aT05WWW1VMHRVK1NKRE0yNlVZWEdz?=
 =?utf-8?B?YXVZQlZEWGhBVTJZTjVERy82c1BmenVxeE5XZ2dVUExjVG9lanlxWGxiUk1u?=
 =?utf-8?B?SFhERUk2bVZoazgyMUkxOFMwZG9rd05wT2ExQTQ2TnVGV1B2dWxDWGRrckNw?=
 =?utf-8?B?V1haS0d3MWVYYUE0RCs2Mkw1ZmNxQm5CQXlyOUR0Q3NCQ2dydW8xdzhXMWpu?=
 =?utf-8?B?U2RsVkdad2ZRZ1Ara1BTbFQ4RnJUL3hVd1doODMwaTZ0RmVWQ0xmY2VPTGxD?=
 =?utf-8?B?NmwzdHlvand6Q20zQTE4amlncnJOaDl6TGYrT3FzZWVaU2VtMkdsNGlKdmFI?=
 =?utf-8?B?aXhvc1E4djl5cGtlK2d5Z0JaeGRRNEdkWFFPeG9Bd0Q3cjE2VWNKdkI1V3hn?=
 =?utf-8?B?TU0wcmxPU2p6NlZNdWkwR0k2cjJYTlVvMnV5R3RNaCtUWS9yWUtxWjZyNVNQ?=
 =?utf-8?B?d09oV3I0WnhOV1dmTjRhakxvUjBpMnpudTA3QlpaNktRZmx2Rk1yeGtFQUNP?=
 =?utf-8?B?U0tHNlBtQ0c4a2s3U1dJUUhPL2VaaEYwZDZqVE9BaVNkVUZtMmsybC9GQ2NP?=
 =?utf-8?B?QkxMb1A2RmV6VHVCWXNNVDZlL05mZWJxMEo1dVd0b0ZLQTA5eVZpdVltRWth?=
 =?utf-8?B?SDNvSStFTGNtQWlqaWthWUIveEFMbVErSkdLTlhmNFdPSE9hREg2QXltKzBQ?=
 =?utf-8?B?MHZaam9Yd2dTYStXV3ovUmxSbFdFNkNZdzl1blN3SGNaLzZLWXF4T0F0YjBC?=
 =?utf-8?B?eHVweFAyeEI1TVFxUnRFRDUxVnYrcE56Y0UyMTcyaVVzZUtoOC9KRTF2dTdF?=
 =?utf-8?B?QlR4cXZtUjF5NlZJOEpYUjV1Nnk3SzZZR2NGK3RYTk9DYzJvQmErWHVHVlAv?=
 =?utf-8?B?cmlFWndabUZSa1BMS1RCcEFGcCtoeEdaUE14TFJtd3hqandpSVJTcHNacGsr?=
 =?utf-8?B?WlVsd0NOVG4yTjRDSmtoNUQwYXVwa0NIa3RjakpGQ09GWkJmNmRCOU5WMkJB?=
 =?utf-8?B?QU9vbU1LNkNxWEpwQlI2RCswVmw3MklXelFCenFtMzVwZUNDVjNIamlmYmIx?=
 =?utf-8?B?WnpSZEVJcll0SGxTWXZ2MkNRdk9YUnZUZnBmSjBNOU9ySC9EK0g5ZXl0dEdp?=
 =?utf-8?B?T3dITGNMS0ZCUTFqVk1sdXNTUTZISHFqcU12S3BqdjNLUUFySFNkaVU3dUc3?=
 =?utf-8?B?OVJwY1prMUtydEZ2emo0Z0ZMcUlJbVRaWUgzQlQrOVRybjNzcUJYRVk4YTBD?=
 =?utf-8?B?aktBcXJTOFduRTZRUDhPd1hoTGNtcnpvdWhYRHJTMVdXVGxvTjJuWHNEYWRl?=
 =?utf-8?B?aGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f4b03cab-b75b-4ba0-77cb-08dd9d7747b1
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 23:36:18.7514
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nPOrGE8GayktpiHtGill5B9dbVEKpwudRfSTmu7dfOQ/NCdDp3HkXYKxgms2WOWSdK+OI6FrWm4sMisx2BEd1hcks/ill4zbJFGS9tsGFns=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7069
X-OriginatorOrg: intel.com

Hi Qinyun,

Thank you for catching this.

On 5/26/25 12:37 AM, Qinyun Tan wrote:
> In the resctrl subsystem's Sub-NUMA Cluster (SNC) mode, the rdt_mon_domain
> structure previously relied on the cacheinfo interface to store L3 cache

"previously relied" -> "relies"

> information (e.g., shared_cpu_map) for monitoring. However, this approach
> introduces risks when CPUs go offline:
> 
> 1. Inconsistency: The ci field in rdt_mon_domain was initialized using the

"was initialized" -> "is initialized"

> first online CPU of a NUMA node. If this CPU later goes offline, the
> shared_cpu_map (managed by the cache subsystem) is cleared, leading to

"is cleared" sounds like the shared_cpu_map is empty. Looking at
cache_shared_cpu_map_remove() it seems that the worst case is when the
CPU goes offline the shared_cpu_map only contains the offline CPU itself.
If there remains a reference to that shared_cpu_map then it will thus be
to a cpumask with an offline CPU. Are you seeing other scenarios?

> incorrect or undefined behavior when accessed via rdt_mon_domain.

Could you please elaborate what "incorrect and undefined behavior" you
encountered?
It looks like reading the top level event would not be able to read
an event from one (or more?) of the online domains since the shared_cpu_map
will contain an offline CPU causing smp_call_on_cpu() to return with a failure
that is not caught ... the symptom may this be that there are no errors but
data is wrong?

> 
> 2. Lifecycle dependency: The cacheinfo structure's lifecycle is managed
> by the cache subsystem, making it unsafe for resctrl to hold
> long-term references.

This is not obvious to me. Could you please elaborate how resctrl could
have a reference to a removed structure?

> 
> To resolve these issues and align with design principles:
> 
> 1. Replace direct cacheinfo references in struct rdt_mon_domain and struct
> rmid_read with the cacheinfo ID (a unique identifier for the L3 cache).
> 
> 2. Use hdr.cpu_mask (already maintained by resctrl) to replace
> shared_cpu_map logic for determining valid CPUs for RMID counter reads
> via the MSR interface.

I think it will help to explain why it is ok now to use hdr.cpu_mask instead
of the shared_cpu_map. In support of this you could mention that the original
solution aimed to read the counters on any CPU associated with the L3 cache
that the sub-numa domain forms part of, but this solution uses the
cpumask of one of the sub-numa domains that is known to be associated with
the L3 cache. This is a reduced set of CPUs from previously intended but
known to be accurate. Alternative may be to build a local cpumask from the
all the sub-numa domains but it is not clear to me how much this will
improve things.

Considering this I do not think the references are "unnecessary" as the
subject claims since the solution does not replace the original cpumask with
an identical one.

> 

Needs a "Fixes:" tag.

> Signed-off-by: Qinyun Tan <qinyuntan@linux.alibaba.com>
> ---

Reinette
