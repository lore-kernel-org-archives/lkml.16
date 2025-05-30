Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36FEB383A5
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 18:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748628734; cv=fail; b=ba4uWfMuUKBZMrOSWbZin0SGPuyjfiAV+zNqCrkUpSmCdUdl/OtKj99JXvNPsXi6fiTSqLsJ/mRsmtwYb15pC5KEz2OU/haJQleq4i3e8W9qpbtDx0btuPDbjS+o2gQMSyC1WDZY/8hcVWV6ZuHFM26aORMSAFUAPsT1TOb1fV8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748628734; c=relaxed/simple;
	bh=i+7U//a7n7Vb0j/hpX+YZzlGmcas/Zi2yMhhpAlj2TY=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QEM7p10VQzQ82opSbQBUGETQEUML9ldVw4lHDdq+M61/imj6vj6dlFagSe5IOtTlDSYXFgl5gw66k9dYkMEck9mFp3Wl9f3jdMlaK+Cb8RU251xo3NWMv824tCTnrQtPU4xiTpH1NpniSSa6jdW3o3hU8Jq3aOUJb2WJVIIDgq0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZAd6tscB; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZAd6tscB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748628732; x=1780164732;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=i+7U//a7n7Vb0j/hpX+YZzlGmcas/Zi2yMhhpAlj2TY=;
  b=ZAd6tscB7EP96/krSySlCGcUpzHxff9XjHPjBCNdnacV3OGTi+acga7R
   5tm+IdvBEO7enaW7YDxREEadyaW1YlemnUJOF7q2WRUa/GjQalQT54v7b
   5d0to4IOe+kKyrHotXjv2MCemW4R6u0Ehog/9kEyiLlBhKlAVgmNaMk03
   q3R8j6rabgueJOBpRdK6YsKor+unJvcatsA/lYgl6j9eUndvilWrGKo9B
   3Z2LxalJ3riA9ye3lSGsOoT2CVKdSUdlgDCo8mt2KHzKig5hP6fZ17FR+
   WoFpaj413yH2ZSh0nr8jaXi23WKItrO9xvNkOZSxL00e5PhDl/DLJXvq7
   w==;
X-CSE-ConnectionGUID: b8V23fO8T6G+3dcoKjxKGQ==
X-CSE-MsgGUID: Wwz/f3bMReGKK+e7Yml/aA==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="50880216"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="50880216"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 11:12:12 -0700
X-CSE-ConnectionGUID: 6XGyrJ56Tuy/cSwGPsHZIg==
X-CSE-MsgGUID: lgHZZ1O8SLmGk4yD6T143A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="144915512"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 11:12:12 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 30 May 2025 11:12:11 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 30 May 2025 11:12:11 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.71)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Fri, 30 May 2025 11:12:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zAMQnYGm/XsxVDRg7PRkHl/7EH810zlirWwjOfZb+86oyl3sYdJWEmX2Ls2g+bihYbvEBzlxHL6vYGpfJenX5FMVOFnn1pKL6gXLESkB790Az7PgBUFib9DAQtUqqo1chLEGc+pDRDdGIU0OJh3Ri9RjXXqs0OmVp1DilRKwXR/iCFT9WDAozEYZx4zpSD23OhPIXCMKG1pWKPVZaWFMkdwqQn4ydjW+mMorrhzzMIAvu7cQLRlS5etIdz9uCBX8FZ0Eff6AOh28FPAZbo6WG6Ev6ggM6/xEqCQQZjjtBbBIpKrqnmVnQLgjNeUcpV07BsidOMfKTlC3r76R5eGdpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BbfzmC3XN3U//W8D1Vn1rDWo+VucqZmCZDE948fY7D0=;
 b=T/E/gAflx6bafHpWk//SIPI94OKOh0ATJnizU64QwMy3gLSoVbGRnyreiQvYhf5e95omVWGJ9QVRTVch4sZMzDRJbAZBcoS5RAsvlUDlAv18o7ClXJFzE7yimHz+najE4FsDiA4Re//SQLmgxWQNgb8AD40mGs+Abafmn5FsIHGK5C4kgbKBVPjc1ViQfXnbdtZE/g4Ino7qeKGMMfCxUzeXKgPytdfqXuFJSapIYWJXxNHzozCV99JMVgx91BtM7wB1levZPmEVaG3qNO6BhuoI9LYkPPsRheM78I9rlYA2f130zel34qXfkOBjaXJYPyUjsAcfp+7umccAH4HIag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB6818.namprd11.prod.outlook.com (2603:10b6:930:62::19)
 by SJ2PR11MB7545.namprd11.prod.outlook.com (2603:10b6:a03:4cc::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.31; Fri, 30 May
 2025 18:11:48 +0000
Received: from CY8PR11MB6818.namprd11.prod.outlook.com
 ([fe80::48a1:723f:54ed:a6d6]) by CY8PR11MB6818.namprd11.prod.outlook.com
 ([fe80::48a1:723f:54ed:a6d6%7]) with mapi id 15.20.8769.029; Fri, 30 May 2025
 18:11:48 +0000
Message-ID: <7bfbc2b0-d4a2-4c2c-908f-6d3eb98ae1f5@intel.com>
Date: Fri, 30 May 2025 11:11:47 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 1/1] x86/resctrl: Remove unappropriate references to
 cacheinfo in the resctrl subsystem.
To: Qinyun Tan <qinyuntan@linux.alibaba.com>, Tony Luck <tony.luck@intel.com>
CC: "H . Peter Anvin" <hpa@zytor.com>, <linux-kernel@vger.kernel.org>,
	<x86@kernel.org>, Reinette Chatre <reinette.chatre@intel.com>
References: <20250530175027.30140-1-qinyuntan@linux.alibaba.com>
 <20250530175027.30140-2-qinyuntan@linux.alibaba.com>
Content-Language: en-US
From: "Keshavamurthy, Anil S" <anil.s.keshavamurthy@intel.com>
In-Reply-To: <20250530175027.30140-2-qinyuntan@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0084.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::29) To CY8PR11MB6818.namprd11.prod.outlook.com
 (2603:10b6:930:62::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB6818:EE_|SJ2PR11MB7545:EE_
X-MS-Office365-Filtering-Correlation-Id: 665d8264-2d8a-4f7f-a74d-08dd9fa571ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S3FjWExEYmRoaE5CREx2eEl2b0tNV3lvWE84VHlqRHhoVVVOdjlzcnM3anpi?=
 =?utf-8?B?aS96VUI5N0xmSWtvKzdpWmlRSE9rV2dXWnN2TWd0RHFtdEZNT0RoZkpRTHBl?=
 =?utf-8?B?eGVNbWxHLzVTdEhGV0dnTS91T3BUdVI0QjhBTkdMK2RPK0FTYlNhNUVPUG53?=
 =?utf-8?B?Q0lpM2lVK0hCeVZma1ZBSE9QaFNMb21XRU1DMHZaejVLZ09QTnRHTlZlLzdt?=
 =?utf-8?B?S0JWWUM1djhHZ1dkR2tNT3lnZHNsVjQzK250YUhhQ3ZKbnppWWFjc3NqcmRa?=
 =?utf-8?B?a2NFZWRmWGJJdE4zbyswcmlnWGV0Ui9IZnN2b0ZQeFFaNnFSdHpsVWJFZllu?=
 =?utf-8?B?NGtLbzAwR1lyS3B2SEVjNkd0dDhZRStVQ1lxSDRSZjFaeTVwZ1ZRanZHbnlq?=
 =?utf-8?B?Y0FUb1JmVnprR3V6SUlUN0xIeGp0ejNaMzB6QzhnRVZBVDBLaUR1a3ljbzNo?=
 =?utf-8?B?NlBpNW1wSU9Za0hMNlN0NFNlc01NYnB0a01nd3NkbWNyTERkT0FmeS9JV2lT?=
 =?utf-8?B?WEpodFEvMGowdVN3cHR2R3IxSHlvcFRwTmRtNE5rbmJmMmt0aW10R1lFNUJr?=
 =?utf-8?B?Sm81cVlEUC9sNXdpNms2UTNROGhaT3BCSHl5Rmludm9sYWNzVlVvNXFoa3Bs?=
 =?utf-8?B?S1REcGltaUgySTI4a252QnNKRkVIOUY2ME1vcXA2cmJYZ1Q1MVh0d09odkdR?=
 =?utf-8?B?TzZ2dHZlOTVJSXR1dklxeG93QlJFYU5paXNZeDZjb3l3clNXQlJsOUhCUWJk?=
 =?utf-8?B?cENNU2FkWVBWVmg2ZjJWMjQwTWNCWTlNSDBPa1VENFZ0bndqWmVWazU5QVFn?=
 =?utf-8?B?ZXRRUlVsYkJVNXducTBTN2psL1d5ZTdyYUJhZk94aVZ0SG5WT3FOQmNUS1c4?=
 =?utf-8?B?NWRUY0hoVENsRFRCb1VZUDBLZk1hQ3EvdG9vS0grQlRIMTdIMW5pUEowNHpQ?=
 =?utf-8?B?WWFzNHowRENiVS9JNXdINjlyY1VOeFZBb3YzazFlajV0U0EvL28xRk0yUjNK?=
 =?utf-8?B?c1U1dFNBRWZBVHVNSDNiZTdwWEs2Vk1nS2tSMHFHS3VvUjlMWVVjczRpWm5Q?=
 =?utf-8?B?OHVCaFFLcFZtUVdXVnJrOFdhSW0weHFqbVMzSEVTemx4VXA2MnczU3d4OGp6?=
 =?utf-8?B?dVVXWUJXcDl1bWkvalcyUFQzb3Y5dG5UdXpsVmErUVdNN3NxbFVOeitSTXEr?=
 =?utf-8?B?VER0NFJUM3RwR0lTTnpBSy9PMFRNOXpOQjhzZTE3K0xLazVSTjEzZ01zYUVN?=
 =?utf-8?B?K2FBaWx0MG5za3JGaWVBY3hMOEw5THhOeW5iVnFzU2Rkb1JNT2lqNS94TlJO?=
 =?utf-8?B?aktIQjVycnIvUmpsRjVJbndqTWRBSFB6aENxL0c1VVl5NVlNUFdyZzFJM3N6?=
 =?utf-8?B?TW1STSswSW0zVmNUWlF6MzdsZjQrSUs1clFIMXNMdi9TVlo0dVVNUnFZbXl2?=
 =?utf-8?B?ZDh5WEppNmoxS3ZvTUNyRUdDdHhwengyRjVVbmVsS3dHRjRGem45eGhadVRO?=
 =?utf-8?B?Mzl0eWZoTXhIMjdiT3JNWjBaam1iOGZxWkFrd1c3UVc4UVY2WWJYWDhrb3Nx?=
 =?utf-8?B?VjVQMjY4aGZTaW1IV0JVNFJ5Zit6akFSNEkzNklsNGhTeUhUSEhBWHZNSTNZ?=
 =?utf-8?B?SlJQVExaR3JpeHZmbXQxeGJDWjdHcFpKZncxeTNJSytDMTRCbExlYlM2STVP?=
 =?utf-8?B?K09DOEM2M0dVVjl3OXZYVGR4cGc2TWhHbFhrekxlYldlOTNoWVZrcDlGbXJJ?=
 =?utf-8?B?VWR2bnZDZnV2SEZHcW9rSDMzT1pLZEVKRmU4bGZqWEZIL2hYWnBSV1BVRjZj?=
 =?utf-8?B?UUFXMkJpSVUwWUNzR2NPVUIvUUVhR1Z3RFRQOFFBbVk3b2V1c0Z1YlE4ckV3?=
 =?utf-8?B?L1NHdXB2S2t3ZHo2M1FVR3Biano2bGdrN05kcFBkNW9lZEdJem81OHNneTFm?=
 =?utf-8?Q?JkMJEj3DbVk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR11MB6818.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3RDS0xEK3Q0TXZqUUY0c1htZ25rSDh2TTR1eHFLT2x1NXU2MGVmN2w0cCtn?=
 =?utf-8?B?bVk1aVdkTzFzSEFYZnRUSzBmLzNCMWhuK2ZsUzBtNENDdFZSNkxNUWVzVFYv?=
 =?utf-8?B?aWpoT2dqMEJJWUxjZFMxallDekxsNURhUTlHcGZsTm43QUQ5RzlNVStEUk5P?=
 =?utf-8?B?YXZEWWk5ajNsN1R2MkxHUnZsU1ZOclloTHgxWGtjNm5rTWk0Mk1raVVMemJM?=
 =?utf-8?B?MDNGbGVXTmk3alZ5Z3RRQlNkeGlxRkI2MVB1VjVsKys1blo0U09iVHEvbVJ5?=
 =?utf-8?B?eTJUN3FMMmFhdktYODJqc2dZblpTVzhqZlViVTVXZjVaU21EdlQyWGlSZDF1?=
 =?utf-8?B?RGcxSm5lK1BQdm5FUGovNWZhNzZNNDNNOWxydGliajNXM1M4L2lKeS9WZTdy?=
 =?utf-8?B?TW8waW91UXQzYnN0cmJmeW1zQXpiZlBuMThLQWJud0IycWtSTDhkM1B1Z3Nz?=
 =?utf-8?B?bFVnUTFRb0Jra1V0UnlLWnBteWt1bStKT3ZZQWtmdHNkUmxGTnlOVmFRam51?=
 =?utf-8?B?cXJNWVFtZEVYV1lPZWVxYzZVd2kvSklvcVdzVnppT2I4bnhQajNCRVlLeTdJ?=
 =?utf-8?B?TmpCMC9GZm1YR21UWkJ2NmF0bXl4Q2RZKzhpNXVocnk5QTVYK0REVVRjOExv?=
 =?utf-8?B?a0FYbGp2eHBhTkk4ZGx0VWxKNU9kYWxTZjVrNm9JZmdTQlhoazFFa3l4Sjh4?=
 =?utf-8?B?WkRicmtJK3dyNm1ndjllWDUrMU9tbnJSdU1PNzZIRnhrdEM1TDQvRlRGdXpm?=
 =?utf-8?B?dEpoMldwOUg5TjlpUFJsQjBNQ1lKL1RLMHE2Y0FINXg2K3ZaNlkvcm1ySkM3?=
 =?utf-8?B?a282ejd2S1F4anY5aDNyY0YzTVNZcGZMYjZiN2t0TG9FWmVLSjJ5akY1ajJi?=
 =?utf-8?B?MmZ4VCtzaUVGYnlOc1dyRFN4K1dEZld3bG9EUFhKdTRBVi9xRG8rQVQxaFgy?=
 =?utf-8?B?b2NueE9nVzNGL3VFbGl4bEZMRWZEL2VxSCt4ZnpBb0ZISlpZSFpNamV5SW9q?=
 =?utf-8?B?M2VBSXl1KzNWTUl4aVBIZDJWUTYxMzc3dktUYmJ2S0s2RHBUS1dFRUptSFhR?=
 =?utf-8?B?NXhkUnc1UU85U0VXUHJGQWJsWFVpRDN1MHBsdHpaR3paM3BsVGVERXlBOWZ4?=
 =?utf-8?B?Sk03Q2ErL0ZqM1FHSkVBV0diN2ZMK0tqSlNvaXcwMkxGYjJXc0laWVlMOWcz?=
 =?utf-8?B?SmlHc2V3ZE9QVUVIbGtSVEVMTHFFbWhBdElmQ25idmxZMmhjVC8vdjlzd2Iw?=
 =?utf-8?B?ZXN3dm9KYUpGVnNiNnd3YXdINEhlbXQ4QzBKNTdGdlNxTWRnWmQwcE83em1m?=
 =?utf-8?B?THI0NHF4cXladUFZc1N2aFNjZnVvTFN4aENUajFGak5yZFROdWQ3dERhOTdt?=
 =?utf-8?B?azhlSGYzdmZsUjN4R2xUVGgxbXRPWnlIZ3FKWTFnQnZUL2RySnUxd1VIS294?=
 =?utf-8?B?aVRsQU5JQXBZZUpkYnFNMXpJSG42dFhxK29GQ21RdzBSaU1neDA2RHF1aGww?=
 =?utf-8?B?MEJVbncvRnlrcXZ3MXB3VDE1UmRJTUI4bGJPRjEyQXFsVEhQalRuTVV0cllT?=
 =?utf-8?B?UENKcWtVTVIwb2ZUcytoWTU0YXk1aE1DV2tEVXVxOVJnUDFaWW5NSzIvRnov?=
 =?utf-8?B?WmErdE9OZ1hFeVEwb3RvWmJSME5KaDUrNldpdjVtQXV5T1FBU3Vzb2JCWkpm?=
 =?utf-8?B?bzNqMlBGaHNrWGdHdmY0ZG1MMmc3ak9GNldSU0hpMlhSWWkwSFh3V3hlL0p4?=
 =?utf-8?B?eUZvOXdSR20vU2ZVSWpmelQ1ZGU5VDNrdmM2dzY2YmVta3hxZTc0K3FYVENZ?=
 =?utf-8?B?VWhuU0poZHdQMStERVJuVW1qcThuajZJa1RzN21sRGdZSXBOYm5Fd2tYMUp6?=
 =?utf-8?B?MEc1ZjdrZ3Y5aXdvelJzQWJZdGZUN0I3eHM2OTdheHU5WFkzU0czWGpDYk1T?=
 =?utf-8?B?ZGxLdXk3OFdncnBSRHJ2OWRsYXV5Mm5yeENzY1E2MjJNczl0WjVZWEVwVVRH?=
 =?utf-8?B?TlJIWVdrV050UUhQNmZjN2trZWo2Z1ZLWU5FVkJsN0tRbG94bzlxOEJNL3A5?=
 =?utf-8?B?VDY3bFdTdE9uK1JyM2dONmt2TFg3aW1SRnlTZE9ENDVhMHk3OEtQOHRoOFIy?=
 =?utf-8?B?K3o4MC9KTVNjTDYvVERlRUpCS2ljOHdaTGxRd1l5ZHNuRDB0VXpCT3QwQ0tu?=
 =?utf-8?B?OVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 665d8264-2d8a-4f7f-a74d-08dd9fa571ac
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB6818.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 18:11:48.3484
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h+XJGxxl5mqJxM6DV39vcLxyNmG14HnHEd8fPwcvS7dGxp3U9vEYFlt8l2oz6sYILKzlkUE9wJ8G8kHuGy637wFJlL2K40a1lkrxyOk4Efw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7545
X-OriginatorOrg: intel.com

Hi Qinyun,

Ever since this resctrl subsystem has been refactored to support other 
architectures by moving common files related to filesystem handling into 
fs/resctrl/*, I have seen folks started to tag the subject line with 
"x86,fs/resctrl:" when patch touches files under fs/resctrl. Since your 
patches touches files under both arch/x86 and fs/resctrl/*, can you 
please accommodate this subject tag -> "x86,fs/resctrl:" so we are 
consistent.

/Anil

On 5/30/2025 10:50 AM, Qinyun Tan wrote:
> In the resctrl subsystem's Sub-NUMA Cluster (SNC) mode, the rdt_mon_domain
> structure representing a NUMA node relies on the cacheinfo interface
> (rdt_mon_domain::ci) to store L3 cache information (e.g., shared_cpu_map)
> for monitoring. The L3 cache information of a SNC NUMA node determines
> which domains are summed for the "top level" L3-scoped events.
>
> rdt_mon_domain::ci is initialized using the first online CPU of a NUMA
> node. When this CPU goes offline, its shared_cpu_map is cleared to contain
> only the offline CPU itself. Subsequently, attempting to read counters
> via smp_call_on_cpu(offline_cpu) fails (and error ignored), returning
> zero values for "top-level events" without any error indication. Replace
> the cacheinfo references in struct rdt_mon_domain and struct rmid_read
> with the cacheinfo ID (a unique identifier for the L3 cache).
>
> rdt_domain_hdr::cpu_mask contains the online CPUs associated with that
> domain. When reading "top-level events", select a CPU from
> rdt_domain_hdr::cpu_mask and utilize its L3 shared_cpu_map to determine
> valid CPUs for reading RMID counter via the MSR interface.
>
> Considering all CPUs associated with the L3 cache improves the chances
> of picking a housekeeping CPU on which the counter reading work can be
> queued, avoiding an unnecessary IPI.
>
> Fixes: 328ea68874642 ("x86/resctrl: Prepare for new Sub-NUMA Cluster (SNC) monitor files")
> Signed-off-by: Qinyun Tan <qinyuntan@linux.alibaba.com>
> Tested-by: Tony Luck <tony.luck@intel.com>
> Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
> ---
>   arch/x86/kernel/cpu/resctrl/core.c |  6 ++++--
>   fs/resctrl/ctrlmondata.c           | 13 +++++++++----
>   fs/resctrl/internal.h              |  4 ++--
>   fs/resctrl/monitor.c               |  6 ++++--
>   fs/resctrl/rdtgroup.c              |  6 +++---
>   include/linux/resctrl.h            |  4 ++--
>   6 files changed, 24 insertions(+), 15 deletions(-)
>
> diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
> index 7109cbfcad4fd..187d527ef73b6 100644
> --- a/arch/x86/kernel/cpu/resctrl/core.c
> +++ b/arch/x86/kernel/cpu/resctrl/core.c
> @@ -498,6 +498,7 @@ static void domain_add_cpu_mon(int cpu, struct rdt_resource *r)
>   	struct rdt_hw_mon_domain *hw_dom;
>   	struct rdt_domain_hdr *hdr;
>   	struct rdt_mon_domain *d;
> +	struct cacheinfo *ci;
>   	int err;
>   
>   	lockdep_assert_held(&domain_list_lock);
> @@ -525,12 +526,13 @@ static void domain_add_cpu_mon(int cpu, struct rdt_resource *r)
>   	d = &hw_dom->d_resctrl;
>   	d->hdr.id = id;
>   	d->hdr.type = RESCTRL_MON_DOMAIN;
> -	d->ci = get_cpu_cacheinfo_level(cpu, RESCTRL_L3_CACHE);
> -	if (!d->ci) {
> +	ci = get_cpu_cacheinfo_level(cpu, RESCTRL_L3_CACHE);
> +	if (!ci) {
>   		pr_warn_once("Can't find L3 cache for CPU:%d resource %s\n", cpu, r->name);
>   		mon_domain_free(hw_dom);
>   		return;
>   	}
> +	d->ci_id = ci->id;
>   	cpumask_set_cpu(cpu, &d->hdr.cpu_mask);
>   
>   	arch_mon_domain_online(r, d);
> diff --git a/fs/resctrl/ctrlmondata.c b/fs/resctrl/ctrlmondata.c
> index 6ed2dfd4dbbd9..d98e0d2de09fd 100644
> --- a/fs/resctrl/ctrlmondata.c
> +++ b/fs/resctrl/ctrlmondata.c
> @@ -594,9 +594,10 @@ int rdtgroup_mondata_show(struct seq_file *m, void *arg)
>   	struct rmid_read rr = {0};
>   	struct rdt_mon_domain *d;
>   	struct rdtgroup *rdtgrp;
> +	int domid, cpu, ret = 0;
>   	struct rdt_resource *r;
> +	struct cacheinfo *ci;
>   	struct mon_data *md;
> -	int domid, ret = 0;
>   
>   	rdtgrp = rdtgroup_kn_lock_live(of->kn);
>   	if (!rdtgrp) {
> @@ -623,10 +624,14 @@ int rdtgroup_mondata_show(struct seq_file *m, void *arg)
>   		 * one that matches this cache id.
>   		 */
>   		list_for_each_entry(d, &r->mon_domains, hdr.list) {
> -			if (d->ci->id == domid) {
> -				rr.ci = d->ci;
> +			if (d->ci_id == domid) {
> +				rr.ci_id = d->ci_id;
> +				cpu = cpumask_any(&d->hdr.cpu_mask);
> +				ci = get_cpu_cacheinfo_level(cpu, RESCTRL_L3_CACHE);
> +				if (!ci)
> +					continue;
>   				mon_event_read(&rr, r, NULL, rdtgrp,
> -					       &d->ci->shared_cpu_map, evtid, false);
> +					       &ci->shared_cpu_map, evtid, false);
>   				goto checkresult;
>   			}
>   		}
> diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
> index 9a8cf6f11151d..0a1eedba2b03a 100644
> --- a/fs/resctrl/internal.h
> +++ b/fs/resctrl/internal.h
> @@ -98,7 +98,7 @@ struct mon_data {
>    *	   domains in @r sharing L3 @ci.id
>    * @evtid: Which monitor event to read.
>    * @first: Initialize MBM counter when true.
> - * @ci:    Cacheinfo for L3. Only set when @d is NULL. Used when summing domains.
> + * @ci_id: Cacheinfo id for L3. Only set when @d is NULL. Used when summing domains.
>    * @err:   Error encountered when reading counter.
>    * @val:   Returned value of event counter. If @rgrp is a parent resource group,
>    *	   @val includes the sum of event counts from its child resource groups.
> @@ -112,7 +112,7 @@ struct rmid_read {
>   	struct rdt_mon_domain	*d;
>   	enum resctrl_event_id	evtid;
>   	bool			first;
> -	struct cacheinfo	*ci;
> +	unsigned int		ci_id;
>   	int			err;
>   	u64			val;
>   	void			*arch_mon_ctx;
> diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
> index bde2801289d35..f5637855c3aca 100644
> --- a/fs/resctrl/monitor.c
> +++ b/fs/resctrl/monitor.c
> @@ -361,6 +361,7 @@ static int __mon_event_count(u32 closid, u32 rmid, struct rmid_read *rr)
>   {
>   	int cpu = smp_processor_id();
>   	struct rdt_mon_domain *d;
> +	struct cacheinfo *ci;
>   	struct mbm_state *m;
>   	int err, ret;
>   	u64 tval = 0;
> @@ -388,7 +389,8 @@ static int __mon_event_count(u32 closid, u32 rmid, struct rmid_read *rr)
>   	}
>   
>   	/* Summing domains that share a cache, must be on a CPU for that cache. */
> -	if (!cpumask_test_cpu(cpu, &rr->ci->shared_cpu_map))
> +	ci = get_cpu_cacheinfo_level(cpu, RESCTRL_L3_CACHE);
> +	if (!ci || ci->id != rr->ci_id)
>   		return -EINVAL;
>   
>   	/*
> @@ -400,7 +402,7 @@ static int __mon_event_count(u32 closid, u32 rmid, struct rmid_read *rr)
>   	 */
>   	ret = -EINVAL;
>   	list_for_each_entry(d, &rr->r->mon_domains, hdr.list) {
> -		if (d->ci->id != rr->ci->id)
> +		if (d->ci_id != rr->ci_id)
>   			continue;
>   		err = resctrl_arch_rmid_read(rr->r, d, closid, rmid,
>   					     rr->evtid, &tval, rr->arch_mon_ctx);
> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
> index cc37f58b47dd7..74b25bbb9872c 100644
> --- a/fs/resctrl/rdtgroup.c
> +++ b/fs/resctrl/rdtgroup.c
> @@ -3034,7 +3034,7 @@ static void rmdir_mondata_subdir_allrdtgrp(struct rdt_resource *r,
>   	char name[32];
>   
>   	snc_mode = r->mon_scope == RESCTRL_L3_NODE;
> -	sprintf(name, "mon_%s_%02d", r->name, snc_mode ? d->ci->id : d->hdr.id);
> +	sprintf(name, "mon_%s_%02d", r->name, snc_mode ? d->ci_id : d->hdr.id);
>   	if (snc_mode)
>   		sprintf(subname, "mon_sub_%s_%02d", r->name, d->hdr.id);
>   
> @@ -3059,7 +3059,7 @@ static int mon_add_all_files(struct kernfs_node *kn, struct rdt_mon_domain *d,
>   		return -EPERM;
>   
>   	list_for_each_entry(mevt, &r->evt_list, list) {
> -		domid = do_sum ? d->ci->id : d->hdr.id;
> +		domid = do_sum ? d->ci_id : d->hdr.id;
>   		priv = mon_get_kn_priv(r->rid, domid, mevt, do_sum);
>   		if (WARN_ON_ONCE(!priv))
>   			return -EINVAL;
> @@ -3087,7 +3087,7 @@ static int mkdir_mondata_subdir(struct kernfs_node *parent_kn,
>   	lockdep_assert_held(&rdtgroup_mutex);
>   
>   	snc_mode = r->mon_scope == RESCTRL_L3_NODE;
> -	sprintf(name, "mon_%s_%02d", r->name, snc_mode ? d->ci->id : d->hdr.id);
> +	sprintf(name, "mon_%s_%02d", r->name, snc_mode ? d->ci_id : d->hdr.id);
>   	kn = kernfs_find_and_get(parent_kn, name);
>   	if (kn) {
>   		/*
> diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
> index 9ba771f2ddead..6fb4894b8cfd1 100644
> --- a/include/linux/resctrl.h
> +++ b/include/linux/resctrl.h
> @@ -159,7 +159,7 @@ struct rdt_ctrl_domain {
>   /**
>    * struct rdt_mon_domain - group of CPUs sharing a resctrl monitor resource
>    * @hdr:		common header for different domain types
> - * @ci:			cache info for this domain
> + * @ci_id:		cache info id for this domain
>    * @rmid_busy_llc:	bitmap of which limbo RMIDs are above threshold
>    * @mbm_total:		saved state for MBM total bandwidth
>    * @mbm_local:		saved state for MBM local bandwidth
> @@ -170,7 +170,7 @@ struct rdt_ctrl_domain {
>    */
>   struct rdt_mon_domain {
>   	struct rdt_domain_hdr		hdr;
> -	struct cacheinfo		*ci;
> +	unsigned int			ci_id;
>   	unsigned long			*rmid_busy_llc;
>   	struct mbm_state		*mbm_total;
>   	struct mbm_state		*mbm_local;
