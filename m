Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8924D24339D
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 14:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744901286; cv=fail; b=eFuDZouqMpE1YdTa7nVKJlOVmD1ezTOCGOzAE88nMl+Jsf5YBY7UYu4u3xwZRKqx/sYWmfSVr+eIJrd5/OkVWztLqLq5K+h3VTt/wGz76sE7DRCuB8bq8IwTi3SvQfm5Ya+ydsXJasSflD5JhtizuDhp7YGeBEn6dAmikpyQVk4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744901286; c=relaxed/simple;
	bh=MyV9b2ldmLb0JaXRdV/A4JFguXIB32gLuYzP8Qw05To=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=tKTIV829IhGVfhHo2eRsAPLj6PGdIXFYkSFcA1VBr5y8GxSVv+om6U2z5Fdst75/IM9KD+qjVEz/POF7qfrvmQ4Qd3ZSfDRCkbAbh4Rq8udmF+FqmEAGFNEzmI4Q/UmqeEyJdO3B/h98IPPygUVt6a1IPdAp2YN+f4nlqoqCHT8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=exHCvfpA; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="exHCvfpA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744901285; x=1776437285;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=MyV9b2ldmLb0JaXRdV/A4JFguXIB32gLuYzP8Qw05To=;
  b=exHCvfpAkAZB6U13Yugj32Jj4J0jrrwWPvqd4kLPPeuwM/llpPeG3XGa
   yTowjD6B1bp2o4vd7LGD6HVwBungNEZxNiJ90UMhxi3vcNOgceDj8KUVG
   /y3+ec0qd2qPhvHERzQ/07QhRa0jQ0JE4BKaYTU6+xyZ6t0Xt+s0+OCG9
   Cd9UsJfUw/7kke16zJl85S+iopPINvBvhpZ/7rGIv35fs1q9ezE6TKesw
   e1p+JP4IDFSw0sf6GKWClB+ReIU3eDXYm+zDU/i09Aft7DVhUavQGNVKk
   RODbk3nh+IWVd9O/mSRosF/l+uRZZ19L5xH93pm6PDya3BTeX9utoHTnK
   g==;
X-CSE-ConnectionGUID: UvFfDWLNSP6FAwBo8g1Mqw==
X-CSE-MsgGUID: MdsaFceaSKiynsmF94A7/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="63902082"
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="63902082"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 07:48:04 -0700
X-CSE-ConnectionGUID: 3FoHstS/Sy+chVr4vjKKmA==
X-CSE-MsgGUID: i4eWXWhJSqywb8nKEk1Z9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="130681679"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 07:48:03 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 17 Apr 2025 07:48:02 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 17 Apr 2025 07:48:02 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 17 Apr 2025 07:48:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TcEARHgP5mzoSalXx3PJJhbzGcGUXWBO1pAwaFcPLJQ3n9+RLgQozDfCGXaeIQBrfBFTf51xU6SMEqE9P6fzlDssBrNtHKo2ZNWmuN9XFnIElKKxI/4XIcwbWh6LqfWWt15+zyXYdQMPQrnqlpjzlzV4ZznG/vavxZDtbXqApjEZL0yuIUIoFIdcu6kqyfjJnLz3Ae4lIPscMLsBSFHqrRaP3sinrS16EdWvUM1NFOUKmE2EIHubuygkC1ljWnOVGiRfz8P8z1PrfaCAJoiFcUTR6Q1X3ldY52j6bI15GmmzUf+yMsnLBsonlVdaiUhBJrGybex5LftPstnBdsEpIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ds7sHbQ550f2EDfnHIxSqYsKS2rs+4CUpzVM1U/YTD4=;
 b=H4RFHjQ19r2NMflkB89Msuy0fjXPaWb6xf3qyzyi3G88YmP/QH9a3GIZXS0M6qmSla7LszhHphWFPsnad6cMV0Xk8TUKFYesfPgA4pMfX/B1/WNsyg0d8Bn/zINbXaL8M5HGw2qiPzU1lZH01FSBsrraYsqPa1brqklzYV6IZCIrg1bM8LHyUEmdKVKbQtYMEDyO9bjXlztQUrQa3JftN2MGHPu0xBFHgr2NZ5NHG3mAowLa+kEJPuGRfALYN2WyKw4k741ihsoMpqRDALV+v2FJozZtKAgrsdLVWoRNhQQh0O7F6uJquJibG8KbwxdCreU5U38kYxfxPKHwyDISRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by PH0PR11MB5174.namprd11.prod.outlook.com (2603:10b6:510:3b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.21; Thu, 17 Apr
 2025 14:47:58 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8632.030; Thu, 17 Apr 2025
 14:47:58 +0000
Message-ID: <4cfd5753-976f-49ac-82fc-e925c8d31be2@intel.com>
Date: Thu, 17 Apr 2025 07:47:55 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 00/21] x86/resctrl: Move the resctrl filesystem code to
 /fs/resctrl
To: "Shaopeng Tan (Fujitsu)" <tan.shaopeng@fujitsu.com>, 'James Morse'
	<james.morse@arm.com>, "x86@kernel.org" <x86@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Babu Moger
	<Babu.Moger@amd.com>
CC: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, H Peter Anvin <hpa@zytor.com>,
	"shameerali.kolothum.thodi@huawei.com"
	<shameerali.kolothum.thodi@huawei.com>, D Scott Phillips OS
	<scott@os.amperecomputing.com>, "carl@os.amperecomputing.com"
	<carl@os.amperecomputing.com>, "lcherian@marvell.com" <lcherian@marvell.com>,
	"bobo.shaobowang@huawei.com" <bobo.shaobowang@huawei.com>,
	"baolin.wang@linux.alibaba.com" <baolin.wang@linux.alibaba.com>, Jamie Iles
	<quic_jiles@quicinc.com>, Xin Hao <xhao@linux.alibaba.com>,
	"peternewman@google.com" <peternewman@google.com>, "dfustini@baylibre.com"
	<dfustini@baylibre.com>, "amitsinght@marvell.com" <amitsinght@marvell.com>,
	David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
	"Dave Martin" <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>, Shanker
 Donthineni <sdonthineni@nvidia.com>, "fenghuay@nvidia.com"
	<fenghuay@nvidia.com>
References: <20250411164229.23413-1-james.morse@arm.com>
 <TYCPR01MB88043F4EBA7A338ADBDC23D48BBC2@TYCPR01MB8804.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <TYCPR01MB88043F4EBA7A338ADBDC23D48BBC2@TYCPR01MB8804.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0245.namprd04.prod.outlook.com
 (2603:10b6:303:88::10) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|PH0PR11MB5174:EE_
X-MS-Office365-Filtering-Correlation-Id: ebb5465c-734d-4d7b-b1c7-08dd7dbed853
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?clE5VStGMFJZUVVIYURxc0x5Nmw2VmNKb25OeHk2VWdKcG1rZDV0RGZpU2ND?=
 =?utf-8?B?dTNoV1FIK0g4K0Rud09EN1RHeFpWb25ITDZKRTRWeVNSb0RWWjVuVFE0VU14?=
 =?utf-8?B?amgydmQ5TnVUYW9ZOXk0aVVhczhwd0JkNGVLQk91RFJ5cjVGSlRaVlNVN2FB?=
 =?utf-8?B?Rm9xYlYxbHBLTVp2OSsvUDZPODd5TXloL085UnRiNmI2WjBXbEsxaUpWSmpK?=
 =?utf-8?B?UnFrSFFNaGZVVVh2WHdyN1FIWDhYa2VybjN5eGxaVldBbmhvek9yWHNaMXhE?=
 =?utf-8?B?NGNqdC9VRjNEbEVURU1vVklZaXBSbDdRTFFLZUtPN2xhV1dqVTU2RThaVjFW?=
 =?utf-8?B?cTdHQU5ZWWpRZndLc2VCemM2Y1JDM1NWRGZOWkRnYmNuaVJ4citKZCtseUJM?=
 =?utf-8?B?OGdXZE9NV3RJTHB5dnAvZWlURFdDbmZxWFIyTDVsbitKM0NoQ2NzOVdxSlgy?=
 =?utf-8?B?d2U5TGlGeldOb2g0QUtmTHd6VlF4bklWN0QzV2gycVAvTHBuYTV1cnVwUW1J?=
 =?utf-8?B?TzJqM211TjBOYWgzWXpNQ3BISkFXM3EwSTlaV3JnSmtDNUhnaTh1TEpDdG1P?=
 =?utf-8?B?ZlluWEIxVlBNeUdudWhkWkZlcjVUTnF3V1Y2K2p3YTJ2NDQ0T0p4Lzc3NE9s?=
 =?utf-8?B?eGltNjB3bGU1UXlTbk1Ua0hDN09QeTc2ZzVKWk1IcGxpU3BGWC8zMU4xenVp?=
 =?utf-8?B?Sm1sdFFud1VYSzBwTTdITE9iR3ZucmxoUmFna3V4enNwVkp1ZkZINGZDdU5s?=
 =?utf-8?B?VVFpaDRiNU1TNE9qRDhRckkySzR5T1cxMVhGd2sraEZ3cDdFYnZ1WXJleUI1?=
 =?utf-8?B?dU5Fc2tQN3A4QnRyS1ZkbzVQb1J3YjVLd3o0ZTZ6WEUwWTl2K3FsTjgvOE1p?=
 =?utf-8?B?YXdBMDltM0huL21LNVdGRFFmSnRtaTNQVG9CRXR4WkI4YXBIa0M0NG9EeE41?=
 =?utf-8?B?TzIxYnFGU1JBRk5HdWtDRGRPSk9ROE84bU5KK2RQb2EzWUs0aFYyRzE1NVlE?=
 =?utf-8?B?cW1rVGw2YTF5ZVVmZzVtQ25saTJLN3BNMXJocldjQy9kUk1yYTY0bXpRQ1FJ?=
 =?utf-8?B?MFlIMjF4SkxKZXlYQlAwWTY0VGkyVzdrOWhZWHhORFdCZXhvdXpzeXd3NjR6?=
 =?utf-8?B?aVlSZUQxYnkrNzkrRWJjdzFEZ1FGQjRVMno2eGRhRWhxa1hGdlFqWDRsVHpu?=
 =?utf-8?B?eGZNSDhXLy96MmUwc2h4WTRuRVk1R2Y4bkpCcVRSNEMxQy95cW5qaXNnVm9q?=
 =?utf-8?B?WVExajZNRVBQcWtyb2w1UmdjSXdEQWlKSzlrNXdjU0IrbHhlZ2tUZHIxeW9U?=
 =?utf-8?B?ZFZqY1RwK0NkTitwSW9pUjlHenJ4bWhLQm9sUVc2MkdPYy9iSE5iYjFFa3ZW?=
 =?utf-8?B?V0d1QmtyQ0RuczFmem55MzQyNHR3MGdsY1lsaHRXcGcrek9jbm1jZ3E3OWs2?=
 =?utf-8?B?UFJ4R2xFNTcyUzQxZmY2THVHa3dVL3FEa04vVkRvekVQNVFLbk9hd05LV3RK?=
 =?utf-8?B?WjRtcnlCdGJSRVpKNW9YYlFWRDNaQ09uZU5GWjl1NGJiU01GNWt3RzRSSlFP?=
 =?utf-8?B?czNveG5iTlRHMVZWWEFSTjdlTEprQjlBRkdubC9XeHBOMlBUMUhzVzR4b3Av?=
 =?utf-8?B?TVVuS0dkWXFxYXFoc29PNFBkZ2d5SXo1a1Q0MFlvVUtCR0VWK2tySkxKUFpZ?=
 =?utf-8?B?eE9qU3pYdG1wR2dqenNUaTFZcUlUU1FoWUpaVGdtZElPTFVFTEwwTmYxanZX?=
 =?utf-8?B?TWpaTGlhckN2dE9TR1V3TWdhR2lBN2Q0OTB4Mmh1WnlzQXNUei9sRi9Pd293?=
 =?utf-8?B?V3RZcmQzbjB0dWV5ekYzOERXRDZHZ1J6VHQzYk5HWmZra2JSdThnSEl2bnFL?=
 =?utf-8?Q?6gLYYcBPcNJmJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U24wdk0zNVBYdHZDL1hKKzNQbTdxdk8vem9UVXZISS9GQlptc1Rpb0RrZlNx?=
 =?utf-8?B?eldOem1kdzVCcGRCL1htUnhXWk9HdHloZW1XQVh5cVRscnBoU29vYWNGVEdZ?=
 =?utf-8?B?VnVsRnQ0T0d0ek1qLzhoUStITWczS0Vua3EzQUdZZjFoSEowUERhSzRFSjIw?=
 =?utf-8?B?Wm9aOTlyTCtuWlpRSXhnRWdOOVhrSFdIdWFQWUtSakRzMGV5R0gveHVLcHFx?=
 =?utf-8?B?bFZmbTNtelZhbGluNmMwZ1B3TTNreTA3azV4ZXVVNjd2SVRWZzFScVBNMWZl?=
 =?utf-8?B?R2c0UzkvWmxzVStBQWxaTmJoNlFjWDk1b2ZTYmdtdlNwa2ZnYzdKRDlpR2xj?=
 =?utf-8?B?bzZST2pGdkhuTkhBVTNXNDBOVzM5TkViZThyYXV0clltWjVsRTdaMEZvN3NL?=
 =?utf-8?B?VVYwbTBDSWhNTGh6VFcxS3hXRUc3V1hSaEhBQkFFREtyU3NYWEoraGF6d0xC?=
 =?utf-8?B?bUJGUTdFTnJmb3FiSDdsSkVmTjM1N1V6cVJocllwVTB3OFR5a1FSZWUwQmN3?=
 =?utf-8?B?OSsvRmRtVTZQeGVqcEVmTzhMQlBhQnU2RkRjVHJHMUNzbGxieExYYUVtUEpI?=
 =?utf-8?B?LzVOZUMvakEyUFRYUmtDT3hkRFdWTUd4K1dQTXlhMU1YTE9oOGx0MFI4bU4v?=
 =?utf-8?B?bkZ2ZG80NElwQUhsSFBFeEtORlJWZXBTb1BvQjByNnlnYVBPM1NGMzdKQytL?=
 =?utf-8?B?My9HVzRJdFhxZkh0OUdRdFI0UjcveDJ4REdabzJUR2UrT3ZLaW5pZ1pTYjJk?=
 =?utf-8?B?OUtoM3pnRjFkRWswMnViN2lGVVhHbHIxRDBJbnFHMWZLOTVsNjZMU2lUNkxP?=
 =?utf-8?B?UllGeDZmWjNjSVJsNWlxZ1BrTS9tNXZhOXFwRGNGM0hEc0gvZmdWdzZjcEU2?=
 =?utf-8?B?YjI1dVN2czBGVWlDT2hyWC9ZVDRpMmhHRnBNR0tlczk3YzBPcm1QSGpabXZL?=
 =?utf-8?B?bVpadnJpRTM3Q0cxVzkya2h0WW12REs0ZjFTREdOdmhRcjdoRmZNVGVMcnQw?=
 =?utf-8?B?UFgrNU1PVlE0ME50MDl2N1JHYmdkUGszQ1J0akxaL3AvTWVCQmU5aXJPOFJw?=
 =?utf-8?B?a0NxdGdQMU1PTlVKNk5HZzU4L2pLcXhSbzllUUxJUE9FV0Q1amNjakkvdkdy?=
 =?utf-8?B?eXE2MlQwU2ZKaHJ0c05BbDdOUzlGZ1owN0h5a1lJM1lrRDZJU0FoUTRyTllk?=
 =?utf-8?B?SkZsaDlJWVdzY21Yc3BsNXNRUUsrdGdBZlhnNzJta04zUGpLYjROWjBOMDJW?=
 =?utf-8?B?SElLUi9vS3ZDL1A1akJYdXowM3RGZ3VSNzlOSXQxSnpHUlI0bERPUmkvRlZa?=
 =?utf-8?B?aGY5aTloY05XRU9WcGNQT0E3cE03NndEV0FmdGpoUElEQzdJbmhERklTQytv?=
 =?utf-8?B?dE5zSHo4MHdZZlJ2SHNDVU5WakxLRXEvWHpWdko4TDJKVjFWZjY5dnFsVk03?=
 =?utf-8?B?T3BFS2pTU2gybGh1TkxJS3BWdWtoN1pLRGpUMTl0RjdUY1A1U0pscXkrRDIv?=
 =?utf-8?B?M05nM3YxVFF4VTgwWndFKzZyaHBxRFdlZnNWUzRPUzVWbW12Z0ZKM0FmeWJk?=
 =?utf-8?B?U0RPS1JnNVQvZFRqeGlIcEdaN3Eyb2NNQVgySGtzMjhXU3NVUEpxMTM4emFX?=
 =?utf-8?B?TW5qODVEbVlEeFlWMzBjaEIzS3dkMGdBbUdTdi93WnMzUm5Relp0WTJ4Zmdi?=
 =?utf-8?B?Vy9YL2JxaUc2ZG9reWJKcEtEVVBKL2xHQmxxS3VxL2JBaFZHR0UrL24ySGtN?=
 =?utf-8?B?a0V0a2lRKzFPMHRKZ2w0bXJrVEM5U2I3NkpBdGRvYnFiU3VVNnpLSDR1RCsy?=
 =?utf-8?B?dnZ1bUZWSHNQWXZEUlJESHhiOCtjZHc4aGhNaUc4WmJGamF5UkNBT0hwbnZP?=
 =?utf-8?B?a2k5dnQ0bUpENWY4VW1la2xLMFZ4MXNTY29kdGtOMldpNGZvWEhORTlTdVg4?=
 =?utf-8?B?YjkwbGFzdlk2Zzd0MmREM3puWEFEYmVreTAvcFZIekxEUk9hdlVrSVZkelFw?=
 =?utf-8?B?d1FUS1pGTGpqMnNIbFk1bXZ0ZHViV3hMT3dhYWFKaktuc05sYVRlQ3FzK1Ft?=
 =?utf-8?B?UWNGRVVLWkZiOFp3V3M2WjI4bmk0THdmRVdpNzR3OWVFUnlaOWFtbmFicG02?=
 =?utf-8?B?cHRuR095MzJzYzVBakx3SmNkSWtiVjNGR0FkTmlEWFNDYWNJUE5INE1KSGov?=
 =?utf-8?B?TWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ebb5465c-734d-4d7b-b1c7-08dd7dbed853
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 14:47:58.5420
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vxOJjenEhbVGvXnRcuN54WcDdRAmszesFqzOX8U3jiENE11Eme1oEzzM6pooLHU2esLs8AUHnuWEBtJe4oEgrpdoiXlhke7NI1J6uobbQRI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5174
X-OriginatorOrg: intel.com

Hi Shaopeng and Babu,

On 4/17/25 5:18 AM, Shaopeng Tan (Fujitsu) wrote:
> Hello,
> 
> I ran tools/tests/selftests/resctrl with the following patches on AMD EPYC 9454P 48-Core Processor, it looks good.

Thank you!

> 
> https://lore.kernel.org/lkml/96d276c11e69cfb1e29d50a12c8043555c06b404.1718144237.git.babu.moger@amd.com/#r

It is strange that you needed to add this since it can be found in v6.10 and up.

> https://lore.kernel.org/lkml/cover.1717626661.git.babu.moger@amd.com/#r

Babu, is this still something that you want to see upstream?

Reinette

