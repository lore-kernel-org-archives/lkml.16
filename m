Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277242236F7
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 21:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738878535; cv=fail; b=EsGfBJ94cUi7Uwuy5j7hnBLZIUonTw//pJ0LH/QcGHITxtRiFeHvK0t6fwC/LwVrn/h7hO6nn/UnlGoO6KkFhuBf/4kIm7Qb9Zdf6/N1TKMr+T871asH/rEXI0RNgPvrvc7f5RwqISRJJmbhF6hEBy1clBswbVVo5QJnN8sLHhA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738878535; c=relaxed/simple;
	bh=FnnAzqex0Cfv7x8az0mhlDqFedgIAo+KhCJdsG0tjck=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gtYaGs12sp0Du+CHcfDsQFdrZbcw1pqOSumeYF3ybhVjcullP7sCG8CvZclEF85WjoaC/lOhlW9qMGlgF1NSOBaoY3Dl38C6F0CnhwKLiDEJbYyqt4OMEkIC0x0r+UI8NoTgYtcHfJqmpae5YWOnEOHsTkfXHFb1YCzeBpZGuJU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ja+cJsQo; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ja+cJsQo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738878534; x=1770414534;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=FnnAzqex0Cfv7x8az0mhlDqFedgIAo+KhCJdsG0tjck=;
  b=ja+cJsQolRmGWRvq4wKShJJZwrB3NZ8C4qZHMo/SlRT8iILx5LnB6tBU
   02aP3jqNadDUs+/YoOdEQr8GVNYlC8dlMK68ghBM9NPbKbNlOtg75c295
   bfHdeXHt2NQtra7etHIF/+hQWzKEjN2MZPbpWeTjV5RBJnf5M2RJCXwGw
   +dN+spfI4TdulE5kJvVz71lrN14vBZr9ZJvqd6vsDPRl5C05L1c+bLEHZ
   q4DV8GL94U5QR4+7I68BgHCYYoi9/4hgl0mI2Vurmm07eS8GRHbj+HdRs
   HVfbVh31Jb6ab4c1awjvPvBsnFfFlW3+G+dac17JSI+i+Qhfu/m0cfmns
   Q==;
X-CSE-ConnectionGUID: lGIFGnMNS9C4G5DQXE3sKA==
X-CSE-MsgGUID: xSDAiaK9STe0t4I+V+n1Rg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39400866"
X-IronPort-AV: E=Sophos;i="6.13,265,1732608000"; 
   d="scan'208";a="39400866"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 13:48:51 -0800
X-CSE-ConnectionGUID: 4aUo9V4DQgChOkMvVlAMHg==
X-CSE-MsgGUID: 049Rx2SRQe+C7TztkqOuQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111771377"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 06 Feb 2025 13:48:50 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 6 Feb 2025 13:48:50 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 6 Feb 2025 13:48:50 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Feb 2025 13:48:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x9X6pOH6ohVQo5DF6+yQXqhNy360oN/A0UOu6Babja8baQ8HZrtyDe693lgiEUIWzZAfPhGPCN0Jw4I+3ZjTpbwSLbX8AzDfwRKqsk4iHuR2dnwJr98qtDEag2x2uHrjOIbBfqVGJnYhsRuWPR8R5gWnvl7B0yfR66bkKN4lhed7FYrdvlIMTUDFysffg5RIKbmTA1BaHgSt5JC8f/upwqHNdmRoUcSfMKxzkk2VuxS7CcTVLJxXXU8attcx7ebczkLr9rYm2OLEQZOb485lh8E4iBh0Nq8E7M7sqr2YFvN95Wpe42FgmlgUYVQdcnQZGPnr33TzxcCA9mUE+OARtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VWY4hsJV5rlpo8qFfcYDr1FSg+OHQehMphy55MI967Q=;
 b=QhgLgUTvphF/H2HkXIWHGLLVVWcQFoirxC/zowrwJyfGxIS+HS/dQKVBP0UkLDBXwWyvrkyvMqS8uCc/Vf4l6SCWnhBIqMacsPDHDsgTggWm069GRUIVTxo7oDR/tb3pM3HTSoioRs85rqjvgNp5AtlKkoR29mNYuijuQ9mMSznbaHNPPxJQ5+3KSKEZ0UkXmhR1/DI561GTlTLXxaCEKoEQJdvJsCkgRN0HkAfI92x+D6OYv3oY47CV1Wgi6G8sIm9DM1Iv+pJIzhlPqhiathFRV8z/oJQTTR2SRMfYvdt4jHPsQzPQhmjEYPiDbrtozBxXuOP+sekIfbokShVh3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6435.namprd11.prod.outlook.com (2603:10b6:208:3bb::9)
 by CYYPR11MB8386.namprd11.prod.outlook.com (2603:10b6:930:bf::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Thu, 6 Feb
 2025 21:48:33 +0000
Received: from BL3PR11MB6435.namprd11.prod.outlook.com
 ([fe80::23a7:1661:19d4:c1ab]) by BL3PR11MB6435.namprd11.prod.outlook.com
 ([fe80::23a7:1661:19d4:c1ab%7]) with mapi id 15.20.8398.021; Thu, 6 Feb 2025
 21:48:33 +0000
Message-ID: <b3afb5c6-a16b-4ab5-a154-f37cb80f7e9a@intel.com>
Date: Thu, 6 Feb 2025 13:48:29 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 15/33] ice: Fix a locking bug in an error path
To: Bart Van Assche <bvanassche@acm.org>, Peter Zijlstra
	<peterz@infradead.org>, "Ertman, David M" <david.m.ertman@intel.com>
CC: Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, Marco Elver <elver@google.com>,
	Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor
	<nathan@kernel.org>, Kees Cook <kees@kernel.org>, Jann Horn
	<jannh@google.com>, <linux-kernel@vger.kernel.org>, Przemek Kitszel
	<przemyslaw.kitszel@intel.com>
References: <20250206175114.1974171-1-bvanassche@acm.org>
 <20250206175114.1974171-16-bvanassche@acm.org>
 <61e3cc7a-af79-48e4-acb6-8ac7c8d2552c@intel.com>
 <60f01052-44aa-4b3f-a116-f31635dffb17@acm.org>
Content-Language: en-US
From: Tony Nguyen <anthony.l.nguyen@intel.com>
In-Reply-To: <60f01052-44aa-4b3f-a116-f31635dffb17@acm.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0128.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::13) To BL3PR11MB6435.namprd11.prod.outlook.com
 (2603:10b6:208:3bb::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6435:EE_|CYYPR11MB8386:EE_
X-MS-Office365-Filtering-Correlation-Id: bccc0d65-a3dd-48da-8e50-08dd46f800cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SmlXcnl1a2U1T2tBcDBFTnhPa0ltcmxpdDQzdXljMXdCSWVBQjFmVzZCanhQ?=
 =?utf-8?B?dkVWYTFNV01iaEpoYWd5c2krNTI1K09qV1E1RzFJYmx5VGVya2VuRzFKTkhI?=
 =?utf-8?B?ZmE1dU5wMjZ3cEYvVzRXV0dFeVlla0h3Z2FiaHdyUHc4Vm5DQzZRZTI5RVFQ?=
 =?utf-8?B?RXA4Yk1jQmdOeWJWNlVXdWEzNkorV2dlM1lQaXY5Rmo5d1dKUXMrZTFOd3dL?=
 =?utf-8?B?OWdJd1hHL3ZLUFppbTJRRUQyU0VFNXdZZUwxY1RIVy9QcU5vMHhOK1JteXhh?=
 =?utf-8?B?QnJrNWF3UGRKVFZOdy8xVVM0am9ibkI5SVlrelZpdSsyVXgwb09Nb1FIWFcz?=
 =?utf-8?B?citJdGZQWDdrQzJvVjJpamJUbno2THdJbzk0NldSK3RuaXFWcjVETjJQRWN5?=
 =?utf-8?B?S1NjZ1BEVzNkT2JzWFBHVlJWOERCdnczVUlMdFFXYzRzR1NHOWtLV08wSDZS?=
 =?utf-8?B?SThOenA2c2g0ZFNNU0crd0ZueFlKWUtaV0RPaEhHOWxUcjFvaUxXb04zOHB0?=
 =?utf-8?B?NE5MbFdzSnpjdU03UTNaUEQzOS9xRk5rWG95MU5GZktXL09VQXI4SkdLaVpH?=
 =?utf-8?B?MllvWmMxNWlTMU9GVUtnb3doSlJkaHF4VFVnOThBdGlod0dtWStxSEpIN2hh?=
 =?utf-8?B?YzJ6bEVOUm5vTHpUMWtZZmJ6NFR5eUtIYkpmQWtwTkhLT2xOTCtXLzM4SXlO?=
 =?utf-8?B?L1FxVHdZV1c5M3FXbFdBNk01QmhtQ1lwaVFaczJ4N2ZCQU4xWW02YzlhQUlH?=
 =?utf-8?B?SDVPbW1abDI1VzUrMjI2UERoNjQ3UUk4ZFhZVkNhK1pxVnF1dGVsaFlubDlG?=
 =?utf-8?B?T0Q5RnF0L0NqM3pCLzg1R2R2amQ3c3duWnNVR3NZYUNUOWo4YlJyenlqdmJy?=
 =?utf-8?B?Q0xBUFRoMy80bTlMNFp6SDJkZVIzUW5QaU0xRzMrZ2luNng5OCtISVI5QVlk?=
 =?utf-8?B?ZUhDNnpaMXhuaEk0R3Z5Q3NiWFB3L1dIb0htdEg0S0QzVWhzNjhCQVFmY21K?=
 =?utf-8?B?U2JQYTVibFhKNzdtSHl0N20yTG5rWG5pVkU3VW1rQkF5YmVDYmFnWi9wL2M0?=
 =?utf-8?B?cWljbU1UdmZFVUsvR0VSaXJmaVRDZEhkdElvTXMxN3pqSzU2aUZDSzJXOFRq?=
 =?utf-8?B?U1dlM2x0Zk1FajVwNW45bnQ3b1M1Z3BuT0pQUFcxRktEM2d2VGI1dXFZQmxz?=
 =?utf-8?B?bFRpMGFGelhwRkxEek5HUU9GNXdIQW1tUlRwNWhOMjV3bHNZMDJiSVBrSUVq?=
 =?utf-8?B?ZnFHbGFYSTN3UmIzeHBSNTg5NWpkVU91eWhSVzJpUHZxM3k3QTZjRFMvZHla?=
 =?utf-8?B?WHVyVXRZWVdGR2ZlRVJMcmRzMUs4R2JSRlE4SzJkOUhRa0NMOERFRlBFZFBU?=
 =?utf-8?B?VGFjS2x4QkoyYXFiclVjV3Y2NE1GcTBQV1FYR0RaZnRRUDBVNEVzU3ZURU9F?=
 =?utf-8?B?TmorYmVMTDRFb2lxNWhuWFpUaG9iTE1DdFh6bHYzak4zcWUwQ0hBc3lhc2Zt?=
 =?utf-8?B?bm5RTkNGNkZocDZGRW8wZ21sSENVMGQ0a2toNkZmOCtCdGNtMDBzNW12TTN6?=
 =?utf-8?B?M2p1c3J3Q0JmYXYxL2kzRzEySUczMVoxWldYTm9PamZXM2RFMXhuNG9ncjZx?=
 =?utf-8?B?L3o1UDJGZ2ZlNkdZSmRLU21QTkR6ZnM5bTRKYWpLbnJLYjFJT2lxOUFZQmhs?=
 =?utf-8?B?eU5UMjZ4VitaNzNoeU95SWE2cVI4VTJUcnZ2YW9UMzFDbFQ5dzl1OE5GNUdk?=
 =?utf-8?B?bDZ4WWhwekhhZlExNVE0NDE3NGR3emc5QWJ5S3c3blRBejV0VjNnWkpydjdP?=
 =?utf-8?B?eWk3a0NzLzRPbmVHUEE2dXFTZlI3VGIrcnRBUlV0czE0NUdNV090QkYweEZp?=
 =?utf-8?Q?DnHaJF4l5R2Uy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR11MB6435.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K3dncDhoR1NSWUg0dCtZV2hZVWlzdVo0ZU1GS0hsNGwwZi9mOGs4R0t4NlFo?=
 =?utf-8?B?YWhQbTljUHZJWnFPSzVPL1RpSCtGL3ZsMGE3RTdGVGVLdXB6K3RiOG1aVFBM?=
 =?utf-8?B?ZWFTUW44Ty9YSGRCd0NHYU1QQ2FpSlJUZ0pnODJlRnFQa3lHdTlYTkxVRVNV?=
 =?utf-8?B?dGZtblFyQ0s2QTlGODNOS0JTNENJcHJFK3BGaGRxV1VXekZBRDZ4dkNXM1Qx?=
 =?utf-8?B?VzFuZVhuMDBlWEpuZk96dEE2L2NiLzFRZXFXZEN0S2g5d3hRRjJOZDZhZXJn?=
 =?utf-8?B?cXNkOXpQQ3dOajRvVXhXWnNrL09KOHArb0t4NkpxcU85V2FNekJqMzBUNGpw?=
 =?utf-8?B?YnFhUzFSOWpES25jbWQ1Z3U2dE9rMzNmRUc1TDRuYm1kdThDQ1NmNEYzSUdK?=
 =?utf-8?B?MDdScjhvYXZxRXF0WVVDZzhBYUtSdU45K3FQL2JrTk4vQWxyZEwrYUx2K2Z4?=
 =?utf-8?B?RFo4WFN0WXNBUkF3YzFrWUtRSUY0NWVLdVBXcnJoM3UxeERva2lyYzlVZkhv?=
 =?utf-8?B?SkNGMjg5QUpDRU01NDMzQlh1Y2dtSjI3UEdTUFBFMHRiOW9YZFVnM0dvMzZZ?=
 =?utf-8?B?YkI2aGdtY2o0d2NKVHQ5ZjNicHd2TE9lYXhtRStaZ0l5M05DQ25jdllzMVpr?=
 =?utf-8?B?eHpDS2RQT05lMHVmME5ZZ3ZCbkpmaGpyYUUzRHhwcWl3WDVacTZnTkMzdVZs?=
 =?utf-8?B?S2Q1TGgwaHIvOEg0bEx5cmpBS2dYUXJrTmJMaDl0aUpubXlVTE55d3V0Y2RJ?=
 =?utf-8?B?U1RBWS8rZ1dwdnNXY28zSGNLM3pzcUVac2ZTKzBURjl6cHVpQk52dTRFLzFi?=
 =?utf-8?B?aGxVWXVtQnQ0ck1KZlJLQnMxbGNqelY5eHJYb0dGL1VkRG1RN2F3RmgxOHBP?=
 =?utf-8?B?NFBVbGszRUxpWnJidzc2OHpYNmkza0w2NGo1dEd0Y202eGVVeDlnY2ZEMy84?=
 =?utf-8?B?MWdzdUgxOTlQclhGQklzek51YW1SemFlOG9CRWI4VWRGL0I2aEszY0cvV2FJ?=
 =?utf-8?B?aEV5M1luWFBINmpPZHhGYTE5eFlHRmhaSUtjdTFFdXI1MEZmM1FxRXBXOUll?=
 =?utf-8?B?bGozRzlwTkVZVWVUTlJabktrWDU0L0RrZm1LYVVqNDV3amNoS2I2WUlMZHJ0?=
 =?utf-8?B?VVdCVlVzS0F6K1BHQ2xNSTVhM2srZy9GTWtndGg5WUwwdWdUOGF2dWpVak50?=
 =?utf-8?B?U0VLM3JmdUh3UVZ2RENMWWhNZmNOZ0R6Mk9kdU1waExtQ3pUY3ZSc0VnWUNT?=
 =?utf-8?B?bXBiU2JuRFJmMHlvOCtYRE5UY3JkZEdjcFJDbkFQTkQ2dkJ6R1dacmcyVTQr?=
 =?utf-8?B?aXdTTjcvY0lIN3ZLTUtzWlRaNlB3Uys0NU8ydSt2TEw2aDgzMExuM3YvL3dH?=
 =?utf-8?B?ajNzc2RFSkJDei92NU5UTWVpNHFONVcxOWtZYlcvQ1pNalYyZmhwOVM3T1l5?=
 =?utf-8?B?dmlyeGFJTzFsb3hLcGVHcHkwZ2hKWE9FNm0wUG9Gc21SbVQvemVKblhNOVEv?=
 =?utf-8?B?WWkweFlyVHd2UVVsSkc2Z2ltbUxlNUJ5eEpDUys3VnVMRjluWHFzeEFnNGQw?=
 =?utf-8?B?Y1RPcFBjRy9QNTlKdy9GL0oyd1lkd05Pa1Q0cXEvY1RzR2RWMERUK1pha25Y?=
 =?utf-8?B?L29UOWhYM2NjV1hYN2xESExlbTZheUJmUDJKaXN5Rk01Rkg5S0tUMDdxNjNM?=
 =?utf-8?B?RlVkTDRPRWk2QjdjWEdHRGhGNzBGZlU2aFVPRC96RUpXTjZpcVFjKzVSNDZB?=
 =?utf-8?B?c25qUmR1U2R1SGp6dElTeDNBeFViWmwzdXVIUitJSjVyTit1OFFJMFRRc1lr?=
 =?utf-8?B?aGJ4b2JjOURXeURQdjF1UG9WZGl0R1Jzb25iVGcraGdPdWNIcDJ2NUVwbnRx?=
 =?utf-8?B?cmJJR3NMenIvNm0zbUk4WldwbnhEdWh0K3RiaHQxRnkzTENCdEZ2eUZyK0Jw?=
 =?utf-8?B?eVFGa3VLNjNnaHcrbTBwYUN5RnV4UVRlVmVQQkdDWXdvU2syU2FNRUIzVS9j?=
 =?utf-8?B?eGp1R01ER05obXBvN2FGZWY5UmtyWmkxQTdFU0NhdVR5OUtzYVpweC8vTzRX?=
 =?utf-8?B?d1g1QlQ4dFpZVUxMVFkxUmVwRUxBblpMc2lPRGZSeWVwTVh0N3duOTNHa0J3?=
 =?utf-8?B?Mkc2cGdxRDlyRXZPcUMyQWRMclNMOTNsNUNvSDJOQTNHUjZPRk1UTFFuWGVy?=
 =?utf-8?B?aUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bccc0d65-a3dd-48da-8e50-08dd46f800cb
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6435.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 21:48:33.7832
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oCdVzmgWIRXJYFK7r6kBTx5cOZoo0hN4mJuksyBS/xO+FF54hXx6R/yN1EdrJZrgFdoBesX3rVuvB8Pkvph+1v2xBspL/CPzjNTPtD13IPI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8386
X-OriginatorOrg: intel.com



On 2/6/2025 1:44 PM, Bart Van Assche wrote:
> On 2/6/25 1:35 PM, Tony Nguyen wrote:
>> On 2/6/2025 9:50 AM, Bart Van Assche wrote:
>>> Do not unlock pf->tc_mutex if it has not been locked. Jumping to
>>> 'dcb_error' causes pf->tc_mutex to be unlocked. This bug has been 
>>> detected
>>> by the Clang thread-safety analyzer.
>>
>> Thanks for catching this Bart. I think it would be better to move the 
>> tc_mutex up to cover this call. Though unlikely, the DCB settings 
>> could change after this call so it would be better to protect this 
>> under the mutex. Also, as the error path is changing configuration, 
>> that should be done under this mutex as well.
> 
> Thanks Tony for having taken a look. Is this perhaps the change that you
> want me to make?

Yes, looks good to me.

Thanks,
Tony

> Thanks,
> 
> Bart.
> 
> diff --git a/drivers/net/ethernet/intel/ice/ice_dcb_lib.c b/drivers/net/ 
> ethernet/intel/ice/ice_dcb_lib.c
> index a7c510832824..d185b1aba7a4 100644
> --- a/drivers/net/ethernet/intel/ice/ice_dcb_lib.c
> +++ b/drivers/net/ethernet/intel/ice/ice_dcb_lib.c
> @@ -537,14 +537,14 @@ void ice_dcb_rebuild(struct ice_pf *pf)
>       struct ice_dcbx_cfg *err_cfg;
>       int ret;
> 
> +    mutex_lock(&pf->tc_mutex);
> +
>       ret = ice_query_port_ets(pf->hw.port_info, &buf, sizeof(buf), NULL);
>       if (ret) {
>           dev_err(dev, "Query Port ETS failed\n");
>           goto dcb_error;
>       }
> 
> -    mutex_lock(&pf->tc_mutex);
> -
>       if (!pf->hw.port_info->qos_cfg.is_sw_lldp)
>           ice_cfg_etsrec_defaults(pf->hw.port_info);
> 
> 

