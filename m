Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7785C1FF1B0
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 17:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744824165; cv=fail; b=G1frD5Kwwf9m/d7XDe9SWjbP8/fNM01JJJ12CAQnFm0OOV4VvigjjXis4PBBNbj/40z4n7Oi8gG29YzHm1M6FrgDa7g47CAk68ldW+8RU83eDxs21M0Rg7XZkTmYhRBEENXdK5HSLv6U4uqtbUHRev6X1YUrbjLr8VU3Rgu6gLw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744824165; c=relaxed/simple;
	bh=tb6y00ZmwZQWvW0DIXyxqtD/BpBnu3281SCAqOjhWuA=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=r4XB/CDoJXhJ2Ec6B6wFOvRGZNo21hYUU0iGayzXrogF3XMXt8gVKrikB/ZnhiEVVkQDe0ZmQt/lIVYijqJulgeyV4PlkV2eVG3cZxsCWlvvaptua4Tq8C7Uer7QU78VPLw9j1HvLmJPZ4b8ntBq/udTWlb3anSh5scXkxEbMqM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hkurSsrA; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hkurSsrA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744824164; x=1776360164;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=tb6y00ZmwZQWvW0DIXyxqtD/BpBnu3281SCAqOjhWuA=;
  b=hkurSsrA35U0DP+nqzOl/VqrlL5G70/UhfGqzRXIKEmr1k2sIABxycty
   MPkomKQ+DjfnioT3sOYHVAq/S2z+U0WNEU9nlXl4WJiofUyrOSnswlqPU
   lhBX9XFe/o0NlR/imkKb4Kf7XVxp7fIIm5sXMg1GTSTPaP6pma2u4wc7b
   Xl7fQPt5k/F7aCKXI85PIgql/yp18t9bEbQWPOZDJaAj2BjdA12Ts3yXH
   UrXaoizk9AvJx9fTT0UJr9+QahXhvIcRTgSg9wclCq2qda2cgT5TSdPtZ
   6ietdx5zbQCcJsG1hswF7VmkA+G6QBs1KSxSILxqx9hLrz1kVUYMRP4zl
   w==;
X-CSE-ConnectionGUID: Kfcn6TypQJeuB01lfXdJ1Q==
X-CSE-MsgGUID: Hr5r8RLLR8+E1gBpb2NxPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="46308518"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="46308518"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 10:22:42 -0700
X-CSE-ConnectionGUID: 6A8A3puCSqyHqXSuc/tcxQ==
X-CSE-MsgGUID: 3g2aIa3eQg6vrmLiSeM1Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="161582096"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 10:22:42 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 16 Apr 2025 10:22:41 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 16 Apr 2025 10:22:41 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 16 Apr 2025 10:22:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GnRHTUI94sxcRdQysGc3KoIdUD5x6bJlg24xcl0MGxYKg/wnYZcYlY5NdeNsrxNH2hlfgsmJqmfqEC8OgiZ9ysj4aMTHfcslmyLy7zAGABtbwJUOJ2FMVJ2XEMxhL/wG5JiR8KF6ibHVBRNn/A6U3t8bpz5KpbCrNgzqVpcmK4aPit9ufv4D3lLr1qPcVX/Igp+6iYfVEPBGqwI5hT7tvC9hyU+WxVfqvP2pfvUvngV4qyTMLxlFeYe8ecrHDN7EDsXA80FVhSi7Gr8G0vfrrQmWy/K/dkboztpAW4DkW4vlkpEV/2nh0BCvKNPAM4GlXKjvwMqYyN6MQG0uWIjEaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mFpI0bl1kOlOPhoM2rCMvQWMs8dk8eLjmgfpNy1gEDk=;
 b=gp6ZYxV6AsDypsR5XDYkMjqB9iFFKFHTn8+3vWcPAK2ck2bTjhELKUpe5MHUn0bd96rklKm0AExTWW/ZivmLlWX60mHcHZGhuBBQJ4ihy3vyuHIRV+K5MGqoTYS0XDgRajBSd4SiGARDKKxsfYuP0ytSvgwEvY9+NoptLgvvAYV7wew4IGHmVDuMVlx9AihHajGue+VumIyh0ViSG3ODj0uDcXtss34W6MyW1IQkfdaHgEN5DLXU9CaZ7GC908zWy3F2U0pvfBPsjrluvquXbrJcWGpR9LUpZOcUqjErJs1CxAcaS5peIC8z66CRZlElPJZuB8iQyT0SFhKEnsMb8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7925.namprd11.prod.outlook.com (2603:10b6:8:f8::18) by
 CH3PR11MB8381.namprd11.prod.outlook.com (2603:10b6:610:17b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Wed, 16 Apr
 2025 17:22:36 +0000
Received: from DS0PR11MB7925.namprd11.prod.outlook.com
 ([fe80::b1ef:c95b:554d:19c9]) by DS0PR11MB7925.namprd11.prod.outlook.com
 ([fe80::b1ef:c95b:554d:19c9%4]) with mapi id 15.20.8655.022; Wed, 16 Apr 2025
 17:22:35 +0000
Message-ID: <166b29f2-a178-4d60-8f5d-218bfd7b51ac@intel.com>
Date: Wed, 16 Apr 2025 10:22:34 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] x86/microcode/intel: Support mailbox transfer
To: Chao Gao <chao.gao@intel.com>
CC: <linux-kernel@vger.kernel.org>, <x86@kernel.org>, <tglx@linutronix.de>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<colinmitchell@google.com>
References: <20250320234104.8288-1-chang.seok.bae@intel.com>
 <20250409232713.4536-1-chang.seok.bae@intel.com>
 <20250409232713.4536-6-chang.seok.bae@intel.com> <Z/+7O6pYQ8FkD+Xj@intel.com>
Content-Language: en-US
From: "Chang S. Bae" <chang.seok.bae@intel.com>
In-Reply-To: <Z/+7O6pYQ8FkD+Xj@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0071.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::16) To DS0PR11MB7925.namprd11.prod.outlook.com
 (2603:10b6:8:f8::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7925:EE_|CH3PR11MB8381:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d90ed9d-f89c-4973-0bc1-08dd7d0b479b
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UE9NaHJ1YnQ0UVVjUGxrSWlONGRKdk5HQythYzBpcVdlR25BT1d2ejMzRUtn?=
 =?utf-8?B?Q25sRzZQemZXNUhuN1RrMmVkcDRlT3Ztc29od0MzUlk3VU9RNHY0ZHhyVllQ?=
 =?utf-8?B?ZDNGakx4MGQxNXJoL1hVcVRJRlN0Z1F6K3lpSWczQ0hhMGFaNEQ1WXQwYlhs?=
 =?utf-8?B?b3B3Sk5mZnMyVGNCOVJWNkxJTURCRUdkbXhIeEhMQjUzTHRyQTUzSTdVempY?=
 =?utf-8?B?OVlvQVNYMStTenloamRhT2R2clhnZlltZ05aRFJYWUoxNHh6RXlZL3NqWGk1?=
 =?utf-8?B?R1JQQlRqWmtnZm1WOGtZOTB6VCt2SnpBclJHQjIrWVZYWkJrRkpyTXh1aXdV?=
 =?utf-8?B?MHpQMUdweXUyRVpmbVRTZ2w4WTNoSmVZaDRid3MyN3U3ZHp2VG5hd0k3S0h3?=
 =?utf-8?B?RnJsZEtXTnVXd3NHVnhJY0dkWFY3TzFSOExjVFU2dDd6L0JkT1FNUmI4blp6?=
 =?utf-8?B?RElCVVd0K2pNaXRPWVk5bWVKbDVJd0hOTVRBMURBampoOE9jUlVvZG1CMVlN?=
 =?utf-8?B?bkpkQkxIWk9mdjJ4Q0RHU3VYTW02NldvTTM1UWpVcm11aXE4ZG40NWJ6UnJP?=
 =?utf-8?B?SXREOTI2V3h6aE5jUERKT0NvZStUcnhGa2hYUHY5Q24zWkJoUk90N1JXbWsz?=
 =?utf-8?B?QkV6VEtJcmlPVUYrS0dQUER4UVRMckZ3MDVTVXVsRFRtdmlwamJBVFBhUHVO?=
 =?utf-8?B?ZEhtS1ZHS0pSbllFVGFKRnRlVktUYmhrZTRCS3UrbFhEc2psZUhiNHRiYWFa?=
 =?utf-8?B?L1puVWNITFFCSktZdnpPUVdZSTBqWU5yWGs5d2NucjJndGhQNktwQ25vYXYw?=
 =?utf-8?B?aHFBbHdIdTU2bHRaejNIclFhNmxENTdIWDRnQTllR0RpdUxzSnZKemhNczJi?=
 =?utf-8?B?TVdVd2lYSHhUUE1yVjBQKzZHU0taeWdRN25sanRRaUIvaDNoNk9LV0pqVWJK?=
 =?utf-8?B?YzVvc1FNcTFDb1VJcTA3VSs5aUxZaVNKU2Qzb0VBL0ttb24vZXFzRC8xSWVZ?=
 =?utf-8?B?a3o5WWw3T0I2RE5ibzdud0NIL0JFbkgvTkE3WUROcDlSZFlRS1U4ODZLUDM1?=
 =?utf-8?B?S0FlTFY3WnF2ajk5Wkh6VW9QVXJPTGF3NHZpdERqa085eUdRUGVvQTR3ZzZC?=
 =?utf-8?B?NEVqelNIRXZ4TE1nRjVBMm4yQlBWNGF5VHlob1RQRXR6Snp3MXErNS9rSFBC?=
 =?utf-8?B?aDErV2JkNC9HeFFoRFZ6eCttTk5LaUoxWWo2blgyamlMemN0RjNucUhiTDE5?=
 =?utf-8?B?eHJLOG8wdUhSYTlhNUxWb1crYXZtSm5QUENFc1JhaW1rMzJQVFlQT1ZjSm1S?=
 =?utf-8?B?eTBoM1FlTUpTRUhMd2pDOCtSWlJKVWFLYzhBZklINDNxTnZHdlBsOGcvK003?=
 =?utf-8?B?d3VPL2ppZkNOTzExamR0eHVIeGRERkw1SG9lc1p2eFNPQnhTMkhjSktoSXhs?=
 =?utf-8?B?V2dmWXgrU2t0MWdhR3p2dHhlTm44WlpPTEswRkFUcGlhTVg3bTU2TytCVGh1?=
 =?utf-8?B?eGN2VElqRjBnMFV5OHhVV2g3dy9JMEFmM2VVeXVEYXhnR1I0SGp2aXV2V1dY?=
 =?utf-8?B?UjJaOEMyUXVCUVdzTmlsUW5PbkxaSk9KMWdQV3VBbkhnVVE2QmtkSjZ6VEM0?=
 =?utf-8?B?WlJpK1ZhOWk4cTBwc0Z4OGE5SXVuVlM0K01BQ0tJaXljSzVzNVd1dUwrUTg0?=
 =?utf-8?B?aDlVaFV3Tk1sOG1FNnJOQ0hYRHpWOVdaNXJWdUhmNzRkbDI5QnlSS2NrTFNS?=
 =?utf-8?B?VThmYVhnZXFiYXpBY1dWbm9uY1p2S3lQSElHdzdPUWVFV1dsU1V2a2JVd1pu?=
 =?utf-8?B?c3JFMzh0d1c0RWttUEdPMVIxZUVOTm9TT1NLVStyNzY5Q1hXbVBWOGs0eFJ0?=
 =?utf-8?B?NnRHMXIrSW5ZUFRxN2hZK1dMZFN3L2hYU2R6eUhGZ1cxRlE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7925.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUhnRnpRUGVTMU1melJpSE44UXdHTGwzU253Rnl4Q3U4ZlRmMi90V2Z2aTFC?=
 =?utf-8?B?dzRlUkt6My9oWU1oWWRlVnNUNXR6V2ZXSG9yT2x3N1ZqMXVEcitKTnJtWDdI?=
 =?utf-8?B?TDJEcVJxZ05acmJIeWZtRmlxTXNNei9jcVdWck9uK2dPNENWdFBzRjdDRFFD?=
 =?utf-8?B?WHIwYlVqem1LQjkvNjFGVHQ2aVBRajJvMFFLUDJhMjhiT0FRL1F5WlpacXlW?=
 =?utf-8?B?clF6d2drTERiZjEwWjNOV3U5RU9YNElwOWxOQ2tWdWRlRW5DNTFzSWRnZzhk?=
 =?utf-8?B?eEo4VTY4ZnZUL1h6Z1pNM2NmejErK0phYURxaXMyTzlzUTR1TzhWRVRCaUYw?=
 =?utf-8?B?RTNFWVZBUmFSbE1PSi9rL1dwZG51MnBQVHZPRHJnL0t4enVjMkc1Z1RYM2d3?=
 =?utf-8?B?cE1vbXI4Sjd5a2dSODd6Q0ZyOUZqU3hLU241T2lFS2ZZZ2pXZkJ4Y3BiMlVY?=
 =?utf-8?B?czBoVnZJSXlqVHdNT1R6ZUtkWTBHbVNpWUFWRHNtamJBR1RKWFVRY25WMFJF?=
 =?utf-8?B?ZWY2MFVqNTdmdDMvQXdvcDd1OGpUVlJvbWNQZDFkSm4wSng4a2RNZFpGN0c2?=
 =?utf-8?B?cjZvUmg3RFJ0bXcvN1hGZGdFOEM4YWlIZmRRWDBScGJXUHRyeEMvcExDc2VN?=
 =?utf-8?B?cEp2UFQ0KzB3RFRRUWZyYlZJMkQ5NG02NHBrbVU5YTlibG5KQXBXTFhPZ0NK?=
 =?utf-8?B?ZXN4WXFwMis5Z000YWtqNy85aDI3N0hocHlMNkYyY2xsOE0wemhGLzhvVldo?=
 =?utf-8?B?Q08rbXVWTFlyVDNiL0w1MjJOa1JsbWUvNDRTdi82NDMzeGdUTHc5SHdnVmRR?=
 =?utf-8?B?MDNlWCtoN3o4UE9HVWYyTm1LZkJUQTdOZENKRjVrZFNhVXVUKzUwbE1TQmFN?=
 =?utf-8?B?V2UwbldFaTR6YjhjdmNpSkJMWmQxSzFWR2tNMjBpcmorZzIxK0pOWWNHNUVZ?=
 =?utf-8?B?bDlOOUJrd0tmTUpnZnVQTks2VHVSSjVidlZpeld5WW1CM3hGejBNVEpzOXhS?=
 =?utf-8?B?TGMvaHVLWmZtZ2wwYkRHSktXNUV5R1g0cTNzaTlNbG5ZYmNpWHZVQjdOclpq?=
 =?utf-8?B?NmQrUkxTRFc2SnJ3bzdUUEh5RTU3MTRFNXQ4TkVWSlBKbzZrYmhrK01SZG1V?=
 =?utf-8?B?NlRDcjBsZ2JEY3FPNzR5MStLbjdkL2FGa3BZUUZDUkJkQ09ZWXV5dm5tMFRT?=
 =?utf-8?B?SnVzSHdHZG5kRSt6Z3l5d3NJTE0xTTdVaDYrVjJ0TnhuV0N0UVdjYVRyL2pl?=
 =?utf-8?B?K1hZcDdUVjc4c3JDeFJ4ZG9UaUgxVzN2b3pSU09ZM2NISUdYTnhlQnpIRXc3?=
 =?utf-8?B?bDZyeS9nV3dYaUo1WTFNeDNXQ0Q1aFFZU2gweitQNWxGOEVTZzdtWG9ueFBk?=
 =?utf-8?B?dmpqRHZFTmJMdzA2UmkrUlJXRThCbkx5RStjclduWFliS29vc1lrMCtkeHYr?=
 =?utf-8?B?bzQ4Z1lBTHliZmtzaG5sbDZ3Q1Vwd1ZvdzhERjBaZzVmTU1rU2h6MXptaThN?=
 =?utf-8?B?VEppNUdTdk5MUVlKR1h0WDhiOTNWd0RkdTJ1QUFzWDE0TXE1OFZselBEMlU4?=
 =?utf-8?B?NGZTUDJaVmpoOXR0NCtDSlFRc0c1cUhxeFdCVkR5WXI5OVhXc25lWDZVQ0ZO?=
 =?utf-8?B?VkxFTUlkOE9HVWtOMVRyZnpabWtSSVd6VDA1THJUVXBYKzNqaGtWbnpnaVFC?=
 =?utf-8?B?eWlHS3l0ejkxb2kwVkpNOVFlUjYyVFJ4a3l5cW5YR0VoUWNtUStYM3k5Z1Uz?=
 =?utf-8?B?VHJHVHNUWlg5SG1BQTdLNlVHQ3Z6OTNoOGg0aDdQbHZsbXc0T0p4WFJ0dmVU?=
 =?utf-8?B?T0k1dUZBNHI3Mlhmb2t4R29yYzB3WWVReCtwUTRkc3R5cWNSd1JDRnp3U2dj?=
 =?utf-8?B?aFdTTk1QbzJoK1lmWnFVZWdGSXRwUHA4YW1oQStzK3UwUU4vUHBrRmdRSkl5?=
 =?utf-8?B?RlJIcEFjQlkxUjV6bm8vS0l5NkNFczc2VHVPSTB6Q2Nmd0RoWFoxa0JXdUp1?=
 =?utf-8?B?ZDBvT2FZUGFKKzlIZjdpTUczV1pHcmhId25LYkZVcVRCbHcyREtxTVVUTXFC?=
 =?utf-8?B?SFY5QjR0cXd2aWlidDhvZTBFRmZEYTg2a2kreWxOMW1jM3dKTldPZ0hYVWlV?=
 =?utf-8?B?ejdnU2ZsNXNXWU03TkRLeVFBYlZYTFRPY3pERHZ4TWVxMUgrTTh0bWlUdzNR?=
 =?utf-8?B?ekE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d90ed9d-f89c-4973-0bc1-08dd7d0b479b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7925.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 17:22:35.7494
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6hoznMLj2E6q1egA/ie/vbkL1kAV9wXNolXe+8UfAdzhM8rVz1veCtdTDLDa2wvrbL9cnDiU4Echa9LktF2t4qNTKywG/VhO7FJaBCljzkg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8381
X-OriginatorOrg: intel.com

On 4/16/2025 7:14 AM, Chao Gao wrote:
>> +/*
>> + * Wait for the hardware to complete a transaction.
>> + * Return true on success, false on failure.
>> + */
>> +static bool wait_for_transaction(struct staging_state *ss)
>> +{
>> +	u32 timeout, status;
>> +
>> +	/* Allow time for hardware to complete the operation: */
>> +	for (timeout = 0; timeout < MBOX_XACTION_TIMEOUT_MS; timeout++) {
>> +		msleep(1);
>> +
>> +		status = readl(ss->mmio_base + MBOX_STATUS_OFFSET);
>> +		/* Break out early if the hardware is ready: */
>> +		if (status & MASK_MBOX_STATUS_READY)
>> +			break;
> 
> Shouldn't we exit the loop if the MASK_MBOX_STATUS_ERROR is set, or is the
> ERROR bit always set in conjunction with the READY bit?
> 
>> +	}
>> +
>> +	status = readl(ss->mmio_base + MBOX_STATUS_OFFSET);
> 
> I still think this read is not needed.

No, if it times out, it could exit without having read the status.

But this is a slow path — instead of trying to save a few cycles, I 
wanted to present the logic more clearly:

   * Give the hardware enough time, but not forever.
     * Oh, we don't need to wait anymore if it's done

   * After waiting, check the status and handle it properly.

Isn’t it clearer to read the status after the wait, right before the 
error handling?

Also, reading the status inside the loop is just a way to determine 
whether to break — not to interpret or act on it. That should come after 
the wait completes.
