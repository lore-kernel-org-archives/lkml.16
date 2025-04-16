Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098C518E377
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 00:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744763156; cv=fail; b=FFp5IZIjX8Iqk9PencOTdaPo4bi/hzPSyLoR41xhyJN1u5kTUaxKfORxHK49Ub/WCTqwncSFWxGyA7p11wnZCvk3o3gMknsXdaImKEVwW7j+FFWXS1Pgcfy8+uklGH5Ce88ZgjCrQbZwEqs7t5YWieuzRTND/pIkY/dhodRZ0jc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744763156; c=relaxed/simple;
	bh=/fHoMzgybxfaVVoFJQoQwvVbmKAX6tX19T0T5QbUaf0=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VijmVKKju1bWplodGd0QFDYC7ClcVD8g3a9z9lIKBRABb3kUf69/X/qyfUajfrBDfA10hDtpJox8q4WqVLo2sSYeXeUHJHUWJl61VVEGMhaUtshjLPO3N02Cawmc53Q8ksFu4mAr17dSsfkDqrp6ZATJgLi6CKEDnY0oWVzq8uI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N97paSEf; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N97paSEf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744763154; x=1776299154;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=/fHoMzgybxfaVVoFJQoQwvVbmKAX6tX19T0T5QbUaf0=;
  b=N97paSEfaC+iaI67IbwRGeTcHrgn5TSmlCiEBjD5sJLasi4W+HCzLdza
   uXrbVOP0T/MKFEXDiqlLiDyls2BmefTgmXeaGd4xSDbZh3pzQqjEXCTUk
   nFpyczcbcf/RIDOzmyI/2jptoqdiRUDBy0UIU6tKc7ObwmcK5R4ZFMpTN
   /TRXMwvCgTQJ0au/puYGT1bYZx2XorpiyMD8397c+50joYLhj7w2A7ASy
   l4hJ8ROFYMuAor7hex0iH2iV6YyW3W4blgZTcOQnfnW46koVrSzUd1c6E
   hMCwmloSZiNycmuXXRUBzlNr3W8WqrvKLFopAgZFZU+Hm3GT1w/4n7gXM
   w==;
X-CSE-ConnectionGUID: 1bYQZ4v1Sn+n7rq+LG42+w==
X-CSE-MsgGUID: oqgtEXTISmuNIY3I2707ag==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="46384466"
X-IronPort-AV: E=Sophos;i="6.15,214,1739865600"; 
   d="scan'208";a="46384466"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 17:25:52 -0700
X-CSE-ConnectionGUID: d3UWf6euSuiiBbVcqh3gRA==
X-CSE-MsgGUID: qT87uktuTaG1UeJ644uNHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,214,1739865600"; 
   d="scan'208";a="135257493"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 17:25:52 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 15 Apr 2025 17:25:51 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 15 Apr 2025 17:25:51 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 15 Apr 2025 17:25:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pGSjsJF4FJ/yVhXF3MrHx7tXs8q08h8y7v+UWi09kix39E7YFDYFMgHtij9jZFCtmoefJKriNN5mozHVhndxkq1tkeOCUEBMIBw+pCi1lFisTBYCQqTEHGaOduwyxXyrPTyHOjm8uOA6d1x0/TQiDuaA0YwO0Ta4XgzEbZGbghY5Bp+obj/cNVMm7hzFD0CkFm8rzKAB5ZRPVUbaN3CvCOFC04sjIaH8LoJ71xWVz/kLN2V+JCjtYZJ9lVbgiGtJjwpLTatB8KsqTD23h3XQaRzLF75pp96igvOI6Y10mH0pyetMeIzgToml8j8mkU+5MtBZ08AWReUObQaAO3PehA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kZ+QdNfj7QdpXAdR9uCHEtPwCXFDIu778ddTzkFtzM8=;
 b=wW+p7XxtbO2N3BtkjuK8gLPSAfrU72QF/HFerWmk/xWQ2ojF3b7evTkG8r+jrhmBpFI+hB2eV03681sPvmLOCQQ6ZtGZ6ZxC1py9diKLxslgr/UH0O+wzcahPAcpVUkkrhvBeGryssk++8WF58xBECfN9Kx7q8WneMmSopiiuIXQr4XB5wwFtSg5nksRzACTbetIEIl7ea7glG6OGBpIZcO1F0mWFtFBsStzeNEwFPkyF6lNcpeTX/1gHl+Cpj0mXxuf8HbLCC2GwPSTrjycEk5B3xkfGdzvQI/13LI6ssJ/kkf7y672C7KcTmw9s/Azqlgj4/z7H773kNTSVFRILw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by PH8PR11MB8061.namprd11.prod.outlook.com (2603:10b6:510:250::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Wed, 16 Apr
 2025 00:25:33 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8632.030; Wed, 16 Apr 2025
 00:25:33 +0000
Message-ID: <81a54d21-40af-438e-8139-322597a7506e@intel.com>
Date: Tue, 15 Apr 2025 17:25:31 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 04/21] x86/resctrl: resctrl_exit() teardown resctrl but
 leave the mount point
To: James Morse <james.morse@arm.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, H Peter Anvin <hpa@zytor.com>, Babu Moger
	<Babu.Moger@amd.com>, <shameerali.kolothum.thodi@huawei.com>, "D Scott
 Phillips OS" <scott@os.amperecomputing.com>, <carl@os.amperecomputing.com>,
	<lcherian@marvell.com>, <bobo.shaobowang@huawei.com>,
	<tan.shaopeng@fujitsu.com>, <baolin.wang@linux.alibaba.com>, Jamie Iles
	<quic_jiles@quicinc.com>, Xin Hao <xhao@linux.alibaba.com>,
	<peternewman@google.com>, <dfustini@baylibre.com>, <amitsinght@marvell.com>,
	David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
	"Dave Martin" <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>, Shanker
 Donthineni <sdonthineni@nvidia.com>, <fenghuay@nvidia.com>, Shaopeng Tan
	<tan.shaopeng@jp.fujitsu.com>, Tony Luck <tony.luck@intel.com>
References: <20250411164229.23413-1-james.morse@arm.com>
 <20250411164229.23413-5-james.morse@arm.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <20250411164229.23413-5-james.morse@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0243.namprd03.prod.outlook.com
 (2603:10b6:303:b4::8) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|PH8PR11MB8061:EE_
X-MS-Office365-Filtering-Correlation-Id: 6105454a-df52-4098-de57-08dd7c7d338b
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eVJjMEdjbkVveVQrTWRnYzJmRmc5em1heXBKbnZjYzFsNkljMmE5dG8yWWRj?=
 =?utf-8?B?QUYrQmVhUnhjWEVaWWZjMk9jQ3BQVUVyMi9pWFEzU3VQWm5YVzFxUGo1Uzc2?=
 =?utf-8?B?RWdSeHdYbFBXSkN6UEJFRzZFUEpCVjIzM003Um5iUEtxc3ZVK0hQVEd4MG9M?=
 =?utf-8?B?VmhUYlByTG81SldWMlVkN3p1S2JwVmxxZ1lxSXZDYkZZS3R0UkFodGhkeU01?=
 =?utf-8?B?SkRJN044QUFlcjllaloxRXhyd05uR01BcUJQcFRRdGZ5akVHQnRaRU9zMm1M?=
 =?utf-8?B?ZGlmSm9NUkhrQUFaZ0FCV2pCSHlDZTZ3a3BPSHNlRmUrY0NlYVkwSXlWbm4v?=
 =?utf-8?B?cURLWmlPeHlSdGFsTjlBdmsxRXpRRVhya0dOYUVnb01OWEFQZHE3RzFHQ2tw?=
 =?utf-8?B?YVFJTWswRnFZN2VYb0tTN2J6ZVFRWWViYjBuTkRPUGpKL3hYSGNNLy9OaGF6?=
 =?utf-8?B?OVY0YXJDcmlYVDQxdEl0Sm5IWmxDajlXNmRSTld0ZXBaZU5rMHJJMWVuNGR1?=
 =?utf-8?B?Z1B4bEV3V014Y2EyTThNV1kyWGJBRWJvTktBOHdpRUVseVhRc0dkeTE5NEdI?=
 =?utf-8?B?Zlo5bG5xZUxwODBsWXF3b1A2bzM5VTVZVTJJU1A1emhlTmRUeVlsdStIOVNT?=
 =?utf-8?B?TWpYT3R6Q25tTDJXNGdPVkhUbGcxNG9aNHA2STNQRHJlQXcwbW5ta0JrR0FK?=
 =?utf-8?B?aUd4Z013STd6WmttODExVVRlQWZNaDFzRENpdUFQTkprbFdPbnIyV0ZJeVlZ?=
 =?utf-8?B?ZVV3cUsrNzAzakphTmM0YVI2L2FzY0VkMFVkekVSNDM4dEljWkpGZmlKNExN?=
 =?utf-8?B?bmM5azIwbXVPNnZRS0l3dU1sRkpzOGZWOVJjUG9Oek9rRmN1akpiU0tJcEpi?=
 =?utf-8?B?Z2M1OTFtYUFvR01KWTBtQklnbi9wRFh6bG1QK2pGWTRuU1RjZ0JBVUlxclRD?=
 =?utf-8?B?QmFrZEhndWpEWEpqdks5WnhyeE01RFhGSXRuRVpRNDdwTkhXQXhLcmVzQ2hy?=
 =?utf-8?B?QW1RSmp1dHV5eGRrM014bmcvR2hheWwyRUJWblBPaXlRNUc5akRyWUVqeVpo?=
 =?utf-8?B?UUMxclBBc0x0YWREdkJTYXpVYXd0WDJJL0E5R0MxNmZCbWJhRUJ6bGJseHcw?=
 =?utf-8?B?Y1JFZW54QSs1dCtxV2tjeWRDdGRyUTcyK3lLd0JJdy9PUEN1R1FlWDVqMlpY?=
 =?utf-8?B?Qk0ra3BYM3NUcUI3YlNRM3RWZVBMN3UxbHJ0UUUxU2NOSWhLMzdOMndXZEtj?=
 =?utf-8?B?bDlFWlVBN3dmK2lHVTBHOUZPNEYxbWZiVStaMUFFeStXbTZGWExPV3hEcWJC?=
 =?utf-8?B?bHU0OHlGOVRweWdLL21DelNQWmE0TlVWTDNmMFRYSFBSZjlOSDVlaGF4dmo4?=
 =?utf-8?B?dzNQdmpYTkFyTXE2YVMxbDBFVEg4SWZUcE84bkowcXZ1d2ZHTGIvbkpRY3U1?=
 =?utf-8?B?V1lUdkZqdnFXQmFUL0ZsSE1SeVdOK1pkTU1pUzUyN29GbTYrSWtXZ1lLc2Ni?=
 =?utf-8?B?V1BUZlc0cVJaRnFLaHl1NElXNE1vanpmNjZnNlUydTQwVjhjR0hYN2NOcXBE?=
 =?utf-8?B?VjdrcUFkT1paN1dacTN0SW4vbTBFWTdKNE5IdEZQU1BPT0RacG1QRUsrSzkw?=
 =?utf-8?B?MTIxUmZpYTk0R0xlSTU3dGg4cTEyLzBEWncwYXVNcXdzVGlaL0UrWUluM28z?=
 =?utf-8?B?Ty82eGZydWVvMTRCQk9KRTZuYnFDbjhzZ1BsWnFSOFVYRTRxTFZiTXVkS2FT?=
 =?utf-8?B?NSsrbThVdGxhTTF2bWJraTc0NGgyS09QODduT3JQaWZlL0d3TFRHd1ZRZnd1?=
 =?utf-8?B?Ly9WVG1TUjRZY3RMcXlYb1dnSGNUSDdFUXBFa2NRZzNUL0NQSWFsdHNIZDJ4?=
 =?utf-8?B?ZnRaMlkybWVLQVhGVXR5VTJ2WlhYcWNPMk1GdzFBUFZFZVJXYW9LVjM0ckh2?=
 =?utf-8?Q?rL0AqyfSwgM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UU95Sm1rZ0FkWWJzbzR2cTdocm9XemR5S1NuekVoOVhkMFRxZ05YblkrdFRt?=
 =?utf-8?B?Umk4ZjFGZklJUEVWRnJ1VUZDK3d1Z1VvQ0xHVHVGblZXL29LbkVTR05sQWUv?=
 =?utf-8?B?OEg3T0ovdjBmREtyZElBbGZ2aE4vQ3o4bnpRb0ppUEtGQi80NHE2NTViaEJ0?=
 =?utf-8?B?QWY0b25GZnplVnovWDJXUHREcExmWEw2bHRNblc2eVdDN3ltY3N6bkdTelhE?=
 =?utf-8?B?VHI1OXNVMmdRQlFxajZ1UzlwNlozc2xrLzFWQkFiaFhpMk1VUTZsdlM0K2My?=
 =?utf-8?B?b1VBN1VYalVUUUlvMHpNQVJxcHFQblJiUGI4OFdQTlQyMDBueU8xWllVa0FV?=
 =?utf-8?B?UHpzaXlFKzB3MWlrMXN6UGVDVnVRZk13SGp0R0tOVmQwc2tHK2M3Mks3TExo?=
 =?utf-8?B?ajltU1E5VzN6ZkVna1UrZWxrUjBJM2FmRndQaGVyNDAxZjVSRXBPSmJINGFo?=
 =?utf-8?B?bTdNeEc0NEsvZUl2SzloQVdqZXlPRmkxS3lhVkdmWXJxMjl0Q05oa3dYY3NP?=
 =?utf-8?B?QjV0SzdQc2hTanByNUtnbTVOVkppMDlEWEF5anllTE41WW9vY1Y1bVcyUkli?=
 =?utf-8?B?bFRhL1NpVVVpRFFtVHJZdSs4UW5sVVAveXlhVlJmaXN2Tks4OU9KRXlYOU0r?=
 =?utf-8?B?cmIrY2wzOUVhUEpzNWVsK2dCaktiM0c4WGNRbVkwMkNycndhR29xVkxDcnFN?=
 =?utf-8?B?Ym1FbDJxNzN6dC9hRlR1M1h3eC9pT0FCYWlpQ3lhRnIrSTRlUXFpR1ZkNStJ?=
 =?utf-8?B?RmZTdmpPS3owNS8yZ0FveWJ5YTloZkRtN2tMUHVIV1JwbFIydWg5U2FwYnNa?=
 =?utf-8?B?Qk93NFlOZ0ZzTzJSeHIrcnlQS3YxOEdNRnFldC9CRTg4SWRqVmgxTlAwU2JP?=
 =?utf-8?B?bE9hZWkvNVlPT3ZaSjFiYit3b3ErYTZIalZSTStLZkRtVUgzOHlhYnRkRmpJ?=
 =?utf-8?B?SWU4eVFPTkQ3VmRNSUdUeFdxeEYrNVJ5bVk3eHgyRVJNc2Q0U1ZIc1A1K1gz?=
 =?utf-8?B?UUU5em0xbGZIaE9veXFoYWg0akRreXFyUU9Gb1EwNzhHSks2MlJlZXFCa1FT?=
 =?utf-8?B?K0c3dXVjbXN1VFVtWDg5RVdvdDJXMDYvc1BvdTF1elNycE1ONDBoY0ZDakd4?=
 =?utf-8?B?eG9rQWNKdWZ4cHphaTBzOUI4d0h4d1d1RSt3QVJJYlV3TUF1TlRLcnpHb242?=
 =?utf-8?B?a2FiVWhXQVd3bmswSWEwN2JHTjBtdEMyb3BjbkNnbml0ZTB0bXZCUVpYb3J0?=
 =?utf-8?B?NldlYzMxMFQxRkhib0wrY1BQSHRSTUgyOXc0TzJvbHZiK04wWkhwaHl2Mm04?=
 =?utf-8?B?MS9mVE4zSmkxNW1KejBGSHJuR1Awc0NiL0J2Q1ZTNW42aWpxOHFEWFl1QzZ3?=
 =?utf-8?B?Z0ZxYVRETWhMZE1YVllJanFjc3dadnZjaWpBU2piOGpBcEg3MU5jdkdoN2Nu?=
 =?utf-8?B?YXB2Rk1uTHRzT1BpVjN1aXl2UUJuU0RUNHNZUXYxMnEwb2txQTQ5aEFMT2Vy?=
 =?utf-8?B?NDRkVCtnY0ZvU0FuQytWUmV0K0ROUXVZMWhlZU1zanFjY01SMjFKTGR5RExu?=
 =?utf-8?B?c3B5dC9iazJOL0t3ZEkrMWRaRVAzOG00ZzUzRHYzRkh3TUhydTg4Rm5UclBt?=
 =?utf-8?B?YUlWdE15WlVrTCtkR01GVHFNMlV4ODNZVzYzK2diNy9zVXVnYzdOZUVOMFU0?=
 =?utf-8?B?djBHemkrb3VHOWpGVnF3bnlpWGU3QVBvaHBnK0dKRklHa0hWTjQrbFRIMWhI?=
 =?utf-8?B?SDBGQkJXMExYSFlRMng5VHlUVnRBdStJSVp0eWZ2ZTNRWXgwdldiakhSWWNF?=
 =?utf-8?B?TVViSGlnTkcxeW1wc2E4SDJXUXl0QVU4eGpQeWlmUFBlTjZoT2gvbDR6YWsy?=
 =?utf-8?B?eDZwQ1UvVWZaVStTNTVlWStnVnhKYVNJcXhGUTBMUU8waXFKSHYvTHBSbSs5?=
 =?utf-8?B?dm5HM0MwdUtTa3BjTzB3YzRWc3Z3bm04ZlgxT2VJYXUvZW5ibC91ZVFXWkhJ?=
 =?utf-8?B?aTBSV2RZMUNqYnVHQ1MxSkdVeTRsREQwWTREbjNUWVlGakNyVmR3dGp4S0VO?=
 =?utf-8?B?Y2NxKzlrZ21oeEtnaE95akFQckZlSVNPeUdDQkN5WEZndmwwNDlhckl3cnpl?=
 =?utf-8?B?RjZZSDJqVTk3WklQUXpUNjJxSm40UmJMWW9yV2VjVjJQditRSTZoMWFhR05a?=
 =?utf-8?B?K1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6105454a-df52-4098-de57-08dd7c7d338b
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 00:25:33.6572
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IOAyZA/En7vx4MhQWCn2kjaPm8SWTzPIT1Vvw7tLiAkLsjNLr0HjiblZaJ4BnSCzoEyUnsK9khAZJRCQP6RBJTC7SBna+c0YoMu4xl/uA0k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8061
X-OriginatorOrg: intel.com

Hi James,

On 4/11/25 9:42 AM, James Morse wrote:
> resctrl_exit() was intended for use when the 'resctrl' module was unloaded.
> resctrl can't be built as a module, and the kernfs helpers are not exported
> so this is unlikely to change. MPAM has an error interrupt which indicates
> the MPAM driver has gone haywire. Should this occur tasks could run with
> the wrong control values, leading to bad performance for important tasks.
> In this scenario the MPAM driver will reset the hardware, but it needs
> a way to tell resctrl that no further configuration should be attempted.
> 
> In particular, moving tasks between control or monitor groups does not
> interact with the architecture code, so there is no opportunity for the
> arch code to indicate that the hardware is no-longer functioning.
> 
> Using resctrl_exit() for this leaves the system in a funny state as
> resctrl is still mounted, but cannot be un-mounted because the sysfs
> directory that is typically used has been removed. Dave Martin suggests
> this may cause systemd trouble in the future as not all filesystems
> can be unmounted.
> 
> Add calls to remove all the files and directories in resctrl, and
> remove the sysfs_remove_mount_point() call that leaves the system
> in a funny state. When triggered, this causes all the resctrl files
> to disappear. resctrl can be unmounted, but not mounted again.
> 

The caveat here is that resctrl pretends to be mounted (resctrl_mounted == true)
but there is nothing there. The undocumented part of this is that for this
to work resctrl fs depends (a lot) on the architecture's callbacks to know
if they are being called after a resctrl_exit() call so that they return data
that will direct resctrl fs behavior to safest exit for those
resctrl fs flows that are still possible after a resctrl_exit(). Not ideal
layering.

I understand from a previous comment [1] that one of the Arm "tricks" is to
offline all domains. This seems to be a good "catch all" to ensure that at least
current flows of concern are not running anymore. Considering this,
what if there is a new resctrl_error_exit() that does something like below?

	void resctrl_error_exit(void)
	{
		mutex_lock(&rdtgroup_mutex);
		WARN_ON_ONCE(resctrl_new_function_returns_true_if_any_resource_has_a_control_or_monitor_domain());
		resctrl_fs_teardown();
		mutex_unlock(&rdtgroup_mutex);
		resctrl_exit();
	}

I do not see this as requiring anything new from architecture but instead
making what Arm already does a requirement and keeping existing behavior?

This leaves proc_resctrl_show() that relies on resctrl_mounted but as I see
the resctrl_fs_cleanup() will remove all resource groups that should result
in the output being as it will be if resctrl is not mounted. No dependence
on architecture callbacks returning resctrl_exit() aware data here.


> Signed-off-by: James Morse <james.morse@arm.com>
> Tested-by: Carl Worth <carl@os.amperecomputing.com> # arm64
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Tested-by: Peter Newman <peternewman@google.com>
> Tested-by: Amit Singh Tomar <amitsinght@marvell.com> # arm64
> Tested-by: Shanker Donthineni <sdonthineni@nvidia.com> # arm64
> Tested-by: Babu Moger <babu.moger@amd.com>
> Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Reviewed-by: Tony Luck <tony.luck@intel.com>
> ---

...

> ---
>  arch/x86/kernel/cpu/resctrl/rdtgroup.c | 42 +++++++++++++++++++++-----
>  1 file changed, 35 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> index fdf2616c7ca0..3f9c37637d7e 100644
> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> @@ -3074,6 +3074,22 @@ static void rmdir_all_sub(void)
>  	kernfs_remove(kn_mondata);
>  }
>  
> +static void resctrl_fs_teardown(void)
> +{
> +	lockdep_assert_held(&rdtgroup_mutex);
> +
> +	/* Cleared by rdtgroup_destroy_root() */
> +	if (!rdtgroup_default.kn)
> +		return;
> +
> +	rmdir_all_sub();
> +	rdt_pseudo_lock_release();
> +	rdtgroup_default.mode = RDT_MODE_SHAREABLE;
> +	closid_exit();
> +	schemata_list_destroy();
> +	rdtgroup_destroy_root();
> +}
> +
>  static void rdt_kill_sb(struct super_block *sb)
>  {
>  	struct rdt_resource *r;
> @@ -3087,12 +3103,7 @@ static void rdt_kill_sb(struct super_block *sb)
>  	for_each_alloc_capable_rdt_resource(r)
>  		resctrl_arch_reset_all_ctrls(r);
>  
> -	rmdir_all_sub();
> -	rdt_pseudo_lock_release();
> -	rdtgroup_default.mode = RDT_MODE_SHAREABLE;
> -	closid_exit();
> -	schemata_list_destroy();
> -	rdtgroup_destroy_root();
> +	resctrl_fs_teardown();
>  	if (resctrl_arch_alloc_capable())
>  		resctrl_arch_disable_alloc();
>  	if (resctrl_arch_mon_capable())
> @@ -4123,6 +4134,8 @@ static int rdtgroup_setup_root(struct rdt_fs_context *ctx)
>  
>  static void rdtgroup_destroy_root(void)
>  {
> +	lockdep_assert_held(&rdtgroup_mutex);
> +
>  	kernfs_destroy_root(rdt_root);
>  	rdtgroup_default.kn = NULL;
>  }
> @@ -4416,11 +4429,26 @@ int __init resctrl_init(void)
>  	return ret;
>  }
>  
> +/**
> + * resctrl_exit() - Remove the resctrl filesystem and free resources.
> + *
> + * Called by the architecture code in response to a fatal error.
> + * Resctrl files and structures are removed from kernfs to prevent further
> + * configuration.

Please write with imperative tone. For example, "Remove resctrl files and structures ..."

> + */
>  void __exit resctrl_exit(void)
>  {
> +	mutex_lock(&rdtgroup_mutex);
> +	resctrl_fs_teardown();
> +	mutex_unlock(&rdtgroup_mutex);
> +
>  	debugfs_remove_recursive(debugfs_resctrl);

Is it possible for the fatal error handling to trigger multiple calls here?
To protect against multiple calls causing issues debugfs_resctrl can be set to NULL here.

>  	unregister_filesystem(&rdt_fs_type);

unregister_filesystem() seems to handle an already-unregistered filesystem.

> -	sysfs_remove_mount_point(fs_kobj, "resctrl");
> +
> +	/*
> +	 * The sysfs mount point added by resctrl_init() is not removed so that
> +	 * it can be used to umount resctrl.
> +	 */

(needs imperative)

>  
>  	resctrl_mon_resource_exit();
>  }

Reinette


[1] https://lore.kernel.org/lkml/5ab63ad9-f7f5-4d3d-b0cb-fd229aa269db@arm.com/
